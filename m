Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356FA7EB2B2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632649.986983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ueE-0004V1-El; Tue, 14 Nov 2023 14:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632649.986983; Tue, 14 Nov 2023 14:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ueE-0004TM-Av; Tue, 14 Nov 2023 14:44:14 +0000
Received: by outflank-mailman (input) for mailman id 632649;
 Tue, 14 Nov 2023 14:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iys2=G3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r2ueC-0004TG-MV
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:44:12 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46448b60-82fc-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:44:11 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so73359991fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:44:11 -0800 (PST)
Received: from [172.25.82.51] ([12.186.190.2])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05620a241500b0077bd79682c4sm2431108qkn.5.2023.11.14.06.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 06:44:10 -0800 (PST)
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
X-Inumbo-ID: 46448b60-82fc-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699973051; x=1700577851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzMmkVdserEMmO9c1dzFsiFKocKzYApkm+sujdRvQ+k=;
        b=eenapmTRYh609vcCSp5NB+icROB9HhuWeVLIiu7HABZGdiKTwX9rnn5TsEyKBIBQ0S
         qJrSK3ELeAsVT4mkJBNBZkC5vNQ8k800jH5390I6KcYxTpZfYb/b6FiZOVQr14nLbsAp
         tNvFWPM8cgADWhO3D14jZUsEOXi85ihlpdgUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699973051; x=1700577851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzMmkVdserEMmO9c1dzFsiFKocKzYApkm+sujdRvQ+k=;
        b=ZuZIHqS93Bpq4harOM4jo2QJUQf44M0AU2W76LbkB1S39xzwJKsKHgUFO+kotQH+oI
         5bXUn1A42YqEB48DhoZ8E2gn0zYomsF2N8CbA7e0aBb8EyfECyJMF6SyEWMEmvMX7meJ
         DXiaW6IfQyThzuZlE43oOKmfnKMwHpCq4anUs6AeENszDnm3wkaFrZKLB1Wk4JkRslcW
         f+hUGihQ0C9zY9YUEu1XUhYa4uKhf/mDdYVM/WoSL9uq4qAbJkFegvCXB78J5LgqpU7h
         XqE4xfjtMW/pv23/yp+3YoyNSJS6raMimvcKee4zyHL/lt6ovFKHRwg6ipb96K2bjEjT
         T52Q==
X-Gm-Message-State: AOJu0Yy4jDj/MlRQnayXdh2Oc8fEh70Rrb3I80JkKU/afHKAzYWxdiEV
	RcA5YojBEYZUMkwx1GWKJjmB2A==
X-Google-Smtp-Source: AGHT+IEdPrI7oiqeN7y3Ub11nHYXukcBqfvO3LljkArbZokQBCNroV+6ZbLC5RTeULGp6OuWX5P57A==
X-Received: by 2002:a2e:8551:0:b0:2c5:16c0:6239 with SMTP id u17-20020a2e8551000000b002c516c06239mr1790071ljj.51.1699973051343;
        Tue, 14 Nov 2023 06:44:11 -0800 (PST)
Message-ID: <2a340b44-9d3e-431f-94d6-e77e6145fc6a@citrix.com>
Date: Tue, 14 Nov 2023 14:44:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
 <65536590.050a0220.eb28a.617d@mx.google.com>
 <f278f367-81cb-4a72-9303-23622dea3abd@suse.com>
 <fd99ea62-f011-4bcb-ba83-4698b5d267fd@citrix.com>
 <ZVOAEFoYFDp8lxCd@macbook.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZVOAEFoYFDp8lxCd@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2023 2:11 pm, Roger Pau Monné wrote:
> On Tue, Nov 14, 2023 at 12:55:46PM +0000, Andrew Cooper wrote:
>> On 14/11/2023 12:32 pm, Jan Beulich wrote:
>>> On 14.11.2023 13:18, Alejandro Vallejo wrote:
>>>> On Tue, Nov 14, 2023 at 11:14:22AM +0100, Jan Beulich wrote:
>>>>> On 13.11.2023 18:53, Roger Pau Monné wrote:
>>>> I don't think vlapic_match_logical_addr() is affected. The LDR's are still
>>>> unique in the bogus case so the matching ought to work. Problem would arise
>>>> if the guest makes assumptions about APIC_ID and LDR relationships.
>>> The LDRs still being unique (or not) isn't what I'm concerned about. It is
>>> the function's return value which would be wrong, as the incoming "mda"
>>> presumably was set in its respective field on the assumption that the LDRs
>>> are set in a spec-compliant way. There not having been problem reports
>>> makes me wonder whether any guests actually use logical delivery mode in a
>>> wider fashion.
>> They likely don't.
>>
>> Logical delivery for xAPIC only works in a tiny fraction of cases
>> (assuming correct topology information, which we don't give), and
>> persuading a VM to turn on x2APIC without a vIOMMU is not something
>> we've managed to do in Xen.
> We do, in fact the pvshim (or nested Xen) will run in x2APIC mode if
> available.
> Linux >= 5.17 will also use x2APIC mode if available when running as a
> Xen HVM guest:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8980fcb210851138cb34c9a8cb0cf0c09f07bf9

Yeah that's never actually been tested with 256 vCPUs.

A VM *must* have either a vIOMMU, or know (via whatever means) that
there are no IO-APICs, or (via whatever means) that all IO-APICs can use
reserved bits for 32k destination APIC ID support.

As it stands, this is just something which will explode on us in the
future.  Hopefully the worst that will happen is a panic on boot.

> If a guest has been booted with the bogus LDR we need to keep it on
> migrate, otherwise at least Xen will break (because it does read the
> LDR from the hardware instead of building it based on the APIC ID).

Of course.  That would be data corruption otherwise.

> Switching to the correct LDR on APIC reset can be sensible, any APIC
> device reset should be done together with updating whatever registers
> have been previously cached, and OSes don't do APIC resets anyway.

Yes.  We can just set it properly on reset and the problem ought to
disappear.

~Andrew

