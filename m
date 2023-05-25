Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01133710841
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539438.840311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26t9-0007El-OL; Thu, 25 May 2023 09:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539438.840311; Thu, 25 May 2023 09:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26t9-0007Ce-L5; Thu, 25 May 2023 09:04:03 +0000
Received: by outflank-mailman (input) for mailman id 539438;
 Thu, 25 May 2023 09:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UGVO=BO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q26t8-0006wv-1p
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:04:02 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c44897-fadb-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:04:00 +0200 (CEST)
Received: from MWH0EPF00056D0E.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:12) by DM8PR12MB5448.namprd12.prod.outlook.com
 (2603:10b6:8:27::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:03:57 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::207) by MWH0EPF00056D0E.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.6 via Frontend
 Transport; Thu, 25 May 2023 09:03:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 09:03:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 04:03:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 02:03:55 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 04:03:54 -0500
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
X-Inumbo-ID: 15c44897-fadb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UycS6/KMFi9OkibPv8oMrbvHIRIo+og8qOwQpfwGwBMA3BHFNKoNIaasmx32iErv6ayizKp8XU2BDtFqWI53MrNX7kyAfgA/NHCztr5tPi6mzjiTGveMZb/46Krh6iCknN8BAIm7jO9x4ChN9WinBY22DnVfoQcegKYb+Em/tFz6dCnezFTvkPj7FaQWiA/2bTpxIuTgm1yPsgGQSwzYocjJA6+4cOcd2bZ9OpWf5HSz8MVC96sGU0VNeIKBpn7GFXCSGwsFZP5HZWoh1a3RT+ruA04DsY1VXivIRX/jQojYC05NMgzAHvQ+AEABvgrZnfanfrPzTtZJrHhWpVVWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBOZ3LCuYza8qg/qQVvD0R+nUvbF8irFn4EYuZyKHsg=;
 b=XE94DOJG0pyDj005o9c5xVcKf82Plg+MelB6A/yjAUD3W/vdjDB6UGwGcagnuLHGh5fJVvtdnBZXz7+i60ZujW+joX192ggMnvr8k8vPzHhwhkC8TpmbAxXuy12MlL7tHQGvgFMllRd3JZ81p9HHJkp8GpU1+ztVKSzX2Y1DAdWdOzqkG5Oblyf1vfKivVrdyLfso+EqBLUdd2eXOs1Lo/Ms8WpjsA9awRFzZI/kxiAux8epDWrYBjP4Hv6eVqS+RUtDmSAmLzYmdaCRbRKQPpcodlraEabnNHCtOk6dhfJDG0svXaEjGmkHuiZX2ltILhhNKon69vExCRWN2EuoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBOZ3LCuYza8qg/qQVvD0R+nUvbF8irFn4EYuZyKHsg=;
 b=bu+F03bUqfjkt6OQ8pO0c+drrt9Udj0CN2WBSOF+alAPql7kK/G1ADgY2JEynKz+KcPZRFAVf4Dn6ukn+Y/eEi4J2zCpMTSVOOcauIwZ1aFMHkRbpp0MVCj3889DF9oV4+oRwkB3oRCMTi/T4LLTTrdnysy/bi/Gwqc76O/lpK4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b4d27103-6b02-d5af-980b-e9be6f41469e@amd.com>
Date: Thu, 25 May 2023 11:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-12-luca.fancellu@arm.com>
 <D01601D3-8215-46A0-8539-CF126A5FE11F@arm.com>
 <3dcbec7c-87d2-31cc-ad0f-d8ff4c8baeae@amd.com>
 <D7FF883F-D8DF-48A0-A32D-15F2D0CF7426@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D7FF883F-D8DF-48A0-A32D-15F2D0CF7426@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT044:EE_|DM8PR12MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2bba45-a760-43c3-6dc0-08db5cfef885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	04mb6XJZMZtHnOS7jsIVw+k5t12x2SnE4t4dQp4KNF0W47EsgnmR9gpiiKugwmUV0eLWkfShjsmEB1nujY7WuMOCkmpF1QzGNCxnYQWEvhQuBxOpjx/F6uWa6Y6UH9X56nOmg1E2wbQt54KPe53Oai+aFSUBQqdvIDiab0rTFNJw1qLK9EJQkEv5IW+8PdUTp6IIWHYTfk41pys00haK01R8NeZpkhWJEhq0b17eJaRd+a1TQFpRmJLb/IoVc1hUWuXeBgRLYV6+XtjRtv2kPCrc7EbDEgQgMmXkoemr9nJXvYR+TTUVD2TWpifhmgfyC6dWAGwbBE0LRqjyseu5Wae82HfIwdR1Ln5fKMwhmj/+beGzKNph4r5LAeQvUtD+Pe98/mIaLKmSHk0JADd3WgRIOd5z51fCGOLFffp9OUEBRm5DCs8+0zoubTSjnEgTwkKW/cp5bBBtDWwW0D8gCFVFhcOvvGVOlB24y6di5iFwb0dWIR4V4Fm/ZZGhVgpOTshNjkRsAPrnKHJuFevi1dON/0zMPDCp3GKzOLI2PoeyTpTNKHyKQSsKq+7oEs1Kc2sTqM3KqBTkC98+hB+yI+b1NwgDOfv/NO6ZfkfSPzZ0kzwkaM3RSW289VvxQGZrEmqXa9w8ZAQ5dRkaA5VBJJvyZtlTXJvRfHKDTY053FGakPJqUYgMlpFGlJ24wti/uPwtIE02dUlqIUW6EnkB6HQNM66ivZHoIWSHjXdPkCRCK9h11RbGN1itavu6ea5KGUZoC3DEqfM7YPZFLN7sqZLEL9hEV5xo8GZJ+WUDv5uBbPKYbORad9XY5gSeUQb/QKp5QqpiCSs2bneDSv579w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(2616005)(40460700003)(83380400001)(47076005)(336012)(2906002)(426003)(186003)(36756003)(86362001)(82310400005)(31696002)(82740400003)(356005)(81166007)(36860700001)(8676002)(8936002)(5660300002)(16576012)(70586007)(54906003)(31686004)(70206006)(41300700001)(6916009)(4326008)(316002)(40480700001)(26005)(478600001)(53546011)(44832011)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:03:56.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2bba45-a760-43c3-6dc0-08db5cfef885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5448



On 25/05/2023 10:55, Luca Fancellu wrote:
> 
> 
>> On 25 May 2023, at 09:52, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> Sorry for jumping into this but I just wanted to read the dt binding doc and spotted one thing by accident.
>>
>> On 24/05/2023 17:20, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Luca,
>>>
>>>> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>>
>>>> Add a device tree property in the dom0less domU configuration
>>>> to enable the guest to use SVE.
>>>>
>>>> Update documentation.
>>>>
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> (...)
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 9202a96d9c28..ba4fe9e165ee 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -4008,6 +4008,34 @@ void __init create_domUs(void)
>>>>            d_cfg.max_maptrack_frames = val;
>>>>        }
>>>>
>>>> +        if ( dt_get_property(node, "sve", &val) )
>>>> +        {
>>>> +#ifdef CONFIG_ARM64_SVE
>>>> +            unsigned int sve_vl_bits;
>>>> +            bool ret = false;
>>>> +
>>>> +            if ( !val )
>>>> +            {
>>>> +                /* Property found with no value, means max HW VL supported */
>>>> +                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                if ( dt_property_read_u32(node, "sve", &val) )
>>>> +                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
>>>> +                else
>>>> +                    panic("Error reading 'sve' property");
>> Both here and ...
>>
>>>> +            }
>>>> +
>>>> +            if ( ret )
>>>> +                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
>>>> +            else
>>>> +                panic("SVE vector length error\n");
>>>> +#else
>>>> +            panic("'sve' property found, but CONFIG_ARM64_SVE not selected");
>> here you are missing \n at the end of string. If you take a look at panic() implementation,
>> new line char is not added so in your case it would result in an ugly formatted panic message.
> 
> Hi Michal,
> 
> Thank you for pointing that out! Indeed there might be some issues, I will fix in the next push.
With that fixed,
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


