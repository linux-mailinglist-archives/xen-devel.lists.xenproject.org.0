Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED238A31CE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 17:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704757.1101311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIUv-0007BK-O3; Fri, 12 Apr 2024 15:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704757.1101311; Fri, 12 Apr 2024 15:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIUv-00078Q-Kw; Fri, 12 Apr 2024 15:07:25 +0000
Received: by outflank-mailman (input) for mailman id 704757;
 Fri, 12 Apr 2024 15:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvIUu-00078K-El
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 15:07:24 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d3d0811-f8de-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 17:07:23 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78d743f3654so72760585a.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 08:07:23 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056214076d00b0069b5ec80687sm358753qvz.62.2024.04.12.08.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 08:07:21 -0700 (PDT)
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
X-Inumbo-ID: 5d3d0811-f8de-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712934442; x=1713539242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o7HNu0dPrjmXqFtIUinuxAobPIIwsp56GEzE5+RJ6zk=;
        b=R7bMbf9VTYybtzk9P2TJLXfu5DUgT06IE63P6q33Bkm1M/7R94MMhDfKek0WZeFku3
         lX05caNgY70wC+k9iztHyIeaFzG+QDrO6DxkTH2PO1VK31bDmqzn1je5LIj1jZkcfijp
         A/OMQ5HU84i8+Jh9hgMyPcErtVzDuCSBVOLoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712934442; x=1713539242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7HNu0dPrjmXqFtIUinuxAobPIIwsp56GEzE5+RJ6zk=;
        b=ori5yn2GH0N/Zuu0KAH7HU9MANtgvydhAd8uILh7Wovq1DoPAghGXF5J86l1u+KTvD
         OkB94adgmICRxWCF37tWE1oxx3uzznAV4I+SxYi2sHjGHhQQQdQr29eFB7zpbE/OjAoP
         51SMvAw6VtdKt1QQMroo9zqV5umNNJK+djsjYL8OyHZZY6gD64hNZS7xCO4ajK96IgJ0
         Dtl4NbFPmSWKv99JoTSS7wIqW4ZgrbAts1tzpwdmEQj8Gd9I1BZXIvgEPJdQAjcous7c
         spFvrdHa+0lfh+0ii1078SxOBHGAJuV/uIPsbD08bbESwgyPXBabbIhdvXImYIuQG5XC
         d0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaF9fYMbgKD5acJIhjs10QF/2Qko2FgtRWD8GVczKxMomShF3CEQfVfqq0Z3nd9K1/qznTpi2FHujjM+pubVJ/uAJiJ76Wy2CYpfcKocA=
X-Gm-Message-State: AOJu0Yz8j2rAR7NvhohahH1tpsYgRJbEcw4PvIf/L9I0oE0/JdwA3bmF
	jY2D/bwb1pZh0v3KmseSJ2Rdwd7ipO6Np45u/eOSJpBXWEFx+b0sBFKCrkB8WLk=
X-Google-Smtp-Source: AGHT+IEVRRAwEA21LwckaVpRqR1lJSB3ntZj35FspW3F277kCwmiSnYyqiGXXpwY4Wwsy5bZUZQbAw==
X-Received: by 2002:a05:6214:c43:b0:699:2673:1dea with SMTP id r3-20020a0562140c4300b0069926731deamr3628781qvj.33.1712934441960;
        Fri, 12 Apr 2024 08:07:21 -0700 (PDT)
Message-ID: <97cb014b-de7d-4368-a685-fe3fd95acbdc@citrix.com>
Date: Fri, 12 Apr 2024 16:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] Implemented AMD SEV discovery and enabling.
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Andrei Semenov <andrei.semenov@vates.fr>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
 <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr>
 <a9638611-8348-462a-a25d-a9efe3fabf9a@citrix.com>
 <ede83752-6151-4c23-a8c0-883aa7bee129@vates.fr>
 <51d5395e-7341-438f-8472-3391531c5bb0@vates.tech>
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
In-Reply-To: <51d5395e-7341-438f-8472-3391531c5bb0@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 3:38 pm, Vaishali Thakkar wrote:
> On 4/12/24 4:06 PM, Andrei Semenov wrote:
>> On 4/11/24 20:32, Andrew Cooper wrote:
>>> On 10/04/2024 4:36 pm, Andrei Semenov wrote:
>>>> +    }
>>>> +
>>>> +    if (!(cpu_has_sme || cpu_has_sev))
>>>> +        return;
>>>> +
>>>> +    if (!smp_processor_id()) {
>>>> +        if (cpu_has_sev)
>>>> +            printk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
>>>> +            min_sev_asid, max_sev_asid);
>>> Why do we have a min as well as a max?  Isn't min always 1?
>
> In the case of SEV, it's not true. Some BIOS allow to set the
> min_asid. So yeah Xen will also need to adapted for the same.
> I've a WIP patch for allowing dynamic generation of asid in such
> a case.

I also got an answer to this out of a contact of mine at AMD.

The ASID space is divided, 1->$N for SEV-ES/SNP guest, and $N->$M for
SEV guests.

It is a security issue to start a guest as ES/SNP, then "migrate" it to
being SEV-only, so the different types are tracked explicitly.

~Andrew

