Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BADCF052
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 03:18:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHe5h-0001PA-JS; Tue, 08 Oct 2019 01:15:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHe5f-0001On-DN
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 01:15:03 +0000
X-Inumbo-ID: 0dfeb334-e969-11e9-8c93-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dfeb334-e969-11e9-8c93-bc764e2007e4;
 Tue, 08 Oct 2019 01:15:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4968E20867;
 Tue,  8 Oct 2019 01:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570497302;
 bh=WP4pj+IslHYj1jI9EZ1W0JuwP7hGga0mmKu7DlziRM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItALgK1jPzbfMrnObzm2bSxT9k6pyQFwmn1MZ+r8giWwj8gUlr2VaN0o2ucyhQVPK
 43+XdtwC7yfw2JJ6k7X+OcOAaMxbp5zAW51VH8s86GkqyqRbMxEoKSeTdU5Q3tgKgM
 /vHIEiFbaqMI/xVg6CwRr9OK12UlraMa88afkQUE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: Julien.Grall@arm.com
Date: Mon,  7 Oct 2019 18:14:59 -0700
Message-Id: <20191008011501.21038-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v2 1/3] xen/arm: fix buf size in make_cpus_node
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNpemUgb2YgYnVmIGlzIGNhbGN1bGF0ZWQgd3JvbmdseTogdGhlIG51bWJlciBpcyA2NGJp
dCwgbm90IDMyYml0LgpBbHNvIHRoZSBudW1iZXIgaXMgcHJpbnRlZCBhcyBhIGhleGFkZWNpbWFs
IG51bWJlciwgc28gd2UgbmVlZCA4IGJ5dGVzCmZvciAzMmJpdCwgbm90IDEwIGJ5dGVzLgoKQXMg
YSByZXN1bHQsIGl0IHNob3VsZCBiZSBzaXplb2YoImNwdUAiKSArIDE2IGJ5dGVzIGZvciBhIDY0
LWJpdCBudW1iZXIKKyAxIGJ5dGUgZm9yIFwwLiBUb3RhbCA9IDIxLgoKRml4ZXM6IGZhZmQ2ODJj
M2UgKHhlbi9hcm06IENyZWF0ZSBhIGZha2UgY3B1cyBub2RlIGluIGRvbTAgZGV2aWNlIHRyZWUp
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhp
bGlueC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIHBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwppbmRleCA5MjFiMDU0NTIwLi42MDky
M2E3MDUxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC03ODgsOCArNzg4LDggQEAgc3RhdGljIGludCBf
X2luaXQgbWFrZV9jcHVzX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQog
ICAgIHVuc2lnbmVkIGludCBjcHU7CiAgICAgY29uc3Qgdm9pZCAqY29tcGF0aWJsZSA9IE5VTEw7
CiAgICAgdTMyIGxlbjsKLSAgICAvKiBQbGFjZWhvbGRlciBmb3IgY3B1QCArIGEgMzItYml0IG51
bWJlciArIFwwICovCi0gICAgY2hhciBidWZbMTVdOworICAgIC8qIFBsYWNlaG9sZGVyIGZvciBj
cHVAICsgYSA2NC1iaXQgbnVtYmVyICsgXDAgKi8KKyAgICBjaGFyIGJ1ZlsyMV07CiAgICAgdTMy
IGNsb2NrX2ZyZXF1ZW5jeTsKICAgICBib29sIGNsb2NrX3ZhbGlkOwogICAgIHVpbnQ2NF90IG1w
aWRyX2FmZjsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
