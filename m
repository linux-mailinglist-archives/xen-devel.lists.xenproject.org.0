Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3E668F6B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 08:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476808.739170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGEkK-0002LC-Jv; Fri, 13 Jan 2023 07:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476808.739170; Fri, 13 Jan 2023 07:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGEkK-0002IS-Fu; Fri, 13 Jan 2023 07:45:04 +0000
Received: by outflank-mailman (input) for mailman id 476808;
 Fri, 13 Jan 2023 07:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGEkI-0002IK-CK
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 07:45:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f6a43a6-9316-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 08:45:01 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id z11so30101520ede.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 23:45:01 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 ew7-20020a056402538700b0049b58744f93sm1498910edb.81.2023.01.12.23.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:45:00 -0800 (PST)
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
X-Inumbo-ID: 2f6a43a6-9316-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsGO+7TGWvFuZLMUYRp7Wdn3kI5JHbZiEPOnzCuFKAA=;
        b=e7+23y1+z7Eka7I4AFEjEWQN+gzh0v5BS8ZlEZjTf/hCAPe7mhvu3EujcQSwpnlUiS
         T231oXDgjfZ8R3GkQQyPSw6FN6PzSu1RyJ9tWU4l+fWrk979mCn64dSW/Z/qp4BHbY66
         krWSikRkmDAhK++cONo5thNJLDORD64Te7ZKJLda1jroqo6BcCW52qJkCyr8h+ErBa5u
         ID2mHj3dXUPWvnBsPDr8ZRWm3SnjITOiCmd3yPNY/3o8yC7O2gyTxMAxcvNpXFimEGN8
         CmjXzaX9Idoh5TpcLTCYk7OhDpzP2mO8dpNqEWjMmzwGUwXWTQvc5U0jftZpzCOV3Eym
         WtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsGO+7TGWvFuZLMUYRp7Wdn3kI5JHbZiEPOnzCuFKAA=;
        b=tcksvOYNHMO6TEsZ/4/p0cM191xXKTAfahkLTtuKz6R4eLJ0b7P7qve6QN7CZkrHJc
         2LgNCP7d6lwlWS/nDz/Dvtk37ly7Agr5o+623lip1OvusQ4TU7mBKI2rx7s27pauBsQq
         On+bLJoHjmmj5ncFb0CT2ZTieveXzOu6GvP/tLEXvl5e8ZY3m9VSuq58zEccDNjP7zmD
         dOGEb6b7jHgnRBqKeePMyISxx4BTqkd6H+h48sb8Rwwt0odzwnMSUYUk0+BwGsn6iQjS
         IiuYHnsSWJdWa92fAnR/naZW4V/CmIWEPq9OIEuaP6N+/fssYSq47fmzTWuha48ppN7W
         F8Dg==
X-Gm-Message-State: AFqh2krEtIUWcWX9I5Y524mREzn5nvbr/6NB0A02FGHxOQGbIZigaOfz
	i+zAJwNfZXTbWQBencA/D+I=
X-Google-Smtp-Source: AMrXdXv4kOKjqyHRZKSZO51hVTmb/pAlGTR4NvvYIuzi2SgJz/H8LFjwKZ/tn3y+mxEJwPuxNMDjwQ==
X-Received: by 2002:a05:6402:e9b:b0:479:8313:3008 with SMTP id h27-20020a0564020e9b00b0047983133008mr59127596eda.0.1673595900901;
        Thu, 12 Jan 2023 23:45:00 -0800 (PST)
Message-ID: <e16daaf6-5f6a-d0a3-802c-0bfc0b6876a7@gmail.com>
Date: Fri, 13 Jan 2023 09:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-7-burzalodowa@gmail.com>
 <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
 <6c5a4c07-e942-a683-8579-a0f9d5971c7b@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <6c5a4c07-e942-a683-8579-a0f9d5971c7b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/23 14:37, Jan Beulich wrote:
> On 12.01.2023 13:16, Jan Beulich wrote:
>> On 04.01.2023 09:45, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -2143,6 +2143,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
>>>       return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
>>>   }
>>>   
>>> +static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>>> +                                       const struct pirq *pirq, uint8_t gvec)
>>> +{
>>> +    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
>>> +
>>> +    return pi_update_irte(pi_desc, pirq, gvec);
>>> +}
>>
>> This being the only caller of pi_update_irte(), I don't see the point in
>> having the extra wrapper. Adjust pi_update_irte() such that it can be
>> used as the intended hook directly. Plus perhaps prefix it with vtd_.
> 
> Plus move it to vtd/x86/hvm.c (!HVM builds shouldn't need it), albeit I
> realize this could be done independent of your work. In principle the
> function shouldn't be VT-d specific (and could hence live in x86/hvm.c),
> as msi_msg_write_remap_rte() is already available as IOMMU hook anyway,
> provided struct pi_desc turns out compatible with what's going to be
> needed for AMD.

Since the posted interrupt descriptor is vmx specific while 
msi_msg_write_remap_rte is iommu specific, can I propose the following:

- Keep the name as is (i.e vmx_pi_update_irte) and keep its definition 
in xen/arch/x86/hvm/vmx/vmx.c

- Open code pi_update_irte() inside the body of vmx_pi_update_irte() but 
replace intel-specific msi_msg_write_remap_rte() with generic 
iommu_update_ire_from_msi().

Does this approach make sense?

-- 
Xenia

