Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A667F48B7D9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256060.439211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NRM-0002O2-M6; Tue, 11 Jan 2022 20:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256060.439211; Tue, 11 Jan 2022 20:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NRM-0002LD-Io; Tue, 11 Jan 2022 20:08:20 +0000
Received: by outflank-mailman (input) for mailman id 256060;
 Tue, 11 Jan 2022 20:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7NRL-0002L5-C0
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:08:19 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375bb04a-731a-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:08:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50732)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7NRJ-0001so-nV (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 20:08:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2A65C1FDB6;
 Tue, 11 Jan 2022 20:08:17 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 375bb04a-731a-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b0dec08d-2b94-efbb-cbc8-d67e3529fcc1@srcf.net>
Date: Tue, 11 Jan 2022 20:08:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-3-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 2/3] tools/libs/gnttab: decouple more from mini-os
In-Reply-To: <20220111150318.22570-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:03, Juergen Gross wrote:
> libgnttab is using implementation details of Mini-OS. Change that by
> letting libgnttab use the new alloc_file_type() and get_file_from_fd()
> functions and the generic dev pointer of struct file from Mini-OS.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add alloc_file_type() support
> ---
>  tools/libs/gnttab/minios.c | 68 +++++++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 20 deletions(-)
>
> diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
> index f78caadd30..c19f339c8c 100644
> --- a/tools/libs/gnttab/minios.c
> +++ b/tools/libs/gnttab/minios.c
> @@ -28,18 +28,53 @@
>  #include <sys/mman.h>
>  
>  #include <errno.h>
> +#include <malloc.h>
>  #include <unistd.h>
>  
>  #include "private.h"
>  
> -void minios_gnttab_close_fd(int fd);
> +int minios_gnttab_close_fd(int fd);

Again, like evtchn, no need to forward declare.


However, I've only just realised...

> +
> +int minios_gnttab_close_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    gntmap_fini(file->dev);
> +    free(file->dev);
> +
> +    return 0;
> +}

The only reason this doesn't break the build is because the declaration
is not in a header.  After this change, you've got the function
returning int here, but declared as returning void as far as MiniOS is
concerned.

Furthermore, we cannot fix this mess atomically now that minios has
moved into a separate repo.  It's tolerable from an ABI point of view on
x86, but I don't know for certain on other architectures.

The least bad way I can think of doing this would be to leave void
minios_gnttab_close_fd(int fd) exactly as it was, and instead of
converting it's use here, use a separate static function straight away
for the file ops.  (Will be necessary anyway if you like my suggestion
of passing file too).  Then in the whole function in "tools/libs: final
cleanup making mini-os callbacks static", rather than just making it static.

~Andrew

