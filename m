Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167016FE08
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v3z-0002xJ-By; Wed, 26 Feb 2020 11:41:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v3y-0002wf-50
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:14 +0000
X-Inumbo-ID: e02df62a-588c-11ea-93ff-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e02df62a-588c-11ea-93ff-12813bfff9fa;
 Wed, 26 Feb 2020 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8fbAOGCvYSNlg4dNjTF/BzN/yi+Nke3WzR16xOV8uYE=;
 b=AXclC4lHmwAxd3gkWsud9Hy8Gq3V9XinbqWNAvddPeUdWut/RYSgZoTE
 dChzk3wciV0B3c5DO6rVdJi4f7rOh741t7okEzzrCiTRSpJJ+jn0bJItL
 f+JCRPVewLCuIXKRIsJTpAhkAJ/j5dLS/clN7//IeeKSwPGsTpqkQ5+C1 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 077nXT5xp0EANCF3XAk6Idusv0fl/sQa9sQ5w/95YtiI05R1dBmIZVOHFXPaMVI9WbNg7QP2Qr
 rcI6QQ55i8ci7RnBNl1HIvxbNeO7DGZSXHvp9u/RAyM+ypZosVypOY9ruz1tpcQdPWR+xXjJQj
 rdtueo2eAJXlBfHEk6PzMe8J1LPDAl8wFRbr+EXtddG7jioedC/HDB8OE4MiX94gL1pOvRiuGb
 s+fSdasJ4GY14FfiRuO2CdkqGkTtO8c2pbWXq3uazt/2QX/UzGYsMIHUe4rl4YPGKbCCdco/GJ
 +LQ=
X-SBRS: 2.7
X-MesageID: 13462011
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13462011"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:42 +0000
Message-ID: <20200226113355.2532224-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 10/23] xen/build: run targets csopes, tags,
 .. without Rules.mk
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhvc2UgdGFyZ2V0cyBtYWtlIHVzZSBvZiAkKGFsbF9zb3VyY2VzKSB3aGljaCBkZXBlbmRzIG9u
IFRBUkdFVF9BUkNILApzbyB3ZSBqdXN0IG5lZWQgdG8gc2V0IFRBUkdFVF9BUkNIIGVhcmxpZXIg
YW5kIG9uY2UuCgpYRU5fVEFSR0VUX0FSQ0ggaXNuJ3QgZXhwZWN0ZWQgdG8gY2hhbmdlIGR1cmlu
ZyB0aGUgYnVpbGQsIHNvClRBUkdFVF9TVUJBUkNIIGFuZCBUQVJHRVRfQVJDSCBhcmVuJ3QgZ29p
bmcgdG8gY2hhbmdlIGVpdGhlci4gU2V0IHRoZW0Kb25jZSBhbmQgZm9yIGFsbCBpbiB0aGUgWGVu
IHJvb3QgTWFrZWZpbGUuIFRoaXMgYWxsb3dzIHRvIHJ1biBtb3JlCnRhcmdldHMgd2l0aG91dCBS
dWxlcy5tay4KClhFTl9UQVJHRVRfQVJDSCBpcyBhY3R1YWxseSBjaGFuZ2VkIGluIGFyY2gveDg2
L2Jvb3QvYnVpbGQzMi5taywgYnV0Cml0IGRvZXNuJ3QgdXNlIHRoZSBUQVJHRVRfeyxTVUJ9QVJD
SCB2YXJpYWJsZXMgZWl0aGVyLCBhbmQgZG9lc24ndCB1c2UKUnVsZXMubWsgKGl0IHJlcGxhY2Vz
IGl0KS4KClRBUkdFVF97LFNVQn1BUkNIIGFyZSBubyBsb25nZXIgb3ZlcnJpZGRlbiBiZWNhdXNl
IHRoYXQgd291bGQgaGF2ZQpubyBlZmZlY3Qgb24gdGhlIHZhbHVlcyB0aGF0IFJ1bGVzLm1rIHdp
bGwgdXNlLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAgIC0gSW1wcm92ZSBjb21taXQgbWVzc2Fn
ZSwgdHJ5IHRvIGV4cGxhaW4gd2h5IG92ZXJyaWRlIGRpc2FwcGVhcmVkCgogeGVuL01ha2VmaWxl
IHwgMjUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogeGVuL1J1bGVzLm1rIHwgIDUgLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlCmluZGV4IDY1YmQ5MTNjZDEzMy4u
MTBiYzRiZjM2NDZjIDEwMDY0NAotLS0gYS94ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxl
CkBAIC0zNSw2ICszNSwxMSBAQCBTUkNBUkNIPSQoc2hlbGwgZWNobyAkKEFSQ0gpIHwgc2VkIC1l
ICdzL3g4Ni4qL3g4Ni8nIC1lIHMnL2FybVwoMzJcfDY0XCkvYXJtL2cnKQogIyB3ZSBuZWVkIFhF
Tl9UQVJHRVRfQVJDSCB0byBnZW5lcmF0ZSB0aGUgcHJvcGVyIGNvbmZpZwogaW5jbHVkZSAkKFhF
Tl9ST09UKS9Db25maWcubWsKIAorIyBTZXQgQVJDSC9TVUJBUkNIIGFwcHJvcHJpYXRlbHkuCitl
eHBvcnQgVEFSR0VUX1NVQkFSQ0ggIDo9ICQoWEVOX1RBUkdFVF9BUkNIKQorZXhwb3J0IFRBUkdF
VF9BUkNIICAgICA6PSAkKHNoZWxsIGVjaG8gJChYRU5fVEFSR0VUX0FSQ0gpIHwgXAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSBzJy9hcm1cKDMy
XHw2NFwpL2FybS9nJykKKwogIyBBbGxvdyBzb21lb25lIHRvIGNoYW5nZSB0aGVpciBjb25maWcg
ZmlsZQogZXhwb3J0IEtDT05GSUdfQ09ORklHID89IC5jb25maWcKIApAQCAtNDYsOCArNTEsOCBA
QCBkaXN0OiBpbnN0YWxsCiAKIGJ1aWxkIGluc3RhbGw6OiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNv
bmYKIAotLlBIT05ZOiBidWlsZCBpbnN0YWxsIHVuaW5zdGFsbCBjbGVhbiBkaXN0Y2xlYW4gY3Nj
b3BlIFRBR1MgdGFncyBNQVAgZ3RhZ3MgdGVzdHMKLWJ1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGRl
YnVnIGNsZWFuIGRpc3RjbGVhbiBjc2NvcGUgVEFHUyB0YWdzIE1BUCBndGFncyB0ZXN0czo6Cisu
UEhPTlk6IGJ1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGNsZWFuIGRpc3RjbGVhbiBNQVAgdGVzdHMK
K2J1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGRlYnVnIGNsZWFuIGRpc3RjbGVhbiBNQVAgdGVzdHM6
OgogaWZuZXEgKCQoWEVOX1RBUkdFVF9BUkNIKSx4ODZfMzIpCiAJJChNQUtFKSAtZiBSdWxlcy5t
ayBfJEAKIGVsc2UKQEAgLTIyMywyNSArMjI4LDI1IEBAIGVuZGVmCiB4ZW52ZXJzaW9uOgogCUBl
Y2hvICQoWEVOX0ZVTExWRVJTSU9OKQogCi0uUEhPTlk6IF9UQUdTCi1fVEFHUzogCisuUEhPTlk6
IFRBR1MKK1RBR1M6CiAJc2V0IC1lOyBybSAtZiBUQUdTOyBcCiAJJChjYWxsIHNldF9leHViZXJh
bnRfZmxhZ3MsZXRhZ3MpOyBcCiAJJChhbGxfc291cmNlcykgfCB4YXJncyBldGFncyAkJGV4dWJl
cmFudF9mbGFncyAtYQogCi0uUEhPTlk6IF90YWdzCi1fdGFnczogCisuUEhPTlk6IHRhZ3MKK3Rh
Z3M6CiAJc2V0IC1lOyBybSAtZiB0YWdzOyBcCiAJJChjYWxsIHNldF9leHViZXJhbnRfZmxhZ3Ms
Y3RhZ3MpOyBcCiAJJChhbGxfc291cmNlcykgfCB4YXJncyBjdGFncyAkJGV4dWJlcmFudF9mbGFn
cyAtYQogCi0uUEhPTlk6IF9ndGFncwotX2d0YWdzOgorLlBIT05ZOiBndGFncworZ3RhZ3M6CiAJ
c2V0IC1lOyBybSAtZiBHVEFHUyBHU1lNUyBHUEFUSCBHUlRBR1MKIAkkKGFsbF9zb3VyY2VzKSB8
IGd0YWdzIC1mIC0KIAotLlBIT05ZOiBfY3Njb3BlCi1fY3Njb3BlOgorLlBIT05ZOiBjc2NvcGUK
K2NzY29wZToKIAkkKGFsbF9zb3VyY2VzKSA+IGNzY29wZS5maWxlcwogCWNzY29wZSAtayAtYiAt
cQogCmRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggMGMxYTNl
ZTU5MDVkLi45MmExM2NhNjAxNjMgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4v
UnVsZXMubWsKQEAgLTI3LDExICsyNyw2IEBAIGlmbmVxICgkKG9yaWdpbiB2ZXJib3NlKSx1bmRl
ZmluZWQpCiAkKGVycm9yICJZb3UgbXVzdCB1c2UgJ21ha2UgbWVudWNvbmZpZycgdG8gZW5hYmxl
L2Rpc2FibGUgdmVyYm9zZSBub3cuIikKIGVuZGlmCiAKLSMgU2V0IEFSQ0gvU1VCQVJDSCBhcHBy
b3ByaWF0ZWx5Lgotb3ZlcnJpZGUgVEFSR0VUX1NVQkFSQ0ggIDo9ICQoWEVOX1RBUkdFVF9BUkNI
KQotb3ZlcnJpZGUgVEFSR0VUX0FSQ0ggICAgIDo9ICQoc2hlbGwgZWNobyAkKFhFTl9UQVJHRVRf
QVJDSCkgfCBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZWQgLWUgJ3MveDg2Liov
eDg2LycgLWUgcycvYXJtXCgzMlx8NjRcKS9hcm0vZycpCi0KIFRBUkdFVCA6PSAkKEJBU0VESVIp
L3hlbgogCiAjIE5vdGUgdGhhdCBsaW5rIG9yZGVyIG1hdHRlcnMhCi0tIApBbnRob255IFBFUkFS
RAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
