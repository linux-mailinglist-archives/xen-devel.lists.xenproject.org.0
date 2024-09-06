Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905896FB7C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 20:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792003.1202058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sme22-0002qe-O3; Fri, 06 Sep 2024 18:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792003.1202058; Fri, 06 Sep 2024 18:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sme22-0002nV-LK; Fri, 06 Sep 2024 18:50:06 +0000
Received: by outflank-mailman (input) for mailman id 792003;
 Fri, 06 Sep 2024 18:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sme21-0002d3-CS
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 18:50:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3da1ce7-6c80-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 20:50:04 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso2792100a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 11:50:03 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbaeddsm310204466b.3.2024.09.06.11.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 11:50:02 -0700 (PDT)
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
X-Inumbo-ID: d3da1ce7-6c80-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725648603; x=1726253403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+NYp6Zb2TsVJ40LYC450Irz+8pJudapRzU7rAaeV/4o=;
        b=FMDFEoAnIOZ0bsnYS7FGhJwBWHNDSfy2/8bXESgpv5loQYAzgP+wYc5maa3tDt9DzK
         NZjVajWn6z8jonkrBiL2amwoUW9vq4ni0BXr9pSUCNcznLsVU5nX3fwk7JDkhLJUvDP0
         apMc5Mqb3psb2sa/Pjc9cI66qcv03etxFh9us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725648603; x=1726253403;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NYp6Zb2TsVJ40LYC450Irz+8pJudapRzU7rAaeV/4o=;
        b=eGm2Qiyt5jEECPXd6qROhduyOpyyclV7wrzN6KowDuY4SqE9CAvQCHa0XN7SLrESF2
         Vz26mtoUFm2c06rH+PPSn88G0klFMtjXJFB7TFrZWTqu2OwUwxbIMBE0xNkgEma1tqi/
         jEmnBVyS378McX7hVhJAH7HzHzabf6yBwIKDbQVgLAAWBzCI3D3p35wywrj+TG3Lm34E
         t/ErY7+juqhYac6VNUuVmaZBa0O3/5NGGeAtKNisIz1SzayF0kVCiV0ElebtFrEw5sZr
         pyN07Rld8yZ+aYwEbRwPAlvWgMl9c1Ae6dJf4bTw+grBTNFJHcX0RZ+xmIe9ePwtFC45
         UsdQ==
X-Gm-Message-State: AOJu0YzrBN97rDuInZEge/M4WDmVeTgJFlQJrZDiYNEi5MDwFNNZg059
	5oAbi8MPQwJAw6vcDrhWvfiSm3721kL4GFYprMPT2H0eY7XsyYpt2NUwN0xctIo=
X-Google-Smtp-Source: AGHT+IEHyXnl1psES/VeM+eIbc9zvXtOhafRFgL6KS5hvkSIjljwmb7r5PDh5RuElJSv/xg0DgNZkw==
X-Received: by 2002:a17:907:781:b0:a86:a56d:c4eb with SMTP id a640c23a62f3a-a8a888d057bmr321226966b.61.1725648603000;
        Fri, 06 Sep 2024 11:50:03 -0700 (PDT)
Message-ID: <925994e3-b865-4355-8751-4976d4ccbf79@citrix.com>
Date: Fri, 6 Sep 2024 19:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] xen/bitops: Implement hweight32() in terms of
 hweightl()
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
 <20240904225530.3888315-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2409051605330.53815@ubuntu-linux-20-04-desktop>
 <34f1a11d-f0b7-45d8-92e6-fcb40e3c87d2@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <34f1a11d-f0b7-45d8-92e6-fcb40e3c87d2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/09/2024 1:27 am, Andrew Cooper wrote:
> On 06/09/2024 12:08 am, Stefano Stabellini wrote:
>> On Wed, 4 Sep 2024, Andrew Cooper wrote:
>>> ... and drop generic_hweight32().
>>>
>>> As noted previously, the only two users of hweight32() are in __init paths.
>>>
>>> The int-optimised form of generic_hweight() is only two instructions shorter
>>> than the long-optimised form, and even then only on architectures which lack
>>> fast multiplication, so there's no point providing an int-optimised form.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> The patch is OK:
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Thanks.
>
>> I was looking at docs/misra/C-language-toolchain.rst to make sure
>> everything is listed there. We have attr_const as "__const__" noted
>> among "Non-standard tokens".
>>
>> Looks like we need to add __always_inline__ ?
> Luckily, no.
>
> First, the __const__ referred to there is GCC's alternative spelling of
> the regular C 'const' keyword, and not the function attribute by the
> same name.
>
> But, non-standard tokens are about things which survive full
> preprocessing and are still not standard C.  In this case, it's the
> __attribute__ that matters, not what's in it, and this is why we don't
> have a hundreds of rows in that table for __attribute__((foo, bar, baz)).
>
> That said, I think f96e2f64576cdbb147391c7cb399d393385719a9 probably
> should have removed the entire row including __const__ seeing as AFAICT
> the last user in Xen was dropped in 1aa3c54a31a5 in 2008

Hmm.  Eclair disagrees.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7765315981

Now I'm completely confused as to why __const__ matters and everything
else inside an __attribute__(()) apparently doesn't.

CC-ing some folk.  Any ideas?

~Andrew

