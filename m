Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eWdUM49sImoAXAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 08:28:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C46457C7
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 08:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h74l046Z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328984.1593194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVO2Z-0005yD-HE; Fri, 05 Jun 2026 06:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328984.1593194; Fri, 05 Jun 2026 06:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVO2Z-0005vo-EL; Fri, 05 Jun 2026 06:28:23 +0000
Received: by outflank-mailman (input) for mailman id 1328984;
 Fri, 05 Jun 2026 06:28:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVO2X-0005vU-LZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 06:28:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVO2W-00CCT4-Ta
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:28:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a226c7a-5cb7-0a2a0a5109dd-0a2a4508919e-18
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 08:28:20 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a226c84-63b5-0a2a45080019-d155d0afe577-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 08:28:20 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3965adfd75fso15359801fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:28:20 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780640900; cv=none;
        d=google.com; s=arc-20240605;
        b=QzTZTWkiYMsLwYhs9nRTXiQOn4XImw3bridaKpC5Ek8yOtV9Dbq/0bGeq+2Tvf8J3P
         4UbTmUJqkorS+5xKCoBzmQ2wCip1FZEdhpd9vQCSeWruuZwGmMDkQRasp7syq5kNxHr4
         jyyyDqN3NutVXIVEmcCtiC9X+Iy99sGar5yWRfMTuLEp3IVVc9aWExBHvdzESPvtcL/6
         apgRjpfGQyje2yumLD1KjRmobH11xLil0rC1ydKsEqMbTw5hw/UHrWILXf3+8Mvbq8uu
         XUxPl1Bv1SnOgunOoMFS9fbywfF2lP5zCANkbCQ23Sdo18NUJsDzSeqUZ/LedEX35bw6
         wmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/oCNZLE/K3U6qPejGN84fuk45IouiDXzR/jwLXvlg8o=;
        fh=/pLqMcdRjf/dorfJRN20J2cLl73oSdosS5LwTck84O4=;
        b=C0XLyXGWi6tIbTlNoNLWjMocSbcjw71+JXBBLi9xIBn1f4UzbEL+KcvHR120Tyqma7
         r86gLXF3brnXk1YyMdmw01/MfHL+pSo+LqGh454OmoKm/ymJjaxyJQQCdUJNWDUDgFta
         oStQr0Nl4Uld2rXPp/dZOURaLbxrGuv5oaCt5NkKc4T1Rq/5YNZAZYX27WDNhs5ni9Q5
         kGcj1j1e/l1vJCawYwHSW3KNitWpsCFGxD4P6kSXkbG4OebyDr2MSo8B1sAPA+7hWqM0
         0McKZJHl6UYyxuJJXQiT8ZU4HMCzPjjEUjUV6Ge6m4H894tRYLmk0S1peLOgdNFeapZZ
         rMjw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780640900; x=1781245700; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oCNZLE/K3U6qPejGN84fuk45IouiDXzR/jwLXvlg8o=;
        b=h74l046ZRE589/P3nixyqO0HdgIAhOqfY6Cka2mufncPOM4Q+HewXvQsFwIvrhV2NY
         hf57Zcms2Pd74j2Tj5c1SbFgsvcX8+QP6cwfF/7clzRnxBi28ziVkXeSUuuWFD9YdWyU
         /xw7NfwmiicwOO4ko3O8D2kw3stgDwOUbIAVshUt1Hb/Q+BdRwdaaRFUaxeuiAXHssJN
         +EVeDOAdVyLVEJRV2VQ1BC5Gvj7DJB12kj1BiUp4fClBdpf0U1evmgf4SdxvmsZpnQmz
         ZP+Yor+/+rzMZxQKAdA+941EWB1tixlk1CZIK9NxKnSap77k+QB14qPD607DnuMqV/Dx
         tAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640900; x=1781245700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oCNZLE/K3U6qPejGN84fuk45IouiDXzR/jwLXvlg8o=;
        b=NEWeiE0FkhLmqIsBcvkCSBCYyNUPs8L+99pv1HtziQFjOwZee6pSpuso7gGKSCmXgo
         Sq0bXC2db7RFPZ8L3QRBgAjOsUi8XTVg/UGvTe6yNSmwFGXT8tAULk0K108PeFpLG2yO
         HpEW4SeW+2UFLAJMZurXRPEgzE7GyniaVAWCMEl3xpgegN2gbH1yG2uRyaVvAAlacMhE
         7JfsfKD/WRhyvy4VMv1LzJkVxadq2s/NYnuLYizwpZjx96x/Q+7f6iPsiL4VX9RiMdU3
         CH4VvgOsWmD0UU85hUdWMtTh80VbBXn2vVe99gyGoW49jLYWW1hNJY+Z0qwxnnC3axmR
         maGQ==
X-Gm-Message-State: AOJu0YxzS+AZsJs2JvEEt95BIlHupkzLxXs2ocLhzUSFtiKkmF9/n3t8
	g3yZNHxUqnASHMA1LBp56qhU9m+jEBlYzBPlqeTfQxLQwDmJs7KxhtMMHfFz1Uw79Acq+aB1c7h
	xehIHkAJQXOFh1f+GWBIyURYe5A2ybfE=
X-Gm-Gg: Acq92OFrbkR1T6TO1cAxd+Ru5Q0IDRdiOTC3fdmNubQMRbzMtvo7z6x83DDB6uE0mYv
	rKq7+3a97ClpPV8+jfi9sz/yNX6Jhoe4EIUDgcjhTf1PiCBeMmDkFnotGdpKrBJ6JoXnNa45ADE
	VMZukd1pf4cabdUolATrBIreNdJHb23w4S1CxmkKfYQs8HcdKZz5YYHAZtHNgO47VQNl0EfKxsm
	INz7r6xtb61ixPhWBTVxbbZxkFe55NUMw6vJIbVnui4cgE7tuQKOTf5dgGh1odQT70XRDQaaR2Y
	CBjk44zOiVWwwSnj
X-Received: by 2002:a2e:9a16:0:b0:396:a6d3:f04d with SMTP id
 38308e7fff4ca-396d0895474mr5404621fa.14.1780640899332; Thu, 04 Jun 2026
 23:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779922874.git.mykola_kvach@epam.com> <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <a2f1164d-ade6-4355-95da-f8c246613e9f@gmail.com>
In-Reply-To: <a2f1164d-ade6-4355-95da-f8c246613e9f@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Jun 2026 09:28:07 +0300
X-Gm-Features: AVHnY4KrmWUg65ssLuGVAd4qOpuB1dKMGoxvQbkjqbTZeMvyAxUiMs4R4MeCAeg
Message-ID: <CAGeoDV9PfXYNDCOWv7HYUi8-C-27rwFOXxZVcsG3UvKdLt0FHA@mail.gmail.com>
Subject: Re: [PATCH for-4.22 v2 1/4] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1780640900-BCB64DB1-D31C0D3F/0/0
X-purgate-type: clean
X-purgate-size: 6795
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail.gmail.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 282C46457C7

Hi Oleksandr,

Thanks for the review.

On Wed, Jun 3, 2026 at 2:19=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@gmai=
l.com> wrote:
>
>
>
> On 5/28/26 03:25, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > gicv3_lpi_init_host_lpis() allocates host LPI state, including the
> > host LPI lookup table, CPU notifier state and the boot CPU pending tabl=
e.
> > Those allocations use gicv3_its_get_memflags().
> >
> > ITS workarounds are discovered from gicv3_its_init(), so allocating hos=
t
> > LPI state from gicv3_dist_init() can happen before the memory restricti=
ons
> > required by the ITS are known. On affected systems this can leave
> > Redistributor LPI state allocated and programmed with the default memor=
y
> > policy.
> >
> > Move host LPI initialization after gicv3_its_init(), and only run it wh=
en
> > a host ITS was found. The old call ignored the return value. Now that t=
he
> > call is made from gicv3_init(), check it and panic on failure because
> > Redistributor LPI initialization relies on that state being available.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - Replace the v1 ITS pre-initialization hook with the less invasive
> >    approach suggested during review: move the existing host LPI
> >    initialization after gicv3_its_init().
>
>
> Just for the context: The original review suggestion [1] was to consider
> splitting gicv3_lpi_init_host_lpis() and defer only the portions that
> depend on ITS quirks being known, specifically the allocation of the
> per-CPU pending table for the boot CPU (gicv3_lpi_allocate_pendtable),
> which is the actual consumer of gicv3_its_get_memflags(). But here, the
> whole gicv3_lpi_init_host_lpis() is moved, so the scope of the deferral
> is broader.
>
> [1]
> https://patchew.org/Xen/cover.1774431310.git.mykola._5Fkvach@epam.com/a77=
32487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola._5Fkvach@epam.c=
om/
>
> > - Check gicv3_lpi_init_host_lpis() and panic on failure, matching the f=
atal
> >    nature of host LPI setup once ITS initialization succeeded.
>
> So, this patch appears to fix two distinct issues:
>
> - ordering issue (LPI init occurring before ITS quirks are known)
> - unchecked return value from gicv3_lpi_init_host_lpis()
>
> Should these warrant Fixes: tag(s)?

Yes, I agree that the patch should carry Fixes tags.

For the ordering issue, I think the relevant tag is:

Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for
Renesas Gen4 ITS")

For the ignored return value, I think the first commit where this became
observable is:

Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")

The original call site already ignored the return value, but at that
point gicv3_lpi_init_host_lpis() could not fail in practice.
dcb6cb263689 introduced the host LPI array allocation and made the
function return -ENOMEM, so the ignored return value became meaningful
there. Later, 69589c374a92 added another meaningful failure path through
the boot CPU pending-table allocation, but dcb6cb263689 seems to be the
earliest commit where the return value became relevant.

>
>
> > ---
> >   xen/arch/arm/gic-v3.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index 17ff85ef5d..acdac22953 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -764,9 +764,6 @@ static void __init gicv3_dist_init(void)
> >       type =3D readl_relaxed(GICD + GICD_TYPER);
> >       nr_lines =3D 32 * ((type & GICD_TYPE_LINES) + 1);
> >
> > -    if ( type & GICD_TYPE_LPIS )
> > -        gicv3_lpi_init_host_lpis(GICD_TYPE_ID_BITS(type));
> > -
> >       /* Only 1020 interrupts are supported */
> >       nr_lines =3D min(1020U, nr_lines);
> >       gicv3_info.nr_lines =3D nr_lines;
> > @@ -1990,6 +1987,17 @@ static int __init gicv3_init(void)
> >           res =3D gicv3_its_init();
> >           if ( res )
> >               panic("GICv3: ITS: initialization failed: %d\n", res);
> > +
> > +        /*
> > +         * Host LPI allocation uses ITS-derived memory attributes, so =
defer it
> > +         * until after gicv3_its_init() has discovered ITS workarounds=
.
> > +         */
> > +        if ( gicv3_its_host_has_its() )
>
> This looks like a behaviour change. The condition is narrowed from "GICD
> advertises LPI support" to "host ITS is present". As a result, on a
> system where GICD_TYPE_LPIS is set but no ITS is present, LPI-specific
> variables and data structures will no longer be initialized or
> allocated. If I am not mistaken, software-generated LPIs without ITS
> involvement are currently unsupported, so this change might be safe.
> However, I think the commit message should explicitly document this
> behaviour change and explain why it is safe.

Regarding the behaviour change: yes, it is intentional, and I agree that
it should be documented in the commit message.

The patch narrows the condition from "GICD advertises LPIs" to "a host
ITS was discovered". Xen currently has no supported LPI path without a
host ITS: gicv3_lpi_init_rdist() already rejects that case with
-ENODEV. Therefore, on systems where GICD_TYPE_LPIS is set but no host
ITS is present, deferring and gating gicv3_lpi_init_host_lpis() only
avoids allocating host LPI state which cannot be used by a supported Xen
LPI path.

The CPU notifier is registered from gicv3_lpi_init_host_lpis() itself, so
when host LPI initialization is skipped for the no-host-ITS case, the
secondary-CPU pending-table allocation path is not enabled either.

I kept the whole gicv3_lpi_init_host_lpis() deferral in one piece to
keep the 4.22 release fix small. Splitting out only the boot CPU
pending-table allocation would be possible, but it would make the fix
more invasive.

If the patch is otherwise acceptable, could the Fixes tags and the
clarification below be folded into the commit message when applying it?
Otherwise I can send a v3 of patch 1 only with just commit-message and
trailer updates.

Suggested commit-message fold-in:

This also narrows the condition for host LPI initialization from
"GICD advertises LPIs" to "a host ITS was discovered". This is
intentional: Xen currently has no supported LPI path without a host ITS,
and gicv3_lpi_init_rdist() already rejects that case with -ENODEV.
Therefore, on systems where GICD_TYPE_LPIS is set but no host ITS is
present, skipping gicv3_lpi_init_host_lpis() only avoids allocating host
LPI state that cannot be used by a supported Xen LPI path.

Best regards,
Mykola

