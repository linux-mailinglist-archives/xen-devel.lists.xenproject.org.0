Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D931CF7BE
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 16:48:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYWCg-00035o-Gm; Tue, 12 May 2020 14:48:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYWCf-00035e-Gy
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:48:17 +0000
X-Inumbo-ID: 9ce8e4ce-945f-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce8e4ce-945f-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589294896;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f/9zfxNObESnNvBeKDkJZHqMMVvQvh9szwVIA2UPEwQ=;
 b=dWIgdzf07HPpi08Ki9KHbkpnE/lhbUttAaG7JnrScyFvayvl3LLQ4s6N
 ywc3t7HPu64EaPMOeuFhL3itzYAPBtY6sFXQFvrNccCT/lZkjSmci6zFU
 FNhpZYe8/TpeUrZQplI7+O0SZl2l52KDAawr+kil6Sp/b9TmsDeUpdLp1 k=;
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
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: m7D3Vy4AYQh2kVocbDNCOZ5G3ChcmdBFJkBd3LZ6tF3cfOzGm5xDO9Ns1y7PlrAt/3EBGxBXjt
 nO86xXpe0RsyjW7Toa65NWKgnfc/wN4yDQw6DyW49ghPmHQ4xiKdLJB2qiGwK1pH3u1PiushXK
 70A6mbpFMkRzCn4KLuPyW2sof/ol/uAVR1V/GM1Kmq8oEshkdn0HK4hOgHwo9SAaAKVOyasYcT
 thqQiJp/mZbEuiaGR2ChSQ/JDfvH7+cwJAJh5cFw9F/ZLrTRSO2IxIdlQlUc/7oF+ibadDnpPp
 2E0=
X-SBRS: 2.7
X-MesageID: 18015676
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="18015676"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 1/3] golang/xenlight: re-track generated go code
Thread-Topic: [PATCH 1/3] golang/xenlight: re-track generated go code
Thread-Index: AQHWHzfOsKEBjrjqSkC89EI6NA5mTKikeMEA
Date: Tue, 12 May 2020 14:48:12 +0000
Message-ID: <772DD16D-DA6B-4009-8B9B-B8187ED06136@citrix.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <2ccb1ae4ffa3f00a13ce303df0e4a44d249861c2.1588282027.git.rosbrookn@ainfosec.com>
In-Reply-To: <2ccb1ae4ffa3f00a13ce303df0e4a44d249861c2.1588282027.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2585D2C045F1D3429F476AA1F543B893@citrix.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Apr 30, 2020, at 10:38 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Commit df669de074c395a3b2eeb975fddd3da4c148da13 un-tracked the generated
> Go code, but it was decided that we actually keep the generated code
> in-tree.
>=20
> Undo the changes to ignore the generated code, and re-generate it.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

