Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C296DFF1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 18:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791296.1201174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFUS-0000SU-AT; Thu, 05 Sep 2024 16:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791296.1201174; Thu, 05 Sep 2024 16:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFUS-0000R8-6f; Thu, 05 Sep 2024 16:37:48 +0000
Received: by outflank-mailman (input) for mailman id 791296;
 Thu, 05 Sep 2024 16:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smFUQ-0000R0-8N
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 16:37:46 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad30bb2-6ba5-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 18:37:40 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c3d8d3ebbdso693733a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 09:37:40 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a51bbsm1474649a12.88.2024.09.05.09.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 09:37:39 -0700 (PDT)
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
X-Inumbo-ID: 2ad30bb2-6ba5-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725554260; x=1726159060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+DmjpUwU1BJ5idiyMTIui/ZfQk/GM7hGlyOvtsRknLY=;
        b=B6+SibWfO6d9o4dgOv4U1Uf86+oNwh3Dt3I/xRx3d6YNS2KGLuIyr2G6sojcMtjmi5
         JZ1GdsPs9vgn3xgcPa9pxMcQ1QG++8DpS4NPLJz1EvoaApzsQ8MMePglMXefhRGVzUyY
         3qt3Y7d0qWoStR3Jtr4ZWsWPEno1mBvmWOMqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554260; x=1726159060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DmjpUwU1BJ5idiyMTIui/ZfQk/GM7hGlyOvtsRknLY=;
        b=nLu8go1tJ2D4sEymK6Ytx0obf20fXfJGq2wKPePAsi9f1xE3dK6CjMjnh60OoE5Wob
         rvpz0/KsnOxKH88m/Ex1zuTqLni+QugcMzWPpoWudfFfC00mxVQ5j/1LZqmKOq9rI3Ro
         6MkZy0ey/aX6RRJr/ZorRtVKnemk9gN6yTkJael1yIWiLMEQWnpPlMgM2RO54LFelWfL
         xqTIXRkw1OH62vl+H0TWSyOWnrasLVIrudMV2HbvwYQBWpFanjE27XhuugFHwJQ3i4Tt
         gTz+KAQ+kfbf1UmD8VrEAv/HTvDmCn5xG1YsrO+WFx7lSdU4BHooOfJHw0VKBAQMDQQZ
         8wTA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0F5jd9Is3fJd/26M3vazNueJnahbjwHfJ46OKbAkL2/9nKFYSfCwZbYfDDpPHnsgIKGBi52lVmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxh4NptkubiUGmz3VZFSZtRLH5pX/rGTxY0poPa1L+MPHBiisXG
	asNVAN4Cb+oIBTE6JkHN/E/w5ttRw1FVsY3F3z0DVGYxPG/ZG2OTvC+MoYeQ5VU=
X-Google-Smtp-Source: AGHT+IGFFg7Urkf6iCgCdNOWRBgPnlGl/B4bMKW619iv/gTvWi87lAcYGKnr/Y5nNTiYkthcsR/9eA==
X-Received: by 2002:a05:6402:3549:b0:5c2:5f31:8888 with SMTP id 4fb4d7f45d1cf-5c3c1f9cbd4mr6544675a12.15.1725554259662;
        Thu, 05 Sep 2024 09:37:39 -0700 (PDT)
Message-ID: <125586e4-ec9e-46b6-9c01-c1142b0f00e2@citrix.com>
Date: Thu, 5 Sep 2024 17:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/trampoline: Collect other scattered trampoline
 symbols
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-4-andrew.cooper3@citrix.com>
 <092700d9-101b-4bac-a500-7f03bd471d89@suse.com>
 <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
 <CACHz=Zh9jdcUfR9dFqUcx1V+DVED14gnasy53TjGy5bk4a4jdQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=Zh9jdcUfR9dFqUcx1V+DVED14gnasy53TjGy5bk4a4jdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/09/2024 5:34 pm, Frediano Ziglio wrote:
> On Thu, Sep 5, 2024 at 5:10 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>
>     On 05/09/2024 4:42 pm, Jan Beulich wrote:
>     > On 05.09.2024 15:06, Andrew Cooper wrote:
>     >> --- a/xen/arch/x86/efi/efi-boot.h
>     >> +++ b/xen/arch/x86/efi/efi-boot.h
>     >> @@ -102,9 +102,6 @@ static void __init
>     efi_arch_relocate_image(unsigned long delta)
>     >>      }
>     >>  }
>     >> 
>     >> -extern const s32 __trampoline_rel_start[],
>     __trampoline_rel_stop[];
>     >> -extern const s32 __trampoline_seg_start[],
>     __trampoline_seg_stop[];
>     > I'd prefer if these stayed here, leaving the 4 symbols as
>     minimally exposed as
>     > possible. Recall that efi-boot.h isn't really a header in that
>     sense, but
>     > rather a .c file. Elsewhere we keep decls in .c files when
>     they're used in just
>     > one CU.
>
>     See Frediano's RFC series, which needs to change this in order to move
>     the 32bit relocation logic from asm to C.
>
> Not strictly necessary, I can declare in the C file as they were
> declared in efi-boot.h (which is more a .c file as an header as Jan said).
> I think the idea of declaring into a source file is that if another
> file wants to use it has to declare it again, so a bit more friction.
> But any access to trampoline variables should be considered as
> something to limit in any case, so having in a separate header helps
> (this does not mean that removing from the header is still increasing
> the friction).
>
> Personally, I'm not strong about the 2 options here. Slightly prefer
> having all variable declared in a single header.

Declaring the same symbol in multiple places is a hard MISRA failure now.

Hence why I was trying to clean this up to simplify your patches.

~Andrew

