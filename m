Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC780517A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647543.1010783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATD7-0005jH-4O; Tue, 05 Dec 2023 11:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647543.1010783; Tue, 05 Dec 2023 11:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATD7-0005hN-1S; Tue, 05 Dec 2023 11:03:29 +0000
Received: by outflank-mailman (input) for mailman id 647543;
 Tue, 05 Dec 2023 11:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibAO=HQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rATD5-0005hH-Fx
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:03:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccacb159-935d-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:02:38 +0100 (CET)
Received: from MW4PR02CA0007.namprd02.prod.outlook.com (2603:10b6:303:16d::33)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 11:02:32 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::17) by MW4PR02CA0007.outlook.office365.com
 (2603:10b6:303:16d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 11:02:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 11:02:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 05:02:30 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 05:02:30 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 05:02:28 -0600
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
X-Inumbo-ID: ccacb159-935d-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKEeslhqk9ff3fOo8O+C02ZzBeAAuiT0nOOaiTxKO/gaY2k+uM+ekFQ+aVN3+R3E7kLTEcEQpNqtP6yqaw8IwdZftKIs3IvKjSVqRdbId5EWHhecsV9T6RlxiUeaL2QSiczUVUD5oCRUY4JBHeGFjwzBM5pnTO731/YLU0QosLwlACGICJgk20/luVIrkwmRktDSDj/TiHiiqz4rNySM70Q4jIyHqedfdagu0bpA4MjRz0X90mPqF2WPkVqLgeHsSH+OL4lCSPIGQ1LHHGaD6wXKCTquz2NOAqrOWn/LPxckJLY0TRJz3Rerdyx6lH5sBSNUgvdH3NlURzkbrZE7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytuLXMV96imYv8nU18kaIKWbU83DwGoQIx/XQ4xNORQ=;
 b=Wm7xLdmkbctBNYvt7kIrklIqH89VTaILdpi1/PpANmdxZwtyzVYoexlpNozEJ7wzT1tkPQwLS4U3//aIC5wLnUMXtIRRs3yhmQaj2skoAh3fZTjRy25TDz7fU2WDYOglFwa8qO+7nK5UwuIM0fNONGFOvo57n00mPdcaK4fYOjRnGFY1EI3VHNImeqfy8kXN0zI62mU8cT4aDdGJSC8+mN77JHcePWx2iOl/ayGpKqQE0VbR2x4zjdAKkSG/+JobECm5Hy/K6LiaLrI76/zuNOIJp6Hu8aR8ZMSYlkMBshiFvQYW60+2eWETuKMc7rXNnlQa3mF0oKrxJTywT8Vl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytuLXMV96imYv8nU18kaIKWbU83DwGoQIx/XQ4xNORQ=;
 b=nVRCJRjlGcjEKNPwrLj567MMSNGEe2PGCLxEmv1ce7MzwtUCu/7pamg45M3tasEgySFFsu6lrspodIaSzwRp8jUetDI/tl/W5jydccewS3Js4Hku6bIjHzB3CdDYQEMvhc1fe8pwpRm0kGIgrvYTZbM8iUKYaxMpi28E5pznPYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
Date: Tue, 5 Dec 2023 12:02:27 +0100
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
 <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
 <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|BL0PR12MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caace06-1c8d-4aee-259c-08dbf581ad85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rE2gZE0f+yeAjVpvT5fKhMsGVDJ6xNCTOa283y6FBtYfstLE+VP+NwqB/NGI5ESxcQAszu3jm4m7K8mI1UIhpNzZPINrG1JmjP4VVW1S5YKWBbZqcQMnxFNTnbSkKhSX51u2qxCW5dOhZVuMSiLtsXcVwvsSSE5pzHYNFkVNEK99nuFjhjRt7uQH4LpZBTr56o7HvxRvQ3iYR6Pi7g7HGDCyMMvencGznC7tGrzwPjUPDNCScdwNB+FQTBigVya6AjLXoZr9asLi6QWCHlySmLOslgcHFX55HfKOZSp7E0OZJTdfVwaNyX0BK7owVsEdNupVLk/6KBvkJZ3z5ZV0iTMiD81T2lKj4+C1ebbRMD8A9oJmtG5QYrHL96BKz96mcALZx8cxgQzCSsx6SkorLAZWNA16XxKf6IvmmBLTNJ4YL0Ib/N4d2hNMjnQRALejNAsxmaWIN9yv6maxE8FMuDei7hdCcRAmUMLq2vClQaP9t1tc6Oe4le9dUuyyIvQXg1QCG+uNTOPtm+gqGsEmVfySCZ32sN4yO3QncWksxlZ5Lcb0Vf8QqrCNDad6w3HAVC5xht3FDEfmEQtKsWpEXYX7uDNQpPjhWoZmDra/hFolz5IIh7RKHC9RQ+yZLCbO/cfbN7DVue1jSHgVobYSo021NBf5mRzSl9fMNjZ8TCE/9RrAryh4T7x7aRHFZofvkBcvShRey8IGm/D01FY9xZuAp6YAlKDpoXPFudr84hxIUMfY9HTQuHyELzXWM+s4H+Xh2ju3CGcuKkFhjk0ndVrOn4fJPUhj4LI0Csrb55IMlmz/QYc1mWZZ43Yyb/YYqtDEJxVJPEbuEN1YNVtKPzPz8PWVg3+6KRnI8N0vFUMzvfrmlTiTMJM++3veem4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(110136005)(70586007)(70206006)(316002)(16576012)(478600001)(40460700003)(5660300002)(36756003)(41300700001)(2906002)(31696002)(44832011)(86362001)(4326008)(8936002)(8676002)(31686004)(2616005)(36860700001)(83380400001)(81166007)(40480700001)(356005)(47076005)(26005)(426003)(336012)(82740400003)(53546011)(43740500002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 11:02:31.1640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caace06-1c8d-4aee-259c-08dbf581ad85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899



On 05/12/2023 11:42, Julien Grall wrote:
> 
> 
> On 05/12/2023 10:30, Michal Orzel wrote:
>>
>>
>> On 05/12/2023 11:01, Julien Grall wrote:
>>>
>>>
>>> On 05/12/2023 09:28, Michal Orzel wrote:
>>>> Hi Julien,
>>>>
>>>> On 04/12/2023 20:55, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 04/12/2023 13:02, Ayan Kumar Halder wrote:
>>>>>>
>>>>>> On 04/12/2023 10:31, Julien Grall wrote:
>>>>>>> Hi Ayan,
>>>>>> Hi Julien,
>>>>>>>
>>>>>>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>>>>>>> Currently if user enables HVC_DCC config option in Linux, it invokes
>>>>>>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>>>>>>>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>>>>>>>> an undefined exception to the guest. And Linux crashes.
>>>>>>>
>>>>>>> I am missing some data points here to be able to say whether I would
>>>>>>> be ok with emulating the registers. So some questions:
>>>>>>>     * As you wrote below, HVC_DCC will return -ENODEV after this
>>>>>>> emulation. So may I ask what's the use case to enable it? (e.g. is
>>>>>>> there a distro turning this on?)
>>>>>>
>>>>>> I am not aware of any distro using (or not using) this feature. This
>>>>>> issue came to light during our internal testing, when HVC_DCC was
>>>>>> enabled to use the debug console. When Linux runs without Xen, then we
>>>>>> could observe the logs on the debug console. When Linux was running as a
>>>>>> VM, it crashed.
>>>>>>
>>>>>> My intention here was to do the bare minimum emulation so that the crash
>>>>>> could be avoided.
>>>>> This reminds me a bit the discussion around "xen/arm64: Decode ldr/str
>>>>> post increment operations". I don't want Xen to contain half-backed
>>>>> emulation just to please an OS in certain configuration that doesn't
>>>>> seem to be often used.
>>>>>
>>>>> Also, AFAICT, KVM is in the same situation...
>>>> Well, KVM is not in the same situation. It emulates all DCC regs as RAZ/WI, so there
>>>> will be no fault on an attempt to access the DCC.
>>>
>>> Does this mean a guest will think the JTAG is availabe?
>> Yes, it will believe the DCC is available which is not a totally bad idea. Yes, it will not have
>> any effect but at least covers the polling loop. The solution proposed here sounds better but does not take
>> into account the busy while loop when sending the char. Linux DCC earlycon does not make an initial check that runtime
>> driver does and will keep waiting in the loop if TXfull is set. Emulating everything as RAZ/WI solves that.
>> As you can see, each solution has its flaws and depends on the OS implementation.
> 
> Right, which prove my earlier point. You are providing an emulation just
> to please a specific driver in Linux (not even the whole Linux). This is
> what I was the most concern of.
> 
> So ...
> 
>>>> In general, I think that if a register is not optional and does not depend on other register
>>>> to be checked first (e.g. a feature/control register we emulate), which implies that it is fully ok for a guest to
>>>> access it directly - we should at least try to do something not to crash a guest.
>>>
>>> This is where we have opposing opinion. I view crashing a guest better
>>> than providing a wrong emulation because it gives a clear signal that
>>> the register they are trying to access will not function properly.
>>>
>>> We had this exact same discussion a few years ago when Linux started to
>>> access GIC*_ACTIVER registers. I know that Stefano was for emulating
>>> them as RAZ but this had consequences on the domain side (Linux
>>> sometimes need to read them). We settled on printing a warning which is
>>> not great but better than claiming we properly emulate the register.
>>>
>>>>
>>>> I agree that this feature is not widely used. In fact I can only find it implemented in Linux and U-BOOT
>>>> and the issue I found in DBGDSCRINT (no access from EL0, even though we emulate REXT.UDCCdis as 0) only
>>>> proves that. At the same time, it does not cost us much to add this trivial support.
>>>
>>> See above. If we provide an (even basic) emulation, we need to make sure
>>> it is correct and doesn't have a side effect on the guest. If we can't
>>> guarantee that (e.g. like for set/way when a device is assigned), then
>>> the best course of action is to crash the domain.
>>>
>>> AFAICT, the proposed emulation would be ok.
> 
> ... I will need to revise this statement. I am now against this patch.
Yes, the problem was tricky from the very beginning and I somewhat agree. I prepared a POC with one solution
that Ayan extended and sent to gather feedback (hence RFC). I think we should still wait for others
opinion (@Stefano, @Bertrand). I think the thread contains all the necessary information
to decide what to do:
- do nothing* (guest crashes)
- emulate DCC the same way as KVM i.e. RAZ/WI (no crash, no busy loop, guest keeps using DCC with no effect)
- emulate DCC with TXfull set to 1 (no crash, runtime DCC in Linux returns -ENODEV, earlycon busy loop issue)

* I still think we should fix DBGDSCRINT but I can send a separate patch (not really related to the DCC problem)

~Michal


