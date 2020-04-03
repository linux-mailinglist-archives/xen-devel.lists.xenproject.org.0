Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3519D530
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 12:44:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKJnU-0002BR-HT; Fri, 03 Apr 2020 10:43:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV/t=5T=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jKJnS-0002BM-Vk
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 10:43:35 +0000
X-Inumbo-ID: f70bff40-7597-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f70bff40-7597-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585910613;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tqrHgr3TfceaoT0SIEJ3gkz/24Vy6bsnuZdodHWMsuc=;
 b=aAU+UQ5M08/zs0gRpkNXQ2eVVABbbG5+Syj9rFHjmzoVh1V/IS98q2BL
 PGgCzdSWw9jdHrJTzfXj5f+I5mFn0H3rwNktrgn1JN/JRUFSjeshpMKOz
 93Y8XBp4vVydmCJ1qiUves4UdAgFoUJL5hOCJBXKRl42pDpkY/ZIR2Wxa 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2dlZNTkRsz8G8T3ZHahYS41uXTzP7OoqlFzqN/ffbDPd6mSjO1UtWLLyGrOJpVud6HGeIiIKLv
 F0/Pz0podPwWO/oiM+qKFFVWkx+X09ud6VJUWV1yekiowb/D80a12GF/T3AfMRoIQfSteqyE/L
 ZgFxDQMtFnh/ceVcd8oLwOPyKvHNR3+vLvWKoGcyL0npMEH7V2NSttDIrWUkWERbfQ383ndhFe
 JEqJt0WRjjsdORB/U3I2pzViaOR7I/kZckNgAeKM45FEdW3QT7+i8lZKi8N/mpD6q7rY/I1Zva
 tsY=
X-SBRS: 2.7
X-MesageID: 15785555
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,339,1580792400"; d="scan'208";a="15785555"
From: George Dunlap <George.Dunlap@citrix.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWCRLu2U2EJ1WUk0i1KTanKYKpWqhmDBwAgADpHYCAACByAA==
Date: Fri, 3 Apr 2020 10:43:12 +0000
Message-ID: <76A7BB45-6B4A-46F4-8AD7-9141B3BF9BC4@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
In-Reply-To: <85acdd9fa8248ddb93f2c5792bf5bd41@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8BC56A9351055940B65C057EB3D3EA47@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Xu <xuwei5@hisilicon.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


> On Apr 3, 2020, at 9:47 AM, Marc Zyngier <maz@kernel.org> wrote:
>=20
> On 2020-04-02 19:52, Julien Grall wrote:
>> (+Marc)
>=20
> Thanks for looping me in. Definitely an interesting read, but also a very
> puzzling one.

[snip]

> No. Low latency is a very desirable thing, but it doesn't matter at all w=
hen
> you don't even have functional correctness. To use my favourite car analo=
gy,
> having a bigger engine doesn't help when you're about to hit the wall and
> have no breaks... You just hit the wall faster.

[snip]

> s/imprecise/massively incorrect/

[snip]

> There is just no way I'll ever accept a change to the GIC interrupt state
> machine for Linux. Feel free to try and convince other OS maintainers.

[snip]

> If I was someone developing a product using Xen/ARM, I'd be very worried
> about what you have written above. Because it really reads "we don't care
> about reliability as long as we can show amazing numbers". I really hope
> it isn't what you mean.

What's puzzling to me, is that what everyone else in this thread is that wh=
at Stefano is trying to do is to get Xen to be have like KVM.

Are they wrong?  If so, we can just do whatever Linux does.  If not, then y=
ou need to first turn all your imprecations about correctness, smashing int=
o walls, concern for the sanity of maintainers and so on towards your own c=
ode first.

 -George=

