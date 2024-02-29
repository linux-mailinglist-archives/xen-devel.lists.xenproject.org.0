Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6986C943
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:32:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687014.1069709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffae-0006oH-EG; Thu, 29 Feb 2024 12:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687014.1069709; Thu, 29 Feb 2024 12:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffae-0006lT-B5; Thu, 29 Feb 2024 12:32:44 +0000
Received: by outflank-mailman (input) for mailman id 687014;
 Thu, 29 Feb 2024 12:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aH8z=KG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rffad-0006jA-9o
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:32:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a132d30c-d6fe-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 13:32:42 +0100 (CET)
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 29 Feb
 2024 12:32:37 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::9d) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Thu, 29 Feb 2024 12:32:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 12:32:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 06:32:36 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 06:32:36 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 29 Feb 2024 06:32:35 -0600
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
X-Inumbo-ID: a132d30c-d6fe-11ee-afd8-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIltx6Sz8sr5t+Ht/MdXpzOkYwyw1DsQv63EumAQWepxxj3rZIqQw4QjzZ2t+P13y/3nOKLoiNQ6cfszM3F2Cwyf0jEXK3js+srylU3jrFwfHNJjjYl1B+X02fPxqRyyCgREzHr5t/C3rFNgl5B2GT6BrnbU1mfdSSygpDfoUeoCSCC3uLax6XgTx5ofRobqLqhlpcyg4XeBy1K2pC8tck08lczomg91yE77C+QrwzlXR4FoC91qZyjdGpkHzl3HGwn1oehWP0yyebwlBGb56WPxpkbxrJYYfJ36x5eLFnII6Njen79TzEQVH3nKf8QI8DEcdnded+WpYx5gOXwB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlaPRp4dxBv1LE1vxL6Yk9Nptb5zzoJhHzbFlvkzh90=;
 b=isXVQ4P7z0sCDJm16JN5bhh/Nl6XJt+d1/mEadGmk3f1LfXQAJrYN1TjN3nmLDvtf7vm2tf26UJogrC7KT1s8FWGGvMEFAcH7OZ0KbNVXQfwMItkW7jiz+TBVT56rY8hkDk56wYRj7gMmQ+ezcHhkLE2vSwaLa0ohhI7qtQUhbwuv+yEkohf5RACJg6ppk1h6gpDBaRCu2BqlJQyIoWdRnEynGB/6L7tJKPcRChL36vWjGLXk9miGRjXez9PKkDHxpA4ZinE5evOHwG0SmmEHWOdBVJ9N1hXTGH55STZsvrZBD7mwMDH/vH0jjGxeP5RZCAaFiOma1rjguQC3YAHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlaPRp4dxBv1LE1vxL6Yk9Nptb5zzoJhHzbFlvkzh90=;
 b=lMgoikC1ZogQmNyGOk6Q988FRRnSNplF9i8BAX/jrdE5kJ/avgQt8TxlFwU2izhNEQRFUIo1XJI8cpbv+b4NaMLne6la8TiA/dcyYb20xi4LmFKhWd/uRccdUUSxPEGrQ78p3dOxb5Ouuze+8M4hv8XaFBV6ItgnqInsn8+TNXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5671ee78-eeba-4bfc-bd95-dadb07c55cbd@amd.com>
Date: Thu, 29 Feb 2024 13:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240228103555.172101-1-michal.orzel@amd.com>
 <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
 <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com>
 <alpine.DEB.2.22.394.2402281425260.575685@ubuntu-linux-20-04-desktop>
 <8228a48f-566c-4931-9f24-27bdaa1f0f28@amd.com>
 <99b74dda-225b-4402-abb9-fcccfda0adbc@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <99b74dda-225b-4402-abb9-fcccfda0adbc@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b597ad-9f57-43a6-0417-08dc39228348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TMBcVLd3UonZt1BdDdjNqUswPmmSlpqSzLZe+M/EUx+zG5gDOa31FXxbrH4+c0HwsemQa39u9Yw9eFfexRKGgD4KmLbXz+02TgeZ9mAd9iY/5kenp9BydJLGdWJzbcz9gPNO0KbTDFkfFWF7Yl4TVHfl/ZPEjmroRaHy8hTUk2QmLlPqWr0vfGwAGAjWmL0ic21Av3RpmuKHbom160mWKXB8mr6AUDRH86Y+HxkS1D6d6tkE5UamWijMvhFwBb0I+ICCxhNrzLQgasLHrhs3RRg2JJIiHeqa+gVnEyi8gKLVAOnp4ntfRzOw5z+fcODfYQY2g/4rACagJ7z1Njs9AkPGBXcHYxKI2WV3A+OFN1NNkdPJhfrgg8BUsDjObra8DLCXw2RGCJN1XcOShkD1Rv9ideLmkKRpTteNGDisoqNMn7OIOaLtQMewlybm26Cz+IKH7XoEI+L5oUMpI2mh75e3vcH5JXkArnxXHt/I1Cf37sHX+Iz14QQlq7mI3b8w3ClrthY0y43yhfMCfI8ef11gPKum39khxoGjmrislBTKyTDfBa9CCvuQOJqZcVRaEUu/DxHiTb27WI7cdVok4SBgZfdilM6R2i8BCW5S5lBood5GHWmTF0uekghcOeevSu8zfhsOhrvMz6xOrDttzFHLdwPazyQSO/F1/xefaxRQgdHa3uPwqh4KHwHZcqdODy4b/aDSJheJY+c8TI/pk5sOwHY6z8IxdFhtG8aV7bq96XP3fsOatOsifQGxY30R
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 12:32:37.2880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b597ad-9f57-43a6-0417-08dc39228348
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676



On 29/02/2024 11:10, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 29/02/2024 10:07, Michal Orzel wrote:
>>
>>
>> On 28/02/2024 23:27, Stefano Stabellini wrote:
>>>
>>>
>>> On Wed, 28 Feb 2024, Michal Orzel wrote:
>>>> Hi Julien,
>>>>
>>>> On 28/02/2024 12:42, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> On 28/02/2024 10:35, Michal Orzel wrote:
>>>>>> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
>>>>>> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
>>>>>> failure on arm32, when early printk is enabled:
>>>>>> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'
>>>>>
>>>>> Good catch! Somewhat related I wonder whether we should add earlyprintk
>>>>> testing in gitlab?
>>>> I thought about adding this and I think we should at least have build jobs (hypervisor only, no toolstack)
>>>> selecting early printk. When it comes to testing if early printk works, I'm not sure. It'd be nice
>>>> but FWIR we have limited bandwidth.
>>>>
>>>> @Stefano, what's your opinion?
>>>
>>> I think it would be a good and quick test to have. To save testing
>>> bandwidth I think we should reduce the amount of debug/non-debug
>>> variations of the same tests that we have.
>> Yes, I suggested that some time ago. We could keep both versions for generic tests,
>> but remove the non-debug version (unless you prefer to do the opposite) for:
> 
> I think it makes sense during development window to use the debug
> version. However, I think we want some non-debug testing during the
> hardening phase.
> 
> Can gitlab read CONFIG_DEBUG from Config.mk?
At the moment, we have 2 types of jobs - non debug and debug (with -debug suffix).
They set "debug" variable accordingly, which is used later on to modify .config:
echo "CONFIG_DEBUG=${debug}" >> xen/.config

Without this line, Xen would be built according to default value of CONFIG_DEBUG.
That said, I don't think we want to get back to this behavior.

If we want to save some bandwidth, we should make a decision whether to keep debug or non-debug versions.
x86 has both versions for build jobs and mostly debug test jobs.

~Michal

