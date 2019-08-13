Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC488BEE1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 18:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxZsN-00085j-DI; Tue, 13 Aug 2019 16:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxZsL-00085e-Ts
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:42:21 +0000
X-Inumbo-ID: 50346272-bde9-11e9-8a97-577c03dfa1f0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50346272-bde9-11e9-8a97-577c03dfa1f0;
 Tue, 13 Aug 2019 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565714539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HsxMSOnBNmZf7wl9PTSgGVoArNF38rjHsSwD652Jo8w=;
 b=DEL6xTS2P+usPl4+vZ/AbKMhG0juEBOgBAHYSJvnEEw/XVC4sRHBDW3K
 T3ABsAA/9m5L6cBZH6ZsdskcjALrAxnxAEMttLcSQiFsu8jvPN8nRHQ96
 Sqv3kI2VaIVwbYwJZkmkUfam100JNwJqBq/QZc4bzcGKTLpVuhnm/atV+ s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VGAN3uDWL7vrmSufEYcY2mMss8BdpnQDLARHUU8z9v7sZbiLT6OsKfCInumC/9+jf1o1MYLG/w
 Gq+nYumFX35HvWPjSeqQI5V0wDTsKOYKd6TQTDYCwgxsP22VYMlDOLHfSPCPuat5L92ujIppl9
 IRRuhewlkmK+dIJOFC6BkK5ES3e5+eCodF3h6W8IBOfodrdz1kVPTAMMTEXTV3bPmWSiwU9v1p
 KqWbfroVyugjz6Ezdv1kNMZwsrwYNBwnfEOFit14p/XIs/r0uzzcJgasc+3E4whNL4TYEKemzU
 M3A=
X-SBRS: 2.7
X-MesageID: 4259165
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,382,1559534400"; 
   d="scan'208";a="4259165"
Date: Tue, 13 Aug 2019 17:42:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190813164215.GE1289@perard.uk.xensource.com>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
 <20190813153020.GC1289@perard.uk.xensource.com>
 <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6NDc6MjNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBFcnJvciBiZXR3ZWVuIHVzZXIgYW5kIHRlcm1pbmFsLiA6KQo+IAo+IEknZCBzeW5j
J2QgeGwgYW5kIGxpYnhsLnNvLCBidXQgbm90IGxpYnhsdS5zbwoKSSBhY3R1YWxseSBtYWRlIHRo
ZSBzYW1lIG1pc3Rha2UgZmlyc3QgdGltZSBJIHRyaWVkLgoKPiBPaywgc28gdGhhdCBpcyB3b3Jr
aW5nIG5vdy7CoCBJIHRoaW5rICdjbWRsaW5lKz0iIGRvbTA9cHZoCj4gZG9tMC1pb21tdT1ub25l
IicgaXMgc2xpZ2h0bHkgbGVzcyB0b3J0dXJlZCBzeW50YXgsIGJ1dCBJIGd1ZXNzIHRoZXJlIGlz
Cj4gbm8gd2F5IHRoYXQgdGhpcyBpc24ndCBnb2luZyB0byBiZSBob3JyaWJsZS4KPiAKPiBBcyBm
b3IgdGhlIGdlbmVyYWwgbWVjaGFuaXNtLCBob3cgdXNhYmxlIGlzICs9IGZvciBhbnl0aGluZyBv
dGhlciB0aGFuCj4gY21kbGluZT/CoCBNb3N0IHN0cmluZ3MgaW4gY29uZmlnIGZpbGVzIGNhbid0
IHVzZWZ1bGx5IGJlIGV4dGVuZGVkIGluCj4gdGhpcyBtYXR0ZXIgLSBpZiB0aGV5IG5lZWQgY2hh
bmdpbmcsIHRoZXkgbmVlZCBjaGFuZ2luZyB3aG9sZXNhbGUuCgpUaGF0J3MgdHJ1ZSwgYnV0IG9u
ZSBjb3VsZCBpbWFnaW5nIHNvbWUgbWF5YmUgYmFkIGV4YW1wbGUgbGlrZSBhZGRpbmcgYQpzdWZm
aXggdG8gdGhlIG5hbWUgb2YgdGhlIGd1ZXN0OiAibmFtZSs9Jy1vdm1mJzsiLgpHb2luZyB0aHJv
dWdoIGBtYW4geGwuY2ZnJywgbWF5YmUgYSBnb29kIGV4YW1wbGUgb3RoZXIgdGhhbiBjbWRsaW5l
CmNvdWxkIGJlICJjcHVzKz0nLF4xJyIgYnV0IG1heWJlIGEgc3BhY2UgaXMgZmluZSBoZXJlLCBv
ciBvbmUgY291bGQgdXNlCmEgbGlzdCBpbnN0ZWFkLgpPdGhlciBwb3RlbnRpYWwgdXNlcyBjb3Vs
ZCBiZSBmb3IgIlBBVEgiLCBidXQgaW4gdGhpcyBjYXNlIGl0IHdvdWxkIGJlCmJldHRlciByZXNl
dCB0aGUgc2V0dGluZyByYXRoZXIgdGhhdCBhdHRlbXB0aW5nIHRvIGFkZCBhIHN1ZmZpeCB0byBh
bgpleGlzdGluZyBvbmUuCgpJIHdvbmRlciBpZiBpbnN0ZWFkIG9mIGRvaW5nICs9IG9uIGFsbCBz
dHJpbmdzLCB3ZSBzaG91bGQgaW5zdGVhZCBoYXZlCmB4bCcgd2hpdGVsaXN0IHRoZSBmZXcgb3B0
aW9ucyB3aGVyZSArPSB3b3VsZCBtYWtlIHNlbnNlLiAoYW5kIGF0IHRoYXQKcG9pbnQsIGl0IHdv
dWxkIGJlIGVhc3kgdG8gYWRkIGEgJyAnIHdoZXJlIGlzIG1ha2Ugc2Vuc2UsIGxpa2UKImNtZGxp
bmUicy4gQnV0IHRoZW4sIGhvdyB0byB0ZWxsIHVzZXJzIHRoYXQgaXQgY2FuJ3QgZG8gIm5hbWUr
PSctbmV3JyI/CmJlY2F1c2UgeGx1IHdvdWxkIGp1c3QgcHJpbnQgYSB3YXJuaW5nLCBhbmQgeGwg
d291bGQga2VlcCBnb2luZyB3aXRoCm5hbWU9IiIuICBUcnkgInhsIGNyZWF0ZSBtZW1vcnkrPTQy
IiA7LSkuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
