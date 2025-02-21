Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD945A40081
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894621.1303342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZQS-00007v-9T; Fri, 21 Feb 2025 20:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894621.1303342; Fri, 21 Feb 2025 20:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZQS-00005i-6L; Fri, 21 Feb 2025 20:15:08 +0000
Received: by outflank-mailman (input) for mailman id 894621;
 Fri, 21 Feb 2025 20:15:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TFm=VM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tlZQR-00005G-DF
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:15:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a8b38c9-f090-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 21:15:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43998deed24so24454915e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 12:15:06 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce336sm27289855e9.2.2025.02.21.12.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 12:15:04 -0800 (PST)
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
X-Inumbo-ID: 8a8b38c9-f090-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740168906; x=1740773706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=omctX7ACvK3rfUgb6UxzOMqgFDybp3F9t0iaxFd8X0s=;
        b=OP6lvTQbs+/gqQuHx3Lsoaq8/7sQ2HHWJ/AoIIVK/owuYgN2jf/gOPN46OeJq2pqwj
         qhQ+8TJTNf60IJCIMSXmDBwmhH8QA1x/eEt8/O452O6fKDeJRnSBJE15pAnekDvLgRA2
         XE4xcCr4J8A389PB/G512WhM+DuhIgWsKV4sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168906; x=1740773706;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omctX7ACvK3rfUgb6UxzOMqgFDybp3F9t0iaxFd8X0s=;
        b=G6CpFDWJYQOcxRYLqbSu6PUfJyn/TO1C7QIz4fJi+ZfDnAK9UFdw1dijFA2y8MaVLN
         E75nnGi0gqQ+CHsQMjYFwOk8IQVK+a0smncL8jyhC8MRIMxqJuickADwZI2ACl28UKH/
         +ztJbj5c0PKchGAuRFF8dGTs1Oiub7Nhf2ggUbYThXil+FqZvhAsMPuiKKVa80d/V7sD
         VqrBDftBXf1PaIxNneP4M0q1Wl3XnVgx8KJUuZ/YQM56DlUncJAPexR9Oz3egxXRHjwI
         TaNGUHTsH0ppa0/jsITB0IdD/dXqt1nHSW2sA+udzNKE8DsjYTqM8+KqRUkIjeUPvS/l
         mHXA==
X-Forwarded-Encrypted: i=1; AJvYcCVUG6EPO0dbMG0+XoaQ+Ta5gQVdiUd/f+22AF3yIT0REkf065wmHlsyjhuDVtMZlFUgk0oIBd7Vv0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxkq2w1BpVtVHzXPzQV0+S7yanBn/eFzdIJFhlALm+4YbOaUYfI
	7BvehJfGpovDpW6vljRDUUpytN2rDKIqveYewWenJu75WMYPPR5ojCDusw8EThr1MJ3f28OwgUW
	w
X-Gm-Gg: ASbGncuc8IEbzFcy3CRtFfJKrY4x4aOjYjaaO9C8riNEkCXII2KztD1IAB/bMuybmFp
	QTNZOlAZb4EAVG3khTcwEG/FHmCbX8CIBFISuAblaIkFfdG6T0JseRunJgz7/gDLcYQJJ1hGhoB
	emvzHryUsDiacBJikXKqvvUzDxbSKRaiS1h1TMZGfmMObTozRlyrgY64uvxy5GfPRdoqBoOKcCm
	+iWO0AS/PMb+bWRlmy5g2/VNfNlmtnVCd4aHVh5er2l+aZcKkO6TyViIjW27zkBmg2W695mhfUs
	gQu9MOCd6BTxIwFNPnTTL+tOB3PBOq5bWB6TCUZUNq5OutEKEn6VdpdAmuYP8mqjMA==
X-Google-Smtp-Source: AGHT+IFipZ5PgxYB6Tvd//HlzIAU+1/6ECm+26Ey582sheXSN5kt8/2piZm3u+LVoi4NEn9qzW1CuA==
X-Received: by 2002:a05:600c:5487:b0:439:9ce4:7c35 with SMTP id 5b1f17b1804b1-439aebcf8femr35366225e9.27.1740168905758;
        Fri, 21 Feb 2025 12:15:05 -0800 (PST)
Message-ID: <4b9002fe-1e39-4ee9-a4fd-fc91cd0562d5@citrix.com>
Date: Fri, 21 Feb 2025 20:15:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/ppc: Fix opal.c's misaligned DT reads to avoid
 tripping UBSAN
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1740168326.git.sanastasio@raptorengineering.com>
 <f0b1f299d793c4302ee1b4c6a9c99057f924d4f4.1740168326.git.sanastasio@raptorengineering.com>
 <9cb2f3e5-5523-4b02-b8df-9975dab7c015@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <9cb2f3e5-5523-4b02-b8df-9975dab7c015@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 8:10 pm, Andrew Cooper wrote:
> On 21/02/2025 8:08 pm, Shawn Anastasio wrote:
>> Fix two misaligned reads from the FDT in the opal setup code to avoid
>> tripping UBSAN failures. Without this change, UBSAN-enabled builds on
>> PPC will fail on boot before the serial console is even initialized.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  xen/arch/ppc/opal.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/ppc/opal.c b/xen/arch/ppc/opal.c
>> index 1183b7d5ef..3d0e4daf27 100644
>> --- a/xen/arch/ppc/opal.c
>> +++ b/xen/arch/ppc/opal.c
>> @@ -34,8 +34,9 @@ static void opal_putchar(char c)
>>  void __init boot_opal_init(const void *fdt)
>>  {
>>      int opal_node;
>> -    const __be64 *opal_base;
>> -    const __be64 *opal_entry;
>> +    const __be64 *opal_base_p;
>> +    const __be64 *opal_entry_p;
>> +    __be64 opal_base, opal_entry;
>>  
>>      if ( fdt_check_header(fdt) < 0 )
>>      {
>> @@ -54,17 +55,20 @@ void __init boot_opal_init(const void *fdt)
>>          die();
>>      }
>>  
>> -    opal_base = fdt_getprop(fdt, opal_node, "opal-base-address", NULL);
>> -    opal_entry = fdt_getprop(fdt, opal_node, "opal-entry-address", NULL);
>> -    if ( !opal_base || !opal_entry )
>> +    opal_base_p = fdt_getprop(fdt, opal_node, "opal-base-address", NULL);
>> +    opal_entry_p = fdt_getprop(fdt, opal_node, "opal-entry-address", NULL);
>> +    if ( !opal_base_p || !opal_entry_p )
>>      {
>>          early_printk("Failed to get opal-base-address/opal-entry-address "
>>                       "property from DT!\n");
>>          die();
>>      }
>>  
>> -    opal.base = be64_to_cpu(*opal_base);
>> -    opal.entry = be64_to_cpu(*opal_entry);
>> +    memcpy(&opal_base, opal_base_p, sizeof(opal_base));
>> +    memcpy(&opal_entry, opal_entry_p, sizeof(opal_entry));
>> +
>> +    opal.base = be64_to_cpu(opal_base);
>> +    opal.entry = be64_to_cpu(opal_entry);
> Thanks for getting to the bottom of this.
>
> However, you can use get_unaligned_*() and friends which is probably a
> bit nicer, and doesn't involve the extra local variables.

Sorry, the other thing to say is that if PPC is generally fine with
unaligned accesses, then you might want to follow what x86 does.

We use -fno-sanitize=alignment generally, because there's a whole pile
of things which are misaigned and spec'd that way for backwards
compatibility.

~Andrew

