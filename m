Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D11247F
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 00:16:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMJy3-0006Z5-7n; Thu, 02 May 2019 22:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+so=TC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hMJy2-0006Yr-5D
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:14:14 +0000
X-Inumbo-ID: 986a9858-6d27-11e9-b267-c7208b91b2a5
Received: from mail-it1-f195.google.com (unknown [209.85.166.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 986a9858-6d27-11e9-b267-c7208b91b2a5;
 Thu, 02 May 2019 22:14:04 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id l140so6206989itb.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 15:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzSLo//LL4ffZ4M/WYluBnoL9/iZ0VjsIt2rD4H8Zj0=;
 b=rf1rwyd/II3dEm4cxDCvrtp4cveaQ+eS/6O49ekMvxqT2iYyLWrXGtgy+wd3/YsM4u
 2xQFxvDK1NhmNCPkcwMPdf2HRh6iFNSpd2yN7jC4LHiE7DEexjt1FTugA85i9Cce3ay/
 VIeb48TniGkVr01nlVXZAcyaMRmly2HGirO67TuFEDtEBN0lT0iEcXbAc6d3BaTgQxbN
 kmUvVPd3Cy/sxs6O9hX085TMIWBXLxPotC9yzVVNx5p+M+BkaCVfkrbptV2XVXRCc1no
 E2+kuYmgrnREMcf0I+ftbURwiJ7zRBEt1UeCLgoCj/HIU/TGOcuAu3578z4NzGzRbAVI
 u5jA==
X-Gm-Message-State: APjAAAUez4sY2gPMjzYzmzgawGUbTt/2TKXk03Vz7s3lBPttLK1cvfr5
 1paDX2vL9zQmbtQrtFrtVGuoLVRB
X-Google-Smtp-Source: APXvYqwC9rT480wsWGXgd4BUsYiDpg/jdVeijCjYYQpkZkVVV3nedjj2oknktO9FvkjPMr1gkscVog==
X-Received: by 2002:a05:660c:11c5:: with SMTP id
 p5mr3881742itm.64.1556835242963; 
 Thu, 02 May 2019 15:14:02 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id n199sm239715itn.34.2019.05.02.15.14.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:14:02 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 16:13:43 -0600
Message-Id: <20190502221345.18459-2-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502221345.18459-1-tamas@tklengyel.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggY2Y0YjMwZGNhMGEgIkFkZCBkZWJ1ZyBjb2RlIHRvIGRldGVjdCBpbGxlZ2FsIHBhZ2Vf
bG9jayBhbmQgcHV0X3BhZ2VfdHlwZQpvcmRlcmluZyIgYWRkZWQgZXh0cmEgc2FuaXR5IGNoZWNr
aW5nIHRvIHBhZ2VfbG9jay9wYWdlX3VubG9jayBmb3IgZGVidWcgYnVpbGRzCndpdGggdGhlIGFz
c3VtcHRpb24gdGhhdCBubyBoeXBlcnZpc29yIHBhdGggZXZlciBsb2NrcyB0d28gcGFnZXMgYXQg
b25jZS4KClRoaXMgYXNzdW1wdGlvbiBkb2Vzbid0IGhvbGQgZHVyaW5nIG1lbW9yeSBzaGFyaW5n
IHNvIHdlIGNvcHkgYSB2ZXJzaW9uIG9mCnBhZ2VfbG9jay91bmxvY2sgdG8gYmUgdXNlZCBleGNs
dXNpdmVseSBpbiB0aGUgbWVtb3J5IHNoYXJpbmcgc3Vic3lzdGVtCndpdGhvdXQgdGhlIHNhbml0
eSBjaGVja3MuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
Q2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L21tL21lbV9zaGFyaW5nLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgfCAxNCArLS0tLS0tLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X3NoYXJpbmcuYwppbmRleCA0YjNhMDk0NDgxLi5iYWFlN2NlZWRhIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYwpAQCAtMTEyLDEzICsxMTIsNDggQEAgc3RhdGljIGlubGluZSB2b2lkIHBhZ2Vfc2hhcmlu
Z19kaXNwb3NlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiAKICNlbmRpZiAvKiBNRU1fU0hBUklO
R19BVURJVCAqLwogCi1zdGF0aWMgaW5saW5lIGludCBtZW1fc2hhcmluZ19wYWdlX2xvY2soc3Ry
dWN0IHBhZ2VfaW5mbyAqcGcpCisvKgorICogUHJpdmF0ZSBpbXBsZW1lbnRhdGlvbnMgb2YgcGFn
ZV9sb2NrL3VubG9jayB0byBieXBhc3MgUFYtb25seQorICogc2FuaXR5IGNoZWNrcyBub3QgYXBw
bGljYWJsZSB0byBtZW0tc2hhcmluZy4KKyAqLworc3RhdGljIGlubGluZSBib29sIF9wYWdlX2xv
Y2soc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKIHsKLSAgICBpbnQgcmM7CisgICAgdW5zaWduZWQg
bG9uZyB4LCBueDsKKworICAgIGRvIHsKKyAgICAgICAgd2hpbGUgKCAoeCA9IHBhZ2UtPnUuaW51
c2UudHlwZV9pbmZvKSAmIFBHVF9sb2NrZWQgKQorICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cisg
ICAgICAgIG54ID0geCArICgxIHwgUEdUX2xvY2tlZCk7CisgICAgICAgIGlmICggISh4ICYgUEdU
X3ZhbGlkYXRlZCkgfHwKKyAgICAgICAgICAgICAhKHggJiBQR1RfY291bnRfbWFzaykgfHwKKyAg
ICAgICAgICAgICAhKG54ICYgUEdUX2NvdW50X21hc2spICkKKyAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKKyAgICB9IHdoaWxlICggY21weGNoZygmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8sIHgs
IG54KSAhPSB4ICk7CisKKyAgICByZXR1cm4gdHJ1ZTsKK30KKworc3RhdGljIGlubGluZSB2b2lk
IF9wYWdlX3VubG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQoreworICAgIHVuc2lnbmVkIGxv
bmcgeCwgbngsIHkgPSBwYWdlLT51LmludXNlLnR5cGVfaW5mbzsKKworICAgIGRvIHsKKyAgICAg
ICAgeCA9IHk7CisgICAgICAgIEFTU0VSVCgoeCAmIFBHVF9jb3VudF9tYXNrKSAmJiAoeCAmIFBH
VF9sb2NrZWQpKTsKKworICAgICAgICBueCA9IHggLSAoMSB8IFBHVF9sb2NrZWQpOworICAgICAg
ICAvKiBXZSBtdXN0IG5vdCBkcm9wIHRoZSBsYXN0IHJlZmVyZW5jZSBoZXJlLiAqLworICAgICAg
ICBBU1NFUlQobnggJiBQR1RfY291bnRfbWFzayk7CisgICAgfSB3aGlsZSAoICh5ID0gY21weGNo
ZygmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8sIHgsIG54KSkgIT0geCApOworfQorCitzdGF0aWMg
aW5saW5lIGJvb2wgbWVtX3NoYXJpbmdfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBnKQor
eworICAgIGJvb2wgcmM7CiAgICAgcGdfbG9ja19kYXRhX3QgKnBsZCA9ICYodGhpc19jcHUoX19w
bGQpKTsKIAogICAgIHBhZ2Vfc2hhcmluZ19tbV9wcmVfbG9jaygpOwotICAgIHJjID0gcGFnZV9s
b2NrKHBnKTsKKyAgICByYyA9IF9wYWdlX2xvY2socGcpOwogICAgIGlmICggcmMgKQogICAgIHsK
ICAgICAgICAgcHJlZW1wdF9kaXNhYmxlKCk7CkBAIC0xMzUsNyArMTcwLDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBnKQog
ICAgIHBhZ2Vfc2hhcmluZ19tbV91bmxvY2socGxkLT5tbV91bmxvY2tfbGV2ZWwsIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnBsZC0+cmVjdXJzZV9jb3VudCk7CiAgICAgcHJlZW1wdF9l
bmFibGUoKTsKLSAgICBwYWdlX3VubG9jayhwZyk7CisgICAgX3BhZ2VfdW5sb2NrKHBnKTsKIH0K
IAogc3RhdGljIGlubGluZSBzaHJfaGFuZGxlX3QgZ2V0X25leHRfaGFuZGxlKHZvaWQpCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21t
LmgKaW5kZXggNmZhYTU2MzE2Ny4uN2RjN2UzM2Y3MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtMzU2LDI0ICsz
NTYsMTIgQEAgc3RydWN0IHBsYXRmb3JtX2JhZF9wYWdlIHsKIGNvbnN0IHN0cnVjdCBwbGF0Zm9y
bV9iYWRfcGFnZSAqZ2V0X3BsYXRmb3JtX2JhZHBhZ2VzKHVuc2lnbmVkIGludCAqYXJyYXlfc2l6
ZSk7CiAKIC8qIFBlciBwYWdlIGxvY2tzOgotICogcGFnZV9sb2NrKCkgaXMgdXNlZCBmb3IgdHdv
IHB1cnBvc2VzOiBwdGUgc2VyaWFsaXphdGlvbiwgYW5kIG1lbW9yeSBzaGFyaW5nLgorICogcGFn
ZV9sb2NrKCkgaXMgdXNlZCBmb3IgcHRlIHNlcmlhbGl6YXRpb24uCiAgKgogICogQWxsIHVzZXJz
IG9mIHBhZ2UgbG9jayBmb3IgcHRlIHNlcmlhbGl6YXRpb24gbGl2ZSBpbiBtbS5jLCB1c2UgaXQK
ICAqIHRvIGxvY2sgYSBwYWdlIHRhYmxlIHBhZ2UgZHVyaW5nIHB0ZSB1cGRhdGVzLCBkbyBub3Qg
dGFrZSBvdGhlciBsb2NrcyB3aXRoaW4KICAqIHRoZSBjcml0aWNhbCBzZWN0aW9uIGRlbGltaXRl
ZCBieSBwYWdlX2xvY2svdW5sb2NrLCBhbmQgcGVyZm9ybSBubwogICogbmVzdGluZy4KLSAqCi0g
KiBBbGwgdXNlcnMgb2YgcGFnZSBsb2NrIGZvciBtZW1vcnkgc2hhcmluZyBsaXZlIGluIG1tL21l
bV9zaGFyaW5nLmMuIFBhZ2VfbG9jawotICogaXMgdXNlZCBpbiBtZW1vcnkgc2hhcmluZyB0byBw
cm90ZWN0IGFkZGl0aW9uIChzaGFyZSkgYW5kIHJlbW92YWwgKHVuc2hhcmUpCi0gKiBvZiAoZ2Zu
LGRvbWFpbikgdHVwcGxlcyB0byBhIGxpc3Qgb2YgZ2ZuJ3MgdGhhdCB0aGUgc2hhcmVkIHBhZ2Ug
aXMgY3VycmVudGx5Ci0gKiBiYWNraW5nLiBOZXN0aW5nIG1heSBoYXBwZW4gd2hlbiBzaGFyaW5n
IChhbmQgbG9ja2luZykgdHdvIHBhZ2VzIC0tIGRlYWRsb2NrCi0gKiBpcyBhdm9pZGVkIGJ5IGxv
Y2tpbmcgcGFnZXMgaW4gaW5jcmVhc2luZyBvcmRlci4KLSAqIEFsbCBtZW1vcnkgc2hhcmluZyBj
b2RlIHBhdGhzIHRha2UgdGhlIHAybSBsb2NrIG9mIHRoZSBhZmZlY3RlZCBnZm4gYmVmb3JlCi0g
KiB0YWtpbmcgdGhlIGxvY2sgZm9yIHRoZSB1bmRlcmx5aW5nIHBhZ2UuIFdlIGVuZm9yY2Ugb3Jk
ZXJpbmcgYmV0d2VlbiBwYWdlX2xvY2sKLSAqIGFuZCBwMm1fbG9jayB1c2luZyBhbiBtbS1sb2Nr
cy5oIGNvbnN0cnVjdC4KLSAqCi0gKiBUaGVzZSB0d28gdXNlcnMgKHB0ZSBzZXJpYWxpemF0aW9u
IGFuZCBtZW1vcnkgc2hhcmluZykgZG8gbm90IGNvbGxpZGUsIHNpbmNlCi0gKiBzaGFyaW5nIGlz
IG9ubHkgc3VwcG9ydGVkIGZvciBodm0gZ3Vlc3RzLCB3aGljaCBkbyBub3QgcGVyZm9ybSBwdiBw
dGUgdXBkYXRlcy4KICAqLwogaW50IHBhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKTsK
IHZvaWQgcGFnZV91bmxvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSk7Ci0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
