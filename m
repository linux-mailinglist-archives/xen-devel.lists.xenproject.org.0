Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6215B3EE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:36:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20aJ-0003VV-O1; Wed, 12 Feb 2020 22:34:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20aI-0003VC-5F
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:34:18 +0000
X-Inumbo-ID: ccecf854-4de7-11ea-b803-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccecf854-4de7-11ea-b803-12813bfff9fa;
 Wed, 12 Feb 2020 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546857; x=1613082857;
 h=date:from:to:subject:message-id:mime-version;
 bh=h6//YngfznNHckkx9Ke5t7SZWnTpuxZy2r6uPSfxRCE=;
 b=mhpNNuNPXlBPlSj6xZmedC6K50/Ki4cAta/xkdxts73072nnMqPoKbuc
 slch8njucsLkQFtt0UbI+Vgv0irntXjRZw/NSAWY9u/1X0X1lqUSfqlQf
 F+m/fyrqK+5nWcWON3GaksTH1bT+y+uphAlzr51mkF88cqffm0WXXwGgp 8=;
IronPort-SDR: 2sE+e2jd+GGBElALb7Ph5Zz+ct1lsXDGX/PXq+AtmOqwAOaaSF/aeEOS4lmkGyqTdM+lQJLtnt
 f0+oC1hLM+lQ==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="24723164"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 12 Feb 2020 22:34:13 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 96E8728364D; Wed, 12 Feb 2020 22:34:04 +0000 (UTC)
Received: from EX13D07UWB002.ant.amazon.com (10.43.161.131) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:33:36 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D07UWB002.ant.amazon.com (10.43.161.131) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:33:35 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:33:35 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 01AA9400D1; Wed, 12 Feb 2020 22:33:35 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:33:35 +0000
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
Message-ID: <20200212223335.GA4330@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 08/12] xen/time: introduce xen_{save,
 restore}_steal_clock
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
aSwzMDEwMC4wJWlkLCAgMC4wJXdhLCAgMC4wJWhpLCAwLjAlc2ksLTEyNTM4NzQyMDQ2NzIuMCVz
dAoKVGhpcyBjYW4gYWN0dWFsbHkgaGFwcGVuIHdoZW4gYSBYZW4gUFZIVk0gZ3Vlc3QgZ2V0cyBy
ZXN0b3JlZCBmcm9tCmhpYmVybmF0aW9uLCBiZWNhdXNlIHN1Y2ggYSByZXN0b3JlZCBndWVzdCBp
cyBqdXN0IGEgZnJlc2ggZG9tYWluIGZyb20KWGVuIHBlcnNwZWN0aXZlIGFuZCB0aGUgdGltZSBp
bmZvcm1hdGlvbiBpbiBydW5zdGF0ZSBpbmZvIHN0YXJ0cyBvdmVyCmZyb20gc2NyYXRjaC4KClRo
aXMgcGF0Y2ggaW50cm9kdWNlcyB4ZW5fc2F2ZV9zdGVhbF9jbG9jaygpIHdoaWNoIHNhdmVzIGN1
cnJlbnQgdmFsdWVzCmluIHJ1bnN0YXRlIGluZm8gaW50byBwZXItY3B1IHZhcmlhYmxlcy4gSXRz
IGNvdXRlcnBhcnQsCnhlbl9yZXN0b3JlX3N0ZWFsX2Nsb2NrKCksIHNldHMgb2Zmc2V0IGlmIGl0
IGZvdW5kIHRoZSBjdXJyZW50IHZhbHVlcyBpbgpydW5zdGF0ZSBpbmZvIGFyZSBzbWFsbGVyIHRo
YW4gcHJldmlvdXMgb25lcy4geGVuX3N0ZWFsX2Nsb2NrKCkgaXMgYWxzbwptb2RpZmllZCB0byB1
c2UgdGhlIG9mZnNldCB0byBlbnN1cmUgdGhhdCBzY2hlZHVsZXIgb25seSBzZWVzCm1vbm90b25p
Y2FsbHkgaW5jcmVhc2luZyBudW1iZXIuCgpTaWduZWQtb2ZmLWJ5OiBNdW5laGlzYSBLYW1hdGEg
PGthbWF0YW1AYW1hem9uLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFnYXJ3YWwgPGFuY2hh
bGFnQGFtYXpvbi5jb20+CgotLS0KQ2hhbmdlcyBzaW5jZSBWMjoKICAgICogc2VwYXJhdGVkIHRo
ZSBwcmV2aW91c2x5IG1lcmdlZCBwYXRjaGVzCiAgICAqIEluIFYyLCBpbnRyb2R1Y3Rpb24gb2Yg
c2F2ZS9yZXN0b3JlIHN0ZWFsIGNsb2NrIGFuZCB1c2FnZSBpbgogICAgICBoaWJlcm5hdGlvbiBj
b2RlIHdhcyBtZXJnZWQgaW4gYSBzaW5nbGUgcGF0Y2gKLS0tCiBkcml2ZXJzL3hlbi90aW1lLmMg
ICAgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogaW5jbHVkZS94ZW4veGVuLW9w
cy5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3RpbWUuYyBiL2RyaXZlcnMveGVuL3RpbWUu
YwppbmRleCAwOTY4ODU5YzI5ZDAuLjM1NjAyMjJjYzBkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy94
ZW4vdGltZS5jCisrKyBiL2RyaXZlcnMveGVuL3RpbWUuYwpAQCAtMjMsNiArMjMsOSBAQCBzdGF0
aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbywgeGVuX3J1bnN0YXRl
KTsKIAogc3RhdGljIERFRklORV9QRVJfQ1BVKHU2NFs0XSwgb2xkX3J1bnN0YXRlX3RpbWUpOwog
CitzdGF0aWMgREVGSU5FX1BFUl9DUFUodTY0LCB4ZW5fcHJldl9zdGVhbF9jbG9jayk7CitzdGF0
aWMgREVGSU5FX1BFUl9DUFUodTY0LCB4ZW5fc3RlYWxfY2xvY2tfb2Zmc2V0KTsKKwogLyogcmV0
dXJuIGFuIGNvbnNpc3RlbnQgc25hcHNob3Qgb2YgNjQtYml0IHRpbWUvY291bnRlciB2YWx1ZSAq
Lwogc3RhdGljIHU2NCBnZXQ2NChjb25zdCB1NjQgKnApCiB7CkBAIC0xNDksNyArMTUyLDcgQEAg
Ym9vbCB4ZW5fdmNwdV9zdG9sZW4oaW50IHZjcHUpCiAJcmV0dXJuIHBlcl9jcHUoeGVuX3J1bnN0
YXRlLCB2Y3B1KS5zdGF0ZSA9PSBSVU5TVEFURV9ydW5uYWJsZTsKIH0KIAotdTY0IHhlbl9zdGVh
bF9jbG9jayhpbnQgY3B1KQorc3RhdGljIHU2NCBfX3hlbl9zdGVhbF9jbG9jayhpbnQgY3B1KQog
ewogCXN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gc3RhdGU7CiAKQEAgLTE1Nyw2ICsxNjAsMzAg
QEAgdTY0IHhlbl9zdGVhbF9jbG9jayhpbnQgY3B1KQogCXJldHVybiBzdGF0ZS50aW1lW1JVTlNU
QVRFX3J1bm5hYmxlXSArIHN0YXRlLnRpbWVbUlVOU1RBVEVfb2ZmbGluZV07CiB9CiAKK3U2NCB4
ZW5fc3RlYWxfY2xvY2soaW50IGNwdSkKK3sKKwlyZXR1cm4gX194ZW5fc3RlYWxfY2xvY2soY3B1
KSArIHBlcl9jcHUoeGVuX3N0ZWFsX2Nsb2NrX29mZnNldCwgY3B1KTsKK30KKwordm9pZCB4ZW5f
c2F2ZV9zdGVhbF9jbG9jayhpbnQgY3B1KQoreworCXBlcl9jcHUoeGVuX3ByZXZfc3RlYWxfY2xv
Y2ssIGNwdSkgPSB4ZW5fc3RlYWxfY2xvY2soY3B1KTsKK30KKwordm9pZCB4ZW5fcmVzdG9yZV9z
dGVhbF9jbG9jayhpbnQgY3B1KQoreworCXU2NCBzdGVhbF9jbG9jayA9IF9feGVuX3N0ZWFsX2Ns
b2NrKGNwdSk7CisKKwlpZiAocGVyX2NwdSh4ZW5fcHJldl9zdGVhbF9jbG9jaywgY3B1KSA+IHN0
ZWFsX2Nsb2NrKSB7CisJCS8qIE5lZWQgdG8gdXBkYXRlIHRoZSBvZmZzZXQgKi8KKwkJcGVyX2Nw
dSh4ZW5fc3RlYWxfY2xvY2tfb2Zmc2V0LCBjcHUpID0KKwkJICAgIHBlcl9jcHUoeGVuX3ByZXZf
c3RlYWxfY2xvY2ssIGNwdSkgLSBzdGVhbF9jbG9jazsKKwl9IGVsc2UgeworCQkvKiBBdm9pZCB1
bm5lY2Vzc2FyeSBzdGVhbCBjbG9jayB3YXJwICovCisJCXBlcl9jcHUoeGVuX3N0ZWFsX2Nsb2Nr
X29mZnNldCwgY3B1KSA9IDA7CisJfQorfQorCiB2b2lkIHhlbl9zZXR1cF9ydW5zdGF0ZV9pbmZv
KGludCBjcHUpCiB7CiAJc3RydWN0IHZjcHVfcmVnaXN0ZXJfcnVuc3RhdGVfbWVtb3J5X2FyZWEg
YXJlYTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaCBiL2luY2x1ZGUveGVuL3hl
bi1vcHMuaAppbmRleCAzYjM5OTJiNWIwYzIuLjEyYjNmNDQ3NGEwNSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS94ZW4veGVuLW9wcy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaApAQCAtMzcsNiAr
MzcsOCBAQCB2b2lkIHhlbl90aW1lX3NldHVwX2d1ZXN0KHZvaWQpOwogdm9pZCB4ZW5fbWFuYWdl
X3J1bnN0YXRlX3RpbWUoaW50IGFjdGlvbik7CiB2b2lkIHhlbl9nZXRfcnVuc3RhdGVfc25hcHNo
b3Qoc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcmVzKTsKIHU2NCB4ZW5fc3RlYWxfY2xvY2so
aW50IGNwdSk7Cit2b2lkIHhlbl9zYXZlX3N0ZWFsX2Nsb2NrKGludCBjcHUpOwordm9pZCB4ZW5f
cmVzdG9yZV9zdGVhbF9jbG9jayhpbnQgY3B1KTsKIAogaW50IHhlbl9zZXR1cF9zaHV0ZG93bl9l
dmVudCh2b2lkKTsKIAotLSAKMi4yNC4xLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
