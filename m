Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3567B7D73E0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623178.970756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjC5-0003ta-Ot; Wed, 25 Oct 2023 19:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623178.970756; Wed, 25 Oct 2023 19:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjC5-0003r3-M1; Wed, 25 Oct 2023 19:05:29 +0000
Received: by outflank-mailman (input) for mailman id 623178;
 Wed, 25 Oct 2023 19:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lpe5=GH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qvjC4-0003qx-7W
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:05:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 736b066c-7369-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:05:25 +0200 (CEST)
Received: from BYAPR01CA0028.prod.exchangelabs.com (2603:10b6:a02:80::41) by
 MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Wed, 25 Oct
 2023 19:05:21 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::a2) by BYAPR01CA0028.outlook.office365.com
 (2603:10b6:a02:80::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Wed, 25 Oct 2023 19:05:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 19:05:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 14:05:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 14:05:18 -0500
Received: from [172.30.200.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 14:05:17 -0500
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
X-Inumbo-ID: 736b066c-7369-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjTSg3OVBc5UMNOlZT7CJ+P6WP8Iag2ccSU9UaqGfSVSzibddmQuGqxrOwTPJNoDtjSjj4lKUmYA0ACr3jHmwRM0x9hWXedNOW+NiTDx11GfQLU8x0nPqP1akW/y1/7ryj+a6wN8UjGa2V1wBoTUZiA5hFT5A63OvxANKVCwWzfpDaQUW89xabzTcTHOu2zeh3R00drzaeHr55qBx5XqbBPjFr/b0Usokwmjs7fGGhhs+jc2mtukCFHjcmtakitpx6k82PqKMJXzwIy2Xv8wnZQQhvmo0NwQ8p53RBm1MPPP3DrbteZh0J29Yx23VNfvzeLH1MtpjjILwYjIgvAF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GyBg+1e6L/ffFNCJdal9z4iWPu4nC056FUZvUpZPuA=;
 b=N/EYDL0us6zmJ7H4rXPe6sVk2yveggvknbTyRES7qUeW1A5ydEf3WNFyvgA7uoLq30aYsu3SWobbwRYnuAcVGDmAqe+NXwio3G9VMV48w6h/16PMOKnK8c9vyi1Kf4nLSUmP5dSl5IUYRF+tp/YS/eozUzUmi0WAY69HK0h7eGvwrR2AjK1UJrHgaFMY+60ExUWrnt2ZAmvGIM2HK19GI47v9UfhG4WQ7GqSX7mgsY5ADYQFBeNlRMaE+crJOsN1Jyieq6o/hnhlS1jIImbLTrhqk5RxSkymNo1s2uDNkX7ffloN/8hKKQcYU9RVksqTSWGnNqWvSUavhxa9pKDDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GyBg+1e6L/ffFNCJdal9z4iWPu4nC056FUZvUpZPuA=;
 b=2w2dJ/zX4cLtNrys2riotz53NDXSrioFyfXwi33Ep8ZzpVSr+LsDW7zOLT7reoSPwO6H251148pFs2iwYZkQlbyTpSOy8rMcjUY5XQp4hw+0MhZngt5f2WTSmLHAJ8CFsQwu7d6UoZBaJGaYFOgTwac0un6Fh8om0hKlym/Ur34=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6fdaea2e-d6c8-4246-bd2b-7c08139e86fa@amd.com>
Date: Wed, 25 Oct 2023 15:05:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: pci: plumb xen_arch_domainconfig with pci
 info
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-3-stewart.hildebrand@amd.com>
 <5f69d9de-23af-429f-afa5-4623bedbb3ed@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5f69d9de-23af-429f-afa5-4623bedbb3ed@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: d31cb0d6-9fdd-41ef-2d91-08dbd58d55be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7Xgkpk3tN44CWC5K0E8VPuvu5ud6n4cgycMPU5LjliAbRoFzpplCyvXxF5fS7DWDk5mUCboYQEw0LJ4vBMq+9DOfQ5L8WTfIl0Fo5vZKoEP2OP1zPg9LD4R3R82KLezf2v2Rf2X8qSjovvT9KoiziT/8aEXpKGeUPw2piz1XVlAoLCbDb1o48L9beVbOS8t80sLrCRIntz8mpnecMgLbaVumzYi5ZaI1755+/kyBb5h/NHfF5hlpwxTIsWAMQoF8Llq9B2lldJhNUaemL039MxBcdFK5caUx4RUOG2Z+YYkCM5/oJklqcxVjCYGY0tymSJZfeMyUOwe8rl0nOv2aB4/QrWWjPR3ye7C+ljIB9D2ZWh+TC3XrB9ZJknnHrEFhXgLdF28bA+qtJme2dFOtlyc4z7HrP/kP1iONhzYD2BCSzqRhOQyDrpSVdLtjqNOXuroKgP//wrYIEII88U7JYk4fCtrCmNkIz0VaaxjsfjLnRyrDj7iRuwmSsei8AvkrRovklvztYXLGkQ9mX0Uif3ybOEbynLpyIahgy/8C3tB9sXI9QTmw5bJCJ+Z2KAIZTb8Dajq6SNq2gt2vpG+Q6pAnAsrarhmTcZH+DoZ0S67HU3PlF3ZM+TcX4XSGwmdeyDFCAn6jgV72PsPDI5oCILOH+YXOB22q3l975zTnvUrJOOxetfMkJc9H7J6S9PUfNCBvnPmUTRvxaE/kU6wzWeR1u6zbvK3ZbsYN0r7DyvCAqaRNsz1Ggh6KQf47DQrnNbHPDYjyrtl5jse3HwujGn8WBDESAFgNFNTjLWvTAi3oa+cRs9xolQBSUuVyNpG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(26005)(31686004)(2906002)(36860700001)(70206006)(41300700001)(44832011)(5660300002)(86362001)(40460700003)(7416002)(31696002)(4326008)(8936002)(8676002)(70586007)(82740400003)(16576012)(478600001)(110136005)(54906003)(81166007)(36756003)(356005)(316002)(83380400001)(2616005)(40480700001)(336012)(426003)(47076005)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 19:05:20.8064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31cb0d6-9fdd-41ef-2d91-08dbd58d55be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868

On 10/20/23 13:25, Julien Grall wrote:
> On 09/10/2023 20:57, Stewart Hildebrand wrote:
>> Add a flag to struct xen_arch_domainconfig to allow specifying at domain
>> creation time whether the domain uses vPCI.
>>
>> Add a corresponding flag to struct arch_domain to indicate vPCI and set it
>> accordingly.
> 
> The new boolean you are adding doesn't seem very arch specific. So could
> we use a bit in xen_domctl_createdomain.flags?

Right. Yes. Since x86 already has a vpci flag in xen_domctl_createdomain.arch.emulation_flags, I think the way forward is to move the x86 vpci flag to the common xen_domctl_createdomain.flags.

> 
>>
>> Bump XEN_DOMCTL_INTERFACE_VERSION since we're modifying struct
>> xen_arch_domainconfig.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v2->v3:
>> * new patch
>> ---
>>   xen/arch/arm/domain.c             | 10 ++++++++++
>>   xen/arch/arm/include/asm/domain.h |  2 ++
>>   xen/include/public/arch-arm.h     |  4 ++++
>>   xen/include/public/domctl.h       |  2 +-
>>   4 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 28e3aaa5e482..9470c28595da 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -687,6 +687,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>           return -EINVAL;
>>       }
>>
>> +    if ( (config->arch.pci_flags & XEN_DOMCTL_CONFIG_PCI_VPCI) &&
>> +         !IS_ENABLED(CONFIG_HAS_VPCI) )
>> +    {
>> +        dprintk(XENLOG_INFO, "vPCI support not enabled\n");
>> +        return -EINVAL;
>> +    }
>> +
>>       return 0;
>>   }
>>
>> @@ -737,6 +744,9 @@ int arch_domain_create(struct domain *d,
>>           BUG();
>>       }
>>
>> +    if ( config->arch.pci_flags & XEN_DOMCTL_CONFIG_PCI_VPCI )
>> +        d->arch.has_vpci = true;
>> +
>>       if ( (rc = domain_vgic_register(d, &count)) != 0 )
>>           goto fail;
>>
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 99e798ffff68..0a66ed09a617 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -119,6 +119,8 @@ struct arch_domain
>>       void *tee;
>>   #endif
>>
>> +    bool has_vpci;
>> +
>>   }  __cacheline_aligned;
>>
>>   struct arch_vcpu
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 6a4467e8f5d1..5c8424341aad 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -300,6 +300,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>   #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>>
>> +#define XEN_DOMCTL_CONFIG_PCI_VPCI      (1U << 0)
>> +
>>   struct xen_arch_domainconfig {
>>       /* IN/OUT */
>>       uint8_t gic_version;
>> @@ -323,6 +325,8 @@ struct xen_arch_domainconfig {
>>        *
>>        */
>>       uint32_t clock_frequency;
>> +    /* IN */
>> +    uint8_t pci_flags;
> 
> Regardless what I wrote above. Do you have any plan for adding more PCI
> specific flags?

No

> If not, then if you want to keep the flag Arm specific,
> then I think this should be named pci_flags.
> 
> As you add a new field, I believe, you also want to modoify the various
> language specific bindings (e.g. go, ocaml).

OK

> 
>>   };
>>   #endif /* __XEN__ || __XEN_TOOLS__ */
>>
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index a33f9ec32b08..dcd42b3d603d 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -21,7 +21,7 @@
>>   #include "hvm/save.h"
>>   #include "memory.h"
>>
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>>
>>   /*
>>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> 
> Cheers,
> 
> -- 
> Julien Grall

