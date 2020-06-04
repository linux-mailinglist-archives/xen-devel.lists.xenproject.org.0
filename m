Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5A1EDEDA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 09:49:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgkcl-0000Q2-HB; Thu, 04 Jun 2020 07:49:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EphU=7R=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgkcj-0000Px-Gf
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 07:49:13 +0000
X-Inumbo-ID: e144065a-a637-11ea-9947-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e144065a-a637-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 07:49:12 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id y13so5014175eju.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=19uOk58PH69NQ0JMuow4/Erep/Zgdt87/SsuR3J05QM=;
 b=M2CjCNzBIqnh0CAkeaDcJUiE/YVrCMHA5TbRg9ffvE+qOEOQCNnjAqYqfVqB6gRm4P
 TW5cb3/FLpYqmbR5xCXZZL1PiFD7YUV+3Bdyx/kckx3eBjcd+BHhA74bMgryUNEgGRcu
 2A/b+X7J4U+V3iqmkq8W9WqBraUiSk/w9amrlZMmjQJ1indVChSRWonbPsMSw0ircl6l
 2CboHoakl2W5pQT2VqTyhFLUM7a3NzbMZcxNZdzdob3h3JTUkf2Jv5xSc3T3qt0wJ6np
 wa8yucMwWrjX38z0OTFi/Wej9v6buh1SyNfPfRHEjo9tlUULopVFFWtTNMe9zT3sq9iJ
 7XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=19uOk58PH69NQ0JMuow4/Erep/Zgdt87/SsuR3J05QM=;
 b=mDUoV14eofoqUEBNmvfV1VOnGJWQIJAewz1Tb02c/6evvbvVQiASFA2a4Ams3vjx+e
 PVaIV0ceOrq09jPPq35a/RoKaicl5on015tQqCJH2EzaG3TaewIHZ4cr2h5mVWHnaZ5p
 uoYFMhNtyPgdHe/2wxVjb4DU8tuaXM3KwkpacdZLP/0vi8KNvEfLG7JhKaYTCooT769K
 0QUb7FTdyz/zN4/YQpu/dwGXPkrfMD22MqIR4fMigqcy19j6adPfdzaTVcQpe/cV3lew
 W+rhcY1TSLu/1TC2ysKWyX10eXjfGBC83uUv4e8jf1DWzhVXNcagSKKIRqXxkLf6/Vno
 2crg==
X-Gm-Message-State: AOAM5338CD3Mp4o0L58C6DWJ5NS8ottgTieV/t+PNJGmy5ReqXmuc1Cz
 rSsVaH0UZp8VaTH5hssbTG4=
X-Google-Smtp-Source: ABdhPJyE1rU6SDPxCX9paZnnqCGpntFePH5Vkcj0AY1ZGlwq/JdCJXxNxlFYGCfphrB1Yo+z3MdO4Q==
X-Received: by 2002:a17:906:ecfa:: with SMTP id
 qt26mr2786774ejb.493.1591256951657; 
 Thu, 04 Jun 2020 00:49:11 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id k22sm1570811edr.93.2020.06.04.00.49.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 00:49:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
Subject: RE: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT
 faults immediately
Date: Thu, 4 Jun 2020 08:49:09 +0100
Message-ID: <006401d63a44$a27349e0$e759dda0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKnLWBT9mNjQEOL+u7d2oiXq95SHqcmLb0g
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 jbeulich@suse.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 03 June 2020 23:42
> To: xen-devel@lists.xenproject.org
> Cc: jbeulich@suse.com; andrew.cooper3@citrix.com; wl@xen.org; =
roger.pau@citrix.com;
> george.dunlap@citrix.com; paul@xen.org; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> Subject: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT =
faults immediately
>=20
> A recalculation NPT fault doesn't always require additional handling
> in hvm_hap_nested_page_fault(), moreover in general case if there is =
no
> explicit handling done there - the fault is wrongly considered fatal.
>=20
> This covers a specific case of migration with vGPU assigned which
> uses direct MMIO mappings made by XEN_DOMCTL_memory_mapping hypercall:
> at a moment log-dirty is enabled globally, recalculation is requested
> for the whole guest memory including those mapped MMIO regions

I still think it is odd to put this in the commit comment since, as I =
said before, Xen ensures that this situation cannot happen at
the moment.

> which causes a page fault being raised at the first access to them;
> but due to MMIO P2M type not having any explicit handling in
> hvm_hap_nested_page_fault() a domain is erroneously crashed with =
unhandled
> SVM violation.
>=20
> Instead of trying to be opportunistic - use safer approach and handle
> P2M recalculation in a separate NPT fault by attempting to retry after
> making the necessary adjustments. This is aligned with Intel behavior
> where there are separate VMEXITs for recalculation and EPT violations
> (faults) and only faults are handled in hvm_hap_nested_page_fault().
> Do it by also unifying do_recalc return code with Intel implementation
> where returning 1 means P2M was actually changed.
>=20
> Since there was no case previously where =
p2m_pt_handle_deferred_changes()
> could return a positive value - it's safe to replace ">=3D 0" with =
just "=3D=3D 0"
> in VMEXIT_NPF handler. finish_type_change() is also not affected by =
the
> change as being able to deal with >0 return value of p2m->recalc from
> EPT implementation.
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

However, it's a worthy fix so...

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> Changes in v2:
> - replace rc with recalc_done bool
> - updated comment in finish_type_change()
> - significantly extended commit description
> Changes in v3:
> - covert bool to int implicitly
> - a little bit more info of the usecase in the message
> ---
>  xen/arch/x86/hvm/svm/svm.c | 5 +++--
>  xen/arch/x86/mm/p2m-pt.c   | 7 ++++++-
>  xen/arch/x86/mm/p2m.c      | 2 +-
>  3 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 46a1aac..7f6f578 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2923,9 +2923,10 @@ void svm_vmexit_handler(struct cpu_user_regs =
*regs)
>              v->arch.hvm.svm.cached_insn_len =3D vmcb->guest_ins_len & =
0xf;
>          rc =3D vmcb->exitinfo1 & PFEC_page_present
>               ? p2m_pt_handle_deferred_changes(vmcb->exitinfo2) : 0;
> -        if ( rc >=3D 0 )
> +        if ( rc =3D=3D 0 )
> +            /* If no recal adjustments were being made - handle this =
fault */
>              svm_do_nested_pgfault(v, regs, vmcb->exitinfo1, =
vmcb->exitinfo2);
> -        else
> +        else if ( rc < 0 )
>          {
>              printk(XENLOG_G_ERR
>                     "%pv: Error %d handling NPF (gpa=3D%08lx =
ec=3D%04lx)\n",
> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> index 5c05017..070389e 100644
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -341,6 +341,7 @@ static int do_recalc(struct p2m_domain *p2m, =
unsigned long gfn)
>      unsigned int level =3D 4;
>      l1_pgentry_t *pent;
>      int err =3D 0;
> +    bool recalc_done =3D false;
>=20
>      table =3D =
map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
>      while ( --level )
> @@ -402,6 +403,8 @@ static int do_recalc(struct p2m_domain *p2m, =
unsigned long gfn)
>                  clear_recalc(l1, e);
>                  err =3D p2m->write_p2m_entry(p2m, gfn, pent, e, level =
+ 1);
>                  ASSERT(!err);
> +
> +                recalc_done =3D true;
>              }
>          }
>          unmap_domain_page((void *)((unsigned long)pent & PAGE_MASK));
> @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, =
unsigned long gfn)
>              clear_recalc(l1, e);
>          err =3D p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>          ASSERT(!err);
> +
> +        recalc_done =3D true;
>      }
>=20
>   out:
>      unmap_domain_page(table);
>=20
> -    return err;
> +    return err ?: recalc_done;
>  }
>=20
>  int p2m_pt_handle_deferred_changes(uint64_t gpa)
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index 17f320b..db7bde0 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1197,7 +1197,7 @@ static int finish_type_change(struct p2m_domain =
*p2m,
>          rc =3D p2m->recalc(p2m, gfn);
>          /*
>           * ept->recalc could return 0/1/-ENOMEM. pt->recalc could =
return
> -         * 0/-ENOMEM/-ENOENT, -ENOENT isn't an error as we are =
looping
> +         * 0/1/-ENOMEM/-ENOENT, -ENOENT isn't an error as we are =
looping
>           * gfn here. If rc is 1 we need to have it 0 for success.
>           */
>          if ( rc =3D=3D -ENOENT || rc > 0 )
> --
> 2.7.4



