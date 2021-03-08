Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BF2330FEA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94946.178987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGGC-0006ES-0W; Mon, 08 Mar 2021 13:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94946.178987; Mon, 08 Mar 2021 13:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGGB-0006E3-TA; Mon, 08 Mar 2021 13:49:23 +0000
Received: by outflank-mailman (input) for mailman id 94946;
 Mon, 08 Mar 2021 13:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJGGA-0006Dw-7v
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:49:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11f9e7aa-71cf-4652-accf-9105bc361f9f;
 Mon, 08 Mar 2021 13:49:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 723DDAD74;
 Mon,  8 Mar 2021 13:49:20 +0000 (UTC)
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
X-Inumbo-ID: 11f9e7aa-71cf-4652-accf-9105bc361f9f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615211360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HihofuaBJs3E19YQarO5yvxqeJKKBAq0er0iW7zmYGY=;
	b=qEG/yICHwoH3h3IgrhvKeYiq+oTz0cCkKd81U3wfofEh2R7gklSZsmbGJaJsCNH5BnLVPm
	D95deB9SEba7BhdlwyVwGX0d9H+oxot6P5DsUyr+8sIKh19uiaTHw6XOBN0MLDf46CMOZ6
	I/mY0oanMBl+UWHuoR091xk411sEFuc=
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
 <YEYUbGw5J1VMnuxd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
Date: Mon, 8 Mar 2021 14:49:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEYUbGw5J1VMnuxd@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.03.2021 13:11, Roger Pau Monné wrote:
> On Mon, Mar 08, 2021 at 10:33:12AM +0100, Jan Beulich wrote:
>> On 08.03.2021 09:56, Roger Pau Monné wrote:
>>> On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>>> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
>>>>      struct vcpu *curr = current;
>>>>      const struct domain *currd = curr->domain;
>>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
>>>> -    bool vpmu_msr = false;
>>>> +    bool vpmu_msr = false, warn = false;
>>>>      int ret;
>>>>  
>>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
>>>> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
>>>>          if ( ret == X86EMUL_EXCEPTION )
>>>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
>>>>  
>>>> -        return ret;
>>>> +        goto done;
>>>>      }
>>>>  
>>>>      switch ( reg )
>>>> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
>>>>          }
>>>>          /* fall through */
>>>>      default:
>>>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>>>> +        warn = true;
>>>>          break;
>>>>  
>>>>      normal:
>>>> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
>>>>          return X86EMUL_OKAY;
>>>>      }
>>>>  
>>>> -    return X86EMUL_UNHANDLEABLE;
>>>> + done:
>>>
>>> Won't this handling be better placed in the 'default' switch case
>>> above?
>>
>> No - see the "goto done" added near the top of the function.
> 
> Yes, I'm not sure of that. If guest_rdmsr returns anything different
> than X86EMUL_UNHANDLEABLE it means it has handled the MSR in some way,
> and hence we shouldn't check whether the #GP handler is set or not.
> 
> This is not the behavior of older Xen versions, so I'm unsure whether
> we should introduce a policy that's even less strict than the previous
> one in regard to whether a #GP is injected or not.
> 
> I know injecting a #GP when the handler is not set is not helpful for
> the guest, but we should limit the workaround to kind of restoring the
> previous behavior for making buggy guests happy, not expanding it
> anymore.

Yet then we risk breaking guests with any subsequent addition to
guest_rdmsr() which, under whatever extra conditions, wants to
raise #GP.

Jan

