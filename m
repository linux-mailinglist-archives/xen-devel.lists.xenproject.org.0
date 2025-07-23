Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60128B0F4FE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054210.1422926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaDc-0004WP-VA; Wed, 23 Jul 2025 14:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054210.1422926; Wed, 23 Jul 2025 14:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaDc-0004Uy-S4; Wed, 23 Jul 2025 14:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1054210;
 Wed, 23 Jul 2025 14:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueaDb-0004Us-J6
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:13:15 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ae0df1f-67cf-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:13:12 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45555e3317aso39241155e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:13:12 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45869183cb2sm24397415e9.1.2025.07.23.07.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:13:10 -0700 (PDT)
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
X-Inumbo-ID: 2ae0df1f-67cf-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753279992; x=1753884792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0dyGbOhTx567kWL2TEIgs7Hc+6K2dcVRKZsWyo7MYC0=;
        b=tbfw0tUwMTOhIa0aoNdhOhHU5T3scuwTFma1cAhqtDrVWylOgEFLhNrBIBdI+Zi82/
         71zExnYikifiSFVDAmM2SXq8XpWkIgq/NK8BUTOYDNicw/4E5lXUBLgq+nE22wuWDFec
         5hKgmSb/gE1zYPaw5u5GZKrJYEopxBPWK/coU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279992; x=1753884792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dyGbOhTx567kWL2TEIgs7Hc+6K2dcVRKZsWyo7MYC0=;
        b=HeRDvvX1xmJz4VA4HLZYZ0jkmPib7ojqfsjsCmRjsBAsHN9lJYBaMuoXJKIarZ3h9L
         zsFC3nAyuv+ypLeV11TJddumVnn8uuzw7cT+nGftVHl+k9EeuEFhyqp145xNoraro9MZ
         mtBlGf3k6CuOLIN6WyBSnPUNvw4xxmYj1DszYsI9Tz6cDXqZP8tVb6lRGL9ObZ3Kd+nh
         XM0AlbSBpj6sgjQn4a2TV9ayr+91T9RrvPO02gR+k9BVGV0pFl4RG0HqQ/i5v2BynkFK
         LmTKvtpqaQ+BnyM26QfhzXdaoQlJBA6+9Rl0FNNrz1HVbDpCrX99eBrfEzDZy3TH4WCR
         /+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9sTkWZY98hIKJ9mKzMNU3WuxGN2SHch7i50RT7XQoDzIphdR5/yaMEvPzqrppYaiID9nFOU2XObQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw82Y3tQ6YS7H+bIWLzdBPB6yKmiEDejIck+9bTJKZ9HBqOJ7Tr
	h0sN3IIteWINq7zgfVolNfR7wNnYvUHUgtz5gcPseO8YQ8WWACmUN86G13zS5ca0dRk=
X-Gm-Gg: ASbGnctCgFWdNE0OPQnIgFGBTtv2E9DREmepkCUN0K54RHzIFFK7bZybe9QnF9WqMaQ
	J5SB/9DFhcW5bIh2X9MIP0q/DILYiTCFYvGCaHE8bh0b6ujjqMbLmt/51p8kfZ6BvhlfhlUjeeh
	kvArzwvtcl+LFZgn2PPwsRQuR9mKpAC2gk8wxVbRXB4yRtEvhVhlDOnNP7fKXvH9KUkEyOdIDNL
	C7wiwqQyXANEfyhYcrrt2tFzaV0s4qJ110HJvchTf1lroVI9EiLNFHjaWv79LGqNDpCUqQnVzKF
	Z9tRb3huL/0MdxMtpQY4qHQMjqcUiAKiIVMMCKykW/7MtY8rBpp3AgMoYH2CRGC+gHv01ztDkiE
	VgXZtMk64JVWBeBDO7lCSM9/+Hvdb6kWuuW1Vek0Jx32Rmg4Ak5/B8Re4b1CQNqlTebLY
X-Google-Smtp-Source: AGHT+IGGFkMvis9leManIK78o9pgWF6xLk07lXrCXcKJOYUBLdz/ptSNpQEdU/QeS1QmIR7MlCUwqw==
X-Received: by 2002:a05:600c:4f07:b0:456:26ac:517a with SMTP id 5b1f17b1804b1-45868d2dfa6mr23949735e9.24.1753279991724;
        Wed, 23 Jul 2025 07:13:11 -0700 (PDT)
Message-ID: <fb0cc1f6-bbc0-4413-998a-6fa55192f73a@citrix.com>
Date: Wed, 23 Jul 2025 15:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
To: Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250723135620.1327914-1-yann.sionneau@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 2:56 pm, Yann Sionneau wrote:
> xen.efi PE does not boot when loaded from shim or some patched
> downstream grub2.
>
> What happens is the bootloader would honour the MEM_DISCARDABLE
> flag of the .reloc section meaning it would not load its content
> into memory.
>
> But Xen is parsing the .reloc section content twice at boot:
> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>
> Therefore it would crash with the following message:
> "Unsupported relocation type" as reported there:
>
> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>
> This commit adds a small C host tool named keeprelocs
> that is called after xen.efi is produced by the build system
> in order to remove this bit from its .reloc section header.
>
> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
> ---
>  xen/Makefile           |   5 +-
>  xen/arch/x86/Makefile  |   1 +
>  xen/tools/Makefile     |   3 ++
>  xen/tools/keeprelocs.c | 119 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 xen/tools/keeprelocs.c

I'm sick and tired of the hoops we have to jump through for broken
tooling.  This is now rewriting the PE+ metadata because apparently the
linker can't do it correctly.

Either fix the linker (or the way we drive it/etc), or we're doing away
with PE+ emulation entirely and writing the MZ/PE headers by hand like
literally every other kernel does.

This is a level of technical debt I consider unreasonable to take.

Also, note that your analysis points at a common code file, yet this is
an x86-specific bodge.

~Andrew

