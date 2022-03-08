Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E04D162A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 12:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286742.486375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXvW-0005WD-Ff; Tue, 08 Mar 2022 11:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286742.486375; Tue, 08 Mar 2022 11:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXvW-0005Ta-Cg; Tue, 08 Mar 2022 11:22:50 +0000
Received: by outflank-mailman (input) for mailman id 286742;
 Tue, 08 Mar 2022 11:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT2b=TT=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nRXvV-0005TU-9o
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 11:22:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1432089f-9ed2-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 12:22:47 +0100 (CET)
Received: from BN6PR18CA0001.namprd18.prod.outlook.com (2603:10b6:404:121::11)
 by DM6PR02MB4796.namprd02.prod.outlook.com (2603:10b6:5:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.21; Tue, 8 Mar
 2022 11:22:42 +0000
Received: from BN1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::66) by BN6PR18CA0001.outlook.office365.com
 (2603:10b6:404:121::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 11:22:42 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT031.mail.protection.outlook.com (10.13.2.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 11:22:42 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:22:41 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:22:41 +0000
Received: from [10.71.117.157] (port=49634)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nRXvM-0006PG-ME; Tue, 08 Mar 2022 11:22:41 +0000
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
X-Inumbo-ID: 1432089f-9ed2-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc6xk37uEor9YgrZEyg70cx4pkgBbP2SRYm+6bEHRRe3001PtMkgqxQzgM0NyNOds9v9qJPEY/roPLEZuO/E1Ww4s0DSTkrccVt1QqFLRPOKHpAlox2yqkWxAQ+UeCl7vag1m93aY3ovsa2iiO02QeSedYhvn8sNNYWjuptjiwpncKqxWLc5JIcrNmvM905HiR9jHoS6nuNWGgGC/elWdsJRuOEzvLrlWpp8N+XxOot14drkRivGSZi0rSxXHH0XfPsgaGCxtv52Mw14mR0fk59ABVS46Gadg8861yczD6FlI51FAEonVg/zkjEjkG4EUVGKn8iXK7hniIUfU+cogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hRnIZw6T6CCWhdlyDcyKcVFLC1+aj8uAQgeZr3sApg=;
 b=E71KEOnmWGPgBxMNEgqblXJKd5p51W2WDt2hExLIIjaVIsHFT3SnBt6n81WmiFC3iwwqFjsrReauPz8J47jjxXb3/rFP85lSrZZB0HWLtDJsiSKYgv9XoATy2wQd5OFUx+VcBDl+5xmDA8xey3dwibLOE0gPcc2O9ufzOsdRik1aTaks/iHUxpUu5yA77+w0WjpIEX+42LvQyckquao7H63/0AHy9jLc3tNcKQGvbHJjszCPEb3sTOXE9n1TIeStMuklvivjyP4HOKrqwr10U5VPm09wR/sTcIKqqmcW+NMOt0MMQGFe5eRk9GeYJSDm8PhZkJY996dmVNIFSACgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hRnIZw6T6CCWhdlyDcyKcVFLC1+aj8uAQgeZr3sApg=;
 b=XCVvG8PtsmTzJlcZpMfjGr8M100F5qM1aP4ZL/VnN2lziJv2cvmk2CjQyHuV3HfOLNnTe+NDXHV5udYMCiT5srWZIzyVUnPWo/gvd104v4lLb/a0J6q+Nf44EB3t3KJBp+dK9A4TdRwyWPODQWOKHlck+/aRFo9DW8yhf9zJwow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <b6e2a7eb-9d14-077d-c2d9-04528ffaa53a@xilinx.com>
Date: Tue, 8 Mar 2022 11:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-4-ayankuma@xilinx.com>
 <68acfbf0-f2c1-c52e-93a3-632f1286d90f@xen.org>
 <5d5b0fc1-6f47-dfc0-dca3-5d60483a6eae@xilinx.com>
 <3e9d5d0c-f68f-004e-06b7-c4f0452f1e64@xen.org>
 <124726df-eafe-014a-ea9a-f97e0921eccc@xilinx.com>
 <6c4e63e4-4f9f-68f4-5e4e-f69cf6567e1a@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <6c4e63e4-4f9f-68f4-5e4e-f69cf6567e1a@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba5d6456-b3bc-4c36-d445-08da00f5f626
X-MS-TrafficTypeDiagnostic: DM6PR02MB4796:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB47969632DB0C80C08CE7107CB2099@DM6PR02MB4796.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j08EfIzEIHdTs8Wo7dJ5865C59drW741L6ErsUDR5AtdSH4o5PPfeULsMIIR0XvEW2BrfittuqZoIx/s/tQnQK/faftmbYUQz+0fyKVPHg+U4WofjDIHO6TUZZjmntbM+IZxjim+zdATT9/tBFxiRUkuFHczUPdh3DEZjnJXsfP3m+z9ZER0AWvLDCo93tiidK5hOk8TwYtmhttXPIqgaRBNph09JNdng3ye/AU2Hc0f5VSWo9blhKXW0l0mzgHo+eOZ0FSKI41ywCzS/BYr7xbdLc6Kql/+2E2iZc5MUBot0qAM626oVjlRb/UObl639Ehvk6LsrfWYazGhjmdUNbG2KzUe9kG/Dy3wvEdBWnQ2bLOxe+/9RDD5kZeZbVDWuDW3B8ZvOov8CzdCHrmU5LKrDuinpzbTocJzYalhoC/DNfWgPZvlBxdbZ2YrPfGX9gMx3PsW9pzBWmHSZ2DlLJHncT8y5q3ctrVDX2tHxtu8tw2bpP3eijwdi3JXukTpvHj1nQfGPfbgtdjx21Kco86NBaB08rmUtThd52Fbo2liHR2hv3K4CnJWzhZPFNTqxsn7Oy7IVnQTE5L0GtYfjC9VTF4MHj8ycVUt/2zOsHA1FsuMorIzJLM/e4XbMe950cfrWF88V7qXkaVW75biyMbPl2OTn3DZlc65G181P/je74ezFXdAqKx8V5yjBJkfxhWI9uEhxb3oOHU7uAN+kSgExo3TUHsQVMISOS0sbaOEKDYQ3pECzyPC+kecbNHFbndyYEm/uO9ENq7r5aN/vFXYgx5UHQa2jMOR4ClGEZk=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(7636003)(36860700001)(356005)(31686004)(36756003)(53546011)(426003)(9786002)(83380400001)(5660300002)(7416002)(336012)(508600001)(31696002)(82310400004)(8936002)(110136005)(26005)(54906003)(40460700003)(186003)(2906002)(8676002)(47076005)(70206006)(316002)(2616005)(4326008)(70586007)(50156003)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 11:22:42.1511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5d6456-b3bc-4c36-d445-08da00f5f626
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4796

Hi Julien,

On 07/03/2022 23:59, Julien Grall wrote:
> Hi,
>
> On 07/03/2022 22:23, Ayan Kumar Halder wrote:
>>
>> On 07/03/2022 19:37, Julien Grall wrote:
>>>
>>>
>>> On 07/03/2022 14:27, Ayan Kumar Halder wrote:
>>>> Hi Julien,
>>>
>>> Hi Ayan,
>>
>> Hi Julien,
>>
>> I need a bit of clarification to understand this.
>>
>>>
>>>>
>>>> One clarification.
>>>>
>>>> On 04/03/2022 10:39, Julien Grall wrote:
>>>>> Hi Ayan,
>>>>>
>>>>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>>>>> If the abort was caused due to access to stage1 translation 
>>>>>> table, Xen
>>>>>> will assume that the stage1 translation table is in the non MMIO 
>>>>>> region.
>>>
>>> Reading this commit message again. I think you want to explain why 
>>> we want to do that because, from my understanding, this is 
>>> technically not forbidden by the Arm Arm.
>>>
>>> From the previous discussion, we want to do this because we can't 
>>> easily handle such fault on emulated region (we have no away to the 
>>> walker the value read).
>>
>> Sorry, Can you explain this a bit more ? Do you mean that if the page 
>> table is located in the emulated region, map_domain_page() (called 
>> from p2m_next_level()) will fail.
>
> For data abort with valid syndrome, you will have a register to write 
> back the value read. When the data abort has s1ptw == 1, AFAICT, we 
> have no information how to return the value.

Do you mean that for s1ptw, we get an intermediate physical address ?

     if ( hpfar_is_valid(xabt.s1ptw, fsc) )
         gpa = get_faulting_ipa(gva);

If the IPA corresponds to an emulated region, then Xen can read the 
emulated address, but can't return the value to the guest OS.

(I actually want to understand this very well).

>
>>
>> But for emulated region, shouldn't pages be already mapped for Xen to 
>> access them ?
>
> I am not sure which "pages" you are referring to here. The 
> implementation of emulated regions is left to the discretion of Xen. 
> This may be reading/writing to a buffer allocated by Xen or return a 
> fixed value.
>
>>
>>>
>>>>>> It will try to resolve the translation fault. If it succeeds, it 
>>>>>> will
>>>>>> return to the guest to retry the instruction. If not, then it means
>>>>>> that the table is in MMIO region which is not expected by Xen. Thus,
>>>>>> Xen will forward the abort to the guest.
>>>>>>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>>>>> ---
>>>>>>
>>>>>> Changelog :-
>>>>>>
>>>>>> v1..v8 - NA
>>>>>>
>>>>>> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: 
>>>>>> Support
>>>>>> instructions (for which ISS is not..." into a separate patch of 
>>>>>> its own.
>>>>>> The reason being this is an existing bug in the codebase.
>>>>>>
>>>>>>   xen/arch/arm/io.c    | 11 +++++++++++
>>>>>>   xen/arch/arm/traps.c | 12 +++++++++++-
>>>>>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>>>> index bea69ffb08..ebcb8ed548 100644
>>>>>> --- a/xen/arch/arm/io.c
>>>>>> +++ b/xen/arch/arm/io.c
>>>>>> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct 
>>>>>> cpu_user_regs *regs,
>>>>>>           return;
>>>>>>       }
>>>>>>   +    /*
>>>>>> +     * At this point, we know that the stage1 translation table 
>>>>>> is in the MMIO
>>>>>> +     * region. This is not expected by Xen and thus it forwards 
>>>>>> the abort to the
>>>>>
>>>>> We don't know that. We only know that there are no corresponding 
>>>>> valid mapping in the P2M. So the address may be part of an 
>>>>> emulated MMIO region or invalid.
>>>>>
>>>>> For both cases, we will want to send an abort.
>>>>>
>>>>> Furthermore, I would say "emulated MMIO region" rather than MMIO 
>>>>> region because the P2M can also contain MMIO mapping (we usually 
>>>>> call then "direct MMIO").
>>>>
>>>> Can I say MMIO region (to indicate both emulated and direct) ? The 
>>>> reason being the assumption that stage1 page tables cannot be in 
>>>> the MMIO region. And thus, when check_p2m() is invoked, we do not 
>>>> invoke try_map_mmio(gaddr_to_gfn(gpa).
>>>>
>>>> See this snippet :-
>>>>
>>>>              if ( xabt.s1ptw )
>>>>                  check_mmio_region = false;
>>>
>>> Thinking a bit more of this. I would actually drop this check. We 
>>> don't need to decode the instruction, so I don't think there are 
>>> much benefits here to restrict access for direct MMIO. Did I miss 
>>> anything?
>>>
>> Can Linux or any OS keep its page tables in the direct MMIO space ? 
>> If yes, then try_map_mmio() needs to be invoked to map the region, so 
>> that OS can access it. If not, then Xen needs to return abort because 
>> the OS may be behaving maliciously.
>
> I think what matters is whether the Arm Arm would or would not allow 
> it. From what I can tell there are no such restriction. So we would 
> need to be cautious to restrict it further than necessary.
>
>>
>> My understanding from previous discussion was that it does not make 
>> sense for linux or any OS to keep its page tables in any MMIO region 
>> (emulated or direct). Please correct me if mistaken.
>
> At the moment, none of the regions emulated by Xen could be used for 
> page-tables. I am also not sure how we should handle such access if 
> they arise. So it is more convenient to simply forbid them.
>
> Regarding direct MMIO, see above. Correct me if I am wrong, but it 
> should not be a problem for Xen to deal with them. So while I agree 
> this doesn't seem to make sense, the restriction seems unnecessary.

So the behavior will be :-

1. If the stage1 translation table is in the non MMIO region or 'direct 
mapped' MMIO region, then invoke p2m_resolve_translation_fault() and 
try_map_mmio() to resolve the fault. If it succeeds, then return to the 
guest to retry.

2. If the previous step fails and for any other scenario (ie stage1 
translation table is in emulated MMIO region or the address is invalid), 
return the abort to the guest.

- Ayan

>
> Cheers,
>

