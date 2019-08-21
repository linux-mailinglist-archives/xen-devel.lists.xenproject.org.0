Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D50975F2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 11:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Mn3-0002BI-Uf; Wed, 21 Aug 2019 09:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T5bV=WR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i0Mn2-0002BD-5a
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 09:20:24 +0000
X-Inumbo-ID: e73a20ec-c3f4-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e73a20ec-c3f4-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566379223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BK2UfPfQnsAdpwWahhn9/K+61xT4PsE2aBOjJXllKHk=;
 b=SK/0nijrUdDCe9fs1DIlze6ZzdVZYctovmA++0j702F2MAb4iuuH9zQ1
 bQIt3sljkzOfKvSwyXWYBm2KQ+LxxnVkUxJOuhuSSgX15ZpMdccr1klH/
 Jz9eVWCcu6LSHG8jYggVqtXH69CwIbUg4mwKpgIAHTcTZ86ySGrYcLgSq I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Dre/avdhM7+LkeeYNgXPxCnkXilAmFPsNzT4qdmjCyNlv3RbAuMOhVn8Hnt589TC2ULQAyStmJ
 wztSwrqA0slgsaYkaxu90dU3UyfmxOHqd0ywcZ+98kK+RjFO9FYLuJIE8r0tRR/Gn7YVBB4lqB
 b6iSUVXUkjPwrJUtVz621eni4MLaOxm7efr/gQJaNhCkecfQ5HGEJ5VuHoNh6x87n95f+58EuQ
 1tNsyO2VabwmwuQl/amP+KFPELiUvI3GQAooAUS887cQnyBt9uPiTpot6St8gekcuXoRKO+e2D
 PLI=
X-SBRS: 2.7
X-MesageID: 4731850
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4731850"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 21 Aug 2019 10:20:19 +0100
Message-ID: <20190821092020.17952-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821092020.17952-1-anthony.perard@citrix.com>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen-bus: Fix backend state transition on
 device reset
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-stable@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIGZyb250ZW5kIHdhbnQgdG8gcmVzZXQgaXRzIHN0YXRlIGFuZCB0aGUgYmFja2VuZCBv
bmUsIGl0IHN0YXJ0CndpdGggc2V0dGluZyAiQ2xvc2luZyIsIHRoZW4gd2FpdCBmb3IgdGhlIGJh
Y2tlbmQgKFFFTVUpIHRvIGRvIHRoZSBzYW1lLgoKQnV0IHdoZW4gUUVNVSBpcyBzZXR0aW5nICJD
bG9zaW5nIiB0byBpdHMgc3RhdGUsIGl0IHRyaWdnZXIgYW4gZXZlbnQKKHhlbnN0b3JlIHdhdGNo
KSB0aGF0IHJlLWV4ZWN1dGUgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQoKSBhbmQgc2V0CnRo
ZSBiYWNrZW5kIHN0YXRlIHRvICJDbG9zZWQiLiBRRU1VIHNob3VsZCB3YWl0IGZvciB0aGUgZnJv
bnRlbmQgdG8Kc2V0ICJDbG9zZWQiIGJlZm9yZSBkb2luZyB0aGUgc2FtZS4KCkJlZm9yZSBzZXR0
aW5nICJDbG9zZWQiIHRvIHRoZSBiYWNrZW5kX3N0YXRlLCB3ZSBhcmUgYWxzbyBnb2luZyB0bwpj
aGVjayBpZiB0aGUgZnJvbnRlbmQgd2FzIHJlc3BvbnNpYmxlIGZvciB0aGUgdHJhbnNpdGlvbiB0
byAiQ2xvc2luZyIuCgpGaXhlczogYjZhZjg5MjZmYjg1OGM0ZjE0MjZlNWFjYjJjZmMxZjA1ODBl
Yzk4YQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KLS0tCkNjOiBxZW11LXN0YWJsZUBub25nbnUub3JnCi0tLQogaHcveGVuL3hlbi1idXMu
YyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVuLWJ1cy5jCmluZGV4
IGU0MDUwMDI0MmQuLjk4MmVjYTQ1MzMgMTAwNjQ0Ci0tLSBhL2h3L3hlbi94ZW4tYnVzLmMKKysr
IGIvaHcveGVuL3hlbi1idXMuYwpAQCAtNTQwLDkgKzU0MCwxMSBAQCBzdGF0aWMgdm9pZCB4ZW5f
ZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCh2b2lkICpvcGFxdWUpCiAgICAgLyoKICAgICAgKiBJZiB0
aGUgdG9vbHN0YWNrIChvciB1bnBsdWcgcmVxdWVzdCBjYWxsYmFjaykgaGFzIHNldCB0aGUgYmFj
a2VuZAogICAgICAqIHN0YXRlIHRvIENsb3NpbmcsIGJ1dCB0aGVyZSBpcyBubyBhY3RpdmUgZnJv
bnRlbmQgKGkuZS4gdGhlCi0gICAgICogc3RhdGUgaXMgbm90IENvbm5lY3RlZCkgdGhlbiBzZXQg
dGhlIGJhY2tlbmQgc3RhdGUgdG8gQ2xvc2VkLgorICAgICAqIHN0YXRlIGlzIG5vdCBDb25uZWN0
ZWQgb3IgQ2xvc2luZykgdGhlbiBzZXQgdGhlIGJhY2tlbmQgc3RhdGUKKyAgICAgKiB0byBDbG9z
ZWQuCiAgICAgICovCiAgICAgaWYgKHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9PSBYZW5idXNTdGF0
ZUNsb3NpbmcgJiYKKyAgICAgICAgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZSAhPSBYZW5idXNTdGF0
ZUNsb3NpbmcgJiYKICAgICAgICAgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZSAhPSBYZW5idXNTdGF0
ZUNvbm5lY3RlZCkgewogICAgICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0YXRlKHhlbmRl
diwgWGVuYnVzU3RhdGVDbG9zZWQpOwogICAgIH0KLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
