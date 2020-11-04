Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0B2A6E41
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 20:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19528.44716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaOeZ-0000h7-Rb; Wed, 04 Nov 2020 19:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19528.44716; Wed, 04 Nov 2020 19:41:07 +0000
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
	id 1kaOeZ-0000gi-OH; Wed, 04 Nov 2020 19:41:07 +0000
Received: by outflank-mailman (input) for mailman id 19528;
 Wed, 04 Nov 2020 19:41:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaOeY-0000gd-Sx
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 19:41:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd4b88c-0e62-4d4a-8568-e6f11f89ba39;
 Wed, 04 Nov 2020 19:41:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaOeW-0005ll-MU; Wed, 04 Nov 2020 19:41:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaOeW-000869-FI; Wed, 04 Nov 2020 19:41:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaOeY-0000gd-Sx
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 19:41:06 +0000
X-Inumbo-ID: 0cd4b88c-0e62-4d4a-8568-e6f11f89ba39
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0cd4b88c-0e62-4d4a-8568-e6f11f89ba39;
	Wed, 04 Nov 2020 19:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vL2jdxn2WGUUZZ4WMBAgRTtVtQ6fVJOgQBbI3gv4Chc=; b=TtN5PqqLpMcM3siW711OznqaB6
	chs0gqFz1gMZdrvsboAdDl2KP+jmqtgUHXpQKI+leFtmJoQOkXICRdEHQOY2Mbw9EgL1bCl+A7lWU
	OQQP2Lzk7JV9XAmSPLef388oo271JuoUfvVc/tgN+YXr8Bw2iMchd8vqsZgN2Kbz507c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaOeW-0005ll-MU; Wed, 04 Nov 2020 19:41:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaOeW-000869-FI; Wed, 04 Nov 2020 19:41:04 +0000
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
 <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org>
 <alpine.DEB.2.21.2010230944090.12247@sstabellini-ThinkPad-T480s>
 <bf3b65d2-2642-f1f6-39f1-2f88433e9901@xen.org>
 <20201104190304.GB1647@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <18d349b9-59b7-0acc-bff7-d29b7e40ac44@xen.org>
Date: Wed, 4 Nov 2020 19:41:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104190304.GB1647@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 04/11/2020 19:03, Elliott Mitchell wrote:
> On Mon, Oct 26, 2020 at 09:19:49AM +0000, Julien Grall wrote:
>> On 23/10/2020 17:57, Stefano Stabellini wrote:
>>> On Fri, 23 Oct 2020, Julien Grall wrote:
> 
>>>> I am sort of okay to remove EXPERT.
>>>
>>> OK. This would help (even without building it by default) because as you
>>> go and look at the menu the first time, you'll find ACPI among the
>>> options right away.
>>
>> To be honest, this step is probably the easiest in the full process to
>> get Xen build and booted on Arm.
>>
>> I briefly looked at Elliot's v2, and I can't keep thinking that we are
>> trying to re-invent EXPERT for ACPI because we think the feature is
>> *more* important than any other feature gated by EXPERT.
> 
> Yet might that statement in fact be true?

Everyone has a different opinion on what's important or not. I am sure 
we can spend hours bikeshedding on that...

> 
> Most of the features currently controlled by CONFIG_EXPERT are relatively
> small tweaks which enable less often used features.  Some of those are
> very high value in certain environments, but they're unimportant in
> common environments.  Changing the scheduler might get you an extra
> 10-50% performance improvement in a special environment.
> 
> ACPI support isn't like this.  I'm unaware what Masami Hiramatsu's system
> does if a CONFIG_ACPI=n Xen build is tried.  I haven't actually tried
> such a build on mine, but from the code it looks like Xen would panic if
> built that way.  No output of any sort.  Simply panic with the device
> appearing to go inert.
There will always be cases where the console is not working:
   1) There is no driver in Xen
   2) There is no SPCR table present

I think you are in the second situation and you had to enable 
earlyprintk. Is that correct?

>> In fact, all the features behind EXPERT are important. But they have
>> been gated by EXPERT because they are not mature enough.
> 
>> But I don't think ACPI is mature enough to deserve a different
>> treatment. It would be more useful to get to the stage where ACPI can
>> work without any crash/issue first.
> 
> The difference is the severity of failure if the option is off, but needs
> to be on.  Most CONFIG_EXPERT options will merely be performance
> reductions or security situations unacceptable to some users.
> CONFIG_ACPI=n on the wrong system could be a panic with *no* output. >
> 
> Tainting sounds reasonable.  Messages in `dmesg` make sense.  A message
> plus 10 second pause on boot seems reasonable.  I think if CONFIG_ACPI is
> off, there should be code to try to detect ACPI and emit a warning if
> anything is detected.

All of this would be moot if we focus on getting ACPI (or just a subset) 
working on a few platforms (e.g. RPI, Thunder-X).

I don't think we are too far from this acheviement. This would be IMHO 
be enough to move ACPI one way up in the support "ladder". We might even 
be able to do this for 4.15.

Cheers,

-- 
Julien Grall

