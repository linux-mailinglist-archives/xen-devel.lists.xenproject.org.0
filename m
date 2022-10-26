Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412860DF97
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 13:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430472.682195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onec6-0008Mr-6d; Wed, 26 Oct 2022 11:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430472.682195; Wed, 26 Oct 2022 11:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onec6-0008Jo-3Y; Wed, 26 Oct 2022 11:30:26 +0000
Received: by outflank-mailman (input) for mailman id 430472;
 Wed, 26 Oct 2022 11:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azgP=23=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onec4-0008Ji-2U
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 11:30:24 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 928c8caf-5521-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 13:30:21 +0200 (CEST)
Received: from BN8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:408:ac::47)
 by IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Wed, 26 Oct
 2022 11:30:16 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::13) by BN8PR07CA0034.outlook.office365.com
 (2603:10b6:408:ac::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 11:30:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 11:30:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 06:30:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 06:30:01 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 06:30:00 -0500
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
X-Inumbo-ID: 928c8caf-5521-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N87Bn6kKXWsIU0qB2EJsRsNajHsXcjNnXlwcHMEwkI4NF4psBn5HW2h1frPZ8tjf5a1Lb7wSANOURwQFCi6nAKE3684Gc+8KX15NuiH8ALOcoUhbNga/XeDOHX9dxfJkH+FZNrtM2acNmRi2CKOhp2eQ+19X5uKHwnaFuxwuYlc/y+KhFoJEglPNQ3z/1Vt6vV/XCHMxU/G/FsmTGF+qxrapQA9/ty4/F8ZYcUp30VKfipkvcnW0rQ6+MTyQZNpZDZT/DQDdF4OJJ6dyMwUdOoxmAJC8KK5cza/scy9QdXrKhoJ5F5aPOXSbpTPBEkanHfObMoPw90C98FL0nMaCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MKL4/bJPIbrbqSmm1MNH2U23zvEtOLoWhA71QkNGbc=;
 b=Y7i9WHdbzf6t6vtz5KtWYY7wi96QNzTtXbh4kMcE02K+Ttcurkmj9LyB6F4hMJ402UEbKTFz6b2SkTUkx6wQ4Ecuj5zPEoD2ZE278gGOWCJobOavcZ8dPw73pjczZbHs26x1oOYAAYxyLwDqtM4ZA/7y3kVQE4bf7gsIiIVL+T4DSEU9cVksDM75U32zBTkiqHHsZ8Yss+CEkRVglAFqaIbV1pKr5XzcN6y0OU+GWSQY6QzKy8BP5GdOWPqLmapFzAoPURic+4/NsmatL438wMb4a6063Oa9hZ6noDthK993HLdPAkUx6J4DAiZVKqCrwjm4q5gN/djsi2k/Fru/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MKL4/bJPIbrbqSmm1MNH2U23zvEtOLoWhA71QkNGbc=;
 b=j5bAkC/mQsBZW3bMCe46w9gGrw4L3FyuF1Tp7eIshsBbmOOWdZXUSKwsaObQOMOtUWtMOL8Au67LjFckHQ5bPKrWt+isIuPs3UtJULDPgFSUTzjJNGeZ9GmkrPt7E9ZIPZfrqqDd0cf2CsG/z5VNrrdGg10z4fCeb1I/qQ3Uf58=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a3306efe-16bb-feb0-91aa-d6a9b0e30691@amd.com>
Date: Wed, 26 Oct 2022 13:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Deadcode discussion based on Arm NS phys timer
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
 <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
 <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com>
 <7C838BB9-E8FA-4239-B851-B179CB6B7A02@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7C838BB9-E8FA-4239-B851-B179CB6B7A02@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 41514440-ea25-45ee-f7dc-08dab7457473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s+It8KC7SKu7hDUM1WayDCH2nJpVS2B7WhP2jiDXr1B5sIV+lSW6CPfQzXaD60kjvIUKhXSDcBDK3K4cGYiR/IML9vFo2PiBOvm9yi+fCCK71s5epFflMVBAp7Z3Ba3bmikE6TorNQuYxe2T2VsgUS4BhQRMKQ96xIBXi/zjG0Po+9XroqKcExOXYuv2rSsDjFubplfp9UxqJYvOSCua+EzSsP3WVKUuiV8w+zkupygnzjFCwG/HtLYB2tbC5m9J5lvv79ILo3Y0DkYtCF28KKKzHo6mJZf1uTFtGNZwHsjJnZIl3g4D68CsEOltmLcRGgQCedSf3DlCWWymb6e/ZDmVU5XSNNb0ZKFaRgX/H32AJl9nO/S/idKvDTg+eyNnxrjRv8FtyLxJc5+KvMFA8eh9gOwKU92yU3GTj2lHVH85nUWw4kCqw/uGnUMl2jZXBDwSbxWNZddhLJc6oT40r0ue1AYAsniV92e9Rbzyvm+Bg8sp0ZAPH2D4IPfgAi8CE9EU0cvsU4Gx2ThMQeOhS/Gym9e1nN7tKTvq0MwqwX49wcnlgtXjPHMqJmpxorHtaDdRJn5l+rtD+rWGwWctSM81cCwW3YhmtFx80313xuFq9Z+lyqnSHryLk8u5cayiAXSP9b+BRS6EbnQvHgwBQyGynBaT9posJorpNPckPIDaXQpAIIqXeF9Ok06koNLCPjpn/xtcompO/YmQNvHBZME9vr0Gp1YUOF+xgLBI/WwPpuPvvHubZA4xzgDwDwscfaf7k1Ctyg+f7QusceU+/k21Gfi1f9KwWE+m/rr+OLD8qAjctcRkXudZk9U6+q4SWScNGMfcG1AS+qHxhhyRtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(31686004)(36756003)(66899015)(82740400003)(36860700001)(5660300002)(70206006)(8936002)(70586007)(83380400001)(426003)(47076005)(86362001)(31696002)(44832011)(356005)(81166007)(110136005)(26005)(186003)(40460700003)(478600001)(2616005)(336012)(40480700001)(16576012)(316002)(41300700001)(82310400005)(8676002)(4326008)(2906002)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:30:15.9792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41514440-ea25-45ee-f7dc-08dab7457473
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505

Hi all,

On 25/10/2022 10:20, Bertrand Marquis wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Michal,
> 
>> On 25 Oct 2022, at 09:07, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Bertrand,
>>
>> On 25/10/2022 09:45, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 25 Oct 2022, at 08:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 25/10/2022 03:29, Stefano Stabellini wrote:
>>>>>
>>>>>
>>>>> On Mon, 24 Oct 2022, Julien Grall wrote:
>>>>>>> On 24/10/2022 12:51, Julien Grall wrote:
>>>>>>>> Caution: This message originated from an External Source. Use proper
>>>>>>>> caution when opening attachments, clicking links, or responding.
>>>>>>>>
>>>>>>>>
>>>>>>>> On 24/10/2022 10:07, Michal Orzel wrote:
>>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> Hi Michal,
>>>>>>>>
>>>>>>>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly
>>>>>>>>> speaking, we are routing
>>>>>>>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use
>>>>>>>>> of it (as it uses the hypervisor timer CNTHP).
>>>>>>>>> This timer is fully emulated, which means that there is nothing that can
>>>>>>>>> trigger such IRQ. This code is
>>>>>>>>> a left over from early days, where the CNTHP was buggy on some models
>>>>>>>>> and we had to use the CNTP instead.
>>>>>>>>>
>>>>>>>>> As far as the problem itself is not really interesting, it raises a
>>>>>>>>> question of what to do with a deadcode,
>>>>>>>>> as there might be/are other deadcode places in Xen.
>>>>>>>>
>>>>>>>> There are multiple definition of deadcode. Depending on which one you
>>>>>>>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
>>>>>>>> would result to a lot of places impacted with the decision.
>>>>>>>>
>>>>>>>> So can you clarify what you mean by deadcode?
>>>>>>> In the timer example, I think we have both a deadcode and unreachable code.
>>>>>>> For the purpose of this discussion, let's take the MISRA definition of a
>>>>>>> deadcode which is a "code that can be executed
>>>>>>> but has no effect on the functional behavior of the program". This differs
>>>>>>> from the unreachable code definition that is
>>>>>>> a "code that cannot be executed". Setting up the IRQ for Xen is an example
>>>>>>> of a deadcode. Code within IRQ handler is an unreachable code
>>>>>>> (there is nothing that can trigger this IRQ).
>>>>>>>
>>>>>>> What I mean by deadcode happens to be the sum of the two cases above i.e.
>>>>>>> the code that cannot be executed as well as the code that
>>>>>>> does not impact the functionality of the program.
>>>>>>>
>>>>>>>>
>>>>>>>>> One may say that it is useful to keep it, because one day,
>>>>>>>>> someone might need it when dealing with yet another broken HW. Such
>>>>>>>>> person would still need to modify the other
>>>>>>>>> part of the code (e.g. reprogram_timer), but there would be less work
>>>>>>>>> required overall. Personally, I'm not in favor of
>>>>>>>>> such approach, because we should not really support possible scenarios
>>>>>>>>> with broken HW (except for erratas listing known issues).
>>>>>>>>
>>>>>>>> The difference between "broken HW" and "HW with known errata" is a bit
>>>>>>>> unclear to me. Can you clarify how you would make the difference here?
>>>>>>>>
>>>>>>>> In particular, at which point do you consider that the HW should not be
>>>>>>>> supported by Xen?
>>>>>>> I'm not saying that HW should not be supported. The difference for me
>>>>>>> between broken HW and
>>>>>>> HW with known errata is that for the former, the incorrect behavior is often
>>>>>>> due to the early support stage,
>>>>>>> using emulators/models instead of real HW, whereas for the latter, the HW is
>>>>>>> already released and it happens to be that it is buggy
>>>>>>> (the HW vendor is aware of the issue and released erratas).
>>>>>>
>>>>>> Thanks for the clarification. What I would call broken is anything that can't
>>>>>> be fixed in software. For a not too fictional example, an HW where PCI devices
>>>>>> are using the same stream ID. So effectively, passthrough can't be safely
>>>>>> supported.
>>>>>>
>>>>>> Regarding, not yet released HW, I don't think Xen should have workaround for
>>>>>> them. I wouldn't even call it "broken" because they are not yet released and
>>>>>> it is common to have bug in early revision.
>>>>>>
>>>>>>> Do we have any example in Xen for supporting broken HW,
>>>>>>> whose vendor is not aware of the issue or did not release any errata?
>>>>>> I will not cite any HW on the ML. But from my experience, the vendors are not
>>>>>> very vocal about issues in public (some don't even seem to have public doc).
>>>>>> The best way to find the issues is to look at Linux commit.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>> Also, as part of the certification/FUSA process, there should be no
>>>>>>>>> deadcode and we should have explanation for every block of code.
>>>>>>>>
>>>>>>>> See above. What are you trying to cover by deadcode? Would protecting
>>>>>>>> code with IS_ENABLED() (or #ifdef) ok?
>>>>>>> I think this would be ok from the certification point of view (this would at
>>>>>>> least means, that we are aware of the issue
>>>>>>> and we took some steps). Otherwise, such code is just an example of a
>>>>>>> deadcode/unreachable code.
>>>>>>
>>>>>> Thanks for the clarification. So the exact approach will depend on the
>>>>>> context....
>>>>>>
>>>>>>>>> There are different ways to deal with a deadcode: > 1. Get rid of it
>>>>>>>>> completely
>>>>>>>>> 2. Leave it as it is
>>>>>>
>>>>>> ... this is my preference in the context of the timer.
>>>>>
>>>>> From a certification point of view, the fewer lines of code the better,
>>>>> and ideally all the lines of code used for the certified build should be
>>>>> testable and used.
>>>>>
>>>>> So I think 2. is the lest useful option from a certification
>>>>> perspective. For this reason, I'd prefer another alternative.
>>>>>
>>>>>
>>>>>> If the other don't like it, then 1 would be my preference.
>>>>>>
>>>>>> In general, my preference would be either 3.3 or 3.2 (see below).
>>>>>
>>>>> I also think that 3.2 and 3.3 are good options for the general case. For
>>>>> the timer, I can see why 1 is your (second) preference and I am fine
>>>>> with 1 as well.
>>>> Ok, sounds good to me. Let's still give Bertrand the chance to share his opinion.
>>>
>>> We need to get rid of dead code and removing it is not always the best solution.
>>>
>>> If the code is or could be useful for someone some day, protecting it with ifdef is ok.
>>>
>>> In the mid term we will have to introduce a lot more ifdef or IS_ENABLED in the
>>> code so that we can compile out what we do not need and code not applying to
>>> some hardware is a case where we will do that (does not mean that by default
>>> we will not compile it in but we will make it easier to reduce the code size for a
>>> specific use case).
>>>
>>> So 3.2 and 3.3 are ok for me.
>>
>> So we all agree that the code in the current form is a no go from certification purposes.
>> That is good :)
>>
>> The reason why I opt for solution 1 and not the others is that in the latter case it would
>> mean introducing the Kconfig option to allow user to select the timer to be used by Xen.
>> This is not really correct. Also in the current form, it would also require adding more
>> code to time.c code because at the moment using CNTP for Xen would not work out of the box.
>> The architecture defines the hypervisor timer for a purpose. If it does not work, it means
>> that the HW is problematic. I agree that we would want to support such use case but I'm not
>> really aware of any issue like that. Adding more code and Kconfig options just because
>> one day someone may face issues with a new HW is something I am not a fan of.
> 
> I see 2 solutions here:
> - somehow push the code to a different file (not quite sure this is feasible here)
> - remove completely the code with a clean commit. Doing this it will be easy for someone needing this to later revert the patch
> 
> It is definitely true here that adding more code to keep some unused code does not really make sense.
> And let’s be realistic here, if we need that one day, it will not take ages to support it somehow.
> 
> As said, from a pure certification point of view:
> - we must not have deadcode
> - proper ifdef is acceptable
> - if 0 is not acceptable
> - commented code is not acceptable

Given that we agree on that (+ IS_ENABLED option if possible), and the option 1 seems
to be the best choice for the timer, I will create a patch removing the IRQ path to get rid
of the deadcode/unreachable code.

Do you think this is something we want for 4.17?
The risk is low as the code is already dead and the benefit is that we have no deadcode.
What do you think?

~Michal

