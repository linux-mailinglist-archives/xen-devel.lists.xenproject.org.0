Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F99412B1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767754.1178454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmQa-0006mk-Ec; Tue, 30 Jul 2024 12:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767754.1178454; Tue, 30 Jul 2024 12:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmQa-0006lF-C1; Tue, 30 Jul 2024 12:58:08 +0000
Received: by outflank-mailman (input) for mailman id 767754;
 Tue, 30 Jul 2024 12:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYmQY-0006jF-P3
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:58:06 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5a2a0a-4e73-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 14:58:05 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5a1f9bc80e3so3786860a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:58:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5afa605d81bsm5637348a12.74.2024.07.30.05.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:58:04 -0700 (PDT)
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
X-Inumbo-ID: 5c5a2a0a-4e73-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722344284; x=1722949084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0hdNllN7iOT2NDvpdFgYwr6O7OzPMHgwqprJyYYGcxY=;
        b=VjfJxgRTMu64WvMM2b9V5ElJNkW/G4kTSxsDJwntatkuJRim8b+5Ofg6QiCkwupChS
         ArF4sSVENCrwbfcLDy+enAJ4J08pide8Zsg768Z3m5wYkwb2dz+PMmC4YdnEGRDY2n6a
         aX91/gTftKy/c7LBjZdS6iQcj+TR1UqHzLr3esBwIhfKOHx+f0imWW4hazMhiee4FO+O
         Si6UDMhZWlbpl1WpBdUJ2TdIlU1l6Ovperc8maD8PgzVnLy8pUnhTwaBb+MO1gJNImrM
         VvApgcxNfSy8pF0mL85fOi269c8wT97coYkj5QwNUX7TuiZyfNDwBp3vvBBIkkQmfKlk
         5w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722344284; x=1722949084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hdNllN7iOT2NDvpdFgYwr6O7OzPMHgwqprJyYYGcxY=;
        b=dEcySfsphJPi3MICUSVUyqbrZEFsxUcH+ujEH4WefnFwc/QJ5YjcST8tR2J3l+DaF/
         /H0KJm9kiylJwVeADhv/y81u7jhESGjlHp1xBgIX8RskcjzbPvt6UN+VP4V6/CVt+sHH
         2zIx45Rv5XeCj1c4xUbd8L2dwhyCLVCtaDPe+meEPgKCvJZqpxw5BAxvlqqW9ehN9zto
         Y08qWTSXB71yvlu277WmmyhKQYoJkAfXdSDwVv/QtZ43m3PfKtnSh2YJWUQzMSh+eEg9
         Wx7JsxtSxx/89P3MIo+wKlbQmA2zUI36m60Gc1QOuHALKPh29TPGzewFJDg8o5GVaPym
         /Lvg==
X-Forwarded-Encrypted: i=1; AJvYcCVKK8gPK/+I7eJzk1uaU7PTWiqateW2AzO4E3yXhXgIv4qdXCQIUqnVLPO69jYEAcswOod7XY/b3UG/85IqSX9LowNEZ5rTjIQ2BRec9xE=
X-Gm-Message-State: AOJu0YwXDWjHdoKoNH/twnhF4DBD2YW8oEbFbpAEyrSx9Drou+7ReeEN
	QFBA7vQ7V+2zzXOSaVsGNg940oRkEabI/te1BQFiI9pdgWb/mz1tymSsSYCqMA==
X-Google-Smtp-Source: AGHT+IGRTTP8OWA2xAAkR9O/VUWfCb1kEdw+Sm3b8hsA4kOwJmnwGhSnziUlFKuRgudLvEMoYBCF4Q==
X-Received: by 2002:a50:d5c1:0:b0:59f:bf77:80d4 with SMTP id 4fb4d7f45d1cf-5b021190877mr8570630a12.6.1722344284339;
        Tue, 30 Jul 2024 05:58:04 -0700 (PDT)
Message-ID: <220ebc7e-36eb-40af-9fa0-133bb458dfd5@suse.com>
Date: Tue, 30 Jul 2024 14:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
 <ef4b21d8-a5a9-4d24-bf18-908b5ee067db@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ef4b21d8-a5a9-4d24-bf18-908b5ee067db@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 14:35, Andrew Cooper wrote:
> On 30/07/2024 11:57 am, Jan Beulich wrote:
>> XSM is a generic framework, which in particular is also used by SILO.
>> With this it can't really be experimental: Arm enables SILO by default.
> 
> It's stronger than this.
> 
> XSA-295 makes SILO the only security supported configuration for ARM.

Okay, switched to "Arm mandates SILO for having a security supported
configuration."

>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -768,13 +768,20 @@ Compile time disabled for ARM by default
>>  
>>      Status, x86: Supported, not security supported
>>  
>> -### XSM & FLASK
>> +### XSM
>> +
>> +    Status: Supported
>> +
>> +See below for use with FLASK and SILO.  The dummy implementation is covered here
>> +as well.
> 
> This feels weird, although I can't suggest a better option.
> 
> XSM isn't optional; it can't be compiled out,

How can it not be? There's an "XSM" Kconfig control.

> nor can the dummy policy,

In a way. Yet how the dummy policy is instantiated is quite different
between XSM=y and XSM=n.

> so it's weird to call out what literally cannot have a statement
> different to the rest of Xen.
> 
> Combined with ...
> 
>> +
>> +### XSM + FLASK
> 
> ... this wanting to say "Flask (XSM module/policy)" IMO, maybe what we
> really want is:
> 
> ---%<---
> ### XSM (Xen Security Modules)
> 
> Base XSM is a security policy framework used in Xen.  The dummy policy
> implements a basic "dom0 all powerful, domUs all unprivileged" policy".
> ---%<---
> 
> intentionally without giving a Status.

As per above, imo XSM=y wants security status named. That's, after all,
part of what was missing / ambiguous so far.

> Then, the two blocks below are clearly alternative modules which have
> optionality and different support statuses.

I'll change the wording there some, to be closer to what you and also
Daniel ask for.

Jan

