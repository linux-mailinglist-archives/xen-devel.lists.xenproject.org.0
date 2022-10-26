Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E244B60E64E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 19:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430714.682696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onk2M-0000fq-6B; Wed, 26 Oct 2022 17:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430714.682696; Wed, 26 Oct 2022 17:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onk2M-0000cp-1R; Wed, 26 Oct 2022 17:17:54 +0000
Received: by outflank-mailman (input) for mailman id 430714;
 Wed, 26 Oct 2022 17:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azgP=23=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onk2K-0000cj-Hy
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 17:17:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d5a4d17-5552-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 19:17:49 +0200 (CEST)
Received: from MW2PR2101CA0007.namprd21.prod.outlook.com (2603:10b6:302:1::20)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 17:17:45 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::98) by MW2PR2101CA0007.outlook.office365.com
 (2603:10b6:302:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.0 via Frontend
 Transport; Wed, 26 Oct 2022 17:17:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 17:17:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 12:17:44 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 12:17:41 -0500
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
X-Inumbo-ID: 1d5a4d17-5552-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvFhiTWKHqduAcnIErXfynJeYKEpj2O+0OctTZ3nldYuL6l3Q99mdlkxfVaMT1cJKVIu/R5LUwAJ9s+96hwDddkt1tNAhN6YCACOEkNCpQjsU8+Zg3VFXFe/m+cGOrDDdFByv5/90VviIppdcaWBBZofKLlXjReA83PhjhTpr500qNPY1K981tPgHmb+PuXE982jiGRoGWsdEoGCJ348gbIlxp0V4VGZ75kyIN7gBB7lZ3McVoywBl0MvLjoaXmvRP1maSRIp5BUfxpVYkiOy+0/BzfsZwugMTwRozXVCIvItomdJctND39sE77MmFQ7Ym0kQ8n4cIJC5DZXu/38Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6TCyx2iWcfkvCOoNyftXRpBX6ft6Xvxvt7fMRXQa+0=;
 b=AfMKY0VdCkPzVk3jgdYDNewbVx+IB3XXAKhOsuW7s/53xBBgVlpl+4Er8nwvAkcbLW+05h9ZG5iHsJsEwhVCh0fDEEO0cIhZ4Q0pYz18/qx2MZiLFF4jMr0G6M7fbbC/Xah+4Eo0XPViR7kGNfI4U5+gahWVwrsNLcE7xms4bLHcVc0JvrVUZwUQK8yEsMVP/3AOJp74u3J/sVUt0YNCa2yJXZdxwSjVmCx4TTRyq36MeDTkDU4bOmUdj3mUblF5c6TbhZ5br8fUzXNF/Xz0ImoRPEgauV+Z696TYkZLBU1CguFZuUbu3xrXahDTAEdRARxMrfnWTpmbjOtErtS9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6TCyx2iWcfkvCOoNyftXRpBX6ft6Xvxvt7fMRXQa+0=;
 b=sqEYXEeuPOeMIcRrMb2YjQFzk9Yi5Ve9n307VYTPJUYLiBj5HzNiaFLcPotMwpKyHkl5oljK//nQ092oUE9QZgSXm0xjP1ahjDlcUGpuOEbvzIn1rJHDQomQb+AyOUNa+/SFYu5OGgj8xROODxeOEPOKQDNJVpgO6Wut2nBx2/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
Date: Wed, 26 Oct 2022 19:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@arm.com>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb817ad-1f71-4cac-cf72-08dab775ff65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uGQVYPwGREQV3oRFJeLh5qeCg1g+Lina+O2IBNsvleOIkQO9ycz8ZKy8F+Gs4mW/rS1H5oTs/SDMNKZY9NlzswIbo2L9jdGWFoWzzXKJUg5je7NvsDn1YoUUnsWsIDLSAPTuK31fcDVX0NOBCt0lyAw/4ehX2Q4VrGW+l8k6v47zS9JJ9yjU3CkaDwHn1OYrtu4b/oKCRqCUeA7kIHbqnyb2M1RfSdBvarh1ODsIw6uF2pPHf2Ez0XdJeqrxYyAqLTSRc9iQQ/c/wsnigi3YoyDBTxUHeK3dFrEGN1L5Rp/YtMipq9jWbA69kwWZVRtqYJS2sqbiR2zVIflPEGkSiPAyOyRoiNrJ35JPwoP0pFbOovNrZP/dLCuJHdym2m/q3/HIAdvGZKIQvcbJaE1o9z2SLipbKKhvQfHvwIybld+futW5yJUh8Sxkg8lw7vZjjLPn1QQvCWWzNUanAwQwa497ol3TvFa/pf/ws0JrXvc56mKYYmtbp7it89g01Rk5W/3YK+aINSkMNlw32S3C4PvRzfgmxiQaOvu/Vwq0QWHi2S1I0kv3DcF+9hTV+HD4eZAwZ5v+L1Sk7zIIUp8MENNpMpPg0v9EDJwbN3G3Z8WSzb8VGG+E304GYHmAOeHJORbz4ow6naHzJfyl1fVzocI2HcLsTs71aXgOOb0AWfppaHTdLBLVO05W5D1Pr+gnZetHr0aFfJlEzTsEpu2bRtl79UBw9YAz8tXM4SmS4QOKKO5ctdu/fZEGpoN0W4eYrXbGL5nAQpuRWadKBga6Q20pt7L+chgy0DxgFllq3/mq/K9Z7u6Gya1NWQelc4TOrgtDJFG3l/JtU6j400zE+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(44832011)(316002)(356005)(16576012)(81166007)(83380400001)(110136005)(36756003)(54906003)(8676002)(70586007)(70206006)(5660300002)(40480700001)(2906002)(41300700001)(8936002)(4326008)(40460700003)(2616005)(426003)(47076005)(336012)(478600001)(7416002)(31686004)(36860700001)(186003)(82740400003)(31696002)(86362001)(26005)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 17:17:44.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb817ad-1f71-4cac-cf72-08dab775ff65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611

Hi Rahul,

On 26/10/2022 16:33, Rahul Singh wrote:
> 
> 
> Hi Julien,
> 
>> On 26 Oct 2022, at 2:36 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 26/10/2022 14:17, Rahul Singh wrote:
>>> Hi All,
>>
>> Hi Rahul,
>>
>>> At Arm, we started to implement the POC to support 2 levels of page tables/nested translation in SMMUv3.
>>> To support nested translation for guest OS Xen needs to expose the virtual IOMMU. If we passthrough the
>>> device to the guest that is behind an IOMMU and virtual IOMMU is enabled for the guest there is a need to
>>> add IOMMU binding for the device in the passthrough node as per [1]. This email is to get an agreement on
>>> how to add the IOMMU binding for guest OS.
>>> Before I will explain how to add the IOMMU binding let me give a brief overview of how we will add support for virtual
>>> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3 Nested translation support. SMMUv3 hardware
>>> supports two stages of translation. Each stage of translation can be independently enabled. An incoming address is logically
>>> translated from VA to IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to the output PA. Stage 1 is
>>> intended to be used by a software entity( Guest OS) to provide isolation or translation to buffers within the entity, for example,
>>> DMA isolation within an OS. Stage 2 is intended to be available in systems supporting the Virtualization Extensions and is
>>> intended to virtualize device DMA to guest VM address spaces. When both stage 1 and stage 2 are enabled, the translation
>>> configuration is called nesting.
>>> Stage 1 translation support is required to provide isolation between different devices within the guest OS. XEN already supports
>>> Stage 2 translation but there is no support for Stage 1 translation for guests. We will add support for guests to configure
>>> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU hardware and exposes the virtual SMMU to the guest.
>>> Guest can use the native SMMU driver to configure the stage 1 translation. When the guest configures the SMMU for Stage 1,
>>> XEN will trap the access and configure the hardware accordingly.
>>> Now back to the question of how we can add the IOMMU binding between the virtual IOMMU and the master devices so that
>>> guests can configure the IOMMU correctly. The solution that I am suggesting is as below:
>>> For dom0, while handling the DT node(handle_node()) Xen will replace the phandle in the "iommus" property with the virtual
>>> IOMMU node phandle.
>> Below, you said that each IOMMUs may have a different ID space. So shouldn't we expose one vIOMMU per pIOMMU? If not, how do you expect the user to specify the mapping?
> 
> Yes you are right we need to create one vIOMMU per pIOMMU for dom0. This also helps in the ACPI case
> where we don’t need to modify the tables to delete the pIOMMU entries and create one vIOMMU.
> In this case, no need to replace the phandle as Xen create the vIOMMU with the same pIOMMU
> phandle and same base address.
> 
> For domU guests one vIOMMU per guest will be created.
> 
>>
>>> For domU guests, when passthrough the device to the guest as per [2],  add the below property in the partial device tree
>>> node that is required to describe the generic device tree binding for IOMMUs and their master(s)
>>> "iommus = < &magic_phandle 0xvMasterID>
>>>      • magic_phandle will be the phandle ( vIOMMU phandle in xl)  that will be documented so that the user can set that in partial DT node (0xfdea).
>>
>> Does this mean only one IOMMU will be supported in the guest?
> 
> Yes.
> 
>>
>>>      • vMasterID will be the virtual master ID that the user will provide.
>>> The partial device tree will look like this:
>>> /dts-v1/;
>>>  / {
>>>     /* #*cells are here to keep DTC happy */
>>>     #address-cells = <2>;
>>>     #size-cells = <2>;
>>>       aliases {
>>>         net = &mac0;
>>>     };
>>>       passthrough {
>>>         compatible = "simple-bus";
>>>         ranges;
>>>         #address-cells = <2>;
>>>         #size-cells = <2>;
>>>         mac0: ethernet@10000000 {
>>>             compatible = "calxeda,hb-xgmac";
>>>             reg = <0 0x10000000 0 0x1000>;
>>>             interrupts = <0 80 4  0 81 4  0 82 4>;
>>>            iommus = <0xfdea 0x01>;
>>>         };
>>>     };
>>> };
>>>  In xl.cfg we need to define a new option to inform Xen about vMasterId to pMasterId mapping and to which IOMMU device this
>>> the master device is connected so that Xen can configure the right IOMMU. This is required if the system has devices that have
>>> the same master ID but behind a different IOMMU.
>>
>> In xl.cfg, we already pass the device-tree node path to passthrough. So Xen should already have all the information about the IOMMU and Master-ID. So it doesn't seem necessary for Device-Tree.
>>
>> For ACPI, I would have expected the information to be found in the IOREQ.
>>
>> So can you add more context why this is necessary for everyone?
> 
> We have information for IOMMU and Master-ID but we don’t have information for linking vMaster-ID to pMaster-ID.
> The device tree node will be used to assign the device to the guest and configure the Stage-2 translation. Guest will use the
> vMaster-ID to configure the vIOMMU during boot. Xen needs information to link vMaster-ID to pMaster-ID to configure
> the corresponding pIOMMU. As I mention we need vMaster-ID in case a system could have 2 identical Master-ID but
> each one connected to a different SMMU and assigned to the guest.

I think the proposed solution would work and I would just like to clear some issues.

Please correct me if I'm wrong:

In the xl config file we already need to specify dtdev to point to the device path in host dtb.
In the partial device tree we specify the vMasterId as well as magic phandle.
Isn't it that we already have all the information necessary without the need for iommu_devid_map?
For me it looks like the partial dtb provides vMasterID and dtdev provides pMasterID as well as physical phandle to SMMU.

Having said that, I can also understand that specifying everything in one place using iommu_devid_map can be easier
and reduces the need for device tree parsing.

Apart from that, what is the reason of exposing only one vSMMU to guest instead of one vSMMU per pSMMU?
In the latter solution, the whole issue with handling devices with the same stream ID but belonging to different SMMUs
would be gone. It would also result in a more natural way of the device tree look. Normally a guest would see
e.g. both SMMUs and exposing only one can be misleading.

> 
>>
>>>  iommu_devid_map = [ “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS” , “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS”]
>>>      • PMASTER_ID is the physical master ID of the device from the physical DT.
>>>      • VMASTER_ID is the virtual master Id that the user will configure in the partial device tree.
>>>      • IOMMU_BASE_ADDRESS is the base address of the physical IOMMU device to which this device is connected.
>>
>> Below you give an example for Platform device. How would that fit in the context of PCI passthrough?
> 
> In PCI passthrough case, xl will create the "iommu-map" property in vpci host bridge node with phandle to vIOMMU node.
> vSMMUv3 node will be created in xl.
> 
>>
>>>  Example: Let's say the user wants to assign the below physical device in DT to the guest.
>>>  iommu@4f000000 {
>>>                 compatible = "arm,smmu-v3";
>>>                      interrupts = <0x00 0xe4 0xf04>;
>>>                 interrupt-parent = <0x01>;
>>>                 #iommu-cells = <0x01>;
>>>                 interrupt-names = "combined";
>>>                 reg = <0x00 0x4f000000 0x00 0x40000>;
>>>                 phandle = <0xfdeb>;
>>>                 name = "iommu";
>>> };
>>
>> So I guess this node will be written by Xen. How will you the case where there are extra property to added (e.g. dma-coherent)?
> 
> In this example this is physical IOMMU node. vIOMMU node wil be created by xl during guest creation.
>>
>>>  test@10000000 {
>>>      compatible = "viommu-test”;
>>>      iommus = <0xfdeb 0x10>;
>>
>> I am a bit confused. Here you use 0xfdeb for the phandle but below...
> 
> Here 0xfdeb is the physical IOMMU node phandle...
>>
>>>      interrupts = <0x00 0xff 0x04>;
>>>      reg = <0x00 0x10000000 0x00 0x1000>;
>>>      name = "viommu-test";
>>> };
>>>  The partial Device tree node will be like this:
>>>  / {
>>>     /* #*cells are here to keep DTC happy */
>>>     #address-cells = <2>;
>>>     #size-cells = <2>;
>>>       passthrough {
>>>         compatible = "simple-bus";
>>>         ranges;
>>>         #address-cells = <2>;
>>>         #size-cells = <2>;
>>>      test@10000000 {
>>>              compatible = "viommu-test";
>>>              reg = <0 0x10000000 0 0x1000>;
>>>              interrupts = <0 80 4  0 81 4  0 82 4>;
>>>              iommus = <0xfdea 0x01>;
>>
>> ... you use 0xfdea. Does this mean 'xl' will rewrite the phandle?
> 
> but here user has to set the “iommus” property with magic phanle as explained earlier. 0xfdea is magic phandle.
> 
> Regards,
> Rahul

~Michal


