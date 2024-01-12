Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529DD82BEB4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666783.1037655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOF0m-0006HC-Ay; Fri, 12 Jan 2024 10:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666783.1037655; Fri, 12 Jan 2024 10:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOF0m-0006En-8M; Fri, 12 Jan 2024 10:43:40 +0000
Received: by outflank-mailman (input) for mailman id 666783;
 Fri, 12 Jan 2024 10:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnEz=IW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rOF0k-0006EZ-04
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:43:38 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c58ccb-b137-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 11:43:37 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-336897b6bd6so5846714f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:43:37 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t21-20020a05600c451500b0040e3ac9f4c8sm9066766wmo.28.2024.01.12.02.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:43:36 -0800 (PST)
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
X-Inumbo-ID: 70c58ccb-b137-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705056216; x=1705661016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4EgiPJtSrTPltZhyDumH5xrUfDTlLQdzf3EOOZ/NNo=;
        b=l0mZmRq0V6xvwIHRssv3L+mo72fcrLXdxBe26tZelPp+LQNKe2TnIwlFBmt465Tf4N
         nvVddxpyHEG779Wmt54kgJzNf6DgO85SbQ7aQ6o7fuK7c5FfzhvHsq7AyBmq75+IOCcW
         eHQFf/ED5dbobN/8vVgBR8Pb1/ugplUhB/NgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705056216; x=1705661016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4EgiPJtSrTPltZhyDumH5xrUfDTlLQdzf3EOOZ/NNo=;
        b=GGRV2Z14MldW9fwxI8L/I/OnLf/dm+KkWOv9isSIATrafIBRDCXeccj2+2m25OuUgw
         QO3Bxh9vNIrYktMVbxF1DWDIXaUoYzCFMg+dXrSkeU0TfH4nIwWgBRbJcA3GTQZU0Zp/
         X8Szv3hgs0EXL5ppo2VEzA9gxSsXwwUh8BqD1r86RG4P6/EutIXRClN7zbCZBqrG/eDl
         wQ/htv13HoO6zwVA/BOvEBIQD5Suf4QDPdbK2juhWSyj1Wg3JJ0AfWR7w3Z8YZNJhZ8b
         FfE9DpluAOyRaxdoYvjIrYYsAalTN4f/fYIQXNSXMgH8u/TUEJ703bgxOLy0mCSJ47Gt
         42HQ==
X-Gm-Message-State: AOJu0YxtSZFl+Zs8oT52aEYRidkKG+Nfa2tW4h4FNrYvjwO8w8QMve+4
	oIYZ4Gl6R5zjc5bv+nZmBRGoXZeXC0hFOA==
X-Google-Smtp-Source: AGHT+IEZctMpp9/Xgb5d5ng3OJ5xgBqIhOvdW4gO5uUNjtpXsVOLmAzMKnuZX4qDEhzY8mhJweqmYg==
X-Received: by 2002:a05:600c:a297:b0:40e:4a29:d267 with SMTP id hu23-20020a05600ca29700b0040e4a29d267mr628343wmb.227.1705056216472;
        Fri, 12 Jan 2024 02:43:36 -0800 (PST)
Message-ID: <8225cfd3-73d6-4a93-92b4-185399ab0ad3@citrix.com>
Date: Fri, 12 Jan 2024 10:43:35 +0000
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
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d9d9ee2b-ff95-4d5e-bb81-b1722681a4a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2024 10:37 am, Jan Beulich wrote:
> On 12.01.2024 00:13, Andrew Cooper wrote:
>> Right now, vvmx will blindly copy L12's ACTIVITY_STATE into the L02 VMCS and
>> enter the vCPU.  Luckily for us, nested-virt is explicitly unsupported for
>> security bugs.
>>
>> The inactivity states are HLT, SHUTDOWN and WAIT-FOR-SIPI, and as noted by the
>> SDM in Vol3 27.7 "Special Features of VM Entry":
>>
>>   If VM entry ends with the logical processor in an inactive activity state,
>>   the VM entry generates any special bus cycle that is normally generated when
>>   that activity state is entered from the active state.
>>
>> Also,
>>
>>   Some activity states unconditionally block certain events.
>>
>> I.e. A VMEntry with ACTIVITY=SHUTDOWN will initiate a platform reset, while a
>> VMEntry with ACTIVITY=WAIT-FOR-SIPI will really block everything other than
>> SIPIs.
>>
>> Both of these activity states are for the TXT ACM to use, not for regular
>> hypervisors, and Xen doesn't support dropping the HLT intercept either.
>>
>> There are two paths in Xen which operate on ACTIVITY_STATE.
>>
>> 1) The vmx_{get,set}_nonreg_state() helpers for VM-Fork.
>>
>>    As regular VMs can't use any inactivity states, this is just duplicating
>>    the 0 from construct_vmcs().  Retain the ability to query activity_state,
>>    but crash the domain on any attempt to set an inactivity state.
>>
>> 2) Nested virt, because of ACTIVITY_STATE in vmcs_gstate_field[].
>>
>>    Explicitly hide the inactivity states in the guest's view of MSR_VMX_MISC,
>>    and remove ACTIVITY_STATE from vmcs_gstate_field[].
>>
>>    In virtual_vmentry(), we should trigger a VMEntry failure for the use of
>>    any inactivity states, but there's no support for that in the code at all
>>    so leave a TODO for when we finally start working on nested-virt in
>>    earnest.
>>
>> Reported-by: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one remark/suggestion:
>
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -1551,7 +1551,10 @@ static void cf_check vmx_set_nonreg_state(struct vcpu *v,
>>  {
>>      vmx_vmcs_enter(v);
>>  
>> -    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
>> +    if ( nrs->vmx.activity_state )
>> +        domain_crash(v->domain, "Attempt to set activity_state %#lx\n",
>> +                     nrs->vmx.activity_state);
> Might be useful to log the offending vCPU here?

Already covered.  the innards of __domain_crash() does:

    else if ( d == current->domain )
    {
        printk("Domain %d (vcpu#%d) crashed on cpu#%d:\n",
        ...

~Andrew

