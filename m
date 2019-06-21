Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA134F18E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:58:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTO8-0004V7-ER; Fri, 21 Jun 2019 23:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTO7-0004Ux-8K
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:56:11 +0000
X-Inumbo-ID: 24b97cbe-9480-11e9-b046-cb2c7ff3e318
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24b97cbe-9480-11e9-b046-cb2c7ff3e318;
 Fri, 21 Jun 2019 23:56:10 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 098D1208C3;
 Fri, 21 Jun 2019 23:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561161370;
 bh=sLXpdeS0tb/a6NC7NCOzf0ZkhpfS0D3SVKzk+8JxSUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H0SbDpzIjwqfn5Jhi4GLMSLhZS7G1IVuqlga66IVkVj7eQ5XtmjusCxZPiObi5O4l
 xM8ffLwVTkTuF4+YP1cdz1+SpfpNlsyGnZnS8/kwg04Q0+OIyCnKnYIm/b5AVhZU8+
 fSrNiozfytPddVdFiw6XbWPhEskRL8OAUHv92dRs=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 16:56:04 -0700
Message-Id: <20190621235608.2153-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 2/6] xen/arm: make process_memory_node a
 device_tree_node_func
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlIHRoZSBzaWduYXR1cmUgb2YgcHJvY2Vzc19tZW1vcnlfbm9kZSB0byBtYXRjaApkZXZp
Y2VfdHJlZV9ub2RlX2Z1bmMuIFRoYW5rcyB0byB0aGlzIGNoYW5nZSwgdGhlIG5leHQgcGF0Y2gg
d2lsbCBiZQphYmxlIHRvIHVzZSBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlIHRvIGNhbGwgcHJv
Y2Vzc19tZW1vcnlfbm9kZSBvbiBhbGwKdGhlIGNoaWxkcmVuIG9mIGEgcHJvdmlkZWQgbm9kZS4K
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4K
LS0tCkNoYW5nZXMgaW4gdjM6Ci0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQotIGNoZWNrIHJldHVy
biB2YWx1ZSBvZiBwcm9jZXNzX21lbW9yeV9ub2RlCgpDaGFuZ2VzIGluIHYyOgotIG5ldwotLS0K
IHhlbi9hcmNoL2FybS9ib290ZmR0LmMgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKaW5kZXggMmY5
Y2I4ODc4ZC4uNjExNzI0NDMzYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwor
KysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCkBAIC0xMjQsOSArMTI0LDEwIEBAIGludCBfX2lu
aXQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2b2lkICpmZHQsCiAgICAgcmV0dXJu
IDA7CiB9CiAKLXN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX21lbW9yeV9ub2RlKGNvbnN0IHZv
aWQgKmZkdCwgaW50IG5vZGUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpuYW1lLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdTMyIGFkZHJlc3NfY2VsbHMsIHUzMiBzaXplX2NlbGxzKQorc3RhdGljIGludCBfX2luaXQg
cHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLCBpbnQgZGVwdGgs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxz
LCB1MzIgc2l6ZV9jZWxscywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqZGF0YSkKIHsKICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOwogICAg
IGludCBpOwpAQCAtMTM5LDE0ICsxNDAsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3Nf
bWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKICAgICB7CiAgICAgICAgIHBy
aW50aygiZmR0OiBub2RlIGAlcyc6IGludmFsaWQgI2FkZHJlc3MtY2VsbHMgb3IgI3NpemUtY2Vs
bHMiLAogICAgICAgICAgICAgICAgbmFtZSk7Ci0gICAgICAgIHJldHVybjsKKyAgICAgICAgcmV0
dXJuIDA7CiAgICAgfQogCiAgICAgcHJvcCA9IGZkdF9nZXRfcHJvcGVydHkoZmR0LCBub2RlLCAi
cmVnIiwgTlVMTCk7CiAgICAgaWYgKCAhcHJvcCApCiAgICAgewogICAgICAgICBwcmludGsoImZk
dDogbm9kZSBgJXMnOiBtaXNzaW5nIGByZWcnIHByb3BlcnR5XG4iLCBuYW1lKTsKLSAgICAgICAg
cmV0dXJuOworICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKICAgICBjZWxsID0gKGNvbnN0IF9f
YmUzMiAqKXByb3AtPmRhdGE7CkBAIC0xNjEsNiArMTYyLDggQEAgc3RhdGljIHZvaWQgX19pbml0
IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKICAgICAgICAg
Ym9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKICAg
ICAgICAgYm9vdGluZm8ubWVtLm5yX2JhbmtzKys7CiAgICAgfQorCisgICAgcmV0dXJuIDA7CiB9
CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX211bHRpYm9vdF9ub2RlKGNvbnN0IHZvaWQg
KmZkdCwgaW50IG5vZGUsCkBAIC0yOTIsMTUgKzI5NSwxOCBAQCBzdGF0aWMgaW50IF9faW5pdCBl
YXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxzLCB1MzIgc2l6ZV9jZWxscywKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQogeworICAgIGludCByYyA9IDA7CisK
ICAgICBpZiAoIGRldmljZV90cmVlX25vZGVfbWF0Y2hlcyhmZHQsIG5vZGUsICJtZW1vcnkiKSAp
Ci0gICAgICAgIHByb2Nlc3NfbWVtb3J5X25vZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRyZXNzX2Nl
bGxzLCBzaXplX2NlbGxzKTsKKyAgICAgICAgcmMgPSBwcm9jZXNzX21lbW9yeV9ub2RlKGZkdCwg
bm9kZSwgbmFtZSwgZGVwdGgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRy
ZXNzX2NlbGxzLCBzaXplX2NlbGxzLCBOVUxMKTsKICAgICBlbHNlIGlmICggZGVwdGggPD0gMyAm
JiAoZGV2aWNlX3RyZWVfbm9kZV9jb21wYXRpYmxlKGZkdCwgbm9kZSwgInhlbixtdWx0aWJvb3Qt
bW9kdWxlIiApIHx8CiAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfY29tcGF0aWJsZShm
ZHQsIG5vZGUsICJtdWx0aWJvb3QsbW9kdWxlIiApKSkKICAgICAgICAgcHJvY2Vzc19tdWx0aWJv
b3Rfbm9kZShmZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMpOwogICAg
IGVsc2UgaWYgKCBkZXB0aCA9PSAxICYmIGRldmljZV90cmVlX25vZGVfbWF0Y2hlcyhmZHQsIG5v
ZGUsICJjaG9zZW4iKSApCiAgICAgICAgIHByb2Nlc3NfY2hvc2VuX25vZGUoZmR0LCBub2RlLCBu
YW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsKIAotICAgIHJldHVybiAwOworICAgIHJl
dHVybiByYzsKIH0KIAogc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9pZCkK
LS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
