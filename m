Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A157E140879
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:57:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGs-00054l-LM; Fri, 17 Jan 2020 10:54:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGq-00053T-Ua
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:32 +0000
X-Inumbo-ID: b09611b6-3917-11ea-88b0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b09611b6-3917-11ea-88b0-12813bfff9fa;
 Fri, 17 Jan 2020 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NAP4QIGGLf6V9gS58Y3cZrTscYqqhFfgGTi2FgdQPnM=;
 b=TOR63abdUUZJEwYUsLf7f9i7xxFymt1V9EJmNa5MQIDANd686Dr3zOPn
 G9AUIU2kYX0JBG4ZZxuRfI8L0UwnSuQ2KqJabpB+avYWFKPeivf5Y/n7+
 XqDqvM9VOVL+hNysfXrZnC4Y8WBhS2tGBf0o84C2cH+qDKKnnmp6wobkX w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rs6S7nG5noNAalwlnrqiRrFvKGSweGb4fWchfa5+DbSqEBkWi6P5p+hQTBnupfHNBgTRCv+srr
 nT5vpyVf8gxVmhFwv+6Fu0TmErr2S2WcxS0zopiZLDnHCbyjiszITikArUrKg6ApbQR8gRgjUJ
 N6FNfzeMhgCXySZQxwL2d5bpFY6/e5Oap1KIyJQH6n+gVBeRUO2XGDIh9cL4pBZEgLugkjPXVe
 9OE/wG3tedrJwNvbzqHpTLUHsrgD0hpKeM/3ounrv6mOFlKEM5W5FOgAzafOE4G3vTnQtzNRih
 itk=
X-SBRS: 2.7
X-MesageID: 11432452
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432452"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:53 +0000
Message-ID: <20200117105358.607910-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 07/12] xen/build: run targets csopes, tags,
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
IHJvb3QgTWFrZWZpbGUuIFRoaXMgYWxsb3cgdG8gcnVuIG1vcmUKdGFyZ2V0cyB3aXRob3V0IFJ1
bGVzLm1rLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQogeGVuL01ha2VmaWxlIHwgMjUgKysrKysrKysrKysrKysrLS0tLS0tLS0t
LQogeGVuL1J1bGVzLm1rIHwgIDUgLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01h
a2VmaWxlCmluZGV4IDgxNDAxMTE3NWZkOC4uMGU1ODlkZTc3NTVlIDEwMDY0NAotLS0gYS94ZW4v
TWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0zNSw2ICszNSwxMSBAQCBTUkNBUkNIPSQo
c2hlbGwgZWNobyAkKEFSQ0gpIHwgc2VkIC1lICdzL3g4Ni4qL3g4Ni8nIC1lIHMnL2FybVwoMzJc
fDY0XCkvYXJtL2cnKQogIyB3ZSBuZWVkIFhFTl9UQVJHRVRfQVJDSCB0byBnZW5lcmF0ZSB0aGUg
cHJvcGVyIGNvbmZpZwogaW5jbHVkZSAkKFhFTl9ST09UKS9Db25maWcubWsKIAorIyBTZXQgQVJD
SC9TVUJBUkNIIGFwcHJvcHJpYXRlbHkuCitleHBvcnQgVEFSR0VUX1NVQkFSQ0ggIDo9ICQoWEVO
X1RBUkdFVF9BUkNIKQorZXhwb3J0IFRBUkdFVF9BUkNIICAgICA6PSAkKHNoZWxsIGVjaG8gJChY
RU5fVEFSR0VUX0FSQ0gpIHwgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlZCAtZSAn
cy94ODYuKi94ODYvJyAtZSBzJy9hcm1cKDMyXHw2NFwpL2FybS9nJykKKwogIyBBbGxvdyBzb21l
b25lIHRvIGNoYW5nZSB0aGVpciBjb25maWcgZmlsZQogZXhwb3J0IEtDT05GSUdfQ09ORklHID89
IC5jb25maWcKIApAQCAtNDYsOCArNTEsOCBAQCBkaXN0OiBpbnN0YWxsCiAKIGJ1aWxkIGluc3Rh
bGw6OiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNvbmYKIAotLlBIT05ZOiBidWlsZCBpbnN0YWxsIHVu
aW5zdGFsbCBjbGVhbiBkaXN0Y2xlYW4gY3Njb3BlIFRBR1MgdGFncyBNQVAgZ3RhZ3MgdGVzdHMK
LWJ1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGRlYnVnIGNsZWFuIGRpc3RjbGVhbiBjc2NvcGUgVEFH
UyB0YWdzIE1BUCBndGFncyB0ZXN0czo6CisuUEhPTlk6IGJ1aWxkIGluc3RhbGwgdW5pbnN0YWxs
IGNsZWFuIGRpc3RjbGVhbiBNQVAgdGVzdHMKK2J1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGRlYnVn
IGNsZWFuIGRpc3RjbGVhbiBNQVAgdGVzdHM6OgogaWZuZXEgKCQoWEVOX1RBUkdFVF9BUkNIKSx4
ODZfMzIpCiAJJChNQUtFKSAtZiBSdWxlcy5tayBfJEAKIGVsc2UKQEAgLTIyMCwyNSArMjI1LDI1
IEBAIGVuZGVmCiB4ZW52ZXJzaW9uOgogCUBlY2hvICQoWEVOX0ZVTExWRVJTSU9OKQogCi0uUEhP
Tlk6IF9UQUdTCi1fVEFHUzogCisuUEhPTlk6IFRBR1MKK1RBR1M6CiAJc2V0IC1lOyBybSAtZiBU
QUdTOyBcCiAJJChjYWxsIHNldF9leHViZXJhbnRfZmxhZ3MsZXRhZ3MpOyBcCiAJJChhbGxfc291
cmNlcykgfCB4YXJncyBldGFncyAkJGV4dWJlcmFudF9mbGFncyAtYQogCi0uUEhPTlk6IF90YWdz
Ci1fdGFnczogCisuUEhPTlk6IHRhZ3MKK3RhZ3M6CiAJc2V0IC1lOyBybSAtZiB0YWdzOyBcCiAJ
JChjYWxsIHNldF9leHViZXJhbnRfZmxhZ3MsY3RhZ3MpOyBcCiAJJChhbGxfc291cmNlcykgfCB4
YXJncyBjdGFncyAkJGV4dWJlcmFudF9mbGFncyAtYQogCi0uUEhPTlk6IF9ndGFncwotX2d0YWdz
OgorLlBIT05ZOiBndGFncworZ3RhZ3M6CiAJc2V0IC1lOyBybSAtZiBHVEFHUyBHU1lNUyBHUEFU
SCBHUlRBR1MKIAkkKGFsbF9zb3VyY2VzKSB8IGd0YWdzIC1mIC0KIAotLlBIT05ZOiBfY3Njb3Bl
Ci1fY3Njb3BlOgorLlBIT05ZOiBjc2NvcGUKK2NzY29wZToKIAkkKGFsbF9zb3VyY2VzKSA+IGNz
Y29wZS5maWxlcwogCWNzY29wZSAtayAtYiAtcQogCmRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsg
Yi94ZW4vUnVsZXMubWsKaW5kZXggZGVhYjBhYmQ2M2UxLi5kMjA1MjFjYzllYzEgMTAwNjQ0Ci0t
LSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAgLTI3LDExICsyNyw2IEBAIGlm
bmVxICgkKG9yaWdpbiB2ZXJib3NlKSx1bmRlZmluZWQpCiAkKGVycm9yICJZb3UgbXVzdCB1c2Ug
J21ha2UgbWVudWNvbmZpZycgdG8gZW5hYmxlL2Rpc2FibGUgdmVyYm9zZSBub3cuIikKIGVuZGlm
CiAKLSMgU2V0IEFSQ0gvU1VCQVJDSCBhcHByb3ByaWF0ZWx5Lgotb3ZlcnJpZGUgVEFSR0VUX1NV
QkFSQ0ggIDo9ICQoWEVOX1RBUkdFVF9BUkNIKQotb3ZlcnJpZGUgVEFSR0VUX0FSQ0ggICAgIDo9
ICQoc2hlbGwgZWNobyAkKFhFTl9UQVJHRVRfQVJDSCkgfCBcCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzZWQgLWUgJ3MveDg2LioveDg2LycgLWUgcycvYXJtXCgzMlx8NjRcKS9hcm0v
ZycpCi0KIFRBUkdFVCA6PSAkKEJBU0VESVIpL3hlbgogCiAjIE5vdGUgdGhhdCBsaW5rIG9yZGVy
IG1hdHRlcnMhCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
