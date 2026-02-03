Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMQkAnHVgWkCKgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 12:01:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E6D806A
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 12:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219226.1528155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnE8w-0006GH-6V; Tue, 03 Feb 2026 11:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219226.1528155; Tue, 03 Feb 2026 11:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnE8w-0006DB-3j; Tue, 03 Feb 2026 11:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1219226;
 Tue, 03 Feb 2026 11:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMyt=AH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vnE8u-0006D5-Cy
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 11:00:24 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88e419f4-00ef-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 12:00:22 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-385c6c727fcso51697381fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 03:00:22 -0800 (PST)
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
X-Inumbo-ID: 88e419f4-00ef-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770116421; cv=none;
        d=google.com; s=arc-20240605;
        b=N61g7jZNWntS2zCLbWpqb6MskKCBb9KpaCweI/qWNIH8IE312vHWunQtQt5+LWTRyA
         eXFYiOVi5ahaVJsqwU+5W382hwS6vac7zZd76qXul1CnEmN325V1MdsxF0nqdavkTkSC
         Qt7dGswP/hZXWRLa2UHEy5xRcqrfpaPSaYTC5HirlxUXHQLYAXqyMSR3Oe7gFCK+nlZJ
         ReTgL2yTMdrf2NBCKu8zqYn3d6lPpxWP55qh8VBgicx1Z+VE26Dq7oAOBI5QriRE3WTP
         7jTqlBbC0kk1DVwTz9+OYMNEOIN3IpBqPJCjmhEdKTZjgA9BmhFOiXlbZmeKz+LlaaJM
         lhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jIxlsfW7bCP8xx7xyp7U8w8Ij3LEG65Yj25nxXi5zCI=;
        fh=1+BAPob5BoQkkpmA3P9c5RHtJP6+f4C/krYhKM3WBxQ=;
        b=eHIgMa8H58NLOTaJzrvHyk75fkT1B8zpyDroWsB75pBK8XzMBbqKX4lnCzb1IxbOnE
         OYqKc4ieoinYrSfRYUiGYw7q03QgxC39VfR33uCxdCg0fQksvXPOetqdE4wGOEFp16Ee
         H1QH1mIc83JuBzgSXlbymfLCKOIkSrP31q7J7CTitC1RL5quU045Q5sUNOpVnPmkKdhy
         pOmGLt1we6uc1y4NyqOci+n0rBZXbxOlmg4nkRLwBLlKVcdWUjunJ3o8x6Y/uDtu/o7a
         m6h3nMvIpY+aClOFo4gcKy2h4s4qAZkFOE/TZPz8xsmWusbXASeX9mW65flqY+CE66Ll
         tb6g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116421; x=1770721221; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIxlsfW7bCP8xx7xyp7U8w8Ij3LEG65Yj25nxXi5zCI=;
        b=NsgLqvJhaZIYCPbKBWavXWV32wChO63LhbbvJSrQHvpsEigkhkj/Ufi7lEnKxidP+G
         WjF2sU9GUoXfoSJs3RQGL62EOaebGQGMpoCN4pqQik+ZmIw//ccwVp6rkvFoaCoolWN1
         ouPAOEk701xc2YOtVJYR4EIGA0TTAzGOKbMAn7iwIEIldnR/Kes6tPl2eVQC8LtsBB0O
         UQyokihiXnWRHEB4usyuDqCKCtCDo0Dt1LiNDLPICfhhitipBQUYMlaMEHJ2oOfG6MSC
         kwf8CllPoaJYRerJD23qu1vWex/6BXIljpL/cDREGbftanydgI54PHtCGH3UfdvUNwXT
         Vs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116421; x=1770721221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIxlsfW7bCP8xx7xyp7U8w8Ij3LEG65Yj25nxXi5zCI=;
        b=LSAUl4kQPBGfrEoF4qrHQtfnwm0s1putU1dQVe49mm1HbHmsoKNE9W4lxRvccekKwa
         GRZ1qQL8YIxWtZ/XEVgOfRS6CRKAYClDvN+klpoT+UNGrH3tGETzosyWrScT2t56gLZT
         qIS0fdHDDYnB/Nt5YHDk79o4mYUICyJxEE7zTyOKOTm8D2zrdqicUIFNBVUlEfgmU+Aq
         lzmnfg0xo9iiQ14yFoIQVZqZ0KjsPAsWl/5J/IvggEb3KQcVeqUeQ+dX3uNioJwHOVTo
         WEU+QONprnQBuJ89ANyc+r4ebg5zCIfZBhI/pioHOe/gTpzfQw0EoRq4VK0aBApXIpdn
         WV/A==
X-Gm-Message-State: AOJu0YzfrBqkvl1kVYy/feYs/2AVy7QZKBMCqGy+nf1rO8pN6YYSq0oX
	tBFd8KBA2tnpL18eWldT1X4iA8ZWIv1I400qF/O9bW5yGnEuh5AtJz2deZsAZ+FtAyliapN5Xcd
	oefE2zo644ni/S5wvvHMYfcAddMGEXpI=
X-Gm-Gg: AZuq6aKhQwQimA+TkAgtsfuIoen/UB0VpOT8PDzrwOBtaQs+1CJXmaeA0AuubL1VyWm
	Eobw1z2zlgUt9D5kSpiJmHHxp7hnsN1LKXU39sNESsxU1W5ejM8oZEcxDWw1CG0DK3P4rUvAgoQ
	FLVI16nSkvou4vbSUhp6tyKFxOuCyU2JK8W1URcTFE/cGRBDJZ+HZQfrXyrNCcGYNQP3Zw1N0zN
	RZZnMWmcXYlHQahWrBZhY7Th3yNhAg+E3t8LGLWGEBI1Qp7vLu6si1lTbRpkosEITKsDw==
X-Received: by 2002:a2e:a7cf:0:b0:386:7dac:89f0 with SMTP id
 38308e7fff4ca-3867dac8a24mr16567071fa.28.1770116420924; Tue, 03 Feb 2026
 03:00:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
 <7c93f37d-3699-454e-abb9-4499b08d0654@gmail.com>
In-Reply-To: <7c93f37d-3699-454e-abb9-4499b08d0654@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 3 Feb 2026 13:00:09 +0200
X-Gm-Features: AZwV_QiEin1Bos7mgMm2QFJkMNpsSa5ydoN8i0Vz9qxxBrRQS7WI176WLOsU_Gs
Message-ID: <CAGeoDV-DsyPzeR-ZbOFNRGq68OVh+W_G8cLume8m1y1jKEst2w@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] xen/arm: gic-v3: add ITS suspend/resume support
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[epam.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email]
X-Rspamd-Queue-Id: 6A9E6D806A
X-Rspamd-Action: no action

Hi Oleksandr,

Thanks for the review.

On Sat, Jan 31, 2026 at 7:00=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 11.12.25 20:43, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
> > working after firmware powers the GIC down. Snapshot the CPU interface,
> > distributor and last-CPU redistributor state, disable the ITS to cache =
its
> > CTLR/CBASER/BASER registers, then restore everything and re-arm the
> > collection on resume.
> >
> > Add list_for_each_entry_continue_reverse() in list.h for the ITS suspen=
d
> > error path that needs to roll back partially saved state.
> >
> > Based on Linux commit: dba0bc7b76dc ("irqchip/gic-v3-its: Add ability t=
o save/restore ITS state")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >   xen/arch/arm/gic-v3-its.c             | 91 ++++++++++++++++++++++++++=
+
> >   xen/arch/arm/gic-v3.c                 | 15 ++++-
> >   xen/arch/arm/include/asm/gic_v3_its.h | 23 +++++++
> >   xen/include/xen/list.h                | 14 +++++
> >   4 files changed, 140 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 34833166ad..08a3d8d1ef 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -1209,6 +1209,97 @@ int gicv3_its_init(void)
> >       return 0;
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +int gicv3_its_suspend(void)
> > +{
> > +    struct host_its *its;
> > +    int ret;
> > +
> > +    list_for_each_entry(its, &host_its_list, entry)
> > +    {
> > +        unsigned int i;
> > +        void __iomem *base =3D its->its_base;
> > +
> > +        its->suspend_ctx.ctlr =3D readl_relaxed(base + GITS_CTLR);
> > +        ret =3D gicv3_disable_its(its);
> > +        if ( ret )
> > +        {
> > +            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> > +            goto err;
> > +        }
> > +
> > +        its->suspend_ctx.cbaser =3D readq_relaxed(base + GITS_CBASER);
> > +
> > +        for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
> > +            uint64_t baser =3D readq_relaxed(base + GITS_BASER0 + i * =
8);
> > +
> > +            if ( !(baser & GITS_VALID_BIT) )
> > +                continue;
> > +
> > +            its->suspend_ctx.baser[i] =3D baser;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +
> > + err:
> > +    list_for_each_entry_continue_reverse(its, &host_its_list, entry)
> > +        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTL=
R);
> > +
> > +    return ret;
> > +}
> > +
> > +void gicv3_its_resume(void)
> > +{
> > +    struct host_its *its;
> > +    int ret;
> > +
> > +    list_for_each_entry(its, &host_its_list, entry)
> > +    {
> > +        void __iomem *base;
> > +        unsigned int i;
> > +
> > +        base =3D its->its_base;
> > +
> > +        /*
> > +         * Make sure that the ITS is disabled. If it fails to quiesce,
> > +         * don't restore it since writing to CBASER or BASER<n>
> > +         * registers is undefined according to the GIC v3 ITS
> > +         * Specification.
> > +         *
> > +         * Firmware resuming with the ITS enabled is terminally broken=
.
> > +         */
> > +        WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
> > +        ret =3D gicv3_disable_its(its);
> > +        if ( ret )
> > +            continue;
>
> If ITS fails to disable (quiesce), the code skips restoration and ITS
> remains in an unconfigured state. However, immediately after the loop ...
>
>
> > +
> > +        writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
> > +
> > +        /*
> > +         * Writing CBASER resets CREADR to 0, so make CWRITER and
> > +         * cmd_write line up with it.
>
> NIT: The variable "cmd_write" does not exist in the Xen driver. As I
> understand, this comment was ported from the Linux kernel driver as is,
> which maintains a software shadow copy of the write pointer named
> "cmd_write".

Good catch, thanks.
You=E2=80=99re right - cmd_write doesn=E2=80=99t exist in the Xen driver; t=
his comment
was ported from Linux. I=E2=80=99ll drop the cmd_write mention and keep the
comment focused on aligning CWRITER with the reset CREADR.

>
>
> > +         */
> > +        writeq_relaxed(0, base + GITS_CWRITER);
> > +
> > +        /* Restore GITS_BASER from the value cache. */
> > +        for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
> > +            uint64_t baser =3D its->suspend_ctx.baser[i];
> > +
> > +            if ( !(baser & GITS_VALID_BIT) )
> > +                continue;
> > +
> > +            writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
> > +        }
> > +        writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
> > +    }
> > +
> > +    ret =3D gicv3_its_setup_collection(smp_processor_id());
>
>   ... this function iterates over all host ITS instances (including the
> one we skipped) and attempts to send MAPC commands. I am afraid, that
> attempting to write to the command queue of an uninitialized/unrestored
> ITS might have bad consequences.

Good catch, thanks.
Since gicv3_its_setup_collection() iterates over all host ITS instances,
it may send MAPC commands through an ITS that we intentionally skipped or
failed to restore. That=E2=80=99s unsafe. I=E2=80=99ll fix this by invoking=
 collection
setup only for ITS instances successfully restored in this loop.

Best regards,
Mykola



>
> > +    if ( ret )
> > +        panic("GICv3: ITS: resume setup collection failed: %d\n", ret)=
;
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> >
>
> [snip]
>

