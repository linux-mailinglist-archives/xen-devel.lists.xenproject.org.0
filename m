Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB6AC6C1BC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 01:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165413.1492188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVsu-00084k-Qv; Wed, 19 Nov 2025 00:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165413.1492188; Wed, 19 Nov 2025 00:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVsu-000822-Ne; Wed, 19 Nov 2025 00:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1165413;
 Wed, 19 Nov 2025 00:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3JJ=53=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLVst-00081w-R6
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 00:17:19 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ab18e8-c4dd-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 01:17:17 +0100 (CET)
Received: from BN0PR04CA0182.namprd04.prod.outlook.com (2603:10b6:408:e9::7)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Wed, 19 Nov
 2025 00:17:07 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::f1) by BN0PR04CA0182.outlook.office365.com
 (2603:10b6:408:e9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 00:17:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 00:17:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 16:17:06 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Nov
 2025 18:17:06 -0600
Received: from [172.27.232.218] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 16:17:05 -0800
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
X-Inumbo-ID: 19ab18e8-c4dd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTjdNV1iH6b5hJuv1B9iAsc+7gnTwJSEsLnrpDKRk19xlhw16ZZXgOTYmQwJ6pNRsYWJjp5YcWl0ZL0A8HQNXqnty8prG+khjTLkONIBDvqI0DVzlhUh2BF0XkSUTXjUgLR8K4vKbpQbakBVrUnA8Btnu7dOImRMujJbnSZQ1vNk6P6RRrGLgbftRdq2v5juReqzDforyjtjOx1m72P84JcidEfqu58IdkO0c2+VXEZJJnLP59buArCHsGLuj02Jifl6Nas/M22BJTHCnb3U44HMq/GUlEWuh1jiN13IzcAdRviQ2oTzm7XbRT6CjnieKwfvSLhFeqGI0Dwr5ivNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZckqI7p7DpTBZvd1JPWkL30gfBv8JG1WU+UnmLbVB/M=;
 b=iWmgfmH0bJtzVVZQ/tW+76y85ynqjLKMiCaEDBCCUGAxPnPGD3DZhbrQ8ZE08074wuMdbhNHo/GfTViJw6TUjofgx16wZogJX82rp3iA+1O1JKOAWoxnYM3416qQuT5HXyPohjSrnILmLnfZFNu6zFA9wd10dBu8qDsdWWbucCWeoEmnu1arTGLN7KVEJIF5eyY1HXToK2chrCUqevbN2jM/1kTiayvDue4oRd2j9V0YkqN9wCn6LBEtrjIn8UwGySXWtbUXKRRWQqEnzAokHmSg1c6kKUD1MTDDDs36WwiHM8M0FmpaQfdIiPQ2w9oaKtUZnIk/bto3YelQbU/jeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZckqI7p7DpTBZvd1JPWkL30gfBv8JG1WU+UnmLbVB/M=;
 b=BgSSs+EEnaRj1I/OBJC184WUAOZmWwj1qefRBDJsXQ5k6TWsjfJjVkNWDz2cPRnbGtREsXhRelHEOVkQMXnzmTpeE7sEIlMd2mjB4lS0wP5QqgSynuI+j9yy+0Y9igyJC8mAhWwfJyzENfGL1BW0/8ddRMePnDfZKuAmlm6z7mw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7cebd161-5eb2-4755-a78b-28cea5ebd9ff@amd.com>
Date: Tue, 18 Nov 2025 18:40:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] xen/x86: move declaration from mem_access.h to
 altp2m.h
To: "Penny, Zheng" <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-6-Penny.Zheng@amd.com>
 <136416d6-ea2b-444d-b331-8aef1881ed91@suse.com>
 <DM4PR12MB845171D6D974E63DDF6D4D6DE1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DM4PR12MB845171D6D974E63DDF6D4D6DE1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|DS0PR12MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: a690874e-36de-4810-90cd-08de2700f946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUFiYWtMV1VtMldFU0xlSnJmV2h4N21UY0tadHFGYzFwdXdKRTR4Qm41YWtL?=
 =?utf-8?B?QWJMMXBucFJoQ2VrMXhuUGltVlYydjJqbGdYRlc4SngzdmptMWJ2N3BnTDBq?=
 =?utf-8?B?WjlYRXYyRmEyVmk4TTJ6cFE3VWswdVBUaU91aXZrSHFzS3JMNTFTcVJLUXVv?=
 =?utf-8?B?RHp4dCtqL0duaWtyUUd3UU9XcHNGeW02SXg0WlhwY0Y1NTBHTHVqTTBqKytB?=
 =?utf-8?B?VnlTVEIxbGxYTFpRalRWTWVSVmlxUUtrSXRiZzJVUjE1QmYrYXV3NERLR2s1?=
 =?utf-8?B?ZDFjNDRFODdRYUsvWHNKa29QWDYxZ25JazVYYThpa2dHOGk2QzE4aW1CN04w?=
 =?utf-8?B?c3pTRTNtNExOdTRzL29LMUg3QjJ1VnQrejZXSWh1QjhpTWJ0bjgwdzJRSkhE?=
 =?utf-8?B?YzZpUDh2Slp1bFhKdE5jU0hEMFRWeHpLb2pBcllkRkhmL05hSXRKRHZETzJW?=
 =?utf-8?B?cmZHazdzMTVJU0dINWJVYmxEOUl4bHc0dUZqY0tMWTFEMXVGbGE2QjBOTlU5?=
 =?utf-8?B?Ui95NlZDNXFSYzVoSGZkdGVKUFZORHRVYWlJUGxWZktDbGJRQjZWYWd4RitN?=
 =?utf-8?B?Y0JiM0c5WEVyMXBOSnJvRWJCWllldTZUS29RKzY1SzlQeXRaUUk0S2psMmMz?=
 =?utf-8?B?WVBkZDJ6TmpESGlTNGNyUjV6eFEwOVZxTzJsdHhSZituMFpDb2xzelovbFF0?=
 =?utf-8?B?Z1FYU2RmdkQxeHBHSEN0d2w0YzJsZnVsM1lMOFh0ZW1vS0J0RXNlY2wxRFFq?=
 =?utf-8?B?RERoSjVVTHdTa05EbHp1VnNjQ0taLzhkWUlTS3Z5RDVUaU9yOW1XaGlLYXJL?=
 =?utf-8?B?T1ZnUFVmTTFGdGFPUW5HUTMrTFhKZ3YyaHRLcUhERTB1QkdRZFpUaFhUanM5?=
 =?utf-8?B?b1dnV2cxM1NncVI0UnlzRkRSV3NOUCtDZlpkL0JURmowSVo4ZXFpN1ZLN1Rj?=
 =?utf-8?B?MFhXc1dzSGtTQXZrSWFKbHI2blBOQWxXWUdwN0dndXBIMml0cnY2Z1dNMkNw?=
 =?utf-8?B?ZGFBYmxrYUJkV3RYczRWQjZnUjJPQ0dDNTNmUVQ0d3A0RVBtaTRzeGxpdDQ1?=
 =?utf-8?B?em85MnE1VmphZVVYUjN4cUZuSUxuTkxwWFBuaTVWVnlkbHhDV3Zac1ZFbktz?=
 =?utf-8?B?NTJQTDRmY3VJRkloMXluSk9sbVJDTUJRWEZUZ2I3SDZhL0cyVUpUbTZQbjJt?=
 =?utf-8?B?ZTJzclNNKytoK2puOGpRaEJkaXhaUHlpakFzOUw0WjRkVjRjeTVpUWJsRm1Z?=
 =?utf-8?B?cW13Qzl3TmpDUHpnNlJiNWljaEx5Q0l5SHd1UExQV0JSMldtWnhqWnVDRVlj?=
 =?utf-8?B?RC9HcmtORkkrbXMrU00vREdoWEFURWg5WlFZWDVheTJ2VEp1VEltOE50dzZ5?=
 =?utf-8?B?eGZPVVczRG85OXdNK1RYY043cEIwT2l1R3l5b0NNUEltQlJaeVhZV3FHNHRY?=
 =?utf-8?B?WHUvb3JFOG5xaGRkcjRqUjV5NW10eVhXdmNDUHowQkRmSTg0SlJGS1Fwa0kr?=
 =?utf-8?B?MkxjZG5BcU5jU1hTVTExS2JvRkpxTVlGZ3h0amFlZWNHZUh3SmVVTGtnanp4?=
 =?utf-8?B?d3FQK2U5clVFZGp1T3d2amRZaDhROEFVTUIyNDhSY3pOYlNQdTdaRWI5QW84?=
 =?utf-8?B?WE8rRzBKdEdvRDIva3BEa2EyNEtoNmFWNnV4cjkyVnNVSWYzb050NUlNaGxs?=
 =?utf-8?B?bE9pamgzeG11SDUrNUtuNjJ2UmJxWUx3cWYzOEs0ZXYvc3ZQT3dmT1pKS3JM?=
 =?utf-8?B?TnRJSDNmODlaS0hHdUdLSExMd004a1huVnJiVENmN3RCNVZtUUVzWkVjUFVR?=
 =?utf-8?B?alBVTkg4S0JLMXJHSzBZVDRnbWlpdjY0Z1pLaG1zK1kwaWhaOGhkVitmTGQ5?=
 =?utf-8?B?amQxRjdNbEQrR1hMamJ0Q3llUU85Qmg5WjBHYTM3TnhJc2tYWlJBMElSdVRr?=
 =?utf-8?B?UThXcUhkbFlMQjBnTG1SeWo0TWgvZnpiM1FrWU9obTRzVG5jRzk5bjVCcEl0?=
 =?utf-8?B?c1JNa2lYZkFPeGVWWlNPclg0VnE0Snd2bEo1WmNWLzNNWnBTQ2ZTK3BwOVlU?=
 =?utf-8?B?RVc3cUdSU2pXeXlZeTh3MDBWMjRramt3WlN1ci9VczBYbVN5dU5MUW4wWkVK?=
 =?utf-8?Q?Um+c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:17:06.8406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a690874e-36de-4810-90cd-08de2700f946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057

On 2025-11-18 06:09, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, November 13, 2025 5:35 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Tamas K Lengyel <tamas@tklengyel.com>; Alexandru
>> Isaila <aisaila@bitdefender.com>; Petre Pircalabu <ppircalabu@bitdefender.com>;
>> xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v1 5/7] xen/x86: move declaration from mem_access.h to
>> altp2m.h
>>
>> On 13.11.2025 04:16, Penny Zheng wrote:
>>> Memory access and ALTP2M are two seperate features, and each could be
>>> controlled via VM_EVENT or ALTP2M. In order to avoid implicit
>>> declaration when ALTP2M=y and VM_EVENT=n on compiling hvm.o/altp2m.o,
>>> we move declaration of the following functions from <asm/mem_access.h> to
>> <asm/altp2m.h>:
>>> - p2m_set_suppress_ve
>>> - p2m_set_suppress_ve_multi
>>> - p2m_get_suppress_ve
>>> Potential error on altp2m.c also breaks Misra Rule 8.4.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> Thx

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

