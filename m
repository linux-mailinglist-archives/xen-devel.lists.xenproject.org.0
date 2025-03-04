Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F9A4E3F9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 16:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901257.1309232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpURU-0000tM-Gd; Tue, 04 Mar 2025 15:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901257.1309232; Tue, 04 Mar 2025 15:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpURU-0000ql-DZ; Tue, 04 Mar 2025 15:44:24 +0000
Received: by outflank-mailman (input) for mailman id 901257;
 Tue, 04 Mar 2025 15:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Z5M=VX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpURT-0000qf-RU
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 15:44:23 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1dbe44-f90f-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 16:44:22 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390f69e71c8so2501988f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 07:44:22 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm228270285e9.30.2025.03.04.07.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 07:44:21 -0800 (PST)
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
X-Inumbo-ID: 8b1dbe44-f90f-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741103062; x=1741707862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PPLMKOwR+IRRPQjCdtYAy3QmdgiWtVRQpFvKd83aDXo=;
        b=RuZP0MWhxVgD/0dsAQEdejIvHcw/R4wxgsO+Una4MaDmhZrOshrbks6di4G56Pc5y0
         eNl1LZf+sqtAXBZwgYb3t3Rffv7T84GhRRiFCdrZXnCCbfNHJJ/vs9s8mHFG7Te6N4sJ
         cloZqd23o2AWJhT8cMlVzC+bilJoAByBfsRMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103062; x=1741707862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPLMKOwR+IRRPQjCdtYAy3QmdgiWtVRQpFvKd83aDXo=;
        b=PgMKmRM+AQNDRwNImc0wQwWmpwql2dDStpVIfN/j7GYzsQG5Coymu31xuuW8oAsK7S
         USzYR/ZDenwnkhZ4AbMJSOzuzNb2jm4S/RtLP56RAdjvy5mVbETnFV/gZ6tTTgHi46S8
         4x4nayJC6kzObWWs5ZFlHXmXf3lVtN5OnCcXIbisy7u5LxtPil5WYUN2X5/tXhXTVfAK
         8ng/m5XTwF1V2/mOtLhLke19WH7Luy3+5OiTrchaZyTG2CEa31svatXrIhyK8QMu2AyR
         VKzLDFUEZRA4PbNSZ4l32us3jo2XLx0KkEYhgFdO/tHQtuJYhAQSp4gytO0RNbObv7EI
         jeLw==
X-Gm-Message-State: AOJu0YxMFNlXjj3ZpTxT8Ml2d7ruzQsiJXaZ+0wvPBTW0mDMqTkw5aHj
	NtjGfUsDHBlf80PI0zxgs/MrZfE7igj1dT+YT3zEa/sG481CSMd9Q1XOQX0gtM0=
X-Gm-Gg: ASbGnct/6AZpUS/amLcQyiCgR1lQgOPe63rC7H/3XTjvuEYuOud1OdoxqoAOj1rPgyC
	twEwk/PZn9wRKnzx++w4d1AMsKacXbJdCNSiDTUMs81WKWvW4eMUx+H60yZHCZdypgiy+Oz5Z0h
	zXmWR7KUJKmjyYA7Fqg/vDRNN/Tl/YOkLpwk+Ti9mAJqGwepEF/up4Z50WOPK2XNE70VGt3Iuy1
	byP+rEzz3jY2a7KcdioEM+h2QciUAxNMG8qHfU8ux8kimC9OuWuPMWRIg+OCx3nQ5Lo1ujS5WQP
	sz5JIVEeMIqhIMc6hb5Vkw+gCXHtybNAiL+xeqnX5ITauYgQNKzHuVdRK6qQUVq0UPBhnUnYaBL
	coQRF7lAH
X-Google-Smtp-Source: AGHT+IHWibDy5BZd6Fd62HKEhYGhsWDRRZFHTSl3ZaLcwOC0hnyA8/EfTCMiazyQKNMrsn8lpTEMiw==
X-Received: by 2002:a5d:64ab:0:b0:391:952:c74a with SMTP id ffacd0b85a97d-391155ffd95mr2653481f8f.8.1741103062029;
        Tue, 04 Mar 2025 07:44:22 -0800 (PST)
Message-ID: <cadff23e-1da9-4929-93f9-3102f3eb1857@citrix.com>
Date: Tue, 4 Mar 2025 15:44:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Milan Djokic <Milan.Djokic@rt-rk.com>
References: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
 <ffdc90de-1407-4b9c-aaae-78d41dc79c86@citrix.com>
 <CAKp59VEmM4OOkU+WTOCTR=4gmw1gTQSv-zfHs1fc0WoOO847xw@mail.gmail.com>
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
In-Reply-To: <CAKp59VEmM4OOkU+WTOCTR=4gmw1gTQSv-zfHs1fc0WoOO847xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/03/2025 11:59 am, Milan Đokić wrote:
> Hello Andrew,
> On Fri, Feb 28, 2025 at 4:47 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 28/02/2025 2:59 pm, Milan Djokic wrote:
>>> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>>>
>>> This patch implements copy_to_guest/copy_from_guest functions for RISC-V.
>>> These functions are designed to facilitate data exchange between guest and hypervisor.
>>>
>>> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
>>> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>>> ---
>>> Tested on qemu with xcp-ng latest branch https://gitlab.com/xen-project/people/olkur/xen/-/merge_requests/6
>>> Full description on how to setup test environment can be found in attached PR link (Linux kernel patching to support copy_from_guest/copy_to_guest for RISC-V).
>>> Linux kernel patch shall be upstreamed after these changes are merged.
>> Several things.  First, it's probably worth setting you up with Gitlab
>> access, seeing as that's the first step of RISC-V CI.
>>
> We already have access to mirror gitlab repo owned by Oleksii where
> our changes are tested through CI jobs
> Or you refer to mainstream xen gitlab? For this one, I don't know who
> should we contact for access

I wanted to check that you were running your patches through regular CI,
but if you can use Oleksii's tree then that's fine.

>
>> Second, where can I read about the semantics of h{l,s}v?  That looks
>> alarmingly like a virtual address, and there's a world supply of corner
>> cases that can come with it, including incorrect translations.
>>
>> Also, I very desperately want RISC-V (and PPC) not to inherit
>> 2-decade-old x86-ISMs which we're currently trying to remove, because
>> starting without them is 10x easier than to fix them after the fact.
>>
> hlv/hsv are part of the RISC-V ISA H extension
> (https://five-embeddev.com/riscv-priv-isa-manual/Priv-v1.12/hypervisor.html,
> Chapter 5.3 Hypervisor Instructions).
> Handling of corner cases with possible incorrect translations will be
> part of the upcoming patch version.

Ok, that's interesting.  Thanks for sharing.

There are separate instructions for data and instruction accesses, which
avoids the main source of incorrect translations.  I don't see anything
requiring accesses to be coherent with the TLB (ARM for example permits
the AT instruction to bypass the TLBs).

However, they're all virtual address based.  The first wrinkle here is
already realised in the documentation; the mode of the access is based
on hstatus.spvp.

The reason we're getting rid of virtual addressed based accesses is that
there is not an appropriate mode to use for hypervisor access in a
binary permissions system (supervisor/user), and it fails completely in
the presence of SMEP/SMAP (x86) or PXN/PAN (ARM).

The introduction to 5.5 Two-Stage Translation suggests we can turn off
guest virtual translations by zeroing vsatp which I suspect means we can
"turn" HLV/HSV into guest-physical accessors.

~Andrew

