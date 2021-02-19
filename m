Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B531FFBE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 21:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87080.164144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDCDW-0000qj-Fj; Fri, 19 Feb 2021 20:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87080.164144; Fri, 19 Feb 2021 20:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDCDW-0000qN-CN; Fri, 19 Feb 2021 20:17:34 +0000
Received: by outflank-mailman (input) for mailman id 87080;
 Fri, 19 Feb 2021 20:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Nbw=HV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lDCDU-0000qI-Nc
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 20:17:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceb98854-9864-40c1-9f31-728f45de155a;
 Fri, 19 Feb 2021 20:17:31 +0000 (UTC)
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
X-Inumbo-ID: ceb98854-9864-40c1-9f31-728f45de155a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613765851;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3nb53cQ4PWXD69FuwHnuTzl6UylkUtvoW95r9GrLf4Q=;
  b=AMAM7kzpttHiJ37y7ytpN8aHUlfaHLE8FDvXaPRfPBbZu+z/nF55r1tc
   OHPTjub/gI7zJjvDbH4LJOVP4TLizvCybv4XmN7BAZFS42AzXux3SWv/K
   xEFfWo6Ipr2W5OMYtJJuFC0whkshyzshiHfjZfSs2VRRF7PqtUTiki3ve
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 92RGrAAT3xB2WPHfPxUWVcYOQ3Tf6nDdVSClala0xhY14knOm86SUbMY4DWyZxW4FfxXLI8cst
 eLivrXFRp/+mqArP9p5l/YHcg07P5COwuKuOcn6ZPCyCfcepna+riH5+fAyyH5pu7vh/LSIHhn
 eoVgdXfME1oJzc+bW/LrTZTWE4OxGKO4c3f32e9k+EGWVSdqJUY6bkPW4eX5uleGl/LUNptRHH
 EW+1C5zd4H47WJ6D5fNDqDRaynTHSVMmo+HgVn3i2rO25I2vHfwk21/sLXHWlSjcaGgQytbj+x
 BHE=
X-SBRS: 5.2
X-MesageID: 37661278
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,191,1610427600"; 
   d="scan'208";a="37661278"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jr83w5uYvuF8Q68kD+WyD5T2q0KXJ8Jsbrwdxm1x5D/8uO66ZokcMsIEcAdtSiqzS83M5XzpnSVmdjWkQt1xiBDhNlNsqAdPUvHrtg7DA9IiR203aPXKdKkWgUAMYPm1WGC+8M9UhDurEl9/lDptspP4SA6i+NQIVqNPc/eiXut/kP8qRGeHnOqnfcHfW6wrn90+7H9dTtTUkKscDqzBY+k/u7Ew/9Q5GpoHSjSfXbB3MIJe5Vl7J7TDElAzCXQzSbso550Qlu78/SllPYnrMFuQp74Fp3kcWTPtQynZLjcA55a0rIPeviDr0VHpmJnbVQI2cjTb+H3OXuZKFR73iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nb53cQ4PWXD69FuwHnuTzl6UylkUtvoW95r9GrLf4Q=;
 b=AxL1IgA0DvEb51WSFmU1Whe3oAgZlU5mmINBKs9ILJa3EMYnvyUG3XQ6kvfGLPse9+49ye+OVq8pgTpedRGNtCAEdSwBQR6ibmUegbrj0Oq9cS73kpXrVvg2NvvEpfb8B6IjNeTwQAxqsnX0NxXq0+z3Luu0vjURuYGybdpExO1iNucsxv5rR8/+4pj0uLxCTCAM2QDQp2xtx1xkQWEHY2hTKpouPTL0Os+T5y3hj2Jet56VT2eoEMMJYemCfDw1jNetNGSCqLtIFnPXwFq5TAPjE6KDylgTwiBMgm0jgk2hxmCruDWswpyi+RnibujPLratffoSPvjNRVbe5ZByNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nb53cQ4PWXD69FuwHnuTzl6UylkUtvoW95r9GrLf4Q=;
 b=Cwb6CNrPm6kvPBmQLXMSAjbX7TRkTLQ8uwfQLuChoyP0e2vc4rx2koYIHIx8sPm0yW2MNOZMesYhKpzRe63Kxvel/3+oRX/g5OKzD+TYURXqMzkUHyRX/TKQlOBfavFQrTr+cH0URC3AEvjpdJIcNxav/rX94DStar6PPHIAc0s=
Subject: Re: How does shadow page table work during migration?
To: Kevin Negy <kevinnegy@gmail.com>, <xen-devel@lists.xenproject.org>
References: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <38cf0d39-da1d-5375-89dc-1668e26323a2@citrix.com>
Date: Fri, 19 Feb 2021 20:17:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbf2e09-2d05-444e-c27f-08d8d5135efd
X-MS-TrafficTypeDiagnostic: BYAPR03MB4872:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4872FF2D0A281F3AA1917C02BA849@BYAPR03MB4872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFGN29dc1xkTz2rtbPGBeeU4WNzqdGGmsQW1uQKwppMRlETWKfxNqSYyzeSdNf5YolXWMGV14gZ/cymOmQ4aosNZmA3lpKjdeSCvTGtOfeOEfJrqtvYLu181D0OpmJl4vw6WSzYP37R9AGKn4h8NzmxAl4Ch2X9+pmInwovuExWxdm5F4us4Flgfz5ixoqs/jF8v4l3Rn5X0L2INv3DMmwsuPA/cOHV1kKxT/wxblrJZWD3xqPgo2CzoJc5A/gLq13eGVLKOyyhIH+XnQOBI/oK1xz4q6PwrCfNWtyUHrXe0QpwPeMVhTF1SKMERo06QT073JBZaV/r18TZWlfOXcTo2krdtUq34cRkLsxDmjMagqxpahR+U5KUF7zfM3L3tUP5vugHlp8mOf44y3eGEbhI3oENS0FVDAmgY3gjp9jfqESHy2f6KRTiJX06BPJWJpbnrIESqQchN2DqfuZayeQDMKOHuPiJOH/iEg8biOtOi8I7Is7SkpcHZPBIW4vNU/ykDnzWRjrihA6okiPjk3v4BsyTqQWd2ebhSzDRAfpO38qsaiNKp6JddLPRZlqDNMGwMr3vHBnETYAdx0FJzNZh30C8mQz6j2/WohsyRNeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(478600001)(31686004)(26005)(2906002)(6486002)(8676002)(8936002)(5660300002)(316002)(31696002)(186003)(36756003)(16576012)(83380400001)(2616005)(956004)(66946007)(66476007)(16526019)(86362001)(66556008)(6666004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zk40d2JzSjRxc2FYVlBXclp5SlFVQzJkbVpDVWJJSU02RHE0YVVTbVZLWEZ0?=
 =?utf-8?B?a0hhMUJzMnBjeW9wMjkxUml5S08xR0c0YXZ1d1RsRmNHTXp2VnByL0hwQWFH?=
 =?utf-8?B?aXFUVkpuZldseFZFRS9wM1gxWGI5YklSa1djb3l3T1czUmdPTmJDa1BJUitu?=
 =?utf-8?B?QlRNdUxhdGw4cGI4clkzMFh2NG9Lc0tueU5mN252TjBVSVlKTTJnamg2ODBv?=
 =?utf-8?B?NDNINEptR1BqV3F5Q3VzRjRmY0JMWC83R1RTcDB3U0RFNW12b25JTHZ1UjE1?=
 =?utf-8?B?Q002Z1RMRjNBN0R5Q1kxNnlNYSs0NWkvUXJYN2czZzVaV3JUQW5VbVp1SjZm?=
 =?utf-8?B?TDlaNisxUHY5cWJSNjNLQXdCL0xqYUpuWHo0MHphdWNUY0hkWkZOaHY0VS9R?=
 =?utf-8?B?QWxlYXY1aVlkYVZwVHhLZU1teW1McmJYYmsyc1p3SktHeHVGTHFCYU5sQTRv?=
 =?utf-8?B?dkNWTm1nZW40NlpwVWtYL0xTL3ZTQVNZNWtiL21TY2tXbVNrMGhJdU00UzRl?=
 =?utf-8?B?VU5UTzZZODBCMGRvZURzV1grZUVvOHFzYlA1T0VGWEhnN1RKdjJ5YWZidmE2?=
 =?utf-8?B?SFRKUDlkWmlQdmZjNGsyRzAzc1NmNFJ2V2pxYnNyK3hqVVEyT2Z5L2tkc2Jn?=
 =?utf-8?B?M1U0dllydUpnQjRZVlI3VmJoVW5CRzV3MmhRV1ZBU2R0eVJJRUpYZHNheDRZ?=
 =?utf-8?B?N3pSYUUyT1VHMlM2Vlg0aFRnYU9WNzJCREhWT1B2M3lyd0tUMkJKNmFuM1lv?=
 =?utf-8?B?cWM4WUhDUE9TeGhxQ3d2dlZHRzUyNVo4MTg5QzZXQk83a0ZBQnM4NFNWdGYw?=
 =?utf-8?B?VCtvQWZraCtBLzNiL1NWL0MwTUF5eWs2Wm5lVnFYeC9Zd3dKRStUV0lGdDJ3?=
 =?utf-8?B?RVVldXN6bGFzay9pWS9YNTcwVFpKR3RIemNTM2N1eGU4QWJYallCY2pRbjZC?=
 =?utf-8?B?S25rcCt5WkVFZVlQQUZtS09ndHhiRUYyblRKVlNMbDZGMnBnTS9OQjRjNkdX?=
 =?utf-8?B?VGxTZ0ZSNGtDc3NjNUxuL3h2ai9aUGRHN29TOEt6QmZldTZQamYvSW5JMDVG?=
 =?utf-8?B?aEJidFJEOEZ2d0NjODRFamxTNm8wTG5EMitodWxXZVd0QThERzJaNVFocTJW?=
 =?utf-8?B?eWJaSGF3N3pjNzZ5bEJiaWorMnJUUjdRcVQvMUtZVFBLUitHYUdRYWl4WUVJ?=
 =?utf-8?B?eWlsTjZTMTBNZ1ZJN1NWOGY3UHJ1RENYajQ4VFpRcXcvdTRwVEp0ZEppNW8y?=
 =?utf-8?B?UlAydFZUYUovNmFQMm1FL1BBMU1XazBXbE1Xa2tjcWlJVHV4am1nQkNNM0pQ?=
 =?utf-8?B?SXhKVlkyVkkwOWxzbVlEMWRGNGxZeGJCSXozZUFJMjRNc05WOUpFdmZVOEZO?=
 =?utf-8?B?bDM5dWNpaFVRSFIxYmNtQzBkcXp6OGdPYk5JcW1PNis3VWF3L1EzeHhibW5F?=
 =?utf-8?B?Vy9LakhpM3R1Yi8walJTVEJ0eDQyUTIvMWR4WGV0VVJuK3E0RkszZk5wWUJC?=
 =?utf-8?B?cllkMXRpcHVUQUZNUTdBZUY0cHpyd05pSEYwMjRremYxb2p1Vkcvckl5cHZx?=
 =?utf-8?B?M0ZPeW5TRGd6S0VHMXJrcXBweXpHTW1IVEZVUVNTQkJ5VEZLQWFkWGJYQzFC?=
 =?utf-8?B?NWV6RHduRFBqSVNXVG1TVE5xNjljekJCMzUwekZvVisvWlBnZld0UnVjWVRk?=
 =?utf-8?B?TDFTTUphbENhQlBJWFppNEl6WUN0MGZWV1AraDhHczM0ZTlLZ1dNcWQ0U1dD?=
 =?utf-8?Q?t+EogcoGoj2rLGD7D32Q6o7d6yQ5iDNxyK449FM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbf2e09-2d05-444e-c27f-08d8d5135efd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 20:17:25.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/nh8ZE586CT0s9akdAj76YHVEptVtzv56E7OCeNmc/OsjJaLYZTNjltXWiFhJqHk8hJ+IM4fIJFI3KuwtDwNQnBhCCwBJuVGVDCZ8w1Csw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

On 19/02/2021 16:10, Kevin Negy wrote:
> Hello,
>
> I'm trying to understand how the shadow page table works in Xen,
> specifically during live migration. My understanding is that after
> shadow paging is enabled (sh_enable_log_dirty() in
> xen/arch/x86/mm/shadow/common.c), a shadow page table is created,
> which is a complete copy of the current guest page table. Then the CR3
> register is switched to use this shadow page table as the active table
> while the guest page table is stored elsewhere. The guest page table
> itself (and not the individual entries in the page table) is marked as
> read only so that any guest memory access that requires the page table
> will result in a page fault. These page faults happen and are trapped
> to the Xen hypervisor. Xen will then update the shadow page table to
> match what the guest sees on its page tables.
>
> Is this understanding correct?
>
> If so, here is where I get confused. During the migration pre-copy
> phase, each pre-copy iteration reads the dirty bitmap
> (paging_log_dirty_op() in xen/arch/x86/mm/paging.c) and cleans it.
> This process seems to destroy all the shadow page tables of the domain
> with the call to shadow_blow_tables() in sh_clean_dirty_bitmap().
>
> How is the dirty bitmap related to shadow page tables? Why destroy the
> entire shadow page table if it is the only legitimate page table in
> CR3 for the domain?

Hello,

Different types of domains use shadow pagetables in different ways, and
the interaction with migration is also type-dependent.

HVM guests use shadow (or HAP) as a fixed property from when they are
created.  Migrating an HVM domain does not dynamically affect whether
shadow is active.  PV guests do nothing by default, but do turn shadow
on dynamically for migration purposes.

Whenever shadow is active, guests do not have write access to their
pagetables.  All updates are emulated if necessary, and "the shadow
pagetables" are managed entirely by Xen behind the scenes.


Next, is the shadow memory pool.  Guests can have an unbounded quantity
of pagetables, and certain pagetable structures take more memory
allocations to shadow correctly than the quantity of RAM expended by the
guest constructing the structure in the first place.

Obviously, Xen can't be in a position where it is forced to expend more
memory for shadow pagetables than the RAM allocated to the guest in the
first place.  What we do is have a fixed sized memory pool (choosable
when you create the domain - see the shadow_memory vm parameter) and
recycle shadows on a least-recently-used basis.

In practice, this means that Xen never has all of the guest pagetables
shadowed at once.  When a guest moves off the pagetables which are
currently shadowed, a pagefault occurs and Xen shadows the new address
by recycling a pagetable which hasn't been used for a while.  The
shadow_blow_tables() call is "please recycle everything" which is used
to throw away all shadow pagetables, which in turn will cause the
shadows to be recreated from scratch as the guest continues to run.


Next, to the logdirty bitmap.  The logdirty bitmap itself is fairly easy
- it is one bit per 4k page (of guest physical address space) indicating
whether that page has been written to, since the last time we checked.

What is complicated is tracking writes, and understand why, it is
actually easier to consider the HVM HAP (i.e. non-shadow) case.  Here,
we have a Xen-maintained single set of EPT or NPT pagetables, which map
the guest physical address space.

When we turn on logdirty, we pause the VM temporarily, and mark all
guest RAM as read-only.  (Actually, we have a lazy-propagation mechanism
of this read-only-ness so we don't spend seconds of wallclock time with
large VMs paused while we make this change.)  Then, as the guest
continues to execute, it exits to Xen when a write hits a read-only
mapping.  Xen responds by marking this frame in the logdirty bitmap,
then remapping it as read-write, then letting the guest continue.

Shadow pagetables are more complicated.  With HAP, hardware helps us
maintain the guest virtual and guest physical address spaces in
logically separate ways, which eventually become combined in the TLBs. 
With Shadow, Xen has to do the combination of address spaces itself -
the shadow pagetables map guest virtual to host physical address.

Suddenly, "mark all guest RAM as read-write" isn't trivial.  The logical
operation you need is: for the shadows we have, uncombine the two
logical addresses spaces, and for the subset which map guest RAM, change
from read-write to read-only, then recombine.  The uncombine part is
actually racy, and involves reversing a one-way mapping, so is
exceedingly expensive.

It is *far* easier to just throw everything away and re-shadow from
scratch, when we want to start tracking writes.


Anyway - I hope this is informative.  It is accurate to the best of my
knowledge, but it also written off the top of my head.  In some copious
free time, I should see about putting some Sphinx docs together for it.

~Andrew

