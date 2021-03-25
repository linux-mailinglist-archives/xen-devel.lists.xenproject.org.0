Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958DA3495ED
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101426.194023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCi-0007cC-Ec; Thu, 25 Mar 2021 15:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101426.194023; Thu, 25 Mar 2021 15:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCi-0007bk-Ae; Thu, 25 Mar 2021 15:47:24 +0000
Received: by outflank-mailman (input) for mailman id 101426;
 Thu, 25 Mar 2021 15:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cfrO=IX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lPSCh-0007aB-EY
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:47:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f01ce82-395d-4c0c-b564-e9449c74787a;
 Thu, 25 Mar 2021 15:47:18 +0000 (UTC)
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
X-Inumbo-ID: 0f01ce82-395d-4c0c-b564-e9449c74787a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616687238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xZUbtLTyjEiWLCPVXEVqDePxTYjpX+u+jaOjtO0ZwNg=;
  b=JXcA5npw74Vu6bR7Ltw9eUhKvrAlRB1uPqXAFiIS0TvuNJNaBJyjXhF+
   Hlq2QEIFihNKLiIn/XHsm/9EjYNhXqSWyJFa9kbIQCLvmFKcSqFyNhMUt
   aoFdU46XR2TAfn6Lcm5ZFvJbu6SFKYF5A0C+KXb+Dur2V8ftSBPuVpKxl
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IcvdpgyyrRTXsiLpQoyq6OFaz/8d3yf1xwcNo+1p+jGBvX++9yZmBTtS5kZgcWvACXwy1QMau3
 WF8HmNI/9KJsnM6OuCsZfcShU2ZoPWRwwBGNLUnun+ZUg9KtL7HMRFSMBFnXw9v0OG0ALNOGyH
 QQ19lWEVpSIWsYr4LjEnT1bMFajujR0FLfNJRQmQRcGv/oRcNXbssT+cPUgev9fZFhd+a9s6Zo
 CMXB1fSo0WBG10yqpjrBD+InOU1KzzHinNftq3UHV2vgKxkvF++sjE7lgXfu/UZvN6GvtGnime
 q8g=
X-SBRS: 5.1
X-MesageID: 41582315
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YCvtcqv/71iBbXIAzhfKG0fJ7skCpIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde6+AqXYuKdg/gpWeuMcVe/ZLvqgeQfxHW28x88e
 Nbc6Z4AMDtFlQSt6zHySSxDtpI+ra62Y+yg+O29RlQZCVLT40l0AtjEAacFSRNNWx7LL40Do
 CV6MYChxfIQwV1Uu2BCnMIX/fOqrTw/fqLXTc8CwM68w7LtDu06dfBeCSw5AsUUD9E3N4ZgA
 r4ujH+j5/Dj9iLjiXy+kWWxJRQldvnxLJ4dbGxo/lQEBrAoEKFYIxgXpeLoTw6pvq+gWxa7O
 XkklMbEOlYr1/XY2GpsTvhsjOQrwoG2jvZ5nKzxVvlvMDjSzoxB6N69PxkWyqc0WUMlpVY8s
 twrgWknqsSNzzstmDBwuKNcBdQmk+9sRMZ4JUupk0aa6QyQvtst4AFlXkldqsoLWbBx60MNv
 JhN83Y7OY+SyLhU1np+lNix9GhRR0Ib267a3lHvsSU1g5fl2xiw30Zw9QCnmwB+IhVceg929
 j5
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="41582315"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: <xen-devel@lists.xenproject.org>, Jordan Justen
	<jordan.l.justen@intel.com>, Anthony PERARD <anthony.perard@citrix.com>, "Ard
 Biesheuvel" <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 1/7] OvmfPkg/XenResetVector: Silent a warning from nasm
Date: Thu, 25 Mar 2021 15:47:07 +0000
Message-ID: <20210325154713.670104-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325154713.670104-1-anthony.perard@citrix.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

VG8gYXZvaWQgbmFzbSBnZW5lcmF0aW5nIGEgd2FybmluZywgcmVwbGFjZSB0aGUgbWFjcm8gYnkg
dGhlIHZhbHVlCmV4cGVjdGVkIHRvIGJlIHN0b3JlZCBpbiBlYXguCiAgSWEzMi9YZW5QVkhNYWlu
LmFzbTo3Njogd2FybmluZzogZHdvcmQgZGF0YSBleGNlZWRzIGJvdW5kcwoKUmVwb3J0ZWQtYnk6
IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCiBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIv
WGVuUFZITWFpbi5hc20gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVu
UFZITWFpbi5hc20gYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20K
aW5kZXggMmRmMGYxMmUxOGNiLi5jNzYxZTlkMzA3MjkgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQorKysgYi9Pdm1mUGtnL1hlblJlc2V0VmVj
dG9yL0lhMzIvWGVuUFZITWFpbi5hc20KQEAgLTczLDcgKzczLDcgQEAgeGVuUFZITWFpbjoKICAg
ICA7DQogICAgIDsgcGFyYW1ldGVyIGZvciBGbGF0MzJTZWFyY2hGb3JCZnZCYXNlDQogICAgIDsN
Ci0gICAgbW92ICAgICBlYXgsIEFERFJfT0YoZm91ckdpZ2FieXRlcykNCisgICAgbW92ICAgICBl
YXgsIDAgICA7IEFERFJfT0YoZm91ckdpZ2FieXRlcykNCiAgICAgYWRkICAgICBlYXgsIGVkeCA7
IGFkZCBkZWx0YQ0KIA0KICAgICA7DQotLSAKQW50aG9ueSBQRVJBUkQKCg==

