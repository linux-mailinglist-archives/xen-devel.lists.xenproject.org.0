Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A249DFF08
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 11:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846535.1261707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3jH-0002xn-Mi; Mon, 02 Dec 2024 10:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846535.1261707; Mon, 02 Dec 2024 10:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3jH-0002vm-JV; Mon, 02 Dec 2024 10:32:35 +0000
Received: by outflank-mailman (input) for mailman id 846535;
 Mon, 02 Dec 2024 10:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOQF=S3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tI3jG-0002vc-2z
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 10:32:34 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba4dccf5-b098-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 11:32:28 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so1070568f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 02:32:28 -0800 (PST)
Received: from [192.168.86.29] ([90.240.255.120])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df15e1e7sm9439970f8f.40.2024.12.02.02.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 02:32:26 -0800 (PST)
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
X-Inumbo-ID: ba4dccf5-b098-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0NDQiLCJoZWxvIjoibWFpbC13cjEteDQ0NC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJhNGRjY2Y1LWIwOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTM1NTQ4LjA5MTM1LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733135547; x=1733740347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGi6JQX5Ir8Avtbk5xcbxGZZF4WpItgDBposOI+fT0M=;
        b=fY003xQ8Xh0wa9M9IRIQDKPGhRYS+BFIuEOxjPYFDv+8eyO4jz2GgzoT41QnrsArrM
         MGxTwe6rYxlaCfDnCDTozj4h4vsBr6U5gJLaC8h2Y9bJiOjtVEuU8l7E/25fkQ+fhFdb
         MLgnf3ObrXC3Nl/gzxOXPE1jwSqTN+EUBa3v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135547; x=1733740347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGi6JQX5Ir8Avtbk5xcbxGZZF4WpItgDBposOI+fT0M=;
        b=iDEaOFkSQlO9j/z00IxqL51ozHIABqv0qrO4BEsLbCLE/vITtr9Li4pr/dGn3HYcPQ
         o3nWP77KU4o1v4KuLBYzyQc4MVKUOKvot0lZLSal79JWMKxVIanYjq32dsbejH2V3vZ8
         918mIhAcvJU3ny4hYWoA70MAAOTkr3c1IIEKWQi1UZj6FcUCcSz882/LLkpIPBE7Zmr0
         d4RYOPatPMbF5z3lDj//jsUm4EsWUJ5qQw1CyOnzzIDP59BiMb5Pr2COdIEx4t79xnR4
         ojSHstGuXyc75Xu4XO/P04t2Uk3ASlfD3b3i4vsIwaVqtc3U+Cr6mked8B8nLeLXocYY
         gB0w==
X-Forwarded-Encrypted: i=1; AJvYcCXCTjJ6+FqzZlfMCgPTZq57ri+0svUFZ3fymJRg/LqueSDH1cTEs/EUFY5iSwgpG5gNvCWUw5JVg0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPRWaVA2KlL7bZ0G4IOZEim7ZaXimQWYv1/ogPfiQ4Ms/5VyXX
	HSjeOzGaYfz0/CLgmS9yf2GUxZvTkLXNwAEJMPanhd1PdMZb2C/9ZxFlIp2mrfs=
X-Gm-Gg: ASbGncu//eqxqUDy4sfY2z5rIncN1EQ+zF05Jx7RQdZLZ13dHoZgaXjK96xAb5tJfqb
	eu/xrqiBPBw2KTf1rPa8KntJX9ly/dx5lQ2xFKoz3V93R7yvYpBo3Mv+VvibpbMj7+1anxIGOXL
	SsPkOKjMfLcvv8tZy6tXUY8vwUb9VMqcuiomajeZ/goCFn/b3WTEQfxQvpcllUCmQcIrQpP1B2e
	l+Avz7dBsSXLlDxexFkLIHLzZShutgfP+ApgtLQrPzuBKmvzQT+U+dgRjH2r+Q=
X-Google-Smtp-Source: AGHT+IFqe8aSc+XYv+N3ydO51n0afa0lqeamRD8iLQEQFlNbDRpaLjw8MjkIiCtrH6A/UGcyA7J/Dg==
X-Received: by 2002:a05:6000:188c:b0:382:5010:c8de with SMTP id ffacd0b85a97d-385c6edd539mr20491028f8f.46.1733135547445;
        Mon, 02 Dec 2024 02:32:27 -0800 (PST)
Message-ID: <9577c54c-7c6e-4411-9db9-c7070e13ebde@citrix.com>
Date: Mon, 2 Dec 2024 10:32:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
To: Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-2-volodymyr_babchuk@epam.com>
 <56f5cf93-33fc-4314-8d38-93d9e0026429@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <56f5cf93-33fc-4314-8d38-93d9e0026429@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2024 8:06 am, Jan Beulich wrote:
> On 30.11.2024 02:10, Volodymyr Babchuk wrote:
>> This patch is preparation for making stack protector
>> configurable. First step is to remove -fno-stack-protector flag from
>> EMBEDDED_EXTRA_CFLAGS so separate projects (Hypervisor in this case)
>> can enable/disable this feature by themselves.
> s/projects/components/ ?
>
>> --- a/stubdom/Makefile
>> +++ b/stubdom/Makefile
>> @@ -54,6 +54,8 @@ TARGET_CFLAGS += $(CFLAGS)
>>  TARGET_CPPFLAGS += $(CPPFLAGS)
>>  $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>> +$(call cc-option-add,TARGET_CFLAGS,CC,-fno-stack-protector)
>> +
>>  # Do not use host headers and libs
>>  GCC_INSTALL = $(shell LANG=C gcc -print-search-dirs | sed -n -e 's/install: \(.*\)/\1/p')
>>  TARGET_CPPFLAGS += -U __linux__ -U __FreeBSD__ -U __sun__
>> --- a/tools/firmware/Rules.mk
>> +++ b/tools/firmware/Rules.mk
>> @@ -15,6 +15,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>>  $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
>>  
>> +$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
>> +
>>  # Do not add the .note.gnu.property section to any of the firmware objects: it
>>  # breaks the rombios binary and is not useful for firmware anyway.
>>  $(call cc-option-add,CFLAGS,CC,-Wa$$(comma)-mx86-used-note=no)
>> --- a/tools/tests/x86_emulator/testcase.mk
>> +++ b/tools/tests/x86_emulator/testcase.mk
>> @@ -4,6 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
>>  
>>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>> +$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
> Is use of cc-option-add really necessary throughout here, when ...
>
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -432,6 +432,8 @@ else
>>  CFLAGS_UBSAN :=
>>  endif
>>  
>> +CFLAGS += -fno-stack-protector
> ... is isn't needed here? Iirc the compiler version ranges supported don't
> vary between components. Then again afaics $(EMBEDDED_EXTRA_CFLAGS) is used
> by x86 only right now, and with cc-options-add, so perhaps it (a) needs
> using cc-options-add here, too, and (b) it wants explaining why this needs
> generalizing from x86 to all architectures. Quite possibly hypervisor use
> of $(EMBEDDED_EXTRA_CFLAGS) may want generalizing separately, up front?

EMBEDDED_EXTRA_CFLAGS uses cc-*-add because some options are (/were) not
accepted by compilers.  Notably -fno-stack-protector-all (found from v1
of this series), and prior to that, -no-pie which as I recall is an LD
option not a CC option.

All supported compilers know -fno-stack-protector (found when checking
-fno-stack-protector-all) so it can be added to plain CFLAGS everywhere,
not only in xen/

~Andrew

