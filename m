Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B634CE66
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 13:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102946.196501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpdx-0005jL-K1; Mon, 29 Mar 2021 11:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102946.196501; Mon, 29 Mar 2021 11:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQpdx-0005iz-Gz; Mon, 29 Mar 2021 11:01:13 +0000
Received: by outflank-mailman (input) for mailman id 102946;
 Mon, 29 Mar 2021 11:01:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQpdv-0005iu-LF
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 11:01:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7ccd0c8-9dde-487e-a9c3-1795f570ca67;
 Mon, 29 Mar 2021 11:01:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 835B3B455;
 Mon, 29 Mar 2021 11:01:09 +0000 (UTC)
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
X-Inumbo-ID: d7ccd0c8-9dde-487e-a9c3-1795f570ca67
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617015669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu+knVKLRo8NmHQQZRUKQt88FpEey49BphhElhAeyw0=;
	b=fjqznH0U0Zh5oEGd4QqM0ePlYxTSLkjZ1WnEA7k7Y9yG+nbHzAmq3pRzSKWN//EXuBDOeK
	FZqeuWVEB+s8rhWkqUMTb2LRW7pNLx7rAq4azkVK3sqM0h9FUNJfrVSWe9pMTztFoJkyT/
	6TygiebLLhzBaV9SfUDyjCUteLXB31Q=
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
 iwj@xenproject.org, xen-devel@lists.xenproject.org
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
 <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
 <YGGuogF/3n9c2uNV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <154f34e1-85c0-6e7c-da9e-2c7889d4473f@suse.com>
Date: Mon, 29 Mar 2021 13:01:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGGuogF/3n9c2uNV@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.03.2021 12:40, Roger Pau Monné wrote:
> On Mon, Mar 29, 2021 at 11:56:56AM +0200, Jan Beulich wrote:
>> On 27.03.2021 02:51, Boris Ostrovsky wrote:
>>> Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
>>> vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
>>> intended to protect periodic timer during VCPU migration. Since such
>>> migration is an infrequent event no performance impact was expected.
>>>
>>> Unfortunately this turned out not to be the case: on a fairly large
>>> guest (92 VCPUs) we've observed as much as 40% TPCC performance
>>> regression with some guest kernels. Further investigation pointed to
>>> pt_migrate read lock taken in pt_update_irq() as the largest contributor
>>> to this regression. With large number of VCPUs and large number of VMEXITs
>>> (from where pt_update_irq() is always called) the update of an atomic in
>>> read_lock() is thought to be the main cause.
>>>
>>> Stephen Brennan analyzed locking pattern and classified lock users as
>>> follows:
>>>
>>> 1. Functions which read (maybe write) all periodic_time instances
>>> attached to a particular vCPU. These are functions which use pt_vcpu_lock()
>>> after the commit, such as pt_restore_timer(), pt_save_timer(), etc.
>>> 2. Functions which want to modify a particular periodic_time object.
>>> These guys lock whichever vCPU the periodic_time is attached to, but
>>> since the vCPU could be modified without holding any lock, they are
>>> vulnerable to the bug. Functions in this group use pt_lock(), such as
>>> pt_timer_fn() or destroy_periodic_time().
>>> 3. Functions which not only want to modify the periodic_time, but also
>>> would like to modify the =vcpu= fields. These are create_periodic_time()
>>> or pt_adjust_vcpu(). They create the locking imbalance bug for group 2,
>>> but we can't simply hold 2 vcpu locks due to the deadlock risk.
>>>
>>> Roger Monné then pointed out that group 1 functions don't really need
>>> to hold the pt_migrate rwlock and that group 3 should be hardened by
>>> holding appropriate vcpu's tm_lock when adding or deleting a timer
>>> from its list.
>>
>> I'm struggling some with the latter aspect: Is this to mean there is
>> something wrong right now?
> 
> There's nothing wrong right now AFAICT , because per-vcpu users (ie:
> type 1) also hold the rw lock in read mode when iterating over the
> per-vcpu list.
> 
>> Or does "harden" really mean "just to be
>> on the safe side" here?
> 
> If the per-domain rw lock is no longer read-locked by type 1 users
> then type 2 and type 3 users need to make sure the per-vcpu lock is
> taken before adding or removing items from the per-vcpu lists, or else
> a type 1 user could see list corruption as a result of modifications
> done by type 2 or 3 without holding the per-vcpu lock.

Ah, right. Boris, may I then ask to avoid the somewhat ambiguous word
"harden" here then, and instead make clear that the new locking is in
fact "balancing" removal of locks elsewhere?

Jan

