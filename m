Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867F1B2919
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 16:10:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQtao-0001iS-Su; Tue, 21 Apr 2020 14:09:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQtao-0001iN-59
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 14:09:42 +0000
X-Inumbo-ID: be4548a6-83d9-11ea-9147-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be4548a6-83d9-11ea-9147-12813bfff9fa;
 Tue, 21 Apr 2020 14:09:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E07F4AC46;
 Tue, 21 Apr 2020 14:09:39 +0000 (UTC)
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <80288e76-aff6-61d5-71aa-ae7c8e9d9a65@suse.com>
 <20200421104335.GU28601@Air-de-Roger>
 <21abc8e6-5665-9d6f-395f-6e4eb8bf2e58@suse.com>
 <20200421135144.GV28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38804079-7363-4098-88dd-b37e039498b5@suse.com>
Date: Tue, 21 Apr 2020 16:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421135144.GV28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.04.2020 15:51, Roger Pau Monné wrote:
> On Tue, Apr 21, 2020 at 02:59:10PM +0200, Jan Beulich wrote:
>> On 21.04.2020 12:43, Roger Pau Monné wrote:
>>> On Tue, Apr 21, 2020 at 12:21:12PM +0200, Jan Beulich wrote:
>>>> On 16.04.2020 15:59, Roger Pau Monne wrote:
>>>>> Introduce a specific flag to request a HVM guest linear TLB flush,
>>>>> which is an ASID/VPID tickle that forces a guest linear to guest
>>>>> physical TLB flush for all HVM guests.
>>>>>
>>>>> This was previously unconditionally done in each pre_flush call, but
>>>>> that's not required: HVM guests not using shadow don't require linear
>>>>> TLB flushes as Xen doesn't modify the guest page tables in that case
>>>>> (ie: when using HAP).
>>>>
>>>> I'm afraid I'm being confused by this: Even in shadow mode Xen
>>>> doesn't modify guest page tables, does it?
>>>
>>> I'm also confused now. It's my understand that when running in shadow
>>> mode guest page tables are not actually used, and the guest uses Xen's
>>> crafted shadow tables instead, which are based on the original guest
>>> page tables suitably adjusted by Xen in order to do the p2m
>>> translation in the HVM case, or the needed PTE adjustments in the PV
>>> case.
>>>
>>> So guest page tables are not modified, but are also not used as they
>>> are never loaded into cr3.
>>
>> This matches my understanding.
> 
> Please bear with me, as I'm not sure if your question was because you
> think the paragraph is not clear and/or should be expanded.
> 
> The point of the paragraph you mention was to have a difference
> between guests running in shadow mode vs guests running in HAP mode.
> Maybe I should use guest loaded page pages, to differentiate between
> guest created page tables and the page tables actually loaded in cr3
> in guest mode?

How about using "the pages tables the guest runs on"?

Jan

