Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37A118CFC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehjs-0002qV-15; Tue, 10 Dec 2019 15:47:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehjq-0002qP-Rh
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:47:50 +0000
X-Inumbo-ID: 6b6c715a-1b64-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b6c715a-1b64-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 15:47:50 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l124so4839042qkf.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pWQY94SlKd279kFoDYFFayqdH1S0YXpkUwx3GmlVcMY=;
 b=dYMpIxMBngerX3cZYXfelR8NW7pymNSzDWCBvhSJjHNflLAF3EZjjdqocEYnnl140b
 CRxU0yUb0WOOSI4uOdzrjrVCYbjRZKRg9HXgq9g8PTmfM86Ds1/BtIljQw8HwHvO/9xe
 zmWIamyOHktxB7TYg2nlFP5SYsOKItI/yz8rKkgA7UaEkuewPzpigGor6hXYvVmlvnfb
 +ofTs+FYk0Q9nt1Ei+dvK+QhdyFCnL1g2c5iVpVY5HRaeRi9OLS9ElirqDwLZ0I2qytf
 IGkCWZI2xEElUyWCCLj91vQvbuKh/roF5bQORrIXY3e0mbIa31ljy4UB7TM6+Ee1kGmU
 9fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pWQY94SlKd279kFoDYFFayqdH1S0YXpkUwx3GmlVcMY=;
 b=JOwwWZyDPFnNMwPzwdSSJJZd1zs2ti6MmJu/qpNDj4Q6ORGx5afgzygGyHoO/mwKal
 KSNxlscczG1NcF3jX2bCHX0fNLaHZEdAeYs5h+QGmDl0VonUIbT3TtezGkoCmfAz/V7U
 Y42RIi8aeCqc7sq8Gnhtt0sIK0/U0dp4ZaiKn+pfflhESbajn4+qI9nC1Eyv3QqoKDFg
 Ox0M+WW9I1Bt8Kh84Cp5zo1ijEOuxtZJn5GcOaoekeHSfSyWRn4pEoaujHd/49X8QY71
 iUf3skszDPjcleMErTxT1PQIvof41+/j3MW+fQfdrSPiBv5R0vc6/HqCL3JF5kPFKH0j
 PxaA==
X-Gm-Message-State: APjAAAWI457JuUlMds9MWcor8xs25jPIBvyais+teekW/7UzyKClozYW
 g6egfV3TRzwVqsfOFcYf7fKQobf9
X-Google-Smtp-Source: APXvYqw3i0pjR8GOA5Sh/RN7NFsgklpnE4/80GLeP8f/+vFGHe1pAAg1D3QxjkLSVupGEHjNVbvqQA==
X-Received: by 2002:a05:620a:3cf:: with SMTP id
 r15mr33644612qkm.12.1575992869317; 
 Tue, 10 Dec 2019 07:47:49 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:47:48 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:15 -0500
Message-Id: <cover.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 00/22] generated Go libxl bindings using IDL
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkFmdGVyIFhlbiBz
dW1taXQsIHdlIHN0YXJ0ZWQgdGhlIGRpc2N1c3Npb24gaW4gdGhpc1sxXSBSRkMgdGhyZWFkCnRv
IGZpZ3VyZSBvdXQgaG93IHRvIGdlbmVyYXRlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bC4gVGhpcyBz
ZXJpZXMKaW1wbGVtZW50cyB0aGF0IEdvIGNvZGUgZ2VuZXJhdGlvbiB1c2luZyB0aGUgZXhpc3Rp
bmcgSURMLCBhbmQgdXBkYXRlcwp0aGUgZXhpc3RpbmcgaGFuZC13cml0dGVuIGNvZGUgaW4geGVu
bGlnaHQuZ28gdG8gdXNlIHRoZSBnZW5lcmF0ZWQKY29kZS4KClRoZSBnb2FsIG9mIHRoaXMgc2Vy
aWVzIGlzIHRvIHByb3ZpZGUgYSBnb29kIGZvdW5kYXRpb24gZm9yIGNvbnRpbnVlZApkZXZlbG9w
bWVudCBvZiB0aGUgR28gcGFja2FnZS4KClRoZSB2MSBzZXJpZXMgY2FuIGJlIGZvdW5kIG9uIG15
IEdpdEh1YiBicmFuY2hbMl0uCgpDaGFuZ2VzIGluIHYyOgotIEdpdEh1YiBicmFuY2ggZm9yIHYy
IFszXS4KLSBEcm9wIHBhdGNoIDAxLzI0IGZyb20gdjEgc2luY2Ugd2FzIGNvbW1pdHRlZCBhcyBh
IGJ1ZyBmaXggZm9yIDQuMTMuCi0gVGhlIE1ha2VmaWxlIGNoYW5nZXMgaW4gMjQvMjQgZnJvbSB2
MSBoYXZlIGJlZW4gbW92ZWQgdG8gdGhlIHBhdGNoZXMKICB3aGVyZSB0aGUgYnVpbGQgY2hhbmdl
cyBhcmUgaW50cm9kdWNlZC4KCkNoYW5nZXMgaW4gdjM6Ci0gR2l0SHViIGJyYW5jaCBmb3IgdjMg
WzRdLgotIFNpbXBsaWZ5IGEgcGF0dGVybiBmb3IgaXRlcmF0aW5nIG92ZXIgYnVpbHRpbiB0eXBl
cwogIGluIHRoZWlyIGZyb21DIGZ1bmN0aW9ucy4KLSBUcnkgbm90IHRvIGR1cGxpY2F0ZSBhcyBt
dWNoIGNvZGUgaW4gZ2VuZ290eXBlcy5weSwgYW5kCiAgdXNlIGNvbnNpc3RlbnQgc3R5bGUgaW4g
Z2VuZXJhdGVkIGNvZGUgd2hlbiBjYWxsaW5nIGZyb21DLgoKWzFdIGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMjI1OS5odG1s
ClsyXSBodHRwczovL2dpdGh1Yi5jb20vZW5yMG4veGVuL3RyZWUvZ29sYW5nLXBhdGNoZXMtdjEK
WzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9lbnIwbi94ZW4vdHJlZS9nb2xhbmctcGF0Y2hlcy12Mgpb
NF0gaHR0cHM6Ly9naXRodWIuY29tL2VucjBuL3hlbi90cmVlL2dvbGFuZy1wYXRjaGVzLXYzCgpO
aWNrIFJvc2Jyb29rICgyMik6CiAgZ29sYW5nL3hlbmxpZ2h0OiBnZW5lcmF0ZSBlbnVtIHR5cGVz
IGZyb20gSURMCiAgZ29sYW5nL3hlbmxpZ2h0OiBkZWZpbmUgRGVmYm9vbCBidWlsdGluIHR5cGUK
ICBnb2xhbmcveGVubGlnaHQ6IGRlZmluZSBEZXZpZCB0eXBlIGFzIGludAogIGdvbGFuZy94ZW5s
aWdodDogZGVmaW5lIEtleVZhbHVlTGlzdCBhcyBlbXB0eSBzdHJ1Y3QKICBnb2xhbmcveGVubGln
aHQ6IHJlLW5hbWUgQml0bWFwIG1hcnNoYWxpbmcgZnVuY3Rpb25zCiAgZ29sYW5nL3hlbmxpZ2h0
OiBkZWZpbmUgU3RyaW5nTGlzdCBidWlsdGluIHR5cGUKICBnb2xhbmcveGVubGlnaHQ6IGRlZmlu
ZSBNYWMgYnVpbHRpbiB0eXBlCiAgZ29sYW5nL3hlbmxpZ2h0OiBkZWZpbmUgTXNWbUdlbmlkIGJ1
aWx0aW4gdHlwZQogIGdvbGFuZy94ZW5saWdodDogZGVmaW5lIEV2TGluayBidWlsdGluIGFzIGVt
cHR5IHN0cnVjdAogIGdvbGFuZy94ZW5saWdodDogZGVmaW5lIENwdWlkUG9saWN5TGlzdCBidWls
dGluIHR5cGUKICBnb2xhbmcveGVubGlnaHQ6IHJlLWZhY3RvciBVdWlkIHR5cGUgaW1wbGVtZW50
YXRpb24KICBnb2xhbmcveGVubGlnaHQ6IHJlLWZhY3RvciBId2NhcCB0eXBlIGltcGxlbWVudGF0
aW9uCiAgZ29sYW5nL3hlbmxpZ2h0OiBnZW5lcmF0ZSBzdHJ1Y3RzIGZyb20gdGhlIElETAogIGdv
bGFuZy94ZW5saWdodDogcmVtb3ZlIG5vLWxvbmdlciB1c2VkIHR5cGUgTWVtS0IKICBnb2xhbmcv
eGVubGlnaHQ6IGJlZ2luIEMgdG8gR28gdHlwZSBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0
OiBpbXBsZW1lbnQga2V5ZWQgdW5pb24gQyB0byBHbyBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxp
Z2h0OiBpbXBsZW1lbnQgYXJyYXkgQyB0byBHbyBtYXJzaGFsaW5nCiAgZ29sYW5nL3hlbmxpZ2h0
OiBiZWdpbiBHbyB0byBDIHR5cGUgbWFyc2hhbGluZwogIGdvbGFuZy94ZW5saWdodDogaW1wbGVt
ZW50IGtleWVkIHVuaW9uIEdvIHRvIEMgbWFyc2hhbGluZwogIGdvbGFuZy94ZW5saWdodDogaW1w
bGVtZW50IGFycmF5IEdvIHRvIEMgbWFyc2hhbGluZwogIGdvbGFuZy94ZW5saWdodDogcmV2aXNl
IHVzZSBvZiBDb250ZXh0IHR5cGUKICBnb2xhbmcveGVubGlnaHQ6IGFkZCBlcnJvciByZXR1cm4g
dHlwZSB0byBDb250ZXh0LkNwdXBvb2xpbmZvCgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L01ha2Vm
aWxlICAgICAgIHwgICAyMCArLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkg
IHwgIDY3NyArKysrKysKIHRvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbyB8IDMy
NDYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL2dvbGFuZy94ZW5saWdodC90eXBl
cy5nZW4uZ28gICB8IDEyMjQgKysrKysrKysrKwogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvICAgIHwgIDkwMSArKystLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDU1MzEgaW5zZXJ0aW9u
cygrKSwgNTM3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2dvbGFuZy94
ZW5saWdodC9nZW5nb3R5cGVzLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L2hlbHBlcnMuZ2VuLmdvCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3R5cGVzLmdlbi5nbwoKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
