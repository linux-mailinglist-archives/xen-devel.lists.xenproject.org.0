Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3E84CD63
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677720.1054506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjL0-0006Kc-6a; Wed, 07 Feb 2024 14:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677720.1054506; Wed, 07 Feb 2024 14:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjL0-0006IB-3s; Wed, 07 Feb 2024 14:55:46 +0000
Received: by outflank-mailman (input) for mailman id 677720;
 Wed, 07 Feb 2024 14:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Cu=JQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXjKy-0006I5-D8
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:55:44 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e77c34-c5c8-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:55:42 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso772845a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:55:42 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056402028d00b0055f0f643ebcsm736027edv.96.2024.02.07.06.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:55:41 -0800 (PST)
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
X-Inumbo-ID: f6e77c34-c5c8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707317742; x=1707922542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wyz1rxYbBZ1o2WqAlufUy4smq3954bcszzF/VIZfdY=;
        b=aTvMiktYAy4UFByperYXsByvpLsxRoSd/9z4v2gseSBlIFKjBwC7X9LzZTZ8QAd9Iw
         iRVzh1UGpnzUQlapr3EY5aQGLJOeruP1QOdr154i04PNIsMcNPxEGr1nfyLbww9ilmgm
         bU19vFd8J8nUXQiYefa3rhlrJI9neagEqLdck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317742; x=1707922542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wyz1rxYbBZ1o2WqAlufUy4smq3954bcszzF/VIZfdY=;
        b=Rilr48409V8GCDZl6hqozXmv8yQM0xTb/btu2jT1y9Hts9SDvAUkSXfI3CUs+/+f3Y
         g27W8Dby0nocALMYbR4JUJt5d8UTuMfI5EOvHU3F88XGFvP27j5l+PoU2EW7H0q1jArx
         gGl63nTUKZQpLsXU8qVTlX2qiRq509ocfja0JAh0d6FSFOGva3d7WL3xbvykYn4z7SlK
         0bTxYmSnLy3B9Tg9xE91T4ClhlfDc1rO0zkqVh4p1XWeaN+pDw8Xpcb8Ko+F9gXuNgiM
         LeigjOjtZ8ykdL/BA6Y0henKafEd1cx0zcry8LzOJVZ30weBWdUodMeUUe9lXIwPIj/E
         CFaA==
X-Forwarded-Encrypted: i=1; AJvYcCWgQUQNpbSuR9An1VdUqLF+1jm7SD+v5H9LFLGvDJojKNBoOUjQ7IrjIRgeE8aHgDSNbhPesb7LgCB2Xwx80TNqSkU5sunoJOr4SJg9eko=
X-Gm-Message-State: AOJu0Yw523Y5Kw/qpsB0nfg/Voe/jP8ctosfCAGFl9Dbxqu0AIhWrOed
	QingoPADjCrSWwHWqVuhWFxCkuiOJ9AU4y/iWdWVkz2I+HQDHfDo6BVJCyh8xQ8=
X-Google-Smtp-Source: AGHT+IGgofH1Xx70r3l/kEpFu5CWzsN5HDcVrc3w7ERdv+MVLZA8vsU6DGDTqR1RA466QQDYT/bqgg==
X-Received: by 2002:aa7:d758:0:b0:55f:e9ce:7406 with SMTP id a24-20020aa7d758000000b0055fe9ce7406mr3732972eds.29.1707317741774;
        Wed, 07 Feb 2024 06:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU36Fkbno04ai0yCnpjbdxgeGkYkABer0nOo26oOJaK9CAfiRqN0dVDI82NvaG24iok0n28auGkWgU8S94o3UlWrsQSPkyT9nV7kXE0+AA=
Message-ID: <f1f74e69-8892-4615-8411-f7a1329dd76c@citrix.com>
Date: Wed, 7 Feb 2024 14:55:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | f4519ee8
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
 <115f10ac-a115-40d1-a444-50e960320557@suse.com>
 <65665f86-cbfc-4352-9d81-67ac0b21b161@citrix.com>
 <CAKoJhMROFw1w679U9xsW6s4p34Zzm6-gaHihUHtU1w5ZH9ViUQ@mail.gmail.com>
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
In-Reply-To: <CAKoJhMROFw1w679U9xsW6s4p34Zzm6-gaHihUHtU1w5ZH9ViUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/02/2024 2:34 pm, Anthony PERARD wrote:
> On Wed, Feb 7, 2024 at 2:24 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> Stage: test
>>>> Name: qemu-smoke-riscv64-gcc
>>> I have to admit that I can't connect what was pushed recently to this job
>>> failing.
>> The qemu smoke tests for riscv and ppc intermittently fail on the
>> OSSTest-lab infrastructure in Gitlab.
>>
>> We've never got to the bottom of it.
> It's maybe because joubertin* and nocera* have more than one NUMA
> nodes. It's look like 2 for nocera* and 4 for joubertin*.
> Would that be enough of of an explanation about those tests taking a
> bit longer than expected?

That feels a bit like a blind guess.

What hardware are these?  They're rather old, I seem to recall?

~Andrew

