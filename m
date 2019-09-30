Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE83C1F1D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt12-0007N7-5U; Mon, 30 Sep 2019 10:34:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0z-0007Ka-RN
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:49 +0000
X-Inumbo-ID: ecde9abc-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id ecde9abc-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839687; x=1601375687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=3nNvQG1v8uYo6cTIKpiw9dRaihrielmfxq5scEhNceU=;
 b=R5aBm6pFiCth9Kx2KlDdmHLrjQQ7FVQT8EPnXXwP+5RVQcggoukn3kl7
 RaNTQj0cp9L3jn0SEk96hMiP+yY3S11UJQzAmFsSWmtzpVscc99E+ni9V
 VIt+PlN1n4WS/S+zVXOKs4idKJiLnnVkiJ5mZJLAR1OLmnXY3yLuwhkQt 0=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="788414695"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 30 Sep 2019 10:34:47 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 271E9244235; Mon, 30 Sep 2019 10:34:47 +0000 (UTC)
Received: from EX13D15UEE002.ant.amazon.com (10.43.62.80) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:18 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D15UEE002.ant.amazon.com (10.43.62.80) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:17 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:17 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:21 +0100
Message-ID: <75bdd5c41f19bd435bb708f3e3297c89e37bcbf1.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 29/55] efi: avoid using global variable in
 copy_mapping
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBzd2l0Y2gg
ZWZpX2w0X3RhYmxlIHRvIHVzZSBlcGhlbWVyYWwgbWFwcGluZy4gTWFrZQpjb3B5X21hcHBpbmcg
dGFrZSBhIHBvaW50ZXIgdG8gdGhlIG1hcHBpbmcgaW5zdGVhZCBvZiB1c2luZyB0aGUgZ2xvYmFs
CnZhcmlhYmxlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9jb21tb24vZWZpL2Jvb3Qu
YyB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21t
b24vZWZpL2Jvb3QuYwppbmRleCA2MmI1OTQ0ZTYxLi42NGEyODc2OTBhIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2VmaS9ib290LmMKKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCkBAIC0xNDIz
LDcgKzE0MjMsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9lZmlfcGFyYW0oY29uc3QgY2hh
ciAqcykKIGN1c3RvbV9wYXJhbSgiZWZpIiwgcGFyc2VfZWZpX3BhcmFtKTsKIAogI2lmbmRlZiBV
U0VfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVAKLXN0YXRpYyBfX2luaXQgdm9pZCBjb3B5X21hcHBp
bmcodW5zaWduZWQgbG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgZW5kLAorc3RhdGljIF9faW5pdCB2
b2lkIGNvcHlfbWFwcGluZyhsNF9wZ2VudHJ5X3QgKmw0LAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBlbmQsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgKCppc192YWxpZCkodW5zaWduZWQgbG9uZyBz
bWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZW1mbikpCiB7CkBAIC0xNDMxLDcgKzE0MzIsNyBAQCBzdGF0aWMgX19pbml0
IHZvaWQgY29weV9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIGVuZCwK
IAogICAgIGZvciAoIDsgbWZuIDwgZW5kOyBtZm4gPSBuZXh0ICkKICAgICB7Ci0gICAgICAgIGw0
X3BnZW50cnlfdCBsNGUgPSBlZmlfbDRfcGd0YWJsZVtsNF90YWJsZV9vZmZzZXQobWZuIDw8IFBB
R0VfU0hJRlQpXTsKKyAgICAgICAgbDRfcGdlbnRyeV90IGw0ZSA9IGw0W2w0X3RhYmxlX29mZnNl
dChtZm4gPDwgUEFHRV9TSElGVCldOwogICAgICAgICBsM19wZ2VudHJ5X3QgKmwzc3JjLCAqbDNk
c3Q7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmEgPSAodW5zaWduZWQgbG9uZyltZm5fdG9fdmly
dChtZm4pOwogCkBAIC0xNDQ2LDcgKzE0NDcsNyBAQCBzdGF0aWMgX19pbml0IHZvaWQgY29weV9t
YXBwaW5nKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIGVuZCwKICAgICAgICAgICAg
IEJVR19PTihtZm5fZXEobDN0X21mbiwgSU5WQUxJRF9NRk4pKTsKICAgICAgICAgICAgIGwzZHN0
ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwzdF9tZm4pOwogICAgICAgICAgICAgY2xlYXJfcGFn
ZShsM2RzdCk7Ci0gICAgICAgICAgICBlZmlfbDRfcGd0YWJsZVtsNF90YWJsZV9vZmZzZXQobWZu
IDw8IFBBR0VfU0hJRlQpXSA9CisgICAgICAgICAgICBsNFtsNF90YWJsZV9vZmZzZXQobWZuIDw8
IFBBR0VfU0hJRlQpXSA9CiAgICAgICAgICAgICAgICAgbDRlX2Zyb21fbWZuKGwzdF9tZm4sIF9f
UEFHRV9IWVBFUlZJU09SKTsKICAgICAgICAgfQogICAgICAgICBlbHNlCkBAIC0xNjA2LDcgKzE2
MDcsNyBAQCB2b2lkIF9faW5pdCBlZmlfaW5pdF9tZW1vcnkodm9pZCkKICAgICBCVUdfT04oIWVm
aV9sNF9wZ3RhYmxlKTsKICAgICBjbGVhcl9wYWdlKGVmaV9sNF9wZ3RhYmxlKTsKIAotICAgIGNv
cHlfbWFwcGluZygwLCBtYXhfcGFnZSwgcmFtX3JhbmdlX3ZhbGlkKTsKKyAgICBjb3B5X21hcHBp
bmcoZWZpX2w0X3BndGFibGUsIDAsIG1heF9wYWdlLCByYW1fcmFuZ2VfdmFsaWQpOwogCiAgICAg
LyogSW5zZXJ0IG5vbi1SQU0gcnVudGltZSBtYXBwaW5ncyBpbnNpZGUgdGhlIGRpcmVjdCBtYXAu
ICovCiAgICAgZm9yICggaSA9IDA7IGkgPCBlZmlfbWVtbWFwX3NpemU7IGkgKz0gZWZpX21kZXNj
X3NpemUgKQpAQCAtMTYxOSw3ICsxNjIwLDcgQEAgdm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5
KHZvaWQpCiAgICAgICAgICAgICAgICAgZGVzYy0+VHlwZSA9PSBFZmlCb290U2VydmljZXNEYXRh
KSkpICYmCiAgICAgICAgICAgICAgZGVzYy0+VmlydHVhbFN0YXJ0ICE9IElOVkFMSURfVklSVFVB
TF9BRERSRVNTICYmCiAgICAgICAgICAgICAgZGVzYy0+VmlydHVhbFN0YXJ0ICE9IGRlc2MtPlBo
eXNpY2FsU3RhcnQgKQotICAgICAgICAgICAgY29weV9tYXBwaW5nKFBGTl9ET1dOKGRlc2MtPlBo
eXNpY2FsU3RhcnQpLAorICAgICAgICAgICAgIGNvcHlfbWFwcGluZyhlZmlfbDRfcGd0YWJsZSwg
UEZOX0RPV04oZGVzYy0+UGh5c2ljYWxTdGFydCksCiAgICAgICAgICAgICAgICAgICAgICAgICAg
UEZOX1VQKGRlc2MtPlBoeXNpY2FsU3RhcnQgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAoZGVzYy0+TnVtYmVyT2ZQYWdlcyA8PCBFRklfUEFHRV9TSElGVCkpLAogICAgICAgICAg
ICAgICAgICAgICAgICAgIHJ0X3JhbmdlX3ZhbGlkKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
