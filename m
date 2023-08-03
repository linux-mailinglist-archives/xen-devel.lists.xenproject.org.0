Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AC76E8EB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576347.902374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXt0-00051m-V7; Thu, 03 Aug 2023 12:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576347.902374; Thu, 03 Aug 2023 12:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRXt0-0004zk-SP; Thu, 03 Aug 2023 12:57:02 +0000
Received: by outflank-mailman (input) for mailman id 576347;
 Thu, 03 Aug 2023 12:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRXt0-0004ze-28
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:57:02 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a890314-31fd-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 14:56:59 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691067412090507.9520434344752;
 Thu, 3 Aug 2023 05:56:52 -0700 (PDT)
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
X-Inumbo-ID: 3a890314-31fd-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691067414; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KdFwQfA9sqJfTbFOL7ydd5VRfe6vl9ajKNp8mMSJ1PsJw60e6AhGkJdlewcBPkFBTBGHMskmkMScGGlhq8MOZT3u7iBO9PnCoZqpbVDQsF0E/u5LIG+sBv9EZ6QC/bbpG7H7pFH2bGTdqgWf0iLE9a1EWQ1xvWS1qOMirOfSTdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691067414; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Hk5uuj6GbfvXUbIcemYhrHAe2Y8Su9mvkhSFvHr3MmI=; 
	b=UOPd/sya61Xz9MfC4eciz+QRKnn3vmcnknBMd0C6MiZXe8XBaV+tkP9WsJgeMzgahQHhLD4Fuhr+QTZIRisLETBhEEYXydaBIIpTueBe/G6c8bqz5ZVrPlQQ9WdtivD8CaiXl++jMfPWL6bS8i4bGuvUoOznX/k6dLDztSjNliY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691067414;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Hk5uuj6GbfvXUbIcemYhrHAe2Y8Su9mvkhSFvHr3MmI=;
	b=l50yqvXK4v5GHFtEqjziUq0Q1mdR+rhdO4rFEVxqdz1bMokUYUlBteXWP8z3TXRB
	BS+T9/jhcxL9922e0gKKxoxRqr9eeVWw2kzLk5C83m1P5BCJkggMRbcFIVN/idqWZbx
	Jq/bJFXCOEvCE+TuKNiH1dwlF1pEkMDiUJvsSEE0=
Message-ID: <d90cc238-87ef-d0d0-b06f-58e89d24eaca@apertussolutions.com>
Date: Thu, 3 Aug 2023 08:56:49 -0400
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
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/2/23 07:01, Jan Beulich wrote:
> On 01.08.2023 18:06, Daniel P. Smith wrote:
>> This patch reworks the console rotation logic to provide a general mechanism to
>> incorporate domU in to the rotation. It does so by walking the domain list
>> using the XSM console privlege check to determine if the domain is given access.
>>
>> In reworking the rotation logic, the assumption that the hardware domain is the
>> first domain created is removed and is changed to explicitly locate the
>> hardware domain at boot.
> 
> I guess I'm unable to identify any "at boot only" code. I'm also
> puzzled by this indicating there is a need to do so, when the global
> variable "hardware_domain" is available, and you actually use it.

As to the "at boot only", there is a switch, which upon closer look I 
have broken and will now have to fix, that if the 2nd char of the 
'conswitch' boot param is 'x', then the console is not supposed to auto 
switch to "dom0".

I was trying to keep the console_rx tracking logic the same, but I have 
already diverted far from what was there, I might as well rewrite that 
as well. Doing so would allow the value 0 can actually reflect domain id 
0 and not have to continue the off-by-one game played mapping domid 
from/to console_rx.

>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -473,45 +473,102 @@ static void cf_check dump_console_ring_key(unsigned char key)
>>    */
>>   static unsigned int __read_mostly console_rx = 0;
>>   
>> -#define max_console_rx (max_init_domid + 1)
>> +#define CON_RX_DOMID (console_rx - 1)
>>   
>>   /* Make sure to rcu_unlock_domain after use */
>>   struct domain *console_input_domain(void)
>>   {
>>       if ( console_rx == 0 )
>>               return NULL;
>> -    return rcu_lock_domain_by_id(console_rx - 1);
>> +    return rcu_lock_domain_by_id(CON_RX_DOMID);
>>   }
>>   
>>   static void switch_serial_input(void)
>>   {
>> -    unsigned int next_rx = console_rx;
>> +    struct domain *next, *d = console_input_domain();
> 
> Looks like "next" cannot be pointer-to-const just because the XSM hooks
> still aren't properly const-ified. Oh well.

Something I can look at another point as XSM maintainer.

>> -    /*
>> -     * Rotate among Xen, dom0 and boot-time created domUs while skipping
>> -     * switching serial input to non existing domains.
>> -     */
> 
> While it would need adjustment, I don't think the comment wants deleting
> altogether.

Ack.

>> -    for ( ; ; )
>> +    if ( d == NULL )
> 
> This covers both Xen receiving input and the domain receiving input having
> gone away. Originally in the latter case the next sequential (in domid
> numbering) domain would be switched to. In the new logic you start over
> from the beginning of the domain list. Such a change in behavior (if
> deemed acceptable at all, which I'm not convinced of) needs calling out in
> the description.

No, the intent is to keep the existing behavior. Again, this is a 
fallout from trying to track by domid with the assumptions that 1. only 
boot time constructed domains would be given access, 2. those domains 
where created with sequential domids and 3.) those domains never went 
away (or if they did, it would result in a dead spot in the rotation). 
As stated above, just dropping the pretense of tracking by domid will 
provide a simpler solution and maintain the existing behavior, minus the 
possibility of having dead spots in the rotation.

>>       {
>> -        struct domain *d;
>> +        if ( hardware_domain )
>> +        {
>> +            console_rx = hardware_domain->domain_id + 1;
>> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
> 
> Here and elsewhere - why %d when original code properly used %u? I also
> think there are now quite a few too many of these all identical
> printk()s.

Good question, I did not write the line, it was copy/paste from 
elsewhere in the file and then continued to replicate from there.

>> +            goto out; //print switch_code statement & newline
> 
> Leftover development comment? (There's at least one more.)

Yes and no, the comment came from elsewhere in the file and early in 
development it I place it here to later decide if it should stay (and 
get converted into a compliant comment). I will drop it in the next 
iteration.

>> +        }
>> +        else
> 
> Please avoid "else" after an if() that ends in "return", "goto", or
> alike.

Really? How would you propose handling common finalization when
completion happens during the execution of two branches of the logical 
purpose of the function? Do you want to see two separate if statements 
of `if ( condition A )` and `if ( ! condition A )`?

>> +        {
>> +            for_each_domain(next)
> 
> What guarantees that the list won't change behind your back? You don't
> hold domlist_read_lock here afaict. It might be that you're safe because
> that lock is an RCU one and this function is only invoked at init time
> or from some form of interrupt handler. But that's far from obvious and
> will hence need both properly confirming and stating in a comment. (It
> is actually this concern, iirc, which so far had us avoid iterating the
> domain list here.)

It is better to error on the side of caution instead of assuming this 
will always be invoked in a safe manner. I will add a read lock for the 
domain list.

>> +            {
>> +                if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>> +                {
>> +                    console_rx = next->domain_id + 1;
>> +                    printk("*** Serial input to DOM%d", CON_RX_DOMID);
>> +                    goto out; //print switch_code statement & newline
>> +                }
>> +            }
>>   
>> -        if ( next_rx++ >= max_console_rx )
>> +            console_rx = 0;
>> +            printk("*** Serial input to Xen");
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    for ( next = rcu_dereference(d->next_in_list); next != NULL;
>> +          next = rcu_dereference(next->next_in_list) )
> 
> This looks like an open-coded continuation of for_each_domain() - I'm
> afraid I'm wary of introducing anything like this.

Not exactly, for_each_domain() always starts with beginning of the 
domain list and walks from that point forward. This open coded version 
stats at domain d and walks from there to the end of the list. Which is 
why there is logic below, which uses for_each_domain(), to walk from the 
beginning of the list until the next domain with console_io or the 
hardware domain, whichever occurs first.

What I did not want to do is potentially waste a lot of cycles doing 
for_each_domain() with a continue until it reached the current domain 
and then start checking for the privilege.

I could take this and introduce a new macro, for_each_domain_from (or a 
better name if there are suggestions) and use it here.

>> +    {
>> +        if ( hardware_domain && next == hardware_domain )
>>           {
>>               console_rx = 0;
>>               printk("*** Serial input to Xen");
>> -            break;
>> +            goto out;
> 
> Since you use "goto" anyway, this wants introducing a 2nd label (maybe
> "xen"?) ahead of the identical code you add further down (immediately
> ahead of the "out" label), to avoid code duplication.

Ack.

>>           }
>>   
>> -        d = rcu_lock_domain_by_id(next_rx - 1);
>> -        if ( d )
>> +        if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>>           {
>> -            rcu_unlock_domain(d);
>> -            console_rx = next_rx;
>> -            printk("*** Serial input to DOM%u", next_rx - 1);
>> -            break;
>> +            console_rx = next->domain_id + 1;
>> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * Hit the end of the domain list and instead of assuming that the
>> +     * hardware domain is the first in the list, get the first domain
>> +     * in the domain list and then if it is not the hardware domain or
>> +     * does not have console privilege, iterate the list until we find
>> +     * the hardware domain or a domain with console privilege.
>> +     */
>> +    if ( next == NULL )
>> +    {
>> +        for_each_domain(next)
>> +        {
>> +            if ( hardware_domain && next == hardware_domain )
>> +            {
>> +                console_rx = 0;
>> +                printk("*** Serial input to Xen");
>> +                goto out;
>> +            }
>> +
>> +            if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>> +            {
>> +                console_rx = next->domain_id + 1;
>> +                printk("*** Serial input to DOM%d", CON_RX_DOMID);
>> +                goto out;
>> +            }
>>           }
>>       }
>>   
>> +    /*
>> +     * If we got here, could not find a domain with console io privilege.
>> +     * Default to Xen.
>> +     */
> 
> "Default to" is a little odd when there are no other options.

Fallback to?

>> +    console_rx = 0;
>> +    printk("*** Serial input to Xen");
>> +
>> +out:
> 
> Labels indented by at least one blank please.

Ack.

>> @@ -520,12 +577,11 @@ static void switch_serial_input(void)
>>   
>>   static void __serial_rx(char c, struct cpu_user_regs *regs)
>>   {
>> -    switch ( console_rx )
>> -    {
>> -    case 0:
>> +    if ( console_rx == 0 )
> 
> By using CON_RX_DOMID everywhere else you try to carefully avoid and
> open-coded assumptions on the precise biasing used there. With this
> it would seem to me that here "CON_RX_DOMID > DOMID_MASK" would be
> more in line with that model then.

Yep and it results in not correctly implementing the commandline 
parameter behavior. Since I am already doing a domain list walk, instead 
of having to convert from domids, this really should just be tracked 
with a domain ref and use the rcu lock to catch if the domain drops at 
any point.

>>           return handle_keypress(c, regs);
>>   
>> -    case 1:
>> +    if ( hardware_domain->domain_id == CON_RX_DOMID )
> 
> No check of hardware_domain against NULL?

Missed this one, will fix.

>> +    {
>>           /*
>>            * Deliver input to the hardware domain buffer, unless it is
>>            * already full.
>> @@ -538,31 +594,37 @@ static void __serial_rx(char c, struct cpu_user_regs *regs)
>>            * getting stuck.
>>            */
>>           send_global_virq(VIRQ_CONSOLE);
>> -        break;
>> -
>> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>> -    default:
>> +    }
>> +    else
>>       {
>> -        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
>> +        struct domain *d = rcu_lock_domain_by_any_id(CON_RX_DOMID);
>>   
>> +        if ( d == NULL )
>> +            goto unlock_out;
>> +
>> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>>           /*
>>            * If we have a properly initialized vpl011 console for the
>>            * domain, without a full PV ring to Dom0 (in that case input
>>            * comes from the PV ring), then send the character to it.
>>            */
>> -        if ( d != NULL &&
>> -             !d->arch.vpl011.backend_in_domain &&
>> +        if ( !d->arch.vpl011.backend_in_domain &&
>>                d->arch.vpl011.backend.xen != NULL )
>> +        {
>>               vpl011_rx_char_xen(d, c);
>> -        else
>> -            printk("Cannot send chars to Dom%d: no UART available\n",
>> -                   console_rx - 1);
>> +            goto unlock_out;
>> +        }
>> +#endif
>> +
>> +        if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>> +            serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> 
> This is Dom0's buffer; I don't think sharing with DomU-s is correct.

I would disagree, it is the hypervisor's buffer that it decides to share 
with domains it trust. It just so happens that it always trusts the 
hardware domain. This is why I explicitly changed this to the XSM call, 
to express that when the system manager, by enabling this privilege on 
the domain, has decided to trust these domains to have access to the 
hypervisor's buffer.

> You also cannot ...
> 
>> @@ -717,6 +779,8 @@ long do_console_io(
>>           rc = -E2BIG;
>>           if ( count > INT_MAX )
>>               break;
>> +        if ( CON_RX_DOMID != current->domain->domain_id )
>> +            return 0;
>>   
>>           rc = 0;
>>           while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
> 
> ... assume that by the time this hypercall is invoked input focus
> hasn't switched. I think there's no way around a per-domain input
> buffer, which of course would need setting up only for console-io-
> capable domains.

Let's explore the exact concern here, the scenarios as far as I can see 
it is as follows.

A person at the serial/console types keys for the current console domain 
(domA), then enters the console switch sequence, switching to another 
domain (domB). DomA's CONSOLEIO_read hypercall arrives after the switch 
and thus is not sent the rx buffer contents. Then domB's CONSOLEIO_read 
arrives and then because `serial_rx_cons` and `serial_rx_prod` are not 
the same, domB is sent the bytes that were intended for domA.

While a per domain console_io buffer would address this issue, I believe 
there is a simpler solution that can be extended depending on whether it 
is acceptable for the undelivered bytes to be dropped or not.

Simply upon switching, if serial_rx_cons and serial_rx_prod are set the 
same, then no bytes will be leaked to domB from domA above. An extra 
precaution could be taken to zero the serial_rx buffer. If guaranteed 
delivery is desired, a list of buffer remnants could be drained on 
hypercall and console switching.

IMHO I believe the reality is while there is potential that the scenario 
could happen, the probability is low. Doing a per domain buffer will 
always incur the resource overhead even if the event never happens, 
while the above approach would only incur the resource overhead when the 
situation occurs.

>> @@ -1107,7 +1171,7 @@ void __init console_endboot(void)
>>        * a useful 'how to switch' message.
>>        */
>>       if ( opt_conswitch[1] == 'x' )
>> -        console_rx = max_console_rx;
>> +        console_rx = 0;
> 
> I can't bring this change in line with the comment ahead of the if():
> Won't this result in switch_serial_input() switching to Dom0?

Correct, if there is a Dom0 and it is the hardware domain. As noted, I 
missed that I broke the behavior this was intended to create.

v/r.
dps

