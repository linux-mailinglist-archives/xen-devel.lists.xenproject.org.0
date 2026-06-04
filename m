Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OhKNNkZUIWrPDgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:32:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431063F0EF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IODsIL0Y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327631.1592452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5NB-0006qd-7K; Thu, 04 Jun 2026 10:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327631.1592452; Thu, 04 Jun 2026 10:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5NB-0006oh-4i; Thu, 04 Jun 2026 10:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1327631;
 Thu, 04 Jun 2026 10:32:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wV5N9-0006ob-RX
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5N9-00Esx6-3o
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:32:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a215429-bab6-0a2a0a5309dd-0a2a4501afda-42
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:32:23 +0200
Received: from [74.125.224.49] (helo=mail-yx1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a215436-c1f2-0a2a45010019-4a7de031c17e-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:32:22 +0200
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-660456349d9so704550d50.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 03:32:22 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780569141; cv=none;
        d=google.com; s=arc-20240605;
        b=Uy88MsEmqy8oQpAAH0neL5XVip3wFLQnfYFFUu4MeWc8wxaHTVqd8Bx858rIPox3oN
         IWwWtV5EWw4PkkVXIe46YCNywulsnVT/clqE2sm92L4jPqPtc0qeOmJKHaWXEpYDiFRY
         06g/5v5HAUyGiFXYl62GT6jA2CBgkabgZcidyYcX3VDY8W6jiBp0imwhSI1vcv1IjazH
         3Ihw9SZUvsSI3OcZPdF+qDFHKCfHR1e9Es43pvpLxloE26jDZglijt0eCkuhWAGcQwmZ
         fUHyYyzt5cNmqmeGBzTPym6mSFndRD+Ar8SQ+UsFO7QdQel7Hr0FsNXE5kxE8zeECHRb
         qr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kTVs0z6F28EiA5vbr0oEiu4LOa8D6Q2SwnuB/7vzbwA=;
        fh=hLlsiwH23pAKb3EaW5nccT+0+LH92H+BDVsLIMBghTg=;
        b=TrkJitPrDcRROsCCs8vpWz0Zby/EMGoem9yAOYh15wLS6JCgbCEHOqhiycjJj4jabV
         LrfpVJWz1EUc2AfgA+SHwr0dZkHcUSBTvFUiSTzf06pBzRFyuH7hXa/ogdDNZ/W45Vj3
         MGdsF2bRDlQv88p5ThOE8I4PCVwYcHpfOkDnaXwr5Cp/Yq97YUtzNangO9PF2/CMOtyv
         2O+WyPHh5Suud/dZojvuatWjT3d9bWLJTRmyWQOyUsNCa9VC7WDQlG+Pm0e5ApCmxsL1
         mLMdG6P2FQJsdijQ3tg7WnhT5MFpm4oAt9fln75qzbGEM1/CUgHhvZGeWYGdcMUtvRfd
         oDyw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780569141; x=1781173941; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTVs0z6F28EiA5vbr0oEiu4LOa8D6Q2SwnuB/7vzbwA=;
        b=IODsIL0YyG8xpUt8O9gLkpENaqiBBPVj3+dB2Y6YwyvrKwh5rENkEcfwbayeiO9F+n
         3J5OkKBhG1ZAaJkOP597Mkit8WspVvAUp04ndZME37nIHVfDBdGzyjaQ1S73F6GqwZZe
         AejD1L0jIbhJj5rm0sTySQxweG+nAzRYMdU8PHOCBgnl6B7V2nnaPgwN3uAle+SG3CXD
         UdkNSINM3reeDzR31mzn1tzwYaURcB9+FCSkN5q9Fu400DnqblN3WjDsmSEZA6w14UxX
         FCjCCmLdUnNZ/uPJOrbB690nxX3xJu62E3nB0Qb4gnxMCumphRkyuVbj+krAeeFpmLgs
         4rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780569141; x=1781173941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTVs0z6F28EiA5vbr0oEiu4LOa8D6Q2SwnuB/7vzbwA=;
        b=VaCq1srHfW9El/3yITjTFmKgHNyZUcUFQNDUqp+k9hNO5wlkWjZ3mIle8PyZJeNNaC
         HEg/wklHBO/e3Uz0+DQ3cjhKOFxPxfD239z/zvf7NuV/Zp8IH5O9kxh7MbQJGQRG0dy8
         DUiEt7J2z9RaU5McjHZL+W9+dcoDFE8zWt2CDgMwSkP8lRexnOWRi6i0dwyXIH/er0je
         4WtcBLO+SIeZ3IJvWWL53Kgo1DOU5TpSeu4yFOh0fk3pSnuR3C2Q7Ybp8Ob8YNBDuyZD
         9Jv1iuxLmd/G/SjP8fWL4I+F6Z5/w/x0IN3ed1oFQkpDqgT0bk/ql/Nh9cXjywKmTPNJ
         hIyA==
X-Forwarded-Encrypted: i=1; AFNElJ9yes9vv5dqbLpP2M6I1HSpTIGoPnVjUFYN66b77GaMx53SXJYyTrxiSp9dA9hsff6c4Ocxsj2R38A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRsoE9OVvEqd21+EWKAroCr0m36S1jDTG2ePAhUmIyrwrtz1uj
	EffmgfbtPK/KFyFo65WaJgGwJJTAewKtOGkDKkV7OB4/hpKDvdXp/D7PSkz6Ul+7GWHkn9FWbNJ
	gA+IEg4b3I++mrJiox/FHw2IduNFBkmY=
X-Gm-Gg: Acq92OHG5i6kRa+QjVeJsy+bTJOVBrwLxDpyHaXdraRBy6EjaMigKPxLISmjuELk2cb
	vAnNASxPeKIBSBrem2EErOSIUTZ3eZedE16L1vjBs9ofpJIUfxW7j0xFz7nE/5QZ1hDoKrGQbB+
	ebOsrsF0IcomCkJEro/zJ+TmwNK/d9GtLx4b8UpQSo0gwRs4J9NzMAx6yp4LNtKV6U2ZBmS90hW
	5h74IlpdjnC0Maa3RmjmBo5JccpV6OfFZewrMS9cViBeXElSMd+Rq9QnsmxYLWe41UvFBNYN/HW
	Itwjkjs6dPJQf9LlH3CAo36U3ch0e5LwEBCyLERWhSvlJwO8
X-Received: by 2002:a05:690e:4141:b0:660:30db:6929 with SMTP id
 956f58d0204a3-660df48116bmr6042914d50.20.1780569141489; Thu, 04 Jun 2026
 03:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-5-frediano.ziglio@cloud.com> <dea51228-0eaf-4e30-8ca4-fb4a5077a624@suse.com>
In-Reply-To: <dea51228-0eaf-4e30-8ca4-fb4a5077a624@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 4 Jun 2026 11:32:09 +0100
X-Gm-Features: AVHnY4JJCD4rgx-E8XoPhCzki8wSqwl3wuYD-aqMZLSpCb2TB2lAytahYFYc0G0
Message-ID: <CAHt6W4cxh6bQ=zY4e13cG=nvsNVyd9cMx_T8ajNwaAT19tu1Lw@mail.gmail.com>
Subject: Re: [PATCH 4/6] x86/efi: discard multiboot related entry code for PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1780569143-B6B5EFF4-7862795B/0/0
X-purgate-type: clean
X-purgate-size: 1213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4431063F0EF

On Tue, 2 Jun 2026 at 13:17, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.05.2026 17:35, Frediano Ziglio wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > The multiboot and PVH entry points are not used in the PE binary, hence
> > discard them in the linker script when doing a PE build.
> >
> > That removes some relocations that otherwise appear due to the entry po=
int
> > code in head.S not being position independent.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/boot/head.S | 3 ++-
> >  xen/arch/x86/xen.lds.S   | 2 ++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
>
> S-o-b issue again.
>

Even if I didn't make any changes to the original patch ?

> > @@ -200,6 +201,7 @@ SECTIONS
> >         _sinittext =3D .;
> >         *(.init.text)
> >         *(.text.startup)
> > +       *(.init.multiboot)
> >         _einittext =3D .;
>
> Aren't you making a needlessly big change to the final image by placing t=
his
> last rather than first?
>

Yes, I agree, .init.multiboot section should be even before
.init.test. I'll change it.

> Jan

Frediano

