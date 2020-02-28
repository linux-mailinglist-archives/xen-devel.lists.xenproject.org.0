Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C742C17385A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:30:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fgW-0006Pf-UY; Fri, 28 Feb 2020 13:28:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7fgV-0006Ov-Bo
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:28:07 +0000
X-Inumbo-ID: 265bbba8-5a2e-11ea-993b-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 265bbba8-5a2e-11ea-993b-12813bfff9fa;
 Fri, 28 Feb 2020 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582896485; x=1614432485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VnEMQjXlZzyeB717iW/TUidz93mR41dovAH5owiaMyQ=;
 b=LwU0Bsd0b66i8Q9/uu9oQVkP/F/wHYeUtstU/YGL55i6AzHM29DClLm/
 woEsFpxt4t/mr7As9VYtUqJUQ0PJxIsVJVMZC/TYCG0ExDp1JU/FXHQ0y
 uDPoysqUlemt3Lj/Oy+7IpZCuEmYxAWvZVIt3J0HzEVQQrkEUsno/gHRb c=;
IronPort-SDR: 1U/GDvwl2Cq72WlR7Kix/7uFhQ7zqOlwL43/J4HF8kRMXJfbll5zkdswtH7QeaNgw9FhJ4IwhR
 50OtuiKMwiOA==
X-IronPort-AV: E=Sophos;i="5.70,496,1574121600"; d="scan'208";a="29495679"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 28 Feb 2020 13:28:03 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0ECDCA2D30; Fri, 28 Feb 2020 13:28:02 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 13:28:01 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 13:28:00 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 28 Feb 2020 13:27:51 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:27:43 +0000
Message-ID: <20200228132749.2929-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/6] remove one more shared xenheap page:
 shared_info
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hlcyAjMiBhbmQgIzMgaGF2ZSBiZWVuIHNwbGl0IG91dCBvZiB0aGUgcHJldmlvdXMgdmVy
c2lvbiBvZiBwYXRjaCAjNgood2hpY2ggd2FzIHBhdGNoICMyIG9mIHRoZSBwcmV2aW91cyBzZXJp
ZXMpLiBQYXRjaCAjNCBpcyBub3QgZW50aXJlbHkKcmVsYXRlZCBidXQgaXMgdXNlZnVsIHRvIGhh
dmUgaW4gcGxhY2UgYmVmb3JlIHBhdGNoICM1LiBQYXRjaCAjNSBpcyBhbHNvCm5ldy4KClBhdWwg
RHVycmFudCAoNik6CiAgZG9tYWluOiBpbnRyb2R1Y2UgYWxsb2MvZnJlZV9zaGFyZWRfaW5mbygp
IGhlbHBlcnMuLi4KICB4ODYgLyBwMm06IHJlbW92ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2Fs
bG9jX3RhYmxlCiAgeDg2IC8gcHY6IGRvIG5vdCB0cmVhdCBQR0NfZXh0cmEgcGFnZXMgYXMgUkFN
IHdoZW4gY29uc3RydWN0aW5nIGRvbTAKICB4ODYgLyBpb3JlcTogdXNlIGEgTUVNRl9ub19yZWZj
b3VudCBhbGxvY2F0aW9uIGZvciBzZXJ2ZXIgcGFnZXMuLi4KICBtbTogYWRkICdpc19zcGVjaWFs
X3BhZ2UnIG1hY3JvLi4uCiAgZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZSBmb3Ig
c2hhcmVkX2luZm8KCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAgIHwgMTAgKysrLS0t
LQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYv
ZG9tYWluLmMgICAgICAgICAgIHwgMTIgKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMg
ICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgICAgfCAgMiAr
LQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICB8IDExICsrKystLS0tCiB4ZW4vYXJj
aC94ODYvbW0vYWx0cDJtLmMgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICB8ICA4IC0t
LS0tLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyB8IDEzICsrKysrKy0tLS0KIHhl
bi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgICAgfCAgNiArKysrLQogeGVuL2FyY2gveDg2L3B2
L3NoaW0uYyAgICAgICAgICB8ICAyICstCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAg
IHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vY29tbW9uL2RvbWN0
bC5jICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jICAgICAg
fCAgMyArKysKIHhlbi9jb21tb24vdGltZS5jICAgICAgICAgICAgICAgfCAxOSArKysrKysrKysr
KystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFyZWQuaCAgICB8IDE1ICsrKysrKy0tLS0tCiB4
ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggICAgICAgIHwgIDMgKysrCiB4ZW4vaW5jbHVkZS94ZW4v
bW0uaCAgICAgICAgICAgIHwgIDMgKysrCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAg
IHwgIDUgKysrLQogeGVuL2luY2x1ZGUveGVuL3NoYXJlZC5oICAgICAgICB8ICAyICstCiAyMSBm
aWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCi0tLQpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9u
LmNvbT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4K
Q2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
