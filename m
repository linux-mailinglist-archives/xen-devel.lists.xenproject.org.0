Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD4509F8D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 14:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310083.526719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhVqK-0000aF-Lt; Thu, 21 Apr 2022 12:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310083.526719; Thu, 21 Apr 2022 12:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhVqK-0000Xd-Ix; Thu, 21 Apr 2022 12:23:28 +0000
Received: by outflank-mailman (input) for mailman id 310083;
 Thu, 21 Apr 2022 12:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abij=U7=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nhVqJ-0000XX-Hu
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 12:23:27 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk
 (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7ced967-c16d-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 14:23:26 +0200 (CEST)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nhVqE-00029I-7O; Thu, 21 Apr 2022 12:23:22 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1nhVq9-000VvN-Iv; Thu, 21 Apr 2022 13:23:21 +0100
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
X-Inumbo-ID: d7ced967-c16d-11ec-8fc2-03012f2f19d4
Message-ID: <0b982410-9efb-dece-3bcf-3c6f2e1dce2a@cantab.net>
Date: Thu, 21 Apr 2022 13:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220421104305.878204-1-dvrabel@cantab.net>
 <34c410b1-969d-8b18-6b46-fbec72effc95@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <34c410b1-969d-8b18-6b46-fbec72effc95@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: [PATCH v2] page_alloc: assert IRQs are enabled in heap alloc/free
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01a-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 21/04/2022 12:38, Jan Beulich wrote:
> On 21.04.2022 12:43, David Vrabel wrote:
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -984,6 +984,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>>   
>>       console_init_postirq();
>>   
>> +    system_state = SYS_STATE_smp_boot
>> +
>>       do_presmp_initcalls();
>>   
>>       for_each_present_cpu ( i )
> 
> I'm afraid it's not this simple: There are two
> "ASSERT(system_state != SYS_STATE_boot)" in Arm-specific code. While
> both could in principle be left as is, I think both want modifying to
> ">= SYS_STATE_active", such that they would also trigger when in this
> newly set state (in case registration of the notifiers was altered).

These asserts are already too-relaxed given that there's an early_boot 
state.

> It also wants at least mentioning that setting this state is okay with
> all uses of system_state in common code (where it's not impossible
> that x86-isms still exist, having gone unnoticed so far), just to
> indicate that all of these were actually inspected (there's just one
> where it looks to be unobvious when simply looking at grep output, the
> one in keyhandler.c). As a result this may want to be a separate,
> prereq patch. At which point it will want considering whether to put
> the setting of the state _in_ do_presmp_initcalls() instead of ahead
> of its invocation.

Not sure I understand this comment. The transition to the smp_boot state 
on arm makes the state machine on x86 and arm look _more_ alike, thus 
common code should be happier.

>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -162,6 +162,14 @@
>>   static char __initdata opt_badpage[100] = "";
>>   string_param("badpage", opt_badpage);
>>   
>> +/*
>> + * Heap allocations may need TLB flushes which require IRQs to be
>> + * enabled (except during early boot when only 1 PCPU is online).
>> + */
>> +#define ASSERT_ALLOC_CONTEXT()                                          \
>> +    ASSERT(!in_irq() && (local_irq_is_enabled()                         \
>> +                         || system_state < SYS_STATE_smp_boot))
> 
> Upon further consideration: In principle IRQs would be okay to be off
> whenever we're in UP mode (and hence flush IPIs don't need sending).
> Provided of course spin debug is off as well and no other IRQs-on
> checks get in the way (like that in flush_area_mask()). This might be
> more robust overall than depending on system_state, but I'm not going
> to exclude there may also be arguments against doing so.

Not sure I understand what you're suggesting here. Do you mean something 
like this?

#define ASSERT_ALLOC_CONTEXT()                                         \
     ASSERT(!in_irq() && (local_irq_is_enabled()                        \
                          || nr_online_cpus == 1))

> In any event, looking back at my v1 comment, it would have been nice
> if the spinlock related aspect was at least also mentioned here, even
> if - as you did say in reply - the uses of the new macro aren't fully
> redundant with check_lock().
> 
> Also, nit: The || belongs on the earlier line as per our coding style.

CODING_STYLE says: "Long lines should be split at sensible places and 
the trailing portions indented."

If you're going to have rules (that have, IMO[1], worse readability) 
please document them.

David

[1] Compare

a = b
     + dksaldksa_daskldsa_dsakdlsad
     + hds
     + dsadjka_jdaksjdk_daskajd;

and

a = b +
     dksaldksa_daskldsa_dsakdlsad +
     hds +
     dsadjka_jdaksjdk_daskajd;

Which one is more clearly readable as a sum?

