Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KwaHMhxgMWoFiQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:39:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDC69094A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cOiCe9KM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339325.1600512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUwY-0003c3-92; Tue, 16 Jun 2026 14:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339325.1600512; Tue, 16 Jun 2026 14:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUwY-0003aA-5s; Tue, 16 Jun 2026 14:39:10 +0000
Received: by outflank-mailman (input) for mailman id 1339325;
 Tue, 16 Jun 2026 14:39:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZUwW-0003Yf-9q
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:39:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUwU-006Ctl-Vk
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:39:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a315ff1-e002-0a2a0a5209dd-0a2a4503d592-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:39:06 +0200
Received: from [74.125.224.49] (helo=mail-yx1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a316009-672d-0a2a45030019-4a7de031e849-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:39:06 +0200
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-66077f6c438so4647857d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 07:39:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781620745; cv=none;
        d=google.com; s=arc-20240605;
        b=VHOSRfOU0mRwIUVSobkzkBJAWFkBxF5zNvo+6qn0QvZb8YY877LLl85FMgvxfe6fbi
         tetxmFwsjPLtMnJcXxaNlimu5Qd6nP1aFTcYSYxoSB9L5Sj57vEYEP1PcaSusBJ7iPbC
         kGsbYi5eERVHP/Q+zmAwacposH/xYfDWQJUPkQ96O6N4v3yCkMqIdRG4qM6wxW+nChFZ
         C3zaESVwkMN9jv6Xg1sHdxn36sFgiyUaBb6vaRaqEGyiIV4OiymmkVy5ZRn2O5gLHLvA
         Myjz5AHhOP2sDPN98neErwz7cNEhOTzuR/sVcjvSx6KGpbXrfnAMlZehd3laI12R/25A
         3+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=snKhAOw3RP7MRbxbkR8ObtB/TOYZ+pw+WAKjH/t0hzc=;
        fh=A72rsFT1N8cd1FI/a4TfKbyiQw9eFOMoec7Qj58Q2a0=;
        b=KcnUuG33vBvtXSrS7WpuDxGCQzFlxkDG8oEaeLPkTG/K8NpGcDcMxS2VJgBbTImTxN
         tG/CMDKbFsMtsW9pEVFhY+0sd3mWEzFGif7LOuvzWgz7JzdimGSm82BvCX5NBAJB6KVg
         BD6P4O6OAGU+90qg5cJEpxOu7D7NcaA/SM5vqoxm9akV8vmWM1y4Xm8V6DKiylC3edll
         Bk1Qmp0ZJQwkF/Q6FL/cjlajeh49ZmPq4AhbPNAR8fWBAmtdQVPZGyItBqehKQNuDx8P
         0vWV7KmWmy7cuZfU+cNzorvemNKz2Hg/syGgi6udfSR+tQRveyfTTaqW7yqDtF5z+EeG
         yI8Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620745; x=1782225545; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=snKhAOw3RP7MRbxbkR8ObtB/TOYZ+pw+WAKjH/t0hzc=;
        b=cOiCe9KMEGfvhi1OgqhyKZ35p2gt+iisTNQCqFQWThQjDNADnMVK8HHTDnovf3SyLe
         KjNMjycQIKteaANSs5QjUQwW8ltm7C1r1m5+2drRxf0uVzblTK+i8Nw7Fr9oxWNuV/Qr
         qYV9h3BK9qRRegbl1ZekYDX7tVnp1S4XjznhDzy3VoF9WN+BUcgP0u4ZkHVU4NyRjn1D
         b7fV1iBWHw9xVa5cXLFiSfkanJZEKHVJEr8BkYjZ7Icylm4uec2CrwyN/0NCmj3RBbrm
         tgl/CXCBbdX0fyPSj2NWMpa2NoeYx3amGVJdmE045wfs/Y1tOPdLsbj+t8NZ6FkR6cn7
         ycRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620745; x=1782225545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snKhAOw3RP7MRbxbkR8ObtB/TOYZ+pw+WAKjH/t0hzc=;
        b=av7ybo+GEoVjBXOR4leduOWpKFokP8h35DFt8gT0GwR1BikjVAjPrGRk5aYXf9haW6
         w/TD3l2RvbDeYgkf98zskBuXBGVdjrDZ3CnR4HQfxstdjI6C1lzvASIUEyFT3D8VEvSH
         507Kexxf26qSh0DmyCIAEnFcHvj2tq093bG5pTGlha+X/tEQ6FI5OKDchuf7T2NcTDou
         q/rG0j24gS+qvZ5iL0Ky4JJhnSpGI3CbS+hm7GByhR5wIV+e4yrQqwDq04ClVCRBDVup
         vc8Uq66kbmAJZKOem2FWfyIjXnrA1KQ8AMgBqVC+liUB/UZlKQvabYz3wTI4F0JSmxNU
         +Ctg==
X-Forwarded-Encrypted: i=1; AFNElJ/gb+qsdVVlCs3acOr2j111WaicJN5ispmLmsc1RpLjbugJLn42NdSY6W26c61tOXjhXvzJpXy6j7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVFnHZuSJZd/oiXdjO8YUceeyjyhIpsrLz3d2MjuO1QsB5rszH
	36bxvhB7kT6tfJD1b1hfpVpiRxC2uCHJjaz5+wsTTu1JE0xwnJUPcXhlWpU6PIZdgO29IHaXmIY
	P2Wi3QlHM4FlBGNoMQcybHHX7fHxzyh0=
X-Gm-Gg: AfdE7cn6V9gyaz9TZxf+hDS2Bwg7kWZBqI5WMifyzqbH0NMeUMSVfvrgPKknNdmAQbc
	kM/ZwgeJMD7/bhRVxgxqnqbuJRyTO4R2rflSTedH6NgENIa6Rn15fkKApSRxeUGrjXLSxtWRDyh
	1najD9SBQ68rJh7vLfqED3h7iARLlwII5A1c33n4KviTueZYIoMkQT1UksZ/SfUKcY2o8g+LN0K
	cZ8R4rT3XS0R7yHBXIxlrRJ1C6eMKt2rtY1pWkXaCn9PSIIsaRgbRJXcdXCJHdXY73wGGBKWYOi
	ccOJuqbf0vJptNhiwSpyASLO4LPZVlYnq5xs7KVtfNMJQZoI
X-Received: by 2002:a05:690e:b4b:b0:662:b984:a5bb with SMTP id
 956f58d0204a3-662b984b7f2mr2227634d50.19.1781620745208; Tue, 16 Jun 2026
 07:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-2-frediano.ziglio@citrix.com> <3506eb69-f057-4c0b-8321-03cfcc6dda2a@suse.com>
In-Reply-To: <3506eb69-f057-4c0b-8321-03cfcc6dda2a@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 15:38:53 +0100
X-Gm-Features: AVVi8CeJf3h93Pl8DlF5pIS7v9oBvmBU9t7cIeeP3Xi-jWPM5Y7PAKcPDIrrG7U
Message-ID: <CAHt6W4et8om1AO+v_VVpikhd0Nsuc_V_OFSm0r1rgzFJ_2wH6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1781620746-3AF62938-AE13FF33/0/0
X-purgate-type: clean
X-purgate-size: 1429
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail.gmail.com:mid,suse.com:email,cloud.com:email];
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
X-Rspamd-Queue-Id: 34DDC69094A

On Tue, 16 Jun 2026 at 13:27, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.06.2026 12:13, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > Required by UEFI CA memory mitigation.
> >
> > It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> > in the pagetables.
> >
> > NX_COMPAT is a requirement from shim-review,
> > https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
> >
> > Sections with different permissions must be in separate pages.
> > In the case of debug sections they are contiguous and have the same
> > permissions so it's not an issue if they are not aligned to the page.
>
> What if .debug_* starts in the middle of a page? Aren't you further
> relying on .debug_* to be r/o (i.e. neither X nor W)? (Right now
> .reloc is what comes immediately ahead of .debug_*, and that's r/o
> as well, so not an issue in practice for now. Yet as indicated, the
> description here wants to be usable as a reference when this later
> needs extending / revisiting.)
>
> Jan

Can you suggest a better wording?
Practically I think before the .debug section you could have the
.reloc or the SBAT, either are permission-compatible. If in the future
we break it for some reason we'll fix it again.

Frediano

