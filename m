Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8638BF79F
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 09:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718621.1121119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4c3o-0005uK-CR; Wed, 08 May 2024 07:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718621.1121119; Wed, 08 May 2024 07:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4c3o-0005sn-9h; Wed, 08 May 2024 07:49:56 +0000
Received: by outflank-mailman (input) for mailman id 718621;
 Wed, 08 May 2024 07:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w98=ML=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s4c3n-0005sh-Mn
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 07:49:55 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c488c20-0d0f-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 09:49:51 +0200 (CEST)
Received: from CH0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:b0::22)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 07:49:47 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::fd) by CH0PR03CA0017.outlook.office365.com
 (2603:10b6:610:b0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Wed, 8 May 2024 07:49:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 8 May 2024 07:49:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 02:49:45 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 02:49:44 -0500
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
X-Inumbo-ID: 8c488c20-0d0f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YssFiGC9sbeMVOmlbZjwkqChFvt7qw7+0H4hDX9HSg/qHwUjpom09cGm0/jWPEl2Ce0MwWUjvij9avsZAG26AGMk5mD1U63eVFyzmx61ZrX9+f244ocxaW+mf0690ThMNzQPL8PWWkElbIKdwRYKKwy1pMCAg0TUlq+grI2Q3za4gSYJSx3oArPjsm2h0GZ1qkOKJb6meobjUGC4yWgv8dtzOX5v7DQzLXJlFdzcp4dmopRyZxm0nFt0NReUznt44b2qh9Kzc6wMWN7G5VIV0uFVIf2bzevkFoLV7OPBYVJNPaDh+00JEiu+g5/d2mD/vNTTwa1l6ySnlGAif6ok5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilLXy8IYzm5SkskMIgeJHFmvXi8IaiFQks8Xz1TbKks=;
 b=gf9MN/AS3vAJox+j29tyjI/7rqmH0L8NyvduEJpSIYwF4P7dj39mHZatbTAYqbO8zM1XlxQUJ3Uy9ITm0ZCn12nVjDdKEHj9Mez1zUGH+tsD0Gw0F7ju/qIroZeUBJkt0NEZitRtyEIv3UHGoY+K4rLcLoDLYyLzmmZzxMSdsCOdpxlIXUfplR5dpDP/4cszJlbi1C6zK1w+Y1T8RLqJ5OWXlEK7wuFjtKMQxn3C0IpbQepol7ECAkm8mHD3nqH8BaOPJ2JtUA2czG9wiBAfsO6/w1PcW1efNF9XbizUkBtyn9FELjQ3/X2JOfx2LjPt53XeF73b1XJ7hb8kKe3FKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilLXy8IYzm5SkskMIgeJHFmvXi8IaiFQks8Xz1TbKks=;
 b=MgkB/sFucPn6OH+vsAingFTcbHGgkpfleYO2jhje6xHukxM2b0JXrcckfGrLxJUflNZmoZbM0ESLW6JoE2yBoP9vAcreZB5vdLqqksHkFRLmcmSosweAe5PVRcMYJIlbxieA0j+0kXxw2yy02M6EP1inSzTGSy6o/mbZvpivf+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
Date: Wed, 8 May 2024 15:49:43 +0800
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
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: c075c5d5-3f0b-442c-4b55-08dc6f336e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sml0a0ppczFKZVcvVWV4bmsrU3ZJc2t6VXNOTmtPR0U5YXFuKzQvOTdlSlB1?=
 =?utf-8?B?blBQZEZQNGlYUSs0L3FTelBqaTJab2NuQVJkQzdscGxDTkh4MEJiKzVJS3o1?=
 =?utf-8?B?SldlUnZwMDRraDdGcUZyc3o4cW82MGZiL3B1Z2RvejJuNFUrMDBTYnNrN0FR?=
 =?utf-8?B?Q2kxdU91NFV2dlR6UWxjd1BhajFuZUovUkVZVFNVYmw1dGhwWXczS3k0T2JW?=
 =?utf-8?B?WmdZVncwcFE3UkVFRTR2anhqejhsOEZHWHBTQ0Y0TXRuRGtmT2Y4akpCSm9J?=
 =?utf-8?B?SVhkdWVhbW1IYXRIZ0dpTUVsUStaeVBhaTlsWXo3S1hwV0lJK3dGUVhrc1J6?=
 =?utf-8?B?WVI3ejFwMlZsWktqUGlvSHJNU1pqZVdXODJZcjJHOElXOFIwNzcrV3YrRnI5?=
 =?utf-8?B?T0JEeHdKNlMrV0ZyV0lielp4Wkl6L0dVZFdDY2UycFpFazkxVjdkNEUyMkxq?=
 =?utf-8?B?MlNYQk82dG1VUzI4VXlWc1l6K2o2SVYzK2NMa2ViM2lEVncyL2ZPQUVURG1C?=
 =?utf-8?B?STVycTk5aXE4L0FGQUxnM0tEdVNnN1lvR0c0NXlUTVlsNUpOLy95S0F5bGJJ?=
 =?utf-8?B?Rkl0cWs0OXlVc1kxb0RtZXBZNG5ibDAzN0piblNobDBGME43S0FWdEhRRHB4?=
 =?utf-8?B?RmFsc0NvOE41eStBYnVzYVB6V2lUN3FmREE4S0o0aUE4em9rbzVralpwUWxH?=
 =?utf-8?B?OEowQmJmeWhWOTNTRlJhM0hWUnUrdUhrdk1zSzF0OGhsTnNIWExlUW5DM0Uv?=
 =?utf-8?B?SFArMU5CbVpGY2lqMU04T1UzemVMS0dyZXdiZjBoVkorYkhJSXFIMmFwd3ZJ?=
 =?utf-8?B?RFdPTEpRVFVUSHB6aXJmQThBTWh4OGNwK3V3c3kzL3RoeFRMeTVNV0Z4aDE0?=
 =?utf-8?B?UVpkQjdqa09MT1YrN1hRN0kvZTRvWWpqaXRnSFFXMVRDM1Y3SHRjNU9PY2h6?=
 =?utf-8?B?YkdkSlhPRWxDcXM3R1VYbC9mMGtiZUxZeitxTVJHaENYdlJJdWRnZnprRnBq?=
 =?utf-8?B?Y01PWXdHRnR2VXJSOWlqdzNITy9MekM2aWlqamJpay9LOFlRRXFPRXYyY1Nm?=
 =?utf-8?B?TXdIamoyT296Y1FiU3drZlBhbkVZQmJaYmVyam01OXkxVnB2eVNQZUd6TVZT?=
 =?utf-8?B?N0NRMkVUei83UWFyT1dFdXF6SGJKSmRpdG1SZkMyeGQwWHBQcGRXdVJEUzRB?=
 =?utf-8?B?RFhCNWlWbUMrSnM5Tmw5aThDUk1leGlEYlJ3N2xDWkFqOW1HQnh1ZjBPNG1p?=
 =?utf-8?B?ek1SejE0RFA3dDkvZjFjWm1YV1FVMmo5a0NJWVJqL1FsZmF0UkJlZXMzT0xk?=
 =?utf-8?B?VDRxL1RSUkpRUFM0TVBSRURHMVpZS3NjWWxTczRqMHlUYkNpN2lsZm80ZGNN?=
 =?utf-8?B?MGRzVmtHSG1HbHVTVHEvYzhWa0J1bkFXMUZWSVhPSkZJTUpKanIwNlNjcFB2?=
 =?utf-8?B?dWI0MjRmQzF0WWhWUy9OdWoydHFwRlJwLy9tKzJodDJRSEdFQkF5TENLTStz?=
 =?utf-8?B?anlTbnJwRmNiTTFodG41dmZDc0JQMzNkQUNwai9kbVlCUkFZQmI0ZlcxNnpW?=
 =?utf-8?B?NUx2NE9IUWU0QWxwcC9wU3hDTmhBSHJLNHBodFhrZWQvR1FOOTJYL2ZXNWhD?=
 =?utf-8?B?Qmt6dzF2cWEybk1FT0d2d0c2RWxCKzZIWEd2OFJHVEk4UGQwcjBJb004L1Zh?=
 =?utf-8?B?V2VwZStVbmhsRGFnRWphYTBqNUY3OExWTkRQc0NBUEM0d1dPckx0QnRtTDBN?=
 =?utf-8?B?RjNvSHA3dUMyWFRzbzFNMXkzakQrZW1zcUNpR3lYeTUzaDJmMDZ2ZXB0MUw1?=
 =?utf-8?B?eUFnQlFiUDRZcVJuZm9RUkZlOFZQVjBudnhyVHdLVFpKays3NklQMUNZRWdz?=
 =?utf-8?Q?R2YDuP/UaSlpg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 07:49:46.2077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c075c5d5-3f0b-442c-4b55-08dc6f336e34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

Hi Julien,

On 5/8/2024 5:54 AM, Julien Grall wrote:
> Hi Henry,
>>> What if the DT overlay is unloaded and then reloaded? Wouldn't the 
>>> same interrupt be re-used? As a more generic case, this could also 
>>> be a new bitstream for the FPGA.
>>>
>>> But even if the interrupt is brand new every time for the DT 
>>> overlay, you are effectively relaxing the check for every user (such 
>>> as XEN_DOMCTL_bind_pt_irq). So the interrupt re-use case needs to be 
>>> taken into account.
>>
>> I agree. I think IIUC, with your explanation here and below, could we 
>> simplify the problem to how to properly handle the removal of the IRQ 
>> from a running guest, if we always properly remove and clean up the 
>> information when remove the IRQ from the guest? In this way, the IRQ 
>> can always be viewed as a brand new one when we add it back.
>
> If we can make sure the virtual IRQ and physical IRQ is cleaned then yes.
>
>> Then the only corner case that we need to take care of would be...
>
> Can you clarify whether you say the "only corner case" because you 
> looked at the code? Or is it just because I mentioned only one?

Well, I indeed checked the code and to my best knowledge the corner case 
that you pointed out would be the only one I can think of.

>>> Xen allows the guest to enable a vIRQ even if there is no pIRQ 
>>> assigned. Thanksfully, it looks like the vgic_connect_hw_irq(), in 
>>> both the current and new vGIC, will return an error if we are trying 
>>> to route a pIRQ to an already enabled vIRQ.
>>>
>>> But we need to investigate all the possible scenarios to make sure 
>>> that any inconsistencies between the physical state and virtual 
>>> state (including the LRs) will not result to bigger problem.
>>>
>>> The one that comes to my mind is: The physical interrupt is 
>>> de-assigned from the guest before it was EOIed. In this case, the 
>>> interrupt will still be in the LR with the HW bit set. This would 
>>> allow the guest to EOI the interrupt even if it is routed to someone 
>>> else. It is unclear what would be the impact on the other guest.
>>
>> ...same as this case, i.e.
>> test_bit(_IRQ_INPROGRESS, &desc->status) || !test_bit(_IRQ_DISABLED, 
>> &desc->status)) when we try to remove the IRQ from a running domain.
>
> We already call ->shutdown() which will disable the IRQ. So don't we 
> only need to take care of _IRQ_INPROGRESS?

Yes you are correct.

>> we have 3 possible states which can be read from LR for this case : 
>> active, pending, pending and active.
>> - I don't think we can do anything about the active state, so we 
>> should return -EBUSY and reject the whole operation of removing the 
>> IRQ from running guest, and user can always retry this operation.
>
> This would mean a malicious/buggy guest would be able to prevent a 
> device to be de-assigned. This is not a good idea in particular when 
> the domain is dying.
>
> That said, I think you can handle this case. The LR has a bit to 
> indicate whether the pIRQ needs to be EOIed. You can clear it and this 
> would prevent the guest to touch the pIRQ. There might be other 
> clean-up to do in the vGIC datastructure.

I probably misunderstood this sentence, do you mean the EOI bit in the 
pINTID field? I think this bit is only available when the HW bit of LR 
is 0, but in our case the HW is supposed to be 1 (as indicated as your 
previous comment). Would you mind clarifying a bit more? Thanks!

> Anyway, we don't have to handle removing an active IRQ when the domain 
> is still running (although we do when the domain is destroying). But I 
> think this would need to be solved before the feature is (security) 
> supported.
>
>> - For the pending (and active) case,
>
> Shouldn't the pending and active case handled the same way as the 
> active case?

Sorry, yes you are correct.

Kind regards,
Henry

