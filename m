Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF51337A5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:45:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyVb-0002Ci-WD; Tue, 07 Jan 2020 23:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyVa-0002CU-Hs
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:43:34 +0000
X-Inumbo-ID: 843d1a0a-31a7-11ea-b56d-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 843d1a0a-31a7-11ea-b56d-bc764e2007e4;
 Tue, 07 Jan 2020 23:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440615; x=1609976615;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=rdcg1lWycoz2N6RBe/TY1zMNmoMIsPWFhPaqjiy0cqo=;
 b=vFyaKuFvdk6gTKUientBsLj0fvn4rbn/bmbVNCCEJzBpM+jDCusRRwJX
 KuXQzsoDkfPtZVQ5H6Z/ytAbz9hMlBTKmtXgHKN+4/1Iw4GJVk5LpBxvT
 OyBFCtb4ne8FSLrSyT0OSIiXWGMURTnPnAFl2/ESy8TgahkHFsIhIJuBy 0=;
IronPort-SDR: axEFrB4PTHlFKe/HXSD29MdTq89JZXh7B1fKqv3wb6QDgYRWQBHq3hPDRCvX3S368jrGZCfCgc
 QU7WOYAKbDQA==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="17326029"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Jan 2020 23:43:32 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id E2104A01E2; Tue,  7 Jan 2020 23:43:24 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:43:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:43:06 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1236.3 via Frontend Transport; Tue, 7 Jan 2020 23:43:06 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 0A80440E65; Tue,  7 Jan 2020 23:43:06 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:43:06 +0000
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
Message-ID: <20200107234306.GA18610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 07/11] x86/xen: save and restore steal
 clock during hibernation
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

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpDdXJyZW50bHksIHN0
ZWFsIHRpbWUgYWNjb3VudGluZyBjb2RlIGluIHNjaGVkdWxlciBleHBlY3RzIHN0ZWFsIGNsb2Nr
CmNhbGxiYWNrIHRvIHByb3ZpZGUgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHZhbHVlLiBJZiB0
aGUgYWNjb3VudGluZwpjb2RlIHJlY2VpdmVzIGEgc21hbGxlciB2YWx1ZSB0aGFuIHByZXZpb3Vz
IG9uZSwgaXQgdXNlcyBhIG5lZ2F0aXZlCnZhbHVlIHRvIGNhbGN1bGF0ZSBzdGVhbCB0aW1lIGFu
ZCByZXN1bHRzIGluIGluY29ycmVjdGx5IHVwZGF0ZWQgaWRsZQphbmQgc3RlYWwgdGltZSBhY2Nv
dW50aW5nLiBUaGlzIGJyZWFrcyB1c2Vyc3BhY2UgdG9vbHMgd2hpY2ggcmVhZAovcHJvYy9zdGF0
LgoKdG9wIC0gMDg6MDU6MzUgdXAgIDI6MTIsICAzIHVzZXJzLCAgbG9hZCBhdmVyYWdlOiAwLjAw
LCAwLjA3LCAwLjIzClRhc2tzOiAgODAgdG90YWwsICAgMSBydW5uaW5nLCAgNzkgc2xlZXBpbmcs
ICAgMCBzdG9wcGVkLCAgIDAgem9tYmllCkNwdShzKTogIDAuMCV1cywgIDAuMCVzeSwgIDAuMCVu
aSwzMDEwMC4wJWlkLCAgMC4wJXdhLCAgMC4wJWhpLCAwLjAlc2ksCi0xMjUzODc0MjA0NjcyLjAl
c3QKClRoaXMgY2FuIGFjdHVhbGx5IGhhcHBlbiB3aGVuIGEgWGVuIFBWSFZNIGd1ZXN0IGdldHMg
cmVzdG9yZWQgZnJvbQpoaWJlcm5hdGlvbiwgYmVjYXVzZSBzdWNoIGEgcmVzdG9yZWQgZ3Vlc3Qg
aXMganVzdCBhIGZyZXNoIGRvbWFpbiBmcm9tClhlbiBwZXJzcGVjdGl2ZSBhbmQgdGhlIHRpbWUg
aW5mb3JtYXRpb24gaW4gcnVuc3RhdGUgaW5mbyBzdGFydHMgb3Zlcgpmcm9tIHNjcmF0Y2guCgpJ
bnRyb2R1Y2UgeGVuX3NhdmVfc3RlYWxfY2xvY2soKSB3aGljaCBzYXZlcyBjdXJyZW50IHN0ZWFs
IGNsb2NrIHZhbHVlcwpvZiBhbGwgcHJlc2VudCBDUFVzIGluIHJ1bnN0YXRlIGluZm8gaW50byBw
ZXItY3B1IHZhcmlhYmxlcyBkdXJpbmcgc3lzdGVtCmNvcmUgb3BzIHN1c3BlbmQgY2FsbGJhY2tz
LiBJdHMgY291dGVycGFydCwgeGVuX3Jlc3RvcmVfc3RlYWxfY2xvY2soKSwKcmVzdG9yZXMgYSBi
b290IENQVSdzIHN0ZWFsIGNsb2NrIGluIHRoZSBzeXN0ZW0gY29yZSByZXN1bWUgY2FsbGJhY2su
IEl0CnNldHMgb2Zmc2V0IGlmIGl0IGZvdW5kIHRoZSBjdXJyZW50IHZhbHVlcyBpbiBydW5zdGF0
ZSBpbmZvIGFyZSBzbWFsbGVyCnRoYW4gcHJldmlvdXMgb25lcy4geGVuX3N0ZWFsX2Nsb2NrKCkg
aXMgYWxzbyBtb2RpZmllZCB0byB1c2UgdGhlIG9mZnNldAp0byBlbnN1cmUgdGhhdCBzY2hlZHVs
ZXIgb25seSBzZWVzIG1vbm90b25pY2FsbHkgaW5jcmVhc2luZyBudW1iZXIuCgpGb3Igbm9uLWJv
b3QgQ1BVcywgcmVzdG9yZSBhZnRlciB0aGV5J3JlIGJyb3VnaHQgdXAsIGJlY2F1c2UgcnVuc3Rh
dGUKaW5mbyBmb3Igbm9uLWJvb3QgQ1BVcyBhcmUgbm90IGFjdGl2ZSB1bnRpbCB0aGVuLgoKW0Fu
Y2hhbCBDaGFuZ2Vsb2c6IE1lcmdlZCBwYXRjaCB4ZW4vdGltZTogaW50cm9kdWNlIHhlbl97c2F2
ZSxyZXN0b3JlfV9zdGVhbF9jbG9jawp3aXRoIHRoaXMgb25lIGZvciBiZXR0ZXIgY29kZSByZWFk
YWJpbGl0eV0KU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5j
b20+ClNpZ25lZC1vZmYtYnk6IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6b24uY29tPgot
LS0KIGFyY2gveDg2L3hlbi9zdXNwZW5kLmMgfCAxMyArKysrKysrKysrKystCiBhcmNoL3g4Ni94
ZW4vdGltZS5jICAgIHwgIDMgKysrCiBkcml2ZXJzL3hlbi90aW1lLmMgICAgIHwgMjggKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQogaW5jbHVkZS94ZW4veGVuLW9wcy5oICB8ICAyICsrCiA0
IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYveGVuL3N1c3BlbmQuYyBiL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMKaW5k
ZXggNzg0YzQ0ODQxMDBiLi5kYWUwZjc0ZjUzOTAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9z
dXNwZW5kLmMKKysrIGIvYXJjaC94ODYveGVuL3N1c3BlbmQuYwpAQCAtOTEsMTIgKzkxLDIwIEBA
IHZvaWQgeGVuX2FyY2hfc3VzcGVuZCh2b2lkKQogc3RhdGljIGludCB4ZW5fc3lzY29yZV9zdXNw
ZW5kKHZvaWQpCiB7CiAJc3RydWN0IHhlbl9yZW1vdmVfZnJvbV9waHlzbWFwIHhyZnA7Ci0JaW50
IHJldDsKKwlpbnQgY3B1LCByZXQ7CiAKIAkvKiBYZW4gc3VzcGVuZCBkb2VzIHNpbWlsYXIgc3R1
ZmZzIGluIGl0cyBvd24gbG9naWMgKi8KIAlpZiAoeGVuX3N1c3BlbmRfbW9kZV9pc194ZW5fc3Vz
cGVuZCgpKQogCQlyZXR1cm4gMDsKIAorCWZvcl9lYWNoX3ByZXNlbnRfY3B1KGNwdSkgeworCQkv
KgorCQkgKiBOb25ib290IENQVXMgYXJlIGFscmVhZHkgb2ZmbGluZSwgYnV0IHRoZSBsYXN0IGNv
cHkgb2YKKwkJICogcnVuc3RhdGUgaW5mbyBpcyBzdGlsbCBhY2Nlc3NpYmxlLgorCQkgKi8KKwkJ
eGVuX3NhdmVfc3RlYWxfY2xvY2soY3B1KTsKKwl9CisKIAl4cmZwLmRvbWlkID0gRE9NSURfU0VM
RjsKIAl4cmZwLmdwZm4gPSBfX3BhKEhZUEVSVklTT1Jfc2hhcmVkX2luZm8pID4+IFBBR0VfU0hJ
RlQ7CiAKQEAgLTExOCw2ICsxMjYsOSBAQCBzdGF0aWMgdm9pZCB4ZW5fc3lzY29yZV9yZXN1bWUo
dm9pZCkKIAogCXB2Y2xvY2tfcmVzdW1lKCk7CiAKKwkvKiBOb25ib290IENQVXMgd2lsbCBiZSBy
ZXN1bWVkIHdoZW4gdGhleSdyZSBicm91Z2h0IHVwICovCisJeGVuX3Jlc3RvcmVfc3RlYWxfY2xv
Y2soc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKwogCWdudHRhYl9yZXN1bWUoKTsKIH0KIApkaWZmIC0t
Z2l0IGEvYXJjaC94ODYveGVuL3RpbWUuYyBiL2FyY2gveDg2L3hlbi90aW1lLmMKaW5kZXggYmVm
YmRkOGIxN2YwLi44Y2Y2MzJkZGE2MDUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi90aW1lLmMK
KysrIGIvYXJjaC94ODYveGVuL3RpbWUuYwpAQCAtNTM3LDYgKzUzNyw5IEBAIHN0YXRpYyB2b2lk
IHhlbl9odm1fc2V0dXBfY3B1X2Nsb2NrZXZlbnRzKHZvaWQpCiB7CiAJaW50IGNwdSA9IHNtcF9w
cm9jZXNzb3JfaWQoKTsKIAl4ZW5fc2V0dXBfcnVuc3RhdGVfaW5mbyhjcHUpOworCWlmIChjcHUp
CisJCXhlbl9yZXN0b3JlX3N0ZWFsX2Nsb2NrKGNwdSk7CisKIAkvKgogCSAqIHhlbl9zZXR1cF90
aW1lcihjcHUpIC0gc25wcmludGYgaXMgYmFkIGluIGF0b21pYyBjb250ZXh0LiBIZW5jZQogCSAq
IGRvaW5nIGl0IHhlbl9odm1fY3B1X25vdGlmeSAod2hpY2ggZ2V0cyBjYWxsZWQgYnkgc21wX2lu
aXQgZHVyaW5nCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi90aW1lLmMgYi9kcml2ZXJzL3hlbi90
aW1lLmMKaW5kZXggMDk2ODg1OWMyOWQwLi4zNzEzZDcxNjA3MGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL3RpbWUuYworKysgYi9kcml2ZXJzL3hlbi90aW1lLmMKQEAgLTIwLDYgKzIwLDggQEAK
IAogLyogcnVuc3RhdGUgaW5mbyB1cGRhdGVkIGJ5IFhlbiAqLwogc3RhdGljIERFRklORV9QRVJf
Q1BVKHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8sIHhlbl9ydW5zdGF0ZSk7CitzdGF0aWMgREVG
SU5FX1BFUl9DUFUodTY0LCB4ZW5fcHJldl9zdGVhbF9jbG9jayk7CitzdGF0aWMgREVGSU5FX1BF
Ul9DUFUodTY0LCB4ZW5fc3RlYWxfY2xvY2tfb2Zmc2V0KTsKIAogc3RhdGljIERFRklORV9QRVJf
Q1BVKHU2NFs0XSwgb2xkX3J1bnN0YXRlX3RpbWUpOwogCkBAIC0xNDksNyArMTUxLDcgQEAgYm9v
bCB4ZW5fdmNwdV9zdG9sZW4oaW50IHZjcHUpCiAJcmV0dXJuIHBlcl9jcHUoeGVuX3J1bnN0YXRl
LCB2Y3B1KS5zdGF0ZSA9PSBSVU5TVEFURV9ydW5uYWJsZTsKIH0KIAotdTY0IHhlbl9zdGVhbF9j
bG9jayhpbnQgY3B1KQorc3RhdGljIHU2NCBfX3hlbl9zdGVhbF9jbG9jayhpbnQgY3B1KQogewog
CXN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gc3RhdGU7CiAKQEAgLTE1Nyw2ICsxNTksMzAgQEAg
dTY0IHhlbl9zdGVhbF9jbG9jayhpbnQgY3B1KQogCXJldHVybiBzdGF0ZS50aW1lW1JVTlNUQVRF
X3J1bm5hYmxlXSArIHN0YXRlLnRpbWVbUlVOU1RBVEVfb2ZmbGluZV07CiB9CiAKK3U2NCB4ZW5f
c3RlYWxfY2xvY2soaW50IGNwdSkKK3sKKwlyZXR1cm4gX194ZW5fc3RlYWxfY2xvY2soY3B1KSAr
IHBlcl9jcHUoeGVuX3N0ZWFsX2Nsb2NrX29mZnNldCwgY3B1KTsKK30KKwordm9pZCB4ZW5fc2F2
ZV9zdGVhbF9jbG9jayhpbnQgY3B1KQoreworCXBlcl9jcHUoeGVuX3ByZXZfc3RlYWxfY2xvY2ss
IGNwdSkgPSB4ZW5fc3RlYWxfY2xvY2soY3B1KTsKK30KKwordm9pZCB4ZW5fcmVzdG9yZV9zdGVh
bF9jbG9jayhpbnQgY3B1KQoreworCXU2NCBzdGVhbF9jbG9jayA9IF9feGVuX3N0ZWFsX2Nsb2Nr
KGNwdSk7CisKKwlpZiAocGVyX2NwdSh4ZW5fcHJldl9zdGVhbF9jbG9jaywgY3B1KSA+IHN0ZWFs
X2Nsb2NrKSB7CisJCS8qIE5lZWQgdG8gdXBkYXRlIHRoZSBvZmZzZXQgKi8KKwkJcGVyX2NwdSh4
ZW5fc3RlYWxfY2xvY2tfb2Zmc2V0LCBjcHUpID0KKwkJCXBlcl9jcHUoeGVuX3ByZXZfc3RlYWxf
Y2xvY2ssIGNwdSkgLSBzdGVhbF9jbG9jazsKKwl9IGVsc2UgeworCQkvKiBBdm9pZCB1bm5lY2Vz
c2FyeSBzdGVhbCBjbG9jayB3YXJwICovCisJCXBlcl9jcHUoeGVuX3N0ZWFsX2Nsb2NrX29mZnNl
dCwgY3B1KSA9IDA7CisJfQorfQorCiB2b2lkIHhlbl9zZXR1cF9ydW5zdGF0ZV9pbmZvKGludCBj
cHUpCiB7CiAJc3RydWN0IHZjcHVfcmVnaXN0ZXJfcnVuc3RhdGVfbWVtb3J5X2FyZWEgYXJlYTsK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1ZGUveGVuL3hlbi1vcHMu
aAppbmRleCAzYjM5OTJiNWIwYzIuLjEyYjNmNDQ3NGEwNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS94
ZW4veGVuLW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAtMzcsNiArMzcsOCBA
QCB2b2lkIHhlbl90aW1lX3NldHVwX2d1ZXN0KHZvaWQpOwogdm9pZCB4ZW5fbWFuYWdlX3J1bnN0
YXRlX3RpbWUoaW50IGFjdGlvbik7CiB2b2lkIHhlbl9nZXRfcnVuc3RhdGVfc25hcHNob3Qoc3Ry
dWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcmVzKTsKIHU2NCB4ZW5fc3RlYWxfY2xvY2soaW50IGNw
dSk7Cit2b2lkIHhlbl9zYXZlX3N0ZWFsX2Nsb2NrKGludCBjcHUpOwordm9pZCB4ZW5fcmVzdG9y
ZV9zdGVhbF9jbG9jayhpbnQgY3B1KTsKIAogaW50IHhlbl9zZXR1cF9zaHV0ZG93bl9ldmVudCh2
b2lkKTsKIAotLSAKMi4xNS4zLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
