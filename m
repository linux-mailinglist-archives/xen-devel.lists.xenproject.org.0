Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B986F53CC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9LB-0007x4-SK; Fri, 08 Nov 2019 18:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9LA-0007w5-6A
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:36 +0000
X-Inumbo-ID: 971b90e4-0258-11ea-a1d6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 971b90e4-0258-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=f0byd3ILKmLFVlU8lISjneRQLQo5kZV/F5twGVZKvVE=;
 b=ZZH+HnbXPQ++YbfXPzpcWydmWqDhpvTB8dFfrfdTOSUlxP6+uVvXAJxz
 QHFOYpTFPotaukA+gxrkLwMSuX5sJMO3Z3KPpZQ9oGNdubkSy2GBtItBk
 jdYRNJRR+CAXHFBooitXeKvOqexiXqIyVnhDCb6w5FVrTORXhN4GbY55W g=;
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
IronPort-SDR: chlWlMQpOsjw8GJATA+QRcHCT6tZhQP6nQcfHqMxVbNpvLn1zqIk23vPw2VcypNwj0HMi1ouBy
 time6eMEXwDw2kio63VGtPjO7KZGvESXUmTjAEBebsSwg1RCThRI0oByOLtLv74GtBkyYbmf8v
 7R/h92MLmn2Obiff5hIXAYN5bOKDDi4tAoSSqyf6yahs5+ohq7h0gm9ppGYGI47wVULdUP+jzY
 N3wC4muPLENaVloVrmobyOrut2azGcsRVA5eHIMmPB04WiGKnFJjRT47fb6drmmqWA+kjYdZY3
 vs0=
X-SBRS: 2.7
X-MesageID: 8482901
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8482901"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:50 +0000
Message-ID: <20191108185001.3319-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 02/13] sg-report-host-history: New
 --no-install option for testing
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

Tm8gY2hhbmdlIGZvciBleGlzdGluZyBjYWxsZXJzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcmVwb3J0LWhvc3QtaGlzdG9y
eSB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSBiL3NnLXJlcG9ydC1ob3N0
LWhpc3RvcnkKaW5kZXggNDJkZWY2YmYuLmM5ZjRhYWE2IDEwMDc1NQotLS0gYS9zZy1yZXBvcnQt
aG9zdC1oaXN0b3J5CisrKyBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKQEAgLTMxLDYgKzMxLDcg
QEAgdXNlIE9zc3Rlc3Q6OkV4ZWN1dGl2ZSBxdyg6REVGQVVMVCA6Y29sb3Vycyk7CiBvdXIgJGxp
bWl0PSAyMDA7CiBvdXIgJGZsaWdodGxpbWl0Owogb3VyICRodG1sb3V0ID0gIi4iOworb3VyICRk
b2luc3RhbGw9MTsKIG91ciBAYmxlc3NpbmdzOwogCiBvcGVuIERFQlVHLCAiPi9kZXYvbnVsbCI7
CkBAIC01MSw2ICs1Miw4IEBAIHdoaWxlIChAQVJHViAmJiAkQVJHVlswXSA9fiBtL14tLykgewog
ICAgICAgICBwdXNoIEBibGVzc2luZ3MsIHNwbGl0ICcsJywgJDE7CiAgICAgfSBlbHNpZiAobS9e
LS1odG1sLWRpcj0oLiopJC8pIHsKICAgICAgICAgJGh0bWxvdXQ9ICQxOworICAgIH0gZWxzaWYg
KG0vXi0tbm8taW5zdGFsbCQvKSB7CisgICAgICAgICRkb2luc3RhbGw9IDA7CiAgICAgfSBlbHNp
ZiAobS9eLS1kZWJ1Zy8pIHsKICAgICAgICAgb3BlbiBERUJVRywgIj4mMiIgb3IgZGllICQhOwog
ICAgICAgICBERUJVRy0+YXV0b2ZsdXNoKDEpOwpAQCAtMzIyLDcgKzMyNSw4IEBAIEVORAogICAg
IHByaW50IEggIjwvdGFibGU+PC9ib2R5PjwvaHRtbD5cbiI7CiAKICAgICBjbG9zZSBIIG9yIGRp
ZSAkITsKLSAgICByZW5hbWUgIiRodG1sX2ZpbGUubmV3IiwgIiRodG1sX2ZpbGUiIG9yIGRpZSAi
JGh0bWxfZmlsZSAkISI7CisgICAgcmVuYW1lICIkaHRtbF9maWxlLm5ldyIsICIkaHRtbF9maWxl
IiBvciBkaWUgIiRodG1sX2ZpbGUgJCEiCisgICAgICAgIGlmICRkb2luc3RhbGw7CiB9CiAKIGRi
X3JldHJ5KCRkYmhfdGVzdHMsIFtdLCBzdWIgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
