Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6037FC018
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643359.1003481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81gG-0000BX-Hu; Tue, 28 Nov 2023 17:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643359.1003481; Tue, 28 Nov 2023 17:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81gG-00009Q-E4; Tue, 28 Nov 2023 17:15:28 +0000
Received: by outflank-mailman (input) for mailman id 643359;
 Tue, 28 Nov 2023 17:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DME+=HJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r81gE-0008K0-5L
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:15:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7bff91d-8e11-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:15:25 +0100 (CET)
Received: from MN2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:208:236::29)
 by BY5PR12MB4145.namprd12.prod.outlook.com (2603:10b6:a03:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 17:15:21 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:236:cafe::16) by MN2PR05CA0060.outlook.office365.com
 (2603:10b6:208:236::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Tue, 28 Nov 2023 17:15:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 17:15:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 11:15:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 11:15:15 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 11:15:13 -0600
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
X-Inumbo-ID: b7bff91d-8e11-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOfkEfR2/IzmbrPr+AONvhFu1tnihZMCY5dGRR+rOmwrTIcXH/mgqWDXJGtjBQXT0Ggor3jC9OFNohEOYqiHGKf3erIaeHYuufVpdHfUyLKv57KLg0l32P4UtbziLC5JRoDGwNkhyTBK2av3xHkBVOXxmAHAaOVjWObJY2ME1aANyNpuLpX5w6FLHddrivXiMb6FafSRmhtDyRaKapxOkAnu4l43FMgayz3GKAFRycHOdakc7R5nrvebJbunJXrQDPOJmX6ZA/G8umEEBXoLNhwSExBN1fZ/TnImbdPHnVQFxZ5m3ROyIwczvZ33/swkLGLsqxAOWvv5SrH/fremZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5kQNYotyjuKlxB7a5AQ4zR40ZmPyz4cdIsmaSGYHbM=;
 b=Dv3K0Ur382ppT9Kq9TGoniFx/o08oe//mu0ChpkKDdI2LYsxP8qSaQQSyR3G1/gLw88AhtOw00iQBAP7V0tJmVvhzApWZA9TjWJYv2XwC/zWesxZLG4s8Jy+fUApxn3VODNuY2zaKXaarcQoOWixcThYvN/emCRYPDe4Fjf1/kUim2InXu3dXTslUsZ6SyUE6NZIb9jh/C2MZB11vo8jBjgm8TOa9Pmuln8mkSjjvzVu9Ws77FCyZPIKvnoZXTsLdnx2mRphiOIAV4yXy+G6xq5bvjYfSR5HZa+xFjyurjemRZ5vkp8hDhO6/7k4WXwm3WKiC4XZgWq09l1ZvjikBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5kQNYotyjuKlxB7a5AQ4zR40ZmPyz4cdIsmaSGYHbM=;
 b=UMM8wh8j9s0avft1OxOxWoQAZ3RrjsjKx0j6GTQsJ4z1wq9EkoYc5Ji4TzMMQfzd75J0WKA1ViJPvmzel/9S7nl+jMDkoo0kpmOwcZnMnOhbxOpppLElN9zPibFOyvWUj0k3HKmKEA0IjZrcGLJNHYzwVNgzvo/qF1o8eLpLXPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <16b73400-b592-4a1a-9b87-8c49aad9208d@amd.com>
Date: Tue, 28 Nov 2023 18:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
 <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
 <b0127019-4976-42e3-bde1-643cc56f18b0@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b0127019-4976-42e3-bde1-643cc56f18b0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|BY5PR12MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd2d992-4c89-4fb5-23fc-08dbf0359a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pq6UZO+lSx709P2ddgrwklAaZZYq3HKUt1HHvEUXr6RXLIhyqOSiJ/k3JNytjjACakrh0BRs2VI57diuZVTU/Vg41fwmGlb1AD7fVy5fV7bGl7qiaUKcsM2pkVdLtRIdRAUwaZ0NdPPFTa7zhRt0tDa6RBpT0xBy9UisGgzvWtR0vX2oKQMrWJhOBCvCm1Y0AwiiL7ZYsCjREgC6Wdywk2HYwZlWgm/QptOan78IplI4uhXcXvuOtIKqzP2D9ExnEg3q3FRABbWYdf/VLNdG1WaOpJtRZH7wZkxJM4xBDbqwn1W+flqplG/Lg/TSNgUy5brItn0KGkhavsMyFyRRXIdGXlkoYc5Hs8lc8VUVOAvNx/iBKRbkK8ydZVtjcT6PikMyrf2DyBVssPV2+IHZmmrP6AI9+Vx2BIvjWCf/3LsRo4Ntr1p3yZBnbrCJTbzWs7n/ky35lwkPbeSm8luvgpqeNuNbCXyohz1oM0GMzRzZLKq2q7vS0VkIa/dDH59rLWjwsAUcfnLmCHotSs7gTrmlPRTohdB2VnCODxP//mef/KKgtsFjueFdLL7DnUkkFHMaT8xQTxMU7GQI7RtGNL4oTKwVjmbmmcso3Nh6+nYNWqNdzjRZp4+hTgyYa/eL/n3jU2IOBEe0a9LqoVPwU68mpaOOlmaUTLknb3LDQnjranG2Yjm+rTd2Op5BDMEbwtdQNFrv3Yrdn5EYOJKDI6cXp+WHiFR9H0K5wwwnEWsdFM9WS56kD3jF9NRZOSHhwvip8c7c8cR7DqlEw9r+1OTMMkBSyTIldcIrdvs328/ZBT7CKWiwys310o5IzeAn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(36840700001)(40470700004)(46966006)(36860700001)(86362001)(36756003)(82740400003)(356005)(40460700003)(81166007)(31696002)(41300700001)(8936002)(8676002)(4326008)(54906003)(70586007)(16576012)(316002)(70206006)(53546011)(110136005)(478600001)(5660300002)(2906002)(44832011)(31686004)(47076005)(336012)(40480700001)(426003)(26005)(2616005)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:15:21.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd2d992-4c89-4fb5-23fc-08dbf0359a13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4145



On 28/11/2023 18:09, Julien Grall wrote:
> 
> 
> On 28/11/2023 18:00, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 28/11/2023 17:14, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 27/11/2023 15:41, Michal Orzel wrote:
>>>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>>>> attention to undefined behavior issues, notably during CI test runs, is
>>>> essential. When enabled, this option causes Xen to panic upon detecting
>>>> UBSAN failure (as the last step in ubsan_epilogue()).
>>>
>>> I have mixed opinions on this patch. This would be a good one if we had
>>> a Xen mostly free from UBSAN behavior. But this is not the case at least
>>> on arm32. So we would end up to stop at the first error. IOW, we would
>>> need to fix the first error before we can see the next one.
>> Well, this patch introduces a config option disabled by default.
> 
> I understood this is disabled by default... I am pointing out that I am
> not convinced about the usefulness until we are at the stage where Xen
> is normally not reporting any USBAN error.
> 
>> If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
>> of handling such issues is to do the investigation locally.
> 
> This will not always be possible. One example is when you are only able
> to reproduce some of the USBAN errors on a specific HW.
> 
>> Then, you are not forced
>> to select this option and you can see all the UBSAN issues if you want.
> 
> See above, I got that point. I am mostly concerned about the implication
> in the CI right now.
> 
>>
>>>
>>> So I feel it would be best if the gitlab CI jobs actually check for
>>> USBAN in the logs and fail if there are any. With that, we can get the
>>> full list of UBSAN issues on each job.
>> Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.
>>
>> *my plan was to first fix the UBSAN issues and then enable this option for CI.
> 
> That would have been useful to describe your goal after "---". With that
> in mind, then I suggest to revisit this patch once all the UBSAN issues
> in a normal build are fixed.
But this patch does not enable this option for CI automatically, right? Why are you so keen to push it back?
Is it because you see no point in this option other than for the upstream CI loop? I find it useful on a day-to-day
Xen runs, and I would for sure enable it by default in my config not to miss UBSAN failures.

~Michal


