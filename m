Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC19D3CBC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 14:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841116.1256628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDl6V-0005Vh-VS; Wed, 20 Nov 2024 13:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841116.1256628; Wed, 20 Nov 2024 13:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDl6V-0005TG-Rt; Wed, 20 Nov 2024 13:50:47 +0000
Received: by outflank-mailman (input) for mailman id 841116;
 Wed, 20 Nov 2024 13:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JZW=SP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDl6U-0005TA-3i
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 13:50:46 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6de40b1b-a746-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 14:50:40 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53da353eb2eso7041328e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 05:50:40 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dffba13sm767786066b.95.2024.11.20.05.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 05:50:39 -0800 (PST)
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
X-Inumbo-ID: 6de40b1b-a746-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZkZTQwYjFiLWE3NDYtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTEwNjQwLjc1NDA3LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732110640; x=1732715440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zRouNAdArKjkjWjWS904hWd8Zi/vPRCjmMKGrFcSI9s=;
        b=jROCh8JU4ONqjtkUcs2l0x8xCT06xm25FaPEWjj+0a0vK2wGq54ABXx45NA6KRgXzq
         YzskGkJewSho30h3iFQrqlKFAcprOoMJv2Zm7QemUMFmReeMAqnbn7+9VgEBk39ZVFOa
         BPt3bP1v/MsTKYEV9N3XBg3qMMwndbxiWKzms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732110640; x=1732715440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRouNAdArKjkjWjWS904hWd8Zi/vPRCjmMKGrFcSI9s=;
        b=o1fkLh2v5Cke3PIvFFAizw18OLbiGmgGsmonNC86nN3OchD1zAsTS2xRTBIoXr5jWO
         ZpD3eqBz+0D0hR0kXayksTyEcPaOTMIACHz2vf0cPWUqm0RWtH1yz+1XlQFmgSbQkNPx
         OhiwZGVNVDEFsHAr5mTUsRun2rTFyDlaRVaY4I4a/4ll8xtaVaUvG24WTukJGxsozQwF
         anWbZTQObNCAh+KQoXYgMJBqCdFnRxzfdUmPWfXv8d6KT/vOwxZBIhCEV0yE8ZepNyYj
         Q7X/TYnsFRh6RVJnw7Wz+HDd2PXBifRD9dZoa/F2CEOpVjPFG3D6lAfNcCZ/3I4e6p1T
         78tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+t0zhepWeTFXv9WyeWj7/CLT+HZue1vnlQ+Hz56AwoId0jdIo5V+P7i7odjjRTmQb9+6bVO8hgeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDUdymvPrYTC7FZDYEEQsQj7m6ZTyL6rbEHmKL3NFOXW5jz9b4
	uJUYizjhgee2YjoGR9q/Puoe/AKpTBb9vczXvg7969IglRhFvHX8ocjtwL63XxUreddH5IyH5P/
	r
X-Google-Smtp-Source: AGHT+IE5eLNOTuU1jYAmgeWZXPmc+xGzkDP910R1qlv29Vic+7iZ7tX0CWtPVdkkrRv3jeLv1fOmWA==
X-Received: by 2002:a05:6512:a8e:b0:53d:a0a7:1a8d with SMTP id 2adb3069b0e04-53dc136377amr2176776e87.46.1732110639774;
        Wed, 20 Nov 2024 05:50:39 -0800 (PST)
Message-ID: <b8776e87-0975-43a6-886c-95ec98d0c357@citrix.com>
Date: Wed, 20 Nov 2024 13:50:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Only rescan features on successful microcode
 load
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119215827.2891332-1-andrew.cooper3@citrix.com>
 <590cc46e-c4e2-44bc-b339-6ffc609314ce@suse.com>
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
In-Reply-To: <590cc46e-c4e2-44bc-b339-6ffc609314ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2024 10:50 am, Jan Beulich wrote:
> On 19.11.2024 22:58, Andrew Cooper wrote:
>> There's no point rescanning if we didn't load something new.  Take the
>> opportunity to make the comment a bit more concise.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> @@ -911,14 +915,5 @@ int __init early_microcode_init(struct boot_info *bi)
>>  
>>      rc = early_microcode_load(bi);
>>  
>> -    /*
>> -     * Some CPUID leaves and MSRs are only present after microcode updates
>> -     * on some processors. We take the chance here to make sure what little
>> -     * state we have already probed is re-probed in order to ensure we do
>> -     * not use stale values. tsx_init() in particular needs to have up to
>> -     * date MSR_ARCH_CAPS.
>> -     */
>> -    early_cpu_init(false);
>> -
>>      return rc;
>>  }
> In principle with this rc could be dropped from the function.

Oh, so it can.  I think I did so in an earlier attempt, prior to
deciding to go down the route that is partially committed.

I'm happy to fold in the removal.  The incremental diff is:

@@ -873,7 +873,6 @@ static int __init early_microcode_load(struct
boot_info *bi)
 int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
-    int rc = 0;
 
     switch ( c->x86_vendor )
     {
@@ -913,7 +912,5 @@ int __init early_microcode_init(struct boot_info *bi)
         return -ENODEV;
     }
 
-    rc = early_microcode_load(bi);
-
-    return rc;
+    return early_microcode_load(bi);
 }


> It's then further
> unclear why early_microcode_load() needs to be a separate function, rather than
> simply being inlined here (as I expect the compiler is going to do anyway).

Both cognitive and code complexity.

"Probe and install hooks" is separate from "try to load new ucode if we
can".

They've now got entirely disjoint local variables, and the latter has
some non-trivial control flow in it.  It's liable to get even more
complex if we try to allow CPIO in an explicitly nominated module.

More generally, a separate function and internal return statements can
express control flow which can only be done with gotos at the outer
level, even if we fully intend the compiler to fold the two together.

~Andrew

