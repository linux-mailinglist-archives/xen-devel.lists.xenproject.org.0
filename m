Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA26B093A6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047218.1417677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSrA-0004ON-GB; Thu, 17 Jul 2025 17:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047218.1417677; Thu, 17 Jul 2025 17:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSrA-0004MY-DI; Thu, 17 Jul 2025 17:57:20 +0000
Received: by outflank-mailman (input) for mailman id 1047218;
 Thu, 17 Jul 2025 17:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucSr8-0004MS-TS
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:57:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a62655b-6337-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 19:57:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45600581226so13349155e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 10:57:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd180fsm21205010f8f.2.2025.07.17.10.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 10:57:16 -0700 (PDT)
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
X-Inumbo-ID: 7a62655b-6337-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752775037; x=1753379837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shxLj5Y1qK8PG4up7znjaftKGXdVG6e6BMNQj0N3Jks=;
        b=qPSI1Nts4UjoR2FHUeYto7mLMFoXteAYBR4uxJjvqKkpkWq+u+bqDuaLRDr8XZNRh9
         /vMu3aldBPqn4nGjGpzNdJnK4Pq2wgRdGV5G+0zRS/xN+twCPYQZCaHnhkzq5rGYtkHO
         BhvPn/YUVVASob92eISdLOZUwCXbxtNDqB3rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752775037; x=1753379837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shxLj5Y1qK8PG4up7znjaftKGXdVG6e6BMNQj0N3Jks=;
        b=W7r9g7Ko0CRp/sRH28fPL42fvWmgILlAHUBf2gtgvUOcb7cY9gUM3LKmpgv0ACLZcM
         KFOWiz23G1oIFuyzFXMlp1gvzFCtUIP31dXeVeKFYc/ZVgqch9nIjS/rm4yzXVPaEjOJ
         +CSiqxyS/0/Fq8yRvs4J9bd6S0fQ7OyY+Jbb5L9r+CAiI00mFsAFNiG2SsM0NwSWLsgw
         7O4P/Mj/F4FPKKaeFcBBAdcrvuUzRvOqLMBGcz2Md92KcjWkOwnzwKraQO35Z5/ZhZci
         CzYzi2wzqv4lhPOMIBHtO+ZhDUgGINPNqTk8y6/nMToKSIcvDaOBCWRxAYpMKu/az6uh
         5IAg==
X-Forwarded-Encrypted: i=1; AJvYcCUJi+XztbyYqmksalO7wbSYka2VeRJWrnzBABR4QXa/PtubdS43kY2ez0nIG42k6XuiD3TjGDwTrzo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1zvZPh3W/xaTvztNa+JYYpn/i0zazjkCnBANd/XSvClRyYZ81
	Rrv1oYmvV2NRATbsHVtxMaDLvSpP793zdmsCZ7bBCZFM7+Zp8tf19gSjS6VW9wiCNFrv4zVpaDE
	fRpsdHBme4g==
X-Gm-Gg: ASbGncta25iLzEc73m3B2V/DyOqOYBpM540xF2MhvcLmbO2pGEeYAkMhImfpvXmgrK7
	o46e3ZZlLDm/woyL0mu86dkQtAIlMjgvOiIknmHf9+dijUJlI5uPDJHkGU+5U0mrt0H7FnH/vD/
	xdcgfHv10CAGfkaTI8oOjCFO5cS6FStEICdDlthP7pDJDh4X9CC10l7ypS4CU+m85ApoQ7p0n0T
	t4gtSXNlnye4/lCgqVSyVldZ3lXlWN3ZjtzbabK+N2DkNj8J5QvvobXLDD21NvehPU5WuQfVEXG
	rPZ59IgiQS7H1tm6Hq5VhBTTaFNFqpgl+3DjtGGvYOvtLfhy995J2JYFjKYSz6W2DRhY9vekp5v
	uNaeOrHfWw0m0zP5w/+zcR22bj6d0EQnpa0D/fnQy1fLPPS8zkFMLDyTpexQZlFjj8Nii
X-Google-Smtp-Source: AGHT+IFF3Xvi9YQMTVWtwEfs/LXv2WKB6+RZ6SLumlS6pTsQedlXwph8HNqLIMndAIglqKNXaTn9bA==
X-Received: by 2002:a05:600c:198f:b0:456:1752:2b39 with SMTP id 5b1f17b1804b1-4562e29ca07mr72756685e9.33.1752775037074;
        Thu, 17 Jul 2025 10:57:17 -0700 (PDT)
Message-ID: <3b95d347-3dee-4424-a502-50a019cd19eb@citrix.com>
Date: Thu, 17 Jul 2025 18:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86: Convert users of INTEL_FAM6_MODEL() to
 X86_MATCH_VFM()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-5-andrew.cooper3@citrix.com>
 <28c6ab0f-3699-4fbf-9a2e-205c6452ddb2@suse.com>
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
In-Reply-To: <28c6ab0f-3699-4fbf-9a2e-205c6452ddb2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 8:44 am, Jan Beulich wrote:
> On 16.07.2025 19:31, Andrew Cooper wrote:
>> --- a/xen/arch/x86/acpi/cpu_idle.c
>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>> @@ -583,7 +583,6 @@ bool errata_c6_workaround(void)
>>  
>>      if ( unlikely(fix_needed == -1) )
>>      {
>> -#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>>          /*
>>           * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
>>           * Core C6 During an Interrupt Service Routine"
>> @@ -594,12 +593,12 @@ bool errata_c6_workaround(void)
>>           * there is an EOI pending.
>>           */
>>          static const struct x86_cpu_id eoi_errata[] = {
>> -            INTEL_FAM6_MODEL(0x1a),
>> -            INTEL_FAM6_MODEL(0x1e),
>> -            INTEL_FAM6_MODEL(0x1f),
>> -            INTEL_FAM6_MODEL(0x25),
>> -            INTEL_FAM6_MODEL(0x2c),
>> -            INTEL_FAM6_MODEL(0x2f),
>> +            X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
>> +            X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
>> +            X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
>> +            X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
>> +            X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
>> +            X86_MATCH_VFM(INTEL_WESTMERE_EX,  NULL),
>>              { }
>>          };
> Along the lines of a comment further down, maybe make explicit that Nehalem-EX
> is intentionally omitted here (assuming that's not in fact an oversight)?

It looks to be an oversight.  I've submitted a separate patch, so it can
be backported more easily.

In practice, it's covered by probe_c3_errata() which blanket disables C3
and C6 on Nehalem.

>
>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -382,16 +382,12 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>>   */
>>  static void probe_c3_errata(const struct cpuinfo_x86 *c)
>>  {
>> -#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>>      static const struct x86_cpu_id models[] = {
>> -        /* Nehalem */
>> -        INTEL_FAM6_MODEL(0x1a),
>> -        INTEL_FAM6_MODEL(0x1e),
>> -        INTEL_FAM6_MODEL(0x1f),
>> -        INTEL_FAM6_MODEL(0x2e),
>> -        /* Westmere (note Westmere-EX is not affected) */
>> -        INTEL_FAM6_MODEL(0x2c),
>> -        INTEL_FAM6_MODEL(0x25),
>> +        X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
>> +        X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
>> +        X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
>> +        X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
>> +        X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
>>          { }
>>      };
> You lost NEHALEM_EX here.

Oops, too much copy/paste.

>  For Westmere-EX I think the comment (part) would
> better be retained, to clarify that this isn't an oversight.

I can't find anything which looks related for Westmere EX.  I'll retain
the comment.

~Andrew

