Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KBHnCvjGH2oxpwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:17:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F20634984
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:17:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Hn9N7EcG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325716.1591034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeuU-0002ne-S3; Wed, 03 Jun 2026 06:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325716.1591034; Wed, 03 Jun 2026 06:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeuU-0002kt-OD; Wed, 03 Jun 2026 06:17:02 +0000
Received: by outflank-mailman (input) for mailman id 1325716;
 Wed, 03 Jun 2026 06:17:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wUeuS-0002kn-Rj
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:17:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUeuR-00EXQq-OK
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:16:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fc6d4-bab6-0a2a0a5309dd-0a2a45059076-18
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:16:59 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fc6db-aaa8-0a2a45050019-d155d0b0f0ec-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:16:59 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3966c0d5ac9so39995921fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:16:59 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780467419; cv=none;
        d=google.com; s=arc-20240605;
        b=M87cczUCngiop/7GGo5kjWkgq6KV5kjvP5zwfXWPr+VnmwXAs5OIsjuq8wDOvNJShm
         Z85BEXQ4ba/kVhRzYvisWdbYtPj+KUGmS+CRSYASxQvvFD1Q3nzRiV6vUWFj922UKXi9
         IaK8Srohhd70rSxf7ebZhfXn9sJBho4E7QJ80wKh2lT7DA9BON1Xkm3HfpMlsaa/UqWb
         Xw+706rPIPFsoklvkztKD8GUFQYFHbGNJL46RBUqks453KXLCqU7PFlKcpskkXxocdJ0
         bVjy3OQ1f8hr9+hDjjjRMGtEdkDNZdrqu5Tv5/JHuHWg0vMBk/BjaDRazixxM/Trqpk9
         6txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Gbn8C+ngFaJ5fmzaU+PDk7pr8Jqi1c2CmeL3komLxQ=;
        fh=iwcJT2uhJVV0dNYrVkXeWtDc2JskE1SnCuC/DHT5iTQ=;
        b=IGSydQ94iIRc/7MFIV0zv4aK9qJC0I7XD4oL6i1xEWoMGBxFLcjnDdaOWQADIsNYGC
         bhJQf/P99A3++shCdahIcMwV55ZiFUwwqAZFpzbWsoda1NBx0N9CpdCof0JWaRDCfxNa
         bLONy+GCYSjnIQQxszxqI0DOloAtJ5lyxcnIcS123PtXqCrBJWWhkLXh/9vkns4cn6mN
         7sQBXlbfVZkbGJDx7ym7u8vnjx4hQMV56LfhIsfjVREw+5LME1n6/R2AixX6m3ldsj4S
         ov65GbqRdQ+KBwOQwa/0Eca0ylMpG70w0Iomcg0w030mPmn8NFFq1A75gdEK9W0+ZB8A
         HbcQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780467419; x=1781072219; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Gbn8C+ngFaJ5fmzaU+PDk7pr8Jqi1c2CmeL3komLxQ=;
        b=Hn9N7EcGEiOdPGKkp3XoG3QRvlDHiPP2L/9gRXRx/guBC/gS8loFVyrrez7nUc/4z9
         Or0AXDuMIqJaZDAWaeOVoLZ2dKcLFjVelFOg/rtMu6SKgCXOftwCCDNfbnRQw29eckkl
         NWyXGSH3uJazVR1S5GgCndqbPZgmK0QR5sfEPQIm+GjShBSKfp0+yf3ixWq8ELuFkdK1
         RegnmIA9Xwld5uVQ8wlhXqK05TtwdOEz9z1Ej2UiWbBHCtIyE4Es07NHT3lVIT7Twj1H
         mByG4hTrttVPWii+ejE2CwGBcVyc5wstT1GFo7jyQAu982ZNj4QyIDZyu+C3aaMMGO3a
         RYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780467419; x=1781072219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Gbn8C+ngFaJ5fmzaU+PDk7pr8Jqi1c2CmeL3komLxQ=;
        b=kfEDVrqvIr5cqbYXnqLlxA8YScZ6EQbuqevkg1fvEGi/yg4Hb0Ws8MMQFZw1n/D2xU
         K0sw++AhicRJ66RD3eFMabpudufTBtdDsm8Z9FJPjCX6gTpih0j1w2np+O5cQWZ4cAXc
         GEsVGwgw5sFBkUszWr9T5GjyfRgaCzy6VyiY84uRVwVD35jbD3iMrm9oi895JE5DU2zp
         zBF61cw21tcXHPLZ3qJQtRSsQan8GCeEy64M+buuQVQJsM43HNOr9UOqan4vs11CxRB5
         u4/2dSWtJP0KhBhIJmtMaOIqmCd8UTWUCGHyO1XWST6X03DCqsE2Y725CH4sKT087r1x
         Thow==
X-Gm-Message-State: AOJu0YzmiHDvzPMwDsvEDzyxqhnfK2iP/QnvZfVEYIJtEXhMW7sPkbrT
	XfejGpcKILqJXRRnIIKCbluBt4HjdrSKZQMlPkGKN+Gq3cV/sxC5ZSfRX7E2iMlo1CRbxEzaxB4
	LLnu8ujHOeKMuIQ1ji1FU9d2+IPtS8FA=
X-Gm-Gg: Acq92OGO++ojuvVSIvbYY68amkgO+GW0v32rAjZrWz9oTNu6W+XmMkzYSuc/hBjtoKj
	0MFKbYQvITxTfrU2Tw12fb+NUVF89UnC3PFZ7iKyV3TL+kJB/vRlr7vxdPzajQCzaYG1SoQB/uY
	SRB9HR+k96XQYFmr1fBXGGFshLQRMniB4yc089FFglHDRgRcuh+tyEromyCgXcP+M4F3rUBZRge
	vwzl3E03vo8/nD+8cdIsB9q8GXgXxAb6RnuHCrdloetfkreNuKFPA5jcMW4FosvKQldiiPcs4HH
	94CpDXpIAlqrAfQe
X-Received: by 2002:a2e:be8f:0:b0:394:1192:5e0c with SMTP id
 38308e7fff4ca-396af46741amr5740381fa.21.1780467418626; Tue, 02 Jun 2026
 23:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779385072.git.mykola_kvach@epam.com> <1d49511fff3ef5f77bc2d4daac00e6895c1359b1.1779385072.git.mykola_kvach@epam.com>
 <63daeec4-a691-4d6f-b75a-bf34965b26f4@gmail.com>
In-Reply-To: <63daeec4-a691-4d6f-b75a-bf34965b26f4@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Jun 2026 09:16:47 +0300
X-Gm-Features: AVHnY4LYgCHdBZyM56QFjEnOyLzE-U2I6b-d74aQG71ytRUqsfNi-ShqnALCuSE
Message-ID: <CAGeoDV9-cYBbVkRqsWBDCUM_7h5QgzGTAoUasEk-XWNx11Q3vw@mail.gmail.com>
Subject: Re: [PATCH v10 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1780467419-E2790443-6DC1F7E8/0/0
X-purgate-type: clean
X-purgate-size: 20737
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70F20634984

Hi Oleksandr,

Thank you for the review.

On Mon, May 25, 2026 at 9:13=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 5/21/26 20:45, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
> > capability for platforms where the hardware domain can be parked with
> > SHUTDOWN_suspend without calling hwdom_shutdown().
> >
> > Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
> > non-control domains, including the hardware domain when it is not actin=
g
> > as a control domain, the call is handled as a guest/domain suspend requ=
est
> > and parks the domain in SHUTDOWN_suspend.
> >
> > Control domains need additional sequencing because their SYSTEM_SUSPEND
> > request is used to coordinate host-wide suspend. A non-last awake contr=
ol
> > domain may be parked in SHUTDOWN_suspend without requiring the host
> > suspend path to be available. The last awake control domain is treated =
as
> > the point where the request becomes a host-suspend request, and it may
> > only proceed when all non-control domains are already in SHUTDOWN_suspe=
nd
> > and the host suspend path is available.
> >
> > Keep the control-domain sequencing and domain-readiness checks out of
> > PSCI_FEATURES. They are per-attempt runtime conditions rather than stab=
le
> > PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
> > vPSCI and report attempt-time policy failures as PSCI_DENIED.
> >
> > Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEN=
D
> > so that SHUTDOWN_suspend from the hardware domain can be treated as a
> > domain suspend state rather than as a hardware-domain initiated host
> > shutdown. This does not by itself imply that host-wide suspend is
> > available.
> >
> > Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPE=
ND
> > capability with runtime blockers reported by Xen-owned subsystems. Add
> > runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
> > paths lacking suspend/resume support. These blockers are runtime based,
> > so they only apply to drivers or paths that Xen actually uses on the
> > platform. For SMMUv3, the blocker applies only when Xen actually uses t=
he
> > MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
> > registers yet.
> >
> > Add a struct domain forward declaration to xen/suspend.h so the generic
> > header can expose arch_domain_resume() without requiring a full domain.=
h
> > include.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V10:
> > - Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
> >    control domain cannot proceed to host suspend, keeping PSCI_FEATURES
> >    stable once SYSTEM_SUSPEND is advertised.
> > - Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
> >    control domain.
> > - Mark serial_suspend_available as __ro_after_init.
> > - Mention the struct domain forward declaration added to xen/suspend.h.
>
> I did not spot obvious issues while reviewing this patch, so you can add:
>
> Reviewed-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
>
> Several nits/remarks below, feel free to skip them if you find them
> irrelevant or not useful.
>
>
> >
> > Changes in V9:
> > - Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSP=
END
> >    so that hardware-domain SHUTDOWN_suspend support is not tied to
> >    host-wide system suspend availability.
> > - Add runtime host suspend blockers for Xen-owned subsystems lacking
> >    suspend/resume support.
> > - Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforc=
e
> >    control-domain sequencing in the call handler.
> > ---
> >   xen/arch/arm/Kconfig                  |   1 +
> >   xen/arch/arm/gic.c                    |   6 ++
> >   xen/arch/arm/include/asm/psci.h       |   3 +
> >   xen/arch/arm/include/asm/suspend.h    |  10 ++-
> >   xen/arch/arm/psci.c                   |   7 ++
> >   xen/arch/arm/suspend.c                |  40 +++++++++
> >   xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++--=
-
> >   xen/common/Kconfig                    |   3 +
> >   xen/common/domain.c                   |   7 +-
> >   xen/drivers/char/serial.c             |  12 +++
> >   xen/drivers/passthrough/arm/iommu.c   |   4 +
> >   xen/drivers/passthrough/arm/smmu-v3.c |   4 +
> >   xen/include/xen/serial.h              |   1 +
> >   xen/include/xen/suspend.h             |   2 +
> >   14 files changed, 201 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 79622b46a1..54a5bfb9ae 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -19,6 +19,7 @@ config ARM
> >       select HAS_ALTERNATIVE if HAS_VMAP
> >       select HAS_DEVICE_TREE_DISCOVERY
> >       select HAS_DOM0LESS
> > +     select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
> >       select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
> >       select HAS_STACK_PROTECTOR
> >       select HAS_UBSAN
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 7727ffed5a..60488c95b4 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -26,6 +26,7 @@
> >   #include <asm/device.h>
> >   #include <asm/io.h>
> >   #include <asm/gic.h>
> > +#include <asm/suspend.h>
> >   #include <asm/vgic.h>
> >   #include <asm/acpi.h>
> >
> > @@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(v=
oid)
> >   void register_gic_ops(const struct gic_hw_operations *ops)
> >   {
> >       gic_hw_ops =3D ops;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !ops->suspend || !ops->resume )
> > +        host_system_suspend_disable("GIC driver lacks suspend support"=
);
> > +#endif
> >   }
> >
> >   static void clear_cpu_lr_mask(void)
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index bb3c73496e..142fa1bfe5 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
> >   void call_psci_system_off(void);
> >   void call_psci_system_reset(void);
> >   int call_psci_system_suspend(void);
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +bool psci_system_suspend_allowed(void);
> > +#endif
> >
> >   /* Range of allocated PSCI function numbers */
> >   #define     PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index c848fc6340..50dc6e9fdf 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
> >
> >   int prepare_resume_ctx(void);
> >   void hyp_resume(void);
> > -#endif /* CONFIG_SYSTEM_SUSPEND */
> > +bool host_system_suspend_allowed(void);
> > +void host_system_suspend_disable(const char *reason);
> > +
> > +#else /* !CONFIG_SYSTEM_SUSPEND */
> > +
> > +static inline bool host_system_suspend_allowed(void) { return false; }
> > +static inline void host_system_suspend_disable(const char *reason) {}
> > +
> > +#endif
> >
> >   #endif /* ARM_SUSPEND_H */
> >
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index e05dae1133..e9d78668fd 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
> >
> >   #define PSCI_RET(res)   ((int32_t)(res).a0)
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +bool psci_system_suspend_allowed(void)
> > +{
> > +    return has_psci_system_suspend;
> > +}
> > +#endif
> > +
> >   int call_psci_cpu_on(int cpu)
> >   {
> >       struct arm_smccc_res res;
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index 6ea4a0f9cc..98ddd46a47 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,9 +1,49 @@
> >   /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/psci.h>
> >   #include <asm/suspend.h>
> >
> > +#include <xen/lib.h>
> > +#include <xen/serial.h>
> > +
> >   struct resume_cpu_context resume_cpu_context;
> >
> > +/*
> > + * Non-PSCI infrastructure can make host suspend impossible even when =
the PSCI
> > + * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has=
 no valid
> > + * suspend/resume path.
> > + *
> > + * This gate is checked only when the last awake control domain attemp=
ts to
> > + * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
> > + */
> > +static bool host_system_suspend_runtime_allowed =3D true;
>
> All callers of host_system_suspend_disable() appear to execute during
> boot. I noticed you added __ro_after_init to serial_suspend_available
> (same lifecycle), making the omission here a bit inconsistent. Should
> host_system_suspend_runtime_allowed be marked as __ro_after_init as
> well? Or I missed something?

Good point. I kept it writable with a possible future runtime policy path i=
n
mind, but this series only has boot-time callers.

I will mark it __ro_after_init and rename it to avoid implying that it rema=
ins
a runtime policy knob. If we later add a real runtime blocker, that patch c=
an
remove the annotation and explain the new lifetime requirement.

>
> > +
> > +static bool host_serial_suspend_allowed(void)
> > +{
> > +    if ( serial_suspend_supported() )
> > +        return true;
> > +
> > +    printk_once(XENLOG_INFO
> > +                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
> > +
> > +    return false;
> > +}
> > +
> > +bool host_system_suspend_allowed(void)
> > +{
> > +    return psci_system_suspend_allowed() &&
> > +           host_serial_suspend_allowed() &&
> > +           host_system_suspend_runtime_allowed;
> > +}
> > +
> > +void host_system_suspend_disable(const char *reason)
> > +{
> > +    host_system_suspend_runtime_allowed =3D false;
> > +
> > +    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
> > +           reason ? reason : "unsupported suspend/resume path");
>
> On a system with N SMMUv3 instances using MSIs (each calling
> host_system_suspend_disable() from arm_smmu_setup_msis()),
> the same message is printed N times...

Good point. I do not want to make host_system_suspend_disable() globally
one-shot, because different subsystems may report different blockers and th=
at
information is useful.

I will handle this at the SMMUv3 caller instead, so the MSI IRQ path disabl=
es
host suspend only once.

>
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index ac6af6118f..0bae42c1bd 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -5,6 +5,7 @@
> >
> >   #include <asm/current.h>
> >   #include <asm/domain.h>
> > +#include <asm/suspend.h>
> >   #include <asm/vgic.h>
> >   #include <asm/vpsci.h>
> >   #include <asm/event.h>
> > @@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
> >       domain_shutdown(d,SHUTDOWN_reboot);
> >   }
> >
> > +/*
> > + * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend t=
ransition,
> > + * so multiple control domains cannot all observe each other as still =
awake.
> > + */
> > +static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
> > +
> > +static bool domain_in_suspend_state(struct domain *d)
> > +{
> > +    bool suspended;
> > +
> > +    spin_lock(&d->shutdown_lock);
> > +    suspended =3D d->is_shut_down && d->shutdown_code =3D=3D SHUTDOWN_=
suspend;
> > +    spin_unlock(&d->shutdown_lock);
> > +
> > +    return suspended;
> > +}
> > +
> > +static int32_t domain_psci_system_suspend_policy(struct domain *d)
> > +{
> > +    struct domain *other;
> > +    bool last_awake_control_domain =3D true;
> > +    bool awake_non_control_domain =3D false;
> > +
> > +    /* Only control domains participate in sequencing policy. */
> > +    if ( !is_control_domain(d) )
> > +        return 0;
> > +
> > +    rcu_read_lock(&domlist_read_lock);
> > +
> > +    for_each_domain ( other )
> > +    {
> > +        bool suspended;
> > +
> > +        if ( other =3D=3D d )
> > +            continue;
> > +
> > +        suspended =3D domain_in_suspend_state(other);
> > +        if ( suspended )
> > +            continue;
> > +
> > +        if ( is_control_domain(other) )
> > +        {
> > +            last_awake_control_domain =3D false;
> > +            break;
> > +        }
> > +
> > +        awake_non_control_domain =3D true;
> > +    }
> > +
> > +    rcu_read_unlock(&domlist_read_lock);
> > +
> > +    /*
> > +     * Another control domain is still awake. This request is only the=
 first
> > +     * phase of the sequencing: park this control domain and leave the=
 host
> > +     * running. Host-wide suspend gates must not block this intermedia=
te state.
> > +     */
> > +    if ( !last_awake_control_domain )
> > +        return 0;
> > +
> > +    /*
> > +     * This is the last awake control domain. It must not be parked un=
less the
> > +     * request can proceed as a host-suspend request; otherwise Xen wo=
uld lose
> > +     * the last domain that can coordinate the system suspend.
> > +     */
> > +    if ( awake_non_control_domain )
> > +    {
> > +        printk(XENLOG_DEBUG
> > +               "SYSTEM_SUSPEND denied for %pd: non-control domains awa=
ke\n",
> > +               d);
> > +        return PSCI_DENIED;
> > +    }
> > +
> > +    /*
> > +     * Host-wide gates are relevant only for the last-control-domain c=
ase. They
> > +     * must not block parking of a non-last control domain, but they m=
ust deny
> > +     * the last control domain when host suspend is not currently avai=
lable.
> > +     */
> > +    if ( !host_system_suspend_allowed() )
> > +        return PSCI_DENIED;
> > +
> > +    return 0;
> > +}
> > +
> >   static int32_t do_psci_1_0_system_suspend(register_t epoint, register=
_t cid)
> >   {
> >       int32_t rc;
> > @@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register=
_t epoint, register_t cid)
> >       if ( is_64bit_domain(d) && is_thumb )
> >           return PSCI_INVALID_ADDRESS;
> >
> > -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > -    if ( is_hardware_domain(d) )
> > -        return PSCI_NOT_SUPPORTED;
> > -
> >       /* Ensure that all CPUs other than the calling one are offline */
> >       domain_lock(d);
> >       for_each_vcpu ( d, v )
> > @@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(registe=
r_t epoint, register_t cid)
> >       if ( rc )
> >           return PSCI_DENIED;
> >
> > -    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +    spin_lock(&vpsci_system_suspend_lock);
> > +
> > +    rc =3D domain_psci_system_suspend_policy(d);
> > +    if ( !rc )
> > +    {
> > +        rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +        if ( rc )
> > +            rc =3D PSCI_DENIED;
> > +        else
> > +        {
> > +            rctx->ctxt =3D ctxt;
> > +            rctx->wake_cpu =3D current;
> > +        }
> > +    }
> > +
> > +    spin_unlock(&vpsci_system_suspend_lock);
> > +
> >       if ( rc )
> >       {
> >           free_vcpu_guest_context(ctxt);
> > -        return PSCI_DENIED;
> > +        return rc;
> >       }
> >
> > -    rctx->ctxt =3D ctxt;
> > -    rctx->wake_cpu =3D current;
> > -
> >       gprintk(XENLOG_DEBUG,
> >               "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=
=3D%#"PRIregister"\n",
> >               epoint, cid);
> > @@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_=
func_id)
> >       case PSCI_0_2_FN32_SYSTEM_RESET:
> >       case PSCI_1_0_FN32_PSCI_FEATURES:
> >       case ARM_SMCCC_VERSION_FID:
> > -        return 0;
> >       case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >       case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > -        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTE=
D : 0;
> > +        return 0;
> >       default:
> >           return PSCI_NOT_SUPPORTED;
> >       }
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index 5ff71480ee..816a1a4ecb 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -140,6 +140,9 @@ config HAS_EX_TABLE
> >   config HAS_FAST_MULTIPLY
> >       bool
> >
> > +config HAS_HWDOM_SYSTEM_SUSPEND
> > +     bool
> > +
> >   config HAS_IOPORTS
> >       bool
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index bb9e210c28..d3edfb2a13 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1375,6 +1375,11 @@ void __domain_crash(struct domain *d)
> >       domain_shutdown(d, SHUTDOWN_crash);
> >   }
> >
> > +static inline bool want_hwdom_shutdown(uint8_t reason)
> > +{
> > +    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
> > +           reason !=3D SHUTDOWN_suspend;
> > +}
> >
> >   int domain_shutdown(struct domain *d, u8 reason)
> >   {
> > @@ -1391,7 +1396,7 @@ int domain_shutdown(struct domain *d, u8 reason)
> >           d->shutdown_code =3D reason;
> >       reason =3D d->shutdown_code;
> >
> > -    if ( is_hardware_domain(d) )
> > +    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
> >           hwdom_shutdown(reason);
> >
> >       if ( d->is_shutting_down )
> > diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
> > index adb312d796..e5348b5445 100644
> > --- a/xen/drivers/char/serial.c
> > +++ b/xen/drivers/char/serial.c
> > @@ -497,6 +497,8 @@ const struct vuart_info *serial_vuart_info(int idx)
> >
> >   #ifdef CONFIG_SYSTEM_SUSPEND
> >
> > +static bool __ro_after_init serial_suspend_available =3D true;
> > +
> >   void serial_suspend(void)
> >   {
> >       int i;
> > @@ -513,6 +515,11 @@ void serial_resume(void)
> >               com[i].driver->resume(&com[i]);
> >   }
> >
> > +bool serial_suspend_supported(void)
> > +{
> > +    return serial_suspend_available;
> > +}
> > +
> >   #endif /* CONFIG_SYSTEM_SUSPEND */
> >
> >   void __init serial_register_uart(int idx, struct uart_driver *driver,
> > @@ -521,6 +528,11 @@ void __init serial_register_uart(int idx, struct u=
art_driver *driver,
> >       /* Store UART-specific info. */
> >       com[idx].driver =3D driver;
> >       com[idx].uart   =3D uart;
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( !driver->suspend || !driver->resume )
> > +        serial_suspend_available =3D false;
> > +#endif
> >   }
> >
> >   void __init serial_async_transmit(struct serial_port *port)
> > diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthro=
ugh/arm/iommu.c
> > index 100545e23f..547048af05 100644
> > --- a/xen/drivers/passthrough/arm/iommu.c
> > +++ b/xen/drivers/passthrough/arm/iommu.c
> > @@ -19,6 +19,7 @@
> >   #include <xen/device_tree.h>
> >   #include <xen/iommu.h>
> >   #include <xen/lib.h>
> > +#include <xen/suspend.h>
> >
> >   #include <asm/device.h>
> >
> > @@ -46,6 +47,9 @@ void __init iommu_set_ops(const struct iommu_ops *ops=
)
> >       }
> >
> >       iommu_ops =3D ops;
> > +
> > +    if ( !ops->suspend || !ops->resume )
> > +        host_system_suspend_disable("IOMMU driver lacks suspend suppor=
t");
>
> I was initially wondering why the suspend/resume checks for the GIC and
> serial are wrapped in #ifdef CONFIG_SYSTEM_SUSPEND, but the IOMMU check
> is not, despite host_system_suspend_disable() acting as no-op when
> CONFIG_SYSTEM_SUSPEND=3Dn. Then I realized the divergence here because th=
e
> suspend/resume members in struct iommu_ops are not gated with #ifdef,
> unlike those in struct gic_hw_operations and struct uart_driver.

Yes, that was the reason for the difference: the IOMMU suspend/resume hooks
are part of the common iommu_ops and are not specific to Arm SYSTEM_SUSPEND=
.

I do not think this series should gate the common iommu_ops members with
CONFIG_SYSTEM_SUSPEND, because they are also used by other suspend paths.

That said, the check in arm/iommu.c is only there to update the Arm host
SYSTEM_SUSPEND policy, so I can wrap just that check in
#ifdef CONFIG_SYSTEM_SUSPEND to make the intent match the GIC and serial
cases.

Best regards,
Mykola

