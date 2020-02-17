Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C216115E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:48:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3eqe-000166-02; Mon, 17 Feb 2020 11:45:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3eqd-00015v-01
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:45:59 +0000
X-Inumbo-ID: 0fd45e50-517b-11ea-ade5-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fd45e50-517b-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581939957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nlWUJ2XlHVHGrY+oNa1xbDb3L3l5DZf48ohjdwZyB9Q=;
 b=d45zA5e6P5LZrlq9q9st0NwwpBiH+DV7/eAbPzP2QmKvGLoxY/x8EKhj
 ZbfVIB86OAncD6gR+duDYvGWL/N7XKNhdPGM231dK1aoTDK34RPN/o/bK
 x9xFjDz6umrClv1M5vF+sOZSyuIdmK52OkM8unxEyBURyeCn+O0d5FjlU 0=;
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
IronPort-SDR: mtET3KXeSjA9jyycHHd/TkZVQnXTjmPEnPxd19/BN9MQixw9wIZh+jNOTydBusi3wcxTVW3KI5
 uj26sIwBPVRAOJnDRMGBOO5arQE0knHIWB7RLp6lyOO+HZvhMcYsrEUDVMYGLygxG/9FNAB2TR
 pFw59RLkcmAk6xQiP9cbXLfaApUejWORhMFhLgMTIsfLf9hMbTj3hlGxtCt0bJaChKsQ8dafDl
 RrlBc8Sf6RAMNAv9OfgR6jd6OpAzwfQB3JJ8nNgUCiaGCXcK8yxgAP/7QspqbQUDdkMDFVoetJ
 hF4=
X-SBRS: 2.7
X-MesageID: 12992150
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12992150"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 12:45:41 +0100
Message-ID: <20200217114545.71112-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/4] nvmx: implement support for MSR bitmaps
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IG5lc3RlZCBWTVggY29kZSBhZHZlcnRpc2VzIHN1cHBvcnQgZm9yIHRo
ZSBNU1IgYml0bWFwIGZlYXR1cmUsCnlldCB0aGUgaW1wbGVtZW50YXRpb24gaXNuJ3QgZG9uZS4g
UHJldmlvdXMgdG8gdGhpcyBzZXJpZXMgWGVuIGp1c3QgbWFwcwp0aGUgbmVzdGVkIGd1ZXN0IE1T
UiBiaXRtYXAgKGFzIHNldCBieSBMMSkgYW5kIHRoYXQncyBpdCwgdGhlIEwyIGd1ZXN0CmVuZHMg
dXAgdXNpbmcgdGhlIEwxIE1TUiBiaXRtYXAuCgpUaGlzIHNlcmllcyBhZGRzIGhhbmRsaW5nIG9m
IHRoZSBMMiBNU1IgYml0bWFwIGFuZCBtZXJnaW5nIHdpdGggdGhlIEwxCk1TUiBiaXRtYXAgYW5k
IGxvYWRpbmcgaXQgaW50byB0aGUgbmVzdGVkIGd1ZXN0IFZNQ1MuCgpQYXRjaCAjNCBtYWtlcyBz
dXJlIHRoZSB4MkFQSUMgTVNSIHJhbmdlIGlzIGFsd2F5cyB0cmFwcGVkLCBvciBlbHNlIGEKZ3Vl
c3Qgd2l0aCBuZXN0ZWQgdmlydHVhbGl6YXRpb24gZW5hYmxlZCBjb3VsZCBtYW5hZ2UgdG8gYWNj
ZXNzIHNvbWUgb2YKdGhlIHgyQVBJQyBNU1IgcmVnaXN0ZXJzIGZyb20gdGhlIGhvc3QuCgpUaGFu
a3MsIFJvZ2VyLlJvZ2VyIFBhdSBNb25uZSAoNCk6CiAgbnZteDogaW1wbGVtZW50IHN1cHBvcnQg
Zm9yIE1TUiBiaXRtYXBzCiAgYXJtOiByZW5hbWUgQklUX1dPUkQgdG8gQklUT1BfV09SRAogIGJp
dG1hcDogaW1wb3J0IGJpdG1hcF97c2V0L2NsZWFyfSBmcm9tIExpbnV4IDUuNQogIG52bXg6IGFs
d2F5cyB0cmFwIGFjY2Vzc2VzIHRvIHgyQVBJQyBNU1JzCgogeGVuL2FyY2gvYXJtL2FybTMyL2xp
Yi9iaXRvcHMuYyAgICAgICAgfCAgNCArLQogeGVuL2FyY2gvYXJtL2FybTY0L2xpYi9iaXRvcHMu
YyAgICAgICAgfCAgNCArLQogeGVuL2FyY2gvYXJtL2FybTY0L2xpYi9maW5kX25leHRfYml0LmMg
fCAxMCArKy0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgICAgICAgICAgICB8IDgwICsr
KysrKysrKysrKysrKysrKysrKysrKy0tCiB4ZW4vY29tbW9uL2JpdG1hcC5jICAgICAgICAgICAg
ICAgICAgICB8IDM5ICsrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS1hcm0vYml0b3BzLmgg
ICAgICAgICAgIHwgMTAgKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3Z2bXguaCAg
ICAgfCAgMyArLQogeGVuL2luY2x1ZGUveGVuL2JpdG1hcC5oICAgICAgICAgICAgICAgfCA0MCAr
KysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmggICAgICAgICAgICAgICB8ICAy
ICsKIDkgZmlsZXMgY2hhbmdlZCwgMTcyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoK
LS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
