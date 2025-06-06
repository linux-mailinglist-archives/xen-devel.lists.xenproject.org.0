Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADADAD0464
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 17:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008623.1387872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNYZZ-0000ub-Lk; Fri, 06 Jun 2025 15:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008623.1387872; Fri, 06 Jun 2025 15:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNYZZ-0000s3-I9; Fri, 06 Jun 2025 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1008623;
 Fri, 06 Jun 2025 15:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xc=YV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uNYZY-0000rx-O3
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 15:01:32 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 218b9694-42e7-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 17:01:31 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso2559795e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 08:01:31 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45213709670sm26906945e9.25.2025.06.06.08.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 08:01:16 -0700 (PDT)
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
X-Inumbo-ID: 218b9694-42e7-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749222091; x=1749826891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+nHSm0VmCP01wzN9C94Ehkh0QkA9bkuYeAVcGZ4qWLM=;
        b=SgxnddYzkKBSb+I/coQjOO7MHos9wDjbSoihN/YVjCDaBebB1UVFgnmJOT5145ZMQj
         b6Ey4+9S9cVVN0vXVZ+pff+Nz4uL37C2NxeZnQiRvR/h6kkTUQZ/g5NtRk/BjL5jOxE1
         6HFm5dAAkZUmPVqkConQPRoVrheTaHZpoeIYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222091; x=1749826891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nHSm0VmCP01wzN9C94Ehkh0QkA9bkuYeAVcGZ4qWLM=;
        b=M26go2u4ePCfKZJNa1liu2XAKkS4nj6fAKZ9eX3AFdAldbqXjHcfy7BgbpKFy+tMl8
         Aj9CH0M6YBh4xFUqg8JwttdVc+fHSv1KeD7hFpe3bbrQZnWktY/sOFGCQ3+2D+5lYPS3
         9GNcaaH/y4hCeA3YcOE7+oG7JRfjO7h1rymABxLLLxhLVh2Fy5jQKsMPDFgituETona7
         1zOW3dfmOhc73wW7MrDD2e/ueTZ2xXR+ZbIHaJ5U4SKjjZy0M5zmZjFq/DaQ4SPIGw6h
         uP6l5DnaTncr3Ub5pFbnE3/tyQ+zLs0DCvWM8zaHUEOxfYwpN5popBwcGJGL3WEgwr31
         fxpw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHmeWMU3v62DCSXJF9Glb+Rs3IAK3QW3lVU9BfbJoHofpz6SCUObn6nMBDVAIDJLQ/C3DxbxIP/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzITelZ8n1xpLf/U7VxMewGYLIy+r5D2uGHuIuXq2Qvp2CA1XG8
	S0pJO387kpAFVJER6Z7dnaIvOJ4uFiIohvi1BMCwTtceWA7v0Dr3MyeAHVOrMz8its4fPN/pVvy
	+1FGk
X-Gm-Gg: ASbGncvNhLZEJpnTI0IKjbQV0mLAViUn2KsK5Y4wdnrh4yuUiDfYf1YdkV/JQAhYYVu
	jGwnorXzrDz+StBEmlYg/UfUVDBJQUy05T2jXf7pv6rJamveyd9cYnER3Qh7cZD8kU6O8sQvfnj
	aDwQdpdr6TCjk4Y54irxBavtRa8mLE/lLFKoR0aE67cbFaKXR9ffXivHR6MJ0ftOdUpxOFN33Lf
	kxgGdaJUzYLA53HycdUPlFlZMRV7t/rUeACmQBke5EQV7VduV9eCxxdu3tO48ezDH6OVlPzBYJD
	8StuaoZl1nMwz3AYH+67z0R1sfrkQf+qVQ4uhuU4b5p8XA1wHdpgnS790SJS2lV/aCk7skIKDP8
	=
X-Google-Smtp-Source: AGHT+IGSN9XfLtAcfIHxSPt/jW3uzPjLx+u/8tbbeWI5ipmEnZGm5UGTTZEms0kKajAdHOR9L3153w==
X-Received: by 2002:a05:600c:83cf:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-45201391335mr40926935e9.11.1749222077174;
        Fri, 06 Jun 2025 08:01:17 -0700 (PDT)
Message-ID: <3f9c5a18-2ea1-4e2d-80a0-773abc3598ae@citrix.com>
Date: Fri, 6 Jun 2025 16:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
 <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/06/2025 8:22 am, Jan Beulich wrote:
> On 05.06.2025 19:01, Andrew Cooper wrote:
>> On 05/06/2025 2:24 pm, Jan Beulich wrote:
>>> On 05.06.2025 14:14, Andrew Cooper wrote:
>>>> On 05/06/2025 1:02 pm, Jan Beulich wrote:
>>>>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>>> This really is a property of being a PE32+ binary, and nothing to do
>>>> with EFI.
>>> Which still can be checked for without having this code path being taken
>>> for xen.gz, too: You could e.g. check for &efi > &_end. That's firmly an
>>> image property (yet I expect you're going to sigh about yet another hack).
>> It's all hacks, but no.
>>
>> I'm amazed MISRA hasn't spotted that we've got a global `struct efi
>> efi;` and a label named efi, creating an alias for the object with it
>> out of bounds in the compiled image.  But even then, it's based on
>> XEN_BUILD_EFI not XEN_BUILD_PE and does not distinguish the property
>> that matters.
> The use of XEN_BUILD_EFI in the linker script should have been switched
> to XEN_BUILD_PE when the split was introduced.

That doesn't build.  As I already explained, the stubs aren't split in a
way that allows that.
>> But the argument I'm going to make this this:  Why do you want a check,
>> even if you can find a correct one (and as said before, I cannot)?
>>
>> This function is run exactly once.  We've excluded "nothing given by the
>> toolchain", and excluded "what the toolchain gave us was not the
>> expected ELF note".  The only thing left (modulo toolchain bugs) is the
>> CodeView region, and if it's not a valid CodeView region then we've
>> wasted a handful of cycles.
> Two reasons: Having code which cannot possibly do anything useful isn't
> good. Misra calls the latest the body of the inner if() "unreachable code"
> and objects to the presence of such in a build.

It's not unreachable code, not even theoretically.

*If* there was a suitable check, I'd be using it, but everything you've
proposed has been buggy or doesn't even compile.

> And then, based on your reasoning above, why don't you also drop the
> #ifdef CONFIG_X86?

Because that's the one non-buggy way of excluding an impossible case.

x86 is the only architecture possibly linking with pep emulation, and
therefore the only architecture to possibly have a CodeView record.

~Andrew

