Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0E3153CB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83328.154767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VqX-0006CD-4Q; Tue, 09 Feb 2021 16:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83328.154767; Tue, 09 Feb 2021 16:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VqX-0006Bq-1K; Tue, 09 Feb 2021 16:26:37 +0000
Received: by outflank-mailman (input) for mailman id 83328;
 Tue, 09 Feb 2021 16:26:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9VqW-0006Bl-0a
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:26:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9d83035-da87-454a-af58-61638f32ec3a;
 Tue, 09 Feb 2021 16:26:34 +0000 (UTC)
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
X-Inumbo-ID: a9d83035-da87-454a-af58-61638f32ec3a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612887994;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4iLr10S04cZJz58I01E6lZH5vzPhXXtXcjQatdrQgNE=;
  b=gzAT8c+gvjl2NOALSp3e666vEcPXqo9tX+ue7Up5W7kcCaohohV/dkCh
   mhuG1v3BsY1jMpWXG9ua0l9r0/KwfLRCc2Jrvv1fUQSrdEH40oorSRS1z
   gzYHIHsHS0ShwBQzhjwg9GEaNFUJNlQKcw+4xoupydP4Eevr1IEPiavA6
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H6feBqfnHyvXWcbo+4MFSKnqklO2CzvVyB4A9dHWrKCFJaB1DxdxoiZbS1bY+ggPmHdwbyazz3
 ypo/s+MXBTDQHcibGjlyFM/oi8j6lpCuC4gqM30N110eLmGU/mateChM7fCksgSRssMGBm4u5J
 xtk3PqN/lWECybNSN6ESTCCpIme7m8CqEYCabK6oXsjwDTSNJjG9eJQcn+02UboZHPYzUFeb+N
 WhhE82kRb+Atvupm7uAYtKInNIuJhEoTuwsAr4rJ7lfF4GiGpoikKdgPlCm25LOv5S2N9nNi49
 Qbc=
X-SBRS: 5.2
X-MesageID: 36875618
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="36875618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJE6xpilQ5kAFRI7Ebbu4Se2S2ZeOPabEwdGZr8lWcGQTGHy0nu/DkmpIpJUXo2DJpH4s69zYIn3SKExjengpcq3x/Iv33Ey4rB89nhXG/mfsBIAYXoCZKG2Dj0IfcOuYAydEg+m9p+Q8d9Y7WD4ntVT3793+SUPt3HOSqvO515udJMCMtRxf3q+W+ncp/KwE5C09KQs/2wkqQO2rxqGAwDxXXc2dDiEfvd+ZLEqry2TEcF5ssqbadKZH5FH6C8FWEo+Dem1sjmgOX8bXqg2vBiTdx1QoZHCGU8QCxW+6dBBPBdQi84k2RCBwIRYaxm7iMoImzoGoXqwuJ124x8P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Oje/ThS83Ub8f0kkwgIEombPtTAPzoJJioaG/TCiJ8=;
 b=KO2FEDyw9mbr+wCgrVpv2bP5VqnHfEFfWibbBrLlzh0AFepnOoC7KRLtNCNVhE89wUerzyxz7S9+HwLwdqIgKAS9jGtWR66rbBpO9JQV9VvywmXJTt3zyIK5Qge/dgyC7VssCB/2V/eRUu19kG7Cf1f7e92LIphA7ymDUITt0QjT33EgWit3kL31mCGQ7Iglg8zL9gtyuSOw49YHPeB3OYYiqrqthQgC0Cj9eVGqe5SunO8smwS1B01/zup4/JzfJbmMUCwGxnOEjxMJgSjpFJpdLgQ8yyhFfqzaNWcFlYDMhe8x8/u6CePXT0r0niGJDjgl/vgZkmXvh4LDGwrymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Oje/ThS83Ub8f0kkwgIEombPtTAPzoJJioaG/TCiJ8=;
 b=ubrdy0gNb7mAXTGksgUIcjHYyfCnlKcHKsYtuifwNs+nAJb3ZgHnEJmWH7K5tCF5b/6mCVoVriS5v/IC3ZTXDQgx9F26ghoePblmFtkmCWztVOq71Re0idCwkynveCVwbmYKE6O79UHd2VB7qIaBUuCzWXUTl7uX17zOj97XoKI=
Date: Tue, 9 Feb 2021 17:26:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
Message-ID: <YCK3sH/4EVLzRfZ3@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
X-ClientProxiedBy: MR2P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d004747-8fab-47d4-e57a-08d8cd17746b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2841:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB28413C69DD085EFE03D884D18F8E9@DM5PR03MB2841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mxbBmS8YLBzut3To4Pyp0e0C3wVZf+S6PhVA10kzSj2lETGJprQhzi3s2w+5bYjwhKPo2fwVUBR9NZ4tIjV9s/d5F996qYZWalj1NP+DYTjC0fuD1ANZdWGcC6ZgQciTMVwfOQTj4ecNnqJLCevCIAwI8fwHmHG01W1t51uXPwnKzzPCTj/52PEgLXE+HNCiDi2mc48c5sj2qxavWJqaNhMjlnGPg+5JkIRCUeVx1eyjY6/5MWI3mdCgaXOyJIPvYprdsEDusDpIU+7yRxQvsKA8wFW4dblfkXcqteVnOEe1nQE5H/7LinsB2MKyZP5NaZf2pj36Ikt6UCuWS4XGccWeDLhi3+VJcL/J67LHsNJBOQJoUVgutPAIweJsJ+FBXNyQrG4393JzqfPyUyA0oDLv5qLWruPpZ24OvysgNY+IZ40QvBguqz715CBY5yr6Q1Stt93VUWaINACsatV79DcXvmZ8v8FDXhy5734pjwSqcVXOLdiQo9GloACHRA4qPUKy+eSoylQ3iCCak+jsuVR7VudU85QYOgZIkJDR4sJq2gNFbEipQRe7YpNnAejZ0RSsrk0Av2BBvoQsDmFRzO8KP1vwrBSGZCvM5zVCSnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(107886003)(8936002)(86362001)(4326008)(66556008)(966005)(66476007)(66946007)(16526019)(186003)(9686003)(478600001)(6496006)(8676002)(85182001)(2906002)(33716001)(316002)(6666004)(54906003)(6486002)(6916009)(26005)(83380400001)(956004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2FoT1BMMWdFSFNpNzRYSzdlVWpFdE81WnAvSHo4b21nTkJTSVVFa25VQmhH?=
 =?utf-8?B?RzczVWtKeW56TTAyMC9lZkFFY3RRb2lwWllYYWJVVnJZTFIyTk9aL0xESkwy?=
 =?utf-8?B?WkNXekJ4TlhVWG9FU0xtbXU1UDJaMXM3a0lhaG41TklMVDlyQXNBQWJqLzh0?=
 =?utf-8?B?MXFYckJJMkRhNHZ2NTBkdEVCOEN0R1NoQW11UnZzeEV2MjhVR29vdHRPaXM2?=
 =?utf-8?B?eFBaYVkxcldIQ0NOSmVYTGlCVUF6ZVRwdkEybnp4VkR2eklzeHR1YkVOYitZ?=
 =?utf-8?B?bUx6d1ZkM1EyMllKdEVkVUZtVTRFNGlCUnZ4akVNUW9KWVZVcjVLZEdvWVJF?=
 =?utf-8?B?RjRucWcwU1U0ZTBTTC90MDUwMjE2ZFhubk5EZWE3S1RpRTZ1bXIxNFRuVXlO?=
 =?utf-8?B?RDNydmNFdi9DRFo5eEc4SmxUYUwwR25kY1R2T3RxdlhpN1VYOXVTR3JzR3ox?=
 =?utf-8?B?L2lmUzlNUmpSZms4eWJ0VWI5aE51YUpHNXZJSStob05hY1l1ODJKY2R1QzhS?=
 =?utf-8?B?WjdDTU5oZDhzMUtIZk1IQTVaRG5TVmZ3OXdicktqRTFTVzlhYmNoejBQcjl4?=
 =?utf-8?B?V05tUlAwazViZkhWam5pSjNnNlNBOUI2UCtXMHM5eC90WXZqaThaWWZDdVN6?=
 =?utf-8?B?WGFMSjRHTVY0cWtGSmpvK0Y2OFJIRHpqaUZDTjdlRXFpdVhnc0NmQWt4VDM1?=
 =?utf-8?B?SjE1bE83ZE5LakJTSTdEelpNYVJpcEpYN29LMlBCbkIwcHN6bjl3NmFyRitp?=
 =?utf-8?B?YjhoZ2pSd0hCNkdNbmJHWlhqNmtJUU05MHhJM1hSejVETnRKckNoWlk0NEtP?=
 =?utf-8?B?OEY5aXFpVGVBSi9kMks3RGk3NXNJZkFPSDRtdDZEMGRPYWVTTjhBb2wyeGFa?=
 =?utf-8?B?U0puWkg2Lzk0YzJRN2xsNUJkUVFiSDVxcEI5anVhcyt4SUp4ZG5YWjNJcEdm?=
 =?utf-8?B?a1Y1c1RzRkdrd2JLNVRwTEo1OWtNVjNFSWtKcksyT0JTVm13NzlqQW8wcmhQ?=
 =?utf-8?B?dFQwaEVhaC8wZnZZQ3FmUVlTaTNSaXlOdy93YXpZZW4zbVhXOStkT3hRdWhr?=
 =?utf-8?B?NFF1WVZwWm1jUW1nL0hBUTB3cnRXUE53NEY2SGsrdjNDUmhZOEMwaDZNSzdF?=
 =?utf-8?B?RVlRbEE5RXhBbUFCV0dhSytvK3FTL2dheVR5Tm9XdHlDVmdwT1hvOWk4S0Iz?=
 =?utf-8?B?TUVyQTdrVGRyQ3hpZjdtR3NVaEt3MkZMaTh2cW1HSFNzcitlK1JDVVczZmpX?=
 =?utf-8?B?aWJqVC9oQ3U4YjQ5eHpKMU1kS1d2bG5ML2g4QmROaGkyOXptamxUei9MSitU?=
 =?utf-8?B?VUY5dFI3L3ZCMmVCMkt1QXNkdVhmVTliVE1jTnJaRHNUWDRwVEg0RFR1TU5Z?=
 =?utf-8?B?SHNDWDNNZzIyeFRUSFhiZkVZQmJyRTgveFRxZ1djRGhtUE9sQzJNMVgxdjRB?=
 =?utf-8?B?OHFsaEQ3TlhPdkx5czRoakUxaU8rVGNub2Q4ejVNN3hIVmZzSVAvenNnSHJI?=
 =?utf-8?B?d0Y5Mm5EM2lsSUVvYU1PZkl2ZXVRY0E5V09sbjg0N2UwZGF3UzdSMUo1VTFr?=
 =?utf-8?B?RkQzNGJzNGM3MTlWKzRNZENqd1pabkRTYzlheEdoK0trRUNUcnpqaGZnOGdT?=
 =?utf-8?B?S25sTUlGQ01XRUROeTlzUDd0VnJrUytFdkRvRThKU054a3cvalVYSURIblQr?=
 =?utf-8?B?NGd6eG13N3AvVFlmbHpBZWdZSXJ0c3F6dDVsaDBDVmNlaldmTFdOWEJET29F?=
 =?utf-8?Q?j7vPFTDlAqFHgPemEUJ1FZC0Q5MjQU9h0F1/76+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d004747-8fab-47d4-e57a-08d8cd17746b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 16:26:29.5459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2/R1NBFS7zm45Vtd3155droaoe0CSC5w0E6EXObhg90p5DnMjWt8OnROnVG40/tAM1OfqtvUyRtVLaJ6weAog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2841
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
> Inspired by
> https://lore.kernel.org/lkml/f12e7d3cecf41b2c29734ea45a393be21d4a8058.1597848273.git.jpoimboe@redhat.com/
> and prior work in that area of x86 Linux, suppress speculation with
> guest specified pointer values by suitably masking the addresses to
> non-canonical space in case they fall into Xen's virtual address range.
> 
> Introduce a new Kconfig control.
> 
> Note that it is necessary in such code to avoid using "m" kind operands:
> If we didn't, there would be no guarantee that the register passed to
> guest_access_mask_ptr is also the (base) one used for the memory access.
> 
> As a minor unrelated change in get_unsafe_asm() the unnecessary "itype"
> parameter gets dropped and the XOR on the fixup path gets changed to be
> a 32-bit one in all cases: This way we avoid pointless REX.W or operand
> size overrides, or writes to partial registers.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The insn sequence chosen is certainly up for discussion; I've picked
> this one despite the RCR because alternatives I could come up with,
> like
> 
> 	mov	$(HYPERVISOR_VIRT_END), %rax
> 	mov	$~0, %rdx
> 	mov	$0x7fffffffffffffff, %rcx
> 	cmp	%rax, %rdi
> 	cmovb	%rcx, %rdx
> 	and	%rdx, %rdi
> 
> weren't necessarily better: Either, as above, they are longer and
> require a 3rd scratch register, or they also utilize the carry flag in
> some similar way.
> ---
> Judging from the comment ahead of put_unsafe_asm() we might as well not
> tell gcc at all anymore about the memory access there, now that there's
> no use of the operand anymore in the assembly code.
> 
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -10,12 +10,19 @@
>  #include <xen/sched.h>
>  #include <asm/uaccess.h>
>  
> -unsigned __copy_to_user_ll(void __user *to, const void *from, unsigned n)
> +#ifndef GUARD
> +# define GUARD UA_KEEP
> +#endif
> +
> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>  {
>      unsigned dummy;
>  
>      stac();
>      asm volatile (
> +        GUARD(
> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"

Don't you need to also take 'n' into account here to assert that the
address doesn't end in hypervisor address space? Or that's fine as
speculation wouldn't go that far?

I also wonder why this needs to be done in assembly, could you check
the address(es) using C?

> +        )
>          "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
>          "    jbe  1f\n"
>          "    mov  %k[to], %[cnt]\n"
> @@ -42,6 +49,7 @@ unsigned __copy_to_user_ll(void __user *
>          _ASM_EXTABLE(1b, 2b)
>          : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
>            [aux] "=&r" (dummy)
> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>          : "[aux]" (n)
>          : "memory" );
>      clac();
> @@ -49,12 +57,15 @@ unsigned __copy_to_user_ll(void __user *
>      return n;
>  }
>  
> -unsigned __copy_from_user_ll(void *to, const void __user *from, unsigned n)
> +unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n)
>  {
>      unsigned dummy;
>  
>      stac();
>      asm volatile (
> +        GUARD(
> +        "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
> +        )
>          "    cmp  $"STR(2*BYTES_PER_LONG-1)", %[cnt]\n"
>          "    jbe  1f\n"
>          "    mov  %k[to], %[cnt]\n"
> @@ -87,6 +98,7 @@ unsigned __copy_from_user_ll(void *to, c
>          _ASM_EXTABLE(1b, 6b)
>          : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
>            [aux] "=&r" (dummy)
> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>          : "[aux]" (n)
>          : "memory" );
>      clac();
> @@ -94,6 +106,8 @@ unsigned __copy_from_user_ll(void *to, c
>      return n;
>  }
>  
> +#if GUARD(1) + 0
> +
>  /**
>   * copy_to_user: - Copy a block of data into user space.
>   * @to:   Destination address, in user space.
> @@ -128,8 +142,11 @@ unsigned clear_user(void __user *to, uns
>  {
>      if ( access_ok(to, n) )
>      {
> +        long dummy;
> +
>          stac();
>          asm volatile (
> +            "    guest_access_mask_ptr %[to], %[scratch1], %[scratch2]\n"
>              "0:  rep stos"__OS"\n"
>              "    mov  %[bytes], %[cnt]\n"
>              "1:  rep stosb\n"
> @@ -140,7 +157,8 @@ unsigned clear_user(void __user *to, uns
>              ".previous\n"
>              _ASM_EXTABLE(0b,3b)
>              _ASM_EXTABLE(1b,2b)
> -            : [cnt] "=&c" (n), [to] "+D" (to)
> +            : [cnt] "=&c" (n), [to] "+D" (to), [scratch1] "=&r" (dummy),
> +              [scratch2] "=&r" (dummy)
>              : [bytes] "r" (n & (BYTES_PER_LONG - 1)),
>                [longs] "0" (n / BYTES_PER_LONG), "a" (0) );
>          clac();
> @@ -174,6 +192,16 @@ unsigned copy_from_user(void *to, const
>      return n;
>  }
>  
> +# undef GUARD
> +# define GUARD UA_DROP
> +# define copy_to_guest_ll copy_to_unsafe_ll
> +# define copy_from_guest_ll copy_from_unsafe_ll
> +# undef __user
> +# define __user
> +# include __FILE__
> +
> +#endif /* GUARD(1) */
> +
>  /*
>   * Local variables:
>   * mode: C
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -446,6 +446,8 @@ UNLIKELY_START(g, create_bounce_frame_ba
>          jmp   asm_domain_crash_synchronous  /* Does not return */
>  __UNLIKELY_END(create_bounce_frame_bad_sp)
>  
> +        guest_access_mask_ptr %rsi, %rax, %rcx
> +
>  #define STORE_GUEST_STACK(reg, n) \
>  0:      movq  %reg,(n)*8(%rsi); \
>          _ASM_EXTABLE(0b, domain_crash_page_fault_ ## n ## x8)
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -114,6 +114,24 @@ config SPECULATIVE_HARDEN_BRANCH
>  
>  	  If unsure, say Y.
>  
> +config SPECULATIVE_HARDEN_GUEST_ACCESS
> +	bool "Speculative PV Guest Memory Access Hardening"
> +	default y
> +	depends on PV
> +	help
> +	  Contemporary processors may use speculative execution as a
> +	  performance optimisation, but this can potentially be abused by an
> +	  attacker to leak data via speculative sidechannels.
> +
> +	  One source of data leakage is via speculative accesses to hypervisor
> +	  memory through guest controlled values used to access guest memory.
> +
> +	  When enabled, code paths accessing PV guest memory will have guest
> +	  controlled addresses massaged such that memory accesses through them
> +	  won't touch hypervisor address space.
> +
> +	  If unsure, say Y.
> +
>  endmenu
>  
>  config HYPFS
> --- a/xen/include/asm-x86/asm-defns.h
> +++ b/xen/include/asm-x86/asm-defns.h
> @@ -44,3 +44,16 @@
>  .macro INDIRECT_JMP arg:req
>      INDIRECT_BRANCH jmp \arg
>  .endm
> +
> +.macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
> +#if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
> +    mov $(HYPERVISOR_VIRT_END - 1), \scratch1
> +    mov $~0, \scratch2
> +    cmp \ptr, \scratch1
> +    rcr $1, \scratch2
> +    and \scratch2, \ptr
> +#elif defined(CONFIG_DEBUG) && defined(CONFIG_PV)
> +    xor $~\@, \scratch1
> +    xor $~\@, \scratch2
> +#endif
> +.endm
> --- a/xen/include/asm-x86/uaccess.h
> +++ b/xen/include/asm-x86/uaccess.h
> @@ -13,13 +13,19 @@
>  unsigned copy_to_user(void *to, const void *from, unsigned len);
>  unsigned clear_user(void *to, unsigned len);
>  unsigned copy_from_user(void *to, const void *from, unsigned len);
> +
>  /* Handles exceptions in both to and from, but doesn't do access_ok */
> -unsigned __copy_to_user_ll(void __user*to, const void *from, unsigned n);
> -unsigned __copy_from_user_ll(void *to, const void __user *from, unsigned n);
> +unsigned int copy_to_guest_ll(void __user*to, const void *from, unsigned int n);
> +unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n);
> +unsigned int copy_to_unsafe_ll(void *to, const void *from, unsigned int n);
> +unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
>  
>  extern long __get_user_bad(void);
>  extern void __put_user_bad(void);
>  
> +#define UA_KEEP(args...) args
> +#define UA_DROP(args...)

I assume UA means user access, and since you have dropped other uses
of user and changed to guest instead I wonder if we should name this
just A_{KEEP/DROP}.

Thanks, Roger.

