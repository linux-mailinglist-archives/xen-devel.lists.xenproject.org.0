Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225427DD4AA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 18:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625977.975818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxsWu-0006QC-Vq; Tue, 31 Oct 2023 17:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625977.975818; Tue, 31 Oct 2023 17:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxsWu-0006Nv-S8; Tue, 31 Oct 2023 17:27:52 +0000
Received: by outflank-mailman (input) for mailman id 625977;
 Tue, 31 Oct 2023 17:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcxJ=GN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxsWs-0006MN-P0
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 17:27:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceea6c3a-7812-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 18:27:48 +0100 (CET)
Received: from BL0PR01CA0031.prod.exchangelabs.com (2603:10b6:208:71::44) by
 PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 17:27:43 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:71:cafe::22) by BL0PR01CA0031.outlook.office365.com
 (2603:10b6:208:71::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 17:27:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 17:27:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 12:27:42 -0500
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 31 Oct 2023 12:27:40 -0500
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
X-Inumbo-ID: ceea6c3a-7812-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMnOs9FyU7Q4M7IAsK5+rNM/hzachtst7bEIMBM2Q30c5XCOSi4BObzY6LETJYxm50046iFSPpBpUEv1zjf4Kzat8TlRysqnG+CbljWpSwF+7DgEXJMnuz5pg/BnMApHlUNfeTWXvgYRZ2um9JV9jf+h7w2VirggJEfHBA3i7f9by6TcEh3U2U+Xxr56z+z2vPk9N5oznV/tvTxznmveklkX+hX4acWBFzZc49vlwFrekLM1e28Dbvdy8USEn8uqHfSzeIf4G5HVD3Dt3N1twN6V3pw25uwCq8babOGnmGMDLJZq+/3c8fTgC1DAYD2mBETlYHTzfK10SjFD4PMgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3WEKZwwfu0xIGzDPmizONxm5mXsAo7gSzzbMAxqafk=;
 b=feylBUbL+qmKM2GvkJrMApeVm7WVvft1MpbguWdy5BxeFN8s8kDwahrShsJeLBD/3x5WK1Te3g4PrSuU6UvKCgo+U5dAXMXkSB/2XVxQj18ILcKXgNa+M4ymyh94DvqeucsdQpnQssQPVpNbkxRd4zBxe1ULnsKJwpeCGpv97Qo7uFdDlvd0rA9UY4DFaFs4I+bTuqfZOP+Vo9F7fQLzqBTGDTzvmbUTB1PiqHLZoR/WRawgCdr52RxFSXV5/HXq1+hg4LhfC6AUPoZZTFlfSVq/LRt0UGRzPsscD9pwkEuN3QpatVrkYCuRIQscp/tf1YIt1m59ETAsgy13NuOvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3WEKZwwfu0xIGzDPmizONxm5mXsAo7gSzzbMAxqafk=;
 b=vz+7el5cXMnEDnpKx0ENPu1u76hdEW7Orw+uIEYqxV+k2qoWo8TQn5Q4gvi5EvAtFJcPsf/lyomxQ3o8hkSXwLclgKR+dPJU4nmznmPuKpTCmYDhcBCDbvoAEgHfUfO0O+PSiL0M+eaX6AjVAuq855v+p4Au2s/hHKpeAdMHuSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a3765f1a-a4c6-4e68-818b-f26821b6962f@amd.com>
Date: Tue, 31 Oct 2023 13:27:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>, Rahul Singh
	<rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <20231030235240.106998-3-stewart.hildebrand@amd.com>
 <1c27d0a7-f04d-32ff-05df-4da4c32bebdf@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <1c27d0a7-f04d-32ff-05df-4da4c32bebdf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: c1410a9f-f3dc-4017-6089-08dbda36b0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kScFElpUh8GGrJ3bVtsB5yxnCxNmXYp5zU5akV7AH6GWvNRvmK+5Qz7a5TiEjQ7ttWPrbTGrFJnsQkmru2jQRc+crx7qbaM6FKPOvkR2U9+G7oWO/cgFJv/Cp7jPZ+LWqeKEMbkTLPXFw8auV9HJ1Wo0Hp8QkQ3o5rak78gDehZQ+qXmPSVry9eb9lyvBx4G4p32z2OsyV2DuMJB6o1jCa5zbQDebO6J/agUBhwqJYw4fNiHCtPoYx9zxWn0yBa7MO9ta9Mszy9A5pZjuU9ND8kQD4SSNUPbcxCFZtvMlTGwaT1XwXMb64d64cWCXsSJSUmXFVv/462nlzJgiOCg8yTrMAuUIvsk0gUraNawvsczl676HMbpO82OFncmZjmAM7zhrK2ofBcUu6dnWI/9ewNcqyxGDX31ZpJVDG060Q8vUL961hS70xbPigK2N+bRpnbfqvGjTQb/gBcX3SH8UWFKQM6iPLLnf+aThCK05E/SJ30nF0f/eZAfVsDWCvLsDQxorY5XCXNLb7Rf7F+ekxD2vaWeYCD/OgyS5O+CQUrYGCrtz5hE5o8ZMNXqGBT3/zYJp6KOMQ2uGt2NFQPlWLaY7tI65wmvQVAf6cChHcSPeQlSnRbZCZHMQ3fu5rzGer8/JWKtDFp+VjobKJZtHKaPhDxH4V/N9wbeC4TnfLz/FrQrU/5J5ri1u2olmhDxIyJApwJ+EIbaptFHoypQGQQa/Dm/+KVBTbgPC6OBzVIni6+ZGd1TgHNP0Yb/XXbtF/+0/k5Uice8r6WA9CVniGlU0053Toddp90eY8vRyg4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(82310400011)(64100799003)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(6916009)(5660300002)(70206006)(70586007)(54906003)(2906002)(16576012)(316002)(7416002)(8676002)(40480700001)(966005)(478600001)(41300700001)(44832011)(8936002)(4326008)(31686004)(53546011)(2616005)(40460700003)(26005)(36860700001)(426003)(336012)(82740400003)(36756003)(86362001)(31696002)(81166007)(356005)(47076005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 17:27:42.9305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1410a9f-f3dc-4017-6089-08dbda36b0a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914

On 10/31/23 06:56, Jan Beulich wrote:
> On 31.10.2023 00:52, Stewart Hildebrand wrote:
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -607,7 +607,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>  {
>>      unsigned int max_vcpus;
>>      unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>> -    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
>> +    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
>> +                                   XEN_DOMCTL_CDF_vpci);
> 
> Is the flag (going to be, with the initial work) okay to have for Dom0
> on Arm?

Hm. Allowing/enabling vPCI for dom0 on ARM should follow or be part of the PCI passthrough SMMU series [1]. I'll move this change to the next patch ("xen/arm: enable vPCI for dom0") and add a note over there.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html

> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -712,7 +712,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>      return 0;
>>  }
>>  
>> -static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>> +static bool emulation_flags_ok(const struct domain *d, uint32_t emflags,
>> +                               uint32_t cdf)
> 
> While apparently views differ, ./CODING_STYLE wants "unsigned int" to be
> used for the latter two arguments.

OK, I'll change both to unsigned int.

> 
>> @@ -722,14 +723,17 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>      if ( is_hvm_domain(d) )
>>      {
>>          if ( is_hardware_domain(d) &&
>> -             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
>> +             (!( cdf & XEN_DOMCTL_CDF_vpci ) ||
> 
> Nit: Stray blanks inside the inner parentheses.

OK, I'll fix.

> 
>> +              emflags != (X86_EMU_LAPIC | X86_EMU_IOAPIC)) )
>>              return false;
>>          if ( !is_hardware_domain(d) &&
>> -             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
>> -             emflags != X86_EMU_LAPIC )
>> +             ((cdf & XEN_DOMCTL_CDF_vpci) ||
>> +              (emflags != X86_EMU_ALL &&
>> +               emflags != X86_EMU_LAPIC)) )
>>              return false;
>>      }
>> -    else if ( emflags != 0 && emflags != X86_EMU_PIT )
>> +    else if ( (cdf & XEN_DOMCTL_CDF_vpci) ||
> 
> Wouldn't this better be enforced in common code?

Yes, I will move it to xen/common/domain.c:sanitise_domain_config().

> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -892,10 +892,11 @@ static struct domain *__init create_dom0(const module_t *image,
>>      {
>>          dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
>>                             ((hvm_hap_supported() && !opt_dom0_shadow) ?
>> -                            XEN_DOMCTL_CDF_hap : 0));
>> +                            XEN_DOMCTL_CDF_hap : 0) |
>> +                           XEN_DOMCTL_CDF_vpci);
> 
> Less of a change and imo slightly neater as a result would be to simply
> put the addition on the same line where CDF_hvm already is. But as with
> many style aspects, views may differ here of course ...

I'll change it.

> 
> Jan

