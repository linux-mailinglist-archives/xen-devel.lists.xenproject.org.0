Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IejBDc/AmpBpgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 22:42:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD81515F76
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 22:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306409.1578385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMXRR-00049H-8b; Mon, 11 May 2026 20:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306409.1578385; Mon, 11 May 2026 20:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMXRR-00047s-4t; Mon, 11 May 2026 20:41:29 +0000
Received: by outflank-mailman (input) for mailman id 1306409;
 Mon, 11 May 2026 20:41:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMXRO-00047m-Ro
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 20:41:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMXRN-00G9v0-Qk
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 22:41:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a023edb-e002-0a2a0a5209dd-0a2a450aa09c-30
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 22:41:25 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a023ef5-56b3-0a2a450a0019-d155d0abc105-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 22:41:25 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-393a44854d2so37678741fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:41:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1778532085; cv=none;
        d=google.com; s=arc-20240605;
        b=jaHjkqhkKShhEzqmBTR3TG22tcULvkPN5qyhgY8w3UbmJ8FY3v9iXdwrfcdHHSs9ZO
         w+7bcyrgMMDbgDsaEeZYWV4GAKtUeYxfgUbhHqxrGKw6eQzSOeRvxSUWdl/SHqLDQskf
         2c93zeSlxQWJYnOD0m2GMMiVArpnZD2VZeVfCmr1aorlQAGLUIwHadnZfbH1oFhLA07a
         h97RYfLd3ce7Ucy4efWJNdrh4U6sBHmPzR7hWokiC71AReBnfoKTiAJSl8vEdKzfh39Y
         uB5nSSiiO4dooNWUap+cie9K8FhjAkOB0kxCumXx4tvdirZEofDxtxfNHeIEYdASFUNy
         oDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRemxzkQYjKIVnvZ1Hx2EfW0Nt+e2MfR2vsQ8gRiO2I=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=LWWK++JPPpUHSNwfJHZZzeWeJOIA2g2g5NJA+PHpfkzGowFIwC5A33LYPCKow0+QAg
         W8J+gQcHgTsFCN1IqcOBK2WgrDte6JyG6fbBKLUr6o/WI6Vgynqt9T7nlrm8yBCdqN/V
         n/fPkLxDK0+zSOjCkD3zH6oYImfLpedWHjt7eG/fIxUpGdbn7UxVzON74SGRdrv1vxBp
         2laTUlmWpQ/Y1ux+ePDuyTxV1OS9lCMtgSqGZgmJ4iYeRi1LVv4Yim6aHUajxtcTQTyE
         SMQx/uQ5om9mZ52HfOBEPQKQzvmh0Aqq3XVK8v84DGmRZde9GoHioHrLFeKYN+IciRu8
         8mww==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778532085; x=1779136885; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRemxzkQYjKIVnvZ1Hx2EfW0Nt+e2MfR2vsQ8gRiO2I=;
        b=ddxJ8b+DLStacYBZdOQsDNixI6yQD6xMDbl83P4BEgk4FT9REdIZteeSr+0tC28xlR
         YKW6ftI44OSiL3SZ2nubZCU/NlLyGBtVARrxPf3DbcQyTsrpShAJBo7g5Evtl1blpU7P
         wO3O/zf8EA4VXz5/Q3CR7ACFQkDP4Ldum9wdPjjjT3Qn5EotB3R9x/BN5UqdrpngkzXy
         y/NcpbgnOUs3RAn7ChGuv/gJckG+qkkiUJ4REkSXT9GYKgZ1OjVnALM5E+6CDFG5ykuM
         6aSfYvKp3+V9poCPBwWc7Vn6Z9rLAOs1CmV5ZpqDR5R5HrripJ5SjVCXBMQg4RyH9B98
         jMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532085; x=1779136885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WRemxzkQYjKIVnvZ1Hx2EfW0Nt+e2MfR2vsQ8gRiO2I=;
        b=eNILM710CMMv6v3TqM5G5oKLD/UtNtjjgsV5309ly8jCvTeuxQYBUm5psFCOGNOdMJ
         2XL3NHQRSj8WAcbxLG5UYpVJalUxrQPWcRFfLo/j7de4sLoXH5W+n6brgETkkcQh0MIO
         XCTaN+418EzhvZKvXctxpjfGuqWS6j5jgsXRP0ejNuWefE8JSs3ACQmwgrFNcPglu1bR
         NDxPM+bnyhY+YkBCq3rNXDyEPppd1gN/NPD+yQLW7PtH6F280KIpcGYTQOuS3tEIpi3N
         zgbr1bl60gyi9wz4P6ZowyOJ6Fx6yH/isipHfHfGWITLy8GzzeZJxEA9xxSzVf7wAiNA
         ANqg==
X-Gm-Message-State: AOJu0Yxb7ptdSnBwFJBdSw0JMxRfeqMv6CvF+U5iVIJ5k3aHIQGzq7XC
	N7AFu0WOVyBGz2tPyvAAT9TTcsayc2EzK3tvHUDthjih9lg7hjkh9cR8vB9tJPu+GtAfwy7QANs
	Bsj9esI45475bV+2LpasiZZlwyP9mK/c=
X-Gm-Gg: Acq92OEH+0rXKkvermBMX5R1kXQ6TB5pXw1eEH3uwxHhzn9PAeZQt9hiztwDxE/z2/3
	3d8FsxT7nMEoCrpQ5jtbrFS1eBzmMHaxPXJlE4EDN4NlmhhVNnr8zMD2SxF9AXhCosDLKcZ7Jr7
	2GvfIgfzmotfGF/amTSeZa4jY1Z73FxRWfqdRAQaKyLSYsS2BueHHHBCtVAN70g8vgli/CMjkvE
	OeLRjm9thEBe7k8UxqQt6xsroowwd3mOuZtbAp3YKVrK2I4BNxZT2juu64l5WyNmZAArzLQ9AdR
	5Em5Yg==
X-Received: by 2002:a2e:bd8b:0:b0:38a:3ad8:6f32 with SMTP id
 38308e7fff4ca-3940819faaamr34245301fa.30.1778532084754; Mon, 11 May 2026
 13:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
 <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com> <CAGeoDV80QHdesYQF-J4fg7wYQ6RLNg6u27aQhj4F+JoM4hU3uQ@mail.gmail.com>
 <CF8E0EB2-3048-4B04-B763-AE5EF1909416@arm.com> <CAGeoDV_SqVtcAZemSx1Ap0R6JqnbAxoLYCctPEU3DkcuQC-A1g@mail.gmail.com>
 <81FE9BB6-2C8D-49B8-86E4-BD1B19B3F76E@arm.com>
In-Reply-To: <81FE9BB6-2C8D-49B8-86E4-BD1B19B3F76E@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 11 May 2026 23:41:13 +0300
X-Gm-Features: AVHnY4L6KVcmSANctcbMbzU_-qNRJXjCUsosZNN4ylII2i0mx_ZY4nBcQsbGw5k
Message-ID: <CAGeoDV-11WDZjCkjo+BNsf2DWPwxomeWKAUuTs=Kg4GL+j+Z=A@mail.gmail.com>
Subject: Re: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1778532085-7CE7B8B7-A5661A24/0/0
X-purgate-type: clean
X-purgate-size: 4638
X-Rspamd-Queue-Id: 6CD81515F76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 9:41=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> >>
> >>>
> >>> For GICC_APRn/GICC_NSAPRn, those registers describe active priority s=
tate for
> >>> interrupts already acknowledged by the CPU interface. The final suspe=
nd path is
> >>> not expected to run with an active physical interrupt context. If tho=
se
> >>> registers were non-zero there, restoring only APR/NSAPR would not mak=
e the
> >>> corresponding interrupt handling context valid after resume, and coul=
d instead
> >>> leave the CPU interface with stale active priority state.
> >>
> >> Ok I understand now, but if we are expecting here GICD_ISACTIVERn zero=
ed, why are
> >> we saving/restoring it? Shouldn=E2=80=99t we instead have a runtime ch=
eck that it=E2=80=99s zero and in case
> >> it=E2=80=99s not bail out? And in the resume path we would only zero i=
t.
> >>
> >> Am I missing something?
> >
> > Good questions.
> >
> > Yes, the distinction I should have made clearer is between CPU-interfac=
e
> > active-priority state and distributor active state.
> >
> > For GICC_APRn/GICC_NSAPRn, I expect the state to be quiesced at this po=
int.
> > Those registers track active priorities in the CPU interface. Xen reach=
es
> > gic_suspend() with local interrupts disabled, and for the guest-routed
> > interrupt case that can leave a distributor active bit behind, Xen has
> > already performed the physical EOI, so the CPU-interface priority has b=
een
> > dropped.
> > There is no CPU-interface active-priority context that we can meaningfu=
lly
> > replay after resume.
> >
> > That is different from GICD_ISACTIVERn. In EOImode=3D=3D1, EOIR only dr=
ops the
> > priority. The interrupt remains active in the distributor until the sep=
arate
> > deactivation step. For a guest-routed interrupt Xen's GICv2 guest end p=
ath does
> > only the physical EOI; deactivation is completed later by the virtual G=
IC/GICV
> > path when the guest completes the interrupt.
> >
> > This is why APR/NSAPR and ISACTIVERn are treated differently. For examp=
le:
> >
> >  1. A physical IRQ routed to a guest is acknowledged by Xen.
> >  2. The GIC marks the interrupt active in the distributor.
> >  3. Xen EOIs it, which drops the physical priority.
> >  4. Xen queues/injects the interrupt to the vGIC.
> >  5. The guest has not yet run, or the virtual interrupt is not yet deli=
verable
> >     because of guest PMR/priority/local IRQ masking/vGIC state.
> >  6. Therefore the guest-side deactivate has not happened yet, and the p=
hysical
> >     distributor active bit remains set.
> >
> > There is also a late suspend window in the current Xen path: domains ar=
e
> > suspended and the scheduler is disabled before local IRQs are disabled.
> > A guest-routed IRQ can therefore be taken by Xen after the guest is alr=
eady
> > suspended, but before gic_suspend(). Xen can EOI/priority-drop it and q=
ueue
> > it for the guest, while the guest cannot run and deactivate it before t=
he
> > GIC state is saved.
> >
> > This is the same class of issue handled by Linux for GIC EOImode=3D=3D1=
. Linux
> > saves/restores the active state because forwarded interrupts can remain=
 active
> > while passed to a VM [1].
> >
> > So I don't think GICD_ISACTIVERn should be treated as "must be zero" un=
less we
> > also add an explicit suspend-abort/quiesce policy for in-flight guest
> > interrupts. That would be a different design: detect non-zero active/in=
-flight
> > state, unwind suspend, thaw domains, let the guest drain/deactivate the
> > interrupts, and retry later. This series does not implement that policy=
. Given
> > the current flow, preserving GICD_ISACTIVERn avoids losing architectura=
l
> > interrupt-controller state across suspend/resume.
> >
> > I am not opposed to such a policy as a follow-up if we want stricter su=
spend
> > quiescence rules, but I think it should be designed explicitly rather t=
han
> > inferred from the GIC save/restore code.
> >
> > Best regards,
> > Mykola
> >
> > [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/1447701=
208-18150-5-git-send-email-marc.zyngier@arm.com/
>
> Right, yes I agree! I have another question though, since GICC_APRn state=
 should be
> quiesced in the suspend path (allimplemented active-priority bits should =
read as zero),
> should we have a runtime check just after disabling the CPU interface?

Yes, I think a runtime check is appropriate here.

Best regards,
Mykola

>
> Cheers,
> Luca
>

