Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C17485A3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559216.874017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH39o-0000po-Ui; Wed, 05 Jul 2023 14:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559216.874017; Wed, 05 Jul 2023 14:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH39o-0000n3-Rs; Wed, 05 Jul 2023 14:07:00 +0000
Received: by outflank-mailman (input) for mailman id 559216;
 Wed, 05 Jul 2023 14:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rv0Z=CX=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qH39n-0000YA-4M
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:06:59 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33cfda8d-1b3d-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:06:57 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso7587690e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 07:06:57 -0700 (PDT)
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
X-Inumbo-ID: 33cfda8d-1b3d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688566016; x=1691158016;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dnWhl+MIwE58CJEf3W/jqi5kFqSUl9OafZbr+bDDPvc=;
        b=W3r9wcn+cAMjV5yYdiWTWvABqC4XLzj1drHGLvaArHUAIq12+gGB9/RPVvmzHXSQ+t
         Q2eper1wxnpiIrUf9b37RQHTWm8FLvvXH8KFfkZhTZdpWIHXxsApWgBuv6VxBd1U41zA
         bLbBl5muR86c6Jn/CtFMliyrmUUQaksp80XgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688566016; x=1691158016;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnWhl+MIwE58CJEf3W/jqi5kFqSUl9OafZbr+bDDPvc=;
        b=ilTuSvmn7097pbgRFS9dh7z/lzXDOA4J5UYpDwp8WO+lYLKdr0K9UipAPo62Uqmxzt
         V5nVTQ+tCEiqap5mgj4nSbV0sUQ6LHX03iQdJ8HL+7fFxj0hQx1xJ1lpOATInMozXVs0
         A7V0pFg29HZB2x6+4Y1AcAFdVlnUlH+PR+oPRSAh/prxa3dVQqXQ4z+lxr662BR8GPYj
         ayQG80B2jKCOiF7e0riEfoEyOahzVrck4goBgf+KH2JKLQnMWTFGNuGBRKfeYgPPg+WX
         YOdDlZwWdB9ihIEaVyb7SCVyeSJARxXSs/RCf3AF0FxFXpBgkpb4if1NI2HcKs82qlgN
         xVuA==
X-Gm-Message-State: ABy/qLZ0obbgsmn3I5uxPDWpYChh2SmekcOxZeI9BnSi4Yx08xxtgvLt
	zbkX5BS+MJgCCkS3izJ2L7W2NQ+6rslBX5unHcCFrR+oFxOsVm4IgDM=
X-Google-Smtp-Source: APBJJlHSJhzd1AKgv4k5v/k1N5ze4DbrOnFKQsKqhuAdaVEB6SH1qauphMd4UeKAe7atp3zgLQ+Rvn9gDFF3JIJF3o0=
X-Received: by 2002:a19:7418:0:b0:4f9:5d2a:e0f6 with SMTP id
 v24-20020a197418000000b004f95d2ae0f6mr10781156lfe.14.1688566016329; Wed, 05
 Jul 2023 07:06:56 -0700 (PDT)
MIME-Version: 1.0
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 5 Jul 2023 15:06:45 +0100
Message-ID: <CA+zSX=bCxc4P+FZujuVG5zfLC5ZLXTncU-auV-u2ZYJ5URb40Q@mail.gmail.com>
Subject: NO COMMUNITY CALL for July
To: Xen-devel <xen-devel@lists.xenproject.org>, 
	Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>, 
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	Sergey Dyasli <sergey.dyasli@citrix.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, 
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross <jgross@suse.com>, 
	Paul Durrant <pdurrant@amazon.com>, "Ji, John" <john.ji@intel.com>, 
	"edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, 
	"robin.randhawa@arm.com" <robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, 
	Matt Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?= <cardoe@cardoe.com>, 
	George Dunlap <george.dunlap@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?= <varadgautam@gmail.com>, 
	Brian Woods <brian.woods@xilinx.com>, Robert Townley <rob.townley@gmail.com>, 
	Bobby Eshleman <bobby.eshleman@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?= <cminyard@mvista.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Brendan Kerrigan <brendank310@gmail.com>, Thierry Laurion <insurgo@riseup.net>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Scott Davis <scottwd@gmail.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
	Marc Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming Shen <zshen@exotanium.io>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>, 
	Per Bilse <per.bilse@citrix.com>, Samuel Verschelde <stormi-xcp@ylix.fr>, 
	Andrei Semenov <andrei.semenov@vates.fr>, Yann Dirson <yann.dirson@vates.fr>, 
	Bernhard Kaindl <bernhard.kaindl@cloud.com>, 
	=?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLTHVjYSBGYW5jZWxsdQ==?= <luca.fancellu@arm.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Vikram Garhwal <vikram.garhwal@amd.com>
Content-Type: multipart/alternative; boundary="000000000000956e7b05ffbde94a"

--000000000000956e7b05ffbde94a
Content-Type: text/plain; charset="UTF-8"

Hey all,

Just a reminder, given that we just had the Xen Summit last week, that
there will be no community call this month.  See you next month.

 -George Dunlap

--000000000000956e7b05ffbde94a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all,<div><br></div><div>Just a reminder, given that we=
 just had the Xen Summit last week, that there will be no community call th=
is month.=C2=A0 See you next month.</div><div><br></div><div>=C2=A0-George =
Dunlap</div></div>

--000000000000956e7b05ffbde94a--

