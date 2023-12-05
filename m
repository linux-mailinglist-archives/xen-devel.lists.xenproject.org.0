Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A08805033
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 11:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647525.1010733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAShQ-0004Jk-IQ; Tue, 05 Dec 2023 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647525.1010733; Tue, 05 Dec 2023 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAShQ-0004HP-EL; Tue, 05 Dec 2023 10:30:44 +0000
Received: by outflank-mailman (input) for mailman id 647525;
 Tue, 05 Dec 2023 10:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibAO=HQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rAShP-0004HJ-5y
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 10:30:43 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 558327ed-9359-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 11:30:40 +0100 (CET)
Received: from DM6PR02CA0082.namprd02.prod.outlook.com (2603:10b6:5:1f4::23)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 10:30:35 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:1f4:cafe::eb) by DM6PR02CA0082.outlook.office365.com
 (2603:10b6:5:1f4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 10:30:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 10:30:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 04:30:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 5 Dec
 2023 02:30:17 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 04:30:16 -0600
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
X-Inumbo-ID: 558327ed-9359-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtT45+Ioq5gZxwS1AE3gGZCj9bdkvehY2+9ClAd4AlwD/7KYM1YAjr5xjqJD2UE7Xl/KHxpF2vFS0oYG/4wWgIR9lt0wj3iAzSro4V89PkO1GYmegjAOrzRzKt0d3n9ze7iQmhsGOwh1aJhQk5xdDc2AcdxYl5yjbCJF/Rl5spUwtEd0mHl6Ba+5CgxP/aT9ya+1iLJy4UQrhkJ9KYBgmt+MbO1LYctjClMBNSxZ1GGRTDcrkAFNWgG0hflUI8MT0m7qp0KaDiDHkBZVxsI15I+Vf6VloJtwOzAohOxxP+b8pD/6ey/5w1cchCH5l+zRmiX+KFvsDZNRzzF7BiwutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRRycqvsnZ55Tn/c5Gjr5mCYcItaczlpUEwVwLZmPmY=;
 b=DLXdMBwwSpdz7Uv1GHubYYkXduzTzEXai2PKbNl5zW+MKHjo7jn8J0kL2QDz362tJZeF4oX8XZ0KGj8hwChd+Z84qbno7b/6qEVyAkN8cQ3TPbYi4RN/hU2Pdey3MHGGlMwKQInCvTeTD1Ba7uLllkwiXqH03ZFJ6RyoHAB1NrWRI5E9kp9yxr9DOyhVacojaFItIyddjD+1TZadEJSfTkTMBixdaKVcmWRqcRWG1+blqZkTnSQftGzfxx0I/4ccmQQoRLCeuT64xTj7Vll6lBdfmCfI94GcLB5GJMlBQT09Zay/lrIvMEXJixL0V9+SKGpP2f3Q+5vV8XLp4lRy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRRycqvsnZ55Tn/c5Gjr5mCYcItaczlpUEwVwLZmPmY=;
 b=LWs7/ToKJ2zV3PsX+2obDOz54ympxy0tpRTIqb+P0746CtujEDhHlxdR/LC2BwoPeUNLJBlKvnbjrhF2UP1sG9y8kBgiV7G3VYKJzFFKGudFHOTyLEfTl1+UghHbpQh71u+auqtW5ccI8ndciUnIKfbBc23ALPxpN5IxpZz0W8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
Date: Tue, 5 Dec 2023 11:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<stefano.stabellini@amd.com>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
 <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f05640c-aa8f-46a5-ecab-08dbf57d3712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OAGKy4NZ6DaIOakhIQlKVJFFDpaHHwbKeDDhXkidppJtvSl9MMHNDHxqAtzjPM1rmMo5wSUgb8O0VNb1KsVM7cPBdNGuhSYjXixBoo8iTmdLqwtrko7avW9f5zIKWJH3v4oQ1PaPC3n2ao+SFxCI2QBT6P5OY3wzsMx9la0FZuJcrahSPAsDQzU+0pzrJLvDUWmzmswNAhYG3lsx6d/+lZe7ESO2K/spywh+JItkbhi9INXVIIzZ+2ilVeZHKmumrYlYs0/ldr1N19yMSq9tbJKsXqUTfTRWjL3ut7ZAzvLLlOJe0yQK3QFKtMvSLcCz/GPYuJ7reliUoe4uhp8e1l80SP8K5PSDMcMb3noMrMUv9dPrlLt5u5b9Ahw9TAogGozdFd6hPZv+ZD9jMTf4CRXnMbhvJjIVybmRDxJ3BEPmmBHDZ7r9SvziT9Ym6p2MPGmeI4LSCcUgjvf+cIfIa0X/gDtd2OgHCgUHJ41/DWhmaAREZjAh3x95YlmPXkJIA0qAGnZMiCjsxci340sN7acnw8NqB+e8jtYFzDCiDrQ4DRUgOFhgUrkpNHPdhTWevBl3nhUvgv8RzmknW2UXv90spLDAebOEWdiOF/wwfte9901numMlBBX5X2HED3XJoBEVj0UDOLueV0khnlnqZyAORk0aUiaFlDWygVVHpSAKylcEfDcQMQ1O24Dq3nAUws+CcLZWQYfHwvaYlJ6JH5HPADcZ7znzi8d0tm2rzt6RV4eGWug6DBx+FHMqgtDTQt/TkvRnCK91tuyT2c61QJ7P1EJkZ1nTYCjsa1zj4SpymGXqE8xa0HRLVfdOVLEpgrqBFjw6LizGLflflUQdKZirsezV8B1DRTwDri7iT2zHZZMWbIxRibMN/ZCDxaVL
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(36840700001)(40470700004)(46966006)(47076005)(40480700001)(26005)(53546011)(356005)(81166007)(4326008)(8936002)(8676002)(110136005)(31686004)(70206006)(316002)(70586007)(36860700001)(16576012)(82740400003)(336012)(2616005)(426003)(478600001)(83380400001)(2906002)(41300700001)(5660300002)(40460700003)(86362001)(44832011)(36756003)(31696002)(2101003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 10:30:34.5823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f05640c-aa8f-46a5-ecab-08dbf57d3712
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810



On 05/12/2023 11:01, Julien Grall wrote:
> 
> 
> On 05/12/2023 09:28, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 04/12/2023 20:55, Julien Grall wrote:
>>>
>>>
>>> On 04/12/2023 13:02, Ayan Kumar Halder wrote:
>>>>
>>>> On 04/12/2023 10:31, Julien Grall wrote:
>>>>> Hi Ayan,
>>>> Hi Julien,
>>>>>
>>>>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>>>>> Currently if user enables HVC_DCC config option in Linux, it invokes
>>>>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>>>>>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>>>>>> an undefined exception to the guest. And Linux crashes.
>>>>>
>>>>> I am missing some data points here to be able to say whether I would
>>>>> be ok with emulating the registers. So some questions:
>>>>>    * As you wrote below, HVC_DCC will return -ENODEV after this
>>>>> emulation. So may I ask what's the use case to enable it? (e.g. is
>>>>> there a distro turning this on?)
>>>>
>>>> I am not aware of any distro using (or not using) this feature. This
>>>> issue came to light during our internal testing, when HVC_DCC was
>>>> enabled to use the debug console. When Linux runs without Xen, then we
>>>> could observe the logs on the debug console. When Linux was running as a
>>>> VM, it crashed.
>>>>
>>>> My intention here was to do the bare minimum emulation so that the crash
>>>> could be avoided.
>>> This reminds me a bit the discussion around "xen/arm64: Decode ldr/str
>>> post increment operations". I don't want Xen to contain half-backed
>>> emulation just to please an OS in certain configuration that doesn't
>>> seem to be often used.
>>>
>>> Also, AFAICT, KVM is in the same situation...
>> Well, KVM is not in the same situation. It emulates all DCC regs as RAZ/WI, so there
>> will be no fault on an attempt to access the DCC.
> 
> Does this mean a guest will think the JTAG is availabe?
Yes, it will believe the DCC is available which is not a totally bad idea. Yes, it will not have
any effect but at least covers the polling loop. The solution proposed here sounds better but does not take
into account the busy while loop when sending the char. Linux DCC earlycon does not make an initial check that runtime
driver does and will keep waiting in the loop if TXfull is set. Emulating everything as RAZ/WI solves that.
As you can see, each solution has its flaws and depends on the OS implementation.

> 
>>
>> In general, I think that if a register is not optional and does not depend on other register
>> to be checked first (e.g. a feature/control register we emulate), which implies that it is fully ok for a guest to
>> access it directly - we should at least try to do something not to crash a guest.
> 
> This is where we have opposing opinion. I view crashing a guest better
> than providing a wrong emulation because it gives a clear signal that
> the register they are trying to access will not function properly.
> 
> We had this exact same discussion a few years ago when Linux started to
> access GIC*_ACTIVER registers. I know that Stefano was for emulating
> them as RAZ but this had consequences on the domain side (Linux
> sometimes need to read them). We settled on printing a warning which is
> not great but better than claiming we properly emulate the register.
> 
>>
>> I agree that this feature is not widely used. In fact I can only find it implemented in Linux and U-BOOT
>> and the issue I found in DBGDSCRINT (no access from EL0, even though we emulate REXT.UDCCdis as 0) only
>> proves that. At the same time, it does not cost us much to add this trivial support.
> 
> See above. If we provide an (even basic) emulation, we need to make sure
> it is correct and doesn't have a side effect on the guest. If we can't
> guarantee that (e.g. like for set/way when a device is assigned), then
> the best course of action is to crash the domain.
> 
> AFAICT, the proposed emulation would be ok. But I want to make clear
> that I would not generally be ok with this approach and the decision
> would need to be on the case by case basis.
This goes without saying. Every issue requires separate investigation.

~Michal

