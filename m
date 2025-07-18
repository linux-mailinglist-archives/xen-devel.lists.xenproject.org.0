Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D0B0A3F6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048632.1418838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck1X-0005Yf-VW; Fri, 18 Jul 2025 12:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048632.1418838; Fri, 18 Jul 2025 12:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uck1X-0005XD-SW; Fri, 18 Jul 2025 12:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1048632;
 Fri, 18 Jul 2025 12:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uck1W-0005X7-Ud
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:17:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff30022-63d1-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:17:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so14860825e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 05:17:08 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca24219sm1652226f8f.15.2025.07.18.05.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 05:17:07 -0700 (PDT)
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
X-Inumbo-ID: 1ff30022-63d1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752841028; x=1753445828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JG7gbAnqr4PYOT5CM42MA5OvWpUVNYZwNEVO+qvWgJY=;
        b=OTryBuwF3vhQzZuv5HJxiGtxWbyGX3IKxgnCUzqChfwcYvHZqco6x79azIXePQ8kuH
         dXMW4Go+FJEenS/TGYA26LcBIZ7osWq2iDlW/ujOB4ZEYVGjgdzfNX3xaSvUa3BMxqxm
         NahA9dxRYK5IHvx4BJTRQaARsMBFCIEc3LjYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752841028; x=1753445828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG7gbAnqr4PYOT5CM42MA5OvWpUVNYZwNEVO+qvWgJY=;
        b=OOBbuOSA2cqGUuxqTlJB4tVcJKJgzxGhsF8a45I2Jif4sGjCCh12bhghv+GxXuL6hx
         L5JHjkrtcOEk2z3Fl+y7fmY9y3vTIPWb6dUDycLz3n8vT4egyaYbyQFcd2X+ctuRed1f
         nD0kbgA3CODtB4H7RV6MGJJeW7tQPcO3VW7Z5YPoM895pRZz7amyOcH6S8GoZjZlEcj3
         gvHPGbgNFDp+FmuyNzZQq6BjKzP3j49NAWWU/FMhNWePrXHR40n4MNg4YUjsRKdn5cvq
         W6biKmrRFBsL812Ah7qBVOIpNVGD6wxIejeCUsQh6zfX4RKPhD13l0VYsc1kVeFLzV4K
         yNLA==
X-Forwarded-Encrypted: i=1; AJvYcCXRRQtxwkLW4J9gnp3NasN5/W1Nnyuvmxq1pnvj61B31VtHB7xPpv9dXMIfNAPeUrs7LtlFVo2FCbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXmRFfWQTvkPqn0emSr0zND/issrJ0PVJNgMw8SVwbrCHy99GB
	bquZ3fq5Uc5tu/hA9r9Snm47cAcQOPrG0jPCRQjQgZ3XL5g4nOx70qO2E8EoG7jkIXg=
X-Gm-Gg: ASbGnctp3r7dKx+sZQpDfkrKsOGH/TGW+LHAHag1vAT9iiG8Dtg6/whCjwIHdMwyt/V
	rqimxOS/l8fu1pc4waEGZVS02Oev2VVD36vSUQomcRLVd5aymvYP92UAPZK+smAFhglRiz87e6k
	pOdBeUd2ycMGH3xLnZLJ3DTHJhlztdfOS2Oe6WgfXNT04tvXUCtcSQ0bPZE7USXLBeWYt/KHuJG
	bXrq9ED+kELMrwSVzzgvjmoCE6gFX6QzjrTZnaXrx61yCbGmu9rd3VC24ozPbZwmAs6Wdqjyxxl
	pr4jV8Bo1CTmIoUkKe6GFJ/MHBunRRhyRxjXokQpHBRF8T3VfZ3rvSEu5KKSIc4+/GmljTHFwl7
	fdRBT2gsguf3BEbZMSlTdIN6uHyhcTDrGhKLjCbRbXk9L7DbB1TfxBd4+XcHjPy6bgh9M
X-Google-Smtp-Source: AGHT+IGZiVJOt2SIwv4SXJlrYhtjY99DyewgqChOC6WxpQdiUVvd47jh1m4AHVgiqD/UbLEqwLtc5g==
X-Received: by 2002:a05:600c:450f:b0:456:2981:2d6 with SMTP id 5b1f17b1804b1-4562e34dc2amr110962835e9.14.1752841027913;
        Fri, 18 Jul 2025 05:17:07 -0700 (PDT)
Message-ID: <fb4b76a0-dfee-4563-8da3-25210463e6bb@citrix.com>
Date: Fri, 18 Jul 2025 13:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Remove PrintMessage function
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250718121106.34915-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250718121106.34915-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2025 1:11 pm, Frediano Ziglio wrote:
> The function is similar to PrintStr with an implicit newline
> added to the string.
> In Xen this is not a common pattern and this is used in EFI
> ARM code only making it not much coherent with X86 code
> so use PrintStr directly to make the code more coherent.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - reuse PrintStr instead of reusing PrintMessage.
> ---

FWIW, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

