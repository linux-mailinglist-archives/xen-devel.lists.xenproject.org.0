Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F05B9FB1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 18:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407599.650161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYroG-0000nC-E4; Thu, 15 Sep 2022 16:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407599.650161; Thu, 15 Sep 2022 16:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYroG-0000kF-Af; Thu, 15 Sep 2022 16:33:52 +0000
Received: by outflank-mailman (input) for mailman id 407599;
 Thu, 15 Sep 2022 16:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8UR8=ZS=gmail.com=neilsikka@srs-se1.protection.inumbo.net>)
 id 1oYroE-0000Iy-QE
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 16:33:50 +0000
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d22d68f-3514-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 18:33:50 +0200 (CEST)
Received: by mail-ua1-x931.google.com with SMTP id e3so6915781uax.4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 09:33:49 -0700 (PDT)
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
X-Inumbo-ID: 2d22d68f-3514-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=UZZ52unMNTSmadzO25VS8FGK2YPZOAf7FY2SxJz4H1M=;
        b=NPV1+ct6LByH+hFHUgpWv4IVdPTFJGBdSYdj2fyPREoZgmbwxNnqQJV9CM2n9ObLsu
         dIffmHuVlJpllX9Q76Pkj86J5Pc6SThNrBrrKlAkIqCt0aLjMvveQ5/i9UlwVmGHyTA4
         A6aLT/9bI5INh9P7fk6b8yf8IlpuJLgguFNZ9IPuKKgq2AF/xsqQwGV1RFGS0fhYYRp7
         VGrCm8nzIYRDO6zmbZvpIqlWvCZ3bjG4uuggJhb/eu0SU3xP5DazL0CeCkjyl09b98az
         ESmweY1dhv8D9HUob7T39GcxGdeQRnXuGwWeJSpoqMyqXSOQnBVtKZdh3FPmSIgPlriC
         94yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=UZZ52unMNTSmadzO25VS8FGK2YPZOAf7FY2SxJz4H1M=;
        b=3qH0m+AyPeg/+4+lRuu/jH7JVoCTlP8Xe6WzLl+ujA0TFKA3RTIw/cz7o8PV3pqYRl
         NYfb40EfNLY5HF96JZCi+x83jatd6nCrf08l/yDhyy1e9tmdnmSnHpjJICxohtYFTKqr
         0ewE8LIbv7OC2F/VOI3O2GpepfsuYZJwfVBgZ7MXnoS8uYS9F1zPlxzmF0WKdmqlBo6P
         XRz0HoYz8FB0xymE4VAk3lCkX7dWoa12UnqpbKuGKI15cq5C1xcNJI5OjqtqY8+jdAd7
         +tWHMQdWShfl+v6ASGgGBirm3hRy+2eIiztnkEJAZ5UCwVsPfEKl68GSzhDgWNlgxeGK
         JobQ==
X-Gm-Message-State: ACrzQf17hrAnagkBddYuvPeDlExUmB4TN6qNM0HZF/dAhwMH4t/jvhjc
	rmj4aV0YiInxnjt5jcDL3+bYG6h/6MiC7u+E4M6owabPyHg=
X-Google-Smtp-Source: AMsMyM7q71h2cJ+APruZwn6D+Eg8x9dJNVV9BX0BH9r3Pw0GyVdzyWOf46dZ8sK9b81xKHc4G7GooMsg4RSGqZGpusE=
X-Received: by 2002:ab0:2a96:0:b0:39f:749c:cf9f with SMTP id
 h22-20020ab02a96000000b0039f749ccf9fmr304280uar.21.1663259628381; Thu, 15 Sep
 2022 09:33:48 -0700 (PDT)
MIME-Version: 1.0
From: Neil Sikka <neilsikka@gmail.com>
Date: Thu, 15 Sep 2022 12:33:37 -0400
Message-ID: <CAHPMNWcL=te17jVOCE5896whZTyeg2bmw_iUR-F6iz53y9bqPA@mail.gmail.com>
Subject: Crash when writing to x86 hardware debug registers
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000051aa0a05e8b9cf7f"

--00000000000051aa0a05e8b9cf7f
Content-Type: text/plain; charset="UTF-8"

Hi All,
I am running a userland debugger in Windows 10 HVM on Xen 4.16 on an Intel
chip. I noticed when I set a hardware breakpoint (which writes to the DR0
register), Windows 10 crashes. This crash reproduces both with and without
viridian enabled in the DomU cfg file.

(XEN) Xen version 4.16.1 (neil@) (gcc (Debian 10.2.1-6) 10.2.1 20210110)
debug=n Tue Apr 19 11:20:04 EDT 2022
(XEN) d13v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff8007f85562c 0 0

This output from xl dmesg shows that I am not running a debug hypervisor,
and that theres a viridian crash. I've gotten the following stop codes in
the BSOD from Windows: KMODE EXCEPTION NOT HANDLED, SYSTEM_SERVICE
EXCEPTION.

I see this code in xen/xen/arch/x86/msr.c inside guest_wrmsr():
    case MSR_AMD64_DR0_ADDRESS_MASK:
    case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
        if ( !cp->extd.dbext )
            goto gp_fault;

I was assuming AMD64 refers to a 64 bit CPU rather than an AMD CPU, and
this is one of the few references I found to DR0, and I saw a deliberate
fault raised if dbext is not set. However I'm told that dbext is unrelated,
set by default and does not need to be set at hypervisor compile time.

Any ideas why I'm getting this crash?

Thanks in Advance,
Neil

-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

--00000000000051aa0a05e8b9cf7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div>I am running a userland debugger in=
 Windows 10 HVM on Xen 4.16 on an Intel chip. I noticed when I set a hardwa=
re breakpoint (which writes to the DR0 register), Windows 10 crashes. This =
crash reproduces both with and without viridian enabled in the DomU cfg fil=
e.</div><div><br></div><div>(XEN) Xen version 4.16.1 (neil@) (gcc (Debian 1=
0.2.1-6) 10.2.1 20210110) debug=3Dn Tue Apr 19 11:20:04 EDT 2022<br></div><=
div>(XEN) d13v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff8007f85562c 0 0<br=
></div><div><br></div>This output from xl dmesg shows that I am not running=
 a debug hypervisor, and that theres a viridian crash. I&#39;ve gotten the =
following stop codes in the BSOD from Windows:=C2=A0KMODE EXCEPTION NOT HAN=
DLED, SYSTEM_SERVICE EXCEPTION.<div><br></div><div>I see this code in=C2=A0=
xen/xen/arch/x86/msr.c inside guest_wrmsr():</div><div>=C2=A0 =C2=A0 case M=
SR_AMD64_DR0_ADDRESS_MASK:<br>=C2=A0 =C2=A0 case MSR_AMD64_DR1_ADDRESS_MASK=
 ... MSR_AMD64_DR3_ADDRESS_MASK:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !cp-&g=
t;extd.dbext )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto gp_fault;<=
br></div><div><br></div><div>I was assuming AMD64 refers to a 64 bit CPU ra=
ther than an AMD CPU, and this is one of the few references I found to DR0,=
 and I saw a deliberate fault raised if dbext is not set. However I&#39;m t=
old that dbext is unrelated, set by default and does not need to be set at =
hypervisor compile time.</div><div><br></div><div>Any ideas why I&#39;m get=
ting this crash?<br clear=3D"all"><div><br></div><div>Thanks in Advance,</d=
iv><div>Neil</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div>My Blog: <a href=3D"http://=
www.neilscomputerblog.blogspot.com/" target=3D"_blank">http://www.neilscomp=
uterblog.blogspot.com/</a></div><div>Twitter: @neilsikka</div></div></div><=
/div>

--00000000000051aa0a05e8b9cf7f--

