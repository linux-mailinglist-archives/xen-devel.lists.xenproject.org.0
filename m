Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B36F67DC
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529636.824230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUm2-0008Nv-Ek; Thu, 04 May 2023 08:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529636.824230; Thu, 04 May 2023 08:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUm2-0008LH-Bc; Thu, 04 May 2023 08:57:14 +0000
Received: by outflank-mailman (input) for mailman id 529636;
 Thu, 04 May 2023 08:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2+9=AZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1puUm0-0008LB-D2
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:57:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a739ef4f-ea59-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 10:57:10 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 08:57:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 08:57:07 +0000
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
X-Inumbo-ID: a739ef4f-ea59-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5gcc2Zjco2uTjZEwkckk85r6s/WdAHcPiGxVMxMnzcGdjhUcA5rk4vq+k+jAu3S8WXzqItdIUpLz4p2rWeelg2mRr6QixWe2zdZGt5KWdTMUQlcLMNlI/IiJ7p4Ex17vpvew9CnKxBQyGRK099kf292UCeV1PIter4X+xPhXhEqGwMHDC4TXFhk/wHLAWXmWFQxXQKobplFcM//9SXZF9JRBL5YU+W4dV/1uNRSeQmFhs8Wli/jEcaq6juLEJLmBLFs98dNVlvXxP4BESH5ESA68sgC1/63Dk0Rzi/W/b9TukjRpNTOfBi6MpPXYXpfVQ3O6A50rMXHU11cOI52WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOcCAn5J6X8Pm64VOVcAOsHmFnDG/KQ8frpCsmJ+zzY=;
 b=RF28fiOq7LUiNB/qA+LxEN7s5tnsZzlUOV6AJ+Vp5OSao3ZycLQU81VvRXQvtkNd7skGu+mqMPt9yLnuCH3MQo/NeLlQiaKpf0b4QG4gYbBTuTHy8+faojU8ofFhNpMPW2NiL6VqBryhri673yIpusWQWhRU0CnkMKPite6I4sgl4Rk4rIwKFqm6cB6pvVz4vUjxplTT35Mv8YCJPwbHe3sVXLCOVrtr/UNAjSNIovN/0YMLBFkrrlgt+W7Lhf1/Z14fdarfCUDG9i6iAsoKwBJtAfkgYqn/uXapVnT5OFnzs6/vl9+ROhc0i2bTI0c/GmelxkQReOV97TesERZqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOcCAn5J6X8Pm64VOVcAOsHmFnDG/KQ8frpCsmJ+zzY=;
 b=DGUNHVRpwYrRt9NaYynA62vhDPd3DCL2xMsRQQ8R8ApQGt/DqTGeqH8u826i4nTd5dCb5aCOQCluiAPGDwrMnZONTm+CXJ2FeT4aDtlCwMfyD8F3CFLXaX5wpUPSK9M5CNiKFkNX8hFOc6wXg9q57wh4ryCHe70HD5YxoiYHKPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <22c4da5c-9ad7-68ba-b005-8ba18e584bf6@amd.com>
Date: Thu, 4 May 2023 09:57:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
 <2d764f29-2eb9-ecff-84cd-9baf12961c54@xen.org>
 <e9a95271-021f-523a-770a-302c638bfe73@amd.com>
 <556611a5-dc9a-8155-650d-327b6853f761@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <556611a5-dc9a-8155-650d-327b6853f761@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN0PR12MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e170e52-c7d5-4b73-e76a-08db4c7d89b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pf1gvA9IXaWApc6aTTNxVBn+hHNVK2SY6nk4axFLBAZ45EeMT3l3YhTakMceUoFWrXnMus6PqtGCKgfvNkOOMjErm5jCwatLxuqXjxtbM87WoK+6C7ZbhNT0XfkF07csWkvdyPvTAiVy5k/SRRtvef6Ijs7O7dKCPG7oi1etKcXMwwMNf2/NJL9FRXkhMB4cgAuX9sjgqDRWoaPZrBDvmnTrZii2BoJU/Hz82waHM0zVD20TakSD/6m8KUV0RUWR6BiItOhin1sWAP+BQocb5pDSIEoLT9DDiWJ/UR3C0otX2A1SoWMbZ9IuBDZV4LZ6/JtpdClDZvq4ByW7e8CsEhAoZFfjEf+oigOs7dXrEbcu3UyguFPeAHPzQ/yRYU8XCavVQnPikIRHY8BzYhQalS+MvCxo350LoQboYWWEgB5h/1XwbjsEdGasD6qdDrOOEEZyfFiGzVLqUiEs5sIdsWYhVx+vBnvX5o3CIhVZBZJxQc+wcpFlY5y02ZF3UoK0kB53uWstSxW1VlbRYJqdS6yY1nE2My0j/u+0JLeL3j+bOcx+HSSGAmTTAUXIaVwmbOpCh2VMs/SNW8lglPJls5pW5qNQSaV5aP1klpfrESuiNZmQETTzM0g3Rcch2h+zPcNasNZqMQgTd9sAxf0yg47ZEeXMlefWZW1Xb2JtM9w1sG92uwal6hpNIeTb4D/p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(31686004)(4326008)(66476007)(66946007)(478600001)(966005)(66556008)(6666004)(6486002)(316002)(110136005)(36756003)(31696002)(83380400001)(53546011)(2616005)(6512007)(6506007)(26005)(8676002)(41300700001)(8936002)(2906002)(5660300002)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTFhT1NZcVFwVUNXcHBPQ1VJWm5nV2I0RGZpNTh1MDlQL2FiT3FOcnRaQlhH?=
 =?utf-8?B?REU3RGJSUElmRTFSbUJBZTZWOEV0T3FUTUZ6NXRyb2RvNmc3cCtQbmlZcmd4?=
 =?utf-8?B?cWVRM3AybytSRU9pVWx4cTUwQUZCZ3V5bElBTEpYUnVSQW1jWmR6RGZCcWxJ?=
 =?utf-8?B?QTFJN2p5RHdGaFZMSHpuSnFhSlhkWjJqVmNuN3JaS3k1aHZldm9NUGwyRHRv?=
 =?utf-8?B?MW4vZ2VXWW9OZkE1K2JSTXBPRms1ejI0bFpMMUV2QzZYWXlFekpqcVR1ZmFW?=
 =?utf-8?B?V2V3eHR1VkF4SWEzdUUwb09BNE9PcGlKS29CYlJEenRNQlFRZ2FFSGwzNVpV?=
 =?utf-8?B?RWIzYXk0ZzNodGtENFZsMk5zajlyYnFVNnNrWjNiUmMxU1I2L01wNWlSajZx?=
 =?utf-8?B?bHU3azhGWmlLaE5LYkJqNlk5a1dqd1FWYkI2cXJUVFpORHl4eW1rMlNLbzMz?=
 =?utf-8?B?STc2VjljL1N1QWhscVNTUVhWbGJTOUF6YzZPd3NUNm1Qa3hLTlBqM2MzWEln?=
 =?utf-8?B?KzlmTURWeVRuT3lQQW1rcEtDK3hYOFNUNUlSbGkyck0vNzE3MzB0TkZLRmhp?=
 =?utf-8?B?QTQ1YUd4YUwrN1V5S3F3VFdkZ2tDcmNXNGx0T0o5OHNwTUR3TFk2UXlic0wr?=
 =?utf-8?B?U0pFcTViWFA0RHRGTS9UVFVlSjhBYnpZYytZMHhkVGFmUDRaMm5rOWxxVmxF?=
 =?utf-8?B?Uy82cUx6bkhoYStPT0g4ZWtQUzJPUHB0VWNCYkVnZFhFVDdCQThuSEZCN0oz?=
 =?utf-8?B?UkJ3dnZocmVEdkhuSDIxbTNmakh2MnkreFVodzl0azBadlJiWmNNL0dVdVIv?=
 =?utf-8?B?TXgxdGxSM0lIbko2NDdDbWNhV1VTN3F1L2lLRUpnRmxBWURhMnRhdTRzMVpJ?=
 =?utf-8?B?b2VWdmRBS21YKzczcW1pTjdTQXN4Qk85TE8rcnRkR21MU2JrSFhVeHVXckVi?=
 =?utf-8?B?ZHQ2T3lmRldqekNIRGwzVDNZVWNBcEtSWFc2cGdPRGtHWnFpVUh3RmViU0NH?=
 =?utf-8?B?ZEdKeXNiQmcxMTIzOVQ5dlVDU1JpdzVlakV2YjE5U3FTcklmQzlaNWdWQkZt?=
 =?utf-8?B?QldzUElmcnBFRVBpRS9XL2lvZkpZVVpTWTM0QzU4dFI0NlF6VldTM0JIbStR?=
 =?utf-8?B?OXhKNmNNMW9OMVd3Mml0UXROM3U0YU1wdTNUVWlEV290OUNwWTZoNHpuVjZH?=
 =?utf-8?B?UWVPQyt3T3FId2Z5UU1wVmZTRkprVXJuSWgxdlQvVmpiMkczbEhCNFBMckJX?=
 =?utf-8?B?TnlmVDRxcjBRZkFkVHFzWDhHdHUxWDZqSjhvalZlMW1FV2JSMDcvTklRNkc0?=
 =?utf-8?B?aDFQcFkrbVplQmhma3pQM2dxOEtyNW8rZ2l1RmdiVVlNaW5TUm5FeFhqdk5i?=
 =?utf-8?B?VlU2WVZzc0ZlcFdEdUprbHR1WHl1K1VWd2VQZEFNdTRxTVB1TkpPL01yd1Q5?=
 =?utf-8?B?V0drTThRV0M4d3FqeG50T1RLY2Qxa0t2cHVlUjRVb1dESzZLemRmVlYvTmZG?=
 =?utf-8?B?SFB1QmV5VnZBYTk1eHdQVlpVQUw5T3J1Q1BKMXlTVUhwZUVqNEdkUTcxWnR6?=
 =?utf-8?B?Q25WWkxXb1NtUmRjNHBIdE9vM0E1eE1MOWVoeDZvaXdBTTRQQ1ErYWJMejFL?=
 =?utf-8?B?TTZDVVZBdU5OaWVabUM1ak84WnVjTXFuckRPMEZVQUs3Qzk1eDRZais2R2FY?=
 =?utf-8?B?bU8ySlhDQTJTQVgzMkdrUVNBMzIva1JxRzhaV0owT1FqeExXZ3FvTmlITlFh?=
 =?utf-8?B?MUQzTjFjQUxheHVrOXRTUnlyMW54NE5NUGJjYlh5a2VHNnZva3hVcUpQMGpj?=
 =?utf-8?B?RjRDMEFWTmc4dmJ4Wm5vNFVibFZrWkdkTTY1dHdpVkJTUDBFb1dIUTczbUgv?=
 =?utf-8?B?LytSbmdTU0JpWDN4OUl5VzZaeHRkYlBqSDFkUXNkM2g0MlRXN2lISDdpQ1oz?=
 =?utf-8?B?TFUwSzVyR1ZiOHhibG1lenZTbTMzb0c4WXk4a2tpMGUzZy9OR3ExVDlzZ1F6?=
 =?utf-8?B?VC9ET3VJK0ZCMUJOZTVnQ3VKVlVET0U2S2E1NFFpZ0RETXh3azRNYkErSWZ4?=
 =?utf-8?B?YnBwRVJKdkdxMWpkLytFK1l0bmEzWWc4RDF4OGt5b0dlMkVxd2Y0d0UzZGpB?=
 =?utf-8?Q?tRB0fPFHouoZfUjnMVofDxjz3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e170e52-c7d5-4b73-e76a-08db4c7d89b5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:57:07.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G61RrDPaAk7D1HDfQB8/3qo6By6bTewltqiyqgNxQ3kHxEqsXhOsa5YYfmtMUvD9pEivNDdfY9F/hh/VLA7TVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6150


On 03/05/2023 18:43, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 03/05/2023 17:49, Ayan Kumar Halder wrote:
>>
>> On 03/05/2023 08:40, Julien Grall wrote:
>>> Hi,
>> Hi Julien,
>>>
>>> Title: Did you mean "Enable spin table"?
>> Yes, that would be more concrete.
>>>
>>> On 02/05/2023 11:58, Ayan Kumar Halder wrote:
>>>> On some of the Arm32 based systems (eg Cortex-R52), smpboot is 
>>>> supported.
>>>
>>> Same here.
>> Yes
>>>
>>>> In these systems PSCI may not always be supported. In case of 
>>>> Cortex-R52, there
>>>> is no EL3 or secure mode. Thus, PSCI is not supported as it 
>>>> requires EL3.
>>>>
>>>> Thus, we use 'spin-table' mechanism to boot the secondary cpus. The 
>>>> primary
>>>> cpu provides the startup address of the secondary cores. This 
>>>> address is
>>>> provided using the 'cpu-release-addr' property.
>>>>
>>>> To support smpboot, we have copied the code from 
>>>> xen/arch/arm/arm64/smpboot.c
>>>
>>> I would rather prefer if we don't duplicate the code but instead 
>>> move the logic in common code.
>> Ack
>>>
>>>> with the following changes :-
>>>>
>>>> 1. 'enable-method' is an optional property. Refer to the comment in
>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml 
>>>>
>>>> "      # On ARM 32-bit systems this property is optional"
>>>
>>> Looking at this list, "spin-table" doesn't seem to be supported
>>> for 32-bit systems. 
>>
>> However, looking at 
>> https://developer.arm.com/documentation/den0013/d/Multi-core-processors/Booting-SMP-systems/SMP-boot-in-Linux 
>> , it seems "spin-table" is a valid boot mechanism for Armv7 cpus.
>
> I am not able to find the associated code in Linux 32-bit. Do you have 
> any pointer?

Unfortunately, no.

I see that in linux, "spin-table" support is added in 
arch/arm64/kernel/smp_spin_table.c. So, there seems to be no Arm32 
support for this.

>
>>
>>
>>> Can you point me to the discussion/patch where this would be added?
>>
>> Actually, this is the first discussion I am having with regards to 
>> adding a "spin-table" support on Arm32.
>
> I was asking for the discussion on the Device-Tree/Linux ML or code.
> I don't really want to do a "spin-table" support if this is not even 
> supported in Linux.

I see your point. But that brings me to my next question, how do I parse 
cpu node specific properties for Arm32 cpus.

In 
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml 
, I see some of the properties valid for Arm32 cpus.

For example:-

secondary-boot-reg
rockchip,pmu

Also, it says "additionalProperties: true" which means I can add platform specific properties under the cpu node. Please correct me if mistaken.

My cpu nodes will look like this :-

         cpu@1 {
             device_type = "cpu";
             compatible = "arm,armv8";
             reg = <0x00 0x01>;
             enable-method = "spin-table";
             amd-cpu-release-addr = <0xEB58C010>; /* might also use "secondary-boot-reg" */
             amd-cpu-reset-addr = <0xEB58C000>;
             amd-cpu-reset-delay = <0xF00000>;
             amd-cpu-re
             phandle = <0x03>;
         };

         cpu@2 {
             device_type = "cpu";
             compatible = "arm,armv8";
             reg = <0x00 0x02>;
             enable-method = "spin-table";
             amd-cpu-release-addr = <0xEB59C010>; /* might also use "secondary-boot-reg" */
             amd-cpu-reset-addr = <0xEB59C000>;
             amd-cpu-reset-delay = <0xF00000>;
             amd-cpu-re
             phandle = <0x03>;
         };

If the reasoning makes sense, then does the following proposed change 
looks sane ?

diff --git a/xen/arch/arm/arm32/smpboot.c b/xen/arch/arm/arm32/smpboot.c
index e7368665d5..0b281edb9d 100644
--- a/xen/arch/arm/arm32/smpboot.c
+++ b/xen/arch/arm/arm32/smpboot.c
@@ -10,10 +10,7 @@ int __init arch_smp_init(void)

  int __init arch_cpu_init(int cpu, struct dt_device_node *dn)
  {
-    /* Not needed on ARM32, as there is no relevant information in
-     * the CPU device tree node for ARMv7 CPUs.
-     */
-    return 0;
+    return platform_cpu_init(cpu, dn);
  }

  int arch_cpu_up(int cpu)
diff --git a/xen/arch/arm/include/asm/platform.h 
b/xen/arch/arm/include/asm/platform.h
index d03b261ce8..5cd7af4d0e 100644
--- a/xen/arch/arm/include/asm/platform.h
+++ b/xen/arch/arm/include/asm/platform.h
@@ -18,6 +18,7 @@ struct platform_desc {
      /* SMP */
      int (*smp_init)(void);
      int (*cpu_up)(int cpu);
+    int (*cpu_init)(int cpu, struct dt_device_node *dn);
  #endif
      /* Specific mapping for dom0 */
      int (*specific_mapping)(struct domain *d);
diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
index a820665020..ed54b68c20 100644
--- a/xen/arch/arm/platform.c
+++ b/xen/arch/arm/platform.c
@@ -95,6 +95,14 @@ int __init platform_specific_mapping(struct domain *d)
  }

  #ifdef CONFIG_ARM_32
+int __init platform_cpu_init(int cpu, struct dt_device_node *dn)
+{
+    if ( platform && platform->cpu_init )
+        return platform_cpu_init(cpu, dn); /* parse platform specific 
cpu properties */
+
+    return 0;
+}
+
  int platform_cpu_up(int cpu)
  {
      if ( psci_ver )


Let me know your thoughts, please.

Kind regards,

Ayan

>
> Cheers,
>

