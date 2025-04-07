Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65259A7D94B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939470.1339591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ibJ-0008A0-6N; Mon, 07 Apr 2025 09:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939470.1339591; Mon, 07 Apr 2025 09:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ibJ-00088U-3Y; Mon, 07 Apr 2025 09:17:05 +0000
Received: by outflank-mailman (input) for mailman id 939470;
 Mon, 07 Apr 2025 09:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1ibH-00087q-Jw
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:17:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d9b3d7-1391-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:17:02 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso26782005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 02:17:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b8161sm11632032f8f.50.2025.04.07.02.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:17:01 -0700 (PDT)
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
X-Inumbo-ID: 10d9b3d7-1391-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744017422; x=1744622222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M0zgClBelkDo/CuOY6YuLrBLty0Oi7g35/gnvO7XDjE=;
        b=WCAjR+fTjI7MQA2qE5HpgfYjPIo8wITHVouYKkPwT4bZjQ8BVijeF2Ld6gQT4TlYLR
         NdX+oFZOcEQRV693LJ9Ypk9wjb1JwtErKuUmRrf2fYB/lP9Eg9yeJ7vkefVDH4lgZ8AF
         Fz+mmU/H3NEBf5ROtE/9bFLFtiziQEuzW3JPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017422; x=1744622222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0zgClBelkDo/CuOY6YuLrBLty0Oi7g35/gnvO7XDjE=;
        b=NyMV5U21i+kBP7/aA/J8v4Z12KVa3rzNj5q3GpGyM5x2AZVRZlofux1LT8Nr+ywN0G
         nQE+apuQFvyw+OvO2F3NHsDyUhnhq+8Z4SvMkryg709ujVAVyn0glB1R0/6pSppxaarp
         AJfm8zBfsLehYwFEPJg6eXxwp0OQlR+m5Gmqv0tAIW8RLhJGpacMCbmLVh9iPYz9AqyG
         RArdzpN21lx9ftW48Ghz1PRZiEZdwWGXLgLZ226iSwOijnOyCR6Ue72FnEzeS4PLVdys
         +gDDY3XPTtDl+vjxh2EhRj9N848tNAIdme9IyAf8AcxGJwrSvoQaoD7DrmHr+g6HGvBh
         o6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+253SCjn3twaA36tQpiScYR0S6rfc5uNLpJCcFOzS4vdi7zWcJ/RkkXTlYE/hU3emGomNLbwa/WU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx064965IPLvsw7mN4rhPJAt02v5GHniHYEcWcXqAeLLCX5jeDC
	TB8kfsLF99U6WUIBenawAU2N91JTFBXdMmNpE46WR8VasbhX5iSaE9SwOCYUM6k=
X-Gm-Gg: ASbGncuYmWU7+10tgEHrc/iEqGcs6YrfOV4eBmKTmZl5RAFAtLcSSQywJ3cydI6BLmr
	wOr389izPtAgxnIanYlYtwDXq1/Fxc9eutgztwkqD4Co+gzIllLaE/Wj+gOPhRoF3KVuHS4Xq2F
	Y4z8lM0gVkzvZ8JMkoOGcmohI63LyfWYTbMSzpq7+u2SqYCo2P/PhtX+ELvr0dytm3K76/Abz1I
	FkTGC1fedUjaCXJTVvTzeWKREjPPf0fDZ1gbVEjiywYflcfVHsFyYfRoelF8qTFGbMx0NcpzfpX
	8golWKaJDnzhgzwxOJibCTBzaJoJyHZoWkvhhkm43qhloZtog3DM2ZlXv52sQ4ujwsy7pZiXVd4
	7AwZysejs2A==
X-Google-Smtp-Source: AGHT+IFwOy1g9yIfu6d/+L4ZGCIujP53oxxtFgNv+3d24UXIcQWlCBxY/SWfZjyQEU55hsY2D3muiA==
X-Received: by 2002:a5d:648a:0:b0:39c:1efc:b02 with SMTP id ffacd0b85a97d-39cb35a8952mr10263160f8f.28.1744017421653;
        Mon, 07 Apr 2025 02:17:01 -0700 (PDT)
Message-ID: <c34b4537-9563-452c-869f-a412749ebfad@citrix.com>
Date: Mon, 7 Apr 2025 10:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/emulate: Remove HAVE_AS_RDRAND and HAVE_AS_RDSEED
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
References: <20250405012417.3108759-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250405012417.3108759-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/04/2025 2:25 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The new toolchain baseline knows the rdrand/rdseed instructions,
> no need to carry the workaround in the code.

A few minor notes.  Instructions in CAPITALS please to make them easier
to parse in context.  The comma ought to be a semi-colon.

You should note that arch_get_random() is adjusted too.

Also, it's useful to state "No functional change." to help reviewers. 
(Or to help archaeologies figure out the intent of the patch if they
subsequently find a bug in it.)

> diff --git a/xen/arch/x86/include/asm/random.h b/xen/arch/x86/include/asm/random.h
> index 9e1fe0bc1d..e1c1c765e1 100644
> --- a/xen/arch/x86/include/asm/random.h
> +++ b/xen/arch/x86/include/asm/random.h
> @@ -8,7 +8,7 @@ static inline unsigned int arch_get_random(void)
>      unsigned int val = 0;
>  
>      if ( cpu_has(&current_cpu_data, X86_FEATURE_RDRAND) )
> -        asm volatile ( ".byte 0x0f,0xc7,0xf0" : "+a" (val) );
> +        asm volatile ( "rdrand %0" : "=a" (val) );

This was only tied to "a" because 0xf0 is the ModRM byte.  Now that we
can use the mnemonic, it can become "=r".

I've fixed all on commit.

~Andrew

