Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2116BDC4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 10:43:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6WhX-0004eo-Ao; Tue, 25 Feb 2020 09:40:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6WhV-0004ej-EQ
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 09:40:25 +0000
X-Inumbo-ID: d8f6e798-57b2-11ea-92bb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8f6e798-57b2-11ea-92bb-12813bfff9fa;
 Tue, 25 Feb 2020 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582623625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=naEdnvGxYPcOvCyT50rI39wQ2OVd8K+czLDGO/hfLbQ=;
 b=Ztbbqi8MCCOlE8Sh/+k4rOYrDyjw23VwJHVzMAdCUP13MIgCJLZLKJP+
 jt5m9LG8M1zJqK0ZlahmBT6aoby/Eip5cKeAQewLeVDeAtHkU5DERxCfH
 vJxR6A5oYi2WyGMCPq0He8P046/++EHbHYpQ6Y16iPA337Fsen197FqgG o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q2q2/lCzerg6IVlgF9Taw8RS8E7DpKJHboVjUirvl6/igkOx7vY4X56IYW8wkQ9QujDLFzVHnw
 qA/vA9A8oUNR0kd6bIdDsVG/cI68VQkrOjvXz6E/kWJFqnf3SxoE0ar2+i0acaZmnSc0vAoPEL
 GNiHiGiaKtKRqMowYOyOWPVRh4zChL0aZ1q43IhrYemIfgwoWDmECI8RykI1mXPzxf5Kr/OYYN
 /ebrHHk9w5y3ybesllF9Yzfh3bpf2HyM+WgjjiOaMipGo9qc/4ZXgUHdTzD+AIxQ9j9AzLderi
 LwU=
X-SBRS: 2.7
X-MesageID: 12939667
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,483,1574139600"; d="scan'208";a="12939667"
Date: Tue, 25 Feb 2020 10:40:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200225094009.GY4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
 <CABfawhmBdnKj=GCcjwPyL0+_1-5ifYBG_VEwE_YJ8fbPXF1TZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhmBdnKj=GCcjwPyL0+_1-5ifYBG_VEwE_YJ8fbPXF1TZQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDM6MTQ6NTZQTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4gPiA+ICtpbnQgbWVtX3NoYXJpbmdfZm9ya19wYWdlKHN0cnVjdCBkb21haW4g
KmQsIGdmbl90IGdmbiwgYm9vbCB1bnNoYXJpbmcpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgIGlu
dCByYyA9IC1FTk9FTlQ7Cj4gPiA+ID4gKyAgICBzaHJfaGFuZGxlX3QgaGFuZGxlOwo+ID4gPiA+
ICsgICAgc3RydWN0IGRvbWFpbiAqcGFyZW50Owo+ID4gPgo+ID4gPiBDYW4geW91IGNvbnN0aWZ5
IHBhcmVudCwgSSBhc3N1bWUgdGhlcmUgYXJlIG5vIGNoYW5nZXMgbWFkZSB0byB0aGUKPiA+ID4g
cGFyZW50IGRvbWFpbiwganVzdCB0aGUgZm9ya2VkIG9uZS4KPiA+Cj4gPiBTdXJlLgo+IAo+IEFj
dHVhbGx5LCBubyBjYW4ndCBkby4gVGhlIHBhcmVudCBjb3VsZCBnZXQgbW9kaWZpZWQgaGVyZSwg
c2luY2Ugd2UKPiBjb3VsZCBlbmQgdXAgbWFraW5nIHRoZSBwYXJlbnQncyBtZW1vcnkgaW50byBz
aGFyZWQgZW50cmllcy4gU28gdXNpbmcKPiBjb25zdCBoZXJlIGlzIG5vdCBqdXN0aWZpZWQgc2lu
Y2UgdGhlIHBhcmVudCBjYW4gYW5kIGRvZXMgZ2V0Cj4gbW9kaWZpZWQuCgpPaCwgdGhhdCdzIGZp
bmUuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
