Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF61FCD2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 02:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR3sY-0004IY-HR; Thu, 16 May 2019 00:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N00O=TQ=wdc.com=prvs=032022a23=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hR3sW-0004IN-IV
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 00:04:08 +0000
X-Inumbo-ID: 1f2eda66-776e-11e9-8723-d7882586ddf0
Received: from esa4.hgst.iphmx.com (unknown [216.71.154.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f2eda66-776e-11e9-8723-d7882586ddf0;
 Thu, 16 May 2019 00:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1557965047; x=1589501047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjtA7HfhZYfquWmAFps3HJOiUhhUbkL+y8rdeU7aykY=;
 b=D84AtWgM4sWvJJom2Md1YVGO7M6c3W/lhr9zAJBUdhBYr8sONlxdqGj6
 Ow4kr+BT3TqSLFJ81pjF/HI4IhF15W8Yj8k3XXVFXamwSNtQItu/8FJg2
 WbIUd7q79qNQkgcv7rhXJegJCX1n60CnJP4tME7B4pBXhsu3CPm8ERKlU
 vAi7ndAmbXUPVnNE0Fp1p6riyZYw+yiAbt7fYCc+YNQSdXgOaJ36LKSmX
 mx659cVsYB/p2wVJnhoy8F07BtMHDZvJ4zSKmK5v0O8fX1mZKUPem53eq
 OrG3u6/78DgUZ96fv7uQ7wfQqQSMcvpdgh123t7iytrBh6R5JluZmaQf6 A==;
X-IronPort-AV: E=Sophos;i="5.60,474,1549900800"; d="scan'208";a="108370050"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 May 2019 08:04:04 +0800
IronPort-SDR: 5nI4awX/ecNYnDzVhbxl53JX0heRUK3iW4E5PrCebDq1b9fQ+GW0fqPkF26HQnyBfpc+y+sepS
 GuxO3qGNAMWB0ktDv389CMKcOoUrrNs2iPqaVjjyKJlkBJEOqfW6f/uaenL3rW+y8BdkJcliPt
 +8VS7/7TeFel8jLbHkwTS8wyjsthvSUlLL+0tIl07N4JdGLJR0BS6yxQJPgHvJ6CG8ZoVnrvPj
 AFQ9a9+IUd7qH26amKbXt204Jdo3hfbAlYhl7moKKMv/I5cMiDyj9CPOE68FD3s8m8/hxzkDMH
 Fw3GvobpbIzkkawD6+QxgD/d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 15 May 2019 16:41:58 -0700
IronPort-SDR: 4By/yEVJA4qzgYwXaT+Q1frbmkvl9trIdCDetuPxiTdnUboN5yfNfPavVZjKrJkuWhQ3CUw5s9
 /9/fmdsYME6r+X/f5H8x5hth3ERocE9T9bgUZ5w1kGaensJU0eFdzJuHUE0kvqoRNaoFi99Knj
 0xlRzi3nKULMm5n+JHc4hDjy/aMZRVSHnOCx6cszxT14aL7phA1KgWY982yuzus53GPOTO4ZRv
 D7cFP4UoNKnsqbCxqveFY+hs3D62MNkjGf5VbzNZA1Bvq8AQsV6LK7eopvS+W2L1l8cM93V+AM
 mz8=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 May 2019 17:04:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 May 2019 17:02:12 -0700
Message-Id: <20190516000212.13468-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516000212.13468-1-alistair.francis@wdc.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] xen/rwlock: Include lib.h
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
Cc: wei.liu2@citrix.com, Alistair Francis <alistair.francis@wdc.com>,
 ian.jackson@eu.citrix.com, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSBsaWIuaCB0byBlbnN1cmUgdGhhdCBBU1NFUlQoKSBpcyBkZWZpbmVkLgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIGIveGVuL2luY2x1
ZGUveGVuL3J3bG9jay5oCmluZGV4IDM1NjU3YzU2YzQuLjEzMTUzNzM0OGUgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgK
QEAgLTEsNiArMSw3IEBACiAjaWZuZGVmIF9fUldMT0NLX0hfXwogI2RlZmluZSBfX1JXTE9DS19I
X18KIAorI2luY2x1ZGUgPHhlbi9saWIuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KIAog
I2luY2x1ZGUgPGFzbS9hdG9taWMuaD4KLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
