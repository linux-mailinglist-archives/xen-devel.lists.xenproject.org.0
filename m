Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A12869797
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 15:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686214.1067967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reyLL-0002hs-Ju; Tue, 27 Feb 2024 14:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686214.1067967; Tue, 27 Feb 2024 14:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reyLL-0002fa-HD; Tue, 27 Feb 2024 14:22:03 +0000
Received: by outflank-mailman (input) for mailman id 686214;
 Tue, 27 Feb 2024 14:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fto1=KE=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1reyLK-0002fE-13
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 14:22:02 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fc78099-d57b-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 15:21:57 +0100 (CET)
Received: from BL1PR13CA0195.namprd13.prod.outlook.com (2603:10b6:208:2be::20)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 14:21:51 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::19) by BL1PR13CA0195.outlook.office365.com
 (2603:10b6:208:2be::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Tue, 27 Feb 2024 14:21:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 14:21:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 08:21:51 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 08:21:51 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 08:21:47 -0600
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
X-Inumbo-ID: 8fc78099-d57b-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlP+jSREOZJzhnUqe2YTwttopRWtFs+KAKPPMZoUSoaYVqRtRdGExR/FOfjAlmjkZMh7/qQ+5GCAbmjJGvd1BIldGzZaWkDraUuHz0XVv8zeBoE6A9evzYvvJCSibYFaXoyNXR8bfgww8kmpSKFgD3k2h1zsGVO/WSzoeh+2CJAUP3B1V8KPWBbaDAGVLD3l9iDdwo/Jekl/xvEgLB1oIzIn/DTzouiuLXi3z+rd7Z3uwJlftRcX8DQuEvpP9PWNl1YezUYpWOfXxcXvQmQycr6taKmPEo9jsNyVjVyCMgkDuuWcRj7bXqedc/AX68elPpWmAth6rFpGdhLa92lcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50gZi4HX0UroOWiE1CHbPHFkXdBR0q1Po8JppdrMdfo=;
 b=jL/STKQNEeO4313iUcvOkaT4gfTnuPvCoeEYEjn/4udOXlQLd2X2ukoPFMfxL2QaEIXCmbjlzr25RNpWC1fGjCl74h3OiVAfYnuyUBNpFojeWJmlVCXwBQepLksgbmEOADRI+e/ie02qn+Mv6rHkvKg6xX0PXG8Zc6J8kbFtduu9H7dCtMFk6pIHjqJ7RNuCpndhlcIHXL686GsBX0k8G1L3kwoTriJP1TU13flC5Jm7O0sXY5GJ4Uw53LnrytQ1MisPdGjrCU8hxZEAhjDs1Sh7Iwr3vYDD+XmL5EriZ1htoIIRusy7HvJ4pcahQCrTlnblMwX/piUtM7cLxoXtNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50gZi4HX0UroOWiE1CHbPHFkXdBR0q1Po8JppdrMdfo=;
 b=OC/hLt+Zt9Rfl4nzlwQIRcdGTMmgFqR5iJMxhUoVilIaKnHF/Hn6IyXAYRK2fuwNp/+B7VXHMrHgDOgRqmicdLzcjodFj0DAaLHYVdzUGqIGA/IhKk+pc9DpzbbZcx8rfms5/yec0lqw+Fw7mHY6WydKhy9sMqoXJfZM29GkwNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ab851734-0ad9-4eef-bcb3-dbe1aed08e2c@amd.com>
Date: Tue, 27 Feb 2024 22:21:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, <xen-devel@lists.xenproject.org>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
 <c3edf84d-3177-4125-bdd6-ba99190340a3@amd.com>
 <23dc102e-e827-4f1e-876d-76a7df4c4927@suse.com>
 <ca749e1e-569e-4d7d-8009-63a9469d3ffd@amd.com>
 <0acb5dc2-e665-4c8e-a10b-2c7664823bf7@suse.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <0acb5dc2-e665-4c8e-a10b-2c7664823bf7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 20dd8c0b-90a6-458a-36d4-08dc379f7111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yorn6CSUx2upAMPpbSvty9GXuEJ7/7t3csBPbv6NgYvZU+5py/6XYMq2wfn1GsFC9kUgNn/gyxLbl5IHH+16m5aE2Ux/UB0ObnKqb5ohnmQlA9ibOP606x8q4mEY7Cd8lUBS2Tpi05kjfHgdIAjo3jjuBTdJDlN5/7elcpOfEdPmUh0h9xQ/owfHAEQr3bdSCcRBqOwO6ARA53qSK5/hhNMOKZHQez2147UH4Nk8mOSBpNhWATQjCl3jZfHfR/q4Grup8Gat22/DMWDi6akEjJywcr+U9x2g57KGrZ6W0Z6lTOWf39VAqcdCzwc7mPySfxgIbuzR32DQcP2+aCGKj2uy6RIAEJuNS4b/qyiLQMI8zyE9g8MRUx1Cj30+EGkEZzYQu7KCNkcqiqfsJ2pa5tzR6G40qusJgnn5YW2JnZxE0brMHB8ftAenQ+3sL/8JAThAZsfNVmNTdiQjNAJvE5AQTHk9yv/xPj49Kvzjk7cAkLqFV18R5m0btE+oURHHMnfRPq2+OrIJbCwdN8wo5jyCfTWY1hcyboLQ8HDuanxO9ImqAK6Hag1oSiPUmuyU+Zy8vdZ51dnJb4kdsbQnchSbE7sRm6pN/M3A8ldllFuF5PFCNbKv58Ub1GQu7AV8pJpb+7DAeqziq6XPHEacrgwxnJFlqfT6ynArJUG0D2TQUJM8bsfcxV5qimLxwkPC8XkVS0CI32RTqc7TN1Zrkth9g2yWZCbzPkn6Ex6sNnyxUxs0sucmL/6gLWVHYtMT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 14:21:51.5580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20dd8c0b-90a6-458a-36d4-08dc379f7111
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470

Hi Jan,

On 2/27/2024 9:51 PM, Jan Beulich wrote:
> On 27.02.2024 14:35, Henry Wang wrote:
>> Hi Jan,
>>
>> On 2/27/2024 9:27 PM, Jan Beulich wrote:
>>> On 27.02.2024 14:24, Henry Wang wrote:
>>>> On 2/26/2024 4:25 PM, Jan Beulich wrote:
>>>>> On 26.02.2024 02:19, Henry Wang wrote:
>>>>>> --- a/xen/common/memory.c
>>>>>> +++ b/xen/common/memory.c
>>>>>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>>>>>             }
>>>>>>             else
>>>>>>             {
>>>>>> -            if ( is_domain_direct_mapped(d) )
>>>>>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>>>>>>                 {
>>>>>>                     mfn = _mfn(gpfn);
>>>>>>     
>>>>> I wonder whether is_domain_direct_mapped() shouldn't either be cloned
>>>>> into e.g. is_gfn_direct_mapped(d, gfn), or be adjusted in-place to gain
>>>>> such a (then optional) 2nd parameter. (Of course there again shouldn't be
>>>>> a need for every domain to define a stub is_domain_direct_mapped() - if
>>>>> not defined by an arch header, the stub can be supplied in a single
>>>>> central place.)
>>>> Same here, it looks like you prefer the centralized
>>>> is_domain_direct_mapped() now, as we are having more archs. I can do the
>>>> clean-up when sending v2. Just out of curiosity, do you think it is a
>>>> good practice to place the is_domain_direct_mapped() implementation in
>>>> xen/domain.h with proper arch #ifdefs?
>>> arch #ifdefs? I'd like to avoid such, if at all possible. Generic fallbacks
>>> generally ought to key their conditionals to the very identifier not
>>> (already) being defined.
>> I meant something like this (as I saw CDF_directmap is currently gated
>> in this way in xen/domain.h):
>>
>> #ifdef CONFIG_ARM
>> #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>> #else
>> #define is_domain_direct_mapped(d) ((void)(d), 0)
>> #endif
>>
>> I am having trouble to think of another way to keep the function in a
>> centralized place while
>> avoiding the #ifdefs. Would you mind elaborating a bit? Thanks!
> What is already there is fine to change. I took your earlier reply to
> mean that you want to add an "#ifndef CONFIG_ARM" to put in place some
> new fallback handler.
>
> Of course the above could also be done without any direct CONFIG_ARM
> dependency. For example, CDF_directmap could simply evaluate to zero
> when direct mapped memory isn't supported.

Yes correct, that will indeed simplify the code a lot. I can do the 
change accordingly in follow-up versions.

Kind regards,
Henry

> Jan


