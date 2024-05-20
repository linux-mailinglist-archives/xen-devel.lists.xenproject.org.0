Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B228CA24E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 20:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726330.1130604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s983b-0005rM-CD; Mon, 20 May 2024 18:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726330.1130604; Mon, 20 May 2024 18:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s983b-0005p8-9C; Mon, 20 May 2024 18:48:23 +0000
Received: by outflank-mailman (input) for mailman id 726330;
 Mon, 20 May 2024 18:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l4Ei=MX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s983Z-0005om-Nh
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 18:48:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85907d1b-16d9-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 20:48:19 +0200 (CEST)
Received: from CH0PR03CA0378.namprd03.prod.outlook.com (2603:10b6:610:119::33)
 by LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 18:48:13 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::e7) by CH0PR03CA0378.outlook.office365.com
 (2603:10b6:610:119::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 18:48:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 18:48:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 13:48:12 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 13:48:12 -0500
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
X-Inumbo-ID: 85907d1b-16d9-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCf06PXOAa+LnBg6IusSn7sG7tXNuZ2uTT/PkOnAGZa5ix7Rj+iYTsIw/0+Jwty3iV9DOXgI4HVGnp8GnuL3ChPO8m3rCzpL1lnpzeJpDj4hZtY5F0CgP7pbvEuhqo0RGHNXauQ121Ae8lQtKecuvErMGV9tB2oZnwMx8LwBLRfpBwNVNYlfbnkYIEwlvG3t/fK7CNxOvHIYIIUZwTG3Q2X7sYX03QAENmKR8DxaMGreLDzNkYtNf0JUW8uElMPDu4Yp/OTnRvsTtcoobYjZvfeuX3dqnUeS1R4+VrxFdUkmQVB9vZyTeEQkMWBs3DCvwDcwOrswK2ffPYpDpI1sEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypj/b6oBZ1LDZx4wW75mCIvDToozVqoLBcL8se35bug=;
 b=SH08hLr6uHEFPuIqQ+zblX9NA2Qcl3F2PhwXZJ1nGT8SSY0hBIxr5h2se8FQhoxQJnyGa5FvydmS1wilewDa2oMxZ9MOutKD7P6i8gMHTp4JeAhQjm419pdnafzEl4zA4rj9FP3K+9y5t2a4yf9vCNdtBvcQ0dtssKReFT2vMtqwkJSFkYe59K39nImC5vN0BjM891Rlb2MJoafKrat5CQfKH323xreEINfZipTJByzJK1FrHFMnheEFY6G3VJ5PSJXYlA6pwE1qWyeXh9budGSTQr+390QKT8pEVs7fcVSviw6OAuYvFZF6uioRccbQSwytd+2BElih3pNefWYZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypj/b6oBZ1LDZx4wW75mCIvDToozVqoLBcL8se35bug=;
 b=pI1BruSTp8awO42YVsmGITPV0Et5Co34Cvt/p5KO/AZ6+Jy3V1UGuGht+vdwTKfD6SK3vTUfARgOt6fi3crNHdqUmh2asKCL80Wv52o85jpI3E2X27+OEPBOiNsNM7mu1zlwZ37BLbdKDIIcLC+AfNWR3zBvCbg2mwQd9lJDyIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <05fc6a62-4e88-4771-8662-368cb8b63721@amd.com>
Date: Mon, 20 May 2024 14:48:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] tools/xl: Correct the help information and exit
 code of the dt-overlay command
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Anthony PERARD
	<anthony.perard@cloud.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-3-xin.wang2@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240516100330.1433265-3-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|LV8PR12MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e51242-4977-4c26-a7b6-08dc78fd6722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?by9Pb0w3anJLTUhsZFJQUVVHbjZ2Vk85bDBMTEhjblQxcUNaWGNsaUcxdVNV?=
 =?utf-8?B?NzlpNEZleTNCT3puRG03ekx3enJmTnJNbnYwSlBXSVh1azYrQ0I4SFBiVHFX?=
 =?utf-8?B?d1EwZEtqWmpjbEFFTm1RRktkQnZTeEJ0QTNyNzFoeUJOZ1pQdWpsRExQdFZh?=
 =?utf-8?B?VllZbUtMMW42ankzT24xMXhHOGJEWWliaCtCSU5XL1oyYW1MMFFHeVR6OEdR?=
 =?utf-8?B?Rzc1THY0RWxLc2V4OFk3UE9sVjBGR2piWUlIS2dvR2Y4NmhMdytWYmFqa1JR?=
 =?utf-8?B?QmJ1NkpqMnRMWlJyUmZ5eGZhNDVSclgxRFRYOFRvYzU5NHVTeUFYYXNJUnh0?=
 =?utf-8?B?ejFmOUtwcDhyUG9TdGE0Z20xRFZFMzArbGlRWnhPUHJESHNqTFR6SEZzK0d0?=
 =?utf-8?B?UE1hTnBEVGJwTC95ODlmS1VWUHZwbWRTUDh1d3Bhb0R1aW5QZGFZZ3dwVXZ0?=
 =?utf-8?B?ZmFLTjd2dndsZFFlaDBHYmFlbUt6L2pNYUZZMU1EcGhxbDgyVTlhM3hnbzMv?=
 =?utf-8?B?Y1JyT05uZXBKN2QzQ0szMkFVVHo4M01saG96ZHN1Yno1bk9WVlpvcHVmcVZR?=
 =?utf-8?B?T2U1RmdSanA5YVhmKzZHdkhYY01CbGJRU3FMZjJZTThrN0dUSFV4bHBId1Mx?=
 =?utf-8?B?bGpNVEUwUDVXQi9xdHBDbmhybUVNeFNCMFNBcnIrMTJrWEpCK0hPTFFZTCtN?=
 =?utf-8?B?SHFzOWVyWlEraG1LelBaaGd4cHU4bnI4VmlmSlI5eTlZOG9CQ1VNS3hJVVNr?=
 =?utf-8?B?R2tXMitCQ1pMQ2hRVVZvclphT1NQZElZYTRvQmF3UzdhTE5jVlZCcXZWMEJm?=
 =?utf-8?B?NlVmNDIzbXZJcW53QTBrZWsxQ2RoRDhObHNVbXVoaUJqZXNobXRCUk1Rd2Vh?=
 =?utf-8?B?a3NSTzd4emhYeFZFam9yUW8zOGFlTXNuQU83QnRXSEJnc1hmeDVqZWRiMVBo?=
 =?utf-8?B?WFowSmlRMUpseW5OSk5lNUFmZUhiWkIyU2tUWVFBa0hlTzNjdHFkTUY1M05k?=
 =?utf-8?B?MFBORTEwOGhvVXJRMGM4YWxNMVZ2QWpNSDNjdzYwTlFFOUtLSFFVaTRvL1RP?=
 =?utf-8?B?TnZ3ZzlnaUNESncySENFWkEyYjk1WUdpa1hBUTRMeHNGQUlIOWMzUWh2RlJj?=
 =?utf-8?B?NjBtcG1XeDRZTVY5blFVb1h1N1FWVmlENThmSzErajhqR3Zrc3F0MFpFZGdv?=
 =?utf-8?B?TjhGNVJnMzJ3TE9VREtvOHBNZzFZRjlYNThIOE0zWW9RN2loZnNXZkxjYWxo?=
 =?utf-8?B?MitQT2p4Vk1xTHloQUVIUGlHRXVIT3F2V2FKd1VrUnJpTDNscnZtcm8yWkJo?=
 =?utf-8?B?WU1QRkpDekU4dXh3MTdEb0wxNGQwNFdsSnNrb0UyTkUyUTVySXN1RnNKOGk5?=
 =?utf-8?B?bEw0R1FkS01MQTI0YlA3aHJiU0twTEZGTExnZlVPeGVaQ0tmMU1DRUpmbUc1?=
 =?utf-8?B?RGRMeWZHY1NzM0h5OUxrK0hnYzNOZ0NDUXJReUY0QWw2Nkg1MDF5RkxLMUlC?=
 =?utf-8?B?N3dFOHdVbWxGRDdIZGxmbHFQeTlqdkRWck9xaHBOanJFL04xZEpkaXhGdS9T?=
 =?utf-8?B?ZFh4WldhOThjei8rOWhNbjVUclk4VlFJVHU5OVUydTJhUXpMc2t5SmtTeWZs?=
 =?utf-8?B?V2JSdmR0NmN4cEZXSzFGYWpHait4TFErdWd5Nm43Wm1CU0NXc21ZYUkwVDV4?=
 =?utf-8?B?Y0dTZ3IwbGs0K0g2QXJDT3FIMHFzRm1vUGpkUDB0WUxrUkFWYi9vaTFOWnNH?=
 =?utf-8?B?VGpjbEtvNFVNeXM3NHUzSXRLUmozVENnRWgycE9TWjdRYTJxRTNGdzljNjlv?=
 =?utf-8?Q?AkbH6Z285Zfv1gjwCBQrPwgi54HXRrGosMg7U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:48:13.1369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e51242-4977-4c26-a7b6-08dc78fd6722
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262

On 2024-05-16 06:03, Henry Wang wrote:
> Fix the name mismatch in the xl dt-overlay command, the
> command name should be "dt-overlay" instead of "dt_overlay".
> Add the missing "," in the cmdtable.
> 
> Fix the exit code of the dt-overlay command, use EXIT_FAILURE
> instead of ERROR_FAIL.
> 
> Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
> Suggested-by: Anthony PERARD <anthony.perard@cloud.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

