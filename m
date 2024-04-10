Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39C89FCBC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 18:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703420.1099091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruahk-0001zk-8O; Wed, 10 Apr 2024 16:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703420.1099091; Wed, 10 Apr 2024 16:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruahk-0001y7-4g; Wed, 10 Apr 2024 16:21:44 +0000
Received: by outflank-mailman (input) for mailman id 703420;
 Wed, 10 Apr 2024 16:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruahj-0001y1-6D
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 16:21:43 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 696cdf06-f756-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 18:21:41 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-43444a599d0so42802291cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 09:21:40 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ku3-20020a05622a0a8300b004348513d0dbsm3846289qtb.31.2024.04.10.09.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 09:21:39 -0700 (PDT)
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
X-Inumbo-ID: 696cdf06-f756-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712766100; x=1713370900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hBLaJxqM0jx5ixmwNn6JaIoCuBMG6QMDZ0hMJ1fqgYk=;
        b=pyy94h64kkUZU08KxVcXGMgjCiRKfVQwMN2ph+rMFDOtJSy/3u2IIcDBWv+TsfjyBz
         EgrLAXylOoGkkNJHX+rV5b4TrkmTJkwg7zqaG9ej/YOJ3ETeSKeXZICt+i8e8fJr7lI0
         R3IAAjtXL1IyilU5odGa92H7xBH36YUqYOFB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712766100; x=1713370900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBLaJxqM0jx5ixmwNn6JaIoCuBMG6QMDZ0hMJ1fqgYk=;
        b=uP3LyZKwCm5DtdwbBwZVa00ZimUUVqIqxkDpkYj+/gEANAhVSYhf632k8Y2Np6Y1Cu
         PIa3CaDiAfXRslw0f5BUPufVUQxoIvX/FevQNpnKCIBsBScb5kZlsPakKHkHnWmsoU5c
         yL0eoBevK/+Z8IUo5HNDZJJQ3GobxFVE1jq2hjOMvPcUfuObACD2sBfcgN2DAbJqGSOg
         bClEhL2FBYbdxuG+Xp9uFNvxdRYan9nmxr8OAbOaWscYCFM63kayW/s1wuiPBVZo7f4u
         XxOcvZeH/HPQfq3cDZ19RQ2+MDiR5JFOhs4nvJ9ILQsi1LESBsYaTsa2nPeunY6P4az/
         PZ/g==
X-Gm-Message-State: AOJu0YxwrUc1Kwf0BVeUDo0Hs19/JeplQ5tDBbwwmtKTQSj1UnlH2QLw
	3I5FJa0XupvADZpWzjYI4zXctEzxjME6SABNvjONQshx1+nMIF+AJ5juu/oBLv8=
X-Google-Smtp-Source: AGHT+IEWlF4GiYaNbjFQRj89usZP/Lb6/7XFz80dviQB1zRq0kWovRS0vCpORho8EX7ZP/DWOgehhQ==
X-Received: by 2002:ac8:5881:0:b0:434:4beb:36e3 with SMTP id t1-20020ac85881000000b004344beb36e3mr3141704qta.12.1712766099750;
        Wed, 10 Apr 2024 09:21:39 -0700 (PDT)
Message-ID: <2fd969ef-8326-4ae8-a568-4256f00542f0@citrix.com>
Date: Wed, 10 Apr 2024 17:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <Zhas4MQdL3hQ6Uww@macbook>
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
In-Reply-To: <Zhas4MQdL3hQ6Uww@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2024 4:14 pm, Roger Pau Monné wrote:
> On Thu, Oct 26, 2023 at 09:55:39PM +0100, Andrew Cooper wrote:
>> We eventually want to be able to build a stripped down Xen for a single
>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>> available to randconfig), and adjust the microcode logic.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> CC: Stefano Stabellini <stefano.stabellini@amd.com>
>> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>
>> I've intentionally ignored the other vendors for now.  They can be put into
>> Kconfig by whomever figures out the actual dependencies between their init
>> routines.
>>
>> v2:
>>  * Tweak text
>> ---
>>  xen/arch/x86/Kconfig                 |  2 ++
>>  xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
>>  xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
>>  4 files changed, 35 insertions(+), 2 deletions(-)
>>  create mode 100644 xen/arch/x86/Kconfig.cpu
>>
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index eac77573bd75..d9eacdd7e0fa 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
>>  
>>  menu "Architecture Features"
>>  
>> +source "arch/x86/Kconfig.cpu"
> Since we are not targeting at the CPU only, would this be better named
> as Kconfig.vendor?  Or Kconfig.platform?  (I'm OK if you prefer to
> leave as .cpu, just suggesting more neutral names.

Well - its based on ...

>
>> +
>>  source "arch/Kconfig"
>>  
>>  config PV
>> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
>> new file mode 100644
>> index 000000000000..3c5d88fdfd16
>> --- /dev/null
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -0,0 +1,22 @@
>> +menu "Supported CPU vendors"
>> +	visible if EXPERT

... this, and I think "cpu" is the thing that is going to be most
meaningful to people.  (Also because this is what Linux calls the file.)

Technically platform would be the right term, but "CPU vendors" is what
you call Intel / AMD / etc in the x86 world.

>> +
>> +config AMD
>> +	bool "AMD"
>> +        default y
>> +        help
>> +          Detection, tunings and quirks for AMD platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on AMD platforms.
>> +
>> +config INTEL
>> +	bool "Intel"
>> +        default y
>> +        help
>> +          Detection, tunings and quirks for Intel platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Intel platforms.
> There seems to be a weird mix between hard tabs and spaces above.
> Naming is OK for me.

Yeah.  I already fixed those locally.

>
>> +
>> +endmenu
>> diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
>> index aae235245b06..30d600544f45 100644
>> --- a/xen/arch/x86/cpu/microcode/Makefile
>> +++ b/xen/arch/x86/cpu/microcode/Makefile
>> @@ -1,3 +1,3 @@
>> -obj-y += amd.o
>> +obj-$(CONFIG_AMD) += amd.o
>>  obj-y += core.o
>> -obj-y += intel.o
>> +obj-$(CONFIG_INTEL) += intel.o
>> diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
>> index b58611e908aa..da556fe5060a 100644
>> --- a/xen/arch/x86/cpu/microcode/private.h
>> +++ b/xen/arch/x86/cpu/microcode/private.h
>> @@ -70,7 +70,16 @@ struct microcode_ops {
>>   * support available) and (not) ops->apply_microcode (i.e. read only).
>>   * Otherwise, all hooks must be filled in.
>>   */
>> +#ifdef CONFIG_AMD
>>  void ucode_probe_amd(struct microcode_ops *ops);
>> +#else
>> +static inline void ucode_probe_amd(struct microcode_ops *ops) {}
>> +#endif
>> +
>> +#ifdef CONFIG_INTEL
>>  void ucode_probe_intel(struct microcode_ops *ops);
>> +#else
>> +static inline void ucode_probe_intel(struct microcode_ops *ops) {}
> This is stale now, and will need some updating to match what's in
> private.h.

There's nothing state I can see.

Patch 1 does significantly edit this vs what's currently in staging.

~Andrew

