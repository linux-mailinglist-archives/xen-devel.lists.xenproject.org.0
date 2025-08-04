Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221BB1A01D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 13:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069088.1432929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisw3-0008Jo-3N; Mon, 04 Aug 2025 11:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069088.1432929; Mon, 04 Aug 2025 11:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisw3-0008Hw-0G; Mon, 04 Aug 2025 11:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1069088;
 Mon, 04 Aug 2025 11:00:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjR2=2Q=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uisw2-0008Hq-7k
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 11:00:54 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a036881-7122-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 13:00:53 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so3196934f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 04:00:53 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ae8esm15013323f8f.61.2025.08.04.04.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 04:00:52 -0700 (PDT)
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
X-Inumbo-ID: 4a036881-7122-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754305253; x=1754910053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8JI/7IhwZs7Hqcjm8O30s4bK/f2d1Ldfc6WcKfzI7z8=;
        b=B6LECaHiPsUyJle2cdk8BbIt/qztlDjX2KlhPRww/TtnWN+QsDXIrwh45f87q0XPhZ
         zAUY0lrC/3fxvu/TSPIMElNn4PgqVZjt2xw5s54WBK5QwBY7Y5reSZrtqYjJ1toIuoRY
         M9cuYfpPi9d+aZ6irqniBl7RC8DgWZJ/me/6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305253; x=1754910053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JI/7IhwZs7Hqcjm8O30s4bK/f2d1Ldfc6WcKfzI7z8=;
        b=YQeilejWPTynQN5hMBxJ6ariFVH+vxKvuHzaJoD3DLC9BtlM8pLMtN0fH5yhMRPPDR
         Y73yk0CjRAUwwHM3r1toeFvriQA1GRQDApeDvVrPQS3lIpvLSP7rB31LPkGoTPjaOyuw
         /gHPyKqyGTuMDibeEtDVUXMM9h6crk4PbcDBKyKVbxaGUho15qSIDsturMKUqgK7HH/N
         8eTgXLLDbludKBhyZDMG9mesglmb7ZhaAz4cp71IUXU1QqzU5WQMTrO7pJmSxoKtQ+uL
         DdYrsI7rxaV0VMYakj3RuuyHGE84N8miXCaHp3ncO4tgidYcXAfRE1seZhWs7ruitkCR
         e6MA==
X-Forwarded-Encrypted: i=1; AJvYcCVRvR2Mjm37//aICZBAIOLJUe5SMk1Jmn3fcdBGFqf2XB8rKw/onKHip1Cn7WQBvpwO/LvdSke2x2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+zPDfLWV6kyO193t8akjN0Z9ICGpgKRCJ1TTXb3CxFxy6djQn
	RJAzlo8/kHwnio3LEabWHy7/zQb7926b9hgiZJxvZ1ZzHrPrR9556XnsegH0O+/sw3I=
X-Gm-Gg: ASbGncvVHBOwvbUsN95EQVaT6UyObNbiqnbqD8nfbWEnkXpQNKNTM06vh6HQzuSlsTO
	no2rq8Pywg9+sMRJfAVHLkxNVpJGpiCFuNKF4FkxctsRbUvraLPYhUldRW7lx+u7yTLHvIuAaJM
	6eglUHFQjqf+R57P/rorb39aJOX8P3OSGldt/QtF6Up6NjGSu+aagNFB4zAQFPMPNNo8yt8arJM
	jUlBY2OurUzO12fUBej9AuBYToqOmVubqPWTCcXAGuzyws2XiK0XyGak/FNxOMfA7mT4RCPa8XV
	KlIaC7oeS4KoUIhNb7RewqaYt9ahIfiGStnf7MOdz7E+5NVPm3g+kYhXbKX3GXKwXg08A2CSOXs
	UZMtRR7tR6Xno/gbHNvJlpEoRYNincz64cIomjMVfELlmph8oH39PRlFpuhCvOq/UYRc8s1bvtM
	AA9W8=
X-Google-Smtp-Source: AGHT+IFFTFZvWD+dR9TxsgKMqX/jiPzuSh0LWGmDFT77nIAqYoLCyhumbmTKaf3R05m2GuGZegx4ZQ==
X-Received: by 2002:a05:6000:2dc9:b0:3b7:8d70:dac5 with SMTP id ffacd0b85a97d-3b8d9464526mr7011626f8f.2.1754305252676;
        Mon, 04 Aug 2025 04:00:52 -0700 (PDT)
Message-ID: <0f4abbb4-aa7f-4c09-8652-bc9041a25a56@citrix.com>
Date: Mon, 4 Aug 2025 12:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: fix xen.efi boot crash from some bootloaders
To: Jan Beulich <jbeulich@suse.com>, Yann Sionneau <yann.sionneau@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724140731.1502774-1-yann.sionneau@vates.tech>
 <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/08/2025 10:34 am, Jan Beulich wrote:
> On 24.07.2025 16:07, Yann Sionneau wrote:
>> xen.efi PE does not boot when loaded from shim or some patched
>> downstream grub2.
>>
>> What happens is the bootloader would honour the MEM_DISCARDABLE
>> flag of the .reloc section meaning it would not load its content
>> into memory.
>>
>> But Xen is parsing the .reloc section content twice at boot:
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>
>> Therefore it would crash with the following message:
>> "Unsupported relocation type" as reported there:
>>
>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>
>> This commit adds a small C host tool named keeprelocs
>> that is called after xen.efi is produced by the build system
>> in order to remove this bit from its .reloc section header.
>>
>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
> So I found a way to deal with this at the linker side, without any new command
> line options. Behavior is solely driven by the attributes of any incoming .reloc
> sections (of which there would be none by default, retaining original behavior).
> The important patch is [1], but at least the first patch of the series [2] would
> in most cases also be wanted/needed (patch 04 is obviously a mechanical prereq
> for the main patch). Need for other of the prereqs there depends on the scope
> and purpose of one's binutils build(s).
>
> Jan
>
> [1] https://sourceware.org/pipermail/binutils/2025-August/143153.html
> [2] https://sourceware.org/pipermail/binutils/2025-August/143141.html

That's good to see.  Do we need any matching changes in Xen?

~Andrew

