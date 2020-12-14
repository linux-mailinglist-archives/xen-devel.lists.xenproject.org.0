Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A12DA0A0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 20:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52640.91942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koteO-0002qR-Q2; Mon, 14 Dec 2020 19:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52640.91942; Mon, 14 Dec 2020 19:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koteO-0002q2-Mn; Mon, 14 Dec 2020 19:36:52 +0000
Received: by outflank-mailman (input) for mailman id 52640;
 Mon, 14 Dec 2020 19:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oe/o=FS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1koteN-0002pt-2u
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 19:36:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7fe405d-4cb2-423a-acae-cbb1c81e465c;
 Mon, 14 Dec 2020 19:36:48 +0000 (UTC)
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
X-Inumbo-ID: f7fe405d-4cb2-423a-acae-cbb1c81e465c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607974608;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=TIChKZk7bNLsqNN8smKs6e/5++JrlSASiflxKxbc3Nc=;
  b=WDEOpY2X+GPlEWLoYPO3j6mYmCOaWSNb7UgBGqd+2pg+DqqMo8IgJ3MG
   2gj+ZLsI6UeLXYBT02eQoO8JHjVCCZlXfULcgEOBaGSGkoaW8SY4fZtk/
   IMHuvGuIi+LbZkWhVoMYX3vllQkxI0J21w16tEecMyLZJhg57XGUNYUP6
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wtCuCDQwScHCQiG/4yeCa/ENPylAvlOauVV7w7qg6IT0th/SGpBIOsYgSyHUbyBnHpCJK0zr82
 DHwzdcQ+tltBJAy1MI92e0kFvncwNA2469s5OkHdqUuj01X57i/nGPfPgN9T90HsP7rF/OFX0g
 4+kRkOd4QQMXaZDU5Fbw+/j37OvTs7Y8+lvK8p3OcWdaDtXZ+I8PxMQlngmWOhxxNj2QfCLFzY
 AvySKUPJgGL753mOPKDWZzltCj0qgCuYrHplyFogJEJ5zC6kSthOsIb1i5/gFD3IbC1AU9O3D6
 P5Q=
X-SBRS: 5.2
X-MesageID: 33172448
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,420,1599537600"; 
   d="scan'208";a="33172448"
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
To: "Shamsundara Havanur, Harsha" <havanur@amazon.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>
CC: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"paul@xen.org" <paul@xen.org>
References: <cover.1607686878.git.havanur@amazon.com>
 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
 <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
 <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
 <bf70db2d-cf03-11cb-887e-aa38094b3d5f@xen.org>
 <607cba7c-15b6-0197-6000-cc823038d320@citrix.com>
 <eef19ecad32ac9379b6535ec2a4b444e78b29058.camel@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d41f91ae-4df5-abe1-e58e-92a2424c077a@citrix.com>
Date: Mon, 14 Dec 2020 19:36:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eef19ecad32ac9379b6535ec2a4b444e78b29058.camel@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 14/12/2020 19:05, Shamsundara Havanur, Harsha wrote:
> On Mon, 2020-12-14 at 16:01 +0000, Andrew Cooper wrote:
>> CAUTION: This email originated from outside of the organization. Do
>> not click links or open attachments unless you can confirm the sender
>> and know the content is safe.
>>
>>
>>
>> On 14/12/2020 10:56, Julien Grall wrote:
>>> Hi Harsha,
>>>
>>> On 14/12/2020 09:26, Shamsundara Havanur, Harsha wrote:
>>>> On Mon, 2020-12-14 at 09:52 +0100, Jan Beulich wrote:
>>>>> CAUTION: This email originated from outside of the
>>>>> organization. Do
>>>>> not click links or open attachments unless you can confirm the
>>>>> sender
>>>>> and know the content is safe.
>>>>>
>>>>>
>>>>>
>>>>> On 11.12.2020 12:44, Harsha Shamsundara Havanur wrote:
>>>>>> A HVM domain flushes cache on all the cpus using
>>>>>> `flush_all` macro which uses cpu_online_map, during
>>>>>> i) creation of a new domain
>>>>>> ii) when device-model op is performed
>>>>>> iii) when domain is destructed.
>>>>>>
>>>>>> This triggers IPI on all the cpus, thus affecting other
>>>>>> domains that are pinned to different pcpus. This patch
>>>>>> restricts cache flush to the set of cpus affinitized to
>>>>>> the current domain using `domain->dirty_cpumask`.
>>>>> But then you need to effect cache flushing when a CPU gets
>>>>> taken out of domain->dirty_cpumask. I don't think you/we want
>>>>> to do that.
>>>>>
>>>> If we do not restrict, it could lead to DoS attack, where a
>>>> malicious
>>>> guest could keep writing to MTRR registers or do a cache flush
>>>> through
>>>> DM Op and keep sending IPIs to other neighboring guests.
>>> I saw Jan already answered about the alleged DoS, so I will just
>>> focus
>>> on the resolution.
>>>
>>> I agree that in the ideal situation we want to limit the impact on
>>> the
>>> other vCPUs. However, we also need to make sure the cure is not
>>> worse
>>> than the symptoms.
>> And specifically, only a change which is correct.  This patch very
>> definitely isn't.
>>
>> Lines can get cached on other cpus from, e.g. qemu mappings and PV
>> backends.
>>
>>> The cache flush cannot be restricted in all the pinning situation
>>> because pinning doesn't imply the pCPU will be dedicated to a given
>>> vCPU or even the vCPU will stick on pCPU (we may allow floating on
>>> a
>>> NUMA socket). Although your setup may offer this guarantee.
>>>
>>> My knowledge in this area is quite limited. But below a few
>>> question
>>> that hopefully will help to make a decision.
>>>
>>> The first question to answer is: can the flush can be restricted in
>>> a
>>> setup where each vCPUs are running on a decicated pCPU (i.e
>>> partionned
>>> system)?
>> Not really.  Lines can become cached even from speculation in the
>> directmap.
>>
>> If you need to flush the caches (and don't have a virtual mapping to
>> issue clflush/clflushopt/clwb over), it must be on all CPUs.
> If lines are cached due to aggressive speculation from a different
> guest, wouldn't they be invalidated at the speculation boundary, since
> it's a wrong speculation? Would it still require to be flushed
> explicitly?

No.  Caches are microarchitectural state (just like TLBs, linefill
buffers, etc.)

The entire mess surrounding speculative security issues is that the
perturbance from bad speculation survive, and can be recovered at a
later point.

~Andrew

