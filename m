Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7576EE5D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 17:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576464.902624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaRu-0002Ai-U3; Thu, 03 Aug 2023 15:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576464.902624; Thu, 03 Aug 2023 15:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaRu-00028k-RS; Thu, 03 Aug 2023 15:41:14 +0000
Received: by outflank-mailman (input) for mailman id 576464;
 Thu, 03 Aug 2023 15:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRaRt-00028e-7I
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 15:41:13 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29fdc1a8-3214-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 17:41:10 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691077265755591.6976092136987;
 Thu, 3 Aug 2023 08:41:05 -0700 (PDT)
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
X-Inumbo-ID: 29fdc1a8-3214-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691077267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JZutway1iudxNiE66wsg4Q5bTV99SBGEiN8GtBL/N2FH8W95a6jYccWtOptuZY/tCIfrdU7rKoFWLreiIn+xT/cxgYJ100Cw4U7FQIRrQeCEPs/9pgL99aas6CmQUJfaI8vgl9iMZgwkNnF0knmPO7urK64OVam8XBjF4BO71Co=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691077267; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=grSgGT4kCmqT7GVHxUlEWkLYR/m3dGzyr4FKWQWQIuk=; 
	b=MNKTRxdH9vH8BdPt3+zf+nTasaCRFS5VbE98S+Fxbpj1O6H1APNgxbVvmrijFvSzZRM+7956+vdZjBhbXbjAyzWofMWb8S/wz3r5OD3Z8XEFwl8/v3jaXjUSBS81Z8gMrDu8UJSylQdj5/k/GEsA22LfYgL7XDh4MKSJu2LnN7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691077267;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=grSgGT4kCmqT7GVHxUlEWkLYR/m3dGzyr4FKWQWQIuk=;
	b=qNjQfsagMHwkSRLflTTV60RkCE5fCcOSnlyH1n9wyi4vG+PEmlwqUJvNqkfoYZTz
	JQM1ArHMLG2WCd1PAwD+Kkt9nAZst0WSH3GJnhjyLHj22Bdxy14AIy8J5yEqi+WzNzu
	qAeQHXMkFW+AU+tHP0+SNf7EmBNGs/l41agNkkq8=
Message-ID: <14346689-8276-3c26-91e1-59bc2328518e@apertussolutions.com>
Date: Thu, 3 Aug 2023 11:41:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 4/6] capabilities: introduce console io as a domain
 capability
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-5-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011757400.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308011757400.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/1/23 21:01, Stefano Stabellini wrote:
> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>> The field `is_console` suggests that the field represents a state of being or
>> posession, not that it reflects the privilege to access the console. In this
>    ^ possession

Thank you for the catch.

>> patch the field is renamed to capabilities to encapsulate the capabilities a
>> domain has been granted. The first capability being the ability to read/write
>> the Xen console.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Patch looks fine to me aside the two minor nits. I am not sure I
> understand 100% the difference between capabilities and roles but I am
> OK with the patch. I'd like to hear Julien's feedback on this as well.

This might be worth a section in the hypervisor-guide. As mentioned in 
the cover letter, this was originally proposed as being under XSM. A 
challenge I ran into is that, depending on your view, the 
`is_privileged` field and `hardware_domain` global were either abused as 
a function check and a non-resource privilege check or are just 
multifaceted variables. This is why the concept of the role was struck 
upon, it is more intuitive (for me at least) that have a role is 
something that imparts accesses (privilege checks) and dictates 
hypervisor behaviors when handling the domain (function checks). This 
then brings us to an access or behavior that may be inherent to some 
role(s) but may want to grant on an individually to a guest. A prime 
example of this is console_io, for which it is inherent that the 
hardware domain role will have access but may want to grant to a guest 
without granting it an entire role. This is why I provided for 
identifying these capabilities so that they may be assigned individually 
to a domain.

While the role/capability is a natural progression from how the 
hypervisor currently operates. Another approach that could be consider 
to deliver a similar experience would be to break down every access and 
function into a capability and then define the standard roles as a 
conglomeration of certain capabilities.

I am open to suggestions here.

>> ---
>>   xen/arch/arm/domain_build.c |  4 +++-
>>   xen/include/xen/sched.h     | 25 +++++++++++++++++++++++--
>>   xen/include/xsm/dummy.h     |  2 +-
>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 51b4daefe1..ad7432b029 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -4076,7 +4076,9 @@ void __init create_domUs(void)
>>               panic("Error creating domain %s (rc = %ld)\n",
>>                     dt_node_name(node), PTR_ERR(d));
>>   
>> -        d->is_console = true;
>> +        if ( ! domain_set_cap(d, CAP_CONSOLE_IO) )
> 
> code style
> 
> 
>> +            printk("failed setting console_io on %pd\n", d);
>> +
>>           dt_device_set_used_by(node, d->domain_id);
>>   
>>           rc = construct_domU(d, node);
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index ec0f9baff6..b04fbe0565 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -472,8 +472,8 @@ struct domain
>>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>>   #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>>       uint8_t          role;
>> -    /* Can this guest access the Xen console? */
>> -    bool             is_console;
>> +#define CAP_CONSOLE_IO  (1U<<0)
>> +    uint8_t          capabilities;
>>       /* Is this guest being debugged by dom0? */
>>       bool             debugger_attached;
>>       /*
>> @@ -1146,6 +1146,27 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
>>       return is_hvm_domain(v->domain);
>>   }
>>   
>> +static always_inline bool domain_has_cap(
>> +    const struct domain *d, uint8_t cap)
>> +{
>> +    return d->capabilities & cap;
>> +}
>> +
>> +static always_inline bool domain_set_cap(
>> +    struct domain *d, uint8_t cap)
>> +{
>> +    switch ( cap )
>> +    {
>> +    case CAP_CONSOLE_IO:
>> +        d->capabilities |= cap;
>> +        break;
>> +    default:
>> +        return false;
>> +    }
>> +
>> +    return domain_has_cap(d, cap);
>> +}
>> +
>>   static always_inline bool hap_enabled(const struct domain *d)
>>   {
>>       /* sanitise_domain_config() rejects HAP && !HVM */
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 18f1ddd127..067ff1d111 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -268,7 +268,7 @@ static XSM_INLINE int cf_check xsm_console_io(
>>       XSM_DEFAULT_ARG struct domain *d, int cmd)
>>   {
>>       XSM_ASSERT_ACTION(XSM_OTHER);
>> -    if ( d->is_console )
>> +    if ( domain_has_cap(d, CAP_CONSOLE_IO) )
>>           return xsm_default_action(XSM_HOOK, d, NULL);
>>   #ifdef CONFIG_VERBOSE_DEBUG
>>       if ( cmd == CONSOLEIO_write )
>> -- 
>> 2.20.1
>>

