Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1ED14580E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:42:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHBe-0000Fg-Lp; Wed, 22 Jan 2020 14:40:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuHBd-0000FW-BG
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:40:53 +0000
X-Inumbo-ID: 2b5e0000-3d25-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b5e0000-3d25-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 14:40:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C1B1B500;
 Wed, 22 Jan 2020 14:40:43 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8a610c6-b128-7d3b-09db-e3b7cfe710ad@suse.com>
Date: Wed, 22 Jan 2020 15:40:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] x86/EPT: drop redundant
 ept_p2m_type_to_flags() parameters
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIGNhbGxlcnMgc2V0IHRoZSByZXNwZWN0aXZlIGZpZWxkcyBpbiB0aGUgZW50cnkgYmVpbmcg
dXBkYXRlZCBiZWZvcmUKdGhlIGNhbGwuCgpUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBj
b25zdGlmeSB0aGUgZmlyc3QgcGFyYW1ldGVyIGFzIHdlbGwgYXMKbWFrZSBhIGZldyBzdHlsZSBh
ZGp1c3RtZW50cy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KLS0tCnYyOiBEcm9wIHJlZHVuZGFudCBmdW5jdGlvbiBwYXJhbWV0ZXJzIGluc3RlYWQuCgot
LS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0t
ZXB0LmMKQEAgLTYxLDggKzYxLDggQEAgc3RhdGljIGludCBhdG9taWNfd3JpdGVfZXB0X2VudHJ5
KHN0cnVjdAogICAgIHJldHVybiAwOwogfQogCi1zdGF0aWMgdm9pZCBlcHRfcDJtX3R5cGVfdG9f
ZmxhZ3Moc3RydWN0IHAybV9kb21haW4gKnAybSwgZXB0X2VudHJ5X3QgKmVudHJ5LAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgdHlwZSwgcDJtX2FjY2Vzc190
IGFjY2VzcykKK3N0YXRpYyB2b2lkIGVwdF9wMm1fdHlwZV90b19mbGFncyhjb25zdCBzdHJ1Y3Qg
cDJtX2RvbWFpbiAqcDJtLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVwdF9l
bnRyeV90ICplbnRyeSkKIHsKICAgICAvKgogICAgICAqIEZpcnN0IGFwcGx5IHR5cGUgcGVybWlz
c2lvbnMuCkBAIC03NSw3ICs3NSw3IEBAIHN0YXRpYyB2b2lkIGVwdF9wMm1fdHlwZV90b19mbGFn
cyhzdHJ1Y3QKICAgICAgKiBEIGJpdCBpcyBzZXQgZm9yIGFsbCB3cml0YWJsZSB0eXBlcyBpbiBF
UFQgbGVhZiBlbnRyeSwgZXhjZXB0IGZvcgogICAgICAqIGxvZy1kaXJ0eSB0eXBlIHdpdGggUE1M
LgogICAgICAqLwotICAgIHN3aXRjaCh0eXBlKQorICAgIHN3aXRjaCAoIGVudHJ5LT5zYV9wMm10
ICkKICAgICB7CiAgICAgICAgIGNhc2UgcDJtX2ludmFsaWQ6CiAgICAgICAgIGNhc2UgcDJtX21t
aW9fZG06CkBAIC0xNDMsOSArMTQzLDggQEAgc3RhdGljIHZvaWQgZXB0X3AybV90eXBlX3RvX2Zs
YWdzKHN0cnVjdAogICAgICAgICAgICAgYnJlYWs7CiAgICAgfQogCi0KICAgICAvKiBUaGVuIHJl
c3RyaWN0IHdpdGggYWNjZXNzIHBlcm1pc3Npb25zICovCi0gICAgc3dpdGNoIChhY2Nlc3MpIAor
ICAgIHN3aXRjaCAoIGVudHJ5LT5hY2Nlc3MgKQogICAgIHsKICAgICAgICAgY2FzZSBwMm1fYWNj
ZXNzX246CiAgICAgICAgIGNhc2UgcDJtX2FjY2Vzc19uMnJ3eDoKQEAgLTI2OSw3ICsyNjgsNyBA
QCBzdGF0aWMgYm9vbF90IGVwdF9zcGxpdF9zdXBlcl9wYWdlKHN0cnVjCiAgICAgICAgIGVwdGUt
PnNucCA9IGlzX2lvbW11X2VuYWJsZWQocDJtLT5kb21haW4pICYmIGlvbW11X3Nub29wOwogICAg
ICAgICBlcHRlLT5zdXBwcmVzc192ZSA9IDE7CiAKLSAgICAgICAgZXB0X3AybV90eXBlX3RvX2Zs
YWdzKHAybSwgZXB0ZSwgZXB0ZS0+c2FfcDJtdCwgZXB0ZS0+YWNjZXNzKTsKKyAgICAgICAgZXB0
X3AybV90eXBlX3RvX2ZsYWdzKHAybSwgZXB0ZSk7CiAKICAgICAgICAgaWYgKCAobGV2ZWwgLSAx
KSA9PSB0YXJnZXQgKQogICAgICAgICAgICAgY29udGludWU7CkBAIC01MjEsNyArNTIwLDcgQEAg
c3RhdGljIGludCByZXNvbHZlX21pc2NvbmZpZyhzdHJ1Y3QgcDJtXwogICAgICAgICAgICAgICAg
ICAgICBpZiAoIG50ICE9IGUuc2FfcDJtdCApCiAgICAgICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgIGUuc2FfcDJtdCA9IG50OwotICAgICAgICAgICAgICAgICAgICAg
ICAgZXB0X3AybV90eXBlX3RvX2ZsYWdzKHAybSwgJmUsIGUuc2FfcDJtdCwgZS5hY2Nlc3MpOwor
ICAgICAgICAgICAgICAgICAgICAgICAgZXB0X3AybV90eXBlX3RvX2ZsYWdzKHAybSwgJmUpOwog
ICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgIGUucmVjYWxjID0gMDsK
ICAgICAgICAgICAgICAgICAgICAgd3JjID0gYXRvbWljX3dyaXRlX2VwdF9lbnRyeShwMm0sICZl
cHRlW2ldLCBlLCBsZXZlbCk7CkBAIC01NzQsNyArNTczLDcgQEAgc3RhdGljIGludCByZXNvbHZl
X21pc2NvbmZpZyhzdHJ1Y3QgcDJtXwogICAgICAgICAgICAgICAgIGUuaXBhdCA9IGlwYXQ7CiAg
ICAgICAgICAgICAgICAgZS5yZWNhbGMgPSAwOwogICAgICAgICAgICAgICAgIGlmICggcmVjYWxj
ICYmIHAybV9pc19jaGFuZ2VhYmxlKGUuc2FfcDJtdCkgKQotICAgICAgICAgICAgICAgICAgICBl
cHRfcDJtX3R5cGVfdG9fZmxhZ3MocDJtLCAmZSwgZS5zYV9wMm10LCBlLmFjY2Vzcyk7CisgICAg
ICAgICAgICAgICAgICAgIGVwdF9wMm1fdHlwZV90b19mbGFncyhwMm0sICZlKTsKICAgICAgICAg
ICAgICAgICB3cmMgPSBhdG9taWNfd3JpdGVfZXB0X2VudHJ5KHAybSwgJmVwdGVbaV0sIGUsIGxl
dmVsKTsKICAgICAgICAgICAgICAgICBBU1NFUlQod3JjID09IDApOwogICAgICAgICAgICAgfQpA
QCAtNzg5LDcgKzc4OCw3IEBAIGVwdF9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwg
Z2YKICAgICAgICAgICAgICBpb21tdV9mbGFncyApCiAgICAgICAgICAgICBuZWVkX21vZGlmeV92
dGRfdGFibGUgPSAwOwogCi0gICAgICAgIGVwdF9wMm1fdHlwZV90b19mbGFncyhwMm0sICZuZXdf
ZW50cnksIHAybXQsIHAybWEpOworICAgICAgICBlcHRfcDJtX3R5cGVfdG9fZmxhZ3MocDJtLCAm
bmV3X2VudHJ5KTsKICAgICB9CiAKICAgICBpZiAoIHN2ZSAhPSAtMSApCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
