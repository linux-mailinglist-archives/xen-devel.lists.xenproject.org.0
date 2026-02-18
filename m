Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J94FnMolmnxbQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:00:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E43159B5B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235978.1538783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsoeh-0003fE-7A; Wed, 18 Feb 2026 21:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235978.1538783; Wed, 18 Feb 2026 21:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsoeh-0003dY-4I; Wed, 18 Feb 2026 21:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1235978;
 Wed, 18 Feb 2026 21:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CABg=AW=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vsoef-0003dS-Mx
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 21:00:17 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d26f4ee0-0d0c-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 22:00:14 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-38707d4c8b9so4046021fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 13:00:14 -0800 (PST)
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
X-Inumbo-ID: d26f4ee0-0d0c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771448414; cv=none;
        d=google.com; s=arc-20240605;
        b=YHh1Z0kZW26nRlsten2H4Hq+fQeaPT4BIXYh97TZVXk7BNaDc9trZq4CEohTeXO8NC
         VJ968YNMmhHmJdlX1kDZKKet0bUFnLNfRqU0PWVVUXOYYxSe7KKundUVy5uxu2LpgCgj
         MfC+7zRla+KXTYFK77pV0nsz95dwsArO2iC/OeTZnEqUB+yT0Uc6bVWp8ZdSApex7jgK
         fd+vpfbFbr8vXP/Tv5rbJKJydoXb5uE4T8QMrzxuVW755Kz0KLlk+8ucjGgljkcz6Ofh
         xiC1IoZayQ1wSuI9drgNyhfpnTNP8pZqIp+wBo9zQx/pv77aFCXDys4Cd2yLL/9cPL5T
         mNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZdJvyiUk21te25MO0c9KuUepU2kfYCsREjkuROz7/FM=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=HZuel1ZR8xdMQ0LcKP4be1BnAwGX7dnv/fKYR58vONONpLo2ZXwxXDDCZD0vCmbETE
         WHcdPEXweCgrGyzKt4nxZFSMKaLLJcL+VQ4NTKdjQHpEHKhM/77J4sJlBkZz3mShO2s+
         M3m4Bu8rvd1gdZoRGuQGNTTmnCw8FYQKh/xQOFH9JTPXdBvmpg1qXMZzTgavTLJXhW+8
         1UkCniXThBu1y1S2JQt1ZwwYsXc5agRCHyJDtKIztIwLiHT2vTKUiI9N/J8HxBw+eSu/
         S9S9ZdYcjr8HVZ99D3AA8z74aeGr+8pPbtN4RoV1J1FyLncrKL+j0acoFx+4ISC363nv
         hJBA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448414; x=1772053214; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdJvyiUk21te25MO0c9KuUepU2kfYCsREjkuROz7/FM=;
        b=NE8C0ZbHl1Y5+j8PYom1LWp+HefOftXOdnStzWXkZ3iXT/Q347M5+tcwVcsz6BIThn
         +NwDqV2GzUNNRcTIwOqOUH8QhtO4F7YeLQrMDvSzYXVEWCKPm+I9ch4nKGQWQ+QhrI+Y
         2uV6oGQwQj11XEgtIThZq9ZjqniWk/PuNJh2/UCLlEe9yDRD1DZdgfO1Wbi3d1+PEEAH
         WaA1PWKTAP6Lavhg9UWEyauCLJUTTvF+5HzarXpkaHSbCsPisI4fGDUzulfUR0TwQgv2
         W+WAWRspaj0+KduXM3kH8pD1uIao35AAG7hH+Dh3Cylge5mDM2NVdWO62Wh14/y0gT3G
         9BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448414; x=1772053214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZdJvyiUk21te25MO0c9KuUepU2kfYCsREjkuROz7/FM=;
        b=agypCAdM1YsIXp/Na+tLGBYBSPpaf5ZRckbigp520tIBob19WXwdk72oCRoVGmYT62
         RJo7DDfiWKyvieionh9rVh7kETi7A8/Q2NohObVAqbnGWpZJFU1ZVo1iPyWCVso8NpKV
         C2dYHPHrRFZuo9dQUZjShLZQPtM+QU5JCIU8Wpiv7Cn2ZP7sv+xMlMhd3RE+Sk3z14nr
         vy+YGqDa9aOL4bbBpV8apBcasTixNKQpF2q3GYBWT37xunVHj+g3SxYIAZ17CW5qa8z7
         5jN2yNCNvh9aLMh98SdoEk0/22MzfrDtLse0e5IW15st9GDQzTMKbtXIT03Srr4kdTzd
         QYGg==
X-Gm-Message-State: AOJu0YyEnKNUxIrZZTmIbF8nnqeeYsqCn8U0E041hgS/xyLB6l37UB2B
	3/MGaamzdpwPCXUQ6D0C6A1/RU+LBxeveTm58ZFM5mnhnvJkobDjoGyteknk86HRc6t6Rlq7sej
	ru++DGFcka60G0qCpH+kWV27aY15gJMw=
X-Gm-Gg: AZuq6aLpfYOrBu//i9iYP7cM8MmFdLtFtuBYzVD7l3P065fghCsRRcELQAvIdPiVcL2
	r+UE9VSjDhQPX8fi250Ne8kA06q1+MMIuSPvuqEjdtCJltlyNr84LhnDV/TpeaeG3L6/X2kgPW0
	Crub6jZGA+PEORESotuu217yID0PHNh80Ha7GxeYpb3CWzPBHR6e3ZGTduR1X+lP9JhZz67Vn8o
	HRfFM/vvp/4XCLU904RCbcVoQ311SWdbwuqWlYiISlM2B8u1Vjf5KctN1FcW8uvQ9zzJ+r4uZTW
	Eb/jFA==
X-Received: by 2002:a05:651c:f02:b0:386:1ce2:1194 with SMTP id
 38308e7fff4ca-3881b950eecmr47850331fa.31.1771448413772; Wed, 18 Feb 2026
 13:00:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <7cddaf16eb840dbd1480d7a1d6ddb0cbf0357113.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <7cddaf16eb840dbd1480d7a1d6ddb0cbf0357113.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Feb 2026 23:00:00 +0200
X-Gm-Features: AaiRm50MYv7_n41CHSJKAdiZG8efxiYNMXq7H1DjszAKXsvqy98sSsZC_EjfK_4
Message-ID: <CAGeoDV8HBfmNpEjdP80=YFM+th0Y0d+OM=GQAxnDt0OYDNQ71g@mail.gmail.com>
Subject: Re: [RFC PATCH 14/19] arm/its: VPE affinity changes
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1E43159B5B
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> When a VCPU is migrated to another PCPU, its VPE affinity must be
> updated. Hook into VPE scheduling to ensure that the VPE to be scheduled
> is located on the correct PCPU, if not, move it with VMOVP command.
>
> VMOVP needs to be issued on all ITSes in the system, and in the same
> order, unlsess single VMOVP capable ITS is used.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c             |  55 ++++++++++++++
>  xen/arch/arm/gic-v4-its.c             | 105 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic_v3_its.h |  12 +++
>  3 files changed, 172 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index fb1d2709be..be840fbc8f 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -31,6 +31,8 @@
>  LIST_HEAD(host_its_list);
>
>
> +unsigned long its_list_map;
> +
>  unsigned int nvpeid =3D 16;
>
>  /*
> @@ -612,10 +614,47 @@ static int gicv3_disable_its(struct host_its *hw_it=
s)
>      return -ETIMEDOUT;
>  }
>
> +static int __init its_compute_its_list_map(struct host_its *hw_its)
> +{
> +    int its_number;
> +    uint32_t ctlr;
> +
> +    its_number =3D find_first_zero_bit(&its_list_map, GICv4_ITS_LIST_MAX=
);
> +    if ( its_number >=3D GICv4_ITS_LIST_MAX )
> +    {
> +        printk(XENLOG_ERR
> +               "ITS@%lx: No ITSList entry available!\n", hw_its->addr);
> +        return -EINVAL;
> +    }
> +
> +    ctlr =3D readl_relaxed(hw_its->its_base + GITS_CTLR);
> +    ctlr &=3D ~GITS_CTLR_ITS_NUMBER;
> +    ctlr |=3D its_number << GITS_CTLR_ITS_NUMBER_SHIFT;
> +    writel_relaxed(ctlr, hw_its->its_base + GITS_CTLR);
> +    ctlr =3D readl_relaxed(hw_its->its_base + GITS_CTLR);
> +    if ( (ctlr & GITS_CTLR_ITS_NUMBER) !=3D
> +         (its_number << GITS_CTLR_ITS_NUMBER_SHIFT) )
> +    {
> +        its_number =3D ctlr & GITS_CTLR_ITS_NUMBER;
> +        its_number >>=3D GITS_CTLR_ITS_NUMBER_SHIFT;
> +    }
> +
> +    if ( test_and_set_bit(its_number, &its_list_map) )
> +    {
> +        printk(XENLOG_ERR
> +               "ITS@%lx: Duplicate ITSList entry %d\n",
> +               hw_its->addr, its_number);
> +        return -EINVAL;
> +    }
> +
> +    return its_number;
> +}
> +
>  static int gicv3_its_init_single_its(struct host_its *hw_its)
>  {
>      uint64_t reg;
>      int i, ret;
> +    int its_number;
>
>      hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size);
>      if ( !hw_its->its_base )
> @@ -633,6 +672,22 @@ static int gicv3_its_init_single_its(struct host_its=
 *hw_its)
>      hw_its->itte_size =3D GITS_TYPER_ITT_SIZE(reg);
>      if ( reg & GITS_TYPER_PTA )
>          hw_its->flags |=3D HOST_ITS_USES_PTA;
> +    hw_its->is_v4 =3D reg & GITS_TYPER_VLPIS;

hw_its->is_v4 =3D reg & GITS_TYPER_VLPIS only tells us that VLPI
is supported, not the GIC architecture revision. The name is_v4
is misleading. Consider renaming to has_vlpis (or similar) and
use GITS_PIDR2 when you need the GIC arch revision.

> +    if ( hw_its->is_v4 )
> +    {
> +        if ( !(reg & GITS_TYPER_VMOVP) )
> +        {
> +            its_number =3D its_compute_its_list_map(hw_its);
> +            if ( its_number < 0 )
> +                return its_number;
> +            dprintk(XENLOG_INFO,
> +                    "ITS@%lx: Using ITS number %d\n",
> +                    hw_its->addr, its_number);
> +        }
> +        else
> +            dprintk(XENLOG_INFO,
> +                    "ITS@%lx: Single VMOVP capable\n", hw_its->addr);
> +    }
>      spin_lock_init(&hw_its->cmd_lock);
>
>      for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
> diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
> index 6a550a65b2..175fda7acb 100644
> --- a/xen/arch/arm/gic-v4-its.c
> +++ b/xen/arch/arm/gic-v4-its.c
> @@ -36,6 +36,9 @@ static unsigned long *vpeid_mask;
>
>  static spinlock_t vpeid_alloc_lock =3D SPIN_LOCK_UNLOCKED;
>
> +static uint16_t vmovp_seq_num;
> +static spinlock_t vmovp_lock =3D SPIN_LOCK_UNLOCKED;
> +
>  void __init gicv4_its_vpeid_allocator_init(void)
>  {
>      /* Allocate space for vpeid_mask based on MAX_VPEID */
> @@ -242,6 +245,57 @@ static int __init its_vpe_init(struct its_vpe *vpe)
>      return rc;
>  }
>
> +static int its_send_cmd_vmovp(struct its_vpe *vpe)
> +{
> +    uint16_t vpeid =3D vpe->vpe_id;
> +    int ret;
> +    struct host_its *hw_its;
> +
> +    if ( !its_list_map )
> +    {
> +        uint64_t cmd[4];
> +
> +        hw_its =3D list_first_entry(&host_its_list, struct host_its, ent=
ry);
> +        cmd[0] =3D GITS_CMD_VMOVP;
> +        cmd[1] =3D (uint64_t)vpeid << 32;
> +        cmd[2] =3D encode_rdbase(hw_its, vpe->col_idx, 0x0);
> +        cmd[3] =3D 0x00;
> +
> +        return its_send_command(hw_its, cmd);

Docs says VMOVP should be followed by VSYNC to synchronize the
context when moving a vPE across CommonLPIAff groups. Here we
issue VMOVP and return without VSYNC. Should we add a VSYNC (for
both the single=E2=80=91ITS and ITSList paths)?

> +    }
> +
> +    /*
> +     * If using the its_list "feature", we need to make sure that all IT=
Ss
> +     * receive all VMOVP commands in the same order. The only way
> +     * to guarantee this is to make vmovp a serialization point.
> +     */
> +    spin_lock(&vmovp_lock);
> +
> +    vmovp_seq_num++;
> +
> +    /* Emit VMOVPs */
> +    list_for_each_entry(hw_its, &host_its_list, entry)
> +    {
> +        uint64_t cmd[4];
> +
> +        cmd[0] =3D GITS_CMD_VMOVP | ((uint64_t)vmovp_seq_num << 32);
> +        cmd[1] =3D its_list_map | ((uint64_t)vpeid << 32);
> +        cmd[2] =3D encode_rdbase(hw_its, vpe->col_idx, 0x0);
> +        cmd[3] =3D 0x00;
> +
> +        ret =3D its_send_command(hw_its, cmd);

We iterate over all ITSes and send VMOVP to each. Should this be
limited to ITSes participating in the ITSList (and/or only v4 ITSes
that can have the vPE mapping)? Sending to unrelated ITSes
looks unnecessary and may be incorrect.
---

If its_send_command() fails for one ITS in the loop, the VPE
affinity update becomes inconsistent across ITSes. Do we need a
rollback or a recovery path (e.g. retry, VSYNC, or mark vPE unusable)?

> +        if ( ret )
> +        {
> +            spin_unlock(&vmovp_lock);
> +            return ret;
> +        }
> +    }
> +
> +    spin_unlock(&vmovp_lock);
> +
> +    return 0;
> +}
> +
>  static void __init its_vpe_teardown(struct its_vpe *vpe)
>  {
>      unsigned int order;
> @@ -687,6 +741,52 @@ static void its_make_vpe_non_resident(struct its_vpe=
 *vpe, unsigned int cpu)
>      vpe->pending_last =3D val & GICR_VPENDBASER_PendingLast;
>  }
>
> +static int vpe_to_cpuid_lock(struct its_vpe *vpe, unsigned long *flags)
> +{
> +    spin_lock_irqsave(&vpe->vpe_lock, *flags);

vpe_lock is used but never initialized.

> +    return vpe->col_idx;
> +}
> +
> +static void vpe_to_cpuid_unlock(struct its_vpe *vpe, unsigned long *flag=
s)
> +{
> +    spin_unlock_irqrestore(&vpe->vpe_lock, *flags);
> +}
> +
> +static int gicv4_vpe_set_affinity(struct vcpu *vcpu)
> +{
> +    struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
> +    unsigned int from, to =3D vcpu->processor;
> +    unsigned long flags;
> +    int ret =3D 0;
> +
> +    /*
> +     * Changing affinity is mega expensive, so let's be as lazy as
> +     * we can and only do it if we really have to. Also, if mapped
> +     * into the proxy device, we need to move the doorbell interrupt
> +     * to its new location.
> +     *
> +     * Another thing is that changing the affinity of a vPE affects
> +     * *other interrupts* such as all the vLPIs that are routed to
> +     * this vPE. This means that we must ensure nobody samples
> +     * vpe->col_idx during the update, hence the lock below which
> +     * must also be taken on any vLPI handling path that evaluates
> +     * vpe->col_idx, such as reg-based vLPI invalidation.
> +     */
> +    from =3D vpe_to_cpuid_lock(vpe, &flags);
> +    if ( from =3D=3D to )
> +        goto out;
> +
> +    vpe->col_idx =3D to;

updates col_idx before VMOVP; on error it is not
restored.

> +
> +    ret =3D its_send_cmd_vmovp(vpe);
> +    if ( ret )
> +        goto out;
> +
> + out:
> +    vpe_to_cpuid_unlock(vpe, &flags);
> +    return ret;
> +}
> +
>  void vgic_v4_load(struct vcpu *vcpu)
>  {
>      struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
> @@ -695,6 +795,11 @@ void vgic_v4_load(struct vcpu *vcpu)
>      if ( vpe->resident )
>          return;
>
> +    /*
> +     * Before making the VPE resident, make sure the redistributor
> +     * corresponding to our current CPU expects us here
> +     */
> +    WARN_ON(gicv4_vpe_set_affinity(vcpu));

If gicv4_vpe_set_affinity() fails, continuing to make the vPE resident
on the new CPU is very likely wrong: vLPI routing / doorbells can now
target the wrong redistributor.


Best regards,
Mykola



>      its_make_vpe_resident(vpe, vcpu->processor);
>      vpe->resident =3D true;
>  }
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index 411beb81c8..f03a8fad47 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -43,6 +43,9 @@
>  #define GITS_CTLR_QUIESCENT             BIT(31, UL)
>  #define GITS_CTLR_ENABLE                BIT(0, UL)
>
> +#define GITS_CTLR_ITS_NUMBER_SHIFT      4
> +#define GITS_CTLR_ITS_NUMBER            (0xfUL << GITS_CTLR_ITS_NUMBER_S=
HIFT)
> +
>  #define GITS_TYPER_PTA                  BIT(19, UL)
>  #define GITS_TYPER_DEVIDS_SHIFT         13
>  #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHI=
FT)
> @@ -60,6 +63,8 @@
>                                                   GITS_TYPER_ITT_SIZE_SHI=
FT) + 1)
>  #define GITS_TYPER_PHYSICAL             (1U << 0)
>
> +#define GITS_TYPER_VLPIS                (1UL << 1)
> +#define GITS_TYPER_VMOVP                (1UL << 37)
>  #define GITS_BASER_INDIRECT             BIT(62, UL)
>  #define GITS_BASER_INNER_CACHEABILITY_SHIFT        59
>  #define GITS_BASER_TYPE_SHIFT           56
> @@ -118,6 +123,12 @@
>  /* We allocate LPIs on the hosts in chunks of 32 to reduce handling over=
head. */
>  #define LPI_BLOCK                       32U
>
> +/*
> + * Maximum number of ITSs when GITS_TYPER.VMOVP =3D=3D 0, using the
> + * ITSList mechanism to perform inter-ITS synchronization.
> + */
> +#define GICv4_ITS_LIST_MAX      16
> +
>  extern unsigned int nvpeid;
>  /* The maximum number of VPEID bits supported by VLPI commands */
>  #define ITS_MAX_VPEID_BITS      nvpeid
> @@ -214,6 +225,7 @@ struct __lpi_data {
>  extern struct __lpi_data lpi_data;
>
>  extern struct list_head host_its_list;
> +extern unsigned long its_list_map;
>
>  int its_send_cmd_discard(struct host_its *its, struct its_device *dev,
>                           uint32_t eventid);
> --
> 2.51.2

