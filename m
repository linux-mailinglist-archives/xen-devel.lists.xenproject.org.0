Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8469A6B9712
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509611.785684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Ce-0008Ti-0Y; Tue, 14 Mar 2023 14:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509611.785684; Tue, 14 Mar 2023 14:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Cd-0008Ru-Ti; Tue, 14 Mar 2023 14:00:35 +0000
Received: by outflank-mailman (input) for mailman id 509611;
 Tue, 14 Mar 2023 14:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsFi=7G=yandex.ru=isaikin-dmitry@srs-se1.protection.inumbo.net>)
 id 1pc5Cb-0008Ro-VT
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:00:34 +0000
Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net
 [178.154.239.80]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9599cffd-c270-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:00:32 +0100 (CET)
Received: from vla5-89ed7012cddd.qloud-c.yandex.net
 (vla5-89ed7012cddd.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3ea3:0:640:89ed:7012])
 by forward500a.mail.yandex.net (Yandex) with ESMTP id 2D6C25EC6F;
 Tue, 14 Mar 2023 17:00:30 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c18:151e:0:640:4f:0
 [2a02:6b8:c18:151e:0:640:4f:0])
 by vla5-89ed7012cddd.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 Q0jwTa1Y1Gk1-eRM8eR16; Tue, 14 Mar 2023 17:00:29 +0300
Received: by ntgyeftcchh4gifo.vla.yp-c.yandex.net with HTTP;
 Tue, 14 Mar 2023 17:00:28 +0300
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
X-Inumbo-ID: 9599cffd-c270-11ed-87f5-c1b5be75604c
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1678802429;
	bh=LLCv3lbDBfeLWgGd90XoZSQNRPtWRY8hTVqnbahpbck=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=FCfuaysaOdIbU1DohQrcUWsoxFByBPNlqVUXKZ43rKym9eFTbCltzGyYEn6ahMTHa
	 PwjicdKkGXnXYXQx5pw5QoJ3tPwKsW/aGe7bVOEdoYSYoDGNsuieS4jEulFgriXiyF
	 c4TkfJzbPdf3xccZsfplLeRC/CKDzDFa5ke5yLio=
Authentication-Results: vla5-89ed7012cddd.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JjRgdCw0LnQutC40L0=?= <isaikin-dmitry@yandex.ru>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Anton Belousov <abelousov@ptsecurity.com>
In-Reply-To: <dd6018f8-27f5-d61a-7dbd-515dd432e1a6@citrix.com>
References: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru> <dd6018f8-27f5-d61a-7dbd-515dd432e1a6@citrix.com>
Subject: Re: [XEN PATCH] x86/monitor: Add new monitor event to catch I/O instructions
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 Mar 2023 17:00:28 +0300
Message-Id: <162941678800322@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjEzLjAzLjIwMjMsIDE1OjMzLCAiQW5kcmV3
IENvb3BlciIgJmx0O2FuZHJldy5jb29wZXIzQGNpdHJpeC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1
b3RlPjxwPk9uIDExLzAzLzIwMjMgMzo1NyBhbSwgRG1pdHJ5IElzYXlraW4gd3JvdGU6PC9wPjxi
bG9ja3F1b3RlPsKgQWRkcyBtb25pdG9yIHN1cHBvcnQgZm9yIEkvTyBpbnN0cnVjdGlvbnMuPGJy
IC8+PGJyIC8+wqBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgSXNheWtpbiAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmlzYWlraW4tZG1pdHJ5QHlhbmRleC5ydSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5p
c2Fpa2luLWRtaXRyeUB5YW5kZXgucnU8L2E+Jmd0OzxiciAvPsKgU2lnbmVkLW9mZi1ieTogQW50
b24gQmVsb3Vzb3YgJmx0OzxhIGhyZWY9Im1haWx0bzphYmVsb3Vzb3ZAcHRzZWN1cml0eS5jb20i
IHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+YWJlbG91c292QHB0c2VjdXJpdHkuY29tPC9hPiZn
dDs8L2Jsb2NrcXVvdGU+PHA+PGJyIC8+VGhhbmt5b3UgZm9yIHRoZSBwYXRjaC7CoCBBIGNvdXBs
ZSBvZiBxdWVzdGlvbnMuPGJyIC8+PGJyIC8+UmlnaHQgbm93LCB5b3UgbW9uaXRvciBhbGwgSU8g
cG9ydHMgdGhhdCBlbmQgdXAgaW4gYSB2bWV4aXQuwqAgQnV0IHRoaXM8YnIgLz5pcyBhbHJlYWR5
IHN1YmplY3QgdG8gaHZtX2lvX2JpdG1hcFtdIHdoaWNoIG1lYW5zIGJ5IGRlZmF1bHQgdGhhdCBw
b3J0PGJyIC8+MHg4MCBhbmQgMHhlZCBhcmUgbm90IGludGVyY2VwdGVkLsKgIFRoZXJlZm9yZSwg
eW91J2xsIG5vdCBwaWNrIHRoZW0gdXA8YnIgLz53aXRoIHRoaXMgbW9uaXRvciBlaXRoZXIuwqAg
SXMgdGhpcyBpbnRlbnRpb25hbD88L3A+PC9ibG9ja3F1b3RlPjxkaXY+Tm8sIHRoaXMgaXMgbm90
IGludGVudGlvbmFsLCBidXQgZm9yIG15IHVzZSBjYXNlcyBpdCBpcyBPSy48L2Rpdj48YmxvY2tx
dW90ZT48cD5NU1JzICh3aGljaCBhcmUgdGhlIG90aGVyIG1vbml0b3JlZCByZXNvdXJjZSB3aXRo
IGEgZmluZSBncmFpbiBiaXRtYXApPGJyIC8+dGFrZSBhIGRpZmZlcmVudCBhcHByb2FjaCwgcmVx
dWlyaW5nIGVhY2ggbW9uaXRvcmVkIE1TUiB0byBiZSBleHBsaWNpdGx5PGJyIC8+b3B0ZWQgaW4g
dG8uwqAgQXJlIHlvdSBhYmxlIHRvIGRpc2N1c3MgeW91ciBpbnRlbmRlZCB1c2VjYXNlIGhlcmUg
YXQgYWxsPzwvcD48L2Jsb2NrcXVvdGU+PGRpdj5NeSB1c2UgY2FzZSBpcyB3ZXJ5IHNpbXBsZS4g
SSB3YW50IHRvIGRldGVjdCBQQ0kgY29uZmlndXJhdGlvbiByZWFkIGF0dGVtcHRzLjwvZGl2Pjxk
aXY+VG8gZG8gdGhpcyBJIGludGVyY2VwdCBJL08gcmVhZHMgb24gcG9ydCAweDBDRjguPC9kaXY+
PGJsb2NrcXVvdGU+PHA+wqA8L3A+PGJsb2NrcXVvdGU+wqAtLS08YnIgLz7CoMKgdG9vbHMvaW5j
bHVkZS94ZW5jdHJsLmggfCAxICs8YnIgLz7CoMKgdG9vbHMvbGlicy9jdHJsL3hjX21vbml0b3Iu
YyB8IDEzICsrKysrKysrKysrKys8YnIgLz7CoMKgeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDUg
KysrKys8YnIgLz7CoMKgeGVuL2FyY2gveDg2L2h2bS9tb25pdG9yLmMgfCAyMSArKysrKysrKysr
KysrKysrKysrKys8YnIgLz7CoMKgeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgfCAyICsrPC9i
bG9ja3F1b3RlPjxwPjxiciAvPllvdSd2ZSB3aXJlZCB1cCBhbGwgdGhlIGNvbnRyb2wgaW5mcmFz
dHJ1Y3R1cmUgYXMgY29tbW9uLCBidXQgb25seTxiciAvPnBsdWdnZWQgaHZtX2lvX2luc3RydWN0
aW9uX2ludGVyY2VwdCgpIGluIHRvIHRoZSBJbnRlbCBzaWRlLjxiciAvPjxiciAvPkFsbCB5b3Ug
bmVlZCB0byBtYWtlIHRoZSBBTUQgc2lkZSB3b3JrIGVxdWl2YWxlbnRseSBpcyB0byBob29rPGJy
IC8+Vk1FWElUX0lPSU8gaW4gc3ZtLmMgaW4gYSBzaW1pbGFyIG1hbm5lciB0byBob3cgeW91J3Zl
IGFscmVhZHkgbW9kaWZpZWQ8YnIgLz5FWElUX1JFQVNPTl9JT19JTlNUUlVDVElPTiBpbiB2bXgu
YzxiciAvPjxiciAvPlBsZWFzZSBkbyB0aGlzLsKgIEkga25vdyB0aGUgbW9uaXRvciBzdWJzeXN0
ZW0gZG9lc24ndCBnZXQgbXVjaCBsb3ZlIG9uPGJyIC8+QU1ELCBidXQgd2UgZG8gd2FudCB0byBk
byBhIGJlc3QtZWZmb3J0IGF0dGVtcHQgdG8gbWFpbnRhaW4gcGFyaXR5LjwvcD48L2Jsb2NrcXVv
dGU+PGRpdj5JIHRyeSB0byBkbyB0aGlzLiBCdXQgSSBjYW4ndCB0ZXN0IGl0LjwvZGl2PjxkaXY+
wqA8L2Rpdj48YmxvY2txdW90ZT48YmxvY2txdW90ZT7CoGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jPGJyIC8+wqBpbmRl
eCAyNzhiODI5ZjczLi5hNjRjNTA3OGM1IDEwMDY0NDxiciAvPsKgLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdm14LmM8YnIgLz7CoCsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jPGJy
IC8+wqBAQCAtNDU3OSw2ICs0NTc5LDggQEAgdm9pZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MpPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVp
bnQxNl90IHBvcnQgPSAoZXhpdF9xdWFsaWZpY2F0aW9uICZndDsmZ3Q7IDE2KSAmYW1wOyAweEZG
RkY7PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCBieXRlcyA9IChleGl0X3F1
YWxpZmljYXRpb24gJmFtcDsgMHgwNykgKyAxOzxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpbnQgZGlyID0gKGV4aXRfcXVhbGlmaWNhdGlvbiAmYW1wOyAweDA4KSA/IElPUkVRX1JF
QUQgOiBJT1JFUV9XUklURTs8YnIgLz7CoCsgaW50IHN0cl9pbnMgPSAoZXhpdF9xdWFsaWZpY2F0
aW9uICZhbXA7IDB4MTApID8gMSA6IDA7PGJyIC8+wqArIGh2bV9pb19pbnN0cnVjdGlvbl9pbnRl
cmNlcHQocG9ydCwgZGlyLCBieXRlcywgc3RyX2lucyk7PC9ibG9ja3F1b3RlPjxwPjxiciAvPkkn
bSBhZnJhaWQgdGhpcyBjYW4ndCBiZSBjb3JyZWN0LsKgIFNlcGFyYXRlIHRvIFRhbWFzJyBvYnNl
cnZhdGlvbiwgaW48YnIgLz50aGUgY2FzZSB0aGF0IHdlIGRvIG1vbml0b3IgdGhlIElPIHBvcnQs
IHdlIG11c3Qgbm90IGNvbnRpbnVlIHdpdGggdGhlPGJyIC8+cmVzdCBvZiB0aGUgbG9naWMuPGJy
IC8+PGJyIC8+T3RoZXJ3aXNlIHdoYXQgd2UnbGwgZW5kIHVwIGRvaW5nIGlzIHB1dHRpbmcgYSBt
b25pdG9yIGV2ZW50IG9uIHRoZTxiciAvPm1vbml0b3IgcmluZywgKmFuZCogc2VuZGluZyB0aGUg
c2FtZSBldmVudCB0byBxZW11IChvciB0ZXJtaW5hdGluZyBpdDxiciAvPndpdGggaW50ZXJuYWwg
ZW11bGF0aW9uKS7CoCBUaGlzIGlzIGZpbmUgaWYgYWxsIHlvdSdyZSB0cnlpbmcgdG8gZG8gaXM8
YnIgLz5sb2cgdGhlIGFjY2VzcywgYnV0IGRvZXNuJ3Qgd29yayBpZiB0aGUgbW9uaXRvciBmcmFt
ZXdvcmsgd2FudHMgZmlyc3Q8YnIgLz5yZWZ1c2FsIG9mIHRoZSBhY2Nlc3MuPGJyIC8+PGJyIC8+
TW9uaXRvciBmdW5jdGlvbnMgdHlwaWNhbGx5IHJldHVybiBpbnQsIGlkZW50aWZ5aW5nIHdoZXRo
ZXIgdGhlIHZDUFUgaGFzPGJyIC8+YmVlbiBwYXVzZWQsIHdoaWNoIHRoZW4gY29udHJvbHMgd2hl
dGhlciB0aGUgc3Vic2VxdWVudCBpbnRlcmNlcHQgbG9naWM8YnIgLz5pcyBwZXJmb3JtZWQuwqAg
U2VlIGh2bV9tb25pdG9yX3t2bWV4aXQsZGVidWd9KCkgYXMgZXhhbXBsZXMuPC9wPjwvYmxvY2tx
dW90ZT48ZGl2PkZvciBub3csIGFsbCBJIG5lZWQgaXMgbG9nZ2luZyBvZiBJL08gYXR0ZW1wdHMu
PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlPjxibG9ja3F1b3RlPsKgZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vbW9uaXRvci5oIGIveGVuL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2h2bS9tb25pdG9yLmg8YnIgLz7CoGluZGV4IDYzOWY2ZGZhMzcuLjIyZDJiMzY2
YTYgMTAwNjQ0PGJyIC8+wqAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL21vbml0
b3IuaDxiciAvPsKgKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h2bS9tb25pdG9yLmg8
YnIgLz7CoEBAIC01NCw2ICs1NCw5IEBAIGJvb2wgaHZtX21vbml0b3JfY2hlY2tfcDJtKHVuc2ln
bmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsPGJyIC8+wqDCoGludCBodm1f
bW9uaXRvcl92bWV4aXQodW5zaWduZWQgbG9uZyBleGl0X3JlYXNvbiw8YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgZXhp
dF9xdWFsaWZpY2F0aW9uKTs8YnIgLz7CoMKgPGJyIC8+wqArdm9pZCBodm1fbW9uaXRvcl9pb19p
bnN0cnVjdGlvbih1aW50MTZfdCBwb3J0LCBpbnQgZGlyLDxiciAvPsKgKyB1bnNpZ25lZCBpbnQg
Ynl0ZXMsIHVuc2lnbmVkIGludCBzdHJpbmdfaW5zKTs8L2Jsb2NrcXVvdGU+PHA+PGJyIC8+UGxl
YXNlIGNvdWxkIHRoaXMgYmUgbmFtZWQgaHZtX21vbml0b3JfaW8oKSBmb3IgY29uc2lzdGVuY3kg
d2l0aCB0aGU8YnIgLz5yZXN0IG9mIHRoZSBtb25pdG9yIHN1YnN5c3RlbT88L3A+PC9ibG9ja3F1
b3RlPjxkaXY+SSB3aWxsIGRvIGl0LjwvZGl2PjxibG9ja3F1b3RlPjxwPsKgPC9wPjxibG9ja3F1
b3RlPsKgZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oIGIveGVuL2lu
Y2x1ZGUvcHVibGljL3ZtX2V2ZW50Lmg8YnIgLz7CoGluZGV4IDAwMzVjMjZlMTIuLjg2ZTRjZGJh
N2MgMTAwNjQ0PGJyIC8+wqAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaDxiciAv
PsKgKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50Lmg8YnIgLz7CoEBAIC0zODgsNiAr
MzkwLDEzIEBAIHN0cnVjdCB2bV9ldmVudF92bWV4aXQgezwhLS0gLS0+PGJyIC8+wqDCoMKgwqDC
oMKgfSBhcmNoOzxiciAvPsKgwqB9OzxiciAvPsKgwqA8YnIgLz7CoCtzdHJ1Y3Qgdm1fZXZlbnRf
aW9faW5zdHJ1Y3Rpb24gezwhLS0gLS0+PGJyIC8+wqArIHVpbnQzMl90IGRhdGFfc2l6ZTs8YnIg
Lz7CoCsgdWludDMyX3QgcG9ydDs8YnIgLz7CoCsgdWludDMyX3QgZGlyOzxiciAvPsKgKyB1aW50
MzJfdCBzdHJpbmdfaW5zOzxiciAvPsKgK307PC9ibG9ja3F1b3RlPjxwPjxiciAvPkZvciBhIHN0
cmluZyBpbnN0cnVjdGlvbiwgZG9uJ3QgeW91IG5lZWQgJXJzaS8lcmRpIHRvbz88L3A+PC9ibG9j
a3F1b3RlPjxkaXY+SW4gc3luY2hyb25vdXMgY2FzZSwgYWxsIGluZm9ybWF0aW9uIGFib3V0IHJl
Z2lzdGVycyBhbmQgbWVtb3J5IGlzIGFscmVhZHkgYXZhaWxhYmxlLjwvZGl2PjxkaXY+wqA8L2Rp
dj48YmxvY2txdW90ZT48cD48YnIgLz5+QW5kcmV3PC9wPjwvYmxvY2txdW90ZT4=

