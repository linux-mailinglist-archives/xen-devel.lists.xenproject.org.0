Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B8B782C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:07:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuF3-00037t-IT; Thu, 19 Sep 2019 11:04:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAuF2-00037N-0p
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:04:52 +0000
X-Inumbo-ID: 4ac876a6-dacd-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ac876a6-dacd-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i+v4FFNS5LSgTV17QujL1d9bwkzUvxKQvjAdyIy2DVA=;
 b=aqmXwJOev81sA0eL4bhDDPzZ1/z0JE64d/Uu3xN4qQ2R/khZnB9QTydM
 vkj4AsQedMwmW64eOJCES09J1qiJ1gLf+DvXUrSfkeGoHf9jdwMFXe/Fb
 B3gyBgWcLXV9zT7daoRuDed1QLlLt6/0dScvJWvh4ald5YVefjSjQuMbt Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sdBpOHnkd/enjFQxwa63ywNuhc5XI6TXJl4psaOS+EjU+Vb1ryZ4AYnvlrVH969g1dT1A+utA+
 QwAiW44gw0drdHFSiTVOLjmrXsf/f0R/mymg6jkweOuOe0UWMour7OIt9/AMyqHjpV/afo5Tjk
 5DTxEkQWV9tfmSZHJ7Yfqta3Zz5jh+M0iNWEhNvqHUM76IK6zl3/Ldz3IPieQDMQV5ZlvrX/2Q
 OCmwsqy79yBz9LAzizt9xfycZMbIVTQxJO/akfIYgEbrM0+r9+OHE8m7psfVN/3+d2BbgjqIEm
 hsA=
X-SBRS: 2.7
X-MesageID: 5782654
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5782654"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 12:04:35 +0100
Message-ID: <20190919110443.817594-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919110443.817594-1-anthony.perard@citrix.com>
References: <20190919110443.817594-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/9] libxl_internal: Remove lost comment
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhdCBjb21tZW50IGFzIGJlZW4gc2VwYXJhdGVkIGZyb20gdGhlIGZ1bmN0aW9uIGl0IGRlZmlu
ZXMgYnkKNDE5N2QzYWJiYjMwNTVkMzc5ODI1NGViN2JhMjM5YmZiNTgyNDM2MCwgYnV0IHRoZW4g
d2FzIG5vdCB1c2VmdWwKYW55bW9yZSB3aGVuIHRoZSBsaWJ4bF9fZGV2aWNlX2Rpc2tfYWRkKCkg
cHJvdG90eXBlIHdhcyByZW1vdmVkIGJ5CjIyZWE4YWQwMmU0NjVlMzJjZDQwODg3Yzc1MGI1NWMz
YTk5N2EyODguCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2Vk
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBlN2Q5Nzc3OTMwODIuLmEzZTRiOTA3Yjdj
OSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0yNzE5LDEzICsyNzE5LDYgQEAgc3RydWN0IGxpYnhs
X19tdWx0aWRldiB7CiAgKiAgICAgICAgICAgICAgICAgICBET05FLgogICovCiAKLS8qIEFPIG9w
ZXJhdGlvbiB0byBjb25uZWN0IGEgZGlzayBkZXZpY2UsIGNhbGxlZCBieQotICogbGlieGxfZGV2
aWNlX2Rpc2tfYWRkIGFuZCBsaWJ4bF9fYWRkX2Rpc2tzLiBUaGlzIGZ1bmN0aW9uIGNhbGxzCi0g
KiBsaWJ4bF9fd2FpdF9kZXZpY2VfY29ubmVjdGlvbiB0byB3YWl0IGZvciB0aGUgZGV2aWNlIHRv
Ci0gKiBmaW5pc2ggdGhlIGNvbm5lY3Rpb24gKG1pZ2h0IGludm9sdmUgZXhlY3V0aW5nIGhvdHBs
dWcgc2NyaXB0cykuCi0gKgotICogT25jZSBmaW5pc2hlZCwgYW9kZXYtPmNhbGxiYWNrIHdpbGwg
YmUgZXhlY3V0ZWQuCi0gKi8KIC8qCiAgKiBBcyBvZiBYZW4gNC41IHdlIG1haW50YWluIHZhcmlv
dXMgaW5mb3JtYXRpb24sIGluY2x1ZGluZyBob3RwbHVnCiAgKiBkZXZpY2UgaW5mb3JtYXRpb24s
IGluIEpTT04gZmlsZXMsIHNvIHRoYXQgd2UgY2FuIHVzZSB0aGlzIEpTT04KLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
