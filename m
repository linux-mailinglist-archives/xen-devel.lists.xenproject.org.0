Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD08CCA2E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 02:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727984.1132695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9wgF-0003DB-Ni; Thu, 23 May 2024 00:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727984.1132695; Thu, 23 May 2024 00:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9wgF-00039z-Kk; Thu, 23 May 2024 00:51:39 +0000
Received: by outflank-mailman (input) for mailman id 727984;
 Thu, 23 May 2024 00:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9wgE-00039t-SF
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 00:51:38 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ab9a44d-189e-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 02:51:36 +0200 (CEST)
Received: from SJ0PR05CA0118.namprd05.prod.outlook.com (2603:10b6:a03:334::33)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 00:51:29 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::f7) by SJ0PR05CA0118.outlook.office365.com
 (2603:10b6:a03:334::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 00:51:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 00:51:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 19:51:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 19:51:27 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 19:51:26 -0500
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
X-Inumbo-ID: 9ab9a44d-189e-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiXRzlYkyZ/xVGlWZF1TqLMbu6ONRREKiwFEqEgJaGQfgknbxVg0bhq22caiUqJZHnhw01stDo2XrJQYQdgCETpGgQp06xtIWlvdA/NTZFsRKxx1gWlck9Tf5lBf3o14DYyLBnAkcT0XGtJPHq1f2Df5byMIiidQnhlpDjfwkxrMtQqSnnTMvfWE4LcEqteUDrIaNY003nKwKEqbE9iWIsEtzjSbMNqLZWvq7TsmGTaDIC7dcp6fboaSbsRez5Cw053K34WLn7VxdRq2mzFUWXTmS0X21o9ty3rl0cUks0Ob6MDZH9wSALO5rIOu/toxf8zgzEg311zZGtnJ5mUqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqzL2ILy27IRr3fbs6qUU0Gh1DeGGGjERPmLLBR117w=;
 b=PO51PbfRDWSRDY3fyBngnTzQMjpKWbDxbzlb0y0eiZSgrgSjlgkMm0Gw0Ltp2k4lqhFwwkvFkxBVUge0LCoCB5TwHe2tMT8+EOmXjbwT5ZAEbw9ck0bDVAtmu8pl5GWs42Sy1oVFfM7G+Uk1fCAJt3Xt0qvTnXkNhBFINWCbJ2rIH9UaHiJ0Q11P7+NnSj+aYP+B5WH37P0AqAhUvsLluk1Rnjkixs+pXVndBTMU7h+75SLDQa8wdLvIWURW1a/UBbn0WUAa+kN/H44llPRYchL+9a180GY6fQvNoZ9uuxpN93NTFOG+hWTmmZSibM+t9EE9deXlVgyhajDLzhypVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqzL2ILy27IRr3fbs6qUU0Gh1DeGGGjERPmLLBR117w=;
 b=chHgyXRI1JaXoqzkq2TIEAikb3vI0/Bkfz/p8OtB+CMD+QNa1cYgqPeAbT/57dtnunS6O3EZkaVgHjhSOSZfbCpWBYCeqP5vjfWiUxrSlq5RUsGLYO0ZlR98DFjYtYJxv46lGeZA1KfYoJxTYeCF9iAHZqJ2NJm4DuluzV0CSzo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e743d3d2-5884-4e55-8627-85985ba339f9@amd.com>
Date: Thu, 23 May 2024 08:51:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-6-xin.wang2@amd.com>
 <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org>
 <4f6a24b5-5e7b-41e0-9314-496bbcaa8888@amd.com>
 <alpine.DEB.2.22.394.2405211815040.1052252@ubuntu-linux-20-04-desktop>
 <29073700-673d-40aa-8759-efc60af3b7c0@amd.com>
 <1754e63c-00a5-4d66-b151-8fa436f5c844@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <1754e63c-00a5-4d66-b151-8fa436f5c844@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 569c1b7e-0172-493c-a948-08dc7ac27b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWcyTklOVCtEcHREaG9PNlk3clFzY0Z5WW1pZHd5QjMyank3M1R1aW1SME5C?=
 =?utf-8?B?dE9QUjRLZkw2a3JqRUl1YnFGa2M0S25nRVEvT0IyeE5XdW44VXB2N2hTVmJN?=
 =?utf-8?B?VzE1TVo3bEZDcnY2RTNMYnVoRFZYaUtRSWcxYXZ2bTlQYW81K0d3d1RLd1Nw?=
 =?utf-8?B?UG96K0l0bEJ3RnY3ekZPL05JMlNWYVdBcGJPY1lIbGs2aWtUNHdNZkFKbjB0?=
 =?utf-8?B?QUljNGRwdUFZWFpoNENSSXZZeTNVU3ArbHdWekFvcUN2ZjBLWmNTeEVhK0gx?=
 =?utf-8?B?c2FoME9TckxzRnk3MksyY0hkRGxCZHhpVEFYMVJmWjAyZkJPR2djc3U0WHJM?=
 =?utf-8?B?UWpDQ0N3cjBzNWJwa25yNzIwSW4zODBhZTBLQ3BKbkxReXBQSWx5ZEtycU9S?=
 =?utf-8?B?dXA0bkJ6K2dHYWQ5TUQyeTNURjJrN1V3Ky90MnppMTZ0RDZFNWxvTlZKeitM?=
 =?utf-8?B?OEJHWW1KQUlZaGtoK0M0Z1VyTHFFK2RvZERTVnJxaVBsQjI1RW5sQmUyR09y?=
 =?utf-8?B?T2EwUkJ4Zm5EVjdrVXFJOVVwdVhZYXRjTU96NDVZTytJbTE5eEwyZVlRSWRq?=
 =?utf-8?B?bUVNVkNBNU5TQ1FmZkZEelQ4WG15ZlVhWnU2aVNYWlN6MEc0eXZaVVZCaTE2?=
 =?utf-8?B?dkFLM0p5SzdXZVd2T0lhbmcvRTVGM1UxUnJDbTNWblhPN0pDYnFMdXB5WElN?=
 =?utf-8?B?enFqY0x3R0x5bGRmMDlBQkpRblN6eFBKVDNnZEJXV29mbnJHRU1UUWluU25U?=
 =?utf-8?B?Vi92TFJRWmpPZjBPdTFyWG9GUUhQNjNyQ1VmSWp5UGIvTy9NTVlJYnNyWkFP?=
 =?utf-8?B?WXJBMWttS21IVnFKbFM3Z1Z6T2lwaHJzaXFKRDUxMTZ2b1JacVJ5SU1HWFdn?=
 =?utf-8?B?V2pnckJRbExweDNiU1IvYlI2OTJJSWpVYkR0K1NId0FOcGkxeGRFeTQ5T3py?=
 =?utf-8?B?S2VzcUNacThKK0oxekVSUkRnNmNxUHNmV1ovUGF1bzc3U1JYaGE5Ym1XT2I0?=
 =?utf-8?B?U2dPbDVvYjgwVm5JMkRlanBKdytrRG02TnFTUkNHSUxjQ0REWjRUdTVPSm8r?=
 =?utf-8?B?YlpOVWRsVTJTdGptVkJNdkVaRncvTkJGbjUwLzFpSWtEY3RUODYzaVhkTnBt?=
 =?utf-8?B?T01NWjBiN2laakgrWUgzVkFReCt1T0NLSkhNSUY5SE4rYWp6WitJTmFLTFJM?=
 =?utf-8?B?ZHMrdzk1dUJQSjR0UmVrSmZiT256THBnMHQ0aVZ6M3drVEV3YlJwYlUvTVhm?=
 =?utf-8?B?R213TG9uWm9oczRwS3pnUzlZVzdXdXZjYTMxWGtmWUk0eG9Tc3FFRytqYnpP?=
 =?utf-8?B?bmIzdlFIL3htWmVzSi9NaFo1aysrL3AxZ0hqVWNrTk9rcFNuekRLNmtiajFX?=
 =?utf-8?B?VUZuWnRzbFRMcFJYMk5RM05wU2VzYWlXM1poRXhrWmh4eEJrZTVTOGY3anh6?=
 =?utf-8?B?SHFjQWYzOVVrNmFwOHZJVVc0dVdaZXVPQzFpcXNaZnFVcWZzcUx2eXBoRmdm?=
 =?utf-8?B?UGd6aThJbC9yc2VXN21oWUlPOGpmejY3eHRoTGRrM1FvelB2TFkvR3BMMW45?=
 =?utf-8?B?Mm1ZdXRCUjhSWS85d0dVbjI2U1oxQkEyYzBMV09vZnRlUlVSbnh3YVVsaHZR?=
 =?utf-8?B?YnpsR0YxUGU2dFlIdDkyUjFidlFOeG0rMFdFbWVrQk1PZTBIc00vZU52aWhH?=
 =?utf-8?B?QlFFY0lndURXV3prMHZkWjR1NTE2b2FSdXFSZ2x6anh0dGRnMElSaVRPb3R3?=
 =?utf-8?B?ZFJ5NldCbzFOZTdRdkErVWE1L29sM096clFveXFEM04vMW5QaFFKaWZSYkZD?=
 =?utf-8?Q?/vabD+Cv1Oizlmsb6qGkHwQlh9avY+CjYgzDA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 00:51:28.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 569c1b7e-0172-493c-a948-08dc7ac27b19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668

Hi Julien, Stefano,

On 5/22/2024 9:03 PM, Julien Grall wrote:
> Hi Henry,
>
> On 22/05/2024 02:22, Henry Wang wrote:
>>>>> Also, while looking at the locking, I noticed that we are not 
>>>>> doing anything
>>>>> with GIC_IRQ_GUEST_MIGRATING. In gic_update_one_lr(), we seem to 
>>>>> assume that
>>>>> if the flag is set, then p->desc cannot be NULL.
>>>>>
>>>>> Can we reach vgic_connect_hw_irq() with the flag set?
>>>> I think even from the perspective of making the code extra safe, we 
>>>> should
>>>> also check GIC_IRQ_GUEST_MIGRATING as the LR is allocated for this 
>>>> case. I
>>>> will also add the check of GIC_IRQ_GUEST_MIGRATING here.
>>> Yes. I think it might be easier to check for GIC_IRQ_GUEST_MIGRATING
>>> early and return error immediately in that case. Otherwise, we can
>>> continue and take spin_lock(&v_target->arch.vgic.lock) because no
>>> migration is in progress
>>
>> Ok, this makes sense to me, I will add
>>
>>      if( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
>>      {
>>          vgic_unlock_rank(v_target, rank, flags);
>>          return -EBUSY;
>>      }
>>
>> right after taking the vgic rank lock.

Summary of our yesterday's discussion on Matrix:
For the split of patch mentioned in...

> I think that would be ok. I have to admit, I am still a bit wary about 
> allowing to remove interrupts when the domain is running.
>
> I am less concerned about the add part. Do you need the remove part 
> now? If not, I would suggest to split in two so we can get the most of 
> this series merged for 4.19 and continue to deal with the remove path 
> in the background.

...here, I will do that in the next version.

> I will answer here to the other reply:
>
> > I don't think so, if I am not mistaken, no LR will be allocated with 
> other flags set.
>
> I wasn't necessarily thinking about the LR allocation. I was more 
> thinking whether there are any flags that could still be set.
>
> IOW, will the vIRQ like new once vgic_connect_hw_irq() is succesful?
>
> Also, while looking at the flags, I noticed we clear _IRQ_INPROGRESS 
> before vgic_connect_hw_irq(). Shouldn't we only clear *after*?

This is a good catch, with the logic of vgic_connect_hw_irq() extended 
to reject the invalid cases, it is indeed safer to clear the 
_IRQ_INPROGRESS  after the successful vgic_connect_hw_irq(). I will move 
it after.

> This brings to another question. You don't special case a dying 
> domain. If the domain is crashing, wouldn't this mean it wouldn't be 
> possible to destroy it?

Another good point, thanks. I will try to make a special case of the 
dying domain.

Kind regards,
Henry


>
> Cheers,
>


