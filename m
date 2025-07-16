Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339AB07EBC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045698.1415887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8cO-00034S-NM; Wed, 16 Jul 2025 20:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045698.1415887; Wed, 16 Jul 2025 20:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8cO-00032s-HU; Wed, 16 Jul 2025 20:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1045698;
 Wed, 16 Jul 2025 20:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8Yz-0003uZ-Fg
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:17:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2416::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d81f3844-6281-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:17:08 +0200 (CEST)
Received: from BL0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:91::37)
 by PH7PR12MB7967.namprd12.prod.outlook.com (2603:10b6:510:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 16 Jul
 2025 20:17:01 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::67) by BL0PR05CA0027.outlook.office365.com
 (2603:10b6:208:91::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Wed,
 16 Jul 2025 20:17:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:17:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:17:00 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:16:59 -0500
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
X-Inumbo-ID: d81f3844-6281-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRMvRhaheVKz6jQSQdXvteN71AOH0JG/TI/ZpOiVKi42iIXhP2x1zRk1xspYbv7hVIYemYHo0tTqcW/ENJ3YHfqkhvJP1fD1FH/RDWx8bY47dEUEkrFGVlHNDaVB/sjlfuJSy9GorGlW16pUXpmZPLuDCvY5iA9T19eBT8cceAvs18up3UIVNb0JwFnSFn5FyGAk5ZwDkamwZBTFTjvehY1RfqNRETmnWmu0+Ff4h7o+QU8825KaQNXOpjI+oni3xU9gprCtP4WRP/2XdazoHIiHRJALsc49K0DWRCjWGqT5biO2Xzd1knvQhu/TnaIIr98uL9O6ya2jqyp6LVFoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTNkSj3IULJ6kM1kyg+IGyPL5fiOLdYANu1FGsbS8ig=;
 b=eLwJEXeKyRb7JVGtEiRij60Rz+7jYYKP0ROnl3VQoyT7QhboeaF5fKbHBbKbGeS2MFy4AK029a5oMDWH+2FzzGIGwdO6KRpwihwdjldPFoVLOhg+K1mEN5YBWcOAc+S05IM5/g/CW55JRNhLVdG5oxqOz9ntTBHjf8klBIwCxbZP3yrNTKsjkip28ggg8H1N+Lr3TAMQO5AY1mrz2VBf4/4xNj8cRUNxoHFz6aeF/v0nd6FxB6aVqFCCckuSEXPZDJpWyLSDkEJxBGMmwCztY3UqhL452YPk9VhHYEiA+kQ0gX9rCKA2IoI7HCrQSlqUwMvJJzU/IPMZV3B4jndptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTNkSj3IULJ6kM1kyg+IGyPL5fiOLdYANu1FGsbS8ig=;
 b=vpFtK0SVqEGgQn/OHl5u8KaO686YVep8fnJzjnw1xwWyAxNvAKlPqxkdxScE9a/NMGBtaJ9K4RN7Id3XIeCWgpkriEgVG0FQZ7EDYjYswczv9gpYCzKRbpXe6auLa7dwgowI1+PBtwuuMJl5A2Wr/0fDYpp/0+ncTkjWd6wvMLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e319936f-a626-41f7-ba23-b66f9caa66bf@amd.com>
Date: Wed, 16 Jul 2025 16:10:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] stubdom: configure kexec for PVH Xenstore stubdom
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH7PR12MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 539e9fa3-1241-4111-4d6d-08ddc4a5b8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDF4dEVNSWFhOHBMUVV1WTIzNFI3VFBGVHlwbzl1TlhZZ1JlUjNDUCswMWFV?=
 =?utf-8?B?YmhYTDJUN2QrN04xWU5Gam5BeWd4cWVjWDgzUDJyYWYzcnVmdTVjMUN5dk1F?=
 =?utf-8?B?Y05EUHBtM1RiRVZKQzFXVzNHSjhFTTZSNG5STzBnTWJLNFpqMzNoZEdMbHRM?=
 =?utf-8?B?UUh3VzZRbktBTVBFMjhaOWJkTTdKQ3hNMWJwczlkeHg0T3lnMlVBODR6N3dl?=
 =?utf-8?B?U1pkNm40NXcvM1R6Y2FhUm1BaGR2eG1KczNhSzllVDJNMWUxYVRUNU1CbWE0?=
 =?utf-8?B?Q1haL09Ia2lNU3lkbkxxVloyWlN5bVFZVHJRYTQrZjdSSUQyMDF4eEg3bzlU?=
 =?utf-8?B?aHNsTDRTaThaMzA3NXFIeWZ4ZHRnOTR1Z0dSTk5NM0hUeEFpVzkvRTBoSE84?=
 =?utf-8?B?WURrdjU2bTVERW4yb3BieGVpa2hnVnVKdnR5WXIrZ2NkdXpLaEdiRUNoWEhJ?=
 =?utf-8?B?QVlyTFBkcXRpU2N3RmFSWlArMUxOU3VUWnZyeGdabFZNOHF0aFhHeEdHSk5S?=
 =?utf-8?B?ZEkzSEpER05iWW5mT3FqUHIxeVBYckJ3ajdhTnhLcTBvNzVUNk0weFRBUXd3?=
 =?utf-8?B?Wm5UdTYrM1VnS3dFOVVtOEFsdzQycW96aU9Pb1lQeVRlWERZUnNQbVUzQlZr?=
 =?utf-8?B?Ti9qZE8rSjNleHR5NlNjeVZBa1FBWGhWQm03TTdDNkw2TW1nQTNSa3FMUVNI?=
 =?utf-8?B?NUwyTllmcW9iNEt1cUhaL3hqS3RwUDBQQWJZamtEcW9MRDZqaGwzWTlUYThO?=
 =?utf-8?B?SjdxRkJrQXlZamFnbzhvVDZVT0U3WGd4WGJBNlZsRWlYbTY0ZnFibEVpZTRV?=
 =?utf-8?B?MXNUSllGRXpSTkFuUUx1M1crV2MwTHN0UHJPVHk2S215ZllyL2k2TUZIdUg3?=
 =?utf-8?B?UXVlY3Myam5lVDhZSm9ocEhrUCtpaDE4YllvYUJBZXQxL29OQ1pmc3hzb05u?=
 =?utf-8?B?ZVgwKzZjVEtiR0NsaUNUdEhTSnk4MG82SFhhdjJJSk9OYjJQVUtRQTdDN29D?=
 =?utf-8?B?MzV0OURLY1diSDN0YlFiUlBqRFRtY0lONjdPTHhmNWRhQTR3andJZktya0RG?=
 =?utf-8?B?VW1CdUhQWkZxN2pxZkNDd1FwVzJncDhrdENhNWFwUUIzMkhTWlJ0L3VibXli?=
 =?utf-8?B?OXFRcUJPa004UEY1Z2JwUEZNZktSZW1jMkttY2xuc29jZkNkOUdZdHpZVG92?=
 =?utf-8?B?ZFRtLzVRNXFJa28zWkt3clRrSmozQi85UkR5UGcrYmZHRENxMzFrTzJYdGJt?=
 =?utf-8?B?OUd5UkE1bm9QTmhxTFhYS2EvZ2M1b3RmZ254RVdyMmxQU0xPYllleGdWRnFO?=
 =?utf-8?B?eFExN3YzRFhnYlJHQTU1dmtSL0JTWnFuR2lZMUdxRVRUZXdmRUxncldXdm5B?=
 =?utf-8?B?eTRWdGt1aWQ2ZHQ1MlhGVmk5dURjZ2VtWGJoWlZ3M0g3KzBtekVLL1lTaFlI?=
 =?utf-8?B?YXlrT2F0ZkJJVW95NFBQODVVa05lc0szVVdsWGdpdExCWXF5ZFlvTHdJemF6?=
 =?utf-8?B?M2ljTkt5aFJhWWZBSWkvNHVCSy9ta1ZvUFFmNFRINDZoZmdEalBoQWYxdmRC?=
 =?utf-8?B?dTI1Vlg5cjA1cEozTE9UY3UwVGlDOWRpWjlrUzJJWjZHeGR5UGZTdE1kYi9i?=
 =?utf-8?B?R0Q4eTFKNEY1YkZUZ244UlJvRmp3Y1A3S3RtdmNKc2JkdkZNNU5qaUc2dkRM?=
 =?utf-8?B?bDJ2SHB1MjV3TGFORndaQW9QZzdadTJ5c3lIYll4RFRGYUcyUHNrSzB1SURo?=
 =?utf-8?B?VFhuMW5OWC82RlhIbTZOQTBrMXZTVWt2Qi9TeWUzUnZtdkpwR2g4b1FmMElF?=
 =?utf-8?B?UDNNYlE2QkRtWVAyK0dqdVg2NGhCdU1rNWx5SGpjd3MzZC9iZGNSL2RSQjZX?=
 =?utf-8?B?c1RBdVBBaG92OUlMdFZtOVNXc2lEaUhRSmRqT1dnbXgydmRMUEtnWDd2ODlv?=
 =?utf-8?B?dlVRSUxkaVNoMDN6Y3RXMVlvd3NZaTNEUEJQM0RtVzdFdWVOTnJCc0lwcTNV?=
 =?utf-8?B?K21Zd3gxLzI3czJCdDlTYnE1VmhmSzcxeVZGZEdEeCtVRGZLNE01WG55cFc2?=
 =?utf-8?Q?M0wFhj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:17:00.7519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539e9fa3-1241-4111-4d6d-08ddc4a5b8f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7967

On 2025-07-02 04:12, Juergen Gross wrote:
> Add the required configuration settings to enable kexec in the PVH
> variant of xenstore-stubdom. This is required to support live update.
> 
> Set the number of kexec module pages to 18 in order to support using
> the kexec module memory for the stubdom's 9pfs granted pages.
> 
> In Xenstore code test the CONFIG_KEXEC setting in order to determine
> whether stubdom live update is supported (PV xenstore-stubdom doesn't
> have live update support, as it lacks kexec).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

