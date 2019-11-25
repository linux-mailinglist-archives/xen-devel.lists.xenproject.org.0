Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CDC10931B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:52:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZIUw-0005DA-Ak; Mon, 25 Nov 2019 17:50:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgds=ZR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZIUv-00054D-3Z
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:50:05 +0000
X-Inumbo-ID: 027330c6-0fac-11ea-b08b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 027330c6-0fac-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574704205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qndQzK0CNDIACFdd9b/9v/q21BlWmL9D19LEhWEVO4Y=;
 b=O8rDK7Z/UC4mFEc8/bGc9UGOTKC/VODTIK9h1vf+sncOk8TWceArUml2
 kADzXK574KNnU3bgpUziJRPvzJM739PccX3EynOxgpSDXNtLaCnxhl6ZS
 xOTYPdpaiUFJjVZ56PbWrVe01eq2R3SCwwogXN9yDTWvfcX5ECWIc9b5r E=;
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
IronPort-SDR: cxsW+S6kDB2YCumFPmcLtJinkgkbYhxKs08DbCfWV0QZ9IOuqetiZD+xKEAPClpvr0XHM2PsW6
 gyd8RhawzJYYmak1nHERKTU/q1njVrwCMtnZYXEDcuyATLYLvUjPa5g839nZnXA8k7NUeJqjpI
 LSHkvMMbaNGSTA2h4CEtMPCOr62IO1JAlbUfUB8yPnfuWqci+DogcAzVUSDTOQO24qxGq9z2g/
 YAxjtvchLPRpJjnZMariHNM3Ynso8NSWl4FJS5D7JcE8xabdkdbumrNSG4lso8n9V5+hKjruJx
 zRo=
X-SBRS: 2.7
X-MesageID: 8803247
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8803247"
Date: Mon, 25 Nov 2019 18:49:56 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191125174956.GC980@Air-de-Roger>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian>
 <20191125155931.GA980@Air-de-Roger>
 <20191125170704.etgloq6y2e7j6ewg@debian>
 <20191125172704.GB980@Air-de-Roger>
 <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George
 Dunlap <george.dunlap@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDU6MzQ6MTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNS8xMS8yMDE5IDE3OjI3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDU6MDc6MDRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+PiBPbiBNb24sIE5vdiAyNSwgMjAxOSBhdCAwNDo1OTozMVBNICswMTAwLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+ID4+IFsuLi5dCj4gPj4+IFdoaWNoIEkgdGhpbmsgaXQncyBleHBlY3Rl
ZCwgd2UgYWxyZWFkeSBrbmV3IGNsYW5nIGhhZCBhIGxvdCBvZgo+ID4+PiBkdXBsaWNhdGUgc3lt
Ym9scy4gVGhlIG9ubHkgd2F5IEkga25vdyB0byB3b3JrYXJvdW5kIHRoaXMgQVRNIGlzIHRvCj4g
Pj4+IHVzZSBgZ21ha2UgeGVuIGNsYW5nPXkgQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFM9
bmAuIEl0J3Mgb24gbXkKPiA+Pj4gcGlsZSBvZiBzdHVmZiB0byBsb29rIGludG8sIGJ1dCBJJ20g
bm90IHN1cmUgd2hlbiBJIHdpbGwgZ2V0IHRvIGl0Lgo+ID4+IEluIHRoYXQgY2FzZSB3ZSBzaG91
bGQgbWFrZSBHaXRsYWIgQ0kgdXNlIHRoZSBuZXcgY29uZmlndXJhdGlvbiBvcHRpb24uCj4gPiBJ
TU8gdGhlIGJ1aWxkIHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94LCBzbyB3ZSBzaG91bGQgZGlz
YWJsZQo+ID4gQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFMgYXV0b21hdGljYWxseSBpZiBj
bGFuZyBpcyBkZXRlY3RlZC4KPiAKPiBLY29uZmlnIGluIDQuMTMgaXNuJ3QgaW4gYSBwb3NpdGlv
biB0byBrbm93IHRoaXMuwqAgKEl0IHdpbGwgYmUgaW4gNC4xNAo+IHdpdGggQW50aG9ueSdzIHJl
ZnJlc2ggY29tbWl0dGVkKS4KCldlIGFscmVhZHkgaGF2ZSBLY29uZmlnIG9wdGlvbnMgdGhhdCBk
ZXBlbmQgb24gdG9vbGNoYWluIGZlYXR1cmVzLApsaXZlcGF0Y2ggaXRzZWxmIHdpbGwgYmUgZW5h
YmxlZCBpZiBidWlsZCBpZCBpcyBzdXBwb3J0ZWQgYnkgdGhlCmxpbmtlciwgd2h5IG5vdCB1c2Ug
c29tZXRoaW5nIGxpa2U6CgpkaWZmIC0tZ2l0IGEvQ29uZmlnLm1rIGIvQ29uZmlnLm1rCmluZGV4
IGQ4ZjkwZDc1YjMuLjAwOWFiZGEyMjUgMTAwNjQ0Ci0tLSBhL0NvbmZpZy5taworKysgYi9Db25m
aWcubWsKQEAgLTE1Nyw2ICsxNTcsOCBAQCBpZm5kZWYgWEVOX0hBU19DSEVDS1BPTElDWQogICAg
IGV4cG9ydCBYRU5fSEFTX0NIRUNLUE9MSUNZCiBlbmRpZgogCitleHBvcnQgWEVOX0JVSUxEX1dJ
VEhfQ0xBTkcgPSAkKGNsYW5nKQorCiAjIGFzLWluc246IENoZWNrIHdoZXRoZXIgYXNzZW1ibGVy
IHN1cHBvcnRzIGFuIGluc3RydWN0aW9uLgogIyBVc2FnZTogY2ZsYWdzLXkgKz0gJChjYWxsIGFz
LWluc24sQ0MgRkxBR1MsImluc24iLG9wdGlvbi15ZXMsb3B0aW9uLW5vKQogYXMtaW5zbiA9ICQo
aWYgJChzaGVsbCBlY2hvICd2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAkKDIpICk7IH0n
IFwKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZwpp
bmRleCBmNzU0NzQxOTcyLi4wOTc5OTZmYzZjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25m
aWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC04MCw2ICs4MCwxMCBAQCBjb25maWcgSEFT
X0NIRUNLUE9MSUNZCiAJc3RyaW5nCiAJb3B0aW9uIGVudj0iWEVOX0hBU19DSEVDS1BPTElDWSIK
IAorY29uZmlnIEJVSUxEX1dJVEhfQ0xBTkcKKwlzdHJpbmcKKwlvcHRpb24gZW52PSJYRU5fQlVJ
TERfV0lUSF9DTEFORyIKKwogbWVudSAiU3BlY3VsYXRpdmUgaGFyZGVuaW5nIgogCiBjb25maWcg
U1BFQ1VMQVRJVkVfSEFSREVOX0FSUkFZCkBAIC0zNTAsNyArMzU0LDcgQEAgY29uZmlnIENSWVBU
TwogY29uZmlnIExJVkVQQVRDSAogCWJvb2wgIkxpdmUgcGF0Y2hpbmcgc3VwcG9ydCIKIAlkZWZh
dWx0IFg4NgotCWRlcGVuZHMgb24gSEFTX0JVSUxEX0lEID0gInkiCisJZGVwZW5kcyBvbiBIQVNf
QlVJTERfSUQgPSAieSIgJiYgQlVJTERfV0lUSF9DTEFORyAhPSAieSIKIAktLS1oZWxwLS0tCiAJ
ICBBbGxvd3MgYSBydW5uaW5nIFhlbiBoeXBlcnZpc29yIHRvIGJlIGR5bmFtaWNhbGx5IHBhdGNo
ZWQgdXNpbmcKIAkgIGJpbmFyeSBwYXRjaGVzIHdpdGhvdXQgcmVib290aW5nLiBUaGlzIGlzIHBy
aW1hcmlseSB1c2VkIHRvIGJpbmFyaWx5CgpUaGlzIFdGTSB3aXRoIEZyZWVCU0QgYW5kIGNsYW5n
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
