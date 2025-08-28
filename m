Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82365B3A487
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099469.1453316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uredF-0008Q2-Gi; Thu, 28 Aug 2025 15:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099469.1453316; Thu, 28 Aug 2025 15:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uredF-0008Nc-Dv; Thu, 28 Aug 2025 15:33:45 +0000
Received: by outflank-mailman (input) for mailman id 1099469;
 Thu, 28 Aug 2025 15:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uredD-0008M9-PC
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:33:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6011de1c-8424-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:33:41 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b7d485173so3535175e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:33:41 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cc4b102889sm8713190f8f.51.2025.08.28.08.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 08:33:39 -0700 (PDT)
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
X-Inumbo-ID: 6011de1c-8424-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756395220; x=1757000020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JjqoTxNmSOot+C9zcD0O1M60t5R3BdVvIcEped/y03s=;
        b=vDoIhAR+hacu1x9aUxldl3ApnqHpPXSN3dVXpAXgorEkyDor4JoFWMO9zT1k8095jC
         FDFEgjsFA9ufdIuFpFUVI5zeg0ELuQDpqQrQZK+91HCZSCZFgs6tA4LzVpN95vYlDGj7
         fUY7RAS94MjUbLxd7Z4l4SJqHFOMdHj/pjlGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756395220; x=1757000020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjqoTxNmSOot+C9zcD0O1M60t5R3BdVvIcEped/y03s=;
        b=c7UwPtFrZxxu+qINVpX4WBvxGNOpY/OM64l1jCh0U2cJQJQlS99B5GVJNjTB+0xjRD
         MJbZ8tQKpe2AwNX5y0uK8CPxwaB526fK12S8EdHwlhWlxmHjzcw26f+QpQ0xBvED1E11
         ++uJEepMNln8LlgVVfeis5kt94oRYuLAU0Cp4awX86955co3HtU479/QrCARZY7TQHcA
         i0U1KnpVC9HZ81tmW+WJ3v3R+/J9NbRVPWTM4eX5/wOXHa0TNsbk8785w+IKITHPhqcT
         dehcSTzfRKl2ScrbloJg/mE8XK6Lsf6Zal6C3Yi+6oVYt0aQ6XPQHXIGUNKA4fioJy1h
         7FPQ==
X-Gm-Message-State: AOJu0YzxL6g7FXDXDb6RUINU6c/DFikLjX46jyRHeSV/E6nHbMCI+cbb
	MfJYhisvP80dH6xz5lCW7KA+VRgQwm8Gx5ygAAViWQYklLb+mzkmPaq38CwBu5eStegynB4WABC
	ZPZor
X-Gm-Gg: ASbGncuKrSWpodjEd/CdYTtrfCg0MtmwwHOsMJcQkjS1UVf5PmLixQzYQdBCH08KG0J
	FKhJ+vqQHXh7+ZRHQ0hTUqg2053PzFEsqt+eByyhy9rSPm0Dx3IqK9SMbRETZ0kC5Z1cfRv4LUn
	EVv/EGB8lo0L6fw9VAm/LcC4Kv6j4VJ2APdwKGWzOHQje3iT4+tgyb1lF+gU6ssmMbqYWXVTsjg
	kT3W6LCUpSKD+9xX2FCmAghltrUFenfQsAO2+CDfQyXHtW76DWYiDyrbuFUxGRDoqdOTbXkmX5Y
	BLjxZIWndapgjc7w56X/g1sg0VnOhq60DAdwZo9VUPhyJtNT8KXgdC2wB/E5xmyT8pw08hZj0Pj
	mT3c752CECVDpe5Snm5vpfozNbo3xh9NXEwnwZhbAzPxCXRVQwwuYK5sDr7FV3cZ6UTNQC3NWnk
	MkSf0=
X-Google-Smtp-Source: AGHT+IF9Y8jrWU/mAbqW22fY3hiUfejtYoNkiFgb+3rllFokT3+kNJfITYXUXUnYLTAuFpEIDogUoA==
X-Received: by 2002:a05:6000:18aa:b0:3cd:7de0:729f with SMTP id ffacd0b85a97d-3cd7de074a5mr3186867f8f.4.1756395220451;
        Thu, 28 Aug 2025 08:33:40 -0700 (PDT)
Message-ID: <cb6b027c-f944-4a7b-8939-b58b957dcfff@citrix.com>
Date: Thu, 28 Aug 2025 16:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] x86: FRED enumerations
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-2-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250828150409.901315-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2025 4:03 pm, Andrew Cooper wrote:
> Of note, CR4.FRED is bit 32 and cannot enabled outside of 64bit mode.
>
> Most supported toolchains don't understand the FRED instructions yet.  ERETU
> and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC), while LKGS is
> more complicated and deferred for now.

I've realised this is stale now.  I'll replace with:

Most supported toolchains don't understand the FRED instructions yet. 
ERETU and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC),
while Xen turns out to have no need for LKGS.

>
> I have intentionally named the FRED MSRs differently to the spec.  In the
> spec, the stack pointer names alias the TSS fields of the same name, despite
> very different semantics.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
>
> v2:
>  * Drop CONFIG_HAS_AS_FRED

I should have also noted "Add X86_FEATURE_XEN_FRED" here.

~Andrew

