Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FC20738D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:41:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4i2-0000eM-Tx; Wed, 24 Jun 2020 12:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F80x=AF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jo4i1-0000eH-Nq
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:40:57 +0000
X-Inumbo-ID: f2a95fb8-b617-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2a95fb8-b617-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 12:40:56 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ki1RHALmCId7WRLkWqIL9/44I5p6KozHqU9xMPCbzGj4A3pKi+tkPxyPm5hBtNap71jkUAT8S/
 jXUw8AOLUAhf1ElAb89qDH8+OsQOKa0mAZyeF+qBt1MUUs+WFT/amTA/nFuB9TJlgMb7DRP1mK
 +OdsHNRuxWWk/4eFIjsDazyoZUjRi1qVnHHovzJvDsWQDrEc1zKGWKXFd86i68EWIMEyNZeXUT
 hDnXY5zNbG/N2STU7rDJP5vNYvFJgqEEuoJswdI4V7EOi8tMCaEHBOGG/tR9PdTDhD8Fvc8q3q
 9e4=
X-SBRS: 2.7
X-MesageID: 21036602
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,275,1589256000"; d="scan'208";a="21036602"
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: Jan Beulich <jbeulich@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
 <901046162.11470361.1592874264410.JavaMail.zimbra@cert.pl>
 <32b7234b-dc64-a0ea-2c5c-448bcec44c34@suse.com>
 <bfa3d028-58de-eb99-fcff-dfc4cf1b93f1@citrix.com>
 <afb85b23-40d4-c054-a246-2741b7ce4208@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <daef0e13-eb49-fa79-30e3-67b49fb57b71@citrix.com>
Date: Wed, 24 Jun 2020 13:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <afb85b23-40d4-c054-a246-2741b7ce4208@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/06/2020 11:03, Jan Beulich wrote:
> On 23.06.2020 19:24, Andrew Cooper wrote:
>> On 23/06/2020 09:51, Jan Beulich wrote:
>>> On 23.06.2020 03:04, Michał Leszczyński wrote:
>>>> ----- 22 cze 2020 o 18:16, Jan Beulich jbeulich@suse.com napisał(a):
>>>>
>>>>> On 22.06.2020 18:02, Michał Leszczyński wrote:
>>>>>> ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisał(a):
>>>>>>> On 22.06.2020 16:35, Michał Leszczyński wrote:
>>>>>>>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisał(a):
>>>>>>>>> Is any of what you do in this switch() actually legitimate without
>>>>>>>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>>>>>>>>> remarks elsewhere I imply you expect the param that you currently
>>>>>>>>> use to be set upon domain creation time, but at the very least the
>>>>>>>>> potentially big buffer should imo not get allocated up front, but
>>>>>>>>> only when tracing is to actually be enabled.
>>>>>>>> Wait... so you want to allocate these buffers in runtime?
>>>>>>>> Previously we were talking that there is too much runtime logic
>>>>>>>> and these enable/disable hypercalls should be stripped to absolute
>>>>>>>> minimum.
>>>>>>> Basic arrangements can be made at domain creation time. I don't
>>>>>>> think though that it would be a good use of memory if you
>>>>>>> allocated perhaps many gigabytes of memory just for possibly
>>>>>>> wanting to enable tracing on a guest.
>>>>>>>
>>>>>> From our previous conversations I thought that you want to have
>>>>>> as much logic moved to the domain creation as possible.
>>>>>>
>>>>>> Thus, a parameter "vmtrace_pt_size" was introduced. By default it's
>>>>>> zero (= disabled), if you set it to a non-zero value, then trace buffers
>>>>>> of given size will be allocated for the domain and you have possibility
>>>>>> to use ipt_enable/ipt_disable at any moment.
>>>>>>
>>>>>> This way the runtime logic is as thin as possible. I assume user knows
>>>>>> in advance whether he/she would want to use external monitoring with IPT
>>>>>> or not.
>>>>> Andrew - I think you requested movement to domain_create(). Could
>>>>> you clarify if indeed you mean to also allocate the big buffers
>>>>> this early?
>>>> I would like to recall what Andrew wrote few days ago:
>>>>
>>>> ----- 16 cze 2020 o 22:16, Andrew Cooper andrew.cooper3@citrix.com wrote:
>>>>> Xen has traditionally opted for a "and turn this extra thing on
>>>>> dynamically" model, but this has caused no end of security issues and
>>>>> broken corner cases.
>>>>>
>>>>> You can see this still existing in the difference between
>>>>> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
>>>>> required to chose the number of vcpus for the domain) and we're making
>>>>> good progress undoing this particular wart (before 4.13, it was
>>>>> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
>>>>> issuing other hypercalls between these two).
>>>>>
>>>>> There is a lot of settings which should be immutable for the lifetime of
>>>>> the domain, and external monitoring looks like another one of these.
>>>>> Specifying it at createdomain time allows for far better runtime
>>>>> behaviour (you are no longer in a situation where the first time you try
>>>>> to turn tracing on, you end up with -ENOMEM because another VM booted in
>>>>> the meantime and used the remaining memory), and it makes for rather
>>>>> more simple code in Xen itself (at runtime, you can rely on it having
>>>>> been set up properly, because a failure setting up will have killed the
>>>>> domain already).
>>>>>
>>>>> ...
>>>>>
>>>>> ~Andrew
>>>> according to this quote I've moved buffer allocation to the create_domain,
>>>> the updated version was already sent to the list as patch v3.
>>> I'd still like to see an explicit confirmation by him that this
>>> use of memory is indeed what he has intended. There are much smaller
>>> amounts of memory which we allocate on demand, just to avoid
>>> allocating some without then ever using it.
>> PT is a debug/diagnostic tool.  Its not something you'd run in
>> production against a production VM.
> Well, the suggested use with introspection made me assume differently.
> If this is (now and forever) truly debug/diag only, so be it then.

At the end of the day, it is a fine grain profiling tool, meaning that
it is not used in the common case.

The usecase presented is for fuzzing, using the execution trace
generated by the CPU, rather than the current scheme which allegedly
involves shuffling breakpoints around.

There is a big disclaimer with PT saying "there is a perf hit from using
this".  This is a consequence of the core suddenly becoming far more
memory bound, and almost certainly being capable of generating trace
data faster than can be written out.


Even if it does find its way into some fairly custom production
scenarios (fuzzing as a service?), we're still in the position where the
only people who enable this will be the people intending to use it.

~Andrew

