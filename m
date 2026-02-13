Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHuXNeIMj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80F135C2D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230646.1536074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrTV-0001KN-LL; Fri, 13 Feb 2026 11:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230646.1536074; Fri, 13 Feb 2026 11:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrTV-0001ID-Ih; Fri, 13 Feb 2026 11:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1230646;
 Fri, 13 Feb 2026 11:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hMq=AR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vqrTU-0001I7-2m
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:36:40 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41dc3126-08d0-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 12:36:37 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-385c23b88e8so6224761fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 03:36:37 -0800 (PST)
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
X-Inumbo-ID: 41dc3126-08d0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770982597; cv=none;
        d=google.com; s=arc-20240605;
        b=e8vKHxTR72X/T2MHvsUO8A9qLmhlG5CG+xGyCEKUXUOEzirRfQ6mTRDIZre2i09eau
         /vh8SC2uQUY8KXmbQEtffsHYK6UMLtIAVgTaebqez241IvS7oRhEF41CbDwZQXtx/dhP
         J6u130/34taJ37zYQUPRxCKF0MOIPz3wptHXxI2Pu168M6afn3Y31DtSKVQj85inpwW5
         DuF6ipSe+HwU12fmN0f/Bids+ArrHB4PJgGN+8DB+pWA261b7s5BhS7eYY9a1pp8cFmH
         E4Vr9Ica1ie+tMuEfVu9ix05jBL5iIBvRgbBmQAw/J0ZzPjII7lGvK6L9j+gvwVIxJlm
         xANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UnPv9KiFSPEOkVb6MxO7U1B7FDw+Z5g3/NsEo1eGHaA=;
        fh=xb/cHUj5Dkiq29tc/GObLonP7CwqIr/XEXKhefoZggg=;
        b=LX+WWT/5AW4GhFd379ZcCSUptF75P8VbRXqS/3IjvJFcXgzSCPg8kQhvtAb5VqDj6p
         4GyS/hfVIUo2UoQ9UxiS05800ZDu4VTlghDTvMBN98W0+W9fWe+WJK+IuiHE9KwlcP98
         EV7qFqu2UImHGOqef7etCSQ4NBNBFXQoEh76YNph7lhbODgakBpUQ7Gu6jFgMzw1cEsj
         GmTWHfbCXaSntBL//F8FXOkI1D0uRHaH9Xps3VkrFkBa+mN+H6NXQCUMDCsG3H1TMOPG
         vw/lMwLhUrYjuz1PhR3Hal+iN19xA1Xd7S0zOVMBMRA3Gi88uCvr3ZQhPdAcoVm79qEb
         niBg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770982597; x=1771587397; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnPv9KiFSPEOkVb6MxO7U1B7FDw+Z5g3/NsEo1eGHaA=;
        b=Pm6LBJ+Y7gHVEUNsxvfrKKjHAs7axAxEWK7kWRB2xXMrSbom5BVle0aCdS/TXi5YcZ
         BOadlz6ehP31lQBFMJ5OyN3P+ZhYmAq/PGXmAh1FLHkIB/1MYur55Jg9SiEhoMWsKfVt
         7rXFL86HL2dksdB5mWJpIh9AOokZcyruV6eBnDEH0Y7slB199/JgCSqu2SQwoTXo0c1k
         IE9SV44FlKOFx54MELUYhS3uvRdBZRfjxgFpOwUV7F1lN1pp5zg/qB7P5oiU5HQpi4V8
         +T2Xvgbjjp1xz0PrwYBQHYZigvY832MK5XLmcW+Azg/U/Z574IBZSE+UApaNDHxl5kxj
         7hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770982597; x=1771587397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnPv9KiFSPEOkVb6MxO7U1B7FDw+Z5g3/NsEo1eGHaA=;
        b=B6bSVKi/J9a+LmB8ixcn6jkqOelEvwPJDCj/EkRmpSsEAbQCIlsXsU7oyYMWDa51M/
         Tzf2MZm6KaqgFtKtDHyavxpoY+tRmgbw3ZbLgDrtmk9s9YSkaIhBcMjS4JXrikpMd/EL
         zlnyLdngheLi9l8YR1Z2jxye2huDjg8ZwsT5TRUDi51sAFI9qN0iA6++X4E9rBGgoMwC
         sNrnfUcym7LW5L9B497BrBFUdERmc8+tWyrFvt95tBlWoCLqMFjZORgSS9ClXbvKuGwb
         quZ4YRTH15F2+6fUMT/zbKWe7ilio9QxGxJGDhyPl4kFJZGSqq7+oERmpHs1QbwpPVJE
         f1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUzp7klpuTDbGMLBPMMkvhBYXWm9WYYTvrGNGmr2pKKE7kDxP1M6dgJF5YpupLkqfHk1zWwb0q+YFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5pp5gLYB4DCiGp6Aen7IqkWwmmhdyNEkpohHx0P4VszMYjEI9
	IxR4tj2QbiB7mKKNSAQGnExHcPLYCxkh70LPXsXuXhZQD0KaqQbOauHdM+a1NCPbENG4z9SySby
	fQdeV6/k/e/q7FtooO53TtxFzCtRb3Jafkfvjvx8=
X-Gm-Gg: AZuq6aJ/3dB7X8cWVjU6Ut4e7kB5Iz2DrIAOSEt7giM/r0ZqD6cQNzUTWxKEi1H0C06
	pQLtATzFxNgsP9qkfXRV2sgGVr+6bXUAknUVaRLaRdsnPoHdJ1j02r1vzDmPsYv6KVBJw5KkLH5
	sUVWnUQwDLDFMoaTfQYB/drPpmilev8QULtgG+K8Z2qjVlnDaaqL75FoPGb+JKd7uJ6doggXocT
	aDakIif6gN8RJ6MVzBweLVipgsocypVEsvEjfC2OOazcOZ9iboyyWigReQLvGK6VXt5WP/BDF/A
	h7p9pA==
X-Received: by 2002:a05:651c:150d:b0:385:da1e:3d71 with SMTP id
 38308e7fff4ca-388106775afmr4934741fa.42.1770982596886; Fri, 13 Feb 2026
 03:36:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
In-Reply-To: <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 13 Feb 2026 13:36:25 +0200
X-Gm-Features: AZwV_QhZbu1_s2_uBAxrZJ4m0u6FTsZie8gSw-eJfjm7NKqnTFcavWWjyl6yqII
Message-ID: <CAGeoDV_bN812-qKJwTxNpJ6Ewz1jcBM8nLYc9D+OjqbuAAkEHg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B80F135C2D
X-Rspamd-Action: no action

Hi Mykyta,

Thank you for this patch series. I'll go through it and follow up with
comments shortly.

On Tue, Feb 3, 2026 at 12:02=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykyta,
>
> We have a number of series from you which have not been merged yet and
> reviewing them all in parallel might be challenging.
>
> Would you mind giving us a status and maybe priorities on them.
>
> I could list the following series:
> - GICv4
> - CPU Hotplug on arm
> - PCI enumeration on arm
> - IPMMU for pci on arm
> - dom0less for pci passthrough on arm
> - SR-IOV for pvh
> - SMMU for pci on arm
> - MSI injection on arm
> - suspend to ram on arm
>
> There might be others feel free to complete the list.
>
> On GICv4...
>
> > On 2 Feb 2026, at 17:14, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote=
:
> >
> > This series introduces GICv4 direct LPI injection for Xen.
> >
> > Direct LPI injection relies on the GIC tracking the mapping between phy=
sical and
> > virtual CPUs. Each VCPU requires a VPE that is created and registered w=
ith the
> > GIC via the `VMAPP` ITS command. The GIC is then informed of the curren=
t
> > VPE-to-PCPU placement by programming `VPENDBASER` and `VPROPBASER` in t=
he
> > appropriate redistributor. LPIs are associated with VPEs through the `V=
MAPTI`
> > ITS command, after which the GIC handles delivery without trapping into=
 the
> > hypervisor for each interrupt.
> >
> > When a VPE is not scheduled but has pending interrupts, the GIC raises =
a per-VPE
> > doorbell LPI. Doorbells are owned by the hypervisor and prompt reschedu=
ling so
> > the VPE can drain its pending LPIs.
> >
> > Because GICv4 lacks a native doorbell invalidation mechanism, this seri=
es
> > includes a helper that invalidates doorbell LPIs via synthetic =E2=80=
=9Cproxy=E2=80=9D devices,
> > following the approach used until GICv4.1.
> >
> > All of this work is mostly based on the work of Penny Zheng
> > <penny.zheng@arm.com> and Luca Fancellu <luca.fancellu@arm.com>. And al=
so from
> > Linux patches by Mark Zyngier.
> >
> > Some patches are still a little rough and need some styling fixes and m=
ore
> > testing, as all of them needed to be carved line by line from a giant ~=
4000 line
> > patch. This RFC is directed mostly to get a general idea if the propose=
d
> > approach is suitable and OK with everyone. And there is still an open q=
uestion
> > of how to handle Signed-off-by lines for Penny and Luca, since they hav=
e not
> > indicated their preference yet.
>
> I would like to ask how much performance benefits you could
> have with this.
> Adding GICv4 support is adding a lot of code which will have to be mainta=
ined
> and tested and there should be a good improvement to justify this.
>
> Did you do some benchmarks ? what are the results ?

One more benchmarking note (and rationale): for meaningful performance
testing it may be necessary to disable WFI trapping (boot Xen with
`vwfi=3Dnative`).

If WFI is trapped, each guest idle instruction causes a VM-exit, and
Xen typically deschedules the vCPU. This makes the vCPU become
"non-resident" more often, so subsequent wakeups (e.g. vSGI/vLPI) tend
to go through a slower host-mediated path (waking the vCPU thread via
the scheduler and performing extra state transitions) instead of letting th=
e
hardware wake and deliver to a running guest quickly.

For this reason it may be worth conditionally recommending (or even
auto-selecting) `vwfi=3Dnative` when direct injection is enabled for a
vCPU, so measurements reflect the actual delivery fast-path rather than
exit/scheduling overhead.
---

One more suggestion: it may be worth adding this as a small patch in the
series (or at least documenting it prominently). When direct injection
is enabled for a vCPU, trapping WFI can skew both behaviour and
benchmarks by pushing the vCPU into a "non-resident" state more often
and forcing wakeups to go through the host/scheduler path. A conditional
recommendation (or even auto-selecting `vwfi=3Dnative` in that mode) would
help keep the fast-path measurable and predictable.


Best regards,
Mykola

>
> At the time where we started to work on that at Arm, we ended up in the c=
onclusion
> that the complexity in Xen compared to the benefit was not justifying it =
hence why
> this work was stopped in favor of other features that we thought would be=
 more
> beneficial to Xen (like PCI passthrough or SMMUv3)>
> Cheers
> Bertrand
>

