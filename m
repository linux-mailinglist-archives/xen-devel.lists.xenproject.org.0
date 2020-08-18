Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C124C248092
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7wxd-0000fZ-3v; Tue, 18 Aug 2020 08:27:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7wxb-0000fS-Ew
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:27:11 +0000
X-Inumbo-ID: ab330059-fa65-48f5-9680-c182fb05012f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab330059-fa65-48f5-9680-c182fb05012f;
 Tue, 18 Aug 2020 08:27:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E65BAC92;
 Tue, 18 Aug 2020 08:27:32 +0000 (UTC)
Subject: Re: [PATCH v4 12/14] vtd: use a bit field for root_entry
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-13-paul@xen.org>
 <71e1a4a9-eac0-5aae-f2d5-fa33ca8b6036@suse.com>
 <c50aa58c4d774caf911fbf08837d11a8@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59e61c90-c0ff-60f1-1f1d-52ebde647319@suse.com>
Date: Tue, 18 Aug 2020 10:27:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c50aa58c4d774caf911fbf08837d11a8@EX13D32EUC003.ant.amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.08.2020 15:13, Durrant, Paul wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 06 August 2020 13:34
>>
>> On 04.08.2020 15:42, Paul Durrant wrote:
>>> --- a/xen/drivers/passthrough/vtd/iommu.h
>>> +++ b/xen/drivers/passthrough/vtd/iommu.h
>>> @@ -184,21 +184,28 @@
>>>  #define dma_frcd_source_id(c) (c & 0xffff)
>>>  #define dma_frcd_page_addr(d) (d & (((u64)-1) << 12)) /* low 64 bit */
>>>
>>> -/*
>>> - * 0: Present
>>> - * 1-11: Reserved
>>> - * 12-63: Context Ptr (12 - (haw-1))
>>> - * 64-127: Reserved
>>> - */
>>>  struct root_entry {
>>> -    u64    val;
>>> -    u64    rsvd1;
>>> +    union {
>>> +        __uint128_t val;
>>
>> I couldn't find a use of this field, and I also can't foresee any.
>> Could it be left out?
> 
> Yes, probably.
> 
>>
>>> +        struct { uint64_t lo, hi; };
>>> +        struct {
>>> +            /* 0 - 63 */
>>> +            uint64_t p:1;
>>
>> bool?
>>
> 
> I'd prefer not to. One of the points of using a bit field (at least from my PoV) is that it makes referring back to the spec. much easier, by using uint64_t types consistently and hence using bit widths that can be straightforwardly summed to give the bit offsets stated in the spec.

We've gone the suggested route for earlier struct conversions on
the AMD side, so I think we should follow suit here. See e.g.
struct amd_iommu_dte or union amd_iommu_control.

>>> --- a/xen/drivers/passthrough/vtd/x86/ats.c
>>> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
>>> @@ -74,8 +74,8 @@ int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
>>>  static bool device_in_domain(const struct vtd_iommu *iommu,
>>>                               const struct pci_dev *pdev, uint16_t did)
>>>  {
>>> -    struct root_entry *root_entry;
>>> -    struct context_entry *ctxt_entry = NULL;
>>> +    struct root_entry *root_entry, *root_entries = NULL;
>>> +    struct context_entry *context_entry, *context_entries = NULL;
>>
>> Just like root_entry, root_entries doesn't look to need an initializer.
>> I'm unconvinced anyway that you now need two variables each:
>> unmap_vtd_domain_page() does quite fine with the low 12 bits not all
>> being zero, afaict.
> 
> Not passing a page aligned address into something that unmaps a page seems a little bit fragile though, e.g. if someone happened to add a check in future.

There are quite a few existing callers passing a not-page-aligned
address into unmap_domain_page(). I don't see why having one more
instance would cause any kind of issue.

Jan

