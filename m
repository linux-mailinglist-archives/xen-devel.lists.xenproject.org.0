Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF012E9B6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:07:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4ps-0002TP-NM; Thu, 02 Jan 2020 18:04:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4pr-0002TK-JX
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:04:39 +0000
X-Inumbo-ID: 56dedb83-2d8a-11ea-a3a7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56dedb83-2d8a-11ea-a3a7-12813bfff9fa;
 Thu, 02 Jan 2020 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577988278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jzzw2KZFt4qiT79IHWrEuiFHTomBbEMjEGosXBoMiD8=;
 b=ByZzofHoMmsb/jVgEtZo0zfBO+PZYLeYPxsnTYZj1lzMzNDRnvhfDNQS
 +bloGvtHcSaTsFc6UMgmDEOvpYcVRSf9O5/mAJ/0yWixcdGoNKQeVmSh6
 tKasIHivC/qIN37i19iAMmy6gd+UCVEAKJULKSB+Aera5wXRED5B9Jevo c=;
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
IronPort-SDR: xtyQcTXl28Ka8UsU7PXQgzX8OZepY/+POkAFu8B7SrKPb7d1pLPBKSHihQgH2A607gkRa8AL3u
 XOGnhPH5kaxXeOX94oVpdOdkRMLNdsUo0LFo68nyz2Fq3XjnQoU0MZOsatR6iqSsY82IwN1zii
 TybsOzEqV4dmOc+oqMnqr6Zs2YWZE3aZ+ISOhoGIqlQBNHFjBFqizoIcTOPiDN7pIvBP6xqrnz
 01/enOJfyz/2L8GeL0K34F6sE1/YWzJrPj8yyPQEym5zSxrT+ZTowRtDY0xTvJvHbf+EKvVkhX
 KVQ=
X-SBRS: 2.7
X-MesageID: 10816425
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10816425"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 Jan 2020 18:04:33 +0000
Message-ID: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] Switch to linux-4.19 by default (from
 4.14)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhZmZlY3RzIG9ubHkgeDg2IGFuZCBvbmx5IHRoZSBicmFuY2hlcyB0aGF0IGFyZW4ndCBs
aW51eC0qLCBzaW5jZQpvYnZpb3VzbHkgdGhlIGxhdHRlciB1c2Ugd2hhdGV2ZXIgdmVyc2lvbiB0
aGV5IGFyZSB1c2luZy4KCkkgY29tcGFyZWQgdGhlIG1vc3QgcmVjZW50IGxpbnV4LTQuMTkgcmVz
dWx0cyB3aXRoIHRoZSBtb3N0IHJlY2VudApsaW51eC00LjE0IG9uZXMsIGFuZCB0aGVyZSB3YXMg
b25seSBvbmUgbmV3IGZhaWx1cmUgKGluIDE0Mzg0MSk6CiAgdGVzdC1hbWQ2NC1pMzg2LXFlbXV1
LXJoZWw2aHZtLWludGVsIDEyIGd1ZXN0LXN0YXJ0L3JlZGhhdC5yZXBlYXQgZmFpbCBSRUdSLiB2
cy4gMTQzOTExCgpUaGlzIHN0ZXAgaGFzIGZhaWxlZCB0d2ljZSBpbiB0aGUgd2ViLXZpc2libGUg
aGlzdG9yeSBvZiB0aGlzIGpvYiBvbgo0LjE5OyBhbmQgb25jZSByZWNlbnRseSBpbiA0LjE0LiAg
QmVjYXVzZSBvZiB0aGUgbG93IHVwZGF0ZSByYXRlIG9mCnRoZXNlIHRyZWVzIG5vd2FkYXlzLCB0
aGVzZSB0ZXN0cyBhcmUgYSB3aGlsZSBhZ28gYW5kIHdlIGRvbid0IGhhdmUKdGhlIGxvZ3MgYW55
IG1vcmUuCgpJIHRoaW5rIGdpdmVuIHRoYXQgaXQncyBhbHJlYWR5IG5vdCBwZXJmZWN0IHRoaXMg
aXMgbm90IGEgYmxvY2tlciBhbmQKd2Ugc2hvdWxkIHVwZGF0ZSBvc3N0ZXN0IHRvIDQuMTQuCgpD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm95Z2VyQEZyZWVCU0Qub3JnPgpDQzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzogQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBhcC1jb21tb24gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcC1jb21t
b24gYi9hcC1jb21tb24KaW5kZXggNmFlN2NjZTYuLjU0N2I0OGVkIDEwMDY0NAotLS0gYS9hcC1j
b21tb24KKysrIGIvYXAtY29tbW9uCkBAIC01OSw3ICs1OSw3IEBACiAKIDogJHtQVVNIX1RSRUVf
TElOVVg6PSRYRU5CSVRTOi9ob21lL3hlbi9naXQvbGludXgtcHZvcHMuZ2l0fQogOiAke0JBU0Vf
VFJFRV9MSU5VWDo9Z2l0Oi8veGVuYml0cy54ZW4ub3JnL2xpbnV4LXB2b3BzLmdpdH0KLTogJHtC
QVNFX1RBR19MSU5VWDo9dGVzdGVkL2xpbnV4LTQuMTR9Cis6ICR7QkFTRV9UQUdfTElOVVg6PXRl
c3RlZC9saW51eC00LjE5fQogOiAke0JBU0VfVEFHX0xJTlVYX0FSTTo9dGVzdGVkL2xpbnV4LWFy
bS14ZW59CiAKIGlmIFsgIngke1RSRUVfTElOVVh9IiA9IHggXTsgdGhlbgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
