Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36109B2649A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 13:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081563.1441636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umWQk-0002Iv-Ic; Thu, 14 Aug 2025 11:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081563.1441636; Thu, 14 Aug 2025 11:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umWQk-0002GB-Fb; Thu, 14 Aug 2025 11:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1081563;
 Thu, 14 Aug 2025 11:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umWQj-0002G5-W7
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 11:47:37 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7857a802-7904-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 13:47:35 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b9e4148134so429447f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 04:47:35 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1e136360sm13134705e9.18.2025.08.14.04.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:47:34 -0700 (PDT)
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
X-Inumbo-ID: 7857a802-7904-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755172055; x=1755776855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+f9tXg7H1qzx8Ilmc0xwtAxjorjAgtLlxWylr4WEBPw=;
        b=aduLg6hDqUpy5OeObcpmPz+JnIBkrhflmwUDxjw49T6IayKzrP9nM39GhltJqzYQqY
         igdQZMg4w2l+0pcvzRJI3uaU7M3Zh58hjG8wn8z38Q2ownlOk3jD8xISmy+uCVTklscX
         CR25pU05yq3LLNtqPy1MmKgVCQLY4vkRATEqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755172055; x=1755776855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f9tXg7H1qzx8Ilmc0xwtAxjorjAgtLlxWylr4WEBPw=;
        b=Nv8jFywK794+osEzSbiZcHGWoATc0bXPGBPPqeAWrPQcNO9p2QYapzwwvP0LxDKMve
         YbIofd2uQereG61RBkg3SscL4b79dOn5AjKd1bQreL8iwKn8GzO2kb1QghQazfKUgCd7
         Zo/GXVZwznQw6lyd81q2s2tzyl3Iaww0BiZES5EmpRQQVVFxCWZob4hq+/hpyvKUtpN+
         kswgCaBOond6eYAozDe5pagpjS0dUbRZfvl5ZBqTAMg+feWYCz4by0XaiFMDW82CNR6x
         C+a82Jv9n4h4386RwLF6IGInefxjOMLoEfCnUNyBO53wnEKrOO/2KEQr7+4XtysukZ6A
         tAdw==
X-Forwarded-Encrypted: i=1; AJvYcCUqsVrMbv/+0fEH8odynePWFMfgUDaTLEhfkPpfz6RH61s/lZCaHbi7RaLX7UAAg8GgUNCpb133Eh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIicrBCZzklTJb4pRwrMqxHtU5gB6WPHflsw+NsKTXLuQ4F9be
	tpk0vKlutNgK6BARX5ZgMErgFj55E2WEUAdNy7TbHbCkPYPZ6VmQnoWfL8VPPmqerg0uAU2kUbr
	7kEXU
X-Gm-Gg: ASbGncsRxlfzSWI/JVk1Rl5PzFErFlDnPZ5eTYU/lpRnprK7w+VVihFxcJjLFQOsqYR
	26entlHW5JauPMxbWOdIyzPDMjUOkgmqwaRJv04bw6sVKxWR3xshCA/ZJ4U9CP4FpnqMpEJVHph
	Ytek3QVOQXR8xfJsw1oG6OtNzxKA8MGX0sdIk7Cu1M3YXX2aRXUIzB1KMcxJPQQAxVv8koMDXr3
	FOSs2OEP06gcFOOkXh+AffkoJaZQOrLvLTkj/e9wxKSx/r1JrUHA0dR93KHkWT1vth3ROiluYLi
	gxH16jJEZZkjVVEeW4cRxbmFxf/n1P3tTPwvfFOU0Fp8N8YVTKfemROSdwjMAcFAdLGDoqQ4lKI
	u/hwG4M/vXdbnr65UDxUOF/n22lwtfBKxyFdHivdbfLPJ7ag9plG+xK4I501xQTyrZMB3
X-Google-Smtp-Source: AGHT+IF2XXmxM2Nbs9acOb2YUgNhYhL55efhewdMiUJoY4aCHI/kPqunPxJ9mXj5ullTTG+rBoNxzQ==
X-Received: by 2002:a05:6000:2505:b0:3b7:89c2:463c with SMTP id ffacd0b85a97d-3b9fc32e30cmr2556658f8f.29.1755172054949;
        Thu, 14 Aug 2025 04:47:34 -0700 (PDT)
Message-ID: <b058cb18-7a03-403d-b0c4-402fc0353da2@citrix.com>
Date: Thu, 14 Aug 2025 12:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
 <c7e82bee-1b38-41e1-89c6-d1d3717087b2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c7e82bee-1b38-41e1-89c6-d1d3717087b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 12:44 pm, Jan Beulich wrote:
> On 14.08.2025 13:42, Andrew Cooper wrote:
>> On 14/08/2025 12:20 pm, Jan Beulich wrote:
>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>>> @@ -75,6 +75,7 @@
>>>>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>>>>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
>>>>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
>>>> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event Delivery */
>>> ... a UL suffix added here for Misra.
>> I was surprised, but Eclair is entirely fine with this.
> And there is a use of the identifier in a monitored C file?

Yes.  traps-setup.c which definitely has not been added to an exclusion
list.

~Andrew

