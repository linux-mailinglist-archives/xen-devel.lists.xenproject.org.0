Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CE1325AF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:09:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ione0-00056Q-Dk; Tue, 07 Jan 2020 12:07:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iondy-00055g-LH
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:07:30 +0000
X-Inumbo-ID: 3dab60f9-3146-11ea-abea-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dab60f9-3146-11ea-abea-12813bfff9fa;
 Tue, 07 Jan 2020 12:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578398835; x=1609934835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=itKH+BLxlqdCAm2+43IZOto6nSnXfTrkF2Xaud+RgFA=;
 b=G0ff7odxvwnpdRAwFghJL7fAyXLegpKZ9SIWGlE9BBlcEWnid4rvEoHn
 ZuqDZYVIJrGuywWyWSHn+C53tgyN558Iy9I3b00cvgjsu2P0T8Sy26UOT
 cbW2afI20Qm4FiPwEbufyazvhWeDSCJWILdHShTS+uBtm30qmFni+6X9n U=;
IronPort-SDR: 8hrNrjKmBI/OWVh0/p5gtqiIqyGIFqWnq5MGV90oWAOOAMuauPUzywexY9hITtituKRUy19DuH
 ZSk81tOeXE6g==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; d="scan'208";a="18566730"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Jan 2020 12:07:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id A7129A1DF1; Tue,  7 Jan 2020 12:07:12 +0000 (UTC)
Received: from EX13D37EUB003.ant.amazon.com (10.43.166.251) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 7 Jan 2020 12:07:12 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUB003.ant.amazon.com (10.43.166.251) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:07:11 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 12:07:08 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:06:48 +0000
Message-ID: <7c072f70f8fa9a7b3c431a8fa3fa37d0d64e530b.1578397252.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578397252.git.hongyxia@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 6/7] x86/mm: make sure there is one exit path
 for modify_xen_mappings
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGhhbmRsZSBkeW5hbWljYWxseSBtYXBwaW5nIC8gdW5tYXBwaW5nIHBhZ2UKdGFibGVzIGluIHRo
ZSBzYWlkIGZ1bmN0aW9uLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8
aG9uZ3l4aWFAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VkIHNpbmNlIHY0OgotIGRyb3AgdGhlIGVu
ZF9vZl9sb29wIGdvdG8gbGFiZWwgc2luY2UgdGhpcyBmdW5jdGlvbiBtYXkgYmUgcmVmYWN0b3Jl
ZAogIGluIHRoZSBmdXR1cmUgYW5kIHRoZXJlIGFyZSBvcHRpb25zIHRvIGRvIHRoaW5ncyB3aXRo
b3V0IHRoZSBnb3RvLgoKQ2hhbmdlZCBzaW5jZSB2MzoKLSByZW1vdmUgYXNzZXJ0cyBvbiByYyBz
aW5jZSBpdCBuZXZlciBnZXRzIGNoYW5nZWQgdG8gYW55dGhpbmcgZWxzZS4KLS0tCiB4ZW4vYXJj
aC94ODYvbW0uYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCmluZGV4IDcxZTljNGIxOWUuLjZiNTg5NzYyYjEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC01NTU3LDYgKzU1
NTcsNyBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVk
IGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICB1
bnNpZ25lZCBpbnQgIGk7CiAgICAgdW5zaWduZWQgbG9uZyB2ID0gczsKKyAgICBpbnQgcmMgPSAt
RU5PTUVNOwogCiAgICAgLyogU2V0IG9mIHZhbGlkIFBURSBiaXRzIHdoaWNoIG1heSBiZSBhbHRl
cmVkLiAqLwogI2RlZmluZSBGTEFHU19NQVNLIChfUEFHRV9OWHxfUEFHRV9SV3xfUEFHRV9QUkVT
RU5UKQpAQCAtNTYwMCw3ICs1NjAxLDggQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWdu
ZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAgICAgICAgICAg
IC8qIFBBR0UxR0I6IHNoYXR0ZXIgdGhlIHN1cGVycGFnZSBhbmQgZmFsbCB0aHJvdWdoLiAqLwog
ICAgICAgICAgICAgbDJ0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogICAgICAgICAgICAgaWYg
KCAhbDJ0ICkKLSAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAgICAgICAg
ICBnb3RvIG91dDsKKwogICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMl9QQUdFVEFCTEVf
RU5UUklFUzsgaSsrICkKICAgICAgICAgICAgICAgICBsMmVfd3JpdGUobDJ0ICsgaSwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbDJlX2Zyb21fcGZuKGwzZV9nZXRfcGZuKCpwbDNlKSArCkBA
IC01NjU3LDcgKzU2NTksOCBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25n
IHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgICAgICAgICAgICAgIC8q
IFBTRTogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCB0cnkgYWdhaW4uICovCiAgICAgICAgICAg
ICAgICAgbDF0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogICAgICAgICAgICAgICAgIGlmICgg
IWwxdCApCi0gICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAgICAgICAg
ICAgICAgICBnb3RvIG91dDsKKwogICAgICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTDFf
UEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAgICAgICAgICAgICAgIGwxZV93cml0ZSgm
bDF0W2ldLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbDFlX2Zyb21fcGZuKGwyZV9n
ZXRfcGZuKCpwbDJlKSArIGksCkBAIC01NzkwLDcgKzU3OTMsMTAgQEAgaW50IG1vZGlmeV94ZW5f
bWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBu
ZikKICAgICBmbHVzaF9hcmVhKE5VTEwsIEZMVVNIX1RMQl9HTE9CQUwpOwogCiAjdW5kZWYgRkxB
R1NfTUFTSwotICAgIHJldHVybiAwOworICAgIHJjID0gMDsKKworIG91dDoKKyAgICByZXR1cm4g
cmM7CiB9CiAKICN1bmRlZiBmbHVzaF9hcmVhCi0tIAoyLjE1LjMuQU1aTgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
