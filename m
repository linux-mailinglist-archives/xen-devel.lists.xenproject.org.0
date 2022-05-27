Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90AE535F09
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 13:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337948.562665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXtm-00085r-5V; Fri, 27 May 2022 11:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337948.562665; Fri, 27 May 2022 11:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuXtm-00083z-1c; Fri, 27 May 2022 11:12:54 +0000
Received: by outflank-mailman (input) for mailman id 337948;
 Fri, 27 May 2022 11:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuXtl-0007su-6L
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 11:12:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2fff49c-ddad-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 13:12:52 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-v_-qEy5CNiC5Ki2ODG4WqQ-1; Fri, 27 May 2022 13:12:50 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Fri, 27 May
 2022 11:12:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 11:12:49 +0000
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
X-Inumbo-ID: f2fff49c-ddad-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653649971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jci9rQkWPMy6ohkXdrpyJreaPBMSTK/7GbgkwVczOus=;
	b=Lr6j5J+MkNnIirJwHFN6STnhsN2vx9SLW9NjvONB89vv455tn39Yu2FhidoRf7xcPaxi9o
	4VDmaF06GH/7SHxqdCr+1vfRKgGdRohZEuHmFwGtxEFj+zPXAFoRacb43EVzIml0hjXvEK
	Lpbue+IIaOxzBiDggbkxZHg2HMGkwQs=
X-MC-Unique: v_-qEy5CNiC5Ki2ODG4WqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AO7suNExYLdn6OVAfJjW7iPGd+a0KkFG3dQ+/mDCuKlS6uo7X7leS6ruKeU4n5XgzWhkvgaaqQH44IEM2Nq9dE3istpTYl58c3TdG4AZDC0UpzhyQ/x79OzKUEIv00Fm4B7ZHNaHr3kSHQ+Geq9i3TW6TMpW9bXRScfd3oeDOE/ElRqYP0sKzQb7DVHKnEeJkuun+LBWZt0soKRZp2mH6ZV9cdT5AFPnMuRQ8lBKVE89zGJVrzlFpLr1PtBMYrnqXzQ/qgnguWN4PlSt7XhIbS8NWE5eqtJn44ph7K/nW0P7hCFDjAan/wgK5fpeKARvdvjZVvLFUa6EwOMhnLSPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jci9rQkWPMy6ohkXdrpyJreaPBMSTK/7GbgkwVczOus=;
 b=YrHYl5pIpRlY0AI6mCjJZG+NDJ+0EaYI9WyAB0t+7kvMwyxEX3ZiIqr3IYFKOt5KfUKakRwysdgaiEEUF4WwgrHQDLL308RCHiSkbyIc42OAe64x5UOM5zTw69GWZQpLQj7h2Q43+p9KEDo/GiIQGYOxTIFHEUQSw8T3h6cjzE7NXtqi2AUHqMjC8TWJ1s6VUK/DWO8t+lxV1addpBZ1Y0g/L1uyJO45CwVR/fuSd+ZTt0umg+m/yWe+jXTTbJO5uJ97fCjBnZsbBWBWlPdOD8UPkm6JpgUDbu4HLPV20CRiAbWq7sJkZUYyeWAmXzvKJx2VZeFXGwV0OuzfFQPuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67fd1ed1-4a62-c014-51c0-f547e33fb427@suse.com>
Date: Fri, 27 May 2022 13:12:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v5 02/15] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
In-Reply-To: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eabe028b-169d-4df5-8973-08da3fd1d5e5
X-MS-TrafficTypeDiagnostic: PR3PR04MB7210:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7210BF6BC7ED6AFC93F9954FB3D89@PR3PR04MB7210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MRW8tla3aMYvXRm9dgtv4TCjdZInXqGokV+Cmh+Aigcq6M9Sy9fX8E+R+zyoPWNz8/Ssr2a+hCvtiTNiSNd/HLRlzRAafWpwfacWti74dI027NG25V/OC6NoYFKehz0qYfFM0PbG/CI7Xlx6wi5A0zY6RIJIBaw+BuVm2MmWC6fbPCvGE62065jretALuvCcEIYBwhQqfGn2x+/aKjV+i53xJoEBF75JG8NdyJ6pzjGXiVuMEmUSIHXS/qIdqvklZ/sY58gAAaQ/JdrAb2KhqPijFrg0MTxI2pEeTRaUh8m/oYa+VOTr5BBmsKG5bXW+YhM9wx6sad/bDxoDvV6MxCSdE1dyczqQQJmfiMbRwr6v/ln5ktaEEqWBm4sZz/GQ/wkiUNtTUjjuUHQ/TS1f2x3cIEYNwfieAl4YLbMXvnPkSgOUdnFrUBTZd+HSI/eO31hozOI7ToyJcj2+6Gx/la/Hetg0B6gX/fzuU5vd2H7TkbxL/5mbknt2JnmvzpnLYEZtnnR28wrEHkG3zCr6XIKcTugJLU+jvk6XCylf3UDvFvZN6GYCW90pR2SVfaXyoKIlUNhMitMR15mbDmgt/jbNJGZ5GYdv4EcT7omOyrltVwEhjHKskFqiUlaYJYdsn7cJMmMfKa6IwW11pCG9rbazVpLLs62gVzmWf4tdFLmYp8Dt8Htf/jjutb8bX0OZVqrByX8VmYunQxqNkMaBAgO12XYfZIYisapgu5QZT6XVfnucCHlac0z8b9pkkUzu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(8676002)(66476007)(6512007)(83380400001)(8936002)(508600001)(5660300002)(66946007)(66556008)(26005)(30864003)(38100700002)(2906002)(86362001)(6506007)(186003)(54906003)(316002)(36756003)(6916009)(31686004)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWlqSU1qQVVaY3IvT2hVNVJZdlUrWTV3eENxZXFEUWdNeXlKaE5jUFJ3dHFT?=
 =?utf-8?B?UGl4bVlXUmQzMEkvNkFJaU9PRjNqdFZJOWthVHBGRnBoVCtHTTJiQTRqd3ZF?=
 =?utf-8?B?UXRaM0dsNElJUlYxbmlkS0xweHF0YjZrSEtLcFUyM2NrZ1lveW9iTEpNbW5X?=
 =?utf-8?B?VE9KYkJmQUowbDBlWmFpQVRlMksvRngwZVVZN09UY3BsT1k2c3phSVhpaXFD?=
 =?utf-8?B?TG9GSktnT1FEWUcwekwvWE5GTU8wMnE3TzEwMGhCcUZ1Z2RwMUY1VlNJQ3Mw?=
 =?utf-8?B?alMrWGtjQmFsV3pvZTF6K0FwNGlyOWQ2OUhoblIwcGRaTTBRb3RZcXNHaWtU?=
 =?utf-8?B?bDI4Q3ZVRjBLSlFCcytqS3Nialg2WGJlTzRaeGlrTW5TR3NWQ3BPbEVLQnBG?=
 =?utf-8?B?cnBiMGdIT1l0UG0yNjk3N08xcmh6RE5vZklScGRhS2dFS0VybnlDWlI0K25u?=
 =?utf-8?B?eU5xTExnMm9IVjdXK1V5dmJPajhjR0tTNjMvUjhXeFlBeWt0M0l5anNSbkxL?=
 =?utf-8?B?Q0xWLy84ZXJjQjdRNmZSdFE4cmdFN0dZV0ZzMzVPRml0a00xc0xJVk9iUEV5?=
 =?utf-8?B?WjhmYm9RVGFmV25MUVZGWU0ydzVxTU1Dc3VGVTcyZFVkd3lRZDQrMkU2VUVu?=
 =?utf-8?B?cTBJWnNOSUwrTXZsYmF5T0ZxWExVaStLalZGWlFNRHRuc1QwTXRpMTMxQ0FZ?=
 =?utf-8?B?bWdaSTUzcyt2ZjlLVWhnOGFzR1lYNlE0ZEFRLzM3ZzQrNk5OOWRYbEJLUHlk?=
 =?utf-8?B?MXk4aEZKT2Fzb0U1MHYvTmh6SWQycUIzK2R3L1VTbjVWV2xoUXJnWGluNXZG?=
 =?utf-8?B?M1FVUHFxcjRyKzZ4MGgwVVVFMGdZSVV4SU5oRU9lcWVBMzVicDM2MWFkQW1C?=
 =?utf-8?B?ajczOVlHZ2g1VXNyWXFzVVYzQnRCL3l6SzZHK0NVREtVZFN5ZmFDNG51Nk1m?=
 =?utf-8?B?c2ovam1UK0RxcUVielpaUzExRHppTDRnNjk4UkdKNmNQZmpFZGVpNWZJbExu?=
 =?utf-8?B?T3d0ZjRSenpQS3YxdFU1WUQ5ZGtsSXVEalQrbHBLOHZvVjJSY0FleU95RFh4?=
 =?utf-8?B?cndzM0JLd09vOEZzNDRGZHhjZnZHcWE2b0hXaUx6Y2N2cENZRUVzWUdQTits?=
 =?utf-8?B?M0gxbHZCV2huT3VTUng5eTI5MjhXSFgwTnBVVk9tT2R1TWFEWmhsMStCZERa?=
 =?utf-8?B?N25lbCs2S1Q3Y2VEYmVnWVhITFZ2dDlVeG16TW0vL1M3KzFFc2hWYzAvMVBv?=
 =?utf-8?B?RTEyTjNGM1BKUXQ2MmFnUW9QMHZJdE1DNngrVmVGaExJTUlleDZ4eTVMWUVn?=
 =?utf-8?B?c0EyMVEwZ1lNVk9GUVRoek1DcHI0OWRTV0NsNHl6VzI4Z2hIaGUyWFYxNXpT?=
 =?utf-8?B?V2plT3h6NTkyeC9zMGpzNU5ka2ZCbkpwUjl2M2w5Z21wdUtyMFZzY1pWQVB3?=
 =?utf-8?B?cXVFbmkzMmF5akE4a3gyLy94Wit6ZlhOUTFQTzFVRGZyaFE1Tytjc3JpckQz?=
 =?utf-8?B?R3ByVGRqeUttbWlOM2MvWHZKVFJXVjMwTG1UZ3hiaCtyVFRJOXFrNTRNR0ZJ?=
 =?utf-8?B?aFQ3ZXhmeVpKZHNxZ1p1V1FkSlZkd2ZteE9Nb1hqTDJ3bkkzckxSV2ppOUJs?=
 =?utf-8?B?WEtzeWpIc25kN3VqQmhhTnM0c1pOSFcrMmpVdzlBVHZXTHZnUlErWVBTb2p1?=
 =?utf-8?B?cmZOaGdDak1JTTlaeHhUaUJpckt2NnQvNHdrQkFieG01anBKbWNjWE1tYU9J?=
 =?utf-8?B?N1ErZ1Zyb0psdGtnL3BsY0tyMU5FMVBTNUQyc0MyeWZ6dGczSEYyS2Y2eWFw?=
 =?utf-8?B?akd4OGdCTE1Ea044S09GcWoyUXFGenp1ZU9hMXJFaE1SbFgzOTVTd2dTWGNU?=
 =?utf-8?B?N2djcUcxMHVZWitvZzViZk1vYnp6dlliV0xUQXhOR2NPTWVGMk9ZK0pyME5z?=
 =?utf-8?B?d0pBYnJlTGNqQ0FqR2Nsa2JWSjR0clRERTdSZW11MzEvcmhZeWM5Z255a1BR?=
 =?utf-8?B?VitLSHBHekhxUEJ5czExcjA3aWtSc1B5NGtrY0JXTkwwR011MlBWellESU1P?=
 =?utf-8?B?MTYrQm9IVm5xdDkvS0FkREhPVTdORVRia2RlcE1wTXErOG1RT1lLZTlUWkR5?=
 =?utf-8?B?WDloRnVQWlhnODVzL2gwai94aERDcXRGalp4Qjg4YU1qTi9MTzd1aWo2U3NK?=
 =?utf-8?B?QUlPcXFSeFg0T2VBaWRhWGw4ZWo4ZVZqRXh4ZEdLRE50QnA5QkJZWnNXcGhk?=
 =?utf-8?B?aHZBRnZvNWpEbU5melFkelpiWUhGWnkrNkdCcUxFdU9QeWlVWUhzRG1zVytk?=
 =?utf-8?B?dUlkS3FiWTFydCtlRzBkN2k0bWVFS21jWUFZWVo0Q2xFckNHaFNSUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabe028b-169d-4df5-8973-08da3fd1d5e5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 11:12:49.7057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cU3QR5Goi97FAvExfwXPCDTPTaeKAXVbcB9SO7MLINsSe6K5PuO82TE8ohB5ck+xnKcyDeasgarLfZ0ZZlHrQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

For large page mappings to be easily usable (i.e. in particular without
un-shattering of smaller page mappings) and for mapping operations to
then also be more efficient, pass batches of Dom0 memory to iommu_map().
In dom0_construct_pv() and its helpers (covering strict mode) this
additionally requires establishing the type of those pages (albeit with
zero type references).

The earlier establishing of PGT_writable_page | PGT_validated requires
the existing places where this gets done (through get_page_and_type())
to be updated: For pages which actually have a mapping, the type
refcount needs to be 1.

There is actually a related bug that gets fixed here as a side effect:
Typically the last L1 table would get marked as such only after
get_page_and_type(..., PGT_writable_page). While this is fine as far as
refcounting goes, the page did remain mapped in the IOMMU in this case
(when "iommu=dom0-strict").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently p2m_add_identity_entry() may want to also gain an order
parameter, for arch_iommu_hwdom_init() to use. While this only affects
non-RAM regions, systems typically have 2-16Mb of reserved space
immediately below 4Gb, which hence could be mapped more efficiently.

Eventually we may want to overhaul this logic to use a rangeset based
approach instead, punching holes into originally uniformly large-page-
mapped regions. Doing so right here would first and foremost be yet more
of a change.

The installing of zero-ref writable types has in fact shown (observed
while putting together the change) that despite the intention by the
XSA-288 changes (affecting DomU-s only) for Dom0 a number of
sufficiently ordinary pages (at the very least initrd and P2M ones as
well as pages that are part of the initial allocation but not part of
the initial mapping) still have been starting out as PGT_none, meaning
that they would have gained IOMMU mappings only the first time these
pages would get mapped writably. Consequently an open question is
whether iommu_memory_setup() should set the pages to PGT_writable_page
independent of need_iommu_pt_sync().

I didn't think I need to address the bug mentioned in the description in
a separate (prereq) patch, but if others disagree I could certainly
break out that part (needing to first use iommu_legacy_unmap() then).

Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
They'll end up mapped via the later get_page_and_type().

As to the way these refs get installed: I've chosen to avoid the more
expensive {get,put}_page_and_type(), favoring to put in place the
intended type directly. I guess I could be convinced to avoid this
bypassing of the actual logic; I merely think it's unnecessarily
expensive.

Note also that strictly speaking the iommu_iotlb_flush_all() here (as
well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
needed: Actual hooking up (AMD) or enabling of translation (VT-d)
occurs only afterwards anyway, so nothing can have made it into TLBs
just yet.
---
v3: Fold iommu_map() into (the now renamed) iommu_memory_setup(). Move
    iommu_unmap() into mark_pv_pt_pages_rdonly(). Adjust (split) log
    message in arch_iommu_hwdom_init().

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -46,7 +46,8 @@ void __init dom0_update_physmap(bool com
 static __init void mark_pv_pt_pages_rdonly(struct domain *d,
                                            l4_pgentry_t *l4start,
                                            unsigned long vpt_start,
-                                           unsigned long nr_pt_pages)
+                                           unsigned long nr_pt_pages,
+                                           unsigned int *flush_flags)
 {
     unsigned long count;
     struct page_info *page;
@@ -71,6 +72,14 @@ static __init void mark_pv_pt_pages_rdon
         ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
         ASSERT(!(page->u.inuse.type_info & ~(PGT_type_mask | PGT_pae_xen_l2)));
 
+        /*
+         * Page table pages need to be removed from the IOMMU again in case
+         * iommu_memory_setup() ended up mapping them.
+         */
+        if ( need_iommu_pt_sync(d) &&
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, flush_flags) )
+            BUG();
+
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;
         page->u.inuse.type_info |= PGT_validated | 1;
@@ -107,11 +116,43 @@ static __init void mark_pv_pt_pages_rdon
     unmap_domain_page(pl3e);
 }
 
+static void __init iommu_memory_setup(struct domain *d, const char *what,
+                                      struct page_info *page, unsigned long nr,
+                                      unsigned int *flush_flags)
+{
+    int rc;
+    mfn_t mfn = page_to_mfn(page);
+
+    if ( !need_iommu_pt_sync(d) )
+        return;
+
+    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
+                   IOMMUF_readable | IOMMUF_writable, flush_flags);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "pre-mapping %s MFN [%lx,%lx) into IOMMU failed: %d\n",
+               what, mfn_x(mfn), mfn_x(mfn) + nr, rc);
+        return;
+    }
+
+    /*
+     * For successfully established IOMMU mappings the type of the page(s)
+     * needs to match (for _get_page_type() to unmap upon type change). Set
+     * the page(s) to writable with no type ref.
+     */
+    for ( ; nr--; ++page )
+    {
+        ASSERT(!page->u.inuse.type_info);
+        page->u.inuse.type_info = PGT_writable_page | PGT_validated;
+    }
+}
+
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
                                     unsigned long v_start, unsigned long v_end,
                                     unsigned long vphysmap_start,
                                     unsigned long vphysmap_end,
-                                    unsigned long nr_pages)
+                                    unsigned long nr_pages,
+                                    unsigned int *flush_flags)
 {
     struct page_info *page = NULL;
     l4_pgentry_t *pl4e, *l4start = map_domain_page(_mfn(pgtbl_pfn));
@@ -177,6 +218,10 @@ static __init void setup_pv_physmap(stru
                                              L3_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 1G", page,
+                                   SUPERPAGE_PAGES * SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl3e = l3e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L3_PAGETABLE_SHIFT;
                 continue;
@@ -203,6 +248,9 @@ static __init void setup_pv_physmap(stru
                                              L2_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 2M", page, SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
                 continue;
@@ -311,6 +359,7 @@ int __init dom0_construct_pv(struct doma
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
     struct page_info *page = NULL;
+    unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
@@ -573,6 +622,9 @@ int __init dom0_construct_pv(struct doma
                     BUG();
         }
         initrd->mod_end = 0;
+
+        iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
+                           PFN_UP(initrd_len), &flush_flags);
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -606,6 +658,13 @@ int __init dom0_construct_pv(struct doma
 
     process_pending_softirqs();
 
+    /*
+     * Map the full range here and then punch holes for page tables
+     * alongside marking them as such in mark_pv_pt_pages_rdonly().
+     */
+    iommu_memory_setup(d, "init-alloc", mfn_to_page(_mfn(alloc_spfn)),
+                       alloc_epfn - alloc_spfn, &flush_flags);
+
     mpt_alloc = (vpt_start - v_start) + pfn_to_paddr(alloc_spfn);
     if ( vinitrd_start )
         mpt_alloc -= PAGE_ALIGN(initrd_len);
@@ -690,7 +749,8 @@ int __init dom0_construct_pv(struct doma
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
-        if ( !page->u.inuse.type_info &&
+        if ( (!page->u.inuse.type_info ||
+              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
              !get_page_and_type(page, d, PGT_writable_page) )
             BUG();
     }
@@ -719,7 +779,7 @@ int __init dom0_construct_pv(struct doma
     }
 
     /* Pages that are part of page tables must be read only. */
-    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
+    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_flags);
 
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
@@ -794,7 +854,7 @@ int __init dom0_construct_pv(struct doma
     {
         pfn = pagetable_get_pfn(v->arch.guest_table);
         setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
-                         nr_pages);
+                         nr_pages, &flush_flags);
     }
 
     /* Write the phys->machine and machine->phys table entries. */
@@ -825,7 +885,9 @@ int __init dom0_construct_pv(struct doma
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);
-            if ( !page->u.inuse.type_info &&
+            if ( (!page->u.inuse.type_info ||
+                  page->u.inuse.type_info == (PGT_writable_page |
+                                              PGT_validated)) &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
@@ -841,8 +903,12 @@ int __init dom0_construct_pv(struct doma
 #endif
     while ( pfn < nr_pages )
     {
-        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
+        count = domain_tot_pages(d);
+        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
             panic("Not enough RAM for DOM0 reservation\n");
+
+        iommu_memory_setup(d, "chunk", page, domain_tot_pages(d) - count,
+                           &flush_flags);
         while ( pfn < domain_tot_pages(d) )
         {
             mfn = mfn_x(page_to_mfn(page));
@@ -857,6 +923,10 @@ int __init dom0_construct_pv(struct doma
         }
     }
 
+    /* Use while() to avoid compiler warning. */
+    while ( iommu_iotlb_flush_all(d, flush_flags) )
+        break;
+
     if ( initrd_len != 0 )
     {
         si->mod_start = vinitrd_start ?: initrd_pfn;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -363,8 +363,8 @@ static unsigned int __hwdom_init hwdom_i
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn;
-    unsigned int flush_flags = 0;
+    unsigned long i, top, max_pfn, start, count;
+    unsigned int flush_flags = 0, start_perms = 0;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -395,9 +395,9 @@ void __hwdom_init arch_iommu_hwdom_init(
      * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
      * setting up potentially conflicting mappings here.
      */
-    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
+    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
 
-    for ( ; i < top; i++ )
+    for ( i = start, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
@@ -406,20 +406,41 @@ void __hwdom_init arch_iommu_hwdom_init(
         if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
+        {
             rc = p2m_add_identity_entry(d, pfn,
                                         perms & IOMMUF_writable ? p2m_access_rw
                                                                 : p2m_access_r,
                                         0);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: identity mapping of %lx failed: %d\n",
+                       d, pfn, rc);
+        }
+        else if ( pfn != start + count || perms != start_perms )
+        {
+        commit:
+            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
+                           &flush_flags);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
+                       d, pfn, pfn + count, rc);
+            SWAP(start, pfn);
+            start_perms = perms;
+            count = 1;
+        }
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           perms, &flush_flags);
+        {
+            ++count;
+            rc = 0;
+        }
 
-        if ( rc )
-            printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
-                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
 
-        if (!(i & 0xfffff))
+        if ( !(++i & 0xfffff) )
             process_pending_softirqs();
+
+        if ( i == top && count )
+            goto commit;
     }
 
     /* Use if to avoid compiler warning */


