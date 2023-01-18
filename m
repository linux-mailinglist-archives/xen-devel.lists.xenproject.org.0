Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B556718AB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 11:13:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480438.744857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5RH-0006aG-HQ; Wed, 18 Jan 2023 10:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480438.744857; Wed, 18 Jan 2023 10:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5RH-0006Y4-Ec; Wed, 18 Jan 2023 10:13:03 +0000
Received: by outflank-mailman (input) for mailman id 480438;
 Wed, 18 Jan 2023 10:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYxY=5P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pI5RF-0006Xw-TR
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 10:13:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af002047-9718-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 11:13:00 +0100 (CET)
Received: from BN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:ee::30)
 by PH7PR12MB5759.namprd12.prod.outlook.com (2603:10b6:510:1d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 10:12:55 +0000
Received: from BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::3) by BN0PR04CA0025.outlook.office365.com
 (2603:10b6:408:ee::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 10:12:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT099.mail.protection.outlook.com (10.13.177.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 10:12:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 18 Jan
 2023 04:12:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 18 Jan
 2023 02:12:38 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 18 Jan 2023 04:12:36 -0600
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
X-Inumbo-ID: af002047-9718-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b84uFKQ8P0y/QYDaWlut7UY4+ULlHdI4YQx5o4Ovef0XOQBbcfyJP77YBY2VLq/DvrQ9hc2ix9xfosZGBVPrbBCUf0pmpiP9umeBPzeEAj4fo7MYvsKo46uaInJhkmbndblSVQYME/5sAbihg3C+39yGuECaCEY+HLJzcLpW9BlCVc7A/CtRVIhovWEw7jxYbb+AV2KsmkRBnreKmyPifupJNYF92JPn7hx3eRlgFdcei4P8NmlOFMb/i3bzhXYYWGYV5PxMisG7vMhNaFf9+SY2a/4gJQhWnszykkPPYrotRZZIGIBfC74c8flgyqQgKnzBBi7vt91neQnMU1B5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e48vDjnNHTq3lsRspKwSNzwRZUWiP8aG+DBD0kmMBX0=;
 b=JdDz8AA+YvfmEWngSoFDbbv1mZ0f7WD0L0EC6fili7fc3EcZybRmUSY91bh3F+1FOy5sGNzpEsS6+4neCHzHxKyXUNaAamX3LMCjt89CVtc0//E7oryMOWnrymXsxzf0pKGHyE/WRJf4x5wiFRdcVqrlbwPxtmatbANUiG2baXlRUQIZSirxq0A6yvyxhgTCL24f9ontC5ruI+4ygUhVpi6nL/AaVZESV7YJmr+fwQF00YKwwgXDA6QbqTgjpeSmllfw7gJVfw8LvF+EIsNQ+Hva1LVXlHYkc7+xgBHyo+/R896hmcGg+OMlisqLd56Lrhs5NoQbdSnhjjfWQw4Kdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e48vDjnNHTq3lsRspKwSNzwRZUWiP8aG+DBD0kmMBX0=;
 b=raqRvB3btm5M5pQzZNzpG/lScTKb7WodHMYddKYv6sxLNsU7ICqPdFSfFsOjrui8ikjeMFToAuyyrjp5QpYUYt+Xcj+WvcmUbzQBtevOaOy0BiOaiMuu+gQKgm+UBDKz4E+yHANBG3HLGoQ/AVsvHFrQQa9qvPKr9VDVT0/wcT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <157b9c9f-b9fe-5c8a-bea2-aa45ea5d195d@amd.com>
Date: Wed, 18 Jan 2023 11:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 00/11] Add support for 32 bit physical address
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT099:EE_|PH7PR12MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1989ae5d-fefa-4087-8005-08daf93c90d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NH7EjZO243IEsRlOOZCeLEva+U1l5uDMwZpS9cCYvQ4ooYxZ9Dd6SvAsU24hw/Tzj+iRZ01QVFrN2mN6vDbsjLWhlVO4EGC2iuNsZOMzmGBUmWEBjt5ttD3sGfX4qUi/5aAKIKCR/ZCzo/1b4P0EYazk2Q/zC4FSatl1byx3DRwgxQGqp4dMoSHhw6Ek0krG9wwzfxeMCwlz79LDRApu98ZQs891IsiCnR6GvLMjK64Q6Oh0v9AWGyUhYzGVWlL9ZJLvyWwENeYdax5+rd3v2FcOVKeeKehxEmPX2lIMqst6hTF/pql8n/immIIJ9zfEJpu4K0G2GM1AfG4Aqw0W94BFni5Dy8ZP6RtPmZ/jtU/iHPa6UEj1EDen3fPbl4RO/mHjb4ZQW4GgWuSgh9gyneiwJJnt6YRyw6WdVpUJFoai3LglYZMS7CsuAOlGdd+3QonnrO6TkbqkPplFn9N9wDiqibyESejZIkByvMWfocNEkjVW+4wlpms3NeFxMkfzZ427p6grU68WY2DO3KFHQBy6NwsUyyz6QL1ZHTs8XoOcHBjCcBhGC30sHmeLSAYNWqU5BO2ypCPnVSy6D/UNoGxZY7abpJ7gzq9Ks/CFjdAX558v9ndOm404nkscstNXH9FgtP6Rpnaqch1vrBl0u5F3d2jGV4vI0V9MItQHhC2TWKU95bpAAMxWEGmIl92cxXlEnnXxYDT9tkHn35ecMHVzAEVTlmzkQBJI6gawXaaXvBQKn3eHZRgsKrBhj5lgIX6rhHNQqWhW5Am+Ept//lLnnI/CR9KZqIwwXZ6dmLw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(31686004)(82310400005)(36756003)(966005)(36860700001)(316002)(478600001)(4744005)(44832011)(31696002)(2906002)(54906003)(40480700001)(110136005)(40460700003)(16576012)(41300700001)(82740400003)(2616005)(426003)(47076005)(26005)(70206006)(53546011)(186003)(8936002)(86362001)(8676002)(4326008)(356005)(81166007)(336012)(70586007)(5660300002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 10:12:54.9011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1989ae5d-fefa-4087-8005-08daf93c90d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5759

Hi Ayan,

On 17/01/2023 18:43, Ayan Kumar Halder wrote:
> 
> 
> Hi All,
> 
> Please have a look at https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01465.html
> for the context.
> 
> The benefits of using 32 bit physical addresses are as follows :-
> 
> 1. It helps to use Xen on platforms (for eg R52) which supports 32 bit
> physical addresses and has no support for large page address extension.
Looking at your entire series, you keep using "large page address extension".
LPAE is ARMv7A thing and it is defined as "large *physical* address extension".
So it would be good to stick to the proper naming.

~Michal

