Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A319B11BEEF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 22:15:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if9Ie-0007SM-PV; Wed, 11 Dec 2019 21:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JtnU=2B=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1if9Id-0007S8-1B
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 21:13:35 +0000
X-Inumbo-ID: 133acc28-1c5b-11ea-b6f1-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 133acc28-1c5b-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 21:13:28 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Dec 2019 16:13:02 -0500
Message-ID: <20191211211302.117395-3-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.13.171]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v3 2/2] xen/arm: sign extend writes to TimerValue
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGVyIHRoZSBBUk12OCBSZWZlcmVuY2UgTWFudWFsIChBUk0gRERJIDA0ODdFLmEpLCBzZWN0aW9u
IEQxMS4yLjQKc3BlY2lmaWVzIHRoYXQgdGhlIHZhbHVlcyBpbiB0aGUgVGltZXJWYWx1ZSB2aWV3
IG9mIHRoZSB0aW1lcnMgYXJlCnNpZ25lZCBpbiBzdGFuZGFyZCB0d28ncyBjb21wbGVtZW50IGZv
cm0uIFdoZW4gd3JpdGluZyB0byB0aGUgVGltZXJWYWx1ZQpyZWdpc3RlciwgaXQgc2hvdWxkIGJl
IHNpZ25lZCBleHRlbmRlZCBhcyBkZXNjcmliZWQgYnkgdGhlIGVxdWF0aW9uCgogICBDb21wYXJl
VmFsdWUgPSAoQ291bnRlcls2MzowXSArIFNpZ25FeHRlbmQoVGltZXJWYWx1ZSkpWzYzOjBdCgpT
aWduZWQtb2ZmLWJ5OiBKZWZmIEt1YmFzY2lrIDxqZWZmLmt1YmFzY2lrQGRvcm5lcndvcmtzLmNv
bT4KLS0tCiB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnRp
bWVyLmMgYi94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKaW5kZXggMjFiOThlYzIwYS4uODcyMTgxZDli
NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3Z0aW1lci5jCisrKyBiL3hlbi9hcmNoL2FybS92
dGltZXIuYwpAQCAtMjExLDcgKzIxMSw3IEBAIHN0YXRpYyBib29sIHZ0aW1lcl9jbnRwX3R2YWwo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90ICpyLAogICAgIH0KICAgICBlbHNl
CiAgICAgewotICAgICAgICB2LT5hcmNoLnBoeXNfdGltZXIuY3ZhbCA9IGNudHBjdCArICpyOwor
ICAgICAgICB2LT5hcmNoLnBoeXNfdGltZXIuY3ZhbCA9IGNudHBjdCArICh1aW50NjRfdCkoaW50
MzJfdCkqcjsKICAgICAgICAgaWYgKCB2LT5hcmNoLnBoeXNfdGltZXIuY3RsICYgQ05UeF9DVExf
RU5BQkxFICkKICAgICAgICAgewogICAgICAgICAgICAgdi0+YXJjaC5waHlzX3RpbWVyLmN0bCAm
PSB+Q05UeF9DVExfUEVORElORzsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
