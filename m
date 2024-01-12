Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA682BF22
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666839.1037755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFYw-0004SE-71; Fri, 12 Jan 2024 11:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666839.1037755; Fri, 12 Jan 2024 11:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFYw-0004Q0-3Y; Fri, 12 Jan 2024 11:18:58 +0000
Received: by outflank-mailman (input) for mailman id 666839;
 Fri, 12 Jan 2024 11:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnEz=IW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rOFYu-0004OZ-EC
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:18:56 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ee6b79e-b13c-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 12:18:54 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso80769705e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 03:18:54 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040e42391a12sm5390876wmo.13.2024.01.12.03.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 03:18:53 -0800 (PST)
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
X-Inumbo-ID: 5ee6b79e-b13c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705058334; x=1705663134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oU9o5JKKXTW4GrHJtIRxMttdhs29ICYJGsisDCRDS1w=;
        b=aFOudQ2HJGJp91czyIc35osVq3W1aqB2qx3jdMLIwkfU4ZF28IEyMqt813/8b6ALZp
         vDYlJhqt572bKHM9S1svlrRUfSAyYu6B7V3bPmkz6grwgy0Ll1pm78miEDIZZYopXpm8
         fRv/1AUp09fMeS194+JenUuO78c3g4PwVFBdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705058334; x=1705663134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU9o5JKKXTW4GrHJtIRxMttdhs29ICYJGsisDCRDS1w=;
        b=EIndjvMqAZyOn51yJNQ5v21siqCf4h6fE3fo6gZPCyv6zrOZUJwhh5TYo/BP1fQ+U5
         bQ+z/Zo54jUDzgehzmd/jk2QR2zPBYKB4xSRGAicmNqfXZTm9m8Thg80Psuje+f23qmA
         C1WDh6jB9j/gZ6d4Ryw7iXUkWvGflevAC3Fcs8/mEpVe15fWAXr8ZZQgmE2Au+FVu+O+
         MQMbviPzSOgTqUKlDG2Mw2TL7g1IiO7/2lfc/xsE7rM+swJLdcOci1gEpuIIylGNm3xZ
         jVkuP5e9RcemOo9ul/4va377CcNRzMzd99mZLNKPAJFlktlyy+5wIeFXJ5vMpZbv1y9P
         y44A==
X-Gm-Message-State: AOJu0Yz624R9YKogzxaYiG51MSkymK2NUswAqg8m3Cil87jjx7dMGDiE
	wzfTpPDU6dwGqk4gCl7E0dnlfIzCHyWDmQ==
X-Google-Smtp-Source: AGHT+IEWOElTsRTnsb7jrXpDys5yiu6U1YGnOH/ChI8e+YSNp3oGxtqN7sxD60tA7Dk8YOFOKYp1mQ==
X-Received: by 2002:a05:600c:19d2:b0:40e:541e:d5b with SMTP id u18-20020a05600c19d200b0040e541e0d5bmr614549wmq.192.1705058333811;
        Fri, 12 Jan 2024 03:18:53 -0800 (PST)
Message-ID: <9eab7ca8-7c28-461b-8527-e3e7d650e921@citrix.com>
Date: Fri, 12 Jan 2024 11:18:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/vmx: Disallow the use of inactivity states
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
 <20240111231323.4043461-4-andrew.cooper3@citrix.com>
 <d9d9ee2b-ff95-4d5e-bb81-b1722681a4a5@suse.com>
 <8225cfd3-73d6-4a93-92b4-185399ab0ad3@citrix.com>
 <b25c0ff6-b2da-4e5b-b6b9-dca7843816d2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b25c0ff6-b2da-4e5b-b6b9-dca7843816d2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2024 11:04 am, Jan Beulich wrote:
> On 12.01.2024 11:43, Andrew Cooper wrote:
>> On 12/01/2024 10:37 am, Jan Beulich wrote:
>>> On 12.01.2024 00:13, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>>> @@ -1551,7 +1551,10 @@ static void cf_check vmx_set_nonreg_state(struct vcpu *v,
>>>>  {
>>>>      vmx_vmcs_enter(v);
>>>>  
>>>> -    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
>>>> +    if ( nrs->vmx.activity_state )
>>>> +        domain_crash(v->domain, "Attempt to set activity_state %#lx\n",
>>>> +                     nrs->vmx.activity_state);
>>> Might be useful to log the offending vCPU here?
>> Already covered.  the innards of __domain_crash() does:
>>
>>     else if ( d == current->domain )
>>     {
>>         printk("Domain %d (vcpu#%d) crashed on cpu#%d:\n",
>>         ...
> Except that afaict v != current here at all times (at least as far as
> current use of the function goes).

Hmm.  That's irritating.

In this case, it's a dead logic path - hence why in v1 I simply deleted it.

But I would prefer not to have to rely on a human getting an error
message right in order to get proper logging.

I suppose what we really want is a vcpu_crash(), but this is now firmly
in the realms of the cleanup patch I still haven't had time to repost.

I think I'll extend this with %pv for now, which can be dropped when
vcpu_crash() appears.

~Andrew

