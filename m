Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA7FB07ED8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045737.1415918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8hu-0004oT-Mc; Wed, 16 Jul 2025 20:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045737.1415918; Wed, 16 Jul 2025 20:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8hu-0004lV-J6; Wed, 16 Jul 2025 20:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1045737;
 Wed, 16 Jul 2025 20:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8hs-0004kx-W6
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:26:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2417::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22f5050f-6283-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:26:22 +0200 (CEST)
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by SA1PR12MB6848.namprd12.prod.outlook.com (2603:10b6:806:25f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 16 Jul
 2025 20:26:19 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::d5) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:26:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 20:26:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:26:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:26:18 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:26:17 -0500
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
X-Inumbo-ID: 22f5050f-6283-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnJ24zdpozi8JeYD9zN+Z6W3MAHP/rSH5jIuwJ8KeHP3anw3tQfJ9p2g3VeKzoooxPTo+GxXu4efiGxpnBQYsfrb24cqph9Hq28ZYsfGT+simCb6ovY4VE6FqMnF+0hrlfmfwQCRqudTm0C27Gjasbe26QmG4OabUlrHMrhvzRkUgTD7zsE3/8t66bGt627KGypxsHR+8TsMBhcyeC9JlMdsK6x7eHc2fsfU2IM5pxUwcbOFkwvAdpl9qXpS/pjpjWX5VoD9CeqF5PQsFQ6Z27xwAmdZQp6ERVn4tIJyz9K9HFvWxpci6DINB9qosnCBXy8jR5LIZu3g1eRJay+Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8rCOYFMFf0sfTE2JOGSvpe0Yg+RMjxRaCE5oJnDFuc=;
 b=FFMxjNYBIUq0aphq63bDuPueUu8GG8hMeZlGMZgAwJT8CenfG82ys25FA4TWm0WY3Ih3OByVQTdjCrX4oFss5a9B6YAAMqtQMsv1Y1uIavW4CGNDmMS/Jz/RjKJ/QrFve0T+m04OaD2s5jrW3LIQNWpY0efgV3bNbmSx7i/izxB9Cz0GQ6akq6WCWEGuaINIbsyswJyh950U8FHR6ckqR6Oz9lWxZp3lPJXHnBPvMfchoBTSopxEhzNTRxv7x3/wjqdJwg41mOb7epxjRMR1OIOEZGIABzgPjz53VxIHRLWJRe1Mx7prMt2xHTOpD96Ntq/sqbpsefabHAMl6VLamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8rCOYFMFf0sfTE2JOGSvpe0Yg+RMjxRaCE5oJnDFuc=;
 b=MgExpbtABoEO12qvhZ5zX1Qg8O8tX9rltU3VcsrDGTzZnt6W6CxN+DyMkhSOnHkCZb8hY5+pkJrZwLGpRSmp/Or26xpWRek2X3SfjpTgz20xSrjR0G8LhxVMpNgR8rpfWHa7A753BzdQNMgd9bLDCKIAT5irHwgi9/uaVdv2YG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a3e55514-6820-463b-894d-d5ad03fa10e9@amd.com>
Date: Wed, 16 Jul 2025 16:19:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] xenstored: use fread() instead of mmap() for reading
 live update state
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-6-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-6-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SA1PR12MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0a1944-19ce-46d4-c08e-08ddc4a705ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXR3dk1McEZHNDZuM3BrTytJRkdRS2d5cmhvcGJkVlpoSC9aNDFwcXhFTHNi?=
 =?utf-8?B?T3JZMlhCQU5WUnhSYUpHc1lscFF2YjN5Vkh6N0kzY09qVW5hTmFRL29KMWdx?=
 =?utf-8?B?R2hJSitDamN4M2tsa2pEYi94MU5MWGh2U25CTjhJeTk4c2Y0cG9sc2MvaU5F?=
 =?utf-8?B?WDljSVpVenJlbStFckp4UFFCK3BPb2F3UzJBQmhydmsyb2FwV1lFZGlKaW90?=
 =?utf-8?B?MmNLaHlEMENMMnVyM2hLTHZSSEZaelFtcDh1U0h1SmhVQURpak5CVVNmbWhO?=
 =?utf-8?B?WUlIWFR3SWM4NEpraitDU3JrcGlOMmRhcFJUU05PM2g4THVpVWlxczJmTnpN?=
 =?utf-8?B?aXM4dW92QmdSOXlMRGJoalQ2N3VVQ1NGQ056NndDSFB5R2JURjNJSGNRL0Yw?=
 =?utf-8?B?bGRaWUI2R2EranVQQ3VkZnFZbHdQNXVJQktaV3pLUDlxdkxFUGswb09waUZO?=
 =?utf-8?B?Ym5FaGZIcGJyUm92a0doKytHc09aYnlOZHN6NHBVSStBelhmT25RV0MxRTZX?=
 =?utf-8?B?UXhZeG0zanNTaTM0eXR0ME4rN25EU3d0K3RhWFcwUWJBd0VNdE1kaGtyeUh2?=
 =?utf-8?B?RkVJMnE4UXozUlVhRHBEOGpBakJwM3dUME8va3htS0xkczBPVEdXYTBHUEJN?=
 =?utf-8?B?akcxOGRaYVFaa0lTUWpVNmVSQVRDd3NmYUJGTFNSditKMm9yVnBrdnRlWTJq?=
 =?utf-8?B?bEQzSTk5T3Q1VjRGVHN1cWV5SDJwZnFYa0t1T1ZrcTZ2RlFqV2tpYS9hbWZ1?=
 =?utf-8?B?N2lhSk02bzZqOWZsMXo3ZTF6S213NkE3ZEZaQUVGaHVJVVdJUk9XSDRteE1S?=
 =?utf-8?B?aEE1OFlacjNNSDYyV3p2c2FBYlhvcVhFNy9SQWs1dXZmcnJUQWQrcFIyZlJC?=
 =?utf-8?B?dlRiemlpVDJ4NFdLcEdUMDJNU3AyVDQraEszRis3b0hDMEZCRjBKSmhjbC9X?=
 =?utf-8?B?SFJMQUpYeUYyNE9sMlowZUJtblhmZ3RWem8yRlBYdUl0WldWWDh1Y3NSSFFx?=
 =?utf-8?B?TFRuRTcxVEFaeGRyZkQvMHlQWlJZRFhhVmZGR05YUmRkNGdYRUdGUXBWNWN5?=
 =?utf-8?B?RVJjejA1OC91R1VoL1UyMXNIR1g5OWZ2aGV3SlU4N3VJaXlrQlJ0UXhzS2Fq?=
 =?utf-8?B?SUp1bG1VZy8xT0toblArYjhrN1UxNnhEMFRNeWsvMENtMlVEOTdCdmpEUWw2?=
 =?utf-8?B?TmE1cEJnd0w5bmJVNG5xSmJnUWJ6OCtRMmQzbXBpUmdSYndHci9pczJpOHpH?=
 =?utf-8?B?VldKcVd6UklzWVhsdi8zOThWT2Rac0hHSzdYNW9POXpsN1kxWTZQbVBOakJu?=
 =?utf-8?B?YnJHdHNxME9lNTZQdi9sczZUdjV5ZFltN0RtbW12Y1VhZTd2MjhDcytZWHUz?=
 =?utf-8?B?OWFib1N6YjRsazkwdnRycjFWT21OWjJQdFUrak1SRjZURllWRXBOMUMrTjc3?=
 =?utf-8?B?N3dGc3FwMjhTbTc1eFY4dzg2VkJDVTdJTVgwa2ZhYlByMXFnZGtqd3lPQmpn?=
 =?utf-8?B?OE9qUVlVTTlFYk9nMW1UUS9vTm1qRVhDK2FFa0x2ME5xNnJoanhpaWZNRnVE?=
 =?utf-8?B?d3V0MHBiVStyRG42dklrV0NIamFzYWlOdmgzd3FJWHNidmtHaGdlb0pWMkVz?=
 =?utf-8?B?RW9sNTlla1VaZ29XMVhKR1NjNWZJRFJESmFab0w0Z1l1MXlHOUFTSjdZZ0Jm?=
 =?utf-8?B?YTd1d0RFQ1EyWDBZRFoyU1hhZUJhZVVqVVpuekwrRFNiT0JmNFViT1BzTVhR?=
 =?utf-8?B?T3RDOTBBcG9KVTArTWQ0UGpraW45QXRPWmpUZmM4Z1NqTnA3VlI4Tnp0YUxW?=
 =?utf-8?B?OU95bnQyRVR5Um5zcDFBbUNyRUx0dWpZOWZOa2FDempCNmdoejA1alJvOWJp?=
 =?utf-8?B?alRYOW4vSHhraWUwWE1tdUdZL3k0cjllMStSMXNrNEQ4Nm1QZlN2ZXovZFpp?=
 =?utf-8?B?L0JDWFBTdzNCdnozNFpLNysyaDRzK0dycys4SExFaGFqd2pNVjNWUjIyeU51?=
 =?utf-8?B?MmJ2VTFsdlNockNDcHh3Ylc5T1hCQ2MzV0swRjFySU4zYi9la2pOS20zWm1N?=
 =?utf-8?Q?DWDWY8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:26:18.9650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0a1944-19ce-46d4-c08e-08ddc4a705ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6848

On 2025-07-02 04:13, Juergen Gross wrote:
> Mini-OS doesn't support using mmap() for accessing a file. In order
> to support reading the live update state from a 9pfs based file, use
> fread() instead of mmap().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

