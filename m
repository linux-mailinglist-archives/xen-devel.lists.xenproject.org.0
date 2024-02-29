Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E086D2E0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 20:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687398.1070815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rflmk-00031y-1X; Thu, 29 Feb 2024 19:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687398.1070815; Thu, 29 Feb 2024 19:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rflmj-000304-TU; Thu, 29 Feb 2024 19:09:37 +0000
Received: by outflank-mailman (input) for mailman id 687398;
 Thu, 29 Feb 2024 19:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rflmi-0002zk-DE
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 19:09:36 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13604487-d736-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 20:09:35 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-787f27e634cso93929485a.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 11:09:35 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i4-20020a37c204000000b00787548de251sm946454qkm.23.2024.02.29.11.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 11:09:33 -0800 (PST)
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
X-Inumbo-ID: 13604487-d736-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709233774; x=1709838574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGBPVXm+xoX/IFviVhInKWzNzminbH6fIphLnWqkNDU=;
        b=Fe5rZ99/3taDd3EgW1ZHcDs/rdsZYB4lNt1UpadjsGguDqBjt6JfRO+U0nWu5lIFOr
         WngktVbhUl9vxRc7AJahdzLX4ccJHE3ptULqcmzlmKDtQQJEaXQTwKLR6W01u9M4RwMp
         zZIzH9ELf6RvoIqtxZSQTY4z6TkGn+brbk/Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709233774; x=1709838574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGBPVXm+xoX/IFviVhInKWzNzminbH6fIphLnWqkNDU=;
        b=nFze1HWYcEAUw6lJkVYRbGRvospXRCK83fyDyynteE+sQ6QpJQQJxOHfYTPnTArdZR
         d6+buhrBcWEBAbMWmlxR82fVKZew5FYPCPrA6c25NzONhiJqq+japkhxYdCRWBlSazAT
         pY+z63DQSJhNH4gIELjul4beQisPPug8et1IHrUoV7puPgMjDw8EfLI8GyFRpcPQzh+S
         c1jtGHIf75nAuV/RwF2M/2SHk1PPacvbEj1jRQqaWmaESngGfAlM2DXdm8FybwnbrhLx
         aTsZP5WtoALsdumR5kYxwp9sYjT5N7LQMhspwWY+6s+VY0iWz1xKAFCQf7F5aqsKnqHH
         paOg==
X-Forwarded-Encrypted: i=1; AJvYcCXVoPhHuxs28jlvozYqUF5Ae/Sf8LQ1l6u9HWYALFIISXrCbGCCsO5EtlHRTXgxUoUBch/N1lMXGk1PhMbZClJk4e3K6UX2bu+pxgWR7uE=
X-Gm-Message-State: AOJu0YzfnktXWnHzwl4Eexmap8CMKwrk/cxwIuqebwPWGWLQdZopxSmv
	ASE8NKvypG+VfC0axL35rKlegwRySxs1oyjUJAFJy3jPr/R2M/1bD83mNBgOK5k=
X-Google-Smtp-Source: AGHT+IHFLVA/LtYlBwoJfvAcH+al1gCFiKz0szThJmLCGXSFUwBuFcSfn12b+U0kCb5+JQybfGuMIA==
X-Received: by 2002:a05:620a:148e:b0:784:93d:c905 with SMTP id w14-20020a05620a148e00b00784093dc905mr3655151qkj.25.1709233774287;
        Thu, 29 Feb 2024 11:09:34 -0800 (PST)
Message-ID: <0252e902-1c40-41a9-813d-51aa0c71ebb2@citrix.com>
Date: Thu, 29 Feb 2024 19:09:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
 <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
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
In-Reply-To: <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 12:47 pm, Jan Beulich wrote:
>> @@ -830,11 +846,10 @@ void recalculate_cpuid_policy(struct domain *d)
>>      }
>>  
>>      /*
>> -     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
>> +     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
>>       * affect how to interpret topology information in other cpuid leaves.
>>       */
>>      __set_bit(X86_FEATURE_HTT, max_fs);
>> -    __set_bit(X86_FEATURE_X2APIC, max_fs);
>>      __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
>>  
>>      /*
> ... these adjustments, just still in calculate_pv_featureset(). I
> haven't gone further backwards to check if/when this exposure has
> really appeared. I wouldn't be surprised if it's been like that
> for all the time since we gained x2APIC support in the hypervisor.

4.7 has:

cpufeatureset.h:140:XEN_CPUFEATURE(X2APIC,        1*32+21) /*!A Extended
xAPIC */

so will expose it to PV guests.

4.6 has this gem I'd forgotten, in pv_cpuid():

        if ( !cpu_has_apic )
           __clear_bit(X86_FEATURE_X2APIC % 32, &c);

but I don't see any (sensible) logic to hide x2APIC from the view of a
PV guest.

So PV guests really have see x2APIC from the host forever (and
irrespective of Xen's x2APIC support).

~Andrew

