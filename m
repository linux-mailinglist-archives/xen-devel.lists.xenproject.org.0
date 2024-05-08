Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA68C0564
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 22:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718948.1121504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4nfO-0006e4-Kv; Wed, 08 May 2024 20:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718948.1121504; Wed, 08 May 2024 20:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4nfO-0006cJ-IJ; Wed, 08 May 2024 20:13:30 +0000
Received: by outflank-mailman (input) for mailman id 718948;
 Wed, 08 May 2024 20:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LtzS=ML=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s4nfN-0006cD-Dy
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 20:13:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd02e63-0d77-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 22:13:27 +0200 (CEST)
Received: from CH2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:610:50::22)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 20:13:20 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:50:cafe::9c) by CH2PR16CA0012.outlook.office365.com
 (2603:10b6:610:50::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Wed, 8 May 2024 20:13:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Wed, 8 May 2024 20:13:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 15:13:19 -0500
Received: from [172.30.155.127] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 15:13:19 -0500
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
X-Inumbo-ID: 6dd02e63-0d77-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgjqxp57wULjH5aRXgKQ98eGXovk2wN3pamzJeXk4e/m32/mZMmu/qc+ZCPfDPoGWpGJMzIsvQAjVTnT0gloD/MYj2SsLG0RwDqDuGQJgVDc5NW944HxUqZgKR7q9kMH9+SmQRF2Xu6crlYUvpnHaDGnkfYqeh/igvgAfVGI7l9EDogKkYZa6/QlNZi2O6Es+CZdB1x5OiHlEJWnDI6KA8UxyU656q9FGAwhDqfgmb8SUh0aphEWFe+23GEh6fkO3bAMed16zZUCixeC/afbtBHIeDXG+IzhYf7ClUVJLISuB7IlxX+hdEXywlEjPbaDVFs4L+UgGEpSFS4XRjnJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJfr/gIGRYHTbuChT5h9TCLU91Hqtc3OkwD+8w9q1dw=;
 b=eiQ+puA+cGg1Wa2W7z7sQSW+NMm2pN0ZZRj2zj39Fpg9pV6vTJrVpTet/kKInNZp0b4FOUWMhd3OqYImRLyHleiuHQ9z0OBX4WL2Dj0MeivZmIyXtSJZWwuLykmWAu9hdxLNuJNMAy5a9jA9XRD3quh3Dk0ulcWTjBpkdC0CyB/DPZi//rtjWKKtiYksPlmbSmxal/jvyOnQZWpG8IaMEdxKrG1or9ZI5Kpg/RSLYUqiXc5pBSVVRf0oRVP/fFEbVPW2Y3/qKMJMFeg+1bT36sgHhSjj5ycEJijcABuzP4bJHwHmDQDLBGg4hdGmIdO3ZZxNTJjmcjg5IOt4tPB/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJfr/gIGRYHTbuChT5h9TCLU91Hqtc3OkwD+8w9q1dw=;
 b=kqQARjVTxlSuJ7lE77tDJS2Cn5kfwEE41Crfko1IimqnvufeiHYprmHdIyfZg3OGv5goXX20ChnpS1QR5QfcOmXfPy370vYl7oc9eKdr+DEnr6XfhMdXBgJKjoswRbSp2TgHk/PBYkDFcCFuQufpkZ+BurDYmq6OBhGUrECuZds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ec9d5f1d-4686-4f7c-ad27-0a1b214050ed@amd.com>
Date: Wed, 8 May 2024 16:13:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 1/3] x86: allow to suppress port-alias probing
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
 <bd116645-3451-47d7-8b8e-6e4b1af0680d@suse.com>
Content-Language: en-US
In-Reply-To: <bd116645-3451-47d7-8b8e-6e4b1af0680d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d796059-08a5-4076-888f-08dc6f9b4e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0wwVWlwNTdPSmhtanM0VVNNNEY3RTZlaHhPVVlydCtxbzM2ZGVvOHNTQzV2?=
 =?utf-8?B?cGRpTDZUamFZd3AxSGxlSXdmM3VtUlk4ZlBqOVdYQ3F5YmFrYzNxdEpyRWZG?=
 =?utf-8?B?d05HSG5pNFdrV3ZNTXZIRjd6MVVWSjZuY3pHeUZQRVMvWWkvaTU2KzMxeUY4?=
 =?utf-8?B?RGgzbmJCZ0xHQWJoeGx0UWE3UUlnMTVEQ3BEaEhlTVE5RnBPZXkremEwLy9K?=
 =?utf-8?B?R010b3RuRGs3WkdNYTBQVkVTVjhEYktPR1FnSGhVc080aThweWIxUU1FaUo0?=
 =?utf-8?B?UG9lTTJuRzlOR3RBMU13cHFDalJUajQ4d1N3eXA3UFhKUWVFZUgzQWdBdThG?=
 =?utf-8?B?VmhmMldRVGFYanYrbWZ4NzdHS0FIaFdoVENheVlLaExXaWJBbXZwUjM0dktG?=
 =?utf-8?B?VEJLeGpLNVNYT0NOMzFUMVJCQkY1eHBMeEMvbUNWbFdDeXNaQUovdDJVMnl0?=
 =?utf-8?B?V3lrSlpjZ2dBSzUrWksyeHlTYVl5NDdiYjVMM0Zpa2d2QU9PbG9vU3NxRUN5?=
 =?utf-8?B?M3Mzc2ZHRmpEOXFzS0pSVVlMcGVVaHlQRmZ2NkgrU1dKcUw4MysxWkJpdW9I?=
 =?utf-8?B?Z2RPb2oveTRROUcvdHkwV3JveGpTdFRXUGVQUkk4dTlDVlkxN3JSeWpKbDNn?=
 =?utf-8?B?eUw0cVZzUDFVMHVsa3lEczhRclRPekFqOEkxT2Z4bHVRZGhHWUlkWGszYWhI?=
 =?utf-8?B?WFVVSWltYVBqbTNUVlJLYk5uRDIrY0gwWEw4T3BiVkp6ZG5IVkVyc25BTVRJ?=
 =?utf-8?B?d3R1cHFjVy9PejIxU0xBNnIxdTBtU05lRjBRTzB6blMyVXQ3YjF2OGRQM0Q2?=
 =?utf-8?B?SHdQU2J4TUdRQzE4eGw3MjFwRUFaSlVQUnlCbW1yS0tMOUpLWTB6TW14bDV6?=
 =?utf-8?B?Tk1UV1JNUm9EdkM1V2dzbDhBcGwvRW5IaU1pYVp6cUtHTFJ5d0o0TEpqK3Zr?=
 =?utf-8?B?Q0VDRk5taDM0OW9xTmZUdGRWMVVVNUZCUGNGUkdyMkJmVXlid0FtNzhpNFVw?=
 =?utf-8?B?VU5seDJCdExTZ1pCK1J3RUlPcVVmSm1ITzBrYklMbmRkWEpVZXU1a2liOXhU?=
 =?utf-8?B?S3JnZ1hPaXdKbFFYR0xLVXM5U1k5UWZVdFk1bmNDSE5qMmZWeTltNDMrMlE0?=
 =?utf-8?B?VzdheFpkblM4dS9uOFFTUzUzZnU5bEpobDFwZ28zUVl1L3hOYVB1VCtZZS80?=
 =?utf-8?B?dWZMWk84ZnBNZDU3SWt2U1hnNFpuTHlna2RWN1hmRjI5SmsxaENNM1psa0V1?=
 =?utf-8?B?RzY5aHVPNnRyTWlmMUhSOG9aL1oyQU92NjBTbXRiSVhMQVlSbGlGbzBSRCtU?=
 =?utf-8?B?Q0JSZUY5c3ZocXhEY2pIU0wvWlhDWnNSb1dYS3N6MVhFZFZac1RoNWpGMDJz?=
 =?utf-8?B?K0tIWDRhNStPWDQ0em9xcUtnN1R6dWw2c1dJWkFRUWoyWnNiTzQyOS8wTTk3?=
 =?utf-8?B?emt4QlJOaXlVMDVSSmFGWWVqcXVPMTFPU2piMTVzZ29yNkp6WVVWZFAwYU1S?=
 =?utf-8?B?Unh4S2dDWlpCUnpvblFNeFdyUkdud1Y5bDZ6c1ByREg4ZUErd2JSc205djRh?=
 =?utf-8?B?aXdSSXBudVlRMHpKZmJUNVJ1OExMdVN0ZjZTaWs2d3FNQTdPY0l0Ukw1VitS?=
 =?utf-8?B?a1h1bWU5MGcxUitXTTlYditLQTJDYmtZcHd6QW9EcXFGWVRGVUo4dkVRK0xl?=
 =?utf-8?B?M2JyRFcyS3dvdmswcURxNXJjZE9Bd1hPQ3lrOC94Q2YzRkZUcENxWjgwbVA0?=
 =?utf-8?B?akxuZDBIRmxXRDhoeDhTVEhTREMzckl0ZndFVGhqSXRsMUljZWQxM2o3WFJX?=
 =?utf-8?B?UUdhM0IzbkZlaHpqeVhoZ0ZScGtwbi85SGpiV0hhbkpSVy9iZ3pJRzQwcFVP?=
 =?utf-8?Q?3AVPDdnZEWghA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:13:20.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d796059-08a5-4076-888f-08dc6f9b4e17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265

On 2023-12-18 09:47, Jan Beulich wrote:
> By default there's already no use for this when we run in shim mode.
> Plus there may also be a need to suppress the probing in case of issues
> with it. Before introducing further port alias probing, introduce a
> command line option allowing to bypass it, default it to on when in shim
> mode, and gate RTC/CMOS port alias probing on it.
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

