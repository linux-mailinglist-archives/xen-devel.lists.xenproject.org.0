Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58686A972C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 13:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505967.778969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4Po-0005lS-V0; Fri, 03 Mar 2023 12:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505967.778969; Fri, 03 Mar 2023 12:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4Po-0005iX-Ra; Fri, 03 Mar 2023 12:21:36 +0000
Received: by outflank-mailman (input) for mailman id 505967;
 Fri, 03 Mar 2023 12:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvcW=63=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pY4Pn-0005iP-Gg
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 12:21:35 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e83::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecc68c86-b9bd-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 13:21:30 +0100 (CET)
Received: from MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::26)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 12:21:23 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::d9) by MW4P223CA0021.outlook.office365.com
 (2603:10b6:303:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 12:21:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 12:21:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 06:21:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 04:21:22 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 3 Mar 2023 06:21:21 -0600
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
X-Inumbo-ID: ecc68c86-b9bd-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adtYCKzU2RctmmdcLT+l2gn0TsaKypzs3tnP9T5YLe8ybI5bxdkZX9Dc2CeXXsFsxXsmtOPzDEKcinL7rGnslWKN8XGdCbd8YQbV35vPqoFatHq44qNVSrtFWmz7Rl5wA7e1Gs5Bk5WQe8fZpuRw9h+20v7e9pmXn3uLBrfIFDN8Q+rxh1cHQBYAdymv94CjDHue2syng6myIWwzjXoEvjVy2w2nWkmrZnrsY/p/bCypxjAF83yXBRM2wR22HcVQYbAwgyZIFXAqXTsLzU2z4/aIIUxkxfeLTUsFs3abuS+AudqMISJiWW3CzMHzEDgh3OIETTorFivuYvArAEZDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EdIjczu2C+ffnWmMFuX6abg9ESVKQj10/MaQ1Yw9BQ=;
 b=N3PBcwtD6/G54DMhq6JohOIzepd3rWxzwDTECmncUWvlI2qGk+h9wNsHtGmQtLTG8Yr+YWQMa6t9Kps1muAcJdZ7ynwL+GZGp+BJwQC/UryaMsV5zlwBUShXdDrPa7YAm4VfGWAAfohosT4u5k20a+zGuQyN4bYPmSltmzpJ+vyJssi0oLu8DT6KltIV2UwtzsSyv8RNfd5+rH8eDTfv1c/fiYBlFcUsC0+oAbGikeUNOhqhJ8fR+2Pr/TO3sgKiA1PxzlwXKd9RFEH5svjsS4b/A1OYCcmjOL52SboNwKHETlW4dO5M6PU086kkigV3Is2GJ0FRgMz3g49Snm/y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EdIjczu2C+ffnWmMFuX6abg9ESVKQj10/MaQ1Yw9BQ=;
 b=ldhjH0VA6N3RUIHKZLOo0t9+gK7n3ZHacwjvbabbRjiwRZjaziQJJXHv89YzDDBT+jLza/crSzvKW3N8AnqHwwk3iqusC08wq+lFcxPfCOfZzBfPsiFSixdWcMqm2ifMnvrVu8qfbXhjgDTgfd1yQgL8zUio3M/q3nx0GB++y1U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8df6e221-5b69-c8fa-b399-8d793e7b7fc3@amd.com>
Date: Fri, 3 Mar 2023 13:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] automation: Add missing and drop obsoleted aliases from
 containerize
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230301090644.4452-1-michal.orzel@amd.com>
 <62e997e2-8e45-9048-10fa-469bfb28b08b@citrix.com>
 <631c534d-5781-7884-4814-7182b0c59621@amd.com>
 <2820b89c-7d96-8ed8-8513-032514e6434d@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2820b89c-7d96-8ed8-8513-032514e6434d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|IA1PR12MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e487543-0988-4291-7ae9-08db1be1cdb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YLdYReir/oZYPXq8yG48K+np8l/t6KHNHkIjreZAazaYUYOQeCFfhmEjLF+BTqDl6oR1XR6QJSEGdFWBWaYekjIzbNNYrH3fTowuAISinzvG2ZQEB+mSYxcjEM3BLb4b8DmJ6SCHWBo9kG4mgzS/uM7Vs86bi+ELQHJZURVocPA+NYbT1g2ONoXgpP5LhQ6PLu3UJlPYPJHjF+qsAA+Tyghus7Qh88EefCo/EB8dhyl3B5sDdmxRs7U1uDV74lkHG6w3V58WP8XIjTyKALoocosx6vfIlYCHLdfo22GkKNSraaBbypS41rdruWuTmrFQxrwxmIMgX4QEyWxH7hSwemz4uYA4usml9dk2vl0l4qyjwO2+Jpth5gpTgO79ZdyJEEunmP6lQenUwu7wg8wEq3zSgW1CPXHnnYc3ioxWsjiBxhGfUtcCKGKbXCPSvABmlAeUu9lmcPA8DHtmAi45blzxmEx68698bgsNJJ0Lgq17xXAWJJ+Uf5LKO/SbTAx5L1p5OX4dEudnt962ftnAN2ALAECBz4Mu9emhW0l9NKZ/uYLdYONd/omx3bUfu1nXuxckGh8254cDK4MR6gnUcxsTy1fNws5AgtRdQ2wtw1mO4BJn9XBDkqIZ1Ie2Z5tl5hx29OR7V7vULT/+Y1Om4KlYxMF3SomcySgeQK4ITtmTUgoP4O0K6afezFqEAqpMOUyYYTZKCqxBjnmefWT31PzKRtZ/1/SuryX1IHt/aajmd9PQaRGi24tYV2hFE1c4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(110136005)(36756003)(316002)(8676002)(70206006)(70586007)(54906003)(2906002)(82310400005)(16576012)(4326008)(41300700001)(40480700001)(478600001)(53546011)(36860700001)(26005)(82740400003)(47076005)(336012)(31696002)(426003)(40460700003)(2616005)(186003)(966005)(86362001)(356005)(81166007)(31686004)(44832011)(5660300002)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 12:21:23.4349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e487543-0988-4291-7ae9-08db1be1cdb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066



On 03/03/2023 13:13, Andrew Cooper wrote:
> 
> 
> On 03/03/2023 12:09 pm, Michal Orzel wrote:
>>
>> On 03/03/2023 12:59, Andrew Cooper wrote:
>>>
>>> On 01/03/2023 9:06 am, Michal Orzel wrote:
>>>> Add missing aliases for:
>>>>  - debian:unstable-cppcheck
>>>>  - debian:unstable-arm64v8-arm32-gcc
>>>>  - ubuntu:bionic
>>>>
>>>> Remove aliases for no longer used containers:
>>>>  - centos:7.2
>>>>  - debian:unstable-arm32-gcc
>>>>
>>>> Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Open questions related to the CI cleanup (@Andrew, @Anthony):
>>>>  - Why do we keep suse:sles11sp4 dockerfile?
>>>>  - Why do we keep jessie dockefiles?
>>> Because we don't yet have a process for retirement of such things.
>>>
>>> Right now, all branches other than staging are using the jessie
>>> containers.  While it's still in use on any branch, we need some way to
>>> rebuild the container (potentially with modifications - see the recent
>>> HTTPS fun), and standard practice is "patches into staging".
>>>
>>> An alternative could be to patch into the most recent staging branch
>>> containing the dockerfile.
>>>
>>>
>>> sles11sp4 is more complicated.  We specifically tried to get a SLES
>>> container working, but it was always in a weird state (only @suse people
>>> could rebuild the container).  We did eventually replace it with
>>> OpenSUSE containers, but I can't currently locate any evidence in the
>>> gitlab yml that we wired sles11sp4 up.   Which is confusing because I
>>> swear we did have it running at some point in the past...
>> Ok, thanks for answering. Stefano wanted me to remove these unused dockefiles.
>> Are you ok with that or only to remove sles for now?
> 
> So https://gitlab.com/xen-project/xen/-/pipelines/791687536 is the
> latest pipeline on Xen 4.14  (yeah, that's a concerning amount of
> red...) but I don't see any SLES runs and I do see the OpenSUSE runs.
> 
> So I think we can safely drop the sles dockerfile, and drop the tags.
Ok. FWICS, there is only a dockefile for sles. No jobs, no tags, so just
dockerfile to remove.

> 
> But I'd like to keep jessie around until we have figured out what our
> deprecation process is.
I'm ok with that and I think that your alternative approach is a good way to go.
That said, I think we could still remove jessie aliases from containerize, while
keeping the dockerfiles for now until deprecation process is ready.

~Michal

