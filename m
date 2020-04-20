Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3431B0E2B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXHB-0005Pf-No; Mon, 20 Apr 2020 14:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQXH9-0005PD-KD
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:19:55 +0000
X-Inumbo-ID: 0030ca42-8312-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0030ca42-8312-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 14:19:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0BDA8ABD7;
 Mon, 20 Apr 2020 14:19:50 +0000 (UTC)
Subject: Re: [PATCH v15 1/3] mem_sharing: don't reset vCPU info page during
 fork reset
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
 <20200420074516.GQ28601@Air-de-Roger>
 <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <686dafe9-54f6-3224-d2ff-8cfb99734b2c@suse.com>
Date: Mon, 20 Apr 2020 16:19:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=Fd+Te7ECcgdxU3GUnBYygDXjFDyRHKAWf75MLZu7KAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 16:15, Tamas K Lengyel wrote:
> On Mon, Apr 20, 2020 at 1:45 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Fri, Apr 17, 2020 at 10:06:31AM -0700, Tamas K Lengyel wrote:
>>> When a forked VM is being reset while having vm_events active, re-copying the
>>> vCPU info page can lead to events being lost. This seems to only affect a
>>> subset of events (interrupts), while not others (cpuid, MTF, EPT) thus it was
>>
>> I'm slightly lost by the sentence, is the guest or the hypervisor
>> the one losing events?
>>
>> Ie: interrupts are events from a guest PoV, but cpuid or EPT is not
>> something that triggers events that are injected to the guest. I think
>> the commit message needs clarification.
> 
> Sorry, what I meant was software interrupts are not triggered anymore,
> ie. int3 and it's associated event is not sent to the monitor
> application (VM_EVENT_REASON_SOFTWARE_BREAKPOINT).
> 
>>
>>> not discovered beforehand. Only copying vCPU info page contents during initial
>>> fork fixes the problem.
>>
>> Hm, I'm not sure I understand why this is causing issues. When you
>> reset a fork you should reset the vcpu info page, or else event masks would
>> be in a wrong state?
> 
> When we reset a fork we only want to 1) discard any memory allocated
> for it 2) reset the vCPU registers. We don't want to reset event
> channels or anything else. We have active vm_events on the domain and
> the whole point of doing a fork reset is to avoid having to
> reinitialize all that as it's quite slow.

So for an arbitrary piece of state, what are the criteria to establish
whether to copy or re-init them during a fork? Is it really now and
forever only memory that wants resetting? I have to admit I'm confused
by you also mentioning CPU registers - aren't they to be copied rather
than reset?

Jan

