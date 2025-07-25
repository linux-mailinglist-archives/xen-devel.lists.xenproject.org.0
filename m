Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70882B127B5
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058710.1426211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSJ5-00075V-KT; Fri, 25 Jul 2025 23:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058710.1426211; Fri, 25 Jul 2025 23:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSJ5-00072O-Hf; Fri, 25 Jul 2025 23:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1058710;
 Fri, 25 Jul 2025 23:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSJ4-00072I-10
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:58:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:200a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 416a15c9-69b3-11f0-a31e-13f23c93f187;
 Sat, 26 Jul 2025 01:58:28 +0200 (CEST)
Received: from SJ0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:a03:2c2::19)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 23:58:21 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::e2) by SJ0PR13CA0044.outlook.office365.com
 (2603:10b6:a03:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.16 via Frontend Transport; Fri,
 25 Jul 2025 23:58:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:58:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:58:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:58:20 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:58:19 -0500
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
X-Inumbo-ID: 416a15c9-69b3-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu+rTCkuc1Fo2obHrpNZcKyGe54t9Q81R2U7y8YWtxSe4q3qT3N9ika9MewCPWibh7lM1+/BTLoGHR14bLlhjZaD2/jUKFOgkDsnXiCRA77trMx/szUrL6cchs11OdyLSbsbRoSOZKEgfOYiVqT7C0sezrGaDZKOosdnoJaCtGZsLj/iSjYD66eY1/zcyG29KUuluiSf9MExfebQkhJoPa3PTwbjV69HP+P3pwg2WgjD9gwqM5jltHuBaA7oPSBCM45peAOFyMDKs+EzCssASPcoXFiSpVhk+Dl0bj5OYesYb2NG3A/FBAuqaDgse6sAEmoHb4JU2s2UrhMDoj5vAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPXVbfSwka69glAD0hYqwW6qJ1KLgb/fkdetEq9vaT0=;
 b=wghYLcNPcsbxjQ+k86VCmsmhLMmA09jnSAcrZ1SunTRWYgIbGMZa3npbKs0qm/IzhA4CFl/BgDUR+pKe5j6Ck+BVx9RxKgznvQG78dYCRA2/WDqAb2E4eUoHSEyfio881dmwEKFJQ2kurLIkkMIGzes5Jw7Pheru/3AtluS8SZLldodnPVrrpfvcf4wI1LtSLWmrfSQR0ri1mrkslp92VmiOmSzRX+Nqh9C8nQZG6vK9L/2Avs1ogu/EQAIhx9iGbeJCu5nxmm2Wks9/WnSiKNXF3RDXLHaV7DK9jbHz6/JCU/sy87OvOdXKXEXXwqGOxOb0btFvr/mjKFhDAKK/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPXVbfSwka69glAD0hYqwW6qJ1KLgb/fkdetEq9vaT0=;
 b=1GYR1BlqYOwAcDfosJooAfS5U54xLvJRvOv6D9a10fBgkbksqURlB/u8b17jqPgW5JkPAQLnOh2DCEyfqBv3SNP6LMdc3qXoZ6+2ZOtFVy9QJT52cP+/03HvHAsCA/Z9qMJOtps2O5A1MrYz9j7exegLstADpEcgGh1M7woBcZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6e8fe1f5-3395-4418-944c-465e800900f9@amd.com>
Date: Fri, 25 Jul 2025 19:57:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] tools/xenstored: Use priv_domid for manual nodes
 and permission
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-10-jason.andryuk@amd.com>
 <5b63cc6a-f7d2-4b62-9ddf-c1d806ede829@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5b63cc6a-f7d2-4b62-9ddf-c1d806ede829@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 173a6393-eeb2-4a6d-a0ec-08ddcbd72253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEJMVkU5NGlJb2QyUHU3WXJRZCtlNjdNVEhHRWVEWElYam9GaHNwUDZITFdJ?=
 =?utf-8?B?RmtYR3dpVjhmRWdiU2ZFSENjS1FiN0ZHWWhMZE0zQXdSeGVKdkhqWkQ0VGNL?=
 =?utf-8?B?M2l6VFB5RHlmdzREZEo1N2hNQXlvaS82QU5ONGFpTFVtMGhmSEs3ZmtnbG5s?=
 =?utf-8?B?c1pvZXB4QXhSSlBCY3hjTzJCYWVUaG54ajhvZUhpdW9HZ3BmSkdJc1I1SmtR?=
 =?utf-8?B?d2JpeE5wODU1VEQ1WlFqMEk5MldGdjI1eVcvTzBxVnpSbXQrRFU0cnhIZENN?=
 =?utf-8?B?eGwycEtEMmx5dkFQR0dnRTZXN0s3K3VENnltRG54WlVBK0xDN0VGMjJSNHht?=
 =?utf-8?B?TUJZbHVESnU0b1RraGJCakJGcWR5NTRkQlhIVG1LVnJzS1dVOUZLVU45cmp3?=
 =?utf-8?B?ODhETStZeFhSc0lkcFNUUmhJd2FjYzVJeVVCa1FHcjJudW0xVkc0NlhteExj?=
 =?utf-8?B?VDdLaUtVSjFDUUo1V0lLeU5pT0c4Rlp2WCtJREhsRUJ1RmwrWkFEckxRK0ZC?=
 =?utf-8?B?WTJuSHdMdmkvYURSQ202NHNZajhXeWdkbHBLQ1hCVmY5WlYyb091TXA3NnRp?=
 =?utf-8?B?a3FpUFUrM0M5bTFMVUF4U0FqL1pWeS8reCszNldvRkdKdnJ3YnhoanRxTWh4?=
 =?utf-8?B?T1hkZklqZHpNanc0QWUxSDdaa1FrVWNQbkJKOG4wS0ZPQ1NJVDgyZDc2YWZC?=
 =?utf-8?B?blpBNXpGL1ZxaFV1bzE1Q0gzNmVRNllDNyszZUxwL2xrRW5GMjJHd1REM2dZ?=
 =?utf-8?B?bENnekRKczdudEtzd0N1TVVFRDZHaXpFM0xna1M2bmFManpkTU1ZdjQ1V3Zu?=
 =?utf-8?B?OGxBemxqdElvSVBzSnBJYUdLOVZTVjFBb0d4QnJnOThuQ3JuNE5ORmhkQ3NX?=
 =?utf-8?B?VjN0YTFGRkpjeFowYk43elNBQ0l5a2NXWDJzWGlRTGJIWnBGRjgyZ0ZhWjlI?=
 =?utf-8?B?MGxDOUMxVk9UNis3YjZiWHdRb1dPTEUrNE1rQ0pnZm9ndUM0T1lWaENqOGJX?=
 =?utf-8?B?Vkt3TmFOZng1QWRDS2VXZXU5NDVVenpuZW93bFBTQVN4YzFSSDBpSGFqMXhP?=
 =?utf-8?B?aTNMZXNsajVmanQ2OGJFMWJUSU5JdFRnTm1nZENjbVNpTG1iSjVqeVpyOFdx?=
 =?utf-8?B?cnlKbnlXdEh0dXdVT0tQMnBHTnRtekJlTXlsYkVwdDBZaTRocDFKaEU2N0l2?=
 =?utf-8?B?SjludUJWSnRlZ0pBbnV2b1ZkWDNWdnBYZ1QyeGJ0dE50OGhwbkEzSDVzVFR4?=
 =?utf-8?B?TDVuRTlDdElISklYNFY3ZzVna24zclJyc3JTd0J3TWJ6L2c1QTFybWd4N2RI?=
 =?utf-8?B?YnVSY3NqYmtTdlg0d0hVTWhOakw0UE9lNVRUVXpKdjBHeHZoSUd0bjN0TkJy?=
 =?utf-8?B?cVFBQ1dZTHFTZEdiRWgza1hRaVExbHUwNi9IQzBQYmZVb0U4K0ZzUEsybGZD?=
 =?utf-8?B?MkJwR1hkb2lTMmJjcGdBMkhncytNZlZuQ1dKNjNkTnYzRkNoVmd5NktKYnUw?=
 =?utf-8?B?V3JnbUU5VE84akF4QkdJSTc1ckxWWnQwSGVnd0N6bXpjbWZGa245TlFOV09G?=
 =?utf-8?B?bUJRNHRtelJPaXhDSCtSbGE4dFR6K1hyb2xrRTJIN1FsKzJxNTZmNzhRWlZy?=
 =?utf-8?B?bVMvb0RXYkN6YkNaQWlPYm9jakhsU2xIR1FQZVJ3a0NaOU1HWXNUUXJYdk5C?=
 =?utf-8?B?WmpEVWhPSjZWK0ZIMWRCTGNHbjhWL1FmMFVqMnNlNXJ6RXpvQStmeVZDVFRN?=
 =?utf-8?B?S2xTR3VUMWkzTHMweTNFb2NHYTVaNEJYVFF6clUwcjlFbk9oYkZGd3VNUGFT?=
 =?utf-8?B?aFEyRGhBaHZ4K2tMcDAyR3EvU3U2VnNuUHc5OVNkenBOTVpBMk0wc1laL3Vy?=
 =?utf-8?B?eURNYlJTYmxhaG50MnAvSEIycEtrUlhZdklyQ05EdDA4U0VZVkFJYkNKZmt6?=
 =?utf-8?B?aXpTR2RiWkhSM2JtR0NicU1rUmhFWkVPWDdJeHp1ajRBdVhWSnMzelp2SEIr?=
 =?utf-8?B?bWFQcVdJMjQvZDdVWHN5WWQ2RGpMMnRXWnpaTHA4ZjFYZjVkdXE0ZDRjNlFj?=
 =?utf-8?Q?S1oGTD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:58:20.9454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 173a6393-eeb2-4a6d-a0ec-08ddcbd72253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345

On 2025-07-25 03:24, Jürgen Groß wrote:
> On 25.07.25 04:28, Jason Andryuk wrote:
>> Usually, priv_domid == dom0_domid == 0, and that is what is expected.
>> If we rename s/dom0_domid/store_domid/, it seems more likely we want to
>> actually have the priv_domid as the owner.
> 
> Yes, I agree.
> 
>>
>> That leads to follow on changes to ensure that the priv_domid is created
>> first.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> Will this blow up if priv_domid doesn't exist?
> 
> That won't be a problem. The problematic case will be when priv_domid is
> never changed due to no doamin having the CONTROL cap, and some random
> other domU happens to have domid 0.
> 
> So maybe priv_domid should be initialized statically to e.g. DOMID_IDLE,
> as with your init_domains() loop a "normal" dom0 will always have the
> CONTROL cap and thus will result in priv_domid being set.

There is existing use of DOMID_INVALID, so I'll use that

> Same applies probably to store_domid, but that should be set to priv_domid
> after init_domains() in case no domain had the XENSTORE cap.
> 
> If both aren't detected it should be fine to bail out early.

For our use cases, we want the possibility to run xenstored without a 
control domain.  In that case, I think it would make sense to set 
priv_domid = store_domid to get xenstored to run.

>>
>> Maybe it would be better to just create these as store_domid.
> 
> No, reasoning see above. And xenstore-stubdom accesses to Xenstore nodes
> via the "normal" interfaces shouldn't need any special privileges.
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, but I held off applying with the priv_domid = store_domid 
assignment.  (Well dom0_domid since it's before the rename).

Regards,
Jason

