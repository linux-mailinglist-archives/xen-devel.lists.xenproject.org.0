Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE35B30244
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 20:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089186.1446844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upAJv-00035h-08; Thu, 21 Aug 2025 18:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089186.1446844; Thu, 21 Aug 2025 18:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upAJu-00033a-Sz; Thu, 21 Aug 2025 18:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1089186;
 Thu, 21 Aug 2025 18:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upAJt-00033U-S1
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 18:47:29 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 495011d0-7ebf-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 20:47:28 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3c4e9efb88aso655854f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 11:47:28 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43ba5sm12686851f8f.22.2025.08.21.11.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 11:47:27 -0700 (PDT)
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
X-Inumbo-ID: 495011d0-7ebf-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755802048; x=1756406848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XK6bQI4sv2e8rUB/d9Y+5ny0SLwm0w22NW2DONNrLsM=;
        b=dtnbe22YN94J8hx2BcHa7Vf1tku/rhlU+rKM28CZmya6dKaKDAlJz+CcPcvdiAdmh5
         O+tBC2ZT8wzsCerohsRa6idhttS7rD9TRGTDVrrgcR6GeSy6Q9O8XeqA+zRg9Pk25tFt
         GRswsudXrqE0hd3c3i9UDwwMIybmdRVdsVjyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802048; x=1756406848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK6bQI4sv2e8rUB/d9Y+5ny0SLwm0w22NW2DONNrLsM=;
        b=oc2reVrd0deVaczxCziqv3FMbrQ1caMZNz5Wf0Kg3uVbby6XDw1L74z8+pZrOs8Z/q
         MIFWx24hxu/XYffEGOINtqP+VLTwsQvtdwG152t5pyEnJ7+uHpAtRdu8IC82fjV8/oCg
         T5KoBST7jqu9eTMViWKujY0yebP8rPUadwaAMOv9nLMCTb5gL3recD0jtRsJVX9ZadcS
         nXTtNv16nz90496vuqGbvhyOb4cjkTFU7moC58kLGs7Ry9rAntXUXJvaZsF9jcR3O4Fb
         NDKZf4ks4S7yOKYIng0oHgq8dCAw06zotgGIb6KZYbbRtZhzvht15ibt72A0vF87XXC5
         8qAw==
X-Forwarded-Encrypted: i=1; AJvYcCWrQY18tOvLwM1FoWH3Qw1Xq7CIjaa05Y7PLVV7o5/4TDOKu31Aoy5QSJtDmg1Kc9LNI2DachLtbJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrywlpoFAPRodxE+wElL+EXpA0KwEjM+aulSz40bdRPC+TeYwt
	+auZ07paVORuPGdykv2VFbzZkkTjGCid4FDbQ+g+qUINdhWqA4ghFOAX7M53D98ztGM=
X-Gm-Gg: ASbGnctfvBP9aNaeG8cOLKBi/HNcMrJdwcQjftR81IhQAWLn1OZlKF89AkLwmtYbY/E
	2CV+o5NxL5SR0DqNXKhY+Jyo+K2YYbdod8fp/i9vhXAGZvTqCTLUT8oRQEiseV5HYp9fq7Qenfe
	VjiZ5XXm53F+TVy25YHU7c7ZUPhgUmaMexMSHhlW/fNJqSx0SJzb177eT5JjHAD4dtwjy+JGldh
	+hqkRosn2krMzik5I4Tud7J7VuBayN7yixx3oVk7dn5rmNs0ZmGFctDmtELwmYRgqhTdYRLJEXK
	3CQVkeg0g9epFVvtWueAxdAT0qGZKX9SNmQFJXvpUOFHL4sWBNX6jhQRx6nOGXByMTdGBDAkhrw
	14p1YKqVFi9bwW1IeKpi8HFIqvpoVo6RIdm+SkQIAb4Py5sBFXspr/r++eOUJICbIdw2u
X-Google-Smtp-Source: AGHT+IFYvEc0+60yrN62majQkv8aBoQi9VXYa0A2BnS2Uypl3rBgC3m+t9hh13pAUjG68ZWDCREXGw==
X-Received: by 2002:a05:6000:400e:b0:3b7:9c79:32ac with SMTP id ffacd0b85a97d-3c5ddd7f89amr32416f8f.52.1755802047724;
        Thu, 21 Aug 2025 11:47:27 -0700 (PDT)
Message-ID: <ee126e0c-4381-40a8-bbec-544e3286498f@citrix.com>
Date: Thu, 21 Aug 2025 19:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] x86/msr: Change wrmsr() to take a single
 parameter
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-13-andrew.cooper3@citrix.com>
 <3511e3dc-0c9b-412b-9cb3-e4b726088297@suse.com>
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
In-Reply-To: <3511e3dc-0c9b-412b-9cb3-e4b726088297@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 1:38 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> --- a/xen/arch/x86/nmi.c
>> +++ b/xen/arch/x86/nmi.c
>> @@ -218,16 +218,16 @@ void disable_lapic_nmi_watchdog(void)
>>          return;
>>      switch (boot_cpu_data.x86_vendor) {
>>      case X86_VENDOR_AMD:
>> -        wrmsr(MSR_K7_EVNTSEL0, 0, 0);
>> +        wrmsrns(MSR_K7_EVNTSEL0, 0);
> Since you switch to non-serializing here, ...
>
>> @@ -308,11 +308,11 @@ static void setup_k7_watchdog(void)
>>          | K7_EVNTSEL_USR
>>          | K7_NMI_EVENT;
>>  
>> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
>> +    wrmsr(MSR_K7_EVNTSEL0, evntsel);
>>      write_watchdog_counter("K7_PERFCTR0");
>>      apic_write(APIC_LVTPC, APIC_DM_NMI);
>>      evntsel |= K7_EVNTSEL_ENABLE;
>> -    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
>> +    wrmsr(MSR_K7_EVNTSEL0, evntsel);
>>  }
> ... why not also here?

An oversight.  Fixed.

>
>> --- a/xen/arch/x86/oprofile/op_model_athlon.c
>> +++ b/xen/arch/x86/oprofile/op_model_athlon.c
>> @@ -34,7 +34,7 @@
>>  #define MAX_COUNTERS FAM15H_NUM_COUNTERS
>>  
>>  #define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].addr, (msr_content));} while (0)
>> -#define CTR_WRITE(l,msrs,c) do {wrmsr(msrs->counters[(c)].addr, -(unsigned int)(l), -1);} while (0)
>> +#define CTR_WRITE(l,msrs,c) do { wrmsr(msrs->counters[(c)].addr, -l); } while (0)
> This isn't obviously correct (as in: no functional change): The macro is,
> for example, passed reset_value[] contents, which is of type unsigned long.
> Quite possible that the original code was wrong, though.

I'm pretty sure the change is correct.

Perf counters get programmed to -(count), as they generate an interrupt
when they overflow.  The K8 is the oldest BKDG I can easily access, and
the counters are 48 bits wide.  The same is true of Intel systems of of
the same age.

Interestingly, it is the singular omission from b5103d692aa7 which
converts everything including the Intel version of CTR_WRITE() of this
to use wrmsrl().

While looking at the mail list archives for b5103d692aa7, I found
https://lists.xenproject.org/archives/html/xen-devel/2010-06/msg01660.html
which shows that it was Christoph's attempt to turn rdmsr() and wrmsr()
into a real C functions, so I'm pretty certain that CTR_WRITE() was an
omission in b5103d692aa7.

Only 15 years late on that todo...

> In any event l wants parenthesizing.

Oh, so it does.  Fixed.

~Andrew

