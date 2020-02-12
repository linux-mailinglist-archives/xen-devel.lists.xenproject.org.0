Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4F15B3CA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:33:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20X7-0002uc-Al; Wed, 12 Feb 2020 22:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20X5-0002uS-Je
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:30:59 +0000
X-Inumbo-ID: 579248de-4de7-11ea-b803-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 579248de-4de7-11ea-b803-12813bfff9fa;
 Wed, 12 Feb 2020 22:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546660; x=1613082660;
 h=date:from:to:subject:message-id:mime-version;
 bh=lXUfPVCqOw43hJmA37ZNPhgrTtTkVXf8HnLPkdJWiEM=;
 b=K4QvLvukE4XCZsxDVAajjZadK8oOy2xv3blqAcJviLA1FxH1Vm355R/g
 Z817rZCdaLXhJfHsf39UC7aQdabgYgVESj0FCHRs28l+uhS428q6NPOiJ
 QhtL1gyLoi3oEPC3NTGeROCeblX6w2h+RDhlldzVaEwaqAQO6MudT2JJc g=;
IronPort-SDR: wj0rP/4g7pIfoN8xmEr/giPmQ1SZih6GVao218XZ5Ck786gidFMD9z9Ffv8EwCVBjqDYTkm3/m
 i77D21jlZtKg==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="16932720"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 12 Feb 2020 22:30:45 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5CFCAA2483; Wed, 12 Feb 2020 22:30:43 +0000 (UTC)
Received: from EX13D05UWC004.ant.amazon.com (10.43.162.223) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:30:13 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC004.ant.amazon.com (10.43.162.223) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:30:12 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:30:12 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id C890D400D1; Wed, 12 Feb 2020 22:30:12 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:30:12 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <20200212223012.GA3445@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 01/12] xen/manage: keep track of the
 on-going suspend mode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpHdWVzdCBoaWJlcm5h
dGlvbiBpcyBkaWZmZXJlbnQgZnJvbSB4ZW4gc3VzcGVuZC9yZXN1bWUvbGl2ZSBtaWdyYXRpb24u
ClhlbiBzYXZlL3Jlc3RvcmUgZG9lcyBub3QgdXNlIHBtX29wcyBhcyBpcyBuZWVkZWQgYnkgZ3Vl
c3QgaGliZXJuYXRpb24uCkhpYmVybmF0aW9uIGluIGd1ZXN0IGZvbGxvd3MgQUNQSSBwYXRoIGFu
ZCBpcyBndWVzdCBpbml0aXRhdGVkICwgdGhlCmhpYmVybmF0aW9uIGltYWdlIGlzIHNhdmVkIHdp
dGhpbiBndWVzdCBhcyBjb21wYXJlZCB0byBsYXRlciBtb2Rlcwp3aGljaCBhcmUgeGVuIHRvb2xz
dGFjayBhc3Npc3RlZCBhbmQgaW1hZ2UgY3JlYXRpb24vc3RvcmFnZSBpcyBpbgpjb250cm9sIG9m
IGh5cGVydmlzb3IvaG9zdCBtYWNoaW5lLgpUbyBkaWZmZXJlbnRpYXRlIGJldHdlZW4gWGVuIHN1
c3BlbmQgYW5kIFBNIGhpYmVybmF0aW9uLCBrZWVwIHRyYWNrCm9mIHRoZSBvbi1nb2luZyBzdXNw
ZW5kIG1vZGUgYnkgbWFpbmx5IHVzaW5nIGEgbmV3IFBNIG5vdGlmaWVyLgpJbnRyb2R1Y2Ugc2lt
cGxlIGZ1bmN0aW9ucyB3aGljaCBoZWxwIHRvIGtub3cgdGhlIG9uLWdvaW5nIHN1c3BlbmQgbW9k
ZQpzbyB0aGF0IG90aGVyIFhlbi1yZWxhdGVkIGNvZGUgY2FuIGJlaGF2ZSBkaWZmZXJlbnRseSBh
Y2NvcmRpbmcgdG8gdGhlCmN1cnJlbnQgc3VzcGVuZCBtb2RlLgpTaW5jZSBYZW4gc3VzcGVuZCBk
b2Vzbid0IGhhdmUgY29ycmVzcG9uZGluZyBQTSBldmVudCwgaXRzIG1haW4gbG9naWMKaXMgbW9k
ZmllZCB0byBhY3F1aXJlIHBtX211dGV4IGFuZCBzZXQgdGhlIGN1cnJlbnQgbW9kZS4KClRob3Vn
aCwgYWNxdWlybmcgcG1fbXV0ZXggaXMgc3RpbGwgcmlnaHQgdGhpbmcgdG8gZG8sIHdlIG1heQpz
ZWUgZGVhZGxvY2sgaWYgUE0gaGliZXJuYXRpb24gaXMgaW50ZXJydXB0ZWQgYnkgWGVuIHN1c3Bl
bmQuClBNIGhpYmVybmF0aW9uIGRlcGVuZHMgb24geGVud2F0Y2ggdGhyZWFkIHRvIHByb2Nlc3Mg
eGVuYnVzIHN0YXRlCnRyYW5zYWN0aW9ucywgYnV0IHRoZSB0aHJlYWQgd2lsbCBzbGVlcCB0byB3
YWl0IHBtX211dGV4IHdoaWNoIGlzCmFscmVhZHkgaGVsZCBieSBQTSBoaWJlcm5hdGlvbiBjb250
ZXh0IGluIHRoZSBzY2VuYXJpby4gWGVuIHNodXRkb3duCmNvZGUgbWF5IG5lZWQgc29tZSBjaGFu
Z2VzIHRvIGF2b2lkIHRoZSBpc3N1ZS4KCltBbmNoYWwgQ2hhbmdlbG9nOiBNZXJnZWQgcGF0Y2gg
eGVuL21hbmFnZTogaW50cm9kdWNlIGhlbHBlciBmdW5jdGlvbgp0byBrbm93IHRoZSBvbi1nb2lu
ZyBzdXNwZW5kIG1vZGUgaW50byB0aGlzIG9uZSBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5XQpTaWdu
ZWQtb2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNvbT4KU2lnbmVkLW9m
Zi1ieTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgotLS0KCkNoYW5nZXMg
c2luY2UgVjI6IE5vbmUKLS0tCiBkcml2ZXJzL3hlbi9tYW5hZ2UuYyAgfCA3MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL3hlbi94ZW4tb3BzLmgg
fCAgMyArKwogMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vbWFuYWdlLmMgYi9kcml2ZXJzL3hlbi9tYW5hZ2UuYwppbmRleCBjZDA0NjY4
NGUwZDEuLjBiMzBhYjUyMmI3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vbWFuYWdlLmMKKysr
IGIvZHJpdmVycy94ZW4vbWFuYWdlLmMKQEAgLTE0LDYgKzE0LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9mcmVlemVyLmg+CiAjaW5jbHVkZSA8bGludXgvc3lzY29yZV9vcHMuaD4KICNpbmNsdWRlIDxs
aW51eC9leHBvcnQuaD4KKyNpbmNsdWRlIDxsaW51eC9zdXNwZW5kLmg+CiAKICNpbmNsdWRlIDx4
ZW4veGVuLmg+CiAjaW5jbHVkZSA8eGVuL3hlbmJ1cy5oPgpAQCAtNDAsNiArNDEsMzEgQEAgZW51
bSBzaHV0ZG93bl9zdGF0ZSB7CiAvKiBJZ25vcmUgbXVsdGlwbGUgc2h1dGRvd24gcmVxdWVzdHMu
ICovCiBzdGF0aWMgZW51bSBzaHV0ZG93bl9zdGF0ZSBzaHV0dGluZ19kb3duID0gU0hVVERPV05f
SU5WQUxJRDsKIAorZW51bSBzdXNwZW5kX21vZGVzIHsKKwlOT19TVVNQRU5EID0gMCwKKwlYRU5f
U1VTUEVORCwKKwlQTV9TVVNQRU5ELAorCVBNX0hJQkVSTkFUSU9OLAorfTsKKworLyogUHJvdGVj
dGVkIGJ5IHBtX211dGV4ICovCitzdGF0aWMgZW51bSBzdXNwZW5kX21vZGVzIHN1c3BlbmRfbW9k
ZSA9IE5PX1NVU1BFTkQ7CisKK2Jvb2wgeGVuX3N1c3BlbmRfbW9kZV9pc194ZW5fc3VzcGVuZCh2
b2lkKQoreworCXJldHVybiBzdXNwZW5kX21vZGUgPT0gWEVOX1NVU1BFTkQ7Cit9CisKK2Jvb2wg
eGVuX3N1c3BlbmRfbW9kZV9pc19wbV9zdXNwZW5kKHZvaWQpCit7CisJcmV0dXJuIHN1c3BlbmRf
bW9kZSA9PSBQTV9TVVNQRU5EOworfQorCitib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1faGli
ZXJuYXRpb24odm9pZCkKK3sKKwlyZXR1cm4gc3VzcGVuZF9tb2RlID09IFBNX0hJQkVSTkFUSU9O
OworfQorCiBzdHJ1Y3Qgc3VzcGVuZF9pbmZvIHsKIAlpbnQgY2FuY2VsbGVkOwogfTsKQEAgLTk5
LDYgKzEyNSwxMCBAQCBzdGF0aWMgdm9pZCBkb19zdXNwZW5kKHZvaWQpCiAJaW50IGVycjsKIAlz
dHJ1Y3Qgc3VzcGVuZF9pbmZvIHNpOwogCisJbG9ja19zeXN0ZW1fc2xlZXAoKTsKKworCXN1c3Bl
bmRfbW9kZSA9IFhFTl9TVVNQRU5EOworCiAJc2h1dHRpbmdfZG93biA9IFNIVVRET1dOX1NVU1BF
TkQ7CiAKIAllcnIgPSBmcmVlemVfcHJvY2Vzc2VzKCk7CkBAIC0xNjIsNiArMTkyLDEwIEBAIHN0
YXRpYyB2b2lkIGRvX3N1c3BlbmQodm9pZCkKIAl0aGF3X3Byb2Nlc3NlcygpOwogb3V0OgogCXNo
dXR0aW5nX2Rvd24gPSBTSFVURE9XTl9JTlZBTElEOworCisJc3VzcGVuZF9tb2RlID0gTk9fU1VT
UEVORDsKKworCXVubG9ja19zeXN0ZW1fc2xlZXAoKTsKIH0KICNlbmRpZgkvKiBDT05GSUdfSElC
RVJOQVRFX0NBTExCQUNLUyAqLwogCkBAIC0zODcsMyArNDIxLDQyIEBAIGludCB4ZW5fc2V0dXBf
c2h1dGRvd25fZXZlbnQodm9pZCkKIEVYUE9SVF9TWU1CT0xfR1BMKHhlbl9zZXR1cF9zaHV0ZG93
bl9ldmVudCk7CiAKIHN1YnN5c19pbml0Y2FsbCh4ZW5fc2V0dXBfc2h1dGRvd25fZXZlbnQpOwor
CitzdGF0aWMgaW50IHhlbl9wbV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5vdGlm
aWVyLAorCQkJICAgdW5zaWduZWQgbG9uZyBwbV9ldmVudCwgdm9pZCAqdW51c2VkKQoreworCXN3
aXRjaCAocG1fZXZlbnQpIHsKKwljYXNlIFBNX1NVU1BFTkRfUFJFUEFSRToKKwkJc3VzcGVuZF9t
b2RlID0gUE1fU1VTUEVORDsKKwkJYnJlYWs7CisJY2FzZSBQTV9ISUJFUk5BVElPTl9QUkVQQVJF
OgorCWNhc2UgUE1fUkVTVE9SRV9QUkVQQVJFOgorCQlzdXNwZW5kX21vZGUgPSBQTV9ISUJFUk5B
VElPTjsKKwkJYnJlYWs7CisJY2FzZSBQTV9QT1NUX1NVU1BFTkQ6CisJY2FzZSBQTV9QT1NUX1JF
U1RPUkU6CisJY2FzZSBQTV9QT1NUX0hJQkVSTkFUSU9OOgorCQkvKiBTZXQgYmFjayB0byB0aGUg
ZGVmYXVsdCAqLworCQlzdXNwZW5kX21vZGUgPSBOT19TVVNQRU5EOworCQlicmVhazsKKwlkZWZh
dWx0OgorCQlwcl93YXJuKCJSZWNlaXZlIHVua25vd24gUE0gZXZlbnQgMHglbHhcbiIsIHBtX2V2
ZW50KTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0dXJuIDA7Cit9OworCitzdGF0aWMg
c3RydWN0IG5vdGlmaWVyX2Jsb2NrIHhlbl9wbV9ub3RpZmllcl9ibG9jayA9IHsKKwkubm90aWZp
ZXJfY2FsbCA9IHhlbl9wbV9ub3RpZmllcgorfTsKKworc3RhdGljIGludCB4ZW5fc2V0dXBfcG1f
bm90aWZpZXIodm9pZCkKK3sKKwlpZiAoIXhlbl9odm1fZG9tYWluKCkpCisJCXJldHVybiAtRU5P
REVWOworCisJcmV0dXJuIHJlZ2lzdGVyX3BtX25vdGlmaWVyKCZ4ZW5fcG1fbm90aWZpZXJfYmxv
Y2spOworfQorCitzdWJzeXNfaW5pdGNhbGwoeGVuX3NldHVwX3BtX25vdGlmaWVyKTsKZGlmZiAt
LWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaAppbmRl
eCBkODk5NjlhYTk5NDIuLjZjMzZlMTYxZGZkMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4veGVu
LW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAtNDAsNiArNDAsOSBAQCB1NjQg
eGVuX3N0ZWFsX2Nsb2NrKGludCBjcHUpOwogCiBpbnQgeGVuX3NldHVwX3NodXRkb3duX2V2ZW50
KHZvaWQpOwogCitib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfeGVuX3N1c3BlbmQodm9pZCk7Citi
b29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1fc3VzcGVuZCh2b2lkKTsKK2Jvb2wgeGVuX3N1c3Bl
bmRfbW9kZV9pc19wbV9oaWJlcm5hdGlvbih2b2lkKTsKIGV4dGVybiB1bnNpZ25lZCBsb25nICp4
ZW5fY29udGlndW91c19iaXRtYXA7CiAKICNpZiBkZWZpbmVkKENPTkZJR19YRU5fUFYpIHx8IGRl
ZmluZWQoQ09ORklHX0FSTSkgfHwgZGVmaW5lZChDT05GSUdfQVJNNjQpCi0tIAoyLjI0LjEuQU1a
TgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
