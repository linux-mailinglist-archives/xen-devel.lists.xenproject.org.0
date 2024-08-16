Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1349955079
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 20:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778722.1188734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1Hx-0005Yg-2B; Fri, 16 Aug 2024 18:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778722.1188734; Fri, 16 Aug 2024 18:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf1Hw-0005Wz-VX; Fri, 16 Aug 2024 18:03:00 +0000
Received: by outflank-mailman (input) for mailman id 778722;
 Fri, 16 Aug 2024 18:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2/C=PP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sf1Hv-0005Wg-5G
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 18:02:59 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c51696ab-5bf9-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 20:02:58 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f16d2f2b68so33777261fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 11:02:58 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383934559sm287708966b.130.2024.08.16.11.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 11:02:57 -0700 (PDT)
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
X-Inumbo-ID: c51696ab-5bf9-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723831378; x=1724436178; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzuwvrSR4boSz0LtUOoTzVVt3IV5wBEFG8HEkBgpKf4=;
        b=K/fXUmbyo9qhYCEfOZ6Llu+xdSK1hELv5y7DyCNtgW+1b99OU7oHEsSqPD+M1Mn03R
         bkm4AtResDq1hIUzH5tSIcAhaPMgl3XKPapjbRGntq7/JlUnE9l22YTAn9iMJNN1wTDu
         sWXNfl8VS46Gg876ebrGwGPYYOzyxO2AAmGBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723831378; x=1724436178;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzuwvrSR4boSz0LtUOoTzVVt3IV5wBEFG8HEkBgpKf4=;
        b=nQnKjL0t3AIAsQdMXlJMp9BAZvILfloQl5odMO1JlE9b8qYTv4krEC0BlRuobvZCBq
         aG5TaY50fs5UFTjkvg/j7frfXPiGVjGAituw6jnpmXLlKKlbk2QbgzZhaqFDDfKqjXoo
         KCims8rYs/qJaEDm+4WGJPm7fdRUdRLW7yUen6kQgzieTigf3OGARUZDpN3OkxT3E/D8
         WGKETPh4gogukDhUzThVJiOTi9sWC8dzJhgwNDBF52SrrXitFQJ2wbdLLkCqzkotha5/
         TeNi9meekcbCVar9GnA3v3UXpMD1yndXjTkolK4Zdr9toiIy8YVduYi43yGvGLsggTLM
         sl6w==
X-Forwarded-Encrypted: i=1; AJvYcCUqSbCBjobriolZj1i7drb9eT3jLg9yXhx7skKbYn97+X87qllbj2+sk8DwGqHE5JraCM5YyshZxzizRd6OFZJKSwz3+ZOQ7lRwVprogoI=
X-Gm-Message-State: AOJu0YyVQOPLfOznc5g/t2IFI7PmAv5xa7wyrEpOxVgEwU5pjXyfRU5H
	5GbbrHYm39f4/0vWLaf16rmscsL0Y6M80k16azCGfsB0sPa8S/CziFdzt/QjoIo=
X-Google-Smtp-Source: AGHT+IFcd4bVp+IhRU+w8Fq2N0hvYZzVZ+texPBSgeNjmVXd1mkHU/N+OacwzlFV1PwAzhElNR6IrQ==
X-Received: by 2002:a2e:868d:0:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f3be583b5cmr30799561fa.16.1723831377600;
        Fri, 16 Aug 2024 11:02:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 19:02:54 +0100
Message-Id: <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/22] x86/hvm: use a per-pCPU monitor table in HAP mode
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.17.0
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-14-roger.pau@citrix.com>
In-Reply-To: <20240726152206.28411-14-roger.pau@citrix.com>

On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> Instead of allocating a monitor table for each vCPU when running in HVM H=
AP
> mode, use a per-pCPU monitor table, which gets the per-domain slot update=
d on
> guest context switch.
>
> This limits the amount of memory used for HVM HAP monitor tables to the a=
mount
> of active pCPUs, rather than to the number of vCPUs.  It also simplifies =
vCPU
> allocation and teardown, since the monitor table handling is removed from
> there.
>
> Note the switch to using a per-CPU monitor table is done regardless of wh=
ether

s/per-CPU/per-pCPU/

> Address Space Isolation is enabled or not.  Partly for the memory usage
> reduction, and also because it allows to simplify the VM tear down path b=
y not
> having to cleanup the per-vCPU monitor tables.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Note the monitor table is not made static because uses outside of the fil=
e
> where it's defined will be added by further patches.
> ---
>  xen/arch/x86/hvm/hvm.c             | 60 ++++++++++++++++++++++++
>  xen/arch/x86/hvm/svm/svm.c         |  5 ++
>  xen/arch/x86/hvm/vmx/vmcs.c        |  1 +
>  xen/arch/x86/hvm/vmx/vmx.c         |  4 ++
>  xen/arch/x86/include/asm/hap.h     |  1 -
>  xen/arch/x86/include/asm/hvm/hvm.h |  8 ++++
>  xen/arch/x86/mm.c                  |  8 ++++
>  xen/arch/x86/mm/hap/hap.c          | 75 ------------------------------
>  xen/arch/x86/mm/paging.c           |  4 +-
>  9 files changed, 87 insertions(+), 79 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 7f4b627b1f5f..3f771bc65677 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -104,6 +104,54 @@ static const char __initconst warning_hvm_fep[] =3D
>  static bool __initdata opt_altp2m_enabled;
>  boolean_param("altp2m", opt_altp2m_enabled);
> =20
> +DEFINE_PER_CPU(root_pgentry_t *, monitor_pgt);
> +
> +static int allocate_cpu_monitor_table(unsigned int cpu)

To avoid ambiguity, could we call these *_pcpu_*() instead?

> +{
> +    root_pgentry_t *pgt =3D alloc_xenheap_page();
> +
> +    if ( !pgt )
> +        return -ENOMEM;
> +
> +    clear_page(pgt);
> +
> +    init_xen_l4_slots(pgt, _mfn(virt_to_mfn(pgt)), INVALID_MFN, NULL,
> +                      false, true, false);
> +
> +    ASSERT(!per_cpu(monitor_pgt, cpu));
> +    per_cpu(monitor_pgt, cpu) =3D pgt;
> +
> +    return 0;
> +}
> +
> +static void free_cpu_monitor_table(unsigned int cpu)
> +{
> +    root_pgentry_t *pgt =3D per_cpu(monitor_pgt, cpu);
> +
> +    if ( !pgt )
> +        return;
> +
> +    per_cpu(monitor_pgt, cpu) =3D NULL;
> +    free_xenheap_page(pgt);
> +}
> +
> +void hvm_set_cpu_monitor_table(struct vcpu *v)
> +{
> +    root_pgentry_t *pgt =3D this_cpu(monitor_pgt);
> +
> +    ASSERT(pgt);
> +
> +    setup_perdomain_slot(v, pgt);

Why not modify them as part of write_ptbase() instead? As it stands, it app=
ears
to be modifying the PTEs of what may very well be our current PT, which mak=
es
the perdomain slot be in a $DEITY-knows-what state until the next flush
(presumably the write to cr3 in write_ptbase()?; assuming no PCIDs).

Setting the slot up right before the cr3 change should reduce the potential=
 for
misuse.

> +
> +    make_cr3(v, _mfn(virt_to_mfn(pgt)));
> +}
> +
> +void hvm_clear_cpu_monitor_table(struct vcpu *v)
> +{
> +    /* Poison %cr3, it will be updated when the vCPU is scheduled. */
> +    make_cr3(v, INVALID_MFN);

I think this would benefit from more exposition in the comment. If I'm gett=
ing
this right, after descheduling this vCPU we can't assume it'll be reschedul=
ed
on the same pCPU, and if it's not it'll end up using a different monitor ta=
ble.
This poison value is meant to highlight forgetting to set cr3 in the
"ctxt_switch_to()" path.=20

All of that can be deduced from what you wrote and sufficient headscratchin=
g
but seeing how this is invoked from the context switch path it's not incred=
ibly
clear wether you meant the perdomain slot would be updated by the next vCPU=
 or
what I stated in the previous paragraph.

Assuming it is as I mentioned, maybe hvm_forget_cpu_monitor_table() would
convey what it does better? i.e: the vCPU forgets/unbinds the monitor table
from its internal state.

Cheers,
Alejandro

