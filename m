Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA96BB992
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 17:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510135.787302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTsc-0003YF-5y; Wed, 15 Mar 2023 16:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510135.787302; Wed, 15 Mar 2023 16:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTsc-0003Vu-2d; Wed, 15 Mar 2023 16:21:34 +0000
Received: by outflank-mailman (input) for mailman id 510135;
 Wed, 15 Mar 2023 16:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dk5j=7H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pcTsa-0003Vo-5g
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 16:21:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cc32545-c34d-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 17:21:23 +0100 (CET)
Received: from BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 16:21:20 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::9a) by BL1PR13CA0142.outlook.office365.com
 (2603:10b6:208:2bb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30 via Frontend
 Transport; Wed, 15 Mar 2023 16:21:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Wed, 15 Mar 2023 16:21:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 15 Mar
 2023 11:21:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 15 Mar
 2023 11:21:17 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 15 Mar 2023 11:21:16 -0500
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
X-Inumbo-ID: 6cc32545-c34d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4L82s1B8kmSvENFxrrlAQI4ft5Kn8oA+V211Qds8ni/wbrR9vPtKvd1twj++2TX4z24A2gOaenLrObVKTzF6JQPO6S8i07s0ZoY9ViJpUKnlod86JhbZXqd7hzL5o6WILzBHXEpFkhL3P3QUExOVOTHBUNsmtaxj1lPOMozuRxoQDOazpAy1SZaOZ4bS98YHRFgH9zp65WVs5DLzQVWK7oAlZoM1dqsDYfFtWODCMRnAo36yS/ZUwjue1Fcrz0iYdZrpUma2hO0JUfHWhlE+ef6SUYDAyKVk5Mijm935GvnG1C/hvG3rK9BJ5NN9bx1HIFdpZ5lSzfw/73tJHo53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QrbP2liJ2XcJvOBV5TScBRXVetUXED9GV1H2KPipkA=;
 b=ik6DAPa1O1tl/OlY8C+AOnVinW5x4lRSVId5Mg1L7zSFI8iab9C2SSxb5ofMvawpECYGkwYRz+VYCsE94B6R0QbtxR+UUxpXSRdYgFzO1tadETR2cxCiOaCNpdFFg9EEif98IRvzmp0m42KZB0ZUsGz5nscewDKNV6TMD9WhjRjBwyos9Fme8XH+PqQmc418qWYZxc8kugKySLsTlxn/WgXyIA3w2889QVrUpX36cMc/XenD0v6n6ZCAgMr2/Pm2c0LACsIhPr8hj4loLFYgG5ubheb6bod1MAPpPmCzGLtcqCL1rThf/YnEIK3fcZiNRCFhr2nTyWyOy8cWrS2VQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QrbP2liJ2XcJvOBV5TScBRXVetUXED9GV1H2KPipkA=;
 b=fhmSwASUxCdlYg9kaTQB9c9kL+YGjzvBcEfvKR9jeJiYzSDgxCVwWw8wXun+Zumx1h/OT3lY0VHOsbI4aMRn8DWXH/PCS3EQDo1yfTPBr1g3ddTb9gvZ56NK6e3HKDQeZUrbS+tCJHBjxotzqIv6y6fuALh9TG3SCVLJPAOKmrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d67aeb95-1631-74c0-cefa-a0cc88512b84@amd.com>
Date: Wed, 15 Mar 2023 17:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230314142749.8845-1-michal.orzel@amd.com>
 <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
 <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
 <737fec84-42da-3b9b-6cb5-d18406925403@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <737fec84-42da-3b9b-6cb5-d18406925403@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|CY8PR12MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: d1188f6f-787f-4e8a-1719-08db25714ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0RJcI7naWjshNePPHiPMCPM5LskAN9huEtR+9W2bVFNTBhfqMqSyOexfjIDhBG45YmffxwBnVTxR1mw8GtVc6TufqMPSzn/oyLjAl4uYnnCGLO5t+KNO3v3c7biNPH9ENkFVqAfXSh0EpFpDToYIVjy16AbuQZtBjPw1/FuaKDvWVvWBG/UUR6REYQ1e3J/ApZ6pPUefo2Ux8jTJzg3Gf9rvyv7dTMA8VJE1SaLP0T/bTJG9JPHBBjJyKmASgMdq0sHSGTrlJ46ko84/RShbZjk0AOlWP+brdAGhpmhif4Verj23FCQSOdpciqwCxE6atbK5nBuWEwDTEN9pfDz4mbxKdoQPiPTfsQf4DYYveETBVqbdejDc/R/SedDsxCOU2Ygw4h64DwbDloeUCDC1lWGG6F1WUDj/vWOPWiPt4BfssAXZ34WvxBNAkzCLmkuI9cjVLLUR26UxqALwRcJC/HzCDSfdv36djOmqL14Ff1Ft+yFSvuDm3PL3OIvYfQ0ASX9dPMggF+fr433NJTrzEptHV6gM/TL2YLIQhXgJH0E32M84uZ7qIuHDMSIQXLsC2YBdNysiQfsjtiRY+FLXkcWyplvLFU4zxOjkSIkuRJZbTIDUW5IasKr+zN2Hlu0awA6O6D+UsUFFDMsT2BI/F98rmV/rZZ3h5PQ6G2UXA7km37fI0ZROMZmpAhSusytLH16InXBIaUQhmII8ELrJzscSSslwoar/o2wl53naJoYIH0zoGqdTbN9BCcx5ayI9aHWRQq2RPrujcVjfXxK1a+d3bcqu6ssLwC7Be/gvbU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199018)(40470700004)(46966006)(36840700001)(31686004)(36756003)(8936002)(5660300002)(41300700001)(356005)(2906002)(86362001)(31696002)(36860700001)(81166007)(82740400003)(70586007)(478600001)(70206006)(44832011)(8676002)(6916009)(53546011)(4326008)(82310400005)(40460700003)(40480700001)(54906003)(426003)(16576012)(316002)(336012)(26005)(186003)(47076005)(2616005)(83380400001)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 16:21:18.3825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1188f6f-787f-4e8a-1719-08db25714ea9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219



On 15/03/2023 14:11, Jan Beulich wrote:
> 
> 
> On 15.03.2023 13:34, Michal Orzel wrote:
>> On 14/03/2023 16:17, Jan Beulich wrote:
>>> On 14.03.2023 15:27, Michal Orzel wrote:
>>>> --- a/xen/drivers/char/console.c
>>>> +++ b/xen/drivers/char/console.c
>>>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>>>>      else
>>>>      {
>>>>          console_rx++;
>>>> +
>>>> +        /*
>>>> +         * Skip switching serial input to hardware domain if it does not exist
>>>> +         * (i.e. true dom0less mode).
>>>> +         */
>>>> +        if ( !hardware_domain && (console_rx == 1) )
>>>> +            console_rx++;
>>>
>>> The consumers of this variable aren't really serialized with this
>>> updating. That's probably okay-ish prior to your change, but now
>>> there can be two updates in rapid succession. I think it would be
>>> better if the variable was written only once here.
>> ok, makes sense.
>>
>>>
>>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>
>>> When invoked from console_endboot() this will now switch to Dom1,
>>> i.e. that domain becomes kind of "preferred", which I think is
>>> wrong. Instead I think in such a case we should direct input to
>>> Xen by default.
>> Switching serial input to the first usable domain is the major motivation behind this patch.
>> The number of times I got pinged by users with *apparent* Xen issue on true dom0less
>> just because input was directed to dom0 which was not there (not everyone seems to read the
>> boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
>> Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
>> to default serial input to Xen.
>> So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).
> 
> Well, I'm not going to stand in the way, but if one of several supposedly
> equal domains is to be "preferred" in some way, then I for one would
> expect justification for doing so. If that's the route to go, then the
> patch snippet you provided looks good to me.
Well, the explanation is that we are directing input to the first existing domain
which also is the first domain created (this is what users expect at least by default).
This for now creates simplest/cleanest solution that matches the current behavior
with dom0 and solves the users inconveniences I mentioned earlier.
There is no other real preference apart from being first domain created and to help keep the order simple.

In the future, we are going to allow specifying which domain to direct serial input to if users
want to modify the default behavior. This way, we will have all the flexibility needed:
-default -> first created
-conswitch=ax -> Xen
-dt property -> dom<N>

~Michal

