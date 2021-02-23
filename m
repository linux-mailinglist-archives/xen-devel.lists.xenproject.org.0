Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D543E322317
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 01:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88434.166281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lELUF-0005Qv-3a; Tue, 23 Feb 2021 00:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88434.166281; Tue, 23 Feb 2021 00:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lELUE-0005QW-W0; Tue, 23 Feb 2021 00:23:34 +0000
Received: by outflank-mailman (input) for mailman id 88434;
 Tue, 23 Feb 2021 00:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ey4c=HZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lELUC-0005QR-D0
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 00:23:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89b0eb42-aa7d-4e8e-a347-0f7ff6f64863;
 Tue, 23 Feb 2021 00:23:29 +0000 (UTC)
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
X-Inumbo-ID: 89b0eb42-aa7d-4e8e-a347-0f7ff6f64863
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614039809;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:mime-version;
  bh=FFMBN4EAxLyGJpP5wo+0pA5d3p/cwKO5mZty9s5ZNJ0=;
  b=WfQzpvl/sUV0i0HB1ta+lxd7rKN52sJJtuw3OxaN15XX1JxgsiCJFDMM
   yHVdhIYubZOSB3JKNufAvrGKB8boQL1fTQAoQgFQ2wr1Fa98MikNDVCus
   cy0zz8fb2hy2AteA7fQJoCHSBzVTWB3GdPDT/3Apcb0qEtMDFPm737vwe
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LEeKwLO55xb4cYPsZ+2BwopSFMyFTTscJphwOKcH4MCRwQyKw6fpnNmbKpm0XFhytjWZgNEHHk
 rT9/zsG25si8BQ4nHgsfE8Vy/s/0WfETAFZOGn4eO1BYRRyKmXcYJQiexqQa1jj9Bzx923AN8G
 Am9UoaAt2IABPgKPr8Dw2ufyU5N2m7vXEf12DsGVFCpt5T2U9XS3fYnbusCaRLahUq3aUCLUXw
 94cmLWKhkNeXjW1gBVs37k8Fj6/72GyHfo42+ulALnIzSSg1McLUBmPP3xlhaEmUKKSuTB9Qq7
 3zo=
X-SBRS: 5.2
X-MesageID: 39167301
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,198,1610427600"; 
   d="scan'208,217";a="39167301"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR95zZ8reLlRly71wuhPwBBvkme3n90RWu8LNoX9ae/kcF1O+5i1uUk1Xd8C+nNCl85T8Gxx0fnQ4hcB8dQ7gxVQNZF/pRKqWVx5Y7GWxliCBzoC/xyNOicKhF3nhpHJ+rtn75Wa9KVsQweFrPLuX22+byh8rpZwnDA9zLOrj6dicDX+0Nzk59ay2iZKSJzFa7V7e0jHovWXhnYcbpU/XSYx0lgVcQ0J7tyjZ2O7ScheYgoIC9XHXAE1xUDhtv+BYK3lKdRA/IxOnx5N7bsPbT+TBWaEx0WK7L5pk/bSsbyAFL21Z8Y3F8qc2ruCpphQFXRiw7kzNrdMGCT1LeyE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVEvmFdZeXnGLsnBpItiVwn29ne//YKxeaNpD1P+CeE=;
 b=lREULVmX7Lgn0DXfXNiiHmFPwPBeELIAP9aa/yNtJq+dkq/+sl6HW+plEJOofePQm9Ci1gtm4r0zvgJUYKZ0QH18COufYlrTVZb9kiUdX2PDNEqlnE9lE96wSPh+1nddZZtd0I0efA8zrsWFLKLzxcHP4sZtYZPwztqwkDqdydeHJiMVLWo/1PAHN6da1A91BepOIt+EaTnSRkJptaQLdH1/owR34hTEj5M64JM6RqRwPaIBL3gVO/GljhsdTQ0+k5Jmdz0+V/6ER1W690DiC/fmHdPrlgIkwSLaOxkDvMHPe/l0tbLYKtqjD4pJmo/9AZ2yfH7NMiCzC3Z8/PTSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVEvmFdZeXnGLsnBpItiVwn29ne//YKxeaNpD1P+CeE=;
 b=VSbnqvu2lD2dxC2t5E05bgMJVAicy2xmtPDuvQhJ3JusH1wATv7XzS1uR8pvQsHX0ck9D9riUyotMi0WljL1k7IsXiFzhlaCApDVad1hPIABfKdHEylY3DJv9PBnLzlj4A0SynH+daxSb7JtNSw1+yxzwVz+aiqOgk0GncKlpXg=
Subject: Re: How does shadow page table work during migration?
To: Kevin Negy <kevinnegy@gmail.com>
CC: <xen-devel@lists.xenproject.org>
References: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
 <38cf0d39-da1d-5375-89dc-1668e26323a2@citrix.com>
 <CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a91e41c-b7f9-f856-bc55-fd92b8188adc@citrix.com>
Date: Tue, 23 Feb 2021 00:23:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0AC75CF46D3FFA1913A692BE"
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc105c76-0278-43f1-5c5d-08d8d7913c25
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5885:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58851AC314C150A41CA2E82DBA809@SJ0PR03MB5885.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hh2FWJJbnSxUPyR3a2On1goMS03wglDm0q3Ihr7gmXlzTHBuqZx57IJ4iVMTnpW3WSO+wdowWqzymrZHWnonIBCIYxgfUYaK7lQlc8F0rs7hcqSYCe4GczRwW7FWuDpcoYit5yNg9nxVIT2MDYo3MIsq/f4aHq8ZOk2qmQtYW40tCdI3olS/pGlZB4RE9Cnk3Cau82dNUEfyXPGKGL1VkYTOVLZJ4ebRvgvzXXM7FOUcyp9Fqg0dcybRoZGVlAmbowF81Lao81AH0XkGzPc0WI+l9n+0d7cFovid8yawPGYdqjL7gUm/ppH6Cs/fMnHqIje7p4RbXyiw7GXdLgqNzW2JmEFg3Qa/PPa1GhVSnoKYh/dno3ths8LQkAOiQyIVGOMDe3y/BUZ69A8KOqc5JVbsDWoRWzFaRkySdAhbA03grAVw4H8qPsAb+SuyGXQHDg3IhTlzrJljdfYsgZ39P0EzWGfnCDwXXaD9R8NoA5koKVcIJY76/OXt6LxFS2A9cbiA+INdJlETvVIdmOvV0gtb8taPN45YWv4Q+uTNyUEnt0LNSQsyP1h6ywbP/bxHKbQFgeOAmZVCK6tjUC5iI1dWTINKhimcjOSjaGIqbpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(66946007)(66476007)(86362001)(53546011)(956004)(2616005)(316002)(8936002)(6486002)(186003)(26005)(33964004)(4326008)(36756003)(8676002)(2906002)(5660300002)(478600001)(16576012)(6666004)(31686004)(31696002)(6916009)(83380400001)(30864003)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWtQSGt6S0RFRWFHZW1PMkYwMzc2TUdhN0ZNcHlNajIxeTcySXN2MjN1c3hM?=
 =?utf-8?B?QU5RWXgrSi9MNXV3U1FKaENIMVlBMFg2c3BRSFBLV3A5QjE2RVluRDV2aWpv?=
 =?utf-8?B?a3FHZXIwZlR6ZGRsNlRQOFZoNDhlb0loazdCUXI3SXIyVk1HK2FSdjcxQ3Ft?=
 =?utf-8?B?SUxTb0dXNHJtOTl5WW9yN1pBMmRoL0c4QWgvaEErK2pEVXJQTnJrVzE5REtr?=
 =?utf-8?B?dFI4UVh2UkhSdjgzTUlyWldwVm0rUlNDRGJUb2NuUVcyV0tWWGZ5Z2loaTA0?=
 =?utf-8?B?VlJjZFJOa3BHaVpaWlJJT3BOeWdvRWRFK25sNXdaK2xyWGVkQThLMGtyREZy?=
 =?utf-8?B?S01KUHhuWE84ekpvb0w1NzgwUnBWSEUwMDRnQzVac0ZzRi9IVWp5Sm1FRjFP?=
 =?utf-8?B?SHhReW1QcHZzU0tPTjZ5L2M5V01mUlc2UU5vQ3VoQ201Rmk1QkhyMThteHcz?=
 =?utf-8?B?NnYwOElrVDZOcS96c2xzQS9uVWppWEJ2ZHRvUURGc1pzN25FRGRtYTJtSngr?=
 =?utf-8?B?WlFoaDh6eXZDR2hnVGdlblRKdDhVaEEwR3E0RlovQzgxWXFzMFlubHBlMVhm?=
 =?utf-8?B?OUdNaWZWcytzYndnSHU0aHFsNy81TFRSbGtGTFIrZzNkRENTbStxQy94aXRI?=
 =?utf-8?B?SHRxVkFZei8xeVFvTU1PWGZTK3llMlNoRjNCL2kvNHhldVlBMW9oMTlrRkRJ?=
 =?utf-8?B?S0daMGlNRGliWStoMDJSRWNuWGhYQ2xJcXVXNzhDYzdVS3RSUDVVUDV0UjIz?=
 =?utf-8?B?R0lMdlVneDlmTVZPZzZhZzZhYmhzMEJPYTkzalBHYklYUmdoU0wwZUcvZVFM?=
 =?utf-8?B?RU1PMUl0SDMwTXg5d0ZYNWZzUkhZSGFGamIvc056R2dJRWdxT3cwa0RTZXpV?=
 =?utf-8?B?Y291R0NYUEtlUGY5SktxcFRoeFdxVkVsT3NiSlBKVU44Zm1VYVJOZGEvdS9O?=
 =?utf-8?B?QjVwOVlhdEIzemtRcHoybk5SQ2VMNE12TkxlSGVWa0pjOFlRYmFxanNQdEg4?=
 =?utf-8?B?WXBFRC9lUlozVndLSWplUy9UeC8yS1NzRk5YTE45Y2k2VVd1aGNoQXRBZ3ZI?=
 =?utf-8?B?cE9yV0QxSWRoYkhIVTBXcWs2WkhucWtIUldpWldFSnJUTnpPUmNld3cyUXVV?=
 =?utf-8?B?MGJpQVVPTGlibGFEanFUNVpqVGhlbVVJa3dIYUtvK1dydEQvdUVPMWZqdnBM?=
 =?utf-8?B?L1dZaFN6NWxxSWRJMzFxZ25md3ozWTM0d3hVV1ZNRGZjaktTTzNsVEVWaW12?=
 =?utf-8?B?ck9odW5rR0lEY3B5OThubEUzcEdwaW1xNTlPckFFaDVEaDhFeVRkY2g4RGVI?=
 =?utf-8?B?anFmUC9rTjZzZFI0TkpZYXR6NVBXR1BXNVNzQkgvRTdibGhGb3ZiK0N2VGpR?=
 =?utf-8?B?ZG5jOVo1cHNmWmpheTNPWVdhZXE3dStMdzNNZGZObGhXMjF2TlBZQnlEa3Bu?=
 =?utf-8?B?bjJwK0ZpODl1cUI1V2VLOHQwQjhteDFsU3VIcSsvdlprMFkybFBmVG5LTE1a?=
 =?utf-8?B?OWJlL3k5OTRGY0dSTmxHM3pYRUZuN21ha09oaXNhMGpEK1dXUGdTNEZyS2lN?=
 =?utf-8?B?bUhaeUJTZ0pZa2ZOQW85L21YN0JyR1B4L002UXVobzRlVHRCSDU2VGg0QWNr?=
 =?utf-8?B?dzh3N1Vzcmpxb0NJNXgySVNITTVheno2ZHArUHhPTS8vOU5qMVRNbTcxQWRM?=
 =?utf-8?B?THF2N0hkT01KcmZZSXFIOU9kZXFpWEl1ZmxBL05ObStWTzhOeUtEeEN1cGdn?=
 =?utf-8?Q?8jvAUs5D81fZWktfulAYmW0vfZ3FIUSgEsJ+0FY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc105c76-0278-43f1-5c5d-08d8d7913c25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 00:23:25.8742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bf8X56otAnQ9oJrxO2eCnQNf+EqM/Ze7XEmbL3lNPwdnDZUezp6Hz4JXQvhVAaZXdy9nYNZdCDntomHPOpeZNIkAptC3K43IeWzx+zdId14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5885
X-OriginatorOrg: citrix.com

--------------0AC75CF46D3FFA1913A692BE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 22/02/2021 18:52, Kevin Negy wrote:
> Hello again,
>
> Thank you for the helpful responses. I have several follow up questions.
>
> 1)
>
>     With Shadow, Xen has to do the combination of address spaces itself -
>     the shadow pagetables map guest virtual to host physical address.
>
>
>     The shadow_blow_tables() call is "please recycle everything" which
>     is used
>     to throw away all shadow pagetables, which in turn will cause the
>     shadows to be recreated from scratch as the guest continues to run. 
>
>
> With shadowing enabled, given a guest virtual address, how does the
> hypervisor recreate the mapping to the host physical address (mfn)
> from the virtual address if the shadow page tables are empty (after a
> call to shadow_blow_tables, for instance)? I had been thinking of
> shadow page tables as the definitive mapping between guest pages and
> machine pages, but should I think of them as more of a TLB, which
> implies there's another way to get/recreate the mappings if there's no
> entry in the shadow table?

Your observation about "being like a TLB" is correct.

Lets take the most simple case, of 4-on-4 shadows.  I.e. Xen and the
guest are both in 64bit mode, and using 4-level paging.

Each domain also has a structure which Xen calls a P2M, for the guest
physical => host physical mappings.  (For PV guests, its actually
identity transform, and for HVM, it is a set of EPT or (N)PT pagetables,
but the exact structure isn't important here.)

The other primitive required is an emulated pagewalk.  I.e. we start at
the guest's %cr3 value, and walk though the guests pagetables as
hardware would.  Each step involves a lookup in the P2M, as the guest
PTEs are programmed with guest physical addresses, not host physical.


In reality, we always have a "top level shadow" per vcpu.  In this
example, it is a level-4 pagetable, which starts out clear (i.e. no
guest entries present).  We need *something* to point hardware at when
we start running the guest.

Once we run the guest, we immediately take a pagefault.  We look at %cr2
to find the linear address accessed, and perform a pagewalk.  In the
common case, we find that the linear address is valid in the guest, so
we allocate a level 3 pagetable, again clear, then point the appropriate
L4e at it, then re-enter the guest.

This takes an immediate pagefault again, and we allocate an L2
pagetable, re-enter then allocate an L1 pagetable, and finally point an
L1e at the host physical page.  Now, we can successfully fetch the
instruction (if it doesn't cross a page boundary), then repeat the
process for every subsequent memory access.

This example is simplified specifically to demonstrate the point. 
Everything is driven from pagefaults.

There is of course far more complexity.  We typically populate all the
way down to an L1e in one go, because this is far more efficient than
taking 4 real pagefaults.  If we walk the guest pagetables and find a
violation, we have to hand #PF back to the guest kernel rather than
change the shadows.  To emulate dirty bits correctly, we need to leave
the shadow read-only even if the guest PTE was read/write so we can spot
when hardware tries to set the D bit in the shadows, and copy it back
into guest's view.  Superpages are complicated to deal with (we have to
splinter to 4k pages), and 2-on-3 (legacy 32bit OS with non-PAE paging)
a total nightmare because of the different format of pagetable entries.

Also notice that a guest TLB flush is also implemented as "drop all
shadows under this virtual cr3".

> 2) I'm trying to grasp the general steps of enabling shadowing and
> handling page faults. Is this correct?
>     a) Normal PV - default shadowing is disabled, guest has its page
> tables in r/w mode or whatever mode is considered normal for guest
> page tables

It would be a massive security vulnerability to let PV guests write to
their own pagetables.

PV guest pagetables are read-only, and all updates are made via
hypercall, so they can be audited for safety.  (We do actually have
pagetable emulation for PV guests for those which do write to their own
pagetables, and feeds into the same logic as the hypercall, but is less
efficient overall.)

>     b) Shadowing is enabled - shadow memory pool allocated, all memory
> accesses must now go through shadow pages in CR3. Since no entries are
> in shadow tables, initial read and writes from the guest will result
> in page faults.

PV guest share an address space with Xen.  So actually the top level
shadow for a PV guest is pre-populated with Xen's mappings, but all
guest entries are faulted in on demand.

>     c) As soon as the first guest memory access occurs, a mandatory
> page fault occurs because there is no mapping in the shadows. Xen does
> a guest page table walk for the address that caused the fault (va) and
> then marks all the guest page table pages along the walk as read only.

The first guest memory access is actually the instruction fetch at
%cs:%rip.  Once that address is shadowed, you further have to shadow any
memory operands (which can be more than one, e.g. `PUSH ptr` has a
regular memory operand, and an implicit stack operand which needs
shadowing.  With the AVX scatter/gather instructions, you can have an
almost-arbitrary number of memory operands.)

Also, be very careful with terminology.  Linear and virtual addresses
are different (by the segment selector base, which is commonly but not
always 0).  Lots of Xen code uses va/vaddr when it means linear addresses.

>     d) Xen finds out the mfn of the guest va somehow (my first
> question) and adds the mapping of the va to the shadow page table.

Yes.  This is a combination of the pagewalk and P2M to identify the mfn
in question for the linear address, along with suitable
allocations/modifications to the shadow pagetables.

>     e) If the page fault was a write, the va is now marked as
> read/write but logged as dirty in the logdirty map.

Actually, what we do when the VM is in global logdirty mode is always
start by writing all shadow L1e's as read-only, even if the guest has
them read-write.  This causes all writes to trap with #PF, which lets us
see which frame is being written to, and lets us set the appropriate bit
in the logdirty bitmap.

>     e) Now the next page fault to any of the page tables marked
> read-only in c) must have been caused by the guest writing to its
> tables, which can be reflected in the shadow page tables.

Writeability of the guest's actual pagetables is complicated and
guest-dependent.  Under a strict TLB-like model, its not actually
required to restrict writeability.

In real hardware, the TLB is an explicitly non-coherent cache, and
software is required to issue a TLB flush to ensure that changes to the
PTEs in memory get propagated subsequently into the TLB.

> 3) How do Xen/shadow page tables distinguish between two equivalent
> guest virtual addresses from different guest processes? I suppose when
> a guest OS tries to change page tables from one process to another,
> this will cause a page fault that Xen will trap and be able to infer
> that the current shadow page table should be swapped to a different
> one corresponding to the new guest process?

Changing processes involves writing to %cr3, which is a TLB flush, so in
a strict TLB-like model, all shadows must be dropped.

In reality, this is where we start using restricted writeability to our
advantage.  If we know that no writes to pagetables happened, we know
"the TLB" (== the currently established shadows) aren't actually stale,
so may be retained and reused.

We do maintain hash lists of types of pagetable, so we can locate
preexisting shadows of a specific type.  This is how we can switch
between already-established shadows when the guest changes %cr3.

In reality, the kernel half of virtual address space doesn't change much
after after boot, so there is a substantial performance win from not
dropping and reshadowing these entries.  There are loads and loads of L4
pagetables (one per process), all pointing to common L3's which form the
kernel half of the address space.

If I'm being honestly - this is where my knowledge of exactly what Xen
does breaks down - I'm not the author of the shadow code - I've merely
debugged it a few times.

I hope this is still informative.

~Andrew

--------------0AC75CF46D3FFA1913A692BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 22/02/2021 18:52, Kevin Negy wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">Hello again,<br>
          <br>
          Thank you for the helpful responses. I have several follow up
          questions. <br>
          <br>
          1) <br>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">With Shadow, Xen has to
            do the combination of address spaces itself -<br>
            the shadow pagetables map guest virtual to host physical
            address.</blockquote>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">The shadow_blow_tables()
            call is &quot;please recycle everything&quot; which is used<br>
            to throw away all shadow pagetables, which in turn will
            cause the<br>
            shadows to be recreated from scratch as the guest continues
            to run.&nbsp;</blockquote>
          <br>
          With shadowing enabled, given a guest virtual address, how
          does the hypervisor recreate the mapping to the host physical
          address (mfn) from the virtual address if the shadow page
          tables are empty (after a call to shadow_blow_tables, for
          instance)? I had been thinking of shadow page tables as the
          definitive mapping between guest pages and machine pages, but
          should I think of them as more of a TLB, which implies there's
          another way to get/recreate the mappings if there's no entry
          in the shadow table?</div>
      </div>
    </blockquote>
    <br>
    Your observation about &quot;being like a TLB&quot; is correct.<br>
    <br>
    Lets take the most simple case, of 4-on-4 shadows.&nbsp; I.e. Xen and the
    guest are both in 64bit mode, and using 4-level paging.<br>
    <br>
    Each domain also has a structure which Xen calls a P2M, for the
    guest physical =&gt; host physical mappings.&nbsp; (For PV guests, its
    actually identity transform, and for HVM, it is a set of EPT or
    (N)PT pagetables, but the exact structure isn't important here.)<br>
    <br>
    The other primitive required is an emulated pagewalk.&nbsp; I.e. we start
    at the guest's %cr3 value, and walk though the guests pagetables as
    hardware would.&nbsp; Each step involves a lookup in the P2M, as the
    guest PTEs are programmed with guest physical addresses, not host
    physical.<br>
    <br>
    <br>
    In reality, we always have a &quot;top level shadow&quot; per vcpu.&nbsp; In this
    example, it is a level-4 pagetable, which starts out clear (i.e. no
    guest entries present).&nbsp; We need *something* to point hardware at
    when we start running the guest.<br>
    <br>
    Once we run the guest, we immediately take a pagefault.&nbsp; We look at
    %cr2 to find the linear address accessed, and perform a pagewalk.&nbsp;
    In the common case, we find that the linear address is valid in the
    guest, so we allocate a level 3 pagetable, again clear, then point
    the appropriate L4e at it, then re-enter the guest.<br>
    <br>
    This takes an immediate pagefault again, and we allocate an L2
    pagetable, re-enter then allocate an L1 pagetable, and finally point
    an L1e at the host physical page.&nbsp; Now, we can successfully fetch
    the instruction (if it doesn't cross a page boundary), then repeat
    the process for every subsequent memory access.<br>
    <br>
    This example is simplified specifically to demonstrate the point.&nbsp;
    Everything is driven from pagefaults.<br>
    <br>
    There is of course far more complexity.&nbsp; We typically populate all
    the way down to an L1e in one go, because this is far more efficient
    than taking 4 real pagefaults.&nbsp; If we walk the guest pagetables and
    find a violation, we have to hand #PF back to the guest kernel
    rather than change the shadows.&nbsp; To emulate dirty bits correctly, we
    need to leave the shadow read-only even if the guest PTE was
    read/write so we can spot when hardware tries to set the D bit in
    the shadows, and copy it back into guest's view.&nbsp; Superpages are
    complicated to deal with (we have to splinter to 4k pages), and
    2-on-3 (legacy 32bit OS with non-PAE paging) a total nightmare
    because of the different format of pagetable entries.<br>
    <br>
    Also notice that a guest TLB flush is also implemented as &quot;drop all
    shadows under this virtual cr3&quot;.<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">2) I'm trying to grasp the general steps of
          enabling shadowing and handling page faults. Is this correct?<br>
          &nbsp; &nbsp; a) Normal PV - default shadowing is disabled, guest has
          its page tables in r/w mode or whatever mode is considered
          normal for guest page tables<br>
        </div>
      </div>
    </blockquote>
    <br>
    It would be a massive security vulnerability to let PV guests write
    to their own pagetables.<br>
    <br>
    PV guest pagetables are read-only, and all updates are made via
    hypercall, so they can be audited for safety.&nbsp; (We do actually have
    pagetable emulation for PV guests for those which do write to their
    own pagetables, and feeds into the same logic as the hypercall, but
    is less efficient overall.)<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">&nbsp; &nbsp; b) Shadowing is enabled - shadow memory pool
          allocated, all memory accesses must now go through shadow
          pages in CR3. Since no entries are in shadow tables, initial
          read and writes from the guest will result in page faults.<br>
        </div>
      </div>
    </blockquote>
    <br>
    PV guest share an address space with Xen.&nbsp; So actually the top level
    shadow for a PV guest is pre-populated with Xen's mappings, but all
    guest entries are faulted in on demand.<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">&nbsp; &nbsp; c) As soon as the first guest memory access
          occurs, a mandatory page fault occurs because there is no
          mapping in the shadows. Xen does a guest page table walk for
          the address that caused the fault (va) and then marks all the
          guest page table pages along the walk as read only.<br>
        </div>
      </div>
    </blockquote>
    <br>
    The first guest memory access is actually the instruction fetch at
    %cs:%rip.&nbsp; Once that address is shadowed, you further have to shadow
    any memory operands (which can be more than one, e.g. `PUSH ptr` has
    a regular memory operand, and an implicit stack operand which needs
    shadowing.&nbsp; With the AVX scatter/gather instructions, you can have
    an almost-arbitrary number of memory operands.)<br>
    <br>
    Also, be very careful with terminology.&nbsp; Linear and virtual
    addresses are different (by the segment selector base, which is
    commonly but not always 0).&nbsp; Lots of Xen code uses va/vaddr when it
    means linear addresses.<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">&nbsp; &nbsp; d) Xen finds out the mfn of the guest va
          somehow (my first question) and adds the mapping of the va to
          the shadow page table.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Yes.&nbsp; This is a combination of the pagewalk and P2M to identify the
    mfn in question for the linear address, along with suitable
    allocations/modifications to the shadow pagetables.<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">&nbsp; &nbsp; e) If the page fault was a write, the va is
          now marked as read/write but logged as dirty in the logdirty
          map.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Actually, what we do when the VM is in global logdirty mode is
    always start by writing all shadow L1e's as read-only, even if the
    guest has them read-write.&nbsp; This causes all writes to trap with #PF,
    which lets us see which frame is being written to, and lets us set
    the appropriate bit in the logdirty bitmap.<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">&nbsp; &nbsp; e) Now the next page fault to any of the page
          tables marked read-only in c) must have been caused by the
          guest writing to its tables, which can be reflected in the
          shadow page tables.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Writeability of the guest's actual pagetables is complicated and
    guest-dependent.&nbsp; Under a strict TLB-like model, its not actually
    required to restrict writeability.<br>
    <br>
    In real hardware, the TLB is an explicitly non-coherent cache, and
    software is required to issue a TLB flush to ensure that changes to
    the PTEs in memory get propagated subsequently into the TLB.<br>
    <br>
    <blockquote type="cite" cite="mid:CACZWC-r7fS2AztaAgGdVPv5NcJiAxZ5mvC4FQTkorPDGwOfn9g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">3) How do Xen/shadow page tables distinguish
          between two equivalent guest virtual addresses from different
          guest processes? I suppose when a guest OS tries to change
          page tables from one process to another, this will cause a
          page fault that Xen will trap and be able to infer that the
          current shadow page table should be swapped to a different one
          corresponding to the new guest process?<br>
        </div>
      </div>
    </blockquote>
    <br>
    Changing processes involves writing to %cr3, which is a TLB flush,
    so in a strict TLB-like model, all shadows must be dropped.<br>
    <br>
    In reality, this is where we start using restricted writeability to
    our advantage.&nbsp; If we know that no writes to pagetables happened, we
    know &quot;the TLB&quot; (== the currently established shadows) aren't
    actually stale, so may be retained and reused.<br>
    <br>
    We do maintain hash lists of types of pagetable, so we can locate
    preexisting shadows of a specific type.&nbsp; This is how we can switch
    between already-established shadows when the guest changes %cr3.<br>
    <br>
    In reality, the kernel half of virtual address space doesn't change
    much after after boot, so there is a substantial performance win
    from not dropping and reshadowing these entries.&nbsp; There are loads
    and loads of L4 pagetables (one per process), all pointing to common
    L3's which form the kernel half of the address space.<br>
    <br>
    If I'm being honestly - this is where my knowledge of exactly what
    Xen does breaks down - I'm not the author of the shadow code - I've
    merely debugged it a few times.<br>
    <br>
    I hope this is still informative.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------0AC75CF46D3FFA1913A692BE--

