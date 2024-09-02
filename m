Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD759681FD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787633.1197050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2UZ-0007Sw-45; Mon, 02 Sep 2024 08:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787633.1197050; Mon, 02 Sep 2024 08:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2UZ-0007QI-18; Mon, 02 Sep 2024 08:32:55 +0000
Received: by outflank-mailman (input) for mailman id 787633;
 Mon, 02 Sep 2024 08:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRBA=QA=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1sl2UY-0007QC-1E
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:32:54 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f157bb0d-6905-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 10:32:52 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20227ba378eso33520305ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:32:52 -0700 (PDT)
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
X-Inumbo-ID: f157bb0d-6905-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725265971; x=1725870771; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFVFwoAQ7HV2SimJVGFfZ+1RiMRuaQbcK9VNzMhiEUE=;
        b=TPaIUlp+zVGFUvcdH5mnE6O+vNxmoA7hSqGpASEd5VpnPpS+uOeSVdAvvVWjM4qafM
         g7YoA3bXPyWNimIHB16PWV+T8tH0PJxELTDrMVHRZASo4sFiKSFPvIyRkbuWBNORvwPX
         Br01tyEsjdENVTz+2WW5VPID6/CC8wMStPsUZlmaVwZi4pzkMTwX24iudMW6OZRsXHfk
         H2Oh051/4r1idyB9Jtg9OHuaaxgRTQcmfcEwsUcZkQMWkRGrra7G4We4K7dSIqgAUb4M
         1OmustP24FXbk640pt9z8PSFGZVK8Gi0P6ebgoUWn3xvIftq7ha0Xioc1e41vTONmnUE
         YgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265971; x=1725870771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFVFwoAQ7HV2SimJVGFfZ+1RiMRuaQbcK9VNzMhiEUE=;
        b=kCZouGDT7GZkdeEhYzmdwU3GJh4ObjN6qR6pKXIl5XCK7jQhw8N6V4eQyonxxJn1cp
         3EXA1HKpH4V7HvCFobqo3K0ypAQpa/aaHH0PKTKUyldELzQkNNm7lAIV1fTXk/4mtgYy
         YrBkoauPlPP0qi7OiORjrbpmOW/oCzCXxsqj3P0NdQJMHyDzhylqNneWDHCP1bQXShvw
         g0bQ6ghKLKRe+yb7xmyas3YBbFyWoDyVscUOu7rcL1EnKxBWxfgesjVo6nJU5Z48D8sx
         hFkh6evMzta31KvgfFclSb5sz9I3p19YClWqmYD0oJaR/LkLxJtxgicpK5JeQpTafsID
         u8Vw==
X-Gm-Message-State: AOJu0Yz+X5syKfl/R362fCTnEo8ZSKTeSBybkOB+D1moD4YWjz1vXKt7
	v8RPz1Kwu/OUlTB8dlD8BuKLSgyxBhqpY6HL1/Uu1k/65Af/iUSnLlHpAIXwBt30l6PyjfZUPqq
	favdxU0zQJyMxzZ8ViOZl/kZwIll5mVc/XsI=
X-Google-Smtp-Source: AGHT+IHOjG8CPM05LYnay885wqFh1eT2GB8M5Bf3hSwcjcY6wKcaGOWUnrICUm7IRQUzpVD/2kyNxlUjmZPb/Quxgas=
X-Received: by 2002:a17:902:e891:b0:205:809c:d490 with SMTP id
 d9443c01a7336-205841940a8mr15077725ad.16.1725265970815; Mon, 02 Sep 2024
 01:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmUn2s-d-OS5MO-jsqPk+ReumV09V5PndN8VqqndSm=wTdQ@mail.gmail.com>
 <cb0177d9-f50c-4332-96b5-bcaec86d195a@suse.com>
In-Reply-To: <cb0177d9-f50c-4332-96b5-bcaec86d195a@suse.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Mon, 2 Sep 2024 10:32:33 +0200
Message-ID: <CALUcmU=2LH9GnCGDgkcDKgXm+S8gbGDv3F7q+hgxCUK9azWXTQ@mail.gmail.com>
Subject: Re: [xen_netfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7
 results in crash
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000556ae506211ec9eb"

--000000000000556ae506211ec9eb
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Sept 2024 at 10:27, Jan Beulich <jbeulich@suse.com> wrote:

> On 01.09.2024 10:54, Arthur Borsboom wrote:
> > After upgrading kernel 6.9.10 to 6.10.7 all Xen PVH VM's became
> unavailable.
> > Downgrading the kernel back to 6.9.10 makes the VM's work again.
>
> I don't think I can help with the crash, but: How did you conclude it's
> xen-netfront? The data you provide ...
>
> > Snippet stack trace + kernel logs (good and bad) attached.
> >
> > Sep 01 08:59:21 web3.aramgroup.com kernel: xen_netfront: Initialising
> Xen
> > virtual ethernet driver
> > Sep 01 08:59:21 web3.aramgroup.com systemd-udevd[248]: vfb-0: Worker
> [250]
> > terminated by signal 9 (KILL).
> > Sep 01 08:59:21 web3.aramgroup.com kernel: BUG: kernel NULL pointer
> > dereference, address: 0000000000000060
> > Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: supervisor read access
> in
> > kernel mode
> > Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: error_code(0x0000) -
> > not-present page
> > Sep 01 08:59:21 web3.aramgroup.com kernel: PGD 0 P4D 0
> > Sep 01 08:59:21 web3.aramgroup.com kernel: Oops: Oops: 0000 [#1] PREEMPT
> > SMP PTI
> > Sep 01 08:59:21 web3.aramgroup.com kernel: CPU: 0 PID: 250 Comm:
> > (udev-worker) Not tainted 6.10.7-arch1-1 #1
> > 2b2df360fbb0436393dc89f6589e9eeea2964ecb
> > Sep 01 08:59:21 web3.aramgroup.com kernel: RIP:
> > 0010:video_is_primary_device+0x9/0x40
> > Sep 01 08:59:21 web3.aramgroup.com kernel: Code: 48 89 d8 5b c3 cc cc
> cc cc
> > 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> f3
> > 0f 1e fa 0f 1f 44 00 00 <48> 81 7f 60 80 e3 54 90 74 07 31 c0 c3 cc cc cc
> > cc 53 48 89 fb 48
> > Sep 01 08:59:21 web3.aramgroup.com kernel: RSP: 0000:ffffbb06808d7a60
> > EFLAGS: 00010246
> > Sep 01 08:59:21 web3.aramgroup.com kernel: RAX: 0000000000000000 RBX:
> > ffff90ca41367800 RCX: 0000000000000000
> > Sep 01 08:59:21 web3.aramgroup.com kernel: RDX: 0000000000000000 RSI:
> > 0000000000000246 RDI: 0000000000000000
> > Sep 01 08:59:21 web3.aramgroup.com kernel: RBP: 0000000000000000 R08:
> > 0000000000000060 R09: 0000000000000000
> > Sep 01 08:59:21 web3.aramgroup.com kernel: R10: ffffbb06808d7a78 R11:
> > 0000000000000006 R12: ffffbb06808d7a90
> > Sep 01 08:59:21 web3.aramgroup.com kernel: R13: ffff90ca41367a88 R14:
> > ffff90ca41367a60 R15: ffff90cb41330788
> > Sep 01 08:59:21 web3.aramgroup.com kernel: FS:  000072bfd74c0880(0000)
> > GS:ffff90ce33a00000(0000) knlGS:0000000000000000
> > Sep 01 08:59:21 web3.aramgroup.com kernel: CS:  0010 DS: 0000 ES: 0000
> CR0:
> > 0000000080050033
> > Sep 01 08:59:21 web3.aramgroup.com kernel: CR2: 0000000000000060 CR3:
> > 0000000001326002 CR4: 00000000003706f0
> > Sep 01 08:59:21 web3.aramgroup.com kernel: DR0: 0000000000000000 DR1:
> > 0000000000000000 DR2: 0000000000000000
> > Sep 01 08:59:21 web3.aramgroup.com kernel: DR3: 0000000000000000 DR6:
> > 00000000fffe0ff0 DR7: 0000000000000400
> > Sep 01 08:59:21 web3.aramgroup.com kernel: Call Trace:
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  <TASK>
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  ? __die_body.cold+0x19/0x27
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> page_fault_oops+0x15a/0x2d0
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> __kernfs_new_node+0x17d/0x200
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  ? exc_page_fault+0x81/0x190
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> asm_exc_page_fault+0x26/0x30
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> > video_is_primary_device+0x9/0x40
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  do_fb_registered+0x100/0x110
> > Sep 01 08:59:21 web3.aramgroup.com kernel:
> fbcon_fb_registered+0x4d/0x70
> > Sep 01 08:59:21 web3.aramgroup.com kernel:
> register_framebuffer+0x198/0x2a0
> > Sep 01 08:59:21 web3.aramgroup.com kernel:  xenfb_probe+0x30d/0x430
> > [xen_fbfront 61323dae510a72b3d2c332a2b0273cf6365e9002]
>
> ... clearly points at xen-fbfront. And surely the people to help with that
> is not the same set as those to help with a networking issue.
>
> Jan
>

My interpretation of the stack trace is wrong.

How can I get this to the right people?
Shall I send another mail with [xen-fbfront] in the subject?

--000000000000556ae506211ec9eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 2 Sept 2024 at 10:27, Jan Beulich=
 &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 01.09.2024 10:54, Arthur Borsboom wrote:<br>
&gt; After upgrading kernel 6.9.10 to 6.10.7 all Xen PVH VM&#39;s became un=
available.<br>
&gt; Downgrading the kernel back to 6.9.10 makes the VM&#39;s work again.<b=
r>
<br>
I don&#39;t think I can help with the crash, but: How did you conclude it&#=
39;s<br>
xen-netfront? The data you provide ...<br>
<br>
&gt; Snippet stack trace + kernel logs (good and bad) attached.<br>
&gt; <br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: xen_netfront: Initialis=
ing Xen<br>
&gt; virtual ethernet driver<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> systemd-udevd[248]: vfb-0: Work=
er [250]<br>
&gt; terminated by signal 9 (KILL).<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: BUG: kernel NULL pointe=
r<br>
&gt; dereference, address: 0000000000000060<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: #PF: supervisor read ac=
cess in<br>
&gt; kernel mode<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: #PF: error_code(0x0000)=
 -<br>
&gt; not-present page<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: PGD 0 P4D 0<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: Oops: Oops: 0000 [#1] P=
REEMPT<br>
&gt; SMP PTI<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: CPU: 0 PID: 250 Comm:<b=
r>
&gt; (udev-worker) Not tainted 6.10.7-arch1-1 #1<br>
&gt; 2b2df360fbb0436393dc89f6589e9eeea2964ecb<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: RIP:<br>
&gt; 0010:video_is_primary_device+0x9/0x40<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: Code: 48 89 d8 5b c3 cc=
 cc cc cc<br>
&gt; 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 9=
0 f3<br>
&gt; 0f 1e fa 0f 1f 44 00 00 &lt;48&gt; 81 7f 60 80 e3 54 90 74 07 31 c0 c3=
 cc cc cc<br>
&gt; cc 53 48 89 fb 48<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: RSP: 0000:ffffbb06808d7=
a60<br>
&gt; EFLAGS: 00010246<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: RAX: 0000000000000000 R=
BX:<br>
&gt; ffff90ca41367800 RCX: 0000000000000000<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: RDX: 0000000000000000 R=
SI:<br>
&gt; 0000000000000246 RDI: 0000000000000000<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: RBP: 0000000000000000 R=
08:<br>
&gt; 0000000000000060 R09: 0000000000000000<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: R10: ffffbb06808d7a78 R=
11:<br>
&gt; 0000000000000006 R12: ffffbb06808d7a90<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: R13: ffff90ca41367a88 R=
14:<br>
&gt; ffff90ca41367a60 R15: ffff90cb41330788<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: FS:=C2=A0 000072bfd74c0=
880(0000)<br>
&gt; GS:ffff90ce33a00000(0000) knlGS:0000000000000000<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: CS:=C2=A0 0010 DS: 0000=
 ES: 0000 CR0:<br>
&gt; 0000000080050033<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: CR2: 0000000000000060 C=
R3:<br>
&gt; 0000000001326002 CR4: 00000000003706f0<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: DR0: 0000000000000000 D=
R1:<br>
&gt; 0000000000000000 DR2: 0000000000000000<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: DR3: 0000000000000000 D=
R6:<br>
&gt; 00000000fffe0ff0 DR7: 0000000000000400<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel: Call Trace:<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 &lt;TASK&gt;<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? __die_body.cold=
+0x19/0x27<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? page_fault_oops=
+0x15a/0x2d0<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? __kernfs_new_no=
de+0x17d/0x200<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? exc_page_fault+=
0x81/0x190<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ? asm_exc_page_fa=
ult+0x26/0x30<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 ?<br>
&gt; video_is_primary_device+0x9/0x40<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 do_fb_registered+=
0x100/0x110<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 fbcon_fb_register=
ed+0x4d/0x70<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 register_framebuf=
fer+0x198/0x2a0<br>
&gt; Sep 01 08:59:21 <a href=3D"http://web3.aramgroup.com" rel=3D"noreferre=
r" target=3D"_blank">web3.aramgroup.com</a> kernel:=C2=A0 xenfb_probe+0x30d=
/0x430<br>
&gt; [xen_fbfront 61323dae510a72b3d2c332a2b0273cf6365e9002]<br>
<br>
... clearly points at xen-fbfront. And surely the people to help with that<=
br>
is not the same set as those to help with a networking issue.<br>
<br>
Jan<br></blockquote><div><br></div><div>My interpretation of the stack trac=
e is wrong.</div><div><br></div><div>How can I get this to the right people=
?</div><div>Shall I send another mail with [xen-fbfront] in the subject?=C2=
=A0</div></div></div>

--000000000000556ae506211ec9eb--

