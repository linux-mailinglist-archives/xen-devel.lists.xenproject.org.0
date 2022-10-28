Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E283561184E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 18:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432167.684925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooSck-0001LN-ED; Fri, 28 Oct 2022 16:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432167.684925; Fri, 28 Oct 2022 16:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooSck-0001Ij-B4; Fri, 28 Oct 2022 16:54:26 +0000
Received: by outflank-mailman (input) for mailman id 432167;
 Fri, 28 Oct 2022 16:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToJk=25=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ooSci-0001Id-HH
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 16:54:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af77dc7-56e1-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 18:54:21 +0200 (CEST)
Received: from DM6PR07CA0081.namprd07.prod.outlook.com (2603:10b6:5:337::14)
 by SJ1PR12MB6170.namprd12.prod.outlook.com (2603:10b6:a03:45b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 16:54:18 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::9b) by DM6PR07CA0081.outlook.office365.com
 (2603:10b6:5:337::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 16:54:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 16:54:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 11:54:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 11:54:16 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 28 Oct 2022 11:54:14 -0500
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
X-Inumbo-ID: 2af77dc7-56e1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQ/eUIsvrcW7MXSySOIeyUgRmbiJhD+f5LkY9uHnWPdpFP+ycWl2p4Tk4RzR6B5fnBMdUBTosQ6YUB2YI+vKQXo1Au8el2r/VTQbvYxW5pmPbgi8xWmUyvaZqzxKbEnOiVej73yiEiSASIlMDXVYrLAUn1GtgyhMTGcf6fQZ61Fn4OQpHL+H4/WddxBXPiLHlWvgUy+gAOr0xDJUGE6K/B0/aPzHsbWRywaP7TL2ChZbStTNYruyBR9y2V5fnsdx2VxYV3HNm95zZo5XSIxa7KrWPkH3CEGbEsaNQ3uIknHuzI6qC9Fp02vkO3SB4f+4GY502OO0/hNw1yB7pSo4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsiXk5Auw6kSqGXPU3wrfNMKh0U606xi/6ufKiLIiu0=;
 b=mkE+HKpMCmpGDM8O81Ahc9BvagH0qCCgLj9J3xsf0rRBpcV1Y1BTn/UIc/h2gtiX9DR1DqUjA9+6mMFrkC+1IeWZTjW9OpqCdxA1OU+d4xLHQis2HL3gL48r6VP6IwAmfMg+lPESBzXLRCCLL1x+PU9R3daxtQYJBLufqD/ZuXGdpo0kVTLyo6Lj+2Rkbry0zglrTEVuOU/zfQ3qBS/ftIMbqk/ivlzS7zLfdwwKNd4BFl7kDruDcODQduqkAry7VV3s1Z9+rOIPNMH86A3BuRoHrE9FTef7etCiib3ywP+o0+KJ6BrwwHbLFCAZkZvJBWh4u8tMVGN5W8sq7+8vDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsiXk5Auw6kSqGXPU3wrfNMKh0U606xi/6ufKiLIiu0=;
 b=irK5BhSpdTY0gHWbXvIxe06kj8ErWc0kI6mYhth/4rbCVnnfmAORJwq7XAMqG7Fvv5GiXUk1dfaRTSX/ZY3EKtVI9/1lnHDBsGshJH2ej8iNqfhp5OoK/q4o3rIZma5u/at+0XhhYYbpjJSoPOI5fsGoObVkSLhSuktTaFN+6eY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b4bfb38c-6b60-e652-b6a0-21b7235f1ad9@amd.com>
Date: Fri, 28 Oct 2022 18:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <Michal.Orzel@arm.com>, "Oleksandr
 Tyshchenko" <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <2981F6DC-444B-49DE-9D01-C0093A32E68F@arm.com>
 <affc51c9-0f8b-b76a-6f23-ec161c967580@xen.org>
 <EED0A9FE-E948-469E-AB30-20BB69A03DD7@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <EED0A9FE-E948-469E-AB30-20BB69A03DD7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|SJ1PR12MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: c3381b5c-3c6a-4fee-3f14-08dab9050d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oaoOAP7wIAuuBCz8ZFk8XGoJVoKqhkgMSV0EpgQ6C6LswORjjPI/9LbaODkdmialD+ThW0tbRup1OJffxtCHYJOVAjYHHG65rcT9/KYuRopEO6U4bNu0JmOSFxgQqSGyft4GtRQaKHy02rYW9U9E2Fd9VsxsHIc4Jz4WeHeoX8RDNAzEMxhMJyg4Lpcsar20JN27Bv7WobuL2JCH5XvHCa0Wy8E+sXszT4NMRpSnKZQnXuJztXjqAomychJ9tOFN3sbNm+4acJicjuFmLckuOOPlLMf6DXlXUc9V/ltPjcKT+6XWWP7GcJa0DXhiQM2Sh0u1bZ0yREOq3RUpvKzhiIsrOGQSeC1vEDLre9REWPpOli+dDtG1+xKoSye2viMT4dPoVTT28Vyyyp6xpVA6ognyGvIy906AXgFtxe2/Lt7lUCdF1fgigE1LEPpk4B9qfXJg5pPSy0MQpX6nsksQP6D1W+HrVIEy/5OXg193rbU24L1474Il5Y4yL+SOvBPkU3AAR0heZ/EEDAum5RPeGZRCrKoml45uW2dmXaREnIn8X2rQQYC9e7KbR89bTtL5v8niZDrmEIoMfbtj4NeVwlCSJPwReBEnoH6O3vwzGRcKc7yCZwbqrlXfqIj7t0zNx5yLc64x37R+mqoMT+kcFPUq7CarowXsr9xpiSzwP7AbnuUdT6y2NXacfSd8Hv0i/aGXMn+SKERrGpoz5bbeRpqE2YReV2Mboq6PgcAKuaGfbry3JdTlXh18wh27Mn+hIV/f0iHwToEFV71yp+z55JXd8y/zCqD+ahlm0odQmCZorBmJVMr7OcXzLSfgNHWry7Dlzqm6nbwpi/QcOLCJehrY/ChnMDDCnhHT5ow1Jqk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(16576012)(186003)(316002)(2616005)(356005)(40460700003)(26005)(8676002)(82740400003)(4326008)(40480700001)(31696002)(7416002)(70206006)(41300700001)(36860700001)(86362001)(2906002)(5660300002)(70586007)(44832011)(426003)(47076005)(8936002)(54906003)(966005)(478600001)(336012)(36756003)(110136005)(83380400001)(82310400005)(31686004)(53546011)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 16:54:18.0236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3381b5c-3c6a-4fee-3f14-08dab9050d9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6170


On 28/10/2022 17:45, Bertrand Marquis wrote:
> 
> 
> Hi Julien,
> 
>> On 28 Oct 2022, at 16:01, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 28/10/2022 15:37, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 28 Oct 2022, at 14:27, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 28/10/2022 14:13, Bertrand Marquis wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Bertrand,
>>>>
>>>>>> On 28 Oct 2022, at 14:06, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi Rahul,
>>>>>>
>>>>>> On 28/10/2022 13:54, Rahul Singh wrote:
>>>>>>>>>>>> For ACPI, I would have expected the information to be found in the IOREQ.
>>>>>>>>>>>>
>>>>>>>>>>>> So can you add more context why this is necessary for everyone?
>>>>>>>>>>> We have information for IOMMU and Master-ID but we don’t have information for linking vMaster-ID to pMaster-ID.
>>>>>>>>>>
>>>>>>>>>> I am confused. Below, you are making the virtual master ID optional. So shouldn't this be mandatory if you really need the mapping with the virtual ID?
>>>>>>>>> vMasterID is optional if user knows pMasterID is unique on the system. But if pMasterId is not unique then user needs to provide the vMasterID.
>>>>>>>>
>>>>>>>> So the expectation is the user will be able to know that the pMasterID is uniq. This may be easy with a couple of SMMUs, but if you have 50+ (as suggested above). This will become a pain on larger system.
>>>>>>>>
>>>>>>>> IHMO, it would be much better if we can detect that in libxl (see below).
>>>>>>> We can make the vMasterID compulsory to avoid complexity in libxl to solve this
>>>>>>
>>>>>> In general, complexity in libxl is not too much of problem.
>>>>> I am a bit unsure about this strategy.
>>>>> Currently xl has one configuration file where you put all Xen parameters. The device tree is only needed by some guests to have a description of the system they run on.
>>>>> If we change the model and say that Xen configuration parameters are both in the configuration and the device tree, we somehow enforce to have a device tree even though some guests do not need it at all (for example Zephyr).
>>>>
>>>> I think my approach was misunderstood because there is no change in the existing model.
>>>>
>>>> What I am suggesting is to not introduce iommu_devid_map but instead let libxl allocate the virtual Master-ID and create the mapping with the physical Master-ID.
>>>>
>>>> Libxl would then update the property "iommus" in the device-tree with the allocated virtual Master-ID.
>>> Ok I understand now.
>>>>
>>>> Each node in the partial device-tree would need to have a property
>>>> to refer to the physical device just so we know how to update the "iommus". The list of device passthrough will still be specified in the configuration file. IOW, the partial device-tree is not directly involved in the configuration of the guest.
>>> But we will generate it. How would something like Zephyr guest work ? Zephyr is not using the device tree we pass, it has an embedded one.
>>
>> In general, guest that don't use the device-tree/ACPI table to detect the layout are already in a bad situation because we don't guarantee that the layout (memory, interrupt...) will be stable across Xen version. Although, there are a implicit agreement that the layout will not change for minor release (i.e. 4.14.x).
> 
> Well right now we have no ACPI support.
> But I still think that a non dtb guest is definitely a use case we need to keep in mind for embedded and safety as most proprietary RTOS are not using a device tree.
> 
>>
>> But see below for some suggestions how this could be handled.
>>
>>>>
>>>> So far, I don't see a particular issue with this approach because the vMaster ID algorithm allocation should be generic. But please let me know if you think there are bits I am missing.
>>> I am a bit afraid of things that are “automatic”.
>>> For everything else we let the user in control (IPA for mapping, virtual interrupt number) and in this case we switch to a model where we automatically generated a vMaster ID.
>>
>> We only let the user control where the device is mapped. But this is quite fragile... I think this should be generated at runtime.
>>
>>> With this model, guest not using the device tree will have to guess the vMaster ID or somehow know how the tools are generating it to use the right one.
>>
>> To be honest, this is already the case today because the layout exposed to the guest is technically not fixed. Yes, so far, we haven't changed it too much. But sooner or later, this is going to bite because we made clear that the layout is not stable.
>>
>> Now, if those projects are willing to rebuild for each version, then we could use the following approach:
>>  1) Write the xl.cfg
>>  2) Ask libxl to generate the device-tree
>>  3) Build Zephyr
>>  4) Create the domain
>>
>> The expectation is for a given Xen version (and compatible), libxl will always generate the same Device-Tree.
> 
> This is a good idea yes :-)

Zephyr still uses a device tree but in a static way - everything must be defined in a .dts before building it.
The steps mentioned by Julien are already followed by Zephyr when building it to run as a Xen VM.
You can take a look at the "Updating configuration" section at the bottom of the following site:
https://docs.zephyrproject.org/latest/boards/arm64/xenvm/doc/index.html

So, as we tend to use Zephyr as a de facto RTOS for Xen, it is already aware of possible changes to the layout.

> 
> Cheers
> Bertrand
> 
>>
>> Cheers,
>>
>> --
>> Julien Grall
> 

~Michal

