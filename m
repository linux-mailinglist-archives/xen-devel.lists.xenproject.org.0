Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F36AE8080
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024720.1400550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNsC-0005cT-QI; Wed, 25 Jun 2025 11:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024720.1400550; Wed, 25 Jun 2025 11:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNsC-0005an-Nj; Wed, 25 Jun 2025 11:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1024720;
 Wed, 25 Jun 2025 11:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUNsA-0005ZV-K0
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:00:58 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab723f13-51b3-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 13:00:56 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3859038f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 04:00:56 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538234be76sm16426865e9.15.2025.06.25.04.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 04:00:55 -0700 (PDT)
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
X-Inumbo-ID: ab723f13-51b3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750849256; x=1751454056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KHjmbeTQ4LZd39yfwiq79TAb+cG4TDHCyRzJj6/H7AU=;
        b=ePcYagZGM6SQVvCCijuIm4Ah/QGhEZy7/VaeNLvrakek2Q9hbGqyF4Cm4TcXB58Wqe
         oBUvzVRik6NX41JUjko8v476MnPmonMLS5m662SYK6u6Y25c/kY/kXUePmxSlWZfbjLF
         Tbh5JVh/AmupZxU8qi2f0NuTjpF2vwMYYwAzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849256; x=1751454056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHjmbeTQ4LZd39yfwiq79TAb+cG4TDHCyRzJj6/H7AU=;
        b=DftaG1p6AHN4ePiNbP/YlUWA6B77zQVV+Wqn0up9Htk/+RneS7FwTodSqKKLo5oYLq
         XCWFUXx/8ETX/rOt104EUZJcj1NnhxjISgPRsrLz4y5DfbLAAGp5M6Z6CUPEIG+CQ4rk
         Lz/U7duWQ1IxhCWWp2QrB5qChk/rmA5bN4yqpGAVJt0ULI15PDWtRrgl1wLNpxzzdpk9
         1Y6HspI2nnFGuNYf8F1OmJnL9cXkdLpwIzP54I5wCdI6HBprn+hQyz5Xs3+uUV6ZKmpk
         qM+LLCksJ60Gm15g5Vs/PU9ZOeqLcyxAWBMfriuovG7/3WNqGOV/6GzifejdBNRqWGhn
         /1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm7cnKF2CD4BXazXLGWJlAJ5HTY2qpIJ7Z0DmdnU7Tf/xTtVT2O0bRazbhzrjnTnbAbm9POTvOpVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZPzQUBuslB/TLfyOX7Qt44LH/oo6izFTfTSYISZGLKKsd5Hpe
	RZIp7Jbzkvth8hqP5+wE68VTT1EpQcNVYt+n+fllgrlEc1ch8uUMJV//Jcq+5gf+dWc=
X-Gm-Gg: ASbGncsSnXazviDsBhS78u5Tf6SeknhDeBIuXibtgseqJXo7oy6lSvfzGvk8DZbh21S
	hbAPUvn3PRaKe4HASIa1xbGSXd6W5YrH79lZmCODFBgoAOgj4K1chjwkLnFx8orArCOwsdX0Zbe
	haSchj3bsLLZXaFFCM4Szkd1YHjra39J2YWVJZ0Zii3el9p95ARDZZUEqf2K2YZ8UJkNcUh+cEi
	1O3gJX2nmBi+K0HcKPslQvhhCCXaA5+zv2tQxRKdVTA1ZCpMnP6WSTxTxGUO/mIBYJ3uxY0jY7D
	MhN6y8jwe77eEh1qXMgvHMlEfZXf7dbyjvJwEod30ffDN3Q4MSBATuVMki9S63XQspUdSWXA8Dj
	+r+rV3kKuuO3oP5unXgR6JwHRl64=
X-Google-Smtp-Source: AGHT+IFVcrcvwp6B88oqlTRbS/IZ/Cf8MJRZZd8G7i9fXhYVPhmjoD9PkBI0lvJXzPjA9GGvYcAhqg==
X-Received: by 2002:a05:6000:2881:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a6ed60dee6mr2069241f8f.21.1750849255825;
        Wed, 25 Jun 2025 04:00:55 -0700 (PDT)
Message-ID: <e00501ca-f6a3-4762-a047-1a0d781d5c7e@citrix.com>
Date: Wed, 25 Jun 2025 12:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/idle: Remove MFENCEs for CLFLUSH_MONITOR
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-3-andrew.cooper3@citrix.com>
 <f1cc4292-73b9-40f6-9974-3a2260c00d87@suse.com>
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
In-Reply-To: <f1cc4292-73b9-40f6-9974-3a2260c00d87@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/06/2025 10:25 am, Jan Beulich wrote:
> On 24.06.2025 18:39, Andrew Cooper wrote:
>> Commit 48d32458bcd4 ("x86, idle: add barriers to CLFLUSH workaround") was
>> inherited from Linux and added MFENCEs around the AAI65 errata fix.
>>
>> The SDM now states:
>>
>>   Executions of the CLFLUSH instruction are ordered with respect to each
>>   other and with respect to writes, locked read-modify-write instructions,
>>   and fence instructions[1].
>>
>> with footnote 1 reading:
>>
>>   Earlier versions of this manual specified that executions of the CLFLUSH
>>   instruction were ordered only by the MFENCE instruction.  All processors
>>   implementing the CLFLUSH instruction also order it relative to the other
>>   operations enumerated above.
>>
>> I.e. the MFENCEs came about because of an incorrect statement in the SDM.
> And their exact placement even differed between the two sites.
>
>> The Spec Update (no longer available on Intel's website) simply says "issue a
>> CLFLUSH", with no mention of MFENCEs.
>>
>> As this erratum is specific to Intel, it's fine to remove the the MFENCEs; AMD
>> CPUs of a similar vintage do port otherwise-unordered CLFLUSHs.
> Nit: DYM "sport"? I think the corresponding Linux commit that I once looked
> at has it that way.

Oops, yes I did.

>
>> Move the feature bit into the BUG range (rather than FEATURE), and move the
>> workaround into monitor() itself.
>>
>> The erratum check itself must use setup_force_cpu_cap().  It needs activating
>> if any CPU needs it, not if all of them need it.
>>
>> Fixes: 48d32458bcd4 ("x86, idle: add barriers to CLFLUSH workaround")
>> Fixes: 96d1b237ae9b ("x86/Intel: work around Xeon 7400 series erratum AAI65")
>> Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

