Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648058371
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 15:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgUQP-0002hM-5j; Thu, 27 Jun 2019 13:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgUQO-0002hC-13
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 13:26:52 +0000
X-Inumbo-ID: 3769b76c-98df-11e9-9a5d-dfd752915e68
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3769b76c-98df-11e9-9a5d-dfd752915e68;
 Thu, 27 Jun 2019 13:26:49 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bRPnCrBdWzDjMdPVdA1tNjlyrJt7vD1FrJN/bTQC32lGoxLlY2OoDuBFGB0na+eC37kYV1XKQA
 /NElTRzbx2K4JvEnwrIB/RrgXX6pjyjZV5hgk6Z+DSJ0IlacPDROw7ijAj9Ldq0kzo5UjVtdAt
 oJg8EQjOIAOktkQvv8sSdOAew7HHy5Q+KCilaDFarSzAHDsGoKp9jp7A5YZQMqCkbRSbDLmUi1
 3k82UDAMwSrtFKid8gDoFoc5P6eqKHLtiHr6bX3k5GHgrKFkkypLhkqg3RSjH7EkDtk3VAkR0y
 Fkc=
X-SBRS: 2.7
X-MesageID: 2327062
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2327062"
Date: Thu, 27 Jun 2019 15:26:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190627132638.vhwmlmb25wpbl5lm@MacBook-Air-de-Roger.local>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <20190627093335.56355-2-roger.pau@citrix.com>
 <37ca0dbd-cf76-3f2e-3c67-a381cb7da07b@citrix.com>
 <5D14A792020000780023B84B@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D14A792020000780023B84B@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/3] xen/link: handle .init.rodata.cst*
 sections in the linker script
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDU6MjU6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA2LjE5IGF0IDEyOjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAyNy8wNi8yMDE5IDEwOjMzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gPj4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwo+ID4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMKPiA+PiBAQCAtMTU2LDYgKzE1Niw3IEBAIFNFQ1RJT05TCj4gPj4gICAgICAg
ICAqKC5pbml0LnJvZGF0YSkKPiA+PiAgICAgICAgICooLmluaXQucm9kYXRhLnJlbCkKPiA+PiAg
ICAgICAgICooLmluaXQucm9kYXRhLnN0ciopCj4gPj4gKyAgICAgICAqKC5pbml0LnJvZGF0YS5j
c3QqKQo+ID4gCj4gPiAuLi4gLmluaXQgaXMganVzdCBhIGdyb3VwaW5nIHByZWZpeCwgc28gSSdk
IHJlY29tbWVuZCB0aGF0IHdlIHRyZWF0Cj4gPiAuaW5pdC5yb2RhdGEgaW4gZXhhY3RseSB0aGUg
c2FtZSB3YXkgYXMgd2UgdHJlYXQgLnJvZGF0YSwgc28gSSdkIHN1Z2dlc3QKPiA+IHR1cm5pbmcg
dGhpcyBpbnRvCj4gPiAKPiA+ICooLmluaXQucm9kYXRhKQo+ID4gKiguaW5pdC5yb2RhdGEuKikK
PiA+IAo+ID4gdG8gbWF0Y2ggdGhlIHJlZ3VsYXIgLnJvZGF0YS4KPiAKPiBPciwgYXMgc3VnZ2Vz
dGVkIGVsc2V3aGVyZSwgbWFrZSAucm9kYXRhIHVzZSBsZXNzIHdpZGUgbWF0Y2hpbmcsCj4gbGlr
ZSB3ZSBkbyBmb3IgLmluaXQucm9kYXRhLgoKSSdtIGhhcHB5IHRvIGhhbmRsZSAuaW5pdC5yb2Rh
dGEgc3Vic2VjdGlvbnMgYXMgWGVuIGN1cnJlbnRseSBoYW5kbGVzCi5yb2RhdGEgc3Vic2VjdGlv
bnMuIFRoZXJlIGFyZSBubyBjdXN0b20gc3Vic2VjdGlvbnMgZXhwbGljaXRseSBhZGRlZAp0byBl
aXRoZXIgLnJvZGF0YSBvciAuaW5pdC5yb2RhdGEsIGFuZCBpZiB3ZSBzdGFydCBhZGRpbmcgc3Vj
aApzdWJzZWN0aW9ucyBleHBsaWNpdGx5IHRoZSBsaW5rZXIgc2NyaXB0IHdpbGwgbGlrZWx5IG5l
ZWQKbW9kaWZpY2F0aW9ucyBhbnl3YXkgdG8gbWFyayB0aGUgc3RhcnQgYW5kIGVuZCBvZiB0aG9z
ZSBzdWJzZWN0aW9ucyBpbgp0aGUgZmluYWwgYmluYXJ5LCBvciB0aGUgZGVmYXVsdCBwbGFjZW1l
bnQgb2YgdGhlIHdpZGVyIHdpbGRjYXJkIHdpbGwKYmUgYWxyZWFkeSBmaW5lLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
