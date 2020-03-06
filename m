Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A317C4D1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 18:46:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAGzy-0003Pt-Mo; Fri, 06 Mar 2020 17:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SoCs=4X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jAGzw-0003Pj-RG
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 17:42:56 +0000
X-Inumbo-ID: e943de36-5fd1-11ea-90c4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e943de36-5fd1-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583516575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aJGnPJb8LxVVoRqPlIbGi6Q1W4j0XCBs2IUIbKbZy7c=;
 b=a0TpJeGfcgB9pMGoKaLO/Ml02RrnLGSqnOGFjcYjffFUtITuT4vDeYHg
 MwvQXMqV8ORC8Us8CjLrNGnu4A3KpcC4nS7oxLlrF1B6RTAiRFI+QgcAj
 tVkjvwY1b7+b+AixhZ4f6JYp+6uLCtMVvdNqr9E5RMXW58gfqOAv6LeCZ A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8xRyRmFemlUJraefABlF8nXnuP/BnrgvHSmVGRSqllYbBH+Q3tDMUWZJ945aYCrJ/HB2IEtT98
 ZFPXFKwvCzGImf8649T7rT0c66xemc4qjxwBLpBSoNtQ9a4SOo0/+HHWkcEqV+r9E+iITgrKp8
 WaA4SJqLQdkBinRbBl2nTc/L3ywImVcZ7flgxgmUeSj5OWQGvkn9K/omEUVE0j/MxTHx7BFNZb
 oeoHnlD2mBXM/IHRwDc9xPUudGAzbQjAGYCOm/LQ6G0CUIny83LpZfck9wFGGSwoGxfONHbA8L
 oEA=
X-SBRS: 2.7
X-MesageID: 13967890
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,522,1574139600"; d="scan'208";a="13967890"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Mar 2020 17:42:48 +0000
Message-ID: <20200306174250.291503-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 0/2] xen/arm: Configure early printk via
 Kconfig
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuYXJt
LWVhcmx5LXByaW50ay12MgoKSGksCgpUaGF0IHR3byBwYXRjaHMgaXMgdG8gdW5ibG9jayBteSB3
b3JrIG9uICJ4ZW46IEJ1aWxkIHN5c3RlbSBpbXByb3ZlbWVudHMiLgpUaGVyZSBpcyBhbiBlYXNp
ZXIgZml4IHRvIGJ1aWxkIHdpdGggZWFybHkgcHJpbnRrLCBidXQgaXQgaXMganVzdCBiZXR0ZXIg
dG8gdXNlCktjb25maWcuCgpJdCBpcyBiYXNlIG9uIGVhcmxpZXIgd29yayBieSBKdWxpZW4sICJ4
ZW4vYXJtOiBBZGQgU2tlbGV0b24gZm9yIHVzaW5nCmNvbmZpZ3VyaW5nIGVhcmx5IHByaW50ayB1
c2luZyBLY29uZmlnIiBidXQgaW5zdGVhZCBvZiBoYXZpbmcgYSBzaW5nbGUgY2hvaWNlCm1lbnUg
d2hlcmUgcGxhdGZvcm0gYW5kIGRyaXZlciBhcmUgbWl4ZWQsIEkgaGF2ZSB0d28gc2VwYXJhdGVk
IG1lbnUuIFNlbGVjdGluZwphIFVBUlQgZHJpdmVyIGZvciBlYXJseSBwcmludGsgd2lsbCBoaWRl
IHRoZSBwbGF0Zm9ybSBzcGVjaWZpYyBvcHRpb25zLiAoQXMgSQp1bmRlcnN0YW5kLCB5b3Ugd2Fu
dCB0byByZW1vdmUgdGhlIHBsYXRmb3JtIHNwZWNpZmljIG9wdGlvbnMpCgpUaGUgY2hhbmdlcyB3
aGljaCByZW5hbWUgYWxsIG1hY3JvcyBpcyBpbiBhIHNlcGFyYXRlZCBwYXRjaCwgYXMgU3RlZmFu
byB3YW50ZWQuCgpIb3BlIHlvdSBsaWtlIHRoZSBjaGFuZ2VzLgoKKEkgbWlnaHQgYWRkIHRob3Nl
IHBhdGNoZXMgdG8gbXkgb3RoZXIgc2VyaWVzIGlmIEkgbmVlZCB0byByZXNlbnQgaXQgYmVmb3Jl
IHRoZQplYXJseSBwcmludGsgY2hhbmdlcyBhcmUgYXBwbGllZC4pCgpDaGVlcnMsCgpBbnRob255
IFBFUkFSRCAoMSk6CiAgeGVuL2FybTogUmVuYW1lIGFsbCBlYXJseSBwcmludGsgbWFjcm8KCkp1
bGllbiBHcmFsbCAoMSk6CiAgeGVuL2FybTogQ29uZmlndXJlIGVhcmx5IHByaW50ayB2aWEgS2Nv
bmZpZwoKIGRvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCAgICAgfCAgNTAgKysrKy0tLQog
eGVuL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgICB8ICAgMiArCiB4ZW4vYXJjaC9hcm0v
S2NvbmZpZy5kZWJ1ZyAgICAgICAgIHwgMjA4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC9h
cm0vUnVsZXMubWsgICAgICAgICAgICAgIHwgIDc0IC0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9h
cm0zMi9NYWtlZmlsZSAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy04
MjUwLmluYyAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1wbDAxMS5pbmMgfCAg
IDQgKy0KIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyAgfCAgIDQgKy0KIHhlbi9h
cmNoL2FybS9hcm0zMi9kZWJ1Zy5TICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMgICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9NYWtlZmlsZSAg
ICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy04MjUwLmluYyAgfCAgIDQg
Ky0KIHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1wbDAxMS5pbmMgfCAgIDQgKy0KIHhlbi9hcmNo
L2FybS9hcm02NC9kZWJ1Zy5TICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMgICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL3g4Ni9LY29uZmlnLmRlYnVnICAgICAg
ICAgfCAgIDAKIHhlbi9pbmNsdWRlL2FzbS1hcm0vZWFybHlfcHJpbnRrLmggfCAgIDIgKy0KIDE4
IGZpbGVzIGNoYW5nZWQsIDI2MSBpbnNlcnRpb25zKCspLCAxMjcgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL0tjb25maWcuZGVidWcKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vYXJjaC94ODYvS2NvbmZpZy5kZWJ1ZwoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
