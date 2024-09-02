Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601796863F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 13:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787809.1197270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5GE-0003xr-Qb; Mon, 02 Sep 2024 11:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787809.1197270; Mon, 02 Sep 2024 11:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5GE-0003v3-Ns; Mon, 02 Sep 2024 11:30:18 +0000
Received: by outflank-mailman (input) for mailman id 787809;
 Mon, 02 Sep 2024 11:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRBA=QA=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1sl5GD-0003ux-9I
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 11:30:17 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b92878de-691e-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 13:30:15 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-202508cb8ebso23501225ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 04:30:15 -0700 (PDT)
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
X-Inumbo-ID: b92878de-691e-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725276614; x=1725881414; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UdiiB/9qY9S/0J9XyIioSMpAsAK3LTdgdeSNWzwbb6Y=;
        b=BmxHnyrVIhKvG68zYMX8bfboxFqAa2rq4wzGyNSHNsu6Q5zXDfy0rQ+lAJhi6DE5jy
         akVAJxmrIXFqaIPTUbNCs87jeIK0Wj9s4CUpMETjnQd19Z+y4hYlnxJi1In9QPT31g/v
         J4BubNkiL2ukHCHDMIKwrQExdDVIfSoVZt1xaiGBFfvPWDh6VRtVwrr7IGBw3x626nVc
         zieluk2GLFmtGkLmE5iyLfnXu5k3uc2o+w/xAeRi8q2M7l0HN2ztC0A+iI2o3kmX9iZm
         PYwLAJqD7Z/N04v5xvLjbvzy4R53Sn5L6JrCLblAIq3CZuZOPnbtWezgShLwNmTzUyA1
         PsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276614; x=1725881414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdiiB/9qY9S/0J9XyIioSMpAsAK3LTdgdeSNWzwbb6Y=;
        b=YM6QVctmEbz3P/QSlR2drFQPcD8ICV8wm2xtkvf1wdme63uMtaLH/vckdI3I8h1Qpu
         TDm1ZUVem7DoamRGHAN5wmdyRpvJ7xPGZjDUhQ9Wu/pkWoxKjm9hGlP2/nz9s3rtlh1U
         wtP/NKJuowFvRbBqrn46b0zmvcuFGURWFM+nmatdNbADWrPLn5PEjwXph+ANmjKivvSB
         TILs9AoObvne1leRei+ARKGeq+3ET9jjAd33iY1o6h7tDGKQU0gUlyi97d4FWnR9rEnu
         ix8WOGJc1U3YtdYrVIigZANovKV8y84c1Z50MDoivyKlpaTekmRmaM074QZjZMcmi8rc
         slKQ==
X-Gm-Message-State: AOJu0YxDH+pBVYEAyLgZbJlq0dArtmsnlmRKumVLXUD46pVQ3ezXIYXc
	Vu05nKygTx8gr1irbw1e+huRv4voKEKikTT8Sz6ujMJHIfAxm0BMvPM+TxvRNSRS1lsdQig0bJ3
	EEAVvddhr/KiP9G73HWL7b4JtmeHGsfVs
X-Google-Smtp-Source: AGHT+IHFesAF38/M99zlcyOPS+FKdU5EAa4v5DveuLWvb8FLj61enHfNvN60uq4V/cxPfQsgj65pY7q+CSMSqkBFcoI=
X-Received: by 2002:a17:902:e5d1:b0:205:861c:5c4a with SMTP id
 d9443c01a7336-205861c5e45mr12554175ad.60.1725276614004; Mon, 02 Sep 2024
 04:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmUn2s-d-OS5MO-jsqPk+ReumV09V5PndN8VqqndSm=wTdQ@mail.gmail.com>
 <cb0177d9-f50c-4332-96b5-bcaec86d195a@suse.com> <CALUcmU=2LH9GnCGDgkcDKgXm+S8gbGDv3F7q+hgxCUK9azWXTQ@mail.gmail.com>
 <c1df267e-2d91-4510-85ed-80ade16a1a50@suse.com>
In-Reply-To: <c1df267e-2d91-4510-85ed-80ade16a1a50@suse.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Mon, 2 Sep 2024 13:29:57 +0200
Message-ID: <CALUcmUm0squAR5fvW-16meD79ZyBZWmUG1yZ2+YZ31yaht0oeQ@mail.gmail.com>
Subject: Re: [xen_netfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7
 results in crash
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b79ef1062121438c"

--000000000000b79ef1062121438c
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Sept 2024 at 10:40, Jan Beulich <jbeulich@suse.com> wrote:

> On 02.09.2024 10:32, Arthur Borsboom wrote:
> > On Mon, 2 Sept 2024 at 10:27, Jan Beulich <jbeulich@suse.com> wrote:
> >
> >> On 01.09.2024 10:54, Arthur Borsboom wrote:
> >>> After upgrading kernel 6.9.10 to 6.10.7 all Xen PVH VM's became
> >> unavailable.
> >>> Downgrading the kernel back to 6.9.10 makes the VM's work again.
> >>
> >> I don't think I can help with the crash, but: How did you conclude it's
> >> xen-netfront? The data you provide ...
> >>
> >>> Snippet stack trace + kernel logs (good and bad) attached.
> >>>
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: xen_netfront: Initialising
> >> Xen
> >>> virtual ethernet driver
> >>> Sep 01 08:59:21 web3.aramgroup.com systemd-udevd[248]: vfb-0: Worker
> >> [250]
> >>> terminated by signal 9 (KILL).
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: BUG: kernel NULL pointer
> >>> dereference, address: 0000000000000060
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: supervisor read access
> >> in
> >>> kernel mode
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: error_code(0x0000) -
> >>> not-present page
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: PGD 0 P4D 0
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: Oops: Oops: 0000 [#1]
> PREEMPT
> >>> SMP PTI
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: CPU: 0 PID: 250 Comm:
> >>> (udev-worker) Not tainted 6.10.7-arch1-1 #1
> >>> 2b2df360fbb0436393dc89f6589e9eeea2964ecb
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: RIP:
> >>> 0010:video_is_primary_device+0x9/0x40
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: Code: 48 89 d8 5b c3 cc cc
> >> cc cc
> >>> 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> >> f3
> >>> 0f 1e fa 0f 1f 44 00 00 <48> 81 7f 60 80 e3 54 90 74 07 31 c0 c3 cc cc
> cc
> >>> cc 53 48 89 fb 48
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: RSP: 0000:ffffbb06808d7a60
> >>> EFLAGS: 00010246
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: RAX: 0000000000000000 RBX:
> >>> ffff90ca41367800 RCX: 0000000000000000
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: RDX: 0000000000000000 RSI:
> >>> 0000000000000246 RDI: 0000000000000000
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: RBP: 0000000000000000 R08:
> >>> 0000000000000060 R09: 0000000000000000
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: R10: ffffbb06808d7a78 R11:
> >>> 0000000000000006 R12: ffffbb06808d7a90
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: R13: ffff90ca41367a88 R14:
> >>> ffff90ca41367a60 R15: ffff90cb41330788
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: FS:  000072bfd74c0880(0000)
> >>> GS:ffff90ce33a00000(0000) knlGS:0000000000000000
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: CS:  0010 DS: 0000 ES: 0000
> >> CR0:
> >>> 0000000080050033
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: CR2: 0000000000000060 CR3:
> >>> 0000000001326002 CR4: 00000000003706f0
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: DR0: 0000000000000000 DR1:
> >>> 0000000000000000 DR2: 0000000000000000
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: DR3: 0000000000000000 DR6:
> >>> 00000000fffe0ff0 DR7: 0000000000000400
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel: Call Trace:
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  <TASK>
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> __die_body.cold+0x19/0x27
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> >> page_fault_oops+0x15a/0x2d0
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> >> __kernfs_new_node+0x17d/0x200
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> exc_page_fault+0x81/0x190
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> >> asm_exc_page_fault+0x26/0x30
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> >>> video_is_primary_device+0x9/0x40
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:
> do_fb_registered+0x100/0x110
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:
> >> fbcon_fb_registered+0x4d/0x70
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:
> >> register_framebuffer+0x198/0x2a0
> >>> Sep 01 08:59:21 web3.aramgroup.com kernel:  xenfb_probe+0x30d/0x430
> >>> [xen_fbfront 61323dae510a72b3d2c332a2b0273cf6365e9002]
> >>
> >> ... clearly points at xen-fbfront. And surely the people to help with
> that
> >> is not the same set as those to help with a networking issue.
> >
> > My interpretation of the stack trace is wrong.
> >
> > How can I get this to the right people?
> > Shall I send another mail with [xen-fbfront] in the subject?
>
> This may help. You may also be lucky to catch the attention without
> re-sending.
> I can't really suggest which one's better; it's likely all up to you.
>

I will do a resend. It's better for future search results.

--000000000000b79ef1062121438c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 2 Sept 2024 at 10:40, Jan Beulich=
 &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 02.09.2024 10:32, Arthur Borsboom wrote:<br>
&gt; On Mon, 2 Sept 2024 at 10:27, Jan Beulich &lt;<a href=3D"mailto:jbeuli=
ch@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 01.09.2024 10:54, Arthur Borsboom wrote:<br>
&gt;&gt;&gt; After upgrading kernel 6.9.10 to 6.10.7 all Xen PVH VM&#39;s b=
ecame<br>
&gt;&gt; unavailable.<br>
&gt;&gt;&gt; Downgrading the kernel back to 6.9.10 makes the VM&#39;s work =
again.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think I can help with the crash, but: How did you conc=
lude it&#39;s<br>
&gt;&gt; xen-netfront? The data you provide ...<br>
&gt;&gt;<br>
&gt;&gt;&gt; Snippet stack trace + kernel logs (good and bad) attached.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: xen_netfront: I=
nitialising<br>
&gt;&gt; Xen<br>
&gt;&gt;&gt; virtual ethernet driver<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> systemd-udevd[248]: vfb=
-0: Worker<br>
&gt;&gt; [250]<br>
&gt;&gt;&gt; terminated by signal 9 (KILL).<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: BUG: kernel NUL=
L pointer<br>
&gt;&gt;&gt; dereference, address: 0000000000000060<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: #PF: supervisor=
 read access<br>
&gt;&gt; in<br>
&gt;&gt;&gt; kernel mode<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: #PF: error_code=
(0x0000) -<br>
&gt;&gt;&gt; not-present page<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: PGD 0 P4D 0<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: Oops: Oops: 000=
0 [#1] PREEMPT<br>
&gt;&gt;&gt; SMP PTI<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: CPU: 0 PID: 250=
 Comm:<br>
&gt;&gt;&gt; (udev-worker) Not tainted 6.10.7-arch1-1 #1<br>
&gt;&gt;&gt; 2b2df360fbb0436393dc89f6589e9eeea2964ecb<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: RIP:<br>
&gt;&gt;&gt; 0010:video_is_primary_device+0x9/0x40<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: Code: 48 89 d8 =
5b c3 cc cc<br>
&gt;&gt; cc cc<br>
&gt;&gt;&gt; 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90=
 90 90 90<br>
&gt;&gt; f3<br>
&gt;&gt;&gt; 0f 1e fa 0f 1f 44 00 00 &lt;48&gt; 81 7f 60 80 e3 54 90 74 07 =
31 c0 c3 cc cc cc<br>
&gt;&gt;&gt; cc 53 48 89 fb 48<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: RSP: 0000:ffffb=
b06808d7a60<br>
&gt;&gt;&gt; EFLAGS: 00010246<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: RAX: 0000000000=
000000 RBX:<br>
&gt;&gt;&gt; ffff90ca41367800 RCX: 0000000000000000<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: RDX: 0000000000=
000000 RSI:<br>
&gt;&gt;&gt; 0000000000000246 RDI: 0000000000000000<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: RBP: 0000000000=
000000 R08:<br>
&gt;&gt;&gt; 0000000000000060 R09: 0000000000000000<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: R10: ffffbb0680=
8d7a78 R11:<br>
&gt;&gt;&gt; 0000000000000006 R12: ffffbb06808d7a90<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: R13: ffff90ca41=
367a88 R14:<br>
&gt;&gt;&gt; ffff90ca41367a60 R15: ffff90cb41330788<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: FS:=C2=A0 00007=
2bfd74c0880(0000)<br>
&gt;&gt;&gt; GS:ffff90ce33a00000(0000) knlGS:0000000000000000<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: CS:=C2=A0 0010 =
DS: 0000 ES: 0000<br>
&gt;&gt; CR0:<br>
&gt;&gt;&gt; 0000000080050033<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: CR2: 0000000000=
000060 CR3:<br>
&gt;&gt;&gt; 0000000001326002 CR4: 00000000003706f0<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: DR0: 0000000000=
000000 DR1:<br>
&gt;&gt;&gt; 0000000000000000 DR2: 0000000000000000<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: DR3: 0000000000=
000000 DR6:<br>
&gt;&gt;&gt; 00000000fffe0ff0 DR7: 0000000000000400<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel: Call Trace:<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 &lt;TASK&=
gt;<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? __die_b=
ody.cold+0x19/0x27<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ?<br>
&gt;&gt; page_fault_oops+0x15a/0x2d0<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ?<br>
&gt;&gt; __kernfs_new_node+0x17d/0x200<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? exc_pag=
e_fault+0x81/0x190<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ?<br>
&gt;&gt; asm_exc_page_fault+0x26/0x30<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ?<br>
&gt;&gt;&gt; video_is_primary_device+0x9/0x40<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 do_fb_reg=
istered+0x100/0x110<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:<br>
&gt;&gt; fbcon_fb_registered+0x4d/0x70<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:<br>
&gt;&gt; register_framebuffer+0x198/0x2a0<br>
&gt;&gt;&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"n=
oreferrer" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 xenfb_pro=
be+0x30d/0x430<br>
&gt;&gt;&gt; [xen_fbfront 61323dae510a72b3d2c332a2b0273cf6365e9002]<br>
&gt;&gt;<br>
&gt;&gt; ... clearly points at xen-fbfront. And surely the people to help w=
ith that<br>
&gt;&gt; is not the same set as those to help with a networking issue.<br>
&gt; <br>
&gt; My interpretation of the stack trace is wrong.<br>
&gt; <br>
&gt; How can I get this to the right people?<br>
&gt; Shall I send another mail with [xen-fbfront] in the subject?<br>
<br>
This may help. You may also be lucky to catch the attention without re-send=
ing.<br>
I can&#39;t really suggest which one&#39;s better; it&#39;s likely all up t=
o you.<br></blockquote><div><br></div><div>I will do a resend. It&#39;s bet=
ter for future search results.</div><div>=C2=A0</div></div></div>

--000000000000b79ef1062121438c--

