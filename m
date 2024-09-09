Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5589971B7F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794531.1203505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snejA-0002qi-OD; Mon, 09 Sep 2024 13:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794531.1203505; Mon, 09 Sep 2024 13:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snejA-0002ov-KD; Mon, 09 Sep 2024 13:46:48 +0000
Received: by outflank-mailman (input) for mailman id 794531;
 Mon, 09 Sep 2024 13:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tbp=QH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1snej9-0002Vg-K5
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:46:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f42eae1f-6eb1-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 15:46:45 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so5806022a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:46:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cea3basm346336566b.163.2024.09.09.06.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:46:43 -0700 (PDT)
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
X-Inumbo-ID: f42eae1f-6eb1-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725889605; x=1726494405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yhWf/STyJcL4sNybhNG6A3PU6xbu0OmRExdfLKkVQKw=;
        b=Q2Zr+hzJfIb7f7FGd0m+kNRg2QmHO2Nn2OMdGemu3ytBSMvAjWNyPndmgyF0N4MNtY
         kNs3GEjdCFXkHbVgWR3ErqiVw7bIYMb2KqGwTgT5FrbSUU8xirgxaQ5JogrRxsqcxnNP
         oVqbPuCMssGtwMUuWUDC1Y1i0dO8Wpl1+g5RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889605; x=1726494405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhWf/STyJcL4sNybhNG6A3PU6xbu0OmRExdfLKkVQKw=;
        b=RhXvtT+4pn2J89fQICrFjRkltLT98HaaydjF/cae38BHw/QScvH8PNnJJDSeXCsO6J
         VzSqo+2KzlSFg0vHnOnOeD+Ek2C/teIiom9iG3Z6GV2SGyr43xRuIGlUxPP+OKoN1BK7
         DBJ+sBKgdLn1RUJe5BwVswbr6hE2wY2JWjI2JSuknSCjfrIh3hkPzTGTkkTjkS4P8yMG
         kZpG+H3NqbY/i/valFWwbPwxuSDB7p/ED/LJ0iZz5da34y/ir4ZHDvDivKllSRKXtesL
         o9e7n5fywjwIWuh8LPR9V8W8/oYFhc6dZiV2p1JNjT6KmyI2nyGZ+xeNMJNrmFke6cMH
         krRg==
X-Forwarded-Encrypted: i=1; AJvYcCW3jqc5wo27PBA3Vfj2XU7ZqOFFp0tuoZtXmTRR2DOx5hoVqn4jJ8xtYUT+HZKWXLV7XsJkFkAwknM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCUYKQPzrDek7mNCiAO/gW9u7hhHTtm2PMEqRTnG0Rpcses/VV
	dySqGOCbIL5zXMEvw2uvaAI5E0J29I7oBg/Lq6MaM7Uqx7ddRn1MlFV8K6bowwY=
X-Google-Smtp-Source: AGHT+IGVvtj87b3y8pClq/UkLLOJzRhKt9HdHmhPNGZUVzn6KnUqH0kgHMJvAhETHyz+/b6bMiCXXg==
X-Received: by 2002:a17:907:3e9e:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a8a882732c1mr1143816466b.0.1725889604409;
        Mon, 09 Sep 2024 06:46:44 -0700 (PDT)
Message-ID: <22c05c08-1ce2-40d6-8864-72ab9395b8cc@citrix.com>
Date: Mon, 9 Sep 2024 14:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] tools/ocaml: Stabilize domain_getinfo for
 Oxenstored
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1725881488.git.andrii.sultanov@cloud.com>
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
In-Reply-To: <cover.1725881488.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 1:02 pm, Andrii Sultanov wrote:
> Changes from V2:
>
> * Drop the upstreamed "Build infrastructure" commit
> * Split the last commit into two: Loading the plugin in oxenstored and
> switching to it
> * Remove configure and paths.m4 defines as suggested.
> * Reformat files appropriately
> * Rename all instances of 'xenstoredglue', 'xenstored_glue', 'xsglue' to
> 'xsd_glue' for consistency
> * Remove _v1 suffix from all static functions
> * Remove leftover #defines left unused by the previous changes
> * Fix inconsistent tabs/spaces usage, added blank lines where appropriate.
> * Define the 'xsd_glue_failwith' macro as suggested
> * Remove first_domain argument in 'domain_getinfolist' function
> * Remove unnecessary memory allocation alignment code in
> 'domain_getinfolist'
> * Improve error handling in 'domain_getinfolist' as suggested.
> * Add SPDX license headers to new files.
>
> Patch series on Gitlab for ease of review: https://gitlab.com/xen-project/people/asultanov/xen/-/compare/staging...plugin-v3
>
> These changes passed the Gitlab CI:
> - Loading the plugin: https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/1445544074
> - Switching to it as well: https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/1445699231
>
> The patch series has also been tested manually.
>
> Andrii Sultanov (3):
>   ocaml/libs: Implement a dynamically-loaded plugin for
>     Xenctrl.domain_getinfo
>   tools/oxenstored: Load the plugin for Xenctrl.domain_getinfo
>   tools/oxenstored: Switch to using the plugin for
>     Xenctrl.domain_getinfo

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and queued.

