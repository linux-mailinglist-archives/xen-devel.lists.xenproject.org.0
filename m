Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709DC2E42E4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 16:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59510.104463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktuTS-0005pD-VM; Mon, 28 Dec 2020 15:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59510.104463; Mon, 28 Dec 2020 15:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktuTS-0005or-S7; Mon, 28 Dec 2020 15:30:18 +0000
Received: by outflank-mailman (input) for mailman id 59510;
 Mon, 28 Dec 2020 15:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktuTR-0005om-7H
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 15:30:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7637a03f-c47e-46c8-8754-2e68afcdfeaf;
 Mon, 28 Dec 2020 15:30:15 +0000 (UTC)
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
X-Inumbo-ID: 7637a03f-c47e-46c8-8754-2e68afcdfeaf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609169415;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qJtXPLIRJ/lXOtegCF8LL3vT9EHcKMmPEzSQwhLrEzo=;
  b=ZgkPEchyyqnKP1IvyH3SEDlO+MR3vuxPCU7/naQ6TGb3FRsQsmNl1QX2
   YS1OTsbHJHPJ3ptkes2AGuvbkWP/HRiB4Vh3c1TPdLYviSLfDx1e3lshe
   xMHSCwf6q399PptbW0iAVdcO4/FiXKvSzEEo4kB2E7n2Jr3UXQcnd/x51
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M5mIx2FO/v6I+rF/uDWZa4cu5D/JD4w/GOBMrLWfRmvTlEO86NttnTppZjbVDe4XtHKPwXudji
 asZLFWD+nWwPuL9lbBW9zKSd39qNo0Kk8f49Avs3ahODDovJmqtVJcGZs05E9xOwTtF6LA0Ata
 kFZvnmnVggilPGcuqqkAOgf+VTiS4DFbSqsc7pLrjI1EUDJoC1YsUak6eQFoYmXK5azko4FKZ+
 8KI9FT9OyNjOLbQeSxW0ynMwHsJsjtTpOVGHvlqYBO/B6FASq3fggQfIROpoM4futj2RjPwAoi
 L2A=
X-SBRS: 5.2
X-MesageID: 34029731
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34029731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlnbRgnC4IOXGSsc+H4f+bZ+Oj9UQR46ZqjTAaee7siuopugif+GTyG8iCTjw8NLXnpRuLPz9lmn81NSr/b1AgFnQx04SVRHHCI9YTxFWc/zegwm2fWH4GmJwn1CHj+PN8F2TC8jXupLsMLkcsWA0YgLeUvKwYsi9buQ/Rb9n2Gk9U9F6iX5rebWryQRFvG1uyRd2nnIQYJ0HEbSzMsybCmswOetwnKWZXtv3ZfRE+/mHOUSYnSMN85vRF4tgzBGyHoVF8uKp31cFj9CK0DBpnaYL9fHpLg77gIc64Dlim5AoeyIJVx8oH619bp/i4J40lrbfwildE3lJFGggY/yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1afBVWYWt1z+7ic+OajD7y46HOXxZMR6kiY1OGEmyw=;
 b=nwzF0Coso9mMklWs3HgtK2hYbPyZEmIq2lxmsto9p6wU9VjeWUjiLiu/Oi3EKMMZwXIcauFJL0AvJ0QKaWqjzHB2B0MQYBYOR9WlbU4HqXG8r9HTgIGWCKKMArRCP6fwL7cEjM3sXd/bRy3xtZeQMvVxg64zjwNuKx2QyERu5H37PtD4aT5mAPtApJpK5fpnirV6HZ8gIcNfmqdj1TGxnXZpP3DbX7ZwVAF5ofWi/JSo8/qbmv62Yb5GmDEmHRJg2nVrRHwNKPms+TJcPq6Rk1VAVOIg/a3aHn5eyiYAPL5r+nEHdSiC4y9QYCqw4J5uOqkvb/kPlf4RZTB8N8hGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1afBVWYWt1z+7ic+OajD7y46HOXxZMR6kiY1OGEmyw=;
 b=Amhf1b/nPsFHARbTsUF3eiku9HW07yphLctQAQAPYURLviiQ1GkJQnU+88Pnp1TPaRukrsCqO5OxsQ+IANiZLhBsH5g+Rx0GasrVT4biJU2NPjJ2jQSrLVoUd052cKuFApG+NKseIyGKPT5qWV/5cUEFUvdx7IfGuK03tmCOMdg=
Date: Mon, 28 Dec 2020 16:30:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
Message-ID: <20201228153004.qip3v6er5rk22fnu@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
X-ClientProxiedBy: LO4P123CA0334.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ac587c7-f228-41d2-5ffe-08d8ab4576f6
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55905D3A9B7C3CCF5A6A01CE8FD90@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +C+vRGc/BfsMBf9bBxcU5zcoxainPNxZKALX1Ew/4KsEdXTxIJn9FiuWeO5a/gQYPsGFPGmhriVHs+SKEkeSxKNv3bgIjX2bSZ6xz102JraJ3Ep51/VnHJjDIdi+azoMQC9dG7BM0nt0vuMaKV2NHppmPtn9zxQyFouOW4wytvwMVxosJDpeqItFUena0kKfm168r5KAqpOgS3DmXj/CKxAzrP71s7Pm3iRd3YLSaW2eh8x+D3Lcw2vH5404Yf9dKq3MgVz1Ru/YZq2JDELkLEjm17foSXOPy8ApFk91KAArF6++4acsYXwbRixJwqKS0t31CKHbB/A+DoFKnC6TDdam6c0X6pGP9Wk+2K9VkIcp57tlTg4OT4C/4/ZdgpNOd5b4RIat6FF3WbGH1JdfgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(16526019)(478600001)(86362001)(4326008)(6496006)(6666004)(6486002)(2906002)(66946007)(85182001)(1076003)(54906003)(66476007)(6636002)(5660300002)(33716001)(186003)(83380400001)(956004)(8676002)(110136005)(9686003)(8936002)(66556008)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDVERCtBSWhPRVZ2cnR4MW9QdENaUy9XNTdjaUh2OUs2dzdQUG5yVnZiU0Za?=
 =?utf-8?B?ai9sZnV6M1F6MzdUZEk2QTROSGpwZnoyVEZFbHMwcUVHWTErZGVoZHd2NHlh?=
 =?utf-8?B?K01ING5QWFd6QlRNK3h1UVNMTTZHQ3BqOWpwSnUrMlhDTnd5cm5EWHJkOXdL?=
 =?utf-8?B?ZGZpNTl1Z1NEUkQrYjNacmUvc2xJVEw2RWJvN2hyRzFJcllrKzBvZGtVaWhS?=
 =?utf-8?B?dlg5ZGhPT1FSRUQ1Y20wRk5RT1pZUGMydUNrZkt0bkxsN3FqckhpdkNPYk45?=
 =?utf-8?B?c0cyajBzbjJFYStOYTFVMWVzUlhKUWJWeU5Nc2x4KzdnUDJtazZvOVh0TVd0?=
 =?utf-8?B?dnRDa0ZkWmROR3VwVWtKU0hZR21kWnIyaTVQMFlRelVpMlRrZERvd0ltZ1Bz?=
 =?utf-8?B?TktISG00ZkFVZnVUeERZVFkzMUNLRnZYdDVsb1J5L0hTZmZnUkpJVStWa2t4?=
 =?utf-8?B?S3hsZVlMMi9EOHExQ0s5SmZDVTJoZjhtdDNrV2pFMGpETUpZZ3VLbityT0xP?=
 =?utf-8?B?Y0VwWTFZeFdPeS9wQWFFZ2VsZXpFTXE3SU1rVkpGaW9WOW1hOFFXMlBFM014?=
 =?utf-8?B?SHd6VStVdVdMZ1VZbHNCL2dxQTRKWWJsSERrbGxvSzFjMWhSSW85VmxXMDRB?=
 =?utf-8?B?d2p1VnQwc3A1ck4xKzJGV0ZNWU9rR2RjTUc2eStBZU9aUE5pNUR6UU50VVVq?=
 =?utf-8?B?VnkwWjlJdG94VUZvUStqYW5HRjdBU1NGODZrTnRnZXBJMkFJc0hvemNQSFQ5?=
 =?utf-8?B?MlE0M0w5L25xdlEzQ2dpVmtxK09XbXM0S05MM0VCaFdEaEtLU2E3amF6djE1?=
 =?utf-8?B?K1FhUWFzRjNMSFgzcVJwQXRGd3BEeGpMcm5sakdKd0lOUXpkRkx1bGtVeEtP?=
 =?utf-8?B?YVVubXU3RFlyWUFXaVUyQS8reUt2YnJMLzdWTVZkcHpTMURNYlNtdmI5R1dk?=
 =?utf-8?B?eWVpeGNTNThud3FkSmltMUZBSnlhRmM2SlN2R2NNM2hlTWNwZlpoTzYzMGEz?=
 =?utf-8?B?QmxCaGFISFY2TWFzRUNVaDYvOTZReWlTN295YVpkNG10MDlMcXcrRDc0dUdt?=
 =?utf-8?B?R09PYTY1SjRMbjhPMmo5aHlhcHpROTZ2ZWRIbWVVL3luL0NGdkNKMXI3NXdX?=
 =?utf-8?B?c3NWRmY1UEJuQiswWW12SXR1L0xjMzFwQzZvU3Uwc0FxeFJIKzVQUkI4R0RZ?=
 =?utf-8?B?Tnl0VUZLa2FIcDlhNDA5aHcrbzF3cXpQKzFyVlVNa3pqdjYybkE3MUplNzlU?=
 =?utf-8?B?NkNlVEJ4dnJTWGxyMjdReEp4VDNsOVp3Wm1YMGllbXBMNU9iRTQ5YUtBQzRI?=
 =?utf-8?Q?yJDRkYeU9FnMEtOHTL88EjIbGVfayr6idC?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 15:30:10.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac587c7-f228-41d2-5ffe-08d8ab4576f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KI7tg9sxDS113NKCzyTlxDPfsXzW95Er7QxQBg0d7RIeS8fzUn5KDWbh6Us2sJGTRVXEWNMaTp/snDTMU083ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Wed, Nov 25, 2020 at 09:51:33AM +0100, Jan Beulich wrote:
> Except for the initial part of cstar_enter compat/entry.S is all dead
> code in this case. Further, along the lines of the PV conditionals we
> already have in entry.S, make code PV32-conditional there too (to a
> fair part because this code actually references compat/entry.S).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: I'm on the fence of whether (in a separate patch) to also make
>      conditional struct pv_domain's is_32bit field.
> 
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -9,7 +9,7 @@
>  #include <xen/perfc.h>
>  #endif
>  #include <xen/sched.h>
> -#ifdef CONFIG_PV
> +#ifdef CONFIG_PV32
>  #include <compat/xen.h>
>  #endif
>  #include <asm/hardirq.h>
> @@ -102,19 +102,21 @@ void __dummy__(void)
>      BLANK();
>  #endif
>  
> -#ifdef CONFIG_PV
> +#ifdef CONFIG_PV32
>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>      BLANK();
>  
> -    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
> -    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
> -    BLANK();
> -
>      OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
>      OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
>      BLANK();
>  #endif
>  
> +#ifdef CONFIG_PV
> +    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
> +    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
> +    BLANK();
> +#endif
> +
>      OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
>      OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);
>      OFFSET(CPUINFO_current_vcpu, struct cpu_info, current_vcpu);
> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -29,8 +29,6 @@ ENTRY(entry_int82)
>          mov   %rsp, %rdi
>          call  do_entry_int82
>  
> -#endif /* CONFIG_PV32 */
> -
>  /* %rbx: struct vcpu */
>  ENTRY(compat_test_all_events)
>          ASSERT_NOT_IN_ATOMIC
> @@ -197,6 +195,8 @@ ENTRY(cr4_pv32_restore)
>          xor   %eax, %eax
>          ret
>  
> +#endif /* CONFIG_PV32 */

I've also wondered, it feels weird to add CONFIG_PV32 gates to the
compat entry.S, since that's supposed to be only used when there's
support for 32bit PV guests?

Wouldn't this file only get built when such support is enabled?

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -328,8 +328,10 @@ UNLIKELY_END(sysenter_gpf)
>          movq  VCPU_domain(%rbx),%rdi
>          movq  %rax,TRAPBOUNCE_eip(%rdx)
>          movb  %cl,TRAPBOUNCE_flags(%rdx)
> +#ifdef CONFIG_PV32
>          cmpb  $0, DOMAIN_is_32bit_pv(%rdi)
>          jne   compat_sysenter
> +#endif
>          jmp   .Lbounce_exception
>  
>  ENTRY(int80_direct_trap)
> @@ -370,6 +372,7 @@ UNLIKELY_END(msi_check)
>          mov    0x80 * TRAPINFO_sizeof + TRAPINFO_eip(%rsi), %rdi
>          movzwl 0x80 * TRAPINFO_sizeof + TRAPINFO_cs (%rsi), %ecx
>  
> +#ifdef CONFIG_PV32
>          mov   %ecx, %edx
>          and   $~3, %edx
>  
> @@ -378,6 +381,10 @@ UNLIKELY_END(msi_check)
>  
>          test  %rdx, %rdx
>          jz    int80_slow_path
> +#else
> +        test  %rdi, %rdi
> +        jz    int80_slow_path
> +#endif
>  
>          /* Construct trap_bounce from trap_ctxt[0x80]. */
>          lea   VCPU_trap_bounce(%rbx), %rdx
> @@ -390,8 +397,10 @@ UNLIKELY_END(msi_check)
>          lea   (, %rcx, TBF_INTERRUPT), %ecx
>          mov   %cl, TRAPBOUNCE_flags(%rdx)
>  
> +#ifdef CONFIG_PV32
>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>          jne   compat_int80_direct_trap
> +#endif
>  
>          call  create_bounce_frame
>          jmp   test_all_events
> @@ -541,12 +550,16 @@ ENTRY(dom_crash_sync_extable)
>          GET_STACK_END(ax)
>          leaq  STACK_CPUINFO_FIELD(guest_cpu_user_regs)(%rax),%rsp
>          # create_bounce_frame() temporarily clobbers CS.RPL. Fix up.
> +#ifdef CONFIG_PV32
>          movq  STACK_CPUINFO_FIELD(current_vcpu)(%rax), %rax
>          movq  VCPU_domain(%rax),%rax
>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>          sete  %al
>          leal  (%rax,%rax,2),%eax
>          orb   %al,UREGS_cs(%rsp)
> +#else
> +        orb   $3, UREGS_cs(%rsp)
> +#endif
>          xorl  %edi,%edi
>          jmp   asm_domain_crash_synchronous /* Does not return */
>          .popsection
> @@ -562,11 +575,15 @@ ENTRY(ret_from_intr)
>          GET_CURRENT(bx)
>          testb $3, UREGS_cs(%rsp)
>          jz    restore_all_xen
> +#ifdef CONFIG_PV32
>          movq  VCPU_domain(%rbx), %rax
>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>          je    test_all_events
>          jmp   compat_test_all_events
>  #else
> +        jmp   test_all_events
> +#endif
> +#else
>          ASSERT_CONTEXT_IS_XEN
>          jmp   restore_all_xen
>  #endif
> @@ -652,7 +669,7 @@ handle_exception_saved:
>          testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
>          jz    exception_with_ints_disabled
>  
> -#ifdef CONFIG_PV
> +#if defined(CONFIG_PV32)
>          ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
>              __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMEP, \
>              __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMAP
> @@ -692,7 +709,7 @@ handle_exception_saved:
>          test  $~(PFEC_write_access|PFEC_insn_fetch),%eax
>          jz    compat_test_all_events
>  .Lcr4_pv32_done:
> -#else
> +#elif !defined(CONFIG_PV)
>          ASSERT_CONTEXT_IS_XEN
>  #endif /* CONFIG_PV */
>          sti
> @@ -711,9 +728,11 @@ handle_exception_saved:
>  #ifdef CONFIG_PV
>          testb $3,UREGS_cs(%rsp)
>          jz    restore_all_xen
> +#ifdef CONFIG_PV32
>          movq  VCPU_domain(%rbx),%rax
>          cmpb  $0, DOMAIN_is_32bit_pv(%rax)
>          jne   compat_test_all_events
> +#endif
>          jmp   test_all_events
>  #else
>          ASSERT_CONTEXT_IS_XEN
> @@ -947,11 +966,16 @@ handle_ist_exception:
>          je    1f
>          movl  $EVENT_CHECK_VECTOR,%edi
>          call  send_IPI_self
> -1:      movq  VCPU_domain(%rbx),%rax
> +1:
> +#ifdef CONFIG_PV32
> +        movq  VCPU_domain(%rbx),%rax
>          cmpb  $0,DOMAIN_is_32bit_pv(%rax)
>          je    restore_all_guest
>          jmp   compat_restore_all_guest
>  #else
> +        jmp   restore_all_guest
> +#endif
> +#else
>          ASSERT_CONTEXT_IS_XEN
>          jmp   restore_all_xen
>  #endif

I would like to have Andrew's opinion on this one (as you and him tend
to modify more asm code than myself). There are quite a lot of
addition to the assembly code, and IMO it makes the code more complex
which I think we should try to avoid, as assembly is already hard
enough.

Thanks, Roger.

