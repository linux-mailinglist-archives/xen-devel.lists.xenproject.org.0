Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD5A025C7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 13:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865720.1276981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUmRU-00081V-0s; Mon, 06 Jan 2025 12:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865720.1276981; Mon, 06 Jan 2025 12:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUmRT-0007yS-UJ; Mon, 06 Jan 2025 12:42:47 +0000
Received: by outflank-mailman (input) for mailman id 865720;
 Mon, 06 Jan 2025 12:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUmRR-0007yG-Uz
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 12:42:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8418694-cc2b-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 13:42:42 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso88997065e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 04:42:42 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4274csm603387275e9.38.2025.01.06.04.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 04:42:40 -0800 (PST)
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
X-Inumbo-ID: b8418694-cc2b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736167361; x=1736772161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=53UK6OT68eMyeWXhHkWkgkO62tPci66NaJhkx6Hu9U4=;
        b=S7a7IZCIUdak6grx6T0SPMn73waUVtQbqwDvrXZXE1QAZEYKxPv1pTeKmnBUia0Gc+
         +FuH+negpRUEANoP/B/0MC3AJ3ZrQW9p9w9M1ZPqQwp0qf++uluJDFCHopl63tqg7yMe
         GKzstPmI8RwaV1dVqdoQXjZV/hzqgBPzmtO9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736167361; x=1736772161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53UK6OT68eMyeWXhHkWkgkO62tPci66NaJhkx6Hu9U4=;
        b=wQYAuIFlBya/P3ly5Maaa6OaivvDeMKZtlzykV04CwArPvO36SxZ5NX4KLVn/rKXAC
         tTjjaDkby9VIrF/SDgA8m/XZQyMK6v10T0pp2Nz6C9+FwFrbz/XcwsPmklJappCMZUC8
         OI6gWOOPU2m6U0WHP+5MsFsm/e8kn/9cdTDQaKko5BjFwTpkRgCc5pb9vuWvIKHjWUUN
         jPXtkuLDjAMof5atUHu1y4fkAIyxTOI2P0RKOq4kvoPrEYS1KjR7oL1p1U4ivL5ZESMp
         ulRytc6pEHG0CMI61QPwgc/q7vbL9KbVDgqgab1E9DEFsqTYLn88yu2pacYDDFrDudNL
         vyow==
X-Forwarded-Encrypted: i=1; AJvYcCWn12mdwqLivCrREu4N66TQKVf6LyOHUaBeTa+OlhA8vQxCoFLriGa+DcoS7dxAT9duj+lnZCKGPnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPY1Fsln3JFsvfr7Z6rJ/ScH3ytB9JiVza0U667tusyRVzZtMS
	Eebkp9pmoa5sWCfVsb5pbf5wPhbY3Xo0T3/+UAQ70zGMm87bFGhS7pmhsS5MJlo=
X-Gm-Gg: ASbGncuMEqZHVQbD1hQFKl5JYa72qdmTQq/d2OF/BkfJkm9ejX8epQSm8CQP6h5V1y6
	7GdURApOVmRxXR5JSi6+QJJp/WlKVOdk1b6s7BXaSt1I6dA+rNIg2gBohOFl71+CVv2Yu6/32ER
	sY32I42o98I7dFvdIiL8sa5PkdTEeI2WN2u16xcsKNiakprrY101VrLah+VdzqN/MhRMB2sqZVJ
	Ey6pd+afYsyLSjz/H7oGZXdAJPgQWDe33a/SOOUwTjftQ7vbAZBxXh54EzElG5FN4rFme1jWfok
	tgA1/kJL3d061DTq1cUe
X-Google-Smtp-Source: AGHT+IF6R6FdHiaLo74wE1X6jX1NCiCEtExp9Ls/pKKKMUs7druasMl3HtpeC8xDX1WdOEXUiFLiQQ==
X-Received: by 2002:a05:600c:3147:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-43669a22df3mr470004165e9.11.1736167361462;
        Mon, 06 Jan 2025 04:42:41 -0800 (PST)
Message-ID: <1383b39a-6ca1-4ee5-9e8f-1e6e381f73db@citrix.com>
Date: Mon, 6 Jan 2025 12:42:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/perfc: Add perfc_defn.h to asm-generic
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
 <20250102192508.2405687-3-andrew.cooper3@citrix.com>
 <fc0b1bfd-9673-4ceb-9689-b7d4b7838d79@suse.com>
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
In-Reply-To: <fc0b1bfd-9673-4ceb-9689-b7d4b7838d79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 10:29 am, Jan Beulich wrote:
> On 02.01.2025 20:25, Andrew Cooper wrote:
>> ... and hook it up for RISC-V and PPC.
>>
>> On RISC-V at least, no combination of headers pulls in errno.h, so include it
>> explicitly.
>>
>> Guard the hypercalls array declaration based on NR_hypercalls existing.  This
>> is sufficient to get PERF_COUNTERS fully working on RISC-V and PPC, so drop
>> the randconfig override.
> And then perhaps also that from riscv64_defconfig?

Oh, quite possibly.

I'm not entirely sure what the point of negatives like that are in the
defconfig.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Preferably with the added change:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

