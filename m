Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35246819009
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 19:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657094.1025784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfFv-0000DS-Pb; Tue, 19 Dec 2023 18:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657094.1025784; Tue, 19 Dec 2023 18:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfFv-0000AD-Mm; Tue, 19 Dec 2023 18:55:51 +0000
Received: by outflank-mailman (input) for mailman id 657094;
 Tue, 19 Dec 2023 18:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JZnh=H6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rFfFu-0000A4-6y
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 18:55:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384feedf-9ea0-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 19:55:48 +0100 (CET)
Received: from CH0PR13CA0052.namprd13.prod.outlook.com (2603:10b6:610:b2::27)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 18:55:43 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::fa) by CH0PR13CA0052.outlook.office365.com
 (2603:10b6:610:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.17 via Frontend
 Transport; Tue, 19 Dec 2023 18:55:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Tue, 19 Dec 2023 18:55:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 12:55:41 -0600
Received: from [192.168.153.23] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 19 Dec 2023 12:55:39 -0600
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
X-Inumbo-ID: 384feedf-9ea0-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCAaoQPz7UyOU+NdpaciepGIJYXYJMWA4ROLEutlAN2+se6M1JMujf80z6j2r2S43/mgfGjGysJEkFta8TR/GBFXtQMo7uXgTV1UvEikjiQNH9PLda1TO5aCzl5lYlIJRmKGIdMzq5SOUwGtyWPoEFAPxpcIygwNERKIzmi3IbC8RIuYwenU9yUsP4/qixZmkEXFPd8SKBOsSYS32I1HkpBrWc8yV9Px9JL1NASzGfInhVH6LMHYChEqFAN7ifU04F/y7zCTgzXLBthAPi0WAMgU1WOd6HdWd5/7e3Ycgp/QM4ty2mn51puQaUSxg0FmYCFGyR3ItZ7o5ecdethqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+T3dFiMzKE7MzhHJDKXbZ6gUKXuEOHFt5pbdWoq2TE=;
 b=IwKi+kjfTEO1Ct1jeJyV6YIJcvMs6CyLWHenumFewVXXgKO1JL0ETiLAh8D6a9GcA3AJiqjsC+7ubNVwIUzfSBxi9CP9vfp4UERWF0IO0QFykUOryoKwYTmLa6akjJkzqhU3fAoLGMR6IaMRaNEva5yl1D6feiNnJwSK2hSICLOkpoQ3S6jROsp++ypBrOvS6HsvZJEEsm6xq8l9Gm2ltN2Ut66Ms1bEM7WZjpENBCwomkn2GSwe83234XiXuz4ykd0K32g/oyqenNroxnTxYyTXCvEempXwOEV9qb/vflWByiwZtke38KWdigpBNB2mOu9X51yQ9xGffoff79BCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+T3dFiMzKE7MzhHJDKXbZ6gUKXuEOHFt5pbdWoq2TE=;
 b=EfU25fBgOUowgojEOQevmaN4xtQdo72yCkCsb/fQFWqdfv7wzM1vLY0GlHoE9kY+x9tBcHeAkXmdi/Y4pH67In/pEssM27pxx/6/HvpjYTw31DoctIh8p+jN3Saz9tzzdJbwAQa9m84D/RTouWv3uHQ2KkKySFIB8LUMd0pxq1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d9241e4b-ccae-45e6-a515-8a6f005a43e4@amd.com>
Date: Tue, 19 Dec 2023 13:55:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Christian Lindig
	<christian.lindig@cloud.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-3-stewart.hildebrand@amd.com>
 <da9eb6fe-3eaf-de9a-2790-79165ecfd917@suse.com>
 <e6019342-8e46-48c9-8211-26105c61fa52@amd.com>
 <3BA22E6C-F2AE-487D-AF2C-F9AE67E429D7@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3BA22E6C-F2AE-487D-AF2C-F9AE67E429D7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CYYPR12MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: e399e7b6-fa90-48de-4eab-08dc00c419b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XYDWC3XtgPAB+K9cvUcUSiGaYGTdHxesVAY11lVkPbtgo16Ou+pdEnBAoiCZtL0vkPrfftq6T3Mao25Wt1Pgf6gi3CKK4tbIamqWEOMYfyGIJv68ShsyIRaDFFdHjuxToMIgxRLbTkcf3ZoZWrFQBuP6BWa5PkvLUVNjM3L+PbVAhxnJ5QslxW5Jns4P3OwYw4SSj1rde9AkHNYat32ifRsom0L1FoueNd3jSfJVISSct3lJ5kQt7e8S1wLr9iS7Rv3a1uB+7CTLcRPU1UEsOofNOWuZKcT1d32774faPtH+17uWjbEXDtemeiYBpLYmSKZf/vzNFJteqtGB5YRwkzuocrBjuhoTJcp8wij3ktxmyrJmy2KvtufUQjZcQGYyZFndKXotJxet0cW+bWvnLsKuJbL0oDy325dZhFvHA9FOVSrvc/4GDCNXY07qjumn3pICus6p/2Zj+eWV2YzsG2PidEqeM0+74XuDc0pen7nzly2SXKKxq9qDF0HPcGuOHZ+VoIPa6+hANHql9hIO7BPRlc+u9OMUyGFnR2KEDVq11vWG3MilNcozE0U92oXQIgb36mlbwehlGgUYQM/UsUcrEP4hllgRkdC2/oSWBm7HJM8zRN0zZiShbwmhz+99csaALxYZ80m0/H06Gx3fGLYGEuSecBYcuVPKysFR7jD/zx261LkCSkvUo9mGXSOYHUTtqBilrOFU2dxrpdVmrrMFvzOlelbRUIe0B/68hCwaaKFiMKiuxDpKF4RnlaLEiQRmqpYcgTVf2NJFGIlnUg8zAsY2nf8dnd1qcSYc5Jo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(7416002)(41300700001)(31696002)(356005)(36756003)(81166007)(82740400003)(86362001)(426003)(336012)(966005)(40480700001)(26005)(2616005)(36860700001)(16576012)(70206006)(70586007)(54906003)(316002)(83380400001)(6916009)(478600001)(53546011)(31686004)(47076005)(40460700003)(44832011)(8676002)(8936002)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 18:55:42.4085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e399e7b6-fa90-48de-4eab-08dc00c419b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961

On 12/15/23 04:36, Rahul Singh wrote:
> Hi Stewart,
> 
>> On 29 Nov 2023, at 9:25 pm, Stewart Hildebrand <Stewart.Hildebrand@amd.com> wrote:
>>
>> On 11/14/23 04:11, Jan Beulich wrote:
>>> On 13.11.2023 23:21, Stewart Hildebrand wrote:
>>>> @@ -709,10 +710,17 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>>         return -EINVAL;
>>>>     }
>>>>
>>>> +    if ( vpci && !hvm )
>>>> +    {
>>>> +        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>>     return 0;
>>>> }
>>>
>>> As said on the v5 thread, I think my comment was misguided (I'm sorry)
>>> and this wants keeping in common code as you had it.
>>
>> I'll move it back to xen/common/domain.c. No worries.
> 
> I tested this patch and observed build failure when compiling the "x86_64” arch with
> "CONFIG_HVM=n“ option.
> 
> x86_64-linux-gnu-ld    -melf_x86_64  -T arch/x86/xen.lds -N prelink.o --build-id=sha1 \
>     ./common/symbols-dummy.o -o ./.xen-syms.0 
> x86_64-linux-gnu-ld: prelink.o: in function `arch_iommu_hwdom_init’:
> (.init.text+0x2192b): undefined reference to `vpci_is_mmcfg_address’
> (.init.text+0x2192b): relocation truncated to fit: R_X86_64_PLT32 against undefined symbol `vpci_is_mmcfg_address'
> x86_64-linux-gnu-ld: (.init.text+0x21947): undefined reference to `vpci_is_mmcfg_address'
> (.init.text+0x21947): relocation truncated to fit: R_X86_64_PLT32 against undefined symbol `vpci_is_mmcfg_address'
> x86_64-linux-gnu-ld: prelink.o: in function `do_physdev_op’: 
> (.text.do_physdev_op+0x6db): undefined reference to `register_vpci_mmcfg_handler'
> (.text.do_physdev_op+0x6db): relocation truncated to fit: R_X86_64_PLT32 against undefined symbol `register_vpci_mmcfg_handler'
> x86_64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `vpci_is_mmcfg_address' isn't defined
> x86_64-linux-gnu-ld: final link failed: bad value                

Ah, good catch. Before moving it, the flag was defined in xen/arch/x86/include/asm/domain.h:

#ifdef CONFIG_HVM
#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
#else
#define X86_EMU_VPCI     0
#endif

#define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))


With CONFIG_HVM not set, in xen/drivers/passthrough/x86/iommu.c, the compiler optimized out the call to vpci_is_mmcfg_address():

    if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )

After moving the flag, there are a couple of options to make the issue go away. I don't think #defining XEN_DOMCTL_CDF_vpci 0 in the !HVM case would be a good idea since that's a flag shared with the toolstack. We could change the definition of has_vpci():

#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
                     IS_ENABLED(CONFIG_HVM))

Or we could provide empty static inline definitions of vpci_is_mmcfg_address() and register_vpci_mmcfg_handler():

#ifdef CONFIG_HVM
bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr);
#else
static inline bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
{
    return false;
}
#endif

I don't have a strong preference for which way, but changing has_vpci() has a smaller diffstat, so I'll go with that for now. This is assuming that we still want to go with this approach. Given recent related discussions [1], it's possible we may not need a vPCI flag in struct xen_domctl_createdomain, but instead a flag internal to the hypervisor somewhere in struct domain.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-12/msg00212.html

