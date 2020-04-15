Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D551A9AAE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfN6-0003CP-8Z; Wed, 15 Apr 2020 10:34:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOfN4-0003CK-IH
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:34:18 +0000
X-Inumbo-ID: a830e04a-7f04-11ea-8a2b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a830e04a-7f04-11ea-8a2b-12813bfff9fa;
 Wed, 15 Apr 2020 10:34:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55CC2AC69;
 Wed, 15 Apr 2020 10:34:15 +0000 (UTC)
Subject: Re: [PATCH 1/2] x86: drop unnecessary page table walking in compat
 r/o M2P handling
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
 <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
 <aba418d9b5d8832a2331c3164dc1a9fa1653f6be.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <013b0d15-6901-bb87-6b0d-9233f9bf50e6@suse.com>
Date: Wed, 15 Apr 2020 12:34:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aba418d9b5d8832a2331c3164dc1a9fa1653f6be.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 11:59, Hongyan Xia wrote:
> On Wed, 2020-04-15 at 10:23 +0200, Jan Beulich wrote:
>> @@ -627,16 +612,10 @@ void __init paging_init(void)
>>  #undef MFN
>>  
>>      /* Create user-accessible L2 directory to map the MPT for compat
>> guests. */
>> -    BUILD_BUG_ON(l4_table_offset(RDWR_MPT_VIRT_START) !=
>> -                 l4_table_offset(HIRO_COMPAT_MPT_VIRT_START));
>> -    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(
>> -        HIRO_COMPAT_MPT_VIRT_START)]);
>>      if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
>>          goto nomem;
>>      compat_idle_pg_table_l2 = l2_ro_mpt;
>>      clear_page(l2_ro_mpt);
>> -    l3e_write(&l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)
>> ],
>> -              l3e_from_paddr(__pa(l2_ro_mpt),
>> __PAGE_HYPERVISOR_RO));
>>      l2_ro_mpt += l2_table_offset(HIRO_COMPAT_MPT_VIRT_START);
>>      /* Allocate and map the compatibility mode machine-to-phys
>> table. */
>>      mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
> 
> The code around here, I am wondering if there is a reason to put it in
> this patch. If we bisect, we can end up in a commit which says the
> address range of compat is still there in config.h, but actually it's
> gone, so this probably belongs to the 2nd patch.

I could be done either way, I guess. Note though how patch 2's
description starts with "Now that we don't properly hook things
up into the page tables anymore". I.e. after this patch the
address range continues to exist solely for calculation purposes.

> Apart from that,
> Reviewed-by: Hongyan Xia <hongyxia@amazon.com>

Thanks.

> I would like to drop relevant map/unmap patches and replace them with
> the new clean-up ones (and place them at the beginning of the series),
> if there is no objection with that.

Depending on turnaround, I'd much rather see this go in before
you re-post. But if you feel like making it part of your series,
go ahead.

Jan

