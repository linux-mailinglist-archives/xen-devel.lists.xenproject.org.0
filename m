Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386689896F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700901.1094694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNeP-0006Eb-Il; Thu, 04 Apr 2024 14:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700901.1094694; Thu, 04 Apr 2024 14:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNeP-0006BX-FJ; Thu, 04 Apr 2024 14:01:09 +0000
Received: by outflank-mailman (input) for mailman id 700901;
 Thu, 04 Apr 2024 14:01:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsNeN-00069B-AM
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:01:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c58469a8-f28b-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 16:01:03 +0200 (CEST)
Received: from SJ0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:2c0::22)
 by DS0PR12MB9059.namprd12.prod.outlook.com (2603:10b6:8:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 14:00:57 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::44) by SJ0PR13CA0017.outlook.office365.com
 (2603:10b6:a03:2c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 14:00:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 14:00:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 09:00:43 -0500
Received: from [172.21.219.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 09:00:43 -0500
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
X-Inumbo-ID: c58469a8-f28b-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDGMt7TZGL5w/HZ+v8hxB3Iq0m4NpzrxRxqYjfemMw46aLixY9dBecDni0IMjTONjZdnAribu3+yCsJ2/cKswq2poxayKrTFEfODf0cZPUcQBpou+CG7Sm2wo20CyOVosG/Deo4GBFMZE45wnXJnMG8AVzuB+Lspuh6/rsaTKM6q5V1Ehx0vjdjrxdblWnpmdcL8LDjGfrJha3b01xUiRUpU7rTZSLZc2TyiideUJQTFhncMUp6HHbIs8Jjsiq9KXLzoYZc2J/jfIuhl6TR1wl9VV+ximacc20l1fpJ04nLR5D4Z47CRlwJbr1s/5PeMFDgtTEWbR1tOOGjTDuJkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZrWXJ1j1Uye9ZGLqFk/CoECrbaXk4WHM0+dZWcPihs=;
 b=nD4ked0YrT0IraPgQbJ5PhBGvlpQ0YV+sXZUZDAue2KuLyPU54RWWbT9cx2inyXPXHpp/WpcQywIAQkq88JYQ5HIp4YCSk7lHE9yRpCbPBjNAB/8nt96UAgtHK75+B3k1kU3HLOLRY+HG7eQmWZOMISGtlFx30dMeUaa1KgXBBuRlrwphrmZSYEFvmAqjXwNn5CxkXO3J7xJZ4exNpyA9KiGO9gVZKk1HZPaoqVTrTuXZP3ie3mhIRSTCOpn1flvCQ0rz2RUWxT6N48yeZDHX6JjtILxuoq6PU61x2FSQjyzRPE1XOImly3U4IHyXv4Qc7D4bMyK7/5DfsGALLQASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZrWXJ1j1Uye9ZGLqFk/CoECrbaXk4WHM0+dZWcPihs=;
 b=1jkf82RsjbP5hsR7YlStvoFRxc/pS1vzlbFKN632DcAou6VOoLei0hMkftP+ZxDYyySSJ++nfKHb8mVm16BInfdfPgcgozsHsXSmo3JcFITrL8gsPONyTdfv8e/M1kKRsvgfAcieyXSupQOxYN1YzD3G0f3ONle7F+hEx60bGhA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a94eae99-1101-4a4a-982e-0565f61fecc8@amd.com>
Date: Thu, 4 Apr 2024 10:00:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] libelf: Store maximum PHDR p_align
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-4-jason.andryuk@amd.com>
 <f2297a46-4d19-4b98-b986-e05ac9f7a2c5@suse.com>
 <d6927896-0168-4620-b10a-8d6304b4d6eb@amd.com>
 <514380b9-d7ba-466b-b992-28bb1953a6ae@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <514380b9-d7ba-466b-b992-28bb1953a6ae@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DS0PR12MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 635199fe-d73e-4c85-d80e-08dc54afa6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oLi0Z6RzJJzApslpwzns1fePpbD7/JKUWQ4ZobD4zfGD4I32NvjpEgo/pu/9dxleDcGu+WwnHGxkg3egVHT43/Z4h3ZCP17F6wvJRwxCBUv7WUJfR0rzjsku7yMgjb+93so85IsryF2wNxTt+T4II4YmQU2SUFvNe+knEBzc+2AkVRHpLS3zWMQ2FtlZmsu6c7tjH7N7GYy5hxZyTq5MgLdu0JwD6GnaL7GfKSRvJMr9srJXScy0z0yvY7rMnK4CmepUaTjc2qn3hbeJQqyn84DH64/YMTcrfKdGB4PB18eph8CFXLk/7JVlqNWxK+sh2XoOT8kS86YxSgNoKPwnbwseXVNHVzcUZyZdM2pLEGeJYCN0AdvyLEUUq1i6m2Qpx4VHLFqsEatl6/NEapPqNOc/++RVdq+mG0pC08LIr5+HAQThw0FonqQLJkYXXTvf37Ipzq2o9hh8GRM5TcTfhP27+LZZTdnDj1z31J2PBp+/WSvKPtpnlyxMflEHWY4vzUChbnDh05EQhl7IOPstay6JoVjzgizoOZBpiWpM6ekNIPS3FdMTt4mq4b+ItGNfIGeMTpgD64g72sIguC2Grpi/SCcrlaXWzdOvuNFk9wrDy/Sud4tLvIK9KHs4heTNMbpCt0U97F5KBgVL+PpESk0I9Q33RQ/Ig1B1XWSkLsKVoUjXKGgEmwxad5/rXLhP0ybbGwcTVp+vO6gEAhkABagX8rZZV9eH3iS4o9jSp3GRpska5/6fcmFlEptRWV78
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 14:00:57.4603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 635199fe-d73e-4c85-d80e-08dc54afa6f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9059

On 2024-04-02 02:44, Jan Beulich wrote:
> On 29.03.2024 15:41, Jason Andryuk wrote:
>> On 2024-03-28 12:47, Jan Beulich wrote:
>>> On 27.03.2024 22:51, Jason Andryuk wrote:
>>>> --- a/xen/common/libelf/libelf-loader.c
>>>> +++ b/xen/common/libelf/libelf-loader.c
>>>> @@ -468,6 +468,7 @@ void elf_parse_binary(struct elf_binary *elf)
>>>>    {
>>>>        ELF_HANDLE_DECL(elf_phdr) phdr;
>>>>        uint64_t low = -1, high = 0, paddr, memsz;
>>>> +    uint64_t max_align = 0, palign;
>>>>        unsigned i, count;
>>>>    
>>>>        count = elf_phdr_count(elf);
>>>> @@ -481,17 +482,23 @@ void elf_parse_binary(struct elf_binary *elf)
>>>>                continue;
>>>>            paddr = elf_uval(elf, phdr, p_paddr);
>>>>            memsz = elf_uval(elf, phdr, p_memsz);
>>>> -        elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
>>>> -                paddr, memsz);
>>>> +        palign = elf_uval(elf, phdr, p_align);
>>>> +        elf_msg(elf,
>>>> +                "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 " palign=%#" PRIx64 "\n",
>>>> +                paddr, memsz, palign);
>>>>            if ( low > paddr )
>>>>                low = paddr;
>>>>            if ( high < paddr + memsz )
>>>>                high = paddr + memsz;
>>>> +        if ( max_align < palign )
>>>> +            max_align = palign;
>>>>        }
>>>>        elf->pstart = low;
>>>>        elf->pend = high;
>>>> -    elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
>>>> -            elf->pstart, elf->pend);
>>>> +    elf->palign = max_align;
>>>> +    elf_msg(elf,
>>>> +            "ELF: memory: %#" PRIx64 " -> %#" PRIx64 " align:%#" PRIx64 "\n",
>>>> +            elf->pstart, elf->pend, elf->palign);
>>>>    }
>>>
>>> Hmm, it's just this final logging change which I'm a little concerned by:
>>> Having looked at Linux'es phdr, I noticed that the addresses there aren't
>>> necessarily matching the corresponding alignment. Therefore I'm a little
>>> concerned that the output here might raise questions when people see
>>> seemingly inconsistent values in the log. Could you/we at least make it
>>> read like e.g. "align (max): ..."?
>>
>> max_align?
>>
>> Looking at my test vmlinux, it looks like PHDR 0 (.text) and PHDR 1
>> (.data) are aligned.  It's the PHDR 2 (.init) that isn't aligned.  Is
>> that what you see?
>>
>> This line is already printing the min and max across all the PHDRs, so
>> it would only look confusing if the start didn't match the align.
>>
>> I'm not sure how useful it is to print the alignment, and I considered
>> not printing it.  It's only used with PVH Dom0 right now, so it's not
>> relevant in most cases.
> 
> Well, yes, not printing the alignment would be fine with me. I just didn't
> suggest that as an alternative since I was assuming you put its printing
> there for a reason.

I added it to make the information available, which might be useful if 
there was a problem finding a load location.  Since it's usually not 
useful information, I'll just drop it.

Thanks,
Jason

