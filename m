Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6112B4F7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:48:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikpvv-0003Mh-5o; Fri, 27 Dec 2019 13:45:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikpvt-0003MQ-Gg
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:45:37 +0000
X-Inumbo-ID: 23ce3542-28af-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23ce3542-28af-11ea-b6f1-bc764e2007e4;
 Fri, 27 Dec 2019 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577454327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ob/U7KrE5sk+3yZo0czd2/Jt8RFS24kv/BXiOsuPlT4=;
 b=b/ppZqBDG8MGbadsHYx/wllTetibl2XkI2BNwPjRuMHX0pLfcECMFKc9
 MhyBXgO8Oy9BOJOkQBEUajP+93yE9X1Jqpst5WXggjlmDbvRTrOz6OfEt
 xBbtU8pXLIT6ZlSl0c5gHwu7KBWAu8r7OPHIi1CmZLrc9mlQV2+P7mHaI U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iHykdEvh2sYqilKpgTYghiekTEi0q2ebJhEqIIjy3j9sJCpF+z/yQeJNv3jkIJI4ngxD+A5c18
 0MfWJ30Q4tZQ4IqFo+5qSA0zOGcD59i0pBPJVmgHyW8frPLVE9blyhY0VA9NtNB0H8Pd6/fcka
 cDqLUgwAQjSMl6slVbskyeJ7ApUwWfQmUuDPTMt5ao3nTbcTaOW563koLXTjcPeBVO5FdkoSg3
 qALgCEFOA3SbPfVYbKU2kBs4tJTJdBsh/An8iepvxPSYqj61PfANwShRxALpcnEuFAfyTZymey
 0hQ=
X-SBRS: 2.7
X-MesageID: 10618866
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10618866"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 13:45:16 +0000
Message-ID: <20191227134516.15530-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNhbGwgdG8geGNfZG9tYWluX2Rpc2FibGVfbWlncmF0ZSgpIGlzIG1hZGUgb25seSBmcm9t
IHg4Niwgd2hpbGUgaXRzCmhhbmRsaW5nIGluIFhlbiBpcyBjb21tb24uICBNb3ZlIGl0IHRvIHRo
ZSBsaWJ4bF9fYnVpbGRfcHJlKCkuCgpodm1fc2V0X2NvbmZfcGFyYW1zKCksIGh2bV9zZXRfdmly
aWRpYW5fZmVhdHVyZXMoKSwKaHZtX3NldF9tY2FfY2FwYWJpbGl0aWVzKCksIGFuZCB0aGUgYWx0
cDJtIGxvZ2ljIGlzIGFsbCBpbiBjb21tb24KY29kZSAocGFydHMgaWZkZWYnZCkgYnV0IGRlc3Bp
dGUgdGhpcywgaXMgYWxsIGFjdHVhbGx5IHg4NiBzcGVjaWZpYy4KCk1vdmUgaXQgaW50byB4ODYg
c3BlY2lmaWMgY29kZSwgYW5kIGZvbGQgYWxsIG9mIHRoZSB4Y19odm1fcGFyYW1fc2V0KCkgY2Fs
bHMKdG9nZXRoZXIgaW50byBodm1fc2V0X2NvbmZfcGFyYW1zKCkgaW4gYSBmYXIgbW9yZSBjb2hl
cmVudCB3YXkuCgpGaW5hbGx5IC0gZW5zdXJlIHRoYXQgYWxsIGh5cGVyY2FsbHMgaGF2ZSB0aGVp
ciByZXR1cm4gdmFsdWVzIGNoZWNrZWQuCgpObyBwcmFjdGljYWwgY2hhbmdlIGluIGNvbnN0cnVj
dGVkIGRvbWFpbnMuICBGZXdlciB1c2VsZXNzIGh5cGVyY2FsbHMgbm93IHRvCmNvbnN0cnVjdCBh
biBBUk0gZ3Vlc3QuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29t
PgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kb20uYyB8
IDE4MyArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX3g4Ni5jIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDE4NSBpbnNlcnRpb25zKCspLCAx
NzkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgYi90
b29scy9saWJ4bC9saWJ4bF9kb20uYwppbmRleCBjZGIyOTRhYjhkLi41NzNjNjM2OTJiIDEwMDY0
NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kb20uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9k
b20uYwpAQCAtMjQzLDE0OSArMjQzLDYgQEAgc3RhdGljIGludCBudW1hX3BsYWNlX2RvbWFpbihs
aWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4gcmM7CiB9CiAKLXN0YXRp
YyB1bnNpZ25lZCBsb25nIHRpbWVyX21vZGUoY29uc3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8g
KmluZm8pCi17Ci0gICAgY29uc3QgbGlieGxfdGltZXJfbW9kZSBtb2RlID0gaW5mby0+dGltZXJf
bW9kZTsKLSAgICBhc3NlcnQobW9kZSA+PSBMSUJYTF9USU1FUl9NT0RFX0RFTEFZX0ZPUl9NSVNT
RURfVElDS1MgJiYKLSAgICAgICAgICAgbW9kZSA8PSBMSUJYTF9USU1FUl9NT0RFX09ORV9NSVNT
RURfVElDS19QRU5ESU5HKTsKLSAgICByZXR1cm4gKCh1bnNpZ25lZCBsb25nKW1vZGUpOwotfQot
Ci0jaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQotc3RhdGljIGlu
dCBodm1fc2V0X3ZpcmlkaWFuX2ZlYXR1cmVzKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlk
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9idWls
ZF9pbmZvICpjb25zdCBpbmZvKQotewotICAgIGxpYnhsX2JpdG1hcCBlbmxpZ2h0ZW5tZW50czsK
LSAgICBsaWJ4bF92aXJpZGlhbl9lbmxpZ2h0ZW5tZW50IHY7Ci0gICAgdWludDY0X3QgbWFzayA9
IDA7Ci0KLSAgICBsaWJ4bF9iaXRtYXBfaW5pdCgmZW5saWdodGVubWVudHMpOwotICAgIGxpYnhs
X2JpdG1hcF9hbGxvYyhDVFgsICZlbmxpZ2h0ZW5tZW50cywKLSAgICAgICAgICAgICAgICAgICAg
ICAgTElCWExfQlVJTERJTkZPX0hWTV9WSVJJRElBTl9FTkFCTEVfRElTQUJMRV9XSURUSCk7Ci0K
LSAgICBpZiAobGlieGxfZGVmYm9vbF92YWwoaW5mby0+dS5odm0udmlyaWRpYW4pKSB7Ci0gICAg
ICAgIC8qIEVuYWJsZSBkZWZhdWx0cyAqLwotICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0KCZlbmxp
Z2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9CQVNFKTsKLSAgICAgICAg
bGlieGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRF
Tk1FTlRfRlJFUSk7Ci0gICAgICAgIGxpYnhsX2JpdG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBM
SUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX1RJTUVfUkVGX0NPVU5UKTsKLSAgICAgICAgbGli
eGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1F
TlRfQVBJQ19BU1NJU1QpOwotICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0KCZlbmxpZ2h0ZW5tZW50
cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9DUkFTSF9DVEwpOwotICAgIH0KLQotICAg
IGxpYnhsX2Zvcl9lYWNoX3NldF9iaXQodiwgaW5mby0+dS5odm0udmlyaWRpYW5fZW5hYmxlKSB7
Ci0gICAgICAgIGlmIChsaWJ4bF9iaXRtYXBfdGVzdCgmaW5mby0+dS5odm0udmlyaWRpYW5fZGlz
YWJsZSwgdikpIHsKLSAgICAgICAgICAgIExPRyhFUlJPUiwgIiVzIGdyb3VwIGJvdGggZW5hYmxl
ZCBhbmQgZGlzYWJsZWQiLAotICAgICAgICAgICAgICAgIGxpYnhsX3ZpcmlkaWFuX2VubGlnaHRl
bm1lbnRfdG9fc3RyaW5nKHYpKTsKLSAgICAgICAgICAgIGdvdG8gZXJyOwotICAgICAgICB9Ci0g
ICAgICAgIGlmIChsaWJ4bF92aXJpZGlhbl9lbmxpZ2h0ZW5tZW50X3RvX3N0cmluZyh2KSkgLyog
Y2hlY2sgdmFsaWRpdHkgKi8KLSAgICAgICAgICAgIGxpYnhsX2JpdG1hcF9zZXQoJmVubGlnaHRl
bm1lbnRzLCB2KTsKLSAgICB9Ci0KLSAgICBsaWJ4bF9mb3JfZWFjaF9zZXRfYml0KHYsIGluZm8t
PnUuaHZtLnZpcmlkaWFuX2Rpc2FibGUpCi0gICAgICAgIGlmIChsaWJ4bF92aXJpZGlhbl9lbmxp
Z2h0ZW5tZW50X3RvX3N0cmluZyh2KSkgLyogY2hlY2sgdmFsaWRpdHkgKi8KLSAgICAgICAgICAg
IGxpYnhsX2JpdG1hcF9yZXNldCgmZW5saWdodGVubWVudHMsIHYpOwotCi0gICAgLyogVGhlIGJh
c2Ugc2V0IGlzIGEgcHJlLXJlcXVpc2l0ZSBmb3IgYWxsIG90aGVycyAqLwotICAgIGlmICghbGli
eGxfYml0bWFwX2lzX2VtcHR5KCZlbmxpZ2h0ZW5tZW50cykgJiYKLSAgICAgICAgIWxpYnhsX2Jp
dG1hcF90ZXN0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9C
QVNFKSkgewotICAgICAgICBMT0coRVJST1IsICJiYXNlIGdyb3VwIG5vdCBlbmFibGVkIik7Ci0g
ICAgICAgIGdvdG8gZXJyOwotICAgIH0KLQotICAgIGxpYnhsX2Zvcl9lYWNoX3NldF9iaXQodiwg
ZW5saWdodGVubWVudHMpCi0gICAgICAgIExPRyhERVRBSUwsICIlcyBncm91cCBlbmFibGVkIiwg
bGlieGxfdmlyaWRpYW5fZW5saWdodGVubWVudF90b19zdHJpbmcodikpOwotCi0gICAgaWYgKGxp
YnhsX2JpdG1hcF90ZXN0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVO
TUVOVF9CQVNFKSkgewotICAgICAgICBtYXNrIHw9IEhWTVBWX2Jhc2VfZnJlcTsKLQotICAgICAg
ICBpZiAoIWxpYnhsX2JpdG1hcF90ZXN0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5f
RU5MSUdIVEVOTUVOVF9GUkVRKSkKLSAgICAgICAgICAgIG1hc2sgfD0gSFZNUFZfbm9fZnJlcTsK
LSAgICB9Ci0KLSAgICBpZiAobGlieGxfYml0bWFwX3Rlc3QoJmVubGlnaHRlbm1lbnRzLCBMSUJY
TF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX1RJTUVfUkVGX0NPVU5UKSkKLSAgICAgICAgbWFzayB8
PSBIVk1QVl90aW1lX3JlZl9jb3VudDsKLQotICAgIGlmIChsaWJ4bF9iaXRtYXBfdGVzdCgmZW5s
aWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfUkVGRVJFTkNFX1RTQykp
Ci0gICAgICAgIG1hc2sgfD0gSFZNUFZfcmVmZXJlbmNlX3RzYzsKLQotICAgIGlmIChsaWJ4bF9i
aXRtYXBfdGVzdCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRf
SENBTExfUkVNT1RFX1RMQl9GTFVTSCkpCi0gICAgICAgIG1hc2sgfD0gSFZNUFZfaGNhbGxfcmVt
b3RlX3RsYl9mbHVzaDsKLQotICAgIGlmIChsaWJ4bF9iaXRtYXBfdGVzdCgmZW5saWdodGVubWVu
dHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfQVBJQ19BU1NJU1QpKQotICAgICAgICBt
YXNrIHw9IEhWTVBWX2FwaWNfYXNzaXN0OwotCi0gICAgaWYgKGxpYnhsX2JpdG1hcF90ZXN0KCZl
bmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9DUkFTSF9DVEwpKQot
ICAgICAgICBtYXNrIHw9IEhWTVBWX2NyYXNoX2N0bDsKLQotICAgIGlmIChsaWJ4bF9iaXRtYXBf
dGVzdCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfU1lOSUMp
KQotICAgICAgICBtYXNrIHw9IEhWTVBWX3N5bmljOwotCi0gICAgaWYgKGxpYnhsX2JpdG1hcF90
ZXN0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9TVElNRVIp
KQotICAgICAgICBtYXNrIHw9IEhWTVBWX3RpbWVfcmVmX2NvdW50IHwgSFZNUFZfc3luaWMgfCBI
Vk1QVl9zdGltZXI7Ci0KLSAgICBpZiAobGlieGxfYml0bWFwX3Rlc3QoJmVubGlnaHRlbm1lbnRz
LCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX0hDQUxMX0lQSSkpCi0gICAgICAgIG1hc2sg
fD0gSFZNUFZfaGNhbGxfaXBpOwotCi0gICAgaWYgKG1hc2sgIT0gMCAmJgotICAgICAgICB4Y19o
dm1fcGFyYW1fc2V0KENUWC0+eGNoLAotICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWlkLAot
ICAgICAgICAgICAgICAgICAgICAgICAgIEhWTV9QQVJBTV9WSVJJRElBTiwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICBtYXNrKSAhPSAwKSB7Ci0gICAgICAgIExPR0UoRVJST1IsICJDb3VsZG4n
dCBzZXQgdmlyaWRpYW4gZmVhdHVyZSBtYXNrICgweCUiUFJJeDY0IikiLCBtYXNrKTsKLSAgICAg
ICAgZ290byBlcnI7Ci0gICAgfQotCi0gICAgbGlieGxfYml0bWFwX2Rpc3Bvc2UoJmVubGlnaHRl
bm1lbnRzKTsKLSAgICByZXR1cm4gMDsKLQotZXJyOgotICAgIGxpYnhsX2JpdG1hcF9kaXNwb3Nl
KCZlbmxpZ2h0ZW5tZW50cyk7Ci0gICAgcmV0dXJuIEVSUk9SX0ZBSUw7Ci19Ci0KLXN0YXRpYyBp
bnQgaHZtX3NldF9tY2FfY2FwYWJpbGl0aWVzKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlk
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2J1aWxk
X2luZm8gKmNvbnN0IGluZm8pCi17Ci0gICAgdW5zaWduZWQgbG9uZyBjYXBzID0gaW5mby0+dS5o
dm0ubWNhX2NhcHM7Ci0KLSAgICBpZiAoIWNhcHMpCi0gICAgICAgIHJldHVybiAwOwotCi0gICAg
cmV0dXJuIHhjX2h2bV9wYXJhbV9zZXQoQ1RYLT54Y2gsIGRvbWlkLCBIVk1fUEFSQU1fTUNBX0NB
UCwgY2Fwcyk7Ci19Ci0jZW5kaWYKLQotc3RhdGljIHZvaWQgaHZtX3NldF9jb25mX3BhcmFtcyh4
Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICpjb25zdCBpbmZvKQotewotICAg
IHN3aXRjaChpbmZvLT50eXBlKSB7Ci0gICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVkg6Ci0g
ICAgICAgIHhjX2h2bV9wYXJhbV9zZXQoaGFuZGxlLCBkb21pZCwgSFZNX1BBUkFNX1BBRV9FTkFC
TEVELCB0cnVlKTsKLSAgICAgICAgeGNfaHZtX3BhcmFtX3NldChoYW5kbGUsIGRvbWlkLCBIVk1f
UEFSQU1fVElNRVJfTU9ERSwKLSAgICAgICAgICAgICAgICAgICAgICAgICB0aW1lcl9tb2RlKGlu
Zm8pKTsKLSAgICAgICAgeGNfaHZtX3BhcmFtX3NldChoYW5kbGUsIGRvbWlkLCBIVk1fUEFSQU1f
TkVTVEVESFZNLAotICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xfdmFsKGlu
Zm8tPm5lc3RlZF9odm0pKTsKLSAgICAgICAgYnJlYWs7Ci0gICAgY2FzZSBMSUJYTF9ET01BSU5f
VFlQRV9IVk06Ci0gICAgICAgIHhjX2h2bV9wYXJhbV9zZXQoaGFuZGxlLCBkb21pZCwgSFZNX1BB
UkFNX1BBRV9FTkFCTEVELAotICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xf
dmFsKGluZm8tPnUuaHZtLnBhZSkpOwotI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQo
X194ODZfNjRfXykKLSAgICAgICAgeGNfaHZtX3BhcmFtX3NldChoYW5kbGUsIGRvbWlkLCBIVk1f
UEFSQU1fSFBFVF9FTkFCTEVELAotICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RlZmJv
b2xfdmFsKGluZm8tPnUuaHZtLmhwZXQpKTsKLSNlbmRpZgotICAgICAgICB4Y19odm1fcGFyYW1f
c2V0KGhhbmRsZSwgZG9taWQsIEhWTV9QQVJBTV9USU1FUl9NT0RFLAotICAgICAgICAgICAgICAg
ICAgICAgICAgIHRpbWVyX21vZGUoaW5mbykpOwotICAgICAgICB4Y19odm1fcGFyYW1fc2V0KGhh
bmRsZSwgZG9taWQsIEhWTV9QQVJBTV9WUFRfQUxJR04sCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgbGlieGxfZGVmYm9vbF92YWwoaW5mby0+dS5odm0udnB0X2FsaWduKSk7Ci0gICAgICAgIHhj
X2h2bV9wYXJhbV9zZXQoaGFuZGxlLCBkb21pZCwgSFZNX1BBUkFNX05FU1RFREhWTSwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZWZib29sX3ZhbChpbmZvLT5uZXN0ZWRfaHZtKSk7
Ci0gICAgICAgIGJyZWFrOwotICAgIGRlZmF1bHQ6Ci0gICAgICAgIGFib3J0KCk7Ci0gICAgfQot
fQotCiBpbnQgbGlieGxfX2J1aWxkX3ByZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwK
ICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsIGxpYnhsX19kb21h
aW5fYnVpbGRfc3RhdGUgKnN0YXRlKQogewpAQCAtNDAwLDYgKzI1NywxMiBAQCBpbnQgbGlieGxf
X2J1aWxkX3ByZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgcmV0dXJu
IEVSUk9SX0ZBSUw7CiAgICAgfQogCisgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGRfY29uZmln
LT5iX2luZm8uZGlzYWJsZV9taWdyYXRlKSAmJgorICAgICAgICB4Y19kb21haW5fZGlzYWJsZV9t
aWdyYXRlKGN0eC0+eGNoLCBkb21pZCkgIT0gMCkgeworICAgICAgICBMT0coRVJST1IsICJDb3Vs
ZG4ndCBzZXQgbm9taWdyYXRlIik7CisgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOworICAgIH0K
KwogICAgIC8qCiAgICAgICogQ2hlY2sgaWYgdGhlIGRvbWFpbiBoYXMgYW55IENQVSBvciBub2Rl
IGFmZmluaXR5IGFscmVhZHkuIElmIG5vdCwgdHJ5CiAgICAgICogdG8gYnVpbGQgdXAgdGhlIGxh
dHRlciB2aWEgYXV0b21hdGljIE5VTUEgcGxhY2VtZW50LiBJbiBmYWN0LCBpbiBjYXNlCkBAIC01
MjIsNDAgKzM4NSw2IEBAIGludCBsaWJ4bF9fYnVpbGRfcHJlKGxpYnhsX19nYyAqZ2MsIHVpbnQz
Ml90IGRvbWlkLAogICAgIHN0YXRlLT5zdG9yZV9wb3J0ID0geGNfZXZ0Y2huX2FsbG9jX3VuYm91
bmQoY3R4LT54Y2gsIGRvbWlkLCBzdGF0ZS0+c3RvcmVfZG9taWQpOwogICAgIHN0YXRlLT5jb25z
b2xlX3BvcnQgPSB4Y19ldnRjaG5fYWxsb2NfdW5ib3VuZChjdHgtPnhjaCwgZG9taWQsIHN0YXRl
LT5jb25zb2xlX2RvbWlkKTsKIAotICAgIGlmIChpbmZvLT50eXBlICE9IExJQlhMX0RPTUFJTl9U
WVBFX1BWKQotICAgICAgICBodm1fc2V0X2NvbmZfcGFyYW1zKGN0eC0+eGNoLCBkb21pZCwgaW5m
byk7Ci0KLSNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCi0gICAg
aWYgKGluZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNKSB7Ci0gICAgICAgIHJjID0g
aHZtX3NldF92aXJpZGlhbl9mZWF0dXJlcyhnYywgZG9taWQsIGluZm8pOwotICAgICAgICBpZiAo
cmMpCi0gICAgICAgICAgICByZXR1cm4gcmM7Ci0KLSAgICAgICAgcmMgPSBodm1fc2V0X21jYV9j
YXBhYmlsaXRpZXMoZ2MsIGRvbWlkLCBpbmZvKTsKLSAgICAgICAgaWYgKHJjKQotICAgICAgICAg
ICAgcmV0dXJuIHJjOwotICAgIH0KLSNlbmRpZgotCi0gICAgLyogQWx0ZXJuYXRlIHAybSBzdXBw
b3J0IG9uIHg4NiBpcyBhdmFpbGFibGUgb25seSBmb3IgUFZIL0hWTSBndWVzdHMuICovCi0gICAg
aWYgKGluZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNKSB7Ci0gICAgICAgIC8qIFRo
ZSBjb25maWcgcGFyYW1ldGVyICJhbHRwMm0iIHJlcGxhY2VzIHRoZSBwYXJhbWV0ZXIgImFsdHAy
bWh2bSIuIEZvcgotICAgICAgICAgKiBsZWdhY3kgcmVhc29ucywgYm90aCBwYXJhbWV0ZXJzIGFy
ZSBhY2NlcHRlZCBvbiB4ODYgSFZNIGd1ZXN0cy4KLSAgICAgICAgICoKLSAgICAgICAgICogSWYg
dGhlIGxlZ2FjeSBmaWVsZCBpbmZvLT51Lmh2bS5hbHRwMm0gaXMgc2V0LCBhY3RpdmF0ZSBhbHRw
Mm0uCi0gICAgICAgICAqIE90aGVyd2lzZSBzZXQgYWx0cDJtIGJhc2VkIG9uIHRoZSBmaWVsZCBp
bmZvLT5hbHRwMm0uICovCi0gICAgICAgIGlmIChpbmZvLT5hbHRwMm0gPT0gTElCWExfQUxUUDJN
X01PREVfRElTQUJMRUQgJiYKLSAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPnUu
aHZtLmFsdHAybSkpCi0gICAgICAgICAgICB4Y19odm1fcGFyYW1fc2V0KGN0eC0+eGNoLCBkb21p
ZCwgSFZNX1BBUkFNX0FMVFAyTSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxf
ZGVmYm9vbF92YWwoaW5mby0+dS5odm0uYWx0cDJtKSk7Ci0gICAgICAgIGVsc2UKLSAgICAgICAg
ICAgIHhjX2h2bV9wYXJhbV9zZXQoY3R4LT54Y2gsIGRvbWlkLCBIVk1fUEFSQU1fQUxUUDJNLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLT5hbHRwMm0pOwotICAgIH0gZWxzZSBp
ZiAoaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QVkgpIHsKLSAgICAgICAgeGNfaHZt
X3BhcmFtX3NldChjdHgtPnhjaCwgZG9taWQsIEhWTV9QQVJBTV9BTFRQMk0sCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgaW5mby0+YWx0cDJtKTsKLSAgICB9Ci0KICAgICByYyA9IGxpYnhsX19h
cmNoX2RvbWFpbl9jcmVhdGUoZ2MsIGRfY29uZmlnLCBkb21pZCk7CiAKICAgICByZXR1cm4gcmM7
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF94ODYuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X3g4Ni5jCmluZGV4IDhiODA0NTM3YmEuLjFjYWUwZTJiMjYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3g4Ni5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3g4Ni5jCkBAIC0yODUsMTQg
KzI4NSwxOTMgQEAgc3RhdGljIGludCBsaWJ4bF9fZTgyMF9hbGxvYyhsaWJ4bF9fZ2MgKmdjLCB1
aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4gMDsKIH0KIAorc3RhdGljIHVuc2lnbmVkIGxvbmcg
dGltZXJfbW9kZShjb25zdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbykKK3sKKyAgICBj
b25zdCBsaWJ4bF90aW1lcl9tb2RlIG1vZGUgPSBpbmZvLT50aW1lcl9tb2RlOworICAgIGFzc2Vy
dChtb2RlID49IExJQlhMX1RJTUVSX01PREVfREVMQVlfRk9SX01JU1NFRF9USUNLUyAmJgorICAg
ICAgICAgICBtb2RlIDw9IExJQlhMX1RJTUVSX01PREVfT05FX01JU1NFRF9USUNLX1BFTkRJTkcp
OworICAgIHJldHVybiAoKHVuc2lnbmVkIGxvbmcpbW9kZSk7Cit9CisKK3N0YXRpYyBpbnQgaHZt
X3NldF92aXJpZGlhbl9mZWF0dXJlcyhsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9kb21haW5fYnVp
bGRfaW5mbyAqaW5mbykKK3sKKyAgICBsaWJ4bF9iaXRtYXAgZW5saWdodGVubWVudHM7CisgICAg
bGlieGxfdmlyaWRpYW5fZW5saWdodGVubWVudCB2OworICAgIHVpbnQ2NF90IG1hc2sgPSAwOwor
CisgICAgbGlieGxfYml0bWFwX2luaXQoJmVubGlnaHRlbm1lbnRzKTsKKyAgICBsaWJ4bF9iaXRt
YXBfYWxsb2MoQ1RYLCAmZW5saWdodGVubWVudHMsCisgICAgICAgICAgICAgICAgICAgICAgIExJ
QlhMX0JVSUxESU5GT19IVk1fVklSSURJQU5fRU5BQkxFX0RJU0FCTEVfV0lEVEgpOworCisgICAg
aWYgKGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPnUuaHZtLnZpcmlkaWFuKSkgeworICAgICAgICAv
KiBFbmFibGUgZGVmYXVsdHMgKi8KKyAgICAgICAgbGlieGxfYml0bWFwX3NldCgmZW5saWdodGVu
bWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfQkFTRSk7CisgICAgICAgIGxpYnhs
X2JpdG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5U
X0ZSRVEpOworICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExf
VklSSURJQU5fRU5MSUdIVEVOTUVOVF9USU1FX1JFRl9DT1VOVCk7CisgICAgICAgIGxpYnhsX2Jp
dG1hcF9zZXQoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX0FQ
SUNfQVNTSVNUKTsKKyAgICAgICAgbGlieGxfYml0bWFwX3NldCgmZW5saWdodGVubWVudHMsIExJ
QlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfQ1JBU0hfQ1RMKTsKKyAgICB9CisKKyAgICBsaWJ4
bF9mb3JfZWFjaF9zZXRfYml0KHYsIGluZm8tPnUuaHZtLnZpcmlkaWFuX2VuYWJsZSkgeworICAg
ICAgICBpZiAobGlieGxfYml0bWFwX3Rlc3QoJmluZm8tPnUuaHZtLnZpcmlkaWFuX2Rpc2FibGUs
IHYpKSB7CisgICAgICAgICAgICBMT0coRVJST1IsICIlcyBncm91cCBib3RoIGVuYWJsZWQgYW5k
IGRpc2FibGVkIiwKKyAgICAgICAgICAgICAgICBsaWJ4bF92aXJpZGlhbl9lbmxpZ2h0ZW5tZW50
X3RvX3N0cmluZyh2KSk7CisgICAgICAgICAgICBnb3RvIGVycjsKKyAgICAgICAgfQorICAgICAg
ICBpZiAobGlieGxfdmlyaWRpYW5fZW5saWdodGVubWVudF90b19zdHJpbmcodikpIC8qIGNoZWNr
IHZhbGlkaXR5ICovCisgICAgICAgICAgICBsaWJ4bF9iaXRtYXBfc2V0KCZlbmxpZ2h0ZW5tZW50
cywgdik7CisgICAgfQorCisgICAgbGlieGxfZm9yX2VhY2hfc2V0X2JpdCh2LCBpbmZvLT51Lmh2
bS52aXJpZGlhbl9kaXNhYmxlKQorICAgICAgICBpZiAobGlieGxfdmlyaWRpYW5fZW5saWdodGVu
bWVudF90b19zdHJpbmcodikpIC8qIGNoZWNrIHZhbGlkaXR5ICovCisgICAgICAgICAgICBsaWJ4
bF9iaXRtYXBfcmVzZXQoJmVubGlnaHRlbm1lbnRzLCB2KTsKKworICAgIC8qIFRoZSBiYXNlIHNl
dCBpcyBhIHByZS1yZXF1aXNpdGUgZm9yIGFsbCBvdGhlcnMgKi8KKyAgICBpZiAoIWxpYnhsX2Jp
dG1hcF9pc19lbXB0eSgmZW5saWdodGVubWVudHMpICYmCisgICAgICAgICFsaWJ4bF9iaXRtYXBf
dGVzdCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfQkFTRSkp
IHsKKyAgICAgICAgTE9HKEVSUk9SLCAiYmFzZSBncm91cCBub3QgZW5hYmxlZCIpOworICAgICAg
ICBnb3RvIGVycjsKKyAgICB9CisKKyAgICBsaWJ4bF9mb3JfZWFjaF9zZXRfYml0KHYsIGVubGln
aHRlbm1lbnRzKQorICAgICAgICBMT0coREVUQUlMLCAiJXMgZ3JvdXAgZW5hYmxlZCIsIGxpYnhs
X3ZpcmlkaWFuX2VubGlnaHRlbm1lbnRfdG9fc3RyaW5nKHYpKTsKKworICAgIGlmIChsaWJ4bF9i
aXRtYXBfdGVzdCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRf
QkFTRSkpIHsKKyAgICAgICAgbWFzayB8PSBIVk1QVl9iYXNlX2ZyZXE7CisKKyAgICAgICAgaWYg
KCFsaWJ4bF9iaXRtYXBfdGVzdCgmZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElH
SFRFTk1FTlRfRlJFUSkpCisgICAgICAgICAgICBtYXNrIHw9IEhWTVBWX25vX2ZyZXE7CisgICAg
fQorCisgICAgaWYgKGxpYnhsX2JpdG1hcF90ZXN0KCZlbmxpZ2h0ZW5tZW50cywgTElCWExfVklS
SURJQU5fRU5MSUdIVEVOTUVOVF9USU1FX1JFRl9DT1VOVCkpCisgICAgICAgIG1hc2sgfD0gSFZN
UFZfdGltZV9yZWZfY291bnQ7CisKKyAgICBpZiAobGlieGxfYml0bWFwX3Rlc3QoJmVubGlnaHRl
bm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX1JFRkVSRU5DRV9UU0MpKQorICAg
ICAgICBtYXNrIHw9IEhWTVBWX3JlZmVyZW5jZV90c2M7CisKKyAgICBpZiAobGlieGxfYml0bWFw
X3Rlc3QoJmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX0hDQUxM
X1JFTU9URV9UTEJfRkxVU0gpKQorICAgICAgICBtYXNrIHw9IEhWTVBWX2hjYWxsX3JlbW90ZV90
bGJfZmx1c2g7CisKKyAgICBpZiAobGlieGxfYml0bWFwX3Rlc3QoJmVubGlnaHRlbm1lbnRzLCBM
SUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX0FQSUNfQVNTSVNUKSkKKyAgICAgICAgbWFzayB8
PSBIVk1QVl9hcGljX2Fzc2lzdDsKKworICAgIGlmIChsaWJ4bF9iaXRtYXBfdGVzdCgmZW5saWdo
dGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfQ1JBU0hfQ1RMKSkKKyAgICAg
ICAgbWFzayB8PSBIVk1QVl9jcmFzaF9jdGw7CisKKyAgICBpZiAobGlieGxfYml0bWFwX3Rlc3Qo
JmVubGlnaHRlbm1lbnRzLCBMSUJYTF9WSVJJRElBTl9FTkxJR0hURU5NRU5UX1NZTklDKSkKKyAg
ICAgICAgbWFzayB8PSBIVk1QVl9zeW5pYzsKKworICAgIGlmIChsaWJ4bF9iaXRtYXBfdGVzdCgm
ZW5saWdodGVubWVudHMsIExJQlhMX1ZJUklESUFOX0VOTElHSFRFTk1FTlRfU1RJTUVSKSkKKyAg
ICAgICAgbWFzayB8PSBIVk1QVl90aW1lX3JlZl9jb3VudCB8IEhWTVBWX3N5bmljIHwgSFZNUFZf
c3RpbWVyOworCisgICAgaWYgKGxpYnhsX2JpdG1hcF90ZXN0KCZlbmxpZ2h0ZW5tZW50cywgTElC
WExfVklSSURJQU5fRU5MSUdIVEVOTUVOVF9IQ0FMTF9JUEkpKQorICAgICAgICBtYXNrIHw9IEhW
TVBWX2hjYWxsX2lwaTsKKworICAgIGlmIChtYXNrICE9IDAgJiYKKyAgICAgICAgeGNfaHZtX3Bh
cmFtX3NldChDVFgtPnhjaCwKKyAgICAgICAgICAgICAgICAgICAgICAgICBkb21pZCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICBIVk1fUEFSQU1fVklSSURJQU4sCisgICAgICAgICAgICAgICAg
ICAgICAgICAgbWFzaykgIT0gMCkgeworICAgICAgICBMT0dFKEVSUk9SLCAiQ291bGRuJ3Qgc2V0
IHZpcmlkaWFuIGZlYXR1cmUgbWFzayAoMHglIlBSSXg2NCIpIiwgbWFzayk7CisgICAgICAgIGdv
dG8gZXJyOworICAgIH0KKworICAgIGxpYnhsX2JpdG1hcF9kaXNwb3NlKCZlbmxpZ2h0ZW5tZW50
cyk7CisgICAgcmV0dXJuIDA7CisKK2VycjoKKyAgICBsaWJ4bF9iaXRtYXBfZGlzcG9zZSgmZW5s
aWdodGVubWVudHMpOworICAgIHJldHVybiBFUlJPUl9GQUlMOworfQorCitzdGF0aWMgaW50IGh2
bV9zZXRfY29uZl9wYXJhbXMobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmlu
Zm8pCit7CisgICAgbGlieGxfY3R4ICpjdHggPSBsaWJ4bF9fZ2Nfb3duZXIoZ2MpOworICAgIHhj
X2ludGVyZmFjZSAqeGNoID0gY3R4LT54Y2g7CisgICAgaW50IHJldCA9IEVSUk9SX0ZBSUw7Cisg
ICAgYm9vbCBwYWUgPSB0cnVlLCBhbHRwMm0gPSBpbmZvLT5hbHRwMm07CisKKyAgICBzd2l0Y2go
aW5mby0+dHlwZSkgeworICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfSFZNOgorICAgICAgICBw
YWUgPSBsaWJ4bF9kZWZib29sX3ZhbChpbmZvLT51Lmh2bS5wYWUpOworCisgICAgICAgIC8qIFRo
ZSBjb25maWcgcGFyYW1ldGVyICJhbHRwMm0iIHJlcGxhY2VzIHRoZSBwYXJhbWV0ZXIgImFsdHAy
bWh2bSIuIEZvcgorICAgICAgICAgKiBsZWdhY3kgcmVhc29ucywgYm90aCBwYXJhbWV0ZXJzIGFy
ZSBhY2NlcHRlZCBvbiB4ODYgSFZNIGd1ZXN0cy4KKyAgICAgICAgICoKKyAgICAgICAgICogSWYg
dGhlIGxlZ2FjeSBmaWVsZCBpbmZvLT51Lmh2bS5hbHRwMm0gaXMgc2V0LCBhY3RpdmF0ZSBhbHRw
Mm0uCisgICAgICAgICAqIE90aGVyd2lzZSBzZXQgYWx0cDJtIGJhc2VkIG9uIHRoZSBmaWVsZCBp
bmZvLT5hbHRwMm0uICovCisgICAgICAgIGlmIChpbmZvLT5hbHRwMm0gPT0gTElCWExfQUxUUDJN
X01PREVfRElTQUJMRUQgJiYKKyAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPnUu
aHZtLmFsdHAybSkpCisgICAgICAgICAgICBhbHRwMm0gPSBsaWJ4bF9kZWZib29sX3ZhbChpbmZv
LT51Lmh2bS5hbHRwMm0pOworCisgICAgICAgIGlmICh4Y19odm1fcGFyYW1fc2V0KHhjaCwgZG9t
aWQsIEhWTV9QQVJBTV9IUEVUX0VOQUJMRUQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPnUuaHZtLmhwZXQpKSkgeworICAgICAgICAgICAgTE9H
KEVSUk9SLCAiQ291bGRuJ3Qgc2V0IEhWTV9QQVJBTV9IUEVUX0VOQUJMRUQiKTsKKyAgICAgICAg
ICAgIGdvdG8gb3V0OworICAgICAgICB9CisgICAgICAgIGlmICh4Y19odm1fcGFyYW1fc2V0KHhj
aCwgZG9taWQsIEhWTV9QQVJBTV9WUFRfQUxJR04sCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPnUuaHZtLnZwdF9hbGlnbikpKSB7CisgICAgICAg
ICAgICBMT0coRVJST1IsICJDb3VsZG4ndCBzZXQgSFZNX1BBUkFNX1ZQVF9BTElHTiIpOworICAg
ICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIH0KKyAgICAgICAgaWYgKGluZm8tPnUuaHZtLm1j
YV9jYXBzICYmCisgICAgICAgICAgICB4Y19odm1fcGFyYW1fc2V0KENUWC0+eGNoLCBkb21pZCwg
SFZNX1BBUkFNX01DQV9DQVAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8tPnUu
aHZtLm1jYV9jYXBzKSkgeworICAgICAgICAgICAgTE9HKEVSUk9SLCAiQ291bGRuJ3Qgc2V0IEhW
TV9QQVJBTV9NQ0FfQ0FQIik7CisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQorCisg
ICAgICAgIC8qIEZhbGx0aHJvdWdoICovCisgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVkg6
CisgICAgICAgIGlmICh4Y19odm1fcGFyYW1fc2V0KHhjaCwgZG9taWQsIEhWTV9QQVJBTV9QQUVf
RU5BQkxFRCwgcGFlKSkgeworICAgICAgICAgICAgTE9HKEVSUk9SLCAiQ291bGRuJ3Qgc2V0IEhW
TV9QQVJBTV9QQUVfRU5BQkxFRCIpOworICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIH0K
KyAgICAgICAgaWYgKHhjX2h2bV9wYXJhbV9zZXQoeGNoLCBkb21pZCwgSFZNX1BBUkFNX1RJTUVS
X01PREUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWVyX21vZGUoaW5mbykpKSB7
CisgICAgICAgICAgICBMT0coRVJST1IsICJDb3VsZG4ndCBzZXQgSFZNX1BBUkFNX1RJTUVSX01P
REUiKTsKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CisgICAgICAgIGlmICh4Y19o
dm1fcGFyYW1fc2V0KHhjaCwgZG9taWQsIEhWTV9QQVJBTV9ORVNURURIVk0sCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xfdmFsKGluZm8tPm5lc3RlZF9odm0pKSkg
eworICAgICAgICAgICAgTE9HKEVSUk9SLCAiQ291bGRuJ3Qgc2V0IEhWTV9QQVJBTV9ORVNURURI
Vk0iKTsKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CisgICAgICAgIGlmICh4Y19o
dm1fcGFyYW1fc2V0KHhjaCwgZG9taWQsIEhWTV9QQVJBTV9BTFRQMk0sIGFsdHAybSkpIHsKKyAg
ICAgICAgICAgIExPRyhFUlJPUiwgIkNvdWxkbid0IHNldCBIVk1fUEFSQU1fQUxUUDJNIik7Cisg
ICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQorICAgICAgICBicmVhazsKKworICAgIGRl
ZmF1bHQ6CisgICAgICAgIGFib3J0KCk7CisgICAgfQorCisgICAgcmV0ID0gMDsKKworIG91dDoK
KyAgICByZXR1cm4gcmV0OworfQorCiBpbnQgbGlieGxfX2FyY2hfZG9tYWluX2NyZWF0ZShsaWJ4
bF9fZ2MgKmdjLCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKICAgICAgICAgdWludDMy
X3QgZG9taWQpCiB7CisgICAgY29uc3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8gPSAm
ZF9jb25maWctPmJfaW5mbzsKICAgICBpbnQgcmV0ID0gMDsKICAgICBpbnQgdHNjX21vZGU7CiAg
ICAgdWludDMyX3QgcnRjX3RpbWVvZmZzZXQ7CiAgICAgbGlieGxfY3R4ICpjdHggPSBsaWJ4bF9f
Z2Nfb3duZXIoZ2MpOwogCisgICAgaWYgKGluZm8tPnR5cGUgIT0gTElCWExfRE9NQUlOX1RZUEVf
UFYgJiYKKyAgICAgICAgKHJldCA9IGh2bV9zZXRfY29uZl9wYXJhbXMoZ2MsIGRvbWlkLCBpbmZv
KSkgIT0gMCkKKyAgICAgICAgZ290byBvdXQ7CisKKyAgICBpZiAoaW5mby0+dHlwZSA9PSBMSUJY
TF9ET01BSU5fVFlQRV9IVk0gJiYKKyAgICAgICAgKHJldCA9IGh2bV9zZXRfdmlyaWRpYW5fZmVh
dHVyZXMoZ2MsIGRvbWlkLCBpbmZvKSkgIT0gMCkKKyAgICAgICAgZ290byBvdXQ7CisKICAgICBp
ZiAoZF9jb25maWctPmJfaW5mby50eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX1BWKQogICAgICAg
ICB4Y19kb21haW5fc2V0X21lbW1hcF9saW1pdChjdHgtPnhjaCwgZG9taWQsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChkX2NvbmZpZy0+Yl9pbmZvLm1heF9tZW1rYiArCkBA
IC0zMjIsOCArNTAxLDYgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9jcmVhdGUobGlieGxfX2dj
ICpnYywgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAgICAgICAgIGdvdG8gb3V0Owog
ICAgIH0KIAotICAgIGlmIChsaWJ4bF9kZWZib29sX3ZhbChkX2NvbmZpZy0+Yl9pbmZvLmRpc2Fi
bGVfbWlncmF0ZSkpCi0gICAgICAgIHhjX2RvbWFpbl9kaXNhYmxlX21pZ3JhdGUoY3R4LT54Y2gs
IGRvbWlkKTsKICAgICBydGNfdGltZW9mZnNldCA9IGRfY29uZmlnLT5iX2luZm8ucnRjX3RpbWVv
ZmZzZXQ7CiAgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGRfY29uZmlnLT5iX2luZm8ubG9jYWx0
aW1lKSkgewogICAgICAgICB0aW1lX3QgdDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
