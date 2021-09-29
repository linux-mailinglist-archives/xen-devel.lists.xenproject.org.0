Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8141BE4B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 06:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198578.352128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVRJx-00065N-AJ; Wed, 29 Sep 2021 04:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198578.352128; Wed, 29 Sep 2021 04:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVRJx-00062X-7A; Wed, 29 Sep 2021 04:35:53 +0000
Received: by outflank-mailman (input) for mailman id 198578;
 Wed, 29 Sep 2021 04:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2G/I=OT=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mVRJu-00062P-B8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 04:35:51 +0000
Received: from forward104p.mail.yandex.net (unknown [77.88.28.107])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc5b1271-e584-4c9d-b31e-9e2714efe1fb;
 Wed, 29 Sep 2021 04:35:46 +0000 (UTC)
Received: from postback11j.mail.yandex.net (postback11j.mail.yandex.net
 [IPv6:2a02:6b8:c04:242:0:640:f45d:5029])
 by forward104p.mail.yandex.net (Yandex) with ESMTP id 90AA13C1E6F6;
 Wed, 29 Sep 2021 07:35:44 +0300 (MSK)
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::110])
 by postback11j.mail.yandex.net (Yandex) with ESMTP id 8363670790CB;
 Wed, 29 Sep 2021 07:35:44 +0300 (MSK)
Received: from myt5-d8fb82618a34.qloud-c.yandex.net
 (myt5-d8fb82618a34.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:59a3:0:640:d8fb:8261])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id 805B06CB6402;
 Wed, 29 Sep 2021 07:35:44 +0300 (MSK)
Received: from 2a02:6b8:c12:2e:0:640:e9df:8ad7
 (2a02:6b8:c12:2e:0:640:e9df:8ad7 [2a02:6b8:c12:2e:0:640:e9df:8ad7])
 by myt5-d8fb82618a34.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 gZc3NS0D3eA1-ZhDSTo54; Wed, 29 Sep 2021 07:35:43 +0300
Received: by myt3-e9df8ad73dde.qloud-c.yandex.net with HTTP;
 Wed, 29 Sep 2021 07:35:43 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bc5b1271-e584-4c9d-b31e-9e2714efe1fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1632890143;
	bh=H2Kd/bWdxrcpWzKwfKi9rgk2rakJspIEmpOdfcRI3/I=;
	h=References:Date:Message-Id:Cc:Subject:In-Reply-To:To:From;
	b=wLkFkdJcQ4x6zsZLKeqeH0sRGbKtzZdE+XQQKcy20XyX1AJGuqmjv8YqxhEd6MDnU
	 ueopnJONIksMuTDG7QJZZ+L27OS/048k7iZclvOFTKH04BmzwycTkS2bkgyadRBCuL
	 t/lowLaeQ6TDEN911g+gQDjcbPiy2a+04BdKWiu8=
Authentication-Results: myt5-d8fb82618a34.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
In-Reply-To: <YVMMXarcqweUD4sK@perard>
References: <dd3a1e1a7a3f8e7bca18dd4779efbc2af01decc7.1631793876.git.isaikin-dmitry@yandex.ru> <YVMMXarcqweUD4sK@perard>
Subject: Re: [PATCH v3] tools/xl: fix autoballoon regex
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 29 Sep 2021 07:35:43 +0300
Message-Id: <1504001632889454@iva7-56e9317134d0.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

VGhhbmtzISBUaGF0J3MgYSBnb29kIGlkZWEuIEkgd2lsbCBkbyBpdCBpbiB2NCBwYXRjaC48ZGl2
PjxiciAvPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNnB4Ij5JdCBzZWVtcyB0
aGF0ICJkb20wX21lbT0iIGlzIGEgY29ycmVjdCBzZXR0aW5nLiBJdCBtZWFucyAiZ2l2ZSBhbGwg
dW51c2VkIGJ5IGh5cGVydmlzb3IgbWVtb3J5IHRvIGRvbTAiLjwvc3Bhbj48YnIgLz48YnIgLz4x
NTozNiwgMjgg0YHQtdC90YLRj9Cx0YDRjyAyMDIxINCzLiwgQW50aG9ueSBQRVJBUkQgJmx0O2Fu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20mZ3Q7OjxiciAvPjxibG9ja3F1b3RlIGNsYXNzPSIyMTBl
N2E4NDhlOGZjYjQ1d21pLXF1b3RlIj48cD5PbiBUaHUsIFNlcCAxNiwgMjAyMSBhdCAwMzoxNToy
MVBNICswMzAwLCBEbWl0cnkgSXNheWtpbiB3cm90ZTo8YnIgLz48L3A+PGJsb2NrcXVvdGUgY2xh
c3M9IjIxMGU3YTg0OGU4ZmNiNDV3bWktcXVvdGUiPsKgVGhpcyByZWdleCBpcyB1c2VkIGZvciBh
dXRvLWJhbGxvb24gbW9kZSBkZXRlY3Rpb24gYmFzZWQgb24gWGVuIGNvbW1hbmQgbGluZS48YnIg
Lz7CoDxiciAvPsKgVGhlIGNhc2Ugb2Ygc3BlY2lmeWluZyBhIG5lZ2F0aXZlIHNpemUgd2FzIGhh
bmRsZWQgaW5jb3JyZWN0bHkuPGJyIC8+wqBGcm9tIG1pc2MveGVuLWNvbW1hbmQtbGluZSBkb2N1
bWVudGF0aW9uOjxiciAvPsKgPGJyIC8+wqDCoMKgwqDCoGRvbTBfbWVtICh4ODYpPGJyIC8+wqDC
oMKgwqDCoD0gTGlzdCBvZiAoIG1pbjombHQ7c3omZ3Q7IHwgbWF4OiZsdDtzeiZndDsgfCAmbHQ7
c3omZ3Q7ICk8YnIgLz7CoDxiciAvPsKgwqDCoMKgwqBJZiBhIHNpemUgaXMgcG9zaXRpdmUsIGl0
IHJlcHJlc2VudHMgYW4gYWJzb2x1dGUgdmFsdWUuPGJyIC8+wqDCoMKgwqDCoElmIGEgc2l6ZSBp
cyBuZWdhdGl2ZSwgaXQgaXMgc3VidHJhY3RlZCBmcm9tIHRoZSB0b3RhbCBhdmFpbGFibGUgbWVt
b3J5LjxiciAvPsKgPGJyIC8+wqBBbHNvIGFkZCBzdXBwb3J0IGZvciBbdFRdIGdyYW51bGFyaXR5
IHN1ZmZpeC48YnIgLz7CoEFsc28gYWRkIHN1cHBvcnQgZm9yIG1lbW9yeSBmcmFjdGlvbnMgKGku
ZS4gJzUwJScgb3IgJzFHKzI1JScpLjxiciAvPsKgPGJyIC8+wqBTaWduZWQtb2ZmLWJ5OiBEbWl0
cnkgSXNheWtpbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmlzYWlraW4tZG1pdHJ5QHlhbmRleC5ydSI+
aXNhaWtpbi1kbWl0cnlAeWFuZGV4LnJ1PC9hPiZndDs8YnIgLz7CoC0tLTxiciAvPsKgwqDCoMKg
wqDCoHJldCA9IHJlZ2NvbXAoJmFtcDtyZWdleCw8YnIgLz7CoC0gICAgICAgICAgICAgICAgICAi
KF58IClkb20wX21lbT0oKHxtaW46fG1heDopWzAtOV0rW2JCa0ttTWdHXT8sPykrKCR8ICkiLDxi
ciAvPsKgKyAgICAgICAgICAgICAgICAgICIoXnwgKWRvbTBfbWVtPSgofG1pbjp8bWF4OikoLT9b
MC05XStbYkJrS21NZ0d0VF0/KT8oXCs/WzAtOV0rJSk/LD8pKygkfCApIiw8YnIgLz48L2Jsb2Nr
cXVvdGU+PHA+PGJyIC8+SXQgc2VlbXMgdGhhdCBieSB0cnlpbmcgdG8gbWF0Y2ggZnJhY3Rpb25z
LCB0aGUgbmV3IHJlZ2V4IHdvdWxkIG1hdGNoPGJyIC8+dG9vIG11Y2guIEZvciBleGFtcGxlLCBp
ZiB0aGVyZSBpcyAiIGRvbTBfbWVtPSAiIG9uIHRoZSBjb21tYW5kIGxpbmUsIHhsPGJyIC8+d291
bGQgZGV0ZWN0IGl0IGFzIGF1dG9iYWxsb29uPW9mZiwgd2hpbGUgaXQgaXNuJ3QgdGhlIGNhc2Ug
d2l0aG91dCB0aGlzPGJyIC8+cGF0Y2guIEkgZG9uJ3Qga25vdyBpZiBpdCBpcyBwb3NzaWJsZSB0
byBoYXZlICJkb20wX21lbT0iIG9uIHRoZSBjb21tYW5kPGJyIC8+bGluZSBhcyBJIGRvbid0IGtu
b3cgd2hhdCBYZW4gd291bGQgZG8gaW4gdGhpcyBjYXNlLjxiciAvPjxiciAvPkl0IG1pZ2h0IGJl
IGJldHRlciB0byBtYWtlIHRoZSByZWdleCBtb3JlIGNvbXBsaWNhdGVkIGFuZCBtYXRjaDxiciAv
PmZyYWN0aW9uIGxpa2UgdGhleSBhcmUgZGVzY3JpYmVkIGluIHRoZSBkb2MsIHNvbWV0aGluZyBs
aWtlOjxiciAvPsKgwqDCoMKgKCAmbHQ7c2l6ZSZndDsgfCAoJmx0O3NpemUmZ3Q7XCspPyZsdDtm
cmFjJmd0OyUgKTxiciAvPjxiciAvPnVubGVzcyB4ZW4gZG9lc24ndCBib290IHdpdGggYm9ndXMg
dmFsdWUgZm9yIGRvbTBfbWVtLCBidXQgSSBoYXZlbid0PGJyIC8+Y2hlY2tlZC4gKHdlIGNvdWxk
IHVzZSBDUFAgbWFjcm9zIHRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSAmbHQ7c2l6ZSZndDs8YnIg
Lz5yZWdleC4pPGJyIC8+PGJyIC8+QWxzbywgJmx0O2ZyYWMmZ3Q7IGlzIHN1cHBvc2VkIHRvIGJl
ICZsdDsgMTAwLCBzbyBbMC05XXsxLDJ9IHdvdWxkIGJlIGJldHRlciB0bzxiciAvPm9ubHkgbWF0
Y2ggbm8gbW9yZSB0aGFuIDIgZGlnaXQuPGJyIC8+PGJyIC8+VGhvdWdodD88YnIgLz48YnIgLz5U
aGFua3MsPGJyIC8+PGJyIC8+PC9wPjxzcGFuIGNsYXNzPSJmNTViYmI0ZWVlZjIwOGU4d21pLXNp
Z24iPi0tIDxiciAvPkFudGhvbnkgUEVSQVJEPGJyIC8+PC9zcGFuPjwvYmxvY2txdW90ZT48YnIg
Lz48YnIgLz4tLSA8YnIgLz7QntGC0L/RgNCw0LLQu9C10L3QviDQuNC3INC80L7QsdC40LvRjNC9
0L7Qs9C+INC/0YDQuNC70L7QttC10L3QuNGPINCv0L3QtNC10LrRgS7Qn9C+0YfRgtGLPC9kaXY+

