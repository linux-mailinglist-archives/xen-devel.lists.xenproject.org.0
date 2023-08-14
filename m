Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53F77C228
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 23:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583803.914129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVeqf-0000UR-Me; Mon, 14 Aug 2023 21:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583803.914129; Mon, 14 Aug 2023 21:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVeqf-0000R6-JX; Mon, 14 Aug 2023 21:11:37 +0000
Received: by outflank-mailman (input) for mailman id 583803;
 Mon, 14 Aug 2023 21:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D2Ba=D7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qVeqd-0000R0-Qz
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 21:11:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21d8ae08-3ae7-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 23:11:30 +0200 (CEST)
Received: from DM6PR10CA0026.namprd10.prod.outlook.com (2603:10b6:5:60::39) by
 PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 21:11:24 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::ad) by DM6PR10CA0026.outlook.office365.com
 (2603:10b6:5:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 21:11:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.42 via Frontend Transport; Mon, 14 Aug 2023 21:11:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 16:11:22 -0500
Received: from [172.22.191.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 14 Aug 2023 16:11:22 -0500
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
X-Inumbo-ID: 21d8ae08-3ae7-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgDucqR0qctKHUy2s2yVHp30V3eyu2Qkhkg+yYmg9XPhqRz8lXOmeodY3u8nzGcJ0jzNWiDwq9y0SeC6SVk6Lg3xjm29RA9YxxeNatQi4w6PKCPPj5W/AoA2JNLj7HAubK9BemQo+PT2lnJgPumggN18Md6KX6a2sMsiAPENmvMlwAHVY4Sk5GqWnFlqzD8NNbPie7c3WPoCJqKzJfFJszUF+48Jb3KGWQHULqizJfDHhWjhths6ibTlQARVmP5DLFZgKncl7M5EzjKhLeEEZp+tr//h6vk2gQFZ+aGfpnEutbxNg5LORr09f5SdNc8EDXQm6Vj/D3E5GBbdc4AqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao/5dtiNUpxNevILOmbsQh1BCZjALSkqiUEmLmDrYTc=;
 b=FsZ8SDiDrJF/1dnbfxJBWZX5kubPPlgpVxeamajt1mb5q+wYa6e1cD3l/xZRHPruiSrsEffOr7YBYMFLLn4b4lDWExSaO4yNgRdq7hlzWIsCPUtNM8sYwo/nL88bChvINBBKGur9mztUxn/13kslBliOy+ObAqYW9IsHQr6GG3fSapkm2c3IjL9ujN+RqSrPX+mxOaW3KLPIcKsIuU02r/q+ZNuS/WXQ6JoJKX0k20hIl4kNW5r5afxHo7JrDItyJdi00MbO3J8OINaOe3vnxZEINPLGLq7cW6PWL11fLdd0k7/Oz5J+cTXMWHR9/UOftmS+stwtfZAE9CSvHcujmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao/5dtiNUpxNevILOmbsQh1BCZjALSkqiUEmLmDrYTc=;
 b=o20G2hwJvrjryhMXFzJquWyjnALFXROOMBAYh8Bm38aVGDW5xUxjicAIknW/t6Fay+Kj3GRrpc33CSQnyke/BuKJVdV1oE0edf7BgMeva5FM7Rw6alTO7go6ayWgqJK3w+ol3pjP508S1JbwE/A0EbDf7lt4kWn1bxDX1sKXfWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0dfbf498-affb-133d-08bb-69a96d629d1e@amd.com>
Date: Mon, 14 Aug 2023 17:11:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/3] vPCI capabilities filtering
To: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
 <98616195-71ef-23ce-e6ed-0dfb6e10020c@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <98616195-71ef-23ce-e6ed-0dfb6e10020c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT005:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 96863bf8-9905-40cc-b668-08db9d0b03c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3IppG4X8Bp4QgY3YD6rQ3ELNyzkwpvC3iOvHhlCyEB01psmnFE/5NyLniGu8IrWp4f7fyCJGY7oq3zF8vLRnaV3uUMuNHJ51MhBb9iV0qj146fivJA6OkjccvbqUY6Po0HooA1hK0BuYUegTwj/io6uHje1BA/dw0xaCqeklwKxPJBCD0spfeDI8j/aeiO/6+JQqGT1vh9E9jNgtBU7cHcjmm27uHPKufYVlZxhJooCu5DCCQFNVtY7ydjKg+uUKUUzVMbwYgI3ozK46ETHde/wGxYMUlnuo3qUFGC9Ly7j7TXsHmuK1P6OEA4m2dbtzcBTjybN905eym7BmNmUJscD2NfV5dltSUzX8mF3Ndm9bSlDKjl0EBajIqqBcqvWYPhnCJdDvo2WrkUgTGxj2JDN2QKhSEr9EUqq3CsvbbO/5tbtq2XSwtWZc/GZ/61ycciwk12kDBmUC5pmlZUObHMb5C24NnpM+K1+vFZKtTMAhkcapMKRYEexu00WAtRScqYeqP62GyQYttF95aNKHAwgwtavWReNGH6Z8YwQ/t6IcQKIm17WehPPqIFz3H7/Kb7bGJ+s6/vFbd9JO5UmlbQcvYhltc03CinZDhT4wS+3mGjgRh7L+be/XspgPKgH+umwxSkxG1YbzPq20XpWE/ZxUStPErBdYLSgm80sNixTUvmZoROHFq0WgLbtoGcL8Kvqpf+1nGLn0jDLLz+vh8tZDZoqI1IJCA3elsj0oUNWK7NEcZF3QO+mRZywGhkNcVbn4J7dop014yAaTWbV2+As59LvGIvA2eWT/M1CUY5s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(82310400008)(186006)(451199021)(1800799006)(46966006)(40470700004)(36840700001)(4326008)(8936002)(86362001)(478600001)(966005)(8676002)(316002)(36860700001)(82740400003)(70586007)(70206006)(110136005)(41300700001)(53546011)(16576012)(5660300002)(44832011)(26005)(31686004)(31696002)(2616005)(36756003)(426003)(336012)(66899021)(81166007)(83380400001)(2906002)(40460700003)(356005)(47076005)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 21:11:23.5634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96863bf8-9905-40cc-b668-08db9d0b03c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607

On 8/14/23 09:59, Jan Beulich wrote:
> On 10.08.2023 21:12, Stewart Hildebrand wrote:
>> This small series enables vPCI to filter which PCI capabilites we expose to a
>> domU. This series adds vPCI register handlers within
>> xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.
>>
>> Note there are minor rebase conflicts with the in-progress vPCI series [1].
>> These conflicts fall into the category of functions and code being added
>> adjacent to one another, so are easily resolved. I did not identify any
>> dependency on the vPCI locking work, and the two series deal with different
>> aspects of emulating the PCI header.
>>
>> Future work may involve adding handlers for more registers in the vPCI header,
>> such as STATUS, VID/DID, etc.
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html
>>
>> Stewart Hildebrand (3):
>>   xen/vpci: add vpci_hw_read8 helper
>>   xen/vpci: add vpci_read_val helper
>>   xen/vpci: header: filter PCI capabilities
> 
> I'm not convinced of the split here: Seeing the new helpers in isolation
> leaves entirely open what they're to be used for.

Our code review guide [2] (section "General Patterns") explicitly suggests separating independent helper functions into (a) separate patch(es). Whether it is one patch per helper, or all helpers in a single patch appears ambiguous.
That said, I'd still be happy to squash all these into a single patch to avoid the transient dead code situation - please confirm.

> Plus besides introducing
> dead code (even if only transiently), you also introduce cf_check marked
> code which isn't really called indirectly from anywhere. Yet we'd like to
> keep the amount of these markings down (in the final binary, not so much
> in source code).

The helper functions will be added to struct vpci_register objects, where they will be called from vpci.c:vpci_read():

    val = r->read(pdev, r->offset, r->private);

Does this justify the cf_check attribute?
If so, should the cf_check attributes rather be added once the helpers are actually used in the patch "xen/vpci: header: filter PCI capabilities"?

[2] http://xenbits.xenproject.org/governance/code-review-guide.html

