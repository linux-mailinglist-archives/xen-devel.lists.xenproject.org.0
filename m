Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30580C3A9B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFL4t-0006NW-SC; Tue, 01 Oct 2019 16:32:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFL4s-0006NR-35
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 16:32:42 +0000
X-Inumbo-ID: 163ae234-e469-11e9-9703-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 163ae234-e469-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569947561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hQN9ovBz+SbHc0E/ymxLioY3XZh28bFDf2kBApQ1KIY=;
 b=fw2FVUKw4JOZHOGSeyVLp0xjeuvkulLrAfgzTxSWYIBRF6K0KRw2PYph
 QHz0Ve6i3q2b6TqcIKMuUTwApiZ19KtQDA32bKlghFJutb0LGNOHLWRVr
 Tm3VtPXYwyDoFQi1U0HWSV3gfmO3TVLJcAO0KJX0qq7mefUUBkaeNOGXM Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sIx/eyRXiN3Elh5F48kvYKbAbYDIfTIIJYkzv54rX14zM7M/ZG5WcMjjov6U3xvkPLQEQ7IJzT
 bHs2vBD9yth9KJOBo3bw3zuXqrt9SKcqMSq0r7wInbunopimhhZz+0jkh/SPTVvXSyJwi51O4F
 qnMk6h9DbOkjmYnqrp6TRjMOwc6IpxqPuudQGUlEBWdYcOkAbCXK6tCMQK35AmV7i4iGjVrgdg
 BplqI/dzQyPK5HK4Yq4ZcWvNurvvlPnDJ8GHbW8TpK+WSqS/6o8EmYmT/7pGZeXyHUzxdeYpYS
 WF8=
X-SBRS: 2.7
X-MesageID: 6391929
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6391929"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 17:32:37 +0100
Message-ID: <20191001163237.17361-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/Kconfig: Invert the defaults for
 CONFIG_{PVH_GUEST, PV_SHIM}
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIG1pbm9yIFVJIGNoYW5nZSwgYnV0IHVzZXJzIHdoaWNoIGhhdmUgZWxlY3RlZCB0
byBlbmFibGUKWEVOX0dVRVNUICh3aGljaCBzdGlsbCBkZWZhdWx0cyB0byBubykgd2lsbCBkZWZp
bml0ZWx5IG5lZWQgb25lIG9mIHRoZXNlCm9wdGlvbnMsIGFuZCB3aWxsIHR5cGljYWxseSB3YW50
IGJvdGguCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJGQyBGb3ItNC4xMyAtIE1p
bm9yIHVzaWJpbGl0eSB0d2Vhay4KLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyB8IDggKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwppbmRl
eCAyODhkYzZjMDQyLi5mODVmNWU4NjI3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZp
ZworKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwpAQCAtMTY5LDE2ICsxNjksMTYgQEAgY29uZmln
IFhFTl9HVUVTVAogCSAgSWYgdW5zdXJlLCBzYXkgTi4KIAogY29uZmlnIFBWSF9HVUVTVAotCWRl
Zl9ib29sIG4KKwlkZWZfYm9vbCB5CiAJcHJvbXB0ICJQVkggR3Vlc3QiCiAJZGVwZW5kcyBvbiBY
RU5fR1VFU1QKIAktLS1oZWxwLS0tCiAJICBTdXBwb3J0IGJvb3RpbmcgdXNpbmcgdGhlIFBWSCBB
QkkuCiAKLQkgIElmIHVuc3VyZSwgc2F5IE4uCisJICBJZiB1bnN1cmUsIHNheSBZLgogCiBjb25m
aWcgUFZfU0hJTQotCWRlZl9ib29sIG4KKwlkZWZfYm9vbCB5CiAJcHJvbXB0ICJQViBTaGltIgog
CWRlcGVuZHMgb24gUFYgJiYgWEVOX0dVRVNUCiAJLS0taGVscC0tLQpAQCAtMTg2LDcgKzE4Niw3
IEBAIGNvbmZpZyBQVl9TSElNCiAJICBpbiBhbiBIVk0vUFZIIGNvbnRhaW5lci4gVGhpcyBtb2Rl
IGNhbiBvbmx5IGJlIGVuYWJsZWQgd2l0aCBjb21tYW5kCiAJICBsaW5lIG9wdGlvbi4KIAotCSAg
SWYgdW5zdXJlLCBzYXkgTi4KKwkgIElmIHVuc3VyZSwgc2F5IFkuCiAKIGNvbmZpZyBQVl9TSElN
X0VYQ0xVU0lWRQogCWRlZl9ib29sIG4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
