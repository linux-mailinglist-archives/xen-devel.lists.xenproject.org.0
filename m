Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF758A6692
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706762.1104132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwedc-0000d8-3S; Tue, 16 Apr 2024 08:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706762.1104132; Tue, 16 Apr 2024 08:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwedc-0000b1-0H; Tue, 16 Apr 2024 08:58:00 +0000
Received: by outflank-mailman (input) for mailman id 706762;
 Tue, 16 Apr 2024 08:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=po3y=LV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rweda-0000av-Sa
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:57:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a954ae1-fbcf-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 10:57:57 +0200 (CEST)
Received: from CY5PR15CA0217.namprd15.prod.outlook.com (2603:10b6:930:88::6)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 08:57:53 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:930:88:cafe::d3) by CY5PR15CA0217.outlook.office365.com
 (2603:10b6:930:88::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 08:57:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 08:57:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 03:57:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 01:57:52 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Apr 2024 03:57:51 -0500
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
X-Inumbo-ID: 6a954ae1-fbcf-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJcfBTJ8es5HG3nJ700BdfJHo+3LFpDhp9wKNOMRqFVgW/WegxjSSnMM2x0jX38Nf6L/na2EI9LPHaY39xnDdQcipGBBbPj9rxnG72onfxcDpR1LmzLGCOcvF/QIsRoXJ4KqvQ1c4pBMpYgBdy4k7QW71BW5k7pyikOAq6N7kanLNAPY7veGyh8puv535c9m0dfchTVGh9Ax7paUn5rgQFBHNPl+e56VhzGGaGNuyddgHIz9v+dnjEJ4afzKE7dR81K4TShnGqyVRYq8MUAx9vnotwE5/Don2LYyFOn1rHmXfxIGppwicbB1AmyX2YmCoXWnzThH7l0Mi+Pq4POfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47IhZGAxV6K8jtfPatfyyJPzlu0xvtWCi4xBOL2Lckw=;
 b=gyLqNx5jJzTPXmaTzq5GtBR3aJHV1o4scRedOL9DzRMo0ZKgj471lWWJJpPy81MYRxW4H0zd5gpRjMe06l3WBJTKJt33BVU2IQg6gSDR2+KlJ5bCakGSdEYB95ldgtxmTBBSaX3U2MVnBacr/eDMr0MlOC3xckXoamP5LNtR1nhick0uvQ2fJmh0MSEwysRz4E9/aMeTifWjoAw6bIoxiohBOxn11TRWnwWawWCjGQj5L9Eo03Mw7SmqnOChpC1mnm717yAbg2ZI8A9DDwgqDPJvH+S0qQIZnLreRCNXhzMFXcGcnCNRXJYcj4GxP6jbQIdA5reU+gQotE7uCGiFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47IhZGAxV6K8jtfPatfyyJPzlu0xvtWCi4xBOL2Lckw=;
 b=Doz4R09TgQtfMIAl1IiG8GhCNLe50XGiy+zUiWHL5ayG9IUWmlGjPQx72hyY09IiX0rMS5j4hQQRRIwl0dq7jo8OqDy2mpHsfRNGrt2nH+/h1Qi+cwcvvQac2uvUdOyPrLFH2VvsNiaPXaa6AWHLU419G6E0CdznE3/efn4yW+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8d4e9568-fc88-46a9-a982-90d476945c7e@amd.com>
Date: Tue, 16 Apr 2024 10:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-14-luca.fancellu@arm.com>
 <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
 <39165767-26EA-4849-9C02-12393933139E@arm.com>
 <74cfa4fe-2ee8-4700-be90-4227704f96d1@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <74cfa4fe-2ee8-4700-be90-4227704f96d1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: 69604b31-3ba5-45f5-8df4-08dc5df34d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PzrbqWD2axYFm3N38aeMJRyExvFoBcfC9uF2yxvXmfG5cnDPbxmyALJu01k3+3H8nxfIkxfiR+NCtoIoV6z1yT6HNV9iwSh/VchZ+44a/Lkpf15AB+NdWQglxhvGW9wbZ0+SYG35vFxmvM5/2QIgFwlHfh01XRpo8PdWzUv7JEejvrv38nS9yDQ55sGE1CcR5EDfTRvKh51vFAFyTKLUTcZKL7rK8SnN0ntbJ+gGn616dioS/l7+1bAt0hNGdNPaiUKXniZZptrDmIvs6CspHuHhRK0xaZe+clJVn3AVdj24bS7utQuyWwbXr1CEQ4AMgQWSyutcP/Lgi3kwWChYu4pZHwpucwVyre2bsRKzSPLo6U+8TndCU+mPLQQLtaJmQfPpDBglmN7MgY8uJ/1IhW1Gl400H3F7vMNXBbvzGoDY5ljts2WAWD8IITAST6MtgFXC4DaeWz81Dea4NzB7hIHsj4M3JWtb3ZIPLzu2wnVc2vARahZOAn0edR8AaIfj5GjhXbW/JYvxjGoUzByhD1A9Nk7lBOLFBCyBNkeXAqCnuP5yKnSPmpvDrl5vGfdiRKhVbRsvCOSgZi/eggkIziVKgj30V3Vw7PsdClTzZO00TSvv6/MsxuTq+SkFL1gHeqkp6N/+Re8WTSNsbsFb2RTcJSv0tws/8lvGDuQoDbqrco6pv74K3/IjTWYICQZFh+ejMNX8aJw2NF4vuGXCo6SKv+zdi48Ag7UWlMZgU62fLkgat6mJxidx+wHWb6i5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 08:57:53.0827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69604b31-3ba5-45f5-8df4-08dc5df34d1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342

Hi Julien,

On 16/04/2024 10:50, Julien Grall wrote:
> 
> 
> On 16/04/2024 07:27, Luca Fancellu wrote:
>> Hi Julien,
> 
> Hi Luca,
> 
>>
>>> On 15 Apr 2024, at 19:41, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Luca,
>>>
>>> On 09/04/2024 12:45, Luca Fancellu wrote:
>>>> Currently Xen is not exporting the static shared memory regions
>>>> to the device tree as /memory node, this commit is fixing this
>>>> issue.
>>>> The static shared memory banks can be part of the memory range
>>>> available for the domain, so if they are overlapping with the
>>>> normal memory banks, they need to be merged together in order
>>>> to produce a /memory node with non overlapping ranges in 'reg'.
>>>
>>> Before reviewing the code in more details, I would like to understand a bit more the use case and whether it should be valid.
>>>
>>>  From my understanding, the case you are trying to prevent is the following setup:
>>>   1. The Guest Physical region 0x0000 to 0x8000 is used for RAM
>>>   2. The Guest Physical region 0x0000 to 0x4000 is used for static memory
>>
>> So far, it was possible to map guest physical regions inside the memory range given to the guest,
>> so the above configuration was allowed and the underlying host physical regions were of course
>> different and enforced with checks. So I’m not trying to prevent this behaviour, however ...
>>
>>>
>>> The underlying Host Physical regions may be different. Xen doesn't guarantee in which order the regions will be mapped, So whether the overlapped region will point to the memory or the shared region is unknown (we don't guarantee the order of the mapping). So nothing good will happen to the guest.
>>
>> ... now here I don’t understand if this was wrong from the beginning or not, shall we enforce also that
>> guest physical regions for static shared memory are outside the memory given to the guest?
> 
> Nothing good will happen if you are trying to overwrite mappings. So I
> think this should be enforced. However, this is a more general problem.
> At the moment, this is pretty much as mess because you can overwrite any
> mapping (e.g. map MMIO on top of the RAM).
> 
> I think the easiest way to enforce is to do it in the P2M code like x86
> does for certain mappings.
> 
> Anyway, I don't think the problem should be solved here or by you (this
> is likely going to be a can of worms). For now, I would consider to
> simply drop the patches that are trying to do the merge.
> 
> Any thoughts?
I agree with your analysis. For now, let's drop this patch.
@Luca: This means I reviewed your series completely and you can send a respin.

~Michal

