Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D0152893
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:41:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izH8E-0007kO-3x; Wed, 05 Feb 2020 09:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gd5K=3Z=amazon.co.uk=prvs=297b894c2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izH8C-0007kJ-7A
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:38:00 +0000
X-Inumbo-ID: 31bf7a74-47fb-11ea-90ae-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31bf7a74-47fb-11ea-90ae-12813bfff9fa;
 Wed, 05 Feb 2020 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580895480; x=1612431480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxZdUktzqPrd8a47hhi2nVCeq4+JLMmc/G1tqqMpNe4=;
 b=tmwkQ7XX4HBm6Y8X35vu0m4RJa8P/1pZLNDbrMMA1LZuNjLCA3J4ZsCZ
 tGa5mu/jN+xPQccCHAMOmYNlWclWuWU5RTx2NcIR8PFjxiSxOc1I4oljz
 AxDwSxwjVRXqAXr0VtemZNuO9x8Yx6cNBu0nUhNAoSqCiaEKPeW5sQj9K M=;
IronPort-SDR: Ip7YIjIbDtFFnzQ89+7gOTiYxP0CoMYibgm3e0xsKSWXOCyHcwVRY9Q7DDo2WzmZMU83iIj/+R
 4iQYTE7jvCxw==
X-IronPort-AV: E=Sophos;i="5.70,405,1574121600"; d="scan'208";a="14764432"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 05 Feb 2020 09:37:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 98009A2A90; Wed,  5 Feb 2020 09:37:29 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 5 Feb 2020 09:37:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Feb 2020 09:37:28 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 5 Feb 2020 09:37:26 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 09:37:24 +0000
Message-ID: <20200205093724.2854-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] libxl: fix assertion failure in stub domain
 creation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW4gYXNzZXJ0aW9uIGluIGxpYnhsX19kb21haW5fbWFrZSgpOgoKJ3NvZnRfcmVzZXQgfHwgKmRv
bWlkID09IElOVkFMSURfRE9NSUQnCgpkb2VzIG5vdCBob2xkIHRydWUgZm9yIHN0dWIgZG9tYWlu
IGNyZWF0aW9uLCB3aGVyZSBzb2Z0X3Jlc2V0IGlzIGZhbHNlCmJ1dCB0aGUgcGFzc2VkIGluIGRv
bWlkID09IDAuIFRoaXMgaXMgZWFzaWx5IGZpeGVkIGJ5IGNoYW5naW5nIHRoZQppbml0aWFsaXpl
ciBpbiBsaWJ4bF9fc3Bhd25fc3R1Yl9kbSgpLgoKRml4ZXM6IDc1MjU5MjM5ZDg1ZCAoImxpYnhs
X2NyZWF0ZTogbWFrZSAnc29mdCByZXNldCcgZXhwbGljaXQiKQpTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFuIGV4YW1wbGUgb2YgdGhlIGFzc2VydGlvbiBmYWls
dXJlIGNhbiBiZSBzZWVuIGF0OgoKaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcv
b3NzdGVzdC9sb2dzLzE0NjcyNi90ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXN0dWJkb20tZGVi
aWFuaHZtLWFtZDY0LXhzbS8xMC50cy1kZWJpYW4taHZtLWluc3RhbGwubG9nCi0tLQogdG9vbHMv
bGlieGwvbGlieGxfZG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IGY3NThkYWYzYjYuLjNiMWRhOTAxNjcgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwpA
QCAtMjEyNyw3ICsyMTI3LDcgQEAgdm9pZCBsaWJ4bF9fc3Bhd25fc3R1Yl9kbShsaWJ4bF9fZWdj
ICplZ2MsIGxpYnhsX19zdHViX2RtX3NwYXduX3N0YXRlICpzZHNzKQogICAgICAgICBnb3RvIG91
dDsKICAgICB9CiAKLSAgICBzZHNzLT5wdnFlbXUuZ3Vlc3RfZG9taWQgPSAwOworICAgIHNkc3Mt
PnB2cWVtdS5ndWVzdF9kb21pZCA9IElOVkFMSURfRE9NSUQ7CiAKICAgICBsaWJ4bF9kb21haW5f
Y3JlYXRlX2luZm9faW5pdCgmZG1fY29uZmlnLT5jX2luZm8pOwogICAgIGRtX2NvbmZpZy0+Y19p
bmZvLnR5cGUgPSBMSUJYTF9ET01BSU5fVFlQRV9QVjsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
