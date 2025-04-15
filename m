Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9626EA89F0B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953909.1348299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4g3t-0004bv-U8; Tue, 15 Apr 2025 13:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953909.1348299; Tue, 15 Apr 2025 13:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4g3t-0004ZD-Qa; Tue, 15 Apr 2025 13:10:49 +0000
Received: by outflank-mailman (input) for mailman id 953909;
 Tue, 15 Apr 2025 13:10:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWT/=XB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4g3s-0004Z7-KS
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:10:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b3e751b-19fb-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 15:10:46 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso27777835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:10:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43ce0asm14260805f8f.70.2025.04.15.06.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 06:10:45 -0700 (PDT)
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
X-Inumbo-ID: 0b3e751b-19fb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744722646; x=1745327446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jrF1SgrU7NO9DLAVzPzl65G+IMzhYeK0lQpRH9r4w+s=;
        b=nfY+mOTCoL3dfBk4+nSmhAYL5BOqERINAZBsOf0kJqfVODUh5RXCyNim0AnQvNU9DO
         OAibQkjB/Vi8LszPRnsn2RjHXZoH/h/mJHfy88axbiKF9TPNqEcjCraWko0J5PFF6sb5
         FWe2rlVErg9JJ8ONfyYX2HJwHp6GgRi5oWo0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722646; x=1745327446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrF1SgrU7NO9DLAVzPzl65G+IMzhYeK0lQpRH9r4w+s=;
        b=RJt9hzCUEyJK0wyBtE345xrufr4XM1li2yeqhMkyuq1PNAV1snAPqzyD7me2n7rB3f
         Br1ETdrzW3HxurkgNzMqHBM13NlW+6gmNbi684ZUSTE1MuZW+dHajhOixIUGEBeJTomN
         nNtPxpi4hKMzVhBHrz5k9gRaQrjP8aHfEcyWkTazq7XoGIwTGAC2hWv+5ebGHpoiS1t4
         h/3R/7KwxYqKhWwj3Trdqwog+QDgHZRwbA6HxeVRZupWPeYq1sTjNFJSoMn9iOcF+hDH
         WjzXnIBzmEyLU+FZLjfLuLjmHjfRrrq0TYZyBYcfc5SD6a8ZzxRtSmoKFMqu4ABe7hV6
         GKcg==
X-Forwarded-Encrypted: i=1; AJvYcCXQQOGwqu/5ji9nsyhAA1gSIoEZoyQhyeTNqeSy+H4iWdurSxoAoRJwdR3fw0TSc2TYMb4I5BZwAQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNMr1XPV0x9UIENf/AY8RK0UvaxylJG6+fjSWJd62YGi1GikVF
	Qz0h3uF0gsOf7wowJmGhjC8Pz4xzz4Ztk+dYXicYgO8n3c/Fo59dl+mGhwpwAAY=
X-Gm-Gg: ASbGncv24Us4cElaAurZ4V2uCffLq9vDUaLahGlZFV9255MaJj/KQMEQyLIRebgwbD/
	fDNuwcO1CBDbve914q2TTJEI1aXmL7/Uvmo6IXWqCDMRCPLCLmokJEprBdAkEqGfpSNlhfGE46C
	al3e0kXZe5YPldFE64LJ/FxyyiN3H8zehU4zXRPLG7IQKoN20J+bcWuGbQnTuqX/KonYhuE5WZk
	sFKJOyvB422a94c96AFcrv6vU9TzyLR8Fv0lH9x157xeSS3wDQAgBryUOtpsVCuWACEhjvgtKxy
	NEd1aYcrMhMgFqD1rw8Oa6JyujC17UMw6i8iAsu2HoPo1t/fNCZtkIhn/DYekrl+t/f/HA0IKi2
	D83iCxA==
X-Google-Smtp-Source: AGHT+IHOxPop5nErwl5Bhz/A8XO3wpDcZG/9u9PSqeByuk3jSS69wt49CwaE0rvm+wVTAwzNUnYjGA==
X-Received: by 2002:a05:600c:4e09:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43f3a9b035fmr175404995e9.30.1744722645951;
        Tue, 15 Apr 2025 06:10:45 -0700 (PDT)
Message-ID: <2bdfe772-1229-4214-9391-b5ba66c499e6@citrix.com>
Date: Tue, 15 Apr 2025 14:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Fix UBSAN in hvm_emulate_insn_fetch
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Tim Deegan <tim@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech>
 <9211cbe0-3674-41d5-8862-c819ada37140@suse.com>
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
In-Reply-To: <9211cbe0-3674-41d5-8862-c819ada37140@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2025 2:00 pm, Jan Beulich wrote:
> On 15.04.2025 14:49, Teddy Astie wrote:
>> UBSAN complains when trying memcpy with a NULL pointer even if it's going to
>> copy zero bytes (which are the only cases where a NULL pointer is used).
> If this really was a problem, I think we'd need to go through and find all
> instances. However, ...
>
>> Fix this by only doing the memcpy if the pointer is non-NULL.
>>
>> (XEN) ================================================================================
>> (XEN) UBSAN: Undefined behaviour in arch/x86/mm/shadow/hvm.c:168:5
>> (XEN) null pointer passed as argument 1, declared with nonnull attribute
> ... it can only be the compiler who has added the nonnull attribute; we
> use it only in very few (other) places.
>
> Personally I find it absurd to forbid NULL here when the size is zero. Yet
> I agree that the spec can be interpreted this way.

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3322.pdf

This is being proposed for fixing in C2Y, because lots of people think
it's absurd.

However, until we can raise our -std, I think we're stuck with the
current behaviour.

GCC-15 introduces the nonnull_if_nonzero attribute specifically for
memcpy() etc, but I don't see how we could make use of it in this case.

~Andrew

