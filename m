Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UMVtIGUIOGoFXQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2026 17:51:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B456AB34C
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2026 17:51:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VR4HGiHR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343366.1602792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbKQt-0004hb-HQ; Sun, 21 Jun 2026 15:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343366.1602792; Sun, 21 Jun 2026 15:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbKQt-0004bs-AZ; Sun, 21 Jun 2026 15:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1343366;
 Sun, 21 Jun 2026 15:50:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wbKQr-0004Ol-Vx
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2026 15:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbKQr-00BUVc-Cn
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2026 17:50:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a3807fb-e002-0a2a0a5209dd-0a2a450ad092-16
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 17:50:01 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a380829-93a5-0a2a450a0019-d155a72badbc-3
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 17:50:01 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5aa68d65d24so3902294e87.1
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jun 2026 08:50:01 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782057001; cv=none;
        d=google.com; s=arc-20240605;
        b=NT1/75GAiw+z/CkNlzL7mUsNP/6X9aKLeJLBLB88T4E3ogvb/hbLva2d9OeUz3lOOh
         jI02fYfaqEJskUMo6SA0oEc9U6Bxd3t75NGzA14fOLqET0/3hWSPANaYx4S7cTvWZ6sk
         vQOsozgVevW7TTlYXhHIiJVHL04yKvY6eMexb1ta34ssUcMm/o3d5hwaFkBsduzLElwG
         iyU9YDeGZcNLir5JOtE4lDcK3CP2JnxPMwtKaBqLWcTZhKppkjX/8xtemtT3ccJpYtNE
         MO+I0kXgJEcBRbtDBodHEpWDkLfYnRZtH4gvufqIKkWyWrR94DHl1gz24c+QiKKyXLYT
         jEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Ihts8Nrd/pPs41bP7NbDD2r+lVeDMvNnWwboa87a24=;
        fh=+6+HpIV0Emk7Rv3ZPp6eyftBpuk0oVwMFn9aIOQ3wzE=;
        b=D9NCwEgRxTeCLzA4m60MRSoGhf8r3S1rZcBkYsvpUtRhV4BCfT4klL0t+3+fF8rKGM
         egloFNV2WVOWGyKhSaxHb68qxv7/prGaWZX+doQTAp0xGU1B6CRUSZDd6y0QYjz9GdGk
         8QwbLXSaT0LMMomYeBj1N+MiXw4U0LCOu2RASZyAFLALntqBTkW3ifIW+YxqhtwxRE9V
         Z80ba7yZGyxKun75YqecFdIBTJHphgw7jSt5CQJ7fUKC6Kv/t4FUbH2rzLUBn9zTMIbt
         DeKbf6noZzC8O06rDe/YrWHJhBmnmyCy4drciTjShounp3q4OKUBAaSX7CMk+A504ETF
         Xj8g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782057001; x=1782661801; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ihts8Nrd/pPs41bP7NbDD2r+lVeDMvNnWwboa87a24=;
        b=VR4HGiHR0xPO9fymjM6d7awv7B/kdJcNTZUfebY/HkgrgJN5iQBxMsSZaEncNIY3AA
         DgjYWZB0/ecwL/GuugtdOJvZ1IXoEZY8sJkNTtsg1fuzlAC1miBPBKsNU4ZTFct35b/v
         BVCJWaWYdPrm1Ipko1JN1Ynr45Lw1auMtl3GcOquzb+Wmd8syuhvgd0HB/7phSw81leC
         t1yjn42ndJxG0/nhhPpt2qx32F5PyL1AF5Ix+4VgI8NlvoyA74Z/qXt77bqDV0bYBgh8
         QFQYwp/a8Qo65S4v0CYvC/6eDlvmdc8GX2DeIqSRke/iQGBnjRK4w3987I1/nPgopNdx
         pphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782057001; x=1782661801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ihts8Nrd/pPs41bP7NbDD2r+lVeDMvNnWwboa87a24=;
        b=n0haZ/QF0wI50swTJHXaWb7U4qkumTcG0MjwvkGCJ9Yub/9lfMFRriHMndX0nGkB4C
         eOXIcyHhG6AVLSyIONL3HwG+5zICm8EZmWXXgnm8LgyM8W3vu76dMcWivi0nEqydFgwG
         BL8t1LaWs35ILkpuro6pOfZZ5gnH2aK0Zc0TVrLwBUmPYebXTlWCUrMLNpswisr/DSR9
         nK0TuScgxtAfDikAzzGA5eHyijfr/vAR/nNkzDlsCzOga/z5dxhJmoleQOD41lpWLG10
         r6h5869/+U7u8FOXNT0p/bRYnpVfbGKqwUWjDpjibaxIBkw5MoSs6fhdrFX78F0cXclI
         5OuQ==
X-Forwarded-Encrypted: i=1; AFNElJ97+SZKomgwMPRoF5t1II+tr8n4w107LRuSOucefQ6IuwzBPf3jOSyCfVVywqo18095AhTTeqbzKIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy65zx7X/WEQs4AiL4xlygVOuJrSFNB0uo7kWibJDkvcHnvyYlT
	lFWjL2V2IxY3yJhFkqxgFnGqRt2JmU5B86dwUzsxxhoAYuC+fts+IQBDLPychOeueVNX/7ek2cV
	b1pD5nIzzDdWm9wDVN4QviVm1PDUjjSk=
X-Gm-Gg: AfdE7cm3yV4PB2Q1dY8mOl8nMxmE+uM2QDhYug8c973llBBEqI0ut4T37jcaf9IB/ZY
	TAFBLqZp+N1iWoTLeWEn5ScZxUl68i6fRBcDAGjve4HSTfMayywKwqydY2wRWyoItghWtVitsrr
	ryEGiQsafvVhi4g6PcjJC1zjqBQ3Bd9DSNdDVKUfoaQo21cJkJ1hBzUCVYs9rUgdwEP1TF79kvn
	35lHPAGXuHvR4xSnmVORMsd0aPWuPGhC9KuEsT1Yd6cFVZzA0xxAktM4rZVkcD7iWfRZ68=
X-Received: by 2002:a05:6512:145b:10b0:5aa:6eb4:feac with SMTP id
 2adb3069b0e04-5ad5be5c1a4mr1199061e87.28.1782057000363; Sun, 21 Jun 2026
 08:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com> <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org> <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
 <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org> <CAGeoDV_LM9hQch5YEqYFA07t76eXKxZRT5tzxMqzWkej5Jwidw@mail.gmail.com>
 <f06a4fe0-24a4-46e2-a7de-ede4e654f767@xen.org>
In-Reply-To: <f06a4fe0-24a4-46e2-a7de-ede4e654f767@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sun, 21 Jun 2026 18:49:48 +0300
X-Gm-Features: AVVi8Cd1KZJ2BTUKbXujgI5kK4Qspnxt9BSR0Y8MEUOUPzF956EFuZRAjsWkjKg
Message-ID: <CAGeoDV_O0qBitauMC6saq6X6uijis2obpNVhJwKz+CSfkzPU3g@mail.gmail.com>
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Julien Grall <julien@xen.org>
Cc: "Orzel, Michal" <michal.orzel@amd.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1782057001-B0FFDDB8-FB3490FD/0/0
X-purgate-type: clean
X-purgate-size: 6296
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,epam.com,lists.xenproject.org,kernel.org,arm.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,amd.com:email,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:michal.orzel@amd.com,m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:luca.fancellu@arm.com,m:oleksandr_tyshchenko@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6B456AB34C

Hi Julien,

Thanks.

On Fri, Jun 19, 2026 at 8:23=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 19/06/2026 15:55, Mykola Kvach wrote:
> > Hi Julien, Oleksii,
> >
> > On Fri, Jun 19, 2026 at 2:52=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >>
> >>
> >> On 19/06/2026 12:34, Orzel, Michal wrote:
> >>>
> >>>
> >>> On 19-Jun-26 13:23, Julien Grall wrote:
> >>>> Hi Michal,
> >>>>
> >>>> On 19/06/2026 10:48, Orzel, Michal wrote:
> >>>>> @Oleksii, can we ask for a release ack here?
> >>>>
> >>>> Can you explain the pros/cons of introducing this patch quite late?
> >>> The advantage is that it fixes the broken LPIs on affected hardware.
> >>
> >>   > The disadvantage is the reordering risk but I don't think there is
> >> any issue.
> >>
> >> See more below.
> >>>>
> >>>> One of the risk here is that we are now initializing the LPIs *after=
*
> >>>> the ITSes. I understand this is because we want to know the workarou=
nd.
> >>>> However, I vaguely recall that there was a dependency in the
> >>>> configuration. So are we confident the new ordering will not bring o=
ther
> >>>> issues? Ideally this should have been explained in the commit messag=
e.
> >>> gic-v3-its.c never references host LPI state, so ITS init has no depe=
ndency on LPIs.
> >>
> >> My concern is at the HW level. The ITS is using LPIs. But we will
> >> configure the ITS first and then the LPIs.
> >>
> >> What probaly saves us is the fact gicv3_lpi_init_host_lpis() only seem
> >> to allocate memory. This is a bit fragile though.
> >
> > Regarding the ordering concern, the only operation moved by this patch
> > is gicv3_lpi_init_host_lpis(). It does not program either the
> > Redistributor or the ITS. It initializes Xen-side host LPI bookkeeping,
> > registers the CPU notifier, and allocates the boot CPU pending table.
> >
> > gicv3_its_init() programs the ITS tables and command queue and enables
> > the ITS, but Xen does not enqueue any ITS command there. The first
> > MAPC/SYNC commands are issued by gicv3_its_setup_collection().
> >
> > The relevant hardware-visible sequence in gicv3_cpu_init() therefore
> > remains:
> >
> >      gicv3_lpi_init_rdist()       /* program PENDBASER/PROPBASER */
> >      gicv3_enable_lpis()          /* set EnableLPIs, followed by wmb() =
*/
> >      gicv3_its_setup_collection() /* issue MAPC/SYNC */
> >
> > So the ordering introduced by 95604873cc is preserved: no MAPC command
> > is submitted before GICR_PENDBASER/GICR_PROPBASER have been programmed
> > and the write setting GICR_CTLR.EnableLPIs has been made visible.
> >
> > This matches the relevant architectural requirement: while
> > GICR_CTLR.EnableLPIs is 0, ITS translation requests or commands
> > involving LPIs in that Redistributor are ignored. This patch changes
> > when the backing memory is allocated, not when the Redistributor is
> > programmed or when the first ITS command is submitted.
> >
> > The benefit of taking this for 4.22 is that it fixes broken LPIs on
> > systems where an ITS workaround changes the required memory attributes.
> > The ordering-specific fragility is that this reasoning relies on
> > gicv3_lpi_init_host_lpis() remaining allocation/bookkeeping-only. I
> > agree that this implicit dependency should be documented explicitly.
> >
> > I will respin the commit message to describe this ordering and explain
> > why the hardware-visible sequence is unchanged.
> >
> > Does this address your concern about taking the fix for 4.22?
>
> Thanks for the detailed explanation. As I wrote back to Oleksii, I think
> the code could be re-architecture post-4.22.

For post-4.22, I agree with the proposed restructuring. I will take it
into account when updating the follow-up quirk series, so that all ITS
workarounds are queried before host LPI initialization and ITS
activation.

>
> For 4.22, no need to send a new patch. You could propose a new commit
> message here and we update on merge.

For 4.22, I propose the following commit message:

xen/arm: gic: defer host LPI allocation until after ITS init

gicv3_lpi_init_host_lpis() initializes Xen-side host LPI bookkeeping,
registers the CPU notifier, and allocates the boot CPU pending table.
The pending table allocation uses gicv3_its_get_memflags().

ITS quirks are discovered by gicv3_its_init(), so allocating the boot
CPU pending table from gicv3_dist_init() can happen before the memory
restrictions required by the ITS are known. On affected systems this
can leave the pending table allocated using the default memory policy.

Move host LPI initialization after gicv3_its_init(), and only run it
when a host ITS was found. The old call ignored the return value. Now
that the call is made from gicv3_init(), check it and panic on failure
because Redistributor LPI initialization relies on that state being
available.

Although this reorders host LPI bookkeeping with respect to ITS
initialization, it does not change the hardware-visible LPI setup
sequence. gicv3_lpi_init_host_lpis() does not program the
Redistributor or submit any ITS commands. gicv3_cpu_init() still
programs GICR_PENDBASER/GICR_PROPBASER via
gicv3_lpi_init_rdist(), sets GICR_CTLR.EnableLPIs, and only then calls
gicv3_its_setup_collection(), which submits the first MAPC/SYNC
commands. Therefore, the ordering introduced by 95604873cc remains
unchanged.

This also narrows the condition for host LPI initialization from
"GICD advertises LPIs" to "a host ITS was discovered". This is
intentional: Xen currently has no supported LPI path without a host
ITS, and gicv3_lpi_init_rdist() already rejects that case with
-ENODEV. Therefore, on systems where GICD_TYPE_LPIS is set but no host
ITS is present, skipping gicv3_lpi_init_host_lpis() only avoids
allocating host LPI state that cannot be used by a supported Xen LPI
path.

Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")
Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for
Renesas Gen4 ITS")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Cheers,
Mykola

