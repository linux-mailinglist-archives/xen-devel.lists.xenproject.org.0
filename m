Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B372D135880
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 12:52:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipWJ4-0000Ou-0H; Thu, 09 Jan 2020 11:48:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kEnv=26=amazon.co.uk=prvs=2706230f4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipWJ2-0000OE-1d
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 11:48:52 +0000
X-Inumbo-ID: ff9182ca-32d5-11ea-b9a8-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff9182ca-32d5-11ea-b9a8-12813bfff9fa;
 Thu, 09 Jan 2020 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578570530; x=1610106530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fwya/BgXJ1EnkdUnOfoOs9aAodxmibSHnq2+w0trDDA=;
 b=qnl4pnlCVnwPse8ulXZjgz0BOQ+XhBWayPKo8otrrwY+m2fJgGEaMSCu
 xZSs2a0Ocyh9JXeAHyT3Lqo1MgBfCteEBRo1ds56uCSrGaUILqHc4/hk8
 azdh27JnZjMOgNQcvnwugWB4xhznmG3gdvTJZXw84O5/efusGnm7RmaDp Q=;
IronPort-SDR: TxAcFvMnPN155DCvp+I827LWDDD09NJhIwH0X00jNMu6xkM0Ohk+ZUX/p6iv4hMqG4s57VNSo8
 bI3hQt96Zv8Q==
X-IronPort-AV: E=Sophos;i="5.69,413,1571702400"; d="scan'208";a="19033041"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Jan 2020 11:48:37 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 61629A2171; Thu,  9 Jan 2020 11:48:36 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 9 Jan 2020 11:48:36 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 11:48:35 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 9 Jan 2020 11:48:33 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 11:48:15 +0000
Message-ID: <20200109114816.2293-6-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109114816.2293-1-pdurrant@amazon.com>
References: <20200109114816.2293-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 5/6] xl.conf: introduce 'domid_policy'
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IGdsb2JhbCAnZG9taWRfcG9saWN5JyBjb25maWd1cmF0aW9u
IG9wdGlvbiB0byBkZWNpZGUKaG93IGRvbWFpbiBpZCB2YWx1ZXMgYXJlIGFsbG9jYXRlZCBmb3Ig
bmV3IGRvbWFpbnMuIEl0IG1heSBiZSBzZXQgdG8gb25lIG9mCnR3byB2YWx1ZXM6CgoieGVuIiwg
dGhlIGRlZmF1bHQgdmFsdWUsIHdpbGwgY2F1c2UgYW4gaW52YWxpZCBkb21pZCB2YWx1ZSB0byBi
ZSBwYXNzZWQKdG8gZG9fZG9tYWluX2NyZWF0ZSgpIHByZXNlcnZpbmcgdGhlIGV4aXN0aW5nIGJl
aGF2aW91ciBvZiBoYXZpbmcgWGVuCmNob29zZSB0aGUgZG9taWQgdmFsdWUgZHVyaW5nIGRvbWFp
bl9jcmVhdGUoKS4KCiJyYW5kb20iIHdpbGwgY2F1c2UgdGhlIHNwZWNpYWwgUkFORE9NX0RPTUlE
IHZhbHVlIHRvIGJlIHBhc3NlZCB0bwpkb19kb21haW5fY3JlYXRlKCkgc3VjaCB0aGF0IGxpYnhs
X19kb21haW5fbWFrZSgpIHdpbGwgc2VsZWN0IGEgcmFuZG9tCmRvbWlkIHZhbHVlLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KCnYyOgogLSBOZXcgaW4gdjIKLS0tCiBkb2NzL21hbi94bC5jb25mLjUucG9kICB8IDEwICsr
KysrKysrKysKIHRvb2xzL2V4YW1wbGVzL3hsLmNvbmYgIHwgIDQgKysrKwogdG9vbHMveGwveGwu
YyAgICAgICAgICAgfCAxMCArKysrKysrKysrCiB0b29scy94bC94bC5oICAgICAgICAgICB8ICAx
ICsKIHRvb2xzL3hsL3hsX3ZtY29udHJvbC5jIHwgIDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QgYi9kb2Nz
L21hbi94bC5jb25mLjUucG9kCmluZGV4IDIwN2FiM2U3N2EuLjQxZWU0Mjg3NDQgMTAwNjQ0Ci0t
LSBhL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QKKysrIGIvZG9jcy9tYW4veGwuY29uZi41LnBvZApA
QCAtNDUsNiArNDUsMTYgQEAgVGhlIHNlbWFudGljcyBvZiBlYWNoIEM8S0VZPiBkZWZpbmVzIHdo
aWNoIGZvcm0gb2YgQzxWQUxVRT4gaXMgcmVxdWlyZWQuCiAKID1vdmVyIDQKIAorPWl0ZW0gQjxk
b21pZF9wb2xpY3k9InhlbiJ8InJhbmRvbSI+CisKK0RldGVybWluZXMgaG93IGRvbWFpbi1pZCBp
cyBzZXQgd2hlbiBjcmVhdGluZyBhIG5ldyBkb21haW4uCisKK0lmIHNldCB0byAieGVuIiB0aGVu
IHRoZSBoeXBlcnZpc29yIHdpbGwgYWxsb2NhdGUgbmV3IGRvbWFpbi1pZCB2YWx1ZXMgb24gYSBz
ZXF1ZW50aWFsIGJhc2lzLgorCitJZiBzZXQgdG8gInJhbmRvbSIgdGhlbiBhIHJhbmRvbSBkb21h
aW4taWQgdmFsdWUgd2lsbCBiZSBjaG9zZW4uCisKK0RlZmF1bHQ6ICJ4ZW4iCisKID1pdGVtIEI8
YXV0b2JhbGxvb249Im9mZiJ8Im9uInwiYXV0byI+CiAKIElmIHNldCB0byAib24iIHRoZW4gQzx4
bD4gd2lsbCBhdXRvbWF0aWNhbGx5IHJlZHVjZSB0aGUgYW1vdW50IG9mCmRpZmYgLS1naXQgYS90
b29scy9leGFtcGxlcy94bC5jb25mIGIvdG9vbHMvZXhhbXBsZXMveGwuY29uZgppbmRleCAwNDQ2
ZGViMzA0Li45NWYyZjQ0MmQzIDEwMDY0NAotLS0gYS90b29scy9leGFtcGxlcy94bC5jb25mCisr
KyBiL3Rvb2xzL2V4YW1wbGVzL3hsLmNvbmYKQEAgLTEsNSArMSw5IEBACiAjIyBHbG9iYWwgWEwg
Y29uZmlnIGZpbGUgIyMKIAorIyBTZXQgZG9tYWluLWlkIHBvbGljeS4gInhlbiIgbWVhbnMgdGhh
dCB0aGUgaHlwZXJ2aXNvciB3aWxsIGNob29zZSB0aGUKKyMgaWQgb2YgYSBuZXcgZG9tYWluLiAi
cmFuZG9tIiBtZWFucyB0aGF0IGEgcmFuZG9tIHZhbHVlIHdpbGwgYmUgY2hvc2VuLgorI2RvbWlk
X3BvbGljeT0ieGVuIgorCiAjIENvbnRyb2wgd2hldGhlciBkb20wIGlzIGJhbGxvb25lZCBkb3du
IHdoZW4geGVuIGRvZXNuJ3QgaGF2ZSBlbm91Z2gKICMgZnJlZSBtZW1vcnkgdG8gY3JlYXRlIGEg
ZG9tYWluLiAgImF1dG8iIG1lYW5zIG9ubHkgYmFsbG9vbiBpZiBkb20wCiAjIHN0YXJ0cyB3aXRo
IGFsbCB0aGUgaG9zdCdzIG1lbW9yeS4KZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsLmMgYi90b29s
cy94bC94bC5jCmluZGV4IDNkNDM5MGE0NmQuLjJhNWRkZDQzOTAgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L3hsL3hsLmMKKysrIGIvdG9vbHMveGwveGwuYwpAQCAtNTQsNiArNTQsNyBAQCBpbnQgY2xhaW1f
bW9kZSA9IDE7CiBib29sIHByb2dyZXNzX3VzZV9jciA9IDA7CiBpbnQgbWF4X2dyYW50X2ZyYW1l
cyA9IC0xOwogaW50IG1heF9tYXB0cmFja19mcmFtZXMgPSAtMTsKK2xpYnhsX2RvbWlkIGRvbWlk
X3BvbGljeSA9IElOVkFMSURfRE9NSUQ7CiAKIHhlbnRvb2xsb2dfbGV2ZWwgbWlubXNnbGV2ZWwg
PSBtaW5tc2dsZXZlbF9kZWZhdWx0OwogCkBAIC0yMjgsNiArMjI5LDE1IEBAIHN0YXRpYyB2b2lk
IHBhcnNlX2dsb2JhbF9jb25maWcoY29uc3QgY2hhciAqY29uZmlnZmlsZSwKICAgICBlbHNlCiAg
ICAgICAgIGxpYnhsX2JpdG1hcF9zZXRfYW55KCZnbG9iYWxfcHZfYWZmaW5pdHlfbWFzayk7CiAK
KyAgICBpZiAoIXhsdV9jZmdfZ2V0X3N0cmluZyAoY29uZmlnLCAiZG9taWRfcG9saWN5IiwgJmJ1
ZiwgMCkpIHsKKyAgICAgICAgaWYgKCFzdHJjbXAoYnVmLCAieGVuIikpCisgICAgICAgICAgICBk
b21pZF9wb2xpY3kgPSBJTlZBTElEX0RPTUlEOworICAgICAgICBlbHNlIGlmICghc3RyY21wKGJ1
ZiwgInJhbmRvbSIpKQorICAgICAgICAgICAgZG9taWRfcG9saWN5ID0gUkFORE9NX0RPTUlEOwor
ICAgICAgICBlbHNlCisgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImludmFsaWQgZG9taWRf
cG9saWN5IG9wdGlvbiIpOworICAgIH0KKwogICAgIHhsdV9jZmdfZGVzdHJveShjb25maWcpOwog
fQogCmRpZmYgLS1naXQgYS90b29scy94bC94bC5oIGIvdG9vbHMveGwveGwuaAppbmRleCA2MGJk
YWQ4ZmZiLi4yYjQ3MDllZmIyIDEwMDY0NAotLS0gYS90b29scy94bC94bC5oCisrKyBiL3Rvb2xz
L3hsL3hsLmgKQEAgLTI4Myw2ICsyODMsNyBAQCBleHRlcm4gaW50IG1heF9tYXB0cmFja19mcmFt
ZXM7CiBleHRlcm4gbGlieGxfYml0bWFwIGdsb2JhbF92bV9hZmZpbml0eV9tYXNrOwogZXh0ZXJu
IGxpYnhsX2JpdG1hcCBnbG9iYWxfaHZtX2FmZmluaXR5X21hc2s7CiBleHRlcm4gbGlieGxfYml0
bWFwIGdsb2JhbF9wdl9hZmZpbml0eV9tYXNrOworZXh0ZXJuIGxpYnhsX2RvbWlkIGRvbWlkX3Bv
bGljeTsKIAogZW51bSBvdXRwdXRfZm9ybWF0IHsKICAgICBPVVRQVVRfRk9STUFUX0pTT04sCmRp
ZmYgLS1naXQgYS90b29scy94bC94bF92bWNvbnRyb2wuYyBiL3Rvb2xzL3hsL3hsX3ZtY29udHJv
bC5jCmluZGV4IGU1MjBiMWRhNzkuLjM5MjkyYWNmZTYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hs
X3ZtY29udHJvbC5jCisrKyBiL3Rvb2xzL3hsL3hsX3ZtY29udHJvbC5jCkBAIC04OTksNiArODk5
LDggQEAgc3RhcnQ6CiAgICAgICAgIGF1dG9jb25uZWN0X2NvbnNvbGVfaG93ID0gMDsKICAgICB9
CiAKKyAgICBkX2NvbmZpZy5jX2luZm8uZG9taWQgPSBkb21pZF9wb2xpY3k7CisKICAgICBpZiAo
IHJlc3RvcmluZyApIHsKICAgICAgICAgbGlieGxfZG9tYWluX3Jlc3RvcmVfcGFyYW1zIHBhcmFt
czsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
