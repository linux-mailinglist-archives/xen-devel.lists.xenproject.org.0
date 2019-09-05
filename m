Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FCA9F38
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 12:05:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5oZt-0000fq-8T; Thu, 05 Sep 2019 10:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5oZs-0000fk-6z
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 10:01:20 +0000
X-Inumbo-ID: 1b3c0e70-cfc4-11e9-abc3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b3c0e70-cfc4-11e9-abc3-12813bfff9fa;
 Thu, 05 Sep 2019 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567677680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4jMdIUK80DfDIymZCWhHU1hdVeOK3BaHTV/AWN/oX1k=;
 b=DM24BlrpILjJ7b+dvTzrwRSTrkN9ehOXoPkfSvH22//JULxeIp/vGY0X
 xUT+8DcFj9dgI7SG9KDzxd676XgK1JYP0tvFhblWPFRxok8ybGx8Dpg4O
 H1tcJvjEFmOTPPp2ejIdUNGDEw0n/qteHmgSzQyS2uYAbPPuzK4eYmmPp g=;
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
IronPort-SDR: tgOs30ozPRN31hdXX2QB5cDtZwLnw03JM0uHf241CccSnwwXMe3QN1cskvNarW/iQ5i/IjlUpm
 G5iaf69XojhrAk+oYR32tiA2KLxHAX3Q07hvZyl0QRex9svli6taomr2IzUf5EEOGxubhE8mOA
 BhZbWVqeWyi+oGPrRfp3TU1xZ1P8PuQcwDEKCZ3RPqOyDVTxB+hvE91HbDwmMGJRVyu+CLNjXs
 7roFbUG4w/L2wffjDcq4OuVkrWy7693l5Icaoy+ri5NSnuxTNFPiAVG90PPqnQ5tge0B1NX7iP
 xak=
X-SBRS: 2.7
X-MesageID: 5220752
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5220752"
Date: Thu, 5 Sep 2019 12:01:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
References: <20190905093416.2955-1-roger.pau@citrix.com>
 <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTE6NTI6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDUuMDkuMjAxOSAxMTozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ3Vy
cmVudCBsaWJ4bCBjb2RlIHdpbGwgYWx3YXlzIGVuYWJsZSBIYXJkd2FyZSBBc3Npc3RlZCBQYWdp
bmcgKEhBUCksCj4gPiBleHBlY3RpbmcgdGhhdCB0aGUgaHlwZXJ2aXNvciB3aWxsIGZhbGxiYWNr
IHRvIHNoYWRvdyBpZiBIQVAgaXMgbm90Cj4gPiBhdmFpbGFibGUuIFdpdGggdGhlIGNoYW5nZXMg
dG8gdGhlIGRvbWFpbiBidWlsZGVyIHRoYXQncyBub3QgdGhlIGNhc2UKPiA+IGFueSBsb25nZXIs
IGFuZCB0aGUgaHlwZXJ2aXNvciB3aWxsIHJhaXNlIGFuIGVycm9yIGlmIEhBUCBpcyBub3QKPiA+
IGF2YWlsYWJsZSBpbnN0ZWFkIG9mIHNpbGVudGx5IGZhbGxpbmcgYmFjayB0byBzaGFkb3cuCj4g
Cj4gV291bGQgaXQgcmVhbGx5IGJlIG11Y2ggbW9yZSBpbnZvbHZlZCB0aGFuIHRoZSBjaGFuZ2Ug
aGVyZSB0byByZXN0b3JlCj4gc2lsZW50IGRlZmF1bHRpbmcgdG8gc2hhZG93PwoKQnV0IHRoYXQg
d291bGQgbWVhbiB0aGF0IGEgdXNlciBoYXZpbmcgc2VsZWN0ZWQgaGFwPTEgb24gdGhlIGNvbmZp
ZwpmaWxlIHdvdWxkIGdldCBzaWxlbnRseSBkZWZhdWx0ZWQgdG8gc2hhZG93LCB3aGljaCBpcyB3
cm9uZyBJTU8uCgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiA+IEBAIC05MCw2ICs5MCwxMCBAQCBzdHJ1
Y3QgeGVuX3N5c2N0bF90YnVmX29wIHsKPiA+ICAgLyogKHg4NikgVGhlIHBsYXRmb3JtIHN1cHBv
cnRzIGRpcmVjdCBhY2Nlc3MgdG8gSS9PIGRldmljZXMgd2l0aCBJT01NVS4gKi8KPiA+ICAjZGVm
aW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8gICAgIDIKPiA+ICAjZGVmaW5lIFhFTl9T
WVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgKDF1PDxfWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlv
KQo+ID4gKy8qICh4ODYpIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBIYXJkd2FyZSBBc3Npc3RlZCBQ
YWdpbmcuICovCj4gPiArI2RlZmluZSBfWEVOX1NZU0NUTF9QSFlTQ0FQX2hhcCAgICAgICAgICAz
Cj4gPiArI2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwICAgICAgICAgICAoMXU8PF9YRU5f
U1lTQ1RMX1BIWVNDQVBfaGFwKQo+IAo+IEkgdGhpbmsgdGhpcyBiaXQgd2FudHMgdG8gYmUgdW5p
dmVyc2FsIChpLmUuICIoeDg2KSIgZHJvcHBlZCksIGFuZAo+IGJlIHNldCB1bmNvbmRpdGlvbmFs
bHkgb24gQXJtLiBJcnJlc3BlY3RpdmUgb2YgdGhlIHF1ZXN0aW9uIHJlZ2FyZGluZwo+IGFuIGFs
dGVybmF0aXZlIHNvbHV0aW9uIEkgdGhpbmsgaXQgaXMgcXVpdGUgc2Vuc2libGUgdG8gZXhwb3Nl
Cj4gYXZhaWxhYmlsaXR5IG9mIEhBUCB0byB0aGUgdG9vbHMuIEluIGZhY3QgSSB0aGluayAieGwg
aW5mbyIgc2hvdWxkCj4gc2hvdyB0aGlzIGFsb25nc2lkZSBvdGhlciBwcm9wZXJ0aWVzLgoKSSBj
YW4gaW5kZWVkIG1ha2UgdGhpcyBhdmFpbGFibGUgdG8gYm90aCB4ODYgYW5kIEFSTS4gQUZBSUNU
IGl0J3MKYWx3YXlzIGdvaW5nIHRvIGJlIHRydWUgb24gQVJNLiBJIGNhbiBleHBhbmQgdGhpcyBh
IGJpdCBzbyBpdCdzIGFsc28KcHJpbnRlZCBpbiBgeGwgaW5mb2AgdG9nZXRoZXIgd2l0aCB0aGUg
cmVzdCBvZiB0aGUgdmlydF9jYXBzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
