Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD574CD697
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 15:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284328.483541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ96m-00045y-6e; Fri, 04 Mar 2022 14:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284328.483541; Fri, 04 Mar 2022 14:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ96m-000441-1i; Fri, 04 Mar 2022 14:40:40 +0000
Received: by outflank-mailman (input) for mailman id 284328;
 Fri, 04 Mar 2022 14:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zc/n=TP=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nQ96k-00043v-OL
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 14:40:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cffa23c-9bc9-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 15:40:36 +0100 (CET)
Received: from DM5PR04CA0041.namprd04.prod.outlook.com (2603:10b6:3:12b::27)
 by CY4PR02MB3384.namprd02.prod.outlook.com (2603:10b6:910:7c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 14:40:30 +0000
Received: from DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:12b:cafe::e1) by DM5PR04CA0041.outlook.office365.com
 (2603:10b6:3:12b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 4 Mar 2022 14:40:30 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT049.mail.protection.outlook.com (10.13.5.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 14:40:29 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 4 Mar 2022 14:40:28 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 4 Mar 2022 14:40:28 +0000
Received: from [10.71.116.156] (port=49343)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nQ96Z-00037Y-W6; Fri, 04 Mar 2022 14:40:28 +0000
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
X-Inumbo-ID: 0cffa23c-9bc9-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nidxNz/7EJFP7uR9eRW7Hhgq9gpY/fFPmu41I4LQmCJtLQ2ZMqKFb0eFeoXF9cA9W8dNy28SztpDdsurLllLfBho9GDAJJ0JhFY22ei+tw/gkC4lz3mJaBcvT4+JnosYYQbFuP0N+r30/C4klnIa8Dqy1Yb5NEh9nl6MYEQs3bq10us2BpabaLaETJzeyOnqwxuYAnZtEzFegFYxX+gnkWsP4N5wKKZW3peldntVUUZdWDs/Ta4MkDVMXKd2I0Pj2cGI8Ro8WWOuudAT58funItZDtaCM+05DA31oXmOz/9eAPnJW/kZVctD/iO3LpnN4QjIX7RIy9yYhJrLDiO06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dojcFxBy0yGGvny/02e/mRdN5er1A2JlDuY7tl6w8vU=;
 b=HgQmoyUJanfeBTWcbNui8G8r5N9pc0EoD+egVchw0cHN380wI7NYtlqZtNd+iCWq6HmsBfuU036EVPHsG/GPrC3p/oVoPraAbYOJmu3pEFOYaCZ8qTKQsEQF/dkYb1Wqgd/beiQbckk5Gx7qwUQC+Qvo2uCfax2zf6VBrAA+fLDOBRDVXpPSFNcHglq2A2FY4rpqNbXj4diT4P8pjnxvuYIournUjAFb6upaGYFfZ6m0e0Wp8I5pYsVNx37h6noIi6ng5rCyuNEsd8FfBB6F5thQzQQHCduq+0xKUNR7ULc9Pq8xthXh0dHYs7ylTVD6DR5/h7MLUvBDqjIlVmGmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dojcFxBy0yGGvny/02e/mRdN5er1A2JlDuY7tl6w8vU=;
 b=DFMq5SEMDjUcMM2J7DDcRpzCLr5yFfbkJCCyP5YgQkDKjaAT5y8sWtTFc5ojxD1zYWygkZZuJIo8OPZuuqB3nP4YeDiqSX6f8fPFuvq/E7yZWG9HRjQgH8CxrRoYwIyn/xw0bfk9amZQDvz52lSl4Ypexp7I8N3BlYCddrXYycM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <9be4bf1c-0d56-2917-1404-f56590a8034d@xilinx.com>
Date: Fri, 4 Mar 2022 14:40:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-5-ayankuma@xilinx.com>
 <26ee167e-16ea-e358-f390-dc96961d3234@xen.org>
 <8f78044e-aca2-5919-1841-15989daeb986@xilinx.com>
 <26107eb2-d38d-d6b5-bdaa-d5058e964623@xen.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <26107eb2-d38d-d6b5-bdaa-d5058e964623@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9eb3437-c547-4936-cbac-08d9fdecee37
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR02MB3384C533A9B34631FDC19339B2059@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22QPYO66JVjPZtlhzf0XFGdP84BaZMizvmym+ejS3Jp2gGM9ZEMxvqUvN3fFWgWKhuCL5gmAxHALrqWKVlcZQKSO57mItagb+oFdFkTQIjoLFbim61gpFQUh8E/SA+VnknEWKQfu4NwWEUTA52zwgdKO1/TJFF0VP1JA5dtXDao3pphHx+ehS5N66UQSxQe6BTyLUa7R0QwCZsrB4w+6nRBcfECKYux4w5McmjuB4kAT+2jdgRA0oSd2c0tCnHq2pMUmnwWlRvnj2Q9YeVV1fRdszX0Syl+d79wCFSSAkkV/JriOZCAdyQO8wWT6weaF5RGC3PXhNzqB6amKPySyWR/dDmvYs7oEjKE4fdERPRo0KUdJqYTAZSrq2/LJ9V5QLdBtprMN1aEg+JxRlLTe4Z6OTRp37TSJM7J6Sh/dhBhSS8AX9md3p7oSI3iW/vwDsW9Z2qIu9pO9OzsM4+vUsK+5IgnWcHKbfmv2EZKnQ2mas0mb55FnwmWNZstWQRLwHAb3kZdvtc9pccPrhAwQ6WI8yDsJH7zUuOLLShqTUVc1ESMTdPJaCmDN/QzHRBA6YOYsQFAiDeE3hcR6NVTEysxL0xqVnWcDquaV6CbgiEEvGhamzEzQ9ETzzpSqgEkEuzdyy5vaOh5BU7d3yqPh3lpvyDS1OlVMVyDw6qaJvWqmvDqZmY86zTND5AeMX89Wq+xWFpQJJUgqxBAmZDGutDVNTuY9jCogxqHwtbnXkWE=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(110136005)(54906003)(36860700001)(2616005)(47076005)(36756003)(31686004)(70586007)(508600001)(40460700003)(356005)(7636003)(4326008)(5660300002)(316002)(8676002)(70206006)(31696002)(9786002)(8936002)(83380400001)(186003)(26005)(82310400004)(426003)(2906002)(7416002)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 14:40:29.8035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eb3437-c547-4936-cbac-08d9fdecee37
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384

Hi Julien,

I have a question.

On 04/03/2022 12:49, Julien Grall wrote:
>
>
> On 04/03/2022 12:13, Ayan Kumar Halder wrote:
>> Hi Julien,
>
> Hi,
>
>>
>> On 04/03/2022 10:46, Julien Grall wrote:
>>> Hi Ayan,
>>>
>>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>>> When the data abort is caused due to cache maintenance for an address,
>>>> there are two scenarios:-
>>>>
>>>> 1. Address belonging to a non emulated region - For this, Xen should
>>>> set the corresponding bit in the translation table entry to valid and
>>>> return to the guest to retry the instruction. This can happen 
>>>> sometimes
>>>> as Xen need to set the translation table entry to invalid. (for eg
>>>> 'Break-Before-Make' sequence).
>>>>
>>>> 2. Address belongs to an emulated region - Xen should ignore the
>>>> instruction (ie increment the PC) and return to the guest.
>>>
>>> I would be explicit and say something along the lines:
>>>
>>> "Xen doesn't cache data for emulated regions. So we can safely 
>>> ignore them".
>>>
>>> There is a third scenarios:
>>>
>>> The address belongs to neither an emulated region nor has a valid 
>>> mapping in the P2M.
>>
>> To check this, we should test "try_handle_mmio() == IO_UNHANDLED". If 
>> so then send an abort to the guest.
>>
>> Is this correct ?
> I think it would be too late because if the region is emulated, then 
> we would have already tried to handle it.
>
> Instead, I think we need to check after we confirmed that the region 
> is emulated or we need to forward to an IOREQ server.
>
> So the check would have to be duplicated here.

When do we know that a particular address does not belong to an emulated 
MMIO region ?

Is this after both "find_mmio_handler()" and "ioreq_server_select()" 
have returned NULL ?

- Ayan

>
> Cheers,
>

