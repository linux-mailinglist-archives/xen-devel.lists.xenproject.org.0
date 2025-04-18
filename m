Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA427A935F8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 12:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958857.1351442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5itF-0008QD-1E; Fri, 18 Apr 2025 10:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958857.1351442; Fri, 18 Apr 2025 10:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5itE-0008Ol-Ur; Fri, 18 Apr 2025 10:24:08 +0000
Received: by outflank-mailman (input) for mailman id 958857;
 Fri, 18 Apr 2025 10:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNZq=XE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5itD-0008Oc-Kf
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 10:24:07 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41fe4eaa-1c3f-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 12:24:06 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso12476965e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 03:24:06 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420683sm2349158f8f.20.2025.04.18.03.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 03:24:05 -0700 (PDT)
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
X-Inumbo-ID: 41fe4eaa-1c3f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744971846; x=1745576646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJmTDwCr1kPva4b5vrqnHN2+KW5Z+MMvffJ+VbT6Gqg=;
        b=m6OcD76Cc7bpwzj7wccqu89y0uPDmbObnIHP/7/0w5TVkCKpU77Xkd0i/pzkAoS3TK
         CITz2xCQ4LiEPauiUarjJn2f2Be7ERlnagJ5xcuz3bW8jXeQti07JZaPGwz4S3teDDVq
         1PXb/9+2OZ5+tmqkI/2XFyZ+qxKJxKu53sRGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971846; x=1745576646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJmTDwCr1kPva4b5vrqnHN2+KW5Z+MMvffJ+VbT6Gqg=;
        b=lBLuhbvktW8oRqK1lxUo+pVSMwZhRY398gj9/jRIC1bn8BA4ZKtxvsJpCIYPuFgmEF
         IVLt+Pt76HxrUa+lFd0A0kKyU5Zq0NaorwKyHbSM0fqEOfKLe9gc4fMNxdMO89N2W0Xp
         KFmQvVur+vq0mZard7cFDMsHGpiIF1AqrLSwQihi6cB2kKl5w0xmsKZrJmKJpvAbeAsm
         i03fdGBfzjljZ19ylusmmnLcEwBBRgnZky1/1aJmM17XYboHK5MikFJkHQvq403ttkfX
         yY+VK13n9h9bivnFV8VHRxWjeRgQQA545bAi2YpVQhcgw/kNOq++T7N8p3ExHxNJyq/r
         u5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp53KFvmhsxwN24p+fFx7sWubTODxHKXu/nVaQvwrgPRmnex7aTM5xL8HqgoJ8DonFPJgE7jBI2xg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiMcG3UEP2fe/QnJyFABYRwCQvgVK0rENFpadEvx6bELHAJRm0
	B9acRxDsBNtp1dCtV1JcX3r74bPhg4VTXjS34PxH2Z9mu49x1DQUvfIQw1E/3qk=
X-Gm-Gg: ASbGncurl4RrIoQhW2eqBAuAe9rPUFAdo49ijdEpHp/F6zgzOojAYbjv6JsznTrRyo5
	lldcA0KWfbL64esJjFjMIqkOqWcMjV7w9lbKnLW5PS04RpRyRq6KaVvfbl9dM+BbX3CajWl9tOQ
	LcXkZtxiEIexyCe57mhjipLqNLYoVQKpWcfFvjekEQbs3zrcpASulFijeaS5vrvJVaSXJ+k1YFA
	CzIFA/jOPmnjXjXiGKyVSi0V8nMe7+rkEw4SYo8vOe3mC12zGsQYpb1XcWNJYB3araMJbmS696G
	6FRDQmHGaHUeCFSJ3GtdyNO6JngAX52W6cpJtZoax11jWRExBb9oyUSP0nz/kg8Bucdt++iYGSa
	/Szt/Eg==
X-Google-Smtp-Source: AGHT+IHVvlOW/PQKztqdeuYLzZIIyWPEnxfP7TS8Tghjk3gRsyw5XUF1KlSks6byhbOqrb7JpJRwGA==
X-Received: by 2002:a05:6000:40de:b0:39e:e438:8e32 with SMTP id ffacd0b85a97d-39efbb09208mr1538497f8f.55.1744971845933;
        Fri, 18 Apr 2025 03:24:05 -0700 (PDT)
Message-ID: <50bf962c-2c9e-46a2-bbac-cba9cf229e79@citrix.com>
Date: Fri, 18 Apr 2025 11:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -tip v2 1/2] x86/boot: Remove semicolon from "rep"
 prefixes
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
 linux-video@atrey.karlin.mff.cuni.cz, xen-devel@lists.xenproject.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Martin Mares <mj@ucw.cz>
References: <20250418071437.4144391-1-ubizjak@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250418071437.4144391-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2025 8:13 am, Uros Bizjak wrote:
> diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
> index f2e96905b3fe..0641c8c46aee 100644
> --- a/arch/x86/boot/video.c
> +++ b/arch/x86/boot/video.c
> @@ -292,7 +292,7 @@ static void restore_screen(void)
>  			     "shrw %%cx ; "
>  			     "jnc 1f ; "
>  			     "stosw \n\t"
> -			     "1: rep;stosl ; "
> +			     "1: rep stosl ; "
>  			     "popw %%es"

Doesn't this one still need a separator between STOSL and POPW ?

~Andrew

