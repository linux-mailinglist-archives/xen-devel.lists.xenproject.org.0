Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30870376811
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124078.234175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2TU-0004Ud-Q9; Fri, 07 May 2021 15:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124078.234175; Fri, 07 May 2021 15:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2TU-0004SJ-LT; Fri, 07 May 2021 15:33:08 +0000
Received: by outflank-mailman (input) for mailman id 124078;
 Fri, 07 May 2021 15:33:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qbhn=KC=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lf2TT-0004SD-Lv
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:33:07 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83e66737-124c-4028-a073-d46273eac366;
 Fri, 07 May 2021 15:33:07 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id n22so6859887qtk.9
 for <xen-devel@lists.xenproject.org>; Fri, 07 May 2021 08:33:07 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id v11sm4721702qtx.79.2021.05.07.08.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 08:33:06 -0700 (PDT)
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
X-Inumbo-ID: 83e66737-124c-4028-a073-d46273eac366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=98jDhbtFXAmDoRmGETuRAFMHEHy1Q9q7QLyn2c0vfkQ=;
        b=OUXd4kJBl7YxwcnKYxlU1s9iVb1vrCg9+/eXATKUPQMuLDFqlAJeh1grlI24tcfshg
         NB2qlY9/1fupGnPfzxtje8gO3SyIK/q1rwzacf/bxtatES6X0C7hr+fZBdOoaXB9Cg1c
         HAPyg11ab6BK/m6uVTs+7T++bgwiScnYFQjamjSfLyZSqWwVEsLdUAG+3y4Y3bNyPuBD
         qDs5iqiht1xQpTYO+8BYenJY//TEkov9OxEauKTmG0Tj/a3xSgc4ELpqC1YbNO7uktk9
         J9zmo24lxthMwx2oF1w/jBobs+T//J3X4UDlGL0qz9udqUf4BZSYSP3lhJZ0y2ed/Am2
         trHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=98jDhbtFXAmDoRmGETuRAFMHEHy1Q9q7QLyn2c0vfkQ=;
        b=j+86NK4s7mZAz3K6y/R2GI/4dKdMJjhaORteB/qvgfLyFAvkAvAPgZVoMhBSt6pwne
         /xzUUpsjSvFBeO5U5Ce4u7g8CEkFZh/zgmqNC9UiL5KdpqfVrX6hgNe+tye68Rs/iL6s
         zE8Ohwse7QOe+/bhq567UqO8h9YdWF0TAnsoPoX7m8FestA4PvorqsW2SNcuqFIHxy5y
         N9rtuPThGLHCOd0mJieEYv7Y/FRDNvip0ZEkWlWpufhR/fp4+mU3mJTCZSVuVcaIAMPB
         EZgT7QH8XTfobb27qwmKmkJKM+ymiuSXkdyCDfFdv1dQj+PKtmMrUeOk3IXkJSxqU4nP
         l0TA==
X-Gm-Message-State: AOAM533+Zzvvej6LU2Cfc8x0PswF4EQoxxshl/nZoTbs9eb/Z2fJmJVR
	FWZBSFccyMtbxsLJy848GcmNNFjKOA4=
X-Google-Smtp-Source: ABdhPJxPjTFzhvjpTP94UNrt1REvxwOL5XhV6xDVIEy21VX9ABEnepRCA8TP7z9EVGzHrGAWKDAEGw==
X-Received: by 2002:ac8:5a16:: with SMTP id n22mr9773658qta.103.1620401586802;
        Fri, 07 May 2021 08:33:06 -0700 (PDT)
Subject: Re: [PATCH 2/9] vtpmmgr: Print error code to aid debugging
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-3-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <a79284c5-669c-0749-8234-86f2bc6f4d46@gmail.com>
Date: Fri, 7 May 2021 11:33:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210504124842.220445-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/4/21 8:48 AM, Jason Andryuk wrote:
> tpm_get_error_name returns "Unknown Error Code" when an error string
> is not defined.  In that case, we should print the Error Code so it can
> be looked up offline.  tpm_get_error_name returns a const string, so
> just have the two callers always print the error code so it is always
> available.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/tpm.c  | 2 +-
>  stubdom/vtpmmgr/tpm2.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/tpm.c b/stubdom/vtpmmgr/tpm.c
> index 779cddd64e..83b2bc16b2 100644
> --- a/stubdom/vtpmmgr/tpm.c
> +++ b/stubdom/vtpmmgr/tpm.c
> @@ -109,7 +109,7 @@
>  			UINT32 rsp_status; \
>  			UNPACK_OUT(TPM_RSP_HEADER, &rsp_tag, &rsp_len, &rsp_status); \
>  			if (rsp_status != TPM_SUCCESS) { \
> -				vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s\n", tpm_get_error_name(rsp_status)); \
> +				vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s (%x)\n", tpm_get_error_name(rsp_status), rsp_status); \
>  				status = rsp_status; \
>  				goto abort_egress; \
>  			} \
> diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
> index c9f1016ab5..655e6d164c 100644
> --- a/stubdom/vtpmmgr/tpm2.c
> +++ b/stubdom/vtpmmgr/tpm2.c
> @@ -126,7 +126,7 @@
>      ptr = unpack_TPM_RSP_HEADER(ptr, \
>            &(tag), &(paramSize), &(status));\
>      if ((status) != TPM_SUCCESS){ \
> -        vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s\n", tpm_get_error_name(status));\
> +        vtpmlogerror(VTPM_LOG_TPM, "Failed with return code %s (%x)\n", tpm_get_error_name(status), (status));\
>          goto abort_egress;\
>      }\
>  } while(0)
> 


