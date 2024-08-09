Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841194D2E1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 17:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774830.1185241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scR92-0006fp-Ij; Fri, 09 Aug 2024 15:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774830.1185241; Fri, 09 Aug 2024 15:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scR92-0006dv-G1; Fri, 09 Aug 2024 15:03:08 +0000
Received: by outflank-mailman (input) for mailman id 774830;
 Fri, 09 Aug 2024 15:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0+Y=PI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1scR91-0006do-CV
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 15:03:07 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa60594-5660-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 17:03:05 +0200 (CEST)
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by CH3PR12MB7690.namprd12.prod.outlook.com (2603:10b6:610:14e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 15:03:01 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::c2) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Fri, 9 Aug 2024 15:03:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 15:03:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 10:03:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Aug
 2024 10:03:00 -0500
Received: from [172.23.60.101] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 9 Aug 2024 10:03:00 -0500
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
X-Inumbo-ID: 7aa60594-5660-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRSWTvPg3Z+CE10oy5bJbsIxAoKzq78yzk8T+qgPSM9VLnEMrKsAOiEBKWX1eYeSO6hxmtoJBnUxaLFC5dRE4ivzom3zmagkCwFZ7qZHH6XnzhMGRtMuHGk84IEy4U+JjXBDWtN323zZmeb+Ri12xGHFUZ4CreGU2ir9v0vP+vDw3WXBVPzmrPQWbBauCYjlkeBm1Ndbyihi6rdS+9jGLeIR0ZRAbRd1/eUvD7Stzq3QtbBzAIyqPzIeNkR6966iX9VeNKJKPuefyq66zLVMgik7SspJNM0lNjRhQ7IjMyBeln0U/2wPnd8cSG9opfnMSxz4XQ/cTe/31O9O2+TzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAkz170Ih7M27frSyd483osaQDl3KTPtm62XDU8Ygbk=;
 b=n1Yfb1GUvmAZpgHfH3AuTZBqycoXvPeQLuyCcHJG8D2fUS4jQHyiD431SD8L8cz5AqIhf6OQfxCSYMmTDwtDDoyElN8fa0eStXhwMv1f5ucO4rmOwt8CJKJ4EabNIfEimuLC8kje+0JHTiOD2puyww/oFcmtcBvhnxPjrovKBz0XuhKWAvu59+I8JxYfz8LNcsBJQakA12ogQOvx5Rz/n6M+4CnXAmOAM2AHs5tePQHZlSYCEiCrYGORR+MRe0+B1fMoCWlygq2NaUmHgZghMazionnA0aTN266cCJDFrxRWsTGl4XxxhqTF+2nYVkdcysgTSrYyjeulFCnj61nORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAkz170Ih7M27frSyd483osaQDl3KTPtm62XDU8Ygbk=;
 b=W0U/zH5sxsMEq9BkLXwsemj55CWTly+cdHEMr6l4/cGGVc0MjVBnJ1GA6MbTuOuYcCmsKdUD4ZDgFZlfZ/rg8L/AKPJ2FEebWMkugCfbIhBQNboYQcrf9CBXidf9edmdomUMVkj2BJXFJFz9KQDdEPMZc2/LPDCSt+rdjaPp0HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7c28c7b2-0af0-4f9f-a171-5d8272254f9b@amd.com>
Date: Fri, 9 Aug 2024 11:02:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msi: fix locking for SR-IOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240807052011.582099-1-stewart.hildebrand@amd.com>
 <1b0475fe-4371-4bf7-a469-aa580648f210@suse.com>
 <62523c87-9c93-4b71-a71b-e852fce3136d@amd.com>
 <85a9263b-24cf-47ba-ba83-c2c988dee5c2@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <85a9263b-24cf-47ba-ba83-c2c988dee5c2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|CH3PR12MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1972dc46-080f-4964-969c-08dcb8845d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXIxeXUxWVZxMmFSVmlHdHNURUFucUw0dG05OHJSVFF1b2dWSHI3VzFDd1Ev?=
 =?utf-8?B?dG16RDJjcWNvcWdHKzdQT3Q0bVNqb1FRQ3JyYUt0MVZ2TnQwdDhrVk15bnJi?=
 =?utf-8?B?eFo0N3luK0l0VkFjUmxiSUpQWVZaK05LQitPOER5UGFmQUNMajFYbkJVYXB2?=
 =?utf-8?B?RFh1M3hoNkhyMlJYODg1dVV4alNKN0hEd2ZPb1BFTUw2b1lKZWNOOVNtSDFX?=
 =?utf-8?B?ZHNTS1JQQml5WVp4b2JRZ3A4YnVsMHUxdENzYXpnK2pURVp2d3BWWk9qK0lq?=
 =?utf-8?B?TmJFK0F5U1ZpQjAra2Q0TGU0dnJVZklURHJ0U0FuSW9ZbmlnNERMeldGRDh1?=
 =?utf-8?B?Sy9NTkdwVDdWeUxndXhSVGIwOEphUDZhVFJ0OHF2MFlBMHI5V2xZOHFnRmVt?=
 =?utf-8?B?N2NmVURUd2lWcWxuTjBLQXo3MmlWN2MrRm5xVUxWWGVNUkgrMkc1a2tPZTYy?=
 =?utf-8?B?dnQxUVdOQUNQaFMrdm5vVWdJQUdsRk13OWh3c0dXMktEQXQzTzlFaFNEeG1F?=
 =?utf-8?B?YVNVWGdxNk9Qc0NaeWJ4RTMwYzBsb0hsTHNFK3d3Z1orbWhEM3ZyU0lmMjFU?=
 =?utf-8?B?bTBubVo1K0FCMVU4Q2VUR3VaQWJVbUtvdGtOMjNFa08xaFJEVEc2WUc1VWgz?=
 =?utf-8?B?UERPcVBWVXQwcmF2R2t1T3BIYjJ6R1lydWpldmdDcEU4aG1KQXJYdDJzdm9s?=
 =?utf-8?B?bVZvYVQrV29hYXgxVlkwNjFUanArWFR1QmROdFJxcjdSbGtlalRJdEVRTEZv?=
 =?utf-8?B?dWEwK0pLV21GVmRHTHRFM2dDeDFtaW5FMC9zWDY3TjNnOTNTSUwvSkRPaU1T?=
 =?utf-8?B?VldQQWU1Ni9FV0FTVFFESnExa1lxT1RWeGIrREd6dzZ4a2pPUU5kekJkWVpl?=
 =?utf-8?B?MmdDa2NPZUZrbEJmUlJBb2N2WWpEaHJKTkdPSW02cERSbVkzOFZJMlNQdjJw?=
 =?utf-8?B?LzM2cTFLNHdwc2tVMXNLV2liVnV4a2lUcTBKR0VuL3k4UkZPOTNORThiS0VH?=
 =?utf-8?B?VmpDNVVMTTlHOEs1MlNYQkxSd1k0WG41bDkrMnZLcVN0UkdkZVVYZHNrMVVZ?=
 =?utf-8?B?aXgyWTkwVmJNLy9wWGV6dXZENnBvb2JSb3lJeHpaR0ZYTm9XTHg2c05GTHVG?=
 =?utf-8?B?RWkwQjVlMUdHWjloNzNUclRYOEp1dVR1N1NyTUNKLzNPK3NXSEh6ZlhZUEdz?=
 =?utf-8?B?dkRhbzZDRXJFRmZNRitLR1R1UGhKMXpHSWxzRGVnVUVmb3RadkEwZXErdTlz?=
 =?utf-8?B?ZDJjUmZGNGRSbkxFRjh4c2ovY0FwVE1OeWdYWVYwSFpmdXpCa0g3Y2prQlkx?=
 =?utf-8?B?M3FYQlZBQTlwSkJsZzJ4QzdyMFBGbEZLRGtUVGlVTldZemltMUNMSGVzZENq?=
 =?utf-8?B?c0lyZm40amw1dTd5dzdhbjZKRExyd1JFOXFxL0Z6UzhUcmpJNjFkSGhyUE1v?=
 =?utf-8?B?N2VCNS9jckt0V09QUkxxbzllMGRkQzFnSkp0cWViSElobThQbmdPdGJOZ1hS?=
 =?utf-8?B?VGdqMUlkT0tseHNLaE1xQ1FDemR0bFMzNFNBbEtHVGUzUi9Yc3J3WEx6MjUr?=
 =?utf-8?B?MEZ6THFyMzNOWVhPcjdKUXNqc3JQTFFSVlEyS0ZHNFNjOTk4QUlFbkovc3p6?=
 =?utf-8?B?VmRMekRlSk5WYVdUckJmMmxCR0IwYWx5RXFmZlA0T2lWNTRUb0EyT0dlYVJ1?=
 =?utf-8?B?Z1ArVXdmcmJFaHAwWEpPSitwRW1zc1FzS3pMMDF4dlc5NlhVaVJaSDMyWHB6?=
 =?utf-8?B?d21EUHNNTUJEaU9XY1Vpdm5qWU1LQTdPTGQ0Mnppem9lTXpCelltK2VwZTlw?=
 =?utf-8?B?VlEyaXk0V1ZDaTJodW9tK0FwemJXZWtkeWlHWldwUTVxekhLbzdVZXJEWWM0?=
 =?utf-8?B?MXI1N3A0TjdzMUFFUFVydDJkanpYU3BicjVibmJEQ2RaMWpCOGdMa1M0ZlA3?=
 =?utf-8?Q?V49pg6HD0cK687R2On58iXsDovhzt14W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 15:03:01.6274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1972dc46-080f-4964-969c-08dcb8845d27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7690

On 8/9/24 09:05, Jan Beulich wrote:
> On 09.08.2024 06:09, Stewart Hildebrand wrote:
>> On 8/7/24 11:21, Jan Beulich wrote:
>>> On 07.08.2024 07:20, Stewart Hildebrand wrote:
>>>> --- a/xen/arch/x86/msi.c
>>>> +++ b/xen/arch/x86/msi.c
>>>> @@ -662,7 +662,8 @@ static int msi_capability_init(struct pci_dev *dev,
>>>>      return 0;
>>>>  }
>>>>  
>>>> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>>>> +static u64 read_pci_mem_bar(struct pci_dev *pdev, u16 seg, u8 bus, u8 slot,
>>>> +                            u8 func, u8 bir, int vf)
>>>>  {
>>>
>>> First I thought this was a leftover from the earlier version. But you need
>>> it for accessing the vf_rlen[] field. Yet that's properly misleading,
>>> especially when considering that the fix also wants backporting. What pdev
>>> represents here changes. I think you want to pass in just vf_rlen (if we
>>> really want to go this route; I'm a little wary of this repurposing of the
>>> field, albeit I see no real technical issue).
>>
>> I like your idea below of using a struct, so I'll pass a pointer to the
>> new struct.
>>
>>> Of course there's a BUILD_BUG_ON() which we need to get creative with, in
>>> order to now outright drop it (see also below).
>>
>> I suppose this BUILD_BUG_ON() is redundant with the one in
>> pci_add_device()...
> 
> "Redundant" can be positive or negative. Your response sounds as if you
> thought one could be dropped, yet I think we want them in both places.
> 
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -654,6 +654,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>      const char *type;
>>>>      int ret;
>>>>      bool pf_is_extfn = false;
>>>> +    uint64_t vf_rlen[6] = { 0 };
>>>
>>> The type of this variable needs to be tied to that of the struct field
>>> you copy to/from. Otherwise, if the struct field changes type ...
>>>
>>>> @@ -664,7 +665,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>                              PCI_SBDF(seg, info->physfn.bus,
>>>>                                       info->physfn.devfn));
>>>>          if ( pdev )
>>>> +        {
>>>>              pf_is_extfn = pdev->info.is_extfn;
>>>> +            memcpy(vf_rlen, pdev->vf_rlen, sizeof(pdev->vf_rlen));
>>>
>>> ... there'll be nothing for the compiler to tell us. Taken together with
>>> the BUILD_BUG_ON() related remark further up, I think you want to
>>> introduce a typedef and/or struct here to make things properly typesafe
>>> (as then you can avoid the use of memcpy()).
>>
>> Here's what I'm thinking:
>>
>> struct vf_info {
>>     uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
>>     unsigned int refcnt;
>> };
>>
>> struct pci_dev {
>>     ...
>>     struct vf_info *vf_info;
>>     ...
>> };
> 
> I don't (yet) see the need for refcnt, and I also don't see why it wouldn't
> continue to be embedded in struct pci_dev. Specifically ...
> 
>>> An alternative approach might be to add a link from VF to PF, while
>>> making sure that the PF struct won't be de-allocated until all its VFs
>>> have gone away. That would then also allow to eliminate the problematic
>>> pci_get_pdev().
>>
>> I think I can add a link to a new reference-counted struct with just the
>> info needed (see the proposed struct above).
> 
> ... I think having a link from VF to its PF may turn out helpful in the
> future for other purposes, too.

Continue to embed in struct pci_dev: okay.

Link from VF to PF: assuming you mean a link to the PF's
struct pci_dev *, okay.

Ensuring the PF's struct pci_dev * won't be de-allocated until the VFs
are gone: I don't think we want to impose any sort of ordering on
whether the toolstack removes VFs or PFs first. So, if not reference
counting (i.e. how many VFs are referring back to the PF), how else
would we make sure that the PF struct won't be de-allocated until all
its VFs have gone away?

