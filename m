Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AFF164D0
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:39:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO0Gt-000690-2z; Tue, 07 May 2019 13:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5sH=TH=citrix.com=prvs=0233d00f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hO0Gr-00068v-6Q
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:36:37 +0000
X-Inumbo-ID: 1d5cde24-70cd-11e9-bf30-57963d81c259
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d5cde24-70cd-11e9-bf30-57963d81c259;
 Tue, 07 May 2019 13:36:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="85213443"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 May 2019 14:36:25 +0100
Message-ID: <20190507133625.11502-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: don't enable synthetic timer by default
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgYnJva2UgV2luZG93cyBpbnN0YWxsYXRpb24uIE1vcmUgaW52ZXN0aWdhdGlvbiBpcyBuZWVk
ZWQuIERvbid0CmVuYWJsZSBpdCBieSBkZWZhdWx0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkNj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxf
ZG9tLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfZG9tLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwppbmRleCA4
NzljODA2MTM5Li5jNTY4NWIwNjFjIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kb20u
YworKysgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwpAQCAtMjY5LDcgKzI2OSw2IEBAIHN0YXRp
YyBpbnQgaHZtX3NldF92aXJpZGlhbl9mZWF0dXJlcyhsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBk
b21pZCwKICAgICAgICAgbGlieGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJ
UklESUFOX0VOTElHSFRFTk1FTlRfVElNRV9SRUZfQ09VTlQpOwogICAgICAgICBsaWJ4bF9iaXRt
YXBfc2V0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9BUElD
X0FTU0lTVCk7CiAgICAgICAgIGxpYnhsX2JpdG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJY
TF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX0NSQVNIX0NUTCk7Ci0gICAgICAgIGxpYnhsX2JpdG1h
cF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX1NUSU1F
Uik7CiAgICAgfQogCiAgICAgbGlieGxfZm9yX2VhY2hfc2V0X2JpdCh2LCBpbmZvLT51Lmh2bS52
aXJpZGlhbl9lbmFibGUpIHsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
