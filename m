Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1E492873
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258563.445433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pWt-0006TP-HJ; Tue, 18 Jan 2022 14:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258563.445433; Tue, 18 Jan 2022 14:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pWt-0006Qp-D8; Tue, 18 Jan 2022 14:32:11 +0000
Received: by outflank-mailman (input) for mailman id 258563;
 Tue, 18 Jan 2022 14:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9pWr-0006Qe-MX
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:32:09 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695fd4dd-786b-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:32:08 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49506)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9pWo-000xQR-1A (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 14:32:06 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1DD101FA12;
 Tue, 18 Jan 2022 14:32:06 +0000 (GMT)
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
X-Inumbo-ID: 695fd4dd-786b-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <fe8f11f6-fdcf-f99f-4767-8248c6f0c2cf@srcf.net>
Date: Tue, 18 Jan 2022 14:32:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [MINIOS PATCH v3 04/12] use alloc_file_type() and
 get_file_from_fd() in tpm_tis
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-5-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20220116083328.26524-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2022 08:33, Juergen Gross wrote:
> diff --git a/tpm_tis.c b/tpm_tis.c
> index 477f5550..b88ec874 100644
> --- a/tpm_tis.c
> +++ b/tpm_tis.c
> @@ -1093,6 +1097,26 @@ ssize_t tpm_getcap(struct tpm_chip *chip, uint32_t subcap_id, cap_t *cap,
>          return rc;
>  }
>  
> +static void shutdown_tpm_tis(struct tpm_chip *tpm)
> +{
> +    int i;
> +
> +    printk("Shutting down tpm_tis device\n");
> +
> +    iowrite32(TPM_INT_ENABLE(tpm, tpm->locality), ~TPM_GLOBAL_INT_ENABLE);
> +
> +    /* Unmap all of the mmio pages */
> +    for ( i = 0; i < 5; ++i )
> +    {
> +        if ( tpm->pages[i] != NULL )
> +        {
> +            iounmap(tpm->pages[i], PAGE_SIZE);
> +            tpm->pages[i] = NULL;
> +        }
> +    }
> +    free(tpm);
> +    return;

Seeing as the function is moving anyway, this spurious return can go too.

~Andrew

