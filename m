Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF27A509DF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 19:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902630.1310666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tptQK-0002Fs-1i; Wed, 05 Mar 2025 18:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902630.1310666; Wed, 05 Mar 2025 18:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tptQJ-0002DG-V3; Wed, 05 Mar 2025 18:24:51 +0000
Received: by outflank-mailman (input) for mailman id 902630;
 Wed, 05 Mar 2025 18:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A9GM=VY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tptQI-0002Bv-5D
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 18:24:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a3efbf2-f9ef-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 19:24:42 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e4d50ed90aso8459464a12.0; 
 Wed, 05 Mar 2025 10:24:40 -0800 (PST)
Received: from [172.20.10.5] (public-gprs377817.centertel.pl. [37.47.107.26])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c43a55e0sm9956954a12.79.2025.03.05.10.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 10:24:38 -0800 (PST)
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
X-Inumbo-ID: 1a3efbf2-f9ef-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741199080; x=1741803880; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kizGuW1y8r26IEy4rhwW4XbhuTNeCtED17MvvM09fUw=;
        b=XiJ8leITbHfD2rP6P3yNHwxGyD9wPB/8+FIrfKZWBATE0ZzaVSikySVS2SwUk4eOqa
         HCYpNQM5vt8oQE1EcTLWPFNZrvBLYsbu15PhmU2TiBoBd6SYukQWC4tnixgL4wyWg2v9
         0Ox6D1qRhWQpG4dUHU7OV8H9oEHpScfAiwUUIJD/1wkANaHPuq0tTGQcWXCdwzXhDRKz
         +AozQcEM67D+Ja5ogsC5wRCii5aM85zdhMHZiGwaS3K4OeoJfroVMxynupc4lS6YplEm
         c4PPYXe5tL7+MwxKdyhL6hFjAffGJy+OKzaOwX8YREpfQsA7nd4OS04qDz5WeKmBA6cd
         WLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199080; x=1741803880;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kizGuW1y8r26IEy4rhwW4XbhuTNeCtED17MvvM09fUw=;
        b=n4LfrMN0fVLdRc+Rh1VfgvZWyzKnK8m0la9UBNyNPdKdXBKgdCmkqbaULVDoSvZWqB
         5nWqMxwGq5LZya2/xjkDriDn1W8LwDoiQXhWTKYXp/lHni1ONKsi2KQkRF/DvEk9rnAR
         17ldJYh5ckyRvGOpixJxnLiOFaVmi8mn1GbiKTgq6mtUhKir9gv8eDIQnTFEF1PlL3Ql
         74yCEtWD1gde1hZ8pmERxmjEMkgcQ2urYIYGx2q8UBS63OIGxDpZuwyUQhSoP0sP2r0O
         UWx39KypJpRy0TZ2vBWtgMWdlZ5EIh9L0cl/4G/y9F1jTFs3+7RRyOAvm3ArFLEoGbXV
         G9/w==
X-Forwarded-Encrypted: i=1; AJvYcCWxZHm/83G9LnGzNQzwcFRB+vjtHEjasjI95ZtDY9ew2+aIhsXteGj2iTLvUK7Z3EAQvOUlFjtpC+P7RzcS@lists.xenproject.org, AJvYcCX/9W62hXzVTlO9BCNyeg3QbKNl/JtdSmZVz1SUADR/mmKHnM+AwX4fH7S8Ko8fO2yH7fCmi5ED59Ug@lists.xenproject.org, AJvYcCXSnqzWPKgBhGamhFQFEXMBFnKw50C89bS4thgUR4vPq250D+Yzio3SBvgJ4+mUv/e79kRdEjCdzsY92/LdKQ==@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDtNo3dqywS16ZaZrAsEjrJLjr5KKAsdKCK4sEtka+wr+Acnah
	B1nlvwh842k3waLEWzP1Kq7aoHZpnW3ahA4howKIKMl7S6QFeo4zCIM4iA==
X-Gm-Gg: ASbGnctEX1oeDzmPue+c6+eScOlCgQbxK1FYN5Ak4slnUjtKHHh5YzH00EHE4fvGdUt
	RHjBpFWuQM/xda2r3AHw3WdwQp68DIBI6K0jjSKh3aX3UyqIQ3ysDg9iRLIrdsK8IMkhnhkPUnP
	XO1YFgeQfYBDhZ/arvOW4NJrtfr1CqcKz0zQ40/hBZ1MmClLRsqnrhWDxL0RbQeHOgmLYkk/X7l
	RxXythGycXOOXbuTuBRU4LFA0DlM4OfhxBYoiwKzy5mSX+oQDQeoV7XtXnAfiGZBx36Z47xrZRp
	LW/i1gb5Qt0TsqciFg/oln0RPO5FrcewdEA/+FzpbauETFLC+yINGaR6IzLt80UL5n2rPpm4tkA
	E1WpokP9amA==
X-Google-Smtp-Source: AGHT+IHel4usX22oqVEEWfsbSa/Wn+fVueF2skW49/SnjX8u5G3c6olM2+oclpnCRn7VjqswcElaDw==
X-Received: by 2002:a05:6402:5c8:b0:5dc:5a34:1296 with SMTP id 4fb4d7f45d1cf-5e59f3d47f1mr4239848a12.16.1741199079156;
        Wed, 05 Mar 2025 10:24:39 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Sfts9e0BljbIB0VHBbBpP0Sh"
Message-ID: <b7ccce46-f546-4edb-a9f4-0197dee3be26@gmail.com>
Date: Wed, 5 Mar 2025 19:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org, advisory-board@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen Project Releases Version 4.20

This is a multi-part message in MIME format.
--------------Sfts9e0BljbIB0VHBbBpP0Sh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

It's with great pleasure that I announce our 4.20 PR release.

I want to thank the whole community for their efforts in getting this
release published!

*Please find the PR article attached here
<https://www.linuxfoundation.org/press/xen-project-announces-xen-420-release 
 >*

Please find the tarball and its signature at:
    https://downloads.xenproject.org/release/xen/4.20.0/

You can also check out the tag in xen.git:
    git://xenbits.xen.org/xen.git RELEASE-4.20.0

Git checkout and build instructions can be found at:
    https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes#Build_Requirements

Release notes can be found at:
    https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes

A summary for 4.20 release documents can be found at:
    https://wiki.xenproject.org/wiki/Category:Xen_4.20

*Some notable features:*
   - *Security Enhancements:*
     - During the 4.20 development window, 8 new Xen Security Advisories (XSAs) were published.
     - Expanded MISRA C compliance: Integrated ECLAIR MISRA C scanner in GitLab CI, enforcing 90
       rules with zero unjustified violations.
     - Enabled UBSAN (Undefined Behaviour Sanitiser) by default for x86, Arm64, RISC-V and PowerPC
       in GitLab CI.
     - Integrated two of our existing fuzzing harnesses into OSSFuzz.
   
  - *Arm*
     - Support for LLC (Last Level Cache) coloring for performance optimizations.
     - Experimental support for Armv8-R.
     - Support for NXP S32G3 Processors Family and LINFlexD UART driver.
     - To enable Xen towards safety certification, 43 requirements have been added.

  - *x86 Architecture:*
     - On Intel CPUs, support the Paging-Write Feature.
     - AMD Zen 5 CPU support, including mitigation for SRSO speculative vulnerability.
     - Improve Xen ability to boot (and reboot) using the default configuration on possibly
       quirky EFI firmware.
     - Switched the xAPIC flat driver to use physical destination mode for external interrupts instead
       of logical destination mode.
     - Remove support for running on Xeon Phi processors.
     - There has been a substantial overhaul to the way in which boot module handling works (part of the
       Hyperlaunch work in progress), and a substantial overhaul to how the 32bit early boot code is built
       and linked (part of the UEFI SecureBoot work in progress).


  - *Other updates:*
    - Fixes in the blkif protocol specification for non-512b sector sizes.
    - Security and performance enhancements: The domain builder in libxenguest no longer un-gzips
      secondary modules, leaving it to the guest kernel.
    - Continued to improve the common/arch code split, including improved bit-operation helpers for bit
      scanning and hamming weight.

Aside from the updates mentioned, I would also like to note that we are
still continue working on the PPC and RISC-V ports.

Best regards,
  Oleksii

Come join the conversation on Matrix:

XenProject:https://matrix.to/#/#XenProject:matrix.org

XenDevel:https://matrix.to/#/#XenDevel:matrix.org

XenSocial:https://matrix.to/#/#XenSocial:matrix.org

--------------Sfts9e0BljbIB0VHBbBpP0Sh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello everyone,

It's with great pleasure that I announce our 4.20 PR release.

I want to thank the whole community for their efforts in getting this
release published!

*Please find the PR article attached here
<a class="moz-txt-link-rfc2396E" href="https://www.linuxfoundation.org/press/xen-project-announces-xen-420-release">&lt;https://www.linuxfoundation.org/press/xen-project-announces-xen-420-release
&gt;</a>*

Please find the tarball and its signature at:
   <a class="moz-txt-link-freetext" href="https://downloads.xenproject.org/release/xen/4.20.0/">https://downloads.xenproject.org/release/xen/4.20.0/</a>

You can also check out the tag in xen.git:
   git://xenbits.xen.org/xen.git RELEASE-4.20.0

Git checkout and build instructions can be found at:
   <a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes#Build_Requirements">https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes#Build_Requirements</a>

Release notes can be found at:
   <a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes">https://wiki.xenproject.org/wiki/Xen_Project_4.20_Release_Notes</a>

A summary for 4.20 release documents can be found at:
   <a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Category:Xen_4.20">https://wiki.xenproject.org/wiki/Category:Xen_4.20</a>

*Some notable features:*
  - *Security Enhancements:*
    - During the 4.20 development window, 8 new Xen Security Advisories (XSAs) were published.
    - Expanded MISRA C compliance: Integrated ECLAIR MISRA C scanner in GitLab CI, enforcing 90
      rules with zero unjustified violations.
    - Enabled UBSAN (Undefined Behaviour Sanitiser) by default for x86, Arm64, RISC-V and PowerPC
      in GitLab CI.
    - Integrated two of our existing fuzzing harnesses into OSSFuzz.
  
 - *Arm*
    - Support for LLC (Last Level Cache) coloring for performance optimizations.
    - Experimental support for Armv8-R.
    - Support for NXP S32G3 Processors Family and LINFlexD UART driver.
    - To enable Xen towards safety certification, 43 requirements have been added. 

 - *x86 Architecture:*
    - On Intel CPUs, support the Paging-Write Feature.
    - AMD Zen 5 CPU support, including mitigation for SRSO speculative vulnerability.
    - Improve Xen ability to boot (and reboot) using the default configuration on possibly
      quirky EFI firmware.
    - Switched the xAPIC flat driver to use physical destination mode for external interrupts instead
      of logical destination mode. 
    - Remove support for running on Xeon Phi processors.
    - There has been a substantial overhaul to the way in which boot module handling works (part of the
      Hyperlaunch work in progress), and a substantial overhaul to how the 32bit early boot code is built
      and linked (part of the UEFI SecureBoot work in progress).


 - *Other updates:*
   - Fixes in the blkif protocol specification for non-512b sector sizes.
   - Security and performance enhancements: The domain builder in libxenguest no longer un-gzips
     secondary modules, leaving it to the guest kernel.
   - Continued to improve the common/arch code split, including improved bit-operation helpers for bit
     scanning and hamming weight.

Aside from the updates mentioned, I would also like to note that we are
still continue working on the PPC and RISC-V ports.

Best regards,
 Oleksii

Come join the conversation on Matrix:

XenProject: <a class="moz-txt-link-freetext" href="https://matrix.to/#/#XenProject:matrix.org">https://matrix.to/#/#XenProject:matrix.org</a>

XenDevel: <a class="moz-txt-link-freetext" href="https://matrix.to/#/#XenDevel:matrix.org">https://matrix.to/#/#XenDevel:matrix.org</a>

XenSocial: <a class="moz-txt-link-freetext" href="https://matrix.to/#/#XenSocial:matrix.org">https://matrix.to/#/#XenSocial:matrix.org</a>

</pre>
  </body>
</html>

--------------Sfts9e0BljbIB0VHBbBpP0Sh--

