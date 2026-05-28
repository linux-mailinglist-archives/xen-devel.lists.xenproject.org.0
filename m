Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAEWBO2PF2oUJQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:44:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743565EB591
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320905.1588015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSOr1-0003vR-IG; Thu, 28 May 2026 00:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320905.1588015; Thu, 28 May 2026 00:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSOr1-0003sp-Eu; Thu, 28 May 2026 00:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1320905;
 Thu, 28 May 2026 00:44:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSOr0-0003si-6e
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSOqy-003xvB-85
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 02:44:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178f86-bab6-0a2a0a5309dd-0a2a45059c8c-44
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:44:03 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178fd3-aaa8-0a2a45050019-d155d0aedde9-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:44:03 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3938cc204a7so88226101fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 17:44:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779929043; cv=none;
        d=google.com; s=arc-20240605;
        b=MpcFGyCBsjwn4z3jgyhWnnnkyled6guJgD/BQE2T/stmsZ4FD+QKvjXGfYlogDb0d8
         bVEi+L6XXBaMWVuqHp52/JNvtlqxP7jpKvobyU4SronDHdHYHkeHeVLENZOazx+z9nej
         LzMwQ3H9h2VA569H+uVcpomMLTE72r+RHN3bobbMEqp7DcKlx+HR6pt/E1g75VcX+Xee
         cKAskDjKIl30xWnH0AgeLnybXBzpDDY10epAPbaLqLpAfebmrAWrBDCEbDrlO4cqVBB+
         NuODuaoTqrEseGWTyyz2EyVZbXEFPfIj5Ru+vhUFlY8YimlQpFwFf8jqHsd4i0fyno7p
         RFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DH5e/cL18VFRRhSFlXrSX4M4Oc/C9qjmJqdiGpxJADk=;
        fh=hbjjqkXaWls30zzP/XDCsIpBv9lrvJuCsUy3lBRF/sk=;
        b=fSxVBLvm4aGRAZWteG0IsXvEXtgB1uj2nDdiQ/Cyq3sHnfKA+JxFpsbBsdjEz/iYo/
         Hv1h6n6qxT6HCupseR6IcVWgRAAvobtJrOTkeORKv5ncChBPy+lG8EI4S/qnjeBJA8B8
         GDpR6Lk2hRVXOCw/WxiThYKCcunXYW47dtoYH6KkIFlqvVw71B4MOUhg6NUg2oyBwSj+
         H+XCrj5B/mnkogwMTXMkdhho9UW44YX5U79x05patuXKJIacJ7dI/ANtm/G1bAii+Oil
         GyBmc9fM+PtgtMd3OgxmgINxshDG0B53wWaJu9Tzsrj8EtvUX+NY71xlouuLBgrGulko
         f0vw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779929043; x=1780533843; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH5e/cL18VFRRhSFlXrSX4M4Oc/C9qjmJqdiGpxJADk=;
        b=aCzNoGMZ9ynP/NenKBAXpr5YZR5H+BeS7DLNvtoWAoTOctx7KI5icTX4LR9WcwKjzl
         pVWqz+5p+5sPIBmZNnNW245DYECDdgeYKvtBiY/XMK2aMar3AGr7DVAVToY2+yVFtmHk
         dMHz+XysXcfyC4mfcIV2mdQSPaP3VW7aec4jJrcPCjAZ/NFYMzSicC3M4DBcyj2Bs4pb
         UyaMTZDab8KQoRH6QJ/ZZYvc5UaNgkFqMddu/fVgfUQAfEDkHF2p2ZA0SHrMAiSwr1rZ
         i9DkQAXz2ZpSxw4LR1QF4YRzpu4n5ICvmdnEMivAw80JS+15b2sQgK2AFUsE94s/EDBJ
         Xjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779929043; x=1780533843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DH5e/cL18VFRRhSFlXrSX4M4Oc/C9qjmJqdiGpxJADk=;
        b=VnS2fOfyJim1xizeABrq1bR6ProOhZGvYGDBw9XfVV4P5BlHhW6nchB2a3k5Y10nQx
         2O6yB36gK63K/wUcQQx3S47NXxoGpv9KVvvDKz7R26+ewku6txCT/SZVAXCZWOlgvPrR
         jTmclob080FtDkYyQH7VLV4mrqn+bkfeQRxK7iHC1p1eMi98gg32hujCnHyYwPiwGxYz
         hm3LbIymRlH65Yme4c1AF2TT30UetnGcTBW5C6dIg8YU6+dp9n+iCaowljPHY8ICDD+D
         kRUv+ObzH9i3XKr5o82kBuhAn6rAfRrnWr1C6+xuf1aHou+y5aT5RsVyo2W2VG94vVsm
         /0SA==
X-Gm-Message-State: AOJu0YyNhTsGlBAf71O+bW/Tm+ytrOkVWNDJw7Dlgy+3rjm3JxWGhcAr
	pj8C23fN3xOv7tGNhrHY+T8usEwXRFDzbNYTVm0oNnGSdFS46qSm9JOva1zquiXwKy+WXc2YSgW
	4RLhuPNwPxnyjSjCsYZJj4u5EZYcBZUNYe/cr6K8=
X-Gm-Gg: Acq92OHs5jaM+1VBciWc+fD5cFCu+lzyKKCzWK25kGpWRxbM5sWehD086n68Wt5N3kp
	draJGwxFV5nL/WunuSNQ+BMUVNXXofkV8r1yxCmAHYNMVdqXIyVLUUax+Piy6ksIN9SCcDVTqz6
	x8hhCzFMm5KhVj6ZFAgklweXCwVWReurAHZwmy1Cc3JiImqtKCl82g+dAU9KNfjgmi8SGPpjhiG
	HKZ3QVD8bstk3bp7RsMoC+1Is5adE3ph1NQF33Kfvo8l0d47EbfYVjeVrmdYs4zMSt5Zsji6vel
	JUyvsQgnumZ36ig=
X-Received: by 2002:a05:651c:19aa:b0:393:a65e:e913 with SMTP id
 38308e7fff4ca-395d8bd7f96mr88526981fa.2.1779929042757; Wed, 27 May 2026
 17:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779922874.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1779922874.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 28 May 2026 03:43:51 +0300
X-Gm-Features: AVHnY4JbsYeBNYcxSF2bo9T0gPeoyJ7oKrovJDbignHoa66hsC_t9_LFbYupfd0
Message-ID: <CAGeoDV8ArzM6-qdHmumHyoga5-XB4EgpoDVVDPy0JsZ2w2a4jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] xen/arm: gicv3: defer host LPI init and split
 ITS/LPI quirk scopes
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Fancellu <luca.fancellu@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1779929043-E3589443-33DC7EBB/0/0
X-purgate-type: clean
X-purgate-size: 5131
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 743565EB591
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

I forgot to include the v1 link in the cover letter.
For reference, v1 of this series is available here:
    https://patchew.org/Xen/cover.1774431310.git.mykola._5Fkvach@epam.com/

This v2 is the next revision of that series. Since the patch order and
subjects changed, some tooling may not associate the two automatically.

Thanks,
Mykola


On Thu, May 28, 2026 at 3:28=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Hi all,
>
> This series fixes the ordering of host LPI state initialization relative =
to
> ITS quirk discovery, and then cleans up how ITS-private and host
> LPI/Redistributor quirk effects are represented.
>
> Patch 1 is the release-critical fix. It moves host LPI initialization aft=
er
> gicv3_its_init(), so that the host LPI allocation path observes the ITS
> quirks discovered during ITS initialization. This patch is intended for
> 4.22.
>
> Patches 2-4 are follow-up cleanup and DT attribute handling. They are inc=
luded
> to show the intended direction and to avoid carrying the old global ITS q=
uirk
> model forward, but they are not required for taking the 4.22 fix if the
> release freeze makes that preferable.
>
> The main change from v1 is that this version no longer tries to pre-initi=
alize
> ITS quirks before host LPI setup. Instead, the minimal fix is to defer th=
e
> existing host LPI initialization until after ITS initialization. The foll=
ow-up
> patches then split the quirk state by scope:
>
>   * per-ITS flags are used for memory/state accessed by a particular ITS,=
 such
>     as GITS_CBASER, GITS_BASER<n> and ITT memory;
>
>   * host LPI flags are used for shared Redistributor/LPI state, such as
>     GICR_PROPBASER and GICR_PENDBASER.
>
> This avoids relying on an implicit global aggregation of per-ITS quirk st=
ate.
> If an ITS-discovered quirk also affects the host LPI/Redistributor path, =
that
> effect is now expressed explicitly through the quirk entry's lpi_flags.
>
> The series also handles the DT dma-noncoherent property according to the =
node
> where it appears. An ITS subnode property affects only the corresponding =
ITS.
> A top-level GIC node property affects only the host LPI/Redistributor pol=
icy.
> The property is not inherited implicitly between the parent GIC node and =
ITS
> subnodes.
>
> The Orange Pi 5 / RK3588-specific quirk patch from v1 has been dropped. T=
he
> previous version modelled the issue as a 32-bit ITS addressing restrictio=
n.
> This version handles the relevant non-coherent/non-shareable GIC integrat=
ion
> through the standard DT dma-noncoherent property on the GIC and ITS nodes
> instead.
> ---
>
> Changes since v1
>
> * Reordered the series so that the minimal host LPI initialization orderi=
ng fix
>   is first. Patch 1 is intended for 4.22.
>
> * Dropped the v1 ITS pre-initialization hook.
>
> * Moved the existing gicv3_lpi_init_host_lpis() call after gicv3_its_init=
()
>   instead, so host LPI state is allocated after ITS workaround discovery.
>
> * Checked the return value from gicv3_lpi_init_host_lpis() and made failu=
re
>   fatal once the ITS/LPI path is enabled.
>
> * Replaced the old single global ITS quirk state with separate per-ITS an=
d
>   host LPI quirk scopes.
>
> * Removed the implicit aggregation of all per-ITS quirks into the host LP=
I
>   policy. Host LPI effects are now expressed explicitly with lpi_flags.
>
> * Kept per-ITS flags for ITS-private allocations:
>   - GITS_CBASER;
>   - GITS_BASER<n>;
>   - ITT memory.
>
> * Kept host LPI flags for Redistributor/LPI state:
>   - GICR_PROPBASER;
>   - GICR_PENDBASER.
>
> * Refactored ITS quirk matching from fixed IIDR/mask fields to a generic
>   match(hw_its, data) callback plus opaque data.
>
> * Kept first-match semantics explicit. More specific entries must be list=
ed
>   before broader IIDR-only entries.
>
> * Added a reusable IIDR matcher and used it after checking the Renesas
>   machine compatibles for the R-Car Gen4 quirk.
>
> * Split dma-noncoherent handling by DT node scope:
>   - ITS subnode dma-noncoherent affects only the matching ITS;
>   - top-level GIC dma-noncoherent affects only the host LPI/Redistributor
>     policy.
>
> * Dropped the Orange Pi 5 / RK3588-specific quirk patch from v1. The
>   non-coherent GIC integration is now handled through DT dma-noncoherent
>   properties instead of a Xen-side platform quirk.
>
> Mykola Kvach (4):
>   xen/arm: gic: defer host LPI allocation until after ITS init
>   xen/arm: its: separate ITS and host LPI quirk scopes
>   xen/arm: its: refactor ITS quirk matching
>   xen/arm: its: handle dma-noncoherent on GIC and ITS nodes
>
>  xen/arch/arm/gic-v3-its.c             | 171 ++++++++++++++++----------
>  xen/arch/arm/gic-v3-lpi.c             |  66 ++++++++--
>  xen/arch/arm/gic-v3.c                 |  14 ++-
>  xen/arch/arm/include/asm/gic_v3_its.h |  19 ++-
>  4 files changed, 190 insertions(+), 80 deletions(-)
>
> --
> 2.43.0
>

