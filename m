Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A910D79B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:07:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahoq-0006S4-VV; Fri, 29 Nov 2019 15:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahop-0006Rp-Rc
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:27 +0000
X-Inumbo-ID: 85ac7fbe-12b9-11ea-a3e7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85ac7fbe-12b9-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039861;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=66t2JDdtz0l0BwbKo3nrdPwM4Gkx3SAcq7prS6A8sNE=;
 b=V51HqKJY+Mh53fHLjaoVlwngr+DiMZaekj+D19MYOYMARh/zdacTEkdp
 BRG5ueCFUFg9Q67lhXEtzZA8Do9MI18CJGwy5bm0aEE8dX3ev560F3k6E
 Ldh/iq+uO06NlqDT8P1+F/fXd/aokNGsAY9EYMdA7QJWyR2jOwozFKSDI A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ACgfVz3+TQ8qq0Qsk9WQ6UIZU0w4IRzALlbq5TxI4dX8buO/6BNTIoNrTHGw53PE7CXdVEX9EB
 RjyyBQWO5Hh1mwfiLbRI9oIWZ97UC0IyP6CIKk6/nRFMC/6K6WwkJM7uQQnhfTEW6cJVE6Kjus
 oqhdjsLBR1LOFZQs/T7r6Cifi/H3UKsTaNgWPNf4gr0q9G5Hf8tJ6pmDCKVzBUeWaDebGQDRpo
 1A/gLOaISAUkpwqHIE0qKIAjoFUMY99oUxmixEqRe3+0o8xCV+uY+04WRUhUSVlJMvazojRouv
 KzE=
X-SBRS: 2.7
X-MesageID: 9402075
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9402075"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:07 +0000
Message-ID: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/9] Process docs updates
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBoYXZlIGEgZ3Jvd2luZyBicmFuY2ggb2YgcGF0Y2hlcyB0byB0aGUgcmVsZWFzZSBwcm9jZXNz
IGRvY3MuICBUaGVzZQpzaG91bGQgZ28gaW50byB0cmVlLgoKQXMgdGhlIHJlbGVhc2UgdGVjaG5p
Y2FuIEkgYW0gZ29pbmcgdG8gY29tbWl0IHRoZXNlICh0byBzdGFnaW5nLCB3aGljaAppcyB0aGUg
b25lIHdlIHVzZSBmb3IgZXZlcnl0aGluZykgdW5sZXNzIHNvbWVvbmUgY2xlYXJseSBuYWtzIHRo
ZW0uCklmIHlvdSB3YW50IHRvIGltcHJvdmUgdGhlIHByb2Nlc3MsIHBhdGNoZXMgdG8gdGhlc2Ug
ZmlsZXMgKGV0Yy4pIGFyZQp3ZWxjb21lIGJ1dCBpbXByb3ZlbWVudHMgc2hvdWxkIG5vdCBibG9j
ayB0aGVzZSBkb2N1bWVudGF0aW9uIHVwZGF0ZXMuCgpJYW4gSmFja3NvbiAoOSk6CiAgYnJhbmNo
aW5nIGNoZWNrbGlzdDogZHJvcCBzb21lIGhnIHRhZyBydW5lcwogIGJyYW5jaGluZyBjaGVja2xp
c3Q6IFNheSBwZXJoYXBzIG5vIENvbmZpZy5tayBjaGFuZ2VzIG5lZWRlZAogIGJyYW5jaGluZyBj
aGVja2xpc3Q6IE1vcmUgZGV0YWlsZWQgaW5zdHJ1Y3Rpb25zIHJlIE1BSU5UQUlORVJTCiAgcmVs
ZWFzZSB0ZWNobmljaWFuIGNoZWNrbGlzdDogUmVmb3JtYXQgQ29uZmlnLm1rIGNoYW5nZXMKICBy
ZWxlYXNlIHRlY2huaWNpYW4gY2hlY2tsaXN0OiBNb3JlIGV4cGxpY2l0IFhFTl9FWFRSQVZFUlNJ
T04KICBkb2NzL3Byb2Nlc3M6IEZpeCBtaW5vciBlcnJvciBpbiBmb3JtYXR0aW5nCiAgZG9jcy9w
cm9jZXNzOiBNZW50aW9uIC5aLXByZSB2ZXJzaW9ucwogIGRvY3MvcHJvY2VzczogTm90aWZ5IHJl
bGVhc2UgbWFuYWdlciwgcmF0aGVyIHRoYW4gZWRpdGluZyB3ZWJzaXRlCiAgZG9jcy9wcm9jZXNz
OiBNb3ZlIE1BSU5UQUlORVJTIHVwZGF0ZSBmb3Igc3RhYmxlIHRvIC4wIHJlbGVhc2UKCiBkb2Nz
L3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQgICAgICAgICAgfCAxMCArLS0tLS0tLS0t
CiBkb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQgfCAyNiArKysr
KysrKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
