Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F09B994B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 21:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829264.1244343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6y4I-0000vx-Hz; Fri, 01 Nov 2024 20:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829264.1244343; Fri, 01 Nov 2024 20:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6y4I-0000uT-Dx; Fri, 01 Nov 2024 20:16:26 +0000
Received: by outflank-mailman (input) for mailman id 829264;
 Fri, 01 Nov 2024 20:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3cE=R4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t6y4H-0000uJ-1a
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 20:16:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2413::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ded9e8-988e-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 21:16:17 +0100 (CET)
Received: from BL1PR13CA0346.namprd13.prod.outlook.com (2603:10b6:208:2c6::21)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Fri, 1 Nov
 2024 20:16:13 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:2c6:cafe::ed) by BL1PR13CA0346.outlook.office365.com
 (2603:10b6:208:2c6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.12 via Frontend
 Transport; Fri, 1 Nov 2024 20:16:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Fri, 1 Nov 2024 20:16:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 15:16:12 -0500
Received: from [172.25.174.226] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Nov 2024 15:16:11 -0500
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
X-Inumbo-ID: 25ded9e8-988e-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjA1IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI1ZGVkOWU4LTk4OGUtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDkyMTc3LjI4OTExNiwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiaU1SD+U415NrSHz9GTEhYqzCsqMcW5W0+2EW82A1JI3xtNKcZaSmMVyKzX1dKa+PWIdUSECll6xW6LGICxTMLZaLaOdm8BIzzOvPcm+INUkcwZ8ojMWtvFKtkaI3bJAs/GMNobL5DP5vulGinzydw6w5u1fg1aGl1hGlPbvy6k0b6rQk2URwdwh9zVyI+7i9grh7kfY1bYrxY3dOnavMazxGOjyhpQSoQnloDd8hclCf8Dd22R4MAFcOEaeZIS/xoTU5Lql1bjCEBGAacA42p4efpGe30AZs8IM020y7MaXpQrV1cIPbw3KjMGX7uhr2gE48Z2RTDw647EUArHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykschep8H+RQ6a0c4ZtUcLYesFV/xENGwfmukt2woXM=;
 b=sUzoLH/V3kWmhGJ1ZEsLhacAByQ/cV6l9owrxZoLTbNoxkYUPKuZDA9+/WfuBNcOn7jFB+VCkz7SsPHLwiDScMLzsqD/QH3ELH19TL0jtbKI4isvqhpMy0naOv4t4yARzzArMmTpI3ksRx5zd3dvNgeeYdc+HV/iG1q1oX8ixHoQMz8ao8lvjnKqhVpkK7YdDUygYQLrIi47nKRkuMYUuDWcp+RPcozbb33oJSDKZorWg4FJ8TospmArg46AdrcFYwS4BT9e6R4B0Av7gg6683Jx+OzPS00Lz5uenr3MVHloUDqLqcTdMZqvfQYacKCnQzIMqoqRx4YF1ZIknd6OMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykschep8H+RQ6a0c4ZtUcLYesFV/xENGwfmukt2woXM=;
 b=eNEOwFto0CtoXTY+17OsBLc2y7yCc88MyKBkA1A1vh6B8T5nKr1qy0LTL5guAhuE95Jx9/clfz8y0qT2/bj6kzTFq5J87e110eKF/HWEUGdNakohXzgzJ+zFOh6R4g3NInx+C7TTOkvjGrMOZ3MLAm48N9ZiDsa/I8vVxrjnAMY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
Date: Fri, 1 Nov 2024 16:16:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4b2a11-0f24-4d95-1b27-08dcfab2087d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2NJakNkZTR0dHgvQ2FmMXNqc28vQmFGbWNyeUFtRnVCck1UUjMzOGZLOXNm?=
 =?utf-8?B?YVR2cHpUUzA4SVlwaEE0d2hCZjJVbUViSGVWb09qZEFUdWJKdEQxL3p3QzY3?=
 =?utf-8?B?NFcyWUJPb2ZiZVgwTzl3Nk95YUpZZWgyY3FVb3g2NkJabVRxQi8zamNvdTh6?=
 =?utf-8?B?aEc5cXJIS0FRWDZudHJZM04wNUYrVkkrOFo5QnRDRmZieHh4bCtMQjhKeVNw?=
 =?utf-8?B?SjRIbGZ2SjB0WXZTT2U1OHZHaDBUVy9QM3BtdEhqTEl3eUFiWmhkbFdUdFlr?=
 =?utf-8?B?c0Jab2NhM094RmtXaFRnUlIwRGJmRW9IZDBiZXJFUjZQQUxwcmxSU3o0NWJP?=
 =?utf-8?B?a0xVTzBta2JzM0RHT0hpWkp0VkVnRU9WWWwxZGlZRWg4Wnd5Lzd6Q1RMR3RB?=
 =?utf-8?B?SlhYcWkxa1pkMkxveFlrQnhwNlhETUcra01MZVRqVTFNc2wxUHpibXRLdkti?=
 =?utf-8?B?bFdMZW9VQzVFajhYMjVGblMwWkMrNVlLTTR5czJ6NnRIaDB2eFUzbUxQc1pS?=
 =?utf-8?B?L0Nrb3JTdTVHbUFrWEs0TjhLcW5RQ0VXby93S1VFUTJOclVEOGxUZUpmalNl?=
 =?utf-8?B?bThuSHZDaENzZGdNUUtqVUZZTFR0WWlibzI1K0RhSmE0MTBCNHRoamh2UFZG?=
 =?utf-8?B?cklZTUFYdmNuM2cvTE43OW9iQ0g4MVc2dE5odFJmZDVwU2VKVnpYQWlyOThU?=
 =?utf-8?B?NUlleDJ1aG5nVkljVGFnMjltZ2FkWUhNcmdoNjhwR2krcG8vV2NYRk9QNHRl?=
 =?utf-8?B?eVE0UWNLME53TWFWK3JkSkRJM0ZTOGlPZ3FKOE1FY3FnUXRZMUN2L3QvN3M1?=
 =?utf-8?B?Zk5DNlZOM0tVSjJNVGNRdllrQmI1REluR0RmTC9aWlI3VUgrN2tXQXNmUGJG?=
 =?utf-8?B?SkgxcUJ1bFNuU3JaR05sNTNtY2hiU0phSk9HcEJPUWtjamIrV2R0SkR3Z1Av?=
 =?utf-8?B?S0dkNHFCR0h4dW9QOGJCN2crQWE1WmNKVkg5MjhpMlZyWmNvQllTRFVhZlVT?=
 =?utf-8?B?NVZpZ0ZHVDI0bGFtK1o0cjhoalhjbVgzWUtkVVJ2OENucUtwLy91NnNMR2E0?=
 =?utf-8?B?KzJ5dkNvTzZnY01FOGhvUDlNTmE0QkxaRmxPdGRDaW1PaTVGQ0YyRkZlSEtz?=
 =?utf-8?B?TlAwQVZrSFg3RnJDQkUxYS80TjZaS3R1aUF0cnFNelM3eXRDTlN6L3E1N1F1?=
 =?utf-8?B?UXRaY1hXQTNwLytZdDJIZUQ2SC9QVEpjcFIvZGtDc2dFRlIyUjByUTJyWEFB?=
 =?utf-8?B?VXJ1enhndWE5MHNxNE5Xdy8ydkd0L0pMQTlhY3VLdU5iSDEwUG9kb2ZNdURF?=
 =?utf-8?B?WU4yNjNWeHVwN1huOFovMkFYSStLQ0xUNHlzTENXaXRtQ01Xdk1hMFZrdUdC?=
 =?utf-8?B?QnpnRDcvNXlQaDZjWWxjL2RVZjFSUkk0TWVSZDlXTlJoVWdHREh6OFM0a0F5?=
 =?utf-8?B?eko0QVY4SzlKbDZkc2wzeDMrOG90UTZoLzBNS1o4Qk1HNUM2R0dyZTZHdytI?=
 =?utf-8?B?ODY2OWs2NS9LbmZQeUw0ZzRpWlZQUVUyTTIrY2R0cHRHdjU3TVhIa0kxMW1a?=
 =?utf-8?B?SVJzZ3ZuQUJvN0VUMzhFSFoxdXRFVW00UTNYQnFTMUErdXhGdkhNN2lMYU1O?=
 =?utf-8?B?WmRXWldtM0dpNisxRnlKM00rVnkyWnFXeXVJVjhITU5xZ3hnbjZBNzhleE4v?=
 =?utf-8?B?UmVGMFl5TGp3dnRSN3pURFNJL05DZWNBV2Y3eUdIcHdUM0gvY3oxb2h5SnJU?=
 =?utf-8?B?bjg3bWJDUzkyaENQSXpObnY3L3pRUkVRdWtFVW5DN3BNTDBPNk9xUVFqb3Nw?=
 =?utf-8?B?SGxHa0R0T0RVSU41bVY4N2NVSU5vNUxnK2lLRjFyNUFCcDZlaFBSZzhXa2RF?=
 =?utf-8?B?cGpvd0RpdXprakJESFg2M0w1bE5tcGFtajg0WGlsZi96ZjRaak1NekQ0MThQ?=
 =?utf-8?Q?OQ1lUmIqa1o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 20:16:13.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4b2a11-0f24-4d95-1b27-08dcfab2087d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

+Daniel (XSM mention)

On 10/28/24 13:02, Jan Beulich wrote:
> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>> Add links between a VF's struct pci_dev and its associated PF struct
>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>> dropping and re-acquiring the pcidevs_lock().
>>
>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>> VFs may exist without a corresponding PF, although now only with
>> pdev->broken = true.
>>
>> The hardware domain is expected to remove the associated VFs before
>> removing the PF. Print a warning in case a PF is removed with associated
>> VFs still present.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Candidate for backport to 4.19 (the next patch depends on this one)
>>
>> v5->v6:
>> * move printk() before ASSERT_UNREACHABLE()
>> * warn about PF removal with VFs still present
> 
> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
> just after an adjustment to the commit message. I'm instead actively
> concerned of the resulting behavior. Question is whether we can reasonably
> do something about that.
> 
> Jan

Right. My suggestion then is to go back to roughly how it was done in
v4 [0]:

* Remove the VFs right away during PF removal, so that we don't end up
with stale VFs. Regarding XSM, assume that a domain with permission to
remove the PF is also allowed to remove the VFs. We should probably also
return an error from pci_remove_device in the case of removing the PF
with VFs still present (and still perform the removals despite returning
an error). Subsequent attempts by a domain to remove the VFs would
return an error (as they have already been removed), but that's expected
since we've taken a stance that PF-then-VF removal order is invalid
anyway.

While the above is what I prefer, I just want to mention other options I
considered for the scenario of PF removal with VFs still present:

* Increase the "scariness" of the warning message added in v6.

* Return an error from pci_remove_device (while still removing only the
PF). We would be left with stale VFs in Xen. At least this would
concretely inform dom0 that Xen takes issue with the PF-then-VF removal
order. Subsequent attempts by a domain to remove VFs, however
(un)likely, would succeed.

* Return an error from pci_remove_device and keep the PF and VFs. This
is IMO the worst option because then we would have a stale PF in
addition to stale VFs.

[0] https://lore.kernel.org/xen-devel/20240827035929.118003-1-stewart.hildebrand@amd.com/T/#t

