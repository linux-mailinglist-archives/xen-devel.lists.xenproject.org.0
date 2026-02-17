Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLgcO0rmlGmjIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 23:06:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FA15146F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 23:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235279.1538278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsTBP-0005ot-1o; Tue, 17 Feb 2026 22:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235279.1538278; Tue, 17 Feb 2026 22:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsTBO-0005mh-Uu; Tue, 17 Feb 2026 22:04:38 +0000
Received: by outflank-mailman (input) for mailman id 1235279;
 Tue, 17 Feb 2026 22:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kmbl=AV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vsTBN-0005mb-Mq
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 22:04:37 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1fc8d0b-0c4c-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 23:04:31 +0100 (CET)
Received: from BN9PR03CA0905.namprd03.prod.outlook.com (2603:10b6:408:107::10)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 22:04:26 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::6b) by BN9PR03CA0905.outlook.office365.com
 (2603:10b6:408:107::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 22:04:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 22:04:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 17 Feb
 2026 16:04:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Feb
 2026 16:04:25 -0600
Received: from [172.17.121.74] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Feb 2026 16:04:24 -0600
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
X-Inumbo-ID: a1fc8d0b-0c4c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foGmZlnF/DRw/H06qWoHjdHoZQL5FeJQP4OTbdE5fcDs4I5Rrziey+qmZm9zyrgA5olMT49giqmcYbOtTHkDIBaHN7bNEgBspeEDoYm2ptyxUCLl8Z/q2DhwynlQTx4O4gXIcwSJV49bvaQ2PvzdHN5Cwx0knEi5EQ6asIXk5zaJBLysOxauPPnis1aBJyDtwNYE8BMrt9+LwCyS42oC8Y8PKteKjutk81mFSupuBV39s9MEVVc7L3MlNozKUiHhvS7q1bDi9F/OMAPOTrOFU8igbEmeZ8ZsA7v7tkmhg0pVkolZ+cWvstNizsdFRJKsO4RlOV87zvKjR+cDY1VW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VaKNqPDCt7toW4VRa5qYDeCjE1Jgqa6JeUNYNIlx9M=;
 b=UO6zZBNQDQ21JJ4sVCa4Mgifzc2t5l4PXgT4dhqwaH+acXrg+OVUqtxp/+5aAhOX1VbJ9zL+a0qT/6JomGCEehNC6gHc07tT/8vrPoJo1Lrp6oWrjZoOJWHdJYMbZRm5ju3dS+Fys4htKdLLkURBTOcxTccIUCuAnlY3U1qSfUTJ2y5NXRUy4qe+ONzP54IFhYGSXmwvG4U/DGED75QWT9UhgEMjpSryOZ0ngihkK7i/8uFFvMxXJB8cnG0ha+CX+QRyKLAtFmK2F7KJCoEx7FZEQZIHwEH9UwteDXlQf2pNkfyhM+1b5rbwhR8rBCPSX3earW2/oRhSFfRCTsvSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VaKNqPDCt7toW4VRa5qYDeCjE1Jgqa6JeUNYNIlx9M=;
 b=EDlGisjIebAAjFtdSRSNRnXkhWurBGHydI/LX3LZ2PWBrw+HbGfejrEaUDi65DQKumYBc4Hr8XZcPpA/dg7TAy4GPSxRq2J6cITVGA0po7FpXigQR702v0Ep+XOBHOrWshura9wuUzUsP50FlInbjGeeHOa1CoVjTo+Op3Xf4MA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3bbe1fc7-ed6e-43ee-bcee-17502ba56539@amd.com>
Date: Tue, 17 Feb 2026 17:04:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] vPCI: introduce private header
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa54668-d19a-4e03-939c-08de6e708414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTVjNGoyYm91d3FQU21HSXJ0a0dnNW96NXV4eURqbk9PYkVXVGFzNWppbU0v?=
 =?utf-8?B?d3hYRGR1S1BNUVhZLytMckdvY2FDeS84T3Q5djVxVUx5QUN2VGJ6Z2NoTERt?=
 =?utf-8?B?ekJ5Q1ZyMVFNeEdVMHdUY2VLRktudUlqcUpNVGYrTzdJNHVBQkg0enBDQVVm?=
 =?utf-8?B?aG1BSk9KQzBQVk13YWJoSFJjSGtuWUlZYlhOMDZ5cWF5MW8reUhQa3c0VlRK?=
 =?utf-8?B?eGlEdDdVZGFaL2V0UnVpMzRxZnk2SlBHNGxwdkZvYjdpa0UxNzJWZU9UNy9z?=
 =?utf-8?B?NXozNS9tYTdGMkZXVEtMY3UrSUU2YlQ2cFJBVjdkVGFWM1hrb1FsQndLMnpM?=
 =?utf-8?B?VTlQSjBvZ3JaNkhialZFaXZhRURxL1BLV0RlREhXdlVzbWFTNHJsNDl2UUVL?=
 =?utf-8?B?R0lkWTZwVm5GdjlFQWlLNy83WDRnMjYwblkvZDllUmlyQjE3UlA1SVEyZ3FU?=
 =?utf-8?B?bE13T2h3OXNYd1oveHNadVFoSjU4azBCa1h5dW04ZGJtb1IzTmFKSS9IUlRV?=
 =?utf-8?B?Z1VrcnFHQmhzalRyWldJSVRKNTVRQ1hSWmk0VWlNWXFhTyttUVEzTjFvYXZ5?=
 =?utf-8?B?Mjd3MERTOWdqMFlHYmw5cFRYSHYvZ3RSS1ZBZ2tlTFQ2d0FlMENTSVorbTJo?=
 =?utf-8?B?VVNBTWhsNXdsYWFKUWhzb2kyK1RlUk1VekFod1IvNC94TERIelQ4RHp1aDNC?=
 =?utf-8?B?NmtBZmpnakVpQTNsdkJuS0FUamVkVjdTOG5YUGtiSXU1eEF1NUtLZy93MFBk?=
 =?utf-8?B?TFkvTzhYZW1adllsSnVjL3Nya2hiN0FWWEo1dmZpWGZ0eS9CaGlMSWsvYnRj?=
 =?utf-8?B?VUkwdEdWMk9xczNqVlNyTlNBNE5kRW1zYi9zeFIyRURTV1ZSaUlLRDAxTlph?=
 =?utf-8?B?emtXR3RBeEg0WjBTVEZkOVJ3M1pPYmlEYlZVdy84d3d0S1RCMFhFRFkyZEUv?=
 =?utf-8?B?b0hlVExxUTZzUU85bHhKWThhTHI5Z0lrZzVlREFkM0dKNjRYckt5cktNQnRO?=
 =?utf-8?B?dHNXd3ZVSlVhS3BCV1pPYzBFejRhRmZlM3BpOE0wWXd1U3Y5dzN5MkpTNDcv?=
 =?utf-8?B?VEdnczEva1IzTkd5dXI0UG1xVWVVTG9aYzdneU8rWUtjYXFxTDU1M0hYMjlk?=
 =?utf-8?B?TmRBRmZxUjE0Q3ZNY3B2VXZlT0FYbGFJZVowUEEwbUs4OFl5STVDNmJSeVZt?=
 =?utf-8?B?Yk9rVkxCYUZEYnYxMVZaWXAyRE85SDRxT3FVQmRibkc5VlNyRW5QV21wN0Zm?=
 =?utf-8?B?eDdYMlBIRWlWclA1QUUwYmw4V2ppR1o0cUNYbUdmM2Jsanp0ZU1BVGJ4R0Jr?=
 =?utf-8?B?bXlpVXNGV0NxeHdtWkNWVVVQdmhudlJxbmloWi9LcTFUcXFueUNjM2l2Wjgv?=
 =?utf-8?B?M2RGT2VGZWZiaSszZkFtazhyWlQ2N1ZDSlp3YmxSaG9aQ2JYdUw1Vyt2SDhl?=
 =?utf-8?B?R2h6RnNBSkFHUXVKUlJUVXc4UzNQZk1Wb0tTZUZrZTRKeFdwRHdQd2xtSWZ6?=
 =?utf-8?B?TDdlczQ2SDF4UW8xZXFyUTNvdlNHTUwzNzVhRGxibUJ5MU5NbkIrbFY0dFVU?=
 =?utf-8?B?VU9XTURobytpaFZlQkJ2bWY2Uk5PSXFURTVhWVQrSDFTWlkzREg2UTd0cWNK?=
 =?utf-8?B?c0hDWkxGMG4rUVRIZDV2WTJaRTZXMngzU3VtSXZkOGQwcDBzRjZCMXlVSW9E?=
 =?utf-8?B?Znk4RWlFeFJHWi9hdWFuUGRhVU5qRUdZNDl0anl5RFlqN3FvMDBwNzJsZ0k1?=
 =?utf-8?B?STBrTWtVQnNBcUIyU2hRU3VjdTZ5M21tREZGa2xVMlMvVVNCYVllRGk0TzU5?=
 =?utf-8?B?d0Y5WnEzZ2h2S1JDSkx2d2ZyT0ltbVVJSUhkcnR3N3ZxMEZ5V3p0QXdleElG?=
 =?utf-8?B?MlByUGhBMHdjMGVQL1FwTzlOYmJNMFZMbWdQN2FmbW41UkU4Y0FXaEJ4NFI1?=
 =?utf-8?B?THRzeFBJaHEwaFBhVHNCMjJERWhURkt5QkVOdVNkYzEvY1dGSFU1ZG9jQ2Ev?=
 =?utf-8?B?ZlFBejlxaUtYUGxyU1A2KzlKNXFJR0Z1ZVFHQ3pWUHBkR0puZGMyRGoveCtw?=
 =?utf-8?B?dDJYMTlGa3pjMjNFOFZvT1hIdURJRSs4VnAwVTVkakFGcTN0b1FSVVB1SE1U?=
 =?utf-8?B?SGFuMDRKa2dtVk5xR0VuaXhIQVJCSVJnWkVKVGk3amYwZk43S0kreHIySUxz?=
 =?utf-8?B?L3pqeER2S2xMQW9malE0aVRxMGc5ZUVOMFJYV3Ava3duRzFNR3I3YzUvV25w?=
 =?utf-8?B?N0lzaE5XNllIWWs5YS9NMXR1czh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	goH/hzFLQS2em/ACxGvsyCrG+3jfJA1SukxfM6e3BeH/kwR9736b8RkvFMtLvi4ACbAHtQckisidntU2utxcKzyOoDz2Ujh+6OPAB1s1bh4XbpnN7ptCd5BOkJvgW4jKjFxfZ6mKmhp41dA8zucipTZ6GFU9soY2rOGl6/NHsO4DCW2yXgeWNeFyz9b1dcbsUulDgzDy2RvsDPasgyAJueRYS9mCyvrH7shWzcwVXVPlChVPvz2bzc+8IVQ+bjF9/IPPVTsC8gsu4X3ROUW5u+HxXSbYAuEOY02sImvhqnL9s2t6BlVrih3G8X4XSDD2AMf8k824v0UNNf6S28bmyLivPjJ6NsF1lKolbXGLhKj9QTqUzsGfDga5tfa8Kvs3XjKdSvcFTnzFuu7shUthksEYDGvN1if20FEV+7DNHuric4FHqtq3rw9GHwBu0bj2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:04:26.4114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa54668-d19a-4e03-939c-08de6e708414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4C7FA15146F
X-Rspamd-Action: no action

On 2/10/26 05:53, Jan Beulich wrote:
> Before adding more private stuff to xen/vpci.h, split it up. In order to
> be able to include the private header first in a CU, the per-arch struct
> decls also need to move (to new asm/vpci.h files).
> 
> While adjusting the test harness'es Makefile, also switch the pre-existing
> header symlink-ing rule to a pattern one.
> 
> Apart from in the test harness code, things only move; no functional
> change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Subsequently, at least on x86 more stuff may want moving into asm/vpci.h.
> ---
> v4: New.
> 
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -14,8 +14,8 @@ else
>  	$(warning HOSTCC != CC, will not run test)
>  endif
>  
> -$(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> +$(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
> +	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
>  
>  .PHONY: clean
>  clean:

Can you please add the generated private.h to be removed upon "make clean"?

Also, can you please add tools/tests/vpci/private.h to .gitignore?

> --- /dev/null
> +++ b/xen/arch/arm/include/asm/vpci.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef ARM_VPCI_H
> +#define ARM_VPCI_H
> +
> +/* Arch-specific MSI data for vPCI. */
> +struct vpci_arch_msi {
> +};
> +
> +/* Arch-specific MSI-X entry data for vPCI. */
> +struct vpci_arch_msix_entry {
> +};
> +
> +#endif /* ARM_VPCI_H */

Out of curiosity (not asking for any changes), why did you include an emacs
footer on the x86 header but not here?

Otherwise, the rest of the patch looks good to me.

