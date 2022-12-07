Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B0645AB5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456358.714139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2uMN-0002Al-Dl; Wed, 07 Dec 2022 13:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456358.714139; Wed, 07 Dec 2022 13:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2uMN-00027o-AN; Wed, 07 Dec 2022 13:21:15 +0000
Received: by outflank-mailman (input) for mailman id 456358;
 Wed, 07 Dec 2022 13:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9USZ=4F=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2uML-00027g-MJ
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:21:13 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02b9ea6b-7632-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 14:21:09 +0100 (CET)
Received: from DM6PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:40::23) by
 MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.13; Wed, 7 Dec 2022 13:21:06 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::5b) by DM6PR03CA0010.outlook.office365.com
 (2603:10b6:5:40::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 13:21:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 13:21:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 07:21:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 05:20:39 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 07:20:38 -0600
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
X-Inumbo-ID: 02b9ea6b-7632-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn7Q/7Li6j+iGCw71+a60Eh8d03vSGjiJihW+gKIxmkdgfmPLzJhe1a0SIqvq53M8iV/Dkx804I7K+B1XlSGRtLQei/a7M99LtdhVg+A7PYkhb3Z7rIJdwZQCgvI+NaW4oftKpMQJWfUnZZjF8kih5xnDgUe9BgrjHkOLY/uXyh7qqIJVrgGwDUsV/tNQaLmX/AuJ/2sKCC4KYzspBhEx7g9aLs4gjeketdlnptazD6PvGwfDWSvmF7yDe1TDzNCFzdS4gvwmFScNiwY9jNBXKXnhm08bhpl/19HoBr9vfuLH1t6OOoKKFdgXp5cfbF63TxOQYs5xMpCmJ+4q0xa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPQM8q8YR6+SolRrXS8+ZTH3xi8j6Ddc3vXmOYJTCHA=;
 b=oKi/b6vM+yHqQQGTh6TIdjpkd2ceN/IGJaVpIWIAfXYQmzCvnbE0xckN7mm+86Tea8tTCBB28WkWLTQ1dauP8EP0L4w3Q2br4mZfjGcva/afp3a6kVk+LsHWwCWSs0gFSxsRmiKZyZDNNzEJynPcBex0SQA+VYvCFbTMuFTnHf3A2S8OioCJGNzlR6iebUT3bvVAox38gke4g8nYWLQnu3Tmw7w9uH3MCuOiqdeXnRC35fuzfMPRkjItqy+qp2xuAih91+L4XWJudeSeKgDiyLt8GCRorBoWK//QEMzZNPTQuCo2DseOD7xf+CucMqMzB1vk5y9k0WV+i+D26AQGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPQM8q8YR6+SolRrXS8+ZTH3xi8j6Ddc3vXmOYJTCHA=;
 b=t5v/TfHq3g1ERPHi4cTi2O5o2Vc+CNUWwpWTQW6O1VxRTVThTQ706YEDPiesnvc/sLQkPzX5YY1bD+Vc7sk8ZToUonQVTrI/nckOHIcQFTLg7IDI5kWsQwos5+UzRqmV3qbB3zY2zRoX9Y7AyMRShuicQpgJ7aUvZjspUtejeBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <99163b1f-a08e-36d1-2316-08c9da9164d2@amd.com>
Date: Wed, 7 Dec 2022 14:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC] docs/misra: List files in Xen originated from external
 sources
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20221116092032.4423-1-michal.orzel@amd.com>
 <93736488-8e0c-282a-2e5f-db0cf9419183@suse.com>
 <88a04b63-04ba-ef03-771d-1f2d11ea8549@amd.com>
 <dfa1eb96-5538-e3f2-250b-3cf17a6e50fd@suse.com>
 <alpine.DEB.2.22.394.2211170752060.4020@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2211170752060.4020@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|MW3PR12MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3f4bc2-b921-453a-6c1c-08dad855e574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vuJXpoOIo9apG40xI9m2DGa6RrTC/cxheIg7g2FLgma6brU3SN3K7IQib5yltH6uSx58BbToW1e3RAlf/OQith7DoXSPFIAOlCULZenGPlLpx4k4mn1EXxwXKBVhUnuZOZ/9nSD9w9bp/sjHhruMsjHKkbXIy8wF+mqyUUScJlqnkPz0lDiqaFLA6pvGq5vo4ZePeNJHHcw+wq5mVdMC4p6oO1SygY9ktFYB6E84GOM9vDoqjjYeVfwkh8RIZA4ockcg830HOYEqmWpy30z3fvEAKZL1gpl4sAwSDWcEg8UmZliXR21ukUA3g1m7qIW9ZnrKCfwwH+RUNoLKLWht1XaDTxaO7+wMbO0QE2IvS4ACc8/bpNyehFHABqn6QPdMt9PBSJdyFtDCIcorgE7K2t4gwjEULJCt47aspEvD7n/1At9+ZbGWSQMgwxV43DHMSOfwL8g3j4l5YDZzupORHi9p6HwrjoaLUN9kAc75Nj0OsZcRnn6TQC788jIkilTmP2pryROwqyrbXyGGdpN1ggBPxUM1w5Ql480dM9KQKDdyv142QSs/Z4eteL/dCEwADvbr6dit4/sLsXWQ2/vKPvX8uYHK6Z03AnYNgMcSiRwPx3dk/iFjLRAvjiCA5q2qhjj4tx85+LNqlp8TwX7VCxL5652DM1YFVSRyBlyagQAWCS8xKZ6v1Sqe/7TShf2YNW8oyDv04wLFBnbIuEtXByDDwxHNHMFNuMZp7oh5LWJRGJ0UunSjvX1CzbEdRYoy73+/5KSVFW2WLFA6pHLkug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(16576012)(36756003)(40460700003)(5660300002)(110136005)(54906003)(356005)(316002)(41300700001)(478600001)(426003)(82740400003)(83380400001)(36860700001)(82310400005)(81166007)(40480700001)(53546011)(336012)(86362001)(31696002)(8936002)(47076005)(2616005)(186003)(26005)(2906002)(4326008)(31686004)(70206006)(70586007)(8676002)(30864003)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 13:21:05.8997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3f4bc2-b921-453a-6c1c-08dad855e574
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474



On 17/11/2022 22:15, Stefano Stabellini wrote:
> 
> 
> On Thu, 17 Nov 2022, Jan Beulich wrote:
>> On 17.11.2022 11:39, Michal Orzel wrote:
>>> On 17/11/2022 11:03, Jan Beulich wrote:
>>>> On 16.11.2022 10:20, Michal Orzel wrote:
>>>>> --- /dev/null
>>>>> +++ b/docs/misra/external-files.txt
>>>>> @@ -0,0 +1,70 @@
>>>>> +External files in Xen
>>>>> +=====================
>>>>> +
>>>>> +The following table lists files present in the Xen codebase that originated
>>>>> +from external sources e.g. Linux kernel. The purpose of this table is to:
>>>>> + - keep track of the external files in the Xen codebase,
>>>>> + - help with the review process (e.g. changes done to the files that did not
>>>>> +   diverge, shall be first submitted to the external projects and then
>>>>> +   backported to Xen),
>>>>> + - act as a base for listing files to exclude from MISRA checkers.
>>>>> +
>>>>> +NOTES:
>>>>> +1) The files shall be listed in alphabetical order.
>>>>
>>>> But then you don't?
>>> True, it is alphabetical order with directories having a precedence.
>>
>> Which is kind of surprising and, at least for me, confusing.
>>
>>>>> +2) The origin of the files derived from the projects other than Linux, shall
>>>>> +   be specified within the () placed next to the path.
>>>>
>>>> Might it be more generally useful to have another column, then not only
>>>> stating the project but also the path it lives at there (or lived at the
>>>> time of cloning)?
>>> We though about it. Would be a good idea but can be quite challenging for files
>>> that appeared in Xen before switching to git (difficult to establish the time of cloning in such cases).
>>>
>>>>
>>>>> +3) The table shall be updated when importing new files from external projects.
>>>>> +4) At the moment, only the source files are listed in the table.
>>>>> +
>>>>> +| Relative path to xen/                     | Diverged from | Subject to       |
>>>>> +|                                           | origin? [Y/N] | backports? [Y/N] |
>>>>> ++-------------------------------------------+---------------+------------------+
>>>>> +| arch/arm/arm64/cpufeature.c               | N             | Y                |
>>>>> +| arch/arm/arm64/insn.c                     | N             | Y                |
>>>>> +| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
>>>>> +| arch/x86/acpi/boot.c                      | Y             | ?                |
>>>>> +| arch/x86/acpi/lib.c                       | ?             | ?                |
>>>>
>>>> This was simply split off from boot.c, which I'd be inclined to take to
>>>> mean Y in the "diverged" column. In the backports column I'd prefer to
>>>> keep ? for both, or any other indicator taken to mean "maybe / uncertain".
>>>>
>>>> What about arch/x86/acpi/cpufreq/* and other stuff in arch/x86/acpi/?
>>>>
>>>>> +| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
>>>>> +| arch/x86/cpu/mcheck/non-fatal.c           | ?             | Y                |
>>>>
>>>> Even before disappearing in 2.6.32 the file was different from Linux'es,
>>>> simply because we don't have anything like schedule_delayed_work(). So
>>>> it's pretty clearly Y for "diverged".
>>>>
>>>>> +| arch/x86/cpu/mtrr/*                       | Y             | N                |
>>>>> +| arch/x86/cpu/amd.c                        | Y             | N                |
>>>>> +| arch/x86/cpu/centaur.c                    | Y             | N                |
>>>>> +| arch/x86/cpu/common.c                     | Y             | N                |
>>>>> +| arch/x86/cpu/hygon.c                      | Y             | N                |
>>>>> +| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
>>>>> +| arch/x86/cpu/intel.c                      | Y             | N                |
>>>>> +| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
>>>>> +| arch/x86/genapic/*                        | Y             | N                |
>>>>> +| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
>>>>> +| arch/x86/dmi_scan.c                       | Y             | ?                |
>>>>> +| arch/x86/mpparse.c                        | Y             | ?                |
>>>>
>>>> Like above I'd like to keep ? (or alike) here, as neither Y nor N are
>>>> fully accurate.
>>>>
>>>>> +| arch/x86/srat.c                           | Y             | N                |
>>>>
>>>> What about common/cpu.c?
>>>>
>>>>> +| common/libfdt/* (libfdt)                  | N             | Y                |
>>>>> +| common/lz4/decompress.c                   | N             | Y                |
>>>>> +| common/ubsan/ubsan.c                      | Y             | Y                |
>>>>> +| common/xz/*                               | N             | Y                |
>>>>> +| common/zstd/*                             | N             | Y                |
>>>>> +| common/bitmap.c                           | N             | Y                |
>>>>> +| common/bunzip2.c                          | N             | Y                |
>>>>> +| common/earlycpio.c                        | N             | Y                |
>>>>> +| common/inflate.c                          | N             | Y                |
>>>>
>>>> What about common/notifier.c?
>>>>
>>>>> +| common/radix-tree.c                       | N             | Y                |
>>>>
>>>> What about common/rcupdate.c? (Stopping at this in this regard:
>>>> It's unclear by what criteria you have gone. Even as simple an
>>>> indicator as "Copyright (C) ... Linus Torvalds" was apparently not
>>> Please see [1]
>>>
>>>> used. Similarly mentioning criteria for considering a file
>>>> "diverged" would be very helpful to spell out, even if there's
>>>> likely some fuzziness involved there.)
>>>
>>> We would need to pre-define some criteria to avoid having a long justifications.
>>> Any ideas?
>>
>> Well, changing just #include-s to fit Xen's model shouldn't count as
>> divergence. But coding style conversion already may. I'm afraid
>> criteria here depend very much on the purpose, and hence I don't
>> feel qualified to suggest any.
> 
> Hi Jan,
> 
> These two columns are not for MISRA's benefit. They are for our own
> benefit as maintainers of this code. We can define them the way we want
> to.
> 
> MISRA doesn't allow us to make any exceptions to our coding guidelines
> for files originating from external sources (unless they are a proper
> library we link against, I don't think that even libfdt qualifies from
> what I understand.) We'll have to figure out what to do about that, but
> it is not something this patch is trying to solve. It is just trying to
> identify the external files.
> 
> So the two columns are just for us as maintainers. It is only to help
> us, not to help with MISRA or with safety. So if you think we should
> word the first column differently, or even remove the first column
> entirely, we could.
> 
> Maybe a better criteria for the first column would be: "do we accept
> changes to this file?" (direct changes, not backports)
> 
> 
>>>>> +| common/un*.c                              | N             | Y                |
>>>>> +| crypto/rijndael.c (OpenBSD)               | N             | Y                |
>>>>> +| crypto/vmac.c (public domain)             | N             | Y                |
>>>>> +| drivers/acpi/apei/*                       | N             | Y                |
>>>>
>>>> I'm not sure of the N here.
>>>>
>>>>> +| drivers/acpi/tables/*                     | N             | Y                |
>>>>> +| drivers/acpi/utilities/*                  | N             | Y                |
>>>>> +| drivers/acpi/hwregs.c                     | N             | Y                |
>>>>> +| drivers/acpi/numa.c                       | ?             | Y                |
>>>>
>>>> Y
>>>>
>>>>> +| drivers/acpi/osl.c                        | Y             | Y                |
>>>>> +| drivers/acpi/reboot.c                     | N             | Y                |
>>>>> +| drivers/acpi/tables.c                     | ?             | Y                |
>>>>
>>>> Y
>>>>
>>>> What about drivers/cpufreq/*, drivers/char/ehci-dbgp.c,
>>>> drivers/char/xhci-dbc.c, and drivers/video/font*? What about some of
>>>> the stuff under tools/, especially tools/kconfig/?
>>>
>>> [1]
>>> For the first shot, the criteria was to list files using different coding style than Xen,
>>> especially the ones using tabs instead of spaces. As I indicated before, the list may not be
>>> completed, hence a gentle ask to list the missing ones. Some of the files you mentioned
>>> use Xen coding style + there is no information in the git history that they originated from
>>> external sources. This is why, the maintainers who are the addressee of this RFC should have
>>> a better knowledge of the origin of such files.
>>
>> Hmm. Please forgive me being blunt, but to me this then looks like
>> offloading work to people who shouldn't be required to invest
>> meaningful amounts of time. But maybe that's just me viewing it this
>> way ... Yet this is particularly relevant if ...
>>
>>> As for the files under tools/, FWICS they are being filtered-out from MISRA checks, hence I
>>> did not list them.
>>
>> ... the goal here then indeed is use for MISRA alone. I did e.g. ask
>> whether it wouldn't be worthwhile to more precisely describe the
>> origin of files because at some point in the past it was also
>> proposed to arrange for some more automatic monitoring of changes
>> being applied at their origins for files we have cloned. Which
>> obviously first of all requires establishing an association between
>> our files and their origins.
> 
> One of the goals has certainly to do with MISRA, but I think we would
> want to know which files are not conforming to the Xen coding style and
> coding guidelines anyway? For example, we need it to automate coding
> style checks for new patches with scripts like checkpatch.
> 
> And you are right, also adding the origin of the files to help with
> backports and monitoring is a great idea.
> 
> On the extra work: some of us in the community have been around for a
> long time. Without having to do any research, there are things you might
> remember on top of your head. If you don't remember, that's fine and we
> can try to do some investigation/archeology.

I managed to extend the list with additional 21 files (+alphabetization done)
thanks to Jan's suggestions, checking for Linux copyright and using a black magic
(e.g. for common/cpu.c it was almost impossible to deduct that it originated from Linux).
The table looks as follows for now (I put ? in the second column for new files):

| arch/arm/arm64/cpufeature.c               | N             | Y                |
| arch/arm/arm64/insn.c                     | N             | Y                |
| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
| arch/x86/acpi/boot.c                      | Y             | ?                |
| arch/x86/acpi/cpu_idle.c                  | Y             | ?                |
| arch/x86/acpi/cpufreq/cpufreq.c           | Y             | ?                |
| arch/x86/acpi/cpuidle_menu.c              | Y             | ?                |
| arch/x86/acpi/lib.c                       | Y             | ?                |
| arch/x86/acpi/power.c                     | Y             | ?                |
| arch/x86/cpu/amd.c                        | Y             | N                |
| arch/x86/cpu/centaur.c                    | Y             | N                |
| arch/x86/cpu/common.c                     | Y             | N                |
| arch/x86/cpu/hygon.c                      | Y             | N                |
| arch/x86/cpu/intel.c                      | Y             | N                |
| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
| arch/x86/cpu/mcheck/non-fatal.c           | Y             | Y                |
| arch/x86/cpu/mtrr/*                       | Y             | N                |
| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
| arch/x86/delay.c                          | Y             | ?                |
| arch/x86/dmi_scan.c                       | Y             | ?                |
| arch/x86/domain.c                         | Y             | ?                |
| arch/x86/genapic/*                        | Y             | N                |
| arch/x86/i387.c                           | Y             | ?                |
| arch/x86/irq.c                            | Y             | ?                |
| arch/x86/mpparse.c                        | Y             | ?                |
| arch/x86/srat.c                           | Y             | N                |
| arch/x86/time.c                           | Y             | ?                |
| arch/x86/traps.c                          | Y             | ?                |
| arch/x86/usercopy.c                       | Y             | ?                |
| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
| common/bitmap.c                           | N             | Y                |
| common/bunzip2.c                          | N             | Y                |
| common/cpu.c                              | Y             | ?                |
| common/earlycpio.c                        | N             | Y                |
| common/inflate.c                          | N             | Y                |
| common/libfdt/* (libfdt)                  | N             | Y                |
| common/lz4/decompress.c                   | N             | Y                |
| common/notifier.c                         | Y             | ?                |
| common/radix-tree.c                       | N             | Y                |
| common/rcupdate.c                         | Y             | ?                |
| common/softirq.c                          | Y             | ?                |
| common/tasklet.c                          | Y             | ?                |
| common/ubsan/ubsan.c                      | Y             | Y                |
| common/un*.c                              | N             | Y                |
| common/vsprintf.c                         | Y             | ?                |
| common/xz/*                               | N             | Y                |
| common/zstd/*                             | N             | Y                |
| crypto/rijndael.c (OpenBSD)               | N             | Y                |
| crypto/vmac.c (public domain)             | N             | Y                |
| drivers/acpi/apei/*                       | Y             | Y                |
| drivers/acpi/hwregs.c                     | N             | Y                |
| drivers/acpi/numa.c                       | Y             | Y                |
| drivers/acpi/osl.c                        | Y             | Y                |
| drivers/acpi/reboot.c                     | N             | Y                |
| drivers/acpi/tables.c                     | Y             | Y                |
| drivers/acpi/tables/*                     | N             | Y                |
| drivers/acpi/utilities/*                  | N             | Y                |
| drivers/char/ehci-dbgp.c                  | Y             | ?                |
| drivers/char/xhci-dbc.c                   | Y             | ?                |
| drivers/cpufreq/*                         | Y             | ?                |
| drivers/passthrough/arm/smmu-v3.c         | Y             | N                |
| drivers/passthrough/arm/smmu.c            | Y             | N                |
| drivers/video/font_*                      | Y             | ?                |
| lib/list-sort.c                           | N             | Y                |
| lib/mem*.c                                | N             | Y                |
| lib/rbtree.c                              | N             | Y                |
| lib/str*.c                                | N             | Y                |
| lib/xxhash32.c                            | N             | Y                |
| lib/xxhash64.c                            | N             | Y                |

~Michal

