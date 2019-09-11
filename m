Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88702AFEAF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 16:25:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i83WE-0004lS-M3; Wed, 11 Sep 2019 14:22:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i83WC-0004lN-P4
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 14:22:48 +0000
X-Inumbo-ID: a0008c20-d49f-11e9-83d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0008c20-d49f-11e9-83d5-12813bfff9fa;
 Wed, 11 Sep 2019 14:22:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FA77BB4A;
 Wed, 11 Sep 2019 14:22:46 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-21-jgross@suse.com>
 <7b688998-123a-caec-9e01-eb3ac86f9dfc@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <39dae4c6-d8a9-a0d7-68fd-89610c9645c3@suse.com>
Date: Wed, 11 Sep 2019 16:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7b688998-123a-caec-9e01-eb3ac86f9dfc@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 20/48] xen: let vcpu_create() select
 processor
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTU6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTM2OCwxNCArMzY4LDUyIEBAIHN0
YXRpYyBzdHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfYWxsb2NfdW5pdChzdHJ1Y3QgdmNwdSAqdikK
Pj4gICAgICAgcmV0dXJuIE5VTEw7Cj4+ICAgfQo+PiAgIAo+PiAtaW50IHNjaGVkX2luaXRfdmNw
dShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHByb2Nlc3NvcikKPj4gK3N0YXRpYyB1bnNp
Z25lZCBpbnQgc2NoZWRfc2VsZWN0X2luaXRpYWxfY3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+
IAo+IEdpdmVuIHRoZSByZXNwb25zZSBvbiBhbiBlYXJsaWVyIHNpbWlsYXIgcXVlc3Rpb24sIEkg
ZG9uJ3Qgc3VwcG9zZQo+IEkgY291bGQgdGFsayB5b3UgaW50byBkcm9wcGluZyB0aGUgc2NoZWRf
IHByZWZpeCBoZXJlPwoKSSBsaWtlIGl0IGJldHRlciB3aXRoIHByZWZpeC4gQW55IG9waW5pb25z
IGJ5IHRoZSBzY2hlZHVsZXIgbWFpbnRhaW5lcnM/Cgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQtaWYuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+PiBAQCAt
NDU3LDcgKzQ1Nyw3IEBAIHN0cnVjdCBjcHVwb29sCj4+ICAgI2RlZmluZSBjcHVwb29sX29ubGlu
ZV9jcHVtYXNrKF9wb29sKSBcCj4+ICAgICAgICgoKF9wb29sKSA9PSBOVUxMKSA/ICZjcHVfb25s
aW5lX21hcCA6IChfcG9vbCktPmNwdV92YWxpZCkKPj4gICAKPj4gLXN0YXRpYyBpbmxpbmUgY3B1
bWFza190KiBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHN0cnVjdCBkb21haW4gKmQpCj4+ICtzdGF0
aWMgaW5saW5lIGNwdW1hc2tfdCogY3B1cG9vbF9kb21haW5fY3B1bWFzayhjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkKQo+IAo+IEl0IHdvdWxkIGNlcnRhaW5seSBiZSBuaWNlIHRvIGNvcnJlY3QgdGhl
IG1pc3BsYWNlICogaGVyZSBhdCB0aGUKPiBzYW1lIHRpbWUgKHdoaWNoIGNsZWFybHkgY291bGQg
YmUgZG9uZSB3aGlsZSBjb21taXR0aW5nLCBpZgo+IGV2ZXJ5dGhpbmcgdXAgdG8gaGVyZSB3YXMg
cmVhZHkgdG8gZ28gaW4pLgoKSSdsbCBkbyBpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
