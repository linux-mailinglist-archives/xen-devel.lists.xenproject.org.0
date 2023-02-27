Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0B6A4664
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502765.774724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfiN-0005jV-Jc; Mon, 27 Feb 2023 15:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502765.774724; Mon, 27 Feb 2023 15:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfiN-0005gv-GZ; Mon, 27 Feb 2023 15:46:59 +0000
Received: by outflank-mailman (input) for mailman id 502765;
 Mon, 27 Feb 2023 15:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rB3s=6X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pWfiM-0005gp-5J
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:46:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f35dd334-b6b5-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:46:52 +0100 (CET)
Received: from MW2PR2101CA0030.namprd21.prod.outlook.com (2603:10b6:302:1::43)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.25; Mon, 27 Feb 2023 15:46:48 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::c) by MW2PR2101CA0030.outlook.office365.com
 (2603:10b6:302:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.5 via Frontend
 Transport; Mon, 27 Feb 2023 15:46:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.16 via Frontend Transport; Mon, 27 Feb 2023 15:46:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 09:46:47 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 27 Feb 2023 09:46:45 -0600
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
X-Inumbo-ID: f35dd334-b6b5-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jARA5KDC2DwF8lZzsZjJ3+apjUJyU0EAraMXGG2KZWi2iU1g4PhQVk7i7TxigUtsfLNpgkRAMN4ixcU4sPEv7nifoeZBpNKjFfWVDOTfhrGgB/hxUHlpuaMNgE1J7EFsDUt4HolFCengEwosPLOgSy42qplWTt3onM/KtZVpfDGVPHeK+SQc8m39zP57fcLZH8rnVUS4j0edFFDPDBhCAzarENZn2jkJfBUE3rnMEmm+G/K8ncykjvwE8aW6duAIhvfbJuUyEDGdPgqnnMaUUYrF5zbUY2lTVrzJ752RNDAa0t6AtmMcnRbb7ZFbrArzItdYeRdxjQBHHVHCWM+/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UegLqUVi7X4YGd75r7Ft+ClTUA0e4GIvo53W1Zoz/iw=;
 b=F4fuOhproJeUDFWs0uG9PaU2pDYdGg9ewe98UjRbqxPzwqBYi8vw4f3nhgULDTubbb0faDKEeZzhKzebA+YHW7MF+u7pFemtxbR474Aml6nniL6D0GWkxukXH6pZB423vI49ke8nqBvDbffHyl70Xgnq0trOGIuE+wfZk3RN4u/gT4enq5q3HXGfWniadjrhu2i49aAT5Yiyg1FYQvvzoPs1TaYeag8rkKfrhLx1A40vHAGlSyP0XnlCQC7Kswat6e7veZHZj32SK8StK//jNrMs+wpcjx16UK2aKZRQAu+RzzgMgIIP0n9S5ZsHdDvAsuH+jJ4wmSJWgYKIbmnelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UegLqUVi7X4YGd75r7Ft+ClTUA0e4GIvo53W1Zoz/iw=;
 b=YNy7hgOVGIczd8412k+anQvM5JZhpagzhNqaQRtqlBTINuh67p5Q/sV0aBe7jPCFhXW90zzsEFaSBrQ6It0yAJiZ+gXALwaB4eGQqcbUerA4m//Mr8ldGvsi+QTPqRSi9C2JC2wVtTcIgTWhFh+tETC44VojAwnbdZMkoayZZt8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com>
Date: Mon, 27 Feb 2023 16:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
 <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
 <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
 <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
 <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT015:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c16c5b-639f-40db-1b13-08db18d9d5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ipC+LVejiYO2VDW+cDQnf8gIC6wtF3NQqSP8CMFwXGsrjJSzaw9Sa5zjZ5T5tYMSpcBkfcZVsQeNt+L9aBscq9EbcOfJBQovl5GcaqsPDw9vyMeDPNp4ZcxQcyGHWNqhlOXO3LAkV9wvNRKdJlU+0vlOFsDMl0LEWLgxhTSeg02gRGRqkHCpZJWmunagjQbA9M9cCNhxh1dH16gv1R7A4QM71ksB9bG7l1RLe0PgXpwfs3jG2IFHCiJoaB+LC6e0MszMWUdWDsvTCi4KmedDwIn00vzuOPnHFCybeFq+GRpZ60YkEQH/DkAW/Nr+5kvghbeIDPqiot5/rlFOjW9P/J1FCu9Mj5haoQaeiYnYYc7uholhh11N+/mWXfYed3YCJXi81iAsFPlHYHDOYrsybOEiCGwViqjY8DcT4reT3sbZKgjvZybtfC/cRrgJ6WIvI9n/ruok7WT98Hm8lDT+4P+/55UZVkxlzUBPIQ63G78TpUou4eL3z3bGZkageYd76y2o7P2kUdvaYonBkthOI7v5IBBwH4ESxyUnGk09n0NYU2JRCe9PoGXHLirwq+XbDnnp6ot4/CzcVnEx4jZVKniMRQ/4guMdDmCGRAxYyO3l0JeXlyjC9abcEPYY3lXjywYgVhTABoUdeBgIcvpiYnDku73OPaHylFudQXtY/XJ98/t/VRajx6xC7IxXjktZTz15LFSMQ7gPRjyALz0QcIVIo/mR8Ai307injmMqN+4dk/JLKmC3LbGErc4vlOYxhpMn/CkKOiRobeXK8+EJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199018)(46966006)(36840700001)(40470700004)(66899018)(31686004)(47076005)(336012)(426003)(83380400001)(2906002)(36756003)(31696002)(44832011)(86362001)(26005)(41300700001)(54906003)(53546011)(82310400005)(8936002)(478600001)(36860700001)(81166007)(16576012)(186003)(2616005)(356005)(40480700001)(4326008)(5660300002)(8676002)(316002)(40460700003)(6916009)(82740400003)(70206006)(70586007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:46:47.8271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c16c5b-639f-40db-1b13-08db18d9d5f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336



On 27/02/2023 16:00, Jan Beulich wrote:
> 
> 
> On 27.02.2023 15:46, Michal Orzel wrote:
>> On 27/02/2023 14:54, Jan Beulich wrote:
>>> On 27.02.2023 14:41, Michal Orzel wrote:
>>>> On 27/02/2023 11:10, Jan Beulich wrote:
>>>>> On 27.02.2023 10:53, Michal Orzel wrote:
>>>>>> --- a/xen/Makefile
>>>>>> +++ b/xen/Makefile
>>>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>>
>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>>>>  define all_sources
>>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>>
>>>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>>>>> also only be included when selected (or at the very least only when an
>>>>> arch might select it, which afaics is possible on x86 only right now).
>>>>>
>>>>> It would also help if in the description you made explicit that SUBDIRS
>>>>> isn't used for anything else (the name, after all, is pretty generic).
>>>>> Which actually points at an issue: I suppose the variable would actually
>>>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>>>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>>>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>>>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>>>>> has caused crypto to be missing from SUBDIRS.
>>>>>
>>>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
>>>> and the cleanup/improvements that would be beneficial but not related to this patch.
>>>> The second part involves more code and there are parts to be discussed:
>>>>
>>>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
>>>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
>>>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
>>>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
>>>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
>>>> top of the Makefile (thus harder to make sure the linking order is correct).
>>>>
>>>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
>>>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
>>>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
>>>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
>>>> but for all the existing architectures.
>>>
>>> I understand that the changes would be more involved, but I disagree with
>>> your "two parts" statement: If what I've outlined was already the case,
>>> your patch would not even exist (because crypto/ would already be taken
>>> care of wherever needed).
>>>
>>>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
>>>> into account for the tags/csope generation. Would the following change be ok for that purpose?
>>>>
>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>> index 2d55bb9401f4..05bf301bd7ab 100644
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>
>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
>>>> +
>>>>  define all_sources
>>>>      ( find include -type f -name '*.h' -print; \
>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>
>>> The fact that, afaict, this won't do is related to the outline I gave.
>>> You've referred yourself to need-config. Most if not all of the goals
>>> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
>>> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
>>> will simply be unset in the common case. Therefore if an easy change is
>>> wanted, the original version of it would be it. An intermediate
>>> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
>>> But neither would preclude the same issue from being introduced again,
>>> when a new subdir appears.
>> I understand your concerns. However, I cannot see how your suggested changes
>> e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
>> They would reduce the repetitions (hence I called them cleanup/improvements)
>> but as we want to keep tags,cscope,clean as no-dot-config targets,
> 
> I, for one, didn't take this is a goal (perhaps for clean, but there ...
So you would suggest to make these targets (except clean) .config dependent?


> 
>> we would still not be able to use:
>> SUBDIRS-$(CONFIG_CRYPTO) += crypto
>> and use it in all_sources (because as you pointed out, it will be a no-op).
> 
> ... the problem is obvious to solve, as outlined before).
> 
>> Also, why do we care so much about guarding crypto/ if we take into account
>> so many architecture/config dependent files for tags/cscope (e.g. in drivers,
>> lib/x86, etc.)?
> 
> Good question, which I'm afraid I have to answer with asking back:
> 
>> If these are no-dot-config targets, then we should take everything, apart
>> from really big directories like arch/ ones.
> 
> Why is arch/ other than arch/$(TARGET_ARCH) to be ignored? And if it is,
> why would crypto, used by only x86, not be ignored? As always I'd prefer
> firm rules, not arbitrary and/or fuzzy boundaries.
> 
> Furthermore, considering e.g. cscope: Personally I view it as actively
> wrong to constrain it to just one arch. That'll lead to mistakes as
> soon as you want to make any cross-arch or even tree-wide change. Hence
> it would probably want treating just like clean. I can't comment on the
> various tags (case-insensitive) goals, as I don't know what they're
> about.
The useful thing about generating tags/cscope per-arch is that you can limit
the number of findings. Each symbol leads to one definition and not to multiple
ones. But this is still not ideal solution because doing this per-arch
and not per-config leads to inconsistency. Also, as you wrote, sometimes it is useful
to have all the symbols loaded when doing tree-wide changes. So in ideal world we should
have an option to use approach or another. I reckon this is why Linux
has a separate script for that which allows to set all-arch/per-arch, config-dependent/config-independent.

Anyway, I do not have any ready-made solution for this problem.
The only benefit of this patch would be that the symbols for crypto/ would be visible
in cscope/tags (TBOOT uses the crypto functions but there are no definitions present
which may be suprising for people using ctags).
But I can understand if you do not want to take this patch in, due to all the observations above.


~Michal


