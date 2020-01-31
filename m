Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05C14EB4F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 11:58:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixTxH-0006fw-U4; Fri, 31 Jan 2020 10:55:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhvM=3U=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ixTxG-0006fr-8x
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 10:55:18 +0000
X-Inumbo-ID: 2a229e5e-4418-11ea-b211-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a229e5e-4418-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580468116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XdgJ/2hxH3t3C7rGOCOfQhyfm2WlfZUCwgWsic8fFAo=;
 b=e37rgkFBcwqK1JczBEd51OeTJi5lIcOnZ3AajEg/DVoPKEld3PVZlG1+
 8G3Y3mIXJ9IC7rv+GRinB95TzATLTMQN2T+Tw41PsWOHle+HjDvDtzNVX
 Nt8fNt698XvmEux2kWYqjGIcAmbUjWdTych7BCpj6ix/nCgg34XiGe0uc E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: owuq7NLfPL2y5CJwEpf4FrkQDZEpgZIwwBmTQPKw66YwJeQf/inojBb+qMb6kt6kXSjdDsR7H1
 zdKNRj+UsHSUGwpGBPO0g/L0SjbquKO6pcllKW6dXoOjw/1Kk8/cTmcHbiWJ2kuSocw2tVsteK
 y67RyQ9/5t0rC2xXq8KEHb+tc5JQNH0Q0/R9OV6pJB20UYoQ37nlLbOuZYjxekrsvI1x4G4ck0
 MJdu2vax9LMAELhzVvCNoYCyYCbw2bV3ZV8pqUoLE6f2Zhx2OywHxfX25N7c8e0eBtN5je97S2
 qeQ=
X-SBRS: 2.7
X-MesageID: 12103534
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,385,1574139600"; d="scan'208";a="12103534"
Date: Fri, 31 Jan 2020 10:55:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200131105514.GS1288@perard.uk.xensource.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-5-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122144446.919-5-pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH v4 4/7] libxl: add infrastructure to track
 and query 'recent' domids
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDI6NDQ6NDNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEEgZG9taWQgaXMgY29uc2lkZXJlZCByZWNlbnQgaWYgdGhlIGRvbWFpbiBpdCByZXBy
ZXNlbnRzIHdhcyBkZXN0cm95ZWQKPiBsZXNzIHRoYW4gYSBzcGVjaWZpZWQgbnVtYmVyIG9mIHNl
Y29uZHMgYWdvLiBUaGUgbnVtYmVyIGNhbiBiZSBzZXQgdXNpbmcKPiB0aGUgZW52aXJvbm1lbnQg
dmFyaWFibGUgTElCWExfRE9NSURfUkVVU0VfVElNRU9VVC4gSWYgdGhlIHZhcmlhYmxlIGRvZXMK
PiBub3QgZXhpc3QgdGhlbiBhIGRlZmF1bHQgdmFsdWUgb2YgNjBzIGlzIHVzZWQuCgpDb3VsZCB5
b3UgcmV3cml0ZSB0aGF0IHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlPyBCeSByZWFkaW5nIGl0
LCBpdApzb3VuZHMgdG8gbWUgbGlrZSBMSUJYTF9ET01JRF9SRVVTRV9USU1FT1VUIGlzIGEgY29u
ZmlndXJhdGlvbiB2YXJpYWJsZQp0aGF0IGEgdG9vbHN0YWNrIG1heSB3YW50IHRvIHNldC4gV2hl
cmVhcyB0aGUgY29tbWVudCBpbgpsaWJ4bF9pbnRlcm5hbC5oIGluZGljYXRlcyB0aGF0IGl0J3Mg
Zm9yIGRlYnVnaW5nLiAgSGF2aW5nIGVudiB2YXIgZm9yCmRlYnVnZ2luZyBzb3VuZHMgZ29vZCwg
YnV0IGhhdmluZyBlbnYgdmFyIGFzIGNvbmZpZ3VyYXRpb24gZG9lc24ndC4KCj4gKy8qCj4gKyAq
IE1heGltdW0gbnVtYmVyIG9mIHNlY29uZHMgYWZ0ZXIgZGVzY3RydWN0aW9uIHRoZW4gYSBkb21p
ZCByZW1haW5zCj4gKyAqICdyZWNlbnQnLiBSZWNlbnQgZG9taWRzIGFyZSBub3QgYWxsb3dlZCB0
byBiZSByZS11c2VkLiBUaGlzIGNhbiBiZQo+ICsgKiBvdmVyaWRkZW4sIGZvciBkZWJ1Z2dpbmcg
cHVycG9zZXMsIGJ5IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBvZiB0aGUKPiArICogc2FtZSBu
YW1lLgo+ICsgKi8KPiArI2RlZmluZSBMSUJYTF9ET01JRF9SRVVTRV9USU1FT1VUIDYwCgpUaGFu
a3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
