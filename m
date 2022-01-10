Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D439B489D65
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255389.437606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xOp-0000r7-8y; Mon, 10 Jan 2022 16:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255389.437606; Mon, 10 Jan 2022 16:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xOp-0000ok-5f; Mon, 10 Jan 2022 16:19:59 +0000
Received: by outflank-mailman (input) for mailman id 255389;
 Mon, 10 Jan 2022 16:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xOn-0000oe-Gh
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:19:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25dae899-7231-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:19:56 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-YPco_MN_Of-z3FOQjKjLfw-1; Mon, 10 Jan 2022 17:19:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 16:19:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:19:52 +0000
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
X-Inumbo-ID: 25dae899-7231-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641831595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uXqL4z2vmtXyHjuZxSZQPMHxyvP5YuKzdyRVnLM3RlU=;
	b=Z2ob6iemcpoq0nnV/zPVUGRk1YYF7nc+znDDdhlf/QSgLDMZiGXSBUc1hWlOnFZXEPsPF7
	bM4wfvpnY5hdXNjtt3SK+AsocOxVIxaIQV3fE6jw59WdX3vzldQFJw6AyOw/ZkG1tH3+Zs
	8lxDXX7ckReE0DLgCX/+Q5ZCoIct2no=
X-MC-Unique: YPco_MN_Of-z3FOQjKjLfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2UOweWxfR7e/gPEqodITxYaChrngbYN3gFcvjImRw0FCrmXReX9d0D1+x1HEOLUjsXzrzeiwsSKgJ8UKptaNogo/IruKATpzbUcI8uqu5xq5XWFNBK8mNWYV/KlKzKfAj4Y3CwpO+3vd1gSkHHFnPq+FtXrT4qf0rCaWOQLs7tdEaYSRNS4x3kVc8Sh89od/1V/oq/Bz6vIOfwsigGhUOxbksU0VmSCd4GHtjnSq/o3RI8IwELX0HGrghi0zQRqbnZJ8Vy/CNCNrXL2Pcl6LK9wnIrBoj+NzZmKsvESNBDGiclPmEkkOurjPf1jga8AvoXYbQbDyDKKQemahcLduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXqL4z2vmtXyHjuZxSZQPMHxyvP5YuKzdyRVnLM3RlU=;
 b=C95F0HIby1ZeF/8/t2q7T0myLKXqscaBq6Rl9iqu7z8qpHhTcZYk5J461J+72XAZ3JF4WbfWWmNvnICXFQcrd9m5pCl9zwxD2vghpXXrG78Ve7lph5esBsr66Yq2SZmDdzoMu5olPR9yjQuY+SucVOG2AWGiNLTc5ezTRWRt6VrsVakV83HaaKEhJzym65PAyNpvn21E2QsWUGbZ5lFUt+dgap5iNmiVN1oRUDw/Wb21Vuz9qHCUHnoetN/+iYPwgoum6L6h1EqIWIMCdCu6fOeiLB3JEcBrMI8XBpHSt+41BhfDzkB47BqPd39qXGVIzWnvpIQQnDM3/1HiFM4EZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Date: Mon, 10 Jan 2022 17:19:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 00/23] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce5260ca-c89f-4ece-4a88-08d9d45507fd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64775CE5F5300D33D03735ADB3509@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LsivWbc8/5RIe8RPeWjFZqZY1+Of8APkBCuZNfg3oaVni0S4gQbpeZxdLrVyqCyFd+yGdTuz85Z4YQTPB9EuLKWNbkcCW31hjeJ4H0nwADhR6SC8C35/TdCUxgHkcvyPO0zgQFdHPIdcWdMioIVwyDKTBz/2IY9BrP71Jp0tqWBfXg80X0lGZLefDiQ89DdNyKaOzywWhFb8jd2BhEAsh+tPJm1L1+5RKvz1BjPL3byhor4hSmrl819WAknB1TvWdfiEeL4DmRT/gU3eSN6JJA7tC5ohzT1pHtpoWP/7b6DZ1qcVSzJFYF1b3Xog6oKnNbr+/On9RmFXF7fyObYQAAUBlGagbAv7404jLFKJoP59odryArspKh/TBAIiwbDndcAOlHX6xFQEnY7sBujMM78yT7io4Qp3ahvhdynDyazSovCepAV4RwbnDP+eeVN/+daWR1+Euh/QpLVhp4AuioqzKjK6setYB+4+/2Brn/OLKoDMgv5oIi1CaBSyjnAUl9dd+SWUzXvNMGk/fumF4+qu8g8aDXaLmNWnj0n3jFsa8gc9+05Fbt1nl6kDd2T6iA4Ly8Q6rpytIkwkr/AR/hMGU+l9jGkHlLPighbSVdH5w9OruLvUiEMP+WM83W72QLTdLE9O2nI3TqmDH+L+9r1iOVxYyTnHSSuTl2as+Ii1DsJBkpR6uQplHJGLX4rJSSjfl7U5Er6cvJ1dTKYxMJSUY/GIsEzfdv2sUFZpk2q8k84yPe17m1ktHi67Ctp0pHm7YJogFH5gGNrUZV8Hyn0R+e/BEjvAHZym1hDpwqPf4LwyQBFDDZos9L8fy+dt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(66556008)(66476007)(2906002)(66946007)(4326008)(38100700002)(5660300002)(54906003)(316002)(83380400001)(31696002)(508600001)(6486002)(966005)(6916009)(8936002)(36756003)(8676002)(86362001)(6512007)(31686004)(186003)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpKczZxTkZmbHpvVkRRYVVTOHJHZzZRZVZaMG0ybjB1RWZlNVZMNHB1ZmhR?=
 =?utf-8?B?bVkzUDBNdUZyQWlnSGVuYnVPUnU4bXlqQ3dGZ3VTdHl1ak83MVR0STdueFBu?=
 =?utf-8?B?RDhzeGs4WlZYYmxJRGhGVGx3OGp0ay91RTBjZWJoYlhMdzVVTXJFcHBhdDZM?=
 =?utf-8?B?WjZKM2lzMGFEU1N0cXBXNHZpamcyU2c2a01zeFJOVkxJV0U3VUkvL0o0YnZH?=
 =?utf-8?B?VnJPUXVWcitCdmo3L1FuRnZPWEpQM2greFhKeUxjQlB4WENOcDhXTFQ2NjYw?=
 =?utf-8?B?S0hzUDhKOStNZmpqTVU4NncvSkdkeHV5MVVXN2M3VDRLM3NtNDgwVGVDaUgx?=
 =?utf-8?B?amJadGU5WW00dHMxZDVWSDU0aW0vNVB4MGxqZ3BWNUFuZEJFMndzWVI0TGdZ?=
 =?utf-8?B?eTVZQ1hWRGNWc3Fha25LMk9PUXNraWNyV0JtYmZ2cExHYm9zN0FyN2J2MS9O?=
 =?utf-8?B?a3Q0cVovYU16SndYa29qV2c0RmxvYlVNcDcrRjBsZ3oxdlg1ZzdLeFg0WUVa?=
 =?utf-8?B?M2RGc0FwVUxwZ0dzak1YK0pMVjZiQ1MvOHpSN0lLcUhvWkphU2tsbWZQc2dR?=
 =?utf-8?B?ZGVPWEduUWc2Tk11ZXhOYjdaR2hRMzAzOVc3REd2ZUpYc0VtRkcwSHI1dTV0?=
 =?utf-8?B?cktWdkE4NGRxMXlGSTFYeHJUS044UFVzTGNQTWQ3OTltN0hLcVRWb0plM2tD?=
 =?utf-8?B?ZDNnM0Z2OXZscU9GWS9zaTBhTVZrbFJ3d1c0MFUwSVlWNzdCTEZKTFY1UkhF?=
 =?utf-8?B?MU53S0lpRk1iTHM2eExNNExGRExEa2cyYzczMWFXYUZUNUNTK0wycjV3T0hF?=
 =?utf-8?B?MFFkVWVQaXpYRGhmRHFTYWoraXd2K01Ha3lpc3Jmc0NWaUFpRHh5VmI0WWw4?=
 =?utf-8?B?SDhydFBRKzE1akUxc3NHemJrVDU3Z2w0d3ByelpmeVIvZFA4UjZWaUxPNjNS?=
 =?utf-8?B?ZE1jZGV5bStNQk5lcTBQUWNpNnRwRjhEWDhTZ3pWck5TaGd0TFYxVVRTMlZ2?=
 =?utf-8?B?dW50L281VUxNV0RkYVI2KzB6SVZsaUsvRzFJU3dXaFZ4Skg1eGZnbVFsOWFO?=
 =?utf-8?B?TGRJVFlQUS9sUFg2ZEJsbUpPTmlNZ0FWNGNkZnlVVzdKUHZML0NrS053czNT?=
 =?utf-8?B?Kys2MlJMeFo3V25BdzN3VWluNTBLMHNSVUg5K2xBcGcwdFlFTHZuY2dxcXRB?=
 =?utf-8?B?cS9CZjVwbklEdUxib01ZUm5zQ2piQzRON3ZGaTVKOVM3ZGVIUS85dlNNcWll?=
 =?utf-8?B?YjUzdkZIS21JWmpPTVdGdnBIdEx3U1pNcnFWVmxkVE1rUlR6Q0dWZVdBQUJ4?=
 =?utf-8?B?YzZrVzNpN0Rjdm1MZWN1bXV1L0F2M0JQSFlGRExQcG54a3M2VXVZRGY2Wi9u?=
 =?utf-8?B?UVVVaUpmSHZkZlp4dkp1ZWxFSXpxS1JxY0VkMFkvVUY5V01BZlFWdU9aY254?=
 =?utf-8?B?K1JvYjI3NHhPdGxtRG5YNzczc1JGUjZGU0hGbytFZXZIQnhkMldHcmNIdzFw?=
 =?utf-8?B?NmYrYnF3ampTT0hFY3UvUHpGVjJiRWJOQ0pOQWt5Ny9SR0NlSmQ2YWlySG1p?=
 =?utf-8?B?eGFtYXBYVTVZL2VKMU1kS1VuUThVcXcyQWs0aHVuZ1k0akdQcTNDZVZiLzl3?=
 =?utf-8?B?blFlT0xnekxBK0JDaENkMWlid0NnaC9YcWtpK3A0aEFJYUhkRm9UVlhrZjl0?=
 =?utf-8?B?dk11SWhnaS9DMnZsMzdyUmo1RE0yL25SRlhrTVNLaWRiQ2pYOWFXc0gzZFoz?=
 =?utf-8?B?bmxiTE9SVnhBcTRJN1k2WEtxcUVQbjhVc1d1cXUxQS9XSldzNUFNNnZMV1V1?=
 =?utf-8?B?bzVXUi8vS3laZ25VZGtjcHlIVHh5WnU3dmpJOTRrRzZwLzVvOUJQbU9vdnRm?=
 =?utf-8?B?Z0dNR3Z4SWQvT1ErOEZFY2hZTmpHY3hZU01VcUJ5WXhzZUlKOU5kRkhmS3ov?=
 =?utf-8?B?M29mVGRiVGl2MlUwQnB4d0I3bWtuUWlpRWl6NEkweVdyditPaUhvYkJ2Zmgr?=
 =?utf-8?B?cklSL3lUYWNvSHkyOWxBRnpzRDQydmJpRy81WVJZQ3M5aXFMZTBvM0NNTHU0?=
 =?utf-8?B?TEhFLzRMaHlPYmpLN0hlKzVOQ3hFVmZCSlQ1aTAvNGRNOGdpU09vOGJ5NGFS?=
 =?utf-8?B?T1JwNk96RkFGaWRRakRpZEEvcEVGMWFtbFlpVmNrMnV0aGpUUGNsQkxiM1dC?=
 =?utf-8?Q?DCundOosKZGBpWB2gb4kQwk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5260ca-c89f-4ece-4a88-08d9d45507fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:19:52.2014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBI1gekFiLnkkIu4GW0yAT1oSTxMs0ybUHn0QtE5C0yXxzqliXyrgBrBTngP3gJYWBPa7iGGaW2OpX9Of7A8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 2.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there. Depending
on the amount of memory handed to Dom0 this improves booting time
(latency until Dom0 actually starts) quite a bit; subsequent shattering
of some of the large pages may of course consume some of the saved time.

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

I'm inclined to say "of course" there are also a few seemingly unrelated
changes included here, which I just came to consider necessary or at
least desirable (in part for having been in need of adjustment for a
long time) along the way. Some of these changes are likely independent
of the bulk of the work here, and hence may be fine to go in ahead of
earlier patches.

v3, besides addressing review feedback, now also implements unshattering
of large pages. There are also a few other new small patches. See
individual patches for details.

01: AMD/IOMMU: have callers specify the target level for page table walks
02: VT-d: have callers specify the target level for page table walks
03: VT-d: limit page table population in domain_pgd_maddr()
04: IOMMU: have vendor code announce supported page sizes
05: IOMMU: simplify unmap-on-error in iommu_map()
06: IOMMU: add order parameter to ->{,un}map_page() hooks
07: IOMMU: have iommu_{,un}map() split requests into largest possible chunks
08: IOMMU/x86: restrict IO-APIC mappings for PV Dom0
09: IOMMU/x86: perform PV Dom0 mappings in batches
10: IOMMU/x86: support freeing of pagetables
11: AMD/IOMMU: drop stray TLB flush
12: AMD/IOMMU: walk trees upon page fault
13: AMD/IOMMU: return old PTE from {set,clear}_iommu_pte_present()
14: AMD/IOMMU: allow use of superpage mappings
15: VT-d: allow use of superpage mappings
16: IOMMU: fold flush-all hook into "flush one"
17: IOMMU/x86: prefill newly allocate page tables
18: x86: introduce helper for recording degree of contiguity in page tables
19: AMD/IOMMU: free all-empty page tables
20: VT-d: free all-empty page tables
21: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
22: VT-d: replace all-contiguous page tables by superpage mappings
23: IOMMU/x86: add perf counters for page table splitting / coalescing

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan


