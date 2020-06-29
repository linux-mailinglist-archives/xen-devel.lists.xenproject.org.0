Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91420CD06
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 09:44:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpoSD-00012m-7I; Mon, 29 Jun 2020 07:43:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lswg=AK=tttech.com=prvs=442971002=jan.ruh@srs-us1.protection.inumbo.net>)
 id 1jpoSB-00012g-NC
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 07:43:47 +0000
X-Inumbo-ID: 42669efe-b9dc-11ea-b7bb-bc764e2007e4
Received: from mail2.tttech.com (unknown [217.19.35.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42669efe-b9dc-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 07:43:45 +0000 (UTC)
IronPort-SDR: Yw7sN+iHvdrIz5h4UG1DMyC2gXGNpLOxzQSz+5Bf2nf/yz8DBUQVfzKZXEKEbzH/wNTUCFkw14
 R4pqTEDxPIpT1GeMK/ETE2lBJggDSou4JxQRI+LgmXC/ZaYGV2DGwUjUttn3LHD7m+2EWe7wBD
 dJZbYjPLYvfhi5b6CveRgmc13JGpyKUwhZD7GNjGXTIaPsVCeHBcqPql+jV2x8ZncbEYVhXEIR
 snTJyco5kA6Ak3CE9A2Pg6UGt5Fk0O2YDZfDkXfmb/hGm3Ff3XtL7lcxGYLQWFIPHiHY5NKkSP
 nok=
X-IronPort-AV: E=Sophos;i="5.75,294,1589234400"; d="scan'208,217";a="4641899"
Received: from unknown (HELO mail.tttech.com) ([10.108.0.226])
 by mail2-int.tttech.com with ESMTP; 29 Jun 2020 09:43:44 +0200
Received: from EXVIE02.ds1.internal (10.108.0.226) by EXVIE02.ds1.internal
 (10.108.0.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 29 Jun
 2020 09:43:43 +0200
Received: from EXVIE02.ds1.internal ([fe80::4ccf:d313:b2a8:c054]) by
 EXVIE02.ds1.internal ([fe80::4ccf:d313:b2a8:c054%6]) with mapi id
 15.01.1913.007; Mon, 29 Jun 2020 09:43:43 +0200
From: Jan Ruh <jan.ruh@tttech.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Kernel requires x86-64 CPU, after modifying arch_shared_info struct
Thread-Topic: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Thread-Index: AQHWTehUS5L/6eMJQEyE2773H88H5A==
Date: Mon, 29 Jun 2020 07:43:43 +0000
Message-ID: <6f88fc3e2795436fa1f30dd026dd8eda@tttech.com>
Accept-Language: de-DE, en-GB, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.102.6.20]
Content-Type: multipart/alternative;
 boundary="_000_6f88fc3e2795436fa1f30dd026dd8edatttechcom_"
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_6f88fc3e2795436fa1f30dd026dd8edatttechcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Xen Dev Community,


I ran into an issue when implementing a prototype for a new paravirtualized=
 clock for x86-64 hosts. I extended the arch_shared_info struct by 6 fields=
 totaling at 36 bytes. I updated the xen-foreign/references.size to represe=
nt the new size of the arch_shared_info struct. The fields are correctly up=
dated in Xen and I am also able to read the correct information stored from=
 dom0. However, if I try to start a hvm VM with pvh extensions it does not =
boot telling me that "This kernel requires an x86-64 CPU, but only detected=
 an i686 CPU.". I have rebuild my Linux domU kernel just as the dom0 kernel=
 and everything should be compatible. To me this looks like Xen or libxc do=
es some compatibility checks before booting up my HVM domU and decides to d=
owngrade the detectable CPU due to some issue that I am not aware of. Do I =
miss something? Is my approach to extend the arch_shared_info wrong in the =
first place? I am really thankful for some advice or pointers what is happe=
ning here.


Best


Jan

CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.

--_000_6f88fc3e2795436fa1f30dd026dd8edatttechcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hi Xen Dev Community,</p>
<p><br>
</p>
<p>I ran into an issue when implementing a prototype for a new paravirtuali=
zed clock for x86-64 hosts. I extended the arch_shared_info struct by 6 fie=
lds totaling at 36 bytes.&nbsp;I updated the xen-foreign/references.size to=
 represent the new size of the arch_shared_info
 struct. The fields are correctly updated in Xen and I am also able to read=
 the correct information stored from dom0. However, if I try to start a hvm=
 VM with pvh extensions it does not boot telling me that &quot;This kernel =
requires an x86-64 CPU, but only detected
 an i686 CPU.&quot;. I have rebuild my Linux domU kernel just as the dom0 k=
ernel and everything should be compatible. To me this looks like Xen or lib=
xc does some compatibility checks before booting up my HVM domU and decides=
 to downgrade the detectable CPU due
 to some issue that I am not aware of. Do I miss something? Is my approach =
to extend the arch_shared_info wrong in the first place? I am really thankf=
ul for some advice or pointers what is happening here.</p>
<p><br>
</p>
<p>Best</p>
<p><br>
</p>
<p>Jan<br>
</p>
</div>
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else
 or using it in any unauthorized manner is prohibited and may be unlawful. =
If you receive this e-mail by mistake, please notify the sender and the sys=
tems administrator at straymail@tttech.com immediately.
</body>
</html>

--_000_6f88fc3e2795436fa1f30dd026dd8edatttechcom_--

