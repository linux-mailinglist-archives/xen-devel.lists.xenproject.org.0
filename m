Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17ACB9297
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 16:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185501.1507616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5F2-00040I-Dg; Fri, 12 Dec 2025 15:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185501.1507616; Fri, 12 Dec 2025 15:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5F2-0003xB-Ao; Fri, 12 Dec 2025 15:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1185501;
 Fri, 12 Dec 2025 15:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aL34=6S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vU5F1-0003x5-CI
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 15:39:35 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bea2a205-d770-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 16:39:29 +0100 (CET)
Received: from DM6PR07CA0102.namprd07.prod.outlook.com (2603:10b6:5:337::35)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:39:22 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::20) by DM6PR07CA0102.outlook.office365.com
 (2603:10b6:5:337::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 15:39:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 15:39:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 09:39:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 09:39:21 -0600
Received: from [172.30.226.132] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 07:39:20 -0800
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
X-Inumbo-ID: bea2a205-d770-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is5GG6cH/9n+QESLq/HPDUgA4kB1XvF2cLtbEF67vE0zxK75DwOvvjV1gNanlP+WCYBYBup5M5a56cqqWLJ2DV9KPIw85rujaWTNQZh9R7K9VGAHxF0wMU7JKesPyQsGw2dXrOu6IYWeKtqc8Lwbp0edmJJ7+9pjTdkla+xk544jX9/MVNMFRXGH6G2lRpIVw10OFHXt5WpRKGFPn2/mSk3weeQ0EAI1Tlapw3Ului7yXtiZ+mPzJVSapnDiqLfr3F2JpZqFS1rUnpCi9RiWXk1RQ//995FA4Y/7S4McOvV0NSKRklrs7Ikx9msqsmbHe8ZklU1/QbN5plpwWYfIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saytSzNsWVJpn/J2fhxZt8d5gzmsd3ZyUq/odixdtog=;
 b=TeJVpYFPXL6skHpXvMCic+IH9rMR82yPXyOXIRlynW1txknkBUTU7La+xQv9xig55D2GAiQXdn/6GbcA4jVRmA5Rgu4WVEUzQNz2pIUbrwFfdTqLn/GNoNsbs+4Ndwwy7zlYKgThgR8OvpifSrsj6iuGbRdjSckXMVTq7kB4df3gKQw983roR4/C6ZszPyS0bS+U7STewMg1qhiWk5EqOV7UGZW3ru3PrPns8vLuqoVnGH6uW/UL0RDcmrP/di+9fo3vZjzhb0fftZxgnqXMcd95Z6qJ0UOR4bdorAwbCBq7s0VCt7sr10g15dsyYvXKNpO3qB6TLtCkUtPuQfdDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saytSzNsWVJpn/J2fhxZt8d5gzmsd3ZyUq/odixdtog=;
 b=Wme9MgnAom2h4+WHWY2FYdAAshOWSl5o+clipUC/JIKc4FnCcaV8phd/gl+QilM0LByDOgaEsQwlhaFdifAmmCth/En8RMpkYjBobMINjDYTyslBrHRs+E8p/b3O6OjPJGlVdSebAvclKFu3Ng8PUn9xJtNh2r9FkBssYCzZCsE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bf2d3cfd-373e-4ef5-9734-91f911d988cb@amd.com>
Date: Fri, 12 Dec 2025 10:39:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ebdecb-db70-405f-8747-08de39949f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0p6bEErS253UUNkY202UTlKQWp2dG1hOE1XaTQ4YWJlcWtFcWVyYWZKSkFO?=
 =?utf-8?B?RFZJUHprbmhjeXQyNTBHaFBTWHlGVERVS3NVK3JPSXFrbGF3OC92ODVSVTc0?=
 =?utf-8?B?N1h2RjBDc2gvVllrN3R4b3MvWVd1RTEycEJ5eWN5Z1d1L0VlK2Q2ZFhjRXFK?=
 =?utf-8?B?em9JbElSS0IxVG9LNElScC9CbkJuMnJJVEllVUl2VEtxeGxaNmJJdG1rTWp2?=
 =?utf-8?B?cE50amVtTVRMZGEzZVV2Z09YRktBK2dCbTdoaXlYNHNYYmswMWZITHlxZ05Q?=
 =?utf-8?B?bFBOdDRiZ0RpMlBucmtMK202eHVSOVQ2YkQrUTdMOUtYVE8zVTBRNld3N3lT?=
 =?utf-8?B?LzZoQzNMSmVzL3l6NU91YUc3cGs4N3gxNlAxMGlpSENBWjVNcmNOOHVLd2dL?=
 =?utf-8?B?RDlZbHRacldmSEJIU2ROeGF3VE1uakx6a1ZjM1AvSklOMXN3VVVoZmVOUGlY?=
 =?utf-8?B?TnRpN1RsYVR6M2FnUDgxRTlHUGdVMWM1c2g2aG10VDlyYXRXekYrL3lCVkds?=
 =?utf-8?B?aEJpdldQRmVQbTc3KzN3eno0dzN6aUY2RTA2cU10b2loMDNNYUlJVzRROGxj?=
 =?utf-8?B?VlBlNXpTbUQ2dnowME1rMGNSRXVHVnJGY3lmNHorYm1ObHVJY25XRHdNNU13?=
 =?utf-8?B?Z1VoZGtidlM3VzRqd0tWVWZYd1dJZks5VDd1c3ljWUVCam5qY29DSnpFQ0lx?=
 =?utf-8?B?NDdNQ1JNaHhqeUpvdEhDZ0EyWjZKT0pUS0JYRnVpWVFHWW4wN1VWS3R6VXFT?=
 =?utf-8?B?UXFKZkhZN1lGZVUrUm8ycTVBSUxLMFJLTkxoaGxjR2NIWnlBVEZjL1ZYOXJi?=
 =?utf-8?B?S2lHaXA2YjkrZkRMWllGVzUzR1RyU0tBZmFxMENaWGsvcWNnSXlUa285NVNQ?=
 =?utf-8?B?Zjl1NXFjcTF1YkI4Zm5udmJTWjNBdy9aaTQrVThyQ2liZ1dpeDBYSTFhMEUx?=
 =?utf-8?B?MDlaM3VlNkdKZHpXeUFtbnYxSmhrWFloL0dBaWtMZFlPNkZOZ3JPL3dxNmp6?=
 =?utf-8?B?UnlIb0xVOW83VVI1SlphS1hGekRXSHhTcXAwQlVNakZ0azdMV3Z2a1hvVmla?=
 =?utf-8?B?UnFOUVVTUmZreFZ0SzNBK29MVzcvUUdacFQyZDZObEtFNlRaUXkzRklHd1VL?=
 =?utf-8?B?RmtPR2IxOTFBcjM1WUFiVHJ2YzBUKzBZZktaUlpMb3ZPeDJHczZob25nRzFu?=
 =?utf-8?B?VmpnOWsrWGJRM1FwN2w1TkdOTlRSOHFRNyszc0FJSE9FMDlUVGxwelpMYS9G?=
 =?utf-8?B?MU1Pa2JNSDBuZldDamFGUzdOeFlMVmVhVHVkdG56ZVJyNjIvNXZiZUtpUDBi?=
 =?utf-8?B?QkNMZWhkWDRKcSsxTFRHc25uR29MUzRFNE55cW1USVkwbXNTYUdiZExvL01L?=
 =?utf-8?B?WTlrNE9xYmh3bzlVYysxL2FEZ0wyVy9iNWcwc0V3UlRtMVZCUGhqV0tqZ216?=
 =?utf-8?B?NmZIWTJQZGpLb0V6enVhVXRPeEF4T2pZVkRNRit3QjRIYm9UNXg4STBjTnI2?=
 =?utf-8?B?QUpqV2ZObUFIMGR3ZENDQ01OSEFyU0JLNENmWDZzc3hkMmVHSWgyS2o3SWNu?=
 =?utf-8?B?cDRCeVNZWkY4Nmh6eFVpM0Z0ci93RlpESEFjYnBBaXVYbk5PMURTOVVQRXVn?=
 =?utf-8?B?YTBXNnJVVmtNWEVFT2sraGNEcWhVbDhtTmZoQ0g4QWczSDcyQkt4Vm1CWTg1?=
 =?utf-8?B?ckJqd0tMdS82eVhsWWw4eVZXb202dFZBVkpucFNGdnQxeHlpZ3Y0N1BOS1hT?=
 =?utf-8?B?cWVXUE84N2F5MEZDbXNhcGxlcm5qY0NIekhXZTZDaThlMGNnMXFZL1FnU3Uv?=
 =?utf-8?B?anNpd0JydldTOXROMkFIa3JjZnVtNDNCeUlaL2xOUGxNcFg2bXEzVE5MNGoz?=
 =?utf-8?B?dEJRWUp1SHAxd3VCdEkrenc4VVRQTUpmVGdKMzF2SGxBL1BBUlJLK3dyVXFP?=
 =?utf-8?B?ZUcvSEV1eFdpbzVVQjVEa0xmeVVCQXUzY0lNblFnTGRRbTNLRVlSNnJ0TWF6?=
 =?utf-8?B?bmptSXpXNFBzVXJDOUI4bTRqVUI1dWRDK0N5eGVPRnJQYVdrc2NuT3htQUJE?=
 =?utf-8?B?Q2lPek9ud0hMaWZnRFFESnpDaEdKK2FzeTVZWU8ycko0ZjhxbXNzbE1VTWIx?=
 =?utf-8?Q?9Kb0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:39:22.3302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ebdecb-db70-405f-8747-08de39949f51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191

On 2025-12-10 21:47, Andrew Cooper wrote:
> On 11/12/2025 1:28 am, Jason Andryuk wrote:

>> +        "567:\n"                                                      \

> which also avoids the timebomb of using blind numbers and hoping for no
> collision.

Timebomb?  The bomb already went off!  That's why it's not 1.  :(

Regards,
Jason

