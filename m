Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8C7F36B1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 20:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638126.994464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WBc-0000N5-8B; Tue, 21 Nov 2023 19:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638126.994464; Tue, 21 Nov 2023 19:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WBc-0000KG-4M; Tue, 21 Nov 2023 19:13:28 +0000
Received: by outflank-mailman (input) for mailman id 638126;
 Tue, 21 Nov 2023 19:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qy+O=HC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5WBa-0008MZ-Pn
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 19:13:26 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b45e939-88a2-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 20:13:25 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-332cb136335so1377087f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 11:13:25 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d5606000000b00331698cb263sm15006251wrv.103.2023.11.21.11.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 11:13:24 -0800 (PST)
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
X-Inumbo-ID: 0b45e939-88a2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700594004; x=1701198804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wdBK/yKj4juET0RPtiec9VCTl11eiJJ4fOM2MiDm6EM=;
        b=Z3WayP6Im4x0xc+AqH6OsrHifplPtiUqhTmzAu3+bsL7GprsWumvN5dp+QNVXDwUJb
         gp5lTifb24m9IHLfo4/wwnv1yEv8aBEg/z9hf8KbTHE9R4nAiWEmN4j5FfUvDIZYncvf
         dnRqVD9Fb+pP9YiYRpqFuL613pVTqh2FQZyCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700594004; x=1701198804;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdBK/yKj4juET0RPtiec9VCTl11eiJJ4fOM2MiDm6EM=;
        b=YGwek4OokJ5KmmfOGQ/bBV0eXqD8I7fmAGxSRbryAnoTkxW0ScZ9TgBHP3a75faKH/
         3rSVtNx/gnoYixjlxi3ylJPFtVNnuEzhQjp/Ix8I8ZJ6SZhm2P0VJ5HPeBExKIzW202r
         58nUQo0idQUpStpAAZXSzxNB+muJnAfTsQTLE65v8ojznennJ6clG7WlN7SKSNIIPTPb
         1nsBHK+QO/PJ7630v9uySwYuNkTxJU33oyOnquCLLGbzf+4vrwfKwblF4q4rmBdqxuM8
         ysFbBXxDD/jE7D2DuE0UA9gHPY+dOki4n/JiAV8x+Yrb76RR56obrm4l/YVmrGinO0Gg
         CitQ==
X-Gm-Message-State: AOJu0YyRGogo9M5tcwE8NAnpdb1GzMcMWVva6pM592OR1DpOQns1ZGj1
	JSDE4tF9JPBepz6LNOP2r/4HcQ==
X-Google-Smtp-Source: AGHT+IEiM7ivlqmc2cxX1byxeDPf04hZ1PCqlQld9C8QAlRLpKbAU5HvtXyo0kWzvBkXyndAap6JlQ==
X-Received: by 2002:a5d:570e:0:b0:32f:7ae6:64a7 with SMTP id a14-20020a5d570e000000b0032f7ae664a7mr7766716wrv.55.1700594004654;
        Tue, 21 Nov 2023 11:13:24 -0800 (PST)
Message-ID: <679b8fde-1d58-4ae2-8b22-3f9c50ff8f1a@citrix.com>
Date: Tue, 21 Nov 2023 19:13:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/efi: Make efi-boot.h compile with -Wwrite-strings
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-4-andrew.cooper3@citrix.com>
 <a17c5268-fcb8-49bc-af68-a6df2227d48b@suse.com>
 <c9ce3570-c4ea-4f0d-b8ec-9a74d2c0e569@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <c9ce3570-c4ea-4f0d-b8ec-9a74d2c0e569@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 6:03 pm, Andrew Cooper wrote:
> On 21/11/2023 8:40 am, Jan Beulich wrote:
>> On 20.11.2023 23:49, Andrew Cooper wrote:
>>> GCC complains:
>>>
>>>   In file included from arch/arm/efi/boot.c:700:
>>>   arch/arm/efi/efi-boot.h: In function 'efi_arch_handle_cmdline':
>>>   arch/arm/efi/efi-boot.h:482:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>>>     482 |         name.s = "xen";
>>>         |                ^
>>>
>>> There's no easy option.  .rodata is really read-only, so the fact Xen doesn't
>>> crash means these strings aren't written to.
>> And the consuming sites confirm this being the case. Hence ...
>>
>>> Lie to the compiler using a union.
>> ... to at least slightly limit the lying, how about ...
>>
>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -479,7 +479,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>>>          w2s(&name);
>>>      }
>>>      else
>>> -        name.s = "xen";
>>> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
>>>  
>>>      prop_len = 0;
>>>      prop_len += snprintf(buf + prop_len,
>> ... you also switch to using name.cs down below here and ...
>>
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -324,7 +324,8 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>>>          w2s(&name);
>>>      }
>>>      else
>>> -        name.s = "xen";
>>> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
>>> +
>>>      place_string(&mbi.cmdline, name.s);
>> ... here?
>>
>> An alternative would be to introduce 'char xen[4] = "xen";' in both
>> cases, and use them instead of plain string literals.
> They'd have to be static, or dynamically allocated or they'll end up out
> of scope, wont they?
>
> I have to admit I find this logic very hard to follow.
>
> Furthermore, I note:
>
> mbi.boot_loader_name = (long)"EFI";
>
> which is exactly the kind of pointer which is liable to end up being
> edited via kextra in the other patch.

Hang on.  place_string()'ing here is just to prepend a piece of data we
go to other lengths to strip and ignore later in boot.

On x86 we can just delete it and make our lives simpler.  I hope the
same is true on ARM too.

~Andrew

