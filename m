Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F4610FF6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431976.684637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNmf-0007rI-S5; Fri, 28 Oct 2022 11:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431976.684637; Fri, 28 Oct 2022 11:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNmf-0007ow-Oy; Fri, 28 Oct 2022 11:44:21 +0000
Received: by outflank-mailman (input) for mailman id 431976;
 Fri, 28 Oct 2022 11:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFjJ=25=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ooNme-0007oq-IV
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:44:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da2e2984-56b5-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 13:44:17 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Fri, 28 Oct
 2022 11:44:14 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:44:14 +0000
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
X-Inumbo-ID: da2e2984-56b5-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaRgPiwbbZHFII0cYsJaIQEtk4g5HfA62g3oZtk79eYoEvFmHa4obLX9StkMnbBt6F98fts3Y/Zqu2sbIJe4CKj5RvDhS1fEL5WvDGSfE2hhsp7vZfJr0A/tgAP/lZ6O4orJy8Fd48oeTyvqUJ6wT9gfpUQ+xQgxn++nZYeWAowuex7Db9bOzpT8mhxc8iiwC9Lq/qgm/9I3fYbk4U6yidLSk4QnESlOzvOiUwfJD2yePQ6gFnCjynZff4Klv0SS02UMs4VmWRgtWffLOOCoVOdzKnzchkGkYKk6dMIABMG0dDZzgf+SFh0yDm/gdFizl7zfHVHXIAmTbQCLTBJAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9Mldf5qUAwvWWbpAsoDm+xZrDAm0kaUATQDqGU47wc=;
 b=Q91rw6YMAGv6En1ar5HpQLFnORw2T9NUULX4PjnIri83Zmn/27hYkNk93zT0HWaBR3d03EV7VGxvGvysDbGD6LNYhB6ykX8GbK+Es/A8oxIzkzVcOrMqg0RgHSuYlEgrIlxXRzxCMqGZjzTosLwirYJTwvybZ/li/YKwkCl5FBBgK/C2ewQB2O7M+K4fxr6UmUtqOIKe81xoGG15RZRrbeT+5KoaGoyRgdSABNTUWHRpMJzpoVUOs+HatbiUC4UvokmEq/kj4a19O7kPuRmArOfgAuF2zAF49fZ4m2QGdmBkixgIYjGUDn4iLgUKRaI+EgtysGGioa2OkoxlMoPuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9Mldf5qUAwvWWbpAsoDm+xZrDAm0kaUATQDqGU47wc=;
 b=Wuf+8sNQAsEbK744wF+1DS9HDHBjVAwG9WBGF4y5IUlh4hkUSkgmXmIN3DEZWGBD015o3Sfo5wgP9sPK5MoUXOm3LQ6S+DB+kJ407bk5102M77GNb5ETGc0rx29gM5Lqfv0K+Di7wsVmF33QLrcorkgTtFrUCTfgr3OQNINkkew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5afda99e-dd57-5820-7075-6b60e7a794f7@amd.com>
Date: Fri, 28 Oct 2022 12:44:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
To: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien@xen.org>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
 <20221025145506.5708839c@donnerap.cambridge.arm.com>
 <7f1bdc88-da6b-9a0c-03d4-319e9d8966d4@amd.com>
 <20221027153632.0cf7d004@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221027153632.0cf7d004@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: a5513767-4195-4c43-6fc8-08dab8d9bcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	evyZPX1Efjk0pYPcdrkxwkAR38BiAj0X9u+QXu42Km2DRvvGPCqY3TEyNZ2S03dca1LoqNInQ8/xyCxRU64apNnVOX733F1P8IeHw7YSGQh7PtiHM8LeWTWrd/l/+fd9o32DSiqOwxPCs75tzHbGeEbFQorUPBtiC8fu56k6vclq8LdhdQ8vfOZUdsIsreOGNxZA+op1WRE0tAJeZ1J+zSNJdiKXF0R5S5Mm+q3fnhCaEU0iN7qU3VzuuEwZ2ttEHKehurnKXPAFsZRTwoawlssmx0PjFg7efAgvbLVCynN/ve/wCJSD4qqFNapPas/Zektw9YL79opCz5uURKTh0rrep4nNj2Z7F8zbajygk2JH1N2zuETSsGHg/f0E8WTfrk6FyjYEKYtXP7K101UAnt/d9UmG/DvutcI9BnwHfiMWR5ne5Q2CMn4zOC9+eZ2tiN2Gbnrpkf+LU447f4rU0XN+K0va9X2lhwf8cF96FUb/0UFyoymcMdV7Pp80AB47Ko/aB+qSKY9owY+Zy7bxFHI0SY0GArhM6oWUtujT+orRAVlaRROLr9gkMEts2WhHNqg/WybhNuBlK5o8fgpoLjHe6CQojIobcTM4RwL9oRlHTFPltHeHo9QKwF5sN+MGjjqzQ/qz37QgBPQ+bkQT6MLcDSQ2Uyi+nXCi8szfjTPdm+aPRhuK9HhiI/zCDIpb9HGKP3CYn1elz1XFqZOt8hBVxQhmrK8Qf4mCXPVgfGQrasgkEM8sqegrXoUEasU+tLKESEIfzRCik07B9soIEALirGGp0JHuL5R9bjR8+zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(31696002)(66946007)(316002)(66556008)(4326008)(478600001)(54906003)(110136005)(66476007)(41300700001)(8676002)(8936002)(5660300002)(38100700002)(6506007)(6512007)(53546011)(6666004)(26005)(83380400001)(36756003)(2616005)(186003)(2906002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1BrYTdHb3JzcW9lVCtPTzdSY0prSTIzaTdWR1Zwc3hzKytFZkd6ZWxDWm5E?=
 =?utf-8?B?YXVmOG1pLzQzSzJFVlVZeVZVcGY4eEJkUnFhSWczeHRyaTlySFA1L0N0eDB0?=
 =?utf-8?B?REwxR2lxZG9xUmtqOVFacmJVZzN6U0FqRmVReFhuVHl5OU5oeGY2TmJGQ2Zj?=
 =?utf-8?B?VGo2aXJyTmlPUHNWRU1aYUhiZFZ6ZVNWQTBqL0xEUUZhNWRabU1yNytFaGVm?=
 =?utf-8?B?OTRveWNiVjRHaEI5L3NQd0dFL3pUSXVmU3ZMaXRvMkdzWmsrMmQwdmMyK2k2?=
 =?utf-8?B?ZVcxWHpIbmc2cy9DRVlWckp0aTYwVDVIRzg3VHBEalEzQzhvTFlVYmIxOUMw?=
 =?utf-8?B?a3N0VkRJMWlOLzU3c3YxbVZnWXRrTDRWa3VTTERWa0pTZzFGTEQrSFBuQlVp?=
 =?utf-8?B?dFk3RlFnbzFpK3ZkQUtTOStQbzlmOVZvZTIxaktCdEpEblp1dFZMOXh3ME9L?=
 =?utf-8?B?cklSSjRGRXYzUW85TEdZVHF2R3pEenZ6V3NaeFM5YlRZWmx6eEJkdGJSSXVj?=
 =?utf-8?B?QlovUHc3QXRPMEtRbjAwZ2QraUh3ZVJtVmJNSDhqeXZRb21tSmVRaHNtNUZ3?=
 =?utf-8?B?Qzd2NkliRnMwUDhTVXE4SzZXM2x2dzh4L0VmeHdsdzJWL2JjRjRORENrL1pQ?=
 =?utf-8?B?YXYwNC9DRHU3cUFyWTF3MEJDZk44eDl0TWlRTlFuNUp3SFJsV3FyeG9sMnhk?=
 =?utf-8?B?TUlLa2JVb0VvWC9LN3UzTE9FRXc1N3VtYmZRcG5URGhWalpkaXRYOHBwVEZh?=
 =?utf-8?B?UjVSUEhlb0V1Vnp4ckFQbVBtY3ZWT2tRenA1UmJrZmFwU3AweWI2L1RyZk5l?=
 =?utf-8?B?alpWQktzb01uTEN2NnVscEU4bGFYanljK1ZEemt3ZHdqeWtScW5nVUhsUm9t?=
 =?utf-8?B?Q3F0bG00OWhiVXJSZG5ISTNJVU1DY3BJMXpaL1BFNGtwYjBzdnNENVNjK0sr?=
 =?utf-8?B?aUtPQjRCRU9xREJZSi9FbzhoT3hWeTJBV1hNbXhSWnpOSDM3Wk5hWjJMcU00?=
 =?utf-8?B?emkvbDVVSjhxY2NhZXJ1ejhNK1VwV20xZGtzckgxSnhCRUZnZUpVTXdzNG9s?=
 =?utf-8?B?YW8vMDNLREQzeHh5MERGNkdjdkduZVdNMVl4dmM5MERrVkllQS9IdGJlTmlp?=
 =?utf-8?B?SVpRU3N2dDMyYkR1MnFpdmhjMm5DejYydUNFVHBVUmhqUExYa2xXZ0ZwRVdQ?=
 =?utf-8?B?Yk9CODhPc3ZYTFRRbXFHRTlqNURsNzRjb3lSUFN0SU9jcExLR1piMmMzaWFJ?=
 =?utf-8?B?N2RqNVVId283R1U4THdwSVF5cVlSQ0NDcXR2WTRCWEQ5QlVpZFBsZDl6K09F?=
 =?utf-8?B?U1dkRjM3d3Q4em9Ydkh5azFLWFF1R1ZkVStLdWpINFoyK0hkRE15Nkc3bmsz?=
 =?utf-8?B?U3NyOEhLNXJMUW1oZW53a3BLR0VhTWdubDZiTGVWZ2p2NVE2QXNXZityelB2?=
 =?utf-8?B?MEdhU01vNjhWSy9vaTBWQlN6R2tWRCtEdHpNKytEeTZ3OWwwVUpXcmxBSEhZ?=
 =?utf-8?B?WGV4NExtaklLQk9ZOEQzS2dqMGI4Y0dqQ0doZVBOZUlnWWNFQUE5L0NUMHRV?=
 =?utf-8?B?OUR3T2FCLzdwZnNPSFYyZVRibjB3bCtGK280SDRMSlljQ21RUmwyU0F1d09M?=
 =?utf-8?B?eUVPN2FWbWl0UnZtN1Y0RFB4Tm1zSHNnaU15cGswTTJYL2dlOHk4U0hhU1R2?=
 =?utf-8?B?Znd6blJtQStKaUNpamloemlGMTBJdERjekZBbkIwa2RnN2dPTms4N2JFeUZu?=
 =?utf-8?B?YW10TW1FamZQUXRPcHZ6N1VMUUxuRzJvdGJINm1EYXhvOGxNL0tyZnBqL3Jz?=
 =?utf-8?B?NFoycVJ5aEc2blVNRFQvNEZZWTZqbUtsREdZck5SNFpHQU4xand6U1RBclk0?=
 =?utf-8?B?a25hV3pHN3pSU1QwVDE5VVN0aHQ2dGJkZHVNOFF6cDJnVk1kczNpZHQwK1lW?=
 =?utf-8?B?SDRiWkJRYjVMMmwvRUdpREIxTDNvQm5NWWZSK3lOUkZMOVo2YU5ralVxcTZD?=
 =?utf-8?B?RXNsUmtLd2t2TzdvRGhSYnE0NlVGeXVIbnJ2S1hWUWgyK3ZiWUtRVVpJd21E?=
 =?utf-8?B?emFzM3lVWm10dGptelNQRDExK2llME9JQTZMTlpXMlh5SWNkckRFMHlEN3Jx?=
 =?utf-8?Q?79w5vbYlQwhOyeNjmxdUO3usH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5513767-4195-4c43-6fc8-08dab8d9bcdf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:44:14.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erw95vi3fABE4G5W5gY9EhKtMdeEImhq4QPhj2MI1pIfKAyurqWi6M/vMS6HInissGzYcAnLi7QswlXLtR9XfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683


On 27/10/2022 15:36, Andre Przywara wrote:
> On Thu, 27 Oct 2022 14:38:52 +0100
> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>
> Hi Ayan,
Hi Andre / Julien,
>
>> On 25/10/2022 14:55, Andre Przywara wrote:
>>> On Tue, 25 Oct 2022 13:25:52 +0100
>>> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>
>>> Hi,
>> Hi Andre,
>>
>> Many thanks for the explanation.
>>
>> I need a clarification on the issue of atomic access to 64bit normal
>> memory on R52.
>>
>>>   
>>>> Hi Andre/All,
>>>>
>>>> This came up while porting Xen on R52.
>>>>
>>>> Refer "ARM DDI 0568A.cID110520", B1.3.1
>>>>
>>>> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE
>>>> must not implement LPI support. "
>>>>
>>>> Does this mean ITS is not supported on R52 ? I am assuming yes, please
>>>> correct me if mistaken.
>>> An ITS relies on LPIs, so yes: no ITS on a v8-R32 system. I cannot find
>>> this restriction anymore in the v8-R64 supplement, so it would only apply
>>> to the R52/AArch32.
>>>   
>>>> If the answer is no, then my next query is follows :-
>>> Answering to that anyway ...
>>>   
>>>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>>>> index 9ca74bc321..dea60aac0d 100644
>>>> --- a/xen/arch/arm/gic-v3-lpi.c
>>>> +++ b/xen/arch/arm/gic-v3-lpi.c
>>>> @@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>>>>         int rc;
>>>>
>>>>         /* We rely on the data structure being atomically accessible. */
>>>> -    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>>>> +    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uint64_t));
>>>>
>>>> "unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.
>>>>
>>>> Is it fine to change it as above ?
>>>>
>>>> Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-copy
>>>> atomicity".
>>>>
>>>> "LDRD and STRD accesses to 64-bit aligned locations are 64-bit
>>>> single-copy atomic as seen by translation table walks and accesses to
>>>> translation tables"
>>> This (and the explaining paragraph) indeed suggests that this should
>>> work architecturally, if you use normal system memory (where you would
>>> hold page tables). It would be confined to ARMv8 AArch32 and ARMv7 w/
>>> LPAE, which matches Xen's requirements.
>> Does it mean that ldrd/strd will not work atomically on AArch32-v8R as
>> it uses MPU (not MMU, so no page tables) ?
> No, this mentioning of page tables is more an example or a rationale, than
> a requirement.
> What this means (in the ARMv7-A/ARMv8-A AArch32 context) it:
> Because on v7A-LPAE and v8-AArch32 PTEs are 64 bits wide, it's too painful
> to use explicit locking to make sure just writing one PTE is atomic. So
> the architecture demands that 64-bit aligned accesses using ldrd/strd
> are single-copy atomic, so software can update just one PTE easily. But
> this is only required for locations where page tables typically reside, so
> system memory. This avoids this 64-bit atomicity requirement for *every*
> part of the system, for instance separate buses, SRAM or flash on smaller
> buses, or MMIO in general.
>
> I don't find anything in the v8-R32 supplement that would step back from
> this requirement, although indeed the original reason (atomic PTE writes)
> would not apply to v8-R32. Both the LDRD/STRD description and the section
> listing differences in the system memory architecture do not mention
> anything, so I'd say that the ldrd atomicity requirement still holds.
>
> Please note that this only applies to ARMv7 *LPAE* systems, but Xen
> requires LPAE, and R52 is v8, so we are good, and the Xen code can rely on
> this.
>
> So for Xen on ARMv8-R32:
> *LDRD/STRD* accesses to *64-bit aligned* addresses in *RAM* would be
> atomic. You need to satisfy all three requirements:
> - You must use ldrd/strd. Just dereferencing a uint64_t pointer in C does
> not guarantee that, but read_atomic()/write_atomic() does.
> - It must be 64-bit aligned. Shouldn't be a problem if the data type is
> 64 bits wide. Please note the slight nastiness that ldrd would silently
> work on non-aligned addresses, but would lose the atomicity guarantee.
> ldrexd would always fault if the address is not aligned.
> We might want to check the alignment of data we access (assert?), if not
> done already.
> - It must be in system RAM, so not MMIO. Also I think TCM might be a
> different story, but I would hope Xen would not use that directly.
>
Many thanks for the nice explanation.

I am trying to compare this with the atomicity requirement for AArch64 
(ARM DDI 0487G.b ID072021, B2.2.1 Requirements for single-copy atomicit )

I seethat the alignment requirement is the same as for ARMv8-R32.

"-A read that is generated by a load instruction that loads a single 
general-purpose register and is aligned to the size of the read in the 
instruction is single-copy atomic.

-A write that is generated by a store instruction that stores a single 
general-purpose register and is aligned to the size of the write in the 
instruction is single-copy atomic"

I think the following code change should help us to confirm the correct 
behavior of atomic read/write on both AArch64 and AArch32 (including R52).

diff --git a/xen/arch/arm/include/asm/atomic.h 
b/xen/arch/arm/include/asm/atomic.h
index ac2798d095..f22c65a853 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const 
volatile void *p,
                                             void *res,
                                             unsigned int size)
  {
+    ASSERT(IS_ALIGNED((unsigned long)p, size));
      switch ( size )
      {
      case 1:
@@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile 
void *p,
                                              void *val,
                                              unsigned int size)
  {
+    ASSERT(IS_ALIGNED((unsigned long)p, size));
      switch ( size )
      {
      case 1:

Please let me know if I misunderstand something.

- Ayan

>> If so, then is using ldrexd/strexd the solution for this ?
> As mentioned above, you would not need that, just
> read_atomic()/write_atomic() would do.
>
> Hope that clears that up.
>
> Cheers,
> Andre
>
> P.S. This above is my reading of the ARM ARM and the R32 supplement. I can
> double check with the architects, but this might take a while.
>
>> IIUC "Memory accesses caused by LDREXD and STREXD instructions to
>> doubleword-aligned locations.", then the answer seems yes.
>>
>> - Ayan
>>
>>> But it's only atomic if you are using ldrd/strd, which you cannot know for
>>> sure in C, because it's up to the compiler to generate the instructions.
>>>
>>> This is why we have that test. Changing the unsigned long to uint64_t
>>> would make the check pointless, since the data structure is 64-bits long,
>>> so it would always be true.
>>>
>>> So given that you don't seem to need it, right now, it would leave the
>>> test alone.
>>>
>>> If you need that on AArch32 anyway, you would need to replace accesses to
>>> the host_lpis array with inline assembly accessors, to ensure ldrd/strd
>>> instructions. This seems doable (there are only so many places which
>>> directly access the array members), but would need a good use case.
>>>
>>> Cheers,
>>> Andre
>>>   
>>>> Does this imply that atomicity will be retained (with the above change)
>>>> ? Os will this require ldrexd/strexd as R52 supports MPU (not MMU, so
>>>> translation tables are irrelevant).
>>>> Kind regards,
>>>> Ayan
>>>>   

