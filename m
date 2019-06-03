Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A632FA1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm3z-0002nD-P4; Mon, 03 Jun 2019 12:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXm3y-0002ml-9n
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:27:42 +0000
X-Inumbo-ID: f9a3cffe-85fa-11e9-b228-536055ee6954
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9a3cffe-85fa-11e9-b228-536055ee6954;
 Mon, 03 Jun 2019 12:27:39 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: yjVnIxS8DxqPQgZWY7SvJzcXoVljQSHyUFjBGlT+rP33GamEKh5hKLbwyAUqO+57U2NV4rYrJA
 +oGmpSbx+bgLle8Dvo+CXg8LFPObKQZnF6ga5riWTH3RMkvh8YRzEzJcqPK2nQYVT1NUfOuyCc
 yZKgDFWugRK3aPh1BJCsYAVmOnhWK5NOmYOdam9j51U3s/cjMgkPUQ2hk0lsIPAjsbQodzWViH
 vdzxlIJMCWvYAudgvJPVBJx0aM01ybIkNVWw2rQBlO7duM8HL9ozNVmsndQDlYK18vvPqjkyQl
 nZw=
X-SBRS: 2.7
X-MesageID: 1239383
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1239383"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 13:25:23 +0100
Message-ID: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/5] xen/vm-event: Cleanup
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjYW1lIGFib3V0IGZyb20gcmV2aWV3aW5nIFBldHJlJ3MgIlBlciB2Y3B1IHZtX2V2ZW50
IGNoYW5uZWxzIiB3aGlsZSBzYXQKaW4gYW4gYWlycG9ydCB3aXRoIHBsZW50eSBvZiB0aW1lIHRv
IGtpbGwuICBUaGlzIHN0YXJ0ZWQgd2l0aCBwYXRjaCA0IHRyeWluZwp0byBnZXQgcmlkIG9mIHRo
ZSAiayA9IGkgJSBkLT5tYXhfdmNwdXM7IiBleHByZXNzaW9uLCBidXQgc2VlIHBhdGNoIDQgZm9y
CmZ1cnRoZXIgZGV0YWlscyBvZiB3aHkgaXQgaGFzIHN0YXllZC4KCkV2ZXJ5dGhpbmcgZWxzZSB3
YXMgZWl0aGVyIGFuY2lsbGFyeSBjbGVhbnVwIEkgbm90aWNlZCB3aGlsZSByZXZpZXdpbmcsIG9y
Cmlzc3VlcyB3aGVyZSB3ZXJlIGNvcGllZC9tb3ZlZC9leHRlbmRlZCBkdXJpbmcgdGhlIHNlcmll
cy4KClRoaXMgc2VyaWVzIGNhbiBiZSBvYnRhaW5lZCBpbiBnaXQgZm9ybSBmcm9tOgoKICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvYW5kcmV3Y29vcC94ZW4uZ2l0O2E9
c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3ZtZXZlbnQtY2xlYW51cC12MQoKVGhlcmUgYXJlIG5vIGxh
cmdlIGZ1bmN0aW9uYWwgY2hhbmdlcywgYnV0IGl0IHNob3VsZCBiZSBhIGJldHRlciBiYXNlIHRv
CnJlZmFjdG9yIHRoZSBpbnRlcmZhY2UgZnJvbS4KCkFuZHJldyBDb29wZXIgKDUpOgogIHhlbi92
bS1ldmVudDogRHJvcCB1bnVzZWQgdV9kb21jdGwgcGFyYW1ldGVyIGZyb20gdm1fZXZlbnRfZG9t
Y3RsKCkKICB4ZW4vdm0tZXZlbnQ6IEV4cGFuZCB2bV9ldmVudF8qIHNwaW5sb2NrIG1hY3JvcyBh
bmQgcmVuYW1lIHRoZSBsb2NrCiAgeGVuL3ZtLWV2ZW50OiBSZW1vdmUgdW5uZWNlc3Nhcnkgdm1f
ZXZlbnRfZG9tYWluIGluZGlyZWN0aW9uCiAgeGVuL3ZtLWV2ZW50OiBGaXggaW50ZXJhY3Rpb25z
IHdpdGggdGhlIHZjcHUgbGlzdAogIHhlbi92bS1ldmVudDogTWlzYyBmaXh1cHMKCiB4ZW4vY29t
bW9uL2RvbWN0bC5jICAgICAgICB8ICAgNiArLQogeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAg
fCAxOTkgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCAgICB8ICAgMyArLQogeGVuL2luY2x1ZGUveGVuL3ZtX2V2ZW50
LmggfCAgIDMgKy0KIDQgZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgMTE1IGRlbGV0
aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
