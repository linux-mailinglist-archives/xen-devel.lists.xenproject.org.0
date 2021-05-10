Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F078D378A1D
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 13:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125163.235621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4WP-00033t-QA; Mon, 10 May 2021 11:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125163.235621; Mon, 10 May 2021 11:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4WP-00031w-MO; Mon, 10 May 2021 11:56:25 +0000
Received: by outflank-mailman (input) for mailman id 125163;
 Mon, 10 May 2021 11:56:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfTK=KF=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lg4WN-00031q-WB
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 11:56:24 +0000
Received: from mail-qv1-xf34.google.com (unknown [2607:f8b0:4864:20::f34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c72902f-f07f-4719-9f16-0f1c82fe520f;
 Mon, 10 May 2021 11:56:23 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id u7so8092347qvv.12
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 04:56:23 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id 67sm11525758qtf.54.2021.05.10.04.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 04:56:22 -0700 (PDT)
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
X-Inumbo-ID: 5c72902f-f07f-4719-9f16-0f1c82fe520f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XCJVmYNyrM3q94U5z333NtN42F/p27BnwTSwO1Xl7Cg=;
        b=VTgmozNTHdgjFRff9DtYHbWdGehM00zvo/G+1WYdb1tJ8x4D2AqqOCbKgL1CbDbNYL
         ckbCCwYgmrSNJ9c/aKzAwdLs+4vb8cWcNLfLnAHeg4XdBsL70Vlk66lGK9z6Lzl7XJWd
         6yfnv49ikG7KuRLtAEBWJpeqj5Ke+23vgvj7VRFDJh9eLkKibI+vTt5fLpR5DLi7qLQN
         y4Yg/W8ud4LBM3j9XK2/yd1u/TlFncbP82vbRnvaPMUparsstTfNnTwwg1Evhm+A/IRY
         2VKchEJQLVUzU88DOhWq0hqHJHXBv+2EHtmE/BVn/D/iLQBZlRbmaA96vTx3yaJ/9nWZ
         qZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XCJVmYNyrM3q94U5z333NtN42F/p27BnwTSwO1Xl7Cg=;
        b=o+eKDksTENLlifv+0wR3GXPwEFj8UrF7PgMBLBezjB/3DwdDqpbnkLSGZgbZmHTriy
         EKUhRMNP9Reb5SjARHhkSQ9IY8FYt5d9KKUJlBB3nLIo2QtC8AYTe4qtBV1K6GqE1U8F
         0Rd9c2zW60ZBW+UKgU5BHHZZUQAefK0OTuRYaYw8VDVZ88/jjVzgQP9DaNV8N4P5SBC+
         ob8lGddihbRZg85O0px3TiwOszo56K8WtExBb638frErL3awt3rswP4L+UtvVKb3+fAw
         rL6e6iaFnH9UXvPfrTPB2bNBL/syeyimtbEgYgqfCacyw7vwiKZ0u8IdP1iGB/weDF2X
         O3lQ==
X-Gm-Message-State: AOAM530IqwgT2rc9TmJzYfDjMNdFotryhPBZ67w1wzD05/ov64+6P61a
	o/3IT5l5Rx97I2guastaYZs=
X-Google-Smtp-Source: ABdhPJytltMqMo/fhsJ+XFRv+wIo5w4SlzRQ5N6/2CxX5I6ZFrmXNACqm0byydhRNeIcgU6k+NRVtw==
X-Received: by 2002:a05:6214:62a:: with SMTP id a10mr22842521qvx.5.1620647782834;
        Mon, 10 May 2021 04:56:22 -0700 (PDT)
Subject: Re: [PATCH v2 04/13] vtpmmgr: Allow specifying srk_handle for TPM2
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-5-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <cd1c7281-6a10-94dc-7b6a-3897c8d895d5@gmail.com>
Date: Mon, 10 May 2021 07:56:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> Bypass taking ownership of the TPM2 if an srk_handle is specified.
> 
> This srk_handle must be usable with Null auth for the time being.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> v2: Use "=" seperator
> ---
>  docs/man/xen-vtpmmgr.7.pod |  7 +++++++
>  stubdom/vtpmmgr/init.c     | 11 ++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
> index 875dcce508..3286954568 100644
> --- a/docs/man/xen-vtpmmgr.7.pod
> +++ b/docs/man/xen-vtpmmgr.7.pod
> @@ -92,6 +92,13 @@ Valid arguments:
>  
>  =over 4
>  
> +=item srk_handle=<HANDLE>
> +
> +Specify a srk_handle for TPM 2.0.  TPM 2.0 uses a key hierarchy, and
> +this allow specifying the parent handle for vtpmmgr to create its own
> +key under.  Using this option bypasses vtpmmgr trying to take ownership
> +of the TPM.
> +
>  =item owner_auth=<AUTHSPEC>
>  
>  =item srk_auth=<AUTHSPEC>
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 1506735051..130e4f4bf6 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -302,6 +302,11 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
>              goto err_invalid;
>           }
>        }
> +      else if(!strncmp(argv[i], "srk_handle=", 11)) {
> +         if(sscanf(argv[i] + 11, "%x", &vtpm_globals.srk_handle) != 1) {
> +            goto err_invalid;
> +         }
> +      }
>        else if(!strncmp(argv[i], "tpmdriver=", 10)) {
>           if(!strcmp(argv[i] + 10, "tpm_tis")) {
>              opts->tpmdriver = TPMDRV_TPM_TIS;
> @@ -586,7 +591,11 @@ TPM_RESULT vtpmmgr2_create(void)
>  {
>      TPM_RESULT status = TPM_SUCCESS;
>  
> -    TPMTRYRETURN(tpm2_take_ownership());
> +    if ( vtpm_globals.srk_handle == 0 ) {
> +        TPMTRYRETURN(tpm2_take_ownership());
> +    } else {
> +        tpm2_AuthArea_ctor(NULL, 0, &vtpm_globals.srk_auth_area);
> +    }
>  
>     /* create SK */
>      TPM2_Create_Params_out out;
> 


