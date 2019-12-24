Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E158412A194
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 14:06:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijjrW-0005KL-T2; Tue, 24 Dec 2019 13:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIBU=2O=amazon.com=prvs=254c36092=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijjrV-0005KC-Se
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:04:33 +0000
X-Inumbo-ID: eda321e8-264d-11ea-97ba-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eda321e8-264d-11ea-97ba-12813bfff9fa;
 Tue, 24 Dec 2019 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577192673; x=1608728673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IQ11nAhzhhJsFp4xloqjGuUzf/XtQLI+9BgXPUnpi0=;
 b=c76zyT+b/R2rufb3seimqDUA+Afw7fBiPilCaJL5QKH+MycpwN+UEUAL
 kMrONcYUM5mKpYSqu3q61TaDFC6knXOfKUE3xx1ucjsvHuEP9/yBVMGb4
 tB8KsJ1fFjMzd46vqkwlKG13iBY6G4q4v02Q1KHhCoQNm14HvcABCuuFX M=;
IronPort-SDR: rGIwCnvxS4xKK81auOaUVymwKtIZoIhQJ/xKSWiqVvc8Ixkq3QugfKQzg6lYf3RQNA2x4fXesx
 h3yNGjNMa9xg==
X-IronPort-AV: E=Sophos;i="5.69,351,1571702400"; d="scan'208";a="10456636"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 24 Dec 2019 13:04:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id D461A2834BE; Tue, 24 Dec 2019 13:04:31 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 24 Dec 2019 13:04:31 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:29 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 24 Dec 2019 13:04:27 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 13:04:13 +0000
Message-ID: <20191224130416.3570-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224130416.3570-1-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 3/6] domctl: return EEXIST from
 XEN_DOMCTL_createdomain...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uaWYgYSBzcGVjaWZpZWQgZG9taWQgaXMgYWxyZWFkeSBpbiB1c2UuCgpYRU5fRE9NQ1RMX2Ny
ZWF0ZWRvbWFpbiBhbGxvd3MgYSBkb21pZCB0byBiZSBzcGVjaWZpZWQgYnkgaXRzIGNhbGxlciBh
bmQKd2lsbCBjb3JyZWN0bHkgZmFpbCBpZiB0aGF0IGRvbWlkIGlzIGFscmVhZHkgaW4gdXNlLiBI
b3dldmVyIHRoZSBlcnJubwpyZXR1cm5lZCBpbiB0aGlzIGNhc2Ugd2lsbCBiZSBFSU5WQUwsIG1h
a2luZyBpdCBpbmRpc3Rpbmd1aXNoYWJsZSBmcm9tCnNldmVyYWwgb3RoZXIgZmFpbHVyZXMuIEFs
c28gYSB2YWx1ZSBvZiBFSU5WQUwgZG9lcyBub3Qgc2VlbSBhcHByb3ByaWF0ZQphcyB0aGUgc3Bl
Y2lmaWVkIGRvbWlkIGlzIHZhbGlkIFsxXSBidXQganVzdCBub3QgKHRyYW5zaWVudGx5KSBhdmFp
bGFibGUuCgpbMV0gYW55IGludmFsaWQgdmFsdWUgcGFzc2VkIGluIGlzIGlnbm9yZWQgYW5kIGNh
dXNlcyBYZW4gdG8gY2hvb3NlIGFuCiAgICB1bnVzZWQgYW5kIHZhbGlkIHZhbHVlLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9jb21tb24vZG9t
Y3RsLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwu
YwppbmRleCAwM2QwMjI2MDM5Li42NTAzMTBlODc0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2Rv
bWN0bC5jCisrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKQEAgLTUwNCw3ICs1MDQsNyBAQCBsb25n
IGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwp
CiAgICAgICAgIGRvbSA9IG9wLT5kb21haW47CiAgICAgICAgIGlmICggKGRvbSA+IDApICYmIChk
b20gPCBET01JRF9GSVJTVF9SRVNFUlZFRCkgKQogICAgICAgICB7Ci0gICAgICAgICAgICByZXQg
PSAtRUlOVkFMOworICAgICAgICAgICAgcmV0ID0gLUVFWElTVDsKICAgICAgICAgICAgIGlmICgg
IWlzX2ZyZWVfZG9taWQoZG9tKSApCiAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0K
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
