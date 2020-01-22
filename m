Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D4145EA6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 23:34:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuOXI-0001Oq-VN; Wed, 22 Jan 2020 22:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac9L=3L=amazon.com=prvs=2839ba572=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuOXH-0001Nz-Cb
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 22:31:43 +0000
X-Inumbo-ID: f6d3de30-3d66-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6d3de30-3d66-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 22:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579732303; x=1611268303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RXakqAv07gSm+Bln1odnWQRor3fccRpXMFbY/j5+SBw=;
 b=txEajif6CQjSSYdZvstUVes6JQJU9vwRZNjDSr7XdhlGR80X1MStj/xK
 NUhrLjqgDF3+9reUxi34wkF/7GH527RSSSUAgX9+EaTVvv2Q1IFZN8cMy
 hI/OA/ZRrMwkmGuuBHiIyN6jSE9aQljpanB8rr64Uw+5/S2dLbvw4cqdg Y=;
IronPort-SDR: efg0gYaZ8OlIjBJ/8AewE/qThhw//qZO+pqJiTRKCvqOm3udt/Zm0f2L7MOwArpGLDwpYicBDd
 9EWVODbL0zpw==
X-IronPort-AV: E=Sophos;i="5.70,351,1574121600"; d="scan'208";a="20473235"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Jan 2020 22:31:23 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id AC1AAA248F; Wed, 22 Jan 2020 22:31:22 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:22 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:21 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 22:31:21 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id AA3E1A013F; Wed, 22 Jan 2020 22:31:20 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 22:30:46 +0000
Message-ID: <934b1959c740f9ee401f2740478d61cdaa138c72.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <cover.1579727989.git.elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v1 4/4] x86/microcode: use const qualifier for
 microcode buffer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Eslam
 Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJ1ZmZlciBob2xkaW5nIHRoZSBtaWNyb2NvZGUgYml0cyBzaG91bGQgYmUgbWFya2VkIGFz
IGNvbnN0LgoKU2lnbmVkLW9mZi1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5j
b20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUu
YyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwppbmRleCBhNjYyYTdmNDM4Li4wNjM5NTUxMTcz
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZS5jCkBAIC04OCw3ICs4OCw3IEBAIHN0YXRpYyBlbnVtIHsKICAqIG1lbW9yeS4K
ICAqLwogc3RydWN0IHVjb2RlX21vZF9ibG9iIHsKLSAgICB2b2lkICpkYXRhOworICAgIGNvbnN0
IHZvaWQgKmRhdGE7CiAgICAgc2l6ZV90IHNpemU7CiB9OwogCkBAIC03NTMsNyArNzUzLDcgQEAg
aW50IG1pY3JvY29kZV91cGRhdGVfb25lKGJvb2wgc3RhcnRfdXBkYXRlKQogaW50IF9faW5pdCBl
YXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdSh2b2lkKQogewogICAgIGludCByYyA9IDA7Ci0gICAg
dm9pZCAqZGF0YSA9IE5VTEw7CisgICAgY29uc3Qgdm9pZCAqZGF0YSA9IE5VTEw7CiAgICAgc2l6
ZV90IGxlbjsKICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaDsKIAotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
