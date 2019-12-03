Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F810F95E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 09:00:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic343-0007Ue-GB; Tue, 03 Dec 2019 07:57:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QNQZ=ZZ=amazon.de=prvs=2337aaad1=wipawel@srs-us1.protection.inumbo.net>)
 id 1ic342-0007UL-DJ
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 07:57:42 +0000
X-Inumbo-ID: 94dbd94e-15a2-11ea-81d2-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94dbd94e-15a2-11ea-81d2-12813bfff9fa;
 Tue, 03 Dec 2019 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575359862; x=1606895862;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=WQZjLiqp5j6RdtHSFA00tl6skVgpBIU71hfx91RlOb8=;
 b=shcP6r5v/eGqD0Z+WP8r3YDAJSJEkcBlVxlnTEvs7HvrqndWnwX3tRRh
 VJgIP+dmbnadhMgXlYt61JXpTD2hXqzmIVXOOddMZXBDSj8AlzkiYPzdF
 xwwDDpLYE61IFlw6W9uA/rOHt66KVuG4wzFHEdqDxTYueQ1geY/99U2jY o=;
IronPort-SDR: 2VI+cY00XD5uhRVh5plD89AAPLtuzGN0tBt6qLWa0FD477S/XZ/B0KcLLRxSVAXqe+VcWaLQN2
 mCgrcr99gUEg==
X-IronPort-AV: E=Sophos;i="5.69,272,1571702400"; 
   d="scan'208";a="2804270"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Dec 2019 07:57:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id C074DA0759; Tue,  3 Dec 2019 07:57:30 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 07:57:30 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 07:57:29 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 07:57:27 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 07:57:22 +0000
Message-ID: <20191203075722.107886-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH livepatch-build-tools] create-diff-object:
 Include string sections later
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHdoZW4gYWxsIHN5bWJvbHMgaGF2ZSB0aGVpciBzdGF0dXMgYW5kIGluY2x1ZGUgZmxhZ3Mg
cHJvY2Vzc2VkLgoKUHJvY2Vzc2luZyBzcGVjaWFsIHNlY3Rpb25zIG1heSBpbmNsdWRlIGFkZGl0
aW9uYWwgc3ltYm9scy4gU3RyaW5nCnNlY3Rpb25zICgucm9kYXRhKikgYXJlIGluY2x1ZGVkIGlm
ZiB0aGV5IGFyZSByZWZlcmVuY2VkIGJ5IGF0IGxlYXN0Cm9uZSBzeW1ib2wuIFRodXMsIGluIG9y
ZGVyIHRvIGRlY2lkZSBpZiBzdHJpbmcgc2VjdGlvbiBzaG91bGQgYmUKaW5jbHVkZWQgb3Igbm90
LCBhbGwgc3ltYm9scyBtdXN0IGJlIGV2YWx1YXRlZCBmaXJzdC4KClNpZ25lZC1vZmYtYnk6IFBh
d2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmVwb3J0ZWQtYnk6IFNlcmdl
eSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KLS0tCiBjcmVhdGUtZGlmZi1vYmpl
Y3QuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9i
amVjdC5jCmluZGV4IDFjZTVjMDkuLmE1MTY2NzAgMTAwNjQ0Ci0tLSBhL2NyZWF0ZS1kaWZmLW9i
amVjdC5jCisrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCkBAIC0yMzcyLDggKzIzNzIsNiBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCWxvZ19kZWJ1ZygiSW5jbHVkZSBob29r
IGVsZW1lbnRzXG4iKTsKIAludW1fY2hhbmdlZCArPSBrcGF0Y2hfaW5jbHVkZV9ob29rX2VsZW1l
bnRzKGtlbGZfcGF0Y2hlZCk7CiAJbG9nX2RlYnVnKCJudW1fY2hhbmdlZCA9ICVkXG4iLCBudW1f
Y2hhbmdlZCk7Ci0JbG9nX2RlYnVnKCJJbmNsdWRlIHN0YW5kYXJkIHN0cmluZyBlbGVtZW50c1xu
Iik7Ci0Ja3BhdGNoX2luY2x1ZGVfc3RhbmRhcmRfc3RyaW5nX2VsZW1lbnRzKGtlbGZfcGF0Y2hl
ZCk7CiAJbG9nX2RlYnVnKCJJbmNsdWRlIG5ldyBnbG9iYWxzXG4iKTsKIAluZXdfZ2xvYmFsc19l
eGlzdCA9IGtwYXRjaF9pbmNsdWRlX25ld19nbG9iYWxzKGtlbGZfcGF0Y2hlZCk7CiAJbG9nX2Rl
YnVnKCJuZXdfZ2xvYmFsc19leGlzdCA9ICVkXG4iLCBuZXdfZ2xvYmFsc19leGlzdCk7CkBAIC0y
MzkwLDYgKzIzODgsOCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCiAJbG9n
X2RlYnVnKCJQcm9jZXNzIHNwZWNpYWwgc2VjdGlvbnNcbiIpOwogCWtwYXRjaF9wcm9jZXNzX3Nw
ZWNpYWxfc2VjdGlvbnMoa2VsZl9wYXRjaGVkKTsKKwlsb2dfZGVidWcoIkluY2x1ZGUgc3RhbmRh
cmQgc3RyaW5nIGVsZW1lbnRzXG4iKTsKKwlrcGF0Y2hfaW5jbHVkZV9zdGFuZGFyZF9zdHJpbmdf
ZWxlbWVudHMoa2VsZl9wYXRjaGVkKTsKIAlsb2dfZGVidWcoIlN0cmlwIHVuZGVmaW5lZCBlbGVt
ZW50cyBvZiBrbm93biBzaXplXG4iKTsKIAlsaXZlcGF0Y2hfc3RyaXBfdW5kZWZpbmVkX2VsZW1l
bnRzKGtlbGZfcGF0Y2hlZCk7CiAJbG9nX2RlYnVnKCJWZXJpZnkgcGF0Y2hhYmlsaXR5XG4iKTsK
LS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3Jh
dXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNj
aGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIz
NyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
