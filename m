Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDBF709056
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 09:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536723.835349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuV8-00056H-JO; Fri, 19 May 2023 07:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536723.835349; Fri, 19 May 2023 07:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzuV8-00053q-Gg; Fri, 19 May 2023 07:26:10 +0000
Received: by outflank-mailman (input) for mailman id 536723;
 Fri, 19 May 2023 07:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9j/4=BI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pzuV7-00053k-2X
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 07:26:09 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68fa1211-f616-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 09:26:05 +0200 (CEST)
Received: from BN8PR12CA0014.namprd12.prod.outlook.com (2603:10b6:408:60::27)
 by PH8PR12MB7422.namprd12.prod.outlook.com (2603:10b6:510:22a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 07:25:58 +0000
Received: from BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::96) by BN8PR12CA0014.outlook.office365.com
 (2603:10b6:408:60::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 07:25:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT085.mail.protection.outlook.com (10.13.176.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 07:25:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 02:25:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 00:25:57 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 19 May 2023 02:25:55 -0500
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
X-Inumbo-ID: 68fa1211-f616-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwOtdoPugVnA9wPpxb0XUWgOP1GWj89wlOHLQJMmq0kZEedGPczU90Af0sYkkaZIjSA0tGB+rWHNWX8UWBWRe9aVpFAx5eaOcW5touZKYWFgX1jVXGyAV2FSpxM8rT8O5PjOkv+KiZC70Hy62HGnYkkt/OHUS0UX3f0KOqkaIZc9wDrcBp3Y0dZg+ZXTJSylIIGVb19GZpVn6PgRGPa7yOyfdtqy3NGEbigZ5jsrTGWElaPP/I4NRz07mZUxQ/WMrJCX5PpHRbmVBtRbgutDEL0urzhhLSE/2eRl7gvCq29pfPWF00lJ7vJKN80l8ayKpJmI5bWUcO6Kl6oioowwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb0a18HqGbaJZ9tZ/7ciRPB+FTXd7WBltR8R5VrxBZA=;
 b=eqpANoGtqVTT3lZHfLJHbpODAaFkkzfP2G2leuSf60kpl6JsswsbAtgDOu14cb7udgWGXXi5y9KzOtka3ddIM5jzrNbfxxUUK1JCTdaGC8mU+FPRGETGZCFBq4YgCkKSIsE0JtEynDehYVD3nSYXFjHzU7URK1ZEFtbPsoeHiyFnY+Sq1CeXZw67OWD4Yphm+XbBGhMOJxJ+CibQKMWyA3iGssKLfOqZHsqIS9McJnVKve/7KvBygZ1puCTnnH5BqV3ClYLAV+e+RE45+FFmrJ3ol93VPP2mxUeXKwNswhBmtnLq6GYwp8El9ntTmN8YPMKbHYpYdr7aJpWmQozbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb0a18HqGbaJZ9tZ/7ciRPB+FTXd7WBltR8R5VrxBZA=;
 b=47xEyRzhy2vw2yuEGT4IOLCIl98kHJyxDlaJvAc8/Ti4YVqik1j8tKGe+WesUEo3mMRGCbYnWvo0+abR9G4SQL8keqL6Ynfafv4j0slNEhEllOy3hy9wFccSF5rK3TsAi2SWsnxiNDumx7RjT4Cb+c2On7iXV6M5gNYkMjMHczA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <acb39086-69f1-4bd0-96f8-d9c9420cbb41@amd.com>
Date: Fri, 19 May 2023 09:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] xen/misra: xen-analysis.py: use the relative path
 from the ...
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
 <20230504131245.2985400-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2305161743520.128889@ubuntu-linux-20-04-desktop>
 <a0d6197a-53e8-0121-c7e0-ddbdaf970c7e@amd.com>
 <B087CAA6-0DCD-48C8-8199-A328BDA649A8@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <B087CAA6-0DCD-48C8-8199-A328BDA649A8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT085:EE_|PH8PR12MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: d31c1254-2b88-429b-a3a1-08db583a4a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLOycE++EKjvjWdZtpZFDi3lExeb2HBYDVLG3pndXcSQL56Ngo87XXGcu7Ka42EXQIpOfepAiKVkZQpkHHOLxnWzTn5bJVJX4KQ+KoL6I9xaoDi+ZkExIG9iShcVBod34YBO0krOee0WhCg9vcLx9uVMe9ox43FO39jF0xKF6K/7EzBoHmu+Q0E/K1Fazgy3UQNBhZySVR5NVBUNYDi5LXtU7VujXLkLDyfyAkmq6xP/srJrrS2UYEtQSThVOOmX+b325bMbWLE6fZ6QjCY/RDmritmPFxdvaZw/ejuD2z4LeZqISXkeJjeHFgG5Cgn7LNqIwZJhGYXZz0E0denJfKNB9BJgAHyvHay6NptV+qTHFq5mgHNjsmnKtrykEg59EQHyBkN7ZD0RpwjhJvyT1roHx4P2eK0J8JKoo926BQAfmpMGuKEyozITEkmlrWO7CTa/kDc8TKVk5P4nhY68oCoyNxTG9eCO6II61VTJScUiR8mZzVOqShb8NKCJ24/FKexa/meTz26BEoSdQO4t2mXBrh1Js6l53Yd0fiQ+NAlGLhoTUqwUpM8D9pSdnGfBlnw9BW9ZpYm3g+lWXzwZCGd8dTJtMaNO3fJVg/S7ZiY6vCnvD7ZCHeCPv+VvR5nPXLmoMmqxU7ZOt9kIIfoqeJFPrTjEQAnekGI8t1CivPwYXskwyd/8fIUMiJNU6vjXLOIKDdF+juT4Y6Kf4mAINinQef+GikCrGxPlL2Ci6TI5JAM4oS7EQ5nKdyscHvBC1Be1RWoBkMikmTvupddCda20whLBKHHlhX3lPBavbn73g2IEDZEejIMdLx2J9kOF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(316002)(478600001)(41300700001)(4326008)(8676002)(6916009)(31686004)(8936002)(16576012)(54906003)(7416002)(5660300002)(44832011)(6666004)(70586007)(70206006)(53546011)(26005)(40460700003)(81166007)(186003)(82740400003)(356005)(83380400001)(40480700001)(36860700001)(47076005)(426003)(36756003)(82310400005)(2616005)(336012)(86362001)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 07:25:57.6278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31c1254-2b88-429b-a3a1-08db583a4a0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7422


On 19/05/2023 09:12, Luca Fancellu wrote:
> 
> 
>> On 19 May 2023, at 08:08, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 17/05/2023 02:44, Stefano Stabellini wrote:
>>>
>>>
>>> On Thu, 4 May 2023, Luca Fancellu wrote:
>>>> repository in the reports
>>>>
>>>> Currently the cppcheck report entries shows the relative file path
>>>> from the /xen folder of the repository instead of the base folder.
>>>> In order to ease the checks, for example, when looking a git diff
>>>> output and the report, use the repository folder as base.
>>>>
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> I know this patch is now committed but there is something confusing here.
>> At the moment, in the cppcheck report we have paths relative to xen/ e.g.:
>> arch/arm/arm64/lib/bitops.c(117,1):...
>>
>> So after this patch, I would expect to see the path relative to root of repository e.g.:
>> *xen/*arch/arm/arm64/lib/bitops.c(117,1):...
>>
>> However, with or without this patch the behavior is the same.
>> Did I misunderstand your patch?
> 
> Hi Michal,
> 
> Thank you for having spotted this, during my tests I was using Xen-analysis.py so that it
> calls the makefile with out-of-tree build, I’ve found after your mail that when it calls the makefile
> with in-tree-build, cppcheck is run from /xen/xen and it causes it to produce relative path from
> there in the TXT fragments, showing the issue you observed.
Ok, the way I test it is the same as in our gitlab CI so this needs to be fixed.

> 
> I have ready a fix for that and I’ll push that soon.
Thanks.

~Michal

