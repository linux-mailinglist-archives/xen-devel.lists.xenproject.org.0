Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NfDNBz5cGmgbAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 17:04:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347CE59A53
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 17:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209989.1521851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viagx-0008GB-OV; Wed, 21 Jan 2026 16:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209989.1521851; Wed, 21 Jan 2026 16:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viagx-0008DI-Lc; Wed, 21 Jan 2026 16:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1209989;
 Wed, 21 Jan 2026 16:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viagw-0008DC-88
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 16:04:22 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d641adef-f6e2-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 17:04:19 +0100 (CET)
Received: from CH5P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::21)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:04:12 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::cb) by CH5P223CA0016.outlook.office365.com
 (2603:10b6:610:1f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 16:04:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 21 Jan 2026 16:04:12 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 10:04:08 -0600
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
X-Inumbo-ID: d641adef-f6e2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrpsPhY7QmaH09+jujG50Xrz5PlD45ozhcUva6jgNwdp0hRLc84lmIIMlT8DKv+UnSl2Kkd+j6ugIlm/bNg5tNIcyFofKuHC3BtxT7WdeXYETcZkH6UgnRC4zGFXQMpxxuCy9OUDZemIWqA9lPrL2pUnfpeIDgzHVVhjMPdjcAF/1ouYvJY6tCEaRC1l98OScM5qdHLyNTIkkcEbOV+AfQukGE1fxZzARB7NjhqrPP/6dpe1iP4rP5/0PTCFvRZ3qL9SfWhyYO7ZVDmz99I0CutwRLF0fH08M2JZ6IoyY5dGZx+HcnbFavy5VeP7Gf0lNVZdnn9QuTpPZ0WHD/KM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78r8h8ctwyWiwA+WDjonPYBlUeIDTZEOTkJ7K9cXGZI=;
 b=ovPLFmoEt7W2/HETdXe7d25FdBcjoLEK1y3jpDXWWfrT0cG0hA3c74bv7skYmFthN6eqHlabqs1F0XYpdUxVI1kuCZeAMY1+8gAtuuGo6cPtuXzXkjETnS0zGhzW9r76l4+S8dVC7wCVmVWsUOkhHvUIM/d/a/sRA8/ougK8uWT11DhslC929CPykDL0nZMCE/DwMA8al67hby4XuPpeFIkzmrKaNvcCbs9TK2Fv5t07tZRr1mMPYJ3PgfOaShAX3awTFVsxaMpmWZjmySRWs8RCv4AvMBiQDuGCvtEQcT8zB9qAWt3HtcTw5Nutg+eMqjztgCyPsMeaD7kLR6Ku0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78r8h8ctwyWiwA+WDjonPYBlUeIDTZEOTkJ7K9cXGZI=;
 b=kFCb1hZUfn6Xow5t5Vgg1mWoL/obeQWMwLRbuYsY8CDEKmFQEUoVCC7E4Q5XSCtpUtfel5bAnJed7Y2EDjk88MkN7m5t40h8bIAANxqJPYerHyHWxhlDrIAMzPDOfb+yAHBnl+AEDfv38c6tYGiTd6/6hF5cwOME8JJhVbZ/hEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jan 2026 17:04:06 +0100
Message-ID: <DFUE7ZHTJAWY.3GAAA7OQAMTQX@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 2/3] x86/svm: Intercept Bus Locks for HVM guests
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
 <20260121142857.39069-3-alejandro.garciavallejo@amd.com>
 <7fbc3acf-b878-4a82-bc08-89b91fb9aca6@citrix.com>
In-Reply-To: <7fbc3acf-b878-4a82-bc08-89b91fb9aca6@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d01eb6b-d7d8-40ba-81e0-08de5906b7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVk5TEl4VGR2bGRrTytHVHFpUU85K3dKekxIZzUzbm1JRXZiTmhmQUpEdmdF?=
 =?utf-8?B?aEFudXFrTElqeGFUN0JmVTVtU3MyUXJjVE1SUk1IRXI1STJOdS9vTjRZNkpJ?=
 =?utf-8?B?N0NXeWJjSVl6aDlvR2R4TjltcVE0elNVVXNkK2p1d1NzTWNMZDRxRnBSSXMz?=
 =?utf-8?B?ZmtKTzQwc2tjSW1tcVN3TUxmRmt3VU9MbkxlZ0I1cTZ3cW5vMnNjeXhWWElk?=
 =?utf-8?B?RXR5Mm96Mm15Mk95UmVrREM5VDUwR1hrUHNEUVlZQzRiS3RPdjZVUzNCcUw4?=
 =?utf-8?B?NWhwY2pMVUJ3TjkzNFpYZmExZ2FmeUxZVFVNbzFGc1h2dnQ2T0hqaitUZlBy?=
 =?utf-8?B?NThRN2ErcXoveWpya3dHNzFObzVCd1RzMmwxaFJsVGhFeENtOVQwczVaWTQ0?=
 =?utf-8?B?eHA4NTE2dE12WU9VSU9weDNQa1BNeXZBcEZ1OHFUaU44T2RLVHN3djdSK0tx?=
 =?utf-8?B?K2Q5QjMrMS9GbHBBNGRHdFBXaXd4bk0reFVRREROSkxFUnR4MUJpNnBWVzZa?=
 =?utf-8?B?dEhoT1k2WS93SFdrblNGVERMeG03WEhIbWRxdC9YNzcxOGN2QXR0Z1N2RklU?=
 =?utf-8?B?WHc4Tmt3UHhJZzRpVjlvZitBWDRJQmEyNmN0RDNlVTkyTlkya3VQeGRYZit4?=
 =?utf-8?B?bDFmUDFzMytMZkdyT2xEcElhako1RUx5MUsySnU1ZkU5V2ovWnR4Vkd1NkNy?=
 =?utf-8?B?WFlWOEI5Tjc1dmM0V0RlSW8zZXAyL25yMHRFTzY0VTl4djBueEtxSnptYitU?=
 =?utf-8?B?OXd2MzJ6VzZxbXk1N3VqNGl0UXJ2eWhGT2dkdkI4REdrSStsSjhtckR5bFdu?=
 =?utf-8?B?N2Z0R0QyaXQ4Y0I2a2NmajhKSDcvR20xcEJ5L05SNnM4RktEM2FRc0dOY2U3?=
 =?utf-8?B?eG41UHVEaVJOSS9CM1Bxc05Yc0xMV0hOclg2dE5hb2lQTkY2WjhlSkttZVNl?=
 =?utf-8?B?Q094NzR2WkIxK0VGdW5Wc1BpSUYyaFEzKzMrSWF2VTlCTUE5TTVBWmU1d0Z4?=
 =?utf-8?B?eHBySHJhRzZjZE1jcHJhM0YwbE8xSUNtZ21DNzFXUk9iNmp6KzdtMk1PRnRS?=
 =?utf-8?B?S1VhSmZmUUNXbmdnZGhzMVowcGl0OUNhaS9kMFRIcksweUZvR1NiTFRTUXVE?=
 =?utf-8?B?NjdvTnZ0LzlHdmMrb1Z6MU8wdTNSamVNWlJjZW4zaG5MTElBMWdjQlZkd0Uz?=
 =?utf-8?B?N2llbllOb2Z4ZExXN1p0Mm9Ta2hBbkoyTkxndXEvUFBQZlFnQzArNzhjNTVT?=
 =?utf-8?B?Y0w3NzB4NHVuMWYxM296VkIrOVdaZkJyZmFoSHRpR1hVOEhTOFI2K2RqTXQ0?=
 =?utf-8?B?OWovYWxvNW00Y3NxL0VleXArbkdvTlJjT0FvN3FKSEN5SkV5N2JCY1k0RUtD?=
 =?utf-8?B?QTBwRjRCdFJVeDA2eDhxSS9KQmdGRWRWMjJoU1VkUnZkMk1ybnFVcHFvNFR3?=
 =?utf-8?B?RWFtbEFSSE4yalFjYVR6SG5BOFc0YVpMNC8xYmd5S0ZYV2g4RFdzeEhTbWt3?=
 =?utf-8?B?VHZncDhKZ0RPYWM0RTR1OThxMFRaRGx5R3NxSTVkUk50MmNhcWg4YzdKaGZz?=
 =?utf-8?B?SS9NZ0F6RlM0dkliZW1IazUzMWNsMno2RS8rVDBXbmZRQ0lTTC9EeEcvZlZl?=
 =?utf-8?B?eldUTHVJRzFPZDZPUFRTWlpBLzYrcVhmOGlVR0JNODhnNmZKcERzSmgrUTI5?=
 =?utf-8?B?aDZqUjUrSFp3dVVJaE5QaVc0QzlWL1ZTYUU1NEl3S1NNNU9HUmIrU0JWTDZu?=
 =?utf-8?B?dWtuZnh4RXNNYnBwNkpzVGFSK0NiSjYvSGtUVmFBS2w1cGlZZ1lOQ2F2WFZC?=
 =?utf-8?B?K2pPWTRRakJLejBnVkhqRW5wUDRYajUya3J6WGtoQmFsWDdISXl0YmVtdHE1?=
 =?utf-8?B?cnB1QlBmZzhZRVhVdlVqT0NuSVRMQnR2eHFVdEFoa1lONnlQRFRlclJ2bFcv?=
 =?utf-8?B?V0JUWUZsQzJVQlhYTTd2dHU3RUlldGFqQUkyUGFMU0szVnp0ZVNvNmMvQjk4?=
 =?utf-8?B?VzBGYWw5L0hhZCtZNkQ4R1k3RFdrV291WUswNzk5ZnJHazVkYkFGWUhIb2pk?=
 =?utf-8?B?ZllhU2tEc2Y3OUNJVGNFaFBGMW1wVlVPMFNud3FqL0lLY2tac1k3WUVjb3Qz?=
 =?utf-8?B?MmtBaWY0QmZqRjBDaTg2MnpNRTJCUkMrMzYyRjl4OGI3SHY1bGVYSGJ5MEh4?=
 =?utf-8?B?c2I3aUh6bDVCQTNYNXVsS0o2YThDTURwRFdGMmN0cUNxZ0U4dXNERUVoZWdF?=
 =?utf-8?B?b2hEbXNVUlJtU2R3T3BEeEdTL2ZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:04:12.0963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d01eb6b-d7d8-40ba-81e0-08de5906b7cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 347CE59A53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 4:35 PM CET, Andrew Cooper wrote:
> On 21/01/2026 2:28 pm, Alejandro Vallejo wrote:
>> Configure the Bus Lock intercept when supported by the host.
>
> "which is available on Zen4 and later".
>
> (I think ?)

I don't mind the addition, but does it really matter for the purposes of th=
e
commit message?

>
>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 5d23603fc1..abda5a9063 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm=
(void)
>>      P(cpu_has_tsc_ratio, "TSC Rate MSR");
>>      P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>>      P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
>> +    P(cpu_has_svm_bus_lock, "BusLock-Intercept Filter");
>
> "Bus Lock Filter".=C2=A0 The Intercept part isn't terribly useful.

sure

>
>>  #undef P
>> =20
>>      if ( !printed )
>> @@ -3087,6 +3088,11 @@ void asmlinkage svm_vmexit_handler(void)
>>          break;
>>      }
>> =20
>> +    case VMEXIT_BUS_LOCK:
>> +        perfc_incr(buslock);
>> +        vmcb->bus_lock_count =3D 1;
>> +        break;
>
> This needs an explanation of the behaviour.
>
> /* This is a fault and blocked the Bus Lock inducing action.=C2=A0 We're =
only
> interested in rate limiting the guest, so credit it one "lock" in order
> to re-execute the instruction. */

fair

>
>> +
>>      default:
>>      unexpected_exit_type:
>>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index cbee10d046..15223a693e 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -66,6 +66,9 @@ static int construct_vmcb(struct vcpu *v)
>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP      =
 |
>>          GENERAL2_INTERCEPT_RDPRU;
>> =20
>> +    if ( cpu_has_svm_bus_lock )
>> +        vmcb->_general3_intercepts |=3D GENERAL3_INTERCEPT_BUS_LOCK;
>> +
>
> This wants a justification for why it's unconditional.=C2=A0 Something li=
ke:
>
> /* Well behaved logic shouldn't ever Bus Lock, but we care about rate
> limiting buggy/malicious cases. */
>
>
>>      /* Intercept all debug-register writes. */
>>      vmcb->_dr_intercepts =3D ~0u;
>> =20
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
>> index 231f9b1b06..68cf5eaf0b 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>> @@ -68,7 +68,7 @@ enum GenericIntercept2bits
>>  /* general 3 intercepts */
>>  enum GenericIntercept3bits
>>  {
>> -    GENERAL3_INTERCEPT_BUS_LOCK_THRESH =3D 1 << 5,
>> +    GENERAL3_INTERCEPT_BUS_LOCK =3D 1 << 5,
>>  };
>> =20
>>  /* control register intercepts */
>> @@ -497,7 +497,7 @@ struct vmcb_struct {
>>      u8  guest_ins_len;          /* offset 0xD0 */
>>      u8  guest_ins[15];          /* offset 0xD1 */
>>      u64 res10a[8];              /* offset 0xE0 */
>> -    u16 bus_lock_thresh;        /* offset 0x120 */
>> +    u16 bus_lock_count;         /* offset 0x120 */
>>      u16 res10b[3];              /* offset 0x122 */
>>      u64 res10c[91];             /* offset 0x128 pad to save area */
>> =20
>
> Both of these hunks want moving into the prior patch, which resolves one
> of my concerns there.

Damn it. Needless to say, this not where I meant them to be.

>
> All can be fixed on commit.

thanks.

>
> ~Andrew

Cheers,
alejandro

