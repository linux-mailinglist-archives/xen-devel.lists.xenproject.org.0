Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DEA5F75E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 15:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912310.1318606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjHp-0004bu-Lr; Thu, 13 Mar 2025 14:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912310.1318606; Thu, 13 Mar 2025 14:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjHp-0004aS-Id; Thu, 13 Mar 2025 14:11:49 +0000
Received: by outflank-mailman (input) for mailman id 912310;
 Thu, 13 Mar 2025 14:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsjHn-0004aM-Qs
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 14:11:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18987558-0015-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 15:11:45 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-394780e98easo679429f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 07:11:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975d1dsm2267209f8f.50.2025.03.13.07.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 07:11:44 -0700 (PDT)
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
X-Inumbo-ID: 18987558-0015-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741875105; x=1742479905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H+5RPWlLpGfgrzDi0c/skDzcg4uEt5HfQwp1QOIZpso=;
        b=FHeQwlzCpQE7Vi2JHBq3IXSIgldo0YK6ugwWPNIm/tmNEbKy95vrBYAvY/iPmRuzmz
         YtG4irvnuTMPmxsqaTf4JAhYYUawff0iF7cZZI6SgFwswiWco+VN8W5Ab6VeqxwH/hDb
         Qo5JG/K/uto6yjaPFlyUq44SlRT3Rk4ER3204=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875105; x=1742479905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+5RPWlLpGfgrzDi0c/skDzcg4uEt5HfQwp1QOIZpso=;
        b=F3q4YucI3Vawn9BNJ2l9u8mDNZ8KnslnlZCzg710wDvm9PlTavAbllXMBJP7W0FmnU
         JrOz4MSVcuuUNWyeKCCmBnqZsVFkOKZVkKfiqFxQCz81WstUaK/JvT7UglYX/3uMh8mp
         yDg/4SJVJc4q/QmTeF2MW0Cc6hUgBTs8j0ylc6s5JL5zcy4ZIWxBuAwcgv99yzL1xx0m
         hTGm44HZsA5KYbwTnTlyPDPbdC01mlGmoLaYPTpHJIHzIdoaOA20wDYhaL38ux3986GM
         hLPeKGxzmaPw8qKO3qDmB1yj5Cgg/7cNylU3v89sZUN5hxMa2oN/bveNrBArsYXv2qRh
         M7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYsDZ0g94Nqhzxzm2KRzLjwjX4x2ONmPUgha87wh/zeGhlGJSeqCaW1uzWYegn8RJOGA2sit/AE9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4kT+eXw7RdP+vD8h/0vXSVeNNOPBYVmkZ2g0i8JTL+5a6Qsuf
	SR8Z412Q9Z+Vys9Fd7g0iLjrI69mQY3nvS+6RMdqem1HHgJQNohqOeH3DbSRYek=
X-Gm-Gg: ASbGncs1Tp4nsI1CflHbtQK0NAEuuv51uT+YntC8YGkfTY53sm0thKfDhHMKBZ++rtw
	2cVrCRhikJY5nali+oi5Kt7IAtbE50RmH6AQac2aj0/EDxebD/xTwArfToOXwzTRmcJ1fPR+zaT
	KIWbgOvGGaWRYXFEZzj95txDqkooC0Tl7brXI97N3KMUL0V7q+ARlsy57AP4Ag0u8srVcNxaUZn
	HveKAi5S6Ws8Z8Xf9Y+hncpsa5n9RkcJfBK9BFA2IxIAmYbKujNmy21UWdjJCu0PGE/yhuGqD+/
	bjwFwpW8W5gr/mDfICLXvZlVAXmfXQ+i9zgc+kcrSzzd4fKck5PPSKoBdzz2lFUzOHHYJ5T7pYf
	nsUzZ67uq
X-Google-Smtp-Source: AGHT+IGR7KTg8RJdO38n4eJNHkiFWbR0gFsn6e/vKQN9a6fLkGP5bEomBLH3SLYB5cZGSmWYKDsLiA==
X-Received: by 2002:a5d:5889:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-3914389f8a9mr17442791f8f.48.1741875105095;
        Thu, 13 Mar 2025 07:11:45 -0700 (PDT)
Message-ID: <504726b4-0e21-4664-87b9-3dd78526abc9@citrix.com>
Date: Thu, 13 Mar 2025 14:11:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] xen/arch: Strip out tlb-clock stubs for
 non-implementors
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-7-andrew.cooper3@citrix.com>
 <c3890a8a-afe5-44ef-9c67-2ef0d73346a6@suse.com>
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
In-Reply-To: <c3890a8a-afe5-44ef-9c67-2ef0d73346a6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2025 1:05 pm, Jan Beulich wrote:
> On 12.03.2025 18:45, Andrew Cooper wrote:
>> Now that there's a common stub implementation TLB clocks, there's no need for
>> architectures to provide their own.
>>
>> Repeatedly zeroing page->tlbflush_timestamp is no use, so provide an even more
>> empty common stub for page_set_tlbflush_timestamp().
> At which point the field itself could in principle go away. There are three
> printk()s (accompanying BUG()s) which use it; surely we can find a way to
> abstract that out. This may then still be enough of a reason to introduce
> HAS_TLB_CLOCK.

I wanted to remove the field, but it wasn't trivial, and I've probably
spent more time than I can afford on this.

I'm tempted to leave a TODO in tlb-clock.h to make it clear that there's
more that ought to be done.

~Andrew

