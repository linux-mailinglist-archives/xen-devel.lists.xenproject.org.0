Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC07FD049
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 09:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643714.1004142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FWt-0004cJ-JG; Wed, 29 Nov 2023 08:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643714.1004142; Wed, 29 Nov 2023 08:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FWt-0004Zq-F7; Wed, 29 Nov 2023 08:02:43 +0000
Received: by outflank-mailman (input) for mailman id 643714;
 Wed, 29 Nov 2023 08:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rgXt=HK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8FWr-0004Zj-TE
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 08:02:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa59f0a8-8e8d-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 09:02:40 +0100 (CET)
Received: from CY5PR15CA0154.namprd15.prod.outlook.com (2603:10b6:930:67::21)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 08:02:34 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:67:cafe::2f) by CY5PR15CA0154.outlook.office365.com
 (2603:10b6:930:67::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Wed, 29 Nov 2023 08:02:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 08:02:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 02:02:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 02:02:33 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 02:02:31 -0600
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
X-Inumbo-ID: aa59f0a8-8e8d-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq4UG+gtqmsCzAE+eecQYKJ3LgFaHILfwvjY51rQnd1pqCz+Tv6MVqM2qo34bc6O7aGOQF+uHIBvYjqcka687Fy5id8+IY2xxPpeuRh5F1CJJG61sZiwl5wmJsRBCVmjLntO+ViHFu1UsXgIDEHZ7LfGUDK8cojnDJZjCQOpwtQUr4LSvXYk6APc7RMfxscfJ2E4+3A22h+mi1kOBNwoHohMf+QAwBPKR6RG0u1EVf85hlkOAjKxCJEmgVwJZJSzcBcPaUUy/MgFvjhckaNFDqlO3NZ1hAYps5T0HkMw8EzFe1xr/kGj5BMwsUYGAV/WA6FeABFb0QS6kj+eDwhriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqlISauFHbWDgZYfnS2CyYO7sVt/C7GU0rb5e+qOkps=;
 b=QBLoLXCrwDSkiskm1CDRlDIhCifmShdhA4XCSDCE8ZxMBizEOxB2xczeg53cgMxpojkDmFurOriXjRz59l8whRLPIFaTqjY7VCGjCAfVB5Pg0hsnk7mgGl5AizrfXmiNmt+S+uazbAhsSeUPlYF8z05CyCSw1KaVOGDOzGwzm/FuK/l+iJ4okPiFzOzuK5WGKaZMnRdwgT/jT9q3Vvyn78mL2FO8qWUw8uhb8i+2mAuR9brUf9FGgWmQWizGKCoBowe7gViZIrC2nkYwsqgxnYcOAk0oAB0znWbNPqZYLfuDyfeoVq9BFmrXnkhDe9dabT7+B/asXdyfAYlTg6G5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqlISauFHbWDgZYfnS2CyYO7sVt/C7GU0rb5e+qOkps=;
 b=GP8oQjEP0upyOMqcuL68/fjDoWvawVBdd1R7Vo9uK1giSVPeCYi0N6wNAs0SBPH0P3exyPEg2/6Bb1wip+cNlLhRfld+2d4pXKzfkuFRQdtxUv+XCFqU7rBwXdVoLk1lgw7KQCy+EzmmIX8+QJCRRIfbp/GU5vizBxzEVPFM948=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ce98090d-d81f-4a02-8ad1-9fa5ba647409@amd.com>
Date: Wed, 29 Nov 2023 09:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
 <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
 <b0127019-4976-42e3-bde1-643cc56f18b0@xen.org>
 <16b73400-b592-4a1a-9b87-8c49aad9208d@amd.com>
 <9d1e385e-152e-404a-8d8b-47c5ac08d76a@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9d1e385e-152e-404a-8d8b-47c5ac08d76a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CH2PR12MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbddae1-a562-4517-449b-08dbf0b18b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xpJKuKpCdaP4eNDQ/+sUqnvc/Sx9Hpc+6EL2hidHANgFW1QI08UjlWDE/tcyzTGjhjQNPcnb3mWdPNdnzxULmllWCv550PK7gZu5dCIq+X5fTCGHa7P3IZG5vGM9BjTkoZ1WVEdNY5C/ejlJ2p63v709I6dZVV1ur2/aeIFLSJ49MTKbZnutH9ZA04XV0o/KHlrfnw/mqekTZfN54KOOLhFeu7WmzZb1Mkh8UIQpdw1A2yK9PeHvT13fNsPE6fBhZg1xmJ4Z27FCAyiB0u9YZx2OmKC0KaM7xKLY/nVMuRPYoLbpwZBSVVdfD3Pe1Noky76JqOV9KYn80rmf9GCMi3iXTSsoMzaEPFLPeF7sMd5VOCzGSqIX+QMuoQhu7b4SY0I3UQBZUsg9DDbTitQ1QHF9lTJ94iBq06kHW++76egCl1IEJT2ir9Ee6Or9eoqQ6z2WLssJLOrSaaTTvwFufdGgq0zasLHd6tJ461FQIbZfqpnRKuscGIyQDeYCB0jMQyBy9Tsb2CyeFCanjHNtc4Fv6ObAxTy3U1Lr/O2id01zSpxHdp/GkjzNBYY/+0MeNf8+ASN1dm0+mFYtseGSD84HMiNNoa0GQDkCPlJpqV0uOTu+SCVMfnf+UGRbk5aWk+4h7AG6u6P4ubgpMGPud58ddgBAdNI21cjMu4cVGNYIQlHHnHqkJ2BCzJYxDSdkIy4C6q3IH4o6ZTTX7x3VdRTJcuY08UdSBKjzgcG19m4k8xsUkZ7ezxgklHStO/YGKu55lwiKYAqkPHJLbo9QDaQb/SbAHRNdDnJ+CLvMQ6ZV/FPHDcbc2bsQp/Ux8aj8dxrjBgrkee+vqbVAZEQqN8KgsJPbEbZ9ve5s1dZN2hk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(36840700001)(46966006)(40470700004)(4326008)(44832011)(2906002)(41300700001)(36860700001)(8676002)(8936002)(31686004)(70586007)(316002)(110136005)(70206006)(54906003)(5660300002)(26005)(426003)(336012)(2616005)(53546011)(83380400001)(40480700001)(47076005)(16576012)(356005)(81166007)(31696002)(86362001)(82740400003)(478600001)(40460700003)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 08:02:34.1428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbddae1-a562-4517-449b-08dbf0b18b73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889

Hi Julien,

On 28/11/2023 18:52, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 28/11/2023 18:15, Michal Orzel wrote:
>>
>>
>> On 28/11/2023 18:09, Julien Grall wrote:
>>>
>>>
>>> On 28/11/2023 18:00, Michal Orzel wrote:
>>>> Hi Julien,
>>>>
>>>> On 28/11/2023 17:14, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> On 27/11/2023 15:41, Michal Orzel wrote:
>>>>>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>>>>>> attention to undefined behavior issues, notably during CI test runs, is
>>>>>> essential. When enabled, this option causes Xen to panic upon detecting
>>>>>> UBSAN failure (as the last step in ubsan_epilogue()).
>>>>>
>>>>> I have mixed opinions on this patch. This would be a good one if we had
>>>>> a Xen mostly free from UBSAN behavior. But this is not the case at least
>>>>> on arm32. So we would end up to stop at the first error. IOW, we would
>>>>> need to fix the first error before we can see the next one.
>>>> Well, this patch introduces a config option disabled by default.
>>>
>>> I understood this is disabled by default... I am pointing out that I am
>>> not convinced about the usefulness until we are at the stage where Xen
>>> is normally not reporting any USBAN error.
>>>
>>>> If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
>>>> of handling such issues is to do the investigation locally.
>>>
>>> This will not always be possible. One example is when you are only able
>>> to reproduce some of the USBAN errors on a specific HW.
>>>
>>>> Then, you are not forced
>>>> to select this option and you can see all the UBSAN issues if you want.
>>>
>>> See above, I got that point. I am mostly concerned about the implication
>>> in the CI right now.
>>>
>>>>
>>>>>
>>>>> So I feel it would be best if the gitlab CI jobs actually check for
>>>>> USBAN in the logs and fail if there are any. With that, we can get the
>>>>> full list of UBSAN issues on each job.
>>>> Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.
>>>>
>>>> *my plan was to first fix the UBSAN issues and then enable this option for CI.
>>>
>>> That would have been useful to describe your goal after "---". With that
>>> in mind, then I suggest to revisit this patch once all the UBSAN issues
>>> in a normal build are fixed.
>> But this patch does not enable this option for CI automatically, right?
> 
> Correct.
> 
>> Why are you so keen to push it back?
> 
> I have been pushing back because your commit message refers to the CI
> specifically and today this would not really work (read as I would not
> be happy if this option is enabled in the CI right now at least on arm32).
I mentioned CI as a noteworthy example. In no case, I wrote that this implies the immediate
enabling of this option for all the arches in CI. Especially, given that I'm aware of arm32 issues
as you might know.

> 
> If you want to fail a CI job for UBSAN today, then we need to find a
> different approach so we can get the full list of UBSAN error rather
> than fixing one, retry and then next one.
> 
>> Is it because you see no point in this option other than for the upstream CI loop?
> 
> Even in the upstream CI loop, I am a little unsure about this approach.
> At least, I feel I would want to see all the reports at once in the CI.
> 
> But this is not really a strong feeling.
> 
>> I find it useful on a day-to-day
>> Xen runs, and I would for sure enable it by default in my config not to miss UBSAN failures.
> 
> Fair enough. I view USBAN issues the same a WARN_ON. They all need to be
> investigated. So now you have an inconsistent policy.
> 
> Are you are also intending to switch WARN_ON() to fatal? If not, then
> why would UBSAN warnings more important that the other warnings?
WARN_ON() is placed by the developer to detect e.g. incorrect configuration. The fact that someone
decided to use WARN_ON and not BUG_ON means that this person did some investigation the result of
which suggests no critical consequence. For UBSAN, you can't always be sure (read undefined).
It might be at the same level as WARN_ON but can also result in unpredictable behavior leading to security issues.

That said, I do believe that we should also have option to panic on WARN().
As for this patch, Andrew provided Rb and Stefano is happy with it. Do you want more people to vote?

~Michal

