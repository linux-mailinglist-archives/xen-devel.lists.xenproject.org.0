Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7FB533C6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 15:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120284.1465293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwhNH-0004wr-9o; Thu, 11 Sep 2025 13:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120284.1465293; Thu, 11 Sep 2025 13:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwhNH-0004vQ-6v; Thu, 11 Sep 2025 13:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1120284;
 Thu, 11 Sep 2025 13:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwhNG-0004pq-77
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 13:30:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac9723e-8f13-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 15:30:00 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45dd505a1dfso5939985e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 06:30:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd27dsm2425221f8f.41.2025.09.11.06.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 06:29:59 -0700 (PDT)
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
X-Inumbo-ID: 6ac9723e-8f13-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757597400; x=1758202200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KbatsuDTaiKpismUZyqTbUrE//HluN2A1JCg86bt5SA=;
        b=ikRq0YZIZ+mhI0OgTi5ynsGm3isnaxisS2m/gZLoV4A+FgGWa1A5O8eCbd7CCnmBWy
         K9iq19Vz1u7J/qvjW4A7hGE2GPxT0+Z2e2kBvhPymVzSC7chOzASiJGkiiWlL5nlsZPq
         z05C33wka8dpVceHwKdeabvepK1XE+nEWn91I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597400; x=1758202200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbatsuDTaiKpismUZyqTbUrE//HluN2A1JCg86bt5SA=;
        b=pocrS2ySJD9UmiP7QNpYdM273UN1Mnl8BVHUwBLuKN1bzldojf0brf37GoCp3ot/dY
         XAdwza94hPtc/y346QakLb6/11vYr/Md57rOQOVUXHY07dn5DySvTg2PxNjNZT/N9UED
         hIUEhbN5xOxBBOYE07xHrcbPCvK14l6Rf4s1D1pTqq6nG+ldQaR3aQ+IK7UKzDV95GkF
         AWkQ05/Ppr4vo441NLY9ORUzFff3GkLcVHIt/F6orGCPNJKhqZh735cCnTfW77J3i7ar
         +oENY/ScD5qslUVpXxcOztpLFAEKvpwp1ITxUGim7WxFDqUYclUaqjmVoOFq8s4GJ5R5
         rC6g==
X-Forwarded-Encrypted: i=1; AJvYcCXoK/QEoggOHKAOJo8RT2AlIktBEjvvOim/aZV1UIOSmloorju80dSySzTLU+zHQeLVu5CmpSxapUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/MiudHVmzUMaPj7WDo0tfcis5yINckAp7RmGGCa7zC0ka3XlL
	iuBR21EHTsq8w5kychisHOQ+QfDB5F03AKCtMvbd4HUU1V1PMOsByo6/pveYNXux7h7orvm8vYR
	+Us8w
X-Gm-Gg: ASbGnctxHy3Sec03xaCvSgRmLwGog5lx3eI+svZd+kUIUU5lhlOxZ2zERj0C++EGJIH
	5IHYwfMYyZGLuiP1Qf4FYdEImxi+94aF7cXzkqYyXqpdJimBllVuTGz5g1ijuTvtDTPCax6q5+l
	wX6uRcFQKVi4dT1+df4MpUwNs7aea5rf+8QXix4cVu1INFxLeeDra2RuscFcFHNwXDidKFFbzdu
	T1N6VYpc9Lr05zzdCRupoco3uaifD5fQC44O/XhTUFluwCVb7r7eICZhl6l5RjeY91yMadsQz2Y
	YCULn/jGFXN3wa/FOUDsX8DSXRZ5sbtZpBIX9ftjXbSvzUthj39sxA2gavjyVc3OZ8GsT/lABV1
	gjaFe37i/WbmTpwvDpLTQ/1D5cXljpJfEBNFUxw7ZU7ugBIWI2OA8Tjcs3jtO7UkPI6fV
X-Google-Smtp-Source: AGHT+IGwy5XUDzgxy3KbfsXguza0y8H6/sGrUNMWv9IHhrWAzNm9puCo1opbLCqXWbCXNqw/CX4vdg==
X-Received: by 2002:a05:6000:26d2:b0:3df:b9e7:35ba with SMTP id ffacd0b85a97d-3e6440f0674mr15798675f8f.57.1757597400130;
        Thu, 11 Sep 2025 06:30:00 -0700 (PDT)
Message-ID: <48503adc-4ad5-4506-8e04-6e7882022b7d@citrix.com>
Date: Thu, 11 Sep 2025 14:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
 <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
 <DCPZ4OKQIQDP.2KSJ8IZNXHCXB@amd.com>
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
In-Reply-To: <DCPZ4OKQIQDP.2KSJ8IZNXHCXB@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2025 1:35 pm, Alejandro Vallejo wrote:
> On Thu Sep 11, 2025 at 2:03 PM CEST, Andrew Cooper wrote:
>> On 11/09/2025 12:53 pm, Alejandro Vallejo wrote:
>>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
>>> by the device model. The GPE handler checks this and compares it against
>>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>>> related bit in the bitmap and adjusting the table's checksum.
>>>
>>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
>>> reaches 128, even if that overflows the MADT into some other (hopefully
>>> mapped) memory. The reading isn't as problematic as the writing though.
>>>
>>> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
>>> then the bit where the "online" flag would be is flipped, thus
>>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>>> that happened outside its range. It's all terrible.
>>>
>>> Note that this corruption happens regardless of the device-model being
>>> present or not, because even if the bitmap holds 0s, the overflowed
>>> memory might not at the bits corresponding to the "online" flag.
>>>
>>> This patch adjusts the DSDT so entries >=NCPUS are skipped.
>>>
>>> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> Half RFC. Not thoroughly untested. Pipeline is green, but none of this is tested
>>> there.
>>>
>>> v2:
>>>   * New patch with the general fix for HVM too. Turns out the correction
>>>     logic was buggy after all.
>> Hmm, this does sound rather more serious.  I have a nagging feeling that
>> until recently we always wrote 128 MADT entries.
> If so, I don't see where. It used to be 16, waaaaaaaaaaaaaaaaaaaaay back when.
> Then it got extended to whatever it needed to be.
>
> I have the nagging feeling that rather opaque "some OSs (cough Windows cough)
> don't like more than 16 CPUs was actually this bug in action. Making the DSDTs
> with exactly 16 CPUs a particular kind of silly.
>
>> So, while this looks like a good fix, I think we might want a second
>> Fixes tag.
> Happy to add it, but I really don't see anything like that in the git log.

I can't find it either.  Maybe my memory is getting faulty.

~Andrew

