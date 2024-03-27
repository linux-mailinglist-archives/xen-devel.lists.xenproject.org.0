Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FDA88E4F7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698574.1090421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpU44-0006gU-Cb; Wed, 27 Mar 2024 14:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698574.1090421; Wed, 27 Mar 2024 14:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpU44-0006ea-9c; Wed, 27 Mar 2024 14:15:40 +0000
Received: by outflank-mailman (input) for mailman id 698574;
 Wed, 27 Mar 2024 14:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpU43-0006eU-BD
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:15:39 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7af123f7-ec44-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 15:15:37 +0100 (CET)
Received: from MN2PR15CA0063.namprd15.prod.outlook.com (2603:10b6:208:237::32)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 14:15:33 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:237:cafe::b) by MN2PR15CA0063.outlook.office365.com
 (2603:10b6:208:237::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 14:15:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 14:15:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 09:15:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 07:15:32 -0700
Received: from [172.31.131.34] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 09:15:32 -0500
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
X-Inumbo-ID: 7af123f7-ec44-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3hJKTK3tGj6cc5mFgSXtn5x8O7HgCpvIYr0wHnSDxIeDhHhBkHmDf5qFInAOtAAReLnpLJF2Ua8fMD1RZWNSTkydXpU8njFzpcQ/BKHAip2kotKYDV+xqW56jm4y+2c0EB0efqvmdgIMazR5CwpcphGzuWOzzTk9dPJa+TOJonR3Sj/Q9O7m5JV5Jiy+fl5MeWXFCn4AcVnDnOBxi9ykHEa9L6dj9l8hXb4TBVh1mE5H5bGB8EAk6aExuajFVnZbjykEEvDHnqgnWU7Z1RajdupQOuWvoK+KB6BaV+DQ5n8N1RMIxxzclk2p91yQ/8C1sZ1au3wqmnnMtbULCXj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNHdxsz/A+O0scydcjNzdJegkiK444ynTZTaIymkn3k=;
 b=Jmi1P5Hxs0cWCqkkrKCQx5W/NIZiZLvZaEXgP2u+KZJ8ni93Ga43SCemFRhRpppANANRT7F5/PkgUD5F6A8FDs85t4Dr25Qbw5aS4ht3m1adKawwsH6zWnu9Gi3ZEFE1gOLfPKaLDLfrAbTdWX+dkgdE0yLhhkBmUPYSRlYJfWyjHuY2YEDYnvUkXVGmKbbBAblj9l6YRo7Xlf98pICz+n9qrVdAKOdQKqe6TaOgNyjnkilfxTkN2DNCf8mrYktbcMk5kqOjIanlCDsvXfkXCUfJ4Q6yIXBjhqSr/4NHRkwsYH0mVIOf/GNbKWMohj3mNAwXcieDSzz29OvaBj6oqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNHdxsz/A+O0scydcjNzdJegkiK444ynTZTaIymkn3k=;
 b=gmaL8anfJkKhLdS+foO4Ptfd5T9xkhmhNj1XoVghN+NIsU8FuiCu8/SXGWERfk06s4uOAlb++2g2tOe0cokGR575QFHmvZDBfXvn71ba8IS6AFhhu4P6VeXwA4rXIf6NjvT8VRNZ2KKfv+V98t3rSyO+tiDzWfnbWCi+eJ74sGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <67cf20aa-a55a-496c-b3cc-bf5317ba98be@amd.com>
Date: Wed, 27 Mar 2024 10:15:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] RFC: x86/pvh: Make Xen PVH entrypoint PIC for x86-64
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326214701.7015-1-jason.andryuk@amd.com>
 <45c20ffd-f0c0-4521-8221-c3384cd5f7c5@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <45c20ffd-f0c0-4521-8221-c3384cd5f7c5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d70ed1-16ab-4054-45cb-08dc4e685d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hUXtLG5KV5a4ArveoAGN6eevzF3zc2OzBObBl4F83lcGVjU8OSF1freR046Hql/GPsKTty/yUIo17unnNgaXno/uF0YEPNcSZJToDERTPFREmQzr+tmSlhfm+KrqyXqSsbXqxFI1dUrZSKQa2k32KJEB3r8W7BjNdDPoIW4GlEfCTk9aRbbqOzZ4PwYSJtLFNHe25ODsRkA8O1u01UPiD9oyzik+wnf5OGI2pKxNYauJss5W/nwDjsp3i0Y58rNQDXIhXFuDaWF6qJj22gyr1OEPMnRW5ZMSiQB6GcnTjsTtOmqLBZcquE6S3ZmSsI+1kzqWAK2Zjt0Q9JQCwoXcE0IugwvFP9fVTUNLk9zFZ7xuB1jRN+dyZgO3mnLvb38iDSY3O5UU7SUbrn2T4Ga/PH4slg5U0/e7rF4bTPa2+8YZ+oZP1eQbnztQfZuemkWOQKrHfXiL1NM/+t+omySYpn9ZXeSV73zr9Eavh5uimtO2wjLRrZjMouGMz9U+uaAtLcXGZlRuAXbd5kPs7rdPZMw/nCKkOmNOwzuZjIy1knzr+e0zxV0Z35X9dzvb7YGmuU40hRVGtJUQvWOtWuCVZ+wd8DGTjTzIF0n9uT+iXpC/jeWYITKEE7XwdVXDyLn1KQYCtEgRzRJ30GkPmVK/PaJhwNdYlCn1GJ0l3LC7DzLEnmW3TioIDYoy+XuYixgc465K+ctxrp3zrkQWOwzE5JHy0nOL/zmWxY+FmDQwh55U9TeVSoDaf9lhtJrgTnnZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 14:15:33.0372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d70ed1-16ab-4054-45cb-08dc4e685d6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835

On 2024-03-27 04:20, Jan Beulich wrote:
> On 26.03.2024 22:47, Jason Andryuk wrote:
>> --- a/include/xen/interface/elfnote.h
>> +++ b/include/xen/interface/elfnote.h
>> @@ -185,9 +185,25 @@
>>    */
>>   #define XEN_ELFNOTE_PHYS32_ENTRY 18
>>   
>> +/*
>> + * Physical loading constraints for PVH kernels
>> + *
>> + * Used to place constraints on the guest physical loading addresses and
>> + * alignment for a PVH kernel.
>> + *
>> + * The presence of this note indicates the kernel supports relocating itself.
>> + *
>> + * The note may include up to three 32bit values in the following order:
>> + *  - a maximum address for the entire image to be loaded below (default
>> + *      0xffffffff)
>> + *  - a minimum address for the start of the image (default 0)
>> + *  - a required start alignment (default 0x200000)
> 
> This looks to be stale now.

Yes - I did not update this file.

The patch is functional as the ELF Note fields in 
arch/x86/platform/pvh/head.S were re-ordered to match the Xen side.

Regards,
Jason

