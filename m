Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B71150603
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:20:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyafP-0007mW-Vy; Mon, 03 Feb 2020 12:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iyafO-0007mR-RE
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:17:26 +0000
X-Inumbo-ID: 22f151b6-467f-11ea-8e54-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22f151b6-467f-11ea-8e54-12813bfff9fa;
 Mon, 03 Feb 2020 12:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CIK8ozn8h8Ax61UQGBo+3eDEXpUwFZxM4yzpQxUHQTM=;
 b=GY81TpJUkpJHzRKfT0R1ljCAronN7CkGSkn2onfeqDyHss+iYgrJPkS6
 Y5B5B0b0tLGMXZSDcpeC5Vt0SFH7l9wNzwoxbXg3ReXxDTPQ9AbqcTkYd
 5HQ4zR5VUb43ypJoZIYxqpjTRLe2ea5BJBwfmtxdc8WNRpCR1jc37FMRs 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YQM0aatTFfyxBagjgL5g+ZzMEIYghPhUmemtE9ENChsQm2RDH1eI9eCYdxJ/dEr14kadwplt0x
 IjoPIKjVzyKPIRc5hT0jbJZmsKqwO3yDQtfD1nED/HzESyofFeEU5Ok3qLEf+VFQkwsq15zTk+
 HEa6cjeKU7XkPa0pwguaADXfke3r+oZ7cKZlVp+14bLc0OyWMiKu9DD2n5CD4G9PEejgP6gmEy
 IW9f6XT6HBBYjv4LQGkVKHcx2WXthdsnRf8J4kYsGXWqjxH8WIVCUkXWjtHQaT2MW/SMazeaEz
 7F0=
X-SBRS: 2.7
X-MesageID: 12013826
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12013826"
Date: Mon, 3 Feb 2020 12:17:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203121721.GC2306@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-11-anthony.perard@citrix.com>
 <09ad3bd6-0c4d-d8b0-85c4-c2f5455ffc05@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09ad3bd6-0c4d-d8b0-85c4-c2f5455ffc05@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 10/12] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6Mjk6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBXZSB3
b3VsZCBsaWtlIHRvIGNhbGN1bGF0ZSBDRkxBR1Mgb25jZSBhbmQgYmVmb3JlIGNhbGxpbmcgUnVs
ZXMubWssCj4gPiBzbyB0aGUgdmFyaWFibGUgQ0ZMQUdTIG5lZWRzIHRvIGhhdmUgdGhlIHNhbWUg
dmFsdWUgYWNyb3NzIHRoZSB3aG9sZQo+ID4gYnVpbGQuIFRodXMgd2UgbmVlZCBhIG5ldyB2YXJp
YWJsZSB3aGVyZSBzb21lIGZsYWdzIGNhbiBjaGFuZ2UKPiA+IGRlcGVuZGluZyBvbiB0aGUgdGFy
Z2V0IG5hbWUuCj4gPiAKPiA+IEJvdGggdGhlIGRlcGVuZGVuY3kgYW5kIF9fT0JKRUNUX0ZJTEVf
XyBhcmUgc3VjaCBmbGFncyB0aGF0IGNoYW5nZQo+ID4gZGVwZW5kaW5nIG9uIHRoZSB0YXJnZXQs
IHNvIHRoZXJlIGFyZSBtb3ZlIG91dCBvZiAkKENGTEFHUykuCj4gCj4gSSdtIGFmcmFpZCBJIGRv
bid0IHVuZGVyc3RhbmQ6IEJlaW5nIGEgZGVsYXllZCBleHBhbnNpb24gKG9yCj4gInJlY3Vyc2l2
ZWx5IGV4cGFuZGVkIikgdmFyaWFibGUsIHdoYXQgcHJvYmxlbSBpcyB0aGVyZSB3aGVuIENGTEFH
Uwo+IHJlZmVyZW5jZXMgJEA/IElzIHRoZXJlIGEgcGxhbiB0byBjaGFuZ2UgdGhlIHZhcmlhYmxl
J3MgZmxhdm9yPyBJZgo+IHNvLCBJJ2QgbGlrZSB0byBhc2sgZm9yIHRoaXMgdG8gYmUgbWVudGlv
bmVkIGhlcmUuICJDYWxjdWxhdGUgb25jZSIsCj4gYXQgbGVhc3QgdG8gbWUsIGRvZXNuJ3QgaW1w
bHkgdGhpcy4KCklmIEkgcmV3cml0ZSB0aGUgZmlyc3QgcGFyYWdyYXBoIHRodXMsIHdvdWxkIHRo
YXQgYmUgYmV0dGVyPwoKICAgIEluIGEgbGF0ZXIgcGF0Y2gsIHdlIHdhbnQgdG8gY2FsY3VsYXRl
IHRoZSBDRkxBR1MgaW4geGVuL01ha2VmaWxlLAogICAgdGhlbiBleHBvcnQgaXQuIFNvIGhhdmUg
UnVsZXMubWsgdXNlIGEgQ0ZMQUdTIGZyb20gdGhlIGVudmlyb25tZW50CiAgICB2YXJpYWJsZXMu
IFRoaXMgd2lsbCBtZWFuIHRoYXQgaWYgUnVsZXMubWsgb3IgYSBNYWtlZmlsZSBtb2RpZnkKICAg
IENGTEFHUyBmb3IgYSB0YXJnZXQsIHRoZSBtb2RpZmljYXRpb24gcHJvcGFnYXRlcyB0byBvdGhl
ciB0YXJnZXRzLgogICAgVGh1cyB3ZSB3aWxsIG5lZWQgYSBkaWZmZXJlbnQgdmFyaWFibGUgbmFt
ZSB0aGFuIHRoZSBvbmUgZnJvbSB0aGUKICAgIGVudmlyb25tZW50IHdoaWNoIGNhbiBoYXZlIGEg
ZGlmZmVyZW50IHZhbHVlIGZvciBlYWNoIHRhcmdldC4KCgo+ID4gQEAgLTE0MSw5ICsxMzcsMTYg
QEAgZW5kaWYKPiA+ICAjIEFsd2F5cyBidWlsZCBvYmotYmluIGZpbGVzIGFzIGJpbmFyeSBldmVu
IGlmIHRoZXkgY29tZSBmcm9tIEMgc291cmNlLiAKPiA+ICAkKG9iai1iaW4teSk6IENGTEFHUyA6
PSAkKGZpbHRlci1vdXQgLWZsdG8sJChDRkxBR1MpKQo+ID4gIAo+ID4gK2NfZmxhZ3MgPSAtTU1E
IC1NRiAkKEBEKS8uJChARikuZCBcCj4gPiArICAgICAgICAgICQoQ0ZMQUdTKSBcCj4gPiArICAg
ICAgICAgICctRF9fT0JKRUNUX0ZJTEVfXz0iJEAiJwo+ID4gKwo+ID4gK2FfZmxhZ3MgPSAtTU1E
IC1NRiAkKEBEKS8uJChARikuZCBcCj4gPiArICAgICAgICAgICQoQUZMQUdTKQo+IAo+IElzIHRo
ZXJlIGEgcmVhc29uIGJvdGggZ2V0IGV4dGVuZGVkIG92ZXIgbXVsdGlwbGUgbGluZXM/CgpCZXNp
ZGUgdGhhdCBpdCBsb29rcyBjbGVhbmVyIHRvIG1lLCBub3QgcmVhbGx5LgoKPiA+IC0tLSBhL3hl
bi9pbmNsdWRlL01ha2VmaWxlCj4gPiArKysgYi94ZW4vaW5jbHVkZS9NYWtlZmlsZQo+ID4gQEAg
LTY0LDcgKzY0LDcgQEAgY29tcGF0LyUuaDogY29tcGF0LyUuaSBNYWtlZmlsZSAkKEJBU0VESVIp
L3Rvb2xzL2NvbXBhdC1idWlsZC1oZWFkZXIucHkKPiA+ICAJbXYgLWYgJEAubmV3ICRACj4gPiAg
Cj4gPiAgY29tcGF0LyUuaTogY29tcGF0LyUuYyBNYWtlZmlsZQo+ID4gLQkkKENQUCkgJChmaWx0
ZXItb3V0IC1XYSQoY29tbWEpJSAtTSUgJS5kIC1pbmNsdWRlICUvaW5jbHVkZS94ZW4vY29uZmln
LmgsJChDRkxBR1MpKSAkKGNwcGZsYWdzLXkpIC1vICRAICQ8Cj4gPiArCSQoQ1BQKSAkKGZpbHRl
ci1vdXQgLVdhJChjb21tYSklIC1NJSAlLmQgLWluY2x1ZGUgJS9pbmNsdWRlL3hlbi9jb25maWcu
aCwkKGNfZmxhZ3MpKSAkKGNwcGZsYWdzLXkpIC1vICRAICQ8Cj4gCj4gSSB0aGluayB0aGlzIHdh
bnRzIHRvIGNvbnRpbnVlIHRvIHJlZmVyZW5jZSAkKENGTEFHUykgYW5kIGluc3RlYWQgaGF2ZQo+
IHRoZSAtTSUgYW5kICUuZCBwYXR0ZXJucyBkcm9wcGVkLiBTaW1pbGFybHkgSSBndWVzcyBhcy1p
bnNuIGluIENvbmZpZy5tawo+IGNvdWxkIHRoZW4gaGF2ZSB0aGVzZSB0d28gcGF0dGVybnMgZHJv
cHBlZC4KCkl0J3MgcHJvYmFibHkgYSBnb29kIGlkZWEgdG8ga2VlcCB1c2luZyBDRkxBR1MsIEkn
bGwgbG9vayBpbnRvIGl0LgpBcyB0byBjaGFuZ2UgYXMtaW5zbiwgSSBjYW4gbW92ZSBpdCBvdXQg
b2YgQ29uZmlnLm1rIGFuZCB0aGVuIGNoYW5nZSBpdC4KSSdsbCBsb29rIGludG8gdGhhdCBhcyB3
ZWxsLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
