Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF96A96689
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 12:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962456.1353673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7BDk-0006U0-IX; Tue, 22 Apr 2025 10:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962456.1353673; Tue, 22 Apr 2025 10:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7BDk-0006Qs-Fq; Tue, 22 Apr 2025 10:51:20 +0000
Received: by outflank-mailman (input) for mailman id 962456;
 Tue, 22 Apr 2025 10:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7BDi-0006Qj-LQ
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 10:51:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b775fe91-1f67-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 12:51:17 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso37206405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 03:51:17 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6db1b3sm170934415e9.29.2025.04.22.03.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 03:51:15 -0700 (PDT)
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
X-Inumbo-ID: b775fe91-1f67-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745319076; x=1745923876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2B2Y4gj/u3jpgelTu1PasFoVXd/QwLST1YxNtwV/iOw=;
        b=e2xKMt9P7dQ2+oIzUV7MeZn9pashPEHasgDH59hkESfBHgtKRCNRyjgnCwMpp5a5qU
         c6NXyjjrqjm6vW2GdMHf9wi0DLOQe02Pke6Wmu/aNc/I3ji7YjQhcaI8/AmnnXq4SY5D
         ivx/S5PU8xdU6XMyfL+dVeULP7u3Ev4ANE15I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319076; x=1745923876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B2Y4gj/u3jpgelTu1PasFoVXd/QwLST1YxNtwV/iOw=;
        b=OJEy4myergJuE2Y5nCDOVKbjjov9hSAFlj6kHdrTfpjlXO0ReubZw3x935Cy/7N6Dt
         0ECVvqIUtN0jVUMpFB1GFvBeiCqcfj4JzYjTaC5VfBIWeUjZvn+KX/kxowyZiuWZJOmw
         7tjih9l8WUu+f6ZLStYmtzzzKFxKGRF8q7vbPyKzxfmoohwhD0R6l692SdiU+5b8gyyP
         lXG+Ky0Hm9cqEgX/cTpV7tBZ25Td4BnhhWR+OR8XDNAfpbPBGaIoLI54MAKhjn5LSUAr
         XLO0Vx11dIb8XMBF3VrbEAe8OyKx/cftPZpSgES6OBWY9NjispXUthgTbh8Zlq5MjCvD
         U8GA==
X-Gm-Message-State: AOJu0Yx5xlSp9+nWbuRNsE8tpmC/9qPvAAw+fIFtrv2KzLehGZ63rJZd
	jxgzLzqAtzKKj2iY7bvCbl8K8xBTxadGZvwvv8g22Ko/VYzEBM1WYW5qCt2Vz+g=
X-Gm-Gg: ASbGncs1yK9vXOsNqDi/STe7RDr39dKHz3HjYXiFcNI0RDhmZC2iqJerC8jrjq4Co7G
	pP3WJ5eg6kA6gC3Y5NSfPuh15wbTihQBpHmZwRaU7deYnZldSg0qwQo50/QXxI4dSVk15INy2Zr
	MgV60FEs1FQGYqpq0ykbEALo/aqVS3C3fhIJH2+AOBjtM/nqwNttOrklJFdTD95nV7dBd7+5iK9
	Ext/ymEUWuteKGfrKEuuhpAjKuG59MhmIqZBgOdTVF5NhkiuASN9EcDMeXFI1fMe93Rt9p4GWIN
	KUqzNfhprGMaOWFjqqJjudEJ9niBC2S+MZX/934X8LlcVdNLVwQhBEBMC8GDEfwR
X-Google-Smtp-Source: AGHT+IF05Io9/GKqK6anDGsES+fG6Y7Zmn66RSp0mBeQ0E3FLKLqWnyMRmSLaOQvzcBQZbp1HxXzSA==
X-Received: by 2002:a05:600c:1e10:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4406ac62b75mr152819005e9.31.1745319076267;
        Tue, 22 Apr 2025 03:51:16 -0700 (PDT)
Message-ID: <3468d309-5165-4b9a-a249-1a3e35396224@citrix.com>
Date: Tue, 22 Apr 2025 11:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20250417161913.14661-1-roger.pau@citrix.com>
 <CACHz=ZgnaJuHTOrhhNEDtctV8HP7X8GZDP9HMAy7TTDUk+dcmQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZgnaJuHTOrhhNEDtctV8HP7X8GZDP9HMAy7TTDUk+dcmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 11:40 am, Frediano Ziglio wrote:
> On Thu, Apr 17, 2025 at 5:19 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
>> index 6a680ba38dc9..9d7c6ea297a9 100644
>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
>>      }
>>  }
>>
>> +/*
>> + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
>> + * processor to wait in a sleep state until a store to the armed address range
>> + * occurs. Due to this erratum, stores to the armed address range may not
>> + * trigger MWAIT to resume execution.
>> + *
>> + * ICX143: Under complex microarchitectural conditions, a monitor that is armed
>> + * with the MWAIT instruction may not be triggered, leading to a processor
>> + * hang.
>> + *
>> + * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
>> + *
>> + * Force the sending of an IPI in those cases.
>> + */
>> +static void probe_mwait_errata(void)
>> +{
>> +    static const struct x86_cpu_id models[] = {
>> +        /* Apollo Lake */
>> +        INTEL_FAM6_MODEL(0x5C),
>> +        /* Ice Lake */
>> +        INTEL_FAM6_MODEL(0x6A),
>> +        INTEL_FAM6_MODEL(0x6C),
> Intel patch for Linux only adds model 0x6a, not 0x6c. Did we manage to
> reproduce on 0x6c? Which patch is more correct? Surely we are on the
> safer side.

It only affects 0x6a, but I can't go into why.  Now that Linux is
picking up this workaround, we should follow Dave Hansen managed to get
out of Intel's internal bugtracker on the matter.

~Andrew

