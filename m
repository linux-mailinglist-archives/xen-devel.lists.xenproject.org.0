Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D979A875
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599446.934908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhTb-0007N0-Le; Mon, 11 Sep 2023 14:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599446.934908; Mon, 11 Sep 2023 14:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhTb-0007J3-IG; Mon, 11 Sep 2023 14:01:19 +0000
Received: by outflank-mailman (input) for mailman id 599446;
 Mon, 11 Sep 2023 14:01:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfhTZ-0005N8-TT
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:01:17 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad46eb0b-50ab-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 16:01:17 +0200 (CEST)
Received: from SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) by SA1PR12MB8096.namprd12.prod.outlook.com
 (2603:10b6:806:326::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 14:01:13 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::cf) by SN6PR2101CA0015.outlook.office365.com
 (2603:10b6:805:106::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.3 via Frontend
 Transport; Mon, 11 Sep 2023 14:01:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Mon, 11 Sep 2023 14:01:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 09:01:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 07:01:11 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 09:01:10 -0500
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
X-Inumbo-ID: ad46eb0b-50ab-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kw36Ht/KL7ayI2K1z6lh7SHEwnWi5qnOucBxnn6QcApxFvBdZRyM7R8Z0NGfvwdqbQk9Lld4f99ZgMdQ3inq4fOrRLuEFGcm0OugyA1cropFGaKss0awcjOQiHy+AgQouZD/I0/zX4m2LUrrs7kUz90K7Us6WOkbvtmRSvXfOxr3PUE4HTsPqngjgpBib1e7uyCo6qRdZHV9f4qto0eK/xbx8R62gIsLlnTr4bRYmFoAyomdUy7fFP5LkK3+uf5L4QnypSGbNsYifAV0FV7VaPcVgeW5nT4/txGpXFYGs+t/DE/82/C5+fSQCl3Lw0vCBX5Pz/OhSboeGbP8Voyh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjGYVLcBdnVTAOB4ZKotPMviIqusi914qXiDXN+m48Y=;
 b=KzWmMQFo/mGnS0qkWPIGLHbVQREIE3kJiZ6Ai1r7AuhUVlAknUsjvOcY7dJcDKttp4rH0/fMI1MnsGlYGhyEb2sKMZ/eMK9p/RJ52svCJhhgvMv2tzdUjQu0izw5yp8QhRKL9tdFgGJaIl5y87X7VjjjgoIbxda8dCjb7kK9EWhJl14DzraqvaniDEz5MrxsjliYEe8ZeXZ1GO4WiOq5bP0oBTBkvYO6OMp6bjmkTfb+cUCbAxW+gXtIN2tl/6bgDR8pZmwTaa/BmTGYeBDknPFityqUyy79j0ZVIP76QuvPDJBO3eek5UWU7ieeOoXZ3xEoponMxLJDP9a+/hxEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjGYVLcBdnVTAOB4ZKotPMviIqusi914qXiDXN+m48Y=;
 b=ZzmlnlKBkj2I7NU43/XB+X/lyzJnR901TcVsi2yyPJnSTmh4iK/VNhY/ceDqsB/thJCoK4NzYeXAey3qjPo5UcFuSopl3ueXEuU3qAYplDm1gDVK+3jVhZlYQ62svbxEfkXKjqKYZQb/w05YbK/tFoGlLXYhkUFpIFl+At6MAeg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <042fae56-e8e2-c079-2686-d27c5469b7fc@amd.com>
Date: Mon, 11 Sep 2023 16:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911123401.27659-1-michal.orzel@amd.com>
 <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d605722-f2cd-4b78-8914-08dbb2cf8eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NPjL8whGNcxVhMs+7BkOnTZivKspiGE0cxiIoSlucRBpgf/DvWOIN+SCGhDP8I+AK7eOObxMPgOGp5OuUYlTY1tIVrWKqpYvt56lJCNuCm1eFPHJeDZlh0GrpNmRji8PbBM8DvQ27EMNLAhJlTeHftMXFHVf7Jci9BRVYKf24cj3vvywH/k8nR9dMIQvEYiq8FXzTLbHJcbDhbySG1ax3urPfV1aKgxJVU5OyIN82uKbCd5ZLfdWUET2PLalk1X+uhr/MF3Hl2+wQ1zKZ/VOx2BJmh8E0g83vokoXUtToEAiOTKlsfLuElkd+pQ+4s+no77L44S98F3KaMOoeaGrwCgrLZ2/KnMiIpEcqMNF6np2ozlPsQi5vqjYKGv3U7B0nFrjF3BOCYkah69WPYtDPDg9wtT+UQbGviauq8PgWNeq2xSm5WsSzOvkaPJd3W96ZqO53jsjRpS0Smm1ixmui2oCMtmsmhqH+pzXz8c0foi4ENYkz4mCuOi8MvTQeJUSvpzBpq8008FOY7PsPPqnwYLMQrGQetcwoqbfPeqFAYPal75J/aFUuIBW5lYA4m4HS8WtV7gYVNQZPnAPv7cz9oWZrKKyg2P3VUW+S7AZ242/vr1WvdNeFDuU7yaQ2XVG6KU5gG1CPw+qAhvY7r4Xs5CHbCDd/oEnaub4ambQWIwl/YsxwFeOk7mhLiJ4TYpRCAWxLK2A2eqwaPWuJ2ksx7bVlCVTKP/dY9ykTgcVRQJ1+W2edzIND1uDoxsTZHVEyEQZ+D8LLTVsW8AFz3NzWlHQesjBSjaEomDF7OXZFhrEg/w7bVq8nd2uInGuFW54/2qqPsIOPbBHuTt3BKraDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(6666004)(53546011)(966005)(478600001)(83380400001)(2616005)(426003)(336012)(2906002)(26005)(16576012)(44832011)(54906003)(316002)(70206006)(70586007)(110136005)(5660300002)(4326008)(8936002)(8676002)(40480700001)(36756003)(36860700001)(356005)(47076005)(40460700003)(31696002)(86362001)(82740400003)(81166007)(31686004)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:01:12.4078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d605722-f2cd-4b78-8914-08dbb2cf8eac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096

Hi Julien,

On 11/09/2023 15:14, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 11/09/2023 13:34, Michal Orzel wrote:
>> Host device tree nodes under /chosen with compatible string
>> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
>> meant to be exposed to hardware domain.
> 
> So, how dom0 is meant to discover the static event channel, shared
> memory it can use?

For static shared memory:
A node with this compatible is only meant for Xen since it contains information like host-guest mapping.
Xen creates a different node for guests under /reserved-memory.
Linux binding:
https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
Xen node generation:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;hb=HEAD#l1407

For static event channels:
This is a bit weird so let me put it in a different way.
1) Xen does not create any node for static evtchn for domU.
2) The booting.txt states:
There is no need to describe the static event channel info in the domU device
tree. Static event channels are only useful in fully static configurations,
and in those configurations, the domU device tree dynamically generated by Xen
is not needed.
3) The "xen,evtchn" property specifies the local port as well as phandle of domU node.
dom0 does not have access to domU nodes, therefore exposing a property with not existing phandle
makes me think that:
a) point 2) applies to dom0 as well and we should hide this node or
b) there is a missing property for both dom0 and domUs to tell them about static local port in a proper way

Exposing Xen specific evtchn node only to dom0 and not to domU with required information happen to be found as first value
in xen,evtchn is definitely not a proper solution. Also, there is no Linux binding for it.
All that makes me think that the author's idea was not to expose it.

~Michal

