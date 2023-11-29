Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FDA7FE1C1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 22:26:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644244.1005045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8S3g-0007Mm-Av; Wed, 29 Nov 2023 21:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644244.1005045; Wed, 29 Nov 2023 21:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8S3g-0007JR-7F; Wed, 29 Nov 2023 21:25:24 +0000
Received: by outflank-mailman (input) for mailman id 644244;
 Wed, 29 Nov 2023 21:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uyrv=HK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r8S3e-0007JJ-Cl
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 21:25:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe13da8-8efd-11ee-98e4-6d05b1d4d9a1;
 Wed, 29 Nov 2023 22:25:20 +0100 (CET)
Received: from SA9P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::29)
 by LV2PR12MB5992.namprd12.prod.outlook.com (2603:10b6:408:14e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 21:25:14 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::e0) by SA9P223CA0024.outlook.office365.com
 (2603:10b6:806:26::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Wed, 29 Nov 2023 21:25:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 21:25:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 15:25:13 -0600
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 15:25:10 -0600
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
X-Inumbo-ID: cbe13da8-8efd-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC8j6yJeHLHLP/JXlQWqrZMm5tM7Oq+HNM+94GkIOI8mFlgr9YRP0jvLBM25cXmeC5CMazjsxM3svwBZSL20nppps44SUIzTWPA5X9fn5RQFNAPD9SzYX4rSPgpheYb5xo+4ZXv1OFdGqBBGDv7nA9hb6z2txtMGpPo2RcNEcFxqeI8xlN5zlAKUIFKJ5a731UYfkdc5qxaqzjsyW3vJ1dhcMStS2LmS1VIxzKcvmhN80yhGjfILLciMU9vH8P6D/cVYCCgvwrO7967mWI6ZnpVtlEHPJq+9w16DkK8gR0AxK8RkgTq9bSvbk7YGp3VVNaL+SsEz5lo8L7FHdRu3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTwAxKmxs+Q4Xpgd54ShO2z39QSwedi6ap1tpSP5ih4=;
 b=BbEC1N/LCAi0OIUHZmb21fthg4NcUaoJgECmeF5M32TtD6AzEeDntp5ElD3WmA+6EtBRR9ylhEtQVMauf4YApeU1K1u/Vi6NzmxD7uoAH18qd1ddTu35ERP0YLFYOFGUY7rGb1+oD2djxZ7BneVdeRIZRIaU9WRsANAYRRyqUthrU/Hm/E9YLTR0ddR+8saDsdtDLnDT9FAb7JyAp/7nlhi88joNUngIefhnZT0NpfIDxDyHzPaBfqS7eJYEYNajr5wEwWDMI2Ar2MYedjylJBTiGJyOkYF58JeMx2aXH1/K+9zfnYFJPvpgeG8tS+nsbzsBPb/q5LS53SGdCO6NSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTwAxKmxs+Q4Xpgd54ShO2z39QSwedi6ap1tpSP5ih4=;
 b=mGjzAGdMTFtZcU57x5CNxhfqLd5WcIJbL+pFYq7U/ugxCWu4VbaoNvp6q+e80hqFIK03jYOFQL0nfaF5N5mMUfGelodydaIyAKcz2pyPV7jiZzWKV0tKWV6o8n/8IGmk+y4xhLoA6zxfCOZA6PAG2LQm/yXgRbxxnxk2GM6kYqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e6019342-8e46-48c9-8211-26105c61fa52@amd.com>
Date: Wed, 29 Nov 2023 16:25:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Christian Lindig <christian.lindig@cloud.com>,
	<xen-devel@lists.xenproject.org>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-3-stewart.hildebrand@amd.com>
 <da9eb6fe-3eaf-de9a-2790-79165ecfd917@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <da9eb6fe-3eaf-de9a-2790-79165ecfd917@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|LV2PR12MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 565bbfce-675d-4d47-9423-08dbf121ad36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N+XQF/rtfBdPoZ3mf3VUlvI4OcfacGotXXkjxx7bZePiM6yR2LkFWMyf7gvuc+IcV1yWLweOM7+wgmn4J6yV9zQyZ5O2+RsIQ1q7ydnJ/w3Lm/eDUh2kObVjOJr6oiiSK7zgIp5/VOfMtCK8J/F55Yen+a90XeHdQA9UMQHzYcqxC0g4LWfRVkbG63F7BvbR5qpBV0DLQe8r+Osc0h6GmaiOu5P8Fmd8J/QEQUDjixam6RXQCIph73ttp2lcG+VfkgPNrWBgNIKCxcre+XSGUnko2c0Iry8TAXrArusGfnGEUENgRUIF35kh+RK4kZKs6ff+5eCdox97qmoLEx7wY2pCoSvrlcP46kyyMxxIIuqdMCH77Qd/ZXJYOJZM7EapJe9+bZy931fkGMNOg/yHSHz9xotHCsAYEgNwThJqJhHRYl3Y2g8t5WWcNxPDYDviar/KobDDbcM+D+jaIdh2U3UjCgAlPvv/GsnTkUypjnNRdZQQpHYKSxbGK8e1IxuBhM93xeTfd+7kAl6xE66DHMBUBexwwBlls6Qsem2JplPAN9eeLiDoav2kLa9KKQ/5/5AMXSS4US2NUPq0DpXFcb9O7nSkidZSF5MuResLRGcHXidRqaoxIHCCHGwxcQAuoeRTXN/IhgiCZGLQQDUMDIU+YB9YxbTVvs+HWswQGl+AYwyNwdXEdWG535KqfwVmAthOCoBJoZdPW5i7zwDe0OaGbATO0ZbEh58nKsapdXmajj6zDTdghes946iiGz+/FsBO5l7mSU6oIDbUp5u+rvwBJReiGEAsqSZc3FveI/31Iz3ZSo+6BvvxXrRzeLlDaGJR14i6EEBOscAXSrm5TFBbUuGWqgFxAMq9G/Vhl2I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(31686004)(40480700001)(426003)(336012)(26005)(2616005)(40460700003)(478600001)(356005)(81166007)(82740400003)(202311291699003)(31696002)(36756003)(86362001)(2906002)(83380400001)(41300700001)(44832011)(36860700001)(47076005)(53546011)(7416002)(6916009)(54906003)(316002)(4326008)(5660300002)(70206006)(16576012)(8676002)(8936002)(70586007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:25:14.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 565bbfce-675d-4d47-9423-08dbf121ad36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5992

On 11/14/23 04:11, Jan Beulich wrote:
> On 13.11.2023 23:21, Stewart Hildebrand wrote:
>> @@ -709,10 +710,17 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>  
>> +    if ( vpci && !hvm )
>> +    {
>> +        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
>> +        return -EINVAL;
>> +    }
>> +
>>      return 0;
>>  }
> 
> As said on the v5 thread, I think my comment was misguided (I'm sorry)
> and this wants keeping in common code as you had it.

I'll move it back to xen/common/domain.c. No worries.

> 
>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -283,15 +283,16 @@ struct xen_arch_domainconfig {
>>  #define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
>>  #define _XEN_X86_EMU_USE_PIRQ       9
>>  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
>> -#define _XEN_X86_EMU_VPCI           10
>> -#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
>> +/*
>> + * Note: bit 10 was previously used for a XEN_X86_EMU_VPCI flag. This bit should
>> + * not be re-used without careful consideration.
>> + */
> 
> I think a multi-line comment is drawing overly much attention to this.
> How about "Note: Bit 10 was previously used for XEN_X86_EMU_VPCI. Re-use
> with care." which I think fits in a single line comment.

Sounds good.

> 
> Jan

