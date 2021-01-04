Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4C2E9A1B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61337.107837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSQd-0001lW-5l; Mon, 04 Jan 2021 16:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61337.107837; Mon, 04 Jan 2021 16:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSQd-0001l7-2n; Mon, 04 Jan 2021 16:09:55 +0000
Received: by outflank-mailman (input) for mailman id 61337;
 Mon, 04 Jan 2021 16:09:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwSQb-0001l2-CB
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:09:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d41ef622-c9db-40ea-9579-da635d29a6a9;
 Mon, 04 Jan 2021 16:09:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B1E7AD6A;
 Mon,  4 Jan 2021 16:09:50 +0000 (UTC)
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
X-Inumbo-ID: d41ef622-c9db-40ea-9579-da635d29a6a9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609776590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WO91PKyDYcXiiqq4FrFWzQpV1WW48nkuGtOsUw4j7Jw=;
	b=Pv474iGbDpBTvNeuYQEWmrnoBJ9SF+Tori033Ztof1G3KfMFmTb+pUZ0BIUGOk+enrN96Z
	LKcfnLRxGQIvz9BpCdeaY9rPdK+x+7zgQHkKzrPfr/cf9oaMjOfQtTYR78H//FhlbHi+Ht
	5OeToYmoK9O1PwuoEHC9QtYxDgpN8Rk=
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
 <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
 <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
 <20210104145640.dmufekd2qb5gemud@Air-de-Roger>
 <c4397698-d93f-ca64-34cc-8b7f3f76e3bf@suse.com>
 <20210104154507.teikuuhyqr7kk3td@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4440f81c-f2c7-bd2f-f7a7-d3aa8d248435@suse.com>
Date: Mon, 4 Jan 2021 17:09:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104154507.teikuuhyqr7kk3td@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.01.2021 16:45, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 04:16:18PM +0100, Jan Beulich wrote:
>> On 04.01.2021 15:56, Roger Pau Monné wrote:
>>> On Mon, Jan 04, 2021 at 02:43:52PM +0100, Jan Beulich wrote:
>>>> On 28.12.2020 11:54, Roger Pau Monné wrote:
>>>>> On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
>>>>>> Now that the IOMMU for guests can't be enabled "on demand" anymore,
>>>>>> there's also no reason to expose the related CPUID bit "just in case".
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> I'm not sure this is helpful from a guest PoV.
>>>>>
>>>>> How does the guest know whether it has pass through devices, and thus
>>>>> whether it needs to check if this flag is present or not in order to
>>>>> safely pass foreign mapped pages (or grants) to the underlying devices?
>>>>>
>>>>> Ie: prior to this change I would just check whether the flag is
>>>>> present in CPUID to know whether FreeBSD needs to use a bounce buffer
>>>>> in blkback and netback when running as a domU. If this is now
>>>>> conditionally set only when the IOMMU is enabled for the guest I
>>>>> also need to figure a way to know whether the domU has any passed
>>>>> through device or not, which doesn't seem trivial.
>>>>
>>>> I'm afraid I don't understand your concern and/or description of
>>>> the scenario. Prior to the change, the bit was set unconditionally.
>>>> To me, _that_ was making the bit useless - no point in checking
>>>> something which is always set anyway (leaving aside old Xen
>>>> versions).
>>>
>>> This bit was used to differentiate between versions of Xen that don't
>>> create IOMMU mappings for grants/foreign maps (and so are broken) vs
>>> versions of Xen that do create such mappings. If the bit is not set
>>> HVM domains need a bounce buffer in blkback/netback in order to avoid
>>> sending grants to devices.
>>
>> Neither the comment in cpuid.h nor that in traps.c have any mention
>> of this, and the constant's name also doesn't imply such.
>>
>>> Now it's my understand that with this change sometimes the bit might
>>> not be set not because we are running on an unfixed Xen version, but
>>> because there's no IOMMU assigned to the domain, so the guest will
>>> fallback to use a bounce buffer.
>>
>> ... if it expects to ever map a foreign domain's pages.
>>
>> I can see that reverting the change is one way to address the issue.
>> Such a revert shouldn't be a plain one then, but one adjusting one
>> or both of the the comments to indicate the _real_ purpose of this
>> flag. (We probably better don't rename the constant, as we can't
>> easily drop the old name from the public interface anyway.)
> 
> I'm happy to send the revert, but do you have any suggestion about the
> fixed comments?
> 
> Maybe adding something like:
> 
> /*
>  * Unditionally set the flag to notice this version of Xen has been
>  * fixed to create IOMMU mappings for grant/foreign maps.
>  */

Sounds reasonable. I assume you mean "Unconditionally". And my
English isn't sufficient to tell whether "notice" is suitable
here; I would have used e.g. "indicate".

Jan

