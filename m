Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF346A978A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 13:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505979.778979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4r5-0000vH-8W; Fri, 03 Mar 2023 12:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505979.778979; Fri, 03 Mar 2023 12:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4r5-0000t0-5b; Fri, 03 Mar 2023 12:49:47 +0000
Received: by outflank-mailman (input) for mailman id 505979;
 Fri, 03 Mar 2023 12:49:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvcW=63=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pY4r4-0000su-94
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 12:49:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db8e4544-b9c1-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 13:49:39 +0100 (CET)
Received: from DM6PR06CA0080.namprd06.prod.outlook.com (2603:10b6:5:336::13)
 by PH0PR12MB7886.namprd12.prod.outlook.com (2603:10b6:510:26e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 12:49:34 +0000
Received: from DS1PEPF0000E630.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::75) by DM6PR06CA0080.outlook.office365.com
 (2603:10b6:5:336::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 12:49:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E630.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Fri, 3 Mar 2023 12:49:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 06:49:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 04:49:33 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 3 Mar 2023 06:49:32 -0600
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
X-Inumbo-ID: db8e4544-b9c1-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArfK27/VY1drP0aZ91ApXczltW1dl9Nq23j5+5OWJVf1ZiuKB8SzDvrfbthLTZh1u+1iFtQecFD28dQD0AEeq00XW9z2e6UQv3F00kjBHOlDMM+itWHANotT3ToCVIPYuzgA8iO6mg7OC1NJVZmn9BYp5WJyReKRHkwFwraLzh2s+r6iQlHk1dYrJJe2ZPqnQrn/JkGkPk7VU1A3cmJVEAQsOM6QJUxyZvoldEIr2MfRDvbq7WEB8ZdeJtiUZp1+PX2k0ildPXv48mWha6l4MneJb4VG23UKn7UgcNxwVe3PVQpL6yyskt5aeCZIANr6+1/EXaulfOrkacl8SOMDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/CyIzngkF1nv22Ho03ENgvFxAq7WL7Q9Xcx7nO9tc4=;
 b=SGEKLdWPDQY1mJ76h6ijRJtl44kKvfM0yrmoa4Mg21ezVE0UkS+QE1GEmW6MHbp/dPQZwL3A5+eysN4ulg6SjqikEXqVZueu7KoNJxg2BKBlq5GCL8JBCGrJDtjDx+7jzQZQk/ymnQHb9QBQoGXZWeh+xRRx6vNsaBfz658ZZ/a0eYpcNbepXXhoNC8UTVYRddkiB2C36Pw1ozPjH4wrRhRyi5bX711nC8dZQE+Nvn+1iLGM14nSGbe6c0ClPx2r9m06CM3PO7Jm65o4Okcac2iQ0UVWn+9s/JPS4K9nn4ADvdy0Lcoqg6fY/yLsDn1Gc72MWkNOIbisetW6Ogk8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/CyIzngkF1nv22Ho03ENgvFxAq7WL7Q9Xcx7nO9tc4=;
 b=BB8nOP9H7QLYCJRtzH8YzC3Qolfh43cdC9NoiVFZM3wKlxCwLZnOBRNXpGWi1DyOeIhzVUPU9UooNIcqLFRP/WHlh3ahiu8FPlWyUA9juJS5Z3HY+1PdEgGaO6c9PgsmLn2Zs6ls9LrS0HysQQ9txhwrg8KXsjnHBWCMMapBW2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8cdf5b11-ad99-953d-aa4e-9369b73914a6@amd.com>
Date: Fri, 3 Mar 2023 13:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230301090644.4452-1-michal.orzel@amd.com>
 <62e997e2-8e45-9048-10fa-469bfb28b08b@citrix.com>
 <631c534d-5781-7884-4814-7182b0c59621@amd.com>
 <2820b89c-7d96-8ed8-8513-032514e6434d@citrix.com>
 <8df6e221-5b69-c8fa-b399-8d793e7b7fc3@amd.com>
In-Reply-To: <8df6e221-5b69-c8fa-b399-8d793e7b7fc3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E630:EE_|PH0PR12MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bf87f8-59f7-4c30-0bc3-08db1be5bd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eIkFlmEW4EWypi+qHYrShuKEzMEHbQaMimihfG6wuy33aYbp4NAbAU32m2bp2lDlJBCWmmJ66YoVfXlE/5eEketvlj/Ta3c6lF0M46oImeEGQvNvftm6JbgZyUOJ8wm5wsdUxSpyXkEv0JiCgzGJbBYPPXcyRmgQgqlETqfw4++oivCLIUCIVUwRdHDwUh37OKR9qhpkED2D2p+HaAs4AaTssTefKox7m41a1DJez+JG0GX6JW4VebCqGNjOAAOg+bh35c7zZuqSfMbtyd88Lq6T76U7E7WGbEgtYjkgkhs4oeA470Xvid1LOMSEmftMg1Z6HnWOKpSAG6kuQYQOFAIR1Yv+ZGdjeBg+Z8sgAoyGEED5qYKovAdKZYCf90zbR1i0mQa41oslRqI++1+173OQpOVOw1yNONzyUPVIwCfFPvtnl1XVPcQLcWiqKZUff5nmAthsSuAW0hTLjuMq80lrC9qhVrhLW5JRCdfag6CJI8XeOzLDnJrhVkKCTMU8tkPYGNURh7klmCzg1LZ8KhCKH2ByYpSffjBWGvC9e14XqprZXfpY36VLS+U4xS6YjrMfaXE/GG6spsdkTIw2btAGtlsZrz828qaZ5GAlqZBT6YEAFbNLX51fJAAbbDYvJQT1vRGCnK8172utee/q8MYZVvAF4z14zKLZnIzIEyfn/oJgMmSPH9MrigqoBfffe36EnvbLYlONYWF8W5X1qPZ97RL6jxhPgtNei3diVcGWdA9VxkRvCSEoI6FndHnJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(8936002)(186003)(5660300002)(2616005)(36860700001)(26005)(53546011)(44832011)(41300700001)(336012)(86362001)(31696002)(356005)(426003)(47076005)(82740400003)(2906002)(82310400005)(40480700001)(4326008)(70206006)(8676002)(966005)(70586007)(81166007)(316002)(31686004)(36756003)(478600001)(16576012)(54906003)(40460700003)(110136005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 12:49:33.9155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bf87f8-59f7-4c30-0bc3-08db1be5bd45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E630.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7886



On 03/03/2023 13:21, Michal Orzel wrote:
> 
> 
> On 03/03/2023 13:13, Andrew Cooper wrote:
>>
>>
>> On 03/03/2023 12:09 pm, Michal Orzel wrote:
>>>
>>> On 03/03/2023 12:59, Andrew Cooper wrote:
>>>>
>>>> On 01/03/2023 9:06 am, Michal Orzel wrote:
>>>>> Add missing aliases for:
>>>>>  - debian:unstable-cppcheck
>>>>>  - debian:unstable-arm64v8-arm32-gcc
>>>>>  - ubuntu:bionic
>>>>>
>>>>> Remove aliases for no longer used containers:
>>>>>  - centos:7.2
>>>>>  - debian:unstable-arm32-gcc
>>>>>
>>>>> Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
>>>>>
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>> Open questions related to the CI cleanup (@Andrew, @Anthony):
>>>>>  - Why do we keep suse:sles11sp4 dockerfile?
>>>>>  - Why do we keep jessie dockefiles?
>>>> Because we don't yet have a process for retirement of such things.
>>>>
>>>> Right now, all branches other than staging are using the jessie
>>>> containers.  While it's still in use on any branch, we need some way to
>>>> rebuild the container (potentially with modifications - see the recent
>>>> HTTPS fun), and standard practice is "patches into staging".
>>>>
>>>> An alternative could be to patch into the most recent staging branch
>>>> containing the dockerfile.
>>>>
>>>>
>>>> sles11sp4 is more complicated.  We specifically tried to get a SLES
>>>> container working, but it was always in a weird state (only @suse people
>>>> could rebuild the container).  We did eventually replace it with
>>>> OpenSUSE containers, but I can't currently locate any evidence in the
>>>> gitlab yml that we wired sles11sp4 up.   Which is confusing because I
>>>> swear we did have it running at some point in the past...
>>> Ok, thanks for answering. Stefano wanted me to remove these unused dockefiles.
>>> Are you ok with that or only to remove sles for now?
>>
>> So https://gitlab.com/xen-project/xen/-/pipelines/791687536 is the
>> latest pipeline on Xen 4.14  (yeah, that's a concerning amount of
>> red...) but I don't see any SLES runs and I do see the OpenSUSE runs.
>>
>> So I think we can safely drop the sles dockerfile, and drop the tags.
> Ok. FWICS, there is only a dockefile for sles. No jobs, no tags, so just
> dockerfile to remove.
Now I realized that by tags you meant removing it from registry as well.

> 
>>
>> But I'd like to keep jessie around until we have figured out what our
>> deprecation process is.
> I'm ok with that and I think that your alternative approach is a good way to go.
> That said, I think we could still remove jessie aliases from containerize, while
> keeping the dockerfiles for now until deprecation process is ready.
+ I think we can remove jessie aliases together with dockerfiles once process is ready.

> 
> ~Michal
> 

~Michal

