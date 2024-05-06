Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB98BC995
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717316.1119394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tlt-0002ai-Um; Mon, 06 May 2024 08:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717316.1119394; Mon, 06 May 2024 08:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tlt-0002Xt-Ru; Mon, 06 May 2024 08:32:29 +0000
Received: by outflank-mailman (input) for mailman id 717316;
 Mon, 06 May 2024 08:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3tls-0002Xn-K5
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:32:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f28838-0b83-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:32:25 +0200 (CEST)
Received: from PH8PR02CA0020.namprd02.prod.outlook.com (2603:10b6:510:2d0::9)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 08:32:20 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::ce) by PH8PR02CA0020.outlook.office365.com
 (2603:10b6:510:2d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 08:32:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 08:32:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 03:32:19 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 03:32:17 -0500
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
X-Inumbo-ID: 29f28838-0b83-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STlMwvOnX1xW94KeO/qXF82bVT4wwlTkUpJtzx04PgDRmC755zr6stKnXTHylTd2OSeIW3izOJtYeTcpnTKWH1zzUGRr8so4xjBsrVkfex6gzLFepFbY0I1XkKn9Hm4Hi5XCDLt+Xtc6lgO61MIP3Jp4kAezzvNIzi1PZwX0n8rkO4wvEX0uF0Q4jHtb6LCPGYD7/H9z5jk9JFh4zMUuu+4GRap1dfk+RtbD8adkcGC52kW43fLbPzmxOIDGlitm9nX7TuijxXdzRsVQ8BPdUMDLUDfdsMaPox5+qLuQCmeDSaIaQ2gcL9u0zIQUIyuDJka2CfUq9V1SEcREHQnkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9xnphQ9L0vnxCKKlR624TQkPTFXuE84/afIalgczIs=;
 b=i0Id4On33VUrxYLtWtH39htpKkvAgDhsDZQrGeJ2c5Ja2TUEEcR0NdTjMCSVvzGF4iDdJVGEYokOS/1u8H50uvkwZb0uWTbx7pB8wf1vwmd1Zyaz0VpOLNb2a2zsElqkkESUFtFgCvZyZCQLGV90nf4lztdkX53lGMEudV0INF4S6lQpOflixlDdg9xcwVMz+FIQfhMVaVKzFT1fnJqnnnPdiy0a1ITbCKtmt5wxjZVtoKi76n2GEBPwlhWcKlUaHz9kB9ekI+X+LAKs/VZ4GJsvqnOyY5dMLMumfW8TF6PG30ie8vqkj41QyyqVhqC5LSuQCL+DPIFx2Iq2T5hUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9xnphQ9L0vnxCKKlR624TQkPTFXuE84/afIalgczIs=;
 b=qbcynnFbET0LlWsSzkESzx/FkO9ycNxNgy6NsuaeD5zTrY/FPoLAKiTsTyFlxXmRXujYOLHOP0UzKUUiY/KnbXZcJjJELmYxl8bER1pONsBpKvrm00RBTXGpfJJO+xnldHGepoTfvvb/Ejalb2/xi57MVrfi8aT4fwMCeIa4ArA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
Date: Mon, 6 May 2024 16:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 771196be-39ee-4eb8-10e4-08dc6da70b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVBzSVJ4RE4ySnU2MGlmNzVnWm9rR09UQzM5ZWpMd1laS0FaaEorcUVGby9Q?=
 =?utf-8?B?aG9jTytwaWc2MktIWWhkSUtUYlZpNHJ6YkZWTXZDNGQxOTQ1QzVIWjZnU3NK?=
 =?utf-8?B?ZGVMZ2lYalpYVDhsdkNNY2pjd3kxM3pwNzJpQUE1YzRuVE1lQTlUSlZ5Qkkx?=
 =?utf-8?B?UXZxSFlyaDFxSHVaeHdiYlN5bG9xMGdUZkwxOVQ4N3JVRjhpSHFub29KM0dh?=
 =?utf-8?B?SFM4SjRXcVIzeU5HUm1FemN5Ni85anMrdXN6bW5ZalNUZXd1RGhIY3puSFJy?=
 =?utf-8?B?SWljVUk3a0VaRng4QmZjUmR1TVdrNVN5V05JSG9OdHdUVEwvR1duVXNxaE9m?=
 =?utf-8?B?VnJJRTcyRWpQMnRvKzhndDlwQnNHQ0U1QnVSaW9VOUtMMlRQWHgvU2dWbHdB?=
 =?utf-8?B?UWROQTZVZDNjdTkrSE83bHh3bUd5OE90d0JNcEpEVS96NEdUdkpPckcxNjdP?=
 =?utf-8?B?QUFuY2xuRHVsKzBjZDViMGs1QlNaU003cEE5VndRS01hTFM4bzR1MGo3bldm?=
 =?utf-8?B?aVRKUnZXMGpuSzVDRW9WZjFBakVDRjdBOVBYVVFZWlFsektWM2Q5dkxvWm1L?=
 =?utf-8?B?cEVqRUlMajZkeG5YQ3JhcnRaMXVQWTVDUHI2UndSOTRuRElkOHpHZ2pETkFt?=
 =?utf-8?B?MmtMcUpiZ3FjeVZGOTBMTHU3ZXFPL1lwM3U0aWhRUDBvUldzTS9kUCtBNU1X?=
 =?utf-8?B?N01qR3JzSlVwZXZHYWlqSGNFNmxVa3VxbjR2UjVzVmxnL0NXRG9qNUZDM1FG?=
 =?utf-8?B?SHI1L0xJQVJMdVkyVVRSOXNjd0hCY1N5QjN6YTYrUnJKNXllNlEzYXMvSllM?=
 =?utf-8?B?bE0rZjdnRGhaVzVTWERoUnVEbUl1QU5mVG8zZXZCRG5EbkFOa09aRjlUVEhS?=
 =?utf-8?B?RHgzcEdKZURicFBOQ2FHeEVBMGtMUFhJY05Cc2ViRnRBcHIxUTE3Q0UrMXl6?=
 =?utf-8?B?bUJHWHg0YXY4eXM3Y3dqOXBwbzBkMzM2S3IrK0J5NmVqU2VnejF3ekVuZ2pM?=
 =?utf-8?B?aFBmczVHSzZtN1JpRkl0eENJc3VEcGV1T2MrUG1tdFExbUI1blQwVWEzK3ZY?=
 =?utf-8?B?TUV1Wk9WSjJSM05mUzFWUys5M1RaMFNYV0NiVjlEdk4yOTFsVVd6WUl4T3kw?=
 =?utf-8?B?d3Y4b0Fub1UvNzRlRUdSblp6cGN3dnVxWS9Jbi9EZDVYVkhtWHNPYzZhREw3?=
 =?utf-8?B?NFBuSmM1dmh2MGlkY1JjYmIraTUrRS9ZNjNvRVpXdmxOTUo1aHcyTkZTTVlL?=
 =?utf-8?B?RHFER3BpZU44U2E2SGhpTS8yWUpRRTBEWWhTS29RZUFWbmxPUlF4UG1wNUJM?=
 =?utf-8?B?MlRVYzFQdmE0WmpvbkFuSmpTZHFBZjVzRGNLSmlVQ2dnR2pYMDRSSnhFWHpq?=
 =?utf-8?B?eURzNkxQcDc1c2xOSzZxWnVIY2RDeFF3dkQzQWU3NVFkMlJvRm5XQnlwRlNh?=
 =?utf-8?B?ODRmdDZnYWxWZjFBYTk3NEpVVEJsc0ZQKzBvdWtudkNJVHQwYVpVcDJGZ3VL?=
 =?utf-8?B?T201NmRvNWNkdTQ0dFFuM21vTUVKRGM4QldvVkhQdGhmWkZ3SHRZeW5RcVhM?=
 =?utf-8?B?cGxUa1E2NXpzbmU1WlhhZ2tnMnYrdDFPT3N1c0xyaXZ4ekhFa213MGF0NXRP?=
 =?utf-8?B?RDhzeGZIczVJRW11V3hrOUlzc3NIQ3kwU1dSaUtmODRqZjE3bm1RVXA3VVVB?=
 =?utf-8?B?NGtZS1BnT0dKS0FvbVVIcUVqeS82bzEvQWxMaXZTclQzU2tPWDAwaG9rTDNO?=
 =?utf-8?B?Q3labDluUFUvRW84dlZXY3V4bkRHaFNmUDd4UVluUzBud2hNNU13RmlDRG9X?=
 =?utf-8?Q?ReEpEoWO3j2oKwGURUr15dKjqTVvoSesIv4rM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 08:32:19.4388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771196be-39ee-4eb8-10e4-08dc6da70b40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124

Hi Julien,

On 5/1/2024 4:13 AM, Julien Grall wrote:
> Hi Henry,
>
> On 30/04/2024 04:50, Henry Wang wrote:
>> On 4/25/2024 10:28 PM, Julien Grall wrote:
>>>> Thanks for your feeedback. After checking the b8577547236f commit 
>>>> message I think I now understand your point. Do you have any 
>>>> suggestion about how can I properly add the support to route/remove 
>>>> the IRQ to running domains? Thanks.
>>
>> I spent some time going through the GIC/vGIC code and had some 
>> discussions with Stefano and Stewart during the last couple of days, 
>> let me see if I can describe the use case properly now to continue 
>> the discussion:
>>
>> We have some use cases that requires assigning devices to domains 
>> after domain boot time. For example, suppose there is an FPGA on the 
>> board which can simulate a device, and the bitstream for the FPGA is 
>> provided and programmed after domain boot. So we need a way to assign 
>> the device to the running domain. This series tries to implement this 
>> use case by using device tree overlay - users can firstly add the 
>> overlay to Xen dtb, assign the device in the overlay to a domain by 
>> the xl command, then apply the overlay to Linux.
>
> Thanks for the description! This helps to understand your goal :).

Thank you very much for spending your time on discussing this and 
provide these valuable comments!

>>
>>> I haven't really look at that code in quite a while. I think we need 
>>> to make sure that the virtual and physical IRQ state matches at the 
>>> time we do the routing.
>>>
>>> I am undecided on whether we want to simply prevent the action to 
>>> happen or try to reset the state.
>>>
>>> There is also the question of what to do if the guest is enabling 
>>> the vIRQ before it is routed.
>>
>> Sorry for bothering, would you mind elaborating a bit more about the 
>> two cases that you mentioned above? Commit b8577547236f ("xen/arm: 
>> Restrict when a physical IRQ can be routed/removed from/to a domain") 
>> only said there will be undesirable effects, so I am not sure if I 
>> understand the concerns raised above and the consequences of these 
>> two use cases.
>
> I will try to explain them below after I answer the rest.
>
>> I am probably wrong, I think when we add the overlay, we are probably 
>> fine as the interrupt is not being used before. 
>
> What if the DT overlay is unloaded and then reloaded? Wouldn't the 
> same interrupt be re-used? As a more generic case, this could also be 
> a new bitstream for the FPGA.
>
> But even if the interrupt is brand new every time for the DT overlay, 
> you are effectively relaxing the check for every user (such as 
> XEN_DOMCTL_bind_pt_irq). So the interrupt re-use case needs to be 
> taken into account.

I agree. I think IIUC, with your explanation here and below, could we 
simplify the problem to how to properly handle the removal of the IRQ 
from a running guest, if we always properly remove and clean up the 
information when remove the IRQ from the guest? In this way, the IRQ can 
always be viewed as a brand new one when we add it back. Then the only 
corner case that we need to take care of would be...

>> Also since we only load the device driver after the IRQ is routed to 
>> the guest, 
>
> This is what a well-behave guest will do. However, we need to think 
> what will happen if a guest misbehaves. I am not concerned about a 
> guest only impacting itself, I am more concerned about the case where 
> the rest of the system is impacted.
>
>> I am not sure the guest can enable the vIRQ before it is routed.
>
> Xen allows the guest to enable a vIRQ even if there is no pIRQ 
> assigned. Thanksfully, it looks like the vgic_connect_hw_irq(), in 
> both the current and new vGIC, will return an error if we are trying 
> to route a pIRQ to an already enabled vIRQ.
>
> But we need to investigate all the possible scenarios to make sure 
> that any inconsistencies between the physical state and virtual state 
> (including the LRs) will not result to bigger problem.
>
> The one that comes to my mind is: The physical interrupt is 
> de-assigned from the guest before it was EOIed. In this case, the 
> interrupt will still be in the LR with the HW bit set. This would 
> allow the guest to EOI the interrupt even if it is routed to someone 
> else. It is unclear what would be the impact on the other guest.

...same as this case, i.e.
test_bit(_IRQ_INPROGRESS, &desc->status) || !test_bit(_IRQ_DISABLED, 
&desc->status)) when we try to remove the IRQ from a running domain.

we have 3 possible states which can be read from LR for this case : 
active, pending, pending and active.
- I don't think we can do anything about the active state, so we should 
return -EBUSY and reject the whole operation of removing the IRQ from 
running guest, and user can always retry this operation.
- For the pending (and active) case, can we clear the LR and point the 
LR for the pending_irq to invalid?

Kind regards,
Henry

>
> Cheers,
>


