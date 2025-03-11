Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF4A5D0FE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909246.1316237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6Vn-0006u8-T9; Tue, 11 Mar 2025 20:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909246.1316237; Tue, 11 Mar 2025 20:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6Vn-0006rk-Pl; Tue, 11 Mar 2025 20:47:39 +0000
Received: by outflank-mailman (input) for mailman id 909246;
 Tue, 11 Mar 2025 20:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6Vl-0006pI-VD
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:47:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 107a3b30-feba-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 21:47:36 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso118064f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 13:47:36 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb79cfsm19141697f8f.10.2025.03.11.13.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 13:47:35 -0700 (PDT)
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
X-Inumbo-ID: 107a3b30-feba-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741726056; x=1742330856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=82Mm5p6bksajp0X2Xncut30XQtZZHxMRhwNcOGR9BMQ=;
        b=G/wg6NTkcTeey8IJnJFW4yzUM17BBl5xkoryfCvjSkTV4jmXhqF2AT0zuXwXvFS0nk
         P7yAjxYJmG+Uxe8x8ESXpV3zBF/sr2nPTIXPrsKoTBnaFKCSSQm4ZgR2MBid6LG1NLmd
         x7BjR56kdVofBYK4eR2UdLMUrT3IXQe5hfZFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741726056; x=1742330856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82Mm5p6bksajp0X2Xncut30XQtZZHxMRhwNcOGR9BMQ=;
        b=vRSN2zLpp+MvH/1PYv7cH5+oImj8Zhngc3YDLkzfaBcYeovdJOFiJRuH8zTLccF95b
         OkAYNA56hP4DFtnMA2divR0KVamOPUtKlxRNmHpIxsEscBQWUpRnPo8m0IQR7Vd0ufSr
         aJ0NHkLYjDTg8xhFoElRXJ9UbVmVTXUd0H5D/W92CQN6rXqS42JZwNmDNAB2TNi9RFdv
         awKSnH/b6fOF2srJunvHYXvacO9adfOX2IHAXNgXh0vMR6v0Pr1BzdgDF1JLt3gvCiAp
         nyB99587twrusf/7E6/y9ILyPUla3Ps7iC2ga4827TNgJ2fodTZIIvRIaJwEsvTwUTaK
         mr1g==
X-Forwarded-Encrypted: i=1; AJvYcCUM4ERTymFRajf/Qx2HXqzJb+vCoJZmXKic/iQuoNnFvFijurtlseAAawTYHuxe31pv7sgABck4He0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpPZmrhLsfVur4hAsWVadTfUSXy2F7u6O74KTs5aQFjrfR71Si
	tFaK7L8bfwkaQgXVpEDJXxehb2C1791e55+RKoJaRIK5ffGAe5hFiSLk/Hz5iyw=
X-Gm-Gg: ASbGnctNdm3kHJJRK4L5dbqp/sB6BndZ+VAzZXjGEzGNpkOekzFKMR6LCAL4WHjJbWX
	iD1W8PfwuVJYdjP4j3yUH1bZQPz+7PCrwptlAjq42a7eqUoCANSxeWR7l+U+A1FJl15Dm+7W0ln
	CNVdIpajbPPZOxpVKxR4/9J1hEdN9L4CrJkeiGdGqt5+ND6V9LrPuFPu6eYb2VEOoPni03LN9/B
	MPfWAgP0us5QMIrzT7aKmTEL1f3X6PWF7N+mqxx1DYKoMbaA0P1P81GOGPv8hLUtUpErmwegNBQ
	nrYWDfPd0QPo9fQ2vktn5Tepkk6F/xRrgx4c9+RNLybkeVDaL4dfeX7yPMrCaFF+Qba4ocNr943
	wlDmDChI+
X-Google-Smtp-Source: AGHT+IH2bhxmREu+ZTdDCyLDzA8MyhnABf90r7sd5sBWIA80xKQPpY91zgKxRUnsTLcAgAOSQS65yQ==
X-Received: by 2002:a5d:64e4:0:b0:391:865:5a93 with SMTP id ffacd0b85a97d-3926d123ba9mr6185123f8f.22.1741726056118;
        Tue, 11 Mar 2025 13:47:36 -0700 (PDT)
Message-ID: <4bff530c-9f96-4b59-b6cb-86349c576690@citrix.com>
Date: Tue, 11 Mar 2025 20:47:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the
 trampoline
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106112652.579310-1-andrew.cooper3@citrix.com>
 <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
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
In-Reply-To: <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/01/2025 11:54 am, Jan Beulich wrote:
> On 06.01.2025 12:26, Andrew Cooper wrote:
>> Regular data access into the trampoline is via the directmap.
>>
>> As now discussed quite extensively in asm/trampoline.h, the trampoline is
>> arranged so that only the AP and S3 paths need an identity mapping, and that
>> they fit within a single page.
>>
>> Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
>> expected of the trampoline to be mapped.  Cut it down just the single page it
>> ought to be.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.  However,

> on the basis that this improves things. However, ...
>
>> --- a/xen/arch/x86/x86_64/mm.c
>> +++ b/xen/arch/x86/x86_64/mm.c
>> @@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
>>  {
>>      BUG_ON(num_online_cpus() != 1);
>>  
>> -    /* Remove aliased mapping of first 1:1 PML4 entry. */
>> +    /* Stop using l?_bootmap[] mappings. */
>>      l4e_write(&idle_pg_table[0], l4e_empty());
>>      flush_local(FLUSH_TLB_GLOBAL);
>>  
>> -    /* Replace with mapping of the boot trampoline only. */
>> +    /*
>> +     * Insert an identity mapping of the AP/S3 part of the trampoline, which
>> +     * is arranged to fit in a single page.
>> +     */
>>      map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
>> -                     PFN_UP(trampoline_end - trampoline_start),
>> -                     __PAGE_HYPERVISOR_RX);
>> +                     1, __PAGE_HYPERVISOR_RX);
> ... literal numbers like this - however well they are commented - are
> potentially problematic to locate in case something changes significantly.
> The 1 here really would want connecting with the .equ establishing
> wakeup_stack.

how do you propose doing this?

PFN_UP(wakeup_stack - trampoline_start) doesn't have the same obvious
connection, and it would involve partly undoing 7d73c6f196a5 which hid
the symbol recently.

While 1 isn't ideal, it is next to a comment explaining what's going on,
and it's not going to go stale in a silent way...  (It's also not liable
to go stale either.)

~Andrew

