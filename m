Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2822D7425
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50373.89003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfxM-0000x4-OL; Fri, 11 Dec 2020 10:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50373.89003; Fri, 11 Dec 2020 10:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfxM-0000wf-Ki; Fri, 11 Dec 2020 10:47:24 +0000
Received: by outflank-mailman (input) for mailman id 50373;
 Fri, 11 Dec 2020 10:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3T3=FP=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1knfxL-0000wa-85
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:47:23 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfca412b-e517-43ac-89d2-b59cd233735d;
 Fri, 11 Dec 2020 10:47:21 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0BBAlDDN005781
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 11:47:14 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 233432E946C; Fri, 11 Dec 2020 11:47:08 +0100 (MET)
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
X-Inumbo-ID: cfca412b-e517-43ac-89d2-b59cd233735d
Date: Fri, 11 Dec 2020 11:47:08 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201211104708.GD1423@antioche.eu.org>
References: <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
 <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
 <20201210170319.GG455@antioche.eu.org>
 <ed06a0f4-8468-addf-2797-be3ba3a2d607@citrix.com>
 <20201210173551.GJ455@antioche.eu.org>
 <b60639d9-5c27-ab86-eb97-f8627b3b32d2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b60639d9-5c27-ab86-eb97-f8627b3b32d2@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 11 Dec 2020 11:47:14 +0100 (MET)

On Thu, Dec 10, 2020 at 09:01:12PM +0000, Andrew Cooper wrote:
> I've repro'd the problem.
> 
> When I modify Xen to explicitly demand-map the LDT in the MMUEXT_SET_LDT
> hypercall, everything works fine.
> 
> Specifically, this delta:
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 723cc1070f..71a791d877 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3742,12 +3742,31 @@ long do_mmuext_op(
>              else if ( (curr->arch.pv.ldt_ents != ents) ||
>                        (curr->arch.pv.ldt_base != ptr) )
>              {
> +                unsigned int err = 0, tmp;
> +
>                  if ( pv_destroy_ldt(curr) )
>                      flush_tlb_local();
>  
>                  curr->arch.pv.ldt_base = ptr;
>                  curr->arch.pv.ldt_ents = ents;
>                  load_LDT(curr);
> +
> +                printk("Probe new LDT\n");
> +                asm volatile (
> +                    "mov %%es, %[tmp];\n\t"
> +                    "1: mov %[sel], %%es;\n\t"
> +                    "mov %[tmp], %%es;\n\t"
> +                    "2:\n\t"
> +                    ".section .fixup,\"ax\"\n"
> +                    "3: mov $1, %[err];\n\t"
> +                    "jmp 2b\n\t"
> +                    ".previous\n\t"
> +                    _ASM_EXTABLE(1b, 3b)
> +                    : [err] "+r" (err),
> +                      [tmp] "=&r" (tmp)
> +                    : [sel] "r" (0x3f)
> +                    : "memory");
> +                printk("  => err %u\n", err);
>              }
>              break;
>          }
> 
> Which stashes %es, explicitly loads init's %ss selector to trigger the
> #PF and Xen's lazy mapping, then restores %es.

Yes, this works for dom0 too, I have it running multiuser

> [...]
> 
> Presumably you've got no Meltdown mitigations going on within the NetBSD
> kernel?  (I suspect not, seeing as changing Xen changes the behaviour,
> but it is worth asking).

No, there's no Meltdown mitigations for PV in NetBSD. as I see it,
for amd64 at last, the Xen kernel has to do it anyway, so it's not usefull
to implement it in the guest's kernel. Did I miss something ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

