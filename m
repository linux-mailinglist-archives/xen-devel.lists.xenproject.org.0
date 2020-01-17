Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E238914087B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:57:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGh-0004xD-TU; Fri, 17 Jan 2020 10:54:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGg-0004wj-Tr
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:22 +0000
X-Inumbo-ID: af6d3e4b-3917-11ea-88b0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af6d3e4b-3917-11ea-88b0-12813bfff9fa;
 Fri, 17 Jan 2020 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WAzvgb5QtA3Q71diJ/2r7MTArKvBTK8BaKDtrTl7ayg=;
 b=VYUVDOqqPOyu/x4dvQfaeH4hopNKrZCxTqvErM23MViinPPTLQhjKw2g
 RMTkfRhjUDE7s9ms6M6lJZLOEHDeIlQIgpZKR6EGazQBDWX+LAy4PIQ+v
 uNi1qoy4WQLbqi/gHF0d6Y0Dhq92ctvVoz0ni5gCWDJdODkcnFLC1B/rk o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6sR9/7VmzZNDFnO3YOvkoGmgwAjGLnTi1LSRGbjlS8ZxNlExmkjJQNi+4sU30sshurFL0Kdgs1
 365IePzZr9ke4oE/XZ1FGe5brF9sEUunwbYawAQzhenZecn3LOsjlg5Cnat+T/GyUar1C+wpdN
 uYIqVfjhWGj1KEQXbYotCKS0mK2SWvn/rJEzIwG/QjoPpZAWheuscP5PYMC6GOcLtO2nMqjEF6
 xZXPQQcr6JcNHMIM7O5pO3ecnhLwm+1s4k9mBsj5cdOp71WRME4kE1bkE7mgpS3QO3ASIJMmWh
 MiM=
X-SBRS: 2.7
X-MesageID: 11432451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432451"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:52 +0000
Message-ID: <20200117105358.607910-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 06/12] xen/test/livepatch: remove include
 of Config.mk
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGl2ZXBhdGNoL01ha2VmaWxlIHNlZW1zIHRvIG9ubHkgYmUgdXNlZCB2aWEgUnVsZXMubWssIHdo
aWNoIGFscmVhZHkKaW5jbHVkZXMgQ29uZmlnLm1rLCBhdm9pZCB0aGUgc2Vjb25kIGluY2x1ZGUu
CgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KLS0tCiB4ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgfCAyIC0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZp
bGUgYi94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKaW5kZXggODJhMDc2YWFjMWViLi4xNDhk
ZGRiOTA0NzMgMTAwNjQ0Ci0tLSBhL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZQorKysgYi94
ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKQEAgLTEsNSArMSwzIEBACi1pbmNsdWRlICQoWEVO
X1JPT1QpL0NvbmZpZy5tawotCiBpZmVxICgkKFhFTl9UQVJHRVRfQVJDSCkseDg2XzY0KQogT0JK
Q09QWV9NQUdJQyA6PSAtSSBiaW5hcnkgLU8gZWxmNjQteDg2LTY0IC1CIGkzODY6eDg2LTY0CiBl
bmRpZgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
