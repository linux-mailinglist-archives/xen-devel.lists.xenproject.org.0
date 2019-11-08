Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8FF53D1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9L2-0007rV-PL; Fri, 08 Nov 2019 18:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9L0-0007qi-H5
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:26 +0000
X-Inumbo-ID: 985fefc2-0258-11ea-adbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 985fefc2-0258-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/1BUrxLf7Hu33d8hmx2S8NiK/Eg5xK2ZvgQwMUqqH3c=;
 b=Z2vCB02RM9TMbydqTBpYjP8tyZB9jL28oF9ZLvZJXSBGPJFLKi0LisiG
 Glaxp97u8E0Dxbor0WLC64VMSx0Xni1U2ml0M12H8Scx+byMCo9dKI92I
 BOmbZFm2nUqKOgAOZe2DJ0fFs/iT4knn+UdQKrhBuiA/gqLFuHEl1kq2u Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VJ/yjvYsLCAWisoLUxuc5rNBOyWwMd7I4cDzFHpGGwV4L9kOnZIFAaFGd6pWFxVDiZVOOKpWCK
 wdHLuBXSUFodI6bFvqDOuKvam6VDsgNM3+Q2QwMhx8UJkvV/o/7K5OPR3l53DJ5HX/Zn3iZGxa
 RILbzu0VLKsOJyuMurduSv5mnH4hF2jDlYDNncKYPG9/jXfp74K6X7kbvgUp6Fwg5lgjNIyG5U
 oe2iThxnAMkEx27SMBUROOMnIW4C05bVWP47/XHmv6IpuL6gwLT41oDU1EUvqlc0Iq6aywjbyJ
 C+E=
X-SBRS: 2.7
X-MesageID: 8185732
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8185732"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:58 +0000
Message-ID: <20191108185001.3319-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 10/13] sg-report-host-history: Read
 cache entries
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkgYi9z
Zy1yZXBvcnQtaG9zdC1oaXN0b3J5CmluZGV4IDdkY2ZhYzlhLi5lNjdjNzM0NiAxMDA3NTUKLS0t
IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQorKysgYi9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CkBA
IC0zMSw2ICszMSw3IEBAIHVzZSBPc3N0ZXN0OjpFeGVjdXRpdmUgcXcoOkRFRkFVTFQgOmNvbG91
cnMpOwogb3VyICRsaW1pdD0gMjAwOwogb3VyICRmbGlnaHRsaW1pdDsKIG91ciAkaHRtbG91dCA9
ICIuIjsKK291ciAkcmVhZF9leGlzdGluZz0xOwogb3VyICRkb2luc3RhbGw9MTsKIG91ciBAYmxl
c3NpbmdzOwogCkBAIC01Miw2ICs1Myw4IEBAIHdoaWxlIChAQVJHViAmJiAkQVJHVlswXSA9fiBt
L14tLykgewogICAgICAgICBwdXNoIEBibGVzc2luZ3MsIHNwbGl0ICcsJywgJDE7CiAgICAgfSBl
bHNpZiAobS9eLS1odG1sLWRpcj0oLiopJC8pIHsKICAgICAgICAgJGh0bWxvdXQ9ICQxOworICAg
IH0gZWxzaWYgKG0vXi0tcmVnZW5lcmF0ZSQvKSB7CisgICAgICAgICRyZWFkX2V4aXN0aW5nPSAw
OwogICAgIH0gZWxzaWYgKG0vXi0tbm8taW5zdGFsbCQvKSB7CiAgICAgICAgICRkb2luc3RhbGw9
IDA7CiAgICAgfSBlbHNpZiAobS9eLS1kZWJ1Zy8pIHsKQEAgLTY5LDYgKzcyLDQxIEBAIG91ciAk
cmVzdHJpY3RmbGlnaHRfY29uZCA9IHJlc3RyaWN0ZmxpZ2h0X2NvbmQoKTsKIG91ciAkZmxpZ2h0
Y29uZDsKIG91ciAkbWluZmxpZ2h0OwogCitvdXIgJWhjYWNoZXM7CisKK3N1YiByZWFkX2V4aXN0
aW5nX2xvZ3MgKCQpIHsKKyAgICBteSAoJGhvc3RuYW1lKSA9IEBfOworICAgIHJldHVybiB1bmxl
c3MgJHJlYWRfZXhpc3Rpbmc7CisgICAgbXkgJGh0bWxfZmlsZSA9ICIkaHRtbG91dC8kaG9zdG5h
bWUuaHRtbCI7CisgICAgaWYgKCFvcGVuIEgsICRodG1sX2ZpbGUpIHsKKyAgICAgICAgcmV0dXJu
IGlmICQhPT1FTk9FTlQ7CisgICAgICAgIGRpZSAiZmFpbGVkIHRvIG9wZW4gJGh0bWxfZmlsZTog
JCEiOworICAgIH0KKyAgICBteSAkdGNhY2hlID0geyB9OworICAgICRoY2FjaGVzeyRob3N0bmFt
ZX0gPSAkdGNhY2hlOworICAgIGZvciAoOzspIHsKKyAgICAgICAgJF8gPSA8SD4gLy8gbGFzdDsK
KyAgICAgICAgbmV4dCB1bmxlc3MgbXteXDxcIS0tIG9zc3Rlc3QtcmVwb3J0LXJldXNlYWJsZSAo
LiopLS1cPiR9OworCW15ICRqciA9IHt9OworCW15ICRjaCA9ICRqcjsKKwlmb3JlYWNoIChzcGxp
dCAvIC8sICQxKSB7CisJICAgIGlmIChte15cdyskfSkgeworCQkkY2ggPSB7IH07CisJCSRqci0+
eyclJy4kJn0gPSAkY2g7CisJCW5leHQ7CisJICAgIH0KKwkgICAgc3teKFx3Kyk9fXt9IG9yIGRp
ZTsKKwkgICAgbXkgJGsgPSAkMTsKKwkgICAgc3tcJShbMC05YS1mXXsyfSl9eyBjaHIgaGV4ICQx
IH1nZTsKKwkgICAgJGNoLT57JGt9ID0gJF87CisJICAgIHByaW50IERFQlVHICJHT1RDQUNIRSAk
aG9zdG5hbWUgJGtcbiI7CisJfQorCXByaW50IERFQlVHICJHT1RDQUNIRSAkaG9zdG5hbWUgXEAg
JGpyLT57ZmxpZ2h0fSAkanItPntqb2J9ICRqci0+e3N0YXR1c30sJGpyLT57bmFtZX1cbiI7CisJ
JHRjYWNoZS0+eyRqci0+e2ZsaWdodH0sJGpyLT57am9ifSwkanItPntzdGF0dXN9LCRqci0+e25h
bWV9fSA9ICRqcjsKKyAgICB9CisgICAgY2xvc2UgSDsKK30KKwogc3ViIGNvbXB1dGVmbGlnaHRz
cmFuZ2UgKCkgewogICAgIGlmICghJGZsaWdodGxpbWl0KSB7CiAJbXkgJGZsYWdzY29uZCA9CkBA
IC0yMjUsMTYgKzI2MywyNiBAQCBFTkQKICAgICBteSAkaW5yb3dzID0gJGhvc3RzeyRob3N0bmFt
ZX07CiAgICAgcHJpbnQgREVCVUcgIkZPVU5EICIsIChzY2FsYXIgQCRpbnJvd3MpLCAiIFJPV1Mg
Zm9yICRob3N0bmFtZVxuIjsKIAorICAgIG15ICR0Y2FjaGUgPSAkaGNhY2hlc3skaG9zdG5hbWV9
OworCiAgICAgIyBFYWNoIGVudHJ5IGluIEAkaW5yb3dzIGlzIGEgJGpyLCB3aGljaCBpcyBhIGhh
c2gKICAgICAjIEl0IGhhcyBrZXlzIGZvciB0aGUgcmVzdWx0IGNvbHVtbnMgaW4gbWFpbnF1ZXJ5
CiAgICAgIyBJdCBhbHNvIGhhcyBrZXlzICclPGxldHRlcj4nICh5ZXMsIHdpdGggYSBsaXRlcmFs
ICclJykKICAgICAjIHdoaWNoIGFyZSB0aGUgcmVzdWx0cyBvZiBwZXItam9iIHF1ZXJpZXMuCi0g
ICAgIyBUaGUgY29udGVudHMgb2YgJGpyIGZvciBlYWNoIGpvYiBpcyBjYWNoZWQgYWNyb3NzIHJ1
bnMuIChUT0RPKQorICAgICMgVGhlIGNvbnRlbnRzIG9mICRqciBmb3IgZWFjaCBqb2IgaXMgY2Fj
aGVkIGFjcm9zcyBydW5zLgogCiAgICAgbXkgQHJvd3M7CisgICAgbXkgJGNhY2hlaGl0cyA9IDA7
CiAgICAgZm9yZWFjaCBteSAkanIgKEAkaW5yb3dzKSB7CiAJcHJpbnQgREVCVUcgIkpPQiAkanIt
PntmbGlnaHR9LiRqci0+e2pvYn0gIjsKIAorCW15ICRjYWNoZXJvdyA9CisJICAgICR0Y2FjaGUt
PnskanItPntmbGlnaHR9LCRqci0+e2pvYn0sJGpyLT57c3RhdHVzfSwkanItPntuYW1lfX07CisJ
aWYgKCRjYWNoZXJvdykgeworCSAgICAkanIgPSAkY2FjaGVyb3c7CisJICAgICRjYWNoZWhpdHMr
KzsKKwl9CisKIAlteSAkZW5kZWRyb3cgPSBqb2JxdWVyeSgkZW5kZWRxLCAkanIsICdlJyk7CiAJ
aWYgKCEkZW5kZWRyb3cpIHsKIAkgICAgcHJpbnQgREVCVUcgIm5vLWZpbmlzaGVkXG4iOwpAQCAt
MjQ2LDYgKzI5NCw5IEBAIEVORAogCXB1c2ggQHJvd3MsIHsgJSRqciwgJSRlbmRlZHJvdyB9Owog
ICAgIH0KIAorICAgIHByaW50IERFQlVHICJDQUNIRSAkaG9zdG5hbWUgJGNhY2hlaGl0cyAvICIu
KHNjYWxhciBAcm93cykKKwkuIiBvZiAiLihzY2FsYXIgJSR0Y2FjaGUpLiJcbiI7CisKICAgICBt
eSAkd3JpdGVfY2FjaGVfZW50cnkgPSBzdWIgewogCW15ICgkanIpID0gQF87CiAgICAgICAgIHBy
aW50IEggIjwhLS0gb3NzdGVzdC1yZXBvcnQtcmV1c2VhYmxlIjsKQEAgLTQwOCw2ICs0NTksMTAg
QEAgRU5ECiAKIGV4aXQgMCB1bmxlc3MgJWhvc3RzOwogCitmb3JlYWNoIChrZXlzICVob3N0cykg
eworICAgIHJlYWRfZXhpc3RpbmdfbG9ncygkXyk7Cit9CisKIGRiX3JldHJ5KCRkYmhfdGVzdHMs
IFtdLCBzdWIgewogICAgIGNvbXB1dGVmbGlnaHRzcmFuZ2UoKTsKIH0pOwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
