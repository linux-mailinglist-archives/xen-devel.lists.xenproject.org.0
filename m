Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D224D1092BE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:25:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZI4G-0002Nc-Sx; Mon, 25 Nov 2019 17:22:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgds=ZR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZI4F-0002NX-KX
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:22:31 +0000
X-Inumbo-ID: 284d523c-0fa8-11ea-a393-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 284d523c-0fa8-11ea-a393-12813bfff9fa;
 Mon, 25 Nov 2019 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574702550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PYwg5BLxZeQQCo5wKAH7kqaaiU54bWJulkC3o8oZBM0=;
 b=Fql5Bnf1QKWIXaaFuVoCrNV0fqEgIUcJWLSrGL/l0GGFpcvrHjYtvZTD
 udkkgZOrUQxtNykACFRgamv0fPg3M11RaD7NhRNqG7lj5KNREsGzkV3DR
 yJ0DCc109X53BdrpDwFVj77/5Xe6w1MYlbOCsevwJi7jnP0g+YYo7wGBK o=;
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
IronPort-SDR: 3LdusBCEFJ4NS96DKg4YPCfqYnNg6nJ9xAOEcYGRujEq9GIYveYfsXaYmXvWOwAmXwjgi3bEm3
 a7McOQgbO8Gcfpq/cDonouoaoQQSzUWbUDLrlzX5cIV2VFOEnWb4BQEVRNpU+PCzqcgjGBRWQU
 Xy96Aia3z5B9F/S16NhlO6bpJIxipRIEu0j+bI3EKl6YwPTkKbaLrz+qEIR+YFkYrnyKB7mQBW
 dQZ3/Y+eoE+jRprcBOMTu9shOUetXBwddgMQ+AxSo3deMqjmDF/unMDcD+ovXdj++9LDIcLAyO
 0J4=
X-SBRS: 2.7
X-MesageID: 9217230
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="9217230"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 18:22:11 +0100
Message-ID: <20191125172213.1904-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] x86/pvshim: improve tlb flush performance
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpFbmFibGluZyBQR0UgaW4gQ1I0IGNhdXNlcyBhIGh1Z2UgcGVyZm9ybWFuY2UgcGVu
YWx0eSB3aGVuIHJ1bm5pbmcgdGhlCnNoaW0gb24gQU1EIGhhcmR3YXJlLCB0aGlzIHBhdGNoIHNl
cmllcyBhdm9pZHMgZW5hYmxpbmcgUEdFIHdoZW4gaW4Kc2hpbSBtb2RlLCBhbmQgbWFrZXMgYSBz
bWFsbCBhZGp1c3RtZW50IGluIGRvX3RsYl9mbHVzaCB0byBwZXJmb3JtIGEKZmx1c2ggYnkgd3Jp
dGluZyB0byBDUjMgaWYgUEdFIGlzIG5vdCBlbmFibGVkLgoKUm9nZXIgUGF1IE1vbm5lICgyKToK
ICB4ODYvdGxiZmx1c2g6IGRvIG5vdCB0b2dnbGUgdGhlIFBHRSBDUjQgYml0IHVubGVzcyBuZWNl
c3NhcnkKICB4ODYvcHZzaGltOiBkbyBub3QgZW5hYmxlIGdsb2JhbCBwYWdlcyBpbiBzaGltIG1v
ZGUKCiB4ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyAgfCA5ICsrKysrLS0tLQogeGVuL2FyY2gveDg2
L3B2L2RvbWFpbi5jIHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
