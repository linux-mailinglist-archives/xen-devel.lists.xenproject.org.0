Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE36A450A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502650.774544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWem8-0004Y1-4C; Mon, 27 Feb 2023 14:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502650.774544; Mon, 27 Feb 2023 14:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWem8-0004VL-0P; Mon, 27 Feb 2023 14:46:48 +0000
Received: by outflank-mailman (input) for mailman id 502650;
 Mon, 27 Feb 2023 14:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rB3s=6X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pWem6-0004Ql-Jz
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:46:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e83::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a715ff6-b6ad-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 15:46:40 +0100 (CET)
Received: from BN9P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::25)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 14:46:36 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::b3) by BN9P222CA0020.outlook.office365.com
 (2603:10b6:408:10c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 14:46:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.16 via Frontend Transport; Mon, 27 Feb 2023 14:46:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 08:46:35 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 27 Feb 2023 08:46:34 -0600
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
X-Inumbo-ID: 8a715ff6-b6ad-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h513patHevOVVsikYkSTPL9llwCBJ7Vm+1VMwE31de89s1ombciXtgbLXnmTc2IOBkG7LvGMmYF9NpWgHgPZJ1OAa5EHSmb+KrFMAomG5u7Q0mfgnB0VYGztp8K2Bx5P2AWxaziP+feVk/rJtP1Q4qRWQ9yEgggZkv0jMI2q4HPNu3M/+TW2Tfrz9XCemwx9ihbZ6ASIzRbCTibwMq1Uf839SG6K/HYOIwRkqDNz5y3HwQvU4d0D9HM2rfFS5hpplAKRVfai+yZynhhVssZBS6unBuL8ss9GFHp14vbf6seULHGElyraOSn21WRCMQyYB4hdy9qqtGJVigUSJeSuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8dh507pGMYHxnf6lKuc6a4Vv1vbjkxjg77QAZ51vcU=;
 b=mRszAGoAirkh2hTo/VYIIQfv82XxhVTMFMxeT0sN5sfr7+PHwxkpUZzeacfWhEKAEvfOyEkIQ2pqK9tq8NnEW4jkhPMma/kQTouAb9cCctAeOWSsxRWYhsoLFEFBnCBoHNhqzyMXY5ny2N296elR7/qUpqbAfYBSKEvJv6pW+XXy+csKZchPX74aFwZOOFjAtAvsvwaAihu8LQiA64uYxDB6P134PO2Cjyy7h52ndcARTKfsMIRv0riqw9bqaDB9077toVI6AQM9KBRjqRIX1Vj5/mubTwmjUfHDqiMnzMJ5BgWBNvz+EsrUH80Zcro3bIBQjpB47QELSQdYANfSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8dh507pGMYHxnf6lKuc6a4Vv1vbjkxjg77QAZ51vcU=;
 b=XvRRR+WvP54czRkhustQ/f3NLhncNYxU6XPcRJrlmvUDnuuXN5E6oD2fwfHRXhtKmReT8wvozWM8x9itNIk1Hk7K+q2aNJSdNZuE2DJsywkdjjmzQNuh0q7XxEiWsR5mTmLUVdMdtMyDHE9T2q877b/r1fEdLBaIidVRbVcUk6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
Date: Mon, 27 Feb 2023 15:46:34 +0100
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT005:EE_|MN2PR12MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5bf30b-c48d-4ec5-39c2-08db18d16d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ju0Js9mEPV+g/1W2UBrEkHAh7PavoXSLragB5McX+EO88ZCNm+epKc1b99odVEs35kjjKG8q5qSRh3ot/MnvXKYJfAWPjqavCbHTCm1lSfJDjjHmljjh2pgTj3vgtsMSA/fO2aynqn/L/wv+kFX6MhinRwGsqmfgflcv5hjr2vPKmndz+q8+8pVYdPq7GKyyUeuIoy9evZoT3EUOz4wk52rxht5+x8Vllik8OJ5FlCjKBgDQWgTssXycvofVJKPV3+cFiq38BbJBPNQHhJR07CB2YnjkghvqRlxSej9Qs6ViHAiqch8tifKJ17/V4jFviA9CZ3H5b4gaL5COfZSw2XiFoMEKG1qSPKDg3Y0GKLOhMP6M50Ruoawo3Eb+Ec4ByrkSKhq+attP6ZYP8iWKaWKpGyDwAVvDGYM5S8CV1gbiBI7njRHw9eHwijJhdec4vzqMMY8f0iJMHFb8gEjZuhifz5QNbTMU5TVzEMaSh1IefAofRs4D2WTRMLWk0w/Ct4Tz8JRhqSZ9wd2um6/7tACbfO6OpDyKBBMdJZaZk6nZKPk+f03N8pqmQhFf6O419ktB/OsBL58bVkMJewygtx6+J6KehoYALRVfUosZkutQdhJvPRYvD7u7ypgmiT69TMu5pphI8olWTcwy7hOdeb4F6LkOMRB2g88NGXwy4G3fXrJwAAOtjn2UU6Z40xSAe/lHmX7ENWODGlNtWhpSWXyg54fU/fTgvAhHWa2uvprjnGnOf13mrZhEzUa7+Bftfj+M9NWQZp79eTXm9s+YUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199018)(40470700004)(36840700001)(46966006)(4326008)(70586007)(70206006)(31686004)(6916009)(83380400001)(426003)(36860700001)(41300700001)(47076005)(82740400003)(336012)(54906003)(316002)(36756003)(8676002)(81166007)(16576012)(8936002)(5660300002)(44832011)(356005)(86362001)(478600001)(53546011)(186003)(26005)(40460700003)(31696002)(82310400005)(2906002)(40480700001)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:46:36.2770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5bf30b-c48d-4ec5-39c2-08db18d16d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301



On 27/02/2023 14:54, Jan Beulich wrote:
> 
> 
> On 27.02.2023 14:41, Michal Orzel wrote:
>> Hi Jan,
>>
>> On 27/02/2023 11:10, Jan Beulich wrote:
>>>
>>>
>>> On 27.02.2023 10:53, Michal Orzel wrote:
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>
>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>>  define all_sources
>>>>      ( find include -type f -name '*.h' -print; \
>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>
>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>>> also only be included when selected (or at the very least only when an
>>> arch might select it, which afaics is possible on x86 only right now).
>>>
>>> It would also help if in the description you made explicit that SUBDIRS
>>> isn't used for anything else (the name, after all, is pretty generic).
>>> Which actually points at an issue: I suppose the variable would actually
>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>>> has caused crypto to be missing from SUBDIRS.
>>>
>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
>> and the cleanup/improvements that would be beneficial but not related to this patch.
>> The second part involves more code and there are parts to be discussed:
>>
>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
>> top of the Makefile (thus harder to make sure the linking order is correct).
>>
>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
>> but for all the existing architectures.
> 
> I understand that the changes would be more involved, but I disagree with
> your "two parts" statement: If what I've outlined was already the case,
> your patch would not even exist (because crypto/ would already be taken
> care of wherever needed).
> 
>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
>> into account for the tags/csope generation. Would the following change be ok for that purpose?
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 2d55bb9401f4..05bf301bd7ab 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>
>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
>> +
>>  define all_sources
>>      ( find include -type f -name '*.h' -print; \
>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
> 
> The fact that, afaict, this won't do is related to the outline I gave.
> You've referred yourself to need-config. Most if not all of the goals
> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
> will simply be unset in the common case. Therefore if an easy change is
> wanted, the original version of it would be it. An intermediate
> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
> But neither would preclude the same issue from being introduced again,
> when a new subdir appears.
I understand your concerns. However, I cannot see how your suggested changes
e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
They would reduce the repetitions (hence I called them cleanup/improvements)
but as we want to keep tags,cscope,clean as no-dot-config targets, we would still not be able to use:
SUBDIRS-$(CONFIG_CRYPTO) += crypto
and use it in all_sources (because as you pointed out, it will be a no-op).

Also, why do we care so much about guarding crypto/ if we take into account
so many architecture/config dependent files for tags/cscope (e.g. in drivers, lib/x86, etc.)?
If these are no-dot-config targets, then we should take everything, apart from really big directories
like arch/ ones.

~Michal

