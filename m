Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AC66BA68
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478504.741748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLrP-0004yD-JK; Mon, 16 Jan 2023 09:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478504.741748; Mon, 16 Jan 2023 09:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLrP-0004vs-Ff; Mon, 16 Jan 2023 09:32:59 +0000
Received: by outflank-mailman (input) for mailman id 478504;
 Mon, 16 Jan 2023 09:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHLrN-0004om-Mv
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:32:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0b5ac5f-9580-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 10:32:55 +0100 (CET)
Received: from CY8PR02CA0003.namprd02.prod.outlook.com (2603:10b6:930:4d::10)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 09:32:51 +0000
Received: from CY4PEPF0000C971.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::b0) by CY8PR02CA0003.outlook.office365.com
 (2603:10b6:930:4d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 09:32:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C971.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 09:32:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 03:32:50 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 01:32:50 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 03:32:49 -0600
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
X-Inumbo-ID: c0b5ac5f-9580-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neuoSdM160/euMf3cVvHjikGBVguYeEEY+yUxJVEDvP4DSGzkrz9iXK8EGBVFj1IjTrGSJuCd777JsodxtSz9te5cYcogv82QbRW+pKQCQtN9bfYI9G4/kEawglJntZ0S+cDMyv6i+6OxXXlBIp3v7O4shUFlyqHzHmQj0SWPqP4FPF/MHrFL4BvvEL0LCE8Ds2azJVLA8V1tSFy8++WeKB6j7bO6ozPyshHj4QUFrtir5CWEBxmHduaCKaZRN9Ruw9Lr498phRLUK5Ud99fInUVahdpfa96jlngARnELSFxlCpSRDXBH4dmozhPjXXrNAZzhOaArqT8eS5BdKyz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5iUHhIwh/XODZGW3iDuo8D2KtzuRWXqk+c5VW3AA/c=;
 b=iBXV8yX8BnkxFYJ4RNDmSJ9Z/cZZyG3klFL81uSpUXztulPEO2mOegAZ1qYXdxWDr4L5bl+gmUklmvvhpJAr4r58BRs8YnsKY0aqjMPW73yvWM9Zj+lYRegCW0iTa8+LBDuDXsmUvW0U0VJdAYD+9oqOSvLaSh29bQ1wPbNDCgzUzZ3VOhVVeoxRewVKD9W6oCng/nPJv7wz1B+NRDlLsQxgOHu9lz/NsURqdXE8Om5/d87Ul43zr3y3U2Y7yTtJiE/mKGW9imWtdcBBhFXuajxSGDFD2IkyemMHnWxXm9lU2Q46xK/lKBXLqaMf6lVccoifp/ijp+tJsoPXzOJtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5iUHhIwh/XODZGW3iDuo8D2KtzuRWXqk+c5VW3AA/c=;
 b=SFq+lM0EETzRJSLyxylijj5r56A2M/Ip+yewqRuNLVSYAsjH0f5Ok80sBrN+0ppn6JCz25r+ht9GZiD7h1wGnTlilY6Rk/69UBJfW/DiBOg+zf15ETs1D6dzqikC2HibKFG8821EmShDSJ5KiAC80w0zJzY+cEsq/SdR3xdbJkw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <91c6614a-1168-8017-ffae-75984eff2dd9@amd.com>
Date: Mon, 16 Jan 2023 10:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 09/14] xen/arm32: head: Remove restriction where to
 load Xen
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-10-julien@xen.org>
 <36a8cb2d-0bea-cdc3-5311-c743f60763d5@amd.com>
 <cb8a09fd-6174-f747-1fc1-1ab472eecdfd@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <cb8a09fd-6174-f747-1fc1-1ab472eecdfd@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C971:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: c550bbc3-c2ff-4efa-264c-08daf7a4a34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/sYpNrMRbVaLlkbEe1t+iz2dfemWDTg0/vhZEVX6Sq5Nygnrl/ekT366SBnON4ZRTdqXUXs5E4//AtuT991qMgMdreeV3Pti9VCrmqRrwpD9+8KOVAza4xdDdYqAEYp+dREhkyMtSlx87kcrdU04AZjtr3ABZ4IMAatehibu20PJDJbG5HTssk5MZgNsuoPcSc346ipRA+vJrLZP4+FlaiU042Cq2+1iA0txff3aJZ1HtE88qnA7zl/SLCepNCJyiNhrj2LuJbB7NytrfbDDPOVlVo5046/SLwhjviVlcJJ5HlIXrotu0dDuIyymqUsA55/8wrCP8DkXNMGcTe3c2FX3atmBbwLsaouJakXhzocS80X6+UAEOtjJIPZ/wFZRTe8LyzEQeKar5+7tBrzSFC0E7pcXg84td5TKA3ToR6BJI6N/0CD35Suz/Z804b2M3/7xRZjWSyCSlI+gpcjI9qRyRgv9oxVoeVwqpxoMlb5YgA4U/G+jM3MxfKN/DEFZAV39Yj4YZsQ0Scr8blu+XjizZa/JZ6W3nAGf7EuH30vm08JlEQzjviiYhFEOYrCxWSiPNJHt21t3eVkBPV70LM3IN1209fEbshRNbDY3aFMbcHcUnmn4tZYm1ogsrHdF+Jurj2OTAKoYWB2VWDJCukylsiX25SFEao7/FlPp98GByoWNU3llfbY/HSvYcNOT11ZGbNbGc8DpJLx7x0jc0cjbRnPpH43x338uQAaAtT6WYE5bzQBeOSlmuK+DksmRXSdwaXBlqot/DDhYzAhHwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(41300700001)(70206006)(426003)(2616005)(47076005)(70586007)(186003)(26005)(4326008)(8676002)(36756003)(82310400005)(53546011)(86362001)(336012)(5660300002)(36860700001)(82740400003)(8936002)(54906003)(478600001)(110136005)(31696002)(40480700001)(16576012)(316002)(356005)(2906002)(81166007)(40460700003)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 09:32:51.1495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c550bbc3-c2ff-4efa-264c-08daf7a4a34a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069



On 16/01/2023 09:55, Julien Grall wrote:
> 
> 
> On 16/01/2023 08:14, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Luca,
> 
>> On 13/01/2023 11:11, Julien Grall wrote:
>>> +/*
>>> + * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
>>> + *
>>> + * Clobbers r0 - r1
>>> + */
>>> +remove_temporary_mapping:
>>> +        /* r2:r3 := invalid page-table entry */
>>> +        mov   r2, #0
>>> +        mov   r3, #0
>>> +
>>> +        adr_l r0, boot_pgtable
>>> +        mov_w r1, TEMPORARY_XEN_VIRT_START
>>> +        get_table_slot r1, r1, 1     /* r1 := first slot */
>> Can't we just use TEMPORARY_AREA_FIRST_SLOT?
> 
> IMHO, it would make the code a bit more difficult to read because the
> connection between TEMPORARY_XEN_VIRT_START and
> TEMPORARY_AREA_FIRST_SLOT is not totally obvious.
> 
> So I would rather prefer if this stays like that.
> 
>>
>>> +        lsl   r1, r1, #3             /* r1 := first slot offset */
>>> +        strd  r2, r3, [r0, r1]
>>> +
>>> +        flush_xen_tlb_local r0
>>> +
>>> +        mov  pc, lr
>>> +ENDPROC(remove_temporary_mapping)
>>> +
>>>   /*
>>>    * Map the UART in the fixmap (when earlyprintk is used) and hook the
>>>    * fixmap table in the page tables.
>>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>>> index 87851e677701..6c1b762e976d 100644
>>> --- a/xen/arch/arm/include/asm/config.h
>>> +++ b/xen/arch/arm/include/asm/config.h
>>> @@ -148,6 +148,20 @@
>>>   /* Number of domheap pagetable pages required at the second level (2MB mappings) */
>>>   #define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>>>
>>> +/*
>>> + * The temporary area is overlapping with the domheap area. This may
>>> + * be used to create an alias of the first slot containing Xen mappings
>>> + * when turning on/off the MMU.
>>> + */
>>> +#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
>>> +
>>> +/* Calculate the address in the temporary area */
>>> +#define TEMPORARY_AREA_ADDR(addr)                           \
>>> +     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
>>> +      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
>> XEN_PT_LEVEL_{MASK/SHIFT} should be used when we do not know the level upfront.
>> Otherwise, no need for opencoding and you should use FIRST_MASK and FIRST_SHIFT.
> 
> We discussed in the past to phase out the use of FIRST_MASK, FIRST_SHIFT
> because the name is too generic. So for new code, we should use
> XEN_PT_LEVEL_{MASK/SHIFT}.
In that case:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

