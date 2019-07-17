Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB656BDE2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 16:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnkbZ-0001Zf-Fy; Wed, 17 Jul 2019 14:08:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q+i/=VO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnkbX-0001Za-Qy
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 14:08:23 +0000
X-Inumbo-ID: 54bb45c0-a89c-11e9-9614-2f6c1dbcdc9f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54bb45c0-a89c-11e9-9614-2f6c1dbcdc9f;
 Wed, 17 Jul 2019 14:08:20 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I6Peqi8BYKTdhrZcaZspr+gPZAC0p/WrekzqpqUwjfop9fZ6WZWjVJM4sdG64qiDDR5jyTK4cB
 DUbL91NGaQx89X/xT8Tr0Q8NtcP044swUEzYMMjm+A5qr7sueRikSIvasBCUlgeaJRB/OoAuvP
 mjQmj4stTWAw7wOgl21I0STKLm3BOyaYctl0lfi5KEYpPN3qNDiez5jibnHFaBJjVoIW/8olhB
 44/SNKKKccBX3aFDmh3jyXNVMbc74JWdWdo3oBVzFrZdOAlPsWrdRzHuqjc0fsIneMBgydpvtA
 bZg=
X-SBRS: 2.7
X-MesageID: 3093707
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,274,1559534400"; 
   d="scan'208";a="3093707"
Date: Wed, 17 Jul 2019 16:08:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190717140810.a5a4bhmm7fb6oah5@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] printf formatter for pci_sbdf_t
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpBcyBwYXJ0IG9mIHNvbWUgUENJIHJlbGF0ZWQgY2xlYW51cCBJJ20gZG9pbmcsIHdo
aWNoIGluY2x1ZGVzCmV4cGFuZGluZyB0aGUgdXNhZ2Ugb2YgcGNpX3NiZGZfdCwgSSdtIGFsc28g
cGxhbm5pbmcgdG8gYWRkIGEgY3VzdG9tCnByaW50ZiBmb3JtYXR0ZXIgZm9yIHBjaV9zYmRmX3Qg
WzBdLCBzbyB0aGF0IGEgU0JERiBjYW4gYmUgcHJpbnRlZAp3aXRob3V0IGhhdmluZyB0byBzcGVj
aWZ5IGZvdXIgZm9ybWF0dGVycyAoYW5kIHBhc3MgZm91ciBwYXJhbWV0ZXJzKQplYWNoIHRpbWUg
KCUwNHg6JTAyeDolMDJ4LiV1KS4KClRoZXJlJ3MgYmVlbiBzb21lIGRlYmF0ZSBvbiB0aGUgcHJl
dmlvdXMgdmVyc2lvbiBhYm91dCB3aGV0aGVyIHRoZQpmb3JtYXR0ZXIgc2hvdWxkIGJlICVwcCBv
ciAlb3AsIGFuZCBJIHdvdWxkIGxpa2UgdG8gc2V0dGxlIG9uIG9uZSBvZgp0aGVtIGJlZm9yZSBz
ZW5kaW5nIGEgbmV3IHZlcnNpb246CgpVc2luZyAlcHAgcHJvczoKIC0gWGVuIGFscmVhZHkgb3Zl
cmxvYWRzIHAgd2l0aCBvdGhlciBjdXN0b20gaW1wbGVtZW50YXRpb25zLgoKVXNpbmcgJXBwIGNv
bnM6CiAtIFBhc3NlcyBhIHBvaW50ZXIgKHdoaWNoIGlzIGFsd2F5cyA2NGIgb24geDg2KSB0byBz
dG9yZSBhCiAgIDMyYml0IHZhbHVlIChTQkRGKS4KIC0gUmVxdWlyZXMgYSBkZXJlZmVyZW5jZSB0
byBhY2Nlc3MgdGhlIHZhbHVlLgoKVXNpbmcgJW9wIHByb3M6CiAtIENhbiBwYXNzIGEgMzJiaXQg
aW50ZWdlciBuYXR1cmFsbHkuCgpVc2luZyAlb3AgY29uczoKIC0gTm8gb3RoZXIgb3ZlcmxvYWRz
IG9mIHRoZSBvIHNwZWNpZmllciBleGlzdHMgc28gZmFyLCBlaXRoZXIgaW4gWGVuCiAgIG9yIGlu
IExpbnV4IEFGQUlLLgoKTXkgZmlyc3QgaW1wbGVtZW50YXRpb24gdXNlZCAlcHAgYmVjYXVzZSBp
dCdzIGlubGluZSB3aXRoIHRoZSBjdXJyZW50Cm92ZXJsb2FkcyBhbHJlYWR5IHByZXNlbnQsIGFu
ZCBwcmludGsgbm90IGJlaW5nIHBlcmZvcm1hbmNlIGNyaXRpY2FsIEkKZG9uJ3Qgc2VlIG11Y2gg
cHJvYmxlbSBpbiB1c2luZyA2NGJpdCB0byBwYXNzIGEgMzJiaXQgdmFsdWUsIG9yIGluCnJlcXVp
cmluZyBhIGRlcmVmZXJlbmNlIHRvIGFjY2VzcyBpdC4gV2UgY291bGQga2VlcCB1c2luZyAlcHAg
YW5kCmNhc3RpbmcgdGhlIHNiZGYgdmFsdWUgdG8gJ3ZvaWQgKicgdG8gYXZvaWQgdGhlIGRlcmVm
ZXJlbmNlLCBidXQgSQpkb24ndCB0aGluayB0aGVyZSdzIG11Y2ggdmFsdWUgb24gZG9pbmcgdGhh
dCwgdGhlIG1vcmUgdGhhdCBjYWxsIHNpdGVzCndvdWxkIG5lZWQgdG8gdXNlIGEgbWFjcm8gdG8g
aGlkZSB0aGUgY2FzdGluZyBhd2F5LgoKQW55d2F5LCBJIHdvdWxkIGxpa2UgdG8gZ2V0IHNvbWUg
Y29uc2Vuc3VzIG9uIHdoaWNoIHBhdGggdG8gZm9sbG93LAplaXRoZXIgJXBwIG9yICVvcCBiZWZv
cmUgc2VuZGluZyBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMuIEknbQpDY2luZyBib3RoIEFu
ZHJldyBhbmQgSmFuIGFzIHRoZXkgaGFkIHN0cm9uZyBvcGluaW9ucywgYW5kIEkgd291bGQKcGVy
c29uYWxseSB2b3RlIGZvciAlcHAgYXMgSSd2ZSBleHByZXNzZWQgYWJvdmUsIGJ1dCBkb24ndCBt
aW5kCmltcGxlbWVudGluZyBzb21ldGhpbmcgZWxzZSBhcyBsb25nIGFzIHRoZXJlJ3MgY29uc2Vu
c3VzIGFuZCBpdCdzIG5vdApnb2luZyB0byBnZXQgc3R1Y2sgb24gYW4gZW5kbGVzcyBhcmd1bWVu
dC4KClRoYW5rcywgUm9nZXIuCgpbMF0gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vMjAxOTA1MTAx
NjEwNTYuNDg2NDgtMS1yb2dlci5wYXVAY2l0cml4LmNvbS8yMDE5MDUxMDE2MTA1Ni40ODY0OC01
LXJvZ2VyLnBhdUBjaXRyaXguY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
