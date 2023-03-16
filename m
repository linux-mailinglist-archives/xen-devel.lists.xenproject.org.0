Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068E6BC7BE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510334.787826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciOy-0003gz-La; Thu, 16 Mar 2023 07:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510334.787826; Thu, 16 Mar 2023 07:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciOy-0003e1-Hu; Thu, 16 Mar 2023 07:51:56 +0000
Received: by outflank-mailman (input) for mailman id 510334;
 Thu, 16 Mar 2023 07:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zev1=7I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pciOw-0003dv-NW
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:51:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69bc70b8-c3cf-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 08:51:53 +0100 (CET)
Received: from BN9PR03CA0263.namprd03.prod.outlook.com (2603:10b6:408:ff::28)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 07:51:47 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::16) by BN9PR03CA0263.outlook.office365.com
 (2603:10b6:408:ff::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Thu, 16 Mar 2023 07:51:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.18 via Frontend Transport; Thu, 16 Mar 2023 07:51:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Mar
 2023 02:51:47 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 16 Mar 2023 02:51:45 -0500
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
X-Inumbo-ID: 69bc70b8-c3cf-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeXE/9RZcRWwv/A9fMaWzE7tfz1LroFx4AKfjhvFzrYrCztdSLbzCNzxRQizj7CnVwx11Ir2r+FNYyW145G79C1DodhKynzQjsy269nH7L2tIQ6QyRchyCqkevDoAHQNNcePhKhOJ2uhRxL98gNcWzqfyQgNVuZhdpOvY7JSwClWDjFrut2lSkprK5hFC9s/99LNft/ipEoGYCbIyG4OXWNkXmj9+ae2A0BD0xAOuVKcCNr/64hSjuXlT6gLdPyvVBMsi2AVV1ZLMba1J+aIrCJkx7L9hjd0K83K7nVF4G8tSeLpa431zE5FOeeMohW14c5pxy7yGEHix1k/+oWS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELscufVM9EW8QoBfrem0tErjpF/1oTjJ1GMk0fdLGsU=;
 b=ZuKiJxgaoWLPPBL2YBIa0IJFvuMQuA6RrodjYBOhsV2+xWSAHNbGPOTIlOMwjqW4kOukY04M9B3kOF69nIh0+wGNHwBT2zZMEZ69q7GXBKQT4/vQzPMD1m+2fc6CjRajcw3mbc5gyACBBT3f0P++YH7TNTbjC5g6f1LqnuUnPRy7shZ/ZMef99OfNvPJEGeVRJcB3e+6YlxKBhaZP8XxfVZzWCpN2bt3xGfbFrI9rQLZ8XLZu3hS5eYr7d8JSd8Dpe5N3VVwYdmOPy/Tt5KaYTJYEL7RJe6oz30S0GLsfCyJflabEH0sgtUxyGWnxcBqtye2OHz9KJjinq0U56z2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELscufVM9EW8QoBfrem0tErjpF/1oTjJ1GMk0fdLGsU=;
 b=VMdqV22n/MVsSpHwTOepv9iS7WT1AfUQz6sDA11Wf/SnLzGL8aAafau2jeQ5JmOMFLpqmX5P8oFc+S5nJpAZDiydD6oqA6qLZximCrk1o+1uJV7pgemOBK3BksY0pDjBOZ9Ju2+t13+1WfejrQ+aFQh8qJKt7PboBuHwAh2GhaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <848813fc-636f-ea9c-00a6-6b8b049f92d8@amd.com>
Date: Thu, 16 Mar 2023 08:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20230314142749.8845-1-michal.orzel@amd.com>
 <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
 <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
 <737fec84-42da-3b9b-6cb5-d18406925403@suse.com>
 <d67aeb95-1631-74c0-cefa-a0cc88512b84@amd.com>
 <alpine.DEB.2.22.394.2303151844530.3462@ubuntu-linux-20-04-desktop>
 <1c174a17-0860-358b-5593-a7d45cdad00f@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1c174a17-0860-358b-5593-a7d45cdad00f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|MN2PR12MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: 1972e59b-1694-4854-54cb-08db25f34b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fT6RpoBYabcDyJsOaWPTm0W2LAmw5HPQuplaOpmZL5x7TXM8UWPqorn3IUbXkBS2zDF278ZLlz10d7OX3ISxzShZfFHWBenIxO/itVAc2rJ285EqNLIZrgz1Egvj90L4JRpgl4xWf2TDQ9HH93kD6Icpz2d6hcFCgY565sdtv6BiQlvfmtTFHLyFikTiTdtIRcbUF43rS3HUZfq/mta2iamJhMX4SXOk2pEaBi9y5dqaFWhCvJ1CT9XZCmlUimOF0rDrfmd+qmAfzZe3CE9n94fLNNJWriq3ZsLlZGY2lcyxotXw9z6Tukh/3u6b0vLnVmAybkLyIRwl1ki8dNvkXQ6rtsiwJxUUmYsinPz0wCUHL0T3X8MDoVUGHkYnx3Rc7UgKnk2OiQfunAQjenSyvNAD+W/dtRueh8fe0ukLTDFy1vuwt8eYsDg1vdvde+VM7rZwfJeF4YhlhRWe3faoyrs9/3Flo+8Wi2MRZV/HfQdna7WG/z9e/7/aCtVRta62CfMLJQunDPn90O4KecxiRQHMxj4/8gC1GEe/L1y0jYYqyhYm00kPksNxHGn+c8SQhrbPBmC4zCOzBB8cayPqHpaRR5rAMqRleptR9so7fSjwEam2HIyRPRv8WnI4bp5g5DHo7QscqrdSlfRELq2nkx8QAvZh87/dMOlFeVbtcWI/G+02sSMpqpX0/zrk1ngMBlCT5OQfK9u9zTMWLpwIr60h5ZVydp+ZvhDeakA8gZ6uIr1AznLvP++AbCtaVxI1Rulx7dAkmXDMtt53tuexsB8Q7jIY+66NQ7v76V0a86Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(2906002)(53546011)(31686004)(356005)(83380400001)(26005)(426003)(47076005)(44832011)(41300700001)(40480700001)(40460700003)(5660300002)(8936002)(86362001)(8676002)(336012)(31696002)(2616005)(70206006)(70586007)(4326008)(186003)(54906003)(478600001)(110136005)(36756003)(316002)(16576012)(82740400003)(81166007)(36860700001)(82310400005)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:51:47.4211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1972e59b-1694-4854-54cb-08db25f34b5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093



On 16/03/2023 08:24, Jan Beulich wrote:
> 
> 
> On 16.03.2023 02:49, Stefano Stabellini wrote:
>> On Wed, 15 Mar 2023, Michal Orzel wrote:
>>> On 15/03/2023 14:11, Jan Beulich wrote:
>>>> On 15.03.2023 13:34, Michal Orzel wrote:
>>>>> On 14/03/2023 16:17, Jan Beulich wrote:
>>>>>> On 14.03.2023 15:27, Michal Orzel wrote:
>>>>>>> --- a/xen/drivers/char/console.c
>>>>>>> +++ b/xen/drivers/char/console.c
>>>>>>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>>>>>>>      else
>>>>>>>      {
>>>>>>>          console_rx++;
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * Skip switching serial input to hardware domain if it does not exist
>>>>>>> +         * (i.e. true dom0less mode).
>>>>>>> +         */
>>>>>>> +        if ( !hardware_domain && (console_rx == 1) )
>>>>>>> +            console_rx++;
>>>>>>
>>>>>> The consumers of this variable aren't really serialized with this
>>>>>> updating. That's probably okay-ish prior to your change, but now
>>>>>> there can be two updates in rapid succession. I think it would be
>>>>>> better if the variable was written only once here.
>>>>> ok, makes sense.
>>>>>
>>>>>>
>>>>>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>>>>
>>>>>> When invoked from console_endboot() this will now switch to Dom1,
>>>>>> i.e. that domain becomes kind of "preferred", which I think is
>>>>>> wrong. Instead I think in such a case we should direct input to
>>>>>> Xen by default.
>>>>> Switching serial input to the first usable domain is the major motivation behind this patch.
>>>>> The number of times I got pinged by users with *apparent* Xen issue on true dom0less
>>>>> just because input was directed to dom0 which was not there (not everyone seems to read the
>>>>> boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
>>>>> Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
>>>>> to default serial input to Xen.
>>>>> So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).
>>>>
>>>> Well, I'm not going to stand in the way, but if one of several supposedly
>>>> equal domains is to be "preferred" in some way, then I for one would
>>>> expect justification for doing so. If that's the route to go, then the
>>>> patch snippet you provided looks good to me.
>>> Well, the explanation is that we are directing input to the first existing domain
>>> which also is the first domain created (this is what users expect at least by default).
>>> This for now creates simplest/cleanest solution that matches the current behavior
>>> with dom0 and solves the users inconveniences I mentioned earlier.
>>> There is no other real preference apart from being first domain created and to help keep the order simple.
>>
>> My two cents. Given the feedback we are getting from users, I think it
>> is important that the input goes to a real valid domain (not Xen, not
>> Dom0 that doesn't exist). "Which dom0less domain?" is a valid question,
>> and I don't know what would be the best answer. But any of those domains
>> would be better than what we have today.
> 
> Could boot time configuration perhaps indicate which domain to "prefer"?
> Otherwise I'm pretty inclined to suggest to make it actually random ...
Random is not great because in a system with e.g. 20 domUs and directing to e.g. 10th domU
user would have to go through a lot of domains executing CTRL-AAA several times. Also, for me
it would be difficult to reason about as such approach is definitely not something users expect.

May I ask so that we proceed with a patch I proposed to start from the first usable domain
to match the current behavior and to help users?. In the meantime I will start working on
a support for indicating which domain to prefer.
All in all, the new patch would touch console_endboot() and not switch_serial_input().

~Michal

