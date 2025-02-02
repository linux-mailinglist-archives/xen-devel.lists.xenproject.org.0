Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66BA24F0E
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 18:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880424.1290497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tedJk-00038d-QK; Sun, 02 Feb 2025 16:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880424.1290497; Sun, 02 Feb 2025 16:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tedJk-00036U-Mj; Sun, 02 Feb 2025 16:59:32 +0000
Received: by outflank-mailman (input) for mailman id 880424;
 Sun, 02 Feb 2025 16:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TtP=UZ=gmail.com=thouveng@srs-se1.protection.inumbo.net>)
 id 1tedJj-00036O-Gw
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 16:59:31 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f5ffa17-e187-11ef-99a4-01e77a169b0f;
 Sun, 02 Feb 2025 17:59:27 +0100 (CET)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3eb98b3b63dso996571b6e.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 08:59:27 -0800 (PST)
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
X-Inumbo-ID: 0f5ffa17-e187-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738515566; x=1739120366; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3VBVm0HSA3zl9PBwo0z8AtCB+M3UbgWwbTUesflRfj4=;
        b=kE/qCzkwjTl+TpMqfuZePiVokRPU76I9jQU2i1bwZs7bgZ1URM0/Rt2g+B7rXEGE5y
         sr+yKAagNa8OJNn7f/R/Qg3fpqyUoifR6awIecpZurNxh3ajivRYfqaF4NqkUqW1DSgC
         Ygf+arEJSQmQcdKoKfTiwcJEWLBmQZwT2UiGWL1j4Obt7Iht3ixj1r4+JCrKpeUorL1e
         vhDyERg3pw4krgQCqHhK896WbHDGwcptwCzYmRdvTX8Hq5jK7zyN4fu4vjL5+bfS8WuS
         IsPd7Y+jXq0ywJtKtM9kJgB9Agi7Azy/MlZTObHCodhMTZoOgvQ7w5WPTcRYcFbZEJoD
         /8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738515566; x=1739120366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VBVm0HSA3zl9PBwo0z8AtCB+M3UbgWwbTUesflRfj4=;
        b=i3ANrXQ39FRFFOKRunQ+tBBhpH7ODi7FTMDQP3v0yDSC6yjIp6NcvVoom8SX5p/eTD
         fwg+LrBItgZ7gjTddF34tE6bV57Nw07ypB+eYUXa7LXW08fC5NaZx5k6+CQNYx+3Z7YD
         Y1V3DOtVHipWIf+1CpzTi0Uiv6BCmKqYygEq8+7eTN1k6mWDC9HTZwL2g6BiWMjIyCaF
         Kd5pA5iBvlGC4RBN2E7Cq+8xxdGg1/yyk3IwfpQP8yQgWqb6/5Nt+4+7oHimcEPCleiS
         KNeZzTF2zD0gyclYDOPdscKzXkcLiu9KM1GrreANur7bdFAkWHRAsngDU0aX8T/94f8D
         gwRw==
X-Gm-Message-State: AOJu0YxzCB+PexRuB0zzPWM3qv7N3gKdVs+XDi5K9L2wifYhjZWpsm5D
	+079FZveN63OB/NOClQH7eA/qvoGOkoqQToWxa+kDGhZ7MVLN4W78x3CvpslbTr578yDvUTWRGO
	F0wrJ1Ual5IPAljojSCu9iUJI1y7k2I9u
X-Gm-Gg: ASbGncu0E//ACsWiY1aGGI9KjGyEsDQdNUKORtfMYag+MsCU5zp1PvTR5mhjDuwOEYI
	60+uSRtHI30EC/BS3JOSbUT/CgVQ1UJFDtmB7rzhiyx1zc4LIbJ8RvaGhmlZfMkdlwURVrbsqPA
	==
X-Google-Smtp-Source: AGHT+IHaU30w8XfgjAXdblpTNHDjetqdRBqnjmsQPBwDkt+1Xl13lSDc6XCsf8DUwljWU+RNQO8J6qJKKpo52ILDM8k=
X-Received: by 2002:a05:6870:9711:b0:296:e481:8b4d with SMTP id
 586e51a60fabf-2b32f26ffa2mr11804048fac.28.1738515565874; Sun, 02 Feb 2025
 08:59:25 -0800 (PST)
MIME-Version: 1.0
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
 <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com> <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com>
In-Reply-To: <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com>
From: Guillaume <thouveng@gmail.com>
Date: Sun, 2 Feb 2025 17:58:49 +0100
X-Gm-Features: AWEUYZku9FfLR2-_8aH0K83E0vztsJVo6vfYu4WeVgJejCh3s5ajSsC-YsXyLT8
Message-ID: <CACt9=Qgc=wjyRujFT=T2r1pvpyqWCOwzXw18BLO0uca7KuPKJA@mail.gmail.com>
Subject: Re: Xen panic due to xstate mismatch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="000000000000bdd73a062d2bb21a"

--000000000000bdd73a062d2bb21a
Content-Type: multipart/alternative; boundary="000000000000bdd739062d2bb218"

--000000000000bdd739062d2bb218
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I attached the output of the `xl dmesg`. This is the 4.19.1 kernel I
rebuild but I have the same issue with master (just for info).

And also as you said earlier it works with the default installation because
I see that the first line is:
`(XEN) [0000001476779e16] Xen version 4.19.1 (Debian 4.19.1-1+b2) (
pkg-xen-devel@lists.alioth.debian.org) (x86_64-linux-gnu-gcc (Debian
14.2.0-14) 14.2.0) debug=3Dn Mon Jan 27 15:31:22 UTC 2025`
Indeed it is compiled with debug=3Dn while mine has debug set to yes. So th=
at
explains why the default one is booting. But what is strange is that to
build the kernel I copy the default `/boot/xen-4.19-amd64.config` as
`.config` where I built the kernel. So I probably miss something here. Oh
wait I'm stupid I copy it into the top dir and not the xen/ dir. So in fact
it generates a default one with debug enabled. Well actually this error is
interesting because it allows me to dive into the code :)


On Sun, Feb 2, 2025 at 5:11=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> Can you also get `xl dmesg` too, and attach it?
>
> I think this is a VirtualBox bug, but I'm confused as to why Xen has
> decided to turn off AVX.
>
> ~Andrew
>
> On 02/02/2025 4:01 pm, Guillaume wrote:
> > Yes sure I can collect the output. As you said the change is good
> > enough to start the dom0 without errors (at least no apparent errors :)=
.
> > ```
> > Xen reports there are maximum 120 leaves and 2 MSRs
> > Raw policy: 32 leaves, 2 MSRs
> >  CPUID:
> >   leaf     subleaf  -> eax      ebx      ecx      edx
> >   00000000:ffffffff -> 00000016:756e6547:6c65746e:49656e69
> >   00000001:ffffffff -> 000806c1:00020800:f6fa3203:178bfbff
> >   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
> >   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
> >   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
> >   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
> >   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
> >   00000006:ffffffff -> 00000004:00000000:00000000:00000000
> >   00000007:00000000 -> 00000000:208c2569:00000000:30000400
> >   0000000b:00000000 -> 00000000:00000001:00000100:00000000
> >   0000000b:00000001 -> 00000001:00000002:00000201:00000000
> >   0000000d:00000000 -> 00000007:00000000:00000340:00000000
> >   0000000d:00000002 -> 00000100:00000240:00000000:00000000
> >   80000000:ffffffff -> 80000008:00000000:00000000:00000000
> >   80000001:ffffffff -> 00000000:00000000:00000121:28100800
> >   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
> >   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
> >   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
> >   80000006:ffffffff -> 00000000:00000000:01007040:00000000
> >   80000007:ffffffff -> 00000000:00000000:00000000:00000100
> >   80000008:ffffffff -> 00003027:00000000:00000000:00000000
> >  MSRs:
> >   index    -> value
> >   000000ce -> 0000000000000000
> >   0000010a -> 0000000000000000
> > Host policy: 30 leaves, 2 MSRs
> >  CPUID:
> >   leaf     subleaf  -> eax      ebx      ecx      edx
> >   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
> >   00000001:ffffffff -> 000806c1:00020800:c6fa2203:178bfbff
> >   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
> >   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
> >   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
> >   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
> >   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
> >   00000007:00000000 -> 00000000:208c2549:00000000:30000400
> >   0000000d:00000000 -> 00000003:00000000:00000240:00000000
> >   80000000:ffffffff -> 80000008:00000000:00000000:00000000
> >   80000001:ffffffff -> 00000000:00000000:00000121:28100800
> >   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
> >   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
> >   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
> >   80000006:ffffffff -> 00000000:00000000:01007040:00000000
> >   80000007:ffffffff -> 00000000:00000000:00000000:00000100
> >   80000008:ffffffff -> 00003027:00000000:00000000:00000000
> >  MSRs:
> >   index    -> value
> >   000000ce -> 0000000000000000
> >   0000010a -> 0000000000000000
> > PV Max policy: 57 leaves, 2 MSRs
> >  CPUID:
> >   leaf     subleaf  -> eax      ebx      ecx      edx
> >   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
> >   00000001:ffffffff -> 000806c1:00020800:c6f82203:1789cbf5
> >   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
> >   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
> >   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
> >   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
> >   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
> >   00000007:00000000 -> 00000002:208c0109:00000000:20000400
> >   0000000d:00000000 -> 00000003:00000000:00000240:00000000
> >   80000000:ffffffff -> 80000021:00000000:00000000:00000000
> >   80000001:ffffffff -> 00000000:00000000:00000123:28100800
> >   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
> >   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
> >   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
> >   80000006:ffffffff -> 00000000:00000000:01007040:00000000
> >   80000007:ffffffff -> 00000000:00000000:00000000:00000100
> >   80000008:ffffffff -> 00003027:00000000:00000000:00000000
> >  MSRs:
> >   index    -> value
> >   000000ce -> 0000000000000000
> >   0000010a -> 0000000010020004
> > HVM Max policy: 4 leaves, 2 MSRs
> >  CPUID:
> >   leaf     subleaf  -> eax      ebx      ecx      edx
> >  MSRs:
> >   index    -> value
> >   000000ce -> 0000000000000000
> >   0000010a -> 0000000000000000
> > PV Default policy: 30 leaves, 2 MSRs
> >  CPUID:
> >   leaf     subleaf  -> eax      ebx      ecx      edx
> >   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
> >   00000001:ffffffff -> 000806c1:00020800:c6d82203:1789cbf5
> >   00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
> >   00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
> >   00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
> >   00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
> >   00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
> >   00000007:00000000 -> 00000000:208c0109:00000000:20000400
> >   0000000d:00000000 -> 00000003:00000000:00000240:00000000
> >   80000000:ffffffff -> 80000008:00000000:00000000:00000000
> >   80000001:ffffffff -> 00000000:00000000:00000121:28100800
> >   80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
> >   80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
> >   80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
> >   80000006:ffffffff -> 00000000:00000000:01007040:00000000
> >   80000008:ffffffff -> 00003027:00000000:00000000:00000000
> >  MSRs:
> >   index    -> value
> >   000000ce -> 0000000000000000
> >   0000010a -> 0000000000000000
> > HVM Default policy: 4 leaves, 2 MSRs
> >  CPUID:
> >   leaf     subleaf  -> eax      ebx      ecx      edx
> >  MSRs:
> >   index    -> value
> >   000000ce -> 0000000000000000
> >   0000010a -> 0000000000000000
> > ```
> >
> > Guillaume
> >
> > On Sun, Feb 2, 2025 at 4:32=E2=80=AFPM Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> >
> >     This is a sanity check that an algorithm in Xen matches hardware.
> >     It is only compiled into debug builds by default.
> >
> >     Given that you're running under virtualbox, i have a suspicion as
> >     to what's wrong.
> >
> >     Can you collect the full `xen-cpuid -p` output from within your
> >     environment?  I don't believe you're suggested code change is
> >     correct, but it will good enough to get these diagnostics.
> >
> >     ~Andrew
> >
> >     On Sun, 2 Feb 2025, 15:32 Guillaume, <thouveng@gmail.com> wrote:
> >
> >         Hello,
> >
> >          I'd like to report an issue I encountered when building Xen
> >         from source. To give you some context, During the Xen winter
> >         meetup in Grenoble few days ago, there was a discussion about
> >         strengthening collaboration between Xen and academia. One
> >         issue raised by a professor was that Xen is harder for
> >         students to install and experiment compared to KVM. In
> >         response it was mentionned that Debian packages are quite
> >         decent. This motivated me to try installing and playing with
> >         Xen myself. While I am familiar with Xen (I work on the XAPI
> >         toolstack at Vates) I'm not deeply familiar with its
> >         internals, so this seemed like a good learning opportunity and
> >         maybe some contents for some blog posts :).
> >
> >          I set up a Debian testing VM on Virtualbox and installed Xen
> >         from packages. Everything worked fine: Grub was updated, I
> >         rebooted, and I had a functional Xen setup with xl running in
> >         Dom0.
> >          Next I download the last version of Xen from xenbits.org
> >         <http://xenbits.org>,and built only the hypervisor (no tools,
> >         no stubdom) , using the same configuration as the Debian
> >         package (which is for Xen 4.19). After updating GRUB and
> >         rebooting, Xen failed to boot. Fortunately, I was able to
> >         capture the following error via `ttyS0`:
> >         ```
> >         (XEN) [0000000d2c23739a] xstate: size: 0x340 and states: 0x7
> >         (XEN) [0000000d2c509c1d]
> >         (XEN) [0000000d2c641ffa] **************************************=
**
> >         (XEN) [0000000d2c948e3b] Panic on CPU 0:
> >         (XEN) [0000000d2cb349bb] XSTATE 0x0000000000000003,
> >         uncompressed hw size 0x340 !=3D xen size 0x240
> >         (XEN) [0000000d2cfc5786] **************************************=
**
> >         (XEN) [0000000d2d308c24]
> >         ```
> >         From my understanding, the hardware xstate size (`hw_size`)
> >         represents the maximum memory required for the `XSAVE/XRSTOR`
> >         save area, while `xen_size` is computed by summing the space
> >         required for the enabled features. In `xen/arch/x86/xstate.c`,
> >         if these sizes do not match, Xen panics. However, wouldn=E2=80=
=99t it
> >         be correct for `xen_size` to be **less than or equal to**
> >         `hw_size` instead of exactly matching?
> >
> >         I tested the following change:
> >         ```
> >         --- a/xen/arch/x86/xstate.c
> >         +++ b/xen/arch/x86/xstate.c
> >         @@ -710,7 +710,7 @@ static void __init check_new_xstate(struct
> >         xcheck_state *s, uint64_t new)
> >               */
> >              xen_size =3D xstate_uncompressed_size(s->states &
> >         X86_XCR0_STATES);
> >
> >         -    if ( xen_size !=3D hw_size )
> >         +    if ( xen_size > hw_size )
> >                  panic("XSTATE 0x%016"PRIx64", uncompressed hw size
> >         %#x !=3D xen size %#x\n",
> >                        s->states, hw_size, xen_size);
> >         ```
> >         With this change, Xen boots correctly, but I may be missing
> >         some side effects...
> >         Additionally, I am confused as to why this issue does *not*
> >         occur with the default Debian Xen package. Even when I rebuild
> >         Xen *4.19.1* from source (the same version as the package), I
> >         still encounter the issue.
> >         So I have two questions:
> >         - Is my understanding correct that |xen_size <=3D hw_size|
> >         should be allowed?
> >         - Are there any potential side effects of this change?
> >         - Bonus: Have some of you any explanations about why does the
> >         issue not occur with the packaged version of Xen but does with
> >         a self-built version?
> >
> >         Hope I wasn't too long and thanks for taking the time to read
> >         this,
> >         Best regards,
> >
> >         Guillaume
> >
>
>

--000000000000bdd739062d2bb218
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>I attached the output of the `xl dmesg`. Th=
is is the 4.19.1 kernel I rebuild but I have the same issue with master (ju=
st for info).<br></div><br>And also as you said earlier it works with the d=
efault installation because I see that the first line is:<br>`(XEN) [000000=
1476779e16] Xen version 4.19.1 (Debian 4.19.1-1+b2) (<a href=3D"mailto:pkg-=
xen-devel@lists.alioth.debian.org">pkg-xen-devel@lists.alioth.debian.org</a=
>) (x86_64-linux-gnu-gcc (Debian 14.2.0-14) 14.2.0) debug=3Dn Mon Jan 27 15=
:31:22 UTC 2025`<br></div>Indeed it is compiled with debug=3Dn while mine h=
as debug set to yes. So that explains why the default one is booting. But w=
hat is strange is that to build the kernel I copy the default `/boot/xen-4.=
19-amd64.config` as `.config` where I built the kernel. So I probably miss =
something here. Oh wait I&#39;m stupid I copy it into the top dir and not t=
he xen/ dir. So in fact it generates a default one with debug enabled. <spa=
n class=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b=
"><span class=3D"gmail-ryNqvb">Well actually this error is interesting beca=
use it allows me to dive into the code :)</span></span></span><span class=
=3D"gmail-ZSCsVd"></span><div class=3D"gmail-OvtS8d"><span class=3D"gmail-L=
dhArd"><br></span></div></div></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 2, 2025 at =
5:11=E2=80=AFPM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.c=
om">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Can you also get `xl dmesg` too, and attach it=
?<br>
<br>
I think this is a VirtualBox bug, but I&#39;m confused as to why Xen has<br=
>
decided to turn off AVX.<br>
<br>
~Andrew<br>
<br>
On 02/02/2025 4:01 pm, Guillaume wrote:<br>
&gt; Yes sure I can collect the output. As you said the change is good<br>
&gt; enough to start the dom0 without errors (at least no apparent errors :=
).<br>
&gt; ```<br>
&gt; Xen reports there are maximum 120 leaves and 2 MSRs<br>
&gt; Raw policy: 32 leaves, 2 MSRs<br>
&gt; =C2=A0CPUID:<br>
&gt; =C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0=
ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>
&gt; =C2=A0 00000000:ffffffff -&gt; 00000016:756e6547:6c65746e:49656e69<br>
&gt; =C2=A0 00000001:ffffffff -&gt; 000806c1:00020800:f6fa3203:178bfbff<br>
&gt; =C2=A0 00000002:ffffffff -&gt; 00feff01:000000f0:00000000:00000000<br>
&gt; =C2=A0 00000004:00000000 -&gt; 04000121:02c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000001 -&gt; 04000122:01c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:000003ff:00000000<br>
&gt; =C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003fff:00000004<br>
&gt; =C2=A0 00000006:ffffffff -&gt; 00000004:00000000:00000000:00000000<br>
&gt; =C2=A0 00000007:00000000 -&gt; 00000000:208c2569:00000000:30000400<br>
&gt; =C2=A0 0000000b:00000000 -&gt; 00000000:00000001:00000100:00000000<br>
&gt; =C2=A0 0000000b:00000001 -&gt; 00000001:00000002:00000201:00000000<br>
&gt; =C2=A0 0000000d:00000000 -&gt; 00000007:00000000:00000340:00000000<br>
&gt; =C2=A0 0000000d:00000002 -&gt; 00000100:00000240:00000000:00000000<br>
&gt; =C2=A0 80000000:ffffffff -&gt; 80000008:00000000:00000000:00000000<br>
&gt; =C2=A0 80000001:ffffffff -&gt; 00000000:00000000:00000121:28100800<br>
&gt; =C2=A0 80000002:ffffffff -&gt; 68743131:6e654720:746e4920:52286c65<br>
&gt; =C2=A0 80000003:ffffffff -&gt; 6f432029:54286572:6920294d:31312d37<br>
&gt; =C2=A0 80000004:ffffffff -&gt; 37473538:33204020:4730302e:00007a48<br>
&gt; =C2=A0 80000006:ffffffff -&gt; 00000000:00000000:01007040:00000000<br>
&gt; =C2=A0 80000007:ffffffff -&gt; 00000000:00000000:00000000:00000100<br>
&gt; =C2=A0 80000008:ffffffff -&gt; 00003027:00000000:00000000:00000000<br>
&gt; =C2=A0MSRs:<br>
&gt; =C2=A0 index =C2=A0 =C2=A0-&gt; value<br>
&gt; =C2=A0 000000ce -&gt; 0000000000000000<br>
&gt; =C2=A0 0000010a -&gt; 0000000000000000<br>
&gt; Host policy: 30 leaves, 2 MSRs<br>
&gt; =C2=A0CPUID:<br>
&gt; =C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0=
ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>
&gt; =C2=A0 00000000:ffffffff -&gt; 0000000d:756e6547:6c65746e:49656e69<br>
&gt; =C2=A0 00000001:ffffffff -&gt; 000806c1:00020800:c6fa2203:178bfbff<br>
&gt; =C2=A0 00000002:ffffffff -&gt; 00feff01:000000f0:00000000:00000000<br>
&gt; =C2=A0 00000004:00000000 -&gt; 04000121:02c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000001 -&gt; 04000122:01c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:000003ff:00000000<br>
&gt; =C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003fff:00000004<br>
&gt; =C2=A0 00000007:00000000 -&gt; 00000000:208c2549:00000000:30000400<br>
&gt; =C2=A0 0000000d:00000000 -&gt; 00000003:00000000:00000240:00000000<br>
&gt; =C2=A0 80000000:ffffffff -&gt; 80000008:00000000:00000000:00000000<br>
&gt; =C2=A0 80000001:ffffffff -&gt; 00000000:00000000:00000121:28100800<br>
&gt; =C2=A0 80000002:ffffffff -&gt; 68743131:6e654720:746e4920:52286c65<br>
&gt; =C2=A0 80000003:ffffffff -&gt; 6f432029:54286572:6920294d:31312d37<br>
&gt; =C2=A0 80000004:ffffffff -&gt; 37473538:33204020:4730302e:00007a48<br>
&gt; =C2=A0 80000006:ffffffff -&gt; 00000000:00000000:01007040:00000000<br>
&gt; =C2=A0 80000007:ffffffff -&gt; 00000000:00000000:00000000:00000100<br>
&gt; =C2=A0 80000008:ffffffff -&gt; 00003027:00000000:00000000:00000000<br>
&gt; =C2=A0MSRs:<br>
&gt; =C2=A0 index =C2=A0 =C2=A0-&gt; value<br>
&gt; =C2=A0 000000ce -&gt; 0000000000000000<br>
&gt; =C2=A0 0000010a -&gt; 0000000000000000<br>
&gt; PV Max policy: 57 leaves, 2 MSRs<br>
&gt; =C2=A0CPUID:<br>
&gt; =C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0=
ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>
&gt; =C2=A0 00000000:ffffffff -&gt; 0000000d:756e6547:6c65746e:49656e69<br>
&gt; =C2=A0 00000001:ffffffff -&gt; 000806c1:00020800:c6f82203:1789cbf5<br>
&gt; =C2=A0 00000002:ffffffff -&gt; 00feff01:000000f0:00000000:00000000<br>
&gt; =C2=A0 00000004:00000000 -&gt; 04000121:02c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000001 -&gt; 04000122:01c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:000003ff:00000000<br>
&gt; =C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003fff:00000004<br>
&gt; =C2=A0 00000007:00000000 -&gt; 00000002:208c0109:00000000:20000400<br>
&gt; =C2=A0 0000000d:00000000 -&gt; 00000003:00000000:00000240:00000000<br>
&gt; =C2=A0 80000000:ffffffff -&gt; 80000021:00000000:00000000:00000000<br>
&gt; =C2=A0 80000001:ffffffff -&gt; 00000000:00000000:00000123:28100800<br>
&gt; =C2=A0 80000002:ffffffff -&gt; 68743131:6e654720:746e4920:52286c65<br>
&gt; =C2=A0 80000003:ffffffff -&gt; 6f432029:54286572:6920294d:31312d37<br>
&gt; =C2=A0 80000004:ffffffff -&gt; 37473538:33204020:4730302e:00007a48<br>
&gt; =C2=A0 80000006:ffffffff -&gt; 00000000:00000000:01007040:00000000<br>
&gt; =C2=A0 80000007:ffffffff -&gt; 00000000:00000000:00000000:00000100<br>
&gt; =C2=A0 80000008:ffffffff -&gt; 00003027:00000000:00000000:00000000<br>
&gt; =C2=A0MSRs:<br>
&gt; =C2=A0 index =C2=A0 =C2=A0-&gt; value<br>
&gt; =C2=A0 000000ce -&gt; 0000000000000000<br>
&gt; =C2=A0 0000010a -&gt; 0000000010020004<br>
&gt; HVM Max policy: 4 leaves, 2 MSRs<br>
&gt; =C2=A0CPUID:<br>
&gt; =C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0=
ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>
&gt; =C2=A0MSRs:<br>
&gt; =C2=A0 index =C2=A0 =C2=A0-&gt; value<br>
&gt; =C2=A0 000000ce -&gt; 0000000000000000<br>
&gt; =C2=A0 0000010a -&gt; 0000000000000000<br>
&gt; PV Default policy: 30 leaves, 2 MSRs<br>
&gt; =C2=A0CPUID:<br>
&gt; =C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0=
ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>
&gt; =C2=A0 00000000:ffffffff -&gt; 0000000d:756e6547:6c65746e:49656e69<br>
&gt; =C2=A0 00000001:ffffffff -&gt; 000806c1:00020800:c6d82203:1789cbf5<br>
&gt; =C2=A0 00000002:ffffffff -&gt; 00feff01:000000f0:00000000:00000000<br>
&gt; =C2=A0 00000004:00000000 -&gt; 04000121:02c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000001 -&gt; 04000122:01c0003f:0000003f:00000000<br>
&gt; =C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:000003ff:00000000<br>
&gt; =C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003fff:00000004<br>
&gt; =C2=A0 00000007:00000000 -&gt; 00000000:208c0109:00000000:20000400<br>
&gt; =C2=A0 0000000d:00000000 -&gt; 00000003:00000000:00000240:00000000<br>
&gt; =C2=A0 80000000:ffffffff -&gt; 80000008:00000000:00000000:00000000<br>
&gt; =C2=A0 80000001:ffffffff -&gt; 00000000:00000000:00000121:28100800<br>
&gt; =C2=A0 80000002:ffffffff -&gt; 68743131:6e654720:746e4920:52286c65<br>
&gt; =C2=A0 80000003:ffffffff -&gt; 6f432029:54286572:6920294d:31312d37<br>
&gt; =C2=A0 80000004:ffffffff -&gt; 37473538:33204020:4730302e:00007a48<br>
&gt; =C2=A0 80000006:ffffffff -&gt; 00000000:00000000:01007040:00000000<br>
&gt; =C2=A0 80000008:ffffffff -&gt; 00003027:00000000:00000000:00000000<br>
&gt; =C2=A0MSRs:<br>
&gt; =C2=A0 index =C2=A0 =C2=A0-&gt; value<br>
&gt; =C2=A0 000000ce -&gt; 0000000000000000<br>
&gt; =C2=A0 0000010a -&gt; 0000000000000000<br>
&gt; HVM Default policy: 4 leaves, 2 MSRs<br>
&gt; =C2=A0CPUID:<br>
&gt; =C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0=
ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>
&gt; =C2=A0MSRs:<br>
&gt; =C2=A0 index =C2=A0 =C2=A0-&gt; value<br>
&gt; =C2=A0 000000ce -&gt; 0000000000000000<br>
&gt; =C2=A0 0000010a -&gt; 0000000000000000<br>
&gt; ```<br>
&gt;<br>
&gt; Guillaume<br>
&gt;<br>
&gt; On Sun, Feb 2, 2025 at 4:32=E2=80=AFPM Andrew Cooper<br>
&gt; &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">and=
rew.cooper3@citrix.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This is a sanity check that an algorithm in Xen mat=
ches hardware.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0It is only compiled into debug builds by default.=
=C2=A0<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Given that you&#39;re running under virtualbox, i h=
ave a suspicion as<br>
&gt;=C2=A0 =C2=A0 =C2=A0to what&#39;s wrong.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Can you collect the full `xen-cpuid -p` output from=
 within your<br>
&gt;=C2=A0 =C2=A0 =C2=A0environment?=C2=A0 I don&#39;t believe you&#39;re s=
uggested code change is<br>
&gt;=C2=A0 =C2=A0 =C2=A0correct, but it will good enough to get these diagn=
ostics.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0~Andrew<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Sun, 2 Feb 2025, 15:32 Guillaume, &lt;<a href=3D=
"mailto:thouveng@gmail.com" target=3D"_blank">thouveng@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hello,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0I&#39;d like to report an issue=
 I encountered when building Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from source. To give you some context=
, During the Xen winter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meetup in Grenoble few days ago, ther=
e was a discussion about<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strengthening collaboration between X=
en and academia. One<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0issue raised by a professor was that =
Xen is harder for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0students to install and experiment co=
mpared to KVM. In<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0response it was mentionned that Debia=
n packages are quite<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decent. This motivated me to try inst=
alling and playing with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xen myself. While I am familiar with =
Xen (I work on the XAPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0toolstack at Vates) I&#39;m not deepl=
y familiar with its<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internals, so this seemed like a good=
 learning opportunity and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maybe some contents for some blog pos=
ts :).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0I set up a Debian testing VM on=
 Virtualbox and installed Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from packages. Everything worked fine=
: Grub was updated, I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rebooted, and I had a functional Xen =
setup with xl running in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Dom0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0Next I download the last versio=
n of Xen from <a href=3D"http://xenbits.org" rel=3D"noreferrer" target=3D"_=
blank">xenbits.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://xenbits.org" re=
l=3D"noreferrer" target=3D"_blank">http://xenbits.org</a>&gt;,and built onl=
y the hypervisor (no tools,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no stubdom) , using the same configur=
ation as the Debian<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package (which is for Xen 4.19). Afte=
r updating GRUB and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rebooting, Xen failed to boot. Fortun=
ately, I was able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0capture the following error via `ttyS=
0`:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2c23739a] xstate: size=
: 0x340 and states: 0x7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2c509c1d]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2c641ffa] ************=
****************************<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2c948e3b] Panic on CPU=
 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2cb349bb] XSTATE 0x000=
0000000000003,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uncompressed hw size 0x340 !=3D xen s=
ize 0x240<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2cfc5786] ************=
****************************<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) [0000000d2d308c24]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0From my understanding, the hardware x=
state size (`hw_size`)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0represents the maximum memory require=
d for the `XSAVE/XRSTOR`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save area, while `xen_size` is comput=
ed by summing the space<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required for the enabled features. In=
 `xen/arch/x86/xstate.c`,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if these sizes do not match, Xen pani=
cs. However, wouldn=E2=80=99t it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be correct for `xen_size` to be **les=
s than or equal to**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`hw_size` instead of exactly matching=
?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I tested the following change:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/xen/arch/x86/xstate.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/xen/arch/x86/xstate.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -710,7 +710,7 @@ static void __ini=
t check_new_xstate(struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xcheck_state *s, uint64_t new)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0xen_size =3D xsta=
te_uncompressed_size(s-&gt;states &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X86_XCR0_STATES);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 =C2=A0if ( xen_size !=3D hw_=
size )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ =C2=A0 =C2=A0if ( xen_size &gt; hw_=
size )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pan=
ic(&quot;XSTATE 0x%016&quot;PRIx64&quot;, uncompressed hw size<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%#x !=3D xen size %#x\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0s-&gt;states, hw_size, xen_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0With this change, Xen boots correctly=
, but I may be missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0some side effects...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Additionally, I am confused as to why=
 this issue does *not*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0occur with the default Debian Xen pac=
kage. Even when I rebuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xen *4.19.1* from source (the same ve=
rsion as the package), I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0still encounter the issue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So I have two questions:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Is my understanding correct that |x=
en_size &lt;=3D hw_size|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0should be allowed?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Are there any potential side effect=
s of this change?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Bonus: Have some of you any explana=
tions about why does the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0issue not occur with the packaged ver=
sion of Xen but does with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a self-built version?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hope I wasn&#39;t too long and thanks=
 for taking the time to read<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Guillaume<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000bdd739062d2bb218--
--000000000000bdd73a062d2bb21a
Content-Type: text/plain; charset="US-ASCII"; name="xl_dmesg_Xen_4.19.1.txt"
Content-Disposition: attachment; filename="xl_dmesg_Xen_4.19.1.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m6nusra50>
X-Attachment-Id: f_m6nusra50

cm9vdEB2Ym94On4jIHhsIGRtZXNnCiBYZW4gNC4xOS4xCihYRU4pIFhlbiB2ZXJzaW9uIDQuMTku
MSAodmJveHVzZXJAbG9jYWxkb21haW4pIChnY2MgKERlYmlhbiAxNC4yLjAtMTIpIDE0LjIuMCkg
ZGVidWc9eSBTdW4gRmViICAyIDEzOjUxOjE1IENFVCAyMDI1CihYRU4pIExhdGVzdCBDaGFuZ2VT
ZXQ6IFdlZCBEZWMgNCAwODo1MjozNyAyMDI0ICswMTAwIGdpdDpjY2Y0MDA4NDY3LWRpcnR5CihY
RU4pIGJ1aWxkLWlkOiA4Mjk4MDM0OWQwZWIzYmMyNDQwNzFjYWU2NWE5M2Q4OWI1MjMzOTE0CihY
RU4pIEJvb3Rsb2FkZXI6IEdSVUIgMi4xMi01CihYRU4pIENvbW1hbmQgbGluZTogcGxhY2Vob2xk
ZXIKKFhFTikgWGVuIGltYWdlIGxvYWQgYmFzZSBhZGRyZXNzOiAweDdmMjAwMDAwCihYRU4pIFZp
ZGVvIGluZm9ybWF0aW9uOgooWEVOKSAgVkdBIGlzIHRleHQgbW9kZSA4MHgyNSwgZm9udCA4eDE2
CihYRU4pIERpc2MgaW5mb3JtYXRpb246CihYRU4pICBGb3VuZCAxIE1CUiBzaWduYXR1cmVzCihY
RU4pICBGb3VuZCAxIEVERCBpbmZvcm1hdGlvbiBzdHJ1Y3R1cmVzCihYRU4pIENQVSBWZW5kb3I6
IEludGVsLCBGYW1pbHkgNiAoMHg2KSwgTW9kZWwgMTQwICgweDhjKSwgU3RlcHBpbmcgMSAocmF3
IDAwMDgwNmMxKQooWEVOKSBYZW4tZTgyMCBSQU0gbWFwOgooWEVOKSAgWzAwMDAwMDAwMDAwMDAw
MDAsIDAwMDAwMDAwMDAwOWZiZmZdICh1c2FibGUpCihYRU4pICBbMDAwMDAwMDAwMDA5ZmMwMCwg
MDAwMDAwMDAwMDA5ZmZmZl0gKHJlc2VydmVkKQooWEVOKSAgWzAwMDAwMDAwMDAwZjAwMDAsIDAw
MDAwMDAwMDAwZmZmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMDAwMTAwMDAwLCAwMDAw
MDAwMDdmZmVmZmZmXSAodXNhYmxlKQooWEVOKSAgWzAwMDAwMDAwN2ZmZjAwMDAsIDAwMDAwMDAw
N2ZmZmZmZmZdIChBQ1BJIGRhdGEpCihYRU4pICBbMDAwMDAwMDBmZWMwMDAwMCwgMDAwMDAwMDBm
ZWMwMGZmZl0gKHJlc2VydmVkKQooWEVOKSAgWzAwMDAwMDAwZmVlMDAwMDAsIDAwMDAwMDAwZmVl
MDBmZmZdIChyZXNlcnZlZCkKKFhFTikgIFswMDAwMDAwMGZmZmMwMDAwLCAwMDAwMDAwMGZmZmZm
ZmZmXSAocmVzZXJ2ZWQpCihYRU4pIEJTUCBtaWNyb2NvZGUgcmV2aXNpb246IDB4MDAwMDAwMDAK
KFhFTikgU3lzdGVtIFJBTTogMjA0N01CICgyMDk2NzAwa0IpCihYRU4pIEFDUEk6IFJTRFAgMDAw
RTAwMDAsIDAwMjQgKHIyIFZCT1ggICkKKFhFTikgQUNQSTogWFNEVCA3RkZGMDAzMCwgMDAzQyAo
cjEgVkJPWCAgIFZCT1hYU0RUICAgICAgICAxIEFTTCAgICAgICAgNjEpCihYRU4pIEFDUEk6IEZB
Q1AgN0ZGRjAwRjAsIDAwRjQgKHI0IFZCT1ggICBWQk9YRkFDUCAgICAgICAgMSBBU0wgICAgICAg
IDYxKQooWEVOKSBBQ1BJOiBEU0RUIDdGRkYwNjEwLCAyMzUzIChyMiBWQk9YICAgVkJPWEJJT1Mg
ICAgICAgIDIgSU5UTCAyMDIwMDkyNSkKKFhFTikgQUNQSTogRkFDUyA3RkZGMDIwMCwgMDA0MAoo
WEVOKSBBQ1BJOiBBUElDIDdGRkYwMjQwLCAwMDVDIChyMiBWQk9YICAgVkJPWEFQSUMgICAgICAg
IDEgQVNMICAgICAgICA2MSkKKFhFTikgQUNQSTogU1NEVCA3RkZGMDJBMCwgMDM2QyAocjEgVkJP
WCAgIFZCT1hDUFVUICAgICAgICAyIElOVEwgMjAyMDA5MjUpCihYRU4pIE5vIE5VTUEgY29uZmln
dXJhdGlvbiBmb3VuZAooWEVOKSBGYWtpbmcgYSBub2RlIGF0IDAwMDAwMDAwMDAwMDAwMDAtMDAw
MDAwMDA3ZmZmMDAwMAooWEVOKSBEb21haW4gaGVhcCBpbml0aWFsaXNlZAooWEVOKSBmb3VuZCBT
TVAgTVAtdGFibGUgYXQgMDAwOWZmZjAKKFhFTikgRE1JIDIuNSBwcmVzZW50LgooWEVOKSBVc2lu
ZyBBUElDIGRyaXZlciBkZWZhdWx0CihYRU4pIEFDUEk6IFBNLVRpbWVyIElPIFBvcnQ6IDB4NDAw
OCAoMzIgYml0cykKKFhFTikgQUNQSTogU0xFRVAgSU5GTzogcG0xeF9jbnRbMTo0MDA0LDE6MF0s
IHBtMXhfZXZ0WzE6NDAwMCwxOjBdCihYRU4pIEFDUEk6ICAgICAgICAgICAgIHdha2V1cF92ZWNb
N2ZmZjAyMGNdLCB2ZWNfc2l6ZVsyMF0KKFhFTikgQUNQSTogTG9jYWwgQVBJQyBhZGRyZXNzIDB4
ZmVlMDAwMDAKKFhFTikgQUNQSTogSU9BUElDIChpZFsweDAyXSBhZGRyZXNzWzB4ZmVjMDAwMDBd
IGdzaV9iYXNlWzBdKQooWEVOKSBJT0FQSUNbMF06IGFwaWNfaWQgMiwgdmVyc2lvbiAzMiwgYWRk
cmVzcyAweGZlYzAwMDAwLCBHU0kgMC0yMwooWEVOKSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAg
YnVzX2lycSAwIGdsb2JhbF9pcnEgMiBkZmwgZGZsKQooWEVOKSBBQ1BJOiBJTlRfU1JDX09WUiAo
YnVzIDAgYnVzX2lycSA5IGdsb2JhbF9pcnEgOSBsb3cgbGV2ZWwpCihYRU4pIEFDUEk6IElSUTAg
dXNlZCBieSBvdmVycmlkZS4KKFhFTikgQUNQSTogSVJRMiB1c2VkIGJ5IG92ZXJyaWRlLgooWEVO
KSBBQ1BJOiBJUlE5IHVzZWQgYnkgb3ZlcnJpZGUuCihYRU4pIFVzaW5nIEFDUEkgKE1BRFQpIGZv
ciBTTVAgY29uZmlndXJhdGlvbiBpbmZvcm1hdGlvbgooWEVOKSBTTVA6IEFsbG93aW5nIDIgQ1BV
cyAoMCBob3RwbHVnIENQVXMpCihYRU4pIElSUSBsaW1pdHM6IDI0IEdTSSwgMzkyIE1TSS9NU0kt
WAooWEVOKSBTd2l0Y2hlZCB0byBBUElDIGRyaXZlciB4MmFwaWNfbWl4ZWQKKFhFTikgQ1BVMDog
MzAwMCAuLi4gMzAwMCBNSHoKKFhFTikgeHN0YXRlOiBzaXplOiAweDM0MCBhbmQgc3RhdGVzOiAw
eDcKKFhFTikgWGVuIFdBUk4gYXQgYXJjaC94ODYveHN0YXRlLmM6NzUwCihYRU4pIC0tLS1bIFhl
bi00LjE5LjEgIHg4Nl82NCAgZGVidWc9eSAgTm90IHRhaW50ZWQgXS0tLS0KKFhFTikgQ1BVOiAg
ICAwCihYRU4pIFJJUDogICAgZTAwODpbPGZmZmY4MmQwNDA0NTgwYjM+XSBhcmNoL3g4Ni94c3Rh
dGUuYyNjaGVja19uZXdfeHN0YXRlKzB4MWM1LzB4MWQzCihYRU4pIFJGTEFHUzogMDAwMDAwMDAw
MDAxMDA0NiAgIENPTlRFWFQ6IGh5cGVydmlzb3IKKFhFTikgcmF4OiAwMDAwMDAwMDAwMDAwMDAw
ICAgcmJ4OiAwMDAwMDAwMDAwMDAwOTg4ICAgcmN4OiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIHJk
eDogMDAwMDAwMDAwMDAwMDAwMCAgIHJzaTogZmZmZjgyZDA0MDVkNzMwOCAgIHJkaTogMDAwMDAw
MDAwMDAwMDAwMwooWEVOKSByYnA6IGZmZmY4MmQwNDA0NjdjZTggICByc3A6IGZmZmY4MmQwNDA0
NjdjYzggICByODogIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgcjk6ICBmZmZmODJkMDQwNGJlZDAw
ICAgcjEwOiAwMDAwMDAwMDAwMDAwMDAwICAgcjExOiBmZmZmODJkMDQwNWU1NDAwCihYRU4pIHIx
MjogZmZmZjgyZDA0MDQ2N2NmOCAgIHIxMzogMDAwMDAwMDAwMDAwMDAwMyAgIHIxNDogMDAwMDAw
MDAwMDAwMDAwMQooWEVOKSByMTU6IDAwMDAwMDAwMDAwMDAwMDAgICBjcjA6IDAwMDAwMDAwODAw
NTAwMzMgICBjcjQ6IDAwMDAwMDAwMDAwNDAwYTAKKFhFTikgY3IzOiAwMDAwMDAwMDdmNmNhMDAw
ICAgY3IyOiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIGZzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdz
YjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMAooWEVOKSBkczogMDAw
MCAgIGVzOiAwMDAwICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiAwMDAwICAgY3M6IGUwMDgK
KFhFTikgWGVuIGNvZGUgYXJvdW5kIDxmZmZmODJkMDQwNDU4MGIzPiAoYXJjaC94ODYveHN0YXRl
LmMjY2hlY2tfbmV3X3hzdGF0ZSsweDFjNS8weDFkMyk6CihYRU4pICAwMCAwMCAwZiA4NSAzOSBm
ZiBmZiBmZiA8MGY+IDBiIGM2IDA1IGQ0IDc3IDFhIDAwIDAxIGU5IDJiIGZmIGZmIGZmIDU1IDQ4
CihYRU4pIFhlbiBzdGFjayB0cmFjZSBmcm9tIHJzcD1mZmZmODJkMDQwNDY3Y2M4OgooWEVOKSAg
ICAwMDAwMDAwMDAwMDAwMDAzIDAwMDAwMDAwMDAwMDAwMDcgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDA3CihYRU4pICAgIGZmZmY4MmQwNDA0NjdkMjAgZmZmZjgyZDA0MDQ1ODBmYyAw
MDAwMDAwMDAwMDAwMDAzIDAwMDAwMDAwMDAwMDAzNDAKKFhFTikgICAgMDAwMDAwMDAwMDAwMDI0
MCBmZmZmODJkMDQwNGJlZDAwIDAwMDAwMDAwMDAwMDAwMDcgZmZmZjgyZDA0MDQ2N2Q0OAooWEVO
KSAgICBmZmZmODJkMDQwMzg5NzllIDAwMDAwMDAwMDAwMDA5ODggZmZmZjgyZDA0MDRiZWQwMCAw
MDAwMDAwMGZmZmZmZmZmCihYRU4pICAgIGZmZmY4MmQwNDA0NjdkNjggZmZmZjgyZDA0MDI5MGM3
NyBmZmZmODJkMDQwNGJlZTgwIDAwMDAwMDAwMDAwMDAwMDEKKFhFTikgICAgZmZmZjgyZDA0MDQ2
N2VlOCBmZmZmODJkMDQwNDUyM2M0IGZmZmY4MmQwNDA0OWNmODAgMDAwMDAwMDAwMDAwMDAwMAoo
WEVOKSAgICBmZmZmODJkMDQwNWU3ZjAwIDAwMDAwMDAwMDEwMDAwMDAgZmZmZjgzMDAwMDA5ZGY4
MCBmZmZmODMwMDAwMDlkZjgwCihYRU4pICAgIDAwMDAwMDAwMDQwNjYwMDAgMDAwMDAwMDA3Njk3
ZDAwMCBmZmZmODJkMDQwNDY3ZTQ0IGZmZmY4MmQwNDA1ZTdmMDAKKFhFTikgICAgZmZmZjgyZDA0
MDQ5Y2Y4MCBmZmZmODJkMDQwMzkzMDAwIDAwMDAwMDAwMDAwMDAwMDAgZmZmZjgyZDA0MDM5MzAw
MAooWEVOKSAgICAwMDAwMDAwMDA0MDY2MDAwIDAwMDAwMDAwMDAwN2ZmZjAgMDAwMDAwMDAwMDAw
NDA4YyBmZmZmODJkMDAwODAwMTYzCihYRU4pICAgIDAwMDAwMDAwMDAwMDAwMDIgMDAwMDAwMDAw
MDAwMDAwMSBmZmZmODMwMDdmZGYwMDAwIGZmZmY4MmQwNDA0NjdlZjgKKFhFTikgICAgZmZmZjgz
MDAwMDA5ZGY4MCBmZmZmODMwMDAwMDlkZmIwIGZmZmY4MzAwMDAwOWRmNjAgMDAwN2E4MDA3ZjYz
N2NiNQooWEVOKSAgICA3ZjYzNzY4NjAwYjczN2MwIDdmNjM3Y2I3MDAwOWRmNzEgNzAyZDdjYjg3
ZjYzNzNlZiA3ZjYzN2NiNTAwMDAwMDAwCihYRU4pICAgIDdmNjY3ZTk4MDAwOWRmN2IgMDAwOWRm
N2I3ZjYzNzZmYyAwMDAwMDAwNDdmNjM3Y2IxIDdmNjY3ZWIwMDAwOWRmMDEKKFhFTikgICAgMDAw
MDAwMDgwMDAwMDAwMCAwMDAwMDAwMTAwMDAwMDZlIDAwMDAwMDAwMDAwMDAwMDMgMDAwMDAwMDAw
MDAwMDJmOAooWEVOKSAgICBmZmZmODJkMDQwNWNlMDAwIGZmZmY4MmQwNDA0Y2UwMDAgMDAwMDAw
MDAwMDAwMDAwMiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgICAg
MDAwMDAwMDAwMDAwMDAwMCBmZmZmODJkMDQwMjAzMzM0IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMAooWEVOKSAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pICAgIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikg
WGVuIGNhbGwgdHJhY2U6CihYRU4pICAgIFs8ZmZmZjgyZDA0MDQ1ODBiMz5dIFIgYXJjaC94ODYv
eHN0YXRlLmMjY2hlY2tfbmV3X3hzdGF0ZSsweDFjNS8weDFkMwooWEVOKSAgICBbPGZmZmY4MmQw
NDA0NTgwZmM+XSBGIGFyY2gveDg2L3hzdGF0ZS5jI3hzdGF0ZV9jaGVja19zaXplcysweDNiLzB4
MjJhCihYRU4pICAgIFs8ZmZmZjgyZDA0MDM4OTc5ZT5dIEYgeHN0YXRlX2luaXQrMHgzMzIvMHgz
NTEKKFhFTikgICAgWzxmZmZmODJkMDQwMjkwYzc3Pl0gRiBpZGVudGlmeV9jcHUrMHgzNzcvMHg0
ZjQKKFhFTikgICAgWzxmZmZmODJkMDQwNDUyM2M0Pl0gRiBfX3N0YXJ0X3hlbisweDFjY2IvMHgy
NTIzCihYRU4pICAgIFs8ZmZmZjgyZDA0MDIwMzMzND5dIEYgX19oaWdoX3N0YXJ0KzB4OTQvMHhh
MAooWEVOKQooWEVOKSBDUFUwOiBObyBNQ0UgYmFua3MgcHJlc2VudC4gTWFjaGluZSBjaGVjayBz
dXBwb3J0IGRpc2FibGVkCihYRU4pIFVucmVjb2duaXNlZCBDUFUgbW9kZWwgMHg4YyAtIGFzc3Vt
aW5nIHZ1bG5lcmFibGUgdG8gTGF6eUZQVQooWEVOKSBVbnJlY29nbmlzZWQgQ1BVIG1vZGVsIDB4
OGMgLSBhc3N1bWluZyB2dWxuZXJhYmxlIHRvIEwxVEYKKFhFTikgVW5yZWNvZ25pc2VkIENQVSBt
b2RlbCAweDhjIC0gYXNzdW1pbmcgdnVsbmVyYWJsZSB0byBNRFMKKFhFTikgTWl0aWdhdGluZyBH
RFMgYnkgZGlzYWJsaW5nIEFWWCB3aGlsZSB2aXJ0dWFsaXNlZCAtIHByb3RlY3Rpb25zIGFyZSBi
ZXN0LWVmZm9ydAooWEVOKSBTcGVjdWxhdGl2ZSBtaXRpZ2F0aW9uIGZhY2lsaXRpZXM6CihYRU4p
ICAgSGFyZHdhcmUgaGludHM6CihYRU4pICAgSGFyZHdhcmUgZmVhdHVyZXM6IEwxRF9GTFVTSCBN
RF9DTEVBUgooWEVOKSAgIENvbXBpbGVkLWluIHN1cHBvcnQ6IElORElSRUNUX1RIVU5LIFNIQURP
V19QQUdJTkcgSEFSREVOX0FSUkFZIEhBUkRFTl9CUkFOQ0ggSEFSREVOX0dVRVNUX0FDQ0VTUyBI
QVJERU5fTE9DSwooWEVOKSAgIFhlbiBzZXR0aW5nczogQlRJLVRodW5rOiBSRVRQT0xJTkUsIEJI
Qi1TZXE6IFNIT1JULCBTUEVDX0NUUkw6IE5vLCBPdGhlcjogTDFEX0ZMVVNIIFZFUlcgQlJBTkNI
X0hBUkRFTgooWEVOKSAgIEwxVEY6IGJlbGlldmVkIHZ1bG5lcmFibGUsIG1heHBoeXNhZGRyIEwx
RCAzOSwgQ1BVSUQgMzksIFNhZmUgYWRkcmVzcyA2MDAwMDAwMDAwCihYRU4pICAgU3VwcG9ydCBm
b3IgSFZNIFZNczogUlNCIEVBR0VSX0ZQVSBCSEItZW50cnkKKFhFTikgICBTdXBwb3J0IGZvciBQ
ViBWTXM6IFJTQiBFQUdFUl9GUFUgVkVSVyBCSEItZW50cnkKKFhFTikgICBYUFRJICg2NC1iaXQg
UFYgb25seSk6IERvbTAgZW5hYmxlZCwgRG9tVSBlbmFibGVkICh3aXRoIFBDSUQpCihYRU4pICAg
UFYgTDFURiBzaGFkb3dpbmc6IERvbTAgZGlzYWJsZWQsIERvbVUgZW5hYmxlZAooWEVOKSBVc2lu
ZyBzY2hlZHVsZXI6IFNNUCBDcmVkaXQgU2NoZWR1bGVyIHJldjIgKGNyZWRpdDIpCihYRU4pIElu
aXRpYWxpemluZyBDcmVkaXQyIHNjaGVkdWxlcgooWEVOKSAgbG9hZF9wcmVjaXNpb25fc2hpZnQ6
IDE4CihYRU4pICBsb2FkX3dpbmRvd19zaGlmdDogMzAKKFhFTikgIHVuZGVybG9hZF9iYWxhbmNl
X3RvbGVyYW5jZTogMAooWEVOKSAgb3ZlcmxvYWRfYmFsYW5jZV90b2xlcmFuY2U6IC0zCihYRU4p
ICBydW5xdWV1ZXMgYXJyYW5nZW1lbnQ6IHNvY2tldAooWEVOKSAgY2FwIGVuZm9yY2VtZW50IGdy
YW51bGFyaXR5OiAxMG1zCihYRU4pIGxvYWQgdHJhY2tpbmcgd2luZG93IGxlbmd0aCAxMDczNzQx
ODI0IG5zCihYRU4pIFBsYXRmb3JtIHRpbWVyIGlzIDMuNTgwTUh6IEFDUEkgUE0gVGltZXIKKFhF
TikgRGV0ZWN0ZWQgMjk5NS4xOTggTUh6IHByb2Nlc3Nvci4KKFhFTikgRnJlZWQgMTAyNGtCIHVu
dXNlZCBCU1MgbWVtb3J5CihYRU4pIGFsdCB0YWJsZSBmZmZmODJkMDQwNGEyOTk4IC0+IGZmZmY4
MmQwNDA0YjU0MjIKKFhFTikgSS9PIHZpcnR1YWxpc2F0aW9uIGRpc2FibGVkCihYRU4pIG5yX3Nv
Y2tldHM6IDEKKFhFTikgRW5hYmxpbmcgQVBJQyBtb2RlLiAgVXNpbmcgMSBJL08gQVBJQ3MKKFhF
TikgRU5BQkxJTkcgSU8tQVBJQyBJUlFzCihYRU4pICAtPiBVc2luZyBuZXcgQUNLIG1ldGhvZAoo
WEVOKSAuLlRJTUVSOiB2ZWN0b3I9MHhGMCBhcGljMT0wIHBpbjE9MiBhcGljMj0tMSBwaW4yPS0x
CihYRU4pIEFsbG9jYXRlZCBjb25zb2xlIHJpbmcgb2YgMTYgS2lCLgooWEVOKSBtd2FpdC1pZGxl
OiBkb2VzIG5vdCBydW4gb24gZmFtaWx5IDYgbW9kZWwgMTQwCihYRU4pIGFsdCB0YWJsZSBmZmZm
ODJkMDQwNGEyOTk4IC0+IGZmZmY4MmQwNDA0YjU0MjIKKFhFTikgQ1BVMTogTm8gTUNFIGJhbmtz
IHByZXNlbnQuIE1hY2hpbmUgY2hlY2sgc3VwcG9ydCBkaXNhYmxlZAooWEVOKSBCcm91Z2h0IHVw
IDIgQ1BVcwooWEVOKSBTY2hlZHVsaW5nIGdyYW51bGFyaXR5OiBjcHUsIDEgQ1BVIHBlciBzY2hl
ZC1yZXNvdXJjZQooWEVOKSBJbml0aWFsaXppbmcgQ3JlZGl0MiBzY2hlZHVsZXIKKFhFTikgIGxv
YWRfcHJlY2lzaW9uX3NoaWZ0OiAxOAooWEVOKSAgbG9hZF93aW5kb3dfc2hpZnQ6IDMwCihYRU4p
ICB1bmRlcmxvYWRfYmFsYW5jZV90b2xlcmFuY2U6IDAKKFhFTikgIG92ZXJsb2FkX2JhbGFuY2Vf
dG9sZXJhbmNlOiAtMwooWEVOKSAgcnVucXVldWVzIGFycmFuZ2VtZW50OiBzb2NrZXQKKFhFTikg
IGNhcCBlbmZvcmNlbWVudCBncmFudWxhcml0eTogMTBtcwooWEVOKSBsb2FkIHRyYWNraW5nIHdp
bmRvdyBsZW5ndGggMTA3Mzc0MTgyNCBucwooWEVOKSBBZGRpbmcgY3B1IDAgdG8gcnVucXVldWUg
MAooWEVOKSAgRmlyc3QgY3B1IG9uIHJ1bnF1ZXVlLCBhY3RpdmF0aW5nCihYRU4pIEFkZGluZyBj
cHUgMSB0byBydW5xdWV1ZSAwCihYRU4pIG10cnI6IHlvdXIgQ1BVcyBoYWQgaW5jb25zaXN0ZW50
IHZhcmlhYmxlIE1UUlIgc2V0dGluZ3MKKFhFTikgbXRycjogcHJvYmFibHkgeW91ciBCSU9TIGRv
ZXMgbm90IHNldHVwIGFsbCBDUFVzLgooWEVOKSBtdHJyOiBjb3JyZWN0ZWQgY29uZmlndXJhdGlv
bi4KKFhFTikgTVRSUiBkZWZhdWx0IHR5cGU6IHVuY2FjaGFibGUKKFhFTikgTVRSUiBmaXhlZCBy
YW5nZXMgZW5hYmxlZDoKKFhFTikgICAwMDAwMC05ZmZmZiB3cml0ZS1iYWNrCihYRU4pICAgYTAw
MDAtYmZmZmYgdW5jYWNoYWJsZQooWEVOKSAgIGMwMDAwLWZmZmZmIHdyaXRlLXByb3RlY3QKKFhF
TikgTVRSUiB2YXJpYWJsZSByYW5nZXMgZW5hYmxlZDoKKFhFTikgICAwIGJhc2UgMDAwMDAwMDAw
MCBtYXNrIDdmODAwMDAwMDAgd3JpdGUtYmFjawooWEVOKSAgIDEgZGlzYWJsZWQKKFhFTikgICAy
IGRpc2FibGVkCihYRU4pICAgMyBkaXNhYmxlZAooWEVOKSAgIDQgZGlzYWJsZWQKKFhFTikgICA1
IGRpc2FibGVkCihYRU4pICAgNiBkaXNhYmxlZAooWEVOKSAgIDcgZGlzYWJsZWQKKFhFTikgICA4
IGRpc2FibGVkCihYRU4pICAgOSBkaXNhYmxlZAooWEVOKSAgIDEwIGRpc2FibGVkCihYRU4pICAg
MTEgZGlzYWJsZWQKKFhFTikgICAxMiBkaXNhYmxlZAooWEVOKSAgIDEzIGRpc2FibGVkCihYRU4p
ICAgMTQgZGlzYWJsZWQKKFhFTikgICAxNSBkaXNhYmxlZAooWEVOKSBSdW5uaW5nIHN0dWIgcmVj
b3Zlcnkgc2VsZnRlc3RzLi4uCihYRU4pIEZpeHVwICNVRFswMDAwXTogZmZmZjgyZDA3ZmZmZTA0
NCBbZmZmZjgyZDA3ZmZmZTA0NF0gLT4gZmZmZjgyZDA0MDM5MWYxMQooWEVOKSBGaXh1cCAjR1Bb
MDAwMF06IGZmZmY4MmQwN2ZmZmUwNDUgW2ZmZmY4MmQwN2ZmZmUwNDVdIC0+IGZmZmY4MmQwNDAz
OTFmMTEKKFhFTikgRml4dXAgI1NTWzAwMDBdOiBmZmZmODJkMDdmZmZlMDQ0IFtmZmZmODJkMDdm
ZmZlMDQ0XSAtPiBmZmZmODJkMDQwMzkxZjExCihYRU4pIEZpeHVwICNCUFswMDAwXTogZmZmZjgy
ZDA3ZmZmZTA0NSBbZmZmZjgyZDA3ZmZmZTA0NV0gLT4gZmZmZjgyZDA0MDM5MWYxMQooWEVOKSBO
WCAoRXhlY3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uIGFjdGl2ZQooWEVOKSBkMCBoYXMgbWF4aW11
bSA0MTYgUElSUXMKKFhFTikgKioqIEJ1aWxkaW5nIGEgUFYgRG9tMCAqKioKKFhFTikgRUxGOiBw
aGRyOiBwYWRkcj0weDEwMDAwMDAgbWVtc3o9MHgxYjc5MTJjCihYRU4pIEVMRjogcGhkcjogcGFk
ZHI9MHgyYzAwMDAwIG1lbXN6PTB4NzBmMDAwCihYRU4pIEVMRjogcGhkcjogcGFkZHI9MHgzMzBm
MDAwIG1lbXN6PTB4MzkwMDAKKFhFTikgRUxGOiBwaGRyOiBwYWRkcj0weDMzNDgwMDAgbWVtc3o9
MHhlYjgwMDAKKFhFTikgRUxGOiBtZW1vcnk6IDB4MTAwMDAwMCAtPiAweDQyMDAwMDAKKFhFTikg
RUxGOiBub3RlOiBQSFlTMzJfUkVMT0MgYWxpZ246IDB4MjAwMDAwIG1pbjogMHgxMDAwMDAwIG1h
eDogMHgzZmZmZmZmZgooWEVOKSBFTEY6IG5vdGU6IFBIWVMzMl9FTlRSWSA9IDB4MTAwMGIyMAoo
WEVOKSBFTEY6IG5vdGU6IEdVRVNUX09TID0gImxpbnV4IgooWEVOKSBFTEY6IG5vdGU6IEdVRVNU
X1ZFUlNJT04gPSAiMi42IgooWEVOKSBFTEY6IG5vdGU6IFhFTl9WRVJTSU9OID0gInhlbi0zLjAi
CihYRU4pIEVMRjogbm90ZTogVklSVF9CQVNFID0gMHhmZmZmZmZmZjgwMDAwMDAwCihYRU4pIEVM
Rjogbm90ZTogSU5JVF9QMk0gPSAweDgwMDAwMDAwMDAKKFhFTikgRUxGOiBub3RlOiBFTlRSWSA9
IDB4ZmZmZmZmZmY4MzM1OTZhMAooWEVOKSBFTEY6IG5vdGU6IEZFQVRVUkVTID0gIiF3cml0YWJs
ZV9wYWdlX3RhYmxlcyIKKFhFTikgRUxGOiBub3RlOiBQQUVfTU9ERSA9ICJ5ZXMiCihYRU4pIEVM
Rjogbm90ZTogTDFfTUZOX1ZBTElECihYRU4pIEVMRjogbm90ZTogTU9EX1NUQVJUX1BGTiA9IDB4
MQooWEVOKSBFTEY6IG5vdGU6IFBBRERSX09GRlNFVCA9IDAKKFhFTikgRUxGOiBub3RlOiBTVVBQ
T1JURURfRkVBVFVSRVMgPSAweDg4MDEKKFhFTikgRUxGOiBub3RlOiBMT0FERVIgPSAiZ2VuZXJp
YyIKKFhFTikgRUxGOiBub3RlOiBTVVNQRU5EX0NBTkNFTCA9IDB4MQooWEVOKSBFTEY6IGFkZHJl
c3NlczoKKFhFTikgICAgIHZpcnRfYmFzZSAgICAgICAgPSAweGZmZmZmZmZmODAwMDAwMDAKKFhF
TikgICAgIGVsZl9wYWRkcl9vZmZzZXQgPSAweDAKKFhFTikgICAgIHZpcnRfb2Zmc2V0ICAgICAg
PSAweGZmZmZmZmZmODAwMDAwMDAKKFhFTikgICAgIHZpcnRfa3N0YXJ0ICAgICAgPSAweGZmZmZm
ZmZmODEwMDAwMDAKKFhFTikgICAgIHZpcnRfa2VuZCAgICAgICAgPSAweGZmZmZmZmZmODQyMDAw
MDAKKFhFTikgICAgIHZpcnRfZW50cnkgICAgICAgPSAweGZmZmZmZmZmODMzNTk2YTAKKFhFTikg
ICAgIHAybV9iYXNlICAgICAgICAgPSAweDgwMDAwMDAwMDAKKFhFTikgIFhlbiAga2VybmVsOiA2
NC1iaXQsIGxzYgooWEVOKSAgRG9tMCBrZXJuZWw6IDY0LWJpdCwgbHNiLCBwYWRkciAweDEwMDAw
MDAgLT4gMHg0MjAwMDAwCihYRU4pIFBIWVNJQ0FMIE1FTU9SWSBBUlJBTkdFTUVOVDoKKFhFTikg
IERvbTAgYWxsb2MuOiAgIDAwMDAwMDAwNjgwMDAwMDAtPjAwMDAwMDAwNzAwMDAwMDAgKDQzNjM0
MiBwYWdlcyB0byBiZSBhbGxvY2F0ZWQpCihYRU4pICBJbml0LiByYW1kaXNrOiAwMDAwMDAwMDdi
Mzc0MDAwLT4wMDAwMDAwMDdmM2ZmZmY1CihYRU4pIFZJUlRVQUwgTUVNT1JZIEFSUkFOR0VNRU5U
OgooWEVOKSAgTG9hZGVkIGtlcm5lbDogZmZmZmZmZmY4MTAwMDAwMC0+ZmZmZmZmZmY4NDIwMDAw
MAooWEVOKSAgUGh5cy1NYWNoIG1hcDogMDAwMDAwODAwMDAwMDAwMC0+MDAwMDAwODAwMDNiNDgx
MAooWEVOKSAgU3RhcnQgaW5mbzogICAgZmZmZmZmZmY4NDIwMDAwMC0+ZmZmZmZmZmY4NDIwMDRi
OAooWEVOKSAgUGFnZSB0YWJsZXM6ICAgZmZmZmZmZmY4NDIwMTAwMC0+ZmZmZmZmZmY4NDIyNjAw
MAooWEVOKSAgQm9vdCBzdGFjazogICAgZmZmZmZmZmY4NDIyNjAwMC0+ZmZmZmZmZmY4NDIyNzAw
MAooWEVOKSAgVE9UQUw6ICAgICAgICAgZmZmZmZmZmY4MDAwMDAwMC0+ZmZmZmZmZmY4NDQwMDAw
MAooWEVOKSAgRU5UUlkgQUREUkVTUzogZmZmZmZmZmY4MzM1OTZhMAooWEVOKSBEb20wIGhhcyBt
YXhpbXVtIDIgVkNQVXMKKFhFTikgRUxGOiBwaGRyIDAgYXQgMHhmZmZmZmZmZjgxMDAwMDAwIC0+
IDB4ZmZmZmZmZmY4MmI3OTEyYwooWEVOKSBFTEY6IHBoZHIgMSBhdCAweGZmZmZmZmZmODJjMDAw
MDAgLT4gMHhmZmZmZmZmZjgzMzBmMDAwCihYRU4pIEVMRjogcGhkciAyIGF0IDB4ZmZmZmZmZmY4
MzMwZjAwMCAtPiAweGZmZmZmZmZmODMzNDgwMDAKKFhFTikgRUxGOiBwaGRyIDMgYXQgMHhmZmZm
ZmZmZjgzMzQ4MDAwIC0+IDB4ZmZmZmZmZmY4NDIwMDAwMAooWEVOKSBJbml0aWFsIGxvdyBtZW1v
cnkgdmlycSB0aHJlc2hvbGQgc2V0IGF0IDB4NDAwMCBwYWdlcy4KKFhFTikgU2NydWJiaW5nIEZy
ZWUgUkFNIGluIGJhY2tncm91bmQKKFhFTikgU3RkLiBMb2dsZXZlbDogQWxsCihYRU4pIEd1ZXN0
IExvZ2xldmVsOiBBbGwKKFhFTikgKioqIFNlcmlhbCBpbnB1dCB0byBET00wICh0eXBlICdDVFJM
LWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkKKFhFTikgRnJlZWQgNjY0a0IgaW5pdCBt
ZW1vcnkKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDowMC4wCihYRU4pIFBDSSBhZGQgZGV2
aWNlIDAwMDA6MDA6MDEuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjAxLjEKKFhFTikg
UENJIGFkZCBkZXZpY2UgMDAwMDowMDowMi4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6
MDMuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjA0LjAKKFhFTikgUENJIGFkZCBkZXZp
Y2UgMDAwMDowMDowNi4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MDcuMAooWEVOKSBQ
Q0kgYWRkIGRldmljZSAwMDAwOjAwOjBkLjAKKFhFTikgYXJjaC94ODYvcHYvZW11bC1wcml2LW9w
LmM6MTAxNzpkMHYxIFJETVNSIDB4MDAwMDA2NGUgdW5pbXBsZW1lbnRlZAooWEVOKSBhcmNoL3g4
Ni9wdi9lbXVsLXByaXYtb3AuYzoxMDE3OmQwdjEgUkRNU1IgMHgwMDAwMDAzNCB1bmltcGxlbWVu
dGVkCihYRU4pIENQVTE6IE5vIGlycSBoYW5kbGVyIGZvciB2ZWN0b3IgODggKElSUSAtMjE0NzQ4
MzY0OCwgTEFQSUMpCihYRU4pIENQVTE6IE5vIGlycSBoYW5kbGVyIGZvciB2ZWN0b3IgMzAgKElS
USAtMjE0NzQ4MzY0OCwgTEFQSUMpCihYRU4pIENQVTE6IE5vIGlycSBoYW5kbGVyIGZvciB2ZWN0
b3IgYTAgKElSUSAtMjE0NzQ4MzY0OCwgTEFQSUMpCihYRU4pIGFyY2gveDg2L3B2L2VtdWwtcHJp
di1vcC5jOjEwMTc6ZDB2MSBSRE1TUiAweDAwMDAwNjM5IHVuaW1wbGVtZW50ZWQKKFhFTikgYXJj
aC94ODYvcHYvZW11bC1wcml2LW9wLmM6MTAxNzpkMHYxIFJETVNSIDB4MDAwMDA2MTEgdW5pbXBs
ZW1lbnRlZAooWEVOKSBhcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYzoxMDE3OmQwdjEgUkRNU1Ig
MHgwMDAwMDYxOSB1bmltcGxlbWVudGVkCihYRU4pIGFyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5j
OjEwMTc6ZDB2MSBSRE1TUiAweDAwMDAwNjQxIHVuaW1wbGVtZW50ZWQKKFhFTikgYXJjaC94ODYv
cHYvZW11bC1wcml2LW9wLmM6MTAxNzpkMHYxIFJETVNSIDB4MDAwMDA2NGQgdW5pbXBsZW1lbnRl
ZAooWEVOKSBhcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYzoxMDE3OmQwdjEgUkRNU1IgMHgwMDAw
MDYwNiB1bmltcGxlbWVudGVkCihYRU4pIGFyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jOjEwMTc6
ZDB2MCBSRE1TUiAweDAwMDAwNjExIHVuaW1wbGVtZW50ZWQKKFhFTikgYXJjaC94ODYvcHYvZW11
bC1wcml2LW9wLmM6MTAxNzpkMHYwIFJETVNSIDB4MDAwMDA2MzkgdW5pbXBsZW1lbnRlZAooWEVO
KSBhcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYzoxMDE3OmQwdjAgUkRNU1IgMHgwMDAwMDY0MSB1
bmltcGxlbWVudGVkCihYRU4pIGFyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5jOjEwMTc6ZDB2MCBS
RE1TUiAweDAwMDAwNjE5IHVuaW1wbGVtZW50ZWQKKFhFTikgYXJjaC94ODYvcHYvZW11bC1wcml2
LW9wLmM6MTAxNzpkMHYwIFJETVNSIDB4MDAwMDA2NGQgdW5pbXBsZW1lbnRlZAooWEVOKSBjb21t
b24vZ3JhbnRfdGFibGUuYzoxOTA5OmQwdjAgRXhwYW5kaW5nIGQwIGdyYW50IHRhYmxlIGZyb20g
MSB0byAyIGZyYW1lcwo=
--000000000000bdd73a062d2bb21a--

