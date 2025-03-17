Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E929A65E2B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918072.1322821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuGJv-0006JC-H3; Mon, 17 Mar 2025 19:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918072.1322821; Mon, 17 Mar 2025 19:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuGJv-0006GR-DF; Mon, 17 Mar 2025 19:40:19 +0000
Received: by outflank-mailman (input) for mailman id 918072;
 Mon, 17 Mar 2025 19:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuGJt-0006GH-Tx
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:40:17 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a682293a-0367-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 20:40:16 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso13383445e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:40:16 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d33f5771dsm24839135e9.38.2025.03.17.12.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 12:40:15 -0700 (PDT)
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
X-Inumbo-ID: a682293a-0367-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742240415; x=1742845215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b9XkyLu4yDyFImJ7Pmmy4tajw++yorWXQFhR6QJOUvE=;
        b=JjP+s62J/Wak9wi6vX8anwebPOmozrMVM0UYWa5L0WoeR8PQlm9Fz5sZDhApf3iBtR
         Yv+TkxdzU9+eGZLpAmCPzEV3smpgawSa1Rls7NlgBs9T3L4tbd8u1R1ayCpagWGkvqvU
         7mUUwMiuHy+F1ZcjylZT9neLVG9Nh6+UF4h90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742240415; x=1742845215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9XkyLu4yDyFImJ7Pmmy4tajw++yorWXQFhR6QJOUvE=;
        b=T23vQqAw/gYsirRvIo927K6HnjeoaZ1tbLsvM2XyqTvO/vYf7mEX1hRLrz4UdODdJf
         ok5/0X6GsYzIT2U2hEtfQzR+ejZqzSPOMIEAbG7Uj8x4WaXEbGBnYlGhwX3rXSbTVV6a
         MrCDv1cgmmJUfcyfQ5CgMDrH1prbkTc18+D0mrJjXsrOOj6bI2DsvqYpcCRS0uNFe8nF
         a+RBUo4iAEZge+L0Ry1hLaIWnwAaEP1MHfk/W19VFTzcACTOTJ+iQGbjsbbOmO3laUj4
         KJsAv7EzYB2N8xCfHexBmc4zKN3abxexWSMeSmPG3/2AfqoQOMITjJXTs0YkF585j8Z4
         STgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzw0HxUu+dDldiU0rBmgXZ/iH3F37K21fZUUpZDgae92roiiUheDgXadAcwuWsadqpjtJvZN9WkbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1Mp6sim8PF5Z9NqU7+ZKIm0SHku8GTeE7aNV9DyjS9pwlDEcp
	n02c0+odr6Z/xTQHLv5qdLF/Cwr/XVTf63DX9X5Pz0X+FA+PVVkpPpQBlwxb6HhliZ+mzhOx2FW
	s
X-Gm-Gg: ASbGncufdU3JRF40/DI8WFv4PxtVEMWissOc47JMmG6E29J3kA1wnP++r9OKAbet30w
	0oIvJGoJg9+UzYzGM4vJEg2LKBfL4ljxVWIeAQi/9X76+r3G1cjZ5I65K2CohXRMpilXYY0fSfw
	jFxdVowSnVKTHt9+TLhViFlWWQW6ICU2v2+0FuzLfnFoEo4DSddcoMZhsZddvD4ABe6+gUM64nH
	D0O2pDsRil7BZe1AnYPKMWfSAECeLKzQmhIVn7oi6Nff9lbfulmCUJ4YyvJKTjB254mbat5+PM3
	v45FOeWmCUpJP9G3bXhq1DGKPbRfIrnFc58KZOpaY4NLIbvIvn2NTDG2rr+iw5e+/OoXG0uXsZR
	lQcnTG2Bu
X-Google-Smtp-Source: AGHT+IF9JpmEB+B4KfzSHVIi1JspL3tSImMx+Xw6FBVJ3cBtj20lHbzWZ02VNZZz9gXZjwOXGWlpPw==
X-Received: by 2002:a05:600c:511c:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-43d1ecd60c1mr129761305e9.28.1742240415406;
        Mon, 17 Mar 2025 12:40:15 -0700 (PDT)
Message-ID: <1edd3466-e999-4cfc-99e8-e701581806a2@citrix.com>
Date: Mon, 17 Mar 2025 19:40:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] automation: select APLIC and IMSIC to handle both
 wired interrupts and MSIs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <31ee47c8906f13869e085e442b285d7ca6202023.1741709885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <31ee47c8906f13869e085e442b285d7ca6202023.1741709885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2025 4:19 pm, Oleksii Kurochko wrote:
> By default, the `aia` option is set to "none" which selects the SiFive PLIC for
> handling wired interrupts. However, since PLIC is now considered obsolete and
> will not be supported by Xen now, APLIC and IMSIC are selected instead to manage
> both wired interrupts and MSIs.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Presumably the version of QEMU we use is happy with this?

~Andrew

