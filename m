Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA6809FEE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650508.1016104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXVN-0007CY-UE; Fri, 08 Dec 2023 09:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650508.1016104; Fri, 08 Dec 2023 09:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXVN-0007A3-Qx; Fri, 08 Dec 2023 09:50:45 +0000
Received: by outflank-mailman (input) for mailman id 650508;
 Fri, 08 Dec 2023 09:50:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8K7=HT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBXVM-00079x-7c
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:50:44 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0e82e7-95af-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:50:41 +0100 (CET)
Received: from MN2PR05CA0045.namprd05.prod.outlook.com (2603:10b6:208:236::14)
 by BL1PR12MB5351.namprd12.prod.outlook.com (2603:10b6:208:317::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:50:38 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::d7) by MN2PR05CA0045.outlook.office365.com
 (2603:10b6:208:236::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.17 via Frontend
 Transport; Fri, 8 Dec 2023 09:50:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 09:50:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 03:50:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 03:50:37 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 8 Dec 2023 03:50:35 -0600
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
X-Inumbo-ID: 3f0e82e7-95af-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh/jvUH5MSTEPjQu7VBxVkbnbf4eZ6KNfn2Q75p6CvyvWjp42dGLsDTs6HGThI4+r299uyvw/WEWGp9PI/Szsiyh20hIENWpPn4Rnn2Ss4jFA98NoV52NxWBv8wQsdk31HQceKpCN3Ua0RQ8M0NCyM2MhPSvdh7vJOMo83EZMb8WV2ahFqqw6PJFcw7L/0rgqOPeAsR2AAZ0CC9tQa6+cUpChDYQu/PlFEEgii7muOynN5YDUfrzx5j7LGUsX9+rflE12HSBhJccquZYUNitsBzOhXa//JLqI5gprrJmaMtgU7HphiZj1mIaSAGR+YoryW54GRFN+SE/KGAqiKmbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNdMaqa7uOvWee7ed4S6Ndp+848+q7jX5ZBEXO9Bbvo=;
 b=Y95t6hPS5v33v2xvveDK/WY/LGO8Am+4GdvpRCk/NOuFXvXUJjxpy+PCIECOt0iThN2te3l0lv3qIaaedXecrDOBsDF1L86za8dUC2+dUAZ3Fxhlj3OlLNyISNY/7SGquF5ULWYrswSdgvF1zA+UkUFbC14fxddKgV9ZFQvtCxiFTSsnadbm44NZtbuyOunEddHwKyFkEVDwnRugGqzVOws+xxIw3mZVnGaru+POKOj6PUVTY4XI66t2e4a+Smbg8TudmVfqGGUm6T98JnPMXiBDrestj4I5ApYFUJ25G2yR0B3VvVndAgcId+eV8fd4D0UHR9kj2j5Jn7AX2h0vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNdMaqa7uOvWee7ed4S6Ndp+848+q7jX5ZBEXO9Bbvo=;
 b=aTxI/tQ8LDwrqtCBY4A4N/FA3C6d1LkshqZBRnnmITKr8nxVM/75GSEm5IN74DJSmNcqBKjC9GNiEAdQuO0bG3ORj034agIzSa9/S5IRFe5cvRbg6ebdWOrQJCM2Q1V/7VPo9D1MK1HiFKq+KRYCg60aNYgAUodVkgSnjl9w9Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
Date: Fri, 8 Dec 2023 10:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
 <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BL1PR12MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f23698-32a5-4486-1f0b-08dbf7d321a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oPNk6aJWYFaqph2ar8BdyT4Oun3AOSfLzCvQJHhzwCA/dhMFIOMDaFgN/fDww12160ywRR68DVcYzhLe0gsXVV2hnBvO2HujQ3Kmr4RnLgyYpdcGhfTdhwgQeUlGRSpYTQPN1C8U1VpnO89ZKRvHL6BYnkyq8F4xAp1G1u5ziEHyTRDe8iFtQN8/Myp/0B0nFfTjGIpR8Pw8ly1b4QhJj2Fs4ZyjQlXzRXzLoxVs9NjMgiM7NCBNAOvdZx1vqejjRu3t+jz5NyZwCij9kuVN3nM7kehnxFF7Ftg0JoRTy4CFlsvvPE6lEYInqyglb7bMxjt2kJtVsMG6/T0Jz1rJdgbxD+oNTpkVNb1SGKhGEGOKSZNFToAGvbhDKrSMeVOsC7tez3M7ILjbOiJWgCIkureQJqhNFxjpadtgtN9Gn2bmZQ8l0FqSzXBIxJYE2XKTsx3Eu+SuSlFLsiyUftnW45OhRNuKSN10h8Zti52pPRE0y3JP43WYRL5SISxHNvgBMAIuEnEn7bSl3LVVOv93DbaHnpTwZgKQ1CzGSFL6NQ/te4PElztVPpZd3flMvSh7Z3Ba3BCWSaDgoX1OUJHmXE7YlzGVCQUg6nsodKi14h5bFCUHE/1FhqFJXqUo4YhdmA2KoGCvciBlDMRhlCOv/eIXIknINoeA7PUuBKpHdpst+g5o6Ty0Y64cpG2VlbHlBv6x9/enRAl5SvvwVOvuhVnX0UFkiY22HerrQGNQ8K8oqv0um1cgnimD06tooBSZiUupy+7O25gGAfarRSiwhjGa+xFuoWPOpCvm9kjg1MF52IbwiE9lgyF02NwpJvxh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(54906003)(82740400003)(16576012)(31686004)(478600001)(316002)(70206006)(70586007)(36860700001)(6916009)(44832011)(8936002)(356005)(26005)(86362001)(336012)(4326008)(426003)(83380400001)(81166007)(53546011)(8676002)(40460700003)(40480700001)(47076005)(31696002)(2616005)(5660300002)(2906002)(36756003)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:50:37.7570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f23698-32a5-4486-1f0b-08dbf7d321a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5351



On 08/12/2023 10:21, Henry Wang wrote:
> 
> 
> Hi Michal,
> 
>> On Dec 8, 2023, at 17:11, Michal Orzel <michal.orzel@amd.com> wrote:
>> On 08/12/2023 10:05, Henry Wang wrote:
>>>
>>> Hi Michal,
>>>
>>>> On Dec 8, 2023, at 16:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Hi Henry,
>>>>
>>>> On 08/12/2023 06:46, Henry Wang wrote:
>>>>> diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>>> new file mode 100755
>>>>> index 0000000000..25d9a5f81c
>>>>> --- /dev/null
>>>>> +++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>>> @@ -0,0 +1,73 @@
>>>>> +#!/usr/bin/expect
>>>>> +
>>>>> +set timeout 2000
>>>> Do we really need such a big timeout (~30 min)?
>>>> Looking at your test job, it took 16 mins (quite a lot but I know FVP is slow
>>>> + send_slow slows things down)
>>>
>>> This is a really good question. I did have the same question while working on
>>> the negative test today. The timeout 2000 indeed will fail the job at about 30min,
>>> and waiting for it is indeed not really pleasant.
>>>
>>> But my second thought would be - from my observation, the overall time now
>>> would vary between 15min ~ 20min, and having a 10min margin is not that crazy
>>> given that we probably will do more testing from the job in the future, and if the
>>> GitLab Arm worker is high loaded, FVP will probably become slower. And normally
>>> we don’t even trigger the timeout as the job will normally pass. So I decided
>>> to keep this.
>>>
>>> Mind sharing your thoughts about the better value of the timeout? Probably 25min?
>> From what you said that the average is 15-20, I think we can leave it set to 30.
>> But I wonder if we can do something to decrease the average time. ~20 min is a lot
>> even for FVP :) Have you tried setting send_slow to something lower than 100ms?
>> That said, we don't send too many chars to FVP, so I doubt it would play a major role
>> in the overall time.
> 
> I agree with the send_slow part. Actually I do have the same concern, here are my current
> understanding and I think you will definitely help with your knowledge:
> If you check the full log of Dom0 booting, for example [1], you will find that we wasted so
> much time in starting the services of the OS (modloop, udev-settle, etc). All of these services
> are retried many times but in the end they are still not up, and from my understanding they
> won’t affect the actual test(?) If we can somehow get rid of these services from rootfs, I think
> we can save a lot of time.
> 
> And honestly, I noticed that qemu-alpine-arm64-gcc suffers from the same problem and it also
> takes around 15min to finish. So if we managed to tailor the services from the filesystem, we
> can save a lot of time.
That is not true. Qemu runs the tests relatively fast within few minutes. The reason you see e.g. 12 mins
for some Qemu jobs comes from the timeout we set in Qemu scripts. We don't have yet the solution (we could
do the same as Qubes script) to detect the test success early and exit before timeout. That is why currently
the only way for Qemu tests to finish is by reaching the timeout.

So the problem is not with the rootfs and services (the improvement would not be significant) but with
the simulation being slow. That said, this is something we all know and I expect FVP to only be used in scenarios
which cannot be tested using Qemu or real HW.

~Michal

