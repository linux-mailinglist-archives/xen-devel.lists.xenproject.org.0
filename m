Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C017729673
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545827.852439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z6c-0000eP-Dn; Fri, 09 Jun 2023 10:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545827.852439; Fri, 09 Jun 2023 10:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z6c-0000ar-AD; Fri, 09 Jun 2023 10:12:30 +0000
Received: by outflank-mailman (input) for mailman id 545827;
 Fri, 09 Jun 2023 10:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0cG=B5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q7Z6a-0000aA-MO
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:12:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 213c7b5b-06ae-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 12:12:25 +0200 (CEST)
Received: from SA0PR11CA0038.namprd11.prod.outlook.com (2603:10b6:806:d0::13)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 10:12:22 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::74) by SA0PR11CA0038.outlook.office365.com
 (2603:10b6:806:d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.26 via Frontend
 Transport; Fri, 9 Jun 2023 10:12:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Fri, 9 Jun 2023 10:12:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 05:12:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 05:12:20 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 9 Jun 2023 05:12:19 -0500
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
X-Inumbo-ID: 213c7b5b-06ae-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGwUpvVcvQBvl/O+Qgm0Ju0defp3B4/rADO4cCIPclq2jrWuSZ29eRp65KgrNOqPC+xkpdyCiAyTbDrcszaklYTSxdM5AkuvNBZOUD7bLy8tYJ6aqHqgtjJSBmXtA3LsZstdTm4xHrJzcl1gQROUfYJcyCerigwGGtZUKQAYZ7iWGTc6mi6icJguZ8B76CPOJubCOpY1o4gdqyWVQFOwo3+3q33QxcI0pK5fF2qMkfgI6zeKBBn5sOY8VL79jPe4EemAuSF41y6Fd1p4P1BKw52qDSMzJ6qv7aJZ3VOiER8a5tU8cJDhKHM4W5+GcwKU5/VBHqxpXleEuqnrVHKSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYwscvVKSm378Zqb4KQqIVqGUwWHCkp1VBCCXv4bPGE=;
 b=c+FEGfJk7itqh5mf5NQtVq25eTKLXJf8yElqvPQwjlWGveAPrWIpRCljnEOvCtnzNX7gwhfAl9sEzBdadYrGs2JRwToDdyq+fE9/FRy4Uy2e4Cj10fcTcd/cbnhMpuCjPma7Ymfrl98CfzSLvliSgNH1v6NGc7HcFklxgwf//gQsxNfUAQnv+ss/QJbTe/3kPYaXnyc/CQ7slhzHreeoHcl3okaHvsTDkFn0MRjCGlNyOnwmqSelOXk7boUMcN7dTOrGywlRYM3xE+aBztOMtLr2TjtVcSNZu5nJ/diPzAdtPCflmk9JlULg7UeTHP3/587mN6ldSklZioO6WqAK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYwscvVKSm378Zqb4KQqIVqGUwWHCkp1VBCCXv4bPGE=;
 b=F9OPl2zUEBdyyWxFJI+BdBBuYNJEgMgm8Zit/J6D2XICsjHiv9sMaiuan30zxNPtHRqu69uc4dw8/3N89XovsUS1iEWgvIcc1kXFy7NhS+04I3iCTNseQZSWpYxEDTEilKJE/35DJ2PgP3GFy6JhLgAY6EwZuea8k0vxvqgdpfo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <95de848c-8bcb-c16c-b196-d979f1ce0db2@amd.com>
Date: Fri, 9 Jun 2023 12:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Roberto Bagnara
	<bagnara@cs.unipr.it>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
 <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
 <8efd91fd-bb36-9073-654f-fef32d0da443@amd.com>
 <13d13f3a-26b7-ea99-8ba3-f868cee1e3ac@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <13d13f3a-26b7-ea99-8ba3-f868cee1e3ac@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: cc175d60-b372-4c39-6dff-08db68d2038f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u40rBlVMZv2YCSwqU+lR3webGlnVNtzXvheq+cc+TEEPhJ5s6mE8bkO/5qgNmbAF0GjqvKF+sOC0yFBL09SdDpt5NM6RsiVkms6XPURO8qjDtg2fkaouNxJyVtV4Eht+wK9Wys6Iceuiw805qA16JF/557FiBplfLXNNARo7DErYGuQUE635phvqiFIp7YC3Ego8m9NmXPAPbOryce8+vsrFyWv3FC+ugOOKUcch0clckMFse0W/prQfPjzbuC6dbJEq3P5LO9BO1AHzCDTW6QEjTc9ePS9hybUrYLEbSHfwRTMfrLsOoZD6zxcHeMSjsud75WU+qdxhfioI/BRVwRFEycZlwNZau7XxHKKZBwrC5sSJfQXIjN4ha0kv9vmcgaLLOrRubaclk8Zs1AL21yAauE9wDbBXPLiMCOuSu+CCTZL3OVCr6oCeUQc+EsMmR+x/T/XxIlR5wMEVoOlqTfgaPSfOiO5gFachnHcHgwmyZ/MZ7xY6IB0oykLmagj87v9zO/yipYohDfqoFT9udwi2IyxrPuHQAlH6XcfFPE8RxfuXnURwrdbqckvFwZ1B7p8bgLxf2l1Gce6kWhqrGyAQ7V8i7OfQKierN9fSTJRzMSxwP9EyP8wsoxBWtD7o9lZZhaOqVooIEkGs8wJWX5cr9V7Ab0oNRctLvW/D1G3fu45b5YDkS5OY11QQ51tprD1PKp3Kd5Kf//AJz+cuCfHz6b9n58F4f2UxMa8EZdP4C0hHe6xBSgJN3XVqHbQZgotxHx5Q4sSRL5LKeH7EHfH8mic6fOdAz4B6fv0uwA8pGVRFfeEIbOvPdpqlVcuS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(70586007)(81166007)(2906002)(82740400003)(356005)(70206006)(16576012)(54906003)(44832011)(8676002)(5660300002)(36756003)(86362001)(8936002)(31696002)(6916009)(4326008)(316002)(40480700001)(478600001)(41300700001)(40460700003)(336012)(2616005)(82310400005)(26005)(53546011)(186003)(426003)(31686004)(36860700001)(83380400001)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:12:21.4428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc175d60-b372-4c39-6dff-08db68d2038f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717



On 09/06/2023 11:47, Jan Beulich wrote:
> 
> 
> On 09.06.2023 11:36, Michal Orzel wrote:
>> On 09/06/2023 10:54, Jan Beulich wrote:
>>> On 08.06.2023 14:18, Roberto Bagnara wrote:
>>>> On 07/06/23 09:39, Jan Beulich wrote:
>>>>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>>>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>>>>>>> U6) Empty declarations.
>>>>>>
>>>>>> Examples:
>>>>>>
>>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>>
>>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>
>>>>> Looks like these could be taken care of by finally purging our
>>>>> EXPORT_SYMBOL() stub.
>>>>>
>>>>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>>
>>>>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>
>>>>> I'm having trouble spotting anything suspicious there.
>>>>
>>>> The macro expands to definitions of inline functions
>>>> and after the macro invocation there is a ";".
>>>>
>>>> The preprocessed code is then:
>>>>
>>>> static inline void foo() { ... }
>>>> ;
>>>>
>>>> where the final ";" is an empty declaration not allowed by
>>>> the C99 language standard.
>>>
>>> Oh, I see.
>>>
>>>> Removing the ";" after the macro invocation is a possible solution,
>>>> but other possibilities exist if this is strongly unwanted.
>>>
>>> We have other macros to instantiate functions, and there no stray
>>> semicolons are used. I think this wants doing the same way here, but it
>>> being Arm code the ultimate say is with the Arm maintainers.
>> Apart from vreg.h the same applies to TLB_HELPER of arm32/arm64.
>> I think also TYPE_SAFE would want to be fixed.
> 
> Indeed. For this last one I wonder though whether it wouldn't be better
> to continue to permit (really: require) the semicolon at the use sites,
> by putting the typedef-s last and omitting the semicolon in the macro
> definitions.
This would be an error I think since the functions are defined using this type
so it must be defined first. Unless there is a way to forward typedef. All in all,
removing semicolon at use sites is simpler.

~Michal

