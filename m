Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277AB7EA346
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 20:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631976.985775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2cFe-0002WN-8x; Mon, 13 Nov 2023 19:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631976.985775; Mon, 13 Nov 2023 19:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2cFe-0002UD-5j; Mon, 13 Nov 2023 19:05:38 +0000
Received: by outflank-mailman (input) for mailman id 631976;
 Mon, 13 Nov 2023 19:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2cFc-0002Sm-Ih
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 19:05:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d775a28-8257-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 20:05:32 +0100 (CET)
Received: from MW4PR04CA0328.namprd04.prod.outlook.com (2603:10b6:303:82::33)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 19:05:28 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::87) by MW4PR04CA0328.outlook.office365.com
 (2603:10b6:303:82::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 19:05:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 19:05:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 13:05:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 11:05:26 -0800
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 13:05:24 -0600
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
X-Inumbo-ID: 9d775a28-8257-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoGskbkWvri6yInXm9yZAjjy77NmITKsaLpg8cby9GSmDMeBzQ7M18J5qk2lapEUZEjcF1udKh82fFTu8wh0jVz+4uj38krkv4ULPBzd4jQtZGu1iM20Wza8VviaTEIJ5SIV5dbhv6TI9uvdfni6/BlDwksM05TNalWXQQWhRBMbr2VNQ+NTLxp6BMUZG/Wrff7Oiebs3Xmclj6e+k0mtJoI1ZaCgSw+IAZzLFOn/zauK7moc1h+0KgTTsZmblUyziVFsauPAzy2oTpyIvGUtR/oGUpHVit6ttJfi/wBr+dok9PNB5yIon+gdMDpYbXgz5IjXuWXnhNXeTWiXGUhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCe4eD9oaRB62GlGJ28XMi+rUooA+Gc1m8/hClXDXBM=;
 b=TIf+f3iLJi8qGJX4sUaaAh/63XnNCa+OUrlJnXfbPTTihg7+dglUEtu+zAXwydGCsQou4DuoBa640/tMiGzAvOG2TV00cCpKLO0qjhBDTWRelsmduj3gS1RrZs6AnswuQ9a0MD57rjbS9XOIvcfDWH/OPylj13oAlT5/+aq1HHcu+jawEHHadEsizS1i2t6cWArXvNL3mDevFOrsliFrCvN+R+SS4/cMrfZcbTY+qRcYCLkfmfbInB5jUfs6aWdBln9Om2ZbY8j5pa8hBF25u39gZzeJrfrDesBQyTmOzZWGQJrWmvUd2QEkJId2ErAuq/qXgfsGG7lLxLIOZJH03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCe4eD9oaRB62GlGJ28XMi+rUooA+Gc1m8/hClXDXBM=;
 b=XwRdcLyCRWRctxNkWv4kBgyrEItMGF/RHw/4xqfO5LMHKwvvpeBhyR+TiV0YqjDCgK7nq1YHrJ9JVXJKKENHouJdsO00nGDKNJP+osx9OdharQIsUq0wVHgvhP473kA4HG8lqFxtkUtd4xfTB0OT8KytSX7H9MVS8lzpaPaYQDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8fdb7e15-d5a7-46c9-bcde-53e4adac1ade@amd.com>
Date: Mon, 13 Nov 2023 14:05:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Oleksandr
 Andrushchenko" <oleksandr_andrushchenko@epam.com>, Rahul Singh
	<rahul.singh@arm.com>, Christian Lindig <christian.lindig@cloud.com>,
	<xen-devel@lists.xenproject.org>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
 <20231102195938.1254489-3-stewart.hildebrand@amd.com>
 <3f949fae-da52-7a8d-ad87-8fe84eeba8a2@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3f949fae-da52-7a8d-ad87-8fe84eeba8a2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cfc274-aaab-44fe-6905-08dbe47b7fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nAqetug/1gpIrn/xK6poEozclY9rAbu4pwgzG9iYu7CgwRE4eRYGBeFV5stmeaFTUlp/7/IYWXy6nlwpuUYmzqR462OASHBOKbOjaG6NpY7czO4nm7mPrcGpZ636qp0nqIP7Fkg/WVbeuzZYjuNpWY47Xzw1z1eft9CpZmSiW8DogdE93BZTjIFZGGm/arM6zzCOW5wMUxara7oAcim83S72FvP9rk5DtGhIi5ZzIAdh95EwrEw+Q9a54cdGyDJB5Ojk0+MRgqhR3Sy81S6DPoQEvCuji3rhF+2MImHVRzNILf2W3e7NYH0aaHS5xnAtdtEspL13BZIkA3Hh9LuV/t+xJHt2ATcsg8QrZiKDeCX+Bcq8xcglnzYJ0w+nhejLNYkFSQH62ZXFU0Nf/bgPjcD6RAP/ooTElE1iL3+OXPE692Ua8tvy5sdfCKNuaQO6BZDSXBaM/NMpKnkaScEvFtNKt98vQAaSxoAgndpKJFfzJmpIJI29dUuc/6VWAfRLuvjEdQJabTGnDjOHjsTBcKwcLTzdpBCw3hk3kPDfaKmGiU1ht0J2Ot6+ijoYSlJj9rPd5YKP8ja8ApG4W2rzWRlGjTPWK4S3+d5mhaVUODZtfps8NMRmJXbUvgmOkY/u4cYLmHPuSaV2yQEJwPshFizaxQEpVzn3HpyPVCl3VjDjrbHIeRh9zw3Tor2pCRXwQhy/3UhouHYcLFim2XsavAAaHIsPFszZ5712lNG+oHiImj/rKUylUOiHQ6SuQhgDgU4VGtt+QLVJOUCVCopPobnYIKG/xF1iVT6ok5Fl8bs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(2616005)(26005)(336012)(426003)(47076005)(36860700001)(53546011)(83380400001)(7416002)(5660300002)(44832011)(2906002)(41300700001)(966005)(478600001)(16576012)(8676002)(8936002)(4326008)(70206006)(70586007)(316002)(6916009)(54906003)(40460700003)(81166007)(356005)(82740400003)(86362001)(36756003)(31696002)(31686004)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 19:05:27.6306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cfc274-aaab-44fe-6905-08dbe47b7fb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

On 11/13/23 08:26, Jan Beulich wrote:
> On 02.11.2023 20:59, Stewart Hildebrand wrote:
>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c
>> @@ -8,13 +8,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>  {
>>      switch(d_config->c_info.type) {
>>      case LIBXL_DOMAIN_TYPE_HVM:
>> -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
>> +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
>> +        config->flags &= ~XEN_DOMCTL_CDF_vpci;
>>          break;
>>      case LIBXL_DOMAIN_TYPE_PVH:
>>          config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
>> +        config->flags &= ~XEN_DOMCTL_CDF_vpci;
>>          break;
>>      case LIBXL_DOMAIN_TYPE_PV:
>>          config->arch.emulation_flags = 0;
>> +        config->flags &= ~XEN_DOMCTL_CDF_vpci;
>>          break;
> 
> Why all this explicit clearing of XEN_DOMCTL_CDF_vpci? I can't even spot
> where the bit would be set.

You're right, it's not being set currently, so no need to explicitly clear the bit here. I'll remove.

> 
>> --- a/tools/python/xen/lowlevel/xc/xc.c
>> +++ b/tools/python/xen/lowlevel/xc/xc.c
>> @@ -159,7 +159,10 @@ static PyObject *pyxc_domain_create(XcObject *self,
>>  
>>  #if defined (__i386) || defined(__x86_64__)
>>      if ( config.flags & XEN_DOMCTL_CDF_hvm )
>> -        config.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
>> +    {
>> +        config.arch.emulation_flags = XEN_X86_EMU_ALL;
>> +        config.flags &= ~XEN_DOMCTL_CDF_vpci;
>> +    }
> 
> Same question here then.

Same answer here.

> 
>> @@ -575,6 +577,18 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>  
>> +    if ( vpci && !hvm )
>> +    {
>> +        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( vpci && !IS_ENABLED(CONFIG_HAS_VPCI) )
>> +    {
>> +        dprintk(XENLOG_INFO, "vPCI requested but not enabled\n");
>> +        return -EINVAL;
>> +    }
> 
> Maybe flip the order of these checks? But I'm uncertain about the first
> one anyway: Isn't this something that needs deciding per-arch?

In v4, the equivalent of the ( vpci && !hvm ) check was indeed in xen/arch/x86/domain.c:emulation_flags_ok(), but it seemed there was a suggestion that it be moved to common code... See discussion at [1]. How about putting it back into xen/arch/x86/domain.c, in arch_sanitise_domain_config(), not emulation_flags_ok()?

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02345.html

> 
>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -283,15 +283,12 @@ struct xen_arch_domainconfig {
>>  #define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
>>  #define _XEN_X86_EMU_USE_PIRQ       9
>>  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
>> -#define _XEN_X86_EMU_VPCI           10
>> -#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
> 
> This, aiui, being the reason for ...
> 
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -21,7 +21,7 @@
>>  #include "hvm/save.h"
>>  #include "memory.h"
>>  
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> 
> ... this bump, I wonder whether nevertheless we wouldn't better leave a
> comment there to indicate that bit 10 better wouldn't be used again any
> time soon.

I'll add a comment (above, in arch-x86/xen.h)

> 
>> @@ -55,9 +55,12 @@ struct xen_domctl_createdomain {
>>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>>  /* Should we expose the vPMU to the guest? */
>>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>> +/* Should vPCI be enabled for the guest? */
>> +#define _XEN_DOMCTL_CDF_vpci          8
> 
> What is this needed for besides ...
> 
>> +#define XEN_DOMCTL_CDF_vpci           (1U<<_XEN_DOMCTL_CDF_vpci)
> 
> ... its use here? Imo like was done for vpmu, there should be only one
> new identifier. As an aside, there are blanks missing around <<.

OK, I'll fix this

> 
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -51,6 +51,9 @@ void arch_get_domain_info(const struct domain *d,
>>  
>>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>  
>> +#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
>> +                     IS_ENABLED(CONFIG_HAS_VPCI))
> 
> Aiui the IS_ENABLED() is wanted so where suitable code conditional upon
> this predicate can be eliminated by the compiler. Question is whether
> we can't achieve this by, say, overriding XEN_DOMCTL_CDF_vpci to 0 in
> such cases (without touching what you add to the public header, i.e.
> not as easy as what we do in xen/arch/x86/include/asm/domain.h for
> X86_EMU_*).

I had only added the IS_ENABLED() here due to some (unnecessary) related changes in the later patch ("xen/arm: enable vPCI for domUs"). I hadn't considered the compiler optimization aspect. I can understand the potential benefit, but I'm not ready to introduce such complexity at this time. I'm in favor of "simpler is better" in this case, so I'll change it back to how it was in v4:

#define has_vpci(d) (!!((d)->options & XEN_DOMCTL_CDF_vpci))

> 
> Jan

