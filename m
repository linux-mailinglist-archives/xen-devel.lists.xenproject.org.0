Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433D6B246D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 13:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508249.782731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paFbC-0001wW-RV; Thu, 09 Mar 2023 12:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508249.782731; Thu, 09 Mar 2023 12:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paFbC-0001uM-NQ; Thu, 09 Mar 2023 12:42:22 +0000
Received: by outflank-mailman (input) for mailman id 508249;
 Thu, 09 Mar 2023 12:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ne43=7B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1paFbA-0001uG-QT
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 12:42:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d28406b5-be77-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 13:42:18 +0100 (CET)
Received: from CY8PR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:4d::11)
 by DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 12:42:13 +0000
Received: from CY4PEPF0000C984.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::5b) by CY8PR02CA0006.outlook.office365.com
 (2603:10b6:930:4d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 12:42:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C984.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.15 via Frontend Transport; Thu, 9 Mar 2023 12:42:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 06:42:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 04:42:12 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 9 Mar 2023 06:42:11 -0600
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
X-Inumbo-ID: d28406b5-be77-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrcXdsXrf40zCw+uzvQFjV5YlNy5EPIK57WnrIOSIy5u1awY0GcHc/pUfeyLn1HWVJDpxlji9eDzH/GYldAnM0f7dYaisKWx5fyFfT0NIBmJIzbRqGyuPWzh7dB5Ig2fIfodn12jMtCzQQk+CE0g96oDMnx4UfoVnwqzqIB9380nrMAj5YatJFbaClWADohmjNnQt+8UuL4p+TGQYzJGCt1MJQyLmJZSWvSg3c0xeXD4eczcitfelFHRiSwe3utoASzV6wmKLlWTyaLkC4PffVSRYqcCgFx2Um4e3EtYbc0YGugT2YjEcjsZbD/G5AUG/c8M51as9ORkoxF0eearjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKX7wpwTW9K1ueTnKIiOUxZ0/sRF78bfCx6FXIEOYmA=;
 b=PdXVmlPyrbleq8wez+fT133DLdWHPvuzvH+Jypea6vZKCc0nntZUXyImQFx5aIS0Yzq+OnYEAz6oEU1EARcMVzS55mH05oC3bINwmtpknNDFmD7Ou8sUiJBTuqJFp4klmWuWfYvBadmXwWbLw2bcGHTCqiza1mwxRYuXI1e57a3jMztmX/sVqBFutj50ensHLClxUpA4JYByuyKkgCAMDi3g2ttlJuoQW/eNidDXnyTRFx/FMc8bn7MOJywzPajlbCAFuGnEpDRzzb4z/ERN55NRxYfQzA2Nl/WiGs1kicjdfIyRvD1QUH1idnSYejui+PR8sSGQCC0jZp285AQupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKX7wpwTW9K1ueTnKIiOUxZ0/sRF78bfCx6FXIEOYmA=;
 b=kEFt4JqS/WZ9RbNOQhy7drhqi67zlAQlvCYQDX2t0rptSK3K8wMWmEiAqCLC9lf/8s6iqH16Ma63OWY7rJikgQ+UO3NS9lUzX5CbbOLLyWYQSTC3ZnL0C4UadVoUuYqcgFk8qtm8DD8cfA76CJup/A0LsO8RuOD/6pYq/FYid04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <df481924-6fa9-cac3-f822-9ff51b0824fe@amd.com>
Date: Thu, 9 Mar 2023 13:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
 <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
 <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
 <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C984:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d047f5-8cdc-4dad-c3a7-08db209bb514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RQ4E583/9wHez0zmla/XMa92vEOA27VjzR6ng5Ihcn8ka8IrSIDx28szb0MiLXiNkjQWs51P1PqPqX+gFcE2COosed+2EGzGB3JUx6OAUXhzEEOqj56HRjDTmIWmvm3QN+3UzQuh7pZXDGnchxR3mFN258BbWRqK/o4rtHzYZaQiVobyBB6Kb1sdvGSjnLjzElrZYqT8eYbXKdWJMr1t5ZNnpEYJD+dDA39Mz4L6X97nJVfzHh2+93PhoXoFzlFMfmUT3ts4PUQ+W+jawN8J78/1JXADUAD0F9uuJPj3vfs0r/HYDi+5v+K5kuLMwRR9tHiZqdyxkWrF9HrNK4nIJRO28AX4/hJ8Zy0+LMAww9wFew51z340ZM5QKOVeuywkLME2m9uXiVlRkg6+wu2+zksgCI0evN6GCLugwUG0w6GEnfSvWgkRswhfpgGUMPnoaz/jPZj5FMp8SpkCsn8HXjZKGJNqIqLNIHX6aE0W0GGF6n5wK7QL/aA0nlqIIUB3Yq8gf/9MaYPirek7iZSGiOODyBREc4PFmcCee3sEfc2ycS5ERxF1C8SvHSRRD75zqSFlDmeUUEAgA/XMXqp18QzYWugpUA1YrsWGg4YQvrRHGZ8Lfveu/X108FHrUsfMNV+0phOL6kllznGfKlIjKZhUHlqT0m8sTELTCnCKUEwWgai3k+ynlzNLQSOvzN1uewGNjXME6iVx/NNtuc7DY0GAsIRXOl0O9KpMgqjeG8kzNv36SQpRrYmldfEXZcqTy7paaz+Ldiql7JGuVaavwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(70206006)(5660300002)(8936002)(31686004)(70586007)(8676002)(41300700001)(44832011)(6916009)(4326008)(2906002)(316002)(16576012)(478600001)(54906003)(426003)(47076005)(36756003)(36860700001)(26005)(53546011)(336012)(2616005)(82740400003)(83380400001)(31696002)(40480700001)(82310400005)(86362001)(81166007)(356005)(40460700003)(186003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:42:13.2019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d047f5-8cdc-4dad-c3a7-08db209bb514
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C984.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970

Hi Bertrand,

On 09/03/2023 13:19, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 9 Mar 2023, at 12:35, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 09/03/2023 11:39, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> Hi Stefano,
>>>>>
>>>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>>
>>>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>>>>>>>
>>>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>
>>>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>>>
>>>>>>>> If not available, the usual parsing based on the expected
>>>>>>>> IRQ order is performed.
>>>>>>>>
>>>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>>>> not found, the hypervisor won't panic.
>>>>>>>>
>>>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>> ---
>>>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
>>>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>>>  TIMER_PHYS_NONSECURE_PPI = 1,
>>>>>>>>  TIMER_VIRT_PPI = 2,
>>>>>>>>  TIMER_HYP_PPI = 3,
>>>>>>>> -    MAX_TIMER_PPI = 4,
>>>>>>>> +    TIMER_HYP_VIRT_PPI = 4,
>>>>>>>> +    MAX_TIMER_PPI = 5,
>>>>>>>> };
>>>>>>>>
>>>>>>>> /*
>>>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>>>> index 433d7be909..794da646d6 100644
>>>>>>>> --- a/xen/arch/arm/time.c
>>>>>>>> +++ b/xen/arch/arm/time.c
>>>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>>>>>
>>>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>>>
>>>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
>>>>>>>> +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
>>>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
>>>>>>>> +    [TIMER_VIRT_PPI] = "virt",
>>>>>>>> +    [TIMER_HYP_PPI] = "hyp-phys",
>>>>>>>> +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
>>>>>>>> +};
>>>>>>>> +
>>>>>>>
>>>>>>> I would need some reference or a pointer to some doc to check those.
>>>>>>>
>>>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>>>> {
>>>>>>>>  ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>>>>> {
>>>>>>>>  int res;
>>>>>>>>  unsigned int i;
>>>>>>>> +    bool has_names;
>>>>>>>> +
>>>>>>>> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>>>>>>>>
>>>>>>>>  /* Retrieve all IRQs for the timer */
>>>>>>>>  for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>>>  {
>>>>>>>> -        res = platform_get_irq(timer, i);
>>>>>>>> -
>>>>>>>> -        if ( res < 0 )
>>>>>>>> +        if ( has_names )
>>>>>>>> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
>>>>>>>> +        else
>>>>>>>> +            res = platform_get_irq(timer, i);
>>>>>>>> +
>>>>>>>> +        if ( res > 0 )
>>>>>>>
>>>>>>> The behaviour of the code is changed here compared to the current
>>>>>>> version as res = 0 will now generate a panic.
>>>>>>>
>>>>>>> Some device tree might not specify an interrupt number and just put
>>>>>>> 0 and Xen will now panic on those systems.
>>>>>>> As I have no idea if such systems exists and the behaviour is modified
>>>>>>> you should justify this and mention it in the commit message or keep
>>>>>>> the old behaviour and let 0 go through without a panic.
>>>>>>>
>>>>>>> @stefano, julien any idea here ? should just keep the old behaviour ?
>>>>>>
>>>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
>>>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
>>>>>> error.
>>>>>
>>>>> Problem here is that a DTB might not specify all interrupts and just put
>>>>> 0 for the one not used (or not available for example if you have no secure
>>>>> world).
>>>> Xen requires presence of EL3,EL2 and on such system, at least the following timers needs to be there
>>>> according to Arm ARM:
>>>> - EL3 phys (if EL3 is there)
>>>
>>> This might be needed by EL3 but not by Xen.
>> Xen requires system with EL3 and if there is EL3, both Arm spec and dt bindings requires sec-phys timer to be there.
>> So it would be very strange to see a fake interrupt with IRQ being 0. But if we relly want to only care about
>> what Xen needs, then we could live with that (although it is difficult for me to find justification for 0 there).
>> Device trees are created per system and if system has EL3, then why forcing 0 to be listed for sec-phys timer?
>>
> 
> Let's see that on the other angle: why should Xen check stuff that it does not need ?
Because apart from what it needs or not, there is a matter of a failure in Xen.
Xen exposes timer IRQs to dom0 as they were taken from dtb and allowing 0 for any of the timer IRQ would result
in a Xen failure when reserving such IRQ. Xen presets SGI IRQs, meaning bits 0:15 in allocated_irqs bitmap are set.
This is why when calling vgic_reserve_virq and passing SGI always results in calling a BUG().

So we have two options:
- panic earlier with a meaningful message when IRQ is 0
- let Xen continue and reach BUG which would be not that obvious for people using but not knowing Xen

I think first option is always better.

~Michal

