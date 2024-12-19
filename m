Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DF19F8887
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 00:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861531.1273499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOPz3-00068B-8o; Thu, 19 Dec 2024 23:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861531.1273499; Thu, 19 Dec 2024 23:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOPz3-00066d-6A; Thu, 19 Dec 2024 23:31:09 +0000
Received: by outflank-mailman (input) for mailman id 861531;
 Thu, 19 Dec 2024 23:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+GM=TM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tOPz1-00066X-97
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 23:31:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 512cccbb-be61-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 00:31:05 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so14869765e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 15:31:05 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4364b0532a6sm90498725e9.1.2024.12.19.15.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 15:31:04 -0800 (PST)
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
X-Inumbo-ID: 512cccbb-be61-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734651065; x=1735255865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ8bJilLUMHhGPiQmNgfzkalz0eG45Ag+CdTIDcQU2U=;
        b=ScQ0rc2wC5UoHHy27YE20uwX3mNDGi7aVR/drJYmgB1Gflq6KVpyD4FM+93H9/uB/T
         8+/7GpBUXO6xcYX8cLxuvoMgyehXNMmLFSmY/4oFmjQ/xdmTgIX+8Qnnh0WnZKOThXkB
         MtRJ/MNloCvYk0gQDgVPm4QVdSyph+3aXNxqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734651065; x=1735255865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJ8bJilLUMHhGPiQmNgfzkalz0eG45Ag+CdTIDcQU2U=;
        b=VyBLt6bD7rHN/IRneprO9Tv31FOfhOCPPFPqHdFhx5zDn3VREdrlNdoyofxPtxvLO0
         dqH6gROPpYFEXZXKp8HRQTHWXGCZ85j/jV6MkbqKiYqy+XXCnPUnUQf8VziUvts429vC
         wYSj6vQvJZ/OcazMMeXQETYgm2pjurpMGLQwW5R73w1oRd4d4m7K5qXI1PYBLoStlNu5
         y3PUiue4r1tmfPnRhq3QaGJeHqMypYdr8DFo3xtxY02meJ+U7roBlQ1oayBAjajfWbqm
         Ah69FTHYiiJzEff8CpBP3NghFC1moHogZgI48M+BEhMfXi7IeSdn9IKiI7lkGv69ZpIa
         kJZA==
X-Forwarded-Encrypted: i=1; AJvYcCVHwicFv11Dn6Jms2EXYEgg0O+nCstFi4ggrMZkWPfGGuJoXuUX1LmWLEqq64wj6Jng99mgjIdGHVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw55SNr4DrYfQ4/qHGuUoDyIoSbS5x0k5snQmvX8G3tUmepHPS8
	or8YR1YjpUFxZTs0xq43//j+d0OA0E/egnsAaDSwz2Oxf3sLszqvc4x9aXTtSC0=
X-Gm-Gg: ASbGncskqjXY8Gcalj770gsxca3UgJ/QNTlR+KKDLaQ+D0fYSUrJyM7fz01gxVFiQpc
	pif/yW2C3/j+wJd31c1B/KH8M9V/BHvE4N+bc0K4cY4WmtaJ6nnZWjFtUcofnBdUMVT1YRnjsnU
	iQcwXYIo8CpNRTX7myQA62Zi3lq+C85ek3TWDyQgWAxC9+KmzK60sTzMNVJEXmfvKwe4bZB1UqG
	gwzzGvij+eYgtVaVk/xuKd0N92hn9eBvb2uxBqwY3cSZBsGOsZqkUsA+zpydJHdd+392SFmLqk9
	AUu+7cHXDHDeuIQ+6JgQ
X-Google-Smtp-Source: AGHT+IF8A95+qGoEVGkNn/CsYU4bQ0SKBGBgamHY2X1wqAOeeXkjDUhCVM65skz13t42A7n4TGrgiA==
X-Received: by 2002:a05:600c:310a:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-4366854bfc0mr4916025e9.2.1734651064899;
        Thu, 19 Dec 2024 15:31:04 -0800 (PST)
Message-ID: <94a1fccb-5edc-4670-b1d0-48e3bdf17a12@citrix.com>
Date: Thu, 19 Dec 2024 23:31:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1734631969.git.w1benny@gmail.com>
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
In-Reply-To: <cover.1734631969.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2024 6:16 pm, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
>
> This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.
>
> This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.
>
> This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.
>
> Additionally, this feature simplifies the handling of race conditions in scenarios where an introspection tool:
>
> - Sets an "invisible breakpoint" in the altp2m view for a function F
> - Monitors guest page-table updates to track whether the page containing F is paged out
> - Encounters a cleared Access (A) bit on the page containing F while the guest is about to execute the breakpoint
>
> In the current implementation:
>
> - If xc_monitor_inguest_pagefault() is enabled, the introspection tool must emulate both the breakpoint and the setting of the Access bit.
> - If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT violation without notifying the introspection tool, setting the Access bit and emulating the instruction. However, Xen fetches the instruction from the default view instead of the altp2m view, potentially causing the breakpoint to be missed.
>
> With this patch, setting XENMEM_access_r_pw for monitored guest page-tables prevents EPT violations in these cases. This change enhances performance and reduces complexity for introspection tools, ensuring seamless breakpoint handling while tracking guest page-table updates.
>
> Petr Beneš (2):
>   x86: Rename _rsvd field to pw and move it to the bit 58
>   x86/EPT: Add Support for Paging-Write Feature

We're past final posting date for 4.20 now.

CC Oleksii as release manager.

However, it's a small patch series, and comes urgently on the back of
Intel ceasing all EPT-SPP support in November.

Given the timelines of the release, and how simple the series is, I'd
like to make an argument for including it at this juncture.

~Andrew

