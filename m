Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D634B9D2538
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 13:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840024.1255805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDMyD-0006ei-Ht; Tue, 19 Nov 2024 12:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840024.1255805; Tue, 19 Nov 2024 12:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDMyD-0006cz-Ey; Tue, 19 Nov 2024 12:04:37 +0000
Received: by outflank-mailman (input) for mailman id 840024;
 Tue, 19 Nov 2024 12:04:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDMyB-0006co-Em
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 12:04:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd3f70d-a66e-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 13:04:29 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so905151266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 04:04:29 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa48296dcd9sm547684466b.55.2024.11.19.04.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 04:04:28 -0800 (PST)
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
X-Inumbo-ID: 6dd3f70d-a66e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZkZDNmNzBkLWE2NmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDE3ODY5LjI2ODExMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732017869; x=1732622669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D2REHAApkiMHynAK8pwQYCEPo+MFV9EtlJV8VYJzMco=;
        b=oSsUsiUU+ha36sIwOUQOruWfrLkRMCVTy3JJdhKh83CqfV2hdHv1gBagQ6MKweOCIZ
         P72qmUY5uQIEnsaX/doJfe1SGAdtbP/dldjpokP/GJpYtLZ2MSQdaR+70esyoZO9PDWA
         sBNeBCWlX+nmnHrnDEDu0SVgaVcscqPArN0Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732017869; x=1732622669;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2REHAApkiMHynAK8pwQYCEPo+MFV9EtlJV8VYJzMco=;
        b=iaqM8mpBTDleV3TpLDP+3rK4MAXtckdHF3Vi7TZylC36oHAL3hBY07QnWYtTgVx/Jr
         tD7p4uV8z2VA+duE812J1QIaWxPdSvLIdUAyChqdrmatyiPqs+ERA4i3ryfx0JTDpmWt
         pxTXTY0PfukL22X9As2o5HqcvBp1dXClaqkaWR0EYMVGUtCASvE9PaHctY6Kls9dxguX
         kATC+4DWAkQMHBtvDv1LnRLoEZINPrDEyBh7inySPtuiV020daON6uHcwkG0DY0qikb9
         yNmUlwjTDfR/0outtm9rzSMgQ1LTLstGVTAslXv2RcKpljZcwPPXn7cH5G9uGfgrCnTE
         t12Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgJC6VhqL/rkXZK7B/1XvUjq3Re5Kr7xYtAcJzZpOMHGmHj2Q+ecq57kXUvqWKSPfHpp+5QazCcRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCxHG0Yt0wvdAZvsg+iNXXgh2DseEU75TXeVNcxWRDAevN0Y4Y
	lu5NNwvF9YWwKWd1sPNI6fZfjKZXjLw3SnKw+fEKBe0t0G2T5+ho/LuF9nFdq4Y=
X-Google-Smtp-Source: AGHT+IEan40QszYBRb3+bvvg7FlHraVcJslHwyCwYt61puqNkw8vXE/of5B52YUdIu7p8LF66e97fA==
X-Received: by 2002:a17:906:ad84:b0:aa4:9ab1:1985 with SMTP id a640c23a62f3a-aa49ab11aacmr894997566b.51.1732017868669;
        Tue, 19 Nov 2024 04:04:28 -0800 (PST)
Message-ID: <d9c1a049-2528-46c0-8d4d-472e6aad7342@citrix.com>
Date: Tue, 19 Nov 2024 12:04:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: deal with Misra 8.4 violations
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4de83f5b-5fde-44a9-8943-b1bb3f41d2e3@citrix.com>
 <06b4f2c5-8470-4375-9311-c31921d7aaa8@suse.com>
 <39488f3a-f653-4083-96f0-2d1604659a6f@citrix.com>
 <1fd77d46-4035-498f-b947-85ad695075ee@citrix.com>
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
In-Reply-To: <1fd77d46-4035-498f-b947-85ad695075ee@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2024 10:55 am, Andrew Cooper wrote:
> On 19/11/2024 10:30 am, Andrew Cooper wrote:
>> On 19/11/2024 8:12 am, Jan Beulich wrote:
>>> While the override #define-s in x86_64/platform_hypercall.c are good for
>>> the consuming side of the compat variants of set_{cx,px}_pminfo(), the
>>> producers lack the respective declarations. Include pmstat.h early,
>>> before the overrides are put in place, while adding explicit
>>> declarations of the compat functions (alongside structure forward
>>> declarations).
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/x86_64/platform_hypercall.c
>>> +++ b/xen/arch/x86/x86_64/platform_hypercall.c
>>> @@ -4,8 +4,8 @@
>>>  
>>>  EMIT_FILE;
>>>  
>>> -#include <xen/lib.h>
>>>  #include <xen/hypercall.h>
>>> +#include <xen/pmstat.h>
>>>  
>>>  #define xen_platform_op     compat_platform_op
>>>  #define xen_platform_op_t   compat_platform_op_t
>>> --- a/xen/include/xen/pmstat.h
>>> +++ b/xen/include/xen/pmstat.h
>>> @@ -7,6 +7,12 @@
>>>  
>>>  int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
>>>  long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
>>> +#ifdef CONFIG_COMPAT
>>> +struct compat_processor_performance;
>>> +int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
>>> +struct compat_processor_power;
>>> +long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
>>> +#endif
>>>  uint32_t pmstat_get_cx_nr(unsigned int cpu);
>>>  int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat);
>>>  int pmstat_reset_cx_stat(unsigned int cpu);
>>>
>> Thanks for the patch.  I'll give it a spin along with the other 8.4 fixes.
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1550621091
> pending to run, with all 8.4 fixes including a prototype fix for the
> do_mca() issue too.

Eclair was happy with the result, so:

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

