Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z6ZFEsv/PGoovggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 12:15:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9F6C4881
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 12:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=axNBEGRF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345431.1604298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wch7E-0004Gv-0j; Thu, 25 Jun 2026 10:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345431.1604298; Thu, 25 Jun 2026 10:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wch7D-0004F7-UF; Thu, 25 Jun 2026 10:15:23 +0000
Received: by outflank-mailman (input) for mailman id 1345431;
 Thu, 25 Jun 2026 10:15:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wch7C-0004F1-QQ
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 10:15:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wch7C-003IJ9-3j
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 12:15:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3cffb9-5cb7-0a2a0a5109dd-0a2a4508e1da-4
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 12:15:22 +0200
Received: from [74.125.224.54] (helo=mail-yx1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3cffb8-edec-0a2a45080019-4a7de036c5f3-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 12:15:21 +0200
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-662b76dabfcso2258086d50.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 03:15:21 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782382520; cv=none;
        d=google.com; s=arc-20260327;
        b=qSz/2IkQ0OeaFarbwCXz8xLMP1rzOPaBVIxYXMrUSJTUH0HmrET+zpzermYctb8Vko
         Jd5Ie4yARxgoUK6iNr1JOmViIpSJVJJmqFxZhia0GqmeQclGJluV/2IaNYYtWTJGiYFM
         ZJvvMMd9FwNwDWD2auWTbMpT3068GW7HXn3OfImHefRwJqaOe6ukRbA155MOMPZvv08w
         x7CQjygfHfArbRIt1vdBtasIvJHobLyERR6UI+tWPNdcSNVItE/wmZXWUiVSzmStJg0k
         vLaj6d4AZcLa2lkvTc/SGGS1c55y1hH64QY3Yv/WlIXrmzQ9K2J+VhxvxnxrbnXiW4z8
         SG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rJMz87qcV148+hDePpnfbNzyQ+RUWqyNTEgcxV03/Ss=;
        fh=7tMtp6uEeXxjORmxPocc/AXK2doTA2Uq8+EKLOU+wQ0=;
        b=JBz0Fw+JGsAXdcfzrShXKy44zumtiUouVBryUYVedn5qQetYciGZI8MTaf4dzD12yO
         HfwVxGRFfP4D2w7Vy5q+RcYZy2Si/jrW55htXBjCrlHsqP3N+bpAOvxx/78FCRy8pWjZ
         KIl6HgP/ucTuT3jkTcmEt861VN4+2kpqkDW3iucma9BSNq7o9n/Q9FQqNwXv6BK1ZBsJ
         mGFFJFMuJYLkhRB8ekAn2pq1FDQfLMpMvyx8HgfTjwajB8pd2sP0uUFcNsiQtfObIMvV
         IP0WkWsWafmvQDX2t1xsXlRpVxTUhMbwT151EoQM8OpwVyX39HBOAeqTUvKQM+SdtRUb
         R3TA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782382520; x=1782987320; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJMz87qcV148+hDePpnfbNzyQ+RUWqyNTEgcxV03/Ss=;
        b=axNBEGRFBPODoARTGwNaRvCorTl7WqAWO8Or1IW2ppkO3IrFJCwgg+p5Y2k0oHb1it
         7ASUkYibMmYhAEHipqZ2xU5U7NovnOZ0MKkNvmHbizXrY64P4TVZMYcKhQFvEDotmmzk
         t4hZ2Pm1azD9Gf5OoPk0iUlFvMuePCfAhae6/fNzukc6ttOahuCA4YAyka2OxpY33Zxf
         FoQTP1kTj+djvMSeJKuuqvh3T0uQIgvetHxc2VSBA+b34htbgMw59KwfABwdSKefyiTX
         2bAgnVANJc9V51jXW0VyfGZd10kuT4Ea/uDhM9tW39LaoydOeFnMBtY6hpfsk+i5uB0Z
         3HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782382520; x=1782987320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJMz87qcV148+hDePpnfbNzyQ+RUWqyNTEgcxV03/Ss=;
        b=fsh2tXTs9JzaoUxtEYyVE35UyO892kw+78KSJukD6rJhpKiv0vnpOqpC72SyWUkDUj
         8EnYtHbyPRQ2RqBL52/vUfSUvAKjVYeBPrnczeP9y6+JRrQBGui1VgJT6bXTA08zSNPt
         qyVXdsfpERqWqMd9sy7awyKzRIsTyBo9tDY19HHDBmODajQtXU40mnmSrZc4HLDVOx8N
         q7XFEBaTf9FvaqMtzaiNo9FN8xhrHYiwwaZuDxnHddUl5fbxmHafdWbCCenmR5m095fA
         +SdBnbu9f19ZkcCGYstfwRCss8YC1djTQwxqmPNpgGrHREf2UtPCNBf/i0kTj105YWnT
         7dVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAyyjXeG5yDN2mLTnhfx7VnwKgQgDJBX5gMPnK8PviPSZ4JMOMHhWsulHRSgd3ISfKPr5lnFmZYp8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh9sxpk+lZidA4bNdFuIsMMz6+0NaFrkpiJCU5zn6CIGUncnRX
	/a4aleAqkvFwQ5+1iOsu57d+8tkxManu9OC0Q9yHjPiU/fKY9BQT2F1ki6SJod5zEINx5Acp12w
	/MYOhWNqxhCejCgKnCjUNhSuePVH1fjs=
X-Gm-Gg: AfdE7cl6IpWw+eMNcxsYntR2PRVJu/FKpTCxovcNyHo36mSs20PgEkMpJXyL+L0eA/Q
	wAg0y8alIMi484f2ctBh+PnErx5vgP0T/btxGIpLfoJB1q7x0dzuMoplaPeUMbkg5zJVcFZ50Ae
	CVidsKIWIZWJnrIa08FJ3Jk6yGimJYGkg8iy6JKrpAgLaNO8mlSEGNfoaz58biSmnljGxQS2/xW
	/Jttc4fptMTpUtOLNHYkmb+thAh+7QdotkT5RlIN03iRo5YgR+1QF/u8CVKMq08MkEdSeidOX81
	IJZGeD34FUpBguG9RzcE5kw=
X-Received: by 2002:a05:690e:4087:b0:663:21f7:2d72 with SMTP id
 956f58d0204a3-66487f0ec2bmr1343760d50.60.1782382520006; Thu, 25 Jun 2026
 03:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-3-frediano.ziglio@citrix.com> <070ff282-5ee4-4c24-b0bc-92d187c40dd9@suse.com>
In-Reply-To: <070ff282-5ee4-4c24-b0bc-92d187c40dd9@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 25 Jun 2026 11:15:08 +0100
X-Gm-Features: AVVi8CfieW3_p2OmHBM1qOOgAMJYC5TuLWbCWEAWsxrmYa4T1hOvTFA8NnZ38So
Message-ID: <CAHt6W4de1ddW_xMWhbJ15vA171tuHVGJu0TO0bAH845EDQN4gg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] x86/efi: discard multiboot support for PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1782382521-40F2A3FC-B489E871/0/0
X-purgate-type: clean
X-purgate-size: 2848
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4B9F6C4881

On Wed, 24 Jun 2026 at 15:18, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.06.2026 19:28, Frediano Ziglio wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Multiboot and PVH booting are not supported for PE, hence discards them
> > in the linker script when doing a PE build.
> >
> > That removes some relocations that otherwise appear due to the usage of=
 the
> > start and __efi64_mb2_start symbols in the multiboot2 header.
> >
> > Section discarding is not done updating DISCARD_SECTIONS definition as =
the
> > change is specific for x86.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.=
com>
>
> While on the surface this looks okay, there are still concerns:
>
> For one, this also discards the PVH entry point. That's technically fine =
aiui,
> yet shouldn't go without mentioning.
>

Considering that the code/data is not exported in EFI as

#if defined(CONFIG_PVH_GUEST) && !defined(EFI)
  /*
   * In principle this should be fine to live in .note (below), but let's k=
eep
   * it separate in case anyone decided to find these notes by section name=
.
   */
  DECL_SECTION(.note.Xen) {
      *(.note.Xen)
  } PHDR(note) PHDR(text)
#endif

yes, technically it's surely fine.

There's a mention in the commit log:

    Multiboot and PVH booting are not supported for PE, hence discards them
    in the linker script when doing a PE build.

But not in the subject:

    x86/efi: discard multiboot support for PE binary

What about simply changing the subject to:

    x86/efi: discard multiboot and PVH support for PE binary

> Otoh you discard call sites of functions without discarding the functions
> themselves, violating Misra's "no unreachable code" rule. Eclair may not =
be
> able to spot this, but imo we should still adhere to the rule. Proper
> coverage analysis, for example, would likely turn this up.
>

That makes sense. Given that most code in head.S is now discarded most
data sections are now not used and the only thing left will be the
trampoline.
It'll take a bit of time to search for removed symbols.

About the "no unreachable code" I think we are violating that anyway.
We package "built-in.o" files and then use them to craft the final
executable. I don't think the linker will be able to discard unused
functions for that reason. That does not mean that more things can be
discarded.

About discarding more (I think a bit out of scope here) for the EFI
application I don't think we need BIOS/EDD code. Not sure how easy is
to do this without having 2 objects (one for EFI and one for ELF).

> Jan

Frediano

