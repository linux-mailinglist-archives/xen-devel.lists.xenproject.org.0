Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF4A24ED8
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 17:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880402.1290477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tecQ6-0004ZC-Gc; Sun, 02 Feb 2025 16:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880402.1290477; Sun, 02 Feb 2025 16:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tecQ6-0004XJ-Dm; Sun, 02 Feb 2025 16:02:02 +0000
Received: by outflank-mailman (input) for mailman id 880402;
 Sun, 02 Feb 2025 16:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TtP=UZ=gmail.com=thouveng@srs-se1.protection.inumbo.net>)
 id 1tecQ4-0004XD-Ou
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 16:02:00 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077e4eeb-e17f-11ef-99a4-01e77a169b0f;
 Sun, 02 Feb 2025 17:01:58 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2a0206590a7so1999333fac.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 08:01:58 -0800 (PST)
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
X-Inumbo-ID: 077e4eeb-e17f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738512117; x=1739116917; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XgBy9IUOvwBfK0uirH0+rNO4BNGC59q1grv9Lx79MWg=;
        b=g3hdxchZKN9eZL9786f/hxjjeZwjjhXc8Ycdiy6Xn+1yhxLXpr3RUQAshDkIvnKL+1
         a64kfTn2lzAPJf9AQKAfBZuhSnYTGaVPibO60difMp5RLRlquM7iegUsEmnJf3DelZ0a
         2AtoV2bXRPdWwmOk5EEbHlD+QI4Z0R1KLJrmzQPzZglRRT07Z5FRjQDyrpx6cSE+/BsC
         4qeFsYZ4vXYltwx2q+3nM7Ma3X9UfQq14CEI8/C32WdDLy/AA8QNV3QzjVPqXT3OeTJf
         MnzPfTXmSjymHm++KaoRHou5M4srQ/neQUvrMpkSHFJwZatWezitsBbMhQFK/1OZ25mU
         XhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738512117; x=1739116917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgBy9IUOvwBfK0uirH0+rNO4BNGC59q1grv9Lx79MWg=;
        b=qoAu+IvMaqASP1s1QRGRk5ZDvb4zUm0JpoC1Neio/SJP1+1kvAilOUVP/AniaeqnVw
         Fx78qLJUsMQ2cG1RQFIDGqYMsOK/gAGxwnrdeQghoGlmoDzwcQoeYnzBP+WlVmsIJM0i
         nUmUVDHY8o84cuRxyUYYctHzkBoSCDnS77t39AcUccHUJ28XPiqiMXvAS+nuobeDRw1q
         7RWFOhZCA8TLlSSlpCWfBuv2lmS6hUul34GVwh/wuHvGifyiTQvFYoHpM+YEeg3zAFs5
         PpRbCXSTGqvD6dwlagE2AXN2kezatnUBUjv/1tjp0RKhuoaGkAoIexbPsuacbmm6vQ7j
         mJbQ==
X-Gm-Message-State: AOJu0YyQ+INAgqK5su6pNWSGtc2QQSMGrzOC821dBthWGnhuBr5kES0z
	BCRp49uQUgohOeoDzhT0VTDCfMmYU+fXUHlowx1mUaEdakX2L3hqWwIpp3ub9c/mcfrROh9Hceb
	bHp+Wwyd/5Ogaz12XfGCTqu/vSjM=
X-Gm-Gg: ASbGnctOt1TOcdl1kRLW7Gr9vp/WkJzGPGvZfqxGp4yQjQ/fWnVAgXQw+OF8UjPPV4+
	33jcHLYkTg2aSY7tamLeAb1B75LST24rcPUjyx2V8Yrule5x1MziCTIlW8zo5Ee0KMgszzqPySQ
	==
X-Google-Smtp-Source: AGHT+IEiI1UTBXhvz7XkKpqn9qvNV/zApzYT2USmTIQ4gviGMlPALRBNHVqA1NpdigpZsXoLaQvqL5rMdNLvTfl60FA=
X-Received: by 2002:a05:6871:a0ca:b0:29e:70c7:a3f7 with SMTP id
 586e51a60fabf-2b32f100b1amr12175483fac.4.1738512116745; Sun, 02 Feb 2025
 08:01:56 -0800 (PST)
MIME-Version: 1.0
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
In-Reply-To: <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
From: Guillaume <thouveng@gmail.com>
Date: Sun, 2 Feb 2025 17:01:20 +0100
X-Gm-Features: AWEUYZkenYMF37OpD_A29UBT_3dwVwx7gF7CFypYh_8hKb4bHck2rO81lsut0Mg
Message-ID: <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
Subject: Re: Xen panic due to xstate mismatch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000028115c062d2ae539"

--00000000000028115c062d2ae539
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes sure I can collect the output. As you said the change is good enough to
start the dom0 without errors (at least no apparent errors :).
```
Xen reports there are maximum 120 leaves and 2 MSRs
Raw policy: 32 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx
  00000000:ffffffff -> 00000016:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000806c1:00020800:f6fa3203:178bfbff
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
  00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
  00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
  00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
  00000006:ffffffff -> 00000004:00000000:00000000:00000000
  00000007:00000000 -> 00000000:208c2569:00000000:30000400
  0000000b:00000000 -> 00000000:00000001:00000100:00000000
  0000000b:00000001 -> 00000001:00000002:00000201:00000000
  0000000d:00000000 -> 00000007:00000000:00000340:00000000
  0000000d:00000002 -> 00000100:00000240:00000000:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:28100800
  80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
  80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
  80000006:ffffffff -> 00000000:00000000:01007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 00003027:00000000:00000000:00000000
 MSRs:
  index    -> value
  000000ce -> 0000000000000000
  0000010a -> 0000000000000000
Host policy: 30 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000806c1:00020800:c6fa2203:178bfbff
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
  00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
  00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
  00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
  00000007:00000000 -> 00000000:208c2549:00000000:30000400
  0000000d:00000000 -> 00000003:00000000:00000240:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:28100800
  80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
  80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
  80000006:ffffffff -> 00000000:00000000:01007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 00003027:00000000:00000000:00000000
 MSRs:
  index    -> value
  000000ce -> 0000000000000000
  0000010a -> 0000000000000000
PV Max policy: 57 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000806c1:00020800:c6f82203:1789cbf5
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
  00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
  00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
  00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
  00000007:00000000 -> 00000002:208c0109:00000000:20000400
  0000000d:00000000 -> 00000003:00000000:00000240:00000000
  80000000:ffffffff -> 80000021:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000123:28100800
  80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
  80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
  80000006:ffffffff -> 00000000:00000000:01007040:00000000
  80000007:ffffffff -> 00000000:00000000:00000000:00000100
  80000008:ffffffff -> 00003027:00000000:00000000:00000000
 MSRs:
  index    -> value
  000000ce -> 0000000000000000
  0000010a -> 0000000010020004
HVM Max policy: 4 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx
 MSRs:
  index    -> value
  000000ce -> 0000000000000000
  0000010a -> 0000000000000000
PV Default policy: 30 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx
  00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
  00000001:ffffffff -> 000806c1:00020800:c6d82203:1789cbf5
  00000002:ffffffff -> 00feff01:000000f0:00000000:00000000
  00000004:00000000 -> 04000121:02c0003f:0000003f:00000000
  00000004:00000001 -> 04000122:01c0003f:0000003f:00000000
  00000004:00000002 -> 04000143:04c0003f:000003ff:00000000
  00000004:00000003 -> 04000163:02c0003f:00003fff:00000004
  00000007:00000000 -> 00000000:208c0109:00000000:20000400
  0000000d:00000000 -> 00000003:00000000:00000240:00000000
  80000000:ffffffff -> 80000008:00000000:00000000:00000000
  80000001:ffffffff -> 00000000:00000000:00000121:28100800
  80000002:ffffffff -> 68743131:6e654720:746e4920:52286c65
  80000003:ffffffff -> 6f432029:54286572:6920294d:31312d37
  80000004:ffffffff -> 37473538:33204020:4730302e:00007a48
  80000006:ffffffff -> 00000000:00000000:01007040:00000000
  80000008:ffffffff -> 00003027:00000000:00000000:00000000
 MSRs:
  index    -> value
  000000ce -> 0000000000000000
  0000010a -> 0000000000000000
HVM Default policy: 4 leaves, 2 MSRs
 CPUID:
  leaf     subleaf  -> eax      ebx      ecx      edx
 MSRs:
  index    -> value
  000000ce -> 0000000000000000
  0000010a -> 0000000000000000
```

Guillaume

On Sun, Feb 2, 2025 at 4:32=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> This is a sanity check that an algorithm in Xen matches hardware.  It is
> only compiled into debug builds by default.
>
> Given that you're running under virtualbox, i have a suspicion as to
> what's wrong.
>
> Can you collect the full `xen-cpuid -p` output from within your
> environment?  I don't believe you're suggested code change is correct, bu=
t
> it will good enough to get these diagnostics.
>
> ~Andrew
>
> On Sun, 2 Feb 2025, 15:32 Guillaume, <thouveng@gmail.com> wrote:
>
>> Hello,
>>
>>  I'd like to report an issue I encountered when building Xen from source=
.
>> To give you some context, During the Xen winter meetup in Grenoble few d=
ays
>> ago, there was a discussion about strengthening collaboration between Xe=
n
>> and academia. One issue raised by a professor was that Xen is harder for
>> students to install and experiment compared to KVM. In response it was
>> mentionned that Debian packages are quite decent. This motivated me to t=
ry
>> installing and playing with Xen myself. While I am familiar with Xen (I
>> work on the XAPI toolstack at Vates) I'm not deeply familiar with its
>> internals, so this seemed like a good learning opportunity and maybe som=
e
>> contents for some blog posts :).
>>
>>  I set up a Debian testing VM on Virtualbox and installed Xen from
>> packages. Everything worked fine: Grub was updated, I rebooted, and I ha=
d a
>> functional Xen setup with xl running in Dom0.
>>  Next I download the last version of Xen from xenbits.org, and built onl=
y
>> the hypervisor (no tools, no stubdom) , using the same configuration as
>> the Debian package (which is for Xen 4.19). After updating GRUB and
>> rebooting, Xen failed to boot. Fortunately, I was able to capture the
>> following error via `ttyS0`:
>> ```
>> (XEN) [0000000d2c23739a] xstate: size: 0x340 and states: 0x7
>> (XEN) [0000000d2c509c1d]
>> (XEN) [0000000d2c641ffa] ****************************************
>> (XEN) [0000000d2c948e3b] Panic on CPU 0:
>> (XEN) [0000000d2cb349bb] XSTATE 0x0000000000000003, uncompressed hw size
>> 0x340 !=3D xen size 0x240
>> (XEN) [0000000d2cfc5786] ****************************************
>> (XEN) [0000000d2d308c24]
>> ```
>> From my understanding, the hardware xstate size (`hw_size`) represents
>> the maximum memory required for the `XSAVE/XRSTOR` save area, while
>> `xen_size` is computed by summing the space required for the enabled
>> features. In `xen/arch/x86/xstate.c`, if these sizes do not match, Xen
>> panics. However, wouldn=E2=80=99t it be correct for `xen_size` to be **l=
ess than
>> or equal to** `hw_size` instead of exactly matching?
>>
>> I tested the following change:
>> ```
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -710,7 +710,7 @@ static void __init check_new_xstate(struct
>> xcheck_state *s, uint64_t new)
>>       */
>>      xen_size =3D xstate_uncompressed_size(s->states & X86_XCR0_STATES);
>>
>> -    if ( xen_size !=3D hw_size )
>> +    if ( xen_size > hw_size )
>>          panic("XSTATE 0x%016"PRIx64", uncompressed hw size %#x !=3D xen
>> size %#x\n",
>>                s->states, hw_size, xen_size);
>> ```
>> With this change, Xen boots correctly, but I may be missing some side
>> effects...
>> Additionally, I am confused as to why this issue does *not* occur with
>> the default Debian Xen package. Even when I rebuild Xen *4.19.1* from
>> source (the same version as the package), I still encounter the issue.
>> So I have two questions:
>> - Is my understanding correct that xen_size <=3D hw_size should be allow=
ed?
>> - Are there any potential side effects of this change?
>> - Bonus: Have some of you any explanations about why does the issue not
>> occur with the packaged version of Xen but does with a self-built versio=
n?
>>
>> Hope I wasn't too long and thanks for taking the time to read this,
>> Best regards,
>>
>> Guillaume
>>
>

--00000000000028115c062d2ae539
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes sure I can collect the output. As you said the ch=
ange is good enough to start the dom0 <span class=3D"gmail-HwtZe" lang=3D"e=
n"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">wi=
thout errors (at least no apparent errors :).</span></span></span><span cla=
ss=3D"gmail-ZSCsVd"></span></div><div>```<br>Xen reports there are maximum =
120 leaves and 2 MSRs<br>Raw policy: 32 leaves, 2 MSRs<br>=C2=A0CPUID:<br>=
=C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0ebx =
=C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>=C2=A0 00000000:ffffffff=
 -&gt; 00000016:756e6547:6c65746e:49656e69<br>=C2=A0 00000001:ffffffff -&gt=
; 000806c1:00020800:f6fa3203:178bfbff<br>=C2=A0 00000002:ffffffff -&gt; 00f=
eff01:000000f0:00000000:00000000<br>=C2=A0 00000004:00000000 -&gt; 04000121=
:02c0003f:0000003f:00000000<br>=C2=A0 00000004:00000001 -&gt; 04000122:01c0=
003f:0000003f:00000000<br>=C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:=
000003ff:00000000<br>=C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003=
fff:00000004<br>=C2=A0 00000006:ffffffff -&gt; 00000004:00000000:00000000:0=
0000000<br>=C2=A0 00000007:00000000 -&gt; 00000000:208c2569:00000000:300004=
00<br>=C2=A0 0000000b:00000000 -&gt; 00000000:00000001:00000100:00000000<br=
>=C2=A0 0000000b:00000001 -&gt; 00000001:00000002:00000201:00000000<br>=C2=
=A0 0000000d:00000000 -&gt; 00000007:00000000:00000340:00000000<br>=C2=A0 0=
000000d:00000002 -&gt; 00000100:00000240:00000000:00000000<br>=C2=A0 800000=
00:ffffffff -&gt; 80000008:00000000:00000000:00000000<br>=C2=A0 80000001:ff=
ffffff -&gt; 00000000:00000000:00000121:28100800<br>=C2=A0 80000002:fffffff=
f -&gt; 68743131:6e654720:746e4920:52286c65<br>=C2=A0 80000003:ffffffff -&g=
t; 6f432029:54286572:6920294d:31312d37<br>=C2=A0 80000004:ffffffff -&gt; 37=
473538:33204020:4730302e:00007a48<br>=C2=A0 80000006:ffffffff -&gt; 0000000=
0:00000000:01007040:00000000<br>=C2=A0 80000007:ffffffff -&gt; 00000000:000=
00000:00000000:00000100<br>=C2=A0 80000008:ffffffff -&gt; 00003027:00000000=
:00000000:00000000<br>=C2=A0MSRs:<br>=C2=A0 index =C2=A0 =C2=A0-&gt; value<=
br>=C2=A0 000000ce -&gt; 0000000000000000<br>=C2=A0 0000010a -&gt; 00000000=
00000000<br>Host policy: 30 leaves, 2 MSRs<br>=C2=A0CPUID:<br>=C2=A0 leaf =
=C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0ebx =C2=A0 =C2=A0=
 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>=C2=A0 00000000:ffffffff -&gt; 000000=
0d:756e6547:6c65746e:49656e69<br>=C2=A0 00000001:ffffffff -&gt; 000806c1:00=
020800:c6fa2203:178bfbff<br>=C2=A0 00000002:ffffffff -&gt; 00feff01:000000f=
0:00000000:00000000<br>=C2=A0 00000004:00000000 -&gt; 04000121:02c0003f:000=
0003f:00000000<br>=C2=A0 00000004:00000001 -&gt; 04000122:01c0003f:0000003f=
:00000000<br>=C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:000003ff:0000=
0000<br>=C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003fff:00000004<=
br>=C2=A0 00000007:00000000 -&gt; 00000000:208c2549:00000000:30000400<br>=
=C2=A0 0000000d:00000000 -&gt; 00000003:00000000:00000240:00000000<br>=C2=
=A0 80000000:ffffffff -&gt; 80000008:00000000:00000000:00000000<br>=C2=A0 8=
0000001:ffffffff -&gt; 00000000:00000000:00000121:28100800<br>=C2=A0 800000=
02:ffffffff -&gt; 68743131:6e654720:746e4920:52286c65<br>=C2=A0 80000003:ff=
ffffff -&gt; 6f432029:54286572:6920294d:31312d37<br>=C2=A0 80000004:fffffff=
f -&gt; 37473538:33204020:4730302e:00007a48<br>=C2=A0 80000006:ffffffff -&g=
t; 00000000:00000000:01007040:00000000<br>=C2=A0 80000007:ffffffff -&gt; 00=
000000:00000000:00000000:00000100<br>=C2=A0 80000008:ffffffff -&gt; 0000302=
7:00000000:00000000:00000000<br>=C2=A0MSRs:<br>=C2=A0 index =C2=A0 =C2=A0-&=
gt; value<br>=C2=A0 000000ce -&gt; 0000000000000000<br>=C2=A0 0000010a -&gt=
; 0000000000000000<br>PV Max policy: 57 leaves, 2 MSRs<br>=C2=A0CPUID:<br>=
=C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0ebx =
=C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>=C2=A0 00000000:ffffffff=
 -&gt; 0000000d:756e6547:6c65746e:49656e69<br>=C2=A0 00000001:ffffffff -&gt=
; 000806c1:00020800:c6f82203:1789cbf5<br>=C2=A0 00000002:ffffffff -&gt; 00f=
eff01:000000f0:00000000:00000000<br>=C2=A0 00000004:00000000 -&gt; 04000121=
:02c0003f:0000003f:00000000<br>=C2=A0 00000004:00000001 -&gt; 04000122:01c0=
003f:0000003f:00000000<br>=C2=A0 00000004:00000002 -&gt; 04000143:04c0003f:=
000003ff:00000000<br>=C2=A0 00000004:00000003 -&gt; 04000163:02c0003f:00003=
fff:00000004<br>=C2=A0 00000007:00000000 -&gt; 00000002:208c0109:00000000:2=
0000400<br>=C2=A0 0000000d:00000000 -&gt; 00000003:00000000:00000240:000000=
00<br>=C2=A0 80000000:ffffffff -&gt; 80000021:00000000:00000000:00000000<br=
>=C2=A0 80000001:ffffffff -&gt; 00000000:00000000:00000123:28100800<br>=C2=
=A0 80000002:ffffffff -&gt; 68743131:6e654720:746e4920:52286c65<br>=C2=A0 8=
0000003:ffffffff -&gt; 6f432029:54286572:6920294d:31312d37<br>=C2=A0 800000=
04:ffffffff -&gt; 37473538:33204020:4730302e:00007a48<br>=C2=A0 80000006:ff=
ffffff -&gt; 00000000:00000000:01007040:00000000<br>=C2=A0 80000007:fffffff=
f -&gt; 00000000:00000000:00000000:00000100<br>=C2=A0 80000008:ffffffff -&g=
t; 00003027:00000000:00000000:00000000<br>=C2=A0MSRs:<br>=C2=A0 index =C2=
=A0 =C2=A0-&gt; value<br>=C2=A0 000000ce -&gt; 0000000000000000<br>=C2=A0 0=
000010a -&gt; 0000000010020004<br>HVM Max policy: 4 leaves, 2 MSRs<br>=C2=
=A0CPUID:<br>=C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=
=A0 =C2=A0ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>=C2=A0MSRs=
:<br>=C2=A0 index =C2=A0 =C2=A0-&gt; value<br>=C2=A0 000000ce -&gt; 0000000=
000000000<br>=C2=A0 0000010a -&gt; 0000000000000000<br>PV Default policy: 3=
0 leaves, 2 MSRs<br>=C2=A0CPUID:<br>=C2=A0 leaf =C2=A0 =C2=A0 subleaf =C2=
=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0ebx =C2=A0 =C2=A0 =C2=A0ecx =C2=A0 =C2=A0 =
=C2=A0edx<br>=C2=A0 00000000:ffffffff -&gt; 0000000d:756e6547:6c65746e:4965=
6e69<br>=C2=A0 00000001:ffffffff -&gt; 000806c1:00020800:c6d82203:1789cbf5<=
br>=C2=A0 00000002:ffffffff -&gt; 00feff01:000000f0:00000000:00000000<br>=
=C2=A0 00000004:00000000 -&gt; 04000121:02c0003f:0000003f:00000000<br>=C2=
=A0 00000004:00000001 -&gt; 04000122:01c0003f:0000003f:00000000<br>=C2=A0 0=
0000004:00000002 -&gt; 04000143:04c0003f:000003ff:00000000<br>=C2=A0 000000=
04:00000003 -&gt; 04000163:02c0003f:00003fff:00000004<br>=C2=A0 00000007:00=
000000 -&gt; 00000000:208c0109:00000000:20000400<br>=C2=A0 0000000d:0000000=
0 -&gt; 00000003:00000000:00000240:00000000<br>=C2=A0 80000000:ffffffff -&g=
t; 80000008:00000000:00000000:00000000<br>=C2=A0 80000001:ffffffff -&gt; 00=
000000:00000000:00000121:28100800<br>=C2=A0 80000002:ffffffff -&gt; 6874313=
1:6e654720:746e4920:52286c65<br>=C2=A0 80000003:ffffffff -&gt; 6f432029:542=
86572:6920294d:31312d37<br>=C2=A0 80000004:ffffffff -&gt; 37473538:33204020=
:4730302e:00007a48<br>=C2=A0 80000006:ffffffff -&gt; 00000000:00000000:0100=
7040:00000000<br>=C2=A0 80000008:ffffffff -&gt; 00003027:00000000:00000000:=
00000000<br>=C2=A0MSRs:<br>=C2=A0 index =C2=A0 =C2=A0-&gt; value<br>=C2=A0 =
000000ce -&gt; 0000000000000000<br>=C2=A0 0000010a -&gt; 0000000000000000<b=
r>HVM Default policy: 4 leaves, 2 MSRs<br>=C2=A0CPUID:<br>=C2=A0 leaf =C2=
=A0 =C2=A0 subleaf =C2=A0-&gt; eax =C2=A0 =C2=A0 =C2=A0ebx =C2=A0 =C2=A0 =
=C2=A0ecx =C2=A0 =C2=A0 =C2=A0edx<br>=C2=A0MSRs:<br>=C2=A0 index =C2=A0 =C2=
=A0-&gt; value<br>=C2=A0 000000ce -&gt; 0000000000000000<br>=C2=A0 0000010a=
 -&gt; 0000000000000000<br>```<br></div><div><br></div><div>Guillaume<br></=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Feb 2, 2025 at 4:32=E2=80=AFPM Andrew Coo=
per &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"auto">This is a sanity check that an algorithm in Xen matche=
s hardware.=C2=A0 It is only compiled into debug builds by default.=C2=A0<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Given that you&#39;re running u=
nder virtualbox, i have a suspicion as to what&#39;s wrong.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Can you collect the full `xen-cpuid -=
p` output from within your environment?=C2=A0 I don&#39;t believe you&#39;r=
e suggested code change is correct, but it will good enough to get these di=
agnostics.</div><div dir=3D"auto"><br></div><div dir=3D"auto">~Andrew</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, 2 Feb 2025, 15:32 Guillaume, &lt;<a href=3D"mailto:thouveng@gmail.c=
om" target=3D"_blank">thouveng@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
div><div><div><div><div><div><div><div><div><div><div>Hello,<br><br></div>=
=C2=A0I&#39;d like to report an issue I encountered when building Xen from =
source. To give you some context, During the Xen winter meetup in Grenoble =
few days ago, there was a discussion about strengthening collaboration betw=
een Xen and academia. One issue raised by a professor was that Xen is harde=
r for students to install and experiment compared to KVM. In response it wa=
s mentionned that Debian packages are quite decent. This motivated me to tr=
y installing and playing with Xen myself. While I am familiar with Xen (I w=
ork on the XAPI toolstack at Vates) I&#39;m not deeply familiar with its in=
ternals, so this seemed like a good learning opportunity and maybe some con=
tents for some blog posts :).<br><br></div>=C2=A0I set up a Debian testing =
VM on Virtualbox and installed Xen from packages. Everything worked fine: G=
rub was updated, I rebooted, and I had a functional Xen setup with xl runni=
ng in Dom0.<br></div>=C2=A0Next I download the last version of Xen from <a =
href=3D"http://xenbits.org" rel=3D"noreferrer" target=3D"_blank">xenbits.or=
g</a>,<span> and</span> built <span>only</span> the hypervisor (no tools, n=
o stubdom) , <span>using</span> the same <span>configuration</span> <span>a=
s</span> the Debian package (which <span>is</span> <span>for</span> Xen <sp=
an>4.19</span>). <span>After</span> updating GRUB <span>and</span> rebootin=
g, Xen failed <span>to</span> boot. Fortunately, I was able <span>to</span>=
 capture the <span>following</span> error via `ttyS0`:</div>```<br>(XEN) [0=
000000d2c23739a] xstate: size: 0x340 and states: 0x7<br>(XEN) [0000000d2c50=
9c1d]<br>(XEN) [0000000d2c641ffa] ****************************************<=
br>(XEN) [0000000d2c948e3b] Panic on CPU 0:<br>(XEN) [0000000d2cb349bb] XST=
ATE 0x0000000000000003, uncompressed hw size 0x340 !=3D xen size 0x240<br>(=
XEN) [0000000d2cfc5786] ****************************************<br>(XEN) [=
0000000d2d308c24]<br>```<br><span>From</span> my understanding, the hardwar=
e xstate size (`hw_size`) represents the maximum memory <span>required</spa=
n> <span>for</span> the `<span>XSAVE</span><span>/XRSTOR` save area, while =
`xen_size` is computed by summing the space required for the enabled featur=
es. In `xen/</span>arch<span>/x86/</span>xstate.c`, <span>if</span> these s=
izes <span>do</span> not match, <span>Xen</span> panics. <span>However</spa=
n>, wouldn=E2=80=99t it be correct <span>for</span> `xen_size` to be <span>=
**</span>less than or equal to<span>**</span> `hw_size` instead of exactly =
matching<span>?<br><br></span></div>I tested the following change:</div>```=
<br>--- a/xen/arch/x86/xstate.c<br>+++ b/xen/arch/x86/xstate.c<br>@@ -710,7=
 +710,7 @@ static void __init check_new_xstate(struct xcheck_state *s, uint=
64_t new)<br>=C2=A0 =C2=A0 =C2=A0 */<br>=C2=A0 =C2=A0 =C2=A0xen_size =3D xs=
tate_uncompressed_size(s-&gt;states &amp; X86_XCR0_STATES);<br><br>- =C2=A0=
 =C2=A0if ( xen_size !=3D hw_size )<br>+ =C2=A0 =C2=A0if ( xen_size &gt; hw=
_size )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic(&quot;XSTATE 0x%016&quot=
;PRIx64&quot;, uncompressed hw size %#x !=3D xen size %#x\n&quot;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;states, hw_size, =
xen_size);<br>```<br></div>With this change, Xen boots correctly, but I may=
 be missing some side effects...<br> Additionally, I am confused as to why =
this issue does <strong>not</strong> occur with the default Debian Xen pack=
age. Even when I rebuild Xen <strong>4.19.1</strong> from source (the same =
version as the package), I still encounter the issue.<br></div><div>So I ha=
ve two questions:<br>- Is my understanding correct that <code>xen_size &lt;=
=3D hw_size</code> should be allowed?<br>- Are there any potential side eff=
ects of this change?<br></div><div>- Bonus: Have some of you any explanatio=
ns about why does the issue not occur with the packaged version of Xen but =
does with a self-built version?</div><br></div>Hope I wasn&#39;t too long a=
nd thanks for taking the time to read this,<br></div>Best regards,<br></div=
><br>Guillaume<br></div>
</div>
</blockquote></div>
</blockquote></div>

--00000000000028115c062d2ae539--

