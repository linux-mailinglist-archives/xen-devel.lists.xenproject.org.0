Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3DC7F34D1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638065.994334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UOW-0006b1-5X; Tue, 21 Nov 2023 17:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638065.994334; Tue, 21 Nov 2023 17:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UOW-0006YO-21; Tue, 21 Nov 2023 17:18:40 +0000
Received: by outflank-mailman (input) for mailman id 638065;
 Tue, 21 Nov 2023 17:18:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5UOU-0006YI-M2
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:18:38 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff8189b3-8891-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 18:18:34 +0100 (CET)
Received: from CY5PR22CA0090.namprd22.prod.outlook.com (2603:10b6:930:65::12)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 17:18:31 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:65:cafe::66) by CY5PR22CA0090.outlook.office365.com
 (2603:10b6:930:65::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Tue, 21 Nov 2023 17:18:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 17:18:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 11:18:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 11:18:29 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 11:18:28 -0600
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
X-Inumbo-ID: ff8189b3-8891-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgksNS888DMA1Vf0uLJS5Jn/QTXXzFIgZxdtdJG+FjHwKKSwHn0hI8bXjeY8PWY3fZBXwLZo0GB/P2p5o38u1ZofJuvpH6DKAnpGBmfkE0udPDqA6TfIAQUocXLYxDvJzvbdGxegmfMDI+VgBu/GhH0AwuEf8yiRtF+1e+0CSJB2FWhQTiaiKxmInJ45dF/HE9hKWSZwo1XB3Lwjln6+4NoEcvXG6oiKMXOQtFAc6KQlCIc9ZAMikCAdbIUIWZ3bYWq7N1ur+nb5kY2i76uxaXu2WweOMgrxxrpMY6TkCWydKdnDTeZTI/rmOAXugfQYaRMMq/0YOZjV213dNlUGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnOskI6WWO0cXC48DYa5rmbPVghd5aU+26T/jbeh1iM=;
 b=FmeQHEMrQFEzoHCmxnbDz1t/BGDoBFILR48ZUlha1DSdCSOlYzqa/50Ndrb3/TDhqOggF7x/cDCz1jn4f1ybw+JOoixSrYiYhN8zTEzSyisfjoP/c0NWjx+9H1rCb1ZDwCuEo3nJUlnW/wn917g5o/cy2PX4GjUsraFrBJPKKMgfwJvAGVGEgV6cR5S0TPGCPogSPwwRpHYe7Of7xRmJf55UBPBaOpkJ7gwD/fQqGUSvrbzJrc/ddyaMO974csfeYdTa9O8xru103oYloA5dZ2OEPZSALkHn2OEtpTa5AtX7VZ7IJO1SAT0J4YeFFbvhf4JM9ejfGvstQc+oSBs/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnOskI6WWO0cXC48DYa5rmbPVghd5aU+26T/jbeh1iM=;
 b=Owa2McDqp2KdQj8VDNL4S3jpmqAQ/tY6mlqSWqvO0IXKalJD39egpK0eR3KUrkVUoqc77Zu5C/QT1Pz/cY1fqVi1PilLf/LIO4AvyjNTT+THmo22T7AtNyfhGfnehyqVIgU149Y114AuPMGkwCwH1NOvEi0CkAIYUhCaTWx+o+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <609e34d9-654b-4dcd-8be7-15aa10fe3a25@amd.com>
Date: Tue, 21 Nov 2023 18:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-2-michal.orzel@amd.com>
 <cbe5470e-2017-4c4f-bd32-987da72aaf44@xen.org>
 <5b4ac8af-98a6-4757-9946-d520baa6a2a7@amd.com>
 <20135dd2-d36e-4c83-bdb6-b987174f18f2@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20135dd2-d36e-4c83-bdb6-b987174f18f2@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acb22b2-d817-4a92-a5e3-08dbeab5e21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0I4UiBSHKVIb1JGgnwWH9Eg/DUlZ1yOZ78CMdWMAwx3MnJ2TzkRZgqdubqdVjA0us7nhZ/mNOUxNI5NbrTN0c17A0tYpP4gXBJvtUepHcJoCvrngO7mmPJsL9faVWqe1mgRJhpwwcjfmBie0ZksgwT/Ibly6YLdDSvCDIALluKxlbZzbMQtItTPN7GXLaAq44qM6Vn2jqSmfusZAQo8nzt8NYnP9plfoPTKsVvkogsO8BQUcWyc6fo3Ilop30bfLMYh6dxVdYzc5tDSCv1pycBVtv3cQbUce80PfXGU41oAFxz+aYKd0o3LvYGjRlL7ENdy+l7jPFjKE/Sy6ojBDu6HpRaiLh87PGhYOlZfeIHwYqVejf29VnhNRW7ZCS5lrKQjST4rtsgdtaw5QzSCdHklbo3A66SAug2/k8BS0PSrwX0ABW1P9frXRTn8YbQOajIg+Ph/uH/vpN/pjN4NMaz5sStq6PmZdZYZZdEPM21XgrfrBUqdMHqY8XPejkbRyYssiA/DeOC9zkCM5uoyuKeLEiQKt6mfQPl6psINRQOClKmGitTzULPpmISVlS1Fbnq+IKeNeDhaCGEvnAT9wrYrx7vShKcgVMcU+kf9/6hfOTQZNgvNP9pO0M2nkNcrHxiJKdlBrvHJ1Ntstt3e0OJ/fLyuIpOqjT6qOqbe9RX9T0BRFJJfpc07R4ALWbc5emIM+XSa8+6BPy5vclZmbmOTEDtij7ihIg6g4yBs/c4DespoKZ8Pkp3+6EdcE5kffDuiwUNrOvsku6DlqccImkUJmsji5jeUpvAFqgeUReQLUXhOmUM4js2/RrZ4/nBnApHr8hKPibQPfIQ6y0nWUBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(44832011)(40480700001)(41300700001)(8936002)(4326008)(8676002)(31686004)(316002)(70206006)(16576012)(54906003)(70586007)(110136005)(40460700003)(66899024)(47076005)(86362001)(478600001)(26005)(36756003)(53546011)(2616005)(426003)(336012)(36860700001)(83380400001)(31696002)(356005)(81166007)(82740400003)(142923001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:18:30.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acb22b2-d817-4a92-a5e3-08dbeab5e21d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959



On 21/11/2023 18:04, Julien Grall wrote:
> 
> 
> On 21/11/2023 17:00, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi,
> 
>> On 21/11/2023 17:09, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 21/11/2023 09:45, Michal Orzel wrote:
>>>> At the moment, the 'hex' string is placed right after the 'putn'
>>>> function in the .text section. This is because of the limited range
>>>> (+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
>>>> 'adr_l' instead (range extended to +/- 4GB) and move the string to
>>>> .rodata.str. This way all the earlyprintk messages will be part of .rodata
>>>> and the behavior will be consistent with what we already do on arm32.
>>>
>>> This will be correct today, but I am actually thinking to move 'hex' to
>>> .rodata.idmap so it can be used while we are on the 1:1 mapping and/or
>>> temporary mapping.
>> So you are planning on extending your series to also cover arm64?
> 
> It is not in my soonish plan. But you are arguing that this patch is for
> consistency with arm32. This will not be after my series.
Hmm, consistency was not the only reason for sending this patch. It's a beneficial side effect
given that putn implementations are very similar on arm32/arm64. Are you saying that
moving a string that is const from .text to .rodata is not a good change?

> 
> And I would not change arm64 just for consistency because I don't view
> it as necessary. The boot code is already not the same.
I don't recall trying to make the entire boot code consistent. But if there are parts that
are almost identical, I think symmetry is welcomed. It helps reading the code, at least for me.

~Michal

