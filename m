Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE675B3D3ED
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 16:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103795.1455171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjG9-0000eM-Lt; Sun, 31 Aug 2025 14:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103795.1455171; Sun, 31 Aug 2025 14:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjG9-0000cW-JH; Sun, 31 Aug 2025 14:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1103795;
 Sun, 31 Aug 2025 14:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8wL=3L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1usjG7-0000cQ-Ng
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 14:42:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2417::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af47f05e-8678-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 16:42:14 +0200 (CEST)
Received: from SA0PR11CA0020.namprd11.prod.outlook.com (2603:10b6:806:d3::25)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 31 Aug
 2025 14:42:09 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::f0) by SA0PR11CA0020.outlook.office365.com
 (2603:10b6:806:d3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Sun,
 31 Aug 2025 14:42:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Sun, 31 Aug 2025 14:42:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 09:42:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 07:42:02 -0700
Received: from [172.17.238.12] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 09:42:02 -0500
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
X-Inumbo-ID: af47f05e-8678-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOL8FJS0/qPmvPcjgt8U7bKjZOrFQwx2E8uZ9NeTJ17JOom+Ty9+f/HDoFwVGvBlRoORi1TChjASJCyf9v5VrGQuH2oWaBjWrkc5E5P2dHrmzdO6Qy16g+Le4tfOyDHmmcYdxahgZO8ibpRhe7FjizOF+mdHoIjaK9ejjyMZl55jEU/KR1ChIMv4dps295IX7UqAJcwFZcjSrBJVP9r5rYt1sdZ82NLMQl3kHigYE+gjBicIUBTIHnlnl5b8ZemXfUwoiGsQdupbJa0IAIFF7dmJSD+wt9eNLK/zfu+f/8MuYGkaAy7AMz268As1vbHpzi6U4z02y7HEm2/0QP7dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYefZG4gNLNkaBAmS/Edmymgpv+xYAJFMTGExgmzmpc=;
 b=b28niprxvcVS7i1bFDXLS3IV4nRDerpXG3xmfv4X4FKY77zTX+o8Ux5HcKyjewxgS5cXmjOk13ftKDyP9LzQiXaW3FwVVW0FU9d5gX+CIDq7ClDpVOHLBeP2wehoo+Z8XkqTjA0km6eKHj+y81jHuQW3OH5y5E3NT2lyRl3f275PfEKW/G2b4vhPGeKa9FSi4+sfF2GnPywst0TYz2ZxbgrSJnIx1DpSXtYE9ff0dm8oW+W9EGR/3SGHMAcC3QCzynPoYVLedi4KLfDd7+i+SxW1OKqz/NONwfbuzEnFIMfvymR7qQx09yjm+21qDCq0FAxINZjVaAfIbGoenDctYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYefZG4gNLNkaBAmS/Edmymgpv+xYAJFMTGExgmzmpc=;
 b=wGR5FkBpXalPKWvCbEPoDjBAdB6ZgROJ+qX+CnncDop9iLB+HBGWe9UK1NpLPoF6JS1UFFZSU12T2Bapwm6gjpZXoRrWTaEQDcU8+gosFNIB8P93s98znT2Md8NjGYM3kEPL1r8EvauO7JYxyOmgMLjaClfkyXPsUiwdlH4ZtOw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <63a7e401-6a85-483f-ad38-04c99e3a1c2f@amd.com>
Date: Sun, 31 Aug 2025 10:42:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/11] tools/configure: Introduce deps on json-c lib
 for libxl
To: Anthony PERARD <anthony@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-5-anthony@xenproject.org>
 <39b2fc9e-44db-4f42-9586-1dcdac118659@amd.com> <aLGoYGgLHL9kLmzT@l14>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aLGoYGgLHL9kLmzT@l14>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4a2a18-afae-4e4b-80ec-08dde89c9002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzA0NXpOUDB4a0IyV3A3aWszY08yUkF4YVUxcGpta3Y0Tno4TjQ1dXY2bUs2?=
 =?utf-8?B?WVRGeDFBakh0R0pxc05ITU5SckhCaEkybTlNeVMrRG5DcVZsemxPQVJOa0Zj?=
 =?utf-8?B?N1dNWWJNZytlWXlZTTVkZjBLeGplT0lTQ2RLdUJRSEZwL2d4blpEVElnSHF5?=
 =?utf-8?B?NnY5OTFrS0Z4VE8wS2ROK2ZaakNKSFphdWx4eS8xb3k5U2J2dmorZnhOMjNY?=
 =?utf-8?B?WWhqWU4vSU5Ed1E5d2lBTVV6UTlLRGVlM0wzV0VyamxLRUVPTG5IMUI4Rnc2?=
 =?utf-8?B?Nlp1T3kvdlpVUDNsTk5LNGlGNXd3S2NSbmFITWJ4czZ6bDRuNVpZV0JVWEdm?=
 =?utf-8?B?bXIzNDFTQTNzbmhESWpZZTEyNUcvd3Zaa2hKQXdPcS9nUVJSMEN2MlhmNHI0?=
 =?utf-8?B?ekQ1RU5qL1ZPQ0UzWWt1Mlo3TksrRjhydHRUc3hoNk9pT0lBQmlOazh5UGk5?=
 =?utf-8?B?cWFkVjNEVFN6TXhqOVVrdXlCNVZqd2VDeFh2d3Vtem50bmpxTjc1MlhDM2hJ?=
 =?utf-8?B?K1pDdXJlOTV6V2g5blpnbHZTbE1icW5abmMyZjREY3FPWlBWdEdOTUM2MVda?=
 =?utf-8?B?bC84WHJ3TVJhK2dQT0Q2VUc1U2JyNjFGMW1vVk1FRlZSSWs2ZTB1T2pjMkRt?=
 =?utf-8?B?Vkhzd1JCdUU4TFYydWU2cHMzblVKWkkxaTdyNC8rMlNmeVVxb0JaZFFrMVBE?=
 =?utf-8?B?WG5EWENtTG40YkhMRlpWd1dqV29tS0dpZENXUTFFTmxmUzAzMjlzM0xhSU4w?=
 =?utf-8?B?NTJGMXQxZWhKenl5RWxzQ2RPbUlUMGRxc1BUb2lYZENTREhPMkl1QUgwUm5H?=
 =?utf-8?B?QllLTy9VZlpRU21uSDFtdXdVa3lIYUlnN0NMSjlWQjlxUDlDL3FLVE9NVXVD?=
 =?utf-8?B?VU1VSEgwTFcvZWFmTTBqRktYeUlhN09QRWJhZEE2dlZxUnRZREFaT0F4enJE?=
 =?utf-8?B?LzhxOWxpMnNsMG9lQ1NnN2VEWmVqSzg1V0w1MHNXaGQvQlNmOWJUZ2Fvb1o1?=
 =?utf-8?B?ZWYvc3pxemlaZnFuL2lhWWJCM1FjWUJhdjhLSi80TEY0OXVnVVR5NmQ1RDRE?=
 =?utf-8?B?Z3VXV2FKVExCdVcrQ21oZGtFN3UxT1llcHNRWWJqaGVYWGxhTk9GNUJEbHhC?=
 =?utf-8?B?R0NrdFhCVkdKNkluMDBtTVlNa1ZWR1BmSjVsdzV2Ym44VHR6aWd0NGtiQmFx?=
 =?utf-8?B?SURxTDhaTHFURWg5TWVsSmNERVJyUEhGd0J1Q3UrZWVBak5XRjhVS3dORWRL?=
 =?utf-8?B?aWV0OHpvMW00T3dpUXd3K2NUc0pjNWhRTzVuN240b2UwU3JRUm5yL2syelNU?=
 =?utf-8?B?bG5OSGxMdTkzUkNES0ltNE04R1p3eG4vRkZjbWVWYnkwTkFhNFhlcW15ZWEw?=
 =?utf-8?B?RENSU3I4QVEzdnNSY3RpVVNQcE1uN09oWTkvcllESzFJandiVVUzNG1oNW9t?=
 =?utf-8?B?blJ5RE5CTXpyUE0zWk1OcEFuSU9CY1dIK2RZK2JIOFJZUVVDSjdTSTk5Vjho?=
 =?utf-8?B?UkpqMTZnNndZZ09UaDdoaHRCSXVlbFNOU3lFb0ZlemVFQ3ZvcXdjSXA1ZGNQ?=
 =?utf-8?B?akl4RHBSVXUvUWpGMmNEeHZ0bHVxbXNPMC9xenY2ZFlhNGxpaHFCekpnbWoy?=
 =?utf-8?B?d1JLazhpR2w4NVdUYjVEK0RDeWMxRDZvVUxxbGIrOXpKMGphT2xnanNXK2h0?=
 =?utf-8?B?Zmo0SndGVm9SMmlmempMMEczdm1xTUxNT3dTczJTU1NVa0tSZXVQSmtUMEIy?=
 =?utf-8?B?OGZueVAwZXEzNVNSYUdSOEMyRi9ITUhTWWtKZVVSOFpMU0lGb0FNMHFXdWk2?=
 =?utf-8?B?OWttUGR3MUJ4THl3ZDdaWS9OUitHSlJiUG9acjFqZFpQdHVvQUFPY05vcGt3?=
 =?utf-8?B?am1Ja3pGSElMMXQ3NXlzb2hCcVlBN1kwclVNYzUvUnJjN3BsNEpaclBSRmFB?=
 =?utf-8?B?RSszYkZoLzhSaENGc0tBN1FJOWxYc1B3Y0R3bHZlUEpZeWRKRGQ2MDBrd3Mw?=
 =?utf-8?B?aUE5Sm9qMXljVlIwNFBCakJYMnhzSUltc0kxQVprby9Rd1lMZGlidE4yck9R?=
 =?utf-8?Q?H9KBRZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 14:42:08.4495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4a2a18-afae-4e4b-80ec-08dde89c9002
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578

On 2025-08-29 09:17, Anthony PERARD wrote:
> On Wed, Aug 27, 2025 at 11:01:59AM -0400, Jason Andryuk wrote:
>> On 2025-08-08 10:55, Anthony PERARD wrote:
>>> From: Anthony PERARD <anthony.perard@vates.tech>
>>>
>>> To replace yajl.
>>>
>>> Introduce YAJL_LIBS variable, to be able to remove "-lyajl" later.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>>
>> Should the two configure changes be merged and placed at the end of the
>> series?  That avoids a half implemented conversion in between.
> 
> It might be half-converted, but it's fully working. Every single patch
> introduce changes that can be use right away. I've actually make use of
> this possibility. On every single patch, we can run ./testidl, which
> will exercise both lib against each other.
> 
> ./testidl does LibxlObj-to-JSONstring and back and forth. So on the next
> commit, we would have JSON generated with json-c, which is then parsed
> with YAJL, to finally be generated to JSON with json-c again, then both
> JSON output are compared.
> 
> I've actually prepared the patch "libxl: Convert libxl__json_parse() to
> use json-c' last, then put it in front and check that ./testidl was
> still working.
> 
> This help me be confident enough that the conversion to json-c was
> correct.
> 
> So if we squash both config change, every patch until the config change
> would only introduce dead code.

Oh, I didn't realize that.  Yes, your approach sounds great.

Thanks,
Jason

