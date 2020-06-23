Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E57205890
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 19:25:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnmf3-0000nH-I4; Tue, 23 Jun 2020 17:24:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0dP=AE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jnmf1-0000nC-U1
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 17:24:39 +0000
X-Inumbo-ID: 6a359a30-b576-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a359a30-b576-11ea-bca7-bc764e2007e4;
 Tue, 23 Jun 2020 17:24:38 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qGqU+ORmdNNlrdaBALnYX+BZPBhA4kls0TSI1Zy93QGywZJt/F6XVRLVg3enf1km9xGGaxlKB/
 HqTilHOlLKPY6sEABFHk7d5j6smghjXmk79ATGA4wrmo0xXmtwxSnXvlMOxllNk2AWQcArZ2D6
 UazuAlkrpvPVhyppecjhGGH+C3f0Yy37ITKnP1HbKMeNREQUtcXnKRhPyeyMy5+YQdAc1Z/aCH
 l0v23xxGHI/plcqB3G+etuK35p2LPsx+3FdVdGXDFbYuD4spiWJ3K+FBN9glnCxMNR1mOn9sDq
 Rck=
X-SBRS: 2.7
X-MesageID: 21544557
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,272,1589256000"; d="scan'208";a="21544557"
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
 <901046162.11470361.1592874264410.JavaMail.zimbra@cert.pl>
 <32b7234b-dc64-a0ea-2c5c-448bcec44c34@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bfa3d028-58de-eb99-fcff-dfc4cf1b93f1@citrix.com>
Date: Tue, 23 Jun 2020 18:24:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <32b7234b-dc64-a0ea-2c5c-448bcec44c34@suse.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/06/2020 09:51, Jan Beulich wrote:
> On 23.06.2020 03:04, Michał Leszczyński wrote:
>> ----- 22 cze 2020 o 18:16, Jan Beulich jbeulich@suse.com napisał(a):
>>
>>> On 22.06.2020 18:02, Michał Leszczyński wrote:
>>>> ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisał(a):
>>>>> On 22.06.2020 16:35, Michał Leszczyński wrote:
>>>>>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisał(a):
>>>>>>> Is any of what you do in this switch() actually legitimate without
>>>>>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>>>>>>> remarks elsewhere I imply you expect the param that you currently
>>>>>>> use to be set upon domain creation time, but at the very least the
>>>>>>> potentially big buffer should imo not get allocated up front, but
>>>>>>> only when tracing is to actually be enabled.
>>>>>> Wait... so you want to allocate these buffers in runtime?
>>>>>> Previously we were talking that there is too much runtime logic
>>>>>> and these enable/disable hypercalls should be stripped to absolute
>>>>>> minimum.
>>>>> Basic arrangements can be made at domain creation time. I don't
>>>>> think though that it would be a good use of memory if you
>>>>> allocated perhaps many gigabytes of memory just for possibly
>>>>> wanting to enable tracing on a guest.
>>>>>
>>>> From our previous conversations I thought that you want to have
>>>> as much logic moved to the domain creation as possible.
>>>>
>>>> Thus, a parameter "vmtrace_pt_size" was introduced. By default it's
>>>> zero (= disabled), if you set it to a non-zero value, then trace buffers
>>>> of given size will be allocated for the domain and you have possibility
>>>> to use ipt_enable/ipt_disable at any moment.
>>>>
>>>> This way the runtime logic is as thin as possible. I assume user knows
>>>> in advance whether he/she would want to use external monitoring with IPT
>>>> or not.
>>> Andrew - I think you requested movement to domain_create(). Could
>>> you clarify if indeed you mean to also allocate the big buffers
>>> this early?
>> I would like to recall what Andrew wrote few days ago:
>>
>> ----- 16 cze 2020 o 22:16, Andrew Cooper andrew.cooper3@citrix.com wrote:
>>> Xen has traditionally opted for a "and turn this extra thing on
>>> dynamically" model, but this has caused no end of security issues and
>>> broken corner cases.
>>>
>>> You can see this still existing in the difference between
>>> XEN_DOMCTL_createdomain and XEN_DOMCTL_max_vcpus, (the latter being
>>> required to chose the number of vcpus for the domain) and we're making
>>> good progress undoing this particular wart (before 4.13, it was
>>> concerning easy to get Xen to fall over a NULL d->vcpu[] pointer by
>>> issuing other hypercalls between these two).
>>>
>>> There is a lot of settings which should be immutable for the lifetime of
>>> the domain, and external monitoring looks like another one of these.
>>> Specifying it at createdomain time allows for far better runtime
>>> behaviour (you are no longer in a situation where the first time you try
>>> to turn tracing on, you end up with -ENOMEM because another VM booted in
>>> the meantime and used the remaining memory), and it makes for rather
>>> more simple code in Xen itself (at runtime, you can rely on it having
>>> been set up properly, because a failure setting up will have killed the
>>> domain already).
>>>
>>> ...
>>>
>>> ~Andrew
>> according to this quote I've moved buffer allocation to the create_domain,
>> the updated version was already sent to the list as patch v3.
> I'd still like to see an explicit confirmation by him that this
> use of memory is indeed what he has intended. There are much smaller
> amounts of memory which we allocate on demand, just to avoid
> allocating some without then ever using it.

PT is a debug/diagnostic tool.  Its not something you'd run in
production against a production VM.

It's off by default (by virtue of having to explicitly ask to use it in
the first place), and those who've asked for it don't want to be finding
-ENOMEM after the domain has been running for a few seconds (or midway
through the vcpus), when they inveterately want to map the rings.

Those who request buffers in the first place and forget about them are
not semantically different from those who ask for a silly shadow memory
limit, or typo the guest memory and give it too much.  Its a admin
error, not a safety/correctness issue.

~Andrew

