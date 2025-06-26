Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F2AEA8AA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 23:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026977.1401935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUtzM-0001Hv-IS; Thu, 26 Jun 2025 21:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026977.1401935; Thu, 26 Jun 2025 21:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUtzM-0001F5-EH; Thu, 26 Jun 2025 21:18:32 +0000
Received: by outflank-mailman (input) for mailman id 1026977;
 Thu, 26 Jun 2025 21:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ms0f=ZJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUtzK-0001Di-Gr
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 21:18:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19b254f7-52d3-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 23:18:28 +0200 (CEST)
Received: from BN9PR03CA0455.namprd03.prod.outlook.com (2603:10b6:408:139::10)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 21:18:23 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::6b) by BN9PR03CA0455.outlook.office365.com
 (2603:10b6:408:139::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 21:18:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 21:18:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 16:18:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 16:18:22 -0500
Received: from [172.28.201.131] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Jun 2025 16:18:21 -0500
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
X-Inumbo-ID: 19b254f7-52d3-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icWI1a5JOUG8T4Tr/Ibk+ModEVr7yFpjSXy1wb2L4Q1Lodil74PEsR4TZFB43Da80gXNPXl2GmkzOR6UQ8yucuFMctP1dvvG4cxEHXk5sMcARbEnVC4ZAUpetQoetiJxhdlzxN/l6o6nUv2HZLZ0X5h+UPiKXefnNj+MEt1EkAtl1xRNc5q67rusjXoRL6qN4AEuzJa7A42vcfwJU0AeIg0lnXAll70WUysZzOtY+GuvXHp7wcc3/IqJsO570fuk3mxvdBlUn1EeitVS8kSwd7LA6Y1FEOHrFYPu2Kfz7LdV3sBUpZrAUXA0fGvCZh6L0hg7/YZWFpozRs/ieJb3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG9SC/bbvUjsp3Sqt+FjZ4EKyg2m1ayJDhBQ3M3nfpE=;
 b=U2rHQA1cVcXENcwDZNj7uj15MTzSptq2oZdZSd9+dimHoitI5oxy07ekc/7OUOxTMS+SDipkOgL8tamHOkTKm2cjUV1Avfd9hWox+dJCtDIbIRDNF3vK9b8JmDUQGRJbHb76JmoeGNNUfk6YqQZF9V9IWPL+3MBkZKb3umBeY1yho2iddlkLOTariQhy50OW+JgpOUGePt6mbV+NbVH/H0Zf8xiHlvX/FkeygynSg1+v/zC5L/2LwEkQwi3h4KUzHfWSkwaGxtfwpts3FuQcBZCbiwOtaUwwgbCEmcCAOV+FwPpGYINeQ6fEvYwZww/3aKbtxmqFgHeRGnDTYuhPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG9SC/bbvUjsp3Sqt+FjZ4EKyg2m1ayJDhBQ3M3nfpE=;
 b=hnoTPZ6+/58IW/gdqs1tsFeZGjpzYBmC0syK2XNOfETk6TMK4RWZG7Q6bMZ4Qe25h/G3dYHCbWQDvFQeWgaRrC9X1Uvq6h44jTCATlCzDmGyiTPu+hiIEUmMRFqaJLYUO5FAE51xD/IRwB9Ss42MT0j+l1hIMsjSOnIbgvqxorI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <96104098-0369-4607-b378-60b80bb0f560@amd.com>
Date: Thu, 26 Jun 2025 17:18:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hardware domain and control domain separation
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>,
	<demiobenour@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
 <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com>
 <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
 <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
 <381dba84-3108-42c8-a4e5-7bc74d5e1075@suse.com>
 <2e27e128-398a-4714-b019-eab04520cc97@amd.com>
 <48def2b5-44ad-45fa-b052-67520c0961f0@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <48def2b5-44ad-45fa-b052-67520c0961f0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: fe136fcc-c18f-4be2-2e99-08ddb4f6fbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2t5V0VXNmxTSTlLMHBLVC9remljRU5xVzRzTHhkNmd2WnJDWWxpUEhxUng0?=
 =?utf-8?B?YTA4KzRobnBCcm1Pcno4MFo5TGx1TGRwNHpJWDJJS0lqdktFRFFaUW5Gb01Y?=
 =?utf-8?B?aCt3VEJ3RndiWjBGUy9BMTFkUEZpTVRTcU5majB6cTNIZ2s4YkFIYitaaFlT?=
 =?utf-8?B?L0k2MW1HdWhKL0pkK2VGRGNiaXF1ZDBjcmdVcmY2NWRoVnNMaDViR1VOR29Q?=
 =?utf-8?B?cy9rWDM1a2M1UE9CbEcvei96SmlMZ1lnS3JQVU9tUHVpTyswd3NWRnI5Y2JB?=
 =?utf-8?B?dmIyRW0zZGFSWHVTOHV5ZFFwdGZBS2NvbXJleFowcTNKbm1kNFJlMTlvK2k4?=
 =?utf-8?B?TzJEQ0dsTW1xTDlaTk9jZktwdGdtNUh3WlJIU0ZtRnQrU3k4ZjZGeUx0bE5i?=
 =?utf-8?B?c2hxTFZtejRyNXZJWnprWXJDYjZGenM3amp4VGc3d0RsRm0wTTBKU2NpVS9C?=
 =?utf-8?B?NVhIUGlMd3A3aUU3R2ZOYklzL1A2NzNtcG85bCsvSm5aYlRrOGp0ZVBwSmVq?=
 =?utf-8?B?STRid3VsanNEY1ZaK2daRmxhVWdmRlg0NVpFRlZHSjJPOUhpSDVRQW14RzJa?=
 =?utf-8?B?RVFCTkZqMkhJM2E3REhHeUxHcHhtM3RXU3Z5WkRaV01KWThDMnJoemJLNFo5?=
 =?utf-8?B?ek5sL3hzRU9EVEZGODVlOHl3OFZUU0tqc052NnlSa24vb0gxN3U4S1hrdGFj?=
 =?utf-8?B?NGlBbmFqQzR5c3M2azdvb1dMeVJLZk9qbFFPVHZtdWhic0tGQnJrTE03OGZ1?=
 =?utf-8?B?cVIzV2I5ZTEyUk5JWVdrM3p5MlVHcHRseHprUWZmbzhIRHdJeUJtaTlGaGRv?=
 =?utf-8?B?L1ZqMDRLR29QRWpLaUFOOThwZ0RnMWVzSS9VQ09WVmJEOVJsVVB2cEszVlVQ?=
 =?utf-8?B?eXZvZ1R6ek9DS3hCT1dGNzNZUFZHMzJyK2t1ajJ2bXJUTTFuSHNjcms2OXMw?=
 =?utf-8?B?OENMZ0NPVTFFNDNWdW5ibFVkSjR5akowWENiWlM0SkN1bXVCMWdyOFkyQmdl?=
 =?utf-8?B?SldGU2VYWjJoaHBveTlncmJEaW5xYVFmemNCanhEdDZ4SStkWGpLdko3blVQ?=
 =?utf-8?B?Mmg5d2hKUVRoSk9FbVI4cnVRcFppcElCUUZqTFhSakFDYms2N1JLaEJVTVp1?=
 =?utf-8?B?TzBXcGRUSHhWMy9JVnlMM0xsdmNuc2VaaVo2MVA1RHBtaGNYaFRkT1BIQ2ZX?=
 =?utf-8?B?TERJQmFwWVJZYnI3ZlIzSWhyT3E3VUtzaFVoWkxjbFphZTdDUW00emw4MHRY?=
 =?utf-8?B?b0JLdXNiZUJUZ3ppalFhbldONGJsR1JzVTY3b3p3YU9DS1c1bDlQMHlySzUx?=
 =?utf-8?B?MFJWS1FySEFzdnFTREdRRk10amF5dWl0WVFOMVVNaEk2NmZaNS84M28rc3FZ?=
 =?utf-8?B?UGdPWUk0UXMvZURlQWVsekJYSUVZVEFubjVOdXBGb0g1amx6Y3FXR29QeW1B?=
 =?utf-8?B?RWVMN0hmUlVWeU9NYlZNTytmUHp2bktkdVV1ZDVnajlMRTdsNnlOcUxOVnY3?=
 =?utf-8?B?WTFsOVNxOFlxcjEzSHBzOHBSQnFwT05tRFkrTDYvUitKUGI4QmpnaVE2UDVX?=
 =?utf-8?B?RFRmR3UwNlJjUDN4dDNSNzhXbGJBUWFvdFI5SWtsL0tDN2pGSUR0bi9JeHNN?=
 =?utf-8?B?a0lHYitXOHhlT1kxMkE2L3NBRU5xNFM5Q1YzdGtNS0kzVUk4QjJGaVdMcDZl?=
 =?utf-8?B?UE1wWEx3SmJqTEJqdmxyVDJzbVRzK2NjS0VwL004V2Qza081NzJjaElrWCtW?=
 =?utf-8?B?WmgyTjhLejA4bGphSEducmVxWHlBWkdZeS9kVWlrelJQaXF1N0xKQkkvRjdG?=
 =?utf-8?B?R29wNmdiQUMwRWVwaklUNlh1a3cxdnNxeHBaNXRUbVNhK0lvbkRCMW92ZDFX?=
 =?utf-8?B?NDFoL3VXQy9vR1A3T1FhWmFoSEQ2NzBneEdiVUJ6WldTd2Iydkt3Uk00RHlT?=
 =?utf-8?B?cXF6NHFITEpSTkdiZzdXYm41OStQUUdkeVpMUSswQVp6MVRpR0FMU3lzOUV4?=
 =?utf-8?B?MC93dWFJSjFQL3ZCT2tXNUttQU8rcHV5M0d3ZUh5ME5kemFteHZZNzFLZ0Ri?=
 =?utf-8?Q?naJCe5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:18:23.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe136fcc-c18f-4be2-2e99-08ddb4f6fbc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269

On 2025-06-25 01:32, Jan Beulich wrote:
> On 24.06.2025 22:14, Jason Andryuk wrote:
>> On 2025-06-24 01:25, Jan Beulich wrote:
>>> On 24.06.2025 00:51, Stefano Stabellini wrote:
>>>> On Mon, 23 Jun 2025, Demi Marie Obenour wrote:
>>>>> On 6/23/25 11:44, Jan Beulich wrote:
>>>>>> On 21.06.2025 02:41, Stefano Stabellini wrote:
>>>>>> Also a more fundamental question I was wondering about: If Control had
>>>>>> full privilege, nothing else in the system ought to be able to interfere
>>>>>> with it. Yet then how does that domain communicate with the outside
>>>>>> world? It can't have PV or Virtio drivers after all. And even if its
>>>>>> sole communication channel was a UART, Hardware would likely be able to
>>>>>> interfere.
>>>>
>>>> There are well-established methods for implementing domain-to-domain
>>>> communication that are free from interference, such as using carefully
>>>> defined rings on static shared memory. I believe one of these techniques
>>>> involves placing the indexes on separate pages and mapping them
>>>> read-only from one of the two domains.
>>>
>>> How's that going to help with the backend refusing service, which I view
>>> as one "method" of interference? Or else, what exactly does "interference"
>>> mean in this context? (More generally, I think it is necessary to very
>>> clearly define terminology used. Without such, words can easily mean
>>> different things to different people.)
>>
>> Yes, there are different kids of interference.  We are concerned about a domain blocking another domain.  The main example is an ioreq blocking a vCPU.  The blocked domain is unable to recover on its own.
> 
> On which insns an ioreq server may kick in can be well known. A kernel
> can therefore, in principle, come with recovery code, just like it can ...

The case I am thinking of is QEMU providing a virtio device to a domain. 
  The domain has to write to a MMIO area in a BAR to notify QEMU.  From 
my understanding, that vCPU is blocked in Xen until QEMU responds to the 
ioreq.  I don't see how any recovery code is possible, but I may be 
missing something.

Regards,
Jason

