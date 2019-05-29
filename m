Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E62E785
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 23:39:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW6FN-0001ru-9r; Wed, 29 May 2019 21:36:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z5B8=T5=gmail.com=jlpoole56@srs-us1.protection.inumbo.net>)
 id 1hW6FM-0001rp-8a
 for xen-devel@lists.xen.org; Wed, 29 May 2019 21:36:32 +0000
X-Inumbo-ID: d1dc3c8e-8259-11e9-8980-bc764e045a96
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d1dc3c8e-8259-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 21:36:30 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id j2so2473467pfe.6
 for <xen-devel@lists.xen.org>; Wed, 29 May 2019 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:from:subject:to:message-id:date:user-agent:mime-version
 :content-language;
 bh=TH74yhptzsiN+8hkhPDVpkT3w2LW8fhBSeGuA6DJJzM=;
 b=vD7bu0hj8IPEcvgM9QYV7c87slkZNaLcwOVcaX50gXz3KhPUCQvwnH+4E9TBn36tSE
 IDgHtwULRulNMvXSvD+gLmzSvIy9yfRgv6W8fDiraxUKfvESRtFTv7NGEnarJrIyPQ36
 jTqHDFOSXI8B7vFPwnCr53xHS/5yCNH8YkoGZGZewYfXBtMcdrI3OezamfDxgiokDdYU
 vsAc1eo3fY1at26q5t/I1ZtrGDl7NyNl9F8HKkQtfIx0mUv1tR2TTAUYgq2ZLJZ+MF4x
 q4i9ruGl64fI+98m2d2rMkwbKtq+6eJ89n2c7BD9vem7JkV2Qerex0Q0mYanfeNdXs12
 PErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:from:subject:to:message-id:date
 :user-agent:mime-version:content-language;
 bh=TH74yhptzsiN+8hkhPDVpkT3w2LW8fhBSeGuA6DJJzM=;
 b=oiLNX5oz/N3dXFpmOiXFdO2tn/sAslTjcB1TNdJT+DlHUO78IUhG1GJQGOvWINyFmw
 QxBS7Vbs5tAzs2cWkjIp4Ohxkv/BwdQ9hDGHO8O9GjIZe5OWYiLglrVXDHZthZN5nc1h
 Rxq5SeDioE+YP92GwfWJZbZ/aByga4RmbjFcIH1nUxH6QyVZUWoDny86/vuX6xQdPZzt
 vwJXRv4aJOHHS0Pth/wN194AvgCtCWXraHk8+qOXZDMb2hVvKf6DQdvMgpfXTNVTqySN
 QtJhKYIhydVdb/m5Fb+XuMkYK9Q0Bko73CDnC2VGJJuRuoPraiuKUnE1pnzY1BYDVbN7
 pUng==
X-Gm-Message-State: APjAAAWRYbkm5YBPWZ7jldRKv3xYJfm1vSpe7lTEVf7/RUEVeBv3zMx1
 Z52x5yZuguiyRKd5HthUfS2ZUcfQ
X-Google-Smtp-Source: APXvYqxpn2pPKj4x6k4/g/lCAj1kmyqwLRcUDiijU2LERMS0DbVHlMNnVqgV4FaavLQVJYlb/s9wrw==
X-Received: by 2002:a62:1885:: with SMTP id 127mr95131659pfy.48.1559165783937; 
 Wed, 29 May 2019 14:36:23 -0700 (PDT)
Received: from [192.168.1.2] (96-65-223-86-static.hfc.comcastbusiness.net.
 [96.65.223.86])
 by smtp.googlemail.com with ESMTPSA id i3sm586306pfa.175.2019.05.29.14.36.23
 for <xen-devel@lists.xen.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 14:36:23 -0700 (PDT)
From: "John L. Poole" <jlpoole56@gmail.com>
To: xen-devel@lists.xen.org
Message-ID: <15101486-c6a3-536d-eddb-52a9cc3731b8@gmail.com>
Date: Wed, 29 May 2019 14:36:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Intel Atom CPU model (C2750) Woes & Debian
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: jlpoole56@gmail.com
Content-Type: multipart/mixed; boundary="===============3657926831312295125=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============3657926831312295125==
Content-Type: multipart/alternative;
 boundary="------------E25D7229DC95FA77AE2C4BF2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E25D7229DC95FA77AE2C4BF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Referencing the expanding the thread I started several months ago entitled
"Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#", I installed a fresh hard
drive on my Supermicro Atom server class unit and did the following:

per: 
https://wiki.xen.org/wiki/Xen_Project_Beginners_Guide#Download_and_Burn_the_Debian_Installer_CD

downloaded: 
http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso
burned CD

on boot had to select UEFI ASUS install, the regular ASUS did not work.
console was blank,
screen attached has graphical image light blue, selected graphical install
proceeded with install.
Reboot.
did NOT perform the suggested: apt-get install firmware-linux-nonfree

performed:
     apt-get install xen-system-amd64
restart.
startup hangs.

So, I had in November of 2016 installed Debian on this then-new server
using:

      debian-8.6.0-amd64-netinst.iso

and then installed Xen using the above instructions.

What I propose to do now is duplicate my steps of November 2016.

If I succeed in launching DOM0 as I did in November/December 2016,
then we'll know this is a software issue.  If I fail, then I'd conclude
there is a hardware problem.  Recall, though I can install a standard
build of Debian 9.9 and Gentoo and the kernels load, it's only when
I have a Xen modified kernel that the boot-up hangs.

I'm not familiar with Debian other than I have easily installed it
before.  What would help me are some pointers to make sure
the Debian 8.6.0 does not go into auto-update mode and to identify and 
select
the Xen packages which were the high watermark in November 2016.

John



--------------E25D7229DC95FA77AE2C4BF2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Referencing the expanding the thread I started several months ago
      entitled<br>
      "Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#", I installed a
      fresh hard<br>
      drive on my Supermicro Atom server class unit and did the
      following:</p>
    <p>per:
<a class="moz-txt-link-freetext" href="https://wiki.xen.org/wiki/Xen_Project_Beginners_Guide#Download_and_Burn_the_Debian_Installer_CD">https://wiki.xen.org/wiki/Xen_Project_Beginners_Guide#Download_and_Burn_the_Debian_Installer_CD</a><br>
      <br>
      downloaded:
<a class="moz-txt-link-freetext" href="http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso">http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso</a><br>
      burned CD<br>
      <br>
      on boot had to select UEFI ASUS install, the regular ASUS did not
      work.<br>
      console was blank,<br>
      screen attached has graphical image light blue, selected graphical
      install<br>
      proceeded with install.<br>
      Reboot.<br>
      did NOT perform the suggested: apt-get install
      firmware-linux-nonfree<br>
      <br>
      performed:<br>
          apt-get install xen-system-amd64<br>
      restart.<br>
      startup hangs.</p>
    <p>So, I had in November of 2016 installed Debian on this then-new
      server<br>
      using:<br>
    </p>
    <p>     debian-8.6.0-amd64-netinst.iso</p>
    <p>and then installed Xen using the above instructions.</p>
    <p>What I propose to do now is duplicate my steps of November 2016.</p>
    <p>If I succeed in launching DOM0 as I did in November/December
      2016,<br>
      then we'll know this is a software issue.  If I fail, then I'd
      conclude<br>
      there is a hardware problem.  Recall, though I can install a
      standard<br>
      build of Debian 9.9 and Gentoo and the kernels load, it's only
      when<br>
      I have a Xen modified kernel that the boot-up hangs.</p>
    <p>I'm not familiar with Debian other than I have easily installed
      it<br>
      before.  What would help me are some pointers to make sure<br>
      the Debian 8.6.0 does not go into auto-update mode and to identify
      and select<br>
      the Xen packages which were the high watermark in November 2016.<br>
    </p>
    <div class="moz-signature"><font size="2"><font face="Verdana">John</font></font><br>
      <p><font size="2" face="Verdana">
          <br>
        </font></p>
    </div>
  </body>
</html>

--------------E25D7229DC95FA77AE2C4BF2--


--===============3657926831312295125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3657926831312295125==--

