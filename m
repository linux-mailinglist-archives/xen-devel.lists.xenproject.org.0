Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B282FA6502B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916841.1321862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuA88-0003Cf-A8; Mon, 17 Mar 2025 13:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916841.1321862; Mon, 17 Mar 2025 13:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuA88-00039X-7E; Mon, 17 Mar 2025 13:03:44 +0000
Received: by outflank-mailman (input) for mailman id 916841;
 Mon, 17 Mar 2025 13:03:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuA87-00039R-3a
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:03:43 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dd7a622-0330-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 14:03:38 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39127512371so2669687f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 06:03:38 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b69eesm15093717f8f.34.2025.03.17.06.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:03:35 -0700 (PDT)
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
X-Inumbo-ID: 3dd7a622-0330-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742216617; x=1742821417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iituPOWeN7/57AUuX7w7eZmcJ2mfPtwbbhqzrl7zGf0=;
        b=IdvQK52eF7zXxkC/pcNQppnNMlUfQ2maJIjXZsOeI6H/IiJIeUke75knS6PY6fsIKi
         euG+PZv4lParIejkDQuqHPrWlO8DkGv2xaWQ68nCgPdNqwDB+yqAj4KSy909QYmlP8vB
         T/VFC1SZDiNA/EqZlznxQ0x7Pybttd1ga/Rpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216617; x=1742821417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iituPOWeN7/57AUuX7w7eZmcJ2mfPtwbbhqzrl7zGf0=;
        b=tMZRyS7V8gC2UzpLzvLOWtyHxM2nDJe5fy5ULZl4L71glSqF7k+A7Do3xf79xAcaCx
         bM/HLEVt7AGJeQhCzN/PRKZ1+4XaRZzdcJZ5BnDAY7Nvc7bfjs2yMkkyS7pjuQKlCFww
         aN5It0Ya65TLLdmsAKLA8gfyD08uehVmUnWjwmXVTYA08JtgEqrZH4ZS/KhvNkMTYT/4
         YUHO7jKICHrp8XI3Rf0hpV3PrG2Geo4p1zk5+WkszvWaJuVkPWUB1FmJIR1LsNO9/eqS
         k1tjivjB96OsEytEjzU009TfTPjxJv8gp8qBydChA9erluJKf0NbuNT4zQd1jWcY33bM
         ytgg==
X-Forwarded-Encrypted: i=1; AJvYcCX7eb4b6grPiKTI0J0hBSakj2StLLIuhJLIVjcPzUymcOmPzfQHy/o/ITd667F+k9JMeT+6mxBZzrc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybzJrWOY+udyMiT1jWNrzNBvxA22qz04diX64ZlavKJhcP74Hs
	CQ4x3yxQLtwmiFN6JvCGUfZefN0KPZDhzYvzH6H1ktVj5j+7TdlvuNf404LMkqs=
X-Gm-Gg: ASbGncsbMk+szdI9V+td3raQqIdIIMaUjVOlbJ73oEZshGairfWTIjx3UB4dt3ie8GK
	iaVk6iXrWu6i4InmERi+RjAUc+18NK1bhpX3IMK2bB28p5p1NJ6TKHcKyVoJbOMWZmDnzTP3OCg
	lxTzFt28HeMeed/v715eV1FYC14skdY9u1xMHL93w9THQ1Ibb78rbo5Uenwuagq9QlZn2ylZKHL
	Zl+70gNEJp1wGIxBBtEmIiTwr6RCECowW21fW8Uz+VppZnxbkDa8C3TncgvDglDUgYRN50Ayo4J
	wI6lheLD6ZvpktLjBhgS0DlZXSVOV+e+faZqo3TbdYBXj2lxsnKC8GaP3ijClkxG8x3Kwr/e8t3
	0Qc9FGwMR
X-Google-Smtp-Source: AGHT+IF+UldFh51k9l/O2zC6OSOfy6DhcKnIk97JYdNdj4AQaGB2K0o7ZMWTCZIvwtdlHKzDhSLiWA==
X-Received: by 2002:a05:6000:2aa:b0:390:f400:2083 with SMTP id ffacd0b85a97d-3971a2a2ba7mr15568493f8f.0.1742216615948;
        Mon, 17 Mar 2025 06:03:35 -0700 (PDT)
Message-ID: <d6c32a72-5bf3-4d02-ab2c-a1ba04e6d8f7@citrix.com>
Date: Mon, 17 Mar 2025 13:03:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86/irq: cleanup use of open-coded values
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250315010033.2917197-1-dmukhin@ford.com>
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
In-Reply-To: <20250315010033.2917197-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2025 1:00 am, dmkhn@proton.me wrote:
> Remove uses of open-coded value 16 in x86's interrupt management code
> to enhance readability.
>   
> Patch 0 makes a cosmetic rename NR_ISAIRQS -> NR_ISA_IRQS as per
> code review [1].
>
> Patch 1 makes use of NR_ISA_IRQS in the code where necessary.
>  
> Patch 2 adds new symbol APIC_VECTOR_VALID and makes use of it.
>  
> No functional changes.
>  
> [1]: https://lore.kernel.org/xen-devel/20250314011528.2608217-1-dmukhin@ford.com/
>
> Denis Mukhin (3):
>   x86/irq: rename NR_ISAIRQS to NR_ISA_IRQS
>   x86/irq: use NR_ISA_IRQS instead of open-coded value
>   x86/irq: introduce APIC_VECTOR_VALID

I've taken patches 1 and 2, and confirmed that 2 has no compiled delta
in it.

I'm on the fence over 3, for similar reasons to Jan.

~Andrew

