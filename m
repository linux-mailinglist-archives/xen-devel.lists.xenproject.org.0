Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565518341C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:07:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPO9-00032Y-2v; Thu, 12 Mar 2020 15:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCPO7-00032T-2l
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:04:43 +0000
X-Inumbo-ID: cd0214a4-6472-11ea-a6c1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd0214a4-6472-11ea-a6c1-bc764e2007e4;
 Thu, 12 Mar 2020 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584025482;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=E/iioeUyGvUs2PCKR77Yq3QSzc2cyAnhIsuxWm1+EHU=;
 b=OdiGEDgQCKQyK6Mxfq63B4F4N0vnOTY+oFZIJ2hBY804aFwNHf6w7YSp
 7AzLZ4Nr0RtOUiY59fv8X80XVGdTL105hJeOhGB21IPfiYaUz0pIUiDaT
 FA3CAtoBShw8aPlGrQQeq1Nkah4jroqb6FdInFA1W+kjjLsr5jzRFwEKw U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: juTW57c1Nu9s/elcsbYtUaVbY4J0Q77f36sXCUBorbJPvEaGDjzf3fZzPIj3EP8OrxKujqz7de
 z7Tf+KC1CJJBGOkRcy9CcSVcEQngsMqY/l45AkANeecc2r3xHBzRjuMOu1ktP+L5hb4TLvW/Nw
 wU5DYgD1CXd/I+3JAxTFx8YCXKp9//kyfyw6f7bq9q+jSXIGL+8DawiAW9vuSe51mZUHoGiY0G
 xInV59drshdWYL3Z0QxIQyNQsg2ykjCRPuO+5yK/bwblyKqAMtvCeiLF+u4/eBKl4o07hAHnqu
 GII=
X-SBRS: 2.7
X-MesageID: 14034391
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14034391"
To: Miroslav Benes <mbenes@suse.cz>, <boris.ostrovsky@oracle.com>,
 <jgross@suse.com>, <sstabellini@kernel.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, <jpoimboe@redhat.com>
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-2-mbenes@suse.cz>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dc55b23b-c0d2-3be0-222f-d104548c8cf4@citrix.com>
Date: Thu, 12 Mar 2020 15:04:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312142007.11488-2-mbenes@suse.cz>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/xen: Make the boot CPU idle task
 reliable
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
Cc: live-patching@vger.kernel.org, x86@kernel.org, jslaby@suse.cz,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDMvMjAyMCAxNDoyMCwgTWlyb3NsYXYgQmVuZXMgd3JvdGU6Cj4gVGhlIHVud2luZGVy
IHJlcG9ydHMgdGhlIGJvb3QgQ1BVIGlkbGUgdGFzaydzIHN0YWNrIG9uIFhFTiBQViBhcwo+IHVu
cmVsaWFibGUsIHdoaWNoIGFmZmVjdHMgYXQgbGVhc3QgbGl2ZSBwYXRjaGluZy4gVGhlcmUgYXJl
IHR3byByZWFzb25zCj4gZm9yIHRoaXMuIEZpcnN0LCB0aGUgdGFzayBkb2VzIG5vdCBmb2xsb3cg
dGhlIHg4NiBjb252ZW50aW9uIHRoYXQgaXRzCj4gc3RhY2sgc3RhcnRzIGF0IHRoZSBvZmZzZXQg
cmlnaHQgYmVsb3cgc2F2ZWQgcHRfcmVncy4gSXQgYWxsb3dzIHRoZQo+IHVud2luZGVyIHRvIGVh
c2lseSBkZXRlY3QgdGhlIGVuZCBvZiB0aGUgc3RhY2sgYW5kIHZlcmlmeSBpdC4gU2Vjb25kLAo+
IHN0YXJ0dXBfeGVuKCkgZnVuY3Rpb24gZG9lcyBub3Qgc3RvcmUgdGhlIHJldHVybiBhZGRyZXNz
IGJlZm9yZSBqdW1waW5nCj4gdG8geGVuX3N0YXJ0X2tlcm5lbCgpIHdoaWNoIGNvbmZ1c2VzIHRo
ZSB1bndpbmRlci4KPgo+IEFtZW5kIGJvdGggaXNzdWVzIGJ5IG1vdmluZyB0aGUgc3RhcnRpbmcg
cG9pbnQgb2YgaW5pdGlhbCBzdGFjayBpbgo+IHN0YXJ0dXBfeGVuKCkgYW5kIHN0b3JpbmcgdGhl
IHJldHVybiBhZGRyZXNzIGJlZm9yZSB0aGUganVtcC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1pcm9z
bGF2IEJlbmVzIDxtYmVuZXNAc3VzZS5jej4KPiAtLS0KPiAgYXJjaC94ODYveGVuL3hlbi1oZWFk
LlMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TIGIvYXJjaC94ODYv
eGVuL3hlbi1oZWFkLlMKPiBpbmRleCAxZDBjZWUzMTYzZTQuLjY0MmYzNDZiZmUwMiAxMDA2NDQK
PiAtLS0gYS9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwo+ICsrKyBiL2FyY2gveDg2L3hlbi94ZW4t
aGVhZC5TCj4gQEAgLTM1LDcgKzM1LDcgQEAgU1lNX0NPREVfU1RBUlQoc3RhcnR1cF94ZW4pCj4g
IAlyZXAgX19BU01fU0laRShzdG9zKQo+ICAKPiAgCW1vdiAlX0FTTV9TSSwgeGVuX3N0YXJ0X2lu
Zm8KPiAtCW1vdiAkaW5pdF90aHJlYWRfdW5pb24rVEhSRUFEX1NJWkUsICVfQVNNX1NQCj4gKwlt
b3YgJGluaXRfdGhyZWFkX3VuaW9uK1RIUkVBRF9TSVpFLVNJWkVPRl9QVFJFR1MsICVfQVNNX1NQ
Cj4gIAo+ICAjaWZkZWYgQ09ORklHX1g4Nl82NAo+ICAJLyogU2V0IHVwICVncy4KPiBAQCAtNTEs
NyArNTEsOSBAQCBTWU1fQ09ERV9TVEFSVChzdGFydHVwX3hlbikKPiAgCXdybXNyCj4gICNlbmRp
Zgo+ICAKPiArCXB1c2ggJDFmCj4gIAlqbXAgeGVuX3N0YXJ0X2tlcm5lbAo+ICsxOgoKSGFuZyBv
bi7CoCBJc24ndCB0aGlzIGp1c3QgYSBgY2FsbGAgaW5zdHJ1Y3Rpb24gd3JpdHRlbiBpbiBsb25n
aGFuZD8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
