Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AE10AC8C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:21:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtTi-0006qt-Ty; Wed, 27 Nov 2019 09:19:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZtTh-0006qo-MR
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:19:17 +0000
X-Inumbo-ID: fc336ac2-10f6-11ea-a55d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc336ac2-10f6-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574846357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U7POTuR7NU8ClviOrwIl/bsHlvUT52GQRqSsjL/0tXU=;
 b=CT2NsXPEgkosCHIcj3/6VjkkQcyveCEY2x1uKmmMJPU+N4338gHrIYRG
 BR29gWg5NElUPivB14v78loAjNKwvzuteVbo3H8V4BeOisL4RCfH+voEj
 FkPiKN9Lx0cXnlmngM45EeLJEEwvmSmGefdKu+DHta9pHWhnw4HLScARg Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4PhC1/brODB0Klm+LEZF/tF36VDq4tNqnZfaKyypcSWcdWz6qdgn9SD3PLLLyx4jxqMZcmdMTC
 G2G53UpgCb7zK5FsFA9xQt2PhJHjc1TDpEKi3qVZWOg/ugbkyEs7e8aw79VeeXTGAq5Hj/Jswe
 TEPKckCCrV5OfSNgNZXsiFKdsd7Wcmp3VSxSNsH/RA9SR6ObmFWqw1q6BYzA+58DMHPpoTfBA4
 3SHLCfhMmaOqSIt+4rAgRICRJyIeMfzzADy9GvSbqFLroml7riPyEahrlCWs5a6euea5Orz90w
 HXw=
X-SBRS: 2.7
X-MesageID: 9307106
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,248,1571716800"; 
   d="scan'208";a="9307106"
Date: Wed, 27 Nov 2019 10:19:10 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191127091910.GL980@Air-de-Roger>
References: <20191126150112.12704-1-andrew.cooper3@citrix.com>
 <20191126150112.12704-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126150112.12704-2-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] AMD/IOMMU: Always print IOMMU errors
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6MDE6MTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBVbmhhbmRsZWQgSU9NTVUgZXJyb3JzIChpLmUuIG5vdCBJT19QQUdFX0ZBVUxUKSBz
aG91bGQgc3RpbGwgYmUgcHJpbnRlZCwgYW5kCj4gbm90IGhpZGRlbiBiZWhpbmQgaW9tbXU9ZGVi
dWcuCj4gCj4gV2hpbGUgYWRqdXN0aW5nIHRoaXMsIGZhY3RvciBvdXQgdGhlIHN5bWJvbGljIG5h
bWUgaGFuZGxpbmcgdG8ganVzdCBvbmUKPiBsb2NhdGlvbiBleHBvc2luZyBpdHMgb2ZmLWJ5LW9u
ZSBuYXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbWk+CgpMR1RNOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKSSB3b25kZXIgaG93ZXZlciB3aGV0aGVyIFhFTkxPR19HX0VS
UiBzaG91bGQgYmUgdXNlZCBpbnN0ZWFkIG9mClhFTkxPR19FUlIgaW4gb3JkZXIgdG8gcmF0ZSBs
aW1pdCBJT01NVSBmYXVsdHMgdHJpZ2dlcmVkIGJ5IGd1ZXN0cy4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
