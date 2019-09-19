Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE62B7A08
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAw1Z-0002At-B3; Thu, 19 Sep 2019 12:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAw1X-0002AQ-Dx
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 12:59:03 +0000
X-Inumbo-ID: 406da9fa-dadd-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 406da9fa-dadd-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568897941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4gsFCv3qeaqUbhrdp7BhZi/Pp4+bQUudQcBhkIW6Ccs=;
 b=huhQY6+NFHBf5uVUBiTbrAKd8weuFCKR4iRq3VBv4aG/5jE0BAHiqL8b
 Me440wVHKXXvUZp29fl/vCPTXLTE+LfDGsxPGFOcI8GwZ0UeeTuh52P8q
 77Jg4GiUevtyYmpoFmqfFykuLkGX9UBYBkmpAqdF9yi7ClfTqwoWApz4Z s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OliZ6ER9WJ06PArzbMk2NJUW+nisCbt2+Qj1QK1pJtpPjO614JgwB+f6TkDJEr/glY4cGmx3sk
 hprjd1gTpXGJqg1k//9zoyPNvyDwnDFAPH0xeTbPt4VITuLtZRYHNcYItFGpWzpOMnX2RmbzQP
 Ela8LlqQteUvZ55XzZIcccya6dKvCfM8fL+ldTod6FvZR8V2C39MGWSsy8hFT9nKl7sfbIoLbX
 uDOB0Umq3cy0/Gp7ng+ghSaxCh59n5Fofny8GlhJRzWLdjURhDr3g/p59ROlh7wQCJjYzm/UtM
 vNc=
X-SBRS: 2.7
X-MesageID: 5989664
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5989664"
Date: Thu, 19 Sep 2019 13:58:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190919125859.GR1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-7-anthony.perard@citrix.com>
 <23937.3912.874830.653579@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.3912.874830.653579@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 06/35] libxl: Use ev_qmp for
 switch_qemu_xen_logdirty
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDU6NTI6MjRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA2LzM1XSBsaWJ4bDogVXNlIGV2
X3FtcCBmb3Igc3dpdGNoX3FlbXVfeGVuX2xvZ2RpcnR5Iik6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAuLi4KPiA+ICsgICAg
cmMgPSBsaWJ4bF9fZXZfdGltZV9yZWdpc3Rlcl9yZWwoYW8sICZsZHMtPnRpbWVvdXQsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaF9sb2dkaXJ0eV90aW1l
b3V0LCAxMCAqIDEwMDApOwo+ID4gKyAgICBpZiAocmMpIGdvdG8gb3V0Owo+ID4gKwo+ID4gKyAg
ICBxbXAtPmFvID0gYW87Cj4gPiArICAgIHFtcC0+ZG9taWQgPSBkb21pZDsKPiA+ICsgICAgcW1w
LT5wYXlsb2FkX2ZkID0gLTE7Cj4gPiArICAgIHFtcC0+Y2FsbGJhY2sgPSBzd2l0Y2hfcWVtdV94
ZW5fbG9nZGlydHlfZG9uZTsKPiA+ICsgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfYm9vbChnYywg
JmFyZ3MsICJlbmFibGUiLCBlbmFibGUpOwo+ID4gKyAgICByYyA9IGxpYnhsX19ldl9xbXBfc2Vu
ZChnYywgcW1wLCAieGVuLXNldC1nbG9iYWwtZGlydHktbG9nIiwgYXJncyk7Cj4gCj4gSSBoYXRl
IHRvIHN1Z2dlc3QgdGhpcyBhdCB0aGlzIHN0YWdlLCBidXQ6IG1heWJlIHRoZSB0aW1lb3V0IGNv
dWxkIGJlCj4gaW5jb3Jwb3JhdGVkIGludG8gbGlieGxfX2V2X3FtcCA/Cj4gCj4gSSB0aGluayBl
dmVyeSBsaWJ4bF9fcW1wIGNhbGxlciBpcyBnb2luZyB0byBuZWVkIGEgdGltZW91dCA/CgpZZXMs
IGV2ZXJ5IHVzZXIgb2YgbGlieGxfX2V2X3FtcCBzaG91bGQgaGF2ZSBhIHRpbWVvdXQgc2V0IHVw
LiBCdXQKdGhlcmUgYXJlIGRpZmZlcmVudCB3YXkgdG8gc2V0IGl0IHVwLiBXaGVuIHdlIGhhdmUg
c2V2ZXJhbCBjb21tYW5kIHRvCnNlbmQgdmlhIFFNUCBzaG91bGQgd2UgaGF2ZSBhIG5ldyB0aW1l
b3V0IGZvciBldmVyeSBjb21tYW5kIG9yIHNldCBvbmx5Cm9uZSB3aGVuIHNlbmRpbmcgdGhlIGZp
cnN0IGNvbW1hbmQsIGFuZCBvbmx5IHN0b3BwaW5nIHRoZSB0aW1lb3V0IHdoZW4KdGhlIGxhc3Qg
Y29tbWFuZCdzIHJlc3BvbnNlIGhhdmUgYmVlbiByZWNlaXZlZD8gSW4gdGhpcyBwYXRjaCBzZXJp
ZXMKSSd2ZSBjaG9vc2UgdGhlIHNlY29uZCBvcHRpb24uCgpJIGNhbiBzZWUgc2V2ZXJhbCBjYXNl
czoKLSBPbmUgUU1QIGNvbW1hbmQKICAtPiBlYXN5LCBvbmUgdGltZW91dCBmb3IgaXQuCi0gc2V2
ZXJhbCBjb21tYW5kcywgcmVsYXRlZCBvciBub3QuCiAgLT4gb25lIHRpbWVvdXQgcGVyIGNvbW1h
bmQ/IG9yIG9uZSB0aW1lb3V0IHdoaWNoIGNvdmVyIGFsbCBvZiB0aGVtPwogICAgIG9uZSBwZXIg
Y29tbWFuZHMgbWVhbnMgdGhhdCBhIGJhZCBxZW11IGNvdWxkIGRlbGF5IHRoZSBvcGVyYXRpb24K
ICAgICBzZXZlcmFsIHRpbWUgbG9uZ2VyIHRoYW4gaWYgdGhlcmUgd2VyZSBhIHNpbmdsZSB0aW1l
b3V0IGNvdmVyaW5nCiAgICAgYWxsIHRoZSBjb21tYW5kcy4KLSBvdGhlciBzbG93IG9wZXJhdGlv
biBhcmUgZG9uZSBiZXNpZGUgYSBxbXAgY29tbWFuZAogIC0+IEluIHRoaXMgY2FzZSwgaXQgbWln
aHQgbm90IGJlIHByYWN0aWNhbCB0byBoYXZlIGEgdGltZW91dCBhdHRhY2gKICAgICB0byB0aGUg
cW1wIGNvbW1hbmQsIHdlIGFyZSBnb2luZyB0byBuZWVkIGEgdGltZW91dCBmb3IgdGhlIG90aGVy
CiAgICAgb3BlcmF0aW9ucy4KCkkgZ3Vlc3Mgd2UgY291bGQgdHJ5IHRvIG9wdGltaXNlIHRoZSBz
aW1wbGVyIGNhc2Ugd2hlbiB0aGVyZSBpcyBvbmx5IG9uZQpxbXAgb3BlcmF0aW9uLCBiZWNhdXNl
IHRoYXQncyB0aGUgbW9zdCBjb21tb24sIGJ1dCBhbGxvdyB0byBzZW5kCmNvbW1hbmRzIHdpdGhv
dXQgaGF2aW5nIGxpYnhsX19xbXAgc2V0dGluZyBhIHRpbWVvdXQuCgotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
