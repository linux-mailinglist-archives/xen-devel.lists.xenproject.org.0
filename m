Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620679DB634
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845308.1260759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcKY-0006WA-Jp; Thu, 28 Nov 2024 11:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845308.1260759; Thu, 28 Nov 2024 11:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcKY-0006TZ-GW; Thu, 28 Nov 2024 11:05:06 +0000
Received: by outflank-mailman (input) for mailman id 845308;
 Thu, 28 Nov 2024 11:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGcKW-0006TR-UW
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:05:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca6a3fa-ad78-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 12:05:00 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so7505465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:05:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0d9bef8sm18492005e9.7.2024.11.28.03.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:05:00 -0800 (PST)
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
X-Inumbo-ID: 9ca6a3fa-ad78-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjljYTZhM2ZhLWFkNzgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzkxOTAwLjk2MzI3NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732791900; x=1733396700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf9e3TdnYtGxqFx1XkyvFSt9XUmCh5TlD34xV1GaH+A=;
        b=HUqRxmptvVgWCK9X60ycuE6dkXgCGJU/uP/B2m6emnvsQMziGlrHSJuRpJN4TIEbNi
         IMRXLjdoVx3W0cLOMfuo/BcNPRm2FbblJYofGBSCU0CpbTkE9loUBe2Yxmpf9xGZ+9x3
         NjyD4zvSVrtwL5z7EaWcLhjOajI2ckNGpCa8mEbm6JqyPxh9zsXsjLg6zRxgDuugNoLv
         mV0Zrza+ByoHe64Eog9YJ+dfKFt9MFt1Pi00ygcTU/Fr9sSOyY1jFCSvv9vBuMcvFi3Q
         Rfjy3tNPDwFAztpHo5MxplomYmlEvBf4h2TXTtFczitnZemNjKtTJ7rLVTNJtmuQzf1d
         +otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791900; x=1733396700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf9e3TdnYtGxqFx1XkyvFSt9XUmCh5TlD34xV1GaH+A=;
        b=Yi5fH51fTrvt4TUTeTDujgRilwR+Cc2xrkUFZSupR31gKbn11EowrG+G2blzNHK75W
         TlfRQmNZsMxIBNsugbWbAA182WGDzWz+4Yo7iwaedfMAQDsEEXnSqkq/j0Et+GcKZaN0
         iF2XRzKE2ey/8GbKEV84b7ZqnlAsD2DAts9WIU9rgNc1RY60fuAifyIlnZUN9JrBMJd0
         HXCZuBWGq7h0zyPmCVIH/ulwmz3XICHrbg6ZtqaZ+Sd9xPQtVvvsZJaneIJBZNNqXrAC
         GIO78Z+MYGTtiX5qDMOQv7LeyBg1znyWWGyJPAjmUfsGR5yb3MY8F2Sd1IR8aBCNJOEy
         uAvA==
X-Forwarded-Encrypted: i=1; AJvYcCV4zni7PiQYqt1nIDvjUObpg1zMu9FnXxXeuhWxUJx2SzF7iAmAjqnpEhPKLDF31K94sU9p4J6Hur4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhhyCL0ENGe0ikOT6cv3bWy3Z5Dqgf+3rDv7byXoClmziNOOFb
	tfpW3TwSsYjkjyf9vf6U1tGbX3be02x+UYXmOF9zjZaqMhmA0qNlZrW6B70ssw==
X-Gm-Gg: ASbGncsWxzalBf6gQhULpNz0wda6YrBt+leUD5yfV+Oy3LJ5B1edmO+yN5YnDfIoHMT
	0vSyPXdOggbQI8+P4rmgPmz1mgkb4CKwWz568i8ydhL0iupzkemHhHyMhT10zH97MAQ+EqxKy02
	DM9WvE/eNKBF/Om6sOWQrSdQhDeUDFC3cnDCx61lg+J3X23CRyI1Z4bZWwzwf6k7YnvBciDqyZx
	hIcTESsVfTAjTxPKKOhmAHHEbMyxqf0NYuqYZTgW7SoYKaPYOrwkNhMtmSiQ0KAbGsfEd/b3um0
	wDdP2gg4Jk+jP+EkzXdm75iYtNYq8c9VSMc=
X-Google-Smtp-Source: AGHT+IEDXrBhSQBcVl7DRj09AKHMlrST7rqkdjShLMGdcFskZGi1Bft0O/vsuJquKVUFkBnJ3wsH9g==
X-Received: by 2002:a05:600c:5024:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-434a9dbb663mr78379815e9.3.1732791900335;
        Thu, 28 Nov 2024 03:05:00 -0800 (PST)
Message-ID: <29e69d97-41ef-4ebc-a68e-0253e230f6f4@suse.com>
Date: Thu, 28 Nov 2024 12:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/12] xen/page_alloc: introduce preserved page flags
 macro
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-9-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20241119141329.44221-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 15:13, Carlo Nonato wrote:
> PGC_static, PGC_extra and PGC_broken need to be preserved when assigning a
> page. Define a new macro that groups those flags and use it instead of or'ing
> every time.
> 
> To make preserved flags even more meaningful, they are kept also when
> switching state in mark_page_free().
> Enforce the removal of PGC_extra before freeing domain pages as this is
> considered an error and can cause ASSERT violations.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v10:
> - fixed commit message
> v9:
> - add PGC_broken to PGC_preserved
> - clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is set
> v8:
> - fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_extra
>   before freeing
> v7:
> - PGC_preserved used also in mark_page_free()
> v6:
> - preserved_flags renamed to PGC_preserved
> - PGC_preserved is used only in assign_pages()
> v5:
> - new patch
> ---
>  xen/common/page_alloc.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 7b911b5ed9..34cd473150 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -160,6 +160,7 @@
>  #endif
>  
>  #define PGC_no_buddy_merge PGC_static
> +#define PGC_preserved (PGC_extra | PGC_static | PGC_broken)
>  
>  #ifndef PGT_TYPE_INFO_INITIALIZER
>  #define PGT_TYPE_INFO_INITIALIZER 0
> @@ -1427,12 +1428,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>      {
>      case PGC_state_inuse:
>          BUG_ON(pg->count_info & PGC_broken);
> -        pg->count_info = PGC_state_free;
> +        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);
>          break;

PGC_extra doesn't want preserving here. Since it's mark_page_free(), and
since PGC_extra is removed before freeing, the state change is apparently
fine. But an assertion may want adding, for documentation purposes if
nothing else.

Alternatively it may make sense to indeed exclude PGC_extra here. In fact
PGC_static doesn't need using here either, as unprepare_staticmem_pages()
will explicitly set it again anyway.

Hence I wonder whether the change here really is necessary (one will then
be needed in the next patch aiui, when PGC_colored is introduced). Which
would then eliminate the need for the final two hunks of the patch, I
think.

>      case PGC_state_offlining:
> -        pg->count_info = (pg->count_info & PGC_broken) |
> -                         PGC_state_offlined;
> +        pg->count_info = (pg->count_info & PGC_preserved) | PGC_state_offlined;
>          pg_offlined = true;
>          break;

I'm similarly unconvinced that anything other than PGC_broken (and
subsequently perhaps PGC_colored) would need preserving here.

Jan

