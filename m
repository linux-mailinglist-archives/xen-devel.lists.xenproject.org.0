Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC278221CA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 20:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660826.1030457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKk92-0006tL-EG; Tue, 02 Jan 2024 19:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660826.1030457; Tue, 02 Jan 2024 19:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKk92-0006qr-BN; Tue, 02 Jan 2024 19:09:44 +0000
Received: by outflank-mailman (input) for mailman id 660826;
 Tue, 02 Jan 2024 19:09:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rKk91-0006ql-Mf
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 19:09:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rKk8x-00034K-1n; Tue, 02 Jan 2024 19:09:39 +0000
Received: from [54.239.6.182] (helo=[10.95.76.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rKk8w-0003mb-Qi; Tue, 02 Jan 2024 19:09:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ftVZ3aGf9z8uzFxxrchpWDI70XVg+aUI4vstfPeAkCE=; b=rmeFlXah8dYrBaFjf77bB0kbjX
	mCsW9GHHLBhwqM8oJlLynPSrt/jNKlwIJQ2qrVToj/Eaw/sAR+i99w9XNzXAYl/Jk0/5Sau6MYYiE
	YSjhIgvULKUNv0OHqziUrE9CqxAe14b7zqMVfgbMSN5U7EW6UrezF5EhLJO+vFfldwsg=;
Message-ID: <d0daf858-eda8-4b2a-9cfe-82fff834df8f@xen.org>
Date: Tue, 2 Jan 2024 19:09:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option
 to skip timer check
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-2-julien@xen.org>
 <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
 <8b8a62a0-f854-405e-b256-5eee4bfdcb6c@xen.org>
 <b74f1f28-58da-4604-a7ef-370aeb0522ce@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b74f1f28-58da-4604-a7ef-370aeb0522ce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/12/2023 10:35, Jan Beulich wrote:
> On 14.12.2023 11:14, Julien Grall wrote:
>> On 14/12/2023 10:10, Jan Beulich wrote:
>>> On 11.12.2023 13:23, Julien Grall wrote:
>>>> --- a/xen/arch/x86/io_apic.c
>>>> +++ b/xen/arch/x86/io_apic.c
>>>> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
>>>>    int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
>>>>    int __read_mostly nr_ioapics;
>>>>    
>>>> +/*
>>>> + * The logic to check if the timer is working is expensive. So allow
>>>> + * the admin to bypass it if they know their platform doesn't have
>>>> + * a buggy timer.
>>>> + */
>>>> +static bool __initdata pit_irq_works;
>>>> +boolean_param("pit-irq-works", pit_irq_works);
>>>> +
>>>>    /*
>>>>     * Rough estimation of how many shared IRQs there are, can
>>>>     * be changed anytime.
>>>> @@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
>>>>    {
>>>>        unsigned long t1, flags;
>>>>    
>>>> +    if ( pit_irq_works )
>>>> +        return 1;
>>>
>>> When the check is placed here, what exactly use of the option means is
>>> system dependent. I consider this somewhat risky, so I'd prefer if the
>>> check was put on the "normal" path in check_timer(). That way it'll
>>> affect only the one case which we can generally consider "known good",
>>> but not the cases where the virtual wire setups are being probed. I.e.

By "known good", do you mean the following:

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c89fbed8d675..c39d39ee951a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1960,7 +1959,8 @@ static void __init check_timer(void)
           * Ok, does IRQ0 through the IOAPIC work?
           */
          unmask_IO_APIC_irq(irq_to_desc(0));
-        if (timer_irq_works()) {
+        if (pit_irq_works || timer_irq_works()) {
+            printk("====== pirq_irq_works %d =====\n", pit_irq_works);
              local_irq_restore(flags);
              return;
          }

>>
>> I am not against restricting when we allow skipping the timer check. But
>> in that case, I wonder why Linux is doing it differently?
> 
> Sadly Linux'es git history doesn't go back far enough (begins only at past
> 2.6.11), so I can't (easily) find the patch (and description) for the x86-64
> change. The later i386 change is justified mainly by paravirt needs, so
> isn't applicable here. I wouldn't therefore exclude that my point above
> wasn't even taken into consideration. Furthermore their command line option
> is "no_timer_check", which to me firmly says "don't check" without regard to
> whether the source (PIT) is actually okay. That's different with the option
> name you (imo validly) chose.

Just to note that the name was suggested by Roger. I have to admit that 
I didn't check if this made sense for the existing placement.

Anyway, I tested the change on the HW where I wanted to skip the timer 
check. And I can confirm this is still skipping the timer check.

So I will send a new version with the diff above and some updated comments.

Cheers,

-- 
Julien Grall

