Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D5A46A84
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 20:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897185.1305897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMeL-0004d4-Bm; Wed, 26 Feb 2025 19:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897185.1305897; Wed, 26 Feb 2025 19:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMeL-0004a4-91; Wed, 26 Feb 2025 19:00:53 +0000
Received: by outflank-mailman (input) for mailman id 897185;
 Wed, 26 Feb 2025 19:00:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnMeJ-0004Zw-IV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 19:00:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe3b0604-f473-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 20:00:49 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso1051925e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 11:00:49 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab3741596sm47088325e9.1.2025.02.26.11.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 11:00:48 -0800 (PST)
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
X-Inumbo-ID: fe3b0604-f473-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740596449; x=1741201249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ail0koORPkHryNwwGv+Tc+fSRbT7Cpa/XVCePRhSc0=;
        b=DBgGpguyXSQ1942gDQ6bPySoiWIan/5KBHIFewZE/Nq4g2PN5NgCWKcTjY/RUAKHY6
         HOJ6UZNKt4MPaGLT7kzlFJzM80ZuogvviXBgPqcIG2GqKxFc67hs9Ulm9ubY7FaNCHMN
         6CFJUGkcl5QCDZ6t3/DfP0hMSfBkoDtdDxgQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740596449; x=1741201249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ail0koORPkHryNwwGv+Tc+fSRbT7Cpa/XVCePRhSc0=;
        b=kCuMB/VtnqZM9iZ0FhJsONeiNAr9ocGAlIai3lEbt8auMBBL34eFZ8nq/pAZp2MlPw
         nWGyuEufiUnJCM2EsYbJUVzIt57cqQ6ba5j/8hMAQQe03Jlr+KpgR2bxCdFsCQpF7Qrm
         uTNA1cBKGwv/UA2jU0IMLpL3G5Xt4JHNbdCcvOZjblUNcMVnZsBXsyxbawHdOsko9VEF
         HfTAno8DtvQvW0Im0bCBVy1ocMJ80tfQc7kaarojciiwTKXRz1WS92i6zu5XQvb+DhtI
         GindIJexC6jhjlMf4naH3RcALjdj6/q3tYEYuRP1Xl7/cBnV8JaN6f5oS+/6BXYZMxma
         b4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUOV22QsZl9IgAKYxCV5ERVrEUP4P46MIKsvZU2btcBzs0NI5ijhvrxovIv17IZfa5+43sALK/6gjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiURDBBYFXz4qtkSxIRZsRVD8nm8xs4cy79s29sYFEIti7OWLd
	hqglkIkKnaLEPP9QUHdBp4D/QXBxDmbvrRw8KTcI3JwGEXOKyDwnt8aNonaXEWk=
X-Gm-Gg: ASbGncvM2Vbsqq211aOCednK8X3DP1wrZHuFS5ePx62gt5bUEXxXWZQvaQjLqgs+/tR
	VA6eeVUwYBSdkd2iv2H34LLqTvmk2uCJ6JDsmpzwGkQ5Ss2M7GA7K5Jdr5UVFNt9rP76O7VyO7+
	WfAixF9cP6WIPhYK4d48MyVVT7ZUUlEmDb+K0W9czNVi95PeRihELVEWdSGKvFzA0yLT+kMhX1Y
	A4SkPKJUuBIrbLuRGO2tZEEz9A+U35KmGOXTOE0QV3GyRyGiP9oA2B34b2ue5yX5TPnOJh1gG63
	5X2BEp60qlVN+RxWYtYxhpeGEjAF81yaFUMVDFMSDsxpsfkQs0U8i0PP6mc9P+yFtw==
X-Google-Smtp-Source: AGHT+IFGKnR+koqTA9g8lBDslbchsgFJE5ObUlmPraa2Oio7kX7TiuQxWupzNCnz3WZIIFnYPlX5tw==
X-Received: by 2002:a05:600c:1c03:b0:439:8a62:db42 with SMTP id 5b1f17b1804b1-43ab8fd8e71mr39760065e9.8.1740596449104;
        Wed, 26 Feb 2025 11:00:49 -0800 (PST)
Message-ID: <83366a91-4768-4bb1-ae6e-112725ce84e4@citrix.com>
Date: Wed, 26 Feb 2025 19:00:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/ucode: Drop the ucode=nmi option
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
 <20250225222905.1182374-3-andrew.cooper3@citrix.com>
 <4de478dc-fecf-4112-8e2b-a7f7a62344bd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4de478dc-fecf-4112-8e2b-a7f7a62344bd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 2:46 pm, Jan Beulich wrote:
> On 25.02.2025 23:29, Andrew Cooper wrote:
>> This option is active by default, and despite what the documentation suggests
>> about choosing ucode=no-nmi, it only controls whether the primary threads move
>> into NMI context.
>>
>> Sibling threads unconditionally move into NMI context, which is confirmed by
>> an in-code comment.
>>
>> Not discussed is the fact that the BSP never enters NMI context, which works
>> only by luck (AMD CPUs, where we reload on sibling threads too, has working
>> in-core rendezvous and doesn't require NMI cover on the primary thread for
>> safety).  This does want addressing, but requires more untangling first.
>>
>> Overall, `ucode=no-nmi` is a misleading and pretty useless option.  Drop it,
>> and simplify the two users.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Despite the reasonably large diff in primary_thread_fn(), it's mostly just
>> unindenting the block, and dropping the final call to primary_thread_work()
>> which is made dead by this change.
>> ---
>>  docs/misc/xen-command-line.pandoc |  8 ++-----
>>  xen/arch/x86/cpu/microcode/core.c | 38 +++++++++++--------------------
>>  2 files changed, 15 insertions(+), 31 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 47674025249a..9702c36b8c39 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2721,10 +2721,10 @@ performance.
>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>  
>>  ### ucode
>> -> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
>> +> `= List of [ <integer>, scan=<bool ]`
> With this (taking my comment on patch 1 into account as well) I think ...
>
>> @@ -123,9 +120,7 @@ static int __init cf_check parse_ucode(const char *s)
>>          if ( !ss )
>>              ss = strchr(s, '\0');
>>  
>> -        if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
>> -            ucode_in_nmi = val;
>> -        else if ( (val = parse_boolean("scan", s, ss)) >= 0 )
>> +        if ( (val = parse_boolean("scan", s, ss)) >= 0 )
>>          {
>>              if ( ucode_mod_forced )
>>                  printk(XENLOG_WARNING
> ... this function will want to transition back to what it was prior to
> the addition of the sub-option, preferably adjusted to account for the
> possibility of multiple "ucode=" on the command line, i.e. along the
> lines of
>
>     if ( !strncmp(s, "scan", 4) )
>     {
>         ucode_scan = 1;
>         ucode_mod_idx = 0;
>     }
>     else
>     {
>         ucode_scan = 0;
>         ucode_mod_idx = simple_strtol(s, &q, 0);
>     }
>
> That would then make patch 1 kind of unnecessary.

As said, I need to introduce a new option for the AMD fix, so it needs
to stay comma-separated.

~Andrew

