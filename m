Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA453495EC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101425.194011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCe-0007af-5V; Thu, 25 Mar 2021 15:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101425.194011; Thu, 25 Mar 2021 15:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCe-0007aG-2B; Thu, 25 Mar 2021 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 101425;
 Thu, 25 Mar 2021 15:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cfrO=IX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lPSCc-0007aB-Ju
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:47:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28c78a1b-8fb9-4bb3-a167-1f88c639be33;
 Thu, 25 Mar 2021 15:47:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 28c78a1b-8fb9-4bb3-a167-1f88c639be33
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616687237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zjDQm8C2btssLSA5VzcJPGVFPSZQrQ+OsqFsC9KrHAU=;
  b=M34o7XxUsgDwcGjns66U3xFHDT3wEmgPrVqW0kLAQm2EkZij9OhhWwZo
   JQbwca0mrseFpX/yWlda0GJSi7jp2pBrS5jEQ0yJUJ6X+DU38tf4ryZnR
   LLoHkuMAtXZEnShId8bWNtFLUP4+aEWEmODGfM1kUEL0V1avFWnY2eN43
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: m9kwWVaTUPQXLK5ZTN7aA0HzRPI8YdcseIcaupBkhUhFMCXjmSuCACfJUSeoiFnUmUoShpEV+I
 RspZ39zX4fFENHmaUKsQyM7ZzUgRYMosk0wYOAbCPEG3hlSzv49uRbcXd6r5lPINN4bKrbDNNP
 amIMaqxwlD9YMJA4quAyzm/Bg6iXvvrPsWMP8UJuJKdl34mn5AgRg1i6JkbMnHWfwv3WnUfv9T
 2ZPtEkqTLoXJProwwSrWzKZKL+FlUjtkkcYV70TIDT/bVK8/fBm3v9RUh7LFX6ZhXydQxbyzjc
 5D0=
X-SBRS: 5.1
X-MesageID: 41582313
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zKgW76HelyBMwSM7pLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="41582313"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: <xen-devel@lists.xenproject.org>, Jordan Justen
	<jordan.l.justen@intel.com>, Anthony PERARD <anthony.perard@citrix.com>, "Ard
 Biesheuvel" <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 0/7] OvmfXen: Set PcdFSBClock at runtime
Date: Thu, 25 Mar 2021 15:47:06 +0000
Message-ID: <20210325154713.670104-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6CmdpdDovL3hlbmJpdHMu
eGVuLm9yZy9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5hcGljLXRpbWVyLWZyZXEtdjIKCkNo
YW5nZXMgaW4gdjI6Ci0gbWFpbiBjaGFuZ2UgaXMgdG8gYWxsb3cgbWFwcGluZyBvZiBYZW4gcGFn
ZXMgb3V0c2lkZSBvZiB0aGUgUkFNCiAgc2VlIHBhdGNoOiAiT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aTogTWFwIGV4dHJhIHBoeXNpY2FsIGFkZHJlc3MiCi0gdGhhdCBuZXcgZnVuY3Rpb24gYWxsb3dz
IHRvIG1hcCB0aGUgWGVuIHNoYXJlZCBpbmZvIHBhZ2UgKHdoZXJlIHdlIGNhbiBmaW5kCiAgaW5m
b3JtYXRpb24gYWJvdXQgdHNjIGZyZXF1ZW5jeSkgYXQgdGhlIGhpZ2hlc3QgcGh5c2ljYWwgYWRk
cmVzcyBhbGxvd2VkLgoKSGksCgpPdm1mWGVuIHVzZXMgdGhlIEFQSUMgdGltZXIsIGJ1dCB3aXRo
IGFuIGhhcmQtY29kZWQgZnJlcXVlbmN5IHRoYXQgbWF5IGNoYW5nZQphcyBwb2ludGVkIG91dCBo
ZXJlOgogIGh0dHBzOi8vZWRrMi5ncm91cHMuaW8vZy9kZXZlbC9tZXNzYWdlLzQ1MTg1CiAgPDIw
MTkwODA4MTM0NDIzLnlicWczcWtwdzV1Y2Z6azRAQWlyLWRlLVJvZ2VyPgoKVGhpcyBzZXJpZXMg
Y2hhbmdlcyB0aGF0IHNvIHRoZSBmcmVxdWVuY3kgaXMgY2FsY3VsYXRlZCBhdCBydW50aW1lLgoK
UmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0OTAK
ClRoZXJlIGlzIGFsc28gb25lIGNsZWFudXAgcGF0Y2ggdGhhdCBoYXMgbm90aGluZyB0byBkbyB3
aXRoIHRoZSByZXN0LgoKQ2hlZXJzLAoKQW50aG9ueSBQRVJBUkQgKDcpOgogIE92bWZQa2cvWGVu
UmVzZXRWZWN0b3I6IFNpbGVudCBhIHdhcm5pbmcgZnJvbSBuYXNtCiAgTWRlUGtnOiBBbGxvdyBQ
Y2RGU0JDbG9jayB0byBieSBEeW5hbWljCiAgT3ZtZlBrZy9JbmR1c3RyeVN0YW5kYXJkL1hlbjog
QXBwbHkgRURLMiBjb2Rpbmcgc3R5bGUgdG8KICAgIFhFTl9WQ1BVX1RJTUVfSU5GTwogIE92bWZQ
a2cvSW5kdXN0cnlTdGFuZGFyZDogSW50cm9kdWNlIFBhZ2VUYWJsZS5oCiAgT3ZtZlBrZy9YZW5Q
bGF0Zm9ybVBlaTogTWFwIGV4dHJhIHBoeXNpY2FsIGFkZHJlc3MKICBPdm1mUGtnL1hlblBsYXRm
b3JtUGVpOiBDYWxpYnJhdGUgQVBJQyB0aW1lciBmcmVxdWVuY3kKICBPdm1mUGtnL092bWZYZW46
IFNldCBQY2RGU0JDbG9jawoKIE1kZVBrZy9NZGVQa2cuZGVjICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgOCArLQogT3ZtZlBrZy9Pdm1mWGVuLmRzYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA0ICstCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmlu
ZiAgICAgfCAgIDQgKwogLi4uL0luZHVzdHJ5U3RhbmRhcmQvUGFnZVRhYmxlLmh9ICAgICAgICAg
ICAgIHwgMTE3ICstLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4v
eGVuLmggICAgfCAgMTcgKy0KIC4uLi9CYXNlTWVtRW5jcnlwdFNldkxpYi9YNjQvVmlydHVhbE1l
bW9yeS5oICB8IDE0MyArLS0tLS0tLS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3Jt
LmggICAgICAgICAgICAgfCAgMTAgKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5j
ICAgICAgICAgICAgIHwgICAxICsKIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgICAgICAg
ICAgICAgICAgICB8IDI1MiArKysrKysrKysrKysrKysrKysKIE92bWZQa2cvWGVuUmVzZXRWZWN0
b3IvSWEzMi9YZW5QVkhNYWluLmFzbSAgICB8ICAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgMjg3
IGluc2VydGlvbnMoKyksIDI3MSBkZWxldGlvbnMoLSkKIGNvcHkgT3ZtZlBrZy97TGlicmFyeS9C
YXNlTWVtRW5jcnlwdFNldkxpYi9YNjQvVmlydHVhbE1lbW9yeS5oID0+IEluY2x1ZGUvSW5kdXN0
cnlTdGFuZGFyZC9QYWdlVGFibGUuaH0gKDYwJSkKCi0tIApBbnRob255IFBFUkFSRAoK

