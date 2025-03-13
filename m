Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B250DA60159
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913413.1319456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoLG-0007kP-1s; Thu, 13 Mar 2025 19:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913413.1319456; Thu, 13 Mar 2025 19:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoLF-0007ix-UP; Thu, 13 Mar 2025 19:35:41 +0000
Received: by outflank-mailman (input) for mailman id 913413;
 Thu, 13 Mar 2025 19:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsoLE-0007ir-Pn
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 19:35:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5835691e-0042-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 20:35:39 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so8861105e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 12:35:39 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74cfa5sm63028495e9.10.2025.03.13.12.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 12:35:38 -0700 (PDT)
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
X-Inumbo-ID: 5835691e-0042-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741894539; x=1742499339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R3jsyrBbLWibeofmp9YUXQYQok3XUyGchQXvUaE2978=;
        b=IcP6JFO4cP3t2/Z1QpBz2gjUEH4kjjtI+ZSTTN8ABiW7UCGsm5Pc00d+OUJmrGgAH3
         m9jVSbGICPPaN/ILMfMw/nPmEFCL1kWGiLC6Ktj0cJBUDgcWXtjcMaVJgqdn0OGjMoWo
         eEDHCYsaTDVtIei1/zCZJ1FPNa1JhX8juKVQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741894539; x=1742499339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3jsyrBbLWibeofmp9YUXQYQok3XUyGchQXvUaE2978=;
        b=icSS91c/fLraDwhLg/5K1hwoW8XX4PqqEN7tN1Lh4WEl2R5PduJwlbWSoNZmno1wXT
         4WhIXwvhaAjguqQhDYeWRCTgE0PHMP/Wr9ElC3vfVp8/HucyaTYCOsMTCUlfrV0zywSH
         5hZhXW3XQ8k4Y8+OnC5mR8O7Ykh+WoyjkscCDqyPP4GzyhJLDk6d1OEmrkLtdArOaeIo
         RI3WdmFYx7EpzKgUZSFk9RJIuERCWJynrUqMRIWpXtCWM78ONVG6bLF/7NDcg1NEE2jm
         lIgzCU89yIecU22yYOukW6rjiU3VTriNaRlK28MAsVUDc410Li4Pt0kJP+iW1nj6LhV6
         dnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjnMiYYhiAECyPJySADkCyeVtDkyj3S080IDb+CAFcGxCGkNid3jZVXEybAVMzbNf6rXKQFgVxr5Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoAMm4FlRFVSf48MJRpq0g+jwCCw7Icp/f5w4Sh1yop+/JYTFE
	2HkEXqJ2nEl3I9KXM/OtW35qfz8wGqIaFaSp711Mdw8RqvT5KG9fHP9J+Xntn3c=
X-Gm-Gg: ASbGncvHcFrdUDBrD6ELnDwwRfIUPLJekbOm0WgAtXeW+Hypd7CqwTplt/NGunR1bDZ
	idq0uoig9peARnUVNPXoIlaQNDiBLeVO0kRCBsYwb2dyQOOkXnbSaBMNWFPaXf7wWwiF6iR+bSm
	9GCLsNMJuDa8ruzV2ae1iS08HURiePPKqE40gbUgHWx1MUrO4AcPh3EKIakZaZEuiTZSLy6/KNc
	AxcU8HhMBdebBEUNHfuUx8LDZbS7OhUyggEPCAgLB7d9ymQxr92ExM07i176ZEwrl88H6sEAyIx
	7O7vD60uogfBa87zbuacQwCfILsgDgZEmb/I3Ke6dk7cv+csZyFIjRETzvp6gMq58DwAFVCM1F2
	psC8h9mB9
X-Google-Smtp-Source: AGHT+IE8sTAtjhj/7icwZAKoMxdYfZML0QN+yciWb8qZtOyVjqjLDDShC9+6SaIVwI6Rk8NQPNrl5Q==
X-Received: by 2002:a05:600c:3110:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43d1e48edd3mr2100345e9.18.1741894539122;
        Thu, 13 Mar 2025 12:35:39 -0700 (PDT)
Message-ID: <8ebbe639-119b-4f13-b660-c492175bbef4@citrix.com>
Date: Thu, 13 Mar 2025 19:35:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/dom0: placate GCC 12 compile-time errors with
 UBSAN and PVH_GUEST
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-4-roger.pau@citrix.com>
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
In-Reply-To: <20250313153029.93347-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> When building Xen with GCC 12 with UBSAN and PVH_GUEST both enabled the
> compiler emits the following errors:
>
> arch/x86/setup.c: In function '__start_xen':
> arch/x86/setup.c:1504:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
>  1504 |             end = consider_modules(s, e, reloc_size + mask,
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1505 |                                    bi->mods, bi->nr_modules, -1);
>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/setup.c:1504:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
>   686 | static uint64_t __init consider_modules(
>       |                        ^~~~~~~~~~~~~~~~
> arch/x86/setup.c:1535:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
>  1535 |             end = consider_modules(s, e, size, bi->mods,
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1536 |                                    bi->nr_modules + relocated, j);
>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/setup.c:1535:19: note: referencing argument 4 of type 'const struct boot_module[0]'
> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
>   686 | static uint64_t __init consider_modules(
>       |                        ^~~~~~~~~~~~~~~~
>
> This seems to be the result of some function manipulation done by UBSAN
> triggering GCC stringops related errors.  Placate the errors by declaring
> the function parameter as `const struct *boot_module` instead of `const
> struct boot_module[]`.
>
> Note that GCC 13 seems to be fixed, and doesn't trigger the error when
> using `[]`.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

(I swear I've seen this before, and already fixed it once by switching
to a pointer...)

