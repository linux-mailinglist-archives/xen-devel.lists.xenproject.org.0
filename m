Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AF351543
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104458.199777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxWn-0005e4-2C; Thu, 01 Apr 2021 13:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104458.199777; Thu, 01 Apr 2021 13:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxWm-0005df-V5; Thu, 01 Apr 2021 13:38:28 +0000
Received: by outflank-mailman (input) for mailman id 104458;
 Thu, 01 Apr 2021 13:38:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRxWk-0005dV-T7
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b03c95cd-c0d9-455d-8b49-73c7e0a9183d;
 Thu, 01 Apr 2021 13:38:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA57AB0E6;
 Thu,  1 Apr 2021 13:38:24 +0000 (UTC)
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
X-Inumbo-ID: b03c95cd-c0d9-455d-8b49-73c7e0a9183d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617284305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTyVyHfq5aXmFcqzWsVtaDBe2hBWqpTVqk6/vpdoImU=;
	b=Puh5c+7J9AL9Fr1Jhn9hilua2VmUG+8UqNSZZSAtb3OyOISHAWiO8mpSKfjibifkt2jNZ7
	G3ok/41FItJOvRbZBXvhtVEEEJ7rj6D1Q6z4pl4npdybwI7avPUq7gtmTUWdASt6uzyxvz
	InZ66TA3bpDKnCMNy68uvtC1+ELaiIk=
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20210401102252.95196-1-roger.pau@citrix.com>
 <b8fcbe35-2c9d-fd8a-0200-90d9c1039a27@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28f68328-9e5f-3f86-a56f-fcc9cf6ba303@suse.com>
Date: Thu, 1 Apr 2021 15:38:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b8fcbe35-2c9d-fd8a-0200-90d9c1039a27@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 14:44, Andrew Cooper wrote:
> On 01/04/2021 11:22, Roger Pau Monne wrote:
>> The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
>> as current, as there's no support for EOI'ing interrupts on a remote
>> vCPU.
>>
>> While there also turn the unconditional assert at the top of the
>> function into an error on non-debug builds.
>>
>> No functional change intended.
>>
>> Requested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/hvm/viridian/synic.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
>> index 22e2df27e5d..e18538c60a6 100644
>> --- a/xen/arch/x86/hvm/viridian/synic.c
>> +++ b/xen/arch/x86/hvm/viridian/synic.c
>> @@ -79,11 +79,20 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>>      struct viridian_vcpu *vv = v->arch.hvm.viridian;
>>      struct domain *d = v->domain;
>>  
>> -    ASSERT(v == current || !v->is_running);
>> +    if ( v != current && v->is_running )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return X86EMUL_EXCEPTION;
>> +    }
> 
> The original ASSERT() was correct - both of these are easily reachable
> in control domain context.
> 
> If you want EOI to not be used, you need to raise #GP from it, but that
> in principle breaks introspection which really does write MSRs on the
> guests behalf.
> 
> It's perhaps fine in principle to leave that problem to whomever first
> wants to poke this MSR from introspection context, but the
> ASSERT_UNREACHABLE()s need dropping whatever the introspection angle.

But if the original ASSERT() was correct, how can the ASSERT_UNREACHABLE()
above need dropping? Are you perhaps only talking about the other one?

Jan

