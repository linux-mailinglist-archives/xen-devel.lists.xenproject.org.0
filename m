Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC748B7DD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256064.439223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NT9-0003gu-0h; Tue, 11 Jan 2022 20:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256064.439223; Tue, 11 Jan 2022 20:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NT8-0003f5-Tf; Tue, 11 Jan 2022 20:10:10 +0000
Received: by outflank-mailman (input) for mailman id 256064;
 Tue, 11 Jan 2022 20:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7NT6-0003ex-W3
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:10:08 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78b75536-731a-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:10:08 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48120)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7NT5-000Wvn-0G (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 20:10:07 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C89C21FDB6;
 Tue, 11 Jan 2022 20:10:06 +0000 (GMT)
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
X-Inumbo-ID: 78b75536-731a-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e5a57fd0-3274-db2b-0dff-9f8d7ea3c658@srcf.net>
Date: Tue, 11 Jan 2022 20:10:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/3] tools/libs/ctrl: remove file related handling
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-4-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111150318.22570-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:03, Juergen Gross wrote:
> There is no special file handling related to libxenctrl in Mini-OS
> any longer, so the close hook can be removed.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> V2:
> - new patch
> ---
>  tools/libs/ctrl/xc_minios.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
> index 1799daafdc..3dea7a78a5 100644
> --- a/tools/libs/ctrl/xc_minios.c
> +++ b/tools/libs/ctrl/xc_minios.c
> @@ -35,15 +35,6 @@
>  
>  #include "xc_private.h"
>  
> -void minios_interface_close_fd(int fd);
> -
> -extern void minios_interface_close_fd(int fd);

This is even more nonsense than the evtchn side.  Good riddance.

~Andrew

> -
> -void minios_interface_close_fd(int fd)
> -{
> -    files[fd].type = FTYPE_NONE;
> -}
> -
>  /* Optionally flush file to disk and discard page cache */
>  void discard_file_cache(xc_interface *xch, int fd, int flush)
>  {


