Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95EB249F9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079932.1440604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umB3t-00009Z-RB; Wed, 13 Aug 2025 12:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079932.1440604; Wed, 13 Aug 2025 12:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umB3t-00006q-Ni; Wed, 13 Aug 2025 12:58:37 +0000
Received: by outflank-mailman (input) for mailman id 1079932;
 Wed, 13 Aug 2025 12:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umB3s-00006k-Lb
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:58:36 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39276238-7845-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 14:58:35 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so6007379f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 05:58:35 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1a58fc69sm1411635e9.22.2025.08.13.05.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 05:58:34 -0700 (PDT)
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
X-Inumbo-ID: 39276238-7845-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755089915; x=1755694715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgd3aFHk9Ia1mL0OdffpXf04JzQU1lFHG3EEzVPIibQ=;
        b=XkQRR1Ph/eCemnpTmEawrSSkVQWOP7szidx19+gT97NvBpekUulzo0MThKk0Oh2DPE
         Fwyu6RirfEbc9FDaaHIe8fKevhIpqWDzbTc68FLJfNBxbQIzEp6gt44cWLMsThK4kHWD
         0Mh5k3rTMpOo3NOlNvgGr9A30yDOjqoy0DaJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755089915; x=1755694715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lgd3aFHk9Ia1mL0OdffpXf04JzQU1lFHG3EEzVPIibQ=;
        b=o7s/SsSupQnx8npDSEsf3QAWfdfwgDWsWaQWqa8JeKl3UGkvMai+8rMMc3/2ruoLJV
         /1Wm8Qeh1194IubndKnf9B99Y9dFdfSZZ8/ci0IPEqrubBTGbBlzB7I9Mi+0NOGRynoX
         Nm7I1Hkgy/+j49N6RZAmM0aXseDeA8wtNByOuA7Rc92JWmU7qKLl+bfCtSBU+Pu4mGcb
         ppINUzIRAPmFiA/Xo9AmMdpfjBP5jTRr7jU7lB20kHzt88pFyut99zL1p4xRBtrwvyOa
         gkafuugdu+ZjNPE2t4dQdIzshSZBnDxSGc+xsuST6F3jQPcczkVY03/IFzGZnFXfLVBD
         WNuw==
X-Forwarded-Encrypted: i=1; AJvYcCVnbY5bvqcdbKCrlPAvbbQNfx/1RZx4ULp9S7N+iwHGiaWMR9YtxpwBXHRSZkV0LqSbkJVWWxv69f8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWvsZB76frcU0Fy3mATYBgO23kkysctL+eSCR2tmerai3rzixZ
	k8gsbZ2aF1mDSPTIri0ag/sx2/3Aks4UlD6oO20UVCdziTCbAT9xTzJHNDAzSH04IC8=
X-Gm-Gg: ASbGncusmp3I9HcPSpdwP1rUH2hYf2x31QaAV8W0tH3v7XmG2FaoHp8R4n/cFL+bAZf
	BUCdPSAVZdkdjEAm0guBuVfBZiTer0qGjKLBag+wIK7IKId+7IfeiaOYtLi5kEkYL4H8VDnUk3h
	DLFZ4b8zO4vmazJIpNY6tkznygaorhDBx+M/JaOfuwCZx/bQod44N9VhkKuU0e8gGyJpNOlwl01
	6c6xemGE6y6Sjyms9Dgl6WPVVoa1JY6DDh3wp3yHsjCSR2GPqowh3r6BF4CvF/vTL8AehbRssmk
	RCOlNqizdQdQDWqEjuZd+1EBdwuu7XLooAxb4+Vdh+XEXebTgBKLQoI8K2HrCSopNl1sc4dcDY4
	gFXsu58V/IdKrAaI8f6sUwnF7nu+MjdPuYZeYiUDi5Jrd/UipCQnuQMvv9r1nXEbPBfRb
X-Google-Smtp-Source: AGHT+IHMqqR9Gev5u18AKeDQpCUjQTsMfXSr+eTplf5knMy049aNEBNFTINtwCmc8/eSjVzl/bokVQ==
X-Received: by 2002:a5d:5f4a:0:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3b917e460a7mr2184192f8f.21.1755089915040;
        Wed, 13 Aug 2025 05:58:35 -0700 (PDT)
Message-ID: <7db8af65-0ea2-4724-90e6-3980c499bb9e@citrix.com>
Date: Wed, 13 Aug 2025 13:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250813125538.78174-1-roger.pau@citrix.com>
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
In-Reply-To: <20250813125538.78174-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2025 1:55 pm, Roger Pau Monne wrote:
> Coverity complains that:
>
> 277    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;

I'd perhaps drop this line from the commit message.  The sentence below
is fine, and there's only a single hunk so it's obvious what is being
referred to.

>  In expression 0x1000 << bottom_shift, left shifting by more than 31 bits
>  has undefined behavior. The shift amount, bottom_shift, is as much as 63.
>
> Cast PAGE_SIZE to paddr_t so it has the right width.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Coverity ID: 1662707
> Fixes: bac2000063ba ('x86-64: reduce range spanned by 1:1 mapping and frame table indexes')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Formatting aside, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

