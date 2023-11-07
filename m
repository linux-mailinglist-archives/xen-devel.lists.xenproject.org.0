Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389557E37D9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628699.980435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ILO-00057n-Bh; Tue, 07 Nov 2023 09:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628699.980435; Tue, 07 Nov 2023 09:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ILO-00055m-8k; Tue, 07 Nov 2023 09:25:58 +0000
Received: by outflank-mailman (input) for mailman id 628699;
 Tue, 07 Nov 2023 09:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/6F=GU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r0ILN-0004zQ-Ci
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:25:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a71f7432-7d4f-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 10:25:55 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so2762888f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 01:25:55 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d67d1000000b003232380ffd7sm1783482wrw.102.2023.11.07.01.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 01:25:54 -0800 (PST)
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
X-Inumbo-ID: a71f7432-7d4f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699349155; x=1699953955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAvhxt2fxtXXpzwhBx1/6IwDjT7bn+96I2c2Eb92AUg=;
        b=MCz/VU7WKqqwdMaHTETVPsBmtMCw1etUNudWlfKHKiUrA1ZcgSCGsKVwMrT6PurM/W
         SUPAp8J1rE1hQh2e89GEcTbuLk+lKT3okoiRMU09wBxmwufSQQo5JXHIl4A9XhgKCH9M
         VNo+CY68BzLiXVqLf6sUXaHEv8PREKRSVSqnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699349155; x=1699953955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAvhxt2fxtXXpzwhBx1/6IwDjT7bn+96I2c2Eb92AUg=;
        b=Oe0vN/3qzQw4/7kGizOprqMH7LPzX+W4L921ImKvsKU94wYvnBZ79r1j31aFJyQaMi
         IkSnUdy9nPjIuphaCXp5iVUXMJXnWoPAnvJTnAjhqFdj7gkkpWfgXSjRNW/2qnFCaCfM
         ojV/EYmbnZuYqyxq6T5S1KqSv32IH+BW2SBDLGJaI7QC8n1BFnU369VAaNz8BSqLx2Pd
         KljM9Agl1r0e5aDRKmbExg4VjhWuwVEmY8dWSyeIzG4v0/1/eDO1gIHGoDOtKTUpTcY9
         FU/4IVaa0M9d++UHSoV51FovQM3q3GV5OjtXs8ct1uVOwY9ZVxxaXvVmHG7bzD+/SCBh
         VR9A==
X-Gm-Message-State: AOJu0Yw8z9FgdQvH6uYbkvHo7nMY3bRuxM1Tt69A0U10wKsc9ZlYV2ow
	9xT/qWxBEKgMXuhEw1CWA4YDurnPmZLR6n4e3Qs=
X-Google-Smtp-Source: AGHT+IHhcPn5YHYbsI+8ngxSNbnzmkhzoWs77/YA/bbWXfRhh2XO8+DUaYXmTaeW6wAn8BkGM91Nwg==
X-Received: by 2002:adf:e7d0:0:b0:32d:a0a9:4785 with SMTP id e16-20020adfe7d0000000b0032da0a94785mr24212071wrn.7.1699349155113;
        Tue, 07 Nov 2023 01:25:55 -0800 (PST)
Message-ID: <fc3b4c15-6eda-4aa2-9bc3-f0823261c085@citrix.com>
Date: Tue, 7 Nov 2023 09:25:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Fix pointer overflow error message
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231107091417.34159-1-michal.orzel@amd.com>
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
In-Reply-To: <20231107091417.34159-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2023 9:14 am, Michal Orzel wrote:
> In __ubsan_handle_pointer_overflow(), fix the condition for determining
> whether a pointer operation overflowed or underflowed. Currently, the
> function reports "underflowed" when it should be reporting "overflowed"
> and vice versa.
>
> Example of incorrect error reporting:
> void *foo = (void *)__UINTPTR_MAX__;
> foo += 1;
>
> UBSAN:
> pointer operation underflowed ffffffff to 00000000
>
> Fixes: 4e3fb2fb47d6 ("ubsan: add clang 5.0 support")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/common/ubsan/ubsan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
> index 0fddacabda6a..a3a80fa99eec 100644
> --- a/xen/common/ubsan/ubsan.c
> +++ b/xen/common/ubsan/ubsan.c
> @@ -513,7 +513,7 @@ void __ubsan_handle_pointer_overflow(struct pointer_overflow_data *data,
>  	ubsan_prologue(&data->location, &flags);
>  
>  	pr_err("pointer operation %s %p to %p\n",
> -	       base > result ? "underflowed" : "overflowed",
> +	       base > result ? "overflowed" : "underflowed",

Lovely.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

