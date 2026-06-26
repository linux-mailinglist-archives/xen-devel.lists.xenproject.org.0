Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9NA8EDJLPmo4CwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 11:49:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE206CBD2C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 11:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XEYQTEpl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1345998.1604568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd3As-0000NU-Oe; Fri, 26 Jun 2026 09:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345998.1604568; Fri, 26 Jun 2026 09:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd3As-0000Ll-M4; Fri, 26 Jun 2026 09:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1345998;
 Fri, 26 Jun 2026 09:48:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd3Ar-0000Lf-Eo
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 09:48:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd3Aq-007pKZ-Rd
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 11:48:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e4ae8-5cb7-0a2a0a5109dd-0a2a450b87ea-26
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 11:48:36 +0200
Received: from [74.125.224.46] (helo=mail-yx1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e4af3-ac48-0a2a450b0019-4a7de02ec17c-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 11:48:36 +0200
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-662b95934dcso814784d50.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 02:48:36 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782467315; cv=none;
        d=google.com; s=arc-20260327;
        b=Kne/s1luz8XMTN+CVAuQarRiTQZnJCqGfbWt9WsYk0ggVl1MQoO/tPWg3FhOz1+41g
         nwEY9jYc3w5cVYXh1dSdHuCaPjC+0YsDCQHXsb2CG3W9KAUJiOdfZlEbNZaVgHq1wUJS
         5VJkIhR5rn1BmfYGhiuGIneua3rksZR2VfRra6KmGzrj3zgRE2jx4IBrZtTiyttd5uSp
         WCh2CPoBjATN/SXxqenvjUqQ7o3UDnEqF43EGSkGzkRF0fF2NmZjrQIbwfcYDygrhKkp
         FG+FAMlmLVLjmp+PBxBevcMBp+jtaDyp9x+XfFwVILPmaw2rNanlDiaVpgogFcoSwazY
         5Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxbREeCEQh0K/ywbKVEsRRtY9dsFQ5r5LVqa9AWhv94=;
        fh=7D9Yw76m+HOxt7RvILixWLDMx88k8e79GgP3XRnlNkU=;
        b=qWOXzeWus4lmkA2pnrsT+OsIU7n/mDnf4uX8ogFQGk5MdWvyDKvmDgD0NPk9oOLdZH
         aFJ6w+/xvwdNSOFDYHQ606g8JKDCw2WYUkxnyF3JfLVWqUQZk5/xS8kd9HrUVVApCorp
         REaSiVkU0w5Xx/j/XvnzdixumolBbfH7Ncc3qPD/KSmxKgw3549lLruqlLeksi+LNa7b
         DGKn91ISDbAApfo6MLO8YJbgtHTyqdgJCxewLjVGyW+zbebLB/IKJK70jOF9ERQDjWmQ
         GTkz2d0zvjmDhFmvLleUdV6x9ZLbddWolaA9AHABIJIaOV2WAsfugYyMHk2n5kjMPwVy
         gYcQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782467315; x=1783072115; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxbREeCEQh0K/ywbKVEsRRtY9dsFQ5r5LVqa9AWhv94=;
        b=XEYQTEplL3lt+4vU6IJpWEFF9BdHn6BPVBqAuvSdF7920qx43HIfM9CoJTfyelOZrI
         05fxT8noBAvBn2zcfFRQiP0KDIPBVF/VuD181o+nCE0rQxfjts/XznmkI6ufccYFuvJo
         SVgUCUhocFjx2BjUBOFE+B/t6C8IGtg8s6om81HdnXIOcnl1HlZpwXbx9QVMPFjujvlM
         F5wCb4OUm5LmXmtLVB1WP+tD5yAOEMWcF98BWsi/EM8Mp8uWTATDF7A4KJSv1U8uHwVV
         wGOWqHGPpkP0xXeSM/gnr6C+l6CiB2PHlA1kd/XZGFlW14nFNGljcO/iIeLGTIxlBKWh
         ftbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782467315; x=1783072115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pxbREeCEQh0K/ywbKVEsRRtY9dsFQ5r5LVqa9AWhv94=;
        b=Bt+GzsyuPmK4uXK44VMsq0YTiW1ZY9wODLlfasKT06kTVM2prchlbM0fbzaxXbX2Op
         vipPJsNZtwR8+7AlGBLs2tt1mLj0z5BSXm671uVDKCVOeturMYnmqy0O2Il7DmgxhHf4
         F3+GzagoRJwrJQjY/gF/SWBAD3segqKJedmsCSzT4MxN+BZjrGIy2nFA9AZoXGYnLKL+
         LWc9V80eWhX78oIyFK9SSJGRAlzSTZSe1EIsG3OQv5DvoJKk8YS2+fZgEBfEsUXuC0+q
         gbh7D4cT7mZJQDHz+1O8xnvTbgK4FibzRQhpUxauv7gG76TdxNUigAxTxNB4Ej+tJxTy
         sZUg==
X-Forwarded-Encrypted: i=1; AHgh+RoBn7NtY9dnIHg7XZQ6fHUDvRje1LNIvz9eFwaL20E/Sw2DCS2uQ62eaVeQlHPC2QfjcZQlRd9nOs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJngJq5yN0FaRYbkP48TOfQpQcL10vPy8SZZUkU3GkFfcyjVue
	0wmxJRdMzuvvkAoh+6NrIfFWwiPWVPcd6Iym0IiXD5j5k22Sa7Rkn2uKCdk23JZQQ6gGKW0uD9m
	dyaUqNFwI/cJllvBDyIpk3VjsHu8v2uk=
X-Gm-Gg: AfdE7clpTm0SjOzlNn+PY+U9pLAxgT2RCgEQClHxbCNsC/wvQXIXpyT7JxyIwrZ0Cni
	i2rEHdd+Ewm5CYev9EGVPbGdFOx7yPOF/nJoUfN4PL5UQrlizcRKW/ccWFTiXhiZ9Szx7+ZGh7f
	HJQfxwLnmvKEmIHq0qyIK4dwnl5AkFXvYmJ+m108E/Jb0QD0+Uz/fg8qqf4j+pROvT5+y1EO9H1
	uEha2F2a2J+RjD/qn16p2KzaxI8+pMvX7fhBN2fv45UfhsB0d1o+27C+CsZFZQq8LHB/x45UVcE
	grll/7F3ee+6QCDcCfmrSd4=
X-Received: by 2002:a05:690e:1243:b0:664:74db:5911 with SMTP id
 956f58d0204a3-66487e54d37mr4529980d50.50.1782467314876; Fri, 26 Jun 2026
 02:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-3-frediano.ziglio@citrix.com> <070ff282-5ee4-4c24-b0bc-92d187c40dd9@suse.com>
 <CAHt6W4de1ddW_xMWhbJ15vA171tuHVGJu0TO0bAH845EDQN4gg@mail.gmail.com> <4f971b7e-b9ff-44cb-bf29-3939c8659b07@suse.com>
In-Reply-To: <4f971b7e-b9ff-44cb-bf29-3939c8659b07@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 26 Jun 2026 10:48:24 +0100
X-Gm-Features: AVVi8CdaSUng3rj2WWfjBq8SulWRsmFzXuDn5WIBlbIqqi4PmX0Zr_cxtHs_RE0
Message-ID: <CAHt6W4d2ETm1G5rv5h5ESvfLm1F9+xO_v1PE7M5sQdJHxA8p1Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] x86/efi: discard multiboot support for PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1782467316-A7B30220-7794810E/0/0
X-purgate-type: clean
X-purgate-size: 3990
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BE206CBD2C

On Thu, 25 Jun 2026 at 12:18, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.06.2026 12:15, Frediano Ziglio wrote:
> > On Wed, 24 Jun 2026 at 15:18, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 16.06.2026 19:28, Frediano Ziglio wrote:
> >>> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>>
> >>> Multiboot and PVH booting are not supported for PE, hence discards th=
em
> >>> in the linker script when doing a PE build.
> >>>
> >>> That removes some relocations that otherwise appear due to the usage =
of the
> >>> start and __efi64_mb2_start symbols in the multiboot2 header.
> >>>
> >>> Section discarding is not done updating DISCARD_SECTIONS definition a=
s the
> >>> change is specific for x86.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >>> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
> >>
> >> While on the surface this looks okay, there are still concerns:
> >>
> >> For one, this also discards the PVH entry point. That's technically fi=
ne aiui,
> >> yet shouldn't go without mentioning.
> >>
> >
> > Considering that the code/data is not exported in EFI as
> >
> > #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
> >   /*
> >    * In principle this should be fine to live in .note (below), but let=
's keep
> >    * it separate in case anyone decided to find these notes by section =
name.
> >    */
> >   DECL_SECTION(.note.Xen) {
> >       *(.note.Xen)
> >   } PHDR(note) PHDR(text)
> > #endif
> >
> > yes, technically it's surely fine.
> >
> > There's a mention in the commit log:
> >
> >     Multiboot and PVH booting are not supported for PE, hence discards =
them
> >     in the linker script when doing a PE build.
> >
> > But not in the subject:
> >
> >     x86/efi: discard multiboot support for PE binary
> >
> > What about simply changing the subject to:
> >
> >     x86/efi: discard multiboot and PVH support for PE binary
>
> Perhaps.
>

Updated.

> >> Otoh you discard call sites of functions without discarding the functi=
ons
> >> themselves, violating Misra's "no unreachable code" rule. Eclair may n=
ot be
> >> able to spot this, but imo we should still adhere to the rule. Proper
> >> coverage analysis, for example, would likely turn this up.
> >>
> >
> > That makes sense. Given that most code in head.S is now discarded most
> > data sections are now not used and the only thing left will be the
> > trampoline.
> > It'll take a bit of time to search for removed symbols.
> >
> > About the "no unreachable code" I think we are violating that anyway.
>
> Perhaps, but we should get the number of such violations down, not up.
>

It was not meant to be an excuse, more of a question if the problem is know=
n.
The "It'll take a bit of time to search for removed symbols" was a "I will =
do".
I now have the fixup patch for "x86/efi: discard multiboot and PVH
support for PE binary" (the commit we are talking about here). About
sending an updated series, what is the best way to send a fixup patch?
Send the fixup as separate? Merge into the base patch and remove the
"acked-by"? Keep the "acked-by"?

> > We package "built-in.o" files and then use them to craft the final
> > executable. I don't think the linker will be able to discard unused
> > functions for that reason. That does not mean that more things can be
> > discarded.
> At least not until we engage it garbage collection, which as per Jason
> proves problematic when linking xen.efi (due to linker issues as it looks=
).
>

In my experience linker garbage collector on Linux is a bit
problematic, I think LTO is more tested and working. Still not that
automatic.

I tried to remove the BIOS code using sections "trick" like what was
done in this commit without success.

> Jan

Frediano

