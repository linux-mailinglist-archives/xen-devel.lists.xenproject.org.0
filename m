Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2F986532
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804442.1215429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stVEZ-0008Gn-HR; Wed, 25 Sep 2024 16:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804442.1215429; Wed, 25 Sep 2024 16:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stVEZ-0008FI-Eb; Wed, 25 Sep 2024 16:51:23 +0000
Received: by outflank-mailman (input) for mailman id 804442;
 Wed, 25 Sep 2024 16:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stVEY-0008F8-5B
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:51:22 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64264b9d-7b5e-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 18:51:21 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso6740866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:51:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f8329sm232375566b.178.2024.09.25.09.51.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 09:51:19 -0700 (PDT)
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
X-Inumbo-ID: 64264b9d-7b5e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727283080; x=1727887880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPteRs17XTOuXNjup4sR4/qLJBvurtW71FUSx8AWy9c=;
        b=HkVDipIzdszZGMwuEpnunIsZo3gh70VyOOYrFOOKTV11kcXVyl65aCfBsktOBLj+TC
         G7iCf1c9WeUrAlDD+RYZAi1pxSWwBY4yeckLaKhc0o3wIBKjREsiS+9tfxgxPoQlN09T
         KHjDUWQw7X8lKbpJBvTr2KtInneH2N4Aa7VGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727283080; x=1727887880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPteRs17XTOuXNjup4sR4/qLJBvurtW71FUSx8AWy9c=;
        b=p5TcC+mSl+IfCot88MtAtLPs8/g+shyLALp+X1MBYUwIYMQ0LxbdMy45LrZ4o+j2BC
         eON/C9q8pTSWqSWA1mKXyvMimINEi/hg7Gw3ZSC6McpPZ0yjc5l3JaVBfXA2vHbKKLYL
         Uv4zoTsx4FY3fSl1uw2R/PthwTrGFJvYfJgqLls8fgmK5P0AVT5+QToSWlghPkKGtTCB
         4iNKCUSgMe3T0kcr1hM2IapaBwbQ9Fi+Hey87sF2UY15FE1Lmd5tmGtywr3rpULWDK0u
         CwdPstBf8+N805uXSD8sb9dJ+x+rMvaOOhC8zKwGyKR6cAlVN7TkssblsZucoBCOhbAh
         8isQ==
X-Gm-Message-State: AOJu0YyFy/1SWpPYpbA8YrN/SbsTNQhm0gPOSZJR2Q9BfUtedZZIR6+W
	bisZgXGse6EfAu/+mrwSHIlWtm3Mk1mhSHhdtvExSUwDhxLknnoI3UANCUSsP5WuCeorXOKOLVW
	C9ic=
X-Google-Smtp-Source: AGHT+IFJcFPjRMxFgeQadPpKU8BMh9AWo8AwI3iXJBtRWT+PpDB2bsavtahfXecvswRjvdC34rKv9A==
X-Received: by 2002:a17:906:730a:b0:a8d:e49:c530 with SMTP id a640c23a62f3a-a93a05eda5fmr353601866b.42.1727283079775;
        Wed, 25 Sep 2024 09:51:19 -0700 (PDT)
Message-ID: <bffb4569-af56-4ea0-92e3-a9259c48a58f@citrix.com>
Date: Wed, 25 Sep 2024 17:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: xen-devel@lists.xenproject.org
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-44-ardb+git@google.com>
 <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
 <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
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
In-Reply-To: <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 5:45 pm, Ard Biesheuvel wrote:
> On Wed, 25 Sept 2024 at 18:39, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> And we do have special calling conventions that aren't the regular
>> ones, so %rdi might actually be used elsewhere. For example,
>> __get_user_X and __put_user_X all have magical calling conventions:
>> they don't actually use %rdi, but part of the calling convention is
>> that the unused registers aren't modified.
>>
>> Of course, I'm not actually sure you can probe those and trigger this
>> issue, but it all makes me think it's broken.
>>
>> And it's entirely possible that I'm wrong for some reason, but this
>> just _looks_ very very wrong to me.
>>
>> I think you can do this with a "pushq mem" instead, and put the
>> relocation into the memory location.
>>
> I'll change this into
>
>   pushq arch_rethook_trampoline@GOTPCREL(%rip)
>
> which I had originally. I was trying to avoid the load from memory,
> but that obviously only works if the register is not live.

But does that work?  Won't that will push the 8 bytes from the start of
arch_rethook_trampoline, when what's wanted is simply the address of
arch_rethook_trampoline itself.

~Andrew

