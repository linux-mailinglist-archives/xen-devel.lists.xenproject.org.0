Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A566948E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477187.739775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHZ6-00014o-Fn; Fri, 13 Jan 2023 10:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477187.739775; Fri, 13 Jan 2023 10:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHZ6-00012c-Cv; Fri, 13 Jan 2023 10:45:40 +0000
Received: by outflank-mailman (input) for mailman id 477187;
 Fri, 13 Jan 2023 10:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFx8=5K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pGHZ5-00012W-GN
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:45:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6972e169-932f-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 11:45:37 +0100 (CET)
Received: from DM6PR10CA0020.namprd10.prod.outlook.com (2603:10b6:5:60::33) by
 DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.19; Fri, 13 Jan 2023 10:45:34 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::40) by DM6PR10CA0020.outlook.office365.com
 (2603:10b6:5:60::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 10:45:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 10:45:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 04:45:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 04:45:33 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 04:45:31 -0600
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
X-Inumbo-ID: 6972e169-932f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIPNvKLW+F3LOwqzbRlMR++7ST4WDbxUeBqiLRjPinkjYzhoEwZ9SNTorRjyukA3Fu9si1M9rUzWOcQX/rn0GYRXU1UFdiGrqrBOmb8wO5KqcpAnOwTONE4FBUW/v+LagHW2VFl1iHhV1Lgkkj8HqtHxl7OcxPHXl0nEPPcZ8uY7lx+TUfDmAZsJJjCqTBlTQCAHSW10JdqO7Py9JLNi8lPO9Do5I2DESpVL+uWNlRHoRKmXmlbV3zEyjbR4C8bdw+wSdZjkLEcSjj622Q4UVGn0w8kHfyr4sSmL8MdoNwpxa/cLc6uqtZpUS00zy6tfMQPGUsOhF9HzmBbgitG6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9J6x8qredz53eStATv7nQ4sBPEGPs+D2tq/zbtF/2A=;
 b=kuqpX078QN1k7tWNgwF2L7UFfTjeiTNZTJnbf9lRHifkmn0X66MIDIw649oXnOxSelUcXJtnjMY6Mt+bUgCxxDd8WGX0S6jHyqmkN9vAzKwufh+eQhKQTOqAERUgYimHeS9Jvj8/IDt0fnzctVevL/fGnYmbxQM388uS2ipqhtGKWRc3ZUZSNFyyoQh3u61q3rw5Usque8GcUg1lg38ImgXP4M2OumqUt7wAeFQlSWD7Mwor+6eDOdy68nXg5guZQEYfJUQ5AcTvVRhp7FlC3W7EtOU8vz4g+SRNUC8Bm0hqMrTb0485RWssQkwYZbXUgYipFlYnsSHOJeUUZ8UxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9J6x8qredz53eStATv7nQ4sBPEGPs+D2tq/zbtF/2A=;
 b=lJde9UFukwOg4h2kRNdy1fe8aqjJkZInyBp4+PHPv9IpqJX7W8HELGptmdotRnS3b1D2UbOIONiu4AsCgO1HOHnD7P3W9rEEcNqyYQW+yrDujA66cIDly8jWaBZqNCIpg064mJmQEOKfBmnzv79GBoBbqLap9Rn/2+wbEpjArMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <092f9d85-954c-281a-8738-de82f90be248@amd.com>
Date: Fri, 13 Jan 2023 11:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 06/14] xen/arm32: head: Replace "ldr rX, =<label>" with
 "mov_w rX, <label>"
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-7-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-7-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: ed363fb9-498d-4eef-8f4e-08daf5534c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hqkqeZ6M0pnS0Q1O/G0xwaNCk+PoHkQjbvp+2DarfJNBCrmeyltfLhUzkz0iDsMKTRIEC7cxHy806ZHxw+5JEiinV72HgHTpdHXqlZxNuk9luiBF5rNpcju8jZBVo79apL2gMdwWYbUlLq3w+RHjS4XdDOHcvTmLoPhU4M23jOjroIq7GnvXrAKh0rfZn0pB7QD/UETbSmK5sStjPbexaxL5sCdIoBk0U/CvFJ/DmAvDYYZDFhWCli2D0vYWuoOdWlee/wiJ1JB7hx/LNsI/LdThJgERH3a8rl42TitmJ08GdorQBLsUtSGtvX9mWM1R6D4pJg7WR8UAcV5vbbKkIIa1uCBOQ7QYXs1YVWK2CDtIeWA1gLuMsIAq7ev2PPAnqpV/aCv1Od4XKP8ecGGDju2VRLn3n02S7t+8YcSHizUiArjWhGMbBRYYajcikJVCv1MyJLYAAJXrRxVL9tqW4JXyyOcYx1wq7oEzgO0tHde3lA1plgxEVSotlFaHtQGBxfDKEPnh2RFSym2eO4+yTluKoK4oUxeqtROhWyJg1nvvDciq70yMyN6aHaRc1C/aK+o0DQAM+dFUhh/KyiAUzl5fABnuqiYgXo/CyhsyYfKyODa/x+ExkwfVap5U+BbjD7PPltf28/Yo0dzLEQvay1KRdNbvnycT7bCEPmCp/kpTjlyHSiSqT9UXZnuZsikj44WShSUU40UEw6DE1uKMFxiaeNn3wHmgaunjbUxgnLdSnEiwrWQAXOFxZIfI6bU872q7TXv2odLGZYnwjqcN9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(8936002)(31686004)(8676002)(41300700001)(70586007)(70206006)(4326008)(54906003)(16576012)(316002)(2616005)(82310400005)(44832011)(36756003)(2906002)(5660300002)(110136005)(40460700003)(4744005)(40480700001)(86362001)(26005)(31696002)(82740400003)(478600001)(81166007)(53546011)(356005)(186003)(36860700001)(336012)(47076005)(426003)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:45:33.9297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed363fb9-498d-4eef-8f4e-08daf5534c73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418



On 13/01/2023 11:11, Julien Grall wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> "ldr rX, =<label>" is used to load a value from the literal pool. This
> implies a memory access.
> 
> This can be avoided by using the macro mov_w which encode the value in
> the immediate of two instructions.
> 
> So replace all "ldr rX, =<label>" with "mov_w rX, <label>".
> 
> No functional changes intended.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> ----
>     Changes in v4:
>         * Add Stefano's reviewed-by tag
>         * Add missing space
>         * Add Michal's reviewed-by tag
It looks like you forgot to add it, so to make b4 happy:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


