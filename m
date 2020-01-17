Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F167140E79
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:00:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isU0c-0002aN-O4; Fri, 17 Jan 2020 15:58:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V5CB=3G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1isU0b-0002Zp-AP
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:58:05 +0000
X-Inumbo-ID: 1cd576f8-3942-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cd576f8-3942-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579276670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MBs6V8s3hLnXcrUbnYa2dDVmTmQfIxPcUoGbkPwkuxQ=;
 b=QmkY0szOF8p9bBki9j/rPVt0hY0bS0xpWgBYl1UeC7CaEM8JkSpvssAb
 iVYMhkDDMZkOeNWYWrrlgk+pbixi1fjAJtryls/2Y0LsQGmvR1UhOM52E
 oH3CzgUhElFvdE1y1f5tew+dewHsUb+sC6t4ZUh33wNet9gBh+ld+2M/6 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n/vSxt2PlFiwHOZLBezxBIYcQsiPgu4Hxymjdums3JbzWCfdA7wmWik4jGN5YJLiIQkL/Qcw1M
 xHMfuyyskw39BuI17QFDGW8bJbQ3+aOlk8+7ia+tKoK/jlyJm0A97/N50NJYQx9cvmuum9XiaT
 lpFItAWLhjyld+N+pd/+C3yz/HNlthj5JoX7PAzOrxs0eSjN0xLxaIWPwDkEcC938ruNAkrsl/
 OXSV6dCgIEsKEcZYE416/1K66C6wSc3vaXMP11ou+aujJpdoqjI8vv4+rMNXFHMkcpVEZNW7aU
 rXM=
X-SBRS: 2.7
X-MesageID: 11674364
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11674364"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 15:57:32 +0000
Message-ID: <20200117155734.1067550-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117155734.1067550-1-george.dunlap@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 6/8] golang/xenlight: Don't leak memory on
 context open failure
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgbGlieGxfY3R4X2FsbG9jKCkgcmV0dXJucyBhbiBlcnJvciwgd2UgbmVlZCB0byBkZXN0cm95
IHRoZSBsb2dnZXIKdGhhdCB3ZSBtYWRlLgoKUmVzdHJ1Y3R1cmUgdGhlIENsb3NlKCkgbWV0aG9k
IHN1Y2ggdGhhdCBpdCBjaGVja3MgZm9yIGVhY2ggcmVzb3VyY2UKdG8gYmUgZnJlZWQgYW5kIHRo
ZW4gZnJlZXMgaXQuICBUaGlzIGFsbG93cyBDbG9zZSgpIHRvIGJlIGNvbWUKaWRlbXBvdGVudCwg
YXMgd2VsbCBhcyB0byBiZSBhIHVzZWZ1bCBjbGVhbi11cCB0byBhIHBhcnRpYWxseS1jcmVhdGVk
CmNvbnRleHQuCgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+Ci0tLQpDQzogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4K
LS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAzMCArKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5n
byBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCAwZTcxZjZjYTdkLi42
NjJiMjY2MjUwIDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28K
KysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC03OSwyOCArNzksNDAg
QEAgdHlwZSBDb250ZXh0IHN0cnVjdCB7CiB9CiAKIC8vIE5ld0NvbnRleHQgcmV0dXJucyBhIG5l
dyBDb250ZXh0LgotZnVuYyBOZXdDb250ZXh0KCkgKCpDb250ZXh0LCBlcnJvcikgewotCXZhciBj
dHggQ29udGV4dAorZnVuYyBOZXdDb250ZXh0KCkgKGN0eCAqQ29udGV4dCwgZXJyIGVycm9yKSB7
CisJY3R4ID0gJkNvbnRleHR7fQorCisJZGVmZXIgZnVuYygpIHsKKwkJaWYgZXJyICE9IG5pbCB7
CisJCQljdHguQ2xvc2UoKQorCQkJY3R4ID0gbmlsCisJCX0KKwl9KCkKIAogCWN0eC5sb2dnZXIg
PSBDLnh0bF9jcmVhdGVsb2dnZXJfc3RkaW9zdHJlYW0oQy5zdGRlcnIsIEMuWFRMX0RFQlVHLCAw
KQogCiAJcmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZjdHguY3R4LCBDLkxJQlhMX1ZFUlNJT04s
IDAsCiAJCSgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoY3R4LmxvZ2dlcikp
KQogCWlmIHJldCAhPSAwIHsKLQkJcmV0dXJuIG5pbCwgRXJyb3IocmV0KQorCQlyZXR1cm4gY3R4
LCBFcnJvcihyZXQpCiAJfQogCi0JcmV0dXJuICZjdHgsIG5pbAorCXJldHVybiBjdHgsIG5pbAog
fQogCiAvLyBDbG9zZSBjbG9zZXMgdGhlIENvbnRleHQuCiBmdW5jIChjdHggKkNvbnRleHQpIENs
b3NlKCkgZXJyb3IgewotCXJldCA6PSBDLmxpYnhsX2N0eF9mcmVlKGN0eC5jdHgpCi0JY3R4LmN0
eCA9IG5pbAotCUMueHRsX2xvZ2dlcl9kZXN0cm95KCgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5z
YWZlLlBvaW50ZXIoY3R4LmxvZ2dlcikpKQorCWlmIGN0eC5jdHggIT0gbmlsIHsKKwkJcmV0IDo9
IEMubGlieGxfY3R4X2ZyZWUoY3R4LmN0eCkKKwkJaWYgcmV0ICE9IDAgeworCQkJcmV0dXJuIEVy
cm9yKHJldCkKKwkJfQorCQljdHguY3R4ID0gbmlsCisJfQogCi0JaWYgcmV0ICE9IDAgewotCQly
ZXR1cm4gRXJyb3IocmV0KQorCWlmIGN0eC5sb2dnZXIgIT0gbmlsIHsKKwkJQy54dGxfbG9nZ2Vy
X2Rlc3Ryb3koKCpDLnhlbnRvb2xsb2dfbG9nZ2VyKSh1bnNhZmUuUG9pbnRlcihjdHgubG9nZ2Vy
KSkpCisJCWN0eC5sb2dnZXIgPSBuaWwKIAl9CiAKIAlyZXR1cm4gbmlsCi0tIAoyLjI0LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
