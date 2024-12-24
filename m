Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81159FC031
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 17:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863114.1274580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ7hq-0006cS-L8; Tue, 24 Dec 2024 16:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863114.1274580; Tue, 24 Dec 2024 16:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ7hq-0006Ze-Ho; Tue, 24 Dec 2024 16:24:26 +0000
Received: by outflank-mailman (input) for mailman id 863114;
 Tue, 24 Dec 2024 16:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPPe=TR=gmail.com=sedat.dilek@srs-se1.protection.inumbo.net>)
 id 1tQ7ho-0006ZY-VM
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 16:24:25 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f56175-c213-11ef-99a3-01e77a169b0f;
 Tue, 24 Dec 2024 17:24:23 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so5487968e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Dec 2024 08:24:23 -0800 (PST)
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
X-Inumbo-ID: 88f56175-c213-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735057462; x=1735662262; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4mkXKWmGiV5XXckoZsuAcHVdzO+pEYcGppRBWUinzmo=;
        b=XI8AAgQ5pEsPUdC32SY854gMsknziShgn9lOJAncx+MAgfNBktxNOWvKd4tknVGOfa
         6ZzfZuJ8ocoKh6c9SfC4s8DAbM/rtQMyV/Gj9B8HL7R/GDA1BzpOG7tDuyrAE3yV2Cg9
         ZqU/aNp42I005Tp8v1ngb3K+rmv3AnDzOBjw6pbWsrNlyB9Ke0B2e8NStVIMGV63d0aJ
         JOtzG0PpW8ksZx/6aEarqkFjkgIiG8QqSnNPNXxvsl4mXkeEPIGXGpw4XRBIcMunvK+R
         M7771vZfOyGx0GsYpZqrwWRZgcfoPoKYKA0vBaePxHTVScKi8OO5D6zid7MPa+zxZvRX
         sbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735057462; x=1735662262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mkXKWmGiV5XXckoZsuAcHVdzO+pEYcGppRBWUinzmo=;
        b=NpS9aEcK2sdPKXbEISZsRXUmrPq0uHJsp8sTZp5NPktOaPQNW1r7RbZI6ya+W/ZFCA
         RJqXGSrWNkYKCKQ7IVkJTVcCnDXElHkKtIPMkzwb2F9md/D4vPMtvb+FwEv5HVFuIYTh
         Q71iqJl9lSSzlR3A3iGOMfkFEiw5Ejq+wTpE84lsZUalGvB/xMJdwW9W/y7JpBeHivXk
         OEzp0Zd9Ea0GrdQw6Gr/+V+KU8GAXrN/zsMjLjjaSwS6mwTyQBo7cgPHaizRcGT+xo+a
         2bfrEyiopi2481aAA9vGm6Go2HCJFoElPU68pecrCD5/fK75h6a4cofkRBMgZ5u7d//Q
         H+ow==
X-Forwarded-Encrypted: i=1; AJvYcCX33SOovhD+HMy0+4bdsZUvWGQId46g1d9NwaAn30IQ1H+VdENngAq+V5yReVWqS5HV+MzOEMjst+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw66JPHwgS0JE1oFDj5HJNzfcocVS1kW4plAOdD07vyLSck9DlU
	+PcdT/27snJBg9Iwq++ecsuTUpceSoU4SdIm0V4FpDXLkIKTwkQ2jy+7hWiasxR1+2Xw/nyKO/c
	MuCLGAcneINRvJyhEfXKGKTpOYNM=
X-Gm-Gg: ASbGnctz469/DjZJeV6yQZb/qE1qE+yxBcjmxrxyQhkA5HcrmrPMvYnPQJ8h5LW+Gbx
	f4Eaw2EvdRNlPSbiXnHfBoa+8zikyp44aKpAhoqRcveeFF/wQy0lX6C1Ijo54S0e7297f
X-Google-Smtp-Source: AGHT+IFeDcoH6FqGav3dMmPGh5sT6bY3h7jtuxBtb3J/jlYw3D77GN96q3f6d8YvDmECDxLlD6KL4j+bq6oD5HrXqmc=
X-Received: by 2002:a05:6512:1114:b0:53e:335e:774d with SMTP id
 2adb3069b0e04-5422957afc9mr4939338e87.56.1735057462100; Tue, 24 Dec 2024
 08:24:22 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com> <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
 <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com> <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
In-Reply-To: <CA+icZUW454ND85nbjqAoMg42=i+aGht8Z=iG2wKj=Un7Ot0y6Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 24 Dec 2024 17:23:45 +0100
Message-ID: <CA+icZUUnbY7eRZtN-pMNn0jhYKLLEWEDNmJjhGQ3auPuS9_+MQ@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>, 1091360@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2024 at 11:37=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> On Sat, Dec 21, 2024 at 10:31=E2=80=AFPM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
> >
> > On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> > > With...
> > >
> > > dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> > > dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../
> >
> > That's completely bizzare.   There's nothing interestingly different
> > with those two tests vs the others.
> >
> > I take it the crash is repeatable when using either of these?
> >
> > ~Andrew
>
> This time I stopped SDDM and thus KDE-6/Wayland session.
>
> Tested with Debian's officially 6.12.6-amd64 kernel in VT-3.
>
> test-hvm32pae-xsa-consoleio-write SUCCESS <--- 1st time I tried, never
> said this is not OK
>
> test-hvm64-xsa-454 leads to FROZEN system and DATA LOSS (here: ext4).
> Reproducibly as told many times.- in Debian and selfmade kernels version =
6.12.6.
>
> Stolen from the picture I took with my smartphone:
>
> sudo ./xft-runner test-hvm64-xsa-454
>
> Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
> Executing 'xl console test-hvm64-xsa-454'
> Executing 'xl unpause test-hvm64-xsa-454'
>
> ^^ System does NOT react!
>
> I can send you the picture on request.
>
> -Sedat-

[ CC 1091360@bugs.debian.org ]

I upgraded to Xen version 4.19.1 in Debian/unstable AMD64.

# xl info | egrep 'release|version|commandline|caps'
release                : 6.12.6-amd64
version                : #1 SMP PREEMPT_DYNAMIC Debian 6.12.6-1 (2024-12-21=
)
hw_caps                :
bfebfbff:17bae3bf:28100800:00000001:00000001:00000000:00000000:00000100
virt_caps              : pv hvm hap shadow gnttab-v1 gnttab-v2
xen_version            : 4.19.1
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64
xen_commandline        : placeholder

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --host test-hvm64-xsa-454
Executing 'xl create -p tests/xsa-454/test-hvm64-xsa-454.cfg'
Executing 'xl console test-hvm64-xsa-454'
Executing 'xl unpause test-hvm64-xsa-454'
--- Xen Test Framework ---
Environment: HVM 64bit (Long mode 4 levels)
XSA-454 PoC
Success: Not vulnerable to XSA-454
Test result: SUCCESS

Combined test results:
test-hvm64-xsa-454                       SUCCESS

root@iniza:~# LC_ALL=3DC ll /var/log/xen/*xsa-454*.log
-rw-r--r-- 1 root adm 232 Dec 24 17:11
/var/log/xen/qemu-dm-test-hvm64-xsa-454.log
-rw-r--r-- 1 root adm 232 Dec 24 17:11 /var/log/xen/xl-test-hvm64-xsa-454.l=
og

root@iniza:~# cat /var/log/xen/qemu-dm-test-hvm64-xsa-454.log
VNC server running on 127.0.0.1:5900
xen-qemu-system-i386: failed to create 'console' device '0': declining
to handle console type 'xenconsoled'
xen-qemu-system-i386: terminating on signal 1 from pid 6302
(/usr/lib/xen-4.19/bin/xl)

root@iniza:~# cat /var/log/xen/xl-test-hvm64-xsa-454.log
Waiting for domain test-hvm64-xsa-454 (domid 144) to die [pid 6302]
Domain 144 has shut down, reason code 0 0x0
Action for shutdown reason code 0 is destroy
Domain 144 needs to be cleaned up: destroying the domain
Done. Exiting now

Due to Debian-Bug #1091360 ("qemu-system-xen: Build against libxen-dev
version 4.19.1-1") I am not able to do the full XFT tests.

-Sedat-

Link: https://bugs.debian.org/1091360

