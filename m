Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C02161485
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 15:26:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3hJH-00018l-SS; Mon, 17 Feb 2020 14:23:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VaN/=4F=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j3hJG-00018f-Au
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 14:23:42 +0000
X-Inumbo-ID: 18781d74-5191-11ea-bffb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18781d74-5191-11ea-bffb-12813bfff9fa;
 Mon, 17 Feb 2020 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581949422;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a9rUV3NxYRWle5EogWvp3Ok4ULxCCcClbEwyWuzja2E=;
 b=U8PYo9ijVRfK/NEJ8v2jlSaGTV8FHEX11kULd6UvcGgzf8S162sywAxB
 FOcVAuRxSbPWryGlGakgQNMX+tZaCA6xTa7rnOg0rfQdkE0KKEjCgp7OV
 QjsdUW5aPleDzMPRYrlLmDNb+dnPir6qCdlHb0yBQozEEmbxCOvFUETqb I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5Un5P0TuN4+CUxp7DjppQoDyeGtEK9r8nRNO8H+2L3Xtn+K7zeM6juBAAQuBV+4FRMnwlMfWPs
 7HjLNRSqQUXYGDf+JPz0+IunnPVVRAyvSbsKRB7gDNl89z4fVPGtqX6b1deYYzs/bDODv/zahW
 UP9Bf+zcZT+MICnhSVDFFX7wxU9BxV1ysYbh7LOZB5VDaxUpnCHOgzSU80gLEIfkTVfXXsiXd3
 hb3jkuql+nB2Y4g4QVXy4CLf3UpY6dYkz19J5tlEfnTR7FBz689JicyOArQQHrjvHwC3rtnxNy
 SZI=
X-SBRS: 2.7
X-MesageID: 12741762
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12741762"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <3f1b46dc-ba1d-301a-3a7b-f3480338f379@citrix.com>
 <a7a17e9d-dce5-0fff-9f75-9af69f173d5b@suse.com>
 <af2b3f49-77ef-1171-0901-5631b6404b5c@citrix.com>
Message-ID: <a22149d0-7858-864d-fcdc-590d165dd9c3@citrix.com>
Date: Mon, 17 Feb 2020 14:23:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <af2b3f49-77ef-1171-0901-5631b6404b5c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAxMjozMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTcvMDIvMjAy
MCAxMjoyOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMTcuMDIuMjAgMTM6MjYsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMTcvMDIvMjAyMCAwNzoyMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4+PiBUb2RheSByY3VfYmFycmllcigpIGlzIGNhbGxpbmcgc3RvcF9tYWNoaW5lX3J1
bigpIHRvIHN5bmNocm9uaXplIGFsbAo+Pj4+IHBoeXNpY2FsIGNwdXMgaW4gb3JkZXIgdG8gZW5z
dXJlIGFsbCBwZW5kaW5nIHJjdSBjYWxscyBoYXZlIGZpbmlzaGVkCj4+Pj4gd2hlbiByZXR1cm5p
bmcuCj4+Pj4KPj4+PiBBcyBzdG9wX21hY2hpbmVfcnVuKCkgaXMgdXNpbmcgdGFza2xldHMgdGhp
cyByZXF1aXJlcyBzY2hlZHVsaW5nIG9mCj4+Pj4gaWRsZSB2Y3B1cyBvbiBhbGwgY3B1cyBpbXBv
c2luZyB0aGUgbmVlZCB0byBjYWxsIHJjdV9iYXJyaWVyKCkgb24gaWRsZQo+Pj4+IGNwdXMgb25s
eSBpbiBjYXNlIG9mIGNvcmUgc2NoZWR1bGluZyBiZWluZyBhY3RpdmUsIGFzIG90aGVyd2lzZSBh
Cj4+Pj4gc2NoZWR1bGluZyBkZWFkbG9jayB3b3VsZCBvY2N1ci4KPj4+Pgo+Pj4+IFRoZXJlIGlz
IG5vIG5lZWQgYXQgYWxsIHRvIGRvIHRoZSBzeW5jaW5nIG9mIHRoZSBjcHVzIGluIHRhc2tsZXRz
LCBhcwo+Pj4+IHJjdSBhY3Rpdml0eSBpcyBzdGFydGVkIGluIF9fZG9fc29mdGlycSgpIGNhbGxl
ZCB3aGVuZXZlciBzb2Z0aXJxCj4+Pj4gYWN0aXZpdHkgaXMgYWxsb3dlZC4gU28gcmN1X2JhcnJp
ZXIoKSBjYW4gZWFzaWx5IGJlIG1vZGlmaWVkIHRvIHVzZQo+Pj4+IHNvZnRpcnEgZm9yIHN5bmNo
cm9uaXphdGlvbiBvZiB0aGUgY3B1cyBubyBsb25nZXIgcmVxdWlyaW5nIGFueQo+Pj4+IHNjaGVk
dWxpbmcgYWN0aXZpdHkuCj4+Pj4KPj4+PiBBcyB0aGVyZSBhbHJlYWR5IGlzIGEgcmN1IHNvZnRp
cnEgcmV1c2UgdGhhdCBmb3IgdGhlIHN5bmNocm9uaXphdGlvbi4KPj4+Pgo+Pj4+IEZpbmFsbHkg
c3dpdGNoIHJjdV9iYXJyaWVyKCkgdG8gcmV0dXJuIHZvaWQgYXMgaXQgbm93IGNhbiBuZXZlciBm
YWlsLgo+Pj4+Cj4+Pgo+Pj4gV291bGQgdGhpcyBpbXBsZW1lbnRhdGlvbiBndWFyYW50ZWUgcHJv
Z3Jlc3MgYXMgcHJldmlvdXMgaW1wbGVtZW50YXRpb24KPj4+IGd1YXJhbnRlZWQ/Cj4+Cj4+IFll
cy4KPiAKPiBUaGFua3MsIEknbGwgcHV0IGl0IHRvIHRlc3QgdG9kYXkgdG8gc2VlIGlmIGl0IHNv
bHZlcyBvdXIgdXNlIGNhc2UuCgpKdXN0IG1hbnVhbGx5IHRyaWVkIGl0IC0gZ2l2ZXMgaW5maW5p
dGUgKHVwIHRvIHN0YWNrIHNpemUpIHRyYWNlIGxpa2U6CgooWEVOKSBbICAgIDEuNDk2NTIwXSAg
ICBbPGZmZmY4MmQwODAyMmU0MzU+XSBGIHNvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg4NS8weDkw
CihYRU4pIFsgICAgMS40OTY1NjFdICAgIFs8ZmZmZjgyZDA4MDIyZTQ3NT5dIEYgcHJvY2Vzc19w
ZW5kaW5nX3NvZnRpcnFzKzB4MzUvMHgzNwooWEVOKSBbICAgIDEuNDk2NjAwXSAgICBbPGZmZmY4
MmQwODAyMjExMDE+XSBGIHJjdXBkYXRlLmMjcmN1X3Byb2Nlc3NfY2FsbGJhY2tzKzB4MWRmLzB4
MWY2CihYRU4pIFsgICAgMS40OTY2NDNdICAgIFs8ZmZmZjgyZDA4MDIyZTQzNT5dIEYgc29mdGly
cS5jI19fZG9fc29mdGlycSsweDg1LzB4OTAKKFhFTikgWyAgICAxLjQ5NjY4NV0gICAgWzxmZmZm
ODJkMDgwMjJlNDc1Pl0gRiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMrMHgzNS8weDM3CihYRU4p
IFsgICAgMS40OTY3MjZdICAgIFs8ZmZmZjgyZDA4MDIyMTEwMT5dIEYgcmN1cGRhdGUuYyNyY3Vf
cHJvY2Vzc19jYWxsYmFja3MrMHgxZGYvMHgxZjYKKFhFTikgWyAgICAxLjQ5Njc2Nl0gICAgWzxm
ZmZmODJkMDgwMjJlNDM1Pl0gRiBzb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4ODUvMHg5MAooWEVO
KSBbICAgIDEuNDk2ODA2XSAgICBbPGZmZmY4MmQwODAyMmU0NzU+XSBGIHByb2Nlc3NfcGVuZGlu
Z19zb2Z0aXJxcysweDM1LzB4MzcKKFhFTikgWyAgICAxLjQ5Njg0N10gICAgWzxmZmZmODJkMDgw
MjIxMTAxPl0gRiByY3VwZGF0ZS5jI3JjdV9wcm9jZXNzX2NhbGxiYWNrcysweDFkZi8weDFmNgoo
WEVOKSBbICAgIDEuNDk2ODg3XSAgICBbPGZmZmY4MmQwODAyMmU0MzU+XSBGIHNvZnRpcnEuYyNf
X2RvX3NvZnRpcnErMHg4NS8weDkwCihYRU4pIFsgICAgMS40OTY5MjddICAgIFs8ZmZmZjgyZDA4
MDIyZTQ3NT5dIEYgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKzB4MzUvMHgzNwoKSWdvcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
