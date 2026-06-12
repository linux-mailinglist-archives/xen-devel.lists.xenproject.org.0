Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id znSAAKS7K2p1DgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 09:56:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3CE67782D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 09:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hxYwIQOG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336388.1598165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXwk2-0003jl-D7; Fri, 12 Jun 2026 07:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336388.1598165; Fri, 12 Jun 2026 07:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXwk2-0003gz-Aa; Fri, 12 Jun 2026 07:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1336388;
 Fri, 12 Jun 2026 07:55:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXwk0-0003gt-DM
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 07:55:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXwjz-00FJeR-CV
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:55:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2bbb7f-e002-0a2a0a5209dd-0a2a4501b4cc-14
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 09:55:47 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2bbb82-c1f2-0a2a45010019-d15580acd55f-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 09:55:47 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7e1916922b9so7959937b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 00:55:46 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781250946; cv=none;
        d=google.com; s=arc-20240605;
        b=hxWa6fIhUR1sJUPWl3sX5tAFRKO/OgxpnAXgV35ws31YBzx/SZZ01X2/VXlGlSbzfL
         MTXS30nwSpFsOoaEbXfw3rI2J5v8DlV2kxsRj+jFZxxweeK6b2IjaNoRbghqHOaRrDvZ
         2O2286p0GQTwyDcjDw9ayPd11LflOazxJ32CEqUfECPTUqq/pVn8vw2iLnRaLegFhV8R
         rAaHv3EZ5nuEDpmhi3NUUIXbWHrCm5HpitrcGX6A8WAtm6kECDMQ8YpxIqkOXgnyxL/y
         CgNmKmZtmguY8WNYhtr95nw1y4DD5doN+GC98+Ogz5Quxeo//udXKbsxYrhxC5r9xfOL
         Mtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WAhgM/bwj4Gunw+2eRNScB2cGhm25KSvmpb0zLwcjU=;
        fh=s2+nLqHBycqOi7ZA4ENoQVOPj02eSuGNAm2O5IHcq8w=;
        b=OJbswmarfAZCH8PLCTUaTzaAPgrTZzlrmPKbjte7t+gPbIY3hAgjlb2eIJsuQu2bzI
         bqXMFWAGagUIVdVaL8BtHizDsAPjP5W0ZHB5iOKtY8BMBhc22rDsQ+s26+ZMZ1PeJfTj
         FcR42URVHGW8T5hFTcFtEU7hBKz+hYmfvZ7IsmZ+nxtr373tKCgTS4T/yr7AX1VwRLh1
         gDt1ieexeQvod7ynOWccnnZmgkeKLTw/OmQGzQS9yrxrS/fZ4BgmY3pyajyie+UuUm8z
         wQnR1Yps1RVAZn8hbThRrhCD0ObAs0ruZoMauul0qF6LQR3p83PDANcTMibvJyKwnPka
         7S2g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781250946; x=1781855746; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WAhgM/bwj4Gunw+2eRNScB2cGhm25KSvmpb0zLwcjU=;
        b=hxYwIQOGXLW86ABPS5dIKAbmeALiG0j+BssU1PvLsPoXrohPcb/gfrbDrIeRGNdyz6
         j9mzG2k3WKrwwNSJ+d5HMzcyyAAwDVrv4Fvrn3cM4yEDYTZ0/HP9i/Y5ETfuvDHK3PtZ
         ToLMaRjWe9TiaGy6zCE2Z+C38Ibdb9D1/f10ll3KGzZeYf8Gv3INyKbcCl6e1ChqpN/n
         TLJJLKM1rTJ+CnG3thc8PU72tnQMIqaf0urGKpQ5iNmVYL3TtmJhnmlBI2zbCOIv94wR
         3eUz6BQ7gL4YVWrDILIxaq0fw7661vRuUC9OOSj8eG92k3PEREiUEHpDDGzbrcc2d2GZ
         ypcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250946; x=1781855746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WAhgM/bwj4Gunw+2eRNScB2cGhm25KSvmpb0zLwcjU=;
        b=rMMr5vgiZ+QEkC6RUJuPQFSvG8DWmZyONP6O2xQUvYk5M6kENmt2GtF1fiY7he2fiV
         4N7QYRMvrK2+y5zKYqyzbBT9Rjyft9SR3KyjPa9CyYnWgQdbUqmgYllNthTECTCpbKTw
         TGsQoulB2xynyHjv/mXnAFjk7zdNJOuFX9nLHqyBbW70pYciqDvfM431PV2flQOPChm7
         c77VoKFPNJZTWtZVd8qCkviW/YtsA4bgsOssXdtB6175FzvzJoQUgqKP2k4l4n60MFUd
         jBgc/KL+XfWudRHOehCb/mXgX4Nucxp/YL4lRcLOXEdDA6TOG4AI76/rBDVUgnVKU7ot
         FRNg==
X-Forwarded-Encrypted: i=1; AFNElJ9OZ2ISYG1B2q/wzCUNQAFXCdmuj6WbhMzLwUZUUgmESD2bwhelCkC46LUHc5161vSsQLMMibZKcpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw89lOSSoMUKB+BP/95bGlg6RT4ldhgVr5g7Qu7bDLFwfoCwTii
	BJ4tB01Adw1wIKkKEl/pGpMI2rdW6nLWgCvdU36/Rxc8BW9OQedtwsfeBxfo29vlKPCrUb7m5gt
	cgBql9zoxb5cTmk7+MR9y7fB8b4EqfkU=
X-Gm-Gg: Acq92OHX0FzQdA8Mvb+zHwz68xXrUOxaDhkjqfmN/x+xBd+WMgM/RgDUZPkXQ/f2oF5
	Ui7B7fN642+NqGLmdh4IFQla17QIKcLPltE8EGyWY+foRPSbdH7xA+JqWMK2bPnd8xGe8iIn9uC
	Zqo7zAGZHJJUgmPG/SIdrAweKZnXh1R0/m9eUav0Ibb9fknNRzR0eva99moeetW1vn6u/xLZUnW
	1vDl/k0pzEHSJ9JA9uwWDZ77vA9slEGI7TLP3TdAYE0hZob6FWxz+z0MX5oGm9Mm/RP8RroBjHy
	xuzuka5sM+LrDdp9CEGoNHHzUdqlY6m64x8pkg==
X-Received: by 2002:a05:690c:2605:b0:7cf:a117:4ec8 with SMTP id
 00721157ae682-7f7b891e0c3mr14176207b3.38.1781250945793; Fri, 12 Jun 2026
 00:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-3-frediano.ziglio@cloud.com> <1781220672.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@vates.tech>
 <758494a2-e3ec-42d2-85fe-9ed9d21c682f@suse.com>
In-Reply-To: <758494a2-e3ec-42d2-85fe-9ed9d21c682f@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 12 Jun 2026 08:55:33 +0100
X-Gm-Features: AVVi8CfAI_lX5QECtp8rA8IyirQ6O22PUYJ6x4hF_kvAOsYE14ZbFlpnqBnJZkY
Message-ID: <CAHt6W4dUzZjFGjB3g94yuPrnzCN4Z=K2gR=zUK=G=0=_J-R0vA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] x86/efi: discard multiboot support for PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1781250947-AD5AFFF4-42BE9BE7/0/0
X-purgate-type: clean
X-purgate-size: 2316
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,citrix.com:email];
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
X-Rspamd-Queue-Id: 4D3CE67782D

On Fri, 12 Jun 2026 at 08:21, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 12.06.2026 01:31, Teddy Astie wrote:
> > Le 11/06/2026 =C3=A0 17:33, Frediano Ziglio a =C3=A9crit :
> >> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>
> >> The multiboot headers (.text.header section) are not consumed in the P=
E
> >> binary, hence discard them in the linker script when doing a PE build.
> >>
> >> The multiboot and PVH entry points are not used in the PE binary, henc=
e
> >> discard them in the linker script when doing a PE build.
> >>
> >
> > nit: it looks like both paragraph state the same thing
> >

This should be enough:

Multiboot and PVH booting are not supported for PE, hence
discards them in the linker script when doing a PE build.

> >> That removes some relocations that otherwise appear due to the usage o=
f the
> >> start and __efi64_mb2_start symbols in the multiboot2 header.
> >>
> >> Section discarding is not done updating DISCARD_SECTIONS definition as=
 the
> >> change is specific for x86.
> >>
> >> No functional change intended.
> >>
> >
> > Given that this now prevents booting using multiboot2 when using the PE
> > build, this is a functional change, even though it's strongly
> > discouraged (not officially supported).
> >
> > I would add a changelog entry to actually state this change (eventually
> > reminding that this was not actually supported anyway).
>
> Did that actually work though? If not, I wouldn't see a need for a Change=
Log
> entry.
>
> Jan

No, multiboot for PE never worked. I agree it's not needed.

Some more long explanations are in place. Multiboot headers and code
was always included in the PE file. Not as ever used but because the
code was common with ELF. Multiboot specifications include support for
a.out and ELF (and potentially some binary loading) and all boot
loaders (as far as I know) followed those specifications. Here at
XenServer we attempted to extend multiboot2 to support PE however at
the end we ditched for another solution (extending
xen_hypervisor/xen_module in grub) as more clean and simple. The
multiboot2 code was never attempted to be upstream in grub (so it was
only an internal PoC) while we intend to upstream the
xen_hypervisor/xen_module solution.

Frediano

