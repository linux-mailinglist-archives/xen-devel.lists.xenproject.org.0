Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8113942BA4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 12:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768440.1179224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ6G3-00051d-Ge; Wed, 31 Jul 2024 10:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768440.1179224; Wed, 31 Jul 2024 10:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ6G3-0004zb-DN; Wed, 31 Jul 2024 10:08:35 +0000
Received: by outflank-mailman (input) for mailman id 768440;
 Wed, 31 Jul 2024 10:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZ6G1-0004zV-Oa
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 10:08:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d70d24d9-4f24-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 12:08:31 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so1362440a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 03:08:31 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8039sm739117966b.200.2024.07.31.03.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 03:08:30 -0700 (PDT)
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
X-Inumbo-ID: d70d24d9-4f24-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722420511; x=1723025311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0bkKBbZiwjP7hq21Qyqw1jG2N410q+6W1j0I7SaVDY=;
        b=XAIw58TPOWQJzvQOtO3WthFzgD6jdMEDWZk5JcG3mOEHJVCsoWRikb9y1Pt7kIT/F3
         X6coa+deX1Y2rbK+bVgKvQq9/QT/sMT24YCFV9Q8u40q+5tVCBB/JQbdB2uLhWFWwIg1
         suNFDZ949VkbBRaZq8HTvRnZRNTzyURIzNjxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722420511; x=1723025311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0bkKBbZiwjP7hq21Qyqw1jG2N410q+6W1j0I7SaVDY=;
        b=G6sLd2n+jC4f5oBORqV9yy5fS6msrM9mRWrGmFDCP9J9yCDMewqxJpIYY/xVAWyGq1
         Y8dL/4rndCzNcGxhYWRcmKgXgxDfO7mZRfPbVrhemVrmsnjEMeby5Ec3VanqEqEbfyjq
         EMeQK4qcTToC/YI9PuIO2G7iZ6AcxQV4fIa5sPs2BxCy+JBQG9FDPRyyXIyi1acHbfkF
         /gXpnNaP9nHji2CJkxWCKtc7brj7judI5nDihtpwYRk8ZJVz7/HnIT5FH4CBLi3JEfsk
         75imCxATrQzlp+6gVIpLk8MsBgqg5x2FmPFyTQC5YfpBGjj6XVnIK/toS4V/Y7RVecVp
         LaoA==
X-Gm-Message-State: AOJu0YyzMUYxkCS2NI0M+MPF66JV53D4zo+4ET/pfwRLb7ImgMok8Glq
	JS7tO+LbSbuZ33HK54V4kDYs2az5QhpRUcy377uzetW9vCHeHxdimjL0QjZUXhpEXgeXJAoBe2j
	V
X-Google-Smtp-Source: AGHT+IEAdfbAGTSL8qlfuGa6P4XNUPUK8uVgy9GdE3tSu8yW192QbiYYWjCzZPISkzDSE4peRtTvCQ==
X-Received: by 2002:a17:907:31ca:b0:a77:ca3b:996c with SMTP id a640c23a62f3a-a7d85963ecdmr522618566b.16.1722420510491;
        Wed, 31 Jul 2024 03:08:30 -0700 (PDT)
Message-ID: <3ca84670-9201-49a5-9643-1cfbcaefb830@citrix.com>
Date: Wed, 31 Jul 2024 11:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: init-dom0less: Weird use of cpupool in xl dominfo
To: xen-devel@lists.xenproject.org
References: <20240731100359.529751-1-a-singh21@ti.com>
Content-Language: en-GB
Cc: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
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
In-Reply-To: <20240731100359.529751-1-a-singh21@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2024 11:03 am, Amneesh Singh wrote:
> Hello, I was going through the source code for init-dom0less as I was
> facing some issue after applying this patchset. Feel free to ignore it
> however, as it seems unrelated to the issue I am encountering.
>
> https://lists.xenproject.org/archives/html/xen-devel/2024-05/msg01825.html
>
> One peculiar thing I noticed was that the "cpupool" field is being used
> as a bitfield to check individual vCPUs. However afaik, "cpupool" is
> supposed to be the cpupool *ID*. That matches the fact that the cpupool
> value for all my VMs is 0, as I only have a single cpupool (id = 0). Am
> I overlooking something, or am I correct? Here is the relevant code:
>
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/helpers/init-dom0less.c;h=fee93459c4b9da59446a2f8dfcf5cbfc4d95aeab;hb=HEAD#l176

CC'ing relevant people.

But yes - that looks distinctly wrong.

~Andrew

