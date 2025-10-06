Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4ABBE4C5
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 16:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138246.1473994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5ly4-0001io-V6; Mon, 06 Oct 2025 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138246.1473994; Mon, 06 Oct 2025 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5ly4-0001gl-R8; Mon, 06 Oct 2025 14:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1138246;
 Mon, 06 Oct 2025 14:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrnp=4P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v5ly4-0001gf-0y
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 14:13:36 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d4e7a0-a2be-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 16:13:32 +0200 (CEST)
Received: from SJ0PR03CA0146.namprd03.prod.outlook.com (2603:10b6:a03:33c::31)
 by LV8PR12MB9417.namprd12.prod.outlook.com (2603:10b6:408:204::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:13:14 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::51) by SJ0PR03CA0146.outlook.office365.com
 (2603:10b6:a03:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 14:13:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 14:13:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Oct
 2025 07:13:09 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Oct
 2025 09:13:08 -0500
Received: from [192.168.178.136] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 6 Oct 2025 07:13:07 -0700
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
X-Inumbo-ID: a1d4e7a0-a2be-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbLv54ywg4vBOJJhlsAgZhq2BFRtX+R/loA7enCWEpPRMLSy2ebK7BmOXj09l0xvRCBVkVMPJujk+a77X6SL3x7J52V9z8lD1Z68sKtwWkYWbUKWPmQWRCoHvQ7qB0Wmwv1phE/oPfSwxv+o4R3Fv4K1grKOe5vSyyXxdkBtoB5YswBUw0rnVkStOn8JcbzgAoLyjBhOxCVZ/QgOpeqq2TKYlVTo88teJZw5hW/jLT/8L7TU53uP+2IGSY8yjAUAtrNtw+eLszF5j3HlkurrW6DBxbThQ/Qxzn+/mrxnvSICQNPlgj3e9Q1hllZWgVvADKrsLO7Hq5Bs1MUudc469w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQZaRbV5oxdi5NqUtW2e1R0sJduk0jq+XGnBnyT0yYo=;
 b=a6WirTrwpuG99MhEmTRNMo6V0dr2HfKYfBFo/6LgYzsN/9PUN+L09Kyr3+XWuRWjHHiv/qZy9+mYNrCF19scVcKAroXrivHHD7LouoaPVW+HbVEUkvIevyMR83f4sw1VH65Y0PTwurzCODeYR5jQsgOjNuc5uDGUoRMSwa9lXVbSMLVGnIj3EDuodVhxjyPhGmpCPaLMyM2Rt6E1nlfsrqA6Wpv9quH4h+ut8fJF9gpPuRzEe6zCW7g3dBtLJJxnZb/NVqVuLfe3MrRvVPyJ5adWl+o7Zgq0jSrDzVpLHpNgpdLp2ftt84a0laNDlD5ygRb6l+AnCvTxzQVEN47RPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQZaRbV5oxdi5NqUtW2e1R0sJduk0jq+XGnBnyT0yYo=;
 b=X0x8FhUvnDb+TppRqFZcPtfDfOIBPhVVOY+ZrVRqPhi34taiROZROHk6nanTay/AZk1KlbZELPDFCU2iuiwjTEEWl7DfkcmqRGahm0Z3G8ClVEvZ7Wf/bEqmcHoHJsFwgQu6N7t/CRuYtvjDvkwlIA0c8k27FcMdWV94KnZ2PoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <64126e22-5aac-4c31-8421-d8fa605e7a5e@amd.com>
Date: Mon, 6 Oct 2025 10:13:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] tools: init-dom0less: Replace err() with more informative
 messages
To: "Orzel, Michal" <michal.orzel@amd.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
References: <20251001075149.31545-1-michal.orzel@amd.com>
 <DD6WJ6AVBQRV.154QDILMV3EW2@amd.com>
 <a54d9baf-839c-43a6-836b-4ea9decd172d@amd.com>
Content-Language: en-US
In-Reply-To: <a54d9baf-839c-43a6-836b-4ea9decd172d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|LV8PR12MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c847790-cd88-46b2-eb76-08de04e27ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWRRKys4a0N3V0xGNGlaS2xjeEdQLzRXSXAzU2JjSmFvTHhwZGVBcm4zN0xK?=
 =?utf-8?B?clMxek5YaTJGQUxnT2pFdmJnMlJsdUtOWXlTWmZucTZEK3c3bjBYNkcrNGZC?=
 =?utf-8?B?T2NNZXNFekIvYmJZaGg5aHUxOFBaUlRzTXpXYU5FK1VFWkFuTjRpdWNSdExD?=
 =?utf-8?B?cFpDMXRNNENlcVUxM0hHYlV3L28zVnV5djBUNGVkOEhaQkMwT3FBeC83VXB0?=
 =?utf-8?B?dENxVWxQcEZSLzUxMUYrdXpNcCtSVzZaTUpuVlNSSVo3WDZsUkZxRmdtdFF1?=
 =?utf-8?B?MzdORzFJNTBGbjYwN2RHYjhsNkl4KzNQTkhHMzB6dVNmU0ZPSDg0MUQ1QUor?=
 =?utf-8?B?cnc0ZDFaZzBpRmpleUwyQXJkbk5rTFZOcXk1U2hValRjbnpjK1o3Rk16Y3FU?=
 =?utf-8?B?VldrcEVybEl2Z3RQblZOL0NicGtNWFBpRHBNbTY1WlBQeDdmYTYrcHEzMXVZ?=
 =?utf-8?B?Qm10TDB1QzZUckpldFlGK2R2emdnMjcvNGEwdGVFYnhMSWNYMUUrQm1hTDVJ?=
 =?utf-8?B?aXFJZktnV3RNUGJQNUNPbW1Bekk5RzdpSHFzMmg3Z3FvakNjT2x5M2l1Mllt?=
 =?utf-8?B?ak82UE5FWDAybFp2bnFnbDdaS3QvYkFXb2UydWdVL0dyRzg1TWRpTm5Fcmhi?=
 =?utf-8?B?M0toSStrMnpOUUdYMGVTalVHeDJjVFFEOWNrbC8xQ2VaTzFpRlA2ajFzNmhG?=
 =?utf-8?B?L2pRTm10R0w1enROV200RXFBQWpKMnJCSklDMTUvMzg2ckZGZndnUkRYRjV6?=
 =?utf-8?B?REdyZUVUVUIyS3pUZ01acUY1eVJNVFlJb0ZybFVaOXhlNmF0MUxDRXZWTExP?=
 =?utf-8?B?UEFidkkrNFRyS0MzbzNVTkVGSncveW5OWUVJTnZ0ZlZSZzY4MTFuMmNiNWEy?=
 =?utf-8?B?TXp4MW9YUmNNNzVjQjdWSWR6L3ZrZGJ4MVV5aEU1azA1V1dDdTRmbW9IcHNL?=
 =?utf-8?B?TnB3OFlBYkNLSWZBN1ZaVjhuMmxwN0tHbmRDVnhHT054VEdoVnA1RVliWXpr?=
 =?utf-8?B?ckhtR2p2YnAzMEdhb2srU3BvR1JLV1ZydFEzWHlzUUVaL0xSUFQvS0Uza2RX?=
 =?utf-8?B?TUNBaGxjczROTjVVT2NNNUtoT2E3WDVzbjVqcEFGSktydlRUVWdxWVpUVjVZ?=
 =?utf-8?B?c3liR1FJSGRpejB5ZExTNU5icEozTHhBYVo0STRFVFVwWTU0c1JZcFhNWmph?=
 =?utf-8?B?OHVNMlNRdzRqeGltMXM5ZmdGQXE3b1dDM3h3cDAwanpFYVlkeGVGMHVaSzR5?=
 =?utf-8?B?TzZiTkcvdUFVZzAvRjU4WWdtQlFuVFRVSHp5cFFWSEpmQmVrZFFkYnZjdXZD?=
 =?utf-8?B?cUp3RnRQVnhTbjhjc01Qd2M3NlZOUWdkRXBuUU5LYVVFeis3QWtvb21jL3Y5?=
 =?utf-8?B?NkRLUk91VVlFWmtsWUlZUDJidmZjdXJzK3RKTUMvaXJUZVhueGZUMEJZdEZV?=
 =?utf-8?B?MThpRGVndkdaaEt6eEJpZHlneXRIcjVsSnhLZDZmc2tNSWN6ZFRtb1JxQURz?=
 =?utf-8?B?aGNjZ2VENGIwOHd3SWRJN0drdmhyb2UvaktZUzNIOHlsMlF2Tk1malliaTRz?=
 =?utf-8?B?elBNOEJOeTZ5Y3MzZEpRd3liU3hsNmRaakR2TlBudk9lMHpDeXJyYXQxOC93?=
 =?utf-8?B?cjF6WXhTL2NEV0ViZDhRWUZ2enN6Y3FsUmUxWitxcTFJa1cwMlZMMm8zL3Nq?=
 =?utf-8?B?aE9EU2dhc1dtOXFDYXMvTG1mY0IzbDgvMmFDSDNmOUpkNmx5Y29URGtQdjUv?=
 =?utf-8?B?STJwc0JXdU1IZ1VWT2tGcVB4djIyZHM4cTBiWDhxWnVnUVJENTFPTEhhYUNm?=
 =?utf-8?B?VmZ0VTcycVBpejBIL0hLb01KNFR3WkhDRU1tcjF2bHVaWTFjc1hQY1Vyd3JI?=
 =?utf-8?B?UEk0WEc2anlCeEh6S085V2I2SUJmMXhMQjlYcTdkc29XQVlDa0p4aTdQNUVD?=
 =?utf-8?B?YTYzams1MGtmZTFOVlVQanFKKzFaTWxoQ01pQlF6dmoyRm5yTjUySUhYSGxX?=
 =?utf-8?B?dHUzQy9mWHBrNXczKzB5ZmkrWlg1TlIrUG5rTnFUeXJsMFExZFBRMXpqOEtW?=
 =?utf-8?B?UGlKR3VyWUZteWtFR2ZDQzY4UnU1cjE1QWcxUFJ1cE9rTjNTaWlBVXErUm9u?=
 =?utf-8?Q?/7kU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:13:13.6082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c847790-cd88-46b2-eb76-08de04e27ce0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9417

On 2025-10-01 07:24, Orzel, Michal wrote:
> 
> 
> On 01/10/2025 12:09, Alejandro Vallejo wrote:
>> On Wed Oct 1, 2025 at 9:51 AM CEST, Michal Orzel wrote:
>>> Current use of err() has the following issues:
>>> - without setting errno, on error it results in printing e.g.:
>>>   "init-dom0less: writing to xenstore: Success"
>>>   This is very misleading and difficult to deduct that there was a
>>>   failure.
>>> - does not propagate error codes to the caller.
>>> - skips "init_domain failed" message by exiting early.

Maybe add another bullet:
  - The early exit prevents setting up any remaining domains.

That was my main motivation in my attempt at this change: 
https://lore.kernel.org/xen-devel/20250826210847.126015-7-jason.andryuk@amd.com/.

Your re-written error messages are better though.

>>>
>>> Replace err() with more informative messages propagating rc when
>>> possible.
>>
>> Sounds good to me. Only suggestion I'd make is to also print relevant arguments
>> where needed, like...
>>
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>   tools/helpers/init-dom0less.c | 25 +++++++++++++++++--------
>>>   1 file changed, 17 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
>>> index a182dce56353..3dd2d74886eb 100644
>>> --- a/tools/helpers/init-dom0less.c
>>> +++ b/tools/helpers/init-dom0less.c

>>> +    }
>>>   
>>>       rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
>>> -    if (!rc)
>>> -        err(1, "xs_introduce_domain");
>>> +    if (!rc) {
>>> +        printf("Failed to introduce a domain\n");
>>> +        return 1;
>>
>> nit: Maybe -EBUSY so it's -errno like the others?
> There are other places in this script where we return 1.

It's a mix of error as 1 or -errno, but at least success == 0 is consistent.

The xs_* functions set errno, so maybe here it would be good to return 
-errno.  I think moving toward -errno, which is more informative, would 
be an improvement.

Thanks,
Jason

