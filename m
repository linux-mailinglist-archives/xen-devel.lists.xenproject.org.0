Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A046891E7B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 15:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699403.1092226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqDQe-0000lT-FP; Fri, 29 Mar 2024 14:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699403.1092226; Fri, 29 Mar 2024 14:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqDQe-0000j9-CT; Fri, 29 Mar 2024 14:42:00 +0000
Received: by outflank-mailman (input) for mailman id 699403;
 Fri, 29 Mar 2024 14:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U0gS=LD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rqDQd-0000j3-0v
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 14:41:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d2e9c00-edda-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 15:41:56 +0100 (CET)
Received: from SJ0PR13CA0230.namprd13.prod.outlook.com (2603:10b6:a03:2c1::25)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Fri, 29 Mar
 2024 14:41:52 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::e) by SJ0PR13CA0230.outlook.office365.com
 (2603:10b6:a03:2c1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33 via Frontend
 Transport; Fri, 29 Mar 2024 14:41:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 29 Mar 2024 14:41:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 29 Mar
 2024 09:41:51 -0500
Received: from [172.30.141.24] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 09:41:50 -0500
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
X-Inumbo-ID: 7d2e9c00-edda-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfhOe+xJhcQnVG2rofqwxy+xfGL4llUJqxSZ3Tw9OpQuINpE2CMQ+nsZhHLmwCw3DKJU1015BltT1yTC318kFaDL4o1B87t49/NEglYL0SmdmbB6rQfdBR/X7Li+h847lmi8simtC0SWpLCgbbnLIG3PJQgt9Vxs6v0eqnWZP6FLkTa2AOmjkTJnyqVdsI960MZdW4XsfdXoxsy+EUnN0xhp30d/Uhsw/GF30uoK4IYPNc6aFZ1CosfbAuBWlCkTfRWL7iCChHwxKfyuiISLXs3BnHq86DsLtNOMuu06eyGN33scPu6GIQyfOJNM4V/GGkyQh0trjpuK2e2T5rMAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vu6xrJyNtWjN2IpLDYgUlIrzINv61r/ruyOOPOcIvDM=;
 b=JlfGlhVRUlL9qDI+mD8yvmDUAXFV8nnqtEAmlWFlXxySP7raeVRTShL8Q6pfIjSMOUlLm8KmzugOqCF+LVll8VxGzh9O2s4ru+44Wx/PMQrKvZNzz4F62VTO/6xe5yt1f5+K0Wi3D622K0WcjA1+tJTpUuaCYc1VbUw1epQ6OILvtTQVrsBiLymRArS89XfrCnKjpAfQyWgp7yf7vsxqG31XuKfKWI+GbjgSLnY/sw5HjUinLms3p1HkaLsmMBAPpRAnZ/EzVsrvHx4RnlQSohT2FDspO38E1qhTmvQXWZel+ooiaJTz+YuFrNisTSV5YXFErUw4qTmgPBA94VUwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vu6xrJyNtWjN2IpLDYgUlIrzINv61r/ruyOOPOcIvDM=;
 b=T2iWXgJzVqHUVG7F2DYFlJp/iTyEz41LVdBHYZR4Sp1DUqfb+kmzUVInOpAb6gwbB2J7nkfbEM4UIS+QTbVMx05A2zBAjEVa+Af9/UhTcNmKDNnp2u5yvnqSDcKFhrCEZdvlRWjIDSSM+9BByFLbFhSx2n85x7uCWHmwKiU3qcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d6927896-0168-4620-b10a-8d6304b4d6eb@amd.com>
Date: Fri, 29 Mar 2024 10:41:50 -0400
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
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f2297a46-4d19-4b98-b986-e05ac9f7a2c5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: a852b752-06a8-4c25-fb55-08dc4ffe5f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AkcpgBUvtZnLMNDhrCGUBi7T3iBZu40YVOzAypPo7UbMpk7qveTgDOVUIZwwzHLbC/g3E49s36vQ1VrjAsedoNl4U3LOGhgpvDfd78sTQ2xYIPdpyaVtyeSgpHHh2IEdxj8MNCRUlhcmodsd0G3e1GaUINAKAsCTgyK3nFtJ4o3/i7QznU3i/ZHryK1bVojCKlwFLlx1/NLRBLx+7csWrygO4R22zrQVWazBprg/puRzmwxTaiDEH1GB1fizwGYDkfg0dQ2bOsJGIBgDJdSdlBjwyvnaaNKn2P49k6afsPKCYX+L0d4OheClK64Wk1GJD1tXIkGLGlGEU5PnpeiZeKZfnx5m6uqwvBgumeNZAxd8jH6y0k9sxUodoKzNzVBFNI+e4UYebd9TPOw61imMXxhoUIlF4St9orwRnzzzg71vaBlxz6+NTFuoL8lh71mSkTbjJNxYZpuoj8NcHfG0JJVS9wkTOkb4wv3DDrHoIsVUHKD08p6cBK5m/wKeHzUG39+1Lp3Xo8RzvPWJtKC5tE1JBqo+XvhhQ4yJ2VEzpjLTRTMamwqjahv2KfoC2+Ru+b2rb/7r8wBQEzX9hR9gbXrz20H0P5N+iBa9rpuriEc7iRPahTK7E3evIa/08s/KufO64Dpm1ICznRvaVyQ+0tfOAAFnaqU9l9VcXZH+yYyO+VITXimsPZg4+vZX6ukfILbFPtizcuBzvSIevQjwZ+joQdkocJd44DP0YxnqBMYA+VXGLWVY29pr8tX85iGE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 14:41:52.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a852b752-06a8-4c25-fb55-08dc4ffe5f82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196

On 2024-03-28 12:47, Jan Beulich wrote:
> On 27.03.2024 22:51, Jason Andryuk wrote:
>> --- a/xen/common/libelf/libelf-loader.c
>> +++ b/xen/common/libelf/libelf-loader.c
>> @@ -468,6 +468,7 @@ void elf_parse_binary(struct elf_binary *elf)
>>   {
>>       ELF_HANDLE_DECL(elf_phdr) phdr;
>>       uint64_t low = -1, high = 0, paddr, memsz;
>> +    uint64_t max_align = 0, palign;
>>       unsigned i, count;
>>   
>>       count = elf_phdr_count(elf);
>> @@ -481,17 +482,23 @@ void elf_parse_binary(struct elf_binary *elf)
>>               continue;
>>           paddr = elf_uval(elf, phdr, p_paddr);
>>           memsz = elf_uval(elf, phdr, p_memsz);
>> -        elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
>> -                paddr, memsz);
>> +        palign = elf_uval(elf, phdr, p_align);
>> +        elf_msg(elf,
>> +                "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 " palign=%#" PRIx64 "\n",
>> +                paddr, memsz, palign);
>>           if ( low > paddr )
>>               low = paddr;
>>           if ( high < paddr + memsz )
>>               high = paddr + memsz;
>> +        if ( max_align < palign )
>> +            max_align = palign;
>>       }
>>       elf->pstart = low;
>>       elf->pend = high;
>> -    elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
>> -            elf->pstart, elf->pend);
>> +    elf->palign = max_align;
>> +    elf_msg(elf,
>> +            "ELF: memory: %#" PRIx64 " -> %#" PRIx64 " align:%#" PRIx64 "\n",
>> +            elf->pstart, elf->pend, elf->palign);
>>   }
> 
> Hmm, it's just this final logging change which I'm a little concerned by:
> Having looked at Linux'es phdr, I noticed that the addresses there aren't
> necessarily matching the corresponding alignment. Therefore I'm a little
> concerned that the output here might raise questions when people see
> seemingly inconsistent values in the log. Could you/we at least make it
> read like e.g. "align (max): ..."?

max_align?

Looking at my test vmlinux, it looks like PHDR 0 (.text) and PHDR 1 
(.data) are aligned.  It's the PHDR 2 (.init) that isn't aligned.  Is 
that what you see?

This line is already printing the min and max across all the PHDRs, so 
it would only look confusing if the start didn't match the align.

I'm not sure how useful it is to print the alignment, and I considered 
not printing it.  It's only used with PVH Dom0 right now, so it's not 
relevant in most cases.

Regards,
Jason

