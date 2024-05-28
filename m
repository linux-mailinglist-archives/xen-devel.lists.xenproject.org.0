Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2FC8D2229
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 19:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731261.1136685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC0Jh-0004H3-8u; Tue, 28 May 2024 17:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731261.1136685; Tue, 28 May 2024 17:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC0Jh-0004FV-5j; Tue, 28 May 2024 17:08:53 +0000
Received: by outflank-mailman (input) for mailman id 731261;
 Tue, 28 May 2024 17:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sC0Jg-0004FP-3w
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 17:08:52 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3954c0c-1d14-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 19:08:50 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-43de92e234dso31031cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 10:08:50 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb16bed16sm44270981cf.17.2024.05.28.10.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:08:48 -0700 (PDT)
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
X-Inumbo-ID: f3954c0c-1d14-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716916129; x=1717520929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0VnGD27iR18NGYFpXaECx07fWw283SIdLHOT0uxClus=;
        b=t0QdmHiDrpi8fib8zqXOqUSgojul1ZTtdX2a7TgfIKtwauTZKhbWbLXDcNTt7CyGu3
         gZlL7j7UjQy7DmXldg6CIdDpNSyzk0wkHmzAhnh9SlazN60H3zWmmfcGQhhyaOVRmu82
         1ibnL+4K20nYHUATtdaqd13V6iRjKIZcwC0oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716916129; x=1717520929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VnGD27iR18NGYFpXaECx07fWw283SIdLHOT0uxClus=;
        b=VnSEV4HsuYnf13/5kOmmxwRbD0AfL41GGMLaNGZ1zemVAJDENT7MY5IlTyBRsFray3
         sMXrZWgKktm2i2U9ubC+KNj87BSiqSC7tAeJkPb9l8l4X8NyNRZPQ87smjCLwGGblv/6
         uPLW68VKX7rCiGhJ63ij9vM1K6XgB3mPyU97eZ5yGHc//0QIDmYPcssSmKpnw2cjkwHh
         9QLT8L8xZdcc1m3NFKy4rXh1ntE/xbfK9taWhECm/sslU3i0FN2u2cCIUgxCU83/E4Nh
         OFFLeXgSnF3gYUN2fWxWl3aAmXoIR928f/M9AW/aPQSaQUcQmKg+qGX/pcl3z4E/CWa7
         40zw==
X-Forwarded-Encrypted: i=1; AJvYcCVFSby+VsJ6UmBPqojy/MjfkXkwTk7QFUd8Tn+GpSURLZ71MtJoICeH1tsLqzWq9g0jfzcnVfJMYH9Fdxa1OWpXjTTOThT5iWnBMa0z4bM=
X-Gm-Message-State: AOJu0Yxv5/hjgrBTuDIKuKY72ko5wrybPxWi6afx+lvdzB+UrHKv8cb1
	YYtiNDyFg6/o60gGnnxboe1vIcBQ5Jk3b6BP7pl+1mhhOjB6hMi1xpY82KEC4Lg=
X-Google-Smtp-Source: AGHT+IFhs/t1q2nipb+JyQdfdLJnq6P3Rx+8boe6Rsfy5U1KI6yZCOz0RdeWrz+dCM4Ouw8LxFgHIA==
X-Received: by 2002:ac8:584a:0:b0:43a:d7a9:386 with SMTP id d75a77b69052e-43fafb19bdbmr256359691cf.17.1716916128882;
        Tue, 28 May 2024 10:08:48 -0700 (PDT)
Message-ID: <522f2449-030d-4b3b-9ace-5ff20ceafc2d@citrix.com>
Date: Tue, 28 May 2024 18:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] x86/ucode: Introduce --force option to xen-ucode
 to force skipping microcode version check
To: Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
 <20240528152943.3915760-4-fouad.hilly@cloud.com>
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
In-Reply-To: <20240528152943.3915760-4-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/05/2024 4:29 pm, Fouad Hilly wrote:
> Introduce --force option to xen-ucode to force skipping microcode version check, which
> allows the user to update x86 microcode even if both versions are the same or downgrade.
> xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2.
>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>

I think it would be better to stop the subject at "... to xen-ucode". 
The commit message itself covers what has changed.

> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 6f9dd2a7e431..b878edf2399a 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -13,6 +13,8 @@
>  #include <xenctrl.h>
>  #include <getopt.h>
>  
> +#include <xen/platform.h>
> +
>  static xc_interface *xch;
>  
>  static const char intel_id[] = "GenuineIntel";
> @@ -24,7 +26,8 @@ static void usage(FILE *stream, const char *name)
>             "Usage: %s [microcode file] [options]\n"
>             "options:\n"
>             "  -h, --help            display this help and exit\n"
> -           "  -s, --show-cpu-info   show CPU information and exit\n",
> +           "  -s, --show-cpu-info   show CPU information and exit\n"
> +           "  -f, --force           force to skip microcode version check\n",

I'd phrase this as "skip certain checks; do not use unless you know
exactly what you are doing"

which makes it very clear that people get to keep all pieces if they try
this.

Otherwise (and subject to the style cleanup in the previous patch),
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

