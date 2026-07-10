Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJKCEEQZUWps/QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:09:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC073C792
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=KWePrekJ;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359614.1613113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDmL-0002wu-3g; Fri, 10 Jul 2026 16:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359614.1613113; Fri, 10 Jul 2026 16:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDmL-0002uE-0x; Fri, 10 Jul 2026 16:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1359614;
 Fri, 10 Jul 2026 16:08:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wiDmI-0002u3-GS
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 16:08:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiDmH-006o7b-CT
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:08:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5118f3-5cb7-0a2a0a5109dd-0a2a450ac5b2-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:08:37 +0200
Received: from [52.101.201.50]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a511903-ec7d-0a2a450a0019-3465c9325462-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:08:36 +0200
Received: from DS7P220CA0079.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::11) by
 SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Fri, 10 Jul 2026 16:08:26 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:8:259:cafe::29) by DS7P220CA0079.outlook.office365.com
 (2603:10b6:8:259::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 16:08:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 16:08:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 11:08:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 11:08:24 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 11:08:23 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8v1CTeZkXaxID60fuHbV3yr2RgBm1a305mnCKbu++r7TWRk40SOWaE2vfkWKRq1nuTGsbPFP9GJyB+MU87+yANuh2Kd8AJ6q52RHLo6gshSaV2bAKsjdAqbo4A4eMewm0Pdnn/p8Jvf0UZKJa9D7KfXzw91TBc2NvlgeWyKI2Ld+cK+YDDSk+A6TIU+kfH39L+/VPJjsLO48p3P0MpKhDmMRrpydTZKL5MXu91hG5C1/ncMpg1LKly8fg/rU3SfCACtG3UIHxlhgQsMJi4bUG8I50YEAIry1l3Wzfyvl3xgonWPp6WUVM1VF0cXDDxIPDHbZ5Agj1ot0tbxp0MaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9OADA1cNgoK6OKrhNzNUPutpeu3/dqCjn6Z/Yrmr80=;
 b=sf4DSubFZc9IXuK/XfRbaxtcyCx5kZjaDQTI/l7PE6aQ/U5JtjJN9T3XAH4obXphUH8OK9Y6h9WO0FYepuUtSnEHquuEFa9xIEY+NMakTgkZ7i5UJCntSkn4DNpfrkEWv01F43IfiOaqulcjuzI2qB9bLbXnSqXBZTu4gJgGoKZeV/z9DmrQqZ10nLBCpfzSUgjAAxd3XAvXOy7bfirAEaSkFI3cADqdAeFElSHVg9lmzAgOWxFqd3UANTNgHoY6XLY7L+xAZck17plX6r2TLfYK4UMMSyhxSYkdiO4U4DfmEO50Cru0olu5KLhUk5/O/hVDrULD6msDZkcx7pI7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9OADA1cNgoK6OKrhNzNUPutpeu3/dqCjn6Z/Yrmr80=;
 b=KWePrekJqxVcZCAPhuZRiKYlp9EEgCEYEkgWECS9+ClzgL2Pz4CQdukOSjr3iIcPLyiSwlcldSuuiU9H2YgvAgp3W/Zui9rgaAENOqFhDWhS4FOEyJIbBv3zPVEjSOp2MUEELmD3bYusLyi9+/DwDH/LQKbQtyQFaPkirkZVxKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5dd152dd-c70e-4979-9ff4-8bb027bb2da6@amd.com>
Date: Fri, 10 Jul 2026 17:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm/mpu: Save/restore VTCR_EL2 on vCPU context switch
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-9-luca.fancellu@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260420142524.1804073-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdf5ac7-f3fa-43cd-2125-08dede9d7960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	08hlzuvB5Gwa17PKbLUBHHFVe/e4/G/CmAbcqIvspEDH+DxRZ+eZeu8h0hGD+ooZvYtM8aPmBa384lKBs6ObccgqPo73d5gvxYjj7zn4kXPXDZ0jRyXBFWKQtv350UtGltDnonZ5FrxZ5l9V7XsC15jhgCFTvz4xnhN1SqqRIwdJU5tYNiCC5UFbAL3EuEOIw+DcrZQLuWz3n/2Q05Qv27SxYllIVaaptXepIjAlT5sFjyBmXi1MDCZGOOssK6tFiCYMP4rvn/6CS1jLRy4P/7zgKlmuL8UiLzWANQFwW0cC/gcSH3yChLJZAsYuhSgDhh7dwAVDuzLU5o0MIYGSJscD+lFOFv8t22GStAGOC/CUuHqHKmbEwCu7KFeLdpD5pXhSyMwDUIPSq3iNC0sp2XqJNjox1EwTC09haiv/er9Bqe3N7jwbveZZz20YrUCmz4JwSO56p12mGXLLNNy7HOb+3LedVenDYtSIR1TNJh/+KiMFF/qWTTApFbH+ixNeCt02KO5on/myklLvaenWpkR1Nl0w7a9S1esOT5nEpWL7u0jxLuGijF28mmtaY0EBjubKQzIYYdP0t1lKmUHqX2l2TuFR9r2oVaXFPOdl1DeojbhzM9oO4hscowvzR6FGPl3IDJZOFgTDkL0SyP/HmD0BIaVriYWw66aBXsYAJW7/Gj9gNllZ0RelJETPSKhD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TMMFRNTPTNhn2OGTWt5Sqvt4S1qcCoeLtieRzV5jGVW8BDIt00tPfx/7UAG2VvtZMXiWqFmtlFJ+jtVraY8UP+tA+3LKp7rRB7liLsahBBBAZMtiFVoT+3ZUmOSLFxS0KRJlPGxwYoXFDYZhI5bqYQXu3piWuOFFTAtmuNPQPqY/JL8/zGJ/L+uMaf4huD7qFGiPPAxoy5LAViQZBRCocvQ8yd4dF3cYHcdWetWnlmy+9t2u8zJmB/HdmHArnINIk5/GOpjofnk2mwB2xSn2+8HltHs/s+/ejvz7cRfr/m7pw7FqJpPNY1RtgKzhoaol3JrOwSXlxZSjsNGStRX9p4El4yG7EbXLpWSRd5BU3diz02ARQxCTfw4rR5sbcwzDnLd3Y35hiSB5RnjuScfUc8kg7LUOdbBfhCsrnJttchF7s2zzWxDzheAjs1mo33sr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:08:25.9879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdf5ac7-f3fa-43cd-2125-08dede9d7960
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048
X-purgate-ID: tlsNG-4011c0/1783699717-3FB65248-B857455E/0/0
X-purgate-type: clean
X-purgate-size: 7566
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[amd.com:server fail,lists.xenproject.org:server fail,arm.com:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:from_mime,amd.com:dkim,amd.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75EC073C792

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:
> On AArch64 MPU systems, the VTCR register contains the MSA bit that determines
> if the guest is using MPU or MMU at EL1, which is required to be
> saved/restored on vCPU context switch.
>
> On AArch64 MPU systems the VTCR_EL2 register configuration will be saved
> during setup_virt_paging and will be placed in a new member of
> 'struct arch_vcpu' named vtcr_el2, to be retrieved by context switch.
>
> AArch32 MPU systems and MMU systems don't need to save/restore this
> register because they don't have any MSA bit and related functionality,
> so for these architecture a stub is provided.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/arm64/mpu/p2m.c                | 15 +++++++++++++++
>   xen/arch/arm/domain.c                       |  2 ++
>   xen/arch/arm/include/asm/domain.h           |  5 +++++
>   xen/arch/arm/include/asm/mmu/domain-build.h |  2 ++
>   xen/arch/arm/include/asm/mpu/domain-build.h |  6 ++++++
>   xen/arch/arm/include/asm/mpu/p2m.h          | 10 ++++++++++
>   xen/arch/arm/mpu/domain-build.c             | 17 +++++++++++++++++
>   xen/arch/arm/mpu/p2m.c                      |  4 ++++
>   8 files changed, 61 insertions(+)
>
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index a1ec9fcd6195..350cbd7ae94c 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -3,8 +3,12 @@
>   #include <xen/bug.h>
>   #include <xen/init.h>
>   #include <xen/lib.h>
> +#include <xen/sched.h>
>   #include <asm/p2m.h>
>   
> +/* VTCR_EL2 value to be configured for the boot CPU. */
> +register_t __read_mostly vtcr;
> +
>   void __init setup_virt_paging(void)
>   {
>       register_t vtcr_el2 = READ_SYSREG(VTCR_EL2);
> @@ -58,6 +62,7 @@ void __init setup_virt_paging(void)
>       else
>           vtcr_el2 &= ~VTCR_VS;
>   
> +    vtcr = vtcr_el2;
>       WRITE_SYSREG(vtcr_el2, VTCR_EL2);
>   
>       p2m_vmid_allocator_init();
> @@ -89,6 +94,16 @@ void __init setup_virt_paging(void)
>       panic("Hardware with no PMSAv8-64 support in any translation regime\n");
>   }
>   
> +void p2m_save_vtcr(struct vcpu *p)
> +{
> +    p->arch.vtcr_el2 = READ_SYSREG(VTCR_EL2);
> +}
> +
VTCR_EL2 is an EL2 register the guest cannot touch, and set_v8r_vtcr_msa()
already fixes each vCPU's value at creation. Reading it back on every 
save is
redundant
> +void p2m_restore_vtcr(struct vcpu *n)
> +{
> +    WRITE_SYSREG(n->arch.vtcr_el2, VTCR_EL2);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 221b1f8a7f9d..e928301d7cb0 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -538,6 +538,8 @@ int arch_vcpu_create(struct vcpu *v)
>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>   
> +    arch_set_vtcr_msa(v);
> +
>       if ( is_mpu_domain(v->domain) )
>           allocate_el1_mpu_regions(v);
>   
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 44c304ef8aa9..3ab004518427 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -203,6 +203,11 @@ struct arch_vcpu
>       uint32_t cpacr;
>   
>   #ifdef CONFIG_MPU
> +#ifdef CONFIG_ARM_64
> +    /* Virtualization Translation Control Register */
> +    uint64_t vtcr_el2;
> +#endif
> +
>       /* EL1 MPU memory regions */
>       pr_t *mpu_regions;
>   #endif
> diff --git a/xen/arch/arm/include/asm/mmu/domain-build.h b/xen/arch/arm/include/asm/mmu/domain-build.h
> index 3e0d9a6a2a08..0919c0097da9 100644
> --- a/xen/arch/arm/include/asm/mmu/domain-build.h
> +++ b/xen/arch/arm/include/asm/mmu/domain-build.h
> @@ -34,6 +34,8 @@ int arch_set_v8r_el1_msa(struct domain *d,
>       return 0;
>   }
>   
> +static inline void arch_set_vtcr_msa(struct vcpu *v) {}
> +
>   #endif /* __ARM_MMU_DOMAIN_BUILD_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mpu/domain-build.h b/xen/arch/arm/include/asm/mpu/domain-build.h
> index 463cd85b5b7e..8d3a743219ce 100644
> --- a/xen/arch/arm/include/asm/mpu/domain-build.h
> +++ b/xen/arch/arm/include/asm/mpu/domain-build.h
> @@ -15,6 +15,12 @@ int arch_set_v8r_el1_msa(struct domain *d,
>                            const struct xen_domctl_createdomain *config,
>                            unsigned int flags);
>   
> +#ifdef CONFIG_ARM_64
> +void arch_set_vtcr_msa(struct vcpu *v);
> +#else
> +static inline void arch_set_vtcr_msa(struct vcpu *v) {}
> +#endif
> +
>   #endif /* __ARM_MPU_DOMAIN_BUILD_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> index d0ec8a77a15a..1628148ba578 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -9,6 +9,8 @@
>   
>   struct p2m_domain;
>   
> +extern register_t vtcr;
> +
>   /*
>    * The architecture allows at most 255 EL2 MPU memory regions. The size of the
>    * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
> @@ -36,6 +38,14 @@ static inline bool region_is_p2m_valid(pr_t *pr)
>       return (pr->p2m_type != p2m_invalid);
>   }
>   
> +#ifdef CONFIG_ARM_64
> +void p2m_save_vtcr(struct vcpu *p);
> +void p2m_restore_vtcr(struct vcpu *n);
> +#else
> +static inline void p2m_save_vtcr(struct vcpu *p) {}
> +static inline void p2m_restore_vtcr(struct vcpu *n) {}
> +#endif
> +
>   #endif /* __ARM_MPU_P2M_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/mpu/domain-build.c b/xen/arch/arm/mpu/domain-build.c
> index 1bdd0ffedebb..19e504f7149e 100644
> --- a/xen/arch/arm/mpu/domain-build.c
> +++ b/xen/arch/arm/mpu/domain-build.c
> @@ -8,6 +8,7 @@
>   #include <xen/sched.h>
>   #include <asm/mpu.h>
>   #include <asm/mpu/domain-build.h>
> +#include <asm/mpu/p2m.h>
>   #include <public/arch-arm.h>
>   #include <public/domctl.h>
>   
> @@ -66,6 +67,22 @@ int arch_set_v8r_el1_msa(struct domain *d,
>       return 0;
>   }
>   
> +#ifdef CONFIG_ARM_64
> +void arch_set_vtcr_msa(struct vcpu *v)
> +{
> +    /*
> +     * When ID_AA64MMFR0_EL1.MSA_frac is 0b0010 (MM64_MSA_FRAC_VMSA_SUPPORT),
> +     * then VTCR_EL2.MSA determines the memory system architecture enabled
> +     * at stage 1 of the Secure EL1&0 translation regime.
> +     */
> +    v->arch.vtcr_el2 = vtcr;
> +    if ( is_mpu_domain(v->domain) )
> +        v->arch.vtcr_el2 &= ~VTCR_MSA;
> +    else
> +        v->arch.vtcr_el2 |= VTCR_MSA;
> +}
> +#endif
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index 06c92a3ef41b..b41abd8f2d37 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -357,6 +357,8 @@ void p2m_save_state(struct vcpu *p)
>   
>       p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
>   
> +    p2m_save_vtcr(p);
> +
>       if ( p2m_xenmpu_update(p2m, false) )
>           panic("Failed to offline P2M MPU memory mapping\n");
>   }
> @@ -369,6 +371,8 @@ void p2m_restore_state(struct vcpu *n)
>       WRITE_SYSREG(n->arch.sctlr, SCTLR_EL1);
>       WRITE_SYSREG(n->arch.hcr_el2, HCR_EL2);
>   
> +    p2m_restore_vtcr(n);
> +
>       WRITE_SYSREG(p2m->vsctlr, VSCTLR_EL2);
>       if ( p2m_xenmpu_update(p2m, true) )
>           panic("Failed to online P2M MPU memory mapping\n");
- Ayan

