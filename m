Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8088FE97
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 10:57:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyY05-0005xW-K4; Fri, 16 Aug 2019 08:54:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyY03-0005xR-LS
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 08:54:20 +0000
X-Inumbo-ID: 6e2923e6-c003-11e9-b90c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e2923e6-c003-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565945658;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pfR8vvu3nlBUIOdmvV9V7ao0haJLeupobgfDAgRW7o4=;
 b=avKbPC69X1krUN9hAnCLR6Eemr+WEIdXhpfW5OGFwXGHM8+tQfQmOb/U
 8nS/kr+bQKhJZh5Y35cd437irF6fFuPdqOJgceOD/NBDRLlsKScSoJj5d
 OIbkrKAn90OSPC5wGeXbujcoxqPI6p5seF3Snnv9aN/qB9NG5gnQuNrDs s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0RcXZh9rNT4dfS3mB3yPjqrQFs+4Tc1mJylRX4CmIgmMRtLcWc+oVbnUecDg28FvetAYQEzmBd
 rzHWLzNHqqO25QJiFyRiIo3QMuMF3nqTe8QHZ8z/91oA0avx5ONi4wcCb5eneXfm7x7xbH8002
 Wn9hfoA+cqUf2AjQjvSw+liEVsORa5uHu7kFd29CwOC/R1Sxn2hD22gvfo/c6eKyjaroWNKDg/
 S1k+a2Vf9OpZfp+BdlHKVWY93ebi/ejqx8nO5pR4UyPEw0igicqx61HckHiIc/YLUB0oxCn9pm
 e7w=
X-SBRS: 2.7
X-MesageID: 4358322
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4358322"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190408083224.104802-4-wipawel@amazon.de>
 <20190807111029.67766-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <a25e1767-9ff7-5ca9-f432-b5569abf134a@citrix.com>
Date: Fri, 16 Aug 2019 09:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190807111029.67766-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools v2 4/4] livepatch-build:
 Handle newly created object files
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDEyOjEwIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBVcCB0byBu
b3cgdGhlIGxpdmVwYXRjaC1idWlsZCBpZ25vcmVzIG5ld2x5IGNyZWF0ZWQgb2JqZWN0IGZpbGVz
Lgo+IFdoZW4gcGF0Y2ggYXBwbGllcyBuZXcgLmMgZmlsZSBhbmQgYXVnbWVudHMgaXRzIE1ha2Vm
aWxlIHRvIGJ1aWxkIGl0Cj4gdGhlIHJlc3VsdGluZyBvYmplY3QgZmlsZSBpcyBub3QgdGFrZW4g
aW50byBhY2NvdW50IGZvciBmaW5hbCBsaW5raW5nCj4gc3RlcC4KPiAKPiBTdWNoIG5ld2x5IGNy
ZWF0ZWQgb2JqZWN0IGZpbGVzIGNhbiBiZSBkZXRlY3RlZCBieSBjb21wYXJpbmcgcGF0Y2hlZC8K
PiBhbmQgb3JpZ2luYWwvIGRpcmVjdG9yaWVzIGFuZCBjb3BpZWQgb3ZlciB0byB0aGUgb3V0cHV0
IGRpcmVjdG9yeSBmb3IKPiB0aGUgZmluYWwgbGlua2luZyBzdGVwLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1i
eTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+IFJldmlld2Vk
LWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBOb3Ji
ZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiAtLS0KPiB2MjoKPiAqIEZpeGVkIHBh
dGhzIHRvIHByb2Nlc3Mgb25seSBoeXBlcnZpc29yIGNoYW5nZXMKPiAqIENoYW5naW5nIGRpcmVj
dG9yeSBpbiBzdWJzaGVsbHMgdG8gc2ltcGxpZmllZCB0aGUgY29tbWFuZAoKUmV2aWV3ZWQtYnk6
IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKVGhhbmtzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
