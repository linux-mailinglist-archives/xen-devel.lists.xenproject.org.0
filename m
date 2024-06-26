Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF299187B4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749352.1157417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVkQ-0000q8-5m; Wed, 26 Jun 2024 16:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749352.1157417; Wed, 26 Jun 2024 16:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVkQ-0000oe-32; Wed, 26 Jun 2024 16:43:54 +0000
Received: by outflank-mailman (input) for mailman id 749352;
 Wed, 26 Jun 2024 16:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3iT=N4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMVkO-0000oY-Sg
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:43:52 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43c8489d-33db-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:43:50 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-79bc769b014so59445285a.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:43:50 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d5879fceasm21974385a.68.2024.06.26.09.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 09:43:48 -0700 (PDT)
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
X-Inumbo-ID: 43c8489d-33db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719420229; x=1720025029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eFSEg/ryKbn5I3Lv6Z9zNIv9ShhF53/6vBq/qLrPR3s=;
        b=WdidwcHR2NuG3gjXiIx4WdBRrwxRsIE+e2PTU604+P98bKL07Xk4EAzPYXtIPBmLeh
         mGfDZMpyng4QomoVA2sqxhucocfEL3brbtezC3W2p6JXXcL2AniLtIRQdw9wqZasmc+E
         AMqA0wpHRNS0V48dj93nW3iUC7VQiChGyA3NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420229; x=1720025029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFSEg/ryKbn5I3Lv6Z9zNIv9ShhF53/6vBq/qLrPR3s=;
        b=FIxHKjtHUaEoG4KhFE/wvBr7F3ckpcMVEoeDCuYw5DzKo2Qk/z/ahy8s2/n21+HqDl
         ssKY0RXrcVkHjn5Zhl5TLdPXDVFGGLRidT9tEFHSnTyRTc3KYEEbw/mE5tTEMimTV8Bf
         ol7Uwegzodn7vNLXRvm5ewziUB0fbggYMlBz7HIPmjv257DsOxByGmCdV0+qaIMZAPQS
         87Hkl1Byuh8f65AZfC7k1oVisVMjIsT3xbtzAibA/AgWvPf4tczFOBBLAA4BdznuHITB
         AVvTELyAzPTWC3f6J07EcDw4wJekoxAIdtW8diK7wJjuUGblaiutdzl7RhuSW6URztzr
         3rpw==
X-Forwarded-Encrypted: i=1; AJvYcCUaNGm7AFZRLvt49QHfK60kWmssxpnT5VYOXUJybgO+3xvxoCiI35qnbG1ub1f8YJ/R3THHKvkXTqmOxTk0O8jHvc1aCqccRxg8Ht2YSfA=
X-Gm-Message-State: AOJu0YxQKUE3SwCbRoZjgrigVssycZJSvwmIVyMRsUG6OoiQzQF4zhbd
	YpQYuOoYD5P0b0Z9cjk6jtgg1b/h/ME4GAKKLAc1mxyAS+33ROaKlygc8uHAhteERFvZ6Z58yhA
	zRNE=
X-Google-Smtp-Source: AGHT+IE9w2u1JI5ugIDMvwnuo2KG95UgjqguYKmWOPYCcuOmQ6sp1mNLGKUsQqEWfXAFx/9gDM6E+Q==
X-Received: by 2002:a05:620a:1a9e:b0:79c:ad5:cd7d with SMTP id af79cd13be357-79c0ad5d2e1mr647010185a.23.1719420229451;
        Wed, 26 Jun 2024 09:43:49 -0700 (PDT)
Message-ID: <7ecf1b46-c1c2-42b5-b3cb-ab737ab67900@citrix.com>
Date: Wed, 26 Jun 2024 17:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19 v4 01/10] tools/hvmloader: Fix non-deterministic
 cpuid()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
 <f8bfcfeca0a76f28703b164e1e65fb5919325b13.1719416329.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f8bfcfeca0a76f28703b164e1e65fb5919325b13.1719416329.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 5:28 pm, Alejandro Vallejo wrote:
> hvmloader's cpuid() implementation deviates from Xen's in that the value passed
> on ecx is unspecified. This means that when used on leaves that implement
> subleaves it's unspecified which one you get; though it's more than likely an
> invalid one.
>
> Import Xen's implementation so there are no surprises.

Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to
hvmloader")

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
>
> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> index deb823a892ef..3ad7c4f6d6a2 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -184,9 +184,30 @@ int uart_exists(uint16_t uart_base);
>  int lpt_exists(uint16_t lpt_base);
>  int hpet_exists(unsigned long hpet_base);
>  
> -/* Do cpuid instruction, with operation 'idx' */
> -void cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx,
> -           uint32_t *ecx, uint32_t *edx);
> +/* Some CPUID calls want 'count' to be placed in ecx */
> +static inline void cpuid_count(
> +    uint32_t op,
> +    uint32_t count,
> +    uint32_t *eax,
> +    uint32_t *ebx,
> +    uint32_t *ecx,
> +    uint32_t *edx)
> +{
> +    asm volatile ( "cpuid"
> +          : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
> +          : "0" (op), "c" (count) );

"a" to be consistent with "c".

Also it would be better to name the parameters as leaf and subleaf.

Both can be fixed on commit.  However, there's no use in HVMLoader
tickling this bug right now, so I'm not sure we want to rush this into
4.19 at this point.

~Andrew

