Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438AC1842E7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:49:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfxU-0006hY-Ae; Fri, 13 Mar 2020 08:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCfxS-0006hT-Pp
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:46:18 +0000
X-Inumbo-ID: 1a1a4ab1-6507-11ea-b2a1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1a4ab1-6507-11ea-b2a1-12813bfff9fa;
 Fri, 13 Mar 2020 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584089177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m08kbuS3+yrVjizwQSwITM0tS6ODUV6LCxVv0Nvv75A=;
 b=efcd2Zww/tvi5xQSTqhOXqDNlmsZWE8nSqRcOjjxf7EHvgdTB+vbaG8K
 oTJq8w08JvNAPEFyHucnMFTG/JOEupKV1AO94AmUQKdt0WlltscHLtiRi
 a921fxtF/VwUEj/RxoKRzFz2EtCFgHhUS9GRzq1ZFXYaWzoumK66//8ix 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PZykW2Wv2+zF3iqZl4xWhYsh3GZ1F2yOsfvzxHQhjWAFXee6spBc///T6KD4OelW/Rw3vHVxYz
 PLdDz+FD8J+EBEPglwyKgIN53PKKta+xO+RQnV0uviAakFNL0TqdMuNd77SQZzAJpxYMpwp/05
 rUPSf6vyDrNfjjDio6JcVudU8y3qouCnX8/FT+2kihnB4nGL9tjrXSnWZGtLk0/YqMX+yIRk0U
 JtT4L4vMLst8UcRUeVeMbL9IBcOOZfSE5+3HmatL6P5B2qVH7ZQR0YbsGn8UEU+XUxlFgG+qe8
 jdU=
X-SBRS: 2.7
X-MesageID: 13878922
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,548,1574139600"; d="scan'208";a="13878922"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 09:45:57 +0100
Message-ID: <20200313084558.13759-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] libfsimage: fix clang 10 build
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

Y2xhbmcgY29tcGxhaW5zIHdpdGg6Cgpmc3lzX3pmcy5jOjgyNjoyOiBlcnJvcjogY29udmVydGlu
ZyB0aGUgZW51bSBjb25zdGFudCB0byBhIGJvb2xlYW4gWy1XZXJyb3IsLVdpbnQtaW4tYm9vbC1j
b250ZXh0XQogICAgICAgIFZFUklGWV9ETl9UWVBFKGRuLCBETVVfT1RfUExBSU5fRklMRV9DT05U
RU5UUyk7CiAgICAgICAgXgovd3JrZGlycy91c3IvcG9ydHMvc3lzdXRpbHMveGVuLXRvb2xzL3dv
cmsveGVuLTQuMTMuMC90b29scy9saWJmc2ltYWdlL3pmcy8uLi8uLi8uLi90b29scy9saWJmc2lt
YWdlL3pmcy9mc3lzX3pmcy5oOjc0OjExOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdWRVJJ
RllfRE5fVFlQRScKICAgICAgICBpZiAodHlwZSAmJiAoZG5wKS0+ZG5fdHlwZSAhPSB0eXBlKSB7
IFwKICAgICAgICAgICAgICAgICBeCjEgZXJyb3IgZ2VuZXJhdGVkLgoKRml4IHRoaXMgYnkgbm90
IGZvcmNpbmcgYW4gaW1wbGljaXQgY29udmVyc2lvbiBvZiB0aGUgZW51bSBpbnRvIGEKYm9vbGVh
biBhbmQgaW5zdGVhZCBjb21wYXJpbmcgd2l0aCB0aGUgMCBlbnVtZXJhdG9yLgoKU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMv
bGliZnNpbWFnZS96ZnMvZnN5c196ZnMuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJmc2ltYWdl
L3pmcy9mc3lzX3pmcy5oIGIvdG9vbHMvbGliZnNpbWFnZS96ZnMvZnN5c196ZnMuaAppbmRleCA1
Y2Q2MjdkYmFjLi43MjE5NzJhMDVhIDEwMDY0NAotLS0gYS90b29scy9saWJmc2ltYWdlL3pmcy9m
c3lzX3pmcy5oCisrKyBiL3Rvb2xzL2xpYmZzaW1hZ2UvemZzL2ZzeXNfemZzLmgKQEAgLTcxLDcg
KzcxLDcgQEAgdHlwZWRlZgl1bnNpZ25lZCBpbnQgc2l6ZV90OwogICogQ2FuIG9ubHkgYmUgdXNl
ZCBpbiBmdW5jdGlvbnMgcmV0dXJuaW5nIG5vbi0wIGZvciBmYWlsdXJlLgogICovCiAjZGVmaW5l
CVZFUklGWV9ETl9UWVBFKGRucCwgdHlwZSkgXAotCWlmICh0eXBlICYmIChkbnApLT5kbl90eXBl
ICE9IHR5cGUpIHsgXAorCWlmICh0eXBlICE9IERNVV9PVF9OT05FICYmIChkbnApLT5kbl90eXBl
ICE9IHR5cGUpIHsgXAogCQlyZXR1cm4gKEVSUl9GU1lTX0NPUlJVUFQpOyBcCiAJfQogCkBAIC04
MCw3ICs4MCw3IEBAIHR5cGVkZWYJdW5zaWduZWQgaW50IHNpemVfdDsKICAqIENhbiBvbmx5IGJl
IHVzZWQgaW4gZnVuY3Rpb25zIHJldHVybmluZyAwIGZvciBmYWlsdXJlLgogICovCiAjZGVmaW5l
CVZFUklGWV9PU19UWVBFKG9zcCwgdHlwZSkgXAotCWlmICh0eXBlICYmIChvc3ApLT5vc190eXBl
ICE9IHR5cGUpIHsgXAorCWlmICh0eXBlICE9IERNVV9PU1RfTk9ORSAmJiAob3NwKS0+b3NfdHlw
ZSAhPSB0eXBlKSB7IFwKIAkJZXJybnVtID0gRVJSX0ZTWVNfQ09SUlVQVDsgXAogCQlyZXR1cm4g
KDApOyBcCiAJfQotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
