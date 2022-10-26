Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1560E505
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 17:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430662.682597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onijJ-0003vW-7Z; Wed, 26 Oct 2022 15:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430662.682597; Wed, 26 Oct 2022 15:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onijJ-0003t4-3B; Wed, 26 Oct 2022 15:54:09 +0000
Received: by outflank-mailman (input) for mailman id 430662;
 Wed, 26 Oct 2022 15:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azgP=23=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onijH-0003sy-Mo
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 15:54:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ab57c6b-5546-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 17:54:05 +0200 (CEST)
Received: from DM6PR11CA0041.namprd11.prod.outlook.com (2603:10b6:5:14c::18)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 26 Oct
 2022 15:54:02 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::80) by DM6PR11CA0041.outlook.office365.com
 (2603:10b6:5:14c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 15:54:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 26 Oct 2022 15:53:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:53:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 10:53:59 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 26 Oct 2022 10:53:57 -0500
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
X-Inumbo-ID: 6ab57c6b-5546-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxsNmqs0oQp+fMc8kNKp5TTE4XQTMwRDLyy8I17RFhJkIT/qrWs+u5guAQuQm1F2apDGonVdxxFhvekxhC7BOfsi02Qf/RGVWLmlclEU8TRYU4JXARMS3UwzR9TF/LTh+UyBTSzFO4qfmtU6/HNOyGZ69HUsTmaemgJsjYUagjcAuQOeLxGbfnZG3j5zSorbb1YP4G7SfqvvL2DD2OGZ2CNxvPPmCrhgScqUC/oDaivUBhzvAyKP+qjXOfpStyFkaSPxREPQbVooyJS1NUEV+icDcs2H++imQcvFyx/4NrxCpu0nHWxgo56oDNFM1EJaTFI4ETwoECpE5gDgBn8x5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NgGw8kcVoF76m1tdml6dJWDBvTDF9iqcMaH2NwS+fk=;
 b=oHfuO8n247BVDG4t2/w39sY8bWtx+F2jprSpkGFSIg21X1ICnVpqOrMJmuymrSPV4OS1Pqt/WtLIy3LMLr9OS4KefTxvl4cxq29r1974XlcsDaDFFzQqAo4N31IBINui1qdDP6/FQ4tj2R3jTxls7RPMGkTUSDIMV26WP17aTgYv7eSn9cG6FHHgnBv6bFxZohLz/jexz7jXA7fLrbpbIFsdvmdVVU+FsRf1oOIftbFZo3L4gvQdFTVYjJiQ88fKwH5U7MyuBY69BjTJwS2GNsx09NbG+pVlRSVEakrkNzzKICG3tZpJal6BA3YZxkp3NfhdQhNpQbBTTrCrtcRSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NgGw8kcVoF76m1tdml6dJWDBvTDF9iqcMaH2NwS+fk=;
 b=MAKLA5Xl4/zRaLGtJYvrdXRVGst94gLRiopNpBYJ7IAmSCP4gtPKF3JW5rToDWSWx33fm7Eb84lD5pihTcJDfHT0w2aivczqc/J+zqq082tpyWpowEILHePs30zchHn0oOQHQodK24cZ6KYu1QVuAlYP9LQGUSGRs2nawVWApTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1f094419-32be-97fd-cae2-43cf1e868d62@amd.com>
Date: Wed, 26 Oct 2022 17:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Deadcode discussion based on Arm NS phys timer
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
 <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
 <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com>
 <7C838BB9-E8FA-4239-B851-B179CB6B7A02@arm.com>
 <a3306efe-16bb-feb0-91aa-d6a9b0e30691@amd.com>
 <54F41F27-8753-4BA5-98D5-23E649EBE339@arm.com>
 <alpine.DEB.2.22.394.2210260830170.1397955@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2210260830170.1397955@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT040:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e2cd60-811c-4b0e-335f-08dab76a4c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gFGkpOBMES/jZNZer32fKhGMEPAO5d9JcspHY9ZEsAyXJTI+oY+5GBw/F2EgEbCVwh7ORKjQtIpBvHjzdWz3CaaFn8K5+dEUVeGuE4wuA8jMhZy7hW8U7VCgmUNeFBlk0g0Lvu1w14sdb4EHir2Vl2QZNp59SfAftc/39lmf4b87tOCoxtsP4j/yRI/ZtrgH0uz+wZqB0d8oYsZPY5NdtxP6fgovFerTZE1vogyckblIeiQr6x6eVekijoMnBF0bxBb6j/s7wrnc99nc5AG+BqfPnT6OzDGVrXUvFjEi9DV/Umno2stDgVz9O6lQEquwVXZ73zepEuGlPn1ddKt54Y9WJJZTdKN36HRkX5YH54m95rd87jKhTdIOq4ChR3zWprsgvQup1hJbmsQi0GJWRegXtLesiX32UNgvuVy6V6Yop0qbqV8hNEA77mgW0fEtoDwNP0uu0UqGtWCerCnK2vRjKU3X83v/L4T6ymlU4L7dE3RMTxvqLPgc+sEAr8FBgnXtJxFrMSy2c5uegtlME9swP8DzvI05LJXPyTMl5XMuaTtJ8TKXFMwS4an8SE5p6Tpgc1c0gq69c9HpCCPe/idWgzPey8R5EMPLHrHoZUXGERhyxhL8rXVWTHqcUeGxVJiAey3fxgGwED7OdffQXO+7mFptW/4HptvmMc0ZnIdQGp8rIXUZ4W14cHSreuaDVZWJP4Gy72EY3rTNKCmBtsigpmfnXvLgpN0nvxs3AwoH8c2VIDZZOJp84vSCTXX8yUEjks88F3+BRJpYTaEuCK3zVpWm6sSflKL4Dhb0AMD9s3hL8HKUNYSDST2XNV1h8DhkPGTmzvZ2IQ0kud8YfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(81166007)(86362001)(82740400003)(2906002)(36756003)(66899015)(31696002)(44832011)(31686004)(356005)(70206006)(40480700001)(70586007)(5660300002)(53546011)(186003)(2616005)(36860700001)(47076005)(26005)(54906003)(426003)(16576012)(83380400001)(40460700003)(336012)(82310400005)(110136005)(478600001)(41300700001)(316002)(4326008)(8936002)(8676002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 15:53:59.9217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e2cd60-811c-4b0e-335f-08dab76a4c3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

Hi,

On 26/10/2022 17:30, Stefano Stabellini wrote:
> 
> 
> On Wed, 26 Oct 2022, Bertrand Marquis wrote:
>>> On 26 Oct 2022, at 12:29, Michal Orzel <michal.orzel@amd.com> wrote:
>>>
>>> Hi all,
>>>
>>> On 25/10/2022 10:20, Bertrand Marquis wrote:
>>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>>> On 25 Oct 2022, at 09:07, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>
>>>>> Hi Bertrand,
>>>>>
>>>>> On 25/10/2022 09:45, Bertrand Marquis wrote:
>>>>>>
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>>> On 25 Oct 2022, at 08:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 25/10/2022 03:29, Stefano Stabellini wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On Mon, 24 Oct 2022, Julien Grall wrote:
>>>>>>>>>> On 24/10/2022 12:51, Julien Grall wrote:
>>>>>>>>>>> Caution: This message originated from an External Source. Use proper
>>>>>>>>>>> caution when opening attachments, clicking links, or responding.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 24/10/2022 10:07, Michal Orzel wrote:
>>>>>>>>>>>> Hello,
>>>>>>>>>>>
>>>>>>>>>>> Hi Michal,
>>>>>>>>>>>
>>>>>>>>>>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefly
>>>>>>>>>>>> speaking, we are routing
>>>>>>>>>>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use
>>>>>>>>>>>> of it (as it uses the hypervisor timer CNTHP).
>>>>>>>>>>>> This timer is fully emulated, which means that there is nothing that can
>>>>>>>>>>>> trigger such IRQ. This code is
>>>>>>>>>>>> a left over from early days, where the CNTHP was buggy on some models
>>>>>>>>>>>> and we had to use the CNTP instead.
>>>>>>>>>>>>
>>>>>>>>>>>> As far as the problem itself is not really interesting, it raises a
>>>>>>>>>>>> question of what to do with a deadcode,
>>>>>>>>>>>> as there might be/are other deadcode places in Xen.
>>>>>>>>>>>
>>>>>>>>>>> There are multiple definition of deadcode. Depending on which one you
>>>>>>>>>>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So this
>>>>>>>>>>> would result to a lot of places impacted with the decision.
>>>>>>>>>>>
>>>>>>>>>>> So can you clarify what you mean by deadcode?
>>>>>>>>>> In the timer example, I think we have both a deadcode and unreachable code.
>>>>>>>>>> For the purpose of this discussion, let's take the MISRA definition of a
>>>>>>>>>> deadcode which is a "code that can be executed
>>>>>>>>>> but has no effect on the functional behavior of the program". This differs
>>>>>>>>>> from the unreachable code definition that is
>>>>>>>>>> a "code that cannot be executed". Setting up the IRQ for Xen is an example
>>>>>>>>>> of a deadcode. Code within IRQ handler is an unreachable code
>>>>>>>>>> (there is nothing that can trigger this IRQ).
>>>>>>>>>>
>>>>>>>>>> What I mean by deadcode happens to be the sum of the two cases above i.e.
>>>>>>>>>> the code that cannot be executed as well as the code that
>>>>>>>>>> does not impact the functionality of the program.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> One may say that it is useful to keep it, because one day,
>>>>>>>>>>>> someone might need it when dealing with yet another broken HW. Such
>>>>>>>>>>>> person would still need to modify the other
>>>>>>>>>>>> part of the code (e.g. reprogram_timer), but there would be less work
>>>>>>>>>>>> required overall. Personally, I'm not in favor of
>>>>>>>>>>>> such approach, because we should not really support possible scenarios
>>>>>>>>>>>> with broken HW (except for erratas listing known issues).
>>>>>>>>>>>
>>>>>>>>>>> The difference between "broken HW" and "HW with known errata" is a bit
>>>>>>>>>>> unclear to me. Can you clarify how you would make the difference here?
>>>>>>>>>>>
>>>>>>>>>>> In particular, at which point do you consider that the HW should not be
>>>>>>>>>>> supported by Xen?
>>>>>>>>>> I'm not saying that HW should not be supported. The difference for me
>>>>>>>>>> between broken HW and
>>>>>>>>>> HW with known errata is that for the former, the incorrect behavior is often
>>>>>>>>>> due to the early support stage,
>>>>>>>>>> using emulators/models instead of real HW, whereas for the latter, the HW is
>>>>>>>>>> already released and it happens to be that it is buggy
>>>>>>>>>> (the HW vendor is aware of the issue and released erratas).
>>>>>>>>>
>>>>>>>>> Thanks for the clarification. What I would call broken is anything that can't
>>>>>>>>> be fixed in software. For a not too fictional example, an HW where PCI devices
>>>>>>>>> are using the same stream ID. So effectively, passthrough can't be safely
>>>>>>>>> supported.
>>>>>>>>>
>>>>>>>>> Regarding, not yet released HW, I don't think Xen should have workaround for
>>>>>>>>> them. I wouldn't even call it "broken" because they are not yet released and
>>>>>>>>> it is common to have bug in early revision.
>>>>>>>>>
>>>>>>>>>> Do we have any example in Xen for supporting broken HW,
>>>>>>>>>> whose vendor is not aware of the issue or did not release any errata?
>>>>>>>>> I will not cite any HW on the ML. But from my experience, the vendors are not
>>>>>>>>> very vocal about issues in public (some don't even seem to have public doc).
>>>>>>>>> The best way to find the issues is to look at Linux commit.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Also, as part of the certification/FUSA process, there should be no
>>>>>>>>>>>> deadcode and we should have explanation for every block of code.
>>>>>>>>>>>
>>>>>>>>>>> See above. What are you trying to cover by deadcode? Would protecting
>>>>>>>>>>> code with IS_ENABLED() (or #ifdef) ok?
>>>>>>>>>> I think this would be ok from the certification point of view (this would at
>>>>>>>>>> least means, that we are aware of the issue
>>>>>>>>>> and we took some steps). Otherwise, such code is just an example of a
>>>>>>>>>> deadcode/unreachable code.
>>>>>>>>>
>>>>>>>>> Thanks for the clarification. So the exact approach will depend on the
>>>>>>>>> context....
>>>>>>>>>
>>>>>>>>>>>> There are different ways to deal with a deadcode: > 1. Get rid of it
>>>>>>>>>>>> completely
>>>>>>>>>>>> 2. Leave it as it is
>>>>>>>>>
>>>>>>>>> ... this is my preference in the context of the timer.
>>>>>>>>
>>>>>>>> From a certification point of view, the fewer lines of code the better,
>>>>>>>> and ideally all the lines of code used for the certified build should be
>>>>>>>> testable and used.
>>>>>>>>
>>>>>>>> So I think 2. is the lest useful option from a certification
>>>>>>>> perspective. For this reason, I'd prefer another alternative.
>>>>>>>>
>>>>>>>>
>>>>>>>>> If the other don't like it, then 1 would be my preference.
>>>>>>>>>
>>>>>>>>> In general, my preference would be either 3.3 or 3.2 (see below).
>>>>>>>>
>>>>>>>> I also think that 3.2 and 3.3 are good options for the general case. For
>>>>>>>> the timer, I can see why 1 is your (second) preference and I am fine
>>>>>>>> with 1 as well.
>>>>>>> Ok, sounds good to me. Let's still give Bertrand the chance to share his opinion.
>>>>>>
>>>>>> We need to get rid of dead code and removing it is not always the best solution.
>>>>>>
>>>>>> If the code is or could be useful for someone some day, protecting it with ifdef is ok.
>>>>>>
>>>>>> In the mid term we will have to introduce a lot more ifdef or IS_ENABLED in the
>>>>>> code so that we can compile out what we do not need and code not applying to
>>>>>> some hardware is a case where we will do that (does not mean that by default
>>>>>> we will not compile it in but we will make it easier to reduce the code size for a
>>>>>> specific use case).
>>>>>>
>>>>>> So 3.2 and 3.3 are ok for me.
>>>>>
>>>>> So we all agree that the code in the current form is a no go from certification purposes.
>>>>> That is good :)
>>>>>
>>>>> The reason why I opt for solution 1 and not the others is that in the latter case it would
>>>>> mean introducing the Kconfig option to allow user to select the timer to be used by Xen.
>>>>> This is not really correct. Also in the current form, it would also require adding more
>>>>> code to time.c code because at the moment using CNTP for Xen would not work out of the box.
>>>>> The architecture defines the hypervisor timer for a purpose. If it does not work, it means
>>>>> that the HW is problematic. I agree that we would want to support such use case but I'm not
>>>>> really aware of any issue like that. Adding more code and Kconfig options just because
>>>>> one day someone may face issues with a new HW is something I am not a fan of.
>>>>
>>>> I see 2 solutions here:
>>>> - somehow push the code to a different file (not quite sure this is feasible here)
>>>> - remove completely the code with a clean commit. Doing this it will be easy for someone needing this to later revert the patch
>>>>
>>>> It is definitely true here that adding more code to keep some unused code does not really make sense.
>>>> And let’s be realistic here, if we need that one day, it will not take ages to support it somehow.
>>>>
>>>> As said, from a pure certification point of view:
>>>> - we must not have deadcode
>>>> - proper ifdef is acceptable
>>>> - if 0 is not acceptable
>>>> - commented code is not acceptable
>>>
>>> Given that we agree on that (+ IS_ENABLED option if possible), and the option 1 seems
>>> to be the best choice for the timer, I will create a patch removing the IRQ path to get rid
>>> of the deadcode/unreachable code.
>>>
>>> Do you think this is something we want for 4.17?
>>> The risk is low as the code is already dead and the benefit is that we have no deadcode.
>>> What do you think?
>>>
>>
>> We are very near from the release so from my point of view as it is not solving a bug, this should not go into 4.17.
> 
> I agree
This works for me and thank you all for the discussion!
This thread and its outcome will certainly be useful for similar issues in the future.

~Michal

