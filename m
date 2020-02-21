Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B9B167B12
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:45:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55lB-00018z-3r; Fri, 21 Feb 2020 10:42:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TqQj=4J=amazon.com=prvs=31305ddda=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j55l9-00018u-Q1
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:42:15 +0000
X-Inumbo-ID: d2a3498c-5496-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2a3498c-5496-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582281735; x=1613817735;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=oVvCqE3UBYAoNn/m2KoZp9FaTfLcLb8rPOOd+6lsbms=;
 b=Hk6ES/AlRaXVBBeqKzqgNJoMSn40IUoX2XEOOf6M7WsxyzNEz1LbEJQH
 +7/LAdRsLaAWO5rW/+N9rZCZwe1HEyN7A0RHnTl1Nc0MkBPbztJpKKZMM
 xUQ+Y1Er669umT7dDUorh+xmNp9yiEHS4xhe/gJ/gJ7KysP2w6YrjnRFX o=;
IronPort-SDR: hbxdbPRVhftFDX7CtMYMPqDtyeXgnHE4THSf0jJgLxAw5fJf8/fqQZjYiHAvZQzyf/h+jzoORl
 AKwXklKSb7fg==
X-IronPort-AV: E=Sophos;i="5.70,467,1574121600"; d="scan'208";a="28043467"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Feb 2020 10:42:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3CBC7A1E1F; Fri, 21 Feb 2020 10:42:12 +0000 (UTC)
Received: from EX13D37EUB003.ant.amazon.com (10.43.166.251) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 10:42:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D37EUB003.ant.amazon.com (10.43.166.251) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 10:42:10 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 21 Feb 2020 10:42:08 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Feb 2020 10:42:03 +0000
Message-ID: <27c7736ec643dd0dd3cf469e6dc57f9d36379dcb.1582281718.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] x86/mm: switch to new APIs in arch_init_memory
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpbmNlIHdlIG5vdyBtYXAgYW5k
IHVubWFwIFhlbiBQVEUgcGFnZXMsIHdlIHdvdWxkIGxpa2UgdG8gdHJhY2sgdGhlCmxpZmV0aW1l
IG9mIG1hcHBpbmdzIHNvIHRoYXQgMSkgd2UgZG8gbm90IGRlcmVmZXJlbmNlIG1lbW9yeSB0aHJv
dWdoIGEKdmFyaWFibGUgYWZ0ZXIgaXQgaXMgdW5tYXBwZWQsIDIpIHdlIGRvIG5vdCB1bm1hcCBt
b3JlIHRoYW4gb25jZS4KVGhlcmVmb3JlLCB3ZSBpbnRyb2R1Y2UgdGhlIFVOTUFQX0RPTUFJTl9Q
QUdFIG1hY3JvIHRvIG51bGxpZnkgdGhlCnZhcmlhYmxlIGFmdGVyIHVubWFwcGluZywgYW5kIGln
bm9yZSBOVUxMIGluIHVubWFwX2RvbWFpbl9wYWdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlh
QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgICAgfCAgMiArLQog
eGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAgfCAxNCArKysrKysrKy0tLS0tLQogeGVuL2lu
Y2x1ZGUveGVuL2RvbWFpbl9wYWdlLmggfCAgNSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9k
b21haW5fcGFnZS5jIGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKaW5kZXggZGQzMjcxMmQy
Zi4uYjAzNzI4ZTE4ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKQEAgLTE4MSw3ICsxODEsNyBAQCB2b2lkIHVu
bWFwX2RvbWFpbl9wYWdlKGNvbnN0IHZvaWQgKnB0cikKICAgICB1bnNpZ25lZCBsb25nIHZhID0g
KHVuc2lnbmVkIGxvbmcpcHRyLCBtZm4sIGZsYWdzOwogICAgIHN0cnVjdCB2Y3B1X21hcGhhc2hf
ZW50cnkgKmhhc2hlbnQ7CiAKLSAgICBpZiAoIHZhID49IERJUkVDVE1BUF9WSVJUX1NUQVJUICkK
KyAgICBpZiAoICF2YSB8fCB2YSA+PSBESVJFQ1RNQVBfVklSVF9TVEFSVCApCiAgICAgICAgIHJl
dHVybjsKIAogICAgIEFTU0VSVCh2YSA+PSBNQVBDQUNIRV9WSVJUX1NUQVJUICYmIHZhIDwgTUFQ
Q0FDSEVfVklSVF9FTkQpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJj
aC94ODYvbW0uYwppbmRleCA3MGI4N2M0ODMwLi45ZmNkY2RlNWI3IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMzU2LDE5ICszNTYsMjEg
QEAgdm9pZCBfX2luaXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQogICAgICAgICAgICAgQVNTRVJU
KHJvb3RfcGd0X3B2X3hlbl9zbG90cyA8IFJPT1RfUEFHRVRBQkxFX1BWX1hFTl9TTE9UUyk7CiAg
ICAgICAgICAgICBpZiAoIGw0X3RhYmxlX29mZnNldChzcGxpdF92YSkgPT0gbDRfdGFibGVfb2Zm
c2V0KHNwbGl0X3ZhIC0gMSkgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIGwzX3Bn
ZW50cnlfdCAqbDN0YWIgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CisgICAgICAgICAgICAgICAg
bWZuX3QgbDNtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOwogCi0gICAgICAgICAgICAg
ICAgaWYgKCBsM3RhYiApCisgICAgICAgICAgICAgICAgaWYgKCAhbWZuX2VxKGwzbWZuLCBJTlZB
TElEX01GTikgKQogICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAgY29uc3Qg
bDNfcGdlbnRyeV90ICpsM2lkbGUgPQotICAgICAgICAgICAgICAgICAgICAgICAgbDRlX3RvX2wz
ZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChzcGxpdF92YSldKTsKKyAgICAgICAgICAg
ICAgICAgICAgbDNfcGdlbnRyeV90ICpsM2lkbGUgPSBtYXBfbDN0X2Zyb21fbDRlKAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHNwbGl0
X3ZhKV0pOworICAgICAgICAgICAgICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdGFiID0gbWFwX2Rv
bWFpbl9wYWdlKGwzbWZuKTsKIAogICAgICAgICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8
IGwzX3RhYmxlX29mZnNldChzcGxpdF92YSk7ICsraSApCiAgICAgICAgICAgICAgICAgICAgICAg
ICBsM3RhYltpXSA9IGwzaWRsZVtpXTsKICAgICAgICAgICAgICAgICAgICAgZm9yICggOyBpIDwg
TDNfUEFHRVRBQkxFX0VOVFJJRVM7ICsraSApCiAgICAgICAgICAgICAgICAgICAgICAgICBsM3Rh
YltpXSA9IGwzZV9lbXB0eSgpOwotICAgICAgICAgICAgICAgICAgICBzcGxpdF9sNGUgPSBsNGVf
ZnJvbV9tZm4odmlydF90b19tZm4obDN0YWIpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1JfUlcpOworICAgICAgICAgICAgICAg
ICAgICBzcGxpdF9sNGUgPSBsNGVfZnJvbV9tZm4obDNtZm4sIF9fUEFHRV9IWVBFUlZJU09SX1JX
KTsKKyAgICAgICAgICAgICAgICAgICAgVU5NQVBfRE9NQUlOX1BBR0UobDNpZGxlKTsKKyAgICAg
ICAgICAgICAgICAgICAgVU5NQVBfRE9NQUlOX1BBR0UobDN0YWIpOwogICAgICAgICAgICAgICAg
IH0KICAgICAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICAgICAgICsrcm9vdF9wZ3Rf
cHZfeGVuX3Nsb3RzOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaAppbmRleCAzMjY2OWEzMzM5Li5hMTgyZDMz
YjY3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaAorKysgYi94ZW4v
aW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaApAQCAtNzIsNCArNzIsOSBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGNvbnN0IHZvaWQgKnZhKSB7fTsKIAogI2Vu
ZGlmIC8qICFDT05GSUdfRE9NQUlOX1BBR0UgKi8KIAorI2RlZmluZSBVTk1BUF9ET01BSU5fUEFH
RShwKSBkbyB7ICAgXAorICAgIHVubWFwX2RvbWFpbl9wYWdlKHApOyAgICAgICAgICAgXAorICAg
IChwKSA9IE5VTEw7ICAgICAgICAgICAgICAgICAgICAgXAorfSB3aGlsZSAoIGZhbHNlICkKKwog
I2VuZGlmIC8qIF9fWEVOX0RPTUFJTl9QQUdFX0hfXyAqLwotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
