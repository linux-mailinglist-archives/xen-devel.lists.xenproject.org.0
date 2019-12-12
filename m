Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABC11D595
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:31:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTCL-0007OL-8q; Thu, 12 Dec 2019 18:28:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOos=2C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifTCK-0007O2-Gt
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:28:24 +0000
X-Inumbo-ID: 249a062a-1d0d-11ea-b6f1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 249a062a-1d0d-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zymFI7Z+q9SwVxzuaeFtT9HknAP1x6eJXTTlRZkHS0o=;
 b=Fs+ZeWfa/x06Dc+34v7CnsYYRPndh0Dtz2k8fMzGTE4LgxKSOEGXNAfz
 x3v8KJmE4TKVFuT7ccd7OD5zBBxAaYYi8xImutKUv3cn/SEH/LotKyLBZ
 +8Ap9+XTFhlc2D86r+lFAsJ43juEPnLqQmh7HPaf0SGsrTomZfI8zAXeR o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hnzUuT+m70w0MDxjY80mRwxwXxLiDKveThik7DYxkH7/RJ+avvfmcQ2xwP4zImkwM/ILOMfJ2G
 L+DMo6Zxoyz9CQJofiWoYfw2GvNj4bkNjdjIbz74juSt59Ce87fICRP5DCe0H9VeMhr1p7xdXD
 yvDEOF3ba6KZNht8YVV9hTGnB+KsP3Vmex6H9rFp7oSsQQ8EGTVkzSQgE0Vqb216c2WRfNBbWt
 3ruzz5GEu13Enxn4tgSoZ6VWxEP19A3bjLeRMq7rXbqPtSPRxqfe07XD05+Yzri3ZSiPqdP9tA
 tCw=
X-SBRS: 2.7
X-MesageID: 9611969
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9611969"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 18:27:34 +0000
Message-ID: <20191212182740.2190199-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212182740.2190199-1-anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 2/8] Config.mk: Remove stray comment
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

VGhpcyBjb21tZW50IGlzbid0IGFib3V0IENPTkZJR19URVNUUywgYnV0IGFib3V0IFNFQUJJT1Nf
RElSIHRoYXQgaGFzCmJlZW4gcmVtb3ZlZC4KCk9yaWdpbmFsbHksIHRoZSBjb21tZW50IHdhcyBh
ZGRlZCBieSA1ZjgyZDA4NThkZTEgKCJ0b29sczogc3VwcG9ydApTZWFCSU9TLiBVc2UgYnkgZGVm
YXVsdCB3aGVuIHVwc3RyZWFtIHFlbXUgaXMgY29uZmlndXJlZC4iKSwgdGhlbgpsYXRlciB0aGUg
U0VBQklPU19ESVIgd2FzIHJlbW92ZWQgYnkgMTRlZTNjMDVmM2VmICgiQ2xvbmUgYW5kIGJ1aWxk
ClNlYWJpb3MgYnkgZGVmYXVsdCIpIGJ1dCB0aGF0IGNvbW1lbnQgYWJvdXQgdGhlIHBhaW4gd2Fz
IGxlZnQgYmVoaW5kLgpUaGUgY29tbWl0IHRoYXQgbWFkZSBDT05GSUdfVEVTVFMgcGFpbmZ1bCB3
YXMgODU4OTZhN2M0ZGM3ICgiYnVpbGQ6CmFkZCBhdXRvY29uZiB0byByZXBsYWNlIGN1c3RvbSBj
aGVja3MgaW4gdG9vbHMvY2hlY2siKS4KCkxldCB0aGUgY29tbWVudCByZXN0LCBldmVudCBpZiBD
T05GSUdfVEVTVFM9eSBjYW4gYmUgcGFpbmZ1bC4gSXQncwplbmFibGVkIGJ5IGRlZmF1bHQgYW55
d2F5IGFuZCBkb2Vzbid0IGNhdXNlIHBhaW4gZm9yIG1vc3QKY29uZmlndXJhdGlvbi4KClNpZ25l
ZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0K
IENvbmZpZy5tayB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9Db25maWcubWsgYi9Db25maWcubWsKaW5kZXggODc2ODM5OGQ1ZWNlLi4zNWQ2NmU1
ZTEyMWEgMTAwNjQ0Ci0tLSBhL0NvbmZpZy5taworKysgYi9Db25maWcubWsKQEAgLTI4OSw3ICsy
ODksNCBAQCBRRU1VX1RSQURJVElPTkFMX0xPQyA/PSAkKGNhbGwgb3IsJCh3aWxkY2FyZCAkKFFF
TVVfVFJBRElUSU9OQUxfSU5UUkVFKSksXAogUUVNVV9VUFNUUkVBTV9MT0MgPz0gJChjYWxsIG9y
LCQod2lsZGNhcmQgJChRRU1VX1VQU1RSRUFNX0lOVFJFRSkpLFwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAkKFFFTVVfVVBTVFJFQU1fVVJMKSkKIAotIyBTaG9ydCBhbnN3ZXIgLS0g
ZG8gbm90IGVuYWJsZSB0aGlzIHVubGVzcyB5b3Uga25vdyB3aGF0IHlvdSBhcmUKLSMgZG9pbmcg
YW5kIGFyZSBwcmVwYXJlZCBmb3Igc29tZSBwYWluLgotCiBDT05GSUdfVEVTVFMgICAgICAgPz0g
eQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
