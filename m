Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A8EB397
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:12:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQC58-0006Xc-S8; Thu, 31 Oct 2019 15:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQC57-0006Wv-Bt
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:09:49 +0000
X-Inumbo-ID: 77ea8f2c-fbf0-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 77ea8f2c-fbf0-11e9-bbab-bc764e2007e4;
 Thu, 31 Oct 2019 15:09:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3F74F5;
 Thu, 31 Oct 2019 08:09:43 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6682C3F71E;
 Thu, 31 Oct 2019 08:09:42 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2019 15:09:11 +0000
Message-Id: <20191031150922.22938-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
References: <20191031150922.22938-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v4 08/19] xen/arm64: entry: Check if an
 SError is pending when receiving a vSError
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgd2hlbiB3ZSByZWNlaXZlIGFuIFNFcnJvciBleGNlcHRpb24gZnJvbSB0
aGUgZ3Vlc3QsIHdlCmRvbid0IGNoZWNrIGlmIHRoZXJlIGFyZSBhbnkgb3RoZXIgcGVuZGluZy4g
Rm9yIGhhcmRlbmluZyB0aGUgY29kZSwgd2UKc2hvdWxkIGVuc3VyZSBhbnkgcGVuZGluZyBTRXJy
b3IgYXJlIGFjY291bnRlZCB0byB0aGUgZ3Vlc3QgYmVmb3JlCmV4ZWN1dGluZyBhbnkgY29kZSB3
aXRoIFNFcnJvciB1bm1hc2tlZC4KClRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIG1hY3JvICdndWVz
dF92ZWN0b3InIGNvdWxkIHVzZWQgdG8gZ2VuZXJhdGUgdGhlCnR3byB2ZWN0b3JzIGFuZCB0aGVy
ZWZvcmUgdGFrZSBhZHZhbnRhZ2Ugb2YgYW55IGNoYW5nZSByZXF1aXJlZCBpbiB0aGUKZnV0dXJl
LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0t
LQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgcmV2aWV3ZWQtYnkK
CiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gVGl0bGU6IHMvaGVhZC9lbnRyeS8KICAgICAg
ICAtIFVzZSB0aGUgbmV3IHNob3J0LWhhbmRzCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5
LlMgfCAxMiArKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKaW5kZXggMjg2N2M0OTlkYS4uZDk0YzEzZTdiZiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKKysrIGIveGVuL2FyY2gvYXJt
L2FybTY0L2VudHJ5LlMKQEAgLTM4MSwxMSArMzgxLDcgQEAgZ3Vlc3RfZmlxX2ludmFsaWQ6CiAg
ICAgICAgIGludmFsaWQgQkFEX0ZJUQogCiBndWVzdF9lcnJvcjoKLSAgICAgICAgZW50cnkgICBo
eXA9MCwgY29tcGF0PTAKLSAgICAgICAgbXNyICAgICBkYWlmY2xyLCAjSUZMQUdTX19BSV8KLSAg
ICAgICAgbW92ICAgICB4MCwgc3AKLSAgICAgICAgYmwgICAgICBkb190cmFwX2d1ZXN0X3NlcnJv
cgotICAgICAgICBleGl0ICAgIGh5cD0wLCBjb21wYXQ9MAorICAgICAgICBndWVzdF92ZWN0b3Ig
Y29tcGF0PTAsIGlmbGFncz1JRkxBR1NfX0FJXywgdHJhcD1ndWVzdF9zZXJyb3IKIAogZ3Vlc3Rf
c3luY19jb21wYXQ6CiAgICAgICAgIGd1ZXN0X3ZlY3RvciBjb21wYXQ9MSwgaWZsYWdzPUlGTEFH
U19fQUlfLCB0cmFwPWd1ZXN0X3N5bmMKQEAgLTM5OCwxMSArMzk0LDcgQEAgZ3Vlc3RfZmlxX2lu
dmFsaWRfY29tcGF0OgogICAgICAgICBpbnZhbGlkIEJBRF9GSVEKIAogZ3Vlc3RfZXJyb3JfY29t
cGF0OgotICAgICAgICBlbnRyeSAgIGh5cD0wLCBjb21wYXQ9MQotICAgICAgICBtc3IgICAgIGRh
aWZjbHIsICNJRkxBR1NfX0FJXwotICAgICAgICBtb3YgICAgIHgwLCBzcAotICAgICAgICBibCAg
ICAgIGRvX3RyYXBfZ3Vlc3Rfc2Vycm9yCi0gICAgICAgIGV4aXQgICAgaHlwPTAsIGNvbXBhdD0x
CisgICAgICAgIGd1ZXN0X3ZlY3RvciBjb21wYXQ9MSwgaWZsYWdzPUlGTEFHU19fQUlfLCB0cmFw
PWd1ZXN0X3NlcnJvcgogCiBFTlRSWShyZXR1cm5fdG9fbmV3X3ZjcHUzMikKICAgICAgICAgZXhp
dCAgICBoeXA9MCwgY29tcGF0PTEKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
