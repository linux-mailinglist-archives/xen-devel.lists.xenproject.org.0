Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB3908974
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 12:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740589.1147704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3xS-0006g9-N0; Fri, 14 Jun 2024 10:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740589.1147704; Fri, 14 Jun 2024 10:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3xS-0006eg-KS; Fri, 14 Jun 2024 10:14:58 +0000
Received: by outflank-mailman (input) for mailman id 740589;
 Fri, 14 Jun 2024 10:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sI3xR-0006ea-2C
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 10:14:57 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f252b340-2a36-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 12:14:56 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7955f3d4516so275636885a.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 03:14:56 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecce85sm131324785a.41.2024.06.14.03.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 03:14:53 -0700 (PDT)
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
X-Inumbo-ID: f252b340-2a36-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718360095; x=1718964895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H7DpoWPouBKOJC14cOpMhsozJyXb1pXesO9Vcihq3xk=;
        b=JwRr95gOktszw2Rf+UWiCcDc1yuqgoqkQ0IaGNTHMhCLycTLQezoEETeQAzBf45BUY
         9kasC6CQIrPNqdg84njMaNGAd0fhj22YLH+uPXdhuuKvCuoC8eMERYq6NFVutu29fQnI
         ItQBs3zpWZF2m6fnq5GOPXhl5C1N7fdjnTHvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360095; x=1718964895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7DpoWPouBKOJC14cOpMhsozJyXb1pXesO9Vcihq3xk=;
        b=mJwzX29+9jGALAHBTfSq81ywspLMUAO7D5DiXW9eZZBcs3ATfY3/jtZDG3F5NEwdGH
         5okRQi7pkvHk/WLixKLt69nAm2J11CBkxWqU3YG9wiZMATda14qvozLj2hFRuaeY7NtR
         1bmiS5HOaDwU2Yc4XXIEUExLbpRO1teMpLB6aFXNu5dJrK2ap2JCUvwYeukD3Y/pbKOM
         iTM3zFE1BarEwZGXHxUvoEN20UggyXcrAT1dSUx/LobRFBmhslBoIN6abSI/TVwOHL6y
         7m6W5CGmLZ/XmHHAi8j1lmdruKq9cCP62TxRYN+6FW1QCYWMTkqV4nUrQbP5ob+sIRxx
         M4uA==
X-Forwarded-Encrypted: i=1; AJvYcCWAzWYd2TRZYIqUbRWGIcswuziPop2+cjIhdbCKlFXqYhBId5UklBxR9IPVFqi7hDOzNpaNZ4pOVq1KmwQG3Va0/fNMBE5hdUNtiWsR56M=
X-Gm-Message-State: AOJu0YzfUyW2w9pzcGoZCuBfrNv0iB51DbmPasQ2bcm7yWPOJrHFto/B
	mARt2ndLchAiF8s+qc2FS6ygASm3WTcZnjeEgU3thVOrGgxKJmuPYoxsi14UXImvLT1mlEJYKD6
	NohE=
X-Google-Smtp-Source: AGHT+IGbakePLWN+o0Y5B5jNWxalCWKJRf+lOa7mRsmVFUbtPwD3IjOHRwvXmONrale6ehiWV0K7pA==
X-Received: by 2002:a05:620a:404b:b0:795:4e69:5932 with SMTP id af79cd13be357-7981017a1cdmr861968285a.29.1718360094857;
        Fri, 14 Jun 2024 03:14:54 -0700 (PDT)
Message-ID: <8fb21b45-c803-4d37-8df8-3a1afa677ef7@citrix.com>
Date: Fri, 14 Jun 2024 11:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
 <f51b2240-03da-4aee-8972-a72b53916ce1@citrix.com>
 <e493035c-2954-418e-96fb-add1577df59f@suse.com>
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
In-Reply-To: <e493035c-2954-418e-96fb-add1577df59f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/06/2024 7:27 am, Jan Beulich wrote:
> On 13.06.2024 18:17, Andrew Cooper wrote:
>> On 13/06/2024 9:19 am, Jan Beulich wrote:
>>> Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
>>> this bit is set by the BIOS then CPUID evaluation does not work when
>>> data from any leaf greater than two is needed; early_cpu_init() in
>>> particular wants to collect leaf 7 data.
>>>
>>> Cure this by unlocking CPUID right before evaluating anything which
>>> depends on the maximum CPUID leaf being greater than two.
>>>
>>> Inspired by (and description cloned from) Linux commit 0c2f6d04619e
>>> ("x86/topology/intel: Unlock CPUID before evaluating anything").
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> While I couldn't spot anything, it kind of feels as if I'm overlooking
>>> further places where we might be inspecting in particular leaf 7 yet
>>> earlier.
>>>
>>> No Fixes: tag(s), as imo it would be too many that would want
>>> enumerating.
>> I also saw that go by, but concluded that Xen doesn't need it, hence why
>> I left it alone.
>>
>> The truth is that only the BSP needs it.  APs sort it out in the
>> trampoline via trampoline_misc_enable_off, because they need to clear
>> XD_DISABLE in prior to enabling paging, so we should be taking it out of
>> early_init_intel().
> Except for the (odd) case also mentioned to Roger, where the BSP might have
> the bit clear but some (or all) AP(s) have it set.

Fine I suppose.  It's a single MSR adjustment once per CPU.

>
>> But, we don't have an early BSP-only early hook, and I'm not overwhelmed
>> at the idea of exporting it from intel.c
>>
>> I was intending to leave it alone until I can burn this whole
>> infrastructure to the ground and make it work nicely with policies, but
>> that's not a job for this point in the release...
> This last part reads like the rest of your reply isn't an objection to me
> putting this in with Roger's R-b, but it would be nice if you could
> confirm this understanding of mine. Without this last part it, especially
> the 2nd from last paragraph, certainly reads a little like an objection.

I'm -1 to this generally.  It's churn without fixing anything AFAICT,
and is moving in a direction which will need undoing in the future.

But, because it doesn't fix anything, I don't think it's appropriate to
be tagged as 4.19 even if you and roger feel strongly enough to put it
into 4.20.

~Andrew

