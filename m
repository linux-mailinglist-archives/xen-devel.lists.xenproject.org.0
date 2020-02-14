Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B915FA72
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:25:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kIA-0000T6-Uy; Fri, 14 Feb 2020 23:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kI9-0000Sz-WA
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:22:38 +0000
X-Inumbo-ID: e2f2547e-4f80-11ea-bb5b-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2f2547e-4f80-11ea-bb5b-12813bfff9fa;
 Fri, 14 Feb 2020 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722558; x=1613258558;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=eMxbySX2+Q9C9EOEiRSgj0VbC617wxOCoVYvUYL8fpI=;
 b=kb7E8/9Phov07pkUi5u89J7geqTV3uERWKfrdETiGMoSwvQWsviK0MYy
 A8vOByKhtJiG4F7rwHSh+OjCAU1UhGOOviAWv3Es3y54fQ/9mo7UXlS3B
 WU/eMxh+CDAw5WzcPedRoBQ5rw6rliFhySlw2BPCQvtlHV28rwRSWx2AE k=;
IronPort-SDR: y8XMJpVBLvSO59b36Gvrm5SW1/nIbpAtTjjiO/1OKPsLUicx920bBL8XverR7HeoI3BJ2aceF9
 AUi0ra0Y0/HQ==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="16797643"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 14 Feb 2020 23:22:34 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1A7F0A07D0; Fri, 14 Feb 2020 23:22:26 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:22:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:22:08 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:22:08 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 756394028E; Fri, 14 Feb 2020 23:22:08 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:22:08 +0000
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
Message-ID: <36567b7204db25d7307a165a6565837a213efdf8.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
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
Zi1ieTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+Ci0tLQogZHJpdmVycy94
ZW4vbWFuYWdlLmMgIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogaW5jbHVkZS94ZW4veGVuLW9wcy5oIHwgIDMgKysKIDIgZmlsZXMgY2hhbmdlZCwgNzYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL21hbmFnZS5jIGIvZHJpdmVy
cy94ZW4vbWFuYWdlLmMKaW5kZXggY2QwNDY2ODRlMGQxLi4wYjMwYWI1MjJiNzcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMveGVuL21hbmFnZS5jCisrKyBiL2RyaXZlcnMveGVuL21hbmFnZS5jCkBAIC0x
NCw2ICsxNCw3IEBACiAjaW5jbHVkZSA8bGludXgvZnJlZXplci5oPgogI2luY2x1ZGUgPGxpbnV4
L3N5c2NvcmVfb3BzLmg+CiAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CisjaW5jbHVkZSA8bGlu
dXgvc3VzcGVuZC5oPgogCiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1ZGUgPHhlbi94ZW5i
dXMuaD4KQEAgLTQwLDYgKzQxLDMxIEBAIGVudW0gc2h1dGRvd25fc3RhdGUgewogLyogSWdub3Jl
IG11bHRpcGxlIHNodXRkb3duIHJlcXVlc3RzLiAqLwogc3RhdGljIGVudW0gc2h1dGRvd25fc3Rh
dGUgc2h1dHRpbmdfZG93biA9IFNIVVRET1dOX0lOVkFMSUQ7CiAKK2VudW0gc3VzcGVuZF9tb2Rl
cyB7CisJTk9fU1VTUEVORCA9IDAsCisJWEVOX1NVU1BFTkQsCisJUE1fU1VTUEVORCwKKwlQTV9I
SUJFUk5BVElPTiwKK307CisKKy8qIFByb3RlY3RlZCBieSBwbV9tdXRleCAqLworc3RhdGljIGVu
dW0gc3VzcGVuZF9tb2RlcyBzdXNwZW5kX21vZGUgPSBOT19TVVNQRU5EOworCitib29sIHhlbl9z
dXNwZW5kX21vZGVfaXNfeGVuX3N1c3BlbmQodm9pZCkKK3sKKwlyZXR1cm4gc3VzcGVuZF9tb2Rl
ID09IFhFTl9TVVNQRU5EOworfQorCitib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1fc3VzcGVu
ZCh2b2lkKQoreworCXJldHVybiBzdXNwZW5kX21vZGUgPT0gUE1fU1VTUEVORDsKK30KKworYm9v
bCB4ZW5fc3VzcGVuZF9tb2RlX2lzX3BtX2hpYmVybmF0aW9uKHZvaWQpCit7CisJcmV0dXJuIHN1
c3BlbmRfbW9kZSA9PSBQTV9ISUJFUk5BVElPTjsKK30KKwogc3RydWN0IHN1c3BlbmRfaW5mbyB7
CiAJaW50IGNhbmNlbGxlZDsKIH07CkBAIC05OSw2ICsxMjUsMTAgQEAgc3RhdGljIHZvaWQgZG9f
c3VzcGVuZCh2b2lkKQogCWludCBlcnI7CiAJc3RydWN0IHN1c3BlbmRfaW5mbyBzaTsKIAorCWxv
Y2tfc3lzdGVtX3NsZWVwKCk7CisKKwlzdXNwZW5kX21vZGUgPSBYRU5fU1VTUEVORDsKKwogCXNo
dXR0aW5nX2Rvd24gPSBTSFVURE9XTl9TVVNQRU5EOwogCiAJZXJyID0gZnJlZXplX3Byb2Nlc3Nl
cygpOwpAQCAtMTYyLDYgKzE5MiwxMCBAQCBzdGF0aWMgdm9pZCBkb19zdXNwZW5kKHZvaWQpCiAJ
dGhhd19wcm9jZXNzZXMoKTsKIG91dDoKIAlzaHV0dGluZ19kb3duID0gU0hVVERPV05fSU5WQUxJ
RDsKKworCXN1c3BlbmRfbW9kZSA9IE5PX1NVU1BFTkQ7CisKKwl1bmxvY2tfc3lzdGVtX3NsZWVw
KCk7CiB9CiAjZW5kaWYJLyogQ09ORklHX0hJQkVSTkFURV9DQUxMQkFDS1MgKi8KIApAQCAtMzg3
LDMgKzQyMSw0MiBAQCBpbnQgeGVuX3NldHVwX3NodXRkb3duX2V2ZW50KHZvaWQpCiBFWFBPUlRf
U1lNQk9MX0dQTCh4ZW5fc2V0dXBfc2h1dGRvd25fZXZlbnQpOwogCiBzdWJzeXNfaW5pdGNhbGwo
eGVuX3NldHVwX3NodXRkb3duX2V2ZW50KTsKKworc3RhdGljIGludCB4ZW5fcG1fbm90aWZpZXIo
c3RydWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwKKwkJCSAgIHVuc2lnbmVkIGxvbmcgcG1f
ZXZlbnQsIHZvaWQgKnVudXNlZCkKK3sKKwlzd2l0Y2ggKHBtX2V2ZW50KSB7CisJY2FzZSBQTV9T
VVNQRU5EX1BSRVBBUkU6CisJCXN1c3BlbmRfbW9kZSA9IFBNX1NVU1BFTkQ7CisJCWJyZWFrOwor
CWNhc2UgUE1fSElCRVJOQVRJT05fUFJFUEFSRToKKwljYXNlIFBNX1JFU1RPUkVfUFJFUEFSRToK
KwkJc3VzcGVuZF9tb2RlID0gUE1fSElCRVJOQVRJT047CisJCWJyZWFrOworCWNhc2UgUE1fUE9T
VF9TVVNQRU5EOgorCWNhc2UgUE1fUE9TVF9SRVNUT1JFOgorCWNhc2UgUE1fUE9TVF9ISUJFUk5B
VElPTjoKKwkJLyogU2V0IGJhY2sgdG8gdGhlIGRlZmF1bHQgKi8KKwkJc3VzcGVuZF9tb2RlID0g
Tk9fU1VTUEVORDsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcHJfd2FybigiUmVjZWl2ZSB1bmtu
b3duIFBNIGV2ZW50IDB4JWx4XG4iLCBwbV9ldmVudCk7CisJCXJldHVybiAtRUlOVkFMOworCX0K
KworCXJldHVybiAwOworfTsKKworc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayB4ZW5fcG1f
bm90aWZpZXJfYmxvY2sgPSB7CisJLm5vdGlmaWVyX2NhbGwgPSB4ZW5fcG1fbm90aWZpZXIKK307
CisKK3N0YXRpYyBpbnQgeGVuX3NldHVwX3BtX25vdGlmaWVyKHZvaWQpCit7CisJaWYgKCF4ZW5f
aHZtX2RvbWFpbigpKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXJldHVybiByZWdpc3Rlcl9wbV9u
b3RpZmllcigmeGVuX3BtX25vdGlmaWVyX2Jsb2NrKTsKK30KKworc3Vic3lzX2luaXRjYWxsKHhl
bl9zZXR1cF9wbV9ub3RpZmllcik7CmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW4tb3BzLmgg
Yi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKaW5kZXggZDg5OTY5YWE5OTQyLi42YzM2ZTE2MWRmZDEg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbi1vcHMuaAorKysgYi9pbmNsdWRlL3hlbi94ZW4t
b3BzLmgKQEAgLTQwLDYgKzQwLDkgQEAgdTY0IHhlbl9zdGVhbF9jbG9jayhpbnQgY3B1KTsKIAog
aW50IHhlbl9zZXR1cF9zaHV0ZG93bl9ldmVudCh2b2lkKTsKIAorYm9vbCB4ZW5fc3VzcGVuZF9t
b2RlX2lzX3hlbl9zdXNwZW5kKHZvaWQpOworYm9vbCB4ZW5fc3VzcGVuZF9tb2RlX2lzX3BtX3N1
c3BlbmQodm9pZCk7Citib29sIHhlbl9zdXNwZW5kX21vZGVfaXNfcG1faGliZXJuYXRpb24odm9p
ZCk7CiBleHRlcm4gdW5zaWduZWQgbG9uZyAqeGVuX2NvbnRpZ3VvdXNfYml0bWFwOwogCiAjaWYg
ZGVmaW5lZChDT05GSUdfWEVOX1BWKSB8fCBkZWZpbmVkKENPTkZJR19BUk0pIHx8IGRlZmluZWQo
Q09ORklHX0FSTTY0KQotLSAKMi4yNC4xLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
