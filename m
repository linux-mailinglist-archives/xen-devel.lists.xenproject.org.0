Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C2774EA2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 00:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580569.908890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTVVv-0004RG-54; Tue, 08 Aug 2023 22:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580569.908890; Tue, 08 Aug 2023 22:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTVVv-0004Nw-1u; Tue, 08 Aug 2023 22:49:19 +0000
Received: by outflank-mailman (input) for mailman id 580569;
 Tue, 08 Aug 2023 22:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTVVt-0004No-LW
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 22:49:17 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbed0d3d-363d-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 00:49:15 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691534949515220.7474258351242;
 Tue, 8 Aug 2023 15:49:09 -0700 (PDT)
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
X-Inumbo-ID: cbed0d3d-363d-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691534952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bLuua5r1LGNNx9rs9d8ELD99e5LrC+mFsCiHru+q1Li8jWTDNs+sZ0kkoSwnWDp4Ffrf0DLH0vPfJGX4dWk/jzGdSdE5D25T0y9zUiAbUjm8PTpuXaDBS0tiqZWL3mteZln2cMQZJRHRbTnPjtuBV5CczyoEityoC9e3pvrpGhM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691534952; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WgoM135m2U7UBiCaQNsuLm8Ol43KKt1u10XOAsqh1Jg=; 
	b=MqaUT7gohEQ9H+UhBjd5Uyugu+kJyCdfw6RlzprwBUm5KH6FrVifgUPmBXUusnT8Rb0W+RVrMNTxZeOtFqbgdpuRbzvDuvqOV0qgVvWC1xodgSxRE0tDkpE1Oax36cjqQh4CkNdWxAhZxMxO/EV7uv1wD9/Sjz7ippx9/GR7hLI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691534952;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WgoM135m2U7UBiCaQNsuLm8Ol43KKt1u10XOAsqh1Jg=;
	b=L/VMeVVlrVWPRTcgIcaIIwIBM+ix1ERKqxFvnMeDsCzQZdfljupnN46upoLbW15X
	lsaHaZEM69xRN6DUmo6GQX9hIm/hbaFZAKdqJeGGNF5iX2qXOnWuG1+LWggxcNrqNqh
	x72ThNy3TDGTbutGrpJO7FPZHGbCEKS8jlwaROfc=
Message-ID: <7a10af10-27c7-257e-9564-2716c67bb400@apertussolutions.com>
Date: Tue, 8 Aug 2023 18:49:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
 <8951f722-6949-b2b5-f6d4-2d515f085cde@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8951f722-6949-b2b5-f6d4-2d515f085cde@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/3/23 17:03, Julien Grall wrote:
> Hi,

Greetings

> On 01/08/2023 21:20, Daniel P. Smith wrote:
>> The field `is_console` suggests that the field represents a state of 
>> being or
>> posession, not that it reflects the privilege to access the console. 
>> In this
>> patch the field is renamed to capabilities to encapsulate the 
>> capabilities a
>> domain has been granted. The first capability being the ability to 
>> read/write
>> the Xen console.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/arm/domain_build.c |  4 +++-
>>   xen/include/xen/sched.h     | 25 +++++++++++++++++++++++--
>>   xen/include/xsm/dummy.h     |  2 +-
>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 51b4daefe1..ad7432b029 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -4076,7 +4076,9 @@ void __init create_domUs(void)
>>               panic("Error creating domain %s (rc = %ld)\n",
>>                     dt_node_name(node), PTR_ERR(d));
>> -        d->is_console = true;
>> +        if ( ! domain_set_cap(d, CAP_CONSOLE_IO) )
> 
> Coding style: We don't usually add a space after '!'.

Ack.

>> +            printk("failed setting console_io on %pd\n", d);
> 
> I find a bit odd that we would continue even if the cap cannot be set. 
> Can you clarify?

This is the construction of a domU, so the system is very much capable 
of coming up and reviewing the hypervisor messages from dom0 to discover 
the issue. I am hard pressed to believe the hypervisor should be 
panicked because the domU is not allowed to use the hypervisor's console.

g>> +
>>           dt_device_set_used_by(node, d->domain_id);
>>           rc = construct_domU(d, node);
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index ec0f9baff6..b04fbe0565 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -472,8 +472,8 @@ struct domain
>>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>>   #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>>       uint8_t          role;
>> -    /* Can this guest access the Xen console? */
>> -    bool             is_console;
>> +#define CAP_CONSOLE_IO  (1U<<0)
> Coding style: Space before and after <<.

Ack.

>> +    uint8_t          capabilities;
>>       /* Is this guest being debugged by dom0? */
>>       bool             debugger_attached;
>>       /*
>> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const 
>> struct vcpu *v)
>>       return is_hvm_domain(v->domain);
>>   }
>> +static always_inline bool domain_has_cap(
>> +    const struct domain *d, uint8_t cap)
> 
> Coding style: We don't usually wrap the arguments this way. See 
> domain_create() for an example.

I was informed it was[1], also, please see next_domain_in_cpupool() 
amongst many others further below.

[1] 
https://lists.xenproject.org/archives/html/xen-devel/2021-07/msg01133.html

>> +{
>> +    return d->capabilities & cap;
>> +}
>> +
>> +static always_inline bool domain_set_cap(
>> +    struct domain *d, uint8_t cap)
> 
> Same about the coding style here.

Ditto.

> Also, do you expect the cap to be set only when the domain is created? 
> If not, would you prevent potentially concurrent update to d->capabilities?

Currently the only means being devise to set this is via hyperlaunch 
domain creation. If a domctl op was added to be able to manipulate the 
caps, then yes a lock on the domain would be advised to block. With that 
said, if we switch over to CAP_CTRL/HW, then it might be good to grab a 
lock on the domain for the late hardware domain case.

>> +{
>> +    switch ( cap )
>> +    {
>> +    case CAP_CONSOLE_IO:
>> +        d->capabilities |= cap;
>> +        break;
>> +    default:
> 
> Is this meant to be reached? If not, maybe add ASSERT_UNREACHABLE()?

Yah, that would be a good idea.

>> +        return false;
>> +    }
>> +
>> +    return domain_has_cap(d, cap);
>> +} > +
>>   static always_inline bool hap_enabled(const struct domain *d)
>>   {
>>       /* sanitise_domain_config() rejects HAP && !HVM */
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 18f1ddd127..067ff1d111 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -268,7 +268,7 @@ static XSM_INLINE int cf_check xsm_console_io(
>>       XSM_DEFAULT_ARG struct domain *d, int cmd)
>>   {
>>       XSM_ASSERT_ACTION(XSM_OTHER);
>> -    if ( d->is_console )
>> +    if ( domain_has_cap(d, CAP_CONSOLE_IO) )
>>           return xsm_default_action(XSM_HOOK, d, NULL);
>>   #ifdef CONFIG_VERBOSE_DEBUG
>>       if ( cmd == CONSOLEIO_write )


v/r,
dps

