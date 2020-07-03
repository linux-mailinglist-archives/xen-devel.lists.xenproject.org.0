Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E9213C15
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 16:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrN1K-0001gG-R3; Fri, 03 Jul 2020 14:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jrN1I-0001gB-MC
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 14:50:28 +0000
X-Inumbo-ID: 8890a8bc-bd3c-11ea-89d2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8890a8bc-bd3c-11ea-89d2-12813bfff9fa;
 Fri, 03 Jul 2020 14:50:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 570D4AC24;
 Fri,  3 Jul 2020 14:50:27 +0000 (UTC)
Subject: Re: vPT rework (and timer mode)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200701090210.GN735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
Date: Fri, 3 Jul 2020 16:50:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701090210.GN735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.07.2020 11:02, Roger Pau Monné wrote:
> It's my understanding that the purpose of pt_update_irq and
> pt_intr_post is to attempt to implement the "delay for missed ticks"
> mode, where Xen will accumulate timer interrupts if they cannot be
> injected. As shown by the patch above, this is all broken when the
> timer is added to a vCPU (pt->vcpu) different than the actual target
> vCPU where the interrupt gets delivered (note this can also be a list
> of vCPUs if routed from the IO-APIC using Fixed mode).
> 
> I'm at lost at how to fix this so that virtual timers work properly
> and we also keep the "delay for missed ticks" mode without doing a
> massive rework and somehow keeping track of where injected interrupts
> originated, which seems an overly complicated solution.
> 
> My proposal hence would be to completely remove the timer_mode, and
> just treat virtual timer interrupts as other interrupts, ie: they will
> be injected from the callback (pt_timer_fn) and the vCPU(s) would be
> kicked. Whether interrupts would get lost (ie: injected when a
> previous one is still pending) depends on the contention on the
> system. I'm not aware of any current OS that uses timer interrupts as
> a way to track time. I think current OSes know the differences between
> a timer counter and an event timer, and will use them appropriately.

Fundamentally - why not, the more that this promises to be a
simplification. The question we need to answer up front is whether
we're happy to possibly break old OSes (presumably ones no-one
ought to be using anymore these days, due to their support life
cycles long having ended).

Jan

