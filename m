Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC456133787
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:40:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyPl-0000rl-KC; Tue, 07 Jan 2020 23:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyPj-0000ra-8J
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:37:31 +0000
X-Inumbo-ID: ac1bf236-31a6-11ea-b836-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac1bf236-31a6-11ea-b836-bc764e2007e4;
 Tue, 07 Jan 2020 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440252; x=1609976252;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=dHtsd6l+nawwSRlVfW2a/C6I9uYdvAsPi51+r+7Gmh4=;
 b=PuTqZlWt8oHBnAwd1ArYjmdMfRoOgGjNthmJhrk5/RPDub3Ld06W396I
 MHu4VibLPVrvgOceyN5BbmtjIG5eouNj2XWfKn3s8BQfEcBk8WNgaYfhO
 T7gYvdZPOrdn46fX6zw1REWOlCNFJnNQwii+U++jv7RhNYesUUdleXGRq s=;
IronPort-SDR: zII1qidR+jA11P/idaDLlq5u230Nmzb0fNMF/8we7eclJgxeejhucz8dUyux0dxT5UvgMuuhQ6
 IXmHidkTRA9w==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="11408213"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Jan 2020 23:37:29 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id D8B11A24D9; Tue,  7 Jan 2020 23:37:26 +0000 (UTC)
Received: from EX13D07UWB003.ant.amazon.com (10.43.161.66) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:37:20 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D07UWB003.ant.amazon.com (10.43.161.66) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:37:20 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:37:20 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 5ACFC40E65; Tue,  7 Jan 2020 23:37:20 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:37:20 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.co>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>
Message-ID: <20200107233720.GA17906@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 01/11] xen/manage: keep track of the
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
Cc: anchalag@amazon.com
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
Zi1ieTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+Ci0tLQogZHJpdmVycy94
ZW4vbWFuYWdlLmMgIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiBpbmNsdWRlL3hlbi94ZW4tb3BzLmggfCAgMyArKysKIDIgZmlsZXMgY2hh
bmdlZCwgNzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL21hbmFnZS5j
IGIvZHJpdmVycy94ZW4vbWFuYWdlLmMKaW5kZXggY2QwNDY2ODRlMGQxLi4wYjMwYWI1MjJiNzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL21hbmFnZS5jCisrKyBiL2RyaXZlcnMveGVuL21hbmFn
ZS5jCkBAIC0xNCw2ICsxNCw3IEBACiAjaW5jbHVkZSA8bGludXgvZnJlZXplci5oPgogI2luY2x1
ZGUgPGxpbnV4L3N5c2NvcmVfb3BzLmg+CiAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CisjaW5j
bHVkZSA8bGludXgvc3VzcGVuZC5oPgogCiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1ZGUg
PHhlbi94ZW5idXMuaD4KQEAgLTQwLDYgKzQxLDMxIEBAIGVudW0gc2h1dGRvd25fc3RhdGUgewog
LyogSWdub3JlIG11bHRpcGxlIHNodXRkb3duIHJlcXVlc3RzLiAqLwogc3RhdGljIGVudW0gc2h1
dGRvd25fc3RhdGUgc2h1dHRpbmdfZG93biA9IFNIVVRET1dOX0lOVkFMSUQ7CiAKK2VudW0gc3Vz
cGVuZF9tb2RlcyB7CisJTk9fU1VTUEVORCA9IDAsCisJWEVOX1NVU1BFTkQsCisJUE1fU1VTUEVO
RCwKKwlQTV9ISUJFUk5BVElPTiwKK307CisKKy8qIFByb3RlY3RlZCBieSBwbV9tdXRleCAqLwor
c3RhdGljIGVudW0gc3VzcGVuZF9tb2RlcyBzdXNwZW5kX21vZGUgPSBOT19TVVNQRU5EOworCiti
b29sIHhlbl9zdXNwZW5kX21vZGVfaXNfeGVuX3N1c3BlbmQodm9pZCkKK3sKKwlyZXR1cm4gc3Vz
cGVuZF9tb2RlID09IFhFTl9TVVNQRU5EOworfQorCitib29sIHhlbl9zdXNwZW5kX21vZGVfaXNf
cG1fc3VzcGVuZCh2b2lkKQoreworCXJldHVybiBzdXNwZW5kX21vZGUgPT0gUE1fU1VTUEVORDsK
K30KKworYm9vbCB4ZW5fc3VzcGVuZF9tb2RlX2lzX3BtX2hpYmVybmF0aW9uKHZvaWQpCit7CisJ
cmV0dXJuIHN1c3BlbmRfbW9kZSA9PSBQTV9ISUJFUk5BVElPTjsKK30KKwogc3RydWN0IHN1c3Bl
bmRfaW5mbyB7CiAJaW50IGNhbmNlbGxlZDsKIH07CkBAIC05OSw2ICsxMjUsMTAgQEAgc3RhdGlj
IHZvaWQgZG9fc3VzcGVuZCh2b2lkKQogCWludCBlcnI7CiAJc3RydWN0IHN1c3BlbmRfaW5mbyBz
aTsKIAorCWxvY2tfc3lzdGVtX3NsZWVwKCk7CisKKwlzdXNwZW5kX21vZGUgPSBYRU5fU1VTUEVO
RDsKKwogCXNodXR0aW5nX2Rvd24gPSBTSFVURE9XTl9TVVNQRU5EOwogCiAJZXJyID0gZnJlZXpl
X3Byb2Nlc3NlcygpOwpAQCAtMTYyLDYgKzE5MiwxMCBAQCBzdGF0aWMgdm9pZCBkb19zdXNwZW5k
KHZvaWQpCiAJdGhhd19wcm9jZXNzZXMoKTsKIG91dDoKIAlzaHV0dGluZ19kb3duID0gU0hVVERP
V05fSU5WQUxJRDsKKworCXN1c3BlbmRfbW9kZSA9IE5PX1NVU1BFTkQ7CisKKwl1bmxvY2tfc3lz
dGVtX3NsZWVwKCk7CiB9CiAjZW5kaWYJLyogQ09ORklHX0hJQkVSTkFURV9DQUxMQkFDS1MgKi8K
IApAQCAtMzg3LDMgKzQyMSw0MiBAQCBpbnQgeGVuX3NldHVwX3NodXRkb3duX2V2ZW50KHZvaWQp
CiBFWFBPUlRfU1lNQk9MX0dQTCh4ZW5fc2V0dXBfc2h1dGRvd25fZXZlbnQpOwogCiBzdWJzeXNf
aW5pdGNhbGwoeGVuX3NldHVwX3NodXRkb3duX2V2ZW50KTsKKworc3RhdGljIGludCB4ZW5fcG1f
bm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwKKwkJCSAgIHVuc2lnbmVk
IGxvbmcgcG1fZXZlbnQsIHZvaWQgKnVudXNlZCkKK3sKKwlzd2l0Y2ggKHBtX2V2ZW50KSB7CisJ
Y2FzZSBQTV9TVVNQRU5EX1BSRVBBUkU6CisJCXN1c3BlbmRfbW9kZSA9IFBNX1NVU1BFTkQ7CisJ
CWJyZWFrOworCWNhc2UgUE1fSElCRVJOQVRJT05fUFJFUEFSRToKKwljYXNlIFBNX1JFU1RPUkVf
UFJFUEFSRToKKwkJc3VzcGVuZF9tb2RlID0gUE1fSElCRVJOQVRJT047CisJCWJyZWFrOworCWNh
c2UgUE1fUE9TVF9TVVNQRU5EOgorCWNhc2UgUE1fUE9TVF9SRVNUT1JFOgorCWNhc2UgUE1fUE9T
VF9ISUJFUk5BVElPTjoKKwkJLyogU2V0IGJhY2sgdG8gdGhlIGRlZmF1bHQgKi8KKwkJc3VzcGVu
ZF9tb2RlID0gTk9fU1VTUEVORDsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcHJfd2FybigiUmVj
ZWl2ZSB1bmtub3duIFBNIGV2ZW50IDB4JWx4XG4iLCBwbV9ldmVudCk7CisJCXJldHVybiAtRUlO
VkFMOworCX0KKworCXJldHVybiAwOworfTsKKworc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9j
ayB4ZW5fcG1fbm90aWZpZXJfYmxvY2sgPSB7CisJLm5vdGlmaWVyX2NhbGwgPSB4ZW5fcG1fbm90
aWZpZXIKK307CisKK3N0YXRpYyBpbnQgeGVuX3NldHVwX3BtX25vdGlmaWVyKHZvaWQpCit7CisJ
aWYgKCF4ZW5faHZtX2RvbWFpbigpKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXJldHVybiByZWdp
c3Rlcl9wbV9ub3RpZmllcigmeGVuX3BtX25vdGlmaWVyX2Jsb2NrKTsKK30KKworc3Vic3lzX2lu
aXRjYWxsKHhlbl9zZXR1cF9wbV9ub3RpZmllcik7CmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94
ZW4tb3BzLmggYi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKaW5kZXggZDg5OTY5YWE5OTQyLi42YzM2
ZTE2MWRmZDEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaAorKysgYi9pbmNsdWRl
L3hlbi94ZW4tb3BzLmgKQEAgLTQwLDYgKzQwLDkgQEAgdTY0IHhlbl9zdGVhbF9jbG9jayhpbnQg
Y3B1KTsKIAogaW50IHhlbl9zZXR1cF9zaHV0ZG93bl9ldmVudCh2b2lkKTsKIAorYm9vbCB4ZW5f
c3VzcGVuZF9tb2RlX2lzX3hlbl9zdXNwZW5kKHZvaWQpOworYm9vbCB4ZW5fc3VzcGVuZF9tb2Rl
X2lzX3BtX3N1c3BlbmQodm9pZCk7Citib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1faGliZXJu
YXRpb24odm9pZCk7CiBleHRlcm4gdW5zaWduZWQgbG9uZyAqeGVuX2NvbnRpZ3VvdXNfYml0bWFw
OwogCiAjaWYgZGVmaW5lZChDT05GSUdfWEVOX1BWKSB8fCBkZWZpbmVkKENPTkZJR19BUk0pIHx8
IGRlZmluZWQoQ09ORklHX0FSTTY0KQotLSAKMi4xNS4zLkFNWk4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
