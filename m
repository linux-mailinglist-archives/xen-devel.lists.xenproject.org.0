Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C047448C314
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:28:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256545.440358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bnx-0000eP-SF; Wed, 12 Jan 2022 11:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256545.440358; Wed, 12 Jan 2022 11:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bnx-0000cb-P9; Wed, 12 Jan 2022 11:28:37 +0000
Received: by outflank-mailman (input) for mailman id 256545;
 Wed, 12 Jan 2022 11:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BEGY=R4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7bnv-0000cQ-TW
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:28:35 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6955040-739a-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:28:34 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47746)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7bnt-000oaP-h6 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 12 Jan 2022 11:28:33 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 003CF1FD4D;
 Wed, 12 Jan 2022 11:28:32 +0000 (GMT)
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
X-Inumbo-ID: c6955040-739a-11ec-9c70-5536b2d1e4e1
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <659743cb-abc9-31b5-d6b2-0a21aa76bbb4@srcf.net>
Date: Wed, 12 Jan 2022 11:28:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 10/12] mini-os: add struct file_ops for file type
 socket
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-11-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220111151215.22955-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2022 15:12, Juergen Gross wrote:
> diff --git a/lib/sys.c b/lib/sys.c
> index 3a8aa68..12deaed 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -99,11 +99,70 @@ static struct file_ops file_ops_none = {
>      .name = "none",
>  };
>  
> +#ifdef HAVE_LWIP
> +static int socket_read(int fd, void *buf, size_t nbytes)
> +{
> +    return lwip_read(fd, buf, nbytes);
> +}
> +
> +static int socket_write(int fd, const void *buf, size_t nbytes)
> +{
> +    return lwip_write(fd, (void *)buf, nbytes);
> +}
> +
> +static int close_socket_fd(int fd)
> +{
> +    struct file *file = get_file_from_fd(fd);
> +
> +    return lwip_close(file->fd);
> +}

Actually, on further thoughts...

> +static struct file_ops socket_ops = {
> +    .name = "socket",
> +    .read = socket_read,
> +    .write = socket_write,
> +    .close = close_socket_fd,
> +    .fstat = socket_fstat,
> +    .fcntl = socket_fcntl,
> +};

read, write and close should dispatch directly to lwip_* and not bounce
through a no-op local function.

~Andrew

