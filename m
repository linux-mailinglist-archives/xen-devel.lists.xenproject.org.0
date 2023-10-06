Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A47BB59F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613524.954088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoiN7-0001yT-V2; Fri, 06 Oct 2023 10:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613524.954088; Fri, 06 Oct 2023 10:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoiN7-0001w8-Rs; Fri, 06 Oct 2023 10:47:53 +0000
Received: by outflank-mailman (input) for mailman id 613524;
 Fri, 06 Oct 2023 10:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qoiN6-0001w2-Bi
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:47:52 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb44a613-6435-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 12:47:50 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so273179f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 03:47:50 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020a5d4ace000000b00327cd5e5ac1sm1365673wrs.1.2023.10.06.03.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 03:47:49 -0700 (PDT)
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
X-Inumbo-ID: cb44a613-6435-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696589270; x=1697194070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t0rSCloZq4GvAHJPAki84R6+GutaNd3JbaDJiPVs1k8=;
        b=bcl5ZYRyr8Fb2cqKcsaD1hv2mAb+lI+Cj0AP+8ZXtgOCAePuvgmM1HCpIju4E705KP
         MpttFPcQ3p1Ga8LNX/gx3wESdwXdOHMo3TQVC5M7LiKz549eEL/8pOeNMerMI5216Gfl
         NbgudHtuOR9UDbYXwiuRNsjd0HeAZi9du6BIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696589270; x=1697194070;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0rSCloZq4GvAHJPAki84R6+GutaNd3JbaDJiPVs1k8=;
        b=BJNc3woIjreNt8efkxtlsb2exA/1FSDj+tJ9IZX163mHTnrUXOucPC4pncRA/8qs+E
         9Wv7JVh46ICKbsE7qZAkU0KnVgJa7R+KCkZLeG57SCUWtYbhL87hUV2ob9gHTMLgF5gG
         lyjZVTAjI4PByR4w2h1eTPSuu5CeYlYljEyGBPMr6tHzqzDZHorJJJFh1QZrPCk3LHCl
         R52G0gXEQ4niIAQg0xVqzjxhzY8dOiq6Y16MDHvM2JVeF9DkVXZMHzBgUt97cWLHDxT+
         cBwfGhj30QZsZl6PJSd3bTSZAf3JgKoyiItZ+tU8p3ECmqVXZ2hI583tKExwHSe3iRVk
         hXVw==
X-Gm-Message-State: AOJu0YxHMSsIkVdhV89Czcdc/Wngzz+iG2wDfCMH6IY7zWpD1qL+cgRU
	qQOUai78MpoybykinZK6wmVZDA==
X-Google-Smtp-Source: AGHT+IGUj4tJdd4UnslZ3c+cyHTrYeXiYlAgqkyc1w2x8HpVX5U4972fx7C/UDoJoAfTRXhStiD56w==
X-Received: by 2002:a5d:680b:0:b0:31f:a259:733 with SMTP id w11-20020a5d680b000000b0031fa2590733mr6685874wru.20.1696589269678;
        Fri, 06 Oct 2023 03:47:49 -0700 (PDT)
Message-ID: <ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com>
Date: Fri, 6 Oct 2023 11:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] domain: expose newly introduced hypercalls as XENFEAT
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-3-roger.pau@citrix.com>
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
In-Reply-To: <20231006091353.96367-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 10:13 am, Roger Pau Monne wrote:
> XENFEAT_runstate_phys_area is exposed to all architectures, while
> XENFEAT_vcpu_time_phys_area is currnelty only implemented for x86, and hence
> the feature flag is also only exposed on x86.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for doing this.

> ---
>  CHANGELOG.md                  | 2 ++
>  xen/common/kernel.c           | 6 +++++-
>  xen/include/public/features.h | 9 +++++++++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index e33cf4e1b113..41da710426f6 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -31,6 +31,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Add Intel Hardware P-States (HWP) cpufreq driver.
>   - On Arm, experimental support for dynamic addition/removal of Xen device tree
>     nodes using a device tree overlay binary (.dtbo).
> + - Introduce two new hypercalls to map the vCPU runstate and time areas by
> +   physical rather than linear addresses.

I'd suggest linear/virtual here.  Linear is the correct term in x86, but
virtual is the correct term in pretty much every other architecture.

> diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> index d2a9175aae67..cffb2f14a562 100644
> --- a/xen/include/public/features.h
> +++ b/xen/include/public/features.h
> @@ -111,6 +111,15 @@
>  #define XENFEAT_not_direct_mapped         16
>  #define XENFEAT_direct_mapped             17
>  
> +/*
> + * Signal whether the hypervisor implements the following hypercalls:

This is not what the hypervisor implements.  It's what the domain is
permitted to use.

There also needs to be a matching patch to public/vcpu.h to require
implementations to check for these feature bits before using the new
hypercalls.

Also,

diff --git a/xen/common/domain.c b/xen/common/domain.c
index b8281d7cff9d..df994bd30fd2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v
     {
         struct vcpu_register_runstate_memory_area area;
 
+        rc = -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
+            break;
+
         rc = -EFAULT;
         if ( copy_from_guest(&area.addr.p, arg, 1) )
             break;

and a matching one for XENFEAT_vcpu_time_phys_area because I'm even more
serious about this becoming a domain controllable setting following what
OSSTest had to say overnight.

~Andrew

