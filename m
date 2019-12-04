Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02919112E9A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 16:37:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icWeD-0001AM-Fa; Wed, 04 Dec 2019 15:33:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q6Eq=Z2=gmail.com=felix.nasch@srs-us1.protection.inumbo.net>)
 id 1icWeC-0001AH-37
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 15:33:00 +0000
X-Inumbo-ID: 59e22ef6-16ab-11ea-99dd-bc764e2007e4
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59e22ef6-16ab-11ea-99dd-bc764e2007e4;
 Wed, 04 Dec 2019 15:32:59 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id l24so55246pgk.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 07:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=P2DMNEpAL/jznUZ4BPKQK3AilLljSJhj9qiTKsulS+s=;
 b=Bst0JM58RIfNaIJSiyFfvKtkzmYUfhAOJsHR3/U5wWcSGXmOAebOnaY4psjj1DkqzP
 gDHbpT9F8/87BoF/NF/QDSSbnMKbPQrNTvlts4+yj70hvv3zhcOp66IXiktsYb7TivBt
 m7qUbYtqJM8FhBDNE/hED/RGR3AMR6Xk15GwpYWQ24Vs2JMY+XYI7hOonqFYYknfBUgV
 21QrIKZkyJe0G7B9f7iVgrJMw1zaYK47KjyL+wLFILyfDSJABDFFo/OGpbBA0TlvnU2U
 EEz/5oILtz+ZLvJoT0V+xUCbEd3bFIgUkH0f8OaUCBpkW+74iVvmlj750Z+8EqfKKYvE
 uZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P2DMNEpAL/jznUZ4BPKQK3AilLljSJhj9qiTKsulS+s=;
 b=HNoEkq355gL3JkEcoE6y4fbVFRkhOF31PPIxjL9vVy37bTJHC+354b23gRfKKpPnfm
 Sn68ge/i0BfW2g55eFnYoFrJ/uHZFlemDTrnl7HDkmAsTFfBdHxL51CSQtiePAYZZWa+
 2QUWsVghi1W62e2aT/Wyu1grL/vlsG4LOy44sdDvR5KTWDhXc8pjHqF4q2ZdChFxJhgj
 1t1lAD3OkzKSi3Ag1QMKvM9ZqFaHsl4dyI55Pxf3Je7Ssw6F+ls70/oe3civK/GPpnMj
 PTPUL8wklFybyR7qWhHQOxvgAVQgdsnJUDmUIuW8ra4qobElX+yokzR8SoTXBOF8r7JK
 pf/g==
X-Gm-Message-State: APjAAAXLawqQcIxwIbxymMZ+Q+DNSmj1HK1aH0h3mfSIfdoouEZECGm+
 R+dL4DQ5DEFQ5ZqE/w05JBIersB3kmpjhDKikfiOIuIw1y4=
X-Google-Smtp-Source: APXvYqwHo5ABzUnktKCPxHoyZ+vqUgH8VL9b7Y7iVDoy/LFuVORnHSqBtBUg2tMTGwGy65A+OhLbSKaMSSGxumPbH48=
X-Received: by 2002:a63:f643:: with SMTP id u3mr1012117pgj.291.1575473578299; 
 Wed, 04 Dec 2019 07:32:58 -0800 (PST)
MIME-Version: 1.0
From: felix nasch <felix.nasch@gmail.com>
Date: Wed, 4 Dec 2019 16:32:47 +0100
Message-ID: <CAMEmTtVgarS_H9Q7DM_VjpEqQZYsguA0unOrX42cPK3-kjDoSA@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] vmi: supporting single-stepping on AMD processors
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGFtIHdvcmtpbmcgb24gbWFraW5nIGxpYnZtaVsxXSB3b3JrIG9uIEFNRCwgYW5kIG9u
ZSBiaWcgaXNzdWUgaXMgdGhlIGxhY2sKb2Ygc3VwcG9ydCBmb3Igc2luZ2xlLXN0ZXBwaW5nIG9u
IEFNRCBwcm9jZXNzb3JzIGluIHRoZSB2bWkgYXBpIG9mZmVyZWQgYnkgeGVuLgpJIHRoaW5rIGkg
aGF2ZSBhIHdheSB0byBnZXQgaXQgdG8gd29yaywgYW5kIEkgd291bGQgbGlrZSB0byBrbm93IGlm
IHlvdSBzZWUKYW55IGlzc3VlcyB3aXRoIHRoaXMgYXBwcm9hY2gsIGFuZCBpZiB0aGVyZSBpcyBh
bnkgcmVhc29uIGl0IGhhc250IGJlZW4KaW1wbGVtZW50ZWQgbGlrZSB0aGlzLgoKTG9va2luZyBh
dCB0aGUgY29kZSB0aGUgcmVhc29uIHdoeSBzaW5nbGUtc3RlcHBpbmcgd29ya3MgZm9yIGludGVs
LApidXQgbm90IGZvciBhbWQgc2VlbXMgdG8gYmUgdGhhdCBJbnRlbC12dHggaGFzIHRoZSBoYW5k
eQonTW9uaXRvciBUcmFwIEZsYWcnIChNVEYpLCB3aGlsZSBBTUQgZG9lcyBub3Qgb2ZmZXIgc3Vj
aCBhIGZlYXR1cmUgaW4gU1ZNLgpPbiBJbnRlbCwgaWYgdGhlIE1URiBpcyBzZXQsIGFmdGVyIG9u
ZSBndWVzdCBpbnN0cnVjdGlvbiB0aGVyZSBpcyBhCnZtZXhpdCB3aXRoIHJlYXNvbgpFWElUX1JF
QVNPTl9NT05JVE9SX1RSQVBfRkxBRywgd2hpY2ggaXMgdGhlbiBkaXJlY3RseSBwYXNzZWQgdXAg
YXMgYQpIVk1fTU9OSVRPUl9TSU5HTEVTVEVQX0JSRUFLUE9JTlQgZXZlbnQuCgpTdHVkeWluZyB0
aGUgQU1EIG1hbnVhbCBhbmQgcmVhZGluZyBiZXR3ZWVuIHRoZSBsaW5lcyBhIGJpdCBJIHNlZSB0
aGUKZm9sbG93aW5nIHdheSB0byBpbXBsZW1lbnQgc2luZ2xlIHN0ZXBwaW5nIG9uIEFNRDoKCkFN
RCBNYW51YWwgMTUuNiNWTUVYSVQ6Cj4gV2hlbiBWTVJVTiBsb2FkcyBhIGd1ZXN0IHZhbHVlIG9m
IDEgaW4KPiBFRkxBR1MuVEYsIHRoYXQgdmFsdWUgZG9lcyBub3QgY2F1c2UgYSB0cmFjZSB0cmFw
IGJldHdlZW4KPiB0aGUgVk1SVU4gYW5kIHRoZSBmaXJzdCBndWVzdAo+IGluc3RydWN0aW9uLCBi
dXQgcmF0aGVyIGFmdGVyIGNvbXBsZXRpb24gb2YgdGhlIGZpcnN0IGd1ZXN0IGluc3RydWN0aW9u
LgoKU286CgoxLiBjaGVjayBpZiBndWVzdCBoYXMgcmZsYWdzLnRmIHNldAoyLiBzZXQgcmZsYWdz
LnRmIGluIHRoZSBndWVzdCBjb250ZXh0CjMuIGNvbnRpbnVlCjQuIGdldCBhIHZtZXhpdCB3aXRo
IGV4Y2VwdGlvbiAjREIKNS4gaWYgcmZsYWdzLnRmIHdhcyBpbml0aWFsbHkgc2V0LCByZS1pbmpl
Y3QgdGhlIGV2ZW50IGludG8gdGhlIGd1ZXN0Cih0byBub3QgaW50ZXJmZXJlIHdpdGggc3RhbmRh
cmQgc2luZ2xlc3RlcHBpbmcgaW5zaWRlIHRoZSBndWVzdCkKNi4gZW1pdCBIVk1fTU9OSVRPUl9T
SU5HTEVTVEVQX0JSRUFLUE9JTlQKCk1vc3Qgb2YgdGhlIGNvZGUgdGhhdCB3b3VsZCBiZSBuZWVk
ZWQgaXMgYWxyZWFkeSB0aGVyZSBpbiBzdm0uYywKaSBhbSBwcmVwYXJpbmcgYSBwYXRjaCB0byBp
bXBsZW1lbnQgaXQgYXMgSSBpbWFnaW5lIGl0IGFib3ZlLCBidXQgaXQgd2lsbCB0YWtlCm1lIHNv
bWUgdGltZSB0byB0ZXN0IGl0LgoKU28gaXMgdGhlcmUgYW55IHJlYXNvbiBpdCBoYXMgbm90IGJl
ZW4gaW1wbGVtZW50ZWQgbGlrZSB0aGF0IGFscmVhZHksCmFuZCB3b3VsZCB5b3UgZ2VuZXJhbGx5
IGFjY2VwdCBpdCB0byBiZSBkb25lIGxpa2UgdGhpcz8KCmJlc3QsCmYuCgpbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL2xpYnZtaS9saWJ2bWkKCnAucy4gTG9va2luZyBhdCB0aGUgZGVidWdnZXIgdGhh
dCBjb21lcyB3aXRoIHZpcnR1YWxib3gsIHRoZXkgc2VlbSB0bwppbXBsZW1lbnQgaXQgbGlrZSB0
aGlzIHRvbyAoaG93ZXZlciwgdGhlIGVudGlyZSBkZWJ1Z2dlciBzZWVtcyB0byBiZSBpbgphIGJy
b2tlbiBzdGF0ZSByaWdodCBub3cpOgoKc3JjL1ZCb3gvVk1NL1ZNTVIwL0hNVk1YUjAuY3BwOjQw
ODUKIDQwNzkgICAgIGlmIChwVkNwdS0+aG0ucy5mU2luZ2xlSW5zdHJ1Y3Rpb24pCiA0MDgwICAg
ICB7CiA0MDgxICAgICAgICAgLyogSWYgdGhlIENQVSBzdXBwb3J0cyB0aGUgbW9uaXRvciB0cmFw
IGZsYWcsIHVzZSBpdCBmb3IKc2luZ2xlIHN0ZXBwaW5nIGluIERCR0YgYW5kIGF2b2lkIGludGVy
Y2VwdGluZyAjREIuICovCiA0MDgyICAgICAgICAgUFZNIHBWTSA9IHBWQ3B1LT5DVFhfU1VGRihw
Vk0pOwogNDA4MyAgICAgICAgIGlmIChwVk0tPmhtLnMudm14Lk1zcnMuUHJvY0N0bHMubi5hbGxv
d2VkMSAmClZNWF9QUk9DX0NUTFNfTU9OSVRPUl9UUkFQX0ZMQUcpCiA0MDg0ICAgICAgICAgewog
NDA4NSAgICAgICAgICAgICB1UHJvY0N0bHMgfD0gVk1YX1BST0NfQ1RMU19NT05JVE9SX1RSQVBf
RkxBRzsKIDQwODYgICAgICAgICAgICAgQXNzZXJ0KGZTdGVwcGluZ0RCID09IGZhbHNlKTsKIDQw
ODcgICAgICAgICB9CiA0MDg4ICAgICAgICAgZWxzZQogNDA4OSAgICAgICAgIHsKIDQwOTAgICAg
ICAgICAgICAgcFZDcHUtPmNwdW0uR3N0Q3R4LmVmbGFncy51MzIgfD0gWDg2X0VGTF9URjsKIDQw
OTEgICAgICAgICAgICAgcFZDcHUtPmhtLnMuZkN0eENoYW5nZWQgfD0gSE1fQ0hBTkdFRF9HVUVT
VF9SRkxBR1M7CiA0MDkyICAgICAgICAgICAgIHBWQ3B1LT5obS5zLmZDbGVhclRyYXBGbGFnID0g
dHJ1ZTsKIDQwOTMgICAgICAgICAgICAgZlN0ZXBwaW5nREIgPSB0cnVlOwogNDA5NCAgICAgICAg
IH0KIDQwOTUgICAgIH0KIDQwOTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
