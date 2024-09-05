Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C896DF95
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 18:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791279.1201143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFJt-0005HW-PQ; Thu, 05 Sep 2024 16:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791279.1201143; Thu, 05 Sep 2024 16:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFJt-0005FR-Mp; Thu, 05 Sep 2024 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 791279;
 Thu, 05 Sep 2024 16:26:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smFJt-0005FL-1i
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 16:26:53 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8238875-6ba3-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 18:26:51 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so1093584a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 09:26:51 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc69a222sm1373050a12.69.2024.09.05.09.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 09:26:49 -0700 (PDT)
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
X-Inumbo-ID: a8238875-6ba3-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725553611; x=1726158411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e4/mzYTPF2eEjdRQ8NF8VlYuW61bsKl/xdIwc89O59Q=;
        b=qNI2LOM9T4zzEeCP8p/K4KVlpVPIMk030pdrDPxPqNukk4yPvg/CxQgqCLZt4fLVLW
         cp+yQduq+vfLzpAdIynI+KPBvMyYnc6InP3Qn/pwyL5mhKvDRZFcqkckdzX9nAprJtPQ
         neRm+SyjHu7j9rfNIXH22eo355Y/aZnTg3LWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553611; x=1726158411;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4/mzYTPF2eEjdRQ8NF8VlYuW61bsKl/xdIwc89O59Q=;
        b=BYhnp/Z5w2kjI5eEHNHvstO0UIuEOayj8oqmfujsQslkatyk6gL1tFX68dsOa2TnD6
         GfS01oAEVVBuaSyonvEHkMamNN5AglTLfuTUZW8JBh3Gk4V8mI775DSf93B3feBK4z6d
         wXw7klLMMp64NBgK3v9609QktDedqmuMmXLVCcc1HLtUoiVuLuN98Jo8mc1AvcDGWAf+
         weXkQilhJWugM1zhV01DIdS8MWjJadzGIQIRTSCt2gqe36vnjPZYCeDbQ3V37TG+k3ew
         944U7gP10vMAJDaL3Dl73Xr797VOSzdMFtdcCGgd+0uRCRL42ouLKtmO3MgH2t9XvQjU
         hlYQ==
X-Gm-Message-State: AOJu0Yx9WTCiolZt4JABRu8hR3kr9/Wxqg1EL3pPcsnDIkdrzTP2IZrY
	l4NvXn4N63EfNi8R8uyRAUCtHZ3pQn8RL+y4rPGCdS7QZ+bow2o50/wtUPN/Jay7kOvxvrdyqK+
	6
X-Google-Smtp-Source: AGHT+IEDeO3/e7A5a6X8S9IKk97cL6VrCqAh0CDT7jcnh3dCRL/TtZsOU3T7KLqPjAbgHJtw3CUu1A==
X-Received: by 2002:a05:6402:3584:b0:5be:eeb3:b9d with SMTP id 4fb4d7f45d1cf-5c21ed3f5b9mr18006757a12.9.1725553610421;
        Thu, 05 Sep 2024 09:26:50 -0700 (PDT)
Message-ID: <fa8e61bb-2096-4db7-9c70-7e005b433e16@citrix.com>
Date: Thu, 5 Sep 2024 17:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [multiple_bits_set()] New Defects reported by Coverity Scan for
 XenProject
To: xen-devel <xen-devel@lists.xenproject.org>
References: <66d82f97b33b_1b57b72dd7f1bb799c607fc@prd-scan-dashboard-0.mail>
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
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66d82f97b33b_1b57b72dd7f1bb799c607fc@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 10:59 am, scan-admin@coverity.com wrote:
> Hi,
>
> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
>
> 1 new defect(s) introduced to XenProject found with Coverity Scan.
>
>
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
>
>
> ** CID 1618898:  Integer handling issues  (INTEGER_OVERFLOW)
> /tools/firmware/xen-dir/xen-root/xen/arch/x86/cpu/vpmu.c: 676 in do_xenpmu_op()
>
>
> ________________________________________________________________________________________________________
> *** CID 1618898:  Integer handling issues  (INTEGER_OVERFLOW)
> /tools/firmware/xen-dir/xen-root/xen/arch/x86/cpu/vpmu.c: 676 in do_xenpmu_op()
> 670         switch ( op )
> 671         {
> 672         case XENPMU_mode_set:
> 673         {
> 674             if ( (pmu_params.val &
> 675                   ~(XENPMU_MODE_SELF | XENPMU_MODE_HV | XENPMU_MODE_ALL)) ||
>>>>     CID 1618898:  Integer handling issues  (INTEGER_OVERFLOW)
>>>>     Expression "_v - 1UL", which is equal to 18446744073709551615, where "_v" is known to be equal to 0, underflows the type that receives it, an unsigned integer 64 bits wide.
> 676                  multiple_bits_set(pmu_params.val) )
> 677                 return -EINVAL;
> 678     
> 679             /* 32-bit dom0 can only sample itself. */
> 680             if ( is_pv_32bit_vcpu(current) &&
> 681                  (pmu_params.val & (XENPMU_MODE_HV | XENPMU_MODE_ALL)) )

I have to admit to being rather disappointed with this.

Yes there is a chance of underflow, but this is bit-pattern logic on
unsigned numbers and works irrespective.

But, I have no idea why this was singled out of the 3 examples, or
indeed how to persuade Coverity that underflows aren't relevant to this
expression.

~Andrew

