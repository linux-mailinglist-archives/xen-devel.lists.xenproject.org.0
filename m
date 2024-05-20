Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1D8C9799
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 03:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725766.1130104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8rPJ-0006ZS-Sh; Mon, 20 May 2024 01:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725766.1130104; Mon, 20 May 2024 01:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8rPJ-0006Wc-Oc; Mon, 20 May 2024 01:01:41 +0000
Received: by outflank-mailman (input) for mailman id 725766;
 Mon, 20 May 2024 01:01:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s8rPI-00067F-Je
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 01:01:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8343b2c0-1644-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 03:01:38 +0200 (CEST)
Received: from BLAPR03CA0049.namprd03.prod.outlook.com (2603:10b6:208:32d::24)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 01:01:33 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::99) by BLAPR03CA0049.outlook.office365.com
 (2603:10b6:208:32d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 01:01:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 01:01:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 20:01:32 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 19 May 2024 20:01:30 -0500
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
X-Inumbo-ID: 8343b2c0-1644-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ise0+4BTQSr6FGJCLw61MTRng3sQl8txOHZpJR1LCx6nQbI7NLdjrn3M0HTN5AQvFqkwPoR7QU+z6eEzxj0slS42XUFExsN/Dt/ggNJJOWvktOoxSWxcoo1jbX649pQlYNjz7QkE9oxZMwGdpsx0VYreIM85VhNPWCq29rJGUzXpQZXyMHGRKaNyhM+lP87+bluilQyAE6Dt4kDGfvsXc5JW4CNx+63p20OZ/thugPwhJfdmaNGOGecj8lqtKpE09ycjauW0w0HdbAnvTEX7fDvf1hBwj2+j+RZ12dztrXxzGJynQ0XcXcWM0tCWw/C3arGQGOCl5EDaW6fZgwrQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAEzMUEC39/7LxxheMN8lvN9AclDqhjSvZZfjpOUyIg=;
 b=bI30MG9lTltSKUfJ3yVCGhJDVCoBXPtgcRIS2MIQ0dl0wqWScuBzaMCUdCfpXRCepsfPErAGe9TY/a3hs4yULsszQ9aOu/uQabQ1q2fFM1HAThVQifNze1OBDfy1MpuNkC9Z0boFwJ7alXPGujb25QtHfqoGTX3Dl47NqYgHYXF+DVjEh3YvKDy8v5+sPW599adkatZ7wIleXhJkJoe0W+WNghTYexyqNzm39pCTUuPY3mw2q8JrzUVeOH6Qi3A9EheOaZKmDVTrjozC1NBWzPLj9zyqKhnRdu/BbW3aa3YACRDfEK7aFqKm04Lh/J6Kqd+P3ZsBtLYMxvP4HSTvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAEzMUEC39/7LxxheMN8lvN9AclDqhjSvZZfjpOUyIg=;
 b=BjTF6XMZbc2ipF++gD9L0A/UG0ty4+2VB9RgQpmxiz3/qRnEdQa7cov7C4wVe76FnUfPqQrvudG+u5SwSI//hUR17xrIqIXuRMMLu814MQfjWl1HJImlN7r/UHpxd1UUSc8gZonOR6p8bM3dokyUOaFJlI/zh8sbr5TFRFwg0CY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c475fc50-3d30-49d4-b12d-31535cfe1306@amd.com>
Date: Mon, 20 May 2024 09:01:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-6-xin.wang2@amd.com>
 <59e72623-00a7-4b19-9240-fb8c4982a381@amd.com>
 <9f086470-a17f-482a-ad98-814424da0ee5@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <9f086470-a17f-482a-ad98-814424da0ee5@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e48cf5-fcad-4a96-da6e-08dc7868641e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzBUMmREMkpMTTFWZ25NTUhUdHlBYTlDdGs5dWE4eG9nUUUyTW40eWpudXho?=
 =?utf-8?B?MlVMMzlSK2w5Kyt3SHZjNGtnVGowdGM5VjRkYWZzSW1YMEdJSGFIWk1WQnNR?=
 =?utf-8?B?MFluNEVzR3JoVyt0Wnp0cnBHLzNORHFEUllXakhGanhINmpwZVh3eDNpdjJI?=
 =?utf-8?B?TDN3ODY1bnhVaG1ZbTNUczduRHVNMzVkY0x1c2ZOVENhRkxEK3BUTk9HOEhi?=
 =?utf-8?B?SUFzK2pORCt5ZTFQK05ablR3SUNpalF0Sm1KZW9naWR4TWZOZ3FVQkJxeTAz?=
 =?utf-8?B?ZDVvVjU2TzJvbTBDQXpzUTNHbUdpck5FT2k2WE81UmFDeU5WQWtISGZZRHda?=
 =?utf-8?B?VU15bERQaGFXb2lXaGxWUDdzS1ppUjVTamZEckdOMjFwM3ZoWVM1cHdZTnpz?=
 =?utf-8?B?ZEl3bURtS0xBdFdhQXczUVp6OEQwS0paR0JJeUxUUjV5OXhSQ2oxS0g1bVpO?=
 =?utf-8?B?ZG1oc0NaRnh2VTZTN3JHV3A4aE8wOFlnYTlabWd0QldvVzBLWTBkRGV5YkxR?=
 =?utf-8?B?QWtRTGRnTWFtQ1YzTFpLZnVlbnlOQU5YaC9mWEs3MnZsbWxzTTVzZjBPbzZi?=
 =?utf-8?B?NDBJVXhON05IVVhtOUlsbHMrK2VkdjA0Uk5VOW91eWZ4eTNGOUFybjFDT3lj?=
 =?utf-8?B?eDZMUXZoUVBRUlV5QWt0bXVQWkhzaENHR1FIWGRKcjhIaDRGOVBHQk5pR21a?=
 =?utf-8?B?My91M2NqTmo4aU9kdnBIbzZTaGMzeHJONkxqRHBJV2VZaEFMaE1xQmkxMWtH?=
 =?utf-8?B?TDdtTXdaVkhhcmVTWjVIcER0OGNCOThoV2xlb3ZyNVJOR1F6enp1bEJhUE8v?=
 =?utf-8?B?RkFTMDdXeStqMGVOV1Qvd2krMmx4TE1kaVVWZWFpbVNkRDN0QTcwbHBhSzVG?=
 =?utf-8?B?aC8rci9EaC9LUmViWVR2enVvc05WWTdCVjZCbnZMb0JobmVPVk9PcE9jUnMv?=
 =?utf-8?B?M1Z2amZySWhBbTBFUWxVRnhVcmNJQjVjZjdHVGoyamgxOEJtanFnNks5eGdy?=
 =?utf-8?B?K0p0UUMvdVhoS0VGaHFDWUJSR2twTW9BZkdPWWZsdzBoemdWRWxORXN0bnpl?=
 =?utf-8?B?eEhsRTl2M0R1a0t2U2U3STJPQjVCT3F2c21JeVVXbVViNVRDUytrNXJkK05o?=
 =?utf-8?B?RitqVFNHL0VSNFprc05FbW9XbC9vRUpRQlE3emlFaHlBMGtIcGhSblUxNHBN?=
 =?utf-8?B?OEo3Y0t2WitueEd2Y1N2Zzl2NWYzU082ZjExR21IYTIyNXV2TGF5dkhrMWRB?=
 =?utf-8?B?LzQzV3FSV1Y5KzhOa2RDUi93dTR2QkFieHJlZ3dhelJtZU9yWkJQbEttTThW?=
 =?utf-8?B?ZlJjc1JFaVR0ZU9aaERNUXB5VFl1RDZBNFBHWWpvTSt3bjZtZkxFOS9QTXJV?=
 =?utf-8?B?am93NVFXVG93aVBlUTZxTmkyYWFTVWxsRWJwVlVvTmh5aVY5b0l3dWh3TTRY?=
 =?utf-8?B?MkFDcTVvMk9KSjZKYU1hTUVLR0NoY1pNNEZmb242cDUrVm55b2p4VGorNG02?=
 =?utf-8?B?Uys0c203VWZMZjRXOEV2RHJZa3VhU2lzWElpSFhSQzNKSGdjVjBjS1FWS0cw?=
 =?utf-8?B?cE5nZE44Q3dQWTBNL1VtTk1sS0RjaWcwWVFOREJXeFE0M2EvTXRDV3hkU0VU?=
 =?utf-8?B?S3pDSzdWVHJxenc5TDVVNENUeFBCQ2hhdmR1Q2U0V1VNUllwbTh6QWJTQ2x2?=
 =?utf-8?B?QVVQRFhUWFpXNmJleXZ5RENKVDBxNU1UcU5pWEpwQUNmV3ArOFVPUTJkeCs0?=
 =?utf-8?B?ZnE5TzMyZ3Y1SGc1TURaVEdid0t5K0VvMVJDd2dHMmFiS0hmdGlKNGpFU1ZJ?=
 =?utf-8?B?NFZqOHBpTk9MVjZxd3hLYjJCMytLc2ZaRGErMXk2TUk2NEMxck9JWGdKT3pL?=
 =?utf-8?Q?xMpEnQh2pCALW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 01:01:33.0974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e48cf5-fcad-4a96-da6e-08dc7868641e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048

Hi Julien,

On 5/19/2024 7:08 PM, Julien Grall wrote:
> Hi,
>
> On 17/05/2024 07:03, Henry Wang wrote:
>>> @@ -444,14 +444,18 @@ int vgic_connect_hw_irq(struct domain *d, 
>>> struct vcpu *v, unsigned int virq,
>>>       {
>>>           /* The VIRQ should not be already enabled by the guest */
>
> This comment needs to be updated.

Yes, sorry. I will update this and the one in the new vGIC in v3.

>>>           if ( !p->desc &&
>>> -             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
>>> +             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
>>> +             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
>>> +             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
>>>               p->desc = desc;
>>>           else
>>>               ret = -EBUSY;
>>>       }
>>>       else
>>>       {
>>> -        if ( desc && p->desc != desc )
>>> +        if ( desc && p->desc != desc &&
>>> +             (test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
>>> +              test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status)) )
>>
>> This should be
>>
>> +        if ( (desc && p->desc != desc) ||
>> +             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
>> +             test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
> Looking at gic_set_lr(), we first check p->desc, before setting 
> IRQ_GUEST_VISIBLE.
>
> I can't find a common lock, so what would guarantee that p->desc is 
> not going to be used or IRQ_GUEST_VISIBLE set afterwards?

I think the gic_set_lr() is supposed to be called with v->arch.vgic.lock 
taken, at least the current two callers (gic_raise_guest_irq() and 
gic_restore_pending_irqs()) are doing it this way. Would this address 
your concern? Thanks.

Kind regards,
Henry

