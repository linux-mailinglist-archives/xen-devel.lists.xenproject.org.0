Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F6A12444
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872504.1283473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2yV-0007N5-Ig; Wed, 15 Jan 2025 12:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872504.1283473; Wed, 15 Jan 2025 12:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2yV-0007Kn-Fq; Wed, 15 Jan 2025 12:58:23 +0000
Received: by outflank-mailman (input) for mailman id 872504;
 Wed, 15 Jan 2025 12:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY2yU-0007KR-CN
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:58:22 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 654d443b-d340-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:58:20 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso1170782466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 04:58:20 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b1ccasm751872566b.158.2025.01.15.04.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:58:19 -0800 (PST)
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
X-Inumbo-ID: 654d443b-d340-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736945900; x=1737550700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=np12L4/yKQo3OFdzi79z++CTU5XeU4vXmPQn/3gU3yg=;
        b=WMpnACz0iuQWfJs/KTBgKXWtFwFmtU0QYd2jKPDqHxxaKQVSqH61p/5fgmC+NRWC6S
         T3ariC9+oOWgE3lTugACVsV08TMar4qLGrB04TBzoFzt3pOMPWBEVAfG65q8DMw4moe1
         Efkr3B5ukzFZprKMNkhKs0ArjIOR+vcc/sz4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736945900; x=1737550700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=np12L4/yKQo3OFdzi79z++CTU5XeU4vXmPQn/3gU3yg=;
        b=YlgVTf8v9ZBwiDb9vhYV7ky3ifBreYhrH/wySdBvf3VDfZghJUxz+MtiJ61k+ouokn
         7LxVth2iHyYR8FZ1ISqlCmOtY1OyrtKWTc5Lf+1T/IvIL++Y/IDDoCJgCehD/qOOQUCe
         q96T7xe0AnDn2coLQ8pU/KWi9ogRsHeYtaKBpz3S7WBh+gnsxW990LHj4i9Xufrjuf48
         ZWVfcl83Ieq4nKdK+ALrbKtju5qEA+3Whp6+Dk353qfkpixvVX+mt2sEUMVOLdXivzHG
         l+0Z61l6hGLRFfIL8ieomKqUM+tXlmbdUbYb6ah6Xjf2qUcABNsp7dNKp3Dv3WLrYuLM
         ddzg==
X-Forwarded-Encrypted: i=1; AJvYcCXxzqkv33TvZNYi1rC7WlYpXjB2lUdv0AeIO4D4RILunugIpUO72I7quT/4TYH46FSnc4qs5k/83JM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxosAxBhzDZcuLZPNoHjueSksf2YHA3ZezFUML1jZU77cN1NSZJ
	o1WOhVMpF6V/u8kKZaPc0yU+IKI++Xj7k5UfFnXfsLq7YS9ySdqmAbb7Rygym2w=
X-Gm-Gg: ASbGncu513fTCk3wtLdUnpQgtXozijgGNb9wvoZVZdcm9nf5iK8Rl39w6tDxvnPlcfm
	wrEZabgn8OlWopkU8cgj+lT2lLROu7c/a1VeS+pwhiQcOYq18kIX+g4fc2zqExh4+ZoO2EnSom3
	z75iFFFUXmqTO+JZp/3MNu81mW85ntLKoykPTtzKRwRvmqHW8EtIOTVDmLBgmjkfiPZvuFEV0/e
	zWO2C5QYp2nWMiHrPngeHxdFkjkgHpMXAfQolY2zjEZf2v5vTIzG4jfN9dPmezdujg=
X-Google-Smtp-Source: AGHT+IH1vTj851rgiy9IkwL/TvtsP4eD8IV4SeFtls5rCuJdkkxoekj7BFZbTt8p2zLb5DWHZzCKRg==
X-Received: by 2002:a17:906:6a19:b0:a9e:d4a9:2c28 with SMTP id a640c23a62f3a-ab2abc920abmr2936076866b.53.1736945899861;
        Wed, 15 Jan 2025 04:58:19 -0800 (PST)
Message-ID: <fa278a0e-105c-4849-af8f-881e98d5e4d5@citrix.com>
Date: Wed, 15 Jan 2025 12:58:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Improve spelling of few cases in the
 documentation
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <2c20751e64552ec69686aa26304710bce975bca5.1736945126.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <2c20751e64552ec69686aa26304710bce975bca5.1736945126.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 12:47 pm, Bernhard Kaindl wrote:
> Skimming the docs, I came across a few places for spelling improvements.
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

