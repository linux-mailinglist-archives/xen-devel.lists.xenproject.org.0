Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724F318948
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 12:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83836.156986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAA3Z-0001D1-15; Thu, 11 Feb 2021 11:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83836.156986; Thu, 11 Feb 2021 11:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAA3Y-0001Cc-Ti; Thu, 11 Feb 2021 11:22:44 +0000
Received: by outflank-mailman (input) for mailman id 83836;
 Thu, 11 Feb 2021 11:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cmTu=HN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAA3X-0001CU-Pm
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 11:22:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98e222ea-dca3-453b-b540-9ec105d147fe;
 Thu, 11 Feb 2021 11:22:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21D61AF11;
 Thu, 11 Feb 2021 11:22:42 +0000 (UTC)
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
X-Inumbo-ID: 98e222ea-dca3-453b-b540-9ec105d147fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613042562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V84uKexLP9S8zctgfRDW7psP9BSdmxXryN/tHgedQaU=;
	b=UTbTIGmlAAzJeETtCPGDXgFh9WLJC3ElTpVDt/YVJTrGTE1prTTSK08GJ4TNcbJXeXkuJc
	+dYuFOMNmlI3tyEQbLmNudDcvEOm15MsYGkfxdu5EC4Uj2Sn7R05LBgqF5Bg6AJ7UWFaP0
	XfnltV2Bk4sKR3l/f2/mdthPbVbAaVg=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
 <YCUSDSYpS5X+AZco@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <547b40f2-3b7b-10cb-30f6-9445c784eb0b@suse.com>
Date: Thu, 11 Feb 2021 12:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCUSDSYpS5X+AZco@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.02.2021 12:16, Roger Pau Monné wrote:
> On Thu, Feb 11, 2021 at 11:36:59AM +0100, Jan Beulich wrote:
>> On 11.02.2021 09:45, Roger Pau Monné wrote:
>>> On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
>>>> --- a/xen/include/asm-x86/p2m.h
>>>> +++ b/xen/include/asm-x86/p2m.h
>>>> @@ -935,6 +935,9 @@ static inline unsigned int p2m_get_iommu
>>>>          flags = IOMMUF_readable;
>>>>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
>>>>              flags |= IOMMUF_writable;
>>>> +        /* VMX'es APIC access page is global and hence has no owner. */
>>>> +        if ( mfn_valid(mfn) && !page_get_owner(mfn_to_page(mfn)) )
>>>> +            flags = 0;
>>>
>>> Is it fine to have this page accessible to devices if the page tables
>>> are shared between the CPU and the IOMMU?
>>
>> No, it's not, but what do you do? As said elsewhere, devices
>> gaining more access than is helpful is the price we pay for
>> being able to share page tables. But ...
> 
> I'm concerned about allowing devices to write to this shared page, as
> could be used as an unintended way to exchange information between
> domains?

Well, such an abuse would be possible, but it wouldn't be part
of an ABI and hence could break at any time. Similarly I
wouldn't consider it an information leak if a guest abused
this.

>>> Is it possible for devices to write to it?
>>
>> ... thinking about it - they would be able to access it only
>> when interrupt remapping is off. Otherwise the entire range
>> 0xFEExxxxx gets treated differently altogether by the IOMMU,
> 
> Now that I think of it, the range 0xFEExxxxx must always be special
> handled for device accesses, regardless of whether interrupt remapping
> is enabled or not, or else they won't be capable of delivering MSI
> messages?

I don't think I know how exactly chipsets handle MSI in this
case, but yes, presumably these accesses need to be routed a
different path even in that case.

> So I assume that whatever gets mapped in the IOMMU pages tables at
> 0xFEExxxxx simply gets ignored?

This would be the implication, aiui.

> Or else mapping the lapic access page when using shared page tables
> would have prevented CPU#0 from receiving MSI messages.

I guess I don't understand this part. In particular I see
nothing CPU#0 specific here.

Jan

