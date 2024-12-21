Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B909FA246
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2024 20:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862496.1274135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP5Pu-0005yt-Nv; Sat, 21 Dec 2024 19:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862496.1274135; Sat, 21 Dec 2024 19:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP5Pu-0005yA-JU; Sat, 21 Dec 2024 19:45:38 +0000
Received: by outflank-mailman (input) for mailman id 862496;
 Sat, 21 Dec 2024 17:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6MP=TO=gmail.com=sedat.dilek@srs-se1.protection.inumbo.net>)
 id 1tP2wB-0005v4-Iq
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2024 17:06:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4c4ccf0-bfbd-11ef-99a3-01e77a169b0f;
 Sat, 21 Dec 2024 18:06:45 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so2510770e87.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 09:06:44 -0800 (PST)
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
X-Inumbo-ID: f4c4ccf0-bfbd-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734800804; x=1735405604; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=agKbG4Ad2aFh5DQ9Ty8+oto7J07OzvutBur24QnJNbs=;
        b=UclJrBDpxLXUs9rBR8/MQN8dVn5FR2VzRjh98xes0WkBosmjSoe0Ci2ruT8tHeMCgc
         WJJevP9YUBx0wEcjXtPhFijHQm9yZlexGeKaxanm+LEnnsa0uOnIbIec+fQU+pvRUZCA
         XYnGq5S/T51fELtWTluFB06CzmtIWTnToc615yTrkO810IOlqvsOXE6CaLPBgryD4YMY
         uhJUJC5kCStUM+zA6s4PRbSV3kMzVAZSUXVcoUCd/X8FBinzRfIWP5E+fRG960taiZ8o
         0KA6bBq0WBWt69BtL99RR94sjtG3CzfnwGR3eg//EzRxwzF/FEHqM4AeKTOLBiYS3N/h
         biZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734800804; x=1735405604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=agKbG4Ad2aFh5DQ9Ty8+oto7J07OzvutBur24QnJNbs=;
        b=OSUZH9CFnaNyKN1Id6JYTvyAu30C4cwLgRjTc/V5iKdgeX05R/bc4NTd9w2KnlaV8A
         V3Sy6qXvgGWfB/l75LQpB2YIRqpRLkHdYtoDvP2nrxd45Vwv+KR+CA5T6CkZjMjJRrmL
         zitLMLTJmrbHNhxf7nPDFqFrgmpMcqprS2chzASMDdeH8RjWqYhgnT1FhFNO5aScVjLH
         PzokdgGsXK0PeT7tngG10n9UVP8t6lo0mWAnCrl1S2JlswPxSrqrrjhZVpEFf9i+UVNj
         MfKc23fQ4xlOLgHDSoke4mVFzi5zBgbWmHL9d4y87hzSoeLVePeHR5qczdepSTVDXaNl
         IOSA==
X-Forwarded-Encrypted: i=1; AJvYcCVkqOR94rENKE4kBVBgGXBC48k03Be6pLR/8yxQQQe76kDSBNUsny/8QBjrRFycdoAcIuEiqccPICE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8gF0fq+thwNk5QyAtF4S8rOK+IuTD4hn6ImRPKrsnJNoTFFTu
	Ujw5Vgif7+7CW8KJCg4EPCE9ykL5c9mfoPthJ+ctlgUYfVPWPHYhHT2pbVu5ptaOcWbrT7gLb+A
	TV6Y+fz9Ni+8+3g6j+0D19c67sas=
X-Gm-Gg: ASbGncujW12ynu1RNA8ALruuSCVui5MDd7nkCHuG5i0XWAGiaDQ/wAVSr5iIg9VdJtP
	yqDTlG89a2ISWBTxyXHHuplddtxaqDarZBHk2+EJM12hWJRWGXW+yx4+jj8vYoqDlv+Qu
X-Google-Smtp-Source: AGHT+IFlbPcGmfsM9lCdXkpNmrdsNPjnuj/3oeIGySw+8+ouW9qKDdkS6zFmZVV0L0qLBb8weZW1jPVbzwqmFTzG3VQ=
X-Received: by 2002:a05:6512:2214:b0:53e:38df:672a with SMTP id
 2adb3069b0e04-5422956289amr2032769e87.36.1734800803975; Sat, 21 Dec 2024
 09:06:43 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
In-Reply-To: <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 21 Dec 2024 18:06:06 +0100
Message-ID: <CA+icZUVhzsc+_PJr0RSwaVQTbz5TKa8wmyzgBNQEcody4YGesg@mail.gmail.com>
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

RUN example tests on Debian's 6.12.6 kernel.

$ cat /proc/version
Linux version 6.12.6-amd64 (debian-kernel@lists.debian.org)
(x86_64-linux-gnu-gcc-14 (Debian 14.2.0-11) 14.2.0, GNU ld (GNU
Binutils for Debian) 2.43.50.20241215) #1 SMP PREEMPT_DYNAMIC Debian
6.12.6-1 (2024-12-21)

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --list example
test-hvm32-example
test-hvm32pae-example
test-hvm32pse-example
test-hvm64-example
test-pv32pae-example
test-pv64-example
dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner test-hvm32-example
Executing 'xl create -p tests/example/test-hvm32-example.cfg'
Executing 'xl console test-hvm32-example'
Executing 'xl unpause test-hvm32-example'
--- Xen Test Framework ---
Environment: HVM 32bit (No paging)
Hello World
Test result: SUCCESS

Combined test results:
test-hvm32-example                       SUCCESS
dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner test-hvm32pae-example
Executing 'xl create -p tests/example/test-hvm32pae-example.cfg'
Executing 'xl console test-hvm32pae-example'
Executing 'xl unpause test-hvm32pae-example'
--- Xen Test Framework ---
Environment: HVM 32bit (PAE 3 levels)
Hello World
Test result: SUCCESS

Combined test results:
test-hvm32pae-example                    SUCCESS
dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner test-hvm32pse-example
Executing 'xl create -p tests/example/test-hvm32pse-example.cfg'
Executing 'xl console test-hvm32pse-example'
Executing 'xl unpause test-hvm32pse-example'
--- Xen Test Framework ---
Environment: HVM 32bit (PSE 2 levels)
Hello World
Test result: SUCCESS

Combined test results:
test-hvm32pse-example                    SUCCESS
dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner test-hvm64-example
Executing 'xl create -p tests/example/test-hvm64-example.cfg'
Executing 'xl console test-hvm64-example'
Executing 'xl unpause test-hvm64-example'
--- Xen Test Framework ---
Environment: HVM 64bit (Long mode 4 levels)
Hello World
Test result: SUCCESS

Combined test results:
test-hvm64-example                       SUCCESS
dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner test-pv32pae-example
Combined test results:
test-pv32pae-example                     SKIP
dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner test-pv64-example
Executing 'xl create -p tests/example/test-pv64-example.cfg'
Executing 'xl console test-pv64-example'
Executing 'xl unpause test-pv64-example'
--- Xen Test Framework ---
Environment: PV 64bit (Long mode 4 levels)
Hello World
Test result: SUCCESS

Combined test results:
test-pv64-example                        SUCCESS

Thanks.

Best regards,
-Sedat-

