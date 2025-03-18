Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECFA6744E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 13:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919042.1323588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWOR-0006vk-TU; Tue, 18 Mar 2025 12:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919042.1323588; Tue, 18 Mar 2025 12:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuWOR-0006rI-Pj; Tue, 18 Mar 2025 12:50:03 +0000
Received: by outflank-mailman (input) for mailman id 919042;
 Tue, 18 Mar 2025 12:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuWOQ-0006Tr-Rx
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 12:50:02 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804df199-03f7-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 13:49:59 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3703532f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 05:49:59 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b09sm18355260f8f.57.2025.03.18.05.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:49:58 -0700 (PDT)
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
X-Inumbo-ID: 804df199-03f7-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742302199; x=1742906999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=77qlMTpFH9efyykDCh26lXgviWVT8+TXn4EzPk6otMU=;
        b=WhCD+DOvsUU8AxUpdm068oAFBcRR5XYK5Nxfl8Vn1Zum97Jn1AlOQePud9SzOxWxOA
         MmPNxsEIKV/f4os7oRJbGJ6AKqWTUxVEXGuo6WCJB182qJaX1+7SJpheulW6egatraKo
         l7VfeDlOncGdLLcOtYwKql4mdpIuevCm757N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742302199; x=1742906999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77qlMTpFH9efyykDCh26lXgviWVT8+TXn4EzPk6otMU=;
        b=NvL4jkzdKEcBSeIXzOE94eAy5/RaT+Y375F9Jx8zHNZYOt1MmdFsOI/ds42vMb/Uo7
         f8UHa0OMdAdq8Gc6Eun9QPVQVaj560R66gojSYRaGWzequu07J/Mo32+a7qjjM5v26qT
         lmNT4NnRwriXEsEJO7WY9fYpHF7vTCOun/dKoaDDmNKvY32oiF2TPtj49O4s/DX6RevG
         SEwwAetHkg491G0kw1QQtNfBzB3vRyplYt8jBMO8QY+481uzTTYva6mDddSJBlphhMYT
         lSgR/ZJR6u7y0VIyWALhfUHDmIh0MtJwb/in9YVDhrq0N8XbAizUltVh21dbu9z+14vW
         7M8A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+H81heMpFmrUh6Wu8CS7+MA+N5WtJyZx6sSeQvk06a3oy8yC2s3pjkFQbvJITAQB4Xr9HTk/lcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySNb2oMulVlOQR8Nt77H7IZYrxnBLAUPcwZ78Qv5mjkJNEy7Uh
	Z+vtNS4rLOuJPEBC4WCezQS9YwckkXfRZlJkFCBDzMwu/ETSwLtm7h1VA33AWnQ=
X-Gm-Gg: ASbGncsWAd2xlwv4Hr6Cuf6tGTPmmNqwUefp4T0yMQBGu8QX9Zp8sh7jYXHYnPavpCc
	diHVcN5o80InwtPvNioLc5vDXqTvOsLHZKAg1vCjQqHhkBAF95sBtdmV72cw9EbXjBcRbRLkxkI
	XVsy6HqdmON/0XpQkaR/BpU/Y3o4gXL6AeCoEiYo3jhxs3BjdmuAv+zG+/ZwMNgo8+UeDO57jmH
	AISa68Jg5dI/8dZJnHjzSruic7CVOUWF0L3p8vGKoALRFbwi/zUVZIA7FImibzk17rgfrWocsdP
	by+1nf+oBdSCcyiTyXNRuAVWCwxlvEBMp/xO8gUuUK74ONFAKyUjjxO6HnR8XlZX9Q3a4v1Ndqw
	hQ8JxwRzG
X-Google-Smtp-Source: AGHT+IFjMUib/3TosJRHFufizNfj6egYA/Gh0g3tB8+0TNbuDD0GI0ccozS62tNw/zWfHboWlkTL0Q==
X-Received: by 2002:a5d:6da6:0:b0:391:10c5:d1ab with SMTP id ffacd0b85a97d-3971d13383bmr17158371f8f.5.1742302198812;
        Tue, 18 Mar 2025 05:49:58 -0700 (PDT)
Message-ID: <9525c542-4e19-4dee-a29f-05fd42297663@citrix.com>
Date: Tue, 18 Mar 2025 12:49:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/wait: prevent duplicated assembly labels
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-2-roger.pau@citrix.com>
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
In-Reply-To: <20250318091904.52903-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> When enabling UBSAN with clang, the following error is triggered during the
> build:
>
> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>       |         ^
> <inline asm>:1:121: note: instantiated into assembly here
>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>       |                                                                                                                                ^
> common/wait.c:154:9: error: symbol '.L_skip' is already defined
>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>       |         ^
> <inline asm>:1:159: note: instantiated into assembly here
>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>       |                                                                                                                                                                      ^
> 2 errors generated.
>
> The inline assembly block in __prepare_to_wait() is duplicated, thus
> leading to multiple definitions of the otherwise unique labels inside the
> assembly block.  GCC extended-asm documentation notes the possibility of
> duplicating asm blocks:
>
>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
>> your assembly code when optimizing. This can lead to unexpected duplicate
>> symbol errors during compilation if your asm code defines symbols or
>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
> Workaround the issue by latching esp to a local variable, this prevents
> clang duplicating the inline asm blocks.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

