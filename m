Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62E308717
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77790.141116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PIN-0000D0-MR; Fri, 29 Jan 2021 08:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77790.141116; Fri, 29 Jan 2021 08:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PIN-0000Cd-Iw; Fri, 29 Jan 2021 08:38:23 +0000
Received: by outflank-mailman (input) for mailman id 77790;
 Fri, 29 Jan 2021 08:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5PIL-0000CX-RK
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:38:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c50b860-737d-4d26-8dcd-2034b37d1607;
 Fri, 29 Jan 2021 08:38:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB8B8B001;
 Fri, 29 Jan 2021 08:38:18 +0000 (UTC)
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
X-Inumbo-ID: 7c50b860-737d-4d26-8dcd-2034b37d1607
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611909498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NN5ZQHXLfuCzJarSi0NPMWQZTbTe+kVjdQvleJgfB4=;
	b=fVCbTZdtoKbKXkgRjlRCOpCiBspGsZldS09yiDFkYqWhnDqCgDOk4CgrR0PYED6VfXp1Z8
	mt3skRJMjwAfGI1/Cs0qxn8u8ImxxYS+kZRfrLJYIPO2m6EE528kQuRWpjiOF9sxAB/G5p
	dQ37yvEboQpYoIFsu6GGHc28GstJR7I=
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Dario Faggioli <dfaggioli@suse.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
 <8c4b30f5f16824124e50922c871d440bf39991ba.camel@suse.com>
Cc: committers@xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78cb6825-c5db-4613-3fd6-e7fc98441b41@suse.com>
Date: Fri, 29 Jan 2021 09:38:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8c4b30f5f16824124e50922c871d440bf39991ba.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 19:26, Dario Faggioli wrote:
> On Thu, 2021-01-14 at 19:02 +0000, Andrew Cooper wrote:
>> 2) "scheduler broken" bugs.  We've had 4 or 5 reports of Xen not
>> working, and very little investigation on whats going on.  Suspicion
>> is
>> that there might be two bugs, one with smt=0 on recent AMD hardware,
>> and
>> one more general "some workloads cause negative credit" and might or
>> might not be specific to credit2 (debugging feedback differs - also
>> might be 3 underlying issue).
>>
> Yep, so, let's try to summarize/collect the ones I think you may be
> referring to:
> 
> 1) There is one report about Credit2 not working, while Credit1 was
> fine. It's this one:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html
> 
> It's the one where it somehow happens that one or more vCPUs manage to
> run for a really really long timeslice, much more than the scheduler
> would have allowed them to, and this cause problems. _If_ that's it, my
> investigation so far seems to show that this happens despite scheduler
> code tries to enforce (via timers) the proper timeslice limits. when it
> happens, makes the scheduler very unhappy. I've see reports of it
> occurring both on Credit and Credit2, but definitely Credit2 seems to
> be more sensitive to it.
> 
> I've actually been trying to track it down for a while now, but I can't
> easily reproduce it, so it's proving to be challenging.
> 
> 2) Then there has been his one:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01005.html
> 
> Here, the where reporter said that "[credit1] results is an observable
> delay, unusable performance; credit2 seems to be the only usable
> scheduler". This is the one that also Andrew mention, happening on
> Ryzen and with SMT disabled (as this is on QubesOS, IIRC).
> 
> Here, doing "dom0_max_vcpus=1 dom0_vcpus_pin" seemed to mitigate the
> problem but, of course, with obvious limitations. I don't have a Ryzen
> handy, but I have a Zen and a Zen2. I checked there and again could not
> reproduce (although, what I tried was upstream Xen, not QubesOS).
> 
> 3) Then I recall this one:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01800.html
> 
> This also started as a "scheduler, probably Credit2" bug. But it then
> turned out manifests on both Credit1 and Credit2 and it started to
> happen on 4.14, while it was not there in 4.13... And nothing major
> changed in scheduling between these two releases, I think.
> 
> During the analysis, we thought we identified a livelock, but then
> could not pinpoint what was exactly going on. Oh, and then it was also
> discovered that Credit2 + PVH dom0 seemed to be a working
> configuration, and it's weird for a scheduling issue to have a (dom0)
> domain type dependency, I think. But that could be anything really...
> and I'm sure happy to keep digging.
> 
> 4) There's the NULL scheduler + ARM + vwfi=native issue:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.html
> 
> This looks like something that we saw before, but remained unfixed,
> although not exactly like that. If it's that one, analysis is done, and
> we're working on a patch. If it's something else or even something
> similar but slightly different... Well, we'll have to see when we have
> the patch.
> 
> 5) We're also dealing with this bugreport, although this is being
> reported against Xen 4.13 (openSUSE 's packaged version of it):
> 
> https://bugzilla.opensuse.org/show_bug.cgi?id=1179246
> 
> This is again on recent AMD hardware and here, "dom0_max_vcpus=4
> dom0_vcpus_pin" works ok, but only until a (Windows) HVM guest is
> started. When that happens, though, we have crashes/hangs.
> 
> If guests are PV, things are apparently fine. If the HVM guests use a
> different set of CPUs than dom0 (e.g., vm.cpumask="4-63" in xl.conf),
> thinks are fine as well.
> 
> Again a scheduler issue and a scheduling algorithm dependency was
> theorized and will be investigated (if the user can come back with
> answers, which may take some time, as explained in the report). The
> different behavior with different kind of guests is a little weird for
> an issue of this kind, IME, but let's see.
> 
> 6) If we want, we can include this too (hopefully just for reference):
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01376.html
> 
> As indeed the symptoms were similar, such as hanging during boot, but
> all fine with dom0_max_vcpus=1. However, Jan is currently investigating
> this one, and they're heading toward problems with TSC reliability
> reporting and rendezvous, but let's see.
> 
> Did I forget any?

Going just from my mailbox, where I didn't keep all of the still
unaddressed reports, but some (another one I have there is among
the ones you've mentioned above):

https://lists.xen.org/archives/html/xen-devel/2020-03/msg01251.html
https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html

Jan

