Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7104F98BDF7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 15:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808193.1220038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svd3n-0005Jf-Kz; Tue, 01 Oct 2024 13:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808193.1220038; Tue, 01 Oct 2024 13:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svd3n-0005IG-Hs; Tue, 01 Oct 2024 13:37:03 +0000
Received: by outflank-mailman (input) for mailman id 808193;
 Tue, 01 Oct 2024 13:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oTF=Q5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svd3l-0005IA-MJ
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 13:37:01 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c680953-7ffa-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 15:37:00 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53997328633so3000443e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 06:37:00 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947a3csm715139366b.133.2024.10.01.06.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 06:36:59 -0700 (PDT)
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
X-Inumbo-ID: 3c680953-7ffa-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727789820; x=1728394620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HnSW5at8Js2aaU5qBg8TSBlZ7uIBX9TPZl0smVm3b6g=;
        b=Jy6R6EuDTJS+Wqt3t35ywAZOWG7vzUFD9BjoGuC65NGKnVfhxK6V7CFevGMuna6vdG
         5gTvY6iic+gdjfZEj+i5upkadAI+EgG5y0EruS+pRyZoI2IzC5EimOMQRljjkJvq2VXz
         aWoN1dJGFulKAlSFGL88bO+6vtVeR2ZSSP63Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789820; x=1728394620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnSW5at8Js2aaU5qBg8TSBlZ7uIBX9TPZl0smVm3b6g=;
        b=cG6mIbCLmdh/F6Jvt8ZwEfeXnH13oaTcG1wQ8tmDwxgJlHsFIVr+siYzLcyuZSRdES
         S0uM57kfsmpvQ2Jffrvuk0Cgm3yUtvpB3+b5PDtLX6b1Tt7VPP3tQ6+w6uaWsNbzA0cR
         aje2XqTHDylB68x7W5Pn3cNskdwxh6n5Yuyz8HxPhB/Ypd2Yqt7n6yXBOkaydlQjKIgo
         KocugZ+5/+4mHBHhKNCR4ZxEIbzM1B2U0h+9pqFii9VoOH8zmQgmPRs8DWRXCGBRrLZF
         jS4DoHP8/PzMbe9ygMLiDQ9cbC4ojN3mZwSeR6FhmDlcVr3s9resn8wXm3OJ1JX5+la9
         LhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Wgy2a5kei4llqV8A/+OCZZXdURsUbGdZlUswN/Htzy2oZAwxz1Sn70oHP+gEO8dxWIgWk4uoRJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+VEby5R2QBX3Trp1qvC1oHoqy+Zdbl46AovYP1/DEqkZgu9zg
	HpESBVrh7C9KXbZfJ9RaDQM8GDIZQfGfdRuyDcC38vUb3mfp2mGsKJqJmFiJzZU=
X-Google-Smtp-Source: AGHT+IEUrd7fYsvD1516ZAUnf+2ewJUHgttmomeHcpVJFTIvsmlsDiUxwC3x4jvO3dQnPaJC0euctg==
X-Received: by 2002:a05:6512:1296:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-5389fc4ca33mr10456473e87.33.1727789819835;
        Tue, 01 Oct 2024 06:36:59 -0700 (PDT)
Message-ID: <2dcf9ea5-f164-45d2-b695-d2d6ab5fe499@citrix.com>
Date: Tue, 1 Oct 2024 14:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/2] x86/pv: Rename pv.iobmp_limit to iobmp_nr and clarify
 behaviour
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20241001122438.1454218-1-andrew.cooper3@citrix.com>
 <ddc83900-c91b-45df-af79-a3e078500f65@suse.com>
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
In-Reply-To: <ddc83900-c91b-45df-af79-a3e078500f65@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/10/2024 2:35 pm, Jan Beulich wrote:
> On 01.10.2024 14:24, Andrew Cooper wrote:
>> Ever since it's introduction in commit 013351bd7ab3 ("Define new event-channel
>> and physdev hypercalls"), the public interface was named nr_ports while the
>> internal field was called iobmp_limit.
>>
>> Rename the intenral field to iobmp_nr to match the public interface, and
>> clarify that, when nonzero, Xen will read 2 bytes.
>>
>> There isn't a perfect parallel with a real TSS, but iobmp_nr being 0 is the
>> paravirt "no IOPB" case, and it is important that no read occurs in this case.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one cosmetic request:
>
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -167,7 +167,12 @@ static int guest_io_okay(unsigned int port, unsigned int bytes,
>>      if ( iopl_ok(v, regs) )
>>          return X86EMUL_OKAY;
>>  
>> -    if ( (port + bytes) <= v->arch.pv.iobmp_limit )
>> +    /*
>> +     * When @iobmp_nr is non-zero, Xen, like real CPUs and the TSS IOPB,
>> +     * always reads 2 bytes from @iobmp, which might be one byte beyond
>> +     * @nr_ports.
>> +     */
>> +    if ( (port + bytes) <= v->arch.pv.iobmp_nr )
> If you use @nr_ports in the comment here, then I think some connection wants
> establishing as to where this comes from. Otherwise use @iobmp_nr a 2nd time.

Oops, that was a copy&paste error from the header.  I'll switch it back
to @iobmp_nr.

~Andrew

