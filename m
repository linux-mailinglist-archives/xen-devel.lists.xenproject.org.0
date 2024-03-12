Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7C8792E8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 12:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691781.1078128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0Fj-0003My-3u; Tue, 12 Mar 2024 11:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691781.1078128; Tue, 12 Mar 2024 11:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0Fj-0003Jw-0c; Tue, 12 Mar 2024 11:25:03 +0000
Received: by outflank-mailman (input) for mailman id 691781;
 Tue, 12 Mar 2024 11:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=puNH=KS=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1rk0Fh-0003Jq-T4
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 11:25:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 293480ee-e063-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 12:25:00 +0100 (CET)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-3h6p3-o2OzWdtojOZSd3WA-1; Tue, 12 Mar 2024 07:24:57 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42ee0da398eso75267801cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 04:24:57 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-86.web.vodafone.de.
 [109.43.177.86]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05622a050b00b0042c7d11e280sm3608889qtx.90.2024.03.12.04.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 04:24:56 -0700 (PDT)
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
X-Inumbo-ID: 293480ee-e063-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710242699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gnBoAxc43PzxlzX8NgDw1FOToc09+ltM8010JBkSnys=;
	b=e9/3H3VMXf5v0Hyrk6ovKXcI9QUHW4RkLDr+ez+uLnmbk1Qx9EPoVGUqU0nOaF0sUtpyPi
	RdGhb5YyhYO3WPLpPPz6WAO9d2nEZAhZj600nHtyJL+G9mQvk7ASeUME1vXjw0WDqLvMPt
	uHTJsvYMTcGB/uM7sQPamVnWN4ZMgNU=
X-MC-Unique: 3h6p3-o2OzWdtojOZSd3WA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710242697; x=1710847497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnBoAxc43PzxlzX8NgDw1FOToc09+ltM8010JBkSnys=;
        b=FBq7YG0DoZXiYuIwGqbligm6YSEONCUVuOUGLPQ/HBB5jj40YtkFBv9eDW7mNGyxZ3
         //1vr5gmI04CUKEygZoouw155bnuHARRH+x8EDwd7Jo/BJFE1Eoh8go+LikC9DILgfU/
         Ck+UnoMGplTzoH0E8uvGwApYbrB/AbvZjGbjdQGAlZx1H5q32XLOuYANJ5R2jv8cHzwr
         bZh4Ga89BtDQEWpM5ut10g6ZErMh5Boqb7SmdFgYX/C6mUkRClj4OVqwrYMhBH6LjTvQ
         qrg/eWI93Cf7LsFCHeA26u0b96R8s4+dkdChfC1tjAARHU6psI+tqIGbaPDEowh+5yHD
         iepw==
X-Forwarded-Encrypted: i=1; AJvYcCUhtWX7bJOuK8dptbITkPzkUsmJ6sCdbOJ/rn8aMzI/nY798ZQY6N95Qs/RKgDzi+/Z3YihDKb1YPxjyothXlG1MHXVdnIFfa1oKp85n+k=
X-Gm-Message-State: AOJu0YwtB+wRVaEfNHsYXPeM64TtUhTE8dskhyaxJUG2HPPoDHEgkIjw
	gHUwuNghl5KMEPOfwPVct2wk5jcWczgJaTMGp24NTILcSZ0zBD+Ly9p+eRB+VxTr82rZBqCiKyt
	P4MQ89DHt2l+080esPvXp0ax7saVTmKuBS0G5jXM2ZqaGD2ypTJQcwmitri7tLD53
X-Received: by 2002:a05:622a:1454:b0:42e:8beb:325 with SMTP id v20-20020a05622a145400b0042e8beb0325mr10339144qtx.31.1710242696623;
        Tue, 12 Mar 2024 04:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOC3aOF+g4AMZA0grALUbHfxXPMcm4Ryayzppon2mawE44bRCtuTu2Z1s3VoohtkPfAdKV1g==
X-Received: by 2002:a05:622a:1454:b0:42e:8beb:325 with SMTP id v20-20020a05622a145400b0042e8beb0325mr10339129qtx.31.1710242696303;
        Tue, 12 Mar 2024 04:24:56 -0700 (PDT)
Message-ID: <96422cf0-30a8-4e2a-99c5-8388ec342e36@redhat.com>
Date: Tue, 12 Mar 2024 12:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/29] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
To: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-15-philmd@linaro.org>
 <20240130140115.135f533d@imammedo.users.ipa.redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240130140115.135f533d@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/01/2024 14.01, Igor Mammedov wrote:
> On Mon, 29 Jan 2024 17:44:56 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> Mechanical patch produced running the command documented
>> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> 
> commenting here since, I'm not expert on coccinelle scripts.
> 
> On negative side we are permanently loosing type checking in this area.

Not really that much. Have a look at cpu_env(), it has a comment saying:

  "We validate that CPUArchState follows CPUState in cpu-all.h"

So instead of run-time checking, the check should have already been done 
during compile time, i.e. when you have a valid CPUState pointer, it should 
be possible to derive a valid CPUArchState pointer from it without much 
further checking during runtime.

> Is it worth it, what gains do we get with this series?

It's a small optimization, but why not?

> Side note,
> QOM cast expenses you are replacing could be negated by disabling
> CONFIG_QOM_CAST_DEBUG without killing type check code when it's enabled.
> That way you will speed up not only cpuenv access but also all other casts
> across the board.

Yes, but that checking is enabled by default and does not have such 
compile-time checks that could be used instead, so I think Philippe's series 
here is still a good idea.

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>>   static inline void vmx_clear_nmi_blocking(CPUState *cpu)
>>   {
>> -    X86CPU *x86_cpu = X86_CPU(cpu);
>> -    CPUX86State *env = &x86_cpu->env;
>> -
>> -    env->hflags2 &= ~HF2_NMI_MASK;
> 
>> +    cpu_env(cpu)->hflags2 &= ~HF2_NMI_MASK;
> 
> this style of de-referencing return value of macro/function
> was discouraged in past and preferred way was 'Foo f = CAST(me); f->some_access
> 
> (it's just imprint speaking, I don't recall where it comes from)

I agree, though the new code is perfectly valid, it looks nicer if we'd use 
a variable here instead.

  Thomas


