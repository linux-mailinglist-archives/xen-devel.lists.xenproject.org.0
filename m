Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDCD2D9BA7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 17:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52351.91432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koqIJ-0003nQ-Iy; Mon, 14 Dec 2020 16:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52351.91432; Mon, 14 Dec 2020 16:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koqIJ-0003n3-Fi; Mon, 14 Dec 2020 16:01:51 +0000
Received: by outflank-mailman (input) for mailman id 52351;
 Mon, 14 Dec 2020 16:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oe/o=FS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1koqIH-0003my-L8
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:01:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5cbb4e2-9970-4e6e-b705-3d848d932767;
 Mon, 14 Dec 2020 16:01:48 +0000 (UTC)
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
X-Inumbo-ID: a5cbb4e2-9970-4e6e-b705-3d848d932767
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607961708;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Auc/p++hk2V3I9MRwZtYTdF1+rZwGFxV40etKNGTYvQ=;
  b=a/CS6Y4OoOA2bEY0ADKBok1RiqwgmuLFnecMm7vE9yOQjtjAirBjAN4/
   qupyVBXL0uVvxGdWhCf3AIe855nTrqS3zdpBaopkikL0svYmRnoIkG9N9
   cXQX4u/cY/YkOKoHR6VbMrwZPjFWQ3mvag44RptpRv07OG/J6uo4RNw3N
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bgyobZM7MZ8Epmh7+ScRzaeNZCtWUHuwtJRp0Cy1mnFvT+NnA5rOZlZ035GdK9nTKq2D/JOvge
 Imw91bjvMsPP2Md4q/LaUYelRGlLRWlXFM6impPcjuOECJ2AnR27NL5OT8ueU1H0JVOy36zOzs
 dKQhsQLStdCRuWoVHfFZ3UEzQV1zatJG7ovEHV3lZjZQ0WrD8SxCIDJ6415nwm+QvbPz/Wvv2D
 rw08EYEanmUfBedR1BwxmcxWcp0vuU21dtSP+8dVgCo0kroYrqKONpp62OzpFefweIJxSXiiV5
 gEg=
X-SBRS: 5.2
X-MesageID: 33191580
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,420,1599537600"; 
   d="scan'208";a="33191580"
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
To: Julien Grall <julien@xen.org>, "Shamsundara Havanur, Harsha"
	<havanur@amazon.com>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <cover.1607686878.git.havanur@amazon.com>
 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
 <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
 <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
 <bf70db2d-cf03-11cb-887e-aa38094b3d5f@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <607cba7c-15b6-0197-6000-cc823038d320@citrix.com>
Date: Mon, 14 Dec 2020 16:01:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf70db2d-cf03-11cb-887e-aa38094b3d5f@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 14/12/2020 10:56, Julien Grall wrote:
> Hi Harsha,
>
> On 14/12/2020 09:26, Shamsundara Havanur, Harsha wrote:
>> On Mon, 2020-12-14 at 09:52 +0100, Jan Beulich wrote:
>>> CAUTION: This email originated from outside of the organization. Do
>>> not click links or open attachments unless you can confirm the sender
>>> and know the content is safe.
>>>
>>>
>>>
>>> On 11.12.2020 12:44, Harsha Shamsundara Havanur wrote:
>>>> A HVM domain flushes cache on all the cpus using
>>>> `flush_all` macro which uses cpu_online_map, during
>>>> i) creation of a new domain
>>>> ii) when device-model op is performed
>>>> iii) when domain is destructed.
>>>>
>>>> This triggers IPI on all the cpus, thus affecting other
>>>> domains that are pinned to different pcpus. This patch
>>>> restricts cache flush to the set of cpus affinitized to
>>>> the current domain using `domain->dirty_cpumask`.
>>>
>>> But then you need to effect cache flushing when a CPU gets
>>> taken out of domain->dirty_cpumask. I don't think you/we want
>>> to do that.
>>>
>> If we do not restrict, it could lead to DoS attack, where a malicious
>> guest could keep writing to MTRR registers or do a cache flush through
>> DM Op and keep sending IPIs to other neighboring guests.
>
> I saw Jan already answered about the alleged DoS, so I will just focus
> on the resolution.
>
> I agree that in the ideal situation we want to limit the impact on the
> other vCPUs. However, we also need to make sure the cure is not worse
> than the symptoms.

And specifically, only a change which is correct.  This patch very
definitely isn't.

Lines can get cached on other cpus from, e.g. qemu mappings and PV backends.

>
> The cache flush cannot be restricted in all the pinning situation
> because pinning doesn't imply the pCPU will be dedicated to a given
> vCPU or even the vCPU will stick on pCPU (we may allow floating on a
> NUMA socket). Although your setup may offer this guarantee.
>
> My knowledge in this area is quite limited. But below a few question
> that hopefully will help to make a decision.
>
> The first question to answer is: can the flush can be restricted in a
> setup where each vCPUs are running on a decicated pCPU (i.e partionned
> system)?

Not really.  Lines can become cached even from speculation in the directmap.

If you need to flush the caches (and don't have a virtual mapping to
issue clflush/clflushopt/clwb over), it must be on all CPUs.

> If the answer is yes, then we should figure out whether using
> domain->dirty_cpumask would always be correct? For instance, a vCPU
> may not have yet run, so can we consider the associated pCPU cache
> would be consistent?
>
> Another line of question is what can we do on system supporting
> self-snooping? IOW, would it be possible to restrict the flush for all
> the setup?

Right - this is the avenue which ought to be investigated.  (Working)
self-noop ought to remove the need for some of these cache flushes. 
Others look like they're not correct to begin with.  Others, such as the
wbinvd intercepts absolutely must stay as they are.

~Andrew

