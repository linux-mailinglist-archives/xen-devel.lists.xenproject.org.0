Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A87463D7A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 19:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235431.408448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7dx-0002nz-2b; Tue, 30 Nov 2021 18:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235431.408448; Tue, 30 Nov 2021 18:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7dw-0002lY-UM; Tue, 30 Nov 2021 18:14:16 +0000
Received: by outflank-mailman (input) for mailman id 235431;
 Tue, 30 Nov 2021 18:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSNa=QR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1ms7dv-0002RQ-Fj
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 18:14:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eab::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523ac0f8-5209-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 19:14:14 +0100 (CET)
Received: from DM6PR08CA0002.namprd08.prod.outlook.com (2603:10b6:5:80::15) by
 SA0PR02MB7244.namprd02.prod.outlook.com (2603:10b6:806:ed::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22; Tue, 30 Nov 2021 18:14:11 +0000
Received: from DM3NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::c2) by DM6PR08CA0002.outlook.office365.com
 (2603:10b6:5:80::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 18:14:11 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT054.mail.protection.outlook.com (10.13.5.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 18:14:10 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 18:14:09 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 30 Nov 2021 18:14:09 +0000
Received: from [10.71.116.21] (port=53164)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1ms7do-0000tw-B4; Tue, 30 Nov 2021 18:14:08 +0000
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
X-Inumbo-ID: 523ac0f8-5209-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldDjg8LlIsuEHrXZ+IYasF7tg4KHVusyGcSKOTD1tdNZCKpe2J4MQbIMKmcg/BbNdr552PlMVD0MZf3AdA4KN8myt7nvcyibr+MLR2vjCzcnmwRQ+oUqO8Z0Ffx+D135lluT7QMJkwvVu6aFLcnYdlyQ6yB6KrXCmWxRbDAGvi7X8dmIkudXFotnQP79ELKDSxpY0Bw1LxM+Fmg8u2/1V8pioZRpwNsfLQgn/ZfuPWPxqWKDHRB5LLjUZVXsj04J2GKtWuoxY41D4Fg3tW2smYw6GBPkRxSDu0waJtyypJYCW2qBDBcbpGdkrcK6OeYDfmK9Ucms6smabhcV3HUO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amtjdVD53kEO5nY/whsZSNi81SJy2uo2q4XMGCnMdn4=;
 b=g54e673rEm65vFi5l8TW+Za+T0C6UHTklPDBFJYZb5RHcp5eEZoKlM1f/i+JxNTY3ASyp2NP9Pa19STChEqgXF6SkbcOwctc/QHd554mUiCGnFtKq7ZN6Op3l/z7pbODCKStl3qSvXNbm/ij4qfarmSw+Ccrk9fprW3RQezsdt9bleqBhm0f5Ja3Uq4UBTL/ZX4+0tTiLKQU0xgqvJR4VbXT/61usLO+D6NH71dJ9yZkcknlFt6DuRqxU4S0WjhYWhwBw4wB8Y4gqcxVc8pv6oUG6nSXBpAa0TkFsWd/VkIK5uu3UUlZAynOJwjZjZ2rXLizgL+dyYzR1BTtKjq8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=suse.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amtjdVD53kEO5nY/whsZSNi81SJy2uo2q4XMGCnMdn4=;
 b=DHU3izni/FqPOt5uya0j5pf7yxi1rHRN0rEAYVxpAUlg+QHmF/HYPhGuqAHIDyc3Hr2ZgxIiWSQoV7UVF1r6qQjG16w8d6feA4zxb1FB0KNYqcdT14BJj52z54CND3YJDAwFJF1p8XE7NlmeEZVYnnHRev6OVUROMpEubEL4Jv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <093c9380-4672-76e3-d014-73afc1f47d1c@xilinx.com>
Date: Tue, 30 Nov 2021 18:14:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] Fixed an incorrect value
To: Jan Beulich <jbeulich@suse.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <20211129194450.62467-1-ayankuma@xilinx.com>
 <3f0230f3-79d2-d40e-f3f3-33201c2792b0@suse.com>
 <bf77c97c-df14-b6f9-cd8c-b3d86568037d@xilinx.com>
 <a8135634-d5f3-c377-3426-5307327cd1cc@suse.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <a8135634-d5f3-c377-3426-5307327cd1cc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da64e791-3db3-458e-7982-08d9b42d3540
X-MS-TrafficTypeDiagnostic: SA0PR02MB7244:
X-Microsoft-Antispam-PRVS:
	<SA0PR02MB72441CC5D9D940BE13AEEA00B2679@SA0PR02MB7244.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ibQrAaMYO2bzxn/suthjC4HPlGdVkgqSO2Bq/O1MSyH5TBPsjQF6KsbvsUYnVmPvd/VvS4Fic53+B5+vtPbvhjsBKLQvqB9g6So85dlsWJ/w+o2x308Iqv2TFot4Yn1cjI0D/9d5lJCCAx0VJfTWof85ECM4erilovza2GwTDKXYLOUJSj8gkcCB0lRxJWYxcsn1QEYIrsE4o+WipItBKzzdFqICj1mZ2UrLj/FFioo1DCuYVutskU+NcqN8ywHPUEOJN4FFhrb3R9y0fL3CpjAfCo546/Dc2HutjncQqH2DGgZISZqineRf5g0ttcYlRaE0vBBr25CcWNBjmijGSUECEdjx6Ywxp3kieHOEKNN72ZiEt4hoVebnH3iVH5Lg1QSraUKDqr7AwSRAIaTJykSWsHHDkByH4xQ9e+PxjeZjQya3WVzoRWrnic2gudzHocsSu5txBhJu1MuxFdLM5DFUELKG2NrMAR/F/YnyiQzSLOJSK2R/b5X5y7lJLQA0PaKiQrIo0RSjLiq0G12jwVknosjy+T4Y6dwWHpZEJY+ouCX5kC9FbSbD74eYz4pFid4kQtMjTHDkMf/TCZTU8S+Fuvd96U3SZy/ZX+9Mg/M9+wkq5przThEsAmpqAvhGQ37uaGXRA4V5ZBYHu02MN7q/nRJKYvxYDUw+Qy2Y9W/+xKPqbP+HG9MPCZ7npxYf5j8xZLq8qixuglBFGjlQ4xX+0IVqYT7gps7jwaFyllhb2otqw4NsWIKYM7idyjbcCvuRa3d0YOBETCShWRdU2A==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(8676002)(5660300002)(8936002)(356005)(2906002)(54906003)(186003)(31686004)(4744005)(316002)(508600001)(53546011)(110136005)(36756003)(26005)(70586007)(31696002)(70206006)(47076005)(7636003)(426003)(36860700001)(2616005)(336012)(4326008)(82310400004)(9786002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 18:14:10.7102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da64e791-3db3-458e-7982-08d9b42d3540
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7244

Hi Jan,

On 30/11/2021 10:31, Jan Beulich wrote:
> On 30.11.2021 10:37, Ayan Kumar Halder wrote:
>> On 30/11/2021 07:18, Jan Beulich wrote:
>>> On 29.11.2021 20:44, Ayan Kumar Halder wrote:
>>>> GENMASK(30, 21) should be 0x07fe00000
>>>
>>> Please can this have a meaningful title? E.g. "bitops: fix incorrect
>>> value in comment"?
>>>
>>>> --- a/xen/include/xen/bitops.h
>>>> +++ b/xen/include/xen/bitops.h
>>>> @@ -5,7 +5,7 @@
>>>>    /*
>>>>     * Create a contiguous bitmask starting at bit position @l and ending at
>>>>     * position @h. For example
>>>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>>>> + * GENMASK(30, 21) gives us the 32bit vector 0x07fe00000.
>>>
>>> Once at it I think you also want to
>>> - replace the word "vector",
>> Should I replace "vector" with "value" ?
> 
> Perhaps, yes.
Thanks for the review. I have sent a v2 patch.

- Ayan

> 
> Jan
> 

