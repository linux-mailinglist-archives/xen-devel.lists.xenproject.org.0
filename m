Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F893376843
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124093.234211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2i1-0007NT-Pm; Fri, 07 May 2021 15:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124093.234211; Fri, 07 May 2021 15:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2i1-0007LY-L6; Fri, 07 May 2021 15:48:09 +0000
Received: by outflank-mailman (input) for mailman id 124093;
 Fri, 07 May 2021 15:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qbhn=KC=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lf2i0-0007LQ-4M
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:48:08 +0000
Received: from mail-qv1-xf29.google.com (unknown [2607:f8b0:4864:20::f29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ed5bbf1-e3e3-447f-90f6-068cbd849a01;
 Fri, 07 May 2021 15:48:07 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id q6so5024383qvb.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 May 2021 08:48:07 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id g18sm2911823qke.37.2021.05.07.08.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 08:48:06 -0700 (PDT)
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
X-Inumbo-ID: 5ed5bbf1-e3e3-447f-90f6-068cbd849a01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YRcApzHOn+sfyfn81ofA9ANPZfjft3A4579yg/zuVik=;
        b=aQ3757cPunvy5tT+UNTdFdat6FjpIOE0/TyhqM58cJO/81MTqnrbFxPo3EkfAKOZgP
         7FHpgWHrXh5FwoniLKFBpKbKAvrBaOFVLEKvGRkXsAzW0m0tctdDeBs7HteGomxx5BPK
         vAIgUbxEHa0dixctDp5E07pFTqRjgoSft/ylEcSnb8HKAr5Tn0KB/XOkyPysiAfFfpiA
         iEKY0fHcd37qd13GKwAoTfeUlO3jW7N4RzQ9wHCudBNt4R3ps+v5RrTLYOX4mnzsPilu
         dsX+KmOnyunjNYFSKJaFWMiKhZHGkPJOvx1BAJeAgfrzjLuo2xv1Se9wy3Bq45qpT2r0
         w4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YRcApzHOn+sfyfn81ofA9ANPZfjft3A4579yg/zuVik=;
        b=JWCX/Gh1N3oAvbOTeqgtByEDkhF6bVTE01UGG6xnLfcRjBRhv+AZl66MtCFU5TrSf1
         AjJDKKrlhxrt64H5yjPOJ47RyX9hDD0lj5AJc082A6AMWQQvbf1obIpdq/u9sLmgPsk+
         y3I3UY8SmEFK8/SLVEZHW+NruDC+p4GNhBJBueIYof98UWU6CQW5nf/f9WcLQmdv5iMZ
         V3oZwSYAXG8ghdQHAhyedn+AeSHfhrILW8wfXkbphRxfiDCmGcaINL5UcVjU1iInxLXG
         +NP01UczfZGHHc2nZrhOONJwzsLJZmvIr2wJXMvacQE2CcNUXS+4ILFwoxLvQ7RZUjxp
         CZoA==
X-Gm-Message-State: AOAM533v/EN3asL2bnB7wmUkObY62VB20OKYqlS1bt+mL7Qr1sUwYmVS
	FDHE8gNydzVLquHuYLgRNIM=
X-Google-Smtp-Source: ABdhPJzbdjXGy+jyNYqHRFwZvM8WOsi4JRjGGZiXTnzjkTuPhmCdQAxmAySqRIWucf+zddc+vYvdEg==
X-Received: by 2002:a0c:e847:: with SMTP id l7mr10547833qvo.10.1620402487289;
        Fri, 07 May 2021 08:48:07 -0700 (PDT)
Subject: Re: [PATCH v2 05/13] vtpmmgr: Move vtpmmgr_shutdown
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-6-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <3df41436-0932-f79d-99e7-28a5c6a5c1a4@gmail.com>
Date: Fri, 7 May 2021 11:48:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-6-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> Reposition vtpmmgr_shutdown so it can call flush_tpm2 without a forward
> declaration.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/init.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 130e4f4bf6..decf8e8b4d 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -503,20 +503,6 @@ egress:
>     return status;
>  }
>  
> -void vtpmmgr_shutdown(void)
> -{
> -   /* Cleanup TPM resources */
> -   TPM_TerminateHandle(vtpm_globals.oiap.AuthHandle);
> -
> -   /* Close tpmback */
> -   shutdown_tpmback();
> -
> -   /* Close tpmfront/tpm_tis */
> -   close(vtpm_globals.tpm_fd);
> -
> -   vtpmloginfo(VTPM_LOG_VTPM, "VTPM Manager stopped.\n");
> -}
> -
>  /* TPM 2.0 */
>  
>  static void tpm2_AuthArea_ctor(const char *authValue, UINT32 authLen,
> @@ -797,3 +783,17 @@ abort_egress:
>  egress:
>      return status;
>  }
> +
> +void vtpmmgr_shutdown(void)
> +{
> +   /* Cleanup TPM resources */
> +   TPM_TerminateHandle(vtpm_globals.oiap.AuthHandle);
> +
> +   /* Close tpmback */
> +   shutdown_tpmback();
> +
> +   /* Close tpmfront/tpm_tis */
> +   close(vtpm_globals.tpm_fd);
> +
> +   vtpmloginfo(VTPM_LOG_VTPM, "VTPM Manager stopped.\n");
> +}
> 


