Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C8109DEE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:28:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuV-0004Vi-Hk; Tue, 26 Nov 2019 12:25:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuU-0004VK-2B
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:38 +0000
X-Inumbo-ID: d75a4c16-1047-11ea-9db0-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d75a4c16-1047-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771133; x=1606307133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=izKKA+wKwfEoVJTsKECFNVnL3wIEG5gMZMHaSWBgQe8=;
 b=IROM1UsJHTTi9n4gqxaQ1cBnBYxi/1su0NgbjlB2UxfhVTUjG1Ne4+jG
 OcDaH2761XeWzzkA8ZhB6iMSJ/sW0BVV1aI6DxXoHVHvIK88SMvzdMO8a
 IsO0SgVLDkrnhtqSYaJiiBaEGyLVEVitkNkmwfaqC6BIzb7Faov/Dk/zJ Q=;
IronPort-SDR: 6Q3H4L8iLlR0JmPACp1hQcKwhOc26mOUqxNrcEvjImPY3pXDuWDN1yXKqNPo7mEGNw9zz3CG/x
 QtTLV5oOWopg==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="9942806"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Nov 2019 12:25:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id D136C1A4DAA; Tue, 26 Nov 2019 12:25:26 +0000 (UTC)
Received: from EX13D03EUC002.ant.amazon.com (10.43.164.60) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:26 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:24 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:22 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:06 +0000
Message-ID: <20191126122511.7409-3-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 2/7] create-diff-object: Handle extra
 pre-|post- hooks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSBuZXcgc2VjdGlvbnMgY29udGFpbmluZyBvcHRpb25hbCBwcmUtLCBwb3N0LSBhY3Rp
b24gaG9va3MuCgpUaGUgZm9sbG93aW5nIG5ldyBzZWN0aW9uIG5hbWVzIGFyZSBzdXBwb3J0ZWQ6
CiAgLSAubGl2ZXBhdGNoLmhvb2tzLnByZWFwcGx5CiAgLSAubGl2ZXBhdGNoLmhvb2tzLnBvc3Rh
cHBseQogIC0gLmxpdmVwYXRjaC5ob29rcy5wcmVyZXZlcnQKICAtIC5saXZlcGF0Y2guaG9va3Mu
cG9zdHJldmVydAoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxA
YW1hem9uLmRlPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNp
dHJpeC5jb20+Ci0tLQogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCA2NyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTQg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRpZmYt
b2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCA4ZDYzOTQwLi43ZmY1NmM3IDEw
MDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1vYmplY3Qu
YwpAQCAtMTEwMiw2ICsxMTAyLDIyIEBAIHN0YXRpYyBzdHJ1Y3Qgc3BlY2lhbF9zZWN0aW9uIHNw
ZWNpYWxfc2VjdGlvbnNbXSA9IHsKIAkJLm5hbWUJCT0gIi5saXZlcGF0Y2guaG9va3MudW5sb2Fk
IiwKIAkJLmdyb3VwX3NpemUJPSBsaXZlcGF0Y2hfaG9va3NfZ3JvdXBfc2l6ZSwKIAl9LAorCXsK
KwkJLm5hbWUJCT0gIi5saXZlcGF0Y2guaG9va3MucHJlYXBwbHkiLAorCQkuZ3JvdXBfc2l6ZQk9
IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplLAorCX0sCisJeworCQkubmFtZQkJPSAiLmxpdmVw
YXRjaC5ob29rcy5wb3N0YXBwbHkiLAorCQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19n
cm91cF9zaXplLAorCX0sCisJeworCQkubmFtZQkJPSAiLmxpdmVwYXRjaC5ob29rcy5wcmVyZXZl
cnQiLAorCQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplLAorCX0sCisJ
eworCQkubmFtZQkJPSAiLmxpdmVwYXRjaC5ob29rcy5wb3N0cmV2ZXJ0IiwKKwkJLmdyb3VwX3Np
emUJPSBsaXZlcGF0Y2hfaG9va3NfZ3JvdXBfc2l6ZSwKKwl9LAogCXt9LAogfTsKIApAQCAtMTQ2
NSwyMyArMTQ4MSw0NCBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hfaW5jbHVkZV9kZWJ1Z19zZWN0aW9u
cyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIGtwYXRjaF9p
bmNsdWRlX2hvb2tfZWxlbWVudHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYpCisjZGVmaW5lIElT
X0hPT0tfU0VDVElPTihzZWN0aW9uLCBob29rKSAoeyBcCisgICAgICAgICFzdHJjbXAoKChzZWN0
aW9uKSktPm5hbWUsICIubGl2ZXBhdGNoLmhvb2tzLiIgaG9vaykgfHwgXAorICAgICAgICAhc3Ry
Y21wKCgoc2VjdGlvbikpLT5uYW1lLCAiLnJlbGEubGl2ZXBhdGNoLmhvb2tzLiIgaG9vayk7IFwK
K30pCisKKyNkZWZpbmUgSVNfQUNUSU9OX0hPT0tfU0VDVElPTihzZWN0aW9uLCBhY3Rpb24pICh7
IFwKKyAgICAgICAgSVNfSE9PS19TRUNUSU9OKHNlY3Rpb24sICJwcmUiIGFjdGlvbikgfHwgXAor
ICAgICAgICBJU19IT09LX1NFQ1RJT04oc2VjdGlvbiwgInBvc3QiIGFjdGlvbik7IFwKK30pCisK
KyNkZWZpbmUgSVNfSE9PS19TWU1fTkFNRShzeW1ib2wsIGhvb2spICh7IFwKKyAgICAgICAgIXN0
cmNtcCgoKHN5bWJvbCkpLT5uYW1lLCAibGl2ZXBhdGNoXyIgaG9vayAiX2RhdGEiKTsgXAorfSkK
KworI2RlZmluZSBJU19BQ1RJT05fSE9PS19TWU1fTkFNRShzeW1ib2wsIGFjdGlvbikgKHsgXAor
ICAgICAgICBJU19IT09LX1NZTV9OQU1FKHN5bWJvbCwgInByZSIgYWN0aW9uKSB8fCBcCisgICAg
ICAgIElTX0hPT0tfU1lNX05BTUUoc3ltYm9sLCAicG9zdCIgYWN0aW9uKTsgXAorfSkKKworc3Rh
dGljIGludCBrcGF0Y2hfaW5jbHVkZV9ob29rX2VsZW1lbnRzKHN0cnVjdCBrcGF0Y2hfZWxmICpr
ZWxmKQogewogCXN0cnVjdCBzZWN0aW9uICpzZWM7CiAJc3RydWN0IHN5bWJvbCAqc3ltOwogCXN0
cnVjdCByZWxhICpyZWxhOworCWludCBudW1fbmV3X2Z1bmN0aW9ucyA9IDA7CiAKLQkvKiBpbmNs
dWRlIGxvYWQvdW5sb2FkIHNlY3Rpb25zICovCisJLyogaW5jbHVkZSBhbGwgc3VwcG9ydGVkIGhv
b2tzIHNlY3Rpb25zICovCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShzZWMsICZrZWxmLT5zZWN0aW9u
cywgbGlzdCkgewotCQlpZiAoIXN0cmNtcChzZWMtPm5hbWUsICIubGl2ZXBhdGNoLmhvb2tzLmxv
YWQiKSB8fAotCQkgICAgIXN0cmNtcChzZWMtPm5hbWUsICIubGl2ZXBhdGNoLmhvb2tzLnVubG9h
ZCIpIHx8Ci0JCSAgICAhc3RyY21wKHNlYy0+bmFtZSwgIi5yZWxhLmxpdmVwYXRjaC5ob29rcy5s
b2FkIikgfHwKLQkJICAgICFzdHJjbXAoc2VjLT5uYW1lLCAiLnJlbGEubGl2ZXBhdGNoLmhvb2tz
LnVubG9hZCIpKSB7CisJCWlmIChJU19IT09LX1NFQ1RJT04oc2VjLCAibG9hZCIpIHx8CisJCSAg
ICBJU19IT09LX1NFQ1RJT04oc2VjLCAidW5sb2FkIikgfHwKKwkJICAgIElTX0FDVElPTl9IT09L
X1NFQ1RJT04oc2VjLCAiYXBwbHkiKSB8fAorCQkgICAgSVNfQUNUSU9OX0hPT0tfU0VDVElPTihz
ZWMsICJyZXZlcnQiKSkgewogCQkJc2VjLT5pbmNsdWRlID0gMTsKKwkJCW51bV9uZXdfZnVuY3Rp
b25zKys7CiAJCQlpZiAoaXNfcmVsYV9zZWN0aW9uKHNlYykpIHsKIAkJCQkvKiBpbmNsdWRlIGhv
b2sgZGVwZW5kZW5jaWVzICovCiAJCQkJcmVsYSA9IGxpc3RfZW50cnkoc2VjLT5yZWxhcy5uZXh0
LAotCQkJICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByZWxhLCBsaXN0KTsKKwkJCQkJ
CSAgc3RydWN0IHJlbGEsIGxpc3QpOwogCQkJCXN5bSA9IHJlbGEtPnN5bTsKIAkJCQlsb2dfbm9y
bWFsKCJmb3VuZCBob29rOiAlc1xuIixzeW0tPm5hbWUpOwogCQkJCWtwYXRjaF9pbmNsdWRlX3N5
bWJvbChzeW0sIDApOwpAQCAtMTQ5NywxMyArMTUzNCwxNyBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hf
aW5jbHVkZV9ob29rX2VsZW1lbnRzKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQogCX0KIAogCS8q
Ci0JICogU3RyaXAgdGVtcG9yYXJ5IGdsb2JhbCBsb2FkL3VubG9hZCBmdW5jdGlvbiBwb2ludGVy
IG9iamVjdHMKLQkgKiB1c2VkIGJ5IHRoZSBrcGF0Y2hfW2xvYWR8dW5sb2FkXSgpIG1hY3Jvcy4K
KwkgKiBTdHJpcCB0ZW1wb3JhcnkgZ2xvYmFsIGZ1bmN0aW9uIHBvaW50ZXIgb2JqZWN0cyBmb3Ig
YWxsCisJICogc3VwcG9ydGVkIGhvb2tzLCB1c2VkIGJ5IHRoZSBrcGF0Y2hfW2xvYWR8dW5sb2Fk
XSgpIG1hY3Jvcy4KIAkgKi8KIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHN5bSwgJmtlbGYtPnN5bWJv
bHMsIGxpc3QpCi0JCWlmICghc3RyY21wKHN5bS0+bmFtZSwgImxpdmVwYXRjaF9sb2FkX2RhdGEi
KSB8fAotCQkgICAgIXN0cmNtcChzeW0tPm5hbWUsICJsaXZlcGF0Y2hfdW5sb2FkX2RhdGEiKSkK
KwkJaWYgKElTX0hPT0tfU1lNX05BTUUoc3ltLCAibG9hZCIpIHx8CisJCSAgICBJU19IT09LX1NZ
TV9OQU1FKHN5bSwgInVubG9hZCIpIHx8CisJCSAgICBJU19BQ1RJT05fSE9PS19TWU1fTkFNRShz
eW0sICJhcHBseSIpIHx8CisJCSAgICBJU19BQ1RJT05fSE9PS19TWU1fTkFNRShzeW0sICJyZXZl
cnQiKSkKIAkJCXN5bS0+aW5jbHVkZSA9IDA7CisKKwlyZXR1cm4gbnVtX25ld19mdW5jdGlvbnM7
CiB9CiAKIHN0YXRpYyBpbnQga3BhdGNoX2luY2x1ZGVfbmV3X2dsb2JhbHMoc3RydWN0IGtwYXRj
aF9lbGYgKmtlbGYpCkBAIC0yMjk4LDExICsyMzM5LDExIEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICphcmd2W10pCiAJa3BhdGNoX2luY2x1ZGVfc3RhbmRhcmRfZWxlbWVudHMoa2VsZl9wYXRj
aGVkKTsKIAlsb2dfZGVidWcoIkluY2x1ZGUgY2hhbmdlZCBmdW5jdGlvbnNcbiIpOwogCW51bV9j
aGFuZ2VkID0ga3BhdGNoX2luY2x1ZGVfY2hhbmdlZF9mdW5jdGlvbnMoa2VsZl9wYXRjaGVkKTsK
LQlsb2dfZGVidWcoIm51bV9jaGFuZ2VkID0gJWRcbiIsIG51bV9jaGFuZ2VkKTsKIAlsb2dfZGVi
dWcoIkluY2x1ZGUgZGVidWcgc2VjdGlvbnNcbiIpOwogCWtwYXRjaF9pbmNsdWRlX2RlYnVnX3Nl
Y3Rpb25zKGtlbGZfcGF0Y2hlZCk7CiAJbG9nX2RlYnVnKCJJbmNsdWRlIGhvb2sgZWxlbWVudHNc
biIpOwotCWtwYXRjaF9pbmNsdWRlX2hvb2tfZWxlbWVudHMoa2VsZl9wYXRjaGVkKTsKKwludW1f
Y2hhbmdlZCArPSBrcGF0Y2hfaW5jbHVkZV9ob29rX2VsZW1lbnRzKGtlbGZfcGF0Y2hlZCk7CisJ
bG9nX2RlYnVnKCJudW1fY2hhbmdlZCA9ICVkXG4iLCBudW1fY2hhbmdlZCk7CiAJbG9nX2RlYnVn
KCJJbmNsdWRlIHN0YW5kYXJkIHN0cmluZyBlbGVtZW50c1xuIik7CiAJa3BhdGNoX2luY2x1ZGVf
c3RhbmRhcmRfc3RyaW5nX2VsZW1lbnRzKGtlbGZfcGF0Y2hlZCk7CiAJbG9nX2RlYnVnKCJJbmNs
dWRlIG5ldyBnbG9iYWxzXG4iKTsKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNm
dWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBh
bSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVy
bGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
