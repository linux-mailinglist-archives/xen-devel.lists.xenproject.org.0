Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB732E983C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61301.107741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRaf-0004Qx-2t; Mon, 04 Jan 2021 15:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61301.107741; Mon, 04 Jan 2021 15:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRae-0004QY-VU; Mon, 04 Jan 2021 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 61301;
 Mon, 04 Jan 2021 15:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwRad-0004QT-HE
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:16:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48af24d1-3b7b-4275-9f32-c303148b50d6;
 Mon, 04 Jan 2021 15:16:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2710ACAF;
 Mon,  4 Jan 2021 15:16:09 +0000 (UTC)
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
X-Inumbo-ID: 48af24d1-3b7b-4275-9f32-c303148b50d6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609773369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp7EZoRCCBiFAmZ+Zenm9VGPJhdZGGMX71BhFLDUiJM=;
	b=d7dIdwV7gX+Q7ANLGf3pjo+FUlsdEwpvFIZdiOKDcYl3HiI87q/WrrlKzEyCFDuTW8Jxx5
	5aFqW9+vHl3LH05t1w7H87dmJ4h9ZA3fdO3+yFP+pXnjcokkeTdCA03IYLgDwqae0q04X5
	nRDdgFuCoos3u4B72d3JMkH6uBPryMM=
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
 <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
 <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
 <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c4397698-d93f-ca64-34cc-8b7f3f76e3bf@suse.com>
Date: Mon, 4 Jan 2021 16:16:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.01.2021 15:56, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 02:43:52PM +0100, Jan Beulich wrote:
>> On 28.12.2020 11:54, Roger Pau Monné wrote:
>>> On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
>>>> Now that the IOMMU for guests can't be enabled "on demand" anymore,
>>>> there's also no reason to expose the related CPUID bit "just in case".
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I'm not sure this is helpful from a guest PoV.
>>>
>>> How does the guest know whether it has pass through devices, and thus
>>> whether it needs to check if this flag is present or not in order to
>>> safely pass foreign mapped pages (or grants) to the underlying devices?
>>>
>>> Ie: prior to this change I would just check whether the flag is
>>> present in CPUID to know whether FreeBSD needs to use a bounce buffer
>>> in blkback and netback when running as a domU. If this is now
>>> conditionally set only when the IOMMU is enabled for the guest I
>>> also need to figure a way to know whether the domU has any passed
>>> through device or not, which doesn't seem trivial.
>>
>> I'm afraid I don't understand your concern and/or description of
>> the scenario. Prior to the change, the bit was set unconditionally.
>> To me, _that_ was making the bit useless - no point in checking
>> something which is always set anyway (leaving aside old Xen
>> versions).
> 
> This bit was used to differentiate between versions of Xen that don't
> create IOMMU mappings for grants/foreign maps (and so are broken) vs
> versions of Xen that do create such mappings. If the bit is not set
> HVM domains need a bounce buffer in blkback/netback in order to avoid
> sending grants to devices.

Neither the comment in cpuid.h nor that in traps.c have any mention
of this, and the constant's name also doesn't imply such.

> Now it's my understand that with this change sometimes the bit might
> not be set not because we are running on an unfixed Xen version, but
> because there's no IOMMU assigned to the domain, so the guest will
> fallback to use a bounce buffer.

... if it expects to ever map a foreign domain's pages.

I can see that reverting the change is one way to address the issue.
Such a revert shouldn't be a plain one then, but one adjusting one
or both of the the comments to indicate the _real_ purpose of this
flag. (We probably better don't rename the constant, as we can't
easily drop the old name from the public interface anyway.)

This said, I wonder though what the scenario is where the difference
matters: Dom0 will get the IOMMU enabled whenever Xen has it
enabled. And I'm not sure how useful a driver domain would be
without passed through device(s), implying an enabled IOMMU. IOW I'm
not really certain there's any change in behavior for any sensible
setup (and hence there wouldn't be any need to extend any logic, to
e.g. figure out whether there are passed through devices). (Yes, a
backend could sit on top of another frontend, acting in a proxy-like
fashion. In this case the double buffering would indeed be
unnecessary.)

Jan

