Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44008A98854
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964434.1355228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Y61-0006l0-Of; Wed, 23 Apr 2025 11:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964434.1355228; Wed, 23 Apr 2025 11:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Y61-0006ih-LK; Wed, 23 Apr 2025 11:16:53 +0000
Received: by outflank-mailman (input) for mailman id 964434;
 Wed, 23 Apr 2025 11:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7Y60-0006ib-Ee
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:16:52 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 743841a2-2034-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:16:51 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac6e8cf9132so1073412166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 04:16:51 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6ec9c3b2sm785671366b.86.2025.04.23.04.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 04:16:50 -0700 (PDT)
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
X-Inumbo-ID: 743841a2-2034-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745407010; x=1746011810; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qf4EUGp/hJFBFlkVNISKSnNWZZeophaFufjaCPmn1s=;
        b=L97KJ79iohEO3skDnZQObtIxAXKrXQfv5ueyTocLjRMev1jOpxJxYe7zWAYL3nMSk9
         0GGcZF/OjpBp/mT2J0a4lzbw6xoR41Yz0fxk361KAjdeBaRfHlVRuc7RifRoHQfH8Zsl
         TUDWMSqDA4mV5ytiol7inkHvD5UuPoxj8zFIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407010; x=1746011810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qf4EUGp/hJFBFlkVNISKSnNWZZeophaFufjaCPmn1s=;
        b=vFbR1epKuVeSxhbwBCy0DP3Bezta4OAUdChFmMu4y1beTHDPEZ5f4+eBykV2d6GWYE
         h5Rr9ZjHI096AkRpJ540IpPW+8Lv/TSEdfrO6rcG36Ovd8Mr86epkCNvWE2aNLIxBmRl
         PSH0AYBlpsnowu9/42VswfcmJyyNKxe88sYGzT8U3SXT/scTpgakqsBkUrc9sS4REYiS
         YUfpkBIJM/DiVRYi+ShkBFL3qQIlq0e6xiQOaq6UJWtcGXegtC3UWWAEjXKyIwuDLU6J
         M0virIHxBf1u5ScAipSqzFvmQI5v57WW2vw173ZoreKu/DqRmG1SqryBfkZUTgk8phq8
         VUEw==
X-Gm-Message-State: AOJu0YzwTiXPbjOgvUwXedcWkfahRivoz0AZx19PKBy3OL0BPc1PW1Nc
	M9va3E/AIp6T/fo/kawN3vnG59bbqbY5jjsiQce/D9wjbrDg3Tt+2SFPmwIOlZA=
X-Gm-Gg: ASbGncueOZIlkiQIfCErvJA9NEzyssq5t3dxYCPaxDrW7BePPVu+qlnwHMY91roygV2
	Y0+xTUoIvEDUn0DMyNeyLRMNxjBVs81xjGQ75eIn4NviIFc360fP7g1214hNsLZQ2qkEYUFpkIl
	ifiRrA0hvaCN7l2Z6xVCJqUnQbFIpYh52nKS4/zMSi3CcJUyMc7gxgZfslnxVh0/FfRnuGHNFcN
	mBihWgKNcd016tML2vyr3kyZr3kWL0eudKuI3QFp2bhdowxunAUQXEA8O6qjAkDIUR6FQP9PLWN
	MhuyOUKo7Ce99CU7dF5EvpV43cahHy41gRVy9F/aT/CbIA==
X-Google-Smtp-Source: AGHT+IFd8A0LIgg1gD+bpi1731ala/4Z3xRdLGiSImdeRuBf2v3k7enRMMzokbvLndw4kzEEZQa/5g==
X-Received: by 2002:a17:906:c103:b0:ace:3b02:368d with SMTP id a640c23a62f3a-ace3b0239c7mr303964166b.44.1745407010452;
        Wed, 23 Apr 2025 04:16:50 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:16:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 6/8] xen/livepatch: Support new altcall scheme
Message-ID: <aAjMIeYaPzxlsV8_@macbook.lan>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423010237.1528582-7-andrew.cooper3@citrix.com>

On Wed, Apr 23, 2025 at 02:02:35AM +0100, Andrew Cooper wrote:
> The new altcall scheme uses an .alt_call_sites section.  Wire this up in very
> much the same way as the .altinstructions section, although there is less
> sanity checking necessary.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One nit/comment below.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/alternative.c         |  6 ++++
>  xen/common/livepatch.c             | 58 ++++++++++++++++++++++++++++++
>  xen/include/xen/alternative-call.h |  8 +++--
>  3 files changed, 70 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> index f6594e21a14c..22af224f08f7 100644
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -479,6 +479,12 @@ int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
>  {
>      return _apply_alternatives(start, end, true);
>  }
> +
> +int livepatch_apply_alt_calls(const struct alt_call *start,
> +                              const struct alt_call *end)
> +{
> +    return apply_alt_calls(start, end);
> +}
>  #endif
>  
>  #define ALT_INSNS (1U << 0)
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 6ce77bf021b7..be9b7e367553 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -905,6 +905,64 @@ static int prepare_payload(struct payload *payload,
>  #endif
>      }
>  
> +    sec = livepatch_elf_sec_by_name(elf, ".alt_call_sites");
> +    if ( sec )
> +    {
> +#ifdef CONFIG_ALTERNATIVE_CALL
> +        const struct alt_call *a, *start, *end;
> +
> +        if ( !section_ok(elf, sec, sizeof(*a)) )
> +            return -EINVAL;
> +
> +        /* Tolerate an empty .alt_call_sites section... */
> +        if ( sec->sec->sh_size == 0 )

You could possibly move this check to the outer `if` condition, and
avoid the alt_call_done label?

As even in the !CONFIG_ALTERNATIVE_CALL case skipping an empty section
would be OK.

Thanks, Roger.

