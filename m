Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4064D818
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463196.721341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5k20-0007C4-RU; Thu, 15 Dec 2022 08:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463196.721341; Thu, 15 Dec 2022 08:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5k20-0007AI-Ok; Thu, 15 Dec 2022 08:55:56 +0000
Received: by outflank-mailman (input) for mailman id 463196;
 Thu, 15 Dec 2022 08:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GeMf=4N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5k1y-0007AA-UY
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:55:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4718ef43-7c56-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 09:55:53 +0100 (CET)
Received: from MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::35)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 08:55:50 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::b1) by MW4P223CA0030.outlook.office365.com
 (2603:10b6:303:80::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Thu, 15 Dec 2022 08:55:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 08:55:49 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 02:55:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 00:55:48 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Dec 2022 02:55:46 -0600
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
X-Inumbo-ID: 4718ef43-7c56-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPtZcMH2vFFxY526wMtEbfSNNm6poCNO3QSgnuVpI0Q1vCWwaH9Q1u71uxVMotJlJWPqJx95/8OMsCMhsc4e3Mextn9l7CnyJMJhA8PY/V6LpItYXR8sbrRMWqi/IwTUa8hzDAXUonZLuD4TUcQuE24/NkobodJox51eyrWsqdCJJ/WCMz1EeR8PPpHRbLO5WB2Cc+noW7H7pGyu4nFyhT9osG86SIhuzcI943fIVQFi93NmFg4JPiblmeeFxmACXNaS9aUBiLe8iU8HPIVZfCMNfYVVbzVelkkAmiVzUK/jboSv6DAfeQmCc51HuIJWPw9a42ml7RSAjyMQ0Nb9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ0Eaer3Bmldlr3d3CHXwBIs/+Amb/IDvR2dzsQ2gQ4=;
 b=oUV2chC/f3SEbifCcSSb+BrAxNmseQywX3QsoNMSiQS0HWdgD/Aj8mCDV0V8q9gZrS/8LI4t3ybME94/KGS27ZU2PHUKO5VDWQXVf+OS2J/Goa4JcBaO9nqdibkanpgYrXc2PIvj+DvjRfhqTGTCk8Lx58xtHuWFJ4zRbverN2753TzwKIOWcK3fzvmG7RFUlbi0IvO0gb30IBtiqt/bRUVhfuDj35VtCVQ3q1j7heeR/3hH983l42iGs3NaswlpCOqPOV8Xceblk5aqXbTPikqFbF9BO6g8q4l3r/DaxRxWcRqhi8+iO3Oz8OJiRUFYrUY8Tl6RfCfv6oVn19nDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ0Eaer3Bmldlr3d3CHXwBIs/+Amb/IDvR2dzsQ2gQ4=;
 b=Ma6T88/5AEU1VaDetO3UbiWKhEQCe3PwXidZ9KzTA28SVRlbtrHB1JlpRhKCCRkeDGaU4UTEEzFWcsp21VD3x0EGiGXeJUQl65RZ+tG6BlG0FN9rLi1oWWu23VJpWnlgCeIoLq7TtmxfhzNU5vs0tKr2HHpMcqpbyT8v/o1p5TA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2bab3307-1e0a-0a61-8a0e-52c832346515@amd.com>
Date: Thu, 15 Dec 2022 09:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [xen-unstable-smoke test] 175226: regressions - FAIL
To: Julien Grall <julien@xen.org>, osstest service owner
	<osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
References: <osstest-175226-mainreport@xen.org>
 <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT037:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b5420d-3042-45ca-430c-08dade7a29b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u/F1v7rfYPZ97d9o6YlHezoTDQwPh6Shx7vS2V7J0mCo7cnDwYsFQZlMsGIVcTEwyPIdOr/qhsWX2UHowssu8CcolvIZxS0hi+oZeEnb7Bslj2UrxFnslHPEfbhNH66ipSE7zCOn0JMY0xNei5gPIh311oZ5C38iltyHYcJOzqhLojT55+SRzBgzr3oG7zwkI6xIzkgxCqPnmF3Lr6FnbHpEXr+q0oWC+01abiOUNAZE0v8P4VKO6JyUhUbbNZLMNRy7PFBMnr24UcVSlqsgLzw4s5JJHkHOPhJ+ZLpYkse+ddWBX+St0E+t9rY8aHCevOiIhnJ/b4aUUxUMiZ1EFDY3kTf9JlOYqubmgU0cIO5fDvr5kT/V4p+qG+ntY0w49XEPVM3CvMWIulC6nlhJqW5Qvd5MkVIt1QCRxxOlzAxYiH4IQs+evjhbU4bhZb9dFukxfb/SMY1X0fYbvEbpOfibYdZPDNCBSaoi1iItu7e/7bBn5ZwX6tdgPS2dSPCG5JBmVp3Gyvqw4WnUuLVPCbX6LERbO0Tph6ksQ1Il4O7qOwJxkoS6bQsvduAGG5Md3HvMuvqkLsl9eTY0G1t8trn/zn5pRD2tDZpB36GtpSR58I8S29WAUiTlwlcaeFJ1Hii5OTKJOcXdsIgcFgHGqpAnI6jZah42U6W4yYLmItt7hz/8QPOnyGvinSvrcbFlf7v2Pq81hVO85mPwK1YVMrLzQtO6AtkPdoE6CxSjRwApWHOW9iJfyeitPXANNwmcRMqsQZ4AAsR2/0mRWPefErYQ8i93Ol0XFBDG82FLark=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(44832011)(16576012)(316002)(356005)(83380400001)(40460700003)(110136005)(426003)(47076005)(8936002)(36756003)(336012)(41300700001)(5660300002)(81166007)(70586007)(70206006)(2616005)(4326008)(8676002)(82740400003)(966005)(478600001)(82310400005)(186003)(45080400002)(31696002)(86362001)(31686004)(36860700001)(2906002)(53546011)(26005)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:55:49.1971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b5420d-3042-45ca-430c-08dade7a29b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689



On 15/12/2022 09:34, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 15/12/2022 01:41, osstest service owner wrote:
>> flight 175226 xen-unstable-smoke real [real]
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Flogs.test-lab.xenproject.org%2Fosstest%2Flogs%2F175226%2F&data=05%7C01%7Cmichal.orzel%40amd.com%7Cb8049c55691342b50a6608dade773f6f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638066901002944667%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=GVUWKlOkecaJRZTcUqovWnc8WggDc4VokO%2BMKvHk9Qk%3D&reserved=0
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   build-armhf                   6 xen-build                fail REGR. vs. 175173
> 
> armhf/xen/tools/libs/light/../../../tools/config.h  -c -o libxl_genid.o
> libxl_genid.c
> In file included from libxl_virtio.c:15:
> libxl_virtio.c: In function 'libxl__set_xenstore_virtio':
> libxl_internal.h:4388:51: error: format '%lu' expects argument of type
> 'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long
> unsigned int'} [-Werror=format=]
>   #define GCSPRINTF(fmt, ...) (libxl__sprintf((gc), (fmt), __VA_ARGS__))
>                                                     ^~~~~
> libxl_virtio.c:48:41: note: in expansion of macro 'GCSPRINTF'
>       flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
>                                           ^~~~~~~~~
> libxl_internal.h:4388:51: error: format '%lu' expects argument of type
> 'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long
> unsigned int'} [-Werror=format=]
>   #define GCSPRINTF(fmt, ...) (libxl__sprintf((gc), (fmt), __VA_ARGS__))
>                                                     ^~~~~
> libxl_virtio.c:53:42: note: in expansion of macro 'GCSPRINTF'
>       flexarray_append_pair(front, "base", GCSPRINTF("%lu", virtio->base));
>                                            ^~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: ***
> [/home/osstest/build.175251.build-armhf/xen/tools/libs/light/../../../tools/Rules.mk:188:
> libxl_virtio.o] Error 1
> 
> 
> This build breakage was introduced by "libxl: add support for generic
> virtio device". %lu will likely want to be switched to PRIx64.
> 
> Viresh, we need to unblock OSStest (our CI) as soon as possible. So can
> you look at it and confirm the rest of the tools build on arm32?
The failure is also observed on all the x86_32 builds:
https://gitlab.com/xen-project/xen/-/pipelines/722195904

> 
> Cheers,
> 
> --
> Julien Grall
> 

~Michal

