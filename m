Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA84A7DA2C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939563.1339611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1j45-0007tP-Lv; Mon, 07 Apr 2025 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939563.1339611; Mon, 07 Apr 2025 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1j45-0007rY-JF; Mon, 07 Apr 2025 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 939563;
 Mon, 07 Apr 2025 09:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1j44-0007rS-Bf
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:46:48 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38929def-1395-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:46:47 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so26941955e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 02:46:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b6321sm11331147f8f.44.2025.04.07.02.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:46:46 -0700 (PDT)
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
X-Inumbo-ID: 38929def-1395-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744019206; x=1744624006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9Rxj8na687ZMGEjQTgq/EUZvBfnVbV270+SZC0D7a8=;
        b=LxcbI1nV3MpMIRDGUoaBZhZV7PdwmU4DhlLwV8YqcOYMxiovksqc3mMGpPxW4dquGJ
         3YTXTkrLpgBezcS4tO9Usu0KNOJ/rEqKDzZhod0zl57lWvMKU0IzUaSAlr8HWxPtQqD6
         F8Ak8micPbk2Bc/Yy3wyOU1HGrZsbORnme11E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019206; x=1744624006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9Rxj8na687ZMGEjQTgq/EUZvBfnVbV270+SZC0D7a8=;
        b=OZQi5O1Y6x6BN48m0fhZWbgqhndZJ2MYfylE52Wwhj/b3uojQo3AJYVrwwLRHZY1PT
         K6hon+4msFn3bI9iQ3sOm0XcUVE04LYv9nuSpghqnqZ2VnReyJm8wlv+fp+bmfAaNzj5
         W+mrs3k9DQBwvvzeKWx+oVYjIZK5lG1TtYpca8KHoPorSvr92HxeGYvBlEQf7cLfqJd8
         LYyzww3sj7cZj6jhcBpcKKXyXLPYeyu2Ba7kbSj4gE8WZFo+6W2plmYTazq1qJ4A5h/6
         nEPRzVMDqqb32cHALP5oz5CVe54na2kq1W97+eDfKxFPUESZ6gNPVMdchpVGiiIF1ELl
         FTyw==
X-Forwarded-Encrypted: i=1; AJvYcCUucx17THu9joVzaYch9L5kd2VawOQH8yE1CoXv7fWwjHi+sKTq8/F8hzzhhOCB0wsXp6IAP8SxsKA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd+sxDAIgyi3cL2Vgq5ViNr+gP47qSVj2qSWy1NUkYA6BBcal9
	9QGj61kLmL/Bm1N0kkdu1aSOsXo6UfoBAE1VeJeS/63L3JDsZOjGci4irYyDj+Q=
X-Gm-Gg: ASbGnctCrueyss4l8zhy4Ft95vG692ydwIoP+t0ZFMn+oPmNwc4sYch/QQEKOaK+X0j
	YuecWMzRve2bfGDR4c3jiLGQ26FSSr8/nsnJT7HZc/7Q+RPHfUKvlNP5iGw0Dqcrd/LwcJLVchG
	lcCAHM4dqFgduBREIfMgMu9EXhf671pbhiGm3rbSzeLIu6Hm4ocUJ2f+I901/rdeLJNIfeaSh6k
	qCHcqqwK888pQlVH74uNAAlhCM7fnFEbYfumet/PJ9fql7G+qa2lNhSVsZAcG1topQbaqXB6XXP
	B3qfS18DzYFaXK1J9UuBGrMUdjMQjRz9VJgEU3nSA2fwrXILOYKNLJRE1bfohCxe3Th+4J4tpeA
	Z+TtVNxf+cg==
X-Google-Smtp-Source: AGHT+IH6FI+ujPPGPgRhSMAYv1BnHRf7r4ncmYXBW16PC/OWv3ux2Q4dRRS8YuqnBcE4MHECztajcA==
X-Received: by 2002:a05:6000:4304:b0:39c:12ce:1052 with SMTP id ffacd0b85a97d-39d07bcd00dmr9287646f8f.7.1744019206403;
        Mon, 07 Apr 2025 02:46:46 -0700 (PDT)
Message-ID: <059fb994-e5e1-43e2-98ee-d7ae44137892@citrix.com>
Date: Mon, 7 Apr 2025 10:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vmx: Rework VMX wrappers using `asm goto()`
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
References: <20250405012729.3109108-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250405012729.3109108-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/04/2025 2:27 am, dmkhn@proton.me wrote:
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index affb3a8bd6..6aa6e1f212 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -294,28 +294,30 @@ extern uint8_t posted_intr_vector;
>  
>  static always_inline void __vmptrld(u64 addr)
>  {
> -    asm volatile ( "vmptrld %0\n\t"
> -                   /* CF==1 or ZF==1 --> BUG() */
> -                   UNLIKELY_START(be, vmptrld)
> -                   _ASM_BUGFRAME_TEXT(0)
> -                   UNLIKELY_END_SECTION
> -                   :
> -                   : "m" (addr),
> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
> -                   : "memory" );
> +    asm goto ( "vmptrld %[addr]\n\t"
> +               "jbe %l[vmfail]\n"

This should be without \n too, as it's the last line of assembly.

I've fixed on commit.

~Andrew

