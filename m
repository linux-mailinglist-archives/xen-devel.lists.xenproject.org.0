Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23267F186E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637095.992822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56zF-0003zD-Il; Mon, 20 Nov 2023 16:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637095.992822; Mon, 20 Nov 2023 16:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56zF-0003wp-Fz; Mon, 20 Nov 2023 16:19:01 +0000
Received: by outflank-mailman (input) for mailman id 637095;
 Mon, 20 Nov 2023 16:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6jYu=HB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r56zE-0003wg-2x
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:19:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f3de0c-87c0-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:18:58 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32ddfb38c02so3042030f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 08:18:58 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d604e000000b0032da319a27asm11672138wrt.9.2023.11.20.08.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 08:18:57 -0800 (PST)
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
X-Inumbo-ID: 81f3de0c-87c0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700497137; x=1701101937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylxV4IrJIK5GqvYap3V7GCOBKv9TdEazIr5Fn/kyi0s=;
        b=wYPh2/lSYvYijA4dbpsDH7amnoDZxrUulG3h7IRU0vVZZZRa/y8cY89/dpoqM1WKJ/
         kCROSrK/bfOHBr8TeNoIFclWVKFg7sNJVOcGx5Ib13BNzV91+rY/QZCzjFLAq3z7vgZZ
         CkzPE8W48S1vlHBMGBZKIgAQIurHA55zQxCuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497137; x=1701101937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ylxV4IrJIK5GqvYap3V7GCOBKv9TdEazIr5Fn/kyi0s=;
        b=mWoJSKOc0ySCzmAzPiLBOfyrh5Ijfxw5tvdLUqvXScUv+Ay7hvfkBseS71Wo1Qs8hq
         bp+QNHSO2Ut5QysPNRFjQqVqc6QUzDdYoI6iq8cN9T7hD+qXjEPCQNudJjS8JttZgTW9
         uqd7NWZ58N3YTIUH6GBjmkj3A3A8XgtRhV99VEon7z0fDF8s3i3+KjRcAxn8d5BZIePL
         Bd0eFKnXcOwi8V1ra1TkUwyuVpmJII0K7GNWKgyRd10cpFiHn1tqjeOaNjaO2pnKfEPE
         IwFw8ZySsI6rnCS7pKEhG1aX6fiOtqRj6h3TGNHgUPQZce7vEmS1fgOadn3g5HdXkgmq
         MOww==
X-Gm-Message-State: AOJu0YwLhJSmLy57pb6yEgQ3vvi3tv0uDcT/Sm9sPPhi53/q9ZY2Bibi
	Y/Mm6EtDs2BfO6Hv30LnbPbttw==
X-Google-Smtp-Source: AGHT+IFogp2nFC9hZBFxQvgMbhGgn5DP/WAch83H8eHFPsvt8BDVyTHlioROglrJxpLcJawjLG6lUw==
X-Received: by 2002:a5d:44c4:0:b0:331:834b:61e5 with SMTP id z4-20020a5d44c4000000b00331834b61e5mr3131126wrr.42.1700497137502;
        Mon, 20 Nov 2023 08:18:57 -0800 (PST)
Message-ID: <6a763a5b-8d5f-4acc-8d73-9b778cb7add7@citrix.com>
Date: Mon, 20 Nov 2023 16:18:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/treewide: Switch bool_t to bool
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
 <20231120145623.167383-2-andrew.cooper3@citrix.com>
 <c52b9fe8-d894-4a58-9d4e-9935e8044e90@suse.com>
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
In-Reply-To: <c52b9fe8-d894-4a58-9d4e-9935e8044e90@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2023 4:17 pm, Jan Beulich wrote:
> On 20.11.2023 15:56, Andrew Cooper wrote:
>> ... as part of cleaning up the types used.  Minor style cleanup on some
>> altered lines.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> One small request and a nit, though:
>
>> --- a/xen/arch/x86/include/asm/apic.h
>> +++ b/xen/arch/x86/include/asm/apic.h
>> @@ -139,7 +139,7 @@ static __inline void apic_icr_write(u32 low, u32 dest)
>>      }
>>  }
>>  
>> -static __inline bool_t apic_isr_read(u8 vector)
>> +static __inline bool apic_isr_read(u8 vector)
> Would be nice to also switch to uint8_t at this occasion.
>
>> --- a/xen/arch/x86/include/asm/hvm/io.h
>> +++ b/xen/arch/x86/include/asm/hvm/io.h
>> @@ -54,7 +54,7 @@ typedef int (*hvm_io_write_t)(const struct hvm_io_handler *handler,
>>                                uint64_t addr,
>>                                uint32_t size,
>>                                uint64_t data);
>> -typedef bool_t (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
>> +typedef bool (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
>>                                    const ioreq_t *p);
> Nit: Failed to re-indent the 2nd line.

I'll fix both.

~Andrew

