Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA338274E
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 10:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128112.240574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liYqf-0000lj-9b; Mon, 17 May 2021 08:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128112.240574; Mon, 17 May 2021 08:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liYqf-0000js-6E; Mon, 17 May 2021 08:43:37 +0000
Received: by outflank-mailman (input) for mailman id 128112;
 Mon, 17 May 2021 08:43:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liYqe-0000jl-BX
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 08:43:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5898dc21-1079-4a96-8941-46827d273861;
 Mon, 17 May 2021 08:43:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED1FEAF0E;
 Mon, 17 May 2021 08:43:32 +0000 (UTC)
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
X-Inumbo-ID: 5898dc21-1079-4a96-8941-46827d273861
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621241013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aIUSYbFhtCQA3XTRYSu8x2xKo88VfWD2v5wur0/1FQs=;
	b=Z63+bmFglkWq6CbeWJmy4rltlpG1mPkn36fT72mHCcnAKY2BDDHt4HkXdbIG7ospb0KmsU
	wGToXFWMKazNnh2UfeN9GAZYsVllcXH7Z+0YzVylDDQeLxyGhtgXEdRuSacZubZP7dWXlp
	fN51papuLHRxbVWlSFhWg18Za8yhlPA=
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8fae962-1a5b-cc91-d429-a716b009f062@suse.com>
Date: Mon, 17 May 2021 10:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.05.2021 22:15, Andrew Cooper wrote:
> On 13/05/2021 04:56, osstest service owner wrote:
>> Tests which are failing intermittently (not blocking):
>>  test-xtf-amd64-amd64-3 92 xtf/test-pv32pae-xsa-286 fail in 161909 pass in 161917
> 
> While noticing the ARM issue above, I also spotted this one by chance. 
> There are two issues.
> 
> First, I have reverted bed7e6cad30 and edcfce55917.  The XTF test is
> correct, and they really do reintroduce XSA-286.  It is a miracle of
> timing that we don't need an XSA/CVE against Xen 4.15.

I have to admit that from the description in the revert (on top of
what you say here) it does not really become clear to me what is
wrong with _either_ of these changes:

"The TLB flushing is for Xen's correctness, not the guest's."

XSA-286 was solely about guest correctness, which was broken by Xen's
behavior. Hence we're still only talking about guest observable
behavior here.

"The text in c/s bed7e6cad30 is technically correct, from the guests
 point of view, but clearly false as far as XSA-286 is concerned."

As a result I also don't understand this, nor the actual reason why
you did revert both, rather than just ...

"That said, it is edcfce55917 which introduced the regression, which
 demonstrates that the reasoning is flawed."

... this. Furthermore you merely state an observation here, without
going into any detail as to what's wrong with the reasoning, and
hence why it is the change that's wrong and the test that's correct
(and no issue elsewhere). Don't get me wrong - I'm not excluding
you're right, but you fail to explain things properly. I can't see
how avoiding a flush for a page table which isn't hooked up anywhere
(and which hence isn't accessible via lookups through the linear
page tables) can have caused a problem (except perhaps uncover an
issue, e.g. a missing flush, elsewhere). Nor can I see how the XTF
test would trigger the flush avoidance, as it doesn't play with
free floating page tables. Plus this change affects 64-bit guests
as much as 32-bit ones, yet no (apparent) regression could be seen
there.

Similarly for the other change: Since only guest perspective matters,
the flush ought to be fine to defer until the guest actually reloads
CR3; until then using either the stale or updated linear page tables
is acceptable, and guests need to not rely on either, just like would
be the case on bare metal (and there it's even stronger: an OS can
rely upon the prior page tables to continue to be used, as the PDPTEs
get reloaded _only_ during CR3 loads; mimicking this for PV would be
not exactly trivial, I think). And I notice that the XTF test
exercises an L3 entry update without a subsequent CR3 write, which
is wrong for PAE. (I therefore suspect it is bed7e6cad30 which has
caused the test failure, not edcfce55917 as you have said in the
description of the revert.)

> Given that I was unhappy with the changes in the first place, I don't
> particularly want to see an attempt to resurrect them.  I did not find
> the claim that they were a perf improvement in the first place very
> convincing, and the XTF test demonstrates that the reasoning about their
> safety was incorrect.

Interesting: Where did you voice your unhappiness? All I can find on
that entire series' thread is a reply of yours on a post-commit-
message remark regarding a comment you had introduced with the 286
fix. All other discussion there was between Roger and me.

Additionally I don't see why you treated this as an emergency and
reverted without posting a patch and getting an ack.

> Second, the unexplained OSSTest behaviour.
> 
> When I repro'd this on pinot1, test-pv32pae-xsa-286 failing was totally
> deterministic and repeatable (I tried 100 times because the test is a
> fraction of a second).
> 
> From the log trawling which Ian already did, the first recorded failure
> was flight 160912 on April 11th.  All failures (12, but this number is a
> few flights old now) were on pinot*.
> 
> What would be interesting to see is whether there have been any passes
> on pinot since 160912.
> 
> I can't see any reason why the test would be reliable for me, but
> unreliable for OSSTest, so I'm wondering whether it is actually
> reliable, and something is wrong with the stickiness heuristic.

Isn't (un)reliability of this test, besides the sensitivity to IRQs
and context switches, tied to hardware behavior, in particular TLB
capacity and replacement policy? Aiui the test has

    xtf_success("Success: Probably not vulnerable to XSA-286\n");

for the combination of all of these reasons.

Jan

