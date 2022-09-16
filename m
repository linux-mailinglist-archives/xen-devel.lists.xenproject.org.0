Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE35BAB5A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 12:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407922.650601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8j1-0004Ll-Ga; Fri, 16 Sep 2022 10:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407922.650601; Fri, 16 Sep 2022 10:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8j1-0004Ir-Co; Fri, 16 Sep 2022 10:37:35 +0000
Received: by outflank-mailman (input) for mailman id 407922;
 Fri, 16 Sep 2022 10:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnJL=ZT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oZ8j0-0004Il-Gz
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 10:37:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ff8212-35ab-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 12:37:32 +0200 (CEST)
Received: from DM6PR11CA0011.namprd11.prod.outlook.com (2603:10b6:5:190::24)
 by CH0PR12MB5204.namprd12.prod.outlook.com (2603:10b6:610:bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 10:37:29 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::b8) by DM6PR11CA0011.outlook.office365.com
 (2603:10b6:5:190::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16 via Frontend
 Transport; Fri, 16 Sep 2022 10:37:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 10:37:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 16 Sep
 2022 05:37:28 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 16 Sep 2022 05:37:27 -0500
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
X-Inumbo-ID: 91ff8212-35ab-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1vHxPahjtp63rS1ff8LaHx7SpcUqYzyA/aRAQzBlKcuUoHZgyYFyw04kcyRZM+O3Ukd8H5kYnrdqe/P2/ab4ZPhUtqcsKqSsRefaRKqse3UFxshSbTVtFbQczN/lsYKUjzCFN9rlMp70D3hPJ7Dk7GUPoxnL4Paf8KMF4bcv+1+Z5KzA2bUVc/qPhPQn1OmDyagVl+YhQIzGHgbAL3uBaMcsfI6cp7u8FFB+r2lzIRRXy64lcKMIiAGzd36mbV9QkupamMmOJJaKsSCP2i1iwC8wbvHWVIyxyzvwrPj0eTOKcyDEITxieH4xfA7XINObvjDBkNKDaBk9I7vII32HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etlaIZU/TW7+DS5pldYih6Ha+WXvrKAbjoFO2tu3zh0=;
 b=D6k3VxDePgxVyVY0KdG09gZNyKfEwo8gEoHty3jY8kP8wX4ZdBZdfgX/jeiKf0e9sBJrqyh5vlU/YXez/vQFDvw9yH9zf0ViwCscsN5NE2VjAqDOnqlXe+uo5mTOjLoASiV1UhIsVjZgUZjVc1DYCDD/TXL8Tmkmx0q2uUL3LlWwwbsx75BmbPGFlBDQpKH+nbhak02IgN5+JDJMBc/yiU22e5ZUwVZcVgritrvyQ6iiGMYvS4ugpZL7Rm6REbYE9AdB3VMMNgonX0m5h2zTJ53lRS7I43aZ1cO0QbQXgczCwHc+bSECvXydNHdVEmwT72gHsZVm2X4Dth7kop1T8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etlaIZU/TW7+DS5pldYih6Ha+WXvrKAbjoFO2tu3zh0=;
 b=OcicySyfe/lZ0o6zjUIZWSxN9TbbZGoVcZKG+bPZUCuyinqZ5C092xypY0obyDuT+5JiMCzTtIGCRdew+LiZtH5hLivIqICG9gDokmHT7AnVoC67j1zk56wnpZMIh9di+WI1kE/w1E1lJBDxg//jig0GT1LYfq1xkrbXgSpcXwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f55df88f-652e-4d12-5fb2-af607e85bc8b@amd.com>
Date: Fri, 16 Sep 2022 12:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [for-4.17] xen/arm: domain_build: Do not use dprintk
 unconditionally
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220916071920.8287-1-michal.orzel@amd.com>
 <4f4e254a-6b54-cdf7-40bc-89c25172bebf@xen.org>
 <f6588270-5cfa-7a46-f857-1fb78dfdffea@amd.com>
 <4eb0dbc8-ae37-5299-6aea-74a483668b99@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4eb0dbc8-ae37-5299-6aea-74a483668b99@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|CH0PR12MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: bdea660f-6276-4bb0-c400-08da97cf7485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wwm2rf/Hn7DjkKaMtjfz0c5MhgkgYIb09RkGM8fRv5sbf+imJV/rAqr+EQXPUNPZPVSNuKR3Bd86s9xg2ZCw/lrACmUFjz/9insUZklhzLfJ8T71g3/fKajqQxuQ2DjBQRBxvzCn6eMbOuAgAHcS1IJRH8A/Nt16RqMsdb3uG1P0Yekx641KPjTEzLBEVpCVX/EOfZVahZLCEf9HxzEhbMA/IrPHbFj7ttg9Z3Oqp065Z8ID06CUySWcCWGIBJ0lOYyqYnYq2ipcW53RgjGfcMRgc/N/ifeGT+VlKQYG47DCuMjidB3LckjIkhfsYb2djkhdd7N2eauwqsW7+3g3e1h/jFiBnSlvQ71RYMzsebrpvR8yl9RmmGTqNhF8q8lgNo3tx7zAb3jitHIySBy0ph//KZGGBasKkPrXCq7q868qU8STsHhf6sos+Db11JPZbewkyULcHtlZvEuHHqVijLLgshRnZqtSX6K7MxIPbXnAAtT/p1y8xDbGkCxwU1o7wSKoy/05nEVbw5HHev4PX4lSJnYWDoe9YeRxGgpJMHn33g49WSPmHlyImo4ArtsQhTamjA/8UcEhKJ70zyFR0CtznuC75OjRMda+ntzclooePhu3sI1aY6AAWNNJVQyZXKxrm0acKRe6DvXgcIlfc1tVOMjAuzTbnWxLM7lN0hr8UtgoPJsfwIjMNzDB4q5jtlixeJIFl2XquPDu2YaTXHexh4NFSCPxfhOMYULtLRgfzpqE4ZZJa0sW78cJ2fqgmT4C5zpJi94ZIqbPaYtuyksM7d1PJs9Sh2pj8GBbxhWbmAz3V6qDaSr0dcwL40WI0zqdawmlAo8i43OT/5EGIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(2616005)(31696002)(36756003)(40480700001)(82310400005)(31686004)(40460700003)(54906003)(110136005)(356005)(16576012)(81166007)(316002)(53546011)(82740400003)(478600001)(8676002)(70206006)(26005)(4326008)(8936002)(70586007)(41300700001)(36860700001)(5660300002)(186003)(2906002)(336012)(426003)(47076005)(83380400001)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 10:37:29.4200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdea660f-6276-4bb0-c400-08da97cf7485
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5204



On 16/09/2022 12:03, Julien Grall wrote:
> 
> 
> On 16/09/2022 09:32, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 16/09/2022 10:08, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 16/09/2022 08:19, Michal Orzel wrote:
>>>> Using dprintk results in printing additionally file name and line
>>>> number. This is something we do not want when printing regular
>>>> information unconditionally as it looks like as if there was some issue.
>>> I am OK if you want to switch to a printk() but I disagree with this
>>> argument. dprintk() is not about error, it is about anything that
>>> doesn't matter in release build.
>>
>> In the vast majority of cases, dprintk is used conditionally. That is why
>> in the debug build you cannot spot a single line of log starting with
>> a file name + line number.
>> That is why I assume this behaviorto be abnormal
>> compared to all the other logs.
>>
>> If someone adds a printk starting with e.g. "$$$" this is also not a bad
>> usage of printk but would result in an inconsistent behavior.
> Every lines are different, so it is not clear what you mean by
> inconsistent here. For instance, we have quite a few lines starting with
> the subsystem (your $$$) but not all of them. Would that be inconsistent
> to you?
No, it would not. The consistency I refer to is that during the "normal" build
(by normal I mean without any warning/error conditions), we cannot spot a single
line in the logfile that starts with a file name and line number. Something like
this immediately catches at least my attention as such format is really meant
for either errors or debug prints (the reason why most of the dprintks are
used conditionally is because we do not have an alternative as I mentioned before).
There is no reason why someone would want to see the file/line of such informative message.

Printing filename and line number is not the same as printing subsystem name.
There must be a good reason for choosing the former. It shall either be used
during the error condition or with loglvl debug. Certainly not with XENLOG_INFO.

Anyway, if I'm the only one who does not get used to seeing such messages prepended
with file/line, then let's not spend too much time discussing what is the consistency
because it is clearly a matter of taste :)

> 
>>
>>>
>>> I don't think we should just switch to printk() because dprintk() add
>>> the line/file. There are message we don't necessarily want to have in
>>> release build. So dprintk(XENLOG_INFO, ...) would be right for them.
>>
>> I think this is a matter of being consistent.
> 
> You can't really argue about consistency without explaining what is a
> consistent line.
> 
> As I wrote above, a message is mostly a free form. Some may use 'rc=%d'
> other 'error %d'...
> 
> Yes it would be good if all the errors are printed the same way.
> However, this needs to be a tree-wide decision rather than localized and
> something really not worth the argument.
> 
>>> Personally, I find them useful as there no grep required and/or
>>> confusion (but that's a matter of taste). If it were me, I would add the
>>> line/file everywhere. But I understand this takes space in the binary
>>> (hence why this is not present in release build).
>>>
>>> A better argument to switch to printk() is this information is useful to
>>> the user even outside of the debug build.
>>>
>>>>
>>>> Fix this by switching to printk because this information may also be
>>>> helpful on the release builds (it would still require setting loglvl to
>>>> "info" or lower level).
>>>
>>> I think we should drop XENLOG_INFO to be consistent with the other
>>> printk() in domain_build.c (after all this is a domain information like
>>> the other) or use XENLOG_INFO everywhere.
>>>
>>> My preference will be the former because otherwise most of the
>>> information will not printed in release build by default.
>>>
>>>>
>>>> Fixes: 5597f32f409c ("xen/arm: assign static shared memory to the default owner dom_io")
>>>
>>> Fixes should only be used for bugs. This is not one.
>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Rationale for taking this patch for 4.17:
>>>> Current code results in an abnormal behavior [1] and was introduced by
>>>
>>> It is not abnormal (see above). This is an expected behavior when you
>>> use dprintk().
>>
>> I did not mean abnormal behavior of dprintk but abnormal behavior of logging
>> even on debug builds. As I said before, I could not spot any message like this
>> booting Xen at all. This is why I took this as a reference for "normal" behavior.
> 
> To me "abnormal" is quite a strong word and in this situation really a
> matter of taste.
> 
> Anyway, there are way to write the commit message in a more objective
> way. Some like:
> 
> xen/arm: domain_build: Always print the static memory region
> 
> At the moment, the static memory region are only printed during debug
> build. The information could be helpful for the end user (which may not
> be the same as the person building the package). So switch to printk().
> 
> Cheers,
> 
> --
> Julien Grall

