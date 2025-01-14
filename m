Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E458A10330
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 10:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871080.1282122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdQm-0006Qy-4v; Tue, 14 Jan 2025 09:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871080.1282122; Tue, 14 Jan 2025 09:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdQm-0006OS-24; Tue, 14 Jan 2025 09:41:52 +0000
Received: by outflank-mailman (input) for mailman id 871080;
 Tue, 14 Jan 2025 09:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXdQl-0006OM-2V
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 09:41:51 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c69938eb-d25b-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 10:41:48 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fdafso10798339a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 01:41:48 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95aedf6sm609598166b.138.2025.01.14.01.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 01:41:47 -0800 (PST)
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
X-Inumbo-ID: c69938eb-d25b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736847708; x=1737452508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qbKZ/I5/BSf1C9gMrLhzIhsUeM5QTjxrFIgWSD9Ya2c=;
        b=PKjcozhnW0nTv+EcKImYPi88uepsqLP4d1Mn5WzvkVWSeQ/gDeNTEQXVCc7J+9DCjC
         OJZHggS2jDfqjOMv/Rbo9pZ7l4bssxKrW7Ew/IZHt2qJeQ5NbLQoo08etpNULnA6vEZr
         wu8mX6VB1aLUE7kMulFwIm6umetJfcyoqL85g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847708; x=1737452508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbKZ/I5/BSf1C9gMrLhzIhsUeM5QTjxrFIgWSD9Ya2c=;
        b=XA6WzCTXGp9/XxObUxIfn8x9MBJ9MLfvU0k3pL0sZHeS8NMITOrJYmKqbOjOL4gDF9
         WAxbUPju4QwqjDeqRS0jTy+gHoYPZNl4ra4uwjElGo5BvYQMcwHXOYiSXZYxzgxIycy0
         Q1JAFJQ5NG916yspJCZyV2prSBcPokU1FO8vM1T9Cq9z31YleGiKp+meLRTaSqez4/Us
         9rU3BJC/hVU7GgmUb0cqpG8P9WpnUYBvB64BikZRiKZSVk6xRsIuCmX2haSb7d+FPsfF
         FMjLLvZI+2O07LVzfBCpFF1iolqRpvQlICcs9xTZd594gDM0cSqncWgC8DoIuex+UDIX
         8NOA==
X-Forwarded-Encrypted: i=1; AJvYcCUvvCsr2lRVoTZzfj9SPN61ThnEKcFmMMVqXuX5G2CcjFrBsrpU+xZghKd906k3XY73TU7MeWq3nFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyA7E0p2lUpcxvNWT4XH8PMNoroyhbXA42b+v5WE3JMTOI9e5q3
	AFvo6mETQtyWGeRsHFaUn6U8r4bFqWtm1Fz3yimnD+EK2cu4cZgwWlVxgxp+oEs=
X-Gm-Gg: ASbGnctLO7sKqZCclzxIzTfENR5Mws5NoT/SvBm99fiSzmBr2p8Vp8fIo/zoih0btno
	k/hIuQ5oa8Xkb2W37Xpxq1vmfao9WXkG2rHzdeMiee6Z5iFpQoeSdrMULkqrxruesMA3rgymoEq
	oLTwzA8RIwXakfMRMbWgZ757taxHGyrJEm+OIsHUu98hEHJ5vtBkfXZyVaV55YrPsmvlQ6mji0m
	kVwyMLZ7FKHfgYAUX/vmK/yTS07HN0IQlmqgfSLSxWEfEFkNTLgmHTjXR2bgIOFBU4OwbM1XWHC
	6rznxWUQVHvggx6KW+E/
X-Google-Smtp-Source: AGHT+IHbY3/lzykXKUtBYmNvnWmFFA6MsHqSTLTSvu6XNPKaAdQeredSGb4Xw6Vbx3Hvehvp2C6a4Q==
X-Received: by 2002:a17:906:6a26:b0:aaf:73e4:e872 with SMTP id a640c23a62f3a-ab2ab16a9bbmr1768494966b.3.1736847708232;
        Tue, 14 Jan 2025 01:41:48 -0800 (PST)
Message-ID: <465406d2-5921-4c52-a95d-b3781b4184e8@citrix.com>
Date: Tue, 14 Jan 2025 09:41:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] intel/msr: Fix handling of MSR_RAPL_POWER_UNIT
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <0ac778dbcc7ab383447abe672225ff77b0d4802e.1736793323.git.teddy.astie@vates.tech>
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
In-Reply-To: <0ac778dbcc7ab383447abe672225ff77b0d4802e.1736793323.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/01/2025 6:42 pm, Teddy Astie wrote:
> Solaris 11.4 tries

Is it only Solaris 11.4, or is the simply the one repro you had?

Have you reported a bug?

>  to access this MSR on some Intel platforms without properly
> setting up a proper #GP handler, which leads to a immediate crash.

Minor grammar note.  Either "without a proper #GP handler" or "without
properly setting up a #GP handler", but having two proper(ly)'s in there
is less than ideal.

> Emulate the access of this MSR by giving it a legal value (all values set to
> default, as defined by Intel SDM "RAPL Interfaces").
>
> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Does it have a risk of negatively affecting other operating systems expecting
> this MSR read to fail?

It's Complicated.

RAPL is a non-architectural feature (on Intel; AMD did it properly).  It
does not have a CPUID bit to announce the presence of the MSRs. 
Therefore OSes use a mixture of model numbers and {wr,rd}msr_safe() to
probe.

I expect this will change the behaviour of Linux.

~Andrew

