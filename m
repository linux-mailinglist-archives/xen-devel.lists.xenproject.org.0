Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FC2110336
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 18:13:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBh6-0005nc-8Z; Tue, 03 Dec 2019 17:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nD+/=ZZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icBh5-0005nW-D2
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 17:10:35 +0000
X-Inumbo-ID: d175aa68-15ef-11ea-83b8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d175aa68-15ef-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575393034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TmnJjk8TXAnHsrvKb3/LuWmnRZTU1I2EhQp5z4x3XNo=;
 b=LZHCLhYCm5Ba0Nk1p0I//MTXl4+4ITWy6E75UBMn8Ua0a1KAWk/9vBmX
 fXS82dlTiA6IUI+uThFcStPoMpAE45B8DTJ0AYeCSzegef6tWrfezbKv6
 TJcdQovVf/YMNYmpctn91eeQTmLxfCzAZ2fo2bhz2KUp7fw9FCITuvvm7 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EeLNxnzLXLNw+BHg+r2fccFZD2vMS8c8i5yBIKoLiDVKQAzYHy6+iK5cS3yqyptE07JSIkBRIN
 sn18PnEUrrHfLzcKrxMdBaVM/c3R8iBq0mUo3Q+xmiqXF8feEVYFXVq0wTm+5Zxem9YfNSuuIA
 dcaGL/P7cFv8j4mF55GZb+naNWGqZKi+nNmBvDV6H7LxCctCmDrx989d5Icxef0zABTjvWME2b
 ZmQ39AHqahIPENumlE7kSoNjdcrTLJG+UpSrrAXxV59xWN0KreNjFCiC3DOZsFcZ2ikvVb7+rC
 RkQ=
X-SBRS: 2.7
X-MesageID: 9491797
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,273,1571716800"; 
   d="scan'208";a="9491797"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 17:10:30 +0000
Message-ID: <20191203171030.11680-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGlrZSAlY3IyIGZvciBwYWdlZmF1bHRzLCAlZHI2IGNvbnRhaW5zIGFuY2lsbGFyeSBpbmZvcm1h
dGlvbiBmb3IgZGVidWcKZXhjZXB0aW9ucywgYW5kIG5lZWRzIHNpbWlsYXIgaGFuZGxpbmcuCgpG
b3IgeGVuZGV2aWNlbW9kZWxfaW5qZWN0X2V2ZW50KCksIG5vIEFCSSBjaGFuZ2UgaXMgbmVlZGVk
IChhbHRob3VnaCBhbiBBUEkKb25lIHdvdWxkIGJlIGlkZWFsKS4gIFN3aXRjaCBmcm9tICdjcjIn
IHRvICdleHRyYScgaW4gdmFyaWFibGUgbmFtZXMgd2hpY2gKZG9uJ3QgY29uc3RpdHV0ZSBhbiBB
UEkgY2hhbmdlLCBhbmQgdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIHRvIG1hdGNoLgoKRm9yIHRo
ZSBtb25pdG9yIGludGVyZmFjZSwgdm1fZXZlbnRfZGVidWcgbmVlZHMgZXh0ZW5kaW5nIHdpdGgg
YSBwZW5kaW5nX2RiZwpmaWVsZC4gIEV4dGVuZCBodm1fbW9uaXRvcl9kZWJ1ZygpIGFuZCBmb3Ig
bm93LCBhbHdheXMgcGFzcyBpbiAwIC0gdGhpcyB3aWxsCmJlIGZpeGVkIGV2ZW50dWFsbHksIHdo
ZW4gb3RoZXIgaHlwZXJ2aXNvciBidWdmaXhlcyBhcmUgY29tcGxldGUuCgpXaGlsZSBtb2RpZnlp
bmcgaHZtX21vbml0b3JfZGVidWcoKSwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gY29ycmVjdCB0
cmFwIHR5cGUKYW5kIGluc3RydWN0aW9uIGxlbmd0aCBmcm9tIHVuc2lnbmVkIGxvbmcgdG8gdW5z
aWduZWQgaW50LCBhcyB0aGV5IGFyZSBib3RoCnRpbnkgdmFsdWVzLgoKRmluYWxseSwgYWRqdXN0
IHhlbi1hY2Nlc3MuYyB0byB0aGUgbmV3IGV4cGVjdGF0aW9ucy4gIEludHJvc3BlY3Rpb24gdG9v
bHMKaW50ZXJjZXB0aW5nIGRlYnVnIGV4Y2VwdGlvbnMgc2hvdWxkIG1pcnJvciB0aGUgbmV3IHBl
bmRpbmdfZGJnIGZpZWxkIGludG8KeGVuZGV2aWNlbW9kZWxfaW5qZWN0X2V2ZW50KCkgZm9yICVk
cjYgdG8gYmUgcHJvY2Vzc2VkIGNvcnJlY3RseSBmb3IgdGhlCmd1ZXN0LgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBSYXp2YW4gQ29qb2Nh
cnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+CkNDOiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT4KQ0M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CkND
OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KCkknbSBleHBlY3RpbmcgdG8g
Y29tbWl0IHRoaXMgYWxvbmdzaWRlICJ4ODYvc3ZtOiBDb3JyZWN0IHZtX2V2ZW50IEFQSSBmb3IK
ZGVzY3JpcHRvciBhY2Nlc3NlcyIgd2hpY2ggY292ZXJzIHRoZSBidW1wIG9mIHRoZSBWTV9FVkVO
VCBpbnRlcmZhY2UgdmVyc2lvbi4KLS0tCiB0b29scy9saWJzL2RldmljZW1vZGVsL2NvcmUuYyAg
ICAgICAgICAgICAgICAgICB8IDQgKystLQogdG9vbHMvbGlicy9kZXZpY2Vtb2RlbC9pbmNsdWRl
L3hlbmRldmljZW1vZGVsLmggfCA0ICsrLS0KIHRvb2xzL3Rlc3RzL3hlbi1hY2Nlc3MveGVuLWFj
Y2Vzcy5jICAgICAgICAgICAgIHwgNyArKysrLS0tCiB4ZW4vYXJjaC94ODYvaHZtL21vbml0b3Iu
YyAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrLQogeGVuL2FyY2gveDg2L2h2bS9zdm0vc3Zt
LmMgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jICAgICAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL21vbml0b3IuaCAgICAgICAgICAgICAgIHwgMyArKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9o
dm0vZG1fb3AuaCAgICAgICAgICAgICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvcHVibGljL3Zt
X2V2ZW50LmggICAgICAgICAgICAgICAgICAgfCAxICsKIDkgZmlsZXMgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9kZXZp
Y2Vtb2RlbC9jb3JlLmMgYi90b29scy9saWJzL2RldmljZW1vZGVsL2NvcmUuYwppbmRleCBmNzZl
M2QzMDVlLi5kYjUwMWQ5ZTgwIDEwMDY0NAotLS0gYS90b29scy9saWJzL2RldmljZW1vZGVsL2Nv
cmUuYworKysgYi90b29scy9saWJzL2RldmljZW1vZGVsL2NvcmUuYwpAQCAtNTM2LDcgKzUzNiw3
IEBAIGludCB4ZW5kZXZpY2Vtb2RlbF9zZXRfbWVtX3R5cGUoCiAKIGludCB4ZW5kZXZpY2Vtb2Rl
bF9pbmplY3RfZXZlbnQoCiAgICAgeGVuZGV2aWNlbW9kZWxfaGFuZGxlICpkbW9kLCBkb21pZF90
IGRvbWlkLCBpbnQgdmNwdSwgdWludDhfdCB2ZWN0b3IsCi0gICAgdWludDhfdCB0eXBlLCB1aW50
MzJfdCBlcnJvcl9jb2RlLCB1aW50OF90IGluc25fbGVuLCB1aW50NjRfdCBjcjIpCisgICAgdWlu
dDhfdCB0eXBlLCB1aW50MzJfdCBlcnJvcl9jb2RlLCB1aW50OF90IGluc25fbGVuLCB1aW50NjRf
dCBleHRyYSkKIHsKICAgICBzdHJ1Y3QgeGVuX2RtX29wIG9wOwogICAgIHN0cnVjdCB4ZW5fZG1f
b3BfaW5qZWN0X2V2ZW50ICpkYXRhOwpAQCAtNTUxLDcgKzU1MSw3IEBAIGludCB4ZW5kZXZpY2Vt
b2RlbF9pbmplY3RfZXZlbnQoCiAgICAgZGF0YS0+dHlwZSA9IHR5cGU7CiAgICAgZGF0YS0+ZXJy
b3JfY29kZSA9IGVycm9yX2NvZGU7CiAgICAgZGF0YS0+aW5zbl9sZW4gPSBpbnNuX2xlbjsKLSAg
ICBkYXRhLT5jcjIgPSBjcjI7CisgICAgZGF0YS0+Y3IyID0gZXh0cmE7CiAKICAgICByZXR1cm4g
eGVuZGV2aWNlbW9kZWxfb3AoZG1vZCwgZG9taWQsIDEsICZvcCwgc2l6ZW9mKG9wKSk7CiB9CmRp
ZmYgLS1naXQgYS90b29scy9saWJzL2RldmljZW1vZGVsL2luY2x1ZGUveGVuZGV2aWNlbW9kZWwu
aCBiL3Rvb2xzL2xpYnMvZGV2aWNlbW9kZWwvaW5jbHVkZS94ZW5kZXZpY2Vtb2RlbC5oCmluZGV4
IDA4Y2IwZDQzNzQuLmU4NzdmNWM4YTYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnMvZGV2aWNlbW9k
ZWwvaW5jbHVkZS94ZW5kZXZpY2Vtb2RlbC5oCisrKyBiL3Rvb2xzL2xpYnMvZGV2aWNlbW9kZWwv
aW5jbHVkZS94ZW5kZXZpY2Vtb2RlbC5oCkBAIC0zMDksMTIgKzMwOSwxMiBAQCBpbnQgeGVuZGV2
aWNlbW9kZWxfc2V0X21lbV90eXBlKAogICogQHBhcm0gdHlwZSB0aGUgZXZlbnQgdHlwZSAoc2Vl
IHRoZSBkZWZpbml0aW9uIG9mIGVudW0geDg2X2V2ZW50X3R5cGUpCiAgKiBAcGFybSBlcnJvcl9j
b2RlIHRoZSBlcnJvciBjb2RlIG9yIH4wIHRvIHNraXAKICAqIEBwYXJtIGluc25fbGVuIHRoZSBp
bnN0cnVjdGlvbiBsZW5ndGgKLSAqIEBwYXJtIGNyMiB0aGUgdmFsdWUgb2YgQ1IyIGZvciBwYWdl
IGZhdWx0cworICogQHBhcm0gZXh0cmEgdHlwZS1zcGVjaWZpYyBleHRyYSBkYXRhICglY3IyIGZv
ciAjUEYsIHBlbmRpbmdfZGJnIGZvciAjREIpCiAgKiBAcmV0dXJuIDAgb24gc3VjY2VzcywgLTEg
b24gZmFpbHVyZS4KICAqLwogaW50IHhlbmRldmljZW1vZGVsX2luamVjdF9ldmVudCgKICAgICB4
ZW5kZXZpY2Vtb2RlbF9oYW5kbGUgKmRtb2QsIGRvbWlkX3QgZG9taWQsIGludCB2Y3B1LCB1aW50
OF90IHZlY3RvciwKLSAgICB1aW50OF90IHR5cGUsIHVpbnQzMl90IGVycm9yX2NvZGUsIHVpbnQ4
X3QgaW5zbl9sZW4sIHVpbnQ2NF90IGNyMik7CisgICAgdWludDhfdCB0eXBlLCB1aW50MzJfdCBl
cnJvcl9jb2RlLCB1aW50OF90IGluc25fbGVuLCB1aW50NjRfdCBleHRyYSk7CiAKIC8qKgogICog
U2h1dHMgdGhlIGRvbWFpbiBkb3duLgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMveGVuLWFjY2Vz
cy94ZW4tYWNjZXNzLmMgYi90b29scy90ZXN0cy94ZW4tYWNjZXNzL3hlbi1hY2Nlc3MuYwppbmRl
eCA2YWFlZTE2ZDY3Li4wNDRhM2EzYzU3IDEwMDY0NAotLS0gYS90b29scy90ZXN0cy94ZW4tYWNj
ZXNzL3hlbi1hY2Nlc3MuYworKysgYi90b29scy90ZXN0cy94ZW4tYWNjZXNzL3hlbi1hY2Nlc3Mu
YwpAQCAtODI2LDE4ICs4MjYsMTkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkK
IAogICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgY2FzZSBWTV9FVkVOVF9SRUFT
T05fREVCVUdfRVhDRVBUSU9OOgotICAgICAgICAgICAgICAgIHByaW50ZigiRGVidWcgZXhjZXB0
aW9uOiByaXA9JTAxNiJQUkl4NjQiLCB2Y3B1ICVkLiBUeXBlOiAldS4gTGVuZ3RoOiAldVxuIiwK
KyAgICAgICAgICAgICAgICBwcmludGYoIkRlYnVnIGV4Y2VwdGlvbjogcmlwPSUwMTYiUFJJeDY0
IiwgdmNwdSAlZC4gVHlwZTogJXUuIExlbmd0aDogJXUuIFBlbmRpbmcgZGJnICUwOCJQUkl4NjQi
XG4iLAogICAgICAgICAgICAgICAgICAgICAgICByZXEuZGF0YS5yZWdzLng4Ni5yaXAsCiAgICAg
ICAgICAgICAgICAgICAgICAgIHJlcS52Y3B1X2lkLAogICAgICAgICAgICAgICAgICAgICAgICBy
ZXEudS5kZWJ1Z19leGNlcHRpb24udHlwZSwKLSAgICAgICAgICAgICAgICAgICAgICAgcmVxLnUu
ZGVidWdfZXhjZXB0aW9uLmluc25fbGVuZ3RoKTsKKyAgICAgICAgICAgICAgICAgICAgICAgcmVx
LnUuZGVidWdfZXhjZXB0aW9uLmluc25fbGVuZ3RoLAorICAgICAgICAgICAgICAgICAgICAgICBy
ZXEudS5kZWJ1Z19leGNlcHRpb24ucGVuZGluZ19kYmcpOwogCiAgICAgICAgICAgICAgICAgLyog
UmVpbmplY3QgKi8KICAgICAgICAgICAgICAgICByYyA9IHhjX2h2bV9pbmplY3RfdHJhcCh4Y2gs
IGRvbWFpbl9pZCwgcmVxLnZjcHVfaWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWDg2X1RSQVBfREVCVUcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVxLnUuZGVidWdfZXhjZXB0aW9uLnR5cGUsIC0xLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlcS51LmRlYnVnX2V4Y2VwdGlvbi5pbnNuX2xlbmd0
aCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXEuZGF0YS5yZWdz
Lng4Ni5jcjIpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlcS51
LmRlYnVnX2V4Y2VwdGlvbi5wZW5kaW5nX2RiZyk7CiAgICAgICAgICAgICAgICAgaWYgKHJjIDwg
MCkKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIEVSUk9SKCJFcnJvciAl
ZCBpbmplY3RpbmcgYnJlYWtwb2ludFxuIiwgcmMpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9tb25pdG9yLmMgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwppbmRleCA3ZmIxZTJj
MDRlLi5lN2ZiOWY0MjU0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwor
KysgYi94ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYwpAQCAtMTM2LDcgKzEzNiw4IEBAIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBnZm5fb2ZfcmlwKHVuc2lnbmVkIGxvbmcgcmlwKQogfQog
CiBpbnQgaHZtX21vbml0b3JfZGVidWcodW5zaWduZWQgbG9uZyByaXAsIGVudW0gaHZtX21vbml0
b3JfZGVidWdfdHlwZSB0eXBlLAotICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
dHJhcF90eXBlLCB1bnNpZ25lZCBsb25nIGluc25fbGVuZ3RoKQorICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCB0cmFwX3R5cGUsIHVuc2lnbmVkIGludCBpbnNuX2xlbmd0aCwKKyAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGVuZGluZ19kYmcpCiB7CiAgICAvKgog
ICAgICogcmMgPCAwIGVycm9yIGluIG1vbml0b3Ivdm1fZXZlbnQsIGNyYXNoCkBAIC0xNzUsNiAr
MTc2LDcgQEAgaW50IGh2bV9tb25pdG9yX2RlYnVnKHVuc2lnbmVkIGxvbmcgcmlwLCBlbnVtIGh2
bV9tb25pdG9yX2RlYnVnX3R5cGUgdHlwZSwKICAgICAgICAgcmVxLnUuZGVidWdfZXhjZXB0aW9u
LmdmbiA9IGdmbl9vZl9yaXAocmlwKTsKICAgICAgICAgcmVxLnUuZGVidWdfZXhjZXB0aW9uLnR5
cGUgPSB0cmFwX3R5cGU7CiAgICAgICAgIHJlcS51LmRlYnVnX2V4Y2VwdGlvbi5pbnNuX2xlbmd0
aCA9IGluc25fbGVuZ3RoOworICAgICAgICByZXEudS5kZWJ1Z19leGNlcHRpb24ucGVuZGluZ19k
YmcgPSBwZW5kaW5nX2RiZzsKICAgICAgICAgc3luYyA9ICEhYWQtPm1vbml0b3IuZGVidWdfZXhj
ZXB0aW9uX3N5bmM7CiAgICAgICAgIGJyZWFrOwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL3N2bS9zdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCmluZGV4IDBmYjE5MDhj
MTguLjcyYjFkY2JmNTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCkBAIC0yNjQ5LDcgKzI2NDksNyBAQCB2b2lk
IHN2bV92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIAogICAgICAg
ICAgICAgcmMgPSBodm1fbW9uaXRvcl9kZWJ1ZyhyZWdzLT5yaXAsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEhWTV9NT05JVE9SX0RFQlVHX0VYQ0VQVElPTiwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJhcF90eXBlLCBpbnN0X2xlbik7CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyYXBfdHlwZSwgaW5zdF9sZW4sIDApOwogICAg
ICAgICAgICAgaWYgKCByYyA8IDAgKQogICAgICAgICAgICAgICAgIGdvdG8gdW5leHBlY3RlZF9l
eGl0X3R5cGU7CiAgICAgICAgICAgICBpZiAoICFyYyApCkBAIC0yNjgwLDcgKzI2ODAsNyBAQCB2
b2lkIHN2bV92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICAg
ICAgICAgcmMgPSBodm1fbW9uaXRvcl9kZWJ1ZyhyZWdzLT5yaXAsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSFZNX01PTklUT1JfU09GVFdBUkVfQlJFQUtQT0lOVCwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYODZfRVZFTlRUWVBFX1NXX0VYQ0VQVElPTiwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0X2xlbik7CisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW5zdF9sZW4sIDApOwogICAgICAgICAgICBpZiAoIHJj
IDwgMCApCiAgICAgICAgICAgICAgICBnb3RvIHVuZXhwZWN0ZWRfZXhpdF90eXBlOwogICAgICAg
ICAgICBpZiAoICFyYyApCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBi
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCmluZGV4IDc0NTBjYmU0MGQuLjM5ZWZkOTE5OTEg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZteC5jCkBAIC0zODM0LDcgKzM4MzQsNyBAQCB2b2lkIHZteF92bWV4aXRfaGFu
ZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIAogICAgICAgICAgICAgICAgIHJjID0g
aHZtX21vbml0b3JfZGVidWcocmVncy0+cmlwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgSFZNX01PTklUT1JfREVCVUdfRVhDRVBUSU9OLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdHJhcF90eXBlLCBpbnNuX2xlbik7CisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmFwX3R5cGUsIGluc25fbGVuLCAwKTsKIAog
ICAgICAgICAgICAgICAgIGlmICggcmMgPCAwICkKICAgICAgICAgICAgICAgICAgICAgZ290byBl
eGl0X2FuZF9jcmFzaDsKQEAgLTM4NTUsNyArMzg1NSw3IEBAIHZvaWQgdm14X3ZtZXhpdF9oYW5k
bGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQogICAgICAgICAgICAgICAgIHJjID0gaHZt
X21vbml0b3JfZGVidWcocmVncy0+cmlwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSFZNX01PTklUT1JfU09GVFdBUkVfQlJFQUtQT0lOVCwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9FVkVOVFRZUEVfU1dfRVhDRVBUSU9OLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zbl9sZW4pOworICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zbl9sZW4sIDApOwogCiAgICAgICAgICAg
ICAgICAgaWYgKCByYyA8IDAgKQogICAgICAgICAgICAgICAgICAgICBnb3RvIGV4aXRfYW5kX2Ny
YXNoOwpAQCAtNDE1Nyw3ICs0MTU3LDcgQEAgdm9pZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgICAgIHsKICAgICAgICAgICAgIGh2bV9tb25pdG9y
X2RlYnVnKHJlZ3MtPnJpcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEhWTV9NT05J
VE9SX1NJTkdMRVNURVBfQlJFQUtQT0lOVCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDAsIDApOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgMCwgMCk7CiAKICAgICAg
ICAgICAgIGlmICggdi0+ZG9tYWluLT5kZWJ1Z2dlcl9hdHRhY2hlZCApCiAgICAgICAgICAgICAg
ICAgZG9tYWluX3BhdXNlX2Zvcl9kZWJ1Z2dlcigpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vbW9uaXRvci5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vbW9uaXRvci5o
CmluZGV4IDMyNWI0NDY3NGQuLjY2ZGUyNGNiNzUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL21vbml0b3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9tb25pdG9y
LmgKQEAgLTQyLDcgKzQyLDggQEAgdm9pZCBodm1fbW9uaXRvcl9kZXNjcmlwdG9yX2FjY2Vzcyh1
aW50NjRfdCBleGl0X2luZm8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQ2NF90IHZteF9leGl0X3F1YWxpZmljYXRpb24sCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ4X3QgZGVzY3JpcHRvciwgYm9vbCBpc193cml0ZSk7CiBpbnQgaHZtX21v
bml0b3JfZGVidWcodW5zaWduZWQgbG9uZyByaXAsIGVudW0gaHZtX21vbml0b3JfZGVidWdfdHlw
ZSB0eXBlLAotICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdHJhcF90eXBlLCB1
bnNpZ25lZCBsb25nIGluc25fbGVuZ3RoKTsKKyAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgdHJhcF90eXBlLCB1bnNpZ25lZCBpbnQgaW5zbl9sZW5ndGgsCisgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IHBlbmRpbmdfZGJnKTsKIGludCBodm1fbW9uaXRvcl9jcHVp
ZCh1bnNpZ25lZCBsb25nIGluc25fbGVuZ3RoLCB1bnNpZ25lZCBpbnQgbGVhZiwKICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3VibGVhZik7CiB2b2lkIGh2bV9tb25pdG9yX2lu
dGVycnVwdCh1bnNpZ25lZCBpbnQgdmVjdG9yLCB1bnNpZ25lZCBpbnQgdHlwZSwKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vZG1fb3AuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9o
dm0vZG1fb3AuaAppbmRleCBkM2I1NTRkMDE5Li5mZDAwZTlkNzYxIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2RtX29wLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9k
bV9vcC5oCkBAIC0zMjQsNyArMzI0LDcgQEAgc3RydWN0IHhlbl9kbV9vcF9pbmplY3RfZXZlbnQg
ewogICAgIC8qIElOIC0gZXJyb3IgY29kZSAob3IgfjAgdG8gc2tpcCkgKi8KICAgICB1aW50MzJf
dCBlcnJvcl9jb2RlOwogICAgIHVpbnQzMl90IHBhZDE7Ci0gICAgLyogSU4gLSBDUjIgZm9yIHBh
Z2UgZmF1bHRzICovCisgICAgLyogSU4gLSB0eXBlLXNwZWNpZmljIGV4dHJhIGRhdGEgKCVjcjIg
Zm9yICNQRiwgcGVuZGluZ19kYmcgZm9yICNEQikgKi8KICAgICB1aW50NjRfYWxpZ25lZF90IGNy
MjsKIH07CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oIGIveGVu
L2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKaW5kZXggOTU5MDgzZDhjNC4uNzY2NzZmZjRjMCAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL3ZtX2V2ZW50LmgKQEAgLTI4MSw2ICsyODEsNyBAQCBzdHJ1Y3Qgdm1fZXZlbnRf
ZGVidWcgewogICAgIHVpbnQzMl90IGluc25fbGVuZ3RoOwogICAgIHVpbnQ4X3QgdHlwZTsgICAg
ICAgIC8qIEhWTU9QX1RSQVBfKiAqLwogICAgIHVpbnQ4X3QgX3BhZFszXTsKKyAgICB1aW50NjRf
dCBwZW5kaW5nX2RiZzsKIH07CiAKIHN0cnVjdCB2bV9ldmVudF9tb3ZfdG9fbXNyIHsKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
