Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4B7FF7BF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 18:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645096.1006946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kUr-0002Yc-Fn; Thu, 30 Nov 2023 17:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645096.1006946; Thu, 30 Nov 2023 17:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kUr-0002WW-D0; Thu, 30 Nov 2023 17:06:41 +0000
Received: by outflank-mailman (input) for mailman id 645096;
 Thu, 30 Nov 2023 17:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hl0=HL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r8kUq-0002WQ-4q
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 17:06:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0ed6909-8fa2-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 18:06:36 +0100 (CET)
Received: from CY5PR15CA0005.namprd15.prod.outlook.com (2603:10b6:930:14::18)
 by IA0PR12MB7752.namprd12.prod.outlook.com (2603:10b6:208:442::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 17:06:32 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:14:cafe::95) by CY5PR15CA0005.outlook.office365.com
 (2603:10b6:930:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23 via Frontend
 Transport; Thu, 30 Nov 2023 17:06:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 17:06:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 30 Nov
 2023 11:06:30 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 30 Nov
 2023 09:06:30 -0800
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 30 Nov 2023 11:06:28 -0600
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
X-Inumbo-ID: d0ed6909-8fa2-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hipbjfnuHKAPzu2pz6cNM/bUpPE4E6/q6urYnHDhewnj0GlekG8RLfLUHbgUOp7JeTNMejB815U3KbPeCmHT98tf8/UA1P1OILFG9dkJ4gDMbVupAR+9F9DsXPJxDGoUdJuE9LU9aa+VYEF5idrk5c+h+ZX6AZDD8nBgg8MGmSQg5fEK95eyvEnM4EKnEyx8xMY+m5A7ZcwJrErZgb0MTfTladciOnbacI0P+KC0pRRBz6+pEuvc+SuSzW1YEscSctScIhiW/84zIeifEOekflk++kEA5J/A8JaL3vC4QrXqSUSdFkF8ChLo4XS007UbfdwjItT4DHVuvMMZv0lcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9yv9IDk5DyS3cwk/afV9Gg+1N1Gnxr+EoG2hGG58K0=;
 b=a0ZsbafVNFxXEk4NBizck482TnWCoOfh59TubiwPBUsvv8BE2UgSO8YrOMznRScbmG4ddP4veKN6KXfkCEoCl7ga/z6ToXxDCptdkeI5ocojBC929FXrOyBmHOI4A1at2ErNaOMjvDsZH4GsE9QiW9isBxMj8a0sl238Sgjow7bc9oXa2Ta1VQFetP2sE+fy1XSzQVn/Chui7kp270Id6pij2E1OFHibM4bfTxwYBGrPMqc9RnGyQHZ0+qzyazDaIDTtEBDO5+cyvL+OuMiKv+9jqiXH30lcb3Hp7y2Sdv0SWMvEpNQtb9eFfaSWi/Ep+S6kNEj+Hud0720nofWpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9yv9IDk5DyS3cwk/afV9Gg+1N1Gnxr+EoG2hGG58K0=;
 b=XBUuHzo8pf+f85dYlqyCosrDtQx53klAlZ4JYX0rdqezKvNWQ60f5BMb46Gyg4KuzCKzs6+iv2KgQNBZiC8ooxiheOeSfeBmrUMG0ATeDg0X/0Ua9p514iOL/nT8k9Nu4QK/QTJbqjuahM0S3kfaQtqNRQw4LAGArjj4MDqHEVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cebd5aa5-d000-42c5-a224-dfc8775f5ba8@amd.com>
Date: Thu, 30 Nov 2023 12:06:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <8be3763f-a4b6-8962-9183-a2a9c3509726@suse.com>
 <a92b1717-965b-4767-8f11-4c3a4e03418d@amd.com>
 <4cf3d507-a76a-43b6-81c3-bee960e811f1@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4cf3d507-a76a-43b6-81c3-bee960e811f1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|IA0PR12MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ffd6c9-818f-4011-2cb1-08dbf1c6b33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QW305xDFaiyv86X97cUi5twTR+eJe5Nupta0cKpVCNs2tXDTGzWPeYzO/DvwFPsEKvNwmhUMNnf0cZLcDE/6o3lnwzjrQGvZXj4EXS844sFGikYhIkRGOKzgY6hGM+USVCfJQ1HoDmfkQTeeijm5pxcbPn1uJbBFnbk+FntM6E00HxnTTpl9ttpneR3szFtd8z0ulBCT3kQyvWdDaucJAREW//LoPFYru79GLM+QVGsphG0o9o16lbzMxKAaLrEX5wDTiyWVKwyAfwKRb6wCpuTbh2ODx5feVoVwAtaZ7eMUoX83nPXBhJ3Xsc2ESGPFMIewqQJEL5ddByCgp4FpZZLwNpT2KScs6Ktcjak2souR9PRLJYiTKXn1DtuoXZH5r53gmQbfh8b88IZzbXGaS81qHvNi7iaLV9TRg9XgF6g3ZKSLIZmEizCq1dW4IlLOfoPgM9wfcMQp4PBa+0PGm8+wIemY8zbprsiXN2zGFMhdD4InrE1oYQczjJybAnx3yoLmok2J24w0fYzZWrO7sIDEEMmBDgsW/j8vYSuPKvIgybcqNk4kHG5fd/P3XxUSzHOpJFMXBOD8rs4axIAAn27U0ipfq2IhWmea2zBX2kMCWlltHAaS2N4rJ28E+jdqnYmTTG3Vf/N48kORT3O28IRgo33Lt23Azv+ULMLbAcP87EWeLIOnaT9xzGkg+hwQbNzbxi9iwwXK8haDO987+8N6RWAMYpahvj6Mkaht1UUn9WcSntlVofRS+5+P7sDnmSBH8TkuwI+yUV8n5z2H3wK+9IluZOsO8mI2zaXFkChwuiHf1ueTMXOkpTzAS8Q9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(6666004)(2616005)(26005)(336012)(426003)(47076005)(478600001)(6916009)(36860700001)(2906002)(7416002)(44832011)(5660300002)(16576012)(41300700001)(53546011)(70206006)(70586007)(8936002)(8676002)(316002)(4326008)(54906003)(36756003)(356005)(81166007)(82740400003)(40460700003)(31696002)(86362001)(31686004)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 17:06:31.4781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ffd6c9-818f-4011-2cb1-08dbf1c6b33b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7752

On 11/30/23 03:33, Jan Beulich wrote:
> On 30.11.2023 03:47, Stewart Hildebrand wrote:
>> On 11/14/23 04:13, Jan Beulich wrote:
>>> On 13.11.2023 23:21, Stewart Hildebrand wrote:
>>>> --- a/xen/arch/x86/include/asm/domain.h
>>>> +++ b/xen/arch/x86/include/asm/domain.h
>>>> @@ -503,6 +503,8 @@ struct arch_domain
>>>>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>>>>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>>>>  
>>>> +#define arch_needs_vpci(d) ({ (void)(d); false; })
>>>
>>> See my comments on the v5 thread on both this and ...
>>
>> So, the goal here is to return true for a PVH dom0, and false otherwise (for now). Since dom0 can't feasibly be full HVM, and is_hvm_domain(d) returns true for PVH, how about the following?
>>
>> /* TODO: re-visit when vPCI is enabled for PVH domUs. */
>> #define arch_needs_vpci(d) ({                       \
>>     const struct domain *_d = (d);                  \
>>     is_hardware_domain(_d) && is_hvm_domain(_d); })
> 
> Looks okay to me, except for the leading underscore in _d (see respective
> Misra guidelines, merely re-enforcing what the C standard says).

Right. If I'm interpreting the standards correctly, it looks like a trailing underscore would work, seeing as we haven't adopted MISRA C:2012 Dir 4.5 (yet?).

> Of course
> the double evaluate_nospec() isn't quite nice in the result, but I guess
> this isn't going to be used in many places?

Only in XEN_DOMCTL_assign_device, as far as I'm aware.

> 
> Jan

