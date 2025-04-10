Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E40A8496B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 18:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946097.1344103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ubY-0005rX-8Q; Thu, 10 Apr 2025 16:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946097.1344103; Thu, 10 Apr 2025 16:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ubY-0005pM-5k; Thu, 10 Apr 2025 16:18:16 +0000
Received: by outflank-mailman (input) for mailman id 946097;
 Thu, 10 Apr 2025 16:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2ubW-0005pB-ON
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 16:18:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6573e0da-1627-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 18:18:13 +0200 (CEST)
Received: from CH5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:1f1::13)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 16:18:07 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::ee) by CH5PR03CA0015.outlook.office365.com
 (2603:10b6:610:1f1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 16:18:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 16:18:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 11:18:06 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 11:18:05 -0500
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
X-Inumbo-ID: 6573e0da-1627-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxvcFZcaeupSrvgMEthYUiTudmk+YrM/yGKGAqqupjYPEfQA1V7H/NaixSsUmHQaJ9LFFVeo+4842WVH1QhAp9KSIlecryYNuNXMVO65uuuTBllNCSLxYd9+ZDym8cCDI2LLy5L24bJ4u6ZZp7DyOtVSoTYSlSW8Z3gu1JlWmX+fI9/AJOvPFb6lzMB9orUR1bDXsHi3RtyWr/m12swhanhK/AxhUd8tI75jOa1y9XL1ANujURN1cxPqMf7Rbv6Y55XXEs/KstzgyDQeun8+BNKgRoANXpFOow4p2NbM35p6YrWmFLt1P3I439gXJRemBaO/f/wWTAnBPES590H2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFNH0dveQUEeq3PVdBKPIu5GhlKXXz5N5FFb48GZA+M=;
 b=A86DES0EGIveBWznVTEhqW4rIK1zMvaXueDLo77O04Cbh1SApOTJIjK4xPWyJXwYbHlPcQxVP0P1Jge0JthKFuOLmqvz0SFQCBJoputlXKSV3jyv1ZPl02F5af7xkMSsc6Bm1R/M0nbbUbLGW/Oj2eUpsSpxgkvAALQg2xSQfuRdQgb3mX/xfu8h2gpLzzNQagf56XBPSqjhDe1B2oG+SvJSzVfjEnQzGRp3VO2OMScXX4TeV0foEDXEzBPWl/Pg8IKOOJcUnS+iv+W19elxpjr8KThmjVAwpW6kzj9mRvl1dLIty5x8zNsWJSepPBUcoNJ0ZG+HaVxjGj/pJzE/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFNH0dveQUEeq3PVdBKPIu5GhlKXXz5N5FFb48GZA+M=;
 b=4K+s1sKrjoYjRPiWXYw3qTPk+dFg/yfsYe242xqNZ2phIk4HQYedvG5CPQmxmz1gAIsLMi8hhbSDysCTcsv9JUa+s6fpsQf9ivsQ0uB27Fk7sqG0l3DPbX3l4FQbKszk0F5STZX1Pgtuzt4QiOREXdNLp2lAlR4zmVnybVsLodw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <08f1721b-344b-4548-9002-7024fcfe08f4@amd.com>
Date: Thu, 10 Apr 2025 12:18:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] x86/boot: introduce domid field to struct
 boot_domain
To: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-3-agarciav@amd.com>
 <8089dab8-d94d-4eca-ad75-fec972386c80@suse.com>
 <D921GUF7GQSF.F8WN34U5M7L4@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <D921GUF7GQSF.F8WN34U5M7L4@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 770fce11-191d-4eac-9ddf-08dd784b4769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHdMSjN6TlhWYUI2NEc2N0tRWUZCRVVzRC9KQkpoQ0Vzbk9PTGRKQWZNYXd4?=
 =?utf-8?B?dDRpWjBSdWdKMWxZQ2ZTSDU2dGx1VjdndVZ3VUxQWjdTbUI1YU81ejhVTG85?=
 =?utf-8?B?Ymg1MzVUTkN4Q3J1TkpiQ2hhL1BOclpIZTljVlB2RmtaQmtIT2VHZGI0QWlJ?=
 =?utf-8?B?dGxTWURYTy9rcU1CTnVJSnRYU3RIZ1FER2JQOCt0WVhtc2x3eXFJSkhHZm16?=
 =?utf-8?B?ME85eW9vRi9pVkMxdFg5dlpNUmozaU5mNTZNUUEzd1BMNVpuYjBYTzNPMUpV?=
 =?utf-8?B?M1haeVhzVGFkbHlUK081aDJhZjRmajVrNTVjaC9NMVpBaXg1dVlNK0VtSmY0?=
 =?utf-8?B?OE15b3pNcklaMWJkVDBueGx6MWRzdFdCZm9BT2tySGo3U3hSc0pLdjFsNEtk?=
 =?utf-8?B?WWZudnRSaXlyeEdsSVdiRkNZc3JPTndFWEwvbDlrOUJNckNZNlkyQzhEbnhY?=
 =?utf-8?B?TkhuQnZORWVoTGQvWlBPdk9LL0hwVEt6OGZqT0ZSWGE1R1BlWktiRTRoNlIx?=
 =?utf-8?B?bXVoMTZyaE10VXR0RHpnQ1NHZnhGakcxRUdyWHVIUDNPRlI3cDBOR2pjb3hv?=
 =?utf-8?B?L3BsWUhBdDRXVzZ4VDRiSXVNQmFFRTIyOWROT1E2djV4NzRLZzRYa2E3UEg5?=
 =?utf-8?B?V3lFTE43NlhLSHdSMlpNdEVybU1qcUJ6bmhKeXVvSkIwUVpoeGtWVmw0Rk1u?=
 =?utf-8?B?TTZ6NWs0Q3gyOXh4aHMwTkR2YmVvNmNBRWZyR2pkMnl4dGdGVmpWYk5KVEM2?=
 =?utf-8?B?dVhac1NJWDd5dGI2d0RsZzRoUWJMdDNZVWEyOGR4VUhONnQ0MXhrTG4zY2sv?=
 =?utf-8?B?WHFJNGw2TU4rTGlKM3pRVWovQWF2UmNoUm5IWk85Tmt0SitJVkpUblpyQ1N6?=
 =?utf-8?B?WnVISndCMDA3L3ltNU02OTczajlma25YMzNqK2I2V2NONXFoZmFNY3djQ1BJ?=
 =?utf-8?B?VFg2M3ZvUDNlTUllTml3V043ZzJlaE5iYVdtWE44SGhUekpJeTczTy9zZ1Y1?=
 =?utf-8?B?NTFGNWpXMTRET0JVclVRUHU5ZkQrQjg5MlQwK2taTFltNGRMbld3em9saVY5?=
 =?utf-8?B?Yk9CbzRTTzZrMGRnUWZxeEZjMzN0SThhQ2ZsWGtUWDlZaWF0c2xLaktIclAv?=
 =?utf-8?B?dTRJT051WUlTWUtVYjc3SWphYzBpR05zNHlXcThEeHdodm9HWGc4THJRTkZ0?=
 =?utf-8?B?KzZkVU5mTlpGVnZIN3FyS2pPa2NLK1FFZVhvNHFYNlJZc1ZBakx1R3ZwMXF4?=
 =?utf-8?B?QzMwR2FDeVJ6aG9yWjhpVS9VU2YwQm9xSGFYOHR3cmErdE9YbGZMUkhxaU1j?=
 =?utf-8?B?bzE2SlgveGsyTEVSUlJZQ3dka0xuTEQ0UE5yM3lnem4ydUFGRVhXdHpRVHph?=
 =?utf-8?B?WTBUc3dUbU55dis3dktsaERxeTRERjJiYm1ra1ZaVmppSjlOWVp3VE5JRnJw?=
 =?utf-8?B?cUYwaVBjYjY5bkRqdW1GbCtrVVdib3ZhUFc2aUgzZkhadFNuOUhEeXM1WWhm?=
 =?utf-8?B?N2RkemFFdWpLczU3LzZuYnFQQUdkLzZXSFRlQTdYSTZIRlFlZHZwYjJVaWhK?=
 =?utf-8?B?UUpLKzczRWRXNkwyTDdzeUloNXZxTkNNR2IrVHhSSkJTM1hDWmxMNG9LYjUw?=
 =?utf-8?B?V2RGYzh1Yzc3K0NYdWpPZTdCNlhET2h4MU9IVzFZN2ZUazhFeml6d3lFTkZU?=
 =?utf-8?B?Z010aFZvTElMU2drQmg3ODNkdjdhN1hoT0MrVkRwR2hVQVh0eEkyYjhjUVNn?=
 =?utf-8?B?b0o4MVpoQzhkczBrc2swZWhVL0QvcmtsVTBMRUpGRUkwY3Q0Q2czczdaNllX?=
 =?utf-8?B?eFVWOVdoWXZCanZ2UDhXU2U4MnYvS1FXY3dwUjlCSmpoMkllajZPdlB4bmtm?=
 =?utf-8?B?NXozY1RWZ2F4V1dLcW9hTUVNT0xnZmhwd29SbXh3U2cxOWJpb2RKaXArZk1n?=
 =?utf-8?B?YmVFeFF2bnc4UnBFNFpWNzBkdjBjY1NCT3hhRm1ZZGt1QUVMUW0wTlhwVWF5?=
 =?utf-8?B?NW83YkNjUGdTckU0d28wYithK0hyYUZ3UnpLRmx1L2dZNGhwVExsNTdaK0lS?=
 =?utf-8?Q?67UGiB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:18:07.1525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 770fce11-191d-4eac-9ddf-08dd784b4769
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525

On 2025-04-09 06:33, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 7:34 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> @@ -1010,15 +1010,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>>   
>>>       /* Create initial domain.  Not d0 for pvshim. */
>>> -    domid = get_initial_domain_id();
>>> -    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>>> +    bd->domid = get_initial_domain_id();
>>> +    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>>>       if ( IS_ERR(d) )
>>> -        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
>>> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>   
>>>       init_dom0_cpuid_policy(d);
>>>   
>>>       if ( alloc_dom0_vcpu0(d) == NULL )
>>> -        panic("Error creating d%uv0\n", domid);
>>> +        panic("Error creating %pd vcpu 0\n", d);
>>
>> And why exactly is this not %pdv0?
> 
> Likely to avoid what looks like a highly cryptic format specifier. But I
> agree your option seems nicer.

Hi, Jan.  Sorry, I made this change.  In earlier feedback you wrote:

 > That said, since vsprintf.c:print_vcpu() calls print_domain(), using
 > %pd is certainly an option here (inconsistencies would arise if %pv
 > and %pd presented domain IDs in [perhaps just slightly] different
 > ways).

I took that to mean you thought "faking" %pv is undesirable, so I just 
wrote in in a different form to avoid the potential inconsistency.  I'm 
fine with %pdv0.

>> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,
Jason

