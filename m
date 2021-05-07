Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB17376168
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 09:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123784.233547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levCO-0002U5-Br; Fri, 07 May 2021 07:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123784.233547; Fri, 07 May 2021 07:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levCO-0002RD-82; Fri, 07 May 2021 07:47:00 +0000
Received: by outflank-mailman (input) for mailman id 123784;
 Fri, 07 May 2021 07:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1levCN-0002R7-AD
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 07:46:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id affa874a-7ea0-4f96-8c6c-b9d0e50c2286;
 Fri, 07 May 2021 07:46:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40B10B113;
 Fri,  7 May 2021 07:46:57 +0000 (UTC)
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
X-Inumbo-ID: affa874a-7ea0-4f96-8c6c-b9d0e50c2286
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620373617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xAfr4z7JzXC1gg6T/5RHLsz84op48LpVerLEWtvshP4=;
	b=QS9VcAWricZNpC7eHqX0peA+BZ4LWq1wF6jFOFEf2c7wQRFTicWJFo9G41h7nSyon0WVaR
	S47m9/VQW5hXhLLg/EXD6y+bkpEzuUL0FqROR37pM/Sjxn+0SUfTxNq/5sYlh7VdjTGEly
	NuJIG3zqCA8WLU9RmSN1Z22hAUeZ+Ys=
Subject: Re: [PATCH v4] gnttab: defer allocation of status frame tracking
 array
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
 <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb882824-55a8-bd59-9c31-ade25c2b8da9@suse.com>
Date: Fri, 7 May 2021 09:46:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.05.2021 12:49, Andrew Cooper wrote:
> On 04/05/2021 09:42, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames(). While the delaying of the respective
>> memory allocation adds possible reasons for failure of the respective
>> enclosing operations, there are other memory allocations there already,
>> so callers can't expect these operations to always succeed anyway.
>>
>> As to the re-ordering at the end of gnttab_unpopulate_status_frames(),
>> this is merely to represent intended order of actions (shrink array
>> bound, then free higher array entries). If there were racing accesses,
>> suitable barriers would need adding in addition.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Nack.
> 
> The argument you make says that the grant status frames is "large
> enough" to care about not allocating.  (I frankly disagree, but that
> isn't relevant to my to my nack).
> 
> The change in logic here moves a failure in DOMCTL_createdomain, to
> GNTTABOP_setversion.  We know, from the last minute screwups in XSA-226,
> that there are versions of Windows and Linux in the field, used by
> customers, which will BUG()/BSOD when GNTTABOP_setversion doesn't succeed.

So after you did re-state the Linux aspect of this on the call yesterday
I went and looked. In the first phase of Linux supporting v2 at all
(3.3 - 3.16) there indeed was a panic() upon certain kinds of failures.
Only up to 3.13 was there an actual attempt to use v2. Also, while there
was some code there to support actual v2 features (sub-page or
transitive grants), all of this was dead. Hence their claim

		/*
		 * If we've already used version 2 features,
		 * but then suddenly discover that they're not
		 * available (e.g. migrating to an older
		 * version of Xen), almost unbounded badness
		 * can happen.
		 */

was bogus at best. If there was no way at all for set_version to fail
prior to the change, here I could probably accept your position. But as
said before by Julien - there are pre-existing memory allocations (of
typically larger size) there, and hence any guest assuming the call
can't fail is flawed already anyway. And no, I don't view this as a
reason for us to try to eliminate all memory allocations from that
hypercall (which would in particular mean populating status frames
irrespective of whether a guest would ever switch to v2). Guest flaws
would better be addressed in the guests.

Upon re-introduction in 4.15 no such fatal behavior was put back in
place. I notice though that even up-to-date Linux has problematic
behavior around GNTTABOP_setup_table - the call is followed (after an
explicit -ENOSYS check) by "BUG_ON(rc || setup.status)". The amount of
memory needed here (including the status table) is potentially far
higher than for set_version. And what's important: setup_table gets
invoked only after set_version, so any table expansion would happen
here, with - if any table growing is needed at all - a far higher risk
for failure.

This ordering of operations (set_version before setup_table) as well
as the "error checking" after setup_table was also in effect up to
3.13. Therefore the same conclusion can be drawn there: The main risk
for crashing the guest due to memory shortage in Xen is there, not
with the version switch. What you've observed with XSA-226 (or rather,
I assume, with a custom extension of yours at the time, to prohibit use
of v2, which was upstreamed only later) was entirely unrelated to memory
shortage, but was instead a result of v2 suddenly becoming unavailable
altogether.

As to Windows, in the pvdrivers/win/ git repos I haven't been able to
find any use of GrantTableSetVersion(). Of course I can't exclude
other versions or other driver variants making use of set_version in an
inappropriate way. But as long as they don't grow the number of grant
table entries before such a call, the main risk of memory allocation
failure would again be with other hypercalls.

Jan

