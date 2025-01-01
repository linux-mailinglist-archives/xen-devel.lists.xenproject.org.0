Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444989FF436
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jan 2025 15:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863699.1275071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSzpN-0004D6-6g; Wed, 01 Jan 2025 14:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863699.1275071; Wed, 01 Jan 2025 14:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSzpN-0004Ah-0h; Wed, 01 Jan 2025 14:36:05 +0000
Received: by outflank-mailman (input) for mailman id 863699;
 Wed, 01 Jan 2025 14:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJje=TZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tSzpL-0004Ab-Jj
 for xen-devel@lists.xenproject.org; Wed, 01 Jan 2025 14:36:03 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c685a0-c84d-11ef-a0db-8be0dac302b0;
 Wed, 01 Jan 2025 15:36:01 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso68574035e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jan 2025 06:36:01 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b119d7sm454685025e9.20.2025.01.01.06.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2025 06:35:59 -0800 (PST)
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
X-Inumbo-ID: b8c685a0-c84d-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735742160; x=1736346960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R/82tL1c/sWjbeXwr5bYXdKAwElFeI4Aa+GF0KAKptQ=;
        b=oIHBBj22Ar64QGeyh8FTQpCIscZzZqbtoN6zV5gcsA+fCZOkU6vqvtmIG2e1f1DnXg
         +6/SGmmmW8oE7fXrL7JcfTGvBNfBcvuDM5tpblwWyAHFu/pzMVigdZ+l3Es+4BGFHVsU
         uOzN042KhSzY21DlHTZGLn7n2iM5rfOEQN9Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735742160; x=1736346960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/82tL1c/sWjbeXwr5bYXdKAwElFeI4Aa+GF0KAKptQ=;
        b=FHoCZMjDUaszx5jrvVlGBjOo3a7Ahn63NHXomUCDET1M1AJRD8A4U2zhIKp1YvSOId
         DI7/Kt+b7Ncjwd6HL7gS28yRsdbo4NbKtHbv4oi3El6za2ILm5rICWF1ilSL5+TDG/8e
         mcV5YjlD3+MD4KXppgkVBBXvKTodtx11CwP7ximglxgdliszw4v9qriqasvNXJ5Cvq/f
         Eg6kxfwAYMmlrSMIEhQs/kIJx+zi+cj4dohq99jzZvQZs84oRL3kuDgjLRCnDBcaUHLJ
         nQmIpGjJxdq3s6QNgPlKoF8WLYGnQLXU7gDzn0zHC3XFaEe6IDzHr2ZbDnDsG3exy/Y7
         vvvQ==
X-Gm-Message-State: AOJu0YxMixDG5kZIAD2lAf13rXcPF+ln5CSpsvoq0m2nyqmA0jQIpnx/
	qte1s2JP0/GF+3Th6UesYojZSZWccsjwwxN0OySmhaR/GNRDY02vlRB73DFD51c=
X-Gm-Gg: ASbGnctNqpzPNQDfbP73BXsR6m+anuZUtvwVyjV5oDxFQCGiVPpjUQfgxnt8wsxokHu
	e/el5d1HnPydpfutIkAWpHlBNsE14XlswsLC9qgjLGFGh/DGQYofSSYGdZj1vYuKxSQoucTyBlh
	IyoBjCh1FRBrdqaLyxdvAS9Wa/SlCg/bVe55jpfJuN5swulKGBrzMT8WEd3uL8Qn2ghBRQ2Sdlk
	EQlgTl/Qq0LMhs+cFD78cz7XTQ1zXsVLPE7rnDZkrHp8qDjmHDPXaCT2jHnL5OoN5w=
X-Google-Smtp-Source: AGHT+IHkvSk6kJxA3d22XbQHvCweZ8xaEF+ADNkxSg5uGBHeB7goQWulrd+4S8H1OIkjzBZ6UUrGKA==
X-Received: by 2002:a7b:c3d9:0:b0:434:ea1a:e30c with SMTP id 5b1f17b1804b1-4365c79aa7dmr403915285e9.13.1735742160528;
        Wed, 01 Jan 2025 06:36:00 -0800 (PST)
Message-ID: <c2ef70ce-af2f-4001-8dd4-d8930c9f8952@citrix.com>
Date: Wed, 1 Jan 2025 14:35:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/traps: Rework LER initialisation and support
 Zen5/Diamond Rapids
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20241231192002.1753737-1-andrew.cooper3@citrix.com>
 <Z3RvWJvdB68sVhqZ@mail-itl>
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
In-Reply-To: <Z3RvWJvdB68sVhqZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/12/2024 10:25 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Dec 31, 2024 at 07:20:02PM +0000, Andrew Cooper wrote:
>> AMD have always used the architectural MSRs for LER.  As the first processor
>> to support LER was the K7 (which was 32bit), we can assume it's presence
>> unconditionally in 64bit mode.
>>
>> Intel are about to run out of space in Family 6 and start using 19.  It is
>> only the Pentium 4 which uses non-architectural LER MSRs.
>>
>> percpu_traps_init(), which runs on every CPU, contains a lot of code which
>> should be init-only, and is the only reason why opt_ler can't be in initdata.
>>
>> Write a brand new init_ler() which expects all future Intel and AMD CPUs to
>> continue using the architectural MSRs, and does all setup together.  Call it
>> from trap_init(), and remove the setup logic percpu_traps_init() except for
>> the single path configuring MSR_IA32_DEBUGCTLMSR.
>>
>> Leave behind a warning if the user asked for LER and Xen couldn't enable it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> For 4.20.  This is needed for Zen5 CPUs (already available) as well as Intel
>> CPUs coming shortly.  It also moves some non-init logic to being init-only.
>> ---
> ...
>
>> @@ -2201,6 +2155,42 @@ void __init init_idt_traps(void)
>>          this_cpu(compat_gdt) = boot_compat_gdt;
>>  }
>>  
>> +static void __init init_ler(void)
>> +{
>> +    unsigned int msr = 0;
>> +
>> +    if ( !opt_ler )
>> +        return;
>> +
>> +    /*
>> +     * Intel Pentium 4 is the only known CPU to not use the architectural MSR
>> +     * indicies.
>> +     */
>> +    switch ( boot_cpu_data.x86_vendor )
>> +    {
>> +    case X86_VENDOR_INTEL:
>> +        if ( boot_cpu_data.x86 == 0xf )
>> +        {
>> +            ler_msr = MSR_P4_LER_FROM_LIP;
> msr = 
>
> and ...
>
>> +            break;
>> +        }
>> +        fallthrough;
>> +    case X86_VENDOR_AMD:
>> +    case X86_VENDOR_HYGON:
>> +        ler_msr = MSR_IA32_LASTINTFROMIP;
> ... here?

Yes.  Serves me right for a last minute refactor.

> But also, why temporary variable?

Code gen (ler_msr is a global so checking it at the end needs to come
from memory), and defence in depth (it introduces a path through the
function where we failed to find the MSR but still turned LER on anyway
if there was an unexpected value there already).

~Andrew

