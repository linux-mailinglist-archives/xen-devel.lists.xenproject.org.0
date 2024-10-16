Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C89A06B5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819900.1233368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10yg-0001Te-5s; Wed, 16 Oct 2024 10:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819900.1233368; Wed, 16 Oct 2024 10:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10yg-0001Qk-3D; Wed, 16 Oct 2024 10:10:02 +0000
Received: by outflank-mailman (input) for mailman id 819900;
 Wed, 16 Oct 2024 10:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUxT=RM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t10ye-0001GK-BG
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:10:00 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cce4849c-8ba6-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 12:09:59 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99ea294480so372495966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:09:59 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b7da0sm1550756a12.95.2024.10.16.03.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:09:57 -0700 (PDT)
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
X-Inumbo-ID: cce4849c-8ba6-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729073399; x=1729678199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ua6jsL4wZ+IdHGJK3HhNlfX9fj77sUPbHcVmEJle7o=;
        b=c7tBZFe7yi4yBKGApJgq2qSVwWhnVGxKo+fZGvD6iS5BEd0c5Gidbzx2Jm0dccrsrq
         EyC7k+aPxcZ9yNxWD8OR7LkILccvgyV6gI8OtMgmInt1hoeXAh7f6t0F6eNQ214Zewes
         cfKa9aiyeDKbuOWxSMXOUaZFSw22hEY/ahkhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073399; x=1729678199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ua6jsL4wZ+IdHGJK3HhNlfX9fj77sUPbHcVmEJle7o=;
        b=Q2AeOeesQfcAtHbATxyXFHU5A9JzHfSdcL+1sNoCl570hWYN08XCJ3XiL/EE8jQe0x
         yhdW97h9CJS3rK2bJq6ACtArE0BuKNyCiAWU+HtYbF7Q3HUhcYxy+GPId7xgUz9C+Xki
         RPmLZMCtgggpvHYKRVwddIWITBvq4Al/rrqOFe0CsB6grl+KNIdGxRHPXhMkhBjZV1M4
         MwKipazeJIpVM0GezrYwC4hgPOzHYLmMCjt2qHSPrBzifL+k52gNRBky2k/iWHU9RYkg
         JBINKUsrmNFn4ZZ1lGKSpRsY1FvSWG8TgUsBcYb7+2CB+BUZ/6rM/Rz9rAubkTy1qNok
         w2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvTMMFkUkKb3pBlvpg6jfyWK268MhB68R7q8jD2A/WsH2TOu23xsUAUidUUxQuRBaA0B5QCGEAiBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza/y4i8kyG8zj41E49gsm7aeRI7+tfjZKW1gPJFGdwy++EFkp6
	l4xcjhWbtdrR0kgFhJqm3Bali6vke5kMMGty2G4wl41XzdF93lXVzgRKeCSX8lw=
X-Google-Smtp-Source: AGHT+IGw6Y9o5Hjpt9KqUmUuwatqPNNEklFAveng/tT79mTiFliODoKd2Nw9yVawFX96sJSgcJuHBw==
X-Received: by 2002:a05:6402:4142:b0:5c9:58d3:646b with SMTP id 4fb4d7f45d1cf-5c95ac62643mr19607090a12.29.1729073398556;
        Wed, 16 Oct 2024 03:09:58 -0700 (PDT)
Message-ID: <d7048875-b53e-4280-a6b7-853a90aa92ef@citrix.com>
Date: Wed, 16 Oct 2024 11:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
To: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
 <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
 <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
 <fce8372ee3bac4a0a3c6de58d7c7757df6e6d0a3.camel@gmail.com>
 <9ff389f6-874b-4bb1-8685-d1e0e2281c59@suse.com>
 <56f7ee95390a36202dafe9e0ba64531549b4c4eb.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
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
In-Reply-To: <56f7ee95390a36202dafe9e0ba64531549b4c4eb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/10/2024 8:50 am, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-10-15 at 14:32 +0200, Jan Beulich wrote:
>> On 15.10.2024 11:11, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-10-15 at 08:33 +0200, Jan Beulich wrote:
>>>> On 10.10.2024 17:30, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/setup.c
>>>>> +++ b/xen/arch/riscv/setup.c
>>>>> @@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long
>>>>> bootcpu_id,
>>>>>                            _end - _start, false) )
>>>>>          panic("Failed to add BOOTMOD_XEN\n");
>>>>>  
>>>>> +    BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_addr));
>>>> We generally aim at avoiding side effects in BUG_ON() (or
>>>> ASSERT()).
>>>> With
>>>>
>>>>     if (!boot_fdt_info(device_tree_flattened, dtb_addr))
>>>>         BUG();
>>>>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I can make the adjustment while committing, if desired.
>>> It would be great if these changes could be made during the commit.
>> I've committed it with the adjustment, 
> Thanks!
>
>> yet once again I wondered: Why not
>> panic()?
> It could be panic() here; there's no specific reason. I agree that
> using BUG() here isn't logically correct, as technically, a size of
> zero for the FDT isn't a bug but rather indicates that someone provided
> an incorrect FDT to Xen.
>
> I will use panic() in the future for such cases.
>
> It’s not always clear what should be used and where. Perhaps it would
> be helpful to add some explanation somewhere.

panic() gets you a single line diagnostic.  BUG() gets you a backtrace,
but no diagnostic information at all.

BUG() should be a last resort, because it requires someone to go digging
in the source code to even figure out what went wrong.  panic() (with a
good diagnostic message, e.g. "unexpected $foo in device tree") is far
more meaningful.

There are ways of getting a backtrace in combination with a panic(), if
the situation warrants it.

~Andrew

