Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81507292A4C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 17:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8743.23463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUX03-0007rX-Nl; Mon, 19 Oct 2020 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8743.23463; Mon, 19 Oct 2020 15:23:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUX03-0007r8-Kd; Mon, 19 Oct 2020 15:23:03 +0000
Received: by outflank-mailman (input) for mailman id 8743;
 Mon, 19 Oct 2020 15:23:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUX02-0007r3-O4
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:23:02 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78771f21-7380-4f52-9d43-fda1e4067b16;
 Mon, 19 Oct 2020 15:23:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUX02-0007r3-O4
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:23:02 +0000
X-Inumbo-ID: 78771f21-7380-4f52-9d43-fda1e4067b16
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 78771f21-7380-4f52-9d43-fda1e4067b16;
	Mon, 19 Oct 2020 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603120980;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=R11Xod3XK+6Hs4DEahgUgiVyeSCOxOG/2tTH0iJS3is=;
  b=ZKXyNiYLeh5sISGgMWm/HkbIXVlDHW5OXOAT2oGbnlLSm1Iri6rQSrmF
   I6gRZffp5Y4o4HelOJbmVLW77ALLYK1PA1cRMfz7XjZICkDDbwE+LMIeO
   pACWaJcTuB5z1752DI+7QmRjEWdEzjb9vByONAKRiGuOZMbkvrJJV+4r0
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rW5d9cAXVkVUmWSfYS9Q90kGhpwTbSh46fca+7PQKdiRboF5luMIGifyTUo2QhVVwhKOBoD5RZ
 qLiVNoKZJ2bdbFnBTlvBY0GzZssHEaCyXum/5xdHYxPf12hdbVHcFtXfL6TOt7nbpPBa3pje2N
 nMrGu5o2IyJEY4rKuaNIfTqdiTMg6aCDkaXb0HW96zqiRbISlGIoPqJ+AQertp+pridls5+n3F
 OrRyiekNyMayOKcE2xUo9K73gknnlzL4/aqIGL9K5b/3jZN7ZMl7gKmm6cBnEupHcr7X0cGYMS
 Mpc=
X-SBRS: None
X-MesageID: 29555130
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,394,1596513600"; 
   d="scan'208";a="29555130"
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
 <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
 <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
 <6af1bbb6-d717-affa-6409-2b983e48ed30@citrix.com>
 <59f3e399-8676-bb44-ec85-500583f97b2f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <23d02e3b-7dac-ceb8-ebdd-3b77f264d6b4@citrix.com>
Date: Mon, 19 Oct 2020 16:22:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <59f3e399-8676-bb44-ec85-500583f97b2f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 19/10/2020 16:02, Jan Beulich wrote:
> On 19.10.2020 16:30, Andrew Cooper wrote:
>> On 19/10/2020 15:21, Jan Beulich wrote:
>>> On 19.10.2020 16:10, Andrew Cooper wrote:
>>>> On 19/10/2020 14:40, Jan Beulich wrote:
>>>>> Of the state saved by the insn and reloaded by the corresponding VMLOAD
>>>>> - TR, syscall, and sysenter state are invariant while having Xen's state
>>>>>   loaded,
>>>>> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>>>>>   context switch code.
>>>> I think it would be helpful to state that Xen's state is suitably cached
>>>> in _svm_cpu_up(), as this does now introduce an ordering dependency
>>>> during boot.
>>> I've added a sentence.
>>>
>>>> Is it possibly worth putting an assert checking the TR selector?  That
>>>> ought to be good enough to catch stray init reordering problems.
>>> How would checking just the TR selector help? If other pieces of TR
>>> or syscall/sysenter were out of sync, we'd be hosed, too.
>> They're far less likely to move relative to tr, than everything relative
>> to hvm_up().
>>
>>> I'm also not sure what exactly you mean to do for such an assertion:
>>> Merely check the host VMCB field against TSS_SELECTOR, or do an
>>> actual STR to be closer to what the VMSAVE actually did?
>> ASSERT(str() == TSS_SELECTOR);
> Oh, that's odd. How would this help with the VMCB?

It wont.

We're not checking the behaviour of the VMSAVE instruction.  We just
want to sanity check that %tr is already configured.

This version is far more simple than checking VMCB.trsel, which will
require a map_domain_page().

~Andrew

