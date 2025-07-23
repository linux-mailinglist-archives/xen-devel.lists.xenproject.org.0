Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B086AB0ED4C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 10:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053536.1422311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUuK-0001zD-Os; Wed, 23 Jul 2025 08:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053536.1422311; Wed, 23 Jul 2025 08:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUuK-0001xc-Lt; Wed, 23 Jul 2025 08:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1053536;
 Wed, 23 Jul 2025 08:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueUuJ-0001wB-QB
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 08:32:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3170ccb-679f-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 10:32:58 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so3835850f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 01:32:58 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25643sm15238338f8f.16.2025.07.23.01.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 01:32:57 -0700 (PDT)
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
X-Inumbo-ID: a3170ccb-679f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753259577; x=1753864377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PWO0N7EguTS1I4po4l8LFx912xdUF7ZrKbWnHFEcYS8=;
        b=uap+uAVn8XTdu9kN4wblGpY7A6g9eL/SeYSq8E5hJokvx/lUAIHEyv7lP3f99FheZk
         vQk6TugQzzH/C0AZUUVYphTSrSHr/TLAqZV410HMh6lwFy6n/ypObUUZe9HXrobUrIu6
         nmav6r7w96rNYlM5jaHoOHcqV/AxSR02lQpIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259577; x=1753864377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWO0N7EguTS1I4po4l8LFx912xdUF7ZrKbWnHFEcYS8=;
        b=TqCoerxG6XB+bo/noMEPFV+bHtuCQkqfCjokHNEewdnsQBSyeRpN+hrO362IxpS4ih
         aXXIXBRg+lGQAtx4LoESTI+V3pWnvtvrknavWT+u9zQnAunbpFbO+ZGYUKUkb6frsZLU
         4uFcvACQrkV9SW37iPnUWLc8/IR4b/Yd5DjMK79YNmpId71udQBx/S5jUwy7WJ/1rcB2
         WxDE1jPcZtJ9vorbpKFVGjkkv8wud8wAXsmxZwpd63QqbR5/bvpWkUO2Ai+IJX8p9KRS
         DfqazUWY0WSMmikfBX50JlxQfdNuvT43Fe2IN97mWExtWgi18+v62MeOCUrrdKGJ+lcs
         T7JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7NIhnjreJVgZqGW6biXEOjf4x61UczVNFtZSMTk3IiGYvW41zf2bMVeFNZsEha+TRoBL37zwG7+E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8nDWaozkEOM4pebZOVZlb3ZTalElwF3a+/ecm4HD0rEt6bJfY
	86kDKhiMzLkP5icXDwQAJWo1PKCbg6heGlusoMoBTsDjUVfpo1yeUWB63yekxXURDfc=
X-Gm-Gg: ASbGnctJPzl3sT0FuSinOUGH25X5zgubiSp7N6XIM9JmzbCOYNWdy4ugqREWOXjBRqa
	8fcBSoniqyzOys3Ojs+C38BCZSmYu5HDQgDdf/v1MoG2ueTXwo34E8InvABvyJPrWcpctCRK9FW
	8XhQHX1Tu9Fqg/WAobqTqZnjQ0q6Dj95U6+PnaamqPpI1+xveHAxmXRZ28S4+RJdJr4mfTjRSEu
	GqME9jNzG/ZedspzGid9Eh+FeS1wj3cjGUi2TAUtlcQ9GSxHQie6bmnDpxKR35ntHSjU2TM3VsH
	z9INDsurtZ2TE03IDIgpFDR4CuyjZ33FmTbuS5nSWcRnxGAAS9VHuoSp4ug+ld+MskrkWwDDQkd
	84caj6NKNOY3SHapGNrGrzp/1cOAfzRe0lQB3ToqyOQsiJHwXmiCmRbF4hPTQBYzDJitS
X-Google-Smtp-Source: AGHT+IGx5UjvNu6VZPtjKuxn/4Go7fTgN25tDWjJa5/dlhJlx5HxiRckHz9UTfu43Yf+KDUDP3JNkw==
X-Received: by 2002:a5d:588d:0:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3b768f2305bmr1565678f8f.43.1753259577534;
        Wed, 23 Jul 2025 01:32:57 -0700 (PDT)
Message-ID: <74514e69-8cd8-4377-b420-ad0ff7e9e023@citrix.com>
Date: Wed, 23 Jul 2025 09:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 4/8] xen/arm: split is_32bit/64bit_domain() between
 arm64/arm32
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-5-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250723075835.3993182-5-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2025 8:58 am, Grygorii Strashko wrote:
> diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include/asm/arm32/domain.h
> index 4d1251e9c128..c0a7fc35f38b 100644
> --- a/xen/arch/arm/include/asm/arm32/domain.h
> +++ b/xen/arch/arm/include/asm/arm32/domain.h
> @@ -3,6 +3,11 @@
>  #ifndef ARM_ARM32_DOMAIN_H
>  #define ARM_ARM32_DOMAIN_H
>  
> +/* Arm32 always runs guests in AArch32 mode */
> +
> +#define is_32bit_domain(d) (1)
> +#define is_64bit_domain(d) (0)

I know you're just moving code, but this was buggy before.

These need to be ((void)(d), 1/0) so d gets evaluated consistently.

~Andrew

