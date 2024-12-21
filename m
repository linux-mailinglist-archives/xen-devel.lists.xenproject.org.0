Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624679FA249
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2024 20:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862506.1274141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP5Pv-00064B-08; Sat, 21 Dec 2024 19:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862506.1274141; Sat, 21 Dec 2024 19:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP5Pu-0005yf-SG; Sat, 21 Dec 2024 19:45:38 +0000
Received: by outflank-mailman (input) for mailman id 862506;
 Sat, 21 Dec 2024 18:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6MP=TO=gmail.com=sedat.dilek@srs-se1.protection.inumbo.net>)
 id 1tP42s-0004si-5H
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2024 18:17:46 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5154be-bfc7-11ef-99a3-01e77a169b0f;
 Sat, 21 Dec 2024 19:17:43 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54025432becso3109505e87.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 10:17:43 -0800 (PST)
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
X-Inumbo-ID: df5154be-bfc7-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734805063; x=1735409863; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gww25uCrGB4X+QcRFH3IhcXrxha4JrH7h8gAWHNHg+E=;
        b=JCiPyjcyChvHvNfITu7HOyQns1ULZItXrXwUP6hx5A2GsCeVsddFExUoxpiWWxpEJt
         0MtKVX7marE0TOkC3oDBbR7BPM/Y9IByUhCyu6qpfPOwNnrn16f3BX/+viy4Kv1kRZfB
         3sj/VhkpO1U7Tp7EvlUkczHxG+XO4wgGOqX5WNLvG//ldWkGuIEEtz6C4A+iMNCAoCjM
         kvmhnRm5NMtFpruLzmB+zUY2PuYQT0AiM/8NyPWZ1e0/uvm3GE6sAAxHmnWwKhaIi2oY
         Kn3KWag5ZuSMiOPgL3d8Q+5ukHxScsBwryKJkm05eLBTtDjrmPUDvfAclY+m63rfMSH+
         LvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734805063; x=1735409863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gww25uCrGB4X+QcRFH3IhcXrxha4JrH7h8gAWHNHg+E=;
        b=mXQbf4UThKQ0S2ZcUp3zmnWh6CqkP2+8xhr76eeyx/MTLjI/W3QVI5ns2xI1UnC8Bj
         BYo21NXZnt2B7O/PbNS48ryTjDv39e5PKRvvlUYCvMKlupZX31PdvVOu2fEnLo/j9rI4
         rPuF5NsuNIR8HBveadDskxq5KfF/TIZyvZlZoYAbDesTcby9b9PhyeaTPv/JLQgNnU9m
         p4PupgLOvF3WhDTcuszHOqMmxYf8i8+zLN88fi1ScaRF/X4u78MuPt+yidZthEMG8D3G
         tk00lPsXaoucZf+QZWL5IfbEnP3uEBLzwIb7CUmd7xPuAYXmobG1A2WZE5h2oPGaL7Yq
         QXiw==
X-Forwarded-Encrypted: i=1; AJvYcCXrM+wVIIwYchCgUiW/hKZ9RySngqr++7ntPpr0hLmUi/QBfFeRu5Io3WJMNWME0YKTFFRQfWyxuM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZS0JOV5jbw3wPmvA1e1zqYJLhv+sJV07Ng5dJdPHngWfiCtSq
	gNazF8NQX8dcxDOpgwrDNCXnko1x3w8BEBrgfr754JalueZOz+hApcANbTPwjImsPSsBH9Vs/TB
	8i3jZ6MqnNl6wWjs7NS+z6ivdTW8=
X-Gm-Gg: ASbGncvws2tJJ//sFSEd5KaxVfh2zFmZkcHG8cjmEGD4qLmrx59S00UVbtJqrbqEQhD
	5L+e3SzTrahHlCjz+cgXk4q3jHa4FO3TT4F6v0DCupu3EO2XNy4iSKx7M1MxOjbp2rRN7
X-Google-Smtp-Source: AGHT+IFbWOqrEDILJB7D/dZAXmHjad5/5gydpfde4ub7xLCzRPKhGigQWT8r2WIqnERkBGgVj5RjNd5ekYb5iXu0I/M=
X-Received: by 2002:a05:6512:683:b0:542:2f0f:66d9 with SMTP id
 2adb3069b0e04-5422f0f69d8mr919287e87.16.1734805062927; Sat, 21 Dec 2024
 10:17:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
In-Reply-To: <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 21 Dec 2024 19:17:05 +0100
Message-ID: <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 2:39=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 20/12/2024 12:27 am, Sedat Dilek wrote:
> > On Fri, Dec 20, 2024 at 12:26=E2=80=AFAM Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> >> On 19/12/2024 11:10 pm, Sedat Dilek wrote:
> >>> On Thu, Dec 19, 2024 at 6:07=E2=80=AFPM Sedat Dilek <sedat.dilek@gmai=
l.com> wrote:
> >>>> On Thu, Dec 19, 2024 at 5:44=E2=80=AFPM Andrew Cooper <andrew.cooper=
3@citrix.com> wrote:
> >>>>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
> >>>>>>
> >>>>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1=
.x
> >>>>>> from kernel.org.
> >>>>>>
> >>>>>> What does it mean in ISSUE DESCRIPTION...
> >>>>>>
> >>>>>> Furthermore, the hypercall page has no provision for Control-flow
> >>>>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> >>>>>> malfunction in such configurations.
> >>>>>>
> >>>>>> ...when someone uses Clang-kCFI?
> >>>>> The hypercall page has functions of the form:
> >>>>>
> >>>>>     MOV $x, %eax
> >>>>>     VMCALL / VMMCALL / SYSCALL
> >>>>>     RET
> >>>>>
> >>>>> There are no ENDBR instructions, and no prologue/epilogue for hash-=
based
> >>>>> CFI schemes.
> >>>>>
> >>>>> This is because it's code provided by Xen, not code provided by Lin=
ux.
> >>>>>
> >>>>> The absence of ENDBR instructions will yield #CP when CET-IBT is ac=
tive,
> >>>>> and the absence of hash prologue/epilogue lets the function be used=
 in a
> >>>>> type-confused manor that CFI should have caught.
> >>>>>
> >>>>> ~Andrew
> >>>> Thanks for the technical explanation, Andrew.
> >>>>
> >>>> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".
> >>>>
> >>>> I am not an active user of XEN in the Linux-kernel but I am willing =
to
> >>>> test when Linux v6.12.6 is officially released and give feedback.
> >>>>
> >>> https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
> >>> https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_te=
sting
> >>>
> >>> # apt install -t unstable xen-utils-4.17 -y
> >>>
> >>> # xl list
> >>> Name                                        ID   Mem VCPUs      State=
   Time(s)
> >>> Domain-0                                     0  7872     4     r-----=
     398.2
> >>>
> >>> Some basic tests LGTM - see also attached stuff.
> >>>
> >>> If you have any tests to recommend, let me know.
> >> That itself is good enough as a smoke test.  Thankyou for trying it ou=
t.
> >>
> >> If you want something a bit more thorough, try
> >> https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)
> >>
> >> Grab and build it, and `./xtf-runner -aqq --host` will run a variety o=
f
> >> extra codepaths in dom0, without the effort of making/running full gue=
sts.
> >>
> >> ~Andrew
> > Run on Debian 6.12.5 and my selfmade 6.12.5 and 6.12.6.
> > All tests lead to a reboot in case of Debian or in my kernels to a shut=
down.
> >
> > Can you recommend a specific test?
>
> Oh, that's distinctly less good.
>
> Start with just "example".  It's literally a hello world microkernel,
> but the symptoms you're seeing is a dom0 crash, so it will likely
> provoke it.
>
> Do you have serial to the machine?  If so, boot Xen with `console=3Dcom1
> com1=3D115200,8n1` (or com2, as appropriate).
>
> If not and you've only got a regular screen, boot Xen with `vga=3D,keep
> noreboot` (comma is important) which might leave enough information on
> screen to get an idea of what's going on.
>

YES

# xl info | grep xen_commandline
xen_commandline        : placeholder vga=3D,keep noreboot

> Full command line docs at
> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>
> > dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list functional xsa | g=
rep xsa-4
> > test-pv64-xsa-444
> > test-hvm64-xsa-451
> > test-hvm64-xsa-454
> >
> > Is there no xsa-466 test?
>
> No.  XSA-466 is really "well don't do that then if it matters".
>
> More generally, not all XSAs are amenable to testing in this way.
>
> ~Andrew

On Debian 6.12.6 kernel the TESTS stop with test-hvm64-xsa-454 -
machine freezes - hard reboot.

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner -a --host

root@iniza:/var/log/xen# LC_ALL=3DC ls -alth | head -20
total 1.7M
-rw-r--r--  1 root adm  1008K Dec 21 19:10 xenstored-access.log
drwxr-xr-x 16 root root  4.0K Dec 21 18:59 ..
-rw-r--r--  1 root adm     32 Dec 21 18:58 xenstored.log
drwxr-s---  2 root adm    36K Dec 21 18:58 .
-rw-r--r--  1 root adm    229 Dec 21 18:53 xl-test-hvm64-xsa-317.log
-rw-r--r--  1 root adm     67 Dec 21 18:53 xl-test-hvm64-xsa-454.log
-rw-r--r--  1 root adm    145 Dec 21 18:53 qemu-dm-test-hvm64-xsa-454.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm64-xsa-451.log
-rw-r--r--  1 root adm    211 Dec 21 18:53 xl-test-hvm64-xsa-451.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 xl-test-hvm32pse-xsa-317.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-444.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-339.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-333.log
-rw-r--r--  1 root adm    228 Dec 21 18:53 xl-test-pv64-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm64-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 xl-test-hvm32pae-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm32pse-xsa-317.lo=
g
-rw-r--r--  1 root adm    229 Dec 21 18:53 xl-test-hvm32-xsa-317.log
-rw-r--r--  1 root adm    232 Dec 21 18:53 qemu-dm-test-hvm32pae-xsa-317.lo=
g

root@iniza:/var/log/xen# cat qemu-dm-test-hvm64-xsa-454.log
VNC server running on 127.0.0.1:5900
xen-qemu-system-i386: failed to create 'console' device '0': declining to h=
andle
console type 'xenconsoled'

root@iniza:/var/log/xen# cat xl-test-hvm64-xsa-454.log
Waiting for domain test-hvm64-xsa-454 (domid 94) to die [pid 4686]

-Sedat-

