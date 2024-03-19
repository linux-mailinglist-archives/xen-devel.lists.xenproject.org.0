Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4858F8803A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 18:40:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695547.1085380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmdRb-0000X9-9R; Tue, 19 Mar 2024 17:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695547.1085380; Tue, 19 Mar 2024 17:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmdRb-0000V6-6g; Tue, 19 Mar 2024 17:40:11 +0000
Received: by outflank-mailman (input) for mailman id 695547;
 Tue, 19 Mar 2024 17:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmdRa-0000V0-0O
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 17:40:10 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba0fd701-e617-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 18:40:08 +0100 (CET)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7e0a4b2d777so87994241.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 10:40:08 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jn10-20020ad45dea000000b00690dd47a41csm6716887qvb.86.2024.03.19.10.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 10:40:05 -0700 (PDT)
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
X-Inumbo-ID: ba0fd701-e617-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710870005; x=1711474805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rrL9Kz+ZKM/DM784P4UlmLyF0ehyJ9P9HDQ8QX8yhXk=;
        b=lgC1TV0l+nZM24pO5GBHU5DHkTjwd14IDwqEV9vHhPDmxcax7qhZw59d9RkUpSU5xo
         hyHPKgdjXHJaQQsZiA36hVZVbBOGOdPVtpHK/R1wtwh9OPttvQVuD1L8i1QWBGmHkxGt
         aspwmRxmU3rCalGTtKhutD+ayB7FFKP3CzDI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710870005; x=1711474805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrL9Kz+ZKM/DM784P4UlmLyF0ehyJ9P9HDQ8QX8yhXk=;
        b=pa8AMISoqVHZu7rv9ZYDOPXqnVO50SwlLCWFvB//5htUZGxA8c3KCu43G0/euW9q6y
         VPYyLu8pXEZmLN5KeGdHM9WvRB87uSz9du2bKyslLCrAlH7zg63Xly78uSj66jBv0nMF
         OoFC4ZtYG7sjV2QE+P2XP39gxmhjDROHr3ANdB6ug7tuE9ihwTtDUwMINgdo/6BMcSsU
         LwH48RIWTRq6lUW7A5Du4Slnxap1KtGrc4BEKZZ/YyADhNdJImWROh82An5EB8pzEAEr
         rx7vmQguuQMg78EYWOcgFoTUKXOoZ4NHAZyvv5Ci2rWs1f5Umxdk5OEnDk0lcSSUuuSC
         aoJQ==
X-Gm-Message-State: AOJu0Yw/h9GC1ejjxKsu9z+uwvk9yDhu4VzUcUh1Z637+VHI0AjAcRJC
	xHUn3P3CW7maZW+9H5QDNKZubpUkNyLv4LbVX9u+GYh73OS4rKLjt07wyMRm9Su/JtsOWID587K
	s
X-Google-Smtp-Source: AGHT+IH+czLzwWWnZk1urz4FDtf9C2NKC9ZwJiOIcHr+FcmaBdlBZJxL8Tet126APtKnudnCgmZAxg==
X-Received: by 2002:a67:b915:0:b0:476:6a20:bdd6 with SMTP id q21-20020a67b915000000b004766a20bdd6mr10493362vsn.31.1710870005506;
        Tue, 19 Mar 2024 10:40:05 -0700 (PDT)
Message-ID: <8eb3d0d4-daf2-40a4-83b6-d3726e02814f@citrix.com>
Date: Tue, 19 Mar 2024 17:40:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2024 6:13 pm, Andrew Cooper wrote:
> All of these are informational and require no further logic changes in Xen to
> support.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
>
> I'm not sure about FSRSC as a name, but it definitely beats AMD's longhand
> name of FAST_REP_SCASB.
> ---
>  tools/misc/xen-cpuid.c                      | 5 +++++
>  xen/include/public/arch-x86/cpufeatureset.h | 8 ++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 51efbff579e6..b562ee839d38 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -91,6 +91,7 @@ static const char *const str_e1c[32] =
>      [24] = "perfctr-nb", /* [25] */
>      [26] = "dbx",        [27] = "perftsc",
>      [28] = "pcx-l2i",    [29] = "monitorx",
> +    [30] = "dbext2",
>  };
>  
>  static const char *const str_7b0[32] =
> @@ -199,11 +200,15 @@ static const char *const str_7a1[32] =
>  
>  static const char *const str_e21a[32] =
>  {
> +    [ 0] = "no-nest-bp",    [ 1] = "fs-gs-ns",
>      [ 2] = "lfence+",
>      [ 6] = "nscb",
>      [ 8] = "auto-ibrs",
> +    [10] = "amd-fsrs",      [11] = "amd-fsrc",
>  
>      /* 16 */                [17] = "cpuid-user-dis",
> +    [18] = "epsf",          [19] = "fsrsc",

It occurs to me that I need this hunk too.

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 25d329ce486f..bf3f9ec01e6e 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -329,6 +329,10 @@ def crunch_numbers(state):
         # In principle the TSXLDTRK insns could also be considered
independent.
         RTM: [TSXLDTRK],
 
+        # Enhanced Predictive Store-Forwarding is a informational note
on top
+        # of PSF.
+        PSFD: [EPSF],
+
         # The ARCH_CAPS CPUID bit enumerates the availability of the
whole register.
         ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
 

To cause EPSF to disappear properly when levelling.

~Andrew

