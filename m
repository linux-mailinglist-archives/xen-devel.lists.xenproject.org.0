Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C616A5438
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503084.775237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWv8q-0002V2-34; Tue, 28 Feb 2023 08:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503084.775237; Tue, 28 Feb 2023 08:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWv8p-0002TB-VV; Tue, 28 Feb 2023 08:15:19 +0000
Received: by outflank-mailman (input) for mailman id 503084;
 Tue, 28 Feb 2023 08:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KG2Y=6Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pWv8o-0002Sz-QU
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:15:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05c6afb6-b740-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 09:15:13 +0100 (CET)
Received: from MW4PR04CA0333.namprd04.prod.outlook.com (2603:10b6:303:8a::8)
 by BN9PR12MB5195.namprd12.prod.outlook.com (2603:10b6:408:11c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Tue, 28 Feb
 2023 08:15:09 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::6c) by MW4PR04CA0333.outlook.office365.com
 (2603:10b6:303:8a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30 via Frontend
 Transport; Tue, 28 Feb 2023 08:15:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.17 via Frontend Transport; Tue, 28 Feb 2023 08:15:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 28 Feb
 2023 02:14:56 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 28 Feb 2023 02:14:55 -0600
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
X-Inumbo-ID: 05c6afb6-b740-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt10MwKHejSzDPp5QKuiUzopI+yAVMTAfETsU8CL+AI7+ADLPZoQFJEAEGGhiIPucocH/2p2OqFTqdXwAiMU8QTCOD6xUSnnpID4bRmuik46X3JhDr2R9/IxXX7t9pXWl62/7pT3JDYrQMUzrW+PkkwhyPIm5+8IRKfvkbhlkrKeQ6O21xDgd0Q7an7Z2eK5IT455bOwO+eZmFopHPEZJ4vcx37PD2dvhKSGP6nWejFyyAwOVKGkFkwOYHvq4AoUd3Wmle4dxSv4fGiAd/oC2coXX84kL5xpntdlGf2UEG5xp4TfnCCJiWPWUpKe9PRYVA3606+KMBjD6xrSB47cCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OV3ul5N1h/b+uCyR4nrTlIq0iHWqeS2wnOiFiisqZe4=;
 b=MC73u7K75KB60w8f3e4XHu4PPwgn2kxCNxYSJj6U8cZrLG5gp9QNOyXH6J8Oe27qf/CeR6ZRriymMjdMUHB7BUK9VVNpegzezYZZdVvyu3Sj9UUmDyK08/wgCZgDT5jP/9Stt6vJ9M5iU1srLVOemxeVGz8BOqu7Nc/wtsgruKOvLYptbQD/Lf7KN8KL5kO9WJ3H2XPDsK+2MXbSvnPnl9Yd/zDyq1IRz31Y35Cx6Avm/6QAvJiI03JMRZA3FZsTTMB/ELcYJ3Hsx1tIeNx7DGnaI8OFbTao+9Fzw8AkvAAsyF0LYmRrTjK8AkE3Z7xDtH4fzJDciTmzsYDNMNSqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV3ul5N1h/b+uCyR4nrTlIq0iHWqeS2wnOiFiisqZe4=;
 b=psgwuK1sMqwtEM2VNHgd8GnZzdiNhoAE+9aemlALpO6mB9CcgeBS4zrF9wXI5ZEEcvTYvBVvpthbyGS1jRQ8E7r3HR6jcOOPpGM14m8pGAhNKGe0PIGlcZ0bLQ2mkKHm/Ph/4UK2xqzUDEMmvuL4cAtpMVliAjQxxNCXjjysZTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5d2890c9-d78b-69af-fec3-dace8723ea24@amd.com>
Date: Tue, 28 Feb 2023 09:14:49 +0100
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
 <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com>
 <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT012:EE_|BN9PR12MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: e1537b03-7071-49e7-b1d0-08db1963e85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BtKkPpK4FJbYD0DZrryI7SzdK769+YMm0FuW/xScC9E8+UN6svuOO/Xtbny6Ae6J468wqP8svimt/bUfv6BL0EWMMWBtQxrKZ8bZHZv/fQBw1BbLWQ+11vUj9wpA3b3BH2kc7zD0Clh2KOPj0Y8rIQRv24P2HquASm0A5240BXQwweAtBldmsDobGzeZixIbhVtx1WicEYYzU67wUTYBT24QbByw5sNYFgBJ1uEM3Jxo3j5DR2ZN5PlfTUuL3TuiV7uXHimLl/iyck5WufwHg7rUzonZpSWol5kproNc1wPHBxgbNxssnHDwkE5KQmJFOFCXZXgOQDgvdcBoEmuaPJmGE388INFor4SpYW7w65qs5CZvKWTB8P+XYsq/7CccXjd4l1ftdrpuJOP7GCvESz3km52M5zEN/btcVyT3cciHoyQQnT62OgZJeynT2x+zJnmlVB7NbwjkG2R78drstyqsgz5l/d5H6NCitw+sMp+tmztkNHsbzkJsFV0hZS8BIt2iD5oroZvtabgzWzVY6dPJ1G/6XLKCIAy+y58ZuS3lmqZiQ4EnZWRZXJl1mRI+pafCGGtrVKufeMBTBeGXgYclK+xLyQ0cGiXAZGl0bpOWFBEk8QhhIl9mr3h4zZ5oqAvshgwsJrmR/u90dEurCgrhZoUIONckxipTb00ZQLC3P6Ws1BHh+w3hDNqjAQZ2DcLDku0kXnlTC9ums6MrBOQ73Zm0aDL43Vty1RY0b8Pr1BnCeIQTonF/kg4duk8o1BU4vn/A9Poo0gN72CYtnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(46966006)(40470700004)(36840700001)(6916009)(70586007)(36860700001)(82740400003)(336012)(316002)(83380400001)(40460700003)(16576012)(4326008)(54906003)(86362001)(70206006)(31696002)(426003)(26005)(31686004)(36756003)(81166007)(8676002)(53546011)(478600001)(186003)(6666004)(356005)(8936002)(44832011)(2906002)(47076005)(40480700001)(66899018)(5660300002)(41300700001)(82310400005)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 08:15:09.2537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1537b03-7071-49e7-b1d0-08db1963e85f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5195



On 27/02/2023 16:57, Jan Beulich wrote:
> 
> 
> On 27.02.2023 16:46, Michal Orzel wrote:
>> On 27/02/2023 16:00, Jan Beulich wrote:
>>> On 27.02.2023 15:46, Michal Orzel wrote:
>>>> On 27/02/2023 14:54, Jan Beulich wrote:
>>>>> On 27.02.2023 14:41, Michal Orzel wrote:
>>>>>> On 27/02/2023 11:10, Jan Beulich wrote:
>>>>>>> On 27.02.2023 10:53, Michal Orzel wrote:
>>>>>>>> --- a/xen/Makefile
>>>>>>>> +++ b/xen/Makefile
>>>>>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>>>>
>>>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>>>>>>  define all_sources
>>>>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>>>>
>>>>>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>>>>>>> also only be included when selected (or at the very least only when an
>>>>>>> arch might select it, which afaics is possible on x86 only right now).
>>>>>>>
>>>>>>> It would also help if in the description you made explicit that SUBDIRS
>>>>>>> isn't used for anything else (the name, after all, is pretty generic).
>>>>>>> Which actually points at an issue: I suppose the variable would actually
>>>>>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>>>>>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>>>>>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>>>>>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>>>>>>> has caused crypto to be missing from SUBDIRS.
>>>>>>>
>>>>>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
>>>>>> and the cleanup/improvements that would be beneficial but not related to this patch.
>>>>>> The second part involves more code and there are parts to be discussed:
>>>>>>
>>>>>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
>>>>>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
>>>>>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
>>>>>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
>>>>>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
>>>>>> top of the Makefile (thus harder to make sure the linking order is correct).
>>>>>>
>>>>>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
>>>>>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
>>>>>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
>>>>>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
>>>>>> but for all the existing architectures.
>>>>>
>>>>> I understand that the changes would be more involved, but I disagree with
>>>>> your "two parts" statement: If what I've outlined was already the case,
>>>>> your patch would not even exist (because crypto/ would already be taken
>>>>> care of wherever needed).
>>>>>
>>>>>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
>>>>>> into account for the tags/csope generation. Would the following change be ok for that purpose?
>>>>>>
>>>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>>>> index 2d55bb9401f4..05bf301bd7ab 100644
>>>>>> --- a/xen/Makefile
>>>>>> +++ b/xen/Makefile
>>>>>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>>
>>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
>>>>>> +
>>>>>>  define all_sources
>>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>>
>>>>> The fact that, afaict, this won't do is related to the outline I gave.
>>>>> You've referred yourself to need-config. Most if not all of the goals
>>>>> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
>>>>> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
>>>>> will simply be unset in the common case. Therefore if an easy change is
>>>>> wanted, the original version of it would be it. An intermediate
>>>>> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
>>>>> But neither would preclude the same issue from being introduced again,
>>>>> when a new subdir appears.
>>>> I understand your concerns. However, I cannot see how your suggested changes
>>>> e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
>>>> They would reduce the repetitions (hence I called them cleanup/improvements)
>>>> but as we want to keep tags,cscope,clean as no-dot-config targets,
>>>
>>> I, for one, didn't take this is a goal (perhaps for clean, but there ...
>> So you would suggest to make these targets (except clean) .config dependent?
>>
>>
>>>
>>>> we would still not be able to use:
>>>> SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>>> and use it in all_sources (because as you pointed out, it will be a no-op).
>>>
>>> ... the problem is obvious to solve, as outlined before).
>>>
>>>> Also, why do we care so much about guarding crypto/ if we take into account
>>>> so many architecture/config dependent files for tags/cscope (e.g. in drivers,
>>>> lib/x86, etc.)?
>>>
>>> Good question, which I'm afraid I have to answer with asking back:
>>>
>>>> If these are no-dot-config targets, then we should take everything, apart
>>>> from really big directories like arch/ ones.
>>>
>>> Why is arch/ other than arch/$(TARGET_ARCH) to be ignored? And if it is,
>>> why would crypto, used by only x86, not be ignored? As always I'd prefer
>>> firm rules, not arbitrary and/or fuzzy boundaries.
>>>
>>> Furthermore, considering e.g. cscope: Personally I view it as actively
>>> wrong to constrain it to just one arch. That'll lead to mistakes as
>>> soon as you want to make any cross-arch or even tree-wide change. Hence
>>> it would probably want treating just like clean. I can't comment on the
>>> various tags (case-insensitive) goals, as I don't know what they're
>>> about.
>> The useful thing about generating tags/cscope per-arch is that you can limit
>> the number of findings. Each symbol leads to one definition and not to multiple
>> ones. But this is still not ideal solution because doing this per-arch
>> and not per-config leads to inconsistency. Also, as you wrote, sometimes it is useful
>> to have all the symbols loaded when doing tree-wide changes. So in ideal world we should
>> have an option to use approach or another. I reckon this is why Linux
>> has a separate script for that which allows to set all-arch/per-arch, config-dependent/config-independent.
>>
>> Anyway, I do not have any ready-made solution for this problem.
>> The only benefit of this patch would be that the symbols for crypto/ would be visible
>> in cscope/tags (TBOOT uses the crypto functions but there are no definitions present
>> which may be suprising for people using ctags).
>> But I can understand if you do not want to take this patch in, due to all the observations above.
> 
> Well, I'm not outright opposed. But I definitely want to hear another
> maintainer's view before deciding.

While waiting for other maintainers vote, I would like to propose an intermediate approach
that would at least result in unified approach (related to what you wrote about constraints):

In general, there are 2 *main* approaches when dealing with code indexing.
The first is a "tree-wide" approach, where we do not take Kconfig into account.
The second is a "config-aware" approach, where we take into account Kconfig options.

At the moment, in Xen, the approach taken is not uniform because we take all the directories
into account except arch/ where we take only $(TARGET_ARCH) into indexing. This makes it difficult
to reason about. What is the rule then - how big is the directory?

The intermediate solution is to switch for now to "tree-wide" approach by modifying the SUBDIRS
from:
SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
to:
SUBDIRS = xsm arch common drivers lib test crypto

This way, the approach is clear for everyone and we do not make any exceptions. Also the name of
SUBDIRS and all_sources makes sense as they are read as "global" by default as oppose to e.g. "all_compiled_sources".
In the future, we can then add support for "config-aware" approach by taking into account Kconfig which involes
more code.

Benefits:
 - clear approach, no fuzzy boundaries - all in
 - crypto can be included right away as well as any new subdir without requiring to fix the infrastructure first


~Michal

