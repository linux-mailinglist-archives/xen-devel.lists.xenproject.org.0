Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D148B8A8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256118.439356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Nli-0002gr-Ep; Tue, 11 Jan 2022 20:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256118.439356; Tue, 11 Jan 2022 20:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Nli-0002ek-Bq; Tue, 11 Jan 2022 20:29:22 +0000
Received: by outflank-mailman (input) for mailman id 256118;
 Tue, 11 Jan 2022 20:29:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7Nlh-0002eZ-0d
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:29:21 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2700172c-731d-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:29:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50744)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7Nld-0005BJ-pA (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 20:29:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 8FF011FDB6;
 Tue, 11 Jan 2022 20:29:17 +0000 (GMT)
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
X-Inumbo-ID: 2700172c-731d-11ec-81c1-a30af7de8005
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>
Date: Tue, 11 Jan 2022 20:29:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-5-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 04/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in tpm_tis
In-Reply-To: <20220111151215.22955-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 15:12, Juergen Gross wrote:
> diff --git a/tpm_tis.c b/tpm_tis.c
> index 477f555..abea7a1 100644
> --- a/tpm_tis.c
> +++ b/tpm_tis.c
> @@ -1093,6 +1097,23 @@ ssize_t tpm_getcap(struct tpm_chip *chip, uint32_t subcap_id, cap_t *cap,
>          return rc;
>  }
>  
> +static void shutdown_tpm_tis(struct tpm_chip* tpm){

Style, as you're moving it.  Also in the function.

> @@ -1360,6 +1369,35 @@ int tpm_tis_posix_fstat(int fd, struct stat* buf)
>     return 0;
>  }
>  
> +static struct file_ops tpm_tis_ops = {
> +    .name = "tpm_tis",
> +    .read = tpm_tis_posix_read,
> +    .write = tpm_tis_posix_write,
> +    .lseek = lseek_default,
> +    .close = tpm_tis_close,
> +    .fstat = tpm_tis_posix_fstat,
> +};
> +
> +int tpm_tis_open(struct tpm_chip* tpm)

Style.

> +{
> +   struct file *file;
> +   static unsigned int ftype_tis;
> +
> +   /* Silently prevent multiple opens */
> +   if(tpm->fd != -1) {
> +      return tpm->fd;
> +   }

Another WTF moment.  We silently swallow multiple open()s, but don't
refcout close()s ?

This cannot be correct, or sensible, behaviour.

Jason/Daniel - thoughts?

~Andrew

