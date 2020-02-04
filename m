Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA28151B5F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:36:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyyL6-0006ad-Oz; Tue, 04 Feb 2020 13:34:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyyL5-0006aW-FE
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:34:03 +0000
X-Inumbo-ID: 01a34fee-4753-11ea-8396-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01a34fee-4753-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 13:34:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y17so23081474wrh.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 05:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dZKewUkbLsCOhasPhP3rj9eI9c2B1QYPQ9THXqty9y8=;
 b=rDCw+SFlSQGQ5O2x8qTk4AbWNy5pDyaujBosZm5Kp0gIDMzQeRkR28GlxXAW6Yk0Me
 51wcvSag3+GsJ5p4IW8suuiDICShoMG5xpoA3jWqPuN/1WbqaLGdDS/qg5MRFO86QoHX
 b3D3FXAbOcsZWvD8d39L50ESELpDlpFOFRCXYe1LkWLHXRNnHn+cNtv97YBwhxu3PUX7
 Hgo0+NIGQKtWL/5Xko5ZkutUVQEolP9QOYYfvS710DEUmS5oppaA12/J9vb29UtcJaWx
 aOZsqtyTRbKVog0zKIDHjXLoyF5r/9EVEfPdqwgBEP4eV6Rt9yp8W54VZQeDrKsjCjaV
 yj8Q==
X-Gm-Message-State: APjAAAVD6vJrSWUXccQJxwZGoMXoeucQdyOPtvNvLunK1iLW7P3KGj/D
 9w8NSRh2gCrfodsQ27StHitWiiyw4AM=
X-Google-Smtp-Source: APXvYqzQc8Q5MwRE8gBaL4g7Mb+5BJBRSrHRHvDFklPacM7VIBAprHZr/Q3G4QZ6iJ4u342yIWtucQ==
X-Received: by 2002:a5d:5347:: with SMTP id t7mr22001356wrv.401.1580823241792; 
 Tue, 04 Feb 2020 05:34:01 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id a184sm3966727wmf.29.2020.02.04.05.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:34:01 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 13:33:57 +0000
Message-Id: <20200204133357.32101-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/mm: Avoid assuming PG_state_inuse == 0 in
 assign_pages()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkF0IHRoZSBtb21lbnQsIGFz
c2lnbl9wYWdlcygpIHJlbGllcyBvbiBQR19zdGF0ZV9pbnVzZSB0byBiZSAwLiBUaGlzCm1ha2Vz
IHRoZSBjb2RlIHNsaWdodGx5IG1vcmUgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQuCgpSZXdvcmsg
dGhlIGNvZGUgdG8gZXhwbGljaXRseSBjaGVjayBhZ2FpbnN0IFBHX3N0YXRlX2ludXNlLgoKU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KLS0tCiB4ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMg
Yi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwppbmRleCA5NzkwMmQ0MmMxLi41NDc3M2JjNDJmIDEw
MDY0NAotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYworKysgYi94ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuYwpAQCAtMjI4NiwxMCArMjI4NiwxMSBAQCBpbnQgYXNzaWduX3BhZ2VzKAogICAgIGZv
ciAoIGkgPSAwOyBpIDwgKDEgPDwgb3JkZXIpOyBpKysgKQogICAgIHsKICAgICAgICAgQVNTRVJU
KHBhZ2VfZ2V0X293bmVyKCZwZ1tpXSkgPT0gTlVMTCk7Ci0gICAgICAgIEFTU0VSVCghcGdbaV0u
Y291bnRfaW5mbyk7CisgICAgICAgIEFTU0VSVChwYWdlX3N0YXRlX2lzKCZwZ1tpXSwgaW51c2Up
KTsKKyAgICAgICAgQVNTRVJUKCEocGdbaV0uY291bnRfaW5mbyAmICh+UEdDX3N0YXRlKSkpOwog
ICAgICAgICBwYWdlX3NldF9vd25lcigmcGdbaV0sIGQpOwogICAgICAgICBzbXBfd21iKCk7IC8q
IERvbWFpbiBwb2ludGVyIG11c3QgYmUgdmlzaWJsZSBiZWZvcmUgdXBkYXRpbmcgcmVmY250LiAq
LwotICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0gUEdDX2FsbG9jYXRlZCB8IDE7CisgICAgICAg
IHBnW2ldLmNvdW50X2luZm8gPSBQR0Nfc3RhdGVfaW51c2UgfCBQR0NfYWxsb2NhdGVkIHwgMTsK
ICAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKCZwZ1tpXSwgJmQtPnBhZ2VfbGlzdCk7CiAgICAg
fQogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
