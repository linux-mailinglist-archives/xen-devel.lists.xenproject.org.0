Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A9F53D0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9LC-0007xj-DL; Fri, 08 Nov 2019 18:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9LA-0007wY-I1
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:36 +0000
X-Inumbo-ID: 9a8d599c-0258-11ea-adbe-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a8d599c-0258-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=UoZj1twCsqz4RD+oQF3WE6ZiGLkrhL4NtaEKo19J694=;
 b=CZlImhQGzjRyhhCiO6qksnl/Iv0/gbIWL5lYCo1sLTYq4t5+K8ehWY2h
 XUPvsd/fhtaKSqNG50PslidwOlINlPA+fXp96k0PvZ6ptszQ6gi/2BRJe
 Xg0o/4xkXN46OwU1bE66U7RA1SCNK6Y3o0IKfCCSXfd5LT36seCYvQBZA I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ruZtTklUsHsQJ8XEXXu5sytWtU6aYXdiMy35nK/i/u1+k7GD+X3mqwBtvWvB/R7gLvbsPEJLwA
 oNSaU6jfby5+eWMz6lD75F/InIZPWaQUXK0ERDx9OcVOT/jb8AbkwoxDhjk+0WCsO8WFXTdht6
 waOHFhLCq+fIH79y9unTEA+s5I/KxBbCaPXb9L97M8Z4e6TMA2/qz7hwc0f1ds0SRvRJZM2aSQ
 K4TL6Ou2FUp/AkiLDWBtB9yvAEfxX4MTOJ9o9kvVRci0Y26OFicDG3hIm29d1v6OMptisA02hY
 wAw=
X-SBRS: 2.7
X-MesageID: 8592083
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,283,1569297600"; 
   d="scan'208";a="8592083"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:54 +0000
Message-ID: <20191108185001.3319-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 06/13] sg-report-host-history: Add
 $cachekey argument to jobquery
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBrZXkgd2lsbCBkaXN0aW5ndWlzaCB0aGUgcmVzdWx0cyBvZiBkaWZmZXJlbnQgcXVlcmll
cyB3ZSBkbyBwZXIKam9iLiAgUmlnaHQgbm93IGl0IGlzIG5vdCB1c2VkLCBzbyBubyBmdW5jdGlv
bmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgotLS0KIHNnLXJlcG9ydC1ob3N0LWhpc3RvcnkgfCA5ICsrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5IGIvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQppbmRleCA4
MWE3YThkOC4uNGM0MGNiZWMgMTAwNzU1Ci0tLSBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKKysr
IGIvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQpAQCAtMTA5LDcgKzEwOSw4IEBAIEVORAogICAgIHBy
aW50IERFQlVHICJNSU5GTElHSFQgJG1pbmZsaWdodFxuIjsKIH0KIAotc3ViIGpvYnF1ZXJ5ICgk
JCkgeworc3ViIGpvYnF1ZXJ5ICgkJCQpIHsKKyAgICBteSAoJHEsICRqciwgJGNhY2hla2V5KSA9
IEBfOwogICAgIG15ICgkcSwgJGpyKSA9IEBfOwogICAgICRxLT5leGVjdXRlKCRqci0+e2ZsaWdo
dH0sICRqci0+e2pvYn0pOwogICAgIHJldHVybiAkcS0+ZmV0Y2hyb3dfaGFzaHJlZigpOwpAQCAt
MjE4LDcgKzIxOSw3IEBAIEVORAogICAgIGZvcmVhY2ggbXkgJGpyIChAJGlucm93cykgewogCXBy
aW50IERFQlVHICJKT0IgJGpyLT57ZmxpZ2h0fS4kanItPntqb2J9ICI7CiAKLQlteSAkZW5kZWRy
b3cgPSBqb2JxdWVyeSgkZW5kZWRxLCAkanIpOworCW15ICRlbmRlZHJvdyA9IGpvYnF1ZXJ5KCRl
bmRlZHEsICRqciwgJ2UnKTsKIAlpZiAoISRlbmRlZHJvdykgewogCSAgICBwcmludCBERUJVRyAi
bm8tZmluaXNoZWRcbiI7CiAJICAgIG5leHQ7CkBAIC0yMzUsOCArMjM2LDggQEAgRU5ECiAgICAg
bXkgJGFsdGVybmF0ZSA9IDA7CiAgICAgZm9yZWFjaCBteSAkanIgKEByb3dzKSB7CiAgICAgICAg
IHByaW50IERFQlVHICJKUiAkanItPntmbGlnaHR9LiRqci0+e2pvYn1cbiI7Ci0JbXkgJGlyID0g
am9icXVlcnkoJGluZm9xLCAkanIpOwotCW15ICRhciA9IGpvYnF1ZXJ5KCRhbGxvY2RxLCAkanIp
OworCW15ICRpciA9IGpvYnF1ZXJ5KCRpbmZvcSwgJGpyLCAnaScpOworCW15ICRhciA9IGpvYnF1
ZXJ5KCRhbGxvY2RxLCAkanIsICdhJyk7CiAJbXkgJGlkZW50ID0gJGpyLT57bmFtZX07CiAJJGpy
dW52YXJxLT5leGVjdXRlKCRqci0+e2ZsaWdodH0sICRqci0+e2pvYn0sICRpZGVudCk7CiAgICAg
ICAgIG15ICVydW52YXJzOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
