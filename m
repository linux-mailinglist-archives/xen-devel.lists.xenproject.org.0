Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L0qwOtNgMWoliQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:42:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A566909C2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:42:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IO+rJ8jF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339336.1600522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUzO-0005Zf-PU; Tue, 16 Jun 2026 14:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339336.1600522; Tue, 16 Jun 2026 14:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUzO-0005YH-MY; Tue, 16 Jun 2026 14:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1339336;
 Tue, 16 Jun 2026 14:42:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZUzN-0005Y5-64
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:42:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUzM-00FfT2-IR
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:42:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3160aa-5cb7-0a2a0a5109dd-0a2a4509bbea-44
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:42:04 +0200
Received: from [74.125.224.54] (helo=mail-yx1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3160bb-2497-0a2a45090019-4a7de036b55c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:42:04 +0200
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-662bb8b1f93so717500d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 07:42:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781620923; cv=none;
        d=google.com; s=arc-20240605;
        b=QQqFIc9LsNteWLNUNLVl5C0sH1M4w2rgoRBl3se3eE7s2PU4x5MZbiHF4zSsyJ8hga
         ORpCQ+H9VXfBN8Mz2UOZi6hJCk0mMgimdtcd4KIqPwJxU6uo1Qjveg/qcKaxWUwQ1Bd9
         p0NWChnF5/xKmlR9F0ujhtsos5xdqKSn9khZxg0Mn91Q5jok639iRAxcr5HaH2x3+KUB
         tEGu/uqn47NvkfdXr2MDrsDGOaSZ7C40LGAbQxsew1cEhwqXDfeud/q1aeztIZoLFY7s
         dd9AH37p3evYNVnkGWiXU9jzS/uZqvGUg2LzEwNX76/zo/n72dEbxwLr7Jdj/QufILsg
         qzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kI5MX0rOS8Inx/kYqgRKPRGZwjeNwSKd66xuuIcZP9w=;
        fh=NYSOBtamoLuT7+PMml2Q2jk87NGsNwucrssafcE0Kbk=;
        b=kQ0oyRZkAMs6XGAYoM5Xpky8beNT3s8DQnLQ0qFFOvpiw5ztsUUEDF6ozlgdg50Wv7
         8vN11kftY7i+Tnfi0hiv/bZK2DVHwdFLrP1XmV/DULONvO4yEajcTcVDCp01zs5PF/2Q
         fjQSPAhIA6VT4bQ7N08D3AXxvIE69LkXQvOfnSvcIQ97HfW/N/4tVh9pCRKGwHeED6c0
         TnegH3xCn91MBsgt28oA39RW4Ukgpy/RUPl353P2jNzD7xh79ZdUJngKF2acpqpDJ3Ec
         CTwlZm/be9gU7LWb4TV08LnCI5hpb1Zpj8Ku7sMHk9AWlirculzwLnciCktl0Ku6QIDF
         CjUQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620923; x=1782225723; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kI5MX0rOS8Inx/kYqgRKPRGZwjeNwSKd66xuuIcZP9w=;
        b=IO+rJ8jF2d2giK9avBRgiK2pEmOGTWYTMVzUKKYGgYvqdL60xJ/fPSXu+F9ZEfrWkP
         idqjAsPBY982UK33TrwYZi9HhF/GqPc2Fxl2XK11jbH5pFkv72cQMtnIrJxfelk4D4E1
         MikZ7KJrQTojYU3VmBJBMQbGBFzcxbmMfpdv8hq2aXodchY0Y3LJP/UxJ2wkDsY/8Je8
         RKHQqm/YarzSzMms+1OIvgNh1/zc2a+vRB+eIlCM9cp2ACcy46JK8WCW+IkdoXMCJcgU
         ZOdNLtwFqwfAWYRglm29BtC5xXgAQ+xlUwgtes0Yqkz2i9UD6WeraDRYkP0zsAFGcsVH
         ndzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620923; x=1782225723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI5MX0rOS8Inx/kYqgRKPRGZwjeNwSKd66xuuIcZP9w=;
        b=mMtaw0ggrujQNMB+qlP1lyav7RySZi/OdZwINniG2wA9pxnnpsanoo/y2etnV/FzMd
         +XFUXgu2fgbJUmXIn++7Jf21IfivHKdT/S/sIGQ+hKPXlybmIbw90O0QsJgkEX6WGULL
         8z+0mxNoaYWf0NrEuw5sGuj3L64GLoayt038UIxbxND9cq/dIuO3IQaVpLt+sJDHaE19
         /O2tUvfnW6Fy7rgMQcNN2DhQJR82JChYh2bdxHyAv7Y1An6069zG5vuU0W8FLqbnIZLQ
         l/SgchtGuIXVAduMQrJXt5xflih2wIFIOQQoMQoRDcx2N2AqWLLDc2zjUm3aNtlADlRR
         Kkxw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZCh2AGxKkacch5XGkrEzqkh7UDSH2zbuDM1FHwjG3AlcweFmXu7ryxJtDDJkDi+pHePeDwrt6rPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3q35JtpwnoMs3rrFrraevfkefJ3y9akqECuiHeIi8YXYgHoh/
	uHMmlWWEFDLNnv20wUhiGX8D8qKkqPPsUVxiVwQvzGcE/FGULYcomXjUpCbe45jYyqT9uxyLqPy
	VvOg0g2RezEOpPEyLEN2jA/UMN0PlCms=
X-Gm-Gg: Acq92OF8RQe80jy4y77wVOrj+0+exl4VTX8v1mJyhm/SYaUKeNTxuQGPFWsP0pgPp17
	ye0qUQtuz9fbZy9s9htmRNtSYcVkscKgYeS9g+XiBOdfkrptNEjzYDuEMFloDGLLa7thS+lFp/c
	ms7tiMMCRscq2AsMeW7jL0u7G3eyaxl9E9r8BleQwTpKUzvMKQg7WC2GSr4voXFHytDrAL/2H2Y
	tbGR+7qXmzsu8XlizK6FeaZMxlfZdJzO6ghCJ+hkYPRJ9W2y1xMH0igZ6Zxzmjffmbfa5TIplJP
	FoZkKH9uEUP5HoqqR2guGHYnyCBy5O3nHR9VQQ==
X-Received: by 2002:a05:690e:1181:b0:662:be0c:e2ee with SMTP id
 956f58d0204a3-662be0cf02amr1541159d50.58.1781620922637; Tue, 16 Jun 2026
 07:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com> <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
 <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
 <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com> <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
In-Reply-To: <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 15:41:51 +0100
X-Gm-Features: AVVi8Cec45Sh0cpUhUuRtpav_U3rkjFhZ4DgkoI_ePDq0-b1HgBn7El3tFNPj30
Message-ID: <CAHt6W4crzD0zAGufeSput-+EgEGROiG07tjwcEtNikr9HXVNoQ@mail.gmail.com>
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Frediano Ziglio <frediano.ziglio@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1781620924-37D7FA53-A0CE56A9/0/0
X-purgate-type: clean
X-purgate-size: 2223
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 55A566909C2

On Tue, 16 Jun 2026 at 15:28, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> On Tue, 16 Jun 2026 at 15:15, Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 16.06.2026 16:07, Frediano Ziglio wrote:
> > > On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 11.06.2026 16:38, Jan Beulich wrote:
> > >>> On 08.06.2026 19:31, Andrew Cooper wrote:
> > >>>> Some old versions of binutils ld managed to produce efi files which the
> > >>>> matching version of strip couldn't process.  This includes Binutils 2.26
> > >>>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> > >>>> less broken toolchain.
> > >>>
> > >>> And we're certain newer versions of strip don't do any harm to the binaries?
> > >>> Already towards Frediano's posting I said that having looked at how things
> > >>> work there, I'm far from certain.
> > >>
> > >> I should have added: An option may be to link twice: Once with debug info
> > >> included, and once with it stripped. Personally I trust the linker creating
> > >> the various headers, including the section ones, more than strip's (or
> > >> objcopy's). Yet then I can only repeat my observation that linking PE+ from
> > >> ELF inputs looks to be significantly slower than linking ELF -> ELF.
> > >
> > > That was also attempted. See previous versions. And no, it does not work.
> >
> > How exactly does it not work? When stripping debug info while linking (as
> > we now do for the first two passes), the resulting image should be both
> > small enough and correct. What am I missing? The only caveat I'm aware of
> > is the Eclair scan, where we should avoid doing any work for the
> > "auxiliary" linking step (the one not producing the binary that's actually
> > going to be used for running Xen).
> >
> > Jan
>
> One thing I remember was the build-id was not the same and debugging
> tools could not work.
>

Another reason was that the generated binary with debug information
was not working with various tools anyway (gdb complained about it and
also binutils again for converting to ELF to use other tools like I
think live patching).
About this I'm less sure about.

Frediano

