Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31235B3915
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404358.646805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeAg-00073j-Qt; Fri, 09 Sep 2022 13:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404358.646805; Fri, 09 Sep 2022 13:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeAg-00071n-O0; Fri, 09 Sep 2022 13:35:50 +0000
Received: by outflank-mailman (input) for mailman id 404358;
 Fri, 09 Sep 2022 13:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6+a=ZM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWeAf-00071h-4e
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 13:35:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f7f5049-3044-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 15:35:47 +0200 (CEST)
Received: from BN9PR03CA0631.namprd03.prod.outlook.com (2603:10b6:408:13b::6)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 9 Sep
 2022 13:35:43 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::3c) by BN9PR03CA0631.outlook.office365.com
 (2603:10b6:408:13b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 13:35:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 13:35:43 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 08:35:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 06:35:42 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 9 Sep 2022 08:35:41 -0500
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
X-Inumbo-ID: 4f7f5049-3044-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czGeS8hw/H+Wd8xCk5YTZuL+TnSO2edWGhs+C5NlqzEQGhMiyhTWnpHoH7sW6qCjZYVUI+TESxrqluchFTYq5vN+MtUf8IIrGA4InsHBuSaR1+EKrvJIPg8h2pdd+T37GaDa3HiTpeli7jgPga9KXosv700uF/vi6Jh3khxtKGhEnFcp1LtH22DASVgVaTL06EFKkUYpc5UjNA3UnaI0tRGThbooFV1650PmkfHdnUKBE4peF7640raxV8HjqKocyP4KohzVik/rS/CklIRNmqyLhQNCXyNK1B9QjzAWa6WIpYZaC3SPrQmkw0EtBHlAM9zPmiXYrcoRsd3DYjhovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTXaZa66l9Tvpto+JOENxDB9ttjjVJlV81dOMp4Hv1s=;
 b=Dc4p+2rTee2VTTnruc0HPpw3IVRScrfxkb546YMMwgBCeAKYYKbeiJbM4ojzt5oxe/hBNMV1aPdZC+nGyqL7fgbLTzOHiEC1Ieg9k8M23JHrPDbi8XxIFG3tWUWI9ioLMCk4/ZdUTsfmK6k8BdMTCSTuLvjxbt7eyrzGTEVbv/qK87MIIRU2v4lZWpdonR2pWg+fll9QGpDNrO28Z+kMH8iRhojctrioxwpoWLqU0pb+gtzrND8NxQrq0HVvTI0iSmma9QpxELp532v+550ehc80qqBuJ9KeMb2wDEhnrhy/qibjR4mdV0VTjRhRUl5ln2yji5blt8SJnImaz+TPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTXaZa66l9Tvpto+JOENxDB9ttjjVJlV81dOMp4Hv1s=;
 b=N/Rt1h0IBlMiwyZjZ3DNIW5jGl6vvGX0yiDv3oLklAFoEUPP328mNNeTgm2LynuK1sQPvfX9ma5xwZirqhHJBNRXgjapaZ5u/EirHoMkOaTUhQMiMZ53HRZ/KAHW/1N1po0aF09Z5vhTFgpsEC05Ze7Dv27ykpaw1xCMoITOzAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e75b8019-4513-126d-3e6e-f71f44a5f17c@amd.com>
Date: Fri, 9 Sep 2022 15:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Penny Zheng
	<Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
 <20220908135513.1800511-8-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
 <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com>
 <34ae5402-799e-1c43-7ab2-6e8935471cc2@xen.org>
 <CE6F0EC6-0DB9-47BE-90DC-09011D308FF2@arm.com>
 <FBA398EE-B1AD-4394-A357-6DFF77E374D9@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <FBA398EE-B1AD-4394-A357-6DFF77E374D9@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: ae069fad-813f-4038-8a54-08da9268318e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dm1dpBEJwP0Nthp5xrBrGtfinwNOZY2RHS/+tekZ/8tUJvCnQk26BWvm74fxliX3/1sFZi68S1dV6kgfQTXTEKhBRhFn0k+OUpU4s3rF8y/B8R0Zj7hmkWWjR7uPCYAtXD3EuSvQcEyohp/q1x56kz4XJExUHynAGC+vOX3ScfO5+NRDj4FiLzOW4FqN2UQfTqFYjhd6pfJ/pdJqFuA6tQTFjbzldH5EAeb2T+Wf15IO7fHXCMwqfRqikbJwshhaD9fT75zq8qGXKYPeLcKlSvind2U3ATpZ+YK0v6gEn8xNgclYp1ggB2/tzqJnpc31XvJM23sag/UZTn3LQK+MaIfOtX/4a1vATRgiblCukSd4QegULqx6w0vxTZb4dpt8XqggQ2g7FRwsumZ20Zc2JWaELUVX1z78b1RvcCQkdLrP1h7RKzUrwMTiPQoP5+ivurMYmamCPdr593RRK7GkhHvMavHW7FzsMoQOwtMuBGWCLYqftLcl3C7ZwHTSDWeoexEbGUaBO2/gXlSj5mBxKVyfsdlokcww0HZuXXA+jEZuPCoErL65c/zNRuOpMcwVlkxVCesvx25DYLAcKrLChFzHcCYD6jymyzuORH+JGnS6h9wjsQ3g7MteMW+K6iP29+DidqsNtvbi1xaCXnx7XdZSpVfwPLwDGfETMhzyruAm2e+i3wuevjiYrog93lxQav8KyOttU2izekd8AXMdwS/nqEswH2S/rtGU0rbbrsFwqAN1zhA23CWAuzjSNJMkoPT1NZCCD2PQuon9WyQABdyImva4feYHDDmQ6i8CKmNkPM1S7XDfEVZ0AcPUeTsepMVUp/hBlWYA7hfYAmqyB+UP55E+8KxJodJqwiMZ4O0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(356005)(2616005)(336012)(70206006)(54906003)(26005)(40460700003)(86362001)(186003)(426003)(36756003)(70586007)(31686004)(966005)(316002)(16576012)(47076005)(478600001)(110136005)(31696002)(44832011)(2906002)(81166007)(8676002)(41300700001)(8936002)(4326008)(82740400003)(36860700001)(83380400001)(40480700001)(53546011)(5660300002)(82310400005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 13:35:43.1400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae069fad-813f-4038-8a54-08da9268318e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112

Hi Luca,

On 09/09/2022 14:35, Luca Fancellu wrote:
> 
>> On 9 Sep 2022, at 10:40, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Julien,
>>
>>> On 9 Sep 2022, at 10:27, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi,
>>>
>>> On 09/09/2022 08:45, Bertrand Marquis wrote:
>>>>>
>>>>> It should be:
>>>>>
>>>>> /*
>>>>> * TODO:
>>>>> *
>>>>>
>>>>> I think this is good to go. The two minor style issues could be fixed on
>>>>> commit. I haven't committed to give Julien & Bertrand another chance to
>>>>> have a look.
>>>> I think that it is ok to fix those on commit and I am ok with the rest so:
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> This series doesn't build without !CONFIG_STATIC_SHM:
>>>
>>> UPD     include/xen/compile.h
>>> Xen 4.17-unstable
>>> make[1]: Nothing to be done for `include'.
>>> make[1]: `arch/arm/include/asm/asm-offsets.h' is up to date.
>>> CC      common/version.o
>>> LD      common/built_in.o
>>> CC      arch/arm/domain_build.o
>>> arch/arm/domain_build.c: In function ‘make_shm_memory_node’:
>>> arch/arm/domain_build.c:1445:1: error: no return statement in function returning non-void [-Werror=return-type]
>>> }
>>> ^
>>> cc1: all warnings being treated as errors
>>> make[2]: *** [arch/arm/domain_build.o] Error 1
>>> make[1]: *** [arch/arm] Error 2
>>> make: *** [xen] Error 2
>>>
>>> This is because...
>>>
>>>>>> +         * - xen,offset: (borrower VMs only)
>>>>>> +         *   64 bit integer offset within the owner virtual machine's shared
>>>>>> +         *   memory region used for the mapping in the borrower VM
>>>>>> +         */
>>>>>> +        res = fdt_property_u64(fdt, "xen,offset", 0);
>>>>>> +        if ( res )
>>>>>> +            return res;
>>>>>> +
>>>>>> +        res = fdt_end_node(fdt);
>>>>>> +        if ( res )
>>>>>> +            return res;
>>>>>> +    }
>>>>>> +
>>>>>> +    return res;
>>>>>> +}
>>>>>> +#else
>>>>>> +static int __init make_shm_memory_node(const struct domain *d,
>>>>>> +                                       void *fdt,
>>>>>> +                                       int addrcells, int sizecells,
>>>>>> +                                       const struct meminfo *mem)
>>>>>> +{
>>>>>> +    ASSERT_UNREACHABLE();
>>>
>>> ... there is a missing 'return -ENOTSUPP' here. While this is simple enough to fix, this indicates to me that this version was not tested with !CONFIG_STATIC_SHM.
>>>
>>> As this is the default option, I will not commit until I get confirmation that some smoke was done.
>>
>> This is a case our internal CI should have gone through.
>> Let me check and come back to you.
>>
> 
> Hi Julien,
> 
> Thanks for catching it, in this case I can confirm that the problem was that we are building with CONFIG_DEBUG enabled, I don’t know why GCC doesn’t complain when
> you have __builtin_unreachable() in that function without any return value, it doesn’t even throw a warning. Could it be considered a bug in GCC?

This is not a bug. The documentation states what is the purpose of it even in case of functions returning type.
https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html

To sump up __builtin_unreachable generates code itself to return.

> 
> Building Xen without CONFIG_DEBUG instead shows up the error you found.
> 
> In this case this change will fix the problem, do you agree on it?
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8c77c764bcf2..c5d66f18bd49 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1439,6 +1439,8 @@ static int __init make_shm_memory_node(const struct domain *d,
>                                         const struct meminfo *mem)
>  {
>      ASSERT_UNREACHABLE();
> +
> +    return -EOPNOTSUPP;
>  }
>  #endif
> 
> Is it something that can be addressed on commit?
> 
> Cheers,
> Luca
> 
> 
>> Regards
>> Bertrand
>>
>>>
>>> Cheers,
>>>
>>> --
>>> Julien Grall
> 

~Michal

