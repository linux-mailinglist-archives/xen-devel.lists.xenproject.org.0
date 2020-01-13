Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83089139728
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:11:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3D8-0008JM-1q; Mon, 13 Jan 2020 17:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3D6-0008IT-0y
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:09:04 +0000
X-Inumbo-ID: 5df7fffd-3627-11ea-82b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5df7fffd-3627-11ea-82b0-12813bfff9fa;
 Mon, 13 Jan 2020 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+J9GuTt2M+UMMzf8khubRAFfD5zoqvoWEyP+n25dPNU=;
 b=gg6PERGGjJiKvC04XM9+vNauAXhtdnht3YPIYfuH5TvIJfetuV5IU4pX
 U5t/GmBjZpRiURFeuqXZsK30nPBXV1YmxGZjwXnG45WhR8fUvO23CgaVM
 BwW6QjuQMD3UdJRsp/Hbqly0sWxUsz0xsvT7csX9r7vK6wHq6WqfPy4P9 g=;
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
IronPort-SDR: mXuvZIwiT4tGYCMMLpJ+w8JR1aWZVQ/qWCxxxSLrr5Uy8Jx+8BvhqiSaC0M3rj7TTwbSh2hvk5
 iXQMdwTOrZ7HGsNVc2LorHHDZ4BUWSwse2DX+8vHk8ReP69eqv6HSuankLqEsOv09k15Str2Ss
 G6pi0kKnBxIHVALDwQB3s/IH1Y94lxvB5pBYMxlEz01N+cGnHs851DnfiJHo4u+TD6VrGN7bN9
 kFWgQAJbWLYldLi9+5hLNeEITnPNsifwhScidfY1A+Crsgw8HWTdjhq0SrXYgyApDKuR1R1mnF
 81w=
X-SBRS: 2.7
X-MesageID: 11009476
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11009476"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:40 +0000
Message-ID: <20200113170843.21332-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 07/10] libxl: event: poller pipe optimisation
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJhY2sgaW4gdXNlcmxhbmQgd2hldGhlciB0aGUgcG9sbGVyIHBpcGUgaXMgbm9uZW1wdHkuICBU
aGlzIHNhdmVzIHVzCndyaXRpbmcgbWFueSBtYW55IGJ5dGVzIHRvIHRoZSBwaXBlIGlmIG5vdGhp
bmcgZXZlciByZWFkcyB0aGVtLgoKVGhpcyBpcyBnb2luZyB0byBiZSByZWxldmFudCBpbiBhIG1v
bWVudCwgd2hlcmUgd2UgYXJlIGdvaW5nIHRvIGNyZWF0ZQphIHNpdHVhdGlvbiB3aGVyZSB0aGlz
IHdpbGwgaGFwcGVuIHF1aXRlIGEgbG90LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpzcXVhc2ghIGxpYnhsOiBldmVudDogcG9sbGVyIHBp
cGUgb3B0aW1pc2F0aW9uCi0tLQogdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyAgICB8IDMgKysr
CiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgYi90
b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCmluZGV4IGI1MGQ0ZTUwNzQuLjNlNzZmYTVhZjUgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfZXZlbnQuYwpAQCAtMTQxNyw2ICsxNDE3LDcgQEAgc3RhdGljIHZvaWQgYWZ0ZXJwb2xsX2lu
dGVybmFsKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX3BvbGxlciAqcG9sbGVyLAogICAgIH0KIAog
ICAgIGlmIChhZnRlcnBvbGxfY2hlY2tfZmQocG9sbGVyLGZkcyxuZmRzLCBwb2xsZXItPndha2V1
cF9waXBlWzBdLFBPTExJTikpIHsKKyAgICAgICAgcG9sbGVyLT5waXBlX25vbmVtcHR5ID0gMDsK
ICAgICAgICAgaW50IGUgPSBsaWJ4bF9fc2VsZl9waXBlX2VhdGFsbChwb2xsZXItPndha2V1cF9w
aXBlWzBdKTsKICAgICAgICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihnYywgInJlYWQg
d2FrZXVwIiwgZSwgMCk7CiAgICAgfQpAQCAtMTgwOSw2ICsxODEwLDggQEAgdm9pZCBsaWJ4bF9f
cG9sbGVyX3B1dChsaWJ4bF9jdHggKmN0eCwgbGlieGxfX3BvbGxlciAqcCkKIAogdm9pZCBsaWJ4
bF9fcG9sbGVyX3dha2V1cChsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9fcG9sbGVyICpwKQogeworICAg
IGlmIChwLT5waXBlX25vbmVtcHR5KSByZXR1cm47CisgICAgcC0+cGlwZV9ub25lbXB0eSA9IDE7
CiAgICAgaW50IGUgPSBsaWJ4bF9fc2VsZl9waXBlX3dha2V1cChwLT53YWtldXBfcGlwZVsxXSk7
CiAgICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihnYywgImNhbm5vdCBwb2tlIHdhdGNo
IHBpcGUiLCBlLCAwKTsKIH0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IGVlYzRiZjc2N2QuLjBhYjMy
NDEwMmIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNjI1LDYgKzYyNSw3IEBAIHN0cnVjdCBsaWJ4
bF9fcG9sbGVyIHsKICAgICBpbnQgKCpmZF9yaW5kaWNlcylbM107IC8qIHNlZSBsaWJ4bF9ldmVu
dC5jOmJlZm9yZXBvbGxfaW50ZXJuYWwgKi8KIAogICAgIGludCB3YWtldXBfcGlwZVsyXTsgLyog
MCBtZWFucyBubyBmZCBhbGxvY2F0ZWQgKi8KKyAgICBib29sIHBpcGVfbm9uZW1wdHk7CiAKICAg
ICAvKgogICAgICAqIFdlIGFsc28gdXNlIHRoZSBwb2xsZXIgdG8gcmVjb3JkIHdoZXRoZXIgYW55
IGZkcyBoYXZlIGJlZW4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
