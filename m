Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057CB1284
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:59:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8RTl-00045M-5e; Thu, 12 Sep 2019 15:57:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8RTk-00045H-1a
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:57:52 +0000
X-Inumbo-ID: 12bc60c6-d576-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12bc60c6-d576-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568303871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vxL8QMkJl+TNocmkE/kt5VnM6LM/BnvosCLTw3bU3ik=;
 b=VU90/5+CmCexXZ/5N9FcLPyt4fxXQ8Z3y3Qt3LnVbMxE0hdsd+JPNpdd
 V0QMaAAR72/5mXj1v4jZ22I3FJaKksL+raOXKNTm16bcx9C7yQulpmxtj
 qAw2tCAe68jMX6N6/5wW0k93Rw5vP45ZH6CNTMBfeZInXrEvGisAcJEYh 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RPKllUEFts8GSWT8ndPSD8lGGrQhP7iJ7Zi7mtC9Sr0ClKo8zxbc8j9kAlik6u2QA52XtcXgwn
 8pRCoiBeZUfGHxhGkvXHn6NYGRmXUk5l819YQfhLN6o27EjhwJu02l50/Xsxnz3rnr5cDX0ANK
 siMcPJQ0ucksWNhPImtADpKd5Ox6jgcYvmChQDRZyjBWW8e7113pVBEKZWyTah3szTiB5A5p3W
 b8pLJ88qzN+4UJ5EIyot26ABITwT1AFGo64p6de+xMBkyHhqub2+qURbOoEc5U0rsaOxZ/MsPZ
 V6c=
X-SBRS: 2.7
X-MesageID: 5690473
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5690473"
Date: Thu, 12 Sep 2019 17:57:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912155743.jwb6gzqjfjrokh6h@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <f44f12f3-6449-8014-43e4-1f08100be251@suse.com>
 <20190912153147.nhxdrifqney752lc@Air-de-Roger>
 <38a24f1a-9ed4-edb1-a0e2-193170fc6eee@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38a24f1a-9ed4-edb1-a0e2-193170fc6eee@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 9/9] x86: PCID is unused when !PV
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDU6NDg6MTZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDkuMjAxOSAxNzozMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIFNlcCAxMSwgMjAxOSBhdCAwNToyNjo0NlBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBAQCAtMzAxLDggKzMwNSwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3JpdGVfY3I0
KHVuc2lnbmVkIGxvCj4gPj4gIHsKPiA+PiAgICAgIHN0cnVjdCBjcHVfaW5mbyAqaW5mbyA9IGdl
dF9jcHVfaW5mbygpOwo+ID4+ICAKPiA+PiArI2lmZGVmIENPTkZJR19QVgo+ID4+ICAgICAgLyog
Tm8gZ2xvYmFsIHBhZ2VzIGluIGNhc2Ugb2YgUENJRHMgZW5hYmxlZCEgKi8KPiA+PiAgICAgIEFT
U0VSVCghKHZhbCAmIFg4Nl9DUjRfUEdFKSB8fCAhKHZhbCAmIFg4Nl9DUjRfUENJREUpKTsKPiA+
PiArI2Vsc2UKPiA+PiArICAgIEFTU0VSVCghKHZhbCAmIFg4Nl9DUjRfUENJREUpKTsKPiA+IAo+
ID4gVGhhdCBhc3NlcnQgc2VlbXMgcXVpdGUgcG9pbnRsZXNzLCB5b3UgaGF2ZSBzZXQgWDg2X0NS
NF9QQ0lERSB0byAwLCBzbwo+ID4gdGhpcyBpcyBuZXZlciBnb2luZyB0byB0cmlnZ2VyPwo+IAo+
IEkgd2FzIGFib3V0IHRvIGRyb3AgdGhpcywgYnV0IEkgaGF2ZSB0byB0YWtlIGJhY2sgbXkgZWFy
bGllcgo+IHJlcGx5OiBUaGUgI2lmZGVmIHlvdSB0YWxrIGFib3V0IGlzIGluIGZsdXNodGxiLmMs
IHdoZXJlYXMKPiBoZXJlIHdlJ3JlIGluIHByb2Nlc3Nvci5oLgoKT2ggeWVzLCBzb3JyeSBmb3Ig
bm90IHJlYWxpemluZy4gSW4gb3JkZXIgdG8gYXZvaWQgdGhlIGlmZGVmYXJ5IG1heWJlCnlvdSBj
b3VsZCB3cml0ZSB0aGUgYWJvdmUgYXM6CgpBU1NFUlQoKElTX0VOQUJMRUQoQ09ORklHX1BWKSAm
JiAhKHZhbCAmIFg4Nl9DUjRfUEdFKSkgfHwKICAgICAgICEodmFsICYgWDg2X0NSNF9QQ0lERSkp
OwoKSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gdGhvdWdoLCBtYXliZSBteSBwcm9wb3Nl
ZCB2ZXJzaW9uIGlzCmFjdHVhbGx5IGhhcmRlciB0byByZWFkIHRoYW4gdGhlIGlmZGVmJ2VkIG9u
ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
