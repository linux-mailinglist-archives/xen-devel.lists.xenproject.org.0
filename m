Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD04E8C34
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:57:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTpZ-0007rr-MB; Tue, 29 Oct 2019 15:54:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTpY-0007re-AM
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:54:48 +0000
X-Inumbo-ID: 6bc31436-fa64-11e9-9515-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bc31436-fa64-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572364482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZR45FU35HCPbHmWm0KPTx11HKSVXNe4eSg/I2MEekJg=;
 b=RKuZ/g9AkDT8Zq05VHALgexhNGT2rehPDD4xvZBo8A+rSWQw6wnFBjks
 o0FqRBapOKgKM5+NNo0QHGVTfTg3Admw33Rh2FKUf9iY66TIDCVERw9ep
 k1mzuwH51tuYNMrfXYiuUibMH8kwuKs8cYez7L+AmfJ/QlJAUqrPKNUW+ w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2P9tjs7prv3z/+RJgQ1M26wA1mi2u1dv0SqOZxvl1pCZUg6JSrfT2Z/HsTK43J/V+PAjVfG+cJ
 TRy3NeSQA88m/iPoNFdJgGW5qPk/+yVd2IThfJm1fuphY0MOvxVJHs5a42Ms4UoluqSjJ0VAjK
 UzgDI1g/2FAnDTctOm3Ds+ozCuii2qpSbpcAinK8RcffbmiPabjR22+pBaahKtS+BJO0krI6cf
 WpfXKKkoC7n9kaRR893EhxVj8saPFVEPZzwt4kkq68XNmIaG9oddc5ej8NW7hXydhO9LJQI3fS
 8DM=
X-SBRS: 2.7
X-MesageID: 7935320
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7935320"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 29 Oct 2019 15:54:35 +0000
Message-ID: <20191029155436.14376-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <23992.24295.523533.643279@mariner.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 3/4] libxl: gentypes.py: Break
 out libxl_C_type_do_init
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBnb2luZyB0byBiZSB0aGUgY29tbW9uIHdheSB0byBpbml0aWFsaXNlIHRoaW5ncy4K
X2xpYnhsX0NfdHlwZV9pbml0IHJlbWFpbnMgdGhlIHRoaW5nIGZvciBnZW5lcmF0aW5nIHRoZSBi
b2R5IG9mIHRoZQppbml0IGZ1bmN0aW9uLCBhbmQgZm9yIHNvbWUgc3BlY2lhbCBjYXNlcy4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlIHdpdGggZXhpc3RpbmcgdHlwZXM6IEMgb3V0cHV0IGlzIGlkZW50
aWNhbC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgotLS0KIHRvb2xzL2xpYnhsL2dlbnR5cGVzLnB5IHwgMjMgKysrKysrKysrKysrKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5IGIvdG9vbHMvbGlieGwvZ2VudHlw
ZXMucHkKaW5kZXggNjI4ODNhY2IyZS4uMTI0Mjg1Y2Q2NiAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvZ2VudHlwZXMucHkKKysrIGIvdG9vbHMvbGlieGwvZ2VudHlwZXMucHkKQEAgLTE2NSw2ICsx
NjUsMTkgQEAgZGVmIGxpYnhsX2luaXRfbWVtYmVycyh0eSwgbmVzdGluZyA9IDApOgogICAgIGVs
c2U6CiAgICAgICAgIHJldHVybiBbXQogICAgIAorZGVmIGxpYnhsX0NfdHlwZV9kb19pbml0KHR5
LCBwYXNzX2FyZywgbmVlZF96ZXJvPVRydWUsIGluZGVudD0iICAgICIpOgorICAgIHM9aW5kZW50
CisgICAgaWYgdHkuaW5pdF92YWwgaXMgbm90IE5vbmU6CisgICAgICAgIHMrPSAiJXMgPSAlcztc
biIgJSAocGFzc19hcmcoaWRsLlBBU1NfQllfVkFMVUUpLCB0eS5pbml0X3ZhbCkKKyAgICBlbGlm
IHR5LmluaXRfZm4gaXMgbm90IE5vbmU6CisgICAgICAgIHMrPSAiJXMoJXMpO1xuIiAlICh0eS5p
bml0X2ZuLCBwYXNzX2FyZyhpZGwuUEFTU19CWV9SRUZFUkVOQ0UpKQorICAgIGVsaWYgbmVlZF96
ZXJvOgorICAgICAgICBwdHIgPSBwYXNzX2FyZyhpZGwuUEFTU19CWV9SRUZFUkVOQ0UpCisgICAg
ICAgIHMrPSAibWVtc2V0KCVzLCAwLCBzaXplb2YoKiVzKSk7XG4iICUgKHB0ciwgcHRyKQorICAg
IGVsc2U6CisgICAgICAgIHM9IiIKKyAgICByZXR1cm4gcworCiBkZWYgX2xpYnhsX0NfdHlwZV9p
bml0KHR5LCB2LCBpbmRlbnQgPSAiICAgICIsIHBhcmVudCA9IE5vbmUsIHN1YmluaXQ9RmFsc2Up
OgogICAgIHMgPSAiIgogICAgIGlmIGlzaW5zdGFuY2UodHksIGlkbC5LZXllZFVuaW9uKToKQEAg
LTMwOSwxNSArMzIyLDcgQEAgZGVmIGxpYnhsX0NfdHlwZV9jb3B5X2RlcHJlY2F0ZWQoZmllbGQs
IHYsIGluZGVudCA9ICIgICAgIiwgdnBhcmVudCA9IE5vbmUpOgogICAgICAgICBpZiBmaWVsZC50
eXBlLmRpc3Bvc2VfZm4gaXMgbm90IE5vbmU6CiAgICAgICAgICAgICBzKz0gIiAgICAlcyglcyk7
XG4iICUgKGZpZWxkLnR5cGUuZGlzcG9zZV9mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZmllbGQudHlwZS5wYXNzX2FyZyh2LCB2cGFyZW50IGlzIE5vbmUpKQotCi0gICAg
ICAgIHMrPSAiICAgICIKLSAgICAgICAgaWYgZmllbGQudHlwZS5pbml0X3ZhbCBpcyBub3QgTm9u
ZToKLSAgICAgICAgICAgIHMrPSAiJXMgPSAlcztcbiIgJSAoZmllbGRfdmFsLCBmaWVsZC50eXBl
LmluaXRfdmFsKQotICAgICAgICBlbGlmIGZpZWxkLnR5cGUuaW5pdF9mbiBpcyBub3QgTm9uZToK
LSAgICAgICAgICAgIHMrPSAiJXMoJXMpO1xuIiAlIChmaWVsZC50eXBlLmluaXRfZm4sIGZpZWxk
X3B0cikKLSAgICAgICAgZWxzZToKLSAgICAgICAgICAgIHMrPSAibWVtc2V0KCVzLCAwLCBzaXpl
b2YoKiVzKSk7XG4iICUgKGZpZWxkX3B0ciwgZmllbGRfcHRyKQotCisgICAgICAgIHMrPWxpYnhs
X0NfdHlwZV9kb19pbml0KGZpZWxkLnR5cGUsIGZpZWxkX3Bhc3MpCiAgICAgICAgIHMrPSAifVxu
IgogCiAgICAgaWYgcyAhPSAiIjoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
