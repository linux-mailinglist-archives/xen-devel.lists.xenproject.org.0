Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C28CAF72
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 15:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726907.1131307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9PdO-0000cq-DP; Tue, 21 May 2024 13:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726907.1131307; Tue, 21 May 2024 13:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9PdO-0000ap-AX; Tue, 21 May 2024 13:34:30 +0000
Received: by outflank-mailman (input) for mailman id 726907;
 Tue, 21 May 2024 13:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bu/9=MY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s9PdM-0000aj-F9
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 13:34:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7bca5c2-1776-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 15:34:26 +0200 (CEST)
Received: from MN2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:208:23e::12)
 by CY8PR12MB7218.namprd12.prod.outlook.com (2603:10b6:930:5a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Tue, 21 May
 2024 13:34:22 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::7a) by MN2PR14CA0007.outlook.office365.com
 (2603:10b6:208:23e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 13:34:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 13:34:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 08:34:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 08:34:20 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 21 May 2024 08:34:20 -0500
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
X-Inumbo-ID: d7bca5c2-1776-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg6KaBJ3kba66vWJjodjFX6d3bLJE+zMRv4ulhiim2GRDGVg9Bg4qWykxT6T/x4K+qHYk1e/78MgrCSYA7Y/nNyDFAOfHmHg6aOizs8nhjMMyfdwzKr+bjALDgAneHzYwD0eqhnlAe4IQXk+WBhx9bXK1e/we1ox1vV384E1eweqJ7ogK3WdMuz7+LNCf5vu0o5iL6tsrCoAyz+RHVt3vbrQ/YBmKfLpywbGgpgCR8zMR4hChyc/EPI0t0jdpAbF5dJnGWVFEamxkhoKf66C8QpykXCEkHUXHMGRAaMTJDmztnKBFmslMNE6qMMIR68LRFhjXpy1vSEz6zpgW2RvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGGqlmKWPzIrMlF+uoMxnufPGILvr9T9DtT3ZXKA5Yg=;
 b=E2/jabjXbvbvkTFculmgj6BMVykm6rjrxJFjj5UdxNI8Khf6OnF1amEvGlNpsAmLxRJjaQdIWtqMP5lUyA+KrEGZIcfmBraBba929kGERZfcsYFoB8v7ZpWLoDw3LS8GGWpSLk5theZVnl7uUKvrI3HSsmLm/eou1VS6yOUWXT/Q3GrS1TEUaNQEi2+odDSPunP2tMvgSD/s30ROP3kdM4rPnUQiwTYIbgtnJACCCdXxksoWEDufppLr4w2UUVt0mUxmrpgWiFSx8Slvwn9elNXkHtdq+Q2mn3mnsMxiOEK+4O1z1KiSjLdlgvOpO1YyCPEtWBdyQRLR8LNLlr0tkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGGqlmKWPzIrMlF+uoMxnufPGILvr9T9DtT3ZXKA5Yg=;
 b=hcsMFFUmZqZqPYNEENnWfzrMDweiBura7TMWlLK8vZY9myCpy6x+iF/RHDM0z24BpP6+JPFmTMUEydzjEArOCJuEoG6V5SFwY91ai70xuzi6Y+kADClNgrkF4VuC3JCCd7Eiq7EkZXO/ggJUHLA6SRhbLAfnTXu0Ppi/QQE4mhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ff8c8936-8150-45dd-b6b3-0f5fef5deec1@amd.com>
Date: Tue, 21 May 2024 09:34:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] tools: Introduce the "xl dt-overlay
 {attach,detach}" commands
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-8-xin.wang2@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240521043557.1580753-8-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 415d1c85-dcad-4165-85e7-08dc799ab901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGtvVXM3N3NFV3NOY3c5aXFzUEFqZUpQeFM3bHlpS0p1WTVkQmZLcnlOTzdv?=
 =?utf-8?B?amRCWnQ4bVNjb1JwV3pZUzdEVTdIMThzR3g1S3ptM0ZjNkMxdTZXOWovcmFi?=
 =?utf-8?B?UG5iaFFMTlphY2ZBQTR1a0RTajBGRzU0NkpEVzlrOFhHVDFhRll2OHIxS3Zr?=
 =?utf-8?B?b2JRVHRvVmZKOEZSUitJa0JaVC9OMm84SXk4dm85bWVvdnNKTUU2YnNqcUNu?=
 =?utf-8?B?TE9VY3VFdEt0U0ZtTDlrSWQ0K0hXU0VMK3FWRU14RS9rWi9Tb0lFQlN0MlFC?=
 =?utf-8?B?Mk91NXJlQ3A4K1h0cHdHOFZlSDVHZHcxYzJYU0FiQXNyYTFsczA0UjQ3L2lh?=
 =?utf-8?B?VVBGbDRBOUZjeEcxVkIwSzVXcVRVM0dyZGZSTjMxREFKL1JpQ3U3VlFPcitr?=
 =?utf-8?B?Skx4Q1B3eU9oOUF1Qjh5a1EzZnJPM0pYSUlkc1A4K2VJWEV6SFVwbmx0RnBL?=
 =?utf-8?B?WVM3TnNwYUkrK2g4U0ovdWQvM0ZoOEhyYSs4a0tCSHpubEV0SWpoa1FuMllt?=
 =?utf-8?B?VnU5ZnhTaVFwcUk2ZTRDaUJ3WDJ5bWRuUWNZMk9WNHdoQWROb3o3MmMyaWFD?=
 =?utf-8?B?cFdDL3AweWJFZFhxaG0rVGllZ1p6Z2F2SUI3OHZrRmt6aUwzYjJESStHK2d1?=
 =?utf-8?B?TzFTNVVaWnlteHR6dDVBWGpvbVNKdWVoZXRnekpnTWYrQVZaT21aSG42dndy?=
 =?utf-8?B?YkxEN2UwVmNiNTVjdWN1T1VIZy9XN3NIanJMZ0YxajBKT2pVNSt6dzFqYVpn?=
 =?utf-8?B?Qno4VHNhU3F3OENGb0l3YlpVU3lzR0gyNVlQT0tYMGIwVnhXZnZDSUN4RHor?=
 =?utf-8?B?MnhhL0F0dkUyTUFLSzR3SGlSNVk5ZDV1enFUanpLdmtSSmxPUFhTK3o3WWJn?=
 =?utf-8?B?aUpMRW0vUDU3RCt0M014TFptN0RUZzAvWUVLc0YybUxjcElnYTdEWDd3dXM0?=
 =?utf-8?B?OGlYQU96Vml5TXB0c1d6R0lkblRobjByNW94TkJoaS96ZVZyMGFoVTVtUC90?=
 =?utf-8?B?ejAxUml0YUgxeVlRVVl3eGYxbEdkMG9oc3pIbVFRRWJjNUxzYmUzSldCQzQv?=
 =?utf-8?B?ZG54ZXZtNXFQVllIb0VvaG9HTFdkd0xxUDRRUFJFazJCRHVFbGlyNC9SSG5x?=
 =?utf-8?B?S3dlcWtCRkhubC9Ka2c2ZGYxS2xaSitGaVUvUzJlM0RxWmplVy92dHkrK2sw?=
 =?utf-8?B?eUtZaWp3SW56ZVUybWtCZXZFQjFXUXp4d1BsUzNaellQdWYreHcxbWJhVVYv?=
 =?utf-8?B?S0NxYkhHaDNJVjRnV1M0Z3VGeTNFTGFTS29wWkZaak1vdVZlQXd4a3lQZFNa?=
 =?utf-8?B?UlBVekNja3hyRHA3VFFCS1k4bytoNjZnSVNNUGRYM2dLMGVxSUg0YVRxajdD?=
 =?utf-8?B?MDFkQWNURHN1TjA0dE9sZW5OUENZWGlJd2czWWFVWEowOTA2SFZwaUhxcXZp?=
 =?utf-8?B?QUFZRFM0YTNOYi9YTFBjS2hsKys5K05ZNk9nTkliU21XaHJKMlFIbHFoRUhs?=
 =?utf-8?B?a21xTFg5Ni9JS1JVcTFBT1lWVlZUemlHZFp1ejdUSlMrZDhoQVlYa1FsV0RE?=
 =?utf-8?B?RDhBbTN2OVo4MlpVeVBZK0hyNGZGM3NPTFBHS1lyQ09oR0tza0NjRVZFQXdL?=
 =?utf-8?B?U1EyQWhOb25DQkNlMTJrK1NzQ2tXQzFVSHo4U2pJN0FUWUluMG43NVRqcDBY?=
 =?utf-8?B?MVg2RTUwYzhxeDRzbVh5WVBXb1A4bXYwYmVmNXFPK1Z3bDJaakdjL3ZtUmh2?=
 =?utf-8?B?RlluTy9DRDFnV2c1emNrM1oweXNnYmgyTTJTUC9YYkxTMlA2RzdwWjMvbWdr?=
 =?utf-8?B?UGRTb3dRVk5rYk9QWndwUlNvSUhYOEtNTmNkbjA1SXgvL1ZXdUdhV0ZvV2lq?=
 =?utf-8?Q?CX0+VCkyM5Pew?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 13:34:21.5108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 415d1c85-dcad-4165-85e7-08dc799ab901
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218

On 2024-05-21 00:35, Henry Wang wrote:
> With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
> attach/detach devices from the provided DT overlay to domains.
> Support this by introducing a new set of "xl dt-overlay" commands and
> related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
> rework the command option parsing logic.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

