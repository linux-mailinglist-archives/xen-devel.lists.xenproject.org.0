Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B971842E5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:48:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfxV-0006hj-Jb; Fri, 13 Mar 2020 08:46:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCfxU-0006hc-9H
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:46:20 +0000
X-Inumbo-ID: 1b9ed900-6507-11ea-b34e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b9ed900-6507-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584089179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nUPbTKXL4KgWk5SobesvIKkID2FOqCoGQrUd1cVLpjI=;
 b=gIpIXNkEV8DHBk8hrDaLxnKAHXCb8EdMrW69lG1wNJOd5qdf0mDCZ9Z4
 4cfaH93X8J93+XGUYyqt8X4mmMjPYvWfNu7pDvwp8mVm4B9SbH53ZPNdP
 XShY9keyhsc+eqK+OLDZXYt7CO+1WVctaNRQcAj1gYEGfnJCU/9+BZ0bU o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l1i59W7ooNQ1IGF9SQi73SGyl0CXyhnlSIduFJ+CXhCxLBInLPSDfveriJJ6q86wmzj+sf9E67
 ylwxsD7MywbwQp7TJRZ6Bj7mgsxLEx8wyRlWI230g8yrliSg+zKw+0wz6pMlf1zkwiunzxFp9H
 lK/vrzzl6H/sySBGpUFb3KGT2s7H2oIYAWnL3IpKdQaHH4jAeuVcPnvNK9LC+EUabsJtV1n/vk
 t7CpW+URlzhwJvIEnm7SDdRaDCYqcZd7cDgCRKxFqX5V+SfJ8rzntgZoulfChoO1c3p/j9FmEg
 GnI=
X-SBRS: 2.7
X-MesageID: 14317943
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,548,1574139600"; d="scan'208";a="14317943"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 09:45:58 +0100
Message-ID: <20200313084558.13759-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200313084558.13759-1-roger.pau@citrix.com>
References: <20200313084558.13759-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] libfsimage: fix parentheses in macro
 parameters
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VkVSSUZZX0ROX1RZUEUgYW5kIFZFUklGWV9PU19UWVBFIHNob3VsZCB1c2UgcGFyZW50aGVzZXMg
d2hlbgphY2Nlc3NpbmcgdGhlIHR5cGUgcGFyYW1ldGVyLiBOb3RlIHRoYXQgbm9uZSBvZiB0aGUg
Y3VycmVudCB1c2FnZXMKcmVxdWlyZSB0aGlzLCBpdCdzIGp1c3QgZG9uZSBmb3IgY29ycmVjdG5l
c3MuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KLS0tCiB0b29scy9saWJmc2ltYWdlL3pmcy9mc3lzX3pmcy5oIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYmZzaW1hZ2UvemZzL2ZzeXNfemZzLmggYi90b29scy9saWJmc2ltYWdlL3pmcy9mc3lz
X3pmcy5oCmluZGV4IDcyMTk3MmEwNWEuLmI0YmU1MWI1MGQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YmZzaW1hZ2UvemZzL2ZzeXNfemZzLmgKKysrIGIvdG9vbHMvbGliZnNpbWFnZS96ZnMvZnN5c196
ZnMuaApAQCAtNzEsNyArNzEsNyBAQCB0eXBlZGVmCXVuc2lnbmVkIGludCBzaXplX3Q7CiAgKiBD
YW4gb25seSBiZSB1c2VkIGluIGZ1bmN0aW9ucyByZXR1cm5pbmcgbm9uLTAgZm9yIGZhaWx1cmUu
CiAgKi8KICNkZWZpbmUJVkVSSUZZX0ROX1RZUEUoZG5wLCB0eXBlKSBcCi0JaWYgKHR5cGUgIT0g
RE1VX09UX05PTkUgJiYgKGRucCktPmRuX3R5cGUgIT0gdHlwZSkgeyBcCisJaWYgKCh0eXBlKSAh
PSBETVVfT1RfTk9ORSAmJiAoZG5wKS0+ZG5fdHlwZSAhPSAodHlwZSkpIHsgXAogCQlyZXR1cm4g
KEVSUl9GU1lTX0NPUlJVUFQpOyBcCiAJfQogCkBAIC04MCw3ICs4MCw3IEBAIHR5cGVkZWYJdW5z
aWduZWQgaW50IHNpemVfdDsKICAqIENhbiBvbmx5IGJlIHVzZWQgaW4gZnVuY3Rpb25zIHJldHVy
bmluZyAwIGZvciBmYWlsdXJlLgogICovCiAjZGVmaW5lCVZFUklGWV9PU19UWVBFKG9zcCwgdHlw
ZSkgXAotCWlmICh0eXBlICE9IERNVV9PU1RfTk9ORSAmJiAob3NwKS0+b3NfdHlwZSAhPSB0eXBl
KSB7IFwKKwlpZiAoKHR5cGUpICE9IERNVV9PU1RfTk9ORSAmJiAob3NwKS0+b3NfdHlwZSAhPSAo
dHlwZSkpIHsgXAogCQllcnJudW0gPSBFUlJfRlNZU19DT1JSVVBUOyBcCiAJCXJldHVybiAoMCk7
IFwKIAl9Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
