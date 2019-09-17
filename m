Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E89B556E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAIJ4-0003yx-Np; Tue, 17 Sep 2019 18:34:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlRc=XM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAIJ3-0003yf-J2
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 18:34:29 +0000
X-Inumbo-ID: c83514fa-d979-11e9-b299-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c83514fa-d979-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568745269;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ICIjZBbG+5HGUGm8TPCUcOelLUDVgToDTueke91dGTc=;
 b=AArn/cXqegeTHMy+lEPh9tWXXytBg5PUeuimNEkF8OEKI2Ew2lVouwdt
 ESXtxNJm5c7Z4P5kLKNe3C2R+OrdhUhKxrJQawQSLfZLKYVXDee10fcUJ
 mjloK2utInLhVdwQAvbIfQCRVpAf8BE8+mf2C+WC+5bU6zVXk1SaVioXx A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lbV6QUqFbhR53UQcXsvb93XMU3CDI5+5XKBWxZYOn63QLU78p+viXQfXFeqna1uUb2yLAwv2EE
 HzdZdFzOiM0z2WVc5M6l14qjiUDlQnEXggLwGGrSS1LjeNjrZN2bf649l+rRXISksS46OvkqQY
 0ralKugU3EOR2hg7fzsV2kIq/DFlW0yOV4NclnN/diGDVLKAeLfRd+78R4msDTNcHnXa4lNHnK
 8cxlorS3h70gseeTRhKkWTQWObnyxu7g7Nvn11JAsOioIaZXoYbK3lTKvIPxmcIXA+ZyP5rgh3
 a78=
X-SBRS: 2.7
X-MesageID: 5689757
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5689757"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 17 Sep 2019 19:34:25 +0100
Message-ID: <20190917183425.4826-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libs: Fix build following c/s 56dccee3f,
 take 2
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZpeCBmb3IgYy9zIDAxYmE4ZjYyYjYxOCB3YXMgc3BlY3VsYXRpdmUgZ2l2ZW4gbm8gbG9j
YWwgcmVwcm8uICBJdCB0dXJucwpvdXQgdGhhdCBpdCBkaWRuJ3QgZml4IHRoZSBwcm9ibGVtLgoK
VGhlICQoQVVUT0lOQ1MpIHZhcmlhYmxlIG5lZWRzIHRvIGJlIHZpc2libGUgYmVmb3JlIGxpYnMu
bWsgaXMgaW5jbHVkZWQsIHRvCmhhdmUgYW55IGVmZmVjdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL2xpYnMvdG9vbGNvcmUvTWFr
ZWZpbGUgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvdG9vbGNvcmUvTWFrZWZpbGUgYi90b29scy9s
aWJzL3Rvb2xjb3JlL01ha2VmaWxlCmluZGV4IGVkY2U2MWRjYTQuLjljNWE5MmQ5M2YgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2xpYnMvdG9vbGNvcmUvTWFrZWZpbGUKKysrIGIvdG9vbHMvbGlicy90b29s
Y29yZS9NYWtlZmlsZQpAQCAtNCw2ICs0LDcgQEAgaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9S
dWxlcy5tawogTUFKT1IJPSAxCiBNSU5PUgk9IDAKIExJQk5BTUUgIDo9IHRvb2xjb3JlCitBVVRP
SU5DUyA6PSBpbmNsdWRlL194ZW50b29sY29yZV9saXN0LmgKIAogU1JDUy15CSs9IGhhbmRsZXJl
Zy5jCiAKQEAgLTExLDggKzEyLDYgQEAgaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9saWJzL2xp
YnMubWsKIAogJChQS0dfQ09ORklHX0xPQ0FMKTogUEtHX0NPTkZJR19JTkNESVIgPSAkKFhFTl9M
SUJYRU5UT09MQ09SRSkvaW5jbHVkZQogCi1BVVRPSU5DUz1pbmNsdWRlL194ZW50b29sY29yZV9s
aXN0LmgKLQogJChMSUJfT0JKUyk6ICQoQVVUT0lOQ1MpCiAkKFBJQ19PQkpTKTogJChBVVRPSU5D
UykKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
