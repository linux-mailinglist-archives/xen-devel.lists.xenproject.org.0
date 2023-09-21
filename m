Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412787A92C4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 10:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606228.944000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFJY-0002NA-Ft; Thu, 21 Sep 2023 08:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606228.944000; Thu, 21 Sep 2023 08:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFJY-0002Le-CM; Thu, 21 Sep 2023 08:45:36 +0000
Received: by outflank-mailman (input) for mailman id 606228;
 Thu, 21 Sep 2023 08:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdLE=FF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qjFJW-0002Go-Sx
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 08:45:35 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 390e9fe9-585b-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 10:45:32 +0200 (CEST)
Received: from SA0PR12CA0016.namprd12.prod.outlook.com (2603:10b6:806:6f::21)
 by CH0PR12MB5044.namprd12.prod.outlook.com (2603:10b6:610:e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 08:45:29 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::26) by SA0PR12CA0016.outlook.office365.com
 (2603:10b6:806:6f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Thu, 21 Sep 2023 08:45:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 08:45:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Sep
 2023 03:45:28 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 21 Sep 2023 03:45:27 -0500
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
X-Inumbo-ID: 390e9fe9-585b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpPiQy6+2sjqspW1pTozmANCiEsNxovN6ik6ieN0gdcvzEd2itbB/B9qcX1AxraB3b+H1DxWz/3HzXRMMCauTAE2bdZKFi3nLowmXwzIHoegXyJ5TRdVpfwPcUFZud67JrsfqjCpr1CvdN+QvxGgeyUaV8lX9YYmf3ch3xzCaC85tPuk0Wqbr3dpd6iNKirTRtx+P3q5plO/rlnZ/JTjamMZqx4fgRMxgEfPPWhwqQH9Nv/BN1jcjbNhODNbuLhhssUX8IV0RQNe2WJJFxf2jbO3BH4dK1ivFNAmxI7MyejKxgXdWz6b3s9oXSMrNk1w/ZJWDzn8EsSWvoKsDSavCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTSwUhLDNiaGxn8lPQ2UhgyTGHOVy2wTToLeu9ndwRo=;
 b=Cc/T4ie+WPQPy4vwAAf0l5Hqgs/LcrsfEy4FGHmKjSrI34p/GlBocusI8Ks3vNcfh3dZuawoWYzDf5FbWUAxbvRA8ayxZH4kM5idgc4qXTHJsJMDGJcBxQ+AZESntnAuJM12HEC6baWJt7G5gWJ+s7LU5egFlwt0m1tDw247JxbRO9C+CtmDe5gkQH1ow0sxXQ0X0DosulQnXDydCtQesV7+TsyPPmuIfP808SYc0aGCEIG9br5bCsWg5dTRTNk1GIA4E7BRr81lXbPgumlx81zeCU2AyX2hqDMOux6qFOBbgzb2jrBBAkIv6dDN5snw+NBc69Ftv1uaCw/pudFbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTSwUhLDNiaGxn8lPQ2UhgyTGHOVy2wTToLeu9ndwRo=;
 b=jgYEsuoqLx3oalHRcD3sg77ttk9RjkBSfi1pPI/6eQJqsFmPtIVfclMxYGZsjKy1SIPTqBEGz4xGcLfPa1bcPnnkuiS3x9Qqs4lDQt9Y5xI1LxgkwZX0ZQcD9SMENbtcTMhqef5y+xEdxqjuZeDQ3icTO6EiviGU0cilGR2/pkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d820dd39-f4d1-c599-a2e2-a50bb5b66abd@amd.com>
Date: Thu, 21 Sep 2023 10:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
 <9aa0fad3-4132-8444-fb3f-8e1d542652e6@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9aa0fad3-4132-8444-fb3f-8e1d542652e6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CH0PR12MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 8796a994-307d-4f85-ed58-08dbba7f1bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J11yLuwuqESjbDYlXKQijZRQ4Bm2hH5vmYiKMfV4GbIAAPNCR9297ZcN68v6Q490E5VBRWq0s+mQ5CJUdnkK93lq+VrkNj3OWlBMwvaUFKUT1EYFWGhUOeERw9+XzQ8+iwcoFrVHoP8hGQu6rg0xH6WkJN2fN4IBE1HafyEyoO5eUTJdswDQbXb088MI17teZlya58L1lkpAWVCCzSePgc2tWE9o1lcgNxWDhGoY8u2PTCxbuS8qynkSPS5QL5HovkEKTi9Kx/6EmhHt312SPxLnhPindENGZqWH3u7bxixJyuRVOwEZTRhaQIe9At7uEn/SW1OnCODOg9c17eB2mrfErVZgGCztweqaG5Pf6LkTo+uvLGL4XAnyyekdP6kSD9HhzG3RQuO0VUm/+4SfMPPUVO7ioWzqgjsMzoflAoSD1tN7mMeSS3ghLs/+V1b1G5v1W9yWyBFey3W+NMUwCcBmWYE6rU/2E8FDV2CypbI/9kcESXIcRt9w/CybLzj0zMzkSjk/utyikyCyyaRYPtt59rpI3mRwQoLG3nZuBx0yog/CzXzf8j17NsaEdiaR8uAB6crLEStDsnL+9GkMMO4gnycnFWlmkPb031kY9l0uRBEnme/caTxR3l4WTEGnYCey4pmL+3dMT3oZaRcgYG2ofT9PlrfFgBXP+kQsHsybiGXv6qUm0bNtH/atW5HGuiURG4zrobA4Jh0IOrcMX7h9cqsmpfZtlf+YzEhM8BCf5HRdRjtsJYt2EApFPKOm9wLNMd2sPDvil2yIj4CKqNrH/edlmDBV0hqxNZ+iNvEGnl2mcSi9XAPLmjUKlyId55zYOc0z6AELhaPWPGAviA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(82310400011)(451199024)(1800799009)(186009)(46966006)(36840700001)(40470700004)(26005)(2616005)(36860700001)(31686004)(47076005)(40460700003)(83380400001)(40480700001)(336012)(426003)(70586007)(44832011)(8936002)(70206006)(4326008)(31696002)(316002)(110136005)(41300700001)(2906002)(8676002)(478600001)(966005)(86362001)(36756003)(5660300002)(16576012)(356005)(82740400003)(53546011)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 08:45:29.0296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8796a994-307d-4f85-ed58-08dbba7f1bab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5044



On 19/09/2023 12:21, Jan Beulich wrote:
> 
> 
> On 19.09.2023 11:53, GitLab wrote:
>>
>>
>> Pipeline #1009404353 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
>>
>> Commit: ea36ac0d ( https://gitlab.com/xen-project/xen/-/commit/ea36ac0de27c2a7c847a2a52c3e0f97a45864d81 )
>> Commit Message: xen/ppc: Enable full Xen build
>>
>> Bring ppc's Mak...
>> Commit Author: Shawn Anastasio
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1009404353 ( https://gitlab.com/xen-project/xen/-/pipelines/1009404353 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 5 failed jobs.
>>
>> Job #5118269375 ( https://gitlab.com/xen-project/xen/-/jobs/5118269375/raw )
>>
>> Stage: build
>> Name: debian-bullseye-gcc-ppc64le-debug-randconfig
> 
> This and ...
> 
>> Job #5118269256 ( https://gitlab.com/xen-project/xen/-/jobs/5118269256/raw )
>>
>> Stage: analyze
>> Name: eclair-x86_64
>> Job #5118269373 ( https://gitlab.com/xen-project/xen/-/jobs/5118269373/raw )
>>
>> Stage: build
>> Name: debian-bullseye-gcc-ppc64le-randconfig
> 
> ... this imo can't be expected to work. Is it really useful to run randconfig
> tests on ports which are only in the process of being brought up?
> 
>> Job #5118269370 ( https://gitlab.com/xen-project/xen/-/jobs/5118269370/raw )
>>
>> Stage: build
>> Name: debian-bullseye-gcc-ppc64le-debug
>> Job #5118269369 ( https://gitlab.com/xen-project/xen/-/jobs/5118269369/raw )
>>
>> Stage: build
>> Name: debian-bullseye-gcc-ppc64le
> 
> These two, otoh, look to be a result of the tests pre-seeding xen/.config with
> CONFIG_DEBUG settings, followed by making the olddefconfig goal. That, aiui,
> isn't picking up xen/arch/*/configs/*_defconfig, which at this point is
> mandatory for PPC (and likely is going to be so also for RISC-V once the full
> build is enabled there), at least as far as some of the option disables there
> go.
> 
> I think this wants switching to making the defconfig goal, and substituting
> CONFIG_DEBUG in the resulting .config. Due to x86'es and Arm's defconfig-s
> all being empty, this ought to be no change in what exactly is being tested
> there.
Apart from CONFIG_DEBUG there are other options we add using EXTRA_XEN_CONFIG
that might result in new options becoming visible and thus triggering a prompt
without olddefconfig.
So if at all, I think the flow should be:
defconfig
replacements
olddefconfig
make

~Michal

