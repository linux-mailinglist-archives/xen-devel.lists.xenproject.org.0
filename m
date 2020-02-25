Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA316C148
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:50:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Zbz-0004Hm-8Y; Tue, 25 Feb 2020 12:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHfT=4N=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j6Zbx-0004Hh-D6
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:46:53 +0000
X-Inumbo-ID: e513f682-57cc-11ea-92ec-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e513f682-57cc-11ea-92ec-12813bfff9fa;
 Tue, 25 Feb 2020 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582634813;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a6aMYHOISgL/G5iKF3hDZezbiI0A6tmXUwWtUG5Ue9k=;
 b=Yfk6Z9cc5Qr2BR04ONBDbAy1GxZ0KE2Kgu88yGiRAIuRklAgxscSm0st
 nzVzYQYn8sTWhC7IJGuBDzOFunfyBNfsoXvl5oBO4By1JEMBAIbDTJzKf
 yBq2KEFyfMoOlrVs2uCBvXcQdI1f4LkmV5xm4cQF8IejVYNgoaPxYjFZf A=;
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
IronPort-SDR: OLdI789VlSLmLqfnN0WSoAbi21iiTqr8kONlUq3x63OjYtIqic9LlD5D6JsnRTvGj4+NAh6Mq4
 S/rqC90I/dj4S4bju3uy5ge94fT199yXtj3QxsfxvMdVUDEtv4O8YayiIrbtbLi7XF1Im2Rc2p
 FBaYFUJG+fkMvyXYgAxc5G9CB6hPBZ3e0mTFp0Qz3iNtcpIgM6gvRKlR1Jfy2ItjDiNaGU+svG
 Y6v0H0M/3ix/IMdHgDjo9xivXGxAxNid/0dr6iVTnIGZm0nyqiH0r7oL4+NJzZtK8emA6scpdf
 44E=
X-SBRS: 2.7
X-MesageID: 13143599
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="13143599"
To: Jan Beulich <jbeulich@suse.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
 <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
 <7f0c343c-96f1-b11c-324d-c301d08d40d5@suse.com>
 <cff24d62-e797-ab4a-a6a2-d16e7aff621e@citrix.com>
 <a27cf33b-6326-7461-b390-da675378188c@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <200c36a7-9bdf-8ea9-97c9-a1b4dc9dcfc4@citrix.com>
Date: Tue, 25 Feb 2020 12:46:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a27cf33b-6326-7461-b390-da675378188c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDIvMjAyMCAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMDIuMjAyMCAx
MzozNywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDI1LzAyLzIwMjAgMTI6MjIsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjEuMDIuMjAyMCAyMDoyNiwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gT24gMjEvMDIvMjAyMCAxNjoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDE5LjAyLjIwMjAgMTg6MjUsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+Pj4gLS0tIGEveGVu
L2FyY2gveDg2L3N5c2N0bC5jCj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPj4+
Pj4+IEBAIC03OCw4ICs3OCwxMSBAQCBzdGF0aWMgdm9pZCBsM19jYWNoZV9nZXQodm9pZCAqYXJn
KQo+Pj4+Pj4gIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKQo+Pj4+Pj4gIHsKPj4+Pj4+
ICAgICAgdW5zaWduZWQgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4+Pj4+PiAtICAg
IGludCByZXQgPSBjcHVfdXAoY3B1KTsKPj4+Pj4+ICsgICAgaW50IHJldDsKPj4+Pj4+ICAKPj4+
Pj4+ICsgICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3JrIGZyb20gcHJl
Y2VkaW5nIENQVSBvZmZsaW5lICovCj4+Pj4+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+Pj4+PiAr
ICAgIHJldCA9IGNwdV91cChjcHUpOwo+Pj4+Pj4gICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+
Pj4+Pj4gICAgICB7Cj4+Pj4+PiAgICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsg
YW5kIGhhdmUgb25lIG1vcmUgZ28uICovCj4+Pj4+PiBAQCAtMTA0LDcgKzEwNywxMSBAQCBsb25n
IGNwdV91cF9oZWxwZXIodm9pZCAqZGF0YSkKPj4+Pj4+ICBsb25nIGNwdV9kb3duX2hlbHBlcih2
b2lkICpkYXRhKQo+Pj4+Pj4gIHsKPj4+Pj4+ICAgICAgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25n
KWRhdGE7Cj4+Pj4+PiAtICAgIGludCByZXQgPSBjcHVfZG93bihjcHUpOwo+Pj4+Pj4gKyAgICBp
bnQgcmV0Owo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICAvKiBGbHVzaCBwb3RlbnRpYWxseSBzY2hlZHVs
ZWQgUkNVIHdvcmsgZnJvbSBwcmVjZWRpbmcgQ1BVIG9ubGluZSAqLwo+Pj4+Pj4gKyAgICByY3Vf
YmFycmllcigpOwo+Pj4+Pj4gKyAgICByZXQgPSBjcHVfZG93bihjcHUpOwo+Pj4+Pj4gICAgICBp
ZiAoIHJldCA9PSAtRUJVU1kgKQo+Pj4+Pj4gICAgICB7Cj4+Pj4+PiAgICAgICAgICAvKiBPbiBF
QlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1vcmUgZ28uICovCj4+Pj4+Pgo+Pj4+
Pgo+Pj4+PiBUaGVyZSBhcmUgbW9yZSBjYWxscyB0byBjcHVfdXAoKSAvIGNwdV9kb3duKCksIG1v
c3Qgbm90YWJseSBpbgo+Pj4+PiBjb3JlX3BhcmtpbmcuYy4gV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIG1ha2UgdGhlIGJhcnJpZXIgcGFydAo+Pj4+PiBvZiB0aGUgdHdvIGZ1bmN0aW9ucz8gVGhp
cyB3b3VsZCB0aGUgYWxzbyBjb3ZlciBub24teDg2IGluCj4+Pj4+IGNhc2UgYW4gYXJjaCB3YW50
cyB0byBzdXBwb3J0IG9mZmxpbmluZy9vbmxpbmluZyBvZiBDUFVzLgo+Pj4+Cj4+Pj4gVGhvc2Ug
ZnVuY3Rpb25zIGFyZSBjYWxsZWQgZnJvbSBlYXJseSBpbml0IGNvZGUgYW5kIHJjdV9iYXJyaWVy
KCkgaXMKPj4+PiBhbiBleHBlbnNpdmUgb3BlcmF0aW9uLiBJIHRoaW5rIGl0J3MgYmV0dGVyIGlm
IGNhbGxlciBpcyByZXNwb25zaWJsZQo+Pj4+IGZvciBzeW5jaW5nIHRoZSBzdGF0ZS4gVGhpcyBp
cyB0aGUgcmVhc29uIEkgbW92ZWQgcmN1X2JhcnJpZXIoKSBpbiBmcm9udAo+Pj4+IG9mIGNwdV91
cC9kb3duLgo+Pj4KPj4+IFdlbGwsIHRoZXJlIGFyZSB0d28gYXNwZWN0cyBoZXJlOiBPbmUgaXMg
dG8gYXZvaWQgdGhlIG92ZXJoZWFkIHdoZXJlCj4+PiBpdCdzIG5vdCBuZWVkZWQuIFRoZSBvdGhl
ciBpcywgYXMgb2JzZXJ2ZWQgb24gdGhpcyBwYXRjaCwgdGhhdCBieQo+Pj4gdGhlIGNob3NlbiBh
cHByb2FjaCBjYWxsZXJzIHdoaWNoIGluIGZhY3QgbmVlZCBhbWVuZGluZyBtYXkgYmUKPj4+IGZv
cmdvdHRlbi4gVG8gZmluZCBtaWRkbGUgZ3JvdW5kcywgcGVyaGFwcyB0aGUgc29sdXRpb24gaXMg
dG8gaGF2ZQo+Pj4gdmFyaWFudHMgb2YgY3B1X3t1cCxkb3dufSgpIHdoaWNoIGludm9rZSB0aGUg
YmFycmllciwgYW5kIHdoaWNoCj4+PiB3b3VsZCBiZSB1c2VkIGJ5IGFsbCBydW50aW1lIGludm9j
YXRpb25zPwo+Pj4KPj4+IFRoZSBvdGhlciBxdWVzdGlvbiBvZiBjb3Vyc2UgaXMgd2h5IGVhcmx5
IGluaXQgY29kZSBpcyBzcGVjaWFsIGluCj4+PiB0aGlzIHJlZ2FyZC4gSWYgaXQgaW5kZWVkIHdh
cywgcGVyaGFwcyB0aGUgYmFycmllciBpbnZvY2F0aW9uIGNvdWxkCj4+PiBhbHNvIGJlIHRpZWQg
dG8gY2VydGFpbiBTWVNfU1RBVEVfKiB2YWx1ZXM/Cj4+Cj4+IEl0J3Mgbm90IHNwZWNpYWwgLSBp
biBmYWN0IGl0IHN0YXJ0cyBhZnRlciBSQ1UgaXMgaW5pdGlhbGl6ZWQuIFRoZSBpc3N1ZQo+PiBp
cywgYXMgeW91IHNhaWQsIHVubmVjZXNzYXJ5IG92ZXJoZWFkLgo+IAo+IFdlbGwsIGlmIGl0J3Mg
dW5uZWNlc3Nhcnkgb3ZlcmhlYWQsIHRoZW4gaXQgaXMgc3BlY2lhbCBpbiBzb21lIHdheS4KPiBB
ZnRlciBhbGwgYXQgcnVudGltZSB0aGUgb3ZlcmhlYWQgaXNuJ3QgdW5uZWNlc3NhcnkuIElzIGl0
IHBlcmhhcHMKPiBqdXN0IHRoYXQgY3VycmVudGx5IHdlIGRvbid0IF9oYXBwZW5fIHRvIGhhdmUg
YW55dGhpbmcgdGhhdCB3b3VsZAo+IG1ha2UgdXNlIG9mIGFuIFJDVSBiYXJyaWVyIG5lY2Vzc2Fy
eSBpbiB0aGlzIGNhc2U/IEluIHdoaWNoIGNhc2UgaXQKPiB3b3VsZCBiZSBhIHByb2JsZW0gd2Fp
dGluZyB0byBiaXRlIHVzIGRvd24gdGhlIHJvYWQ/CgpJIGFncmVlIHRvIGEgY2VydGFpbiBleHRl
bnQgdGhhdCBpdCBtaWdodCBiZSBwcnVkZW50IHRvIGF2b2lkIHNwZWNpYWwKY2FzaW5nIGV2ZW4g
aWYgd2UgY3VycmVudGx5IGtub3cgdGhhdCB0aGUgY2FzZSBpcyBzYWZlLiBMZXQgbWUgc2VlCmlm
IG92ZXJoZWFkIGlzIHRvbGVyYWJsZSBhdCBDUFUgYnJpbmcgdXAgb24gb3VyIGxhcmdlc3Qgc3lz
dGVtIGF2YWlsYWJsZQooNDQ4IENQVXMpLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
