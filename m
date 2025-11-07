Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658DC4151C
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 19:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157842.1486470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHRRa-0005t8-Nh; Fri, 07 Nov 2025 18:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157842.1486470; Fri, 07 Nov 2025 18:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHRRa-0005qM-L5; Fri, 07 Nov 2025 18:44:18 +0000
Received: by outflank-mailman (input) for mailman id 1157842;
 Fri, 07 Nov 2025 18:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkPj=5P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vHRRZ-0005qG-2v
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 18:44:17 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e49d29-bc09-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 19:44:14 +0100 (CET)
Received: from CH0PR03CA0181.namprd03.prod.outlook.com (2603:10b6:610:e4::6)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 18:44:11 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::7a) by CH0PR03CA0181.outlook.office365.com
 (2603:10b6:610:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 18:43:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 18:44:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 10:44:06 -0800
Received: from [172.30.239.239] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 7 Nov 2025 10:44:05 -0800
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
X-Inumbo-ID: c1e49d29-bc09-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVTRBtHDJHBSfYlpbLlK9gIIMdsvyZjAE52Bl2e6pUGBz/AQykMIF0yXa5cozVWP22+I0QShIu6yCKD5eeLCVHHftERryiV78oQ+LhEmYq4Po6XON8jOI9f2z/kmDdFSI5rXtxJvwV8MK1MG7rTRYAgGnsVpemGlf5Rg0n8vQteqjgI/QmQCf/R+Slw+Hl72WCRy5r1WL9KFe+dl7QXIw+9+jX84T0xaK7k6q0vheS9bBcO6MRO5gqjBPOP+bvXX4ZXFArudj9/lABhn3/6e5ntki6t0/2ofzjwLzHmVaAsP6hNxsxjndQIdOn6CXT6UCAtTa3dAL6cnXAq4TazOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUAxSaDX2yP+SkUAcyXal3ROpsr3pIZuBD/6lf0Pgx8=;
 b=AEEizmI/K1UpiEpA6kWbpmTUHMxjiuPwZRoQZzGGF9ee7pjrmlXuBogkJnfubxuEAeIBd0tCribV935BpnDBFRIxSA2zGobu2kgUNvF65irbcQrzoFD3Y4/HhFp0FCPF7tZh3pRF9g0a6MwoFmju9vitLmPcIHNmFRp9xjkd7HRKZkhBAu1LW+r2hmchirxIQ6SCzWg5a6N6lKVUO60SimhYRLa4NdMIxLLF6WzSkO8kJVoP9x13Hy9zDBuQD4kRnGL4uvKGJeVnF76Fj24cjJCsFh8Tcw8r8j4kGNPB0l4gVfIMbg3xSKAOxDQBDFU9k24Q2hwMxjAdamYWYL5sww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUAxSaDX2yP+SkUAcyXal3ROpsr3pIZuBD/6lf0Pgx8=;
 b=maehuXUntsJ80iI4qWwf/qIn0hW0TpyrAH/y3m3jU6rNLr2JnqBOm4CnyhubUApHw0ik4C5gy9K1Q1joDWwQtGkG393nXiGvEQJgWpntRImYXKstazmWIA33nihyd3lxJIbmiZ7ZssJRc/B+9tcspuHdT71RrwoCvEphqtNqGI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <01f450cf-c095-4d09-a9cc-de833e98aee9@amd.com>
Date: Fri, 7 Nov 2025 13:44:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251107181739.3034098-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: aa79217b-42be-46a0-5648-08de1e2da3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHFhVzFwRERqTTlIZGVZcHR1T0YrUmNoWG5tVGwwZEpScldqYlJ0eFM1K2lz?=
 =?utf-8?B?Y2VRaXphNDRaZGxaYXVTQS9MU1hhZUdoYkk4b0NvYXJFYXFtNjVYazZDdGl0?=
 =?utf-8?B?UUt1Y2hiMmkrZ2ZscXJKQTRVbTJjN0svcHZiYnJ3ZE11Z3ppYkpSRUVtVnlo?=
 =?utf-8?B?WXZMeVh2SThOQkU3SGVvaWIzSHdiQys4Nm9WVTJvc2psVGYyK2xudjg0WmEv?=
 =?utf-8?B?aU1iU05ocktseFlKb25JRGhiU1ZiNTVuL0lkcUlDV29TMjRlQ0VjN2hkNGFy?=
 =?utf-8?B?dXZaVnoxQ2ltYmtFYUcxVzF0QW9yaU1wVGVCSU55M1lueHFnY010VXBxWHhl?=
 =?utf-8?B?M2pJc1V3czFmTTgrazJhemZDd3ZBOFBKbEsvVUZZOVJPQ2hYRHVPS0dtbjcz?=
 =?utf-8?B?enlqMnJiV2JQSmZraXdiOW5GVUl5U01qZ1djN2lMVVA2RllGbFhLRURNeUpN?=
 =?utf-8?B?OU9EdEhKeTByZUU4Ym0yaXdORnF6aDd0Y3VGdzhlY3ZmN3pnd3VuU1RoREs4?=
 =?utf-8?B?MWJaKzFnR3J1eWZqSDcyYmlyWXdNK3ZDc2ZhSUx0QU5sQ1ZBNmdFbFZWL2pW?=
 =?utf-8?B?VVJMcWFyMnExNExCU0FWRDJqRmdYQ1IvckR4ZWUyUDJiaDBBZURVZnp6cER1?=
 =?utf-8?B?ME9TSW50cE4rcEd5a2VYSCtEaERGTmozNkh2a3pjVVBZemVvUFZqS05SRy8r?=
 =?utf-8?B?UGZnaHBYbXlua3BJbml5Zys3TGhUajNGd0owaHFXYVJOMHdtWndpVkFBTTlM?=
 =?utf-8?B?bWxSdEpwUkRnWGhxQlVWVVQrVGRsR0wyekZacDBhRVNwRkd6d01CL1IxS3d6?=
 =?utf-8?B?Z2V1TG42eVFnYSsxWE9hQk11Ynl2MFFKS2M2SEpIeTZFbWUwU3NEbVQ5NTRO?=
 =?utf-8?B?SHdGTnJUaTEvdzVIanpCS3p1U0UwMkc4V0tJaGRxRFJ6UTZ1b1RDR0pvNzVJ?=
 =?utf-8?B?WEpEWXpLQWhFWXdGdjFMQ3N4enBzN3d6enFIVlJCcTh5MEkvcFlNY21sa2hN?=
 =?utf-8?B?ZEpGMFBvRnBudVJoZzVtYktCZ2luTDZwN2JWeHlCQlFBV09TeFZLcVo1Z3o4?=
 =?utf-8?B?bEMyT3ZtdlV4ek1yaENTRDNXUU9yd1M0dHFEdmpWdFptUzV4MjR1VE82Y0JL?=
 =?utf-8?B?UjV4WkQ2aU5LV3JZNWN4ME5LbG5pYVI5TlBvYXExRXY2WG1ZTHpUMUI1UnFI?=
 =?utf-8?B?N1lCMkUyZ0grdS8yazlQeDg1QW1FNlc4TGw4cXp3WkdvVWRrR05VYnNLOThq?=
 =?utf-8?B?MGpKY09Xc2pXWHpEbGRuUHpabVQ1NllIQmx5VEsxT3Z6azIwcktGZmkrYk41?=
 =?utf-8?B?OUhxNXVXajZrZW96ZHRYWlJvdUt3eFZvek9HS1lrbHAvRkhLYytJYzJ2UkFO?=
 =?utf-8?B?S2NaRk9XL0lyWllTaVFRVFBDMkFoOGlacm5yVnJvVFN4bVB1ZTRHam14Sk10?=
 =?utf-8?B?Z3RoR0V5WGZXVFpWb3RCTFlDaCtNa1gzRGRQWmkrUEwzdCtKNDg0WGs0RXRi?=
 =?utf-8?B?czBvMEpiUE02WlIyMDBrNGVLT3FCT252RjBWWDlBVGZNOXNVa0NjbDdndHhZ?=
 =?utf-8?B?YkJsNjNXZVllZnFaSFlHTUIvOG1rT01JamNBREdLUDB4a1pKRFgrdDliMjFU?=
 =?utf-8?B?alFsVllHUTlZbFJvbE4vTlFYbTRaQ2Vjcm1nM3RWcUpwTnZVZWVRYndKYjky?=
 =?utf-8?B?UVI4M0hUNE9XUlVQdFd6TG12RWViUW12TXdkS2N6Ny9MNmJqYk4xSWFPaDFm?=
 =?utf-8?B?MXBqOVdMZmgrMW9McG1OaWJqK2IxTjMyQm5HdERSMHpXdUViWUN0ekROOEcv?=
 =?utf-8?B?emN6cEg2eFlncGl5aFg3NVdBdm5BV21OdHg5c2lIYW5hc0ZtRUxQajM3WHk1?=
 =?utf-8?B?ZExnbktIZUR3cVVyNlJwWVFWL28xOXVMOXNLYXl3SzVpVTZmeWtFY3plbU0z?=
 =?utf-8?B?SWlUTUM3V250VElYZVV1ZHVWdk00QUt6Y00zN0R4VENsZWdoMDRVeVNKMk5S?=
 =?utf-8?B?OUpHUkI5dnk1d3BJaHpwZ0Zzbjd2ZDNCcGZnUjFYRUVpSGp5T0htQjljbUpp?=
 =?utf-8?B?NkxKR0FhbjNVd3VTV3JTVzRZRjMyS1ZjcEhOSkN1ZkxKcHg0Nk92R1hNM256?=
 =?utf-8?Q?0ECc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:44:10.2958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa79217b-42be-46a0-5648-08de1e2da3ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

On 2025-11-07 13:17, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>      (is_hvm_vcpu(current) ?                     \
>       copy_to_user_hvm((dst), (src), (len)) :    \
>       copy_to_guest_pv(dst, src, len))
> 
> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
> - PV=y and HVM=y
>    Proper guest access function is selected depending on domain type.
> - PV=y and HVM=n
>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>    and compiler will optimize code and skip HVM specific part.
> - PV=n and HVM=y
>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>    No PV specific code will be optimized by compiler.
> - PV=n and HVM=n
>    No guests should possible. The code will still follow PV path.
> 
> Rework raw_x_guest() code to use static inline functions which account for
> above PV/HVM possible configurations with main intention to optimize code
> for (PV=n and HVM=y) case.
> 
> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
> guests should be possible in this case, which means no access to guest
> memory should ever happen).
> 
> Finally build arch/x86/usercopy.c only for PV=y.
> 
> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>    add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
>    Total: Before=1937092, After=1906210, chg -1.59%
> 
> [teddy.astie@vates.tech: Suggested to use static inline functions vs
> macro combinations]
> Suggested-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

