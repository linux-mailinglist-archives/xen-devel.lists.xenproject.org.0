Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jxCUGTNzT2rygwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:08:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863CB72F633
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:08:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="qP/n5OlX";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357837.1612169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlfm-0003mD-F7; Thu, 09 Jul 2026 10:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357837.1612169; Thu, 09 Jul 2026 10:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlfm-0003kP-Bz; Thu, 09 Jul 2026 10:08:02 +0000
Received: by outflank-mailman (input) for mailman id 1357837;
 Thu, 09 Jul 2026 10:08:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whlfl-0003jB-6g
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:08:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlfk-00D7IP-Jj
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:08:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f72ff-5cb7-0a2a0a5109dd-0a2a45039f5a-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:08:00 +0200
Received: from [74.125.224.41] (helo=mail-yx1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f72ff-ec1a-0a2a45030019-4a7de029d13a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:08:00 +0200
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-664cdeab266so2465674d50.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:08:00 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783591679; cv=none;
        d=google.com; s=arc-20260327;
        b=sYd+aURMBUyEKFjLOnIdRhpaBye9K2UFrlm5uoY3fvLQln8U1qusGCKt8BYePL8riS
         yoyNNHNgro/bnCXgAltMpSSk2+feI9XhJfHvHu13DaPrqdcz86ltSm8HAFtNrzbvbr4B
         ofq3afrSm4Dpu1evR0ZPCwL+G6mNJdJUWOEJa8jc7E9Lpw2xfafKjjTNr4NrhaQj05K1
         jVHo/T+loaVukT7aEUHWdCQCIfJv8cEeGTjYZT1Vm8BM9GS9DuVvpQo6K/PzTId1N9lW
         H6qTWYOiEQ/EF3obPikaCz+hYtasjyO84qOMLiIp14VREG6I84jKuII8kt7z2tXnefwl
         cHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vmLfQgiG1OKQw/Q65sHSdA5o0bfHAhfqA/NcY2EYuf0=;
        fh=aU3/UpxH5Blg8M5NzH55q/XY8irYVWQMVJdPeFRWhhg=;
        b=W4vxx+nSmXwvGCA4kLbQqSMx2hfzm71L+21h3hGRG5jux1gWVXGHurxicoIVrrjHUt
         M7edx9GTdx6imrGM2GdcTVbVg2eRsHQzpn7RPcevleMCnstgwlix9WfCFrcPIGk8V9BF
         UR+4XBOXcCmu+pRp1JJ4d1MOQ/Wt16rOt39YL7IIJMGPiqFUY+hWEH7ragomjw93SqhJ
         P/9CFjNUNPXBWsAgt/6m+941tsbgWnDmfUawdc6FXRZ25aZ6Zi33s/vfpJdK77KUhHDJ
         1SgXhYaF5i/wJFQ6VxvFgpRpPvsQNxxaDGDYZx9+so+RUkOm66fy7GHAZ0aWN0YH2dXo
         MvUA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783591679; x=1784196479; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmLfQgiG1OKQw/Q65sHSdA5o0bfHAhfqA/NcY2EYuf0=;
        b=qP/n5OlXD6sqNnfeIM+ZMwLevlBppo6NQ1tn8SsznihfKvR6MEPX8iYTUGUQUHEpIA
         /EDI7B8c+w3cIl5fLa6XPUPu0m9IQYAE6CtEiKtew/J5bwhyQr161l4up41vX2bshsCf
         RTBridqISkb8ZpvmQgSSNZSnbGxwSz2wWJTZlrkk/MhzIcsDTZ2PWPzoIiURB1RvhUPf
         jHATVoHYtAOE18OuxeILRLLBxnmxT/eKUIF4I7UDOjIeXIxKKlajwgy9KNsklIdWqn8J
         MOKe1Hkb2hKKcqvLkEE/Z5s7cPhf1K1m9pjULRblaHWA1GgQI4VchjQ8GBXVdQOB3i8L
         CDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591679; x=1784196479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vmLfQgiG1OKQw/Q65sHSdA5o0bfHAhfqA/NcY2EYuf0=;
        b=Up0ledIkPLxaGsdqH+cu+K4PbC7NAuuwk3qlUO1OGWg+/MDN91BfICcPKK8V1Ki76N
         4CkOxHA54+GdnC7IU1BrNbgLfYxB5LesDwW7Y6N1z3klYiOi6465mzsK7q78T95BLo+4
         mZDn+G4ZOoOdLjXKU75VpFZERR9CU1ioTqUCCebwGJ6Hkud8ohwsVlZecPxtDsEAvo4p
         4lfqfP7eX1Pe48u2pvtrKAFoupBGzwFJP2W4A0OJ2VJlNJRvypUIcigmDMb9oRAmma5+
         vZijJlBz3vBKZgywn/7qeWSGfLs2zYuf+CBBRO5UQBCK5lzGGgG2IIklr7rrawoHIU2U
         lyrA==
X-Gm-Message-State: AOJu0Yw0fGtuaIum4Gxz+h9H5mHTeIKEYXeorvc49jKRl3dodBfavyh1
	sbwXgB4N4Bo4dR5lhBWPFUH6PMf+ndZipdgss0CqrltGqsaZwyfpjgHkIdJ7BNwxtHvzVPgd7RZ
	xrPacO0aFNFXFjSWFOa0BAtviGG1TG2s=
X-Gm-Gg: AfdE7ckR/fPOqFQg39mvSgBNlzAO3AXgMnPmN5eJztXFCtbHmUQQkQbJ3boMI4+ppuV
	HBwFFonBtom1pZUdPdMrtIR+eSfN1cM8T6h7SFSXs3JM/V4/+mX2sd46mo6TaWM+yW/lrrxp1uY
	XrvfViTzGNI6pWr3Ow54fwTLvM7xKOLsIYQyCiJRS+Vrz3bfPBU4u1GqzsFctCDATYcTbSo4bYk
	BkhXlsCHchU8iSVmCOIdPM77LEJgOkfanj/33OEbhFDWk2OMMmAWQlbWW4z3DW4dt63XzUksHFr
	gPRbL1oOiUFwzT+Yd7cVUIdRkBI=
X-Received: by 2002:a05:690e:4502:20b0:667:8b90:3567 with SMTP id
 956f58d0204a3-6679f25c153mr3553440d50.89.1783591679019; Thu, 09 Jul 2026
 03:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-11-frediano.ziglio@citrix.com> <1783517550.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8@vates.tech>
In-Reply-To: <1783517550.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 9 Jul 2026 11:07:47 +0100
X-Gm-Features: AVVi8Cf39DXngosu_ccvThZV3zuP7fArGTj_DXend0VH5IZDBd0Ytjfvlf2GXmM
Message-ID: <CAHt6W4cw=R_50-dWevFJ_9gbaOjsdfHv9BZoVsvJ+7wiyhnXpw@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] libs/guest: add xg_foreignmemory_copy_{from,to}
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1783591680-B59BA5D1-078C78A4/0/0
X-purgate-type: clean
X-purgate-size: 2244
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vates.tech:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 863CB72F633

On Wed, 8 Jul 2026 at 14:32, Anthony PERARD <anthony.perard@vates.tech> wrote:
>
> On Fri, Jun 19, 2026 at 02:04:55PM +0100, Frediano Ziglio wrote:
> > This change prepare code to use a new "foreign copy" hypercall.
> > The new hypercall will copy memory from/to a foreign domain.
> > The new hypercall can be emulated with a sequence of:
> > - map foreign memory;
> > - copy memory;
> > - unmap foreign memory.
>
> I don't understand the point of this patch. The hypercall doesn't exist
> so there's nothing to emulate.

I think that imitating something else is the definition of "emulate",
we know what the hypercall should do so we emulate the wanted
behavior.

> I've notice there's a patch later in the series which introduce a new
> hypercall, but the changes to the library should come after the
> hypercall is been introduced, only then can we check if the emulation is
> correct, or even needed.

There are other changes after the hypercall.

In this case the new hypercall is to replace something that is already
there. The base idea is that the new hypercall is able to do 3 steps
together.
The reason to introduce the emulation first is that you can refactor
on the emulation without having to introduce the new hypercall.
Introducing the hypercall first would make testing more complicated as
bugs on the hypercall have to be taken into account and considered.
Also it is easier that way to enable or disable new code. For instance
you want to test for performance regression (in this case the code
emulated should not perform worse).

In the beginning the PoC was much more hacky and it was more similar
to the idea you have probably in mind. But a big part of the "hack"
was removing code, in particular the entire support for PV and the
verification code. Obviously that hacks could not be accepted so
instead I decided to change the code in a more incremental way not
removing things but instead changing to make it easier to use the
future hypercall. So I was able to test all cases (like PV)
incrementally and keep it working.

You are however the second person (after Andrew) to ask this, so a big
comment (probably in the commit message) is due.

>
> Cheers,
>

Frediano

