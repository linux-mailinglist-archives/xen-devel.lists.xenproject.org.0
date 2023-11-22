Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED7F7F42EA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638598.995349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jwK-00052a-E5; Wed, 22 Nov 2023 09:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638598.995349; Wed, 22 Nov 2023 09:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jwK-00050a-AJ; Wed, 22 Nov 2023 09:54:36 +0000
Received: by outflank-mailman (input) for mailman id 638598;
 Wed, 22 Nov 2023 09:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5jwJ-0004Ow-5F
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:54:35 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22d7f46f-891d-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:54:32 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50aab3bf71fso4863207e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 01:54:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c471200b0040a5290dceesm1682007wmo.0.2023.11.22.01.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 01:54:31 -0800 (PST)
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
X-Inumbo-ID: 22d7f46f-891d-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700646872; x=1701251672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGTNPiloLMYSvwBHdC680VXhqwNJh/+/+7ciI8lxexA=;
        b=EtB66EIG2/15k2LS3IK4cWcABKI6CqcFD7Me98Oj3HEMQjujProYzhvm4xo4J4UbNB
         A64yPHATGVJiRTNt5n98ameCdSaHTxzcvVFscSTnHpSEs1VYit8/DzRS6rI3eva4S9vb
         GGx3sPISnSaMD+nV1lQEWzazRE1h1ceVkSqHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646872; x=1701251672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGTNPiloLMYSvwBHdC680VXhqwNJh/+/+7ciI8lxexA=;
        b=AEue9uK/CG5eau0PWJh39K7dyn6StcmaJfmGumxmSKrrbaQOpHUDpW1eQ//hpfDTUP
         oYme3DeyONgcr/xyR6q13rSsCoJSf6geBd2rHp7sUEvGLeS0w8huSAo/pUe6TO1Wd9ak
         ljih5l5z60qp4rEzL3aj+j048qq6X0zUkP0idjiJdZbpTYC/rK9xT0bgxnfhkfSFsQ2l
         tt66Xr0QGLpgDgjGa6HsJDrRuGJfZLj+bLEPqwokL+wS+31KBgTTajJjmyfaJSeSKJKI
         oDXAIFU1N4pcSKUScaMOfwwCUvzkQ4uToEaip0VsRYEIv7WwY87wFU9GYciOW/GUhsfx
         Oorg==
X-Gm-Message-State: AOJu0YzLUyX+UhO/W1XAhXtRy0mRJztL77siiDi9IKUi4JrfZl3I5bJ7
	LK2qjAM84+m2asnq8JAebvzNrg==
X-Google-Smtp-Source: AGHT+IGSIdAS3ZnG0TxZBGADzN9wWtf9/4caVwsp0aFo940Pfi/FH8XbSHsSIBkfDTywe6GVni1Y3Q==
X-Received: by 2002:a05:6512:2c92:b0:509:4599:f2bc with SMTP id dw18-20020a0565122c9200b005094599f2bcmr1463740lfb.14.1700646872183;
        Wed, 22 Nov 2023 01:54:32 -0800 (PST)
Message-ID: <8ada5516-5c1f-4c77-8f26-caa9ec314d1f@citrix.com>
Date: Wed, 22 Nov 2023 09:54:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/HVM: introduce hvm_point_entry()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <9810305d-4b36-4e23-b807-a7a00f0ba6b6@suse.com>
 <8573291e-9c0b-4be0-a633-05906026c7b6@citrix.com>
 <2a0f2f07-5d4c-438c-a333-336288206a61@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2a0f2f07-5d4c-438c-a333-336288206a61@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 9:34 am, Jan Beulich wrote:
> On 21.11.2023 22:30, Andrew Cooper wrote:
>> On 16/11/2023 1:46 pm, Jan Beulich wrote:
>>> ... to accompany hvm_read_entry() when actual copying isn't desirable.
>>> This allows to remove open-coded stream accesses from hpet_load(),
>>> along with using the helper in hvm_load() itself.
>>>
>>> Since arch_hvm_load()'s declaration would need changing, and since the
>>> function is not used from elsewhere, purge the declaration. With that it
>>> makes little sense to keep arch_hvm_save()'s around; convert that
>>> function to static then at the same time.
>>>
>>> In hpet_load() simplify the specific case of error return that's in
>>> context anyway: There's no need to hold the lock when only updating a
>>> local variable.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks.
>
>> I really do hate all of this logic and most of it wants to live in
>> userspace, but this an improvement.
>>
>> The only thing I'm a little concerned with is the name. 
>> hvm_read_entry() clearly consumes an entry, while hvm_point_entry()
>> does, but doesn't obviously convey this at a glance.
>>
>> Ideally I'd say that hvm_{get,copy}_entry() would be better nomeclature,
>> as both have at least a vague implication of unmarshalling and one
>> clearly is making a separate copy.
> I'm fine renaming the new one to hvm_get_entry(). For the existing one,
> "copy" may be marginally better than "read" / "load", but then it doesn't
> indicate direction (i.e. somewhat collides with hvm_{write,load}_entry()).
> So I'd want to leave those as they are.

Ok, get/read/write make a reasonably-ok set of names.

~Andrew

