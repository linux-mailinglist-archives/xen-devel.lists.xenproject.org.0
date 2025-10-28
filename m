Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA2C16CEC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 21:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152423.1482950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDqVN-0001IC-VR; Tue, 28 Oct 2025 20:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152423.1482950; Tue, 28 Oct 2025 20:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDqVN-0001GU-SX; Tue, 28 Oct 2025 20:41:21 +0000
Received: by outflank-mailman (input) for mailman id 1152423;
 Tue, 28 Oct 2025 20:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q83W=5F=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vDqVM-0001GO-9e
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 20:41:20 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 710900b5-b43e-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 21:41:14 +0100 (CET)
Received: from MW4PR03CA0016.namprd03.prod.outlook.com (2603:10b6:303:8f::21)
 by SA1PR12MB8724.namprd12.prod.outlook.com (2603:10b6:806:38b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 20:41:10 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::28) by MW4PR03CA0016.outlook.office365.com
 (2603:10b6:303:8f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.16 via Frontend Transport; Tue,
 28 Oct 2025 20:41:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 20:41:09 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Oct
 2025 13:41:09 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Oct
 2025 13:41:09 -0700
Received: from [172.27.252.218] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 13:41:08 -0700
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
X-Inumbo-ID: 710900b5-b43e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhFLK/1MuApN4L8IiHfF+VJB+2ntqJyeyyiq19EzLXmWApOrcEV5Ve/FXji0en60pRV575WisuAp12c/HaXwUj9smLrXUPrh+L2CX/6PtlmlvowtnIat9/C4T+arqZ9hte1+p5IhP9pM9jmC7AEEME04AVxLadtTAkZoSCTf9oRngZpNJPyiIJxEUJP7dr4jMlxGWAZWGwMUcey1l59qcGO+xlSvWb43jChN4e7xOYWkpfKjB0H79+pLUkXzBTyvff3Yhqiinb+TMyNmJb/yGbH3MZmE/quswJGGeJUu7A4p9nGd0sufjvYatr1E13LQmme4Yxi2MlebIg1Wu2sxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtTfUmz7uzjdaEfuQ4u662No/wB6uEUodbU39HVVf2o=;
 b=L/ewOf6wwBto6M0PHwMSZd6pbibdO4TZdH3ixJk2W7SHSHXKGka1+Z2oz0ouHLDB2ZqdfvkBQsaVgIgi+eEkAozizI9uWfKWUmsOAzhfTRbuHwqtyQcFFMWS9TIO72dbFCuyR9pKyRG97um9HpRK/QoC8dUb1xHk05dadvF+n/fOqW2fG4lK4jY542gfGnI+/4Z06Whq/mSVS6qmJ5cjCJYUAjyRAMvDHp2/1buKtQoiLDRYaUa1WQ38+Tm7A4yOPctNhxSiIJqRPXFbAMKgSczAKWOe2w3YicnbB2S6k0WqoX89YqQJmb6ubcQw0S3q5567OwWIDGVSSL9bpTkU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtTfUmz7uzjdaEfuQ4u662No/wB6uEUodbU39HVVf2o=;
 b=Fk9p1eHjMGr5lClYhy6VOyXXoj6PvEOGjOospp/gS9Eq3n9O8MssDTts32mCmUo0HKhi/W3s1cB0vGrVU3vou1n/13fpTXKjCkKC/b1K4usUhh90npw2UUULpcpb8ywcW9bFopyFmUvtMFcxE51QOUU3GlGKLl9lGS1xOGt9z/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c13b3881-bb16-4729-acf3-702785216593@amd.com>
Date: Tue, 28 Oct 2025 16:41:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v5] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <20251023151807.560843-1-grygorii_strashko@epam.com>
 <cf7f5cad-06cb-4702-a10b-e0b087060fb3@amd.com>
 <a66a8394-88f9-4b58-ade6-56c327e3cc08@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a66a8394-88f9-4b58-ade6-56c327e3cc08@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SA1PR12MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: d55e8f3f-645a-4b28-929a-08de166253b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUp5RG44eDdUZlc3OHRXUDVhd3BNWVNJbjRxcVcvakRFT1dTZUoyTHNOSjN0?=
 =?utf-8?B?eGxCRGVSeGl6RllqSjNRZ1BGT2RKNHJqWmJSM0xqVWxveWxFZzlCNjJkUDF4?=
 =?utf-8?B?eDQvR0kzcmhSY2RtSUFzWituTTFYUW1jTkRTcVlGVlBVbUFFWDkrK1Q1M3gw?=
 =?utf-8?B?ZzFlVk5DaVNxR2tBTkp2NjJncEZoMWhOS0dmUC9FOEZSalVwc3RUaWxVQWhr?=
 =?utf-8?B?c09vYTJHd3ZBRHFISkYyczZjRHJUTTc0NHlHUEdsYm1EMzZZQVZDQkpSaWkz?=
 =?utf-8?B?U29sNkVVQTA2UmJyb2ZqeEI1VHo5WUVuS3padWV3S0VHQmJ6UE4wRWJyMCsz?=
 =?utf-8?B?dFNHaVo4R3ZrYjRGQTRZTU1FcTdJeVZJT1RuN0l5V1RhWnhUMlZIQ3RlTVRk?=
 =?utf-8?B?dnFUMzJBVFR3eFJmemtwcnkvbm0wN3ZMc1pHa3NhVEFYbXE5UHZnL21iaDU1?=
 =?utf-8?B?UVRMTXd0WUJDb3JabHNTZ2FpSFVReE9rZFFoQ0JFM1N6OU1jaEorV1pERGtw?=
 =?utf-8?B?TDNLWGRmV1d1VWRTa05HQkdXcjlqTTFzMGI2UldrYXVmNEZyVDNPdGRFQ0xz?=
 =?utf-8?B?WXgzdVF3RGRRZ2x2azFLQXdYTitrM1gzeTkxcGd6eVRJSnk0VThaSmZObE4y?=
 =?utf-8?B?RlgrV21mVno0RCtMZ0craHk0dk5ES09QaUZ3NS9tMUpLbytZOWVHbXVnRlg2?=
 =?utf-8?B?MUhIYTQwODUzdEh3M2NiU1EyaHRkblNQMi8rTTNQbjdzZ0N2anEvc3dvWjJG?=
 =?utf-8?B?V0oyMy9qSkJBbmZuL3NvMmxuQ3NJMmdQSkp2akpqMU1WMGEzVjdWUm1uOVNW?=
 =?utf-8?B?TlFyWWRWem1MZ3NWcEUwcFRtR1RnWVJBN3dNT0VSUGZjZWJnK3NXaXVyeE1Z?=
 =?utf-8?B?UnlYYXBnc1Y2bFVxUTlueVF6VUYyeHA4a3kyQkxYeGVaN1lkdFpJWDYxNHNa?=
 =?utf-8?B?bElRTFcvMGhLbGVTb2JSKy9ocDdsZzNwbjlKTy9qMkxXZm5oekVRY3FHTDY0?=
 =?utf-8?B?UTYrU1JXSndFd1N1dUgreEJIR1lRbk5HUXJ5UEhocDQzMVJJTE1obEtuOWxk?=
 =?utf-8?B?OTJmZHdQTFcyUUVHNjV0MisyV1IzWUNHbnNBZkY0SGdkN0VBc3ByL3NCS3VQ?=
 =?utf-8?B?Zm5MYzNOU1JwR1RzR3RXcXVuNlpuUExJQTErQysxTGlsUTVDeFBxS3lMM2JV?=
 =?utf-8?B?SktGOWxqWmdyRlVGK2ZrVDNrQmttOVd4cnZWRmNQUmpWd2VXdVJYcTlTL1pS?=
 =?utf-8?B?MXlHUW9tNE1IZ29Qd0JjdndCZ2xLUUdzUUlBQ29OUjcyUktmaWVpWFpJYlVQ?=
 =?utf-8?B?d2JYS1duYS9HSnRydnR6QXFSUys5cWgxZXhHRURUNjc1UjdTZ01FQkVYZVV4?=
 =?utf-8?B?cEQvdFk1Ym0vd2RCc3pLTXB2MGhkWWJJQSt0RHIyNHJwUUlHYm5YWWNZeTd3?=
 =?utf-8?B?MTEvRXBDcHljdk4wZ3FyTEpsSFF1WGZCVkhoUGExazAzR29sblp3a0FWWDhT?=
 =?utf-8?B?K2U3UG1TRjltZDhJc2M0d0dvbVA0T0QxanFpajdvc2ZUZnljeTczZGpmUS9L?=
 =?utf-8?B?NS9oMlN3L3lURWFYclc1N2tIaEU4SGRrbXBIaGpRaFUydWprb3hxRXpweXhW?=
 =?utf-8?B?UDI0UTRnNE9OMjkrVG9JQ21QOVhVSlBGM1FzbCtKOXBqeVZmejVRZkVaVWpX?=
 =?utf-8?B?Y1BPb1V0QzQzT01ibmRUeWxzdHhkcGRCK2VQMEZRQlE2bDhHejh4OVpiSGE2?=
 =?utf-8?B?bnJncE9ibldvZVJpZjkwdVM4SmtxeEs0alY1WExVMzVEcG5hN05RYzFjQjdp?=
 =?utf-8?B?S3FUZGNUSllISzdIc1JmYlBEQjNUTW15a3UvbW03RkVVZmRJSlBmM1pBMi8w?=
 =?utf-8?B?dWNZQUtuclY2SGtaTHVESXo3cXdHVGZpWElPYVJYZHEzU2xVWXZFaC81Q0Zx?=
 =?utf-8?B?ZzhCQkF6N2d2eWxrNTNQcTVvbkRXMkpsVVJGZlpyRG5jZTRMalo0L0lCOHZ6?=
 =?utf-8?B?OXF6M0Fyc2lFZ3J0V1p3NUFacTFLa21WTzBVSi9DZXVCOVF3SEM5UGlhOE5n?=
 =?utf-8?B?SUwyQjJZY1JoWkZTTy9lL1dTWE9aMXNtdXkyM0tvVy9seE1rU2xDUGJ2Y3d4?=
 =?utf-8?Q?Z91U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:41:09.8805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55e8f3f-645a-4b28-929a-08de166253b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8724

On 2025-10-28 16:17, Grygorii Strashko wrote:
> Hi Jason,
> 
> On 24.10.25 21:55, Jason Andryuk wrote:
>> On 2025-10-23 11:18, Grygorii Strashko wrote:
>>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>
>>> Add config option VIRIDIAN that covers viridian code within HVM.
>>> Calls to viridian functions guarded by is_viridian_domain() and 
>>> related macros.
>>> Having this option may be beneficial by reducing code footprint for 
>>> systems
>>> that are not using Hyper-V.
>>>
>>> [grygorii_strashko@epam.com: fixed NULL pointer deref in
>>> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>
>>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/ 
>>> viridian/viridian.c
>>> index f79cffcb3767..b935803700fd 100644
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>
>>> @@ -1153,6 +1156,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>>>       struct vcpu *v;
>>>       struct hvm_viridian_vcpu_context ctxt;
>>> +    if ( !is_viridian_domain(d) )
>>> +        return -EILSEQ;
>>
>> Given:
>>
>>   #define is_viridian_domain(d) \
>>      (IS_ENABLED(CONFIG_VIRIDIAN) && \
>>       is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
>>
>> CONFIG_VIRIDIAN=n is okay because of the IS_ENABLED.
>>
>> For CONFIG_VIRIDIAN=y && a viridian domain, is HVM_PARAM_VIRIDIAN 
>> guaranteed to be loaded before viridian_load_vcpu_ctxt() is called, so 
>> that HVMPV_base_freq can be checked properly?  I don't know, but it 
>> seems a little fragile if this relies on implicit ordering.  Maybe 
>> just do:
>>
>> if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
>>      return -EILSEQ;
>>
>> ?
> 
> Should it be done the same way for viridian_load_domain_ctxt() also?

Yes, I think so.  Thanks for catching that.

Regards,
Jason

