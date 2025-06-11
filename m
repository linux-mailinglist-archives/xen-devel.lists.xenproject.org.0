Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D58AD5D68
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012043.1390590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPXx-0002uF-3T; Wed, 11 Jun 2025 17:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012043.1390590; Wed, 11 Jun 2025 17:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPXx-0002r8-0Z; Wed, 11 Jun 2025 17:47:33 +0000
Received: by outflank-mailman (input) for mailman id 1012043;
 Wed, 11 Jun 2025 17:47:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPPXv-0002r2-9E
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:47:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b8700ec-46ec-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 19:47:14 +0200 (CEST)
Received: from DS7PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:3b7::9) by
 IA0PPF95ABFC125.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bdb)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 11 Jun
 2025 17:47:09 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:3b7:cafe::21) by DS7PR03CA0094.outlook.office365.com
 (2603:10b6:5:3b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Wed,
 11 Jun 2025 17:47:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 17:47:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:47:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:47:07 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:47:06 -0500
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
X-Inumbo-ID: 1b8700ec-46ec-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWhkfNJHlY2wm+bvjR6U0NIZXPYINTwj5/c8YpPy9Wz4XzpdYMjlqTAuQWj1PucIWMfEFT6EiUgI5itGF7VyrpQZ/NmtBNQcdfUT4ha4QHIOUNDm0oBhkGB9/dQoR9XQTQl9k0tjJ9j3w73vLkEYxY3NOqqS/+VIf641vHeIp1y8j7VVqU5xGkwBRcys+O33E0PETP8Xyk5QKY+TXUDT6Lq2pqJLCLYkfMYILuNyrar3QE2P1RTSezhwQHuTXs+tFDqzy+/pJGN3ofiDHk3i7W3Zj19kQBPhFcAc8ERMNOs1k1uGSirXMiOpjjjurmUfCH7KXA6VrxRzXuvDLF1jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hyWWQPC6eAmVxESsZ5Fjyitqm8UWy7uYu+kgaAlnGc=;
 b=jtYtIIZ+MAs/tJVVSxKuUk5/v5tf/ytM6Nv1FJGWvHh+ULyN57+n6uxiPpyR1C/QZKBTAAYoc0unABtmr2rol1zBDJf6RPB1ChCM9nN8mdUthy2a90+zbtrFv31SFRdhbOiowFniKLBFSEztIVqQGkEnfLcdyhfCYV0k3RPGPftHwlSAQU0AOy+aItdNkTPOnpQQ8aqdzyF3b7tro14MW5OcMBviJ7byr4ioiUqZfJjLQOeT4JoiGxBV8UeiminbT/mgQ8iubl3krsTqZk9cTQK61bh3lU8aIUngmbTMQ54Vz/akXOyqPlM42DdlSb4dtIsozzEGSfCHFtnpHTZ/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hyWWQPC6eAmVxESsZ5Fjyitqm8UWy7uYu+kgaAlnGc=;
 b=HHNDduHww0mK7MZRJAVXn1+cnxj/OsKUBnEn9ZIOMnpmwQ8NlNbh6ng+BDmQUNLT00mJe4tdP0mBXuiUNhOW/jBeY1O0pxqbBJVyJfbEBApD9J+mOyD8s3SyvAoOmhZvatSrIxuLbSJxDmznIvRhpnRYgj4bm5S3es6UuLtzJco=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4b0b7554-e22f-4ef2-9236-bcc2079842d2@amd.com>
Date: Wed, 11 Jun 2025 01:08:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] XSM changes for split hardware / control domain
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, <xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <0defc4e7-382b-4651-8255-652da17a2129@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0defc4e7-382b-4651-8255-652da17a2129@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA0PPF95ABFC125:EE_
X-MS-Office365-Filtering-Correlation-Id: 6829eb76-e937-4d77-010f-08dda90ffcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnY1VGJtNXBzM2xadEszY3hCUnViNXd2T0JkcTA0WnpCQ3RQaUM2VC8zdWcy?=
 =?utf-8?B?QjNocHpsUk44K0FrWnFkc2o1dlNGNFpkYlVBRXczTlZuSjJkRmhqUjEvZWhs?=
 =?utf-8?B?R1p3VXFWS0JqODZSaFAvUWN4dktFWThCZWZkZWxudW1CLzhVd1lGUVJsdVh1?=
 =?utf-8?B?NlNHRFIvNDhlQXpnMDdkU00xUFIzQ245NktCblVLZVBoOHVJaGtZMG9UaGNP?=
 =?utf-8?B?THhNK1NpaHloQmRteFd5aWg0dEVJYjlIYUxGMDhmMDByem5mNGsyTlZCclFS?=
 =?utf-8?B?UVErZ3VHSTI4Slp0WURvQVpmbStnRW9vbnh2L2drK3MwZEk3Wm9hYVRqMUh4?=
 =?utf-8?B?YWpSdzJrSjc4cXV6R2ZtaXBVejBBc0NmL25oMDJJTTN3ODNNYld4SVhNMThG?=
 =?utf-8?B?YTZBaGEwMUlzaFFaZWVva2hNdTRrN1UvYXFheFJCSE44NkQwSEdXaERtSHkv?=
 =?utf-8?B?NzI4TmtaRVhCWGtFbzBaUmZLbnFVYUZYWWJXcTAya3RmaS9sL0pOb1FsT2Ro?=
 =?utf-8?B?ZW1kTXZhL2pNZHFsMkRMWFhFa29ERDZCSUdYZUI5bzRMd0RUdm9ORUhNcG9H?=
 =?utf-8?B?blVaM1ZDbzY3L3VtR2p1bFpseHVCTVcxQi9GYks5Qkx1ay8rdm9tbVVNZDJ3?=
 =?utf-8?B?SzQ0eFpHYU9CbGwybVE1eFYrb0dLQmgvMG1IM3AwSlNMZ3pUY3dTYW0zbHFx?=
 =?utf-8?B?c2VMSTZHanlCSHY0OTlKNytVUTVWbUJ5NE95NFBUc0Fpb0dpa0VhMk5nWnlu?=
 =?utf-8?B?b1BCUHIyM1V5YWwvcjMweW01NFNWSFI0QXpWall2ZnYwZGR6TmUveHMxT00z?=
 =?utf-8?B?MTJVSHpxTFg4SE1UKzFCVS9YUytvWFZCaDcxQWVJYk5XVGVpR1NmSDJWc2gr?=
 =?utf-8?B?T0xTUE9hUk9qNnVLSVUzLys4Z3VtQWk3R09CYjY1bW5tamthakZHMVU0QWpR?=
 =?utf-8?B?dmE5VW9pN1RMZEZqYjJMSHhVVE5scmlKbU9aSThEcGpCME9FZG9GOUU4dXdG?=
 =?utf-8?B?VEYyRWFZWEtvbnQzbEdiTU9EWGlxZ3NQZ2xBL0JpdHVVSGVYZmFHMWxGemxO?=
 =?utf-8?B?MU01RVNJd0ZmOXJ3elN1M1V6ZUxya3dkY0xCUnBpbmw3R1A0ZkVQMWJXa3Qx?=
 =?utf-8?B?T1c3azhVZHlzLzRsWTRLQXdzMmVPVlVzbkZpSmFCUVlEclc5eURCamtsL0k3?=
 =?utf-8?B?a3lSREJEcWUyb1UvdmpIazFDc3A0aEJkUGp0YjZncmFpdldFZmZ4eTgyY2tQ?=
 =?utf-8?B?ckdTQjlXWlJPVlZFU2dyU0NIQnpPM2laSjltU3B3S0JsWEJaNU9wc0ZHbEpm?=
 =?utf-8?B?WVdMWkhaT0pydmlIRUhYMEQ2bUljT2lRRHJFeEpCREhOaHl2MkdWd1hsOHVO?=
 =?utf-8?B?MmNJSHFwZkdWV1RMZUVwMmFJZytMUGRiZkFaZEJPK3pQRW1pV1VZaE9xb01q?=
 =?utf-8?B?NEJxMDRtZ2dWeEhoMTdyN2t1bkFPcUJScENUWUZiaEwyaXF1d2MrR245OGtu?=
 =?utf-8?B?ZUVPOE1oRGxDL0xQR25pRTFiR3hUS1p0Zm95T0FONFBldDM1bDZOV0ZXNXgv?=
 =?utf-8?B?REFJais4OVh4dDloZ0t2bDEwSk4wZnU2dHpGZDVRdXd1eUU1NlBBRDEwNjRN?=
 =?utf-8?B?UkRrZHBtSW9mTVc0YXpCMFR2SmFNWFcvc2ZvbVBCdVpnVVlqTnFlaSsvemM5?=
 =?utf-8?B?UW9RNXZsM0RXTFBOSDBXSmMxYkdNcEF6ejNZSnJUZVR2c1VCR3RnRTgvUEZC?=
 =?utf-8?B?bFBISjdtUjBqTFFWTkpKOEV0ci9TMWJSaThzcjZWVGRnYzNiMkl5Z2dHZUJX?=
 =?utf-8?B?M3JodGxzNkQ0NW5VZ3dwZ3V6OEx2TVU5Y3doSHJmcEx0TzhyRkROaFVzeUkr?=
 =?utf-8?B?M3VmZVo1NEJnREtTSXAzYmppOGNGK2E1QkwyZE1LV1ltZThzT1VpaVJvS3Jj?=
 =?utf-8?B?Nkg4Nlc5YlRCaVFJaGxoMVI2eEtIZGN3cHRrY2I5S3Vkay9obDJmZDYwREtB?=
 =?utf-8?B?UFUrQzFjWk9NUTNKNXZYUmdqL1Bmamh4b3plL01JUWJyQURTR2dQSVpySUY4?=
 =?utf-8?Q?67+G+T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:47:08.9767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6829eb76-e937-4d77-010f-08dda90ffcfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF95ABFC125

On 2025-06-11 09:28, Jan Beulich wrote:
> On 11.06.2025 00:57, Jason Andryuk wrote:
>> Theses are the broad changes needed for a split hardware / control
>> domain.
>>
>> An earlier posting gave device_model privileges to hardware domain.  For
>> this posting, it was split out into a new capability.  This way the
>> operator can choose where to run the device models without making the
>> hardware domain have the permissions.
>>
>> The first patch add XSM_HW_PRIV for the hardware hypercalls.  Unlike the
>> first posting, the control domain can call these hypercalls even though
>> it doesn't really make sense.  The idea was to keep the control domain
>> all powerful from an XSM perspective.
>>
>> SILO is changed to allow control, hardwware or xenstore to service
>> domUs.  Xenstore and hardware will use grants for PV interfaces.
>> Control wouldn't typically provide PV interfaces to domUs, but it is
>> given the permision to do so.  Again, to keep control all powerful.
>>
>> xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo this is not strictly
>> needed.  xenconsoled could read Xen's dmesg.  If it's in hwdom, then
>> that permission would be required.  SYSCTL_physinfo is mainly to silence
>> xl messages, which are mostly cosmetic.
>>
>> Jason Andryuk (4):
>>    xen/xsm: Add XSM_HW_PRIV
>>    xsm/silo: Support hwdom/control domains
>>    xen: Add DOMAIN_CAPS_DEVICE_MODEL & XEN_DOMCTL_CDF_device_model
>>    xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
> 
> Overall I can't help the impression that this level of disaggregation simply
> requires the use of Flask.

I have thought about that.  The problem with Flask is the complexity of 
the security server.  We don't want to have to deal with all that code. 
A fixed policy is easier for our coverage testing.

Exposing separate control, hardware and xenstore capabilities, it makes 
sense for the default policy to function with them.  This would be a 
coarse level of functionality, and Flask would remain for fine-grain and 
MAC enforcement.

Regards,
Jason

