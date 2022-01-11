Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5D48B696
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 20:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256013.439079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7MbY-0000MA-SE; Tue, 11 Jan 2022 19:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256013.439079; Tue, 11 Jan 2022 19:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7MbY-0000KC-Og; Tue, 11 Jan 2022 19:14:48 +0000
Received: by outflank-mailman (input) for mailman id 256013;
 Tue, 11 Jan 2022 19:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7MbY-0000K2-5e
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 19:14:48 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb1e9305-7312-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 20:14:44 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47032)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7MbS-000iqV-7q (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 19:14:42 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 28A4B1FBFC;
 Tue, 11 Jan 2022 19:14:42 +0000 (GMT)
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
X-Inumbo-ID: bb1e9305-7312-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e4956df7-d7ca-cb5f-0f0e-7f3eba5d1a50@srcf.net>
Date: Tue, 11 Jan 2022 19:14:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-17-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 16/18] mini-os: reset file type in close() in one place
 only
In-Reply-To: <20220111145817.22170-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2022 14:58, Juergen Gross wrote:
> diff --git a/lib/sys.c b/lib/sys.c
> index 0e6fe5d..323a7cd 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -424,87 +424,82 @@ int fsync(int fd) {
>  
>  int close(int fd)
>  {
> +    int res = 0;
> +
>      printk("close(%d)\n", fd);
>      switch (files[fd].type) {

I know this bug is pre-existing, but the libc close() really ought to
sanity check fd before blindly indexing files[] with it.

I'd tentatively suggest that you want one extra goto from here, into
wherever the EBADF logic ends up, and it's probably worth including in
this patch.

~Andrew

