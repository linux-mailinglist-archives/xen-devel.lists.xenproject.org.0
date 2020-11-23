Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30632C11A3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34896.66172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFPB-0003Qk-Tq; Mon, 23 Nov 2020 17:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34896.66172; Mon, 23 Nov 2020 17:13:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFPB-0003QL-QO; Mon, 23 Nov 2020 17:13:33 +0000
Received: by outflank-mailman (input) for mailman id 34896;
 Mon, 23 Nov 2020 17:13:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khFPA-0003QG-TY
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:13:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khFP9-0005uO-Ps; Mon, 23 Nov 2020 17:13:31 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khFP9-0006TX-Cu; Mon, 23 Nov 2020 17:13:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khFPA-0003QG-TY
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XrE+ALSM1RWKwNoUwriGqCl0llXfg3e+F8zsvRlu8YI=; b=cd6VKHUkWSJN5qqXYp76pntEaN
	eFh0+IvhUXnFL+SifmKBqwLCyx5wYlM8/FfGctTjHZWeGc493b9yEa8s1WcV978zszPZWlWx1p9Aj
	ucmTRL7a1Go3yJ3FiQQIGUbLwBMN8zL0GSqsZK+8VP4MEB7++mfE1+fTRjxkvYcPbj04=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khFP9-0005uO-Ps; Mon, 23 Nov 2020 17:13:31 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khFP9-0006TX-Cu; Mon, 23 Nov 2020 17:13:31 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org>
 <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org>
 <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
 <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org>
 <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
 <alpine.DEB.2.21.2011191534060.7979@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0aS1G0F1jAtKNEe4r3tyBoxy1xJ9AV7pYgifsL62iqww@mail.gmail.com>
 <alpine.DEB.2.21.2011191551510.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <6d2dae58-bfe5-596e-7850-a20ed54e1a81@xen.org>
Date: Mon, 23 Nov 2020 17:13:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011191551510.7979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 20/11/2020 00:14, Stefano Stabellini wrote:
> On Thu, 19 Nov 2020, Julien Grall wrote:
>> On Thu, 19 Nov 2020, 23:38 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>>        On Thu, 19 Nov 2020, Rahul Singh wrote:
>>        > > On 19/11/2020 09:53, Jan Beulich wrote:
>>        > >> On 19.11.2020 10:21, Julien Grall wrote:
>>        > >>> Hi Jan,
>>        > >>>
>>        > >>> On 19/11/2020 09:05, Jan Beulich wrote:
>>        > >>>> On 18.11.2020 16:50, Julien Grall wrote:
>>        > >>>>> On 16/11/2020 12:25, Rahul Singh wrote:
>>        > >>>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>        > >>>>>> is enabled for ARM, compilation error is observed for ARM architecture
>>        > >>>>>> because ARM platforms do not have full PCI support available.
>>        > >>>>>   >
>>        > >>>>>> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
>>        > >>>>>> ns16550 PCI for X86.
>>        > >>>>>>
>>        > >>>>>> For X86 platforms it is enabled by default. For ARM platforms it is
>>        > >>>>>> disabled by default, once we have proper support for NS16550 PCI for
>>        > >>>>>> ARM we can enable it.
>>        > >>>>>>
>>        > >>>>>> No functional change.
>>        > >>>>>
>>        > >>>>> NIT: I would say "No functional change intended" to make clear this is
>>        > >>>>> an expectation and hopefully will be correct :).
>>        > >>>>>
>>        > >>>>> Regarding the commit message itself, I would suggest the following to
>>        > >>>>> address Jan's concern:
>>        > >>>>
>>        > >>>> While indeed this is a much better description, I continue to think
>>        > >>>> that the proposed Kconfig option is undesirable to have.
>>        > >>>
>>        > >>> I am yet to see an argument into why we should keep the PCI code
>>        > >>> compiled on Arm when there will be no-use....
>>        > >> Well, see my patch suppressing building of quite a part of it.
>>        > >
>>        > > I will let Rahul figuring out whether your patch series is sufficient to fix compilation issues (this is what matters right
>>        now).
>>        >
>>        > I just checked the compilation error for ARM after enabling the HAS_PCI on ARM. I am observing the same compilation error
>>        what I observed previously.
>>        > There are two new errors related to struct uart_config and struct part_param as those struct defined globally but used under
>>        X86 flags.
>>        >
>>        > At top level:
>>        > ns16550.c:179:48: error: ‘uart_config’ defined but not used [-Werror=unused-const-variable=]
>>        >  static const struct ns16550_config __initconst uart_config[] =
>>        >                                                 ^~~~~~~~~~~
>>        > ns16550.c:104:54: error: ‘uart_param’ defined but not used [-Werror=unused-const-variable=]
>>        >  static const struct ns16550_config_param __initconst uart_param[] = {
>>        >
>>        >
>>        > >
>>        > >>>> Either,
>>        > >>>> following the patch I've just sent, truly x86-specific things (at
>>        > >>>> least as far as current state goes - if any of this was to be
>>        > >>>> re-used by a future port, suitable further abstraction may be
>>        > >>>> needed) should be guarded by CONFIG_X86 (or abstracted into arch
>>        > >>>> hooks), or the HAS_PCI_MSI proposal would at least want further
>>        > >>>> investigating as to its feasibility to address the issues at hand.
>>        > >>>
>>        > >>> I would be happy with CONFIG_X86, despite the fact that this is only
>>        > >>> deferring the problem.
>>        > >>>
>>        > >>> Regarding HAS_PCI_MSI, I don't really see the point of introducing given
>>        > >>> that we are not going to use NS16550 PCI on Arm in the forseeable
>>        > >>> future.
>>        > >> And I continue to fail to see what would guarantee this: As soon
>>        > >> as you can plug in such a card into an Arm system, people will
>>        > >> want to be able use it. That's why we had to add support for it
>>        > >> on x86, after all.
>>        > >
>>        > > Well, plug-in PCI cards on Arm has been available for quite a while... Yet I haven't heard anyone asking for NS16550 PCI
>>        support.
>>        > >
>>        > > This is probably because SBSA compliant server should always provide an SBSA UART (a cut-down version of the PL011). So why
>>        would bother to lose a PCI slot for yet another UART?
>>        > >
>>        > >> >> So why do we need a finer graine Kconfig?
>>        > >> Because most of the involved code is indeed MSI-related?
>>        > >
>>        > > Possibly, yet it would not be necessary if we don't want NS16550 PCI support...
>>        >
>>        > To fix compilation error on ARM as per the discussion there are below options please suggest which one to use to proceed
>>        further.
>>        >
>>        > 1. Use the newly introduced CONFIG_HAS_NS16550_PCI config options. This helps also non-x86 architecture in the future not to
>>        have compilation error
>>        > what we are observing now when HAS_PCI is enabled.
>>        >
>>        > 2. Guard the remaining x86 specific code with CONFIG_X86 and introduce the new CONFIG_HAS_PCI_MSI options to fix the MSI
>>        related compilation error.
>>        > Once we have proper support for MSI and PCI for ARM  (HAS_PCI_MSI and HAS_PCI enabled for ARM in Kconfig ) I am not sure if
>>        NS16550 PCI will work out of the box on ARM .In that case, we might need to come back again to fix NS16550 driver.
>>
>>
>>        It doesn't matter too much to me, let's just choose one option so that you
>>        get unblocked soon.
>>
>>        It looks like Jan prefers option 2) and both Julien and I are OK with
>>        it. So let's do 2). Jan, please confirm too :-)
>>
>>
>> Please don't put words in my mouth...
> 
> Sorry Julien, I misinterpreted one of your previous comments. Sometimes
> it is difficult to do things by email. It is good that you clarified as
> my goal was to reach an agreement.

No worries. I would like to apologies for been harsher than I would have 
wanted on my reply. The thread had a lot of back and forth so far.

> 
> 
>> I think introducing HAS_PCI_MSI is short sighted.
>>
>> There are no clear benefits of it when NS16550 PCI support is not going to be enable in the foreseeable future.
> 
> I agree
> 
> 
>> I would be ok with moving everything under CONFIG_X86. IHMO this is still shortsighted but at least we don't introduce a config that's not
>> going to help Arm or other any architecture to disable completely PCI support in NS16550.
> 
> So you are suggesting a new option:
> 
> 3. Guard the remaining x86 specific code *and* the MSI related
> compilation errors with CONFIG_X86
> 
> Is that right?

That's correct.

> My preference is actually option 1) but this series is already at v3 and
> I don't think this decision is as important as much as unblocking
> Rahul, so I am OK with the other alternatives too.

In order, my preferences are 1) 3) 2). AFAICT...

> 
> I tend to agree with you that 3) is better than 2) for the reasons you
> wrote above.

... this is the same order as you. Although I probably have a stronger 
dislike for 2) because I feel it is pushed for the wrong reasons (e.g. 
matter of taste) so far.

My view on 2) can change if Jan provides enough information into why one 
would want NS1650 PCI enabled by default on Arm but disable MSI.

Cheers,

-- 
Julien Grall

