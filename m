Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A3B07F13
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045763.1415957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8yi-0001eJ-Px; Wed, 16 Jul 2025 20:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045763.1415957; Wed, 16 Jul 2025 20:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8yi-0001cr-N8; Wed, 16 Jul 2025 20:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1045763;
 Wed, 16 Jul 2025 20:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8yg-0001cl-Sb
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:43:46 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fa3726e-6285-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:43:44 +0200 (CEST)
Received: from BN8PR07CA0013.namprd07.prod.outlook.com (2603:10b6:408:ac::26)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 16 Jul
 2025 20:43:39 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:ac:cafe::4e) by BN8PR07CA0013.outlook.office365.com
 (2603:10b6:408:ac::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:43:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 20:43:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:43:39 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:43:38 -0500
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
X-Inumbo-ID: 8fa3726e-6285-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO79ccDDwbrnLaoe06saMZbKIGj9R1PpgSOcye++lOuHW1EnqpOGR6+bDp9M/4i3LDjDkLzZ/e1rQLacHRGUROu4Z+RVr/mI7ioXJ0oTPiyOkNdmxQEjPVGM9wN2n8ZDGe7KvFjKWMJYZSrzBjg+j+l1yuaDLY4qo0M/N2OSojJZn3NfgnGee5XxO7qb5swud6a87DK9NUEPXXORotDFQDijMoZNYfVueP+2fdyJlTmTz6NneH0i4n4gM9aP+QxiLt0m6/BZMMQAe7ASYbiojU2XqyZFkF8mMyLjya75Z518ZTM1X0jQC9G1gakvIDT+fqD1uZFxrSb0wHVJH/iJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+USLEDpilb5rRWJA9j1zyCM6FIc6ByaFqh+RHtg0C/8=;
 b=I/eBc6HCDlbJx4xjr+3QXiLb7Q6nUnpv4lXiYKUhm+WLgJ0pvtpE9RFfAPLFeV77aPo+OUmgDSbTH+XhakFz5USnO8T1RdOSfLiGhGpV5hMC5v8feSFT4D5ZegRJOx7TTljwcI9cEgQKmq/ILFFe64PyUWAPvzTNCPREA94Kz4Q5VunwlxX4ahl1D2Xzfl10LYKUR9iCTbBRthSCQ+kvuZuxy1/ckR8nRCoNlH32MvmWM5eXAytN4fTY2MQRtL2r7CstxZQyiIPA0g8JQ8MXMMLEprhmliaxUhojcE9CwZsaaIeLYUu74/mWUoH4hSUu/9Wx0vMx08NBGyuyunJBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+USLEDpilb5rRWJA9j1zyCM6FIc6ByaFqh+RHtg0C/8=;
 b=Q8GgSFxsALjRYwTRc5KKRWX9so38nk1ckVP8qwXiu1POOZKkcy7OjKpkznWOEtLRNJ43+7lFqfXPX7Jo3M7/yIsVIui1KwMJ49ZdwKp0fM3CagrJl5+BtBOGZ0IofbXW1bLF0Q15/V/Cy/Q2OT+X/91zUoVnboWqDtJohGFw500=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a273014-d1ed-47f2-a159-29402a490465@amd.com>
Date: Wed, 16 Jul 2025 16:36:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] tools/xenstored: make stubdom_init() live update
 aware
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-10-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-10-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b60b56-0c70-45fc-e09c-08ddc4a971f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?am0xTFJGT2xoZ3F2aEJtVklXbjFZSDlRRWhyYkY0Njk5em9qNEVHWHIrOHF4?=
 =?utf-8?B?emJ3N3hkTVlXamQ0ZHJtV3lIS3Q2NE4rS0pTU203UGsreHh4TmVZLzNQdnl2?=
 =?utf-8?B?L2FKWGNDTHA4cmVkNHFLTmJ6U3Zma1JabllMUzkwZW5JT0F1TGloN2NXU0F2?=
 =?utf-8?B?bHZKaW1hWFI3M3I2MWNSQ1UzUWhMT1RTTTVuaitGdGlZdThDbVFBcDJabjl5?=
 =?utf-8?B?Tm94Vm5CR00vMjhObXlEUU9wUnYwWDZxWFN2RUtyb2VhQkFCRE40QTVFSmU3?=
 =?utf-8?B?cEVtVnJ4WmI5Nkh2MHlHK3ZCNWQ0MGNFVVA1NUFmSndldlpIcUxxaERPaXJX?=
 =?utf-8?B?aEZ1bnNvNklXT3J1QTZOVnkzTnoyc1NjWHJyNGZWeWJsRUZ5OGpSTHVCdnZV?=
 =?utf-8?B?aDlkdE5LM2h5YWJjNWNGVWNMWmVkejl5dm5kYzFsUzJ0VHdabzFkaURNaWVu?=
 =?utf-8?B?N2dlaFlpUk52TEIwbGZheHVacWdhT2dYZmtzNTQ5bDJMaUhmTVJEQ2RkMERs?=
 =?utf-8?B?VHNRblprc1F5NWpWaThhSVNsNXEzSTNiM1NiNldGOHpXN0NDcnhsY1FRbUdI?=
 =?utf-8?B?UThjN2x5Y0p0L1p2ZS81NEJnbjhFdkR1Mjdjb2N1TEhPT08zSlNGRCtmS2ZG?=
 =?utf-8?B?NE9KdmxpMFRMUm1qdDRrL0NmQlk0VVl1RTZqS3JOMUhkd2Ixejl1bW8xZjNr?=
 =?utf-8?B?V25yQ2NOQUhJODZ3OG1EQ3M0UDVkd0Z1M1FWeUcybW54MDN3UHJxUzNOTnhZ?=
 =?utf-8?B?U0pmQk8wSzJlZDRZKzBWYWNJNTEvK3ZRbkxyTW16eG45eCs1NE1oMkF2YkZu?=
 =?utf-8?B?M2NmNFJPMWZmeit3eXlic05BS1kyaHNkcXhDcDNNRGtvT1Zzak56TUcrdUpO?=
 =?utf-8?B?ekxSd2M0aWZHYk9oWGk2SGZyTkRRbWRPMW1uTHJMdXZsbG5EZld3enllUC82?=
 =?utf-8?B?YmtERC90MnY4cjNRWHMzaU94cnRIUHhWdXh2cTczSUN6UzJWOE1rN3gwaFJT?=
 =?utf-8?B?Z0FUaEdNZkwrY3A3UnhlaXVHcXBWcG1jN0kwbWxyYWk5SEpvRFk3Slcvb2tx?=
 =?utf-8?B?SmJaN2U3T0tYcmtPYzdWY2t4dkgrOU53WGF2WDdpQ0RUa2ZLUWMwbUtOT28w?=
 =?utf-8?B?OEVjY05Ecy9Fcjc5MSszMW1wNW9ERlpzSWRjRStSaFpEMnNMZEUrSURJU1BN?=
 =?utf-8?B?YTQxWXh5SHRseW04WnBCRHdxUW5SdnA0TnRxd2gzOHpISTgraUFuTi96Vm52?=
 =?utf-8?B?aExLOFFMMVlMVTVpbDkrdi8zbXhLUWQ0Q000TXo3ZW5kK1VtalhWMFpFdGI1?=
 =?utf-8?B?NktmNHc5a1RlUnZPRjFPclZkSW5hNWRZSjNFNkdkeUpMQWZTeGNublVxblpk?=
 =?utf-8?B?cGNYUlVhVTdNQmFzRk1lRGRZZ2RJRytYVG9XVG9Ta2FiSWVWWGM3VkxFUG1H?=
 =?utf-8?B?WWJRYXkvdmpnMnFzTFVzWUlnb0h1aHJvTEpVU1B3Y1c0Zlc5MlpxRzZMVE5k?=
 =?utf-8?B?T09xb3lxZmZRODFUUnB1aUNmVjd3dlk0OCtJRllSSU9tMTNYK3h3L0JETEkw?=
 =?utf-8?B?WkpyZjBNL0xtVmZSYVVuMzNhWVlBVDZMRzVnMkozaUkvNS83MVJkeXl6ZUhR?=
 =?utf-8?B?czlqQ2lNTnNVMVpSb1dXdWFHSXVjSVNyZHZ3UUx3U1EyRkg1YUtpOHlPa1B4?=
 =?utf-8?B?eWZubkxvczg3Zmo1MWZvUDhJeEJtRG1ycUU2UGNLcG96UUNDWEpJc1hNQjNz?=
 =?utf-8?B?MlRMWGU1S09EYmYvL1d3ZEVuZjZsNG9UbGtDWUpFU1FKdDVjZjZqNVg0R0Vp?=
 =?utf-8?B?UVFUVWtvQlBkd0tsOFpkN0pEdXJKZWdiSmo2MW9pMlg3QlJ3NHphV05acENU?=
 =?utf-8?B?UHlncGtDM3lQcldOTXBselBtTGo4OWROZFlMOUlqT05NQnJnK25Wb3I1c3NT?=
 =?utf-8?B?Z2lTdGJLYysrQXAyZjRDZXhPcy9VY0YrTDcwVS9PNElDaVVqczZXR3VjSlo5?=
 =?utf-8?B?aStFTWdjT1VRaStaZTZvZGRkVkhST3V2eGxaYzRFOHB2VzFjVFA0c2I4cmNX?=
 =?utf-8?Q?hg5yyS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:43:39.6752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b60b56-0c70-45fc-e09c-08ddc4a971f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252

On 2025-07-02 04:13, Juergen Gross wrote:
> Pass the live_update bool to stubdom_init() in order to be able to
> handle it properly under Mini-OS.
> 
> As stubdom_init() will (re-)create the 9pfs device needed for
> reading the saved state, call stubdom_init() before lu_read_state().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

