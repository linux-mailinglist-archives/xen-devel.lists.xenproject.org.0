Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E45BA1B4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 22:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407656.650227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYv6S-0000iR-N0; Thu, 15 Sep 2022 20:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407656.650227; Thu, 15 Sep 2022 20:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYv6S-0000ge-Jq; Thu, 15 Sep 2022 20:04:52 +0000
Received: by outflank-mailman (input) for mailman id 407656;
 Thu, 15 Sep 2022 20:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8UR8=ZS=gmail.com=neilsikka@srs-se1.protection.inumbo.net>)
 id 1oYv6R-0000gX-Cu
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 20:04:51 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a74fc9fb-3531-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 22:04:50 +0200 (CEST)
Received: by mail-vk1-xa2b.google.com with SMTP id s12so2951582vkn.11
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 13:04:50 -0700 (PDT)
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
X-Inumbo-ID: a74fc9fb-3531-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=kbbeEAOlwLSV7w9n5pXFIfd9Vc0gpzZdqJ4FeejGH8U=;
        b=WlDVLYP+/jwjzUBVOMZTORS328sjM9LNs+6ky71SlCCQ7pqvW1+SoKKcTxKPZizV7u
         KmEIBz9IbcoQ9xIK9cW5dKHQ9s5qOB8tWJ0YiiQWvK8yqpItfGM4eHo3B1ngA1p+YM8V
         GYWtD/XOJi76vWtQOdHMygF8X07RD1F8KxVsiuj4vMbQw5Rh21MTiWkSheRvhYNNkTFS
         VR5sSkKsU8wZWjqi0cXaC9LLezOly49kd0n9r2lzHpMt2wVYSFgRu0E8XE2xVLJ7mGAs
         DUW2q+YzvZLpa/6UvIAaPisQnna4EtbUwk0YcgNZ8ugxhKQMeySqKDq4CfFUTf9KKx+Y
         GU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kbbeEAOlwLSV7w9n5pXFIfd9Vc0gpzZdqJ4FeejGH8U=;
        b=6L8DB2Pbv785mdpaOqXQ74jGjLsu/67lcKR+T2kiY868Nrg3lWzS6zAYwma7hcdnCn
         zHZhk8bjJ31wRha9Dk2+8NFp8SnKQ0ZahSHUgU+4ki/1bqqUslQTC9jpoVziVBWZBvOD
         I9VKsiNwZKqUWR796nC1eWMFkehBUGYEtvwwNzvZxVDBhIWu4EZiQbXjZjVX1mU2g7Bx
         6pu1tp4OQn3wslocVN2sL/jbBfn8A+63cH09I/+R1gQ8eKiFu/3XiKX/RcofbZOQ37VV
         u/UOh2+Zd9oIvJf8JxQo6LPCRCBrNtB/yeAaPP0fIbuiYMoGnPIS2BMoe5ESPdihX63J
         VKfw==
X-Gm-Message-State: ACrzQf0Qxr8/qYi+29W3mTuXNpdgP9yyEJj2xpubLFBSBmUqmvHxmbKQ
	MeQXKtzA4IeBBAsaFjGvl/aP2flOu+n/cotEsKVj1Ty8gaU=
X-Google-Smtp-Source: AMsMyM7yCee1QfgectWtvhZvOyK2thkHqoZJ8kJBN7JD77zdHRd2JqT/DkDpEpDfZU4RRcv2g0BEHZKr4X+BSuYJWKE=
X-Received: by 2002:a05:6122:d83:b0:39d:fe61:2a27 with SMTP id
 bc3-20020a0561220d8300b0039dfe612a27mr914542vkb.1.1663272288750; Thu, 15 Sep
 2022 13:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcL=te17jVOCE5896whZTyeg2bmw_iUR-F6iz53y9bqPA@mail.gmail.com>
In-Reply-To: <CAHPMNWcL=te17jVOCE5896whZTyeg2bmw_iUR-F6iz53y9bqPA@mail.gmail.com>
From: Neil Sikka <neilsikka@gmail.com>
Date: Thu, 15 Sep 2022 16:04:38 -0400
Message-ID: <CAHPMNWc49vW9Hy+7WDHK924J0wG-EOPjoT+wXswqy0qj-uCReQ@mail.gmail.com>
Subject: Re: Crash when writing to x86 hardware debug registers
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000ef926b05e8bcc1e0"

--000000000000ef926b05e8bcc1e0
Content-Type: text/plain; charset="UTF-8"

Update: I rebuilt the hypervisor binary in debug mode and get the following
output in xl dmesg after the crash.

(XEN) HVM9 restore: CPU 0
(XEN) HVM9 restore: PIC 0
(XEN) HVM9 restore: PIC 1
(XEN) HVM9 restore: IOAPIC 0
(XEN) HVM9 restore: LAPIC 0
(XEN) HVM9 restore: LAPIC_REGS 0
(XEN) HVM9 restore: PCI_IRQ 0
(XEN) HVM9 restore: ISA_IRQ 0
(XEN) HVM9 restore: PCI_LINK 0
(XEN) HVM9 restore: PIT 0
(XEN) HVM9 restore: RTC 0
(XEN) HVM9 restore: HPET 0
(XEN) HVM9 restore: PMTIMER 0
(XEN) HVM9 restore: MTRR 0
(XEN) HVM9 restore: VIRIDIAN_DOMAIN 0
(XEN) HVM9 restore: CPU_XSAVE 0
(XEN) HVM9 restore: VIRIDIAN_VCPU 0
(XEN) HVM9 restore: VMCE_VCPU 0
(XEN) HVM9 restore: TSC_ADJUST 0
(XEN) HVM9 restore: CPU_MSR 0
(XEN) d9: VIRIDIAN MSR_TIME_REF_COUNT: accessed
(XEN) vmx.c:3295:d9v0 RDMSR 0x00000000 unimplemented
(XEN) d9v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80575bc362c 0 0

On Thu, Sep 15, 2022 at 12:33 PM Neil Sikka <neilsikka@gmail.com> wrote:

> Hi All,
> I am running a userland debugger in Windows 10 HVM on Xen 4.16 on an Intel
> chip. I noticed when I set a hardware breakpoint (which writes to the DR0
> register), Windows 10 crashes. This crash reproduces both with and without
> viridian enabled in the DomU cfg file.
>
> (XEN) Xen version 4.16.1 (neil@) (gcc (Debian 10.2.1-6) 10.2.1 20210110)
> debug=n Tue Apr 19 11:20:04 EDT 2022
> (XEN) d13v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff8007f85562c 0 0
>
> This output from xl dmesg shows that I am not running a debug hypervisor,
> and that theres a viridian crash. I've gotten the following stop codes in
> the BSOD from Windows: KMODE EXCEPTION NOT HANDLED, SYSTEM_SERVICE
> EXCEPTION.
>
> I see this code in xen/xen/arch/x86/msr.c inside guest_wrmsr():
>     case MSR_AMD64_DR0_ADDRESS_MASK:
>     case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
>         if ( !cp->extd.dbext )
>             goto gp_fault;
>
> I was assuming AMD64 refers to a 64 bit CPU rather than an AMD CPU, and
> this is one of the few references I found to DR0, and I saw a deliberate
> fault raised if dbext is not set. However I'm told that dbext is unrelated,
> set by default and does not need to be set at hypervisor compile time.
>
> Any ideas why I'm getting this crash?
>
> Thanks in Advance,
> Neil
>
> --
> My Blog: http://www.neilscomputerblog.blogspot.com/
> Twitter: @neilsikka
>


-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

--000000000000ef926b05e8bcc1e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Update: I rebuilt the hypervisor binary in debug mode and =
get the following output in xl dmesg after the crash.<div><br></div><div><s=
pan style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0)">(XEN) =
HVM9 restore: CPU 0
</span><br>(XEN) HVM9 restore: PIC 0
<br>(XEN) HVM9 restore: PIC 1
<br>(XEN) HVM9 restore: IOAPIC 0
<br>(XEN) HVM9 restore: LAPIC 0
<br>(XEN) HVM9 restore: LAPIC_REGS 0
<br>(XEN) HVM9 restore: PCI_IRQ 0
<br>(XEN) HVM9 restore: ISA_IRQ 0
<br>(XEN) HVM9 restore: PCI_LINK 0
<br>(XEN) HVM9 restore: PIT 0
<br>(XEN) HVM9 restore: RTC 0
<br>(XEN) HVM9 restore: HPET 0
<br>(XEN) HVM9 restore: PMTIMER 0
<br>(XEN) HVM9 restore: MTRR 0
<br>(XEN) HVM9 restore: VIRIDIAN_DOMAIN 0
<br>(XEN) HVM9 restore: CPU_XSAVE 0
<br>(XEN) HVM9 restore: VIRIDIAN_VCPU 0
<br>(XEN) HVM9 restore: VMCE_VCPU 0
<br>(XEN) HVM9 restore: TSC_ADJUST 0
<br>(XEN) HVM9 restore: CPU_MSR 0
<br>(XEN) d9: VIRIDIAN MSR_TIME_REF_COUNT: accessed
<br>(XEN) vmx.c:3295:d9v0 RDMSR 0x00000000 unimplemented
<br>(XEN) d9v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80575bc362c 0 0<br>=
</span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Sep 15, 2022 at 12:33 PM Neil Sikka &lt;<a href=3D"mai=
lto:neilsikka@gmail.com">neilsikka@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi All,</=
div><div>I am running a userland debugger in Windows 10 HVM on Xen 4.16 on =
an Intel chip. I noticed when I set a hardware breakpoint (which writes to =
the DR0 register), Windows 10 crashes. This crash reproduces both with and =
without viridian enabled in the DomU cfg file.</div><div><br></div><div>(XE=
N) Xen version 4.16.1 (neil@) (gcc (Debian 10.2.1-6) 10.2.1 20210110) debug=
=3Dn Tue Apr 19 11:20:04 EDT 2022<br></div><div>(XEN) d13v0 VIRIDIAN CRASH:=
 1e ffffffffc0000096 fffff8007f85562c 0 0<br></div><div><br></div>This outp=
ut from xl dmesg shows that I am not running a debug hypervisor, and that t=
heres a viridian crash. I&#39;ve gotten the following stop codes in the BSO=
D from Windows:=C2=A0KMODE EXCEPTION NOT HANDLED, SYSTEM_SERVICE EXCEPTION.=
<div><br></div><div>I see this code in=C2=A0xen/xen/arch/x86/msr.c inside g=
uest_wrmsr():</div><div>=C2=A0 =C2=A0 case MSR_AMD64_DR0_ADDRESS_MASK:<br>=
=C2=A0 =C2=A0 case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MAS=
K:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !cp-&gt;extd.dbext )<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto gp_fault;<br></div><div><br></div><div=
>I was assuming AMD64 refers to a 64 bit CPU rather than an AMD CPU, and th=
is is one of the few references I found to DR0, and I saw a deliberate faul=
t raised if dbext is not set. However I&#39;m told that dbext is unrelated,=
 set by default and does not need to be set at hypervisor compile time.</di=
v><div><br></div><div>Any ideas why I&#39;m getting this crash?<br clear=3D=
"all"><div><br></div><div>Thanks in Advance,</div><div>Neil</div><div><br><=
/div>-- <br><div dir=3D"ltr"><div>My Blog: <a href=3D"http://www.neilscompu=
terblog.blogspot.com/" target=3D"_blank">http://www.neilscomputerblog.blogs=
pot.com/</a></div><div>Twitter: @neilsikka</div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div>My Blog: <a href=3D"http://www.neilscompute=
rblog.blogspot.com/" target=3D"_blank">http://www.neilscomputerblog.blogspo=
t.com/</a></div><div>Twitter: @neilsikka</div></div>

--000000000000ef926b05e8bcc1e0--

