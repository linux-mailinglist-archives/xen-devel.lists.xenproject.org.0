Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD0BBE24D
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 15:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138154.1473902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5kxu-0007B6-Mn; Mon, 06 Oct 2025 13:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138154.1473902; Mon, 06 Oct 2025 13:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5kxu-00079G-KB; Mon, 06 Oct 2025 13:09:22 +0000
Received: by outflank-mailman (input) for mailman id 1138154;
 Mon, 06 Oct 2025 13:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5kxt-00079A-5h
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 13:09:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab748ef1-a2b5-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 15:09:20 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso40583355e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 06:09:19 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e7234e5fdsm159422415e9.6.2025.10.06.06.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 06:09:18 -0700 (PDT)
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
X-Inumbo-ID: ab748ef1-a2b5-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759756159; x=1760360959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Myze3ejqhouVasY7+E/yCm5I4+/d50YTlT5cwdoeb8=;
        b=Mo2iJON4eBNmNQbdAGTyDRKVRudrflYjOaVOmPBLr16HR9WqX/aD11dzTMJ4Gkl0kp
         k+Avd6G1rfdtIyZhMm0OfKpLKSlSPFPFr9u94Hm5xxqxbJiSJ9n4esPztjTv0pLBWiSK
         tupIyCF32YOqaS96AfpQXrGb/G6Q3/XhuLygg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756159; x=1760360959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Myze3ejqhouVasY7+E/yCm5I4+/d50YTlT5cwdoeb8=;
        b=rhCq/CdBE37wHkf2usQ5qkqW1yh4IxCTKFlMPeJbZZ5KMuADoW7TicL5p/gsGxOrsW
         ntR2TiPWH+DB3gHqxS2IlTewdMrHGCQ+x/qvC651XO/d4WaiHGUHrHbL8LL9CZUDkii/
         5eTSsn/1rf0DU8w7PaTDhLtIb8z4ObjSVbV8n4VXDgl+Z9e/x83llwkMXI/ZW0PiWkWn
         IZw/G/4H9LQVlJk7S1dGnXtaD7G2etRVD/2LMlqRsps2okZ1mNmY67VofQLnWIi+VG4I
         tZlad6dngPNv70/ERFeRzQQNXU6RxZMkFEeP1XnuIMhIwqNuDrke9BYHJg/Zxsq/iqA8
         fogA==
X-Forwarded-Encrypted: i=1; AJvYcCV1x4qnabl1+H+q8a5tBUxB2C6C51swUgD6R6Up1U3uR6b2O4BCHWM1FJbEHDZxxQFtmPpTQIivqGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh1LhcBqAnhf65GpWUVolXgJPa5J5RikSbPTZ0CCIXr+ZYPhMb
	zMKBGA/6HqzB7Gkz3nLKv2X/Pn/Nyo+sFZSDw0K6K/hzQlHSrQ8eY3dD/SgH13qQolY=
X-Gm-Gg: ASbGncsrVoAU00WCjPN6zWeckbcyjscxRN1z2nzReJe4cv4PgQXhxP+sYoXCddtDAr3
	EPPp2wIR+H0WozbDbEPSQeeu0oE3/rnBurgeRNZU165L4ufZkgF5FALq4WA1ogYDHWrMZCZJjo0
	KGl3xGVXoI7zo719s0TdljjdVfbZZN+E7OoqDV3p40JzJn8MrOxtiRx12hLW4hgFTZJEMQaH+zo
	Q3OJeMOaes3tesnHU0vri4i8hvDQ/XMZ7LfiAY/WTq9KseNDKypEpmIxDbVvImeXOc1H2ImL/pI
	jEgoI0O25jk1Ls1I33cUvUD7GtEyW0MiubReyMA6hO2pwYx7S7zoLgvlVncgueuvQQJkvsBK1gN
	0cYqRaJhpOeqA6ejdNvZp3UqKZ0kmiQGNskJDYt5o3q4oL85xO2KGhX95OiqteMlBCWZVIWNDaU
	T9yfZGY2JYqYnR
X-Google-Smtp-Source: AGHT+IHxTFA2PsgBFxLa9SDqGvPQlGM5djO2J6b7504IACAt6oUSQp9Rdq9fmDvxlmWOJsgtkUa1WA==
X-Received: by 2002:a05:600c:138d:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-46e7114425amr73476425e9.26.1759756159208;
        Mon, 06 Oct 2025 06:09:19 -0700 (PDT)
Message-ID: <cc4c4e18-e242-46a6-a176-4d65c7b0527a@citrix.com>
Date: Mon, 6 Oct 2025 14:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Add missing forward declaration and include to
 hvm/svm/vmcb.h
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251006104608.12149-1-alejandro.garciavallejo@amd.com>
 <588656ba-dabf-42f2-941f-6cc017961271@citrix.com>
 <DDB7DOIV02H0.3P4Y4VQVY1HWZ@amd.com>
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
In-Reply-To: <DDB7DOIV02H0.3P4Y4VQVY1HWZ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2025 12:29 pm, Alejandro Vallejo wrote:
> On Mon Oct 6, 2025 at 1:04 PM CEST, Andrew Cooper wrote:
>> On 06/10/2025 11:46 am, Alejandro Vallejo wrote:
>>> ---
>>> This dependency already exists today. I'm just making it explicit.
>>>
>>> "segment_register" is weird. It naturally belongs in vmcb.h, but the
>>> emulator makes use of it and must be compilable outside of Xen.
>>>
>>> I don't like having vmcb.h depending on the emulator header, but I see
>>> no way of breaking that dependency without breaking the emulator unit
>>> tests.
>> Pulling it into a new header is fine.  The emulator can include anything
>> (free-enough standing) in arch/x86/include/asm/
> I thought it didn't, if so I'm at a loss at to why segment_register is where
> it is.

Well - it's needed by the emulator as well as SVM.

>
> Be that as it may, your series conflicts with this patch and it makes no sense
> to keep both around (when none of them are going in for until 4.22).
>
> Will you be including a fix for the segment register in your series also? If so,
> I'll just drop this one.

I've folded the extra include into my first patch.

~Andrew

