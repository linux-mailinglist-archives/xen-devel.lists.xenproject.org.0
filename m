Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5mKFLjaRIWooJAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:52:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1664116B
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:52:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BAYjgPa7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327992.1592653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Qd-0000C2-JH; Thu, 04 Jun 2026 14:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327992.1592653; Thu, 04 Jun 2026 14:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV9Qd-00009u-Eb; Thu, 04 Jun 2026 14:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1327992;
 Thu, 04 Jun 2026 14:51:43 +0000
Received: from [194.145.224.10] (helo=mx.expurgate.net)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wV9Q6-00005x-UV
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV9Q3-004pm0-9u
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 16:51:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2190ed-bab6-0a2a0a5309dd-0a2a450cb0be-16
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:51:39 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2190fa-62f1-0a2a450c0019-4a7de02dc578-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:51:39 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-6605c3453f2so936343d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 07:51:38 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780584698; cv=none;
        d=google.com; s=arc-20240605;
        b=NNSpuyi3TirAZhchCQyKVzlKn8C0R3526ubpVim2RmpAXjHijGacLHgnxwJBZnUOOc
         M+SezsI2C3sn6PVBBOGWK4g6FVaqu+kC1x33uOlha0g814ZhSLfqYM712IiFP92QQFfv
         mm2Atmx5qcE9kH9nJY+xgh+mJhoKfBAaCBLT3M28ADHBhvsUa58pY/f5gFOuQrm2OinB
         6D+AM8bFyHCtSP9bzBsw7/xdNSNxxRB+IT51VvfKKFeuEPhpYfggpFljozjGOBLxf0KB
         YGw8jZ3V+tKvBhEQ0dB5DfSrZWLFFJhY2gCK00q1ugJDo+ig8v+bHyeQaFM40XsPH/Ra
         N80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zEUd0XlamqIYnkUv7mQ37REhnYyl5NfHmJhFAJoMCY=;
        fh=YXyOrzbbuBMjB1laPSTTaglkJ9ItuXSXF5B6orWbM3Y=;
        b=CnhCyMSZkPYQ5Q1URbhrR3ccgNr2kdWygsJmUWMz4BQjUSojYgo2CrDoXKp5ZTZCUK
         Zx/rl6EwuPqnXlBGoqdwoJ2XNeorqeAGhd8C/CJG9Ahrs5LGYjCbAMnACKVtx3nd44sb
         OHfc7XcjseQz93O+uWFbQH4MUEGCnDPPsNsNrxTqdKtGSBrRsBXTQ4yzofZe20GaMYgh
         tnKCInQ3DRGE1ZyV+5GfvIOoZjQ6kASbLdGInpDpFVmysQdHnh1UmLsqy+E8fpOUMV5y
         lPQ1ORrnbdH2NVS5P5mPRHzQBU3Ay97w4gHyzmU8SSzDQLmErtKamP0j4Lcj6w4CqaLd
         CzAQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584698; x=1781189498; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zEUd0XlamqIYnkUv7mQ37REhnYyl5NfHmJhFAJoMCY=;
        b=BAYjgPa7DwLP/EoCkaQvuGcUoiKd3EXcCE4E+qIrT/zw6gF6zllzO84RQNqCpQ7UHY
         Bv9MN6fIKXMtSEThY5SQRnE1rkc8gtR4grjPLjIGOCKVkXqcTO4jZYhf/4vVHud1N/gU
         17Ifx+85lRYYNyLJblMPhf72vFr8SfAmWfb7a3uWXjCJhSQmswi2b/Yp6a1CumGudiUO
         66VObMH7ZJGwsS2siuXCugNPAMSCgz9BfZk+Dw8uVOFwCSu//zL5u8RDnj8GZP1OMkoX
         wOea7WcnQPm/0C4t1bT+Ucj5bAue2yNQiXRP+du/cHnylEwaIwZwBrVwu7S2bBXlk3OO
         xWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584698; x=1781189498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zEUd0XlamqIYnkUv7mQ37REhnYyl5NfHmJhFAJoMCY=;
        b=jtCvBFGdP98dC4xM2FD9kQydSNPUExXtSbY+FBYg/zoCkxOMPgUr2AvQKxOX0r0fMo
         N9+VO46Qj26bJna8R7gfNAXixwxOnKz2A1ONh8ISQrIzlthkJQ9cBi2aXmcwIv2BVbXR
         EJgVwYsUk65wiSQKNqjrQeypT1k6MEAShyApv50JCHmehKpfP9K65GgBB4xMw0kUUQg1
         lS1/SN8d1pMg8UBiCEBLsrmeuEBcEP4iAAWaLhpGwFPNbJj1jApscVUicpTAVNQByIAU
         TWQLv3HnKIEPNto0TFo4R3N66ZZTkcP+TETKhxFjzSsKzs8ts0oTPsH4h+r7JCtg9wXV
         jbbA==
X-Gm-Message-State: AOJu0Yxru2GDvk3l/+ME7D/V5DpmncdZ8/VLa33PVsrCqFw8VnnZfVY7
	D4Cvs5wKiHmSekzmXXL6kn0X89gC4xPsD5c6uN6DGZqv1213HKPNOoG55NRmYQuwO7TP7MvRUQL
	7NpbsgnK5CZYE2P/D8kMToLA9cV6dc8E=
X-Gm-Gg: Acq92OF82bTu0eROPpce2/oJGF0rqEye1ZkggZpuVjGTYIzUhoZ09vk38IEmjv9i3v0
	4rQr6zVQidLkHoQNKHZQ67lfmjqlY3/EkRS5VYdZPwnbJzv0F1AAjQVxe13sQTYxPDRUuQhePHS
	Dfj8rmhUbr0+tJFL0bmn/nC7dBriBttthGQVvavK5duTbdlPoFVI5QN6K7Ov4r0AMb6X24Vac1Y
	ReYoi33FdjPJKKWVsRhEO3PrCsPZBTxU4L5FzPsB0GvTRmVHnDkN1ot+659EANNo0xEvZhRmnJI
	4bJYa8SxKsFrwY9WXZPvpxHiB0XUp/SAGAIR1k04Moilzu3u
X-Received: by 2002:a05:690e:4144:b0:660:580f:6a3 with SMTP id
 956f58d0204a3-660de5e1aaamr7412854d50.32.1780584697659; Thu, 04 Jun 2026
 07:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-12-frediano.ziglio@cloud.com> <1bc5ffbe-6bbd-423e-a77f-f810710181b3@citrix.com>
In-Reply-To: <1bc5ffbe-6bbd-423e-a77f-f810710181b3@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 4 Jun 2026 15:51:26 +0100
X-Gm-Features: AVHnY4KXmybUOZbZpy2YuHIVVxqN7aIp6ek4FNQunpEdk7aZJND_1kcberjV1yc
Message-ID: <CAHt6W4fx-_9-RXXdchewkwP1NBA9TZkG=broBt3_p=xpJvxgRA@mail.gmail.com>
Subject: Re: [PATCH v4 11/16] PoC: libs/guest: use foreign copy during migration
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1780584699-D9F6ACF5-86449E8F/0/0
X-purgate-type: clean
X-purgate-size: 2454
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23B1664116B

On Wed, 3 Jun 2026 at 15:09, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>
> On 03/06/2026 2:05 pm, Frediano Ziglio wrote:
> > From: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> >
> > ministat confirms the improvement:
> >
> > ```
> > x baseline
> > + foreigncopy
> >     N           Min           Max        Median           Avg        St=
ddev
> > x  20     1.1306997     1.1447931     1.1356569     1.1365742   0.00324=
2175
> > +  20     0.4311504    0.44180303    0.43616705    0.43600089  0.003109=
4689
> > Difference at 95.0% confidence
> >       -0.700573 +/- 0.00203311
> >       -61.639% +/- 0.133355%
> >       (Student's t, pooled s =3D 0.00317652)
> > ```
> >
> > The tests pass too, which means that it has correctly migrated all gues=
t
> > memory.
> >
> > Frediano: This PoC was adapted to be included in a final series.
> >
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> This patch is definitely out of order, seeing as you don't introduce the
> new hypercall until the following patch.
>

Yes and no. In the original PoC it was, as it was trying to check
performance difference using the new hypercall. But to prove that code
was working the new hypercalls were "emulated" using functions doing
map/copy/unmap. This also makes sure no performance regressions using
the new wrappers. So the code works with or without the new
hypercalls.

> But there's also absolutely no information what those stats are.  From
> memory, I think it was wallclock time of migrating a VM, but there are
> no units or sizes of the VM presented, so those are just random numbers.
>

I had the same though. I quickly searched if Edwin reappeared on ML
but it seems not at the moment.

> It also doesn't state whether it's measured from a PV or a PVH guest.
> However bad PV is (and it is bad), I think the improvement will be
> better in a PVH guest, because the foreign map/unmap operations being
> replaced are even more expensive in PVH.
>

The PoC was simply stripping out PV support so surely they were
PVH/HVM statistics.

> There's another area in libxenguest which would likely benefit; domain
> construction.  Even with kernels and initrds in the MB range, foreign
> copy is probalby a win, and it surely will be for e.g. the ACPI tables
> which are a few kB.
>
> ~Andrew

Frediano

