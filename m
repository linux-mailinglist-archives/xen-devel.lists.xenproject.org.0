Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C8462FDC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 10:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234930.407636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrza7-0002uF-4Z; Tue, 30 Nov 2021 09:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234930.407636; Tue, 30 Nov 2021 09:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrza7-0002rV-1P; Tue, 30 Nov 2021 09:37:47 +0000
Received: by outflank-mailman (input) for mailman id 234930;
 Tue, 30 Nov 2021 09:37:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSNa=QR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mrza5-0002rP-9I
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 09:37:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c1fd70-51c1-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 10:37:43 +0100 (CET)
Received: from DM6PR14CA0052.namprd14.prod.outlook.com (2603:10b6:5:18f::29)
 by MN2PR02MB6720.namprd02.prod.outlook.com (2603:10b6:208:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 30 Nov
 2021 09:37:39 +0000
Received: from DM3NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::80) by DM6PR14CA0052.outlook.office365.com
 (2603:10b6:5:18f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Tue, 30 Nov 2021 09:37:38 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT018.mail.protection.outlook.com (10.13.4.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 09:37:38 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 09:37:37 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 30 Nov 2021 09:37:37 +0000
Received: from [10.71.116.171] (port=25679)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mrzZx-0007Ep-Db; Tue, 30 Nov 2021 09:37:37 +0000
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
X-Inumbo-ID: 29c1fd70-51c1-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VebqSD2otrL0s47bIKk7LlJ+Ndlcq7vmwk86j6wWbgK+9RQVnddl1eGN403ZPIq+EHA2p4q/H4ZUugeDEYTUhQlg8flusRFp/0sZB5l/+hqr95KRH4LGck5n0AqmZduuxqrXoSXPROBuH0YJqEH6yD7Emnflp4s1DL0q8P1wHoOQ68ys8zO/vrbnxi0Ni3kJ+z1aW+3GwxIR7WARyp14bH4aVTL6mGsJ6S6WuLKwnVRh/KKFnICNH+6ZnSkT+ic7B0xelp0wFTKjlcsa3LRlqhORCpWRlpDoVYBuNHjv2RQZIJRfjNF9AY1+3z0BM2Kzoio0qT7kpK0gbJJZzPPc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGAqY3rQKfk9bdVR7tekPQeLGr47yvIFoW+d0eFlWrI=;
 b=PVzxdWmaW+Fj5Ggm5sv8LFKoBNDkPqQnOo/2EdJT4QBKT2Nafo6WHwz+u/6Bm6CfgcStELVkmraIXiSUV3JmRHwor4JaM9n120YVaaNk74j+/J4xMwkZHfjXX9F84y58FmdZtlYU8T/l1g5jGrLIgFbqeNkWjUea4dzDZHx/gk8aobQszbY53z4JZToZkXzqogD35jXWFJomoLed6z6sggLQQ/KVuMma/8fBAMRdtDxAuTbDTcs5RLG/VHk+wO0O+GZpTYYTdt2/XxwPQkoCs8YbSqhc2cVcMkvYjRNrrKmOE26TiE6uvcp/W63fOwDgB1IQ2fu0ief/X34sYyoGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=suse.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGAqY3rQKfk9bdVR7tekPQeLGr47yvIFoW+d0eFlWrI=;
 b=E+gwn0biOUGwfNDKK1x0QDDWaxX2efHex5ve8Xhw7GqaYoXnJcgGTpZZPk0pHrsGkPMvdrtjAvbgfadOxwPSWBP1PzpFBU/g9oA1pnHvsrKKlfrYneerU1PBS8TINb5Zwo7GRTHjV4iZR2VbaDT5gvCyO0UylbPEGHLkWB9Edl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Message-ID: <bf77c97c-df14-b6f9-cd8c-b3d86568037d@xilinx.com>
Date: Tue, 30 Nov 2021 09:37:36 +0000
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
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <3f0230f3-79d2-d40e-f3f3-33201c2792b0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb38c7fb-bf4f-4298-4e26-08d9b3e50c7a
X-MS-TrafficTypeDiagnostic: MN2PR02MB6720:
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6720F14CB9D53A982B045209B2679@MN2PR02MB6720.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V7/UXIO8TuEEzBpljyi8OLi10vz2hUxITBacMXndOuA8lPVdROz27SWrQvo1ORlhF0sJ5jrOBObIyYngWsxnvpMZKiGtRJ1FnYPuVL1wZRRmxGT+HVd3woSdAJOWU0Ytk95hInOfw6WWXstJ81T3Neb0fJF71LGKd6tO3R+5g17OS1lfKJBoXP/yPg8G5YRJ5/qx6qWMezs2LSsqQuWZ/K0bbVMhIKdA2Y5Zm8tRq9BPV/iDkqqyZIniQ2dVC0c4fqB/9VIMd38eSv9KXydV3CYqCtoDVf1pYS4R0gz2KARuZ526bKY5q02AN56wY7I8XH7W2hpVRewBIMd+HK2kSrWy3GFaDqyN9D9hjV8+0pHC4dDWaRKEKOfTUX+VqVNJNNLcJVcqeZbu4fLUNpF7jOQL3Kv6GVMSV2EFP/RjOc9ekby+Oml5HUkIImPZx1d6IM5wSOWHE1991g7AxXq7Fh4x3KwKihJF6Wgd2nRWtCnHf3cMJZECsKdh+QHHknSK6zD6dS8Kp2Zno7nXHjOyJp0HSd/qiAb5cQO0qjRIPoUw9N1fj+A7bV0wkqSfTO/LtvRmC7kTis9URnpjxaRo4u0yD8S5J1Rg11WWqPQ0GKamfO/1w9Xsgv0oB9udpTIjXcA09xBlNzYQfS/CH7yMfB7BK0pNxPCm+Zi4XrS2VQi9T7t21Y9vuJVL98g5fv8ftMSAhNAEoKBloewEVNEU5NfIa9Xbhoq3zmflAq+37N6GD+6gmtuwwW+GrdW2YVlaSQ+DOB560mPvbs1DS2RcAw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(426003)(31696002)(26005)(508600001)(8676002)(2616005)(53546011)(47076005)(54906003)(356005)(9786002)(36756003)(316002)(4744005)(8936002)(336012)(2906002)(82310400004)(7636003)(4326008)(36860700001)(70206006)(5660300002)(31686004)(70586007)(110136005)(186003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 09:37:38.5711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb38c7fb-bf4f-4298-4e26-08d9b3e50c7a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6720

Hi Jan,

Thanks for the review. Just one question.

On 30/11/2021 07:18, Jan Beulich wrote:
> On 29.11.2021 20:44, Ayan Kumar Halder wrote:
>> GENMASK(30, 21) should be 0x07fe00000
> 
> Please can this have a meaningful title? E.g. "bitops: fix incorrect
> value in comment"?
> 
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -5,7 +5,7 @@
>>   /*
>>    * Create a contiguous bitmask starting at bit position @l and ending at
>>    * position @h. For example
>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>> + * GENMASK(30, 21) gives us the 32bit vector 0x07fe00000.
> 
> Once at it I think you also want to
> - replace the word "vector",
Should I replace "vector" with "value" ?

- Ayan

> - drop the odd leading 0: The number would better be 8 digits or
>    16 digits, but not 9.
> 
> Jan
> 

