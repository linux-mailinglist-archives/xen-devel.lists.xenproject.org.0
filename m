Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E651AA1B7DB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 15:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876781.1287133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbKbv-000561-R2; Fri, 24 Jan 2025 14:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876781.1287133; Fri, 24 Jan 2025 14:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbKbv-00053A-NQ; Fri, 24 Jan 2025 14:24:39 +0000
Received: by outflank-mailman (input) for mailman id 876781;
 Fri, 24 Jan 2025 14:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDdn=UQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tbKbt-000532-UU
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 14:24:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f004f827-da5e-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 15:24:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso13971135e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 06:24:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b1718741sm51772085e9.0.2025.01.24.06.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 06:24:35 -0800 (PST)
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
X-Inumbo-ID: f004f827-da5e-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737728675; x=1738333475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IbrNnHdKC0/LFwGAR0T6w8via2cDaA74ls46mFyUi1c=;
        b=LenSFj0AudFPOUq8C034X2sFT7ed3Zj/4WknFbkAFKiJsrR7yqwBpET1JC3I3BOPV+
         61N5kyYVQF5T0/1Xdvhd4VqJFt/MhtxXs0Kf0vNZumsf5Mt4vuwgSP0tA8enW/kmlDRL
         ptYVpXCM21z5Vf69bUscR/OyaF0Fa2HkKx3eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728675; x=1738333475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbrNnHdKC0/LFwGAR0T6w8via2cDaA74ls46mFyUi1c=;
        b=HdrslniUjrTM0to62N2UjQA5g7MR/jGLFcf2SfGXtQRhRzrSehal/EdAQD1U6Rp9+O
         eWsCyMZ2ZJXaIxbKrNhafEBSi5Syfap4S4ifyv7Ut+KmBz5CNQkMF/ijNSgvAIXselH+
         iLefoJGIWcxQN7HBnTnHplrD9kDchPUCAcECrJW4wf2VvLxx0F5zd+y9fv+pu2LsHJLd
         Lg8Cax1Ql8Ssy4IaxzhdBtHfVo/tEAAaKnElMWMkZyH7J/SAlUuybMWngfgfF8yFXEKt
         n3FGn2xVdCb25LloS7yuM+T0WwIQaQwRuIgUqY6oSxUYL3N6NtVNZS8NTU/tEmUWNv0f
         O14Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHA0djTwG6RbrdNANAvUur0mns9v5qpobzblvKsjgAe6j+whz3s93uSlq+b13PeYiyBqIS3V11vh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIGFBiavbwhsMxhK7o0ju9IvzHr3ua0Y9FvCDamnW8qoKSJ5DH
	CfGMb6Al1RtyAbVidqGBP1/PsVvLXPnNTWe0DL128WylIWPSK7IsJNTY6AiCl/4=
X-Gm-Gg: ASbGncs+pGQQxj9uYCsLl9cjxKIJ4JOOnmjA75wJ0/kBPMg5I5ZKCqLDoSuVaKzmWXw
	RcQ+L0eB3pA4Mm00Dpw3NAtvt2E8CBMEe4Rm4Z5U+BUB8WNBK0pgsYkqVCgPEbQ5vK6f3RTbsIE
	QT/FoCSXYwwmZ7p+4WfKfSObSHxN6Yvl+WFBW/vaKLXn3wbN9aDcwELm9GRlXEO1V2bYBBMrtel
	XjH/3Jb6ikOF2O0+wRuTZumkfe/86912wbWnMd4ZYmXVQD2mIxxgH8kaIrdC+HrT4ViYVkfd4L7
	j8qi+4XtYV6lKZBWPi4w8oSRvsPTsn1QBZPv9cSbSPqG
X-Google-Smtp-Source: AGHT+IEiDpRqlPWd9MM5v1ED+KckdXAM/s5MEZLMnKBj2It/usO39P2Ee7Ofdfdvxf45laUAAClW1g==
X-Received: by 2002:a05:600c:524f:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-438913bed33mr235476295e9.1.1737728675558;
        Fri, 24 Jan 2025 06:24:35 -0800 (PST)
Message-ID: <3204bed4-4f03-405e-b77c-4355803f3a31@citrix.com>
Date: Fri, 24 Jan 2025 14:24:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2 0/5] x86/iommu: make CX16 mandatory for IOMMU
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250124120112.56678-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/01/2025 12:01 pm, Roger Pau Monne wrote:
> Hello,
>
> The following series is the original CX16 series sent by Teddy, with the
> CX16 checks split into a separate patch, plus one extra patch to switch
> AMD-Vi to use CMPXCHG16B when updating Interrupt Remapping Entries.
>
> Note that last patch to use CMPXCHG16B fixes a real bug with AMD
> hardware.
>
> Thanks, Roger.
>
> Roger Pau Monne (1):
>   iommu/amd: atomically update IRTE
>
> Teddy Astie (4):
>   x86/iommu: check for CMPXCHG16B when enabling IOMMU
>   iommu/vtd: remove non-CX16 logic from interrupt remapping
>   x86/iommu: remove non-CX16 logic from DMA remapping
>   iommu/vtd: cleanup MAP_SINGLE_DEVICE and related code

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC Oleksii.  Patch 5 is a real bugfix that needs backporting, and the
prior patches have been in an almost-ready state for more than a release
now.

~Andrew

