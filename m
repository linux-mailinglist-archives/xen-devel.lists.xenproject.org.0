Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570F7F5F98
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639714.997373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69Gu-0002Dc-On; Thu, 23 Nov 2023 12:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639714.997373; Thu, 23 Nov 2023 12:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69Gu-0002Ai-Ln; Thu, 23 Nov 2023 12:57:32 +0000
Received: by outflank-mailman (input) for mailman id 639714;
 Thu, 23 Nov 2023 12:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fHbn=HE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r69Gs-00029R-Gw
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:57:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da62fb7a-89ff-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 13:57:27 +0100 (CET)
Received: from SJ0PR05CA0184.namprd05.prod.outlook.com (2603:10b6:a03:330::9)
 by CH0PR12MB5386.namprd12.prod.outlook.com (2603:10b6:610:d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 12:57:24 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::3e) by SJ0PR05CA0184.outlook.office365.com
 (2603:10b6:a03:330::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14 via Frontend
 Transport; Thu, 23 Nov 2023 12:57:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023 12:57:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 23 Nov
 2023 06:57:22 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 23 Nov 2023 06:57:21 -0600
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
X-Inumbo-ID: da62fb7a-89ff-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI+CIZVOJ7SPtesLjDX5FOcjwe5cBeqHwzRUr8O8nIjPUafcChBuQW8fyv//fIbQ8bE+BQxSY/hmeaEnOXY3Hes9ElzQVyVVDnIwCEamMkn8ih9CUTVEXYcw+3DZs3frdXKamndheWkBhkeRfcSp/8c+Ba32xWsPNBncARfM37ck8RYez7aaccuak4rtdgwDoZY16fB76JOP+VtXcQgflStJjdorg45JxRKdJDOj2l99aFMHT3pMsh6hdq+dUHN7cjERxX9oglH6PFIcmAkRLPQF+vpUxXSPbgBaCSqlI1fE2BB/qWvhOMEWXV+2icO0dh0/LDxebyZ7isqALVn8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFMKOYpWh97J33kiNDv1TLuF8rDGTo7G3bOUBlPBr70=;
 b=CbYPYrHj5AAySXlYZ48arjjvQMniaWuO1EQ1c+B6W+b8siVuweTQyirEUtKZS01VTSt8vIwDbbwwFxcj0vARQ374jnAk7athL3idzVJuYZ3xTCOidFEFDDuTshBlStQfS8GsK01HdxEJszaVT8MRzTHjIHUwSJp4e9TdFJE/MsOQ+IVTWXiKDknOAl2Pd6cf23SkmSnW5EnV3xH3n1eHlNOlKnwxf5NVVCEzgYhtgJPgZYiYRaE+JCix/FSYeNQqmfjUL4nSzcBsTPVR+xX3faqOVd5wZ5xkAqugiu/J3JB68MQZ9uPfI90T99vQSwQ3g/jXQ/HFaaUSr50+FFYnww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFMKOYpWh97J33kiNDv1TLuF8rDGTo7G3bOUBlPBr70=;
 b=ZZB7knsZn/HrgAONuMa4ri6WZIC/ZvqgwNH3UPkQIbRwlxhhmeN+sjRoWG2F8TR9llEap+xeSTI6mtOAM9H6f9DB6CR0Nvy/v/Vj8jQj7JgACF0zN2o3itMncxq5gzKiEH6mDh2/S3J0XHKRlRS/Za3gByPptLto/FGLZxn/Urs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <193af77c-9176-44e6-bc29-073a6a2d2b12@amd.com>
Date: Thu, 23 Nov 2023 07:57:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
 <a28239cd-e94e-4e0e-b415-a7ae32befd40@amd.com> <ZV8J7CoFJyN9a5GO@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZV8J7CoFJyN9a5GO@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|CH0PR12MB5386:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6a251f-7807-42e4-b2c9-08dbec23bce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2v/4YFilu/0CxnkQusl/xYkFIEEWar8qz7VWZnUXrxWnd1vpBdBXgNKgSb2v5fqMkgt+x2fsf5nk0eD9vK3PK3+vKKMhTiQtcQcrqMsBjymjs0jFdLXXZKD/rte283AGGNG4Su6xQU4SMPvL11pa/DbicmY61N6OsYh/ng2gWV3hn/9rJfAhqI4nR8pqbVHjWxDjPPSBWv4tSzNYfjWHeey7on741EDjdqv+88s+d8MGXDxlIUGdlA+Mme/4sGeTpDoGbIYL64IWVTslW5dUWORLIZRlQkexLS6h2cPrVPguKm64UtUTzJPPbMHbg6dOYJOPwSdEuPu7zSgq5kDwzhmAZccVvcQhK2AZaZEKW9lntS8QqiEszAHHg3q6JQE/p++CfAxmjY0FyztmVNVh70703OqQd3JEOlszmbKOUbay9h1SxYf7aNY6ezMgGGhq6jpIjbjtIA9kH4uns3wkYkCMoWJGUulGHF/cXqN7CyqU8jpB8HZry4WX2RtXCH38OkY9FHBkE7cy0j2E1/lj8u/EbpV22jIme4ccfdgMDtY+heRpn6mjaCZIVh6mBQk5qxlEgkYUpVpuQkuNCgzxoDDaV5/JK1lNJe+1QfPgm8OTQn+5XAj5n3AN1p0WbKFD8AjvmwmyvR/gGeD4EuHbGUZOLUPndbHwrkmCtdS59YlPKfBfDc2CQncfI+XhB9AidiPJn2eX+W5gM3v/qxOsPZDnrxdVaqCjInfihtH4VTtP4fllNz6rUjFz1xjzdBAz05ybEWEJQizpWIHpJOaHtTlllBCrc+52epe0fbz/ku0bnxE+pIcdvSKBnAr9/cIk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(5660300002)(2906002)(8676002)(8936002)(54906003)(6916009)(16576012)(4326008)(316002)(70586007)(70206006)(40480700001)(41300700001)(478600001)(53546011)(31686004)(44832011)(26005)(2616005)(336012)(426003)(83380400001)(40460700003)(36860700001)(47076005)(82740400003)(81166007)(356005)(86362001)(36756003)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 12:57:23.8831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6a251f-7807-42e4-b2c9-08dbec23bce5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5386

On 11/23/23 03:14, Roger Pau Monné wrote:
> On Wed, Nov 22, 2023 at 03:16:29PM -0500, Stewart Hildebrand wrote:
>> On 11/17/23 07:40, Roger Pau Monné wrote:
>>> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>>>>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
>>>>               r->private);
>>>>  }
>>>> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
>>>> index 84b18736a85d..b72131729db6 100644
>>>> --- a/xen/include/xen/pci_regs.h
>>>> +++ b/xen/include/xen/pci_regs.h
>>>> @@ -66,6 +66,15 @@
>>>>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
>>>>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
>>>>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
>>>> +#define  PCI_STATUS_RSVDZ_MASK		0x0006
>>>
>>> In my copy of the PCIe 6 spec bit 6 is also RsvdZ, so the mask should
>>> be 0x46.
>>
>> Right, mine too. It's probably safer to follow the newer version of the spec, so I'll make the change. For completeness / archaeology purposes, I just want to document some relevant data points here.
>>
>> In PCIe 4 spec, it says this about bit 6:
>> "These bits were used in previous versions of the programming model. Careful consideration should be given to any attempt to repurpose them."
>>
>> Going further back, PCI (old school PCI, not Express) spec 3.0 says this about bit 6:
>> "This bit is reserved. *"
>> "* In Revision 2.1 of this specification, this bit was used to indicate whether or not a device supported User Definable Features."
>>
>> Just above in our pci_regs.h (and equally in Linux include/uapi/linux/pci_regs.h) we have this definition for bit 6:
>> #define  PCI_STATUS_UDF         0x40    /* Support User Definable Features [obsolete] */
>>
>> Qemu hw/xen/xen_pt_config_init.c treats bit 6 as RO:
>>         .ro_mask    = 0x06F8,
> 
> Right, given the implementation of ro_mask that would likely be fine.
> Reading unconditionally as 0 while preserving the value on writes
> seems the safest option.

That would mean treating bit 6 as RsvdP, even though the PCIe 6 spec says RsvdZ. I just want to confirm this is indeed the intent since we both said RsvdZ just a moment ago? If so, I would add a comment since it's deviating from spec. I would personally still vote in favor of following PCIe 6 spec (RsvdZ).

