Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tw6JFrtaMWoihwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:16:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57151690583
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:16:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XJt75yVi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339300.1600486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUaN-000618-79; Tue, 16 Jun 2026 14:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339300.1600486; Tue, 16 Jun 2026 14:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUaN-0005ze-3e; Tue, 16 Jun 2026 14:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1339300;
 Tue, 16 Jun 2026 14:16:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZUaL-0005zV-Mq
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUaL-00Fbu1-3V
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:16:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a315a98-bab6-0a2a0a5309dd-0a2a450ac2c8-44
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:16:13 +0200
Received: from [74.125.224.53] (helo=mail-yx1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a315aac-56b3-0a2a450a0019-4a7de035ac7f-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:16:12 +0200
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-6603d8697d2so4429028d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 07:16:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781619371; cv=none;
        d=google.com; s=arc-20240605;
        b=GV7bu54ZpWpvsUMp92szU+NmkRK6pYbebIr4rYd/PDDWMQqC/sCjIzYRhBhb0hPdFm
         7rf3jXq+LElO+fjlOhHi+ywsgWSgbEFwahTRV3TKJ7ZGTNrOWCodjmHZuZLbV6XKjhCy
         lhUi9o8J83S87Vhy66g4jg9M0mYTKR8SMulJGpn20DdBR0ELC3DBGEbZd1558tMwAVex
         yFwWexJBkrpNJeWR1XWdto5CNW370zTxkYMSvqdTMGNI3Fgjau3q/B28D/VulDoR8THT
         74zvo2LQfAElm2a/milzxGkfIX6imWSocIhfY/emoxwOZAM7Uv2jZUWwZbi0WbReLHIG
         7pXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PMEAINg+aHa6o7h2UNOmdBFFwqVJV4ixMeJz12g4qkM=;
        fh=KJng1RkmGevvKbAEHtKfKAYuaGlCKyXsKh/qhUVbq4c=;
        b=iLvx6jGqd2tKLq/uDdDWI5e+BdDxP4OmiOuWnJ9kXXNUhsvwC78oMKJWue5aqSN3qH
         2veGYElNhXKMcyyoQgFNbstAIQppZC3b9W9cSYnD+EmtSLPkHnJJS7wbmGCpTv6gPHNr
         rjYdH1eapMq+idUdveqUgkOeTk3+UIzdpzpJllAadh8OYfCvqXf/y2nIHqa2VS7TAzEp
         goPrGN4wRQocVBoXgHO7aKQJzIP4X42sCeVORFREVOFracfT1/Z+tis/4icQYmuFDVG+
         OGs8lej/Qsfy8YFm4CI1BnI43G5xczJkkYLUE4hDxog/7riDNXlazDZh2sS/SQ5vpLez
         PXLQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781619371; x=1782224171; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMEAINg+aHa6o7h2UNOmdBFFwqVJV4ixMeJz12g4qkM=;
        b=XJt75yViwHumICAZBjsmNGgh4nTP4Q8E7fcRh6oNLPaap9YPHGQLlckxMKw+v1Y6DE
         3jQSkETVA/MyYfyt96ncLOWezay9czIMAW49dM/s+Oj1rxYnYhV0akYZS89PqxdRdH3o
         nqSWRM9F/fFfOxTrtZQvn80IxygqzHck/GdyvadL29x+8PluocDvC+ei+hkxYVMfXoxJ
         edywS1Nq+m4ghoKgniw66Ddze3PEWQZ8kB3L551gfLcIqtl+QgfZZVycKliZ2JCOQM9b
         zkkoCRjf1X7lO8yNe+8QUaqX+aIWDlks5ll5g8D4HaOWZFRH9o6dDg6rg1Zg/Sk5KUI4
         LLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619371; x=1782224171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMEAINg+aHa6o7h2UNOmdBFFwqVJV4ixMeJz12g4qkM=;
        b=c66ZoyVqZ359WbmP/Cn7/wT1wqHlA3XR09zRHV9TNbEHZXj4OYxQPrJGdSRv05U7YT
         O6P/4tDX/2TPizWmsWUohAesSSNIoUYG9Z7QhDa/2y7LkycJVP8qqCabDz7L300oMA/E
         UuNeAoCtz1QW/no/a465KBBefRa7urcI+8JcIBDtGItDaB7+RxfuKd2x2FidpGcWXCki
         NPidCOdQtPCRFn54ZrTAvoVhR7nbI6oeHip5UWc7rOEElAzFNMNp50E0A2IMiWufk2dJ
         1XI53nbmOHGdvKy53gPe+DP3DzL4imA6mLJ2+2FNhRtFyAGIFznmFyh0xTfeozgdEbpo
         xfnA==
X-Forwarded-Encrypted: i=1; AFNElJ8YNvujL0yeTQt58u1PLEEPQiFCmOtVsrlmPu/TtgQpGtszBP953Q+M9zfhf1KlsuSeCWuo+4p8ut0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRXUlDHqpinyUv6Xg2TDGgbbVdxIABfVluHP09IKr9tAfzGNjw
	5/B2DemVzxBvlggt3Oo3+NtuWW60YENYjtafR4QB0pZ2kPVUaj49hPCzmUuN+D2cdaGXHkJkr/r
	/FtYyBt2SU+DIzoW9kCc8pztFGExm4ns=
X-Gm-Gg: AfdE7cmLijTIDQJ2MMIn9h+Zv9/LhpUUQjt8lN1LdodMWskK8PuBtSDedy1ToVmnLJ7
	sRW0YoxYSi5XKLUNuZu/h7qKVrDdltKDU1C0I+5VQFKReA3W0eU+KcUx3yZoqqntyVSlbkwPnVO
	r4/Osigt04ARERiv6WuhKIY03xfj9KrMSDyGWdHgCa5ZXDhku4MV1tTnEVG4YSModMViKWYEsUS
	0WBHAo4fvLYrI7NHF/ZYww141WJGDVgc2dfy6s2+NfdM0UD8SvPtZ+A+VyTeG9SONAwzjXYhCVT
	+Mfi4exWqLZqmSqbFjFX0oEjO0lnoBoA15N4lQ==
X-Received: by 2002:a05:690e:4807:b0:65e:1d95:29d5 with SMTP id
 956f58d0204a3-662b6183fe2mr1916247d50.41.1781619371354; Tue, 16 Jun 2026
 07:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com> <b310db60-850a-4096-8900-54d0816e5063@suse.com>
In-Reply-To: <b310db60-850a-4096-8900-54d0816e5063@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 15:15:58 +0100
X-Gm-Features: AVVi8Ce60iJ2yoaZFcGUkehgzalffxMPGat1Bsc7VJ2liVaXZ0g06gAmoCel_r0
Message-ID: <CAHt6W4e9j-hNuTSuGQ=rZeUEcTR-D+6d=V4-gPZxzn20RFL88Q@mail.gmail.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Frediano Ziglio <frediano.ziglio@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1781619373-727758B7-9459311C/0/0
X-purgate-type: clean
X-purgate-size: 2439
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57151690583

On Thu, 11 Jun 2026 at 16:18, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 08.06.2026 19:31, Andrew Cooper wrote:
> > From: Frediano Ziglio <frediano.ziglio@citrix.com>
> >
> > xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> > Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
> > to boot xen.efi when debugging symbols are included.
> >
> > Either way, having debug symbols by default is abnormal and contrary to how
> > the non-EFI path works.
>
> I'm not happy with how things are put here. There's nothing abnormal about
> including about anything. What is abnormal is the manufacturing of a 32-bit
> ELF binary from a 64-bit one by mkelf32, to please bootloaders. An EFI
> binary should be permitted to include whatever data it wants, and firmware
> should be able to load it as long as memory permits. I don't expect you
> mean to indicate that problematic systems don't have 45Mb available at boot.
>
> Including debug info can be a waste of I/O bandwidth and memory, when the
> loader doesn't skip loading those .debug_* sections (for valid or bogus
> reasons).
>

One reason, at least for secure boot, is to compute the hash of the
file. The hash includes almost everything, excluding the header
checksum, the signature section header and the signature section (all
that must be read too).

> > Produce xen-syms.efi unconditionally, just like xen-syms.  If
> > CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
> > then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
> > discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
> >
> > Some old versions of binutils ld managed to produce efi files which the
> > matching version of strip couldn't process.  This includes Binutils 2.26
> > included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> > less broken toolchain.
>
> And we're certain newer versions of strip don't do any harm to the binaries?
> Already towards Frediano's posting I said that having looked at how things
> work there, I'm far from certain.
>

Yes, software contains bugs and in this area binutils has quite a
history. What we know for sure is that a specific problem has been
fixed. Are all the bugs fixed? Probably not. I don't see a valid
reason to wait to have some kind of "bug free" version.

> Jan
>

Frediano

