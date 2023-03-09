Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2406B20E9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 11:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508217.782651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paD9d-0003mN-NO; Thu, 09 Mar 2023 10:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508217.782651; Thu, 09 Mar 2023 10:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paD9d-0003jb-JQ; Thu, 09 Mar 2023 10:05:45 +0000
Received: by outflank-mailman (input) for mailman id 508217;
 Thu, 09 Mar 2023 10:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ne43=7B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1paD9b-0003jV-R7
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 10:05:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1de577d-be61-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 11:05:41 +0100 (CET)
Received: from MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::21)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 10:05:37 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::12) by MW4P223CA0016.outlook.office365.com
 (2603:10b6:303:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 10:05:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 10:05:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 04:05:36 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Mar
 2023 04:05:35 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 9 Mar 2023 04:05:34 -0600
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
X-Inumbo-ID: f1de577d-be61-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJdmhdVh/VUPNmWTFVMgMqR9W7ys8W+5hsylO4/1/dxEn3iTrzmTGXzggX+vcxhlMgYdRRmxJ/NS5AwaFXQDmuii/wP8OxrfECNXsiXrzn2lug0fV65sdjKa6gl85ZDajtFy8SMC0LmyI6QHOky33wVK//wJ0Nm1E4Inbqt9taWH32nitEG2cEav2E7zQlolEXFFTqAdPc46M2oRO68FEk6uqeSfwict+MUDTJ9boWDCyixq2zEKJ+bkL3jd0TnywFvrN0Nq1u3ZAoilZAk2UL4N3pQ6h8qjB96ybdY0VC7APi7uvZfT87/N2tYx9dsPWZBjvYvdl+IMhQRhIy0UTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxMENOMNt4+EexvvRVYrPdDFcKix4pihgehM8puo24g=;
 b=gkUmlanH70MU8hIkpTecdhN2MlZJTwLtT6rtnhHCuNB4jC0nB7Oe8JnjNIc54z7sar3fYqhs/v0zdiJ7CFFZyOeezS83cTHFDFZnGsLORWUTzd5cX9Nr9Taj4xbllmwIHSR6iim9UJPOLIE1ojt67cMcDmnBK8989bf1yeemZlyWrhfgTem4trPmjx3D3zVPT6DgY3zAIDwww2xY1gvPXyrC51UF6U6i0R61mIcVs5geLgBDNgF8ThwmnBGC7HlQGubsUj8lvpXdn/GGnTmbkR03OR6OaDQVM2xUWpHglzH8XmNUBCrk+jWaCG5XhCfSlLzxwOO6W8L0QfTHd/8ZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxMENOMNt4+EexvvRVYrPdDFcKix4pihgehM8puo24g=;
 b=chNCERe2xHkAij7gUWv1H/boMxyWzpWO/b1m8rtya2n7S9bCaBvL748xVH00Dbzo4wYJxfrIczazPhcm/izHCJ9Ieq2y3uA77nAmN8J1Fjoc8GDSLhbC7CdCDhUm2b2dBMSH4Rypki7KXMGEXK+mhM7HTCeFE2XrijWyGLSCZ7M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
Date: Thu, 9 Mar 2023 11:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrei Cherechesu
	<andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: c47fa238-d9c6-44bd-c153-08db2085d462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ggl+fL+mCbUvC9gOzt/PUtl8coxPbMnPxLLrNRX0iHaxbeVcYukV5z0dgroHjfc6aRIg9Oi1fB2ezb7RNaQsgNG+0ZlAXkN7c5wZBz50c798u++SFmQ4lO17ED4v78IFRHRMPGMCJ1aamCdetBz/msygDNcjeuOi4Q+1bBbUJ1MyWi6tU4FULNJfS76fNWng9HMNzpWt6NAptnfkkzHBzv0Bobtf6DNzSdm/7c2SQ/PtGhBO0qKUfRlVbeWQJVJvCx5K7W/AQMevuhwhpqAQf5CPc/UQZrtGAwlznFV4GfS/d3fcAJ1fjv2+CVD3G/MBOjrht7v/gHVgzhBiM2SeKT0hMX15i+M57GtcdYpxMeeCT7tZog7isULjl09TnwsaNg4vTTupKJz+RALRbdm7It+zTaYnyw9yWRRfWPBdxkLeBwu0+e8wHnUTGOoINM2809fXtj3VSq7CSu04ThwUzWZEvSjnVYwvSAHwRnKC0GSO1+r2NB9gfZrY2WvwvEldx11CnryYczK29UxB8G1Icf1LTsEVOczLhMG67NEl8e2KlyZWXEpl6vjOd3sclbssImPlRTu9W1g9OVhnvP/jOhI30Hrz56ex95+88jvgW23OUFnFxt29fThiW8LFRWFTlI19uirpA/zU/YTXFbgGg4AQq+VStiS0B60skZ73X6fl+a2xlPgKcIaQWbDZU6dQhhxO863S+bwvECZkaVrm0qliW1YulBd2cJ5ylO4KzMpPHHimEmfyKNCYOlbjR+Nf0MB4JTD4pSR30SvWoeuIPQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(82740400003)(186003)(36860700001)(36756003)(478600001)(54906003)(31696002)(81166007)(356005)(86362001)(110136005)(316002)(16576012)(31686004)(82310400005)(426003)(47076005)(26005)(83380400001)(41300700001)(2616005)(336012)(40460700003)(53546011)(5660300002)(44832011)(40480700001)(70586007)(70206006)(8936002)(2906002)(4326008)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 10:05:36.7475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c47fa238-d9c6-44bd-c153-08db2085d462
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119



On 09/03/2023 09:02, Bertrand Marquis wrote:
> 
> 
> Hi Stefano,
> 
>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>>>
>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>
>>>> Added support for parsing the ARM generic timer interrupts DT
>>>> node by the "interrupt-names" property, if it is available.
>>>>
>>>> If not available, the usual parsing based on the expected
>>>> IRQ order is performed.
>>>>
>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>> not found, the hypervisor won't panic.
>>>>
>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>> ---
>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
>>>> index 4b401c1110..49ad8c1a6d 100644
>>>> --- a/xen/arch/arm/include/asm/time.h
>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>    TIMER_PHYS_NONSECURE_PPI = 1,
>>>>    TIMER_VIRT_PPI = 2,
>>>>    TIMER_HYP_PPI = 3,
>>>> -    MAX_TIMER_PPI = 4,
>>>> +    TIMER_HYP_VIRT_PPI = 4,
>>>> +    MAX_TIMER_PPI = 5,
>>>> };
>>>>
>>>> /*
>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>> index 433d7be909..794da646d6 100644
>>>> --- a/xen/arch/arm/time.c
>>>> +++ b/xen/arch/arm/time.c
>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>
>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>
>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
>>>> +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
>>>> +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
>>>> +    [TIMER_VIRT_PPI] = "virt",
>>>> +    [TIMER_HYP_PPI] = "hyp-phys",
>>>> +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
>>>> +};
>>>> +
>>>
>>> I would need some reference or a pointer to some doc to check those.
>>>
>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>> {
>>>>    ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>> {
>>>>    int res;
>>>>    unsigned int i;
>>>> +    bool has_names;
>>>> +
>>>> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>>>>
>>>>    /* Retrieve all IRQs for the timer */
>>>>    for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>    {
>>>> -        res = platform_get_irq(timer, i);
>>>> -
>>>> -        if ( res < 0 )
>>>> +        if ( has_names )
>>>> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
>>>> +        else
>>>> +            res = platform_get_irq(timer, i);
>>>> +
>>>> +        if ( res > 0 )
>>>
>>> The behaviour of the code is changed here compared to the current
>>> version as res = 0 will now generate a panic.
>>>
>>> Some device tree might not specify an interrupt number and just put
>>> 0 and Xen will now panic on those systems.
>>> As I have no idea if such systems exists and the behaviour is modified
>>> you should justify this and mention it in the commit message or keep
>>> the old behaviour and let 0 go through without a panic.
>>>
>>> @stefano, julien any idea here ? should just keep the old behaviour ?
>>
>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 because
>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 an
>> error.
> 
> Problem here is that a DTB might not specify all interrupts and just put
> 0 for the one not used (or not available for example if you have no secure
> world).
Xen requires presence of EL3,EL2 and on such system, at least the following timers needs to be there
according to Arm ARM:
- EL3 phys (if EL3 is there)
- EL1 phys (always)
- EL1 virt (always)
- NS EL2 phys (if EL2 is there)

therefore, if we get 0 for one of those, it means that something went wrong and we shall consider
it as an error.

~Michal


