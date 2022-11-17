Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C362D83F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444918.700099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcJ5-0007Q8-TI; Thu, 17 Nov 2022 10:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444918.700099; Thu, 17 Nov 2022 10:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcJ5-0007NB-QJ; Thu, 17 Nov 2022 10:39:43 +0000
Received: by outflank-mailman (input) for mailman id 444918;
 Thu, 17 Nov 2022 10:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovcJ4-0007N4-Of
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:39:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c97234-6664-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 11:39:39 +0100 (CET)
Received: from BN0PR07CA0002.namprd07.prod.outlook.com (2603:10b6:408:141::17)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 10:39:36 +0000
Received: from BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::7b) by BN0PR07CA0002.outlook.office365.com
 (2603:10b6:408:141::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 10:39:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT080.mail.protection.outlook.com (10.13.176.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 10:39:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 04:39:32 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 04:39:30 -0600
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
X-Inumbo-ID: 22c97234-6664-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6M7nKOofwzq5nVfbvEP5DuE0UFWlLMBIYPUm5YXw9l5Ca9jyqddkvSB9Xn+gPb5D7wqyHBGdOW4kUMdwpaiqc1S9jz+gqL67nybN4a2Ak5eUSo/0AJkUa6Gy1RMjn7JBwPxx5bC1GAacp7UgBS4DuuVBXEFnzkrmtpnsvJF+nwnDHKOhx9YaM6kkHYV29L9Gle4q/8anIIV4nSo8Px2puqp1D2B8B19NSMftYmcqJ+o+o4Wqi+GdttjzMtRZBvSRzuZj0BWL9xf3ihVGwJNBlJR5tv+pRAwvzhT/ARx88hpRZGk59PM/2VLo48KtgyMrsnMVFXzX+fn43B3qEy1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuxTjbKrXMrnKu2qwzdm1ntnv45oJ8eilotKOMhWu4w=;
 b=dnbzcQfPJZy+CLT5AJs3uNyg/oCEjZ0A6KT/Vyff9SwUotBOKuqI58A1ez2sF7v95zHBCL5RJ3z2gzpLcIT+NQXXEnXZrlObQBhnak6T83xW+OGUu5fMYLTeSOviEHbaKjY68sTOE+WIYVhlT4p1adTs+K/AgBmzJceZ9GGcNrg/ZC1SWaElz5T5dxMASL8tJtKGiQ7xdqFrkz7IfLmL83tYGzwV7iNY0XAWgzYgKAfWT2E9UKFqER2aB50SZUNOomC4Y2wrN70uyjAJofer1ycqf8pWiDooOkho/ad/taTYPie8UomsU4gD9tLPZt5yqsRGH3CKsyG1fBYyqd5XpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuxTjbKrXMrnKu2qwzdm1ntnv45oJ8eilotKOMhWu4w=;
 b=ozE/jXXAXAoP0Bh1ITREVvsb2z83zAtMIdGYvZ+rTlPoxYGMXaFAaoLsoEeqLl2SBvFMIkrKUlODkAnOIQzPqjgnAyr7MZyOWob8BHHP91ws0b1c+RCFe7NhhajED5QTXnOjixXcwXA22fbL84O7pGCk3S0mrLUpAu5mgw3fMdQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <88a04b63-04ba-ef03-771d-1f2d11ea8549@amd.com>
Date: Thu, 17 Nov 2022 11:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] docs/misra: List files in Xen originated from external
 sources
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20221116092032.4423-1-michal.orzel@amd.com>
 <93736488-8e0c-282a-2e5f-db0cf9419183@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <93736488-8e0c-282a-2e5f-db0cf9419183@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT080:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f70a25-e870-40de-b7bd-08dac888054b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LJQT75uVG6ngfcUQB7HLWsen93jD38hMrmz5eEGjmGt+iUVjgmwd7iD8LZP35ftVuoJlz7+9h/iOc85bi2pH7oR9RWziueinHTgC4dJmDQtVi583rHSiIcNB4btkWbplotPmq39Yg4N1JZmUFkrJT6SpC0mHdN8KSnIUQh9loWF22BJVCyircMjaUIyU3j0FfZitC4Jg5VWKEa/IWzFM6QU+CuPc2hGn1kxW10yf41trEYVyhS7hWfl+X4g++BgeqJJlddUG8F62L7nnrWB93D6vldRWCt/0yCf24BFu8WukedJ+S+eRshbD9FrZ5V5bVrbWdvpOFV1TYQgpIBHZJ/IuesivtZdhCsqnM4cLeezY4Lb0KfSetXRWVLf99XOF8DsPdGxnRFeQqNWdxTX8SiCuVGTEIPpcEEvqckXpurt4rAZwbkU1imWZtfH+/rwMcPhIa0kes86mgstbmyjJTb/R5D16sYsQeXsC9D5R0h7AzBFtuZXz+TYvd9A0xLO2Zl3gC/WJxCrqjgNn99QzvX0uxeyARPBdqvRhwWFmHUY6umVyN7SHDaKQ/+wuXSXjfkv058ehBMiasC5NXHLbZStftFwethZVHm2bvdNwsa1N57wabRQy5sSt+pNmQ+ow1S9qgFUwYCVcWy3EsOOQTkVBKdCPhCY1pGNC2AW056Sx0W8gTHBlDgMWIv3OzusSfLwaGKMzMjktmIaVZHRORiNsfpcsu5ivq414x959xaDDlVmiMT6uHhZfHmSPpHmTZPePty4RXbo8cxcFYeXsMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(44832011)(40480700001)(31686004)(4326008)(41300700001)(70586007)(70206006)(16576012)(8676002)(316002)(6916009)(31696002)(83380400001)(54906003)(82310400005)(40460700003)(2906002)(478600001)(36756003)(356005)(86362001)(81166007)(82740400003)(426003)(186003)(53546011)(336012)(2616005)(8936002)(47076005)(26005)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:39:35.5833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f70a25-e870-40de-b7bd-08dac888054b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789

Hi Jan,

Thanks for looking at it.

On 17/11/2022 11:03, Jan Beulich wrote:
> 
> 
> On 16.11.2022 10:20, Michal Orzel wrote:
>> --- /dev/null
>> +++ b/docs/misra/external-files.txt
>> @@ -0,0 +1,70 @@
>> +External files in Xen
>> +=====================
>> +
>> +The following table lists files present in the Xen codebase that originated
>> +from external sources e.g. Linux kernel. The purpose of this table is to:
>> + - keep track of the external files in the Xen codebase,
>> + - help with the review process (e.g. changes done to the files that did not
>> +   diverge, shall be first submitted to the external projects and then
>> +   backported to Xen),
>> + - act as a base for listing files to exclude from MISRA checkers.
>> +
>> +NOTES:
>> +1) The files shall be listed in alphabetical order.
> 
> But then you don't?
True, it is alphabetical order with directories having a precedence.

> 
>> +2) The origin of the files derived from the projects other than Linux, shall
>> +   be specified within the () placed next to the path.
> 
> Might it be more generally useful to have another column, then not only
> stating the project but also the path it lives at there (or lived at the
> time of cloning)?
We though about it. Would be a good idea but can be quite challenging for files
that appeared in Xen before switching to git (difficult to establish the time of cloning in such cases).

> 
>> +3) The table shall be updated when importing new files from external projects.
>> +4) At the moment, only the source files are listed in the table.
>> +
>> +| Relative path to xen/                     | Diverged from | Subject to       |
>> +|                                           | origin? [Y/N] | backports? [Y/N] |
>> ++-------------------------------------------+---------------+------------------+
>> +| arch/arm/arm64/cpufeature.c               | N             | Y                |
>> +| arch/arm/arm64/insn.c                     | N             | Y                |
>> +| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
>> +| arch/x86/acpi/boot.c                      | Y             | ?                |
>> +| arch/x86/acpi/lib.c                       | ?             | ?                |
> 
> This was simply split off from boot.c, which I'd be inclined to take to
> mean Y in the "diverged" column. In the backports column I'd prefer to
> keep ? for both, or any other indicator taken to mean "maybe / uncertain".
> 
> What about arch/x86/acpi/cpufreq/* and other stuff in arch/x86/acpi/?
> 
>> +| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
>> +| arch/x86/cpu/mcheck/non-fatal.c           | ?             | Y                |
> 
> Even before disappearing in 2.6.32 the file was different from Linux'es,
> simply because we don't have anything like schedule_delayed_work(). So
> it's pretty clearly Y for "diverged".
> 
>> +| arch/x86/cpu/mtrr/*                       | Y             | N                |
>> +| arch/x86/cpu/amd.c                        | Y             | N                |
>> +| arch/x86/cpu/centaur.c                    | Y             | N                |
>> +| arch/x86/cpu/common.c                     | Y             | N                |
>> +| arch/x86/cpu/hygon.c                      | Y             | N                |
>> +| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
>> +| arch/x86/cpu/intel.c                      | Y             | N                |
>> +| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
>> +| arch/x86/genapic/*                        | Y             | N                |
>> +| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
>> +| arch/x86/dmi_scan.c                       | Y             | ?                |
>> +| arch/x86/mpparse.c                        | Y             | ?                |
> 
> Like above I'd like to keep ? (or alike) here, as neither Y nor N are
> fully accurate.
> 
>> +| arch/x86/srat.c                           | Y             | N                |
> 
> What about common/cpu.c?
> 
>> +| common/libfdt/* (libfdt)                  | N             | Y                |
>> +| common/lz4/decompress.c                   | N             | Y                |
>> +| common/ubsan/ubsan.c                      | Y             | Y                |
>> +| common/xz/*                               | N             | Y                |
>> +| common/zstd/*                             | N             | Y                |
>> +| common/bitmap.c                           | N             | Y                |
>> +| common/bunzip2.c                          | N             | Y                |
>> +| common/earlycpio.c                        | N             | Y                |
>> +| common/inflate.c                          | N             | Y                |
> 
> What about common/notifier.c?
> 
>> +| common/radix-tree.c                       | N             | Y                |
> 
> What about common/rcupdate.c? (Stopping at this in this regard:
> It's unclear by what criteria you have gone. Even as simple an
> indicator as "Copyright (C) ... Linus Torvalds" was apparently not
Please see [1]

> used. Similarly mentioning criteria for considering a file
> "diverged" would be very helpful to spell out, even if there's
> likely some fuzziness involved there.)

We would need to pre-define some criteria to avoid having a long justifications.
Any ideas?

> 
>> +| common/un*.c                              | N             | Y                |
>> +| crypto/rijndael.c (OpenBSD)               | N             | Y                |
>> +| crypto/vmac.c (public domain)             | N             | Y                |
>> +| drivers/acpi/apei/*                       | N             | Y                |
> 
> I'm not sure of the N here.
> 
>> +| drivers/acpi/tables/*                     | N             | Y                |
>> +| drivers/acpi/utilities/*                  | N             | Y                |
>> +| drivers/acpi/hwregs.c                     | N             | Y                |
>> +| drivers/acpi/numa.c                       | ?             | Y                |
> 
> Y
> 
>> +| drivers/acpi/osl.c                        | Y             | Y                |
>> +| drivers/acpi/reboot.c                     | N             | Y                |
>> +| drivers/acpi/tables.c                     | ?             | Y                |
> 
> Y
> 
> What about drivers/cpufreq/*, drivers/char/ehci-dbgp.c,
> drivers/char/xhci-dbc.c, and drivers/video/font*? What about some of
> the stuff under tools/, especially tools/kconfig/?

[1]
For the first shot, the criteria was to list files using different coding style than Xen,
especially the ones using tabs instead of spaces. As I indicated before, the list may not be
completed, hence a gentle ask to list the missing ones. Some of the files you mentioned
use Xen coding style + there is no information in the git history that they originated from
external sources. This is why, the maintainers who are the addressee of this RFC should have
a better knowledge of the origin of such files.

As for the files under tools/, FWICS they are being filtered-out from MISRA checks, hence I
did not list them.

> 
> Jan

~Michal

