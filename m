Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C9A67BBF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 19:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919764.1324138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tubSo-0005v8-Sc; Tue, 18 Mar 2025 18:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919764.1324138; Tue, 18 Mar 2025 18:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tubSo-0005t0-PN; Tue, 18 Mar 2025 18:14:54 +0000
Received: by outflank-mailman (input) for mailman id 919764;
 Tue, 18 Mar 2025 18:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tubSn-0005su-Fk
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 18:14:53 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e28cdec2-0424-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 19:14:51 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-399676b7c41so1600594f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 11:14:51 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40fab8sm19394691f8f.63.2025.03.18.11.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 11:14:50 -0700 (PDT)
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
X-Inumbo-ID: e28cdec2-0424-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742321691; x=1742926491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GpylikcYf2DuiNKg/vIbyDeF29bQeJYa0YSQzpYGJJ4=;
        b=MWMyKYrV7Bszjxt7CUH75RSXo5wdScVC9lKc21Tv88yu5ZGSmv7TM8t9IKspUQuhgd
         eHZ0bw40Rvlow8PnG2NHQa19V2xWx5OEPiod/Z313rZiNZYc/XE9RuQYUr/Q1LEt0WmL
         HcM4sPY9MmEkWbXgCCvZgY2THxnbfpb5tNam8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742321691; x=1742926491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpylikcYf2DuiNKg/vIbyDeF29bQeJYa0YSQzpYGJJ4=;
        b=h7i2+p9Ltgl3D0AyN30476JY1c1CFIg8N9vyzPCO/d29ENHD2Iet0Otenl6N58Pruj
         dXS1bi//ZDNLQwFhXbsdytroGgU+oi38C2cJJGxyLwek0giSg1Lhun9aCbOJJNJQIJVN
         VkNEAF0lG1tEQf4I2+3OPnLY8+NqbHMY6Z6VvtXnQ8GchJTxICNsYx7/75/WKvXEkkAK
         /u2VDcag3ZXHJIfmkoZvER5oLBlet7M08iwLjs/XkLVGydU1Og69pXNW3Wet86O9Nj13
         xxY9cekYN1JZpiFzsZcAtm5OvOPiGeM6W6rq9OUoCo00v3ZaQ4j85dtwq/slMCFZhJ5Z
         neNw==
X-Forwarded-Encrypted: i=1; AJvYcCXRkgaCLSN99gkhnd5xcNFcJDFtnW9k5lDOc8k5A6sPiJgEcYIGgfZicnqyk7w2xbr6iBHhGB3AlSI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1I86C53R4F20RGS4vx4/YZPkogiVtNv6sOKF4TrXuzedcEX2O
	/TLi5AGjP4cMcsI6F6dWh5nnpcwsk+Ak4Skm5g/b1kwM7mGYWIVxwQW91OP1lSg=
X-Gm-Gg: ASbGncv9XYn6zYgPzHW5zOFdashYe4o8kqvcDAIIvEInAyouKD5xp//4GRvnatNuNUw
	xd5i6Jm2Pj5+tosfNwC4JqIF8ChmD2TFANT7UjUlAobTTryUw2md0XZ3jan/MwFAc8YZ5FJQzhZ
	9BVrLRXThTTdjoWJLzfCe/n6fBllqc8BkMO1ntn1Hw0IG5++SxigHSQzxDoJPyilf6YQkFAY9B3
	2qEULAbQ9F6zcmyVW1u0KZ7ygDqDRDZxeEuR8PF05mSWLP+yYw9/BCpzLrYm3/I9uAX4jbMXD7/
	s55ISteHFIbZUjf14A0mIHE8qk7AbV/JlBN8PkI4ZRjdCeJ/GxoE6RsK5ELwLmEjMBR8y12earD
	y3BzwG0+c
X-Google-Smtp-Source: AGHT+IGhegRX77Xr2+DiOu2NiJjW+OcoMt7MeZ9c2tWD2ajx2jFLyim00KlPRcZZgUc5NpHMSfx52Q==
X-Received: by 2002:a5d:6d82:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-3971d03ef54mr17162419f8f.5.1742321691005;
        Tue, 18 Mar 2025 11:14:51 -0700 (PDT)
Message-ID: <ad8f332b-4ea9-40f1-a1fe-246f5be9c2c6@citrix.com>
Date: Tue, 18 Mar 2025 18:14:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
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
In-Reply-To: <20250318173547.59475-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> Relocations are now applied after having moved the trampoline, so there's no
> reason to warn about relocations to read-only sections.  The logic that
> apply the relocations would make sure they are applied against writable
> mappings.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/efi/mkreloc.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
> index 375cb79d6959..a5a1969f2ee5 100644
> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -216,11 +216,6 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
>              exit(3);
>          }
>  
> -        if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
> -            fprintf(stderr,
> -                    "Warning: relocation to r/o section %.8s:%08" PRIxFAST32 "\n",
> -                    sec->name, i - disp);
> -
>          printf("\t.word (%u << 12) | 0x%03" PRIxFAST32 "\n",
>                 reloc, sec->rva + i - disp - rva);
>          reloc_size += 2;

I'm on the fence about this.

Obviously we don't want a warning firing for good cases, but the
trampoline is special where the relocation is to a R/O section but we
don't apply the relocation in that position.

Is it possible to limit this to only trampoline_{start,end} and keep the
warning in general?

~Andrew

