Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409C76EF82
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576499.902704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbEp-0003dv-E5; Thu, 03 Aug 2023 16:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576499.902704; Thu, 03 Aug 2023 16:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbEp-0003bE-BK; Thu, 03 Aug 2023 16:31:47 +0000
Received: by outflank-mailman (input) for mailman id 576499;
 Thu, 03 Aug 2023 16:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRbEo-0003b8-FD
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:31:46 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a45c96f-321b-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 18:31:43 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691080286751321.3099317106778;
 Thu, 3 Aug 2023 09:31:26 -0700 (PDT)
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
X-Inumbo-ID: 3a45c96f-321b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691080290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WVHNIahXX+GyVajL5NI51z36PbD/JrB3dgqBOfR9tihW2x7FOF7x+QT+CEXEmY6fKzAziwuIHfvR2tgYE9MW9TZOAoSX0mL6pCobcektt5Hjat2oeCAGXuDlCNXPIXn0NibJat286ab+jtXWSvpDjXOEoPUZ/mlz1Jj92tJGGN4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691080290; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2IueEmUBVFP14XKk2kgZbf4NNlgHXOu+R/AxWuAEvX0=; 
	b=ickL2eKuJxKLAmnlL71CUzHyu9WuymrOLcllvNA+2SMi6FW4ZjJPVGmIrEOE0E9gEP//WHVGdm8n1Xx0bvRm7sfuTswEXo/FzzvPssOw2iYcZM5yks3pmrj7/jJ9mMwuX1hS+UQ6QIfhdPAKtWR+XyiC/vJpkkAyfCWo4pE+r7s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691080290;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2IueEmUBVFP14XKk2kgZbf4NNlgHXOu+R/AxWuAEvX0=;
	b=WN8GP32BpJgKun7AUvqxf/JYxLyX5qCoJfFR5e5oDelX2m7xnGGezRu71UQdh+au
	+vIOlSCH4MN+tYqiDPP0sG8Wf8eO6bq3kv3Ag+N/WuM9F/yC6P1OuI/M+qKjB2RFFZn
	B/wqGTzb3bwezcGWN8Lf/32rjNJqfIEmrhCGczf8=
Message-ID: <e1554020-a605-8df2-619a-eda86d86c50a@apertussolutions.com>
Date: Thu, 3 Aug 2023 12:31:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
 <01a80d4c-f19b-98ec-805e-e648e752d6b1@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <01a80d4c-f19b-98ec-805e-e648e752d6b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/23 11:56, Jan Beulich wrote:
> On 03.08.2023 14:56, Daniel P. Smith wrote:
>> On 8/2/23 07:01, Jan Beulich wrote:
>>> On 01.08.2023 18:06, Daniel P. Smith wrote:
>>>> +        if ( hardware_domain )
>>>> +        {
>>>> +            console_rx = hardware_domain->domain_id + 1;
>>>> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>>
>>> Here and elsewhere - why %d when original code properly used %u? I also
>>> think there are now quite a few too many of these all identical
>>> printk()s.
>>
>> Good question, I did not write the line, it was copy/paste from
>> elsewhere in the file and then continued to replicate from there.
> 
> There's exactly one such line right now, using DOM%u. If I'm not
> mistaken, it's not all that long ago that this was changed, so I
> would suspect an incomplete rebase.
> 
>>>> +            goto out; //print switch_code statement & newline
>>>
>>> Leftover development comment? (There's at least one more.)
>>
>> Yes and no, the comment came from elsewhere in the file
> 
> Did it?

I thought it did.

>> and early in
>> development it I place it here to later decide if it should stay (and
>> get converted into a compliant comment). I will drop it in the next
>> iteration.
> 
> Thanks.

No problem.

>>>> +        }
>>>> +        else
>>>
>>> Please avoid "else" after an if() that ends in "return", "goto", or
>>> alike.
>>
>> Really? How would you propose handling common finalization when
>> completion happens during the execution of two branches of the logical
>> purpose of the function? Do you want to see two separate if statements
>> of `if ( condition A )` and `if ( ! condition A )`?
> 
> What would you need the 2nd if() for when the first one ends in "return",
> "goto", or alike?

Good point, not sure why I wasn't thinking this way.

>>>> +        {
>>>> +            for_each_domain(next)
>>>
>>> What guarantees that the list won't change behind your back? You don't
>>> hold domlist_read_lock here afaict. It might be that you're safe because
>>> that lock is an RCU one and this function is only invoked at init time
>>> or from some form of interrupt handler. But that's far from obvious and
>>> will hence need both properly confirming and stating in a comment. (It
>>> is actually this concern, iirc, which so far had us avoid iterating the
>>> domain list here.)
>>
>> It is better to error on the side of caution instead of assuming this
>> will always be invoked in a safe manner. I will add a read lock for the
>> domain list.
> 
> I'm not firm enough in RCU to be certain whether acquiring that lock is
> permissible here.

Same and I took your statements to suggest that I should.

>>>> +            {
>>>> +                if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>>> +                {
>>>> +                    console_rx = next->domain_id + 1;
>>>> +                    printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>>> +                    goto out; //print switch_code statement & newline
>>>> +                }
>>>> +            }
>>>>    
>>>> -        if ( next_rx++ >= max_console_rx )
>>>> +            console_rx = 0;
>>>> +            printk("*** Serial input to Xen");
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    for ( next = rcu_dereference(d->next_in_list); next != NULL;
>>>> +          next = rcu_dereference(next->next_in_list) )
>>>
>>> This looks like an open-coded continuation of for_each_domain() - I'm
>>> afraid I'm wary of introducing anything like this.
>>
>> Not exactly, for_each_domain() always starts with beginning of the
>> domain list and walks from that point forward.
> 
> Right, hence my use of the word "continuation".

Ah. okay.

>> This open coded version
>> stats at domain d and walks from there to the end of the list. Which is
>> why there is logic below, which uses for_each_domain(), to walk from the
>> beginning of the list until the next domain with console_io or the
>> hardware domain, whichever occurs first.
>>
>> What I did not want to do is potentially waste a lot of cycles doing
>> for_each_domain() with a continue until it reached the current domain
>> and then start checking for the privilege.
>>
>> I could take this and introduce a new macro, for_each_domain_from (or a
>> better name if there are suggestions) and use it here.
> 
> That's effectively what I would like to be done, yes.

Okay, unless you (or anyone else) have another name suggestion, I will 
add it as the above name.

>>>> +    {
>>>> +        if ( hardware_domain && next == hardware_domain )
>>>>            {
>>>>                console_rx = 0;
>>>>                printk("*** Serial input to Xen");
>>>> -            break;
>>>> +            goto out;
>>>
>>> Since you use "goto" anyway, this wants introducing a 2nd label (maybe
>>> "xen"?) ahead of the identical code you add further down (immediately
>>> ahead of the "out" label), to avoid code duplication.
>>
>> Ack.
>>
>>>>            }
>>>>    
>>>> -        d = rcu_lock_domain_by_id(next_rx - 1);
>>>> -        if ( d )
>>>> +        if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>>>            {
>>>> -            rcu_unlock_domain(d);
>>>> -            console_rx = next_rx;
>>>> -            printk("*** Serial input to DOM%u", next_rx - 1);
>>>> -            break;
>>>> +            console_rx = next->domain_id + 1;
>>>> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>>> +            goto out;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Hit the end of the domain list and instead of assuming that the
>>>> +     * hardware domain is the first in the list, get the first domain
>>>> +     * in the domain list and then if it is not the hardware domain or
>>>> +     * does not have console privilege, iterate the list until we find
>>>> +     * the hardware domain or a domain with console privilege.
>>>> +     */
>>>> +    if ( next == NULL )
>>>> +    {
>>>> +        for_each_domain(next)
>>>> +        {
>>>> +            if ( hardware_domain && next == hardware_domain )
>>>> +            {
>>>> +                console_rx = 0;
>>>> +                printk("*** Serial input to Xen");
>>>> +                goto out;
>>>> +            }
>>>> +
>>>> +            if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>>> +            {
>>>> +                console_rx = next->domain_id + 1;
>>>> +                printk("*** Serial input to DOM%d", CON_RX_DOMID);
>>>> +                goto out;
>>>> +            }
>>>>            }
>>>>        }
>>>>    
>>>> +    /*
>>>> +     * If we got here, could not find a domain with console io privilege.
>>>> +     * Default to Xen.
>>>> +     */
>>>
>>> "Default to" is a little odd when there are no other options.
>>
>> Fallback to?
> 
> Yes.

Ack.

>>>> @@ -538,31 +594,37 @@ static void __serial_rx(char c, struct cpu_user_regs *regs)
>>>>             * getting stuck.
>>>>             */
>>>>            send_global_virq(VIRQ_CONSOLE);
>>>> -        break;
>>>> -
>>>> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>>>> -    default:
>>>> +    }
>>>> +    else
>>>>        {
>>>> -        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
>>>> +        struct domain *d = rcu_lock_domain_by_any_id(CON_RX_DOMID);
>>>>    
>>>> +        if ( d == NULL )
>>>> +            goto unlock_out;
>>>> +
>>>> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>>>>            /*
>>>>             * If we have a properly initialized vpl011 console for the
>>>>             * domain, without a full PV ring to Dom0 (in that case input
>>>>             * comes from the PV ring), then send the character to it.
>>>>             */
>>>> -        if ( d != NULL &&
>>>> -             !d->arch.vpl011.backend_in_domain &&
>>>> +        if ( !d->arch.vpl011.backend_in_domain &&
>>>>                 d->arch.vpl011.backend.xen != NULL )
>>>> +        {
>>>>                vpl011_rx_char_xen(d, c);
>>>> -        else
>>>> -            printk("Cannot send chars to Dom%d: no UART available\n",
>>>> -                   console_rx - 1);
>>>> +            goto unlock_out;
>>>> +        }
>>>> +#endif
>>>> +
>>>> +        if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>>>> +            serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
>>>
>>> This is Dom0's buffer; I don't think sharing with DomU-s is correct.
>>
>> I would disagree, it is the hypervisor's buffer that it decides to share
>> with domains it trust. It just so happens that it always trusts the
>> hardware domain. This is why I explicitly changed this to the XSM call,
>> to express that when the system manager, by enabling this privilege on
>> the domain, has decided to trust these domains to have access to the
>> hypervisor's buffer.
> 
> I don't think such trust can be assumed to allow the domains to see e.g.
> each others root passwords.

Should or can are two different things, it does not change the fact what 
the action is being done here. Another aspect here to your "what if" is 
the question of what really is the likelihood that an admin is going to 
enter the root password and then send the console switch immediately to 
another domain via the serial interface on a production system that they 
made the conscious decision to trust an untrustworthy domain with the a 
highly trusted privilege of serial/console access.

>>>> @@ -717,6 +779,8 @@ long do_console_io(
>>>>            rc = -E2BIG;
>>>>            if ( count > INT_MAX )
>>>>                break;
>>>> +        if ( CON_RX_DOMID != current->domain->domain_id )
>>>> +            return 0;
>>>>    
>>>>            rc = 0;
>>>>            while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
>>>
>>> ... assume that by the time this hypercall is invoked input focus
>>> hasn't switched. I think there's no way around a per-domain input
>>> buffer, which of course would need setting up only for console-io-
>>> capable domains.
>>
>> Let's explore the exact concern here, the scenarios as far as I can see
>> it is as follows.
>>
>> A person at the serial/console types keys for the current console domain
>> (domA), then enters the console switch sequence, switching to another
>> domain (domB). DomA's CONSOLEIO_read hypercall arrives after the switch
>> and thus is not sent the rx buffer contents. Then domB's CONSOLEIO_read
>> arrives and then because `serial_rx_cons` and `serial_rx_prod` are not
>> the same, domB is sent the bytes that were intended for domA.
>>
>> While a per domain console_io buffer would address this issue, I believe
>> there is a simpler solution that can be extended depending on whether it
>> is acceptable for the undelivered bytes to be dropped or not.
>>
>> Simply upon switching, if serial_rx_cons and serial_rx_prod are set the
>> same, then no bytes will be leaked to domB from domA above. An extra
>> precaution could be taken to zero the serial_rx buffer. If guaranteed
>> delivery is desired, a list of buffer remnants could be drained on
>> hypercall and console switching.
>>
>> IMHO I believe the reality is while there is potential that the scenario
>> could happen, the probability is low. Doing a per domain buffer will
>> always incur the resource overhead even if the event never happens,
>> while the above approach would only incur the resource overhead when the
>> situation occurs.
> 
> Which, afaict, would then result in stuff typed in for one domain being
> discarded, without there being any indication how much of it was discarded
> (and hence would need typing again).

Again, I find the scenario unlikely but agree that good behavior is not 
to have a lossy console. That is why I suggested that a simple list (or 
other representation) of pending buffer fragments can be held for 
deliver to previous domains.

> I don't share the resource concern: If an admin wants multiple domains
> to take input this way, they can't assume this comes at no price at all.

Except its not just the admins that pay the price. I had already 
considered a per domain buffer, but realized that this is a more 
complicated approach requiring code in multiple places within the 
hypervisor. Whereas I believe the proposal above can exist solely within 
console.c and will not require having to hook in to domain 
create/destruction.

v/r,
dps


