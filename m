Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E510FB1BB52
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 22:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070941.1434534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujO2N-0001QA-9s; Tue, 05 Aug 2025 20:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070941.1434534; Tue, 05 Aug 2025 20:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujO2N-0001OX-7F; Tue, 05 Aug 2025 20:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1070941;
 Tue, 05 Aug 2025 20:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoJv=2R=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujO2L-0001OR-OI
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 20:13:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6824bd6-7238-11f0-a322-13f23c93f187;
 Tue, 05 Aug 2025 22:13:28 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so39743185e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 13:13:28 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c48a05bsm20512629f8f.69.2025.08.05.13.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 13:13:27 -0700 (PDT)
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
X-Inumbo-ID: a6824bd6-7238-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754424808; x=1755029608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/BwaiXnw/iLOWCTAL1qTewSzze0vosGhN7wZNDD5aOg=;
        b=Z/GN4J4mLh5eZ7X1luofPfqqnF9jzp4MFUo9L3avdLcLlP0r2IfyLg2vqYhqhpZU7g
         8MoRqofBW6jhqwqZUKyKf8cKT5XfaNe8uqMY3iEqBC0luLu0f2NgYPgw6qbCM5hWGdAd
         knnsYRBsP3fDQ1Mb0p3Ke43Bklg7L3Z+E2r0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754424808; x=1755029608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BwaiXnw/iLOWCTAL1qTewSzze0vosGhN7wZNDD5aOg=;
        b=s5I6kQ8neo9xsJDiYp9hV4ddmhjILiSTrCe9OgDuYggerD6PC82cHHsiDW9GHnSA/P
         n85S74RKEUemTjlw/cqBOwBgYiarTVGoQzddILr8rS8S0w+z7U7V8s8B78kqug9cCM0Y
         158700EVdsdmF80aq/BaOYlX1Uyg6atsrvuugP97wMmuRfe3X4G2APr2KdJC7sPN3Em0
         A+Yotw3lxu0zmjjyuyQBk+1kmbJOSoOizOpIb1Rr9VhJDFR9anwkhjkYRhshpBwyV0f4
         f7Snbt5+C99qEKC1pA/mHc4kpu0up+/QUUmcxH8xASKYN4XiMAhhVgf9HEYnYA0gYy4d
         /7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrPpdqZVEA9fd+cCcHoHB+t6n3eYu82SC4g3lhvEYeZwwVbHh/u5C1GHblnAcwrn4mJL1a3yMKbbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpxRWXLrx6oaXHSTQw77GRQ7e2ibPlR5lfz3bQNs3JS2LtMRGg
	2nSuCupqm3kDperP3mFzKegjCT3d2OjslaMOErk2nlLtr4+YbMIyKphCIhiyhO7I42I=
X-Gm-Gg: ASbGncsdUy9lPLF86pToJA2ersI812UNCLP5BzQaLUmEkf0GPknenH2jbR42u8CITRG
	5VIhmwiyWR0c718TqcVoY9LlAeWJxL3w+KM8q9EI6rX65u+IKg6Wtz2TO+eKPtLZ3v7gGPzVpfm
	hRjA1BXc6P+lADGwwqkmoJmMlj/XMFh0+KW3OcEXI9TVTJAqMkURONe+1JzpD1qU85xG4T+v4aG
	HCiDK5hGLCwVadgrGqH7h9pP0h6Qa9UBd8KJ15UQaol7/NY0B1OqAObnQMpI2qRNrxCaEkcKWTq
	hcU6PPJW9TTViScrJYXwwrYS9JOQ2Pf9+egCJlLcsfvEnzk2xOliEjzUKuWm1+2ck7JfHZCR9Cn
	dIzelaCC9il8w4FP0YKXM+rv8/99pq6pzhobr6KDikbv2Ud+CJ4DWcfkAURGVlSlbBRQ9
X-Google-Smtp-Source: AGHT+IH1qcTpWYD/e+i62dWDRWBcxCURqg6T3gZq6L8RbZmU957gfP8b6EQPXNVYtoWved7qeyTXVg==
X-Received: by 2002:a05:600c:5494:b0:459:d6a6:77c with SMTP id 5b1f17b1804b1-459e7136b2dmr1387015e9.33.1754424808029;
        Tue, 05 Aug 2025 13:13:28 -0700 (PDT)
Message-ID: <d492417a-8f09-4f6f-9b50-6e06634eefe3@citrix.com>
Date: Tue, 5 Aug 2025 21:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/mm: drop paging_get_mode()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
 <0c75ef27-7584-4e56-9ead-6bb0274ce3eb@suse.com>
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
In-Reply-To: <0c75ef27-7584-4e56-9ead-6bb0274ce3eb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2025 8:58 am, Jan Beulich wrote:
> The function was introduced without any caller, and never gained any.
> Thus it has always been violating Misra rule 2.1 (unreachable code).
>
> Fixes: dd6de3ab9985 ("Implement Nested-on-Nested")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm still not certain how this will shake out in nested-virt, but I'm
reasonably sure it wont end up like this.

~Andrew

