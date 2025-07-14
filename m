Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831FB04990
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043074.1413197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnv-0006Qn-42; Mon, 14 Jul 2025 21:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043074.1413197; Mon, 14 Jul 2025 21:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnu-0006NW-W6; Mon, 14 Jul 2025 21:33:42 +0000
Received: by outflank-mailman (input) for mailman id 1043074;
 Mon, 14 Jul 2025 21:33:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQnt-0005dt-0R
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:33:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:200a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321021c5-60fa-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 23:33:36 +0200 (CEST)
Received: from CH0P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::33)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 21:33:31 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::16) by CH0P223CA0015.outlook.office365.com
 (2603:10b6:610:116::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Mon,
 14 Jul 2025 21:33:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:33:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:30 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:33:30 -0500
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
X-Inumbo-ID: 321021c5-60fa-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVinGYwmNgqnAsUDT6SPhxolcDRYXW7m+iB8w0nIPvuoInLYSwpgHCxAEY8Z60EJ53ABWXdIKttns3S93laCwGqAU6RqIowJFKptLr0w/VHlu07T9GnGgMaDjktm6ArNdx5B45ie0+QruQkiBvYExObFkcRL6cqpQxg8dTDxQ07OrTKXVpe4zOwbAgCZdvth37pwQfnqacX87hlFHmVEcR4PJvTKjWhw8d52gbZqGYIIRJDVmkb9Bdr2QhGU6q4hAbND9vV4+B7NnGGA6yWNxBleslvSMec5HZ9uM/0754pz5lfmLVAi6K8P8PBhijdBw0+ouFlwHHS7YEq3FIlvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CleyZsMicTx94o79O5O4QUYFYDfCc1mHTEGqGwEo04=;
 b=pcWquQpdgQByvouhU6Ho3qFdIn4qB2qHtoAM8MQ9AU5Y+r64TZcwCugXf8komOhdFjWyUFPhEL8mjO58DiFvjgLeRM3MfUoPk6Y3GYmaVLofhvmla+rI0dogyvgzjthWrgZcAPYoeA9expZ0aE+tHhrPSjjW2PJ6c0cQjIgD5upj/XmaZYWSGXw0ftmC01r30+jPiRNAMIIrcQfmDJj45LYPC3sR0FQzihGH/SfaFr4WH+1c5blimYXpUae+/hQap4+IzyusstYYdXtaN7cbSnBBos0zCwBWfs8TwZ9RN/RGZhZbDc2czzFbYG9cpdXSilU7k+Tj9NRN+GbiOSSeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CleyZsMicTx94o79O5O4QUYFYDfCc1mHTEGqGwEo04=;
 b=XNRVEnD82vXTrrqNBFpKlfGiuFDflAxvIh14chU/7qKSfZ2XYK5I82lhiEV6is9JynwifzlvJeQ7SGeGF0AmHcHePtZaJ5LtidKNeY7hU9KXugrNOb7gNd7AKc9cMiDb7cTIDQYeR0f5uLuk5PEA/NPzpaoQNzKjAUC7ELEN/oc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d4804d0e-49bd-423e-ac1e-866251d1a024@amd.com>
Date: Mon, 14 Jul 2025 17:22:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 15/19] 9pfs: refactor init_9pfront()
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-16-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250702081254.14383-16-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: ee58331c-6751-4aaf-27de-08ddc31e1450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NG9KYWwwUklqSkJTR3hXaXVmNHdxbHRLNW10bit5Wm9oQjd5amxxZndLRUdq?=
 =?utf-8?B?TGpQK3V3aWJDRnJYTFZoRlFKenBTdFE1Y1U5eWR0ZThMZVAxM2NVbVZvMzdB?=
 =?utf-8?B?VzhxWTBCRjcwcGYwaklsM2QvbjdUcjlxZXROMlp1STcrS0YxYjd3dFVlNnRr?=
 =?utf-8?B?UUF0L2I2VENWcmpkanNsR2ZhdXpaL3RCT3E0VEgzUzNLUXR2Y0crd05jeUcr?=
 =?utf-8?B?M3VzSmlobjZkSUlVdEVxb0hPdi80Rk93UzZLMlFGdWdqSXJVaXQxOFdmWHRs?=
 =?utf-8?B?Q280bXoxUVA0dG9WSStqK3ZGOXFqczg4VHpQQmZwRUYzaXlPNFc0dGxQVjlQ?=
 =?utf-8?B?elN0SWRrRjBwR3dNWERzNk82VmFNQTFoeklZNTB6NGthTGl2QktTL1pvVkpa?=
 =?utf-8?B?V2d0MW5Ma2VoQkhCN3hPNmFrUHVCK2tDZkNTM3MxNHNvR3YwZzhmS3pwRXpn?=
 =?utf-8?B?b0ttTFY3OWI3YmlGZ2ZxalZoM3Fwb0Q5QjlnSTN5VkttUEh5RlpnN1lkbHhl?=
 =?utf-8?B?aUdReU5hR0hjUERJZHNOaHQ2ZzI0ejBUcm42cmJZRlZuWm1GQjVENVRmOHVF?=
 =?utf-8?B?Mm5INzZmQ2N1WXZaSUhDZ3VESGhYaEVFZmNGN2xnc1FRK0VjNS9NTXRrelgy?=
 =?utf-8?B?SU1FSFo0S2hadGF0dTl0eUVwUDNqaDFrKzhqaEpBd3FwVlNXaTJQK21mY0pu?=
 =?utf-8?B?Q0RXUjVZOCtXZlpUejdEVkFpcWd0SnZ5SWNDV09KWVRRQUxva1JQWGlvTzdP?=
 =?utf-8?B?eWdVRG83ZUlVemtTdWRycFl4aS8yWWNuZE1FWXdKNCs5dzdXZjRMWFE5cUpj?=
 =?utf-8?B?eHJ3cDYzQ0hiaDI4RitkdzNoMkdFcnZ1Rytwc2p6RHRZTjArR0lMcFN1eHlT?=
 =?utf-8?B?MU14dnV1Zk5QMDkrdTc5NXVxMzZINE02aEVYZ3N3VlhjOHNycGpVOXd1T2dV?=
 =?utf-8?B?QW44SHozc1U4U1RPeHJnaktRNDVYZGl4Z3hnN0F4MGM4RTl0ZnVDOVR2WXFJ?=
 =?utf-8?B?bjR5QjNsT2xwKzFOaUplTmZjeUVVcGwvTEZIbDF4RGZZUTIwdHZtNDF6Z3o0?=
 =?utf-8?B?SHd6Q05nN0IvQXczK3F5UW5yU2RROHhGSmRRKzROelBWUWtiN3lGOFp4cXpJ?=
 =?utf-8?B?aDQxbkM1K2k1RUwvZi83K05EbG0wcGphZnVJcXpuQ3hQb1JOZXJ6eHVMeUVx?=
 =?utf-8?B?dlV2OU53MTArempvTnNzU2d1MVhPakJCSzNLM0c4ZUxyS3NPNVl0c2dFcVFD?=
 =?utf-8?B?QitFeG5pb1dGOE9DS254dWJnMEFnSzRQSG9yaitrNnlueTd2aklkdlZYQndz?=
 =?utf-8?B?dXVhTjlJanhtWTNFMk1HTHkxc2dvdzA3Q3RuenVUZXBRaEtNMGlKSDE3SnMz?=
 =?utf-8?B?UndRek1kTVdQS096WmJIdkVPcms4eS8vYTF2aFNXbzRjVW5CcVJGWExPS3dM?=
 =?utf-8?B?QlNDUzdLSVdyeG1uWGVGQWpDT1VyU1pUVW9KSGVmT0dERUNKRGt1N2h6TmI2?=
 =?utf-8?B?YllOL2hhQXVyNG52TDFTQ0pOejBpaFhycGJtOVU2ZU0vYk1mc3ZYeDA4TW12?=
 =?utf-8?B?TE5LMmNaWHpQd0pNdnEwYmRCckQ1U09aNDVxNFpJR1JIZlFjVWlkR0U4RlMw?=
 =?utf-8?B?VWhFQWN5M1ZtcFREcWdXckF2VjJzMUh5ZnRFL2prdHg0YTVkdkFKT1gvTlo0?=
 =?utf-8?B?UlhuaFVVcHNJdndETmV1U3NYS3RRT09hbWtYVjVBSHMxWkRTQlkxeEtYek5q?=
 =?utf-8?B?MmVvMHIyL05weHNnNkU1SzQzR0h3OVYxTTNqYVJlNC9BTm1Hb1IybWFCeWJY?=
 =?utf-8?B?Skpkb000Tyt2ejFxMFhYV1dmUVZpMWFzeHI1S1NuVlg3cUtoYVJHWFhWQjY4?=
 =?utf-8?B?UndRZmx3cEJOdVJWMU5tRGxVZlhnaXROeEIwWjFURzVlbmxzVVllamppN0lR?=
 =?utf-8?B?OWhabElXREhETkpyNjNtbTRZK3QwTU92STRaSHQ1aFBDZzh0RkVUN3RVcGZm?=
 =?utf-8?B?bXdKdGFGeW5UZEttdVplbnhucHpFajZFNXFQem9VMGQxdXU5OGtoeVBOWm9X?=
 =?utf-8?Q?UN27Cl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:33:31.2896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee58331c-6751-4aaf-27de-08ddc31e1450
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449

On 2025-07-02 04:12, Juergen Gross wrote:
> Move the Xenstore and backend interface related handling into a
> sub-function in order to prepare supporting reconnecting to an active
> 9pfs device after kexec.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

This includes the replacement of gnttab_alloc_and_grant() which should 
at least be mentioned in the commit message.  With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

