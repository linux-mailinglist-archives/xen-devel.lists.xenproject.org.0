Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348D45A9F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 12:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbjb5-0002mR-Er; Fri, 14 Jun 2019 10:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbjb3-0002la-DJ
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 10:38:13 +0000
X-Inumbo-ID: 817943e4-8e90-11e9-a75c-0f081994aedc
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 817943e4-8e90-11e9-a75c-0f081994aedc;
 Fri, 14 Jun 2019 10:38:11 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0qVhVYaT2jvmX7RtBgudh/cq9gDSB3xQ8GnS8dWit037PN9fRcvBUU6+jE1bW7fhS93LScEAbE
 Ryq2VrO+zL01YJ02mbQ9OF7mDj1GqbY/wD+GvWmv404HoYz2x6hofEBm7TNCiRqeL+q9OhKVoH
 dSrHbTdpBWcwvrb4WFVYzvWUVzDmcC/bDsNlQ1G8GqUrvryEBkiPcxSC7MOiMwfQRnPB2ePNez
 1OzVpcwNHfnNOYkEc1D7qNxfBdST4io7YEWPxvSIMH3vwPGerKL9Sm/o+BUMQWpySthK45Lyc+
 Buw=
X-SBRS: 2.7
X-MesageID: 1722753
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1722753"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 11:37:58 +0100
Message-ID: <20190614103801.22619-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614103801.22619-1-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 6/9] libxl_disk: Cut libxl_cdrom_insert into
 steps ..
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYW5kIHVzZSBhIG5ldyAic2xvdyIgbG9jayB0byBhdm9pZCBob2xkaW5nIHRoZSB1c2VyZGF0
YSBsb2NrIGFjcm9zcwpzZXZlcmFsIGZ1bmN0aW9ucy4KClRoaXMgcGF0Y2ggY3V0cyBsaWJ4bF9j
ZHJvbV9pbnNlcnQgaW50byBkaWZmZXJlbnQgc3RlcC9mdW5jdGlvbiBidXQKdGhlcmUgYXJlIHN0
aWxsIGNhbGxlZCBzeW5jaHJvbm91c2x5LiAoVGFraW5nIHRoZSBldl9sb2NrIGlzIHRoZSBvbmx5
CnN0ZXAgdGhhdCBtaWdodCBiZSBhc3luY2hyb25vdXMuKSBBIGxhdGVyIHBhdGNoIHdpbGwgY2Fs
bCB0aGVtCmFzeW5jaHJvbm91c2x5IHdoZW4gUU1QIGlzIGludm9sdmVkLgoKVGhlZSB1c2VyZGF0
YSBsb2NrIChqc29uX2xvY2spIHVzZSB0byBwcm90ZWN0IGFnYWluc3QgY29uY3VycmVudCBjaGFu
Z2UKb2YgY2Ryb20gaXMgcmVwbGFjZWQgYnkgYW4gZXZfbG9jayB3aGljaCBjYW4gYmUgaGVsZCBh
Y3Jvc3MgZGlmZmVyZW50CkNUWF9MT0NLIHNlY3Rpb25zLiBUaGUganNvbl9sb2NrIGlzIHN0aWxs
IHVzZWQgd2hlbiByZWFkaW5nL21vZGlmeWluZwp0aGUgZG9tYWluIHVzZXJkYXRhIChtYW5kYXRv
cnkpIGFuZCB1cGRhdGUgeGVuc3RvcmUgKG1vc3RseSBiZWNhdXNlCml0J3MgdXBkYXRlZCBhcyB0
aGUgc2FtZSB0aW1lIGFzIHRoZSB1c2VyZGF0YSkuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYyOgogICAg
LSByZXdyaXRlIHBhdGNoIGRlc2NyaXB0aW9uCiAgICAtIHJld29yayB1c2Ugb2YgdGhlIG5ldyBs
b2NrCgogdG9vbHMvbGlieGwvbGlieGxfZGlzay5jIHwgMTk2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1NSBpbnNlcnRpb25zKCspLCA0
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgYi90
b29scy9saWJ4bC9saWJ4bF9kaXNrLmMKaW5kZXggNDViZjU1NTA2MS4uNWYxM2E2MjJmOSAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZGlzay5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2Rpc2suYwpAQCAtNjQyLDI0ICs2NDIsNDMgQEAgaW50IGxpYnhsX2RldmljZV9kaXNrX2dldGlu
Zm8obGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAogICAgIHJldHVybiByYzsKIH0KIAor
dHlwZWRlZiBzdHJ1Y3QgeworICAgIGxpYnhsX19hbyAqYW87CisgICAgbGlieGxfZG9taWQgZG9t
aWQ7CisgICAgbGlieGxfZGV2aWNlX2Rpc2sgKmRpc2s7CisgICAgbGlieGxfZGV2aWNlX2Rpc2sg
ZGlza19zYXZlZDsKKyAgICBsaWJ4bF9fZXZfbG9jayBxbXBfbG9jazsKKyAgICBpbnQgZG1fdmVy
OworfSBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlOworCitzdGF0aWMgdm9pZCBjZHJvbV9pbnNl
cnRfbG9ja19hY3F1aXJlZChsaWJ4bF9fZWdjICosIGxpYnhsX19ldl9sb2NrICosCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpOworc3RhdGljIHZvaWQgY2Ry
b21faW5zZXJ0X2VqZWN0ZWQobGlieGxfX2VnYyAqZWdjLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGlieGxfX2Nkcm9tX2luc2VydF9zdGF0ZSAqY2lzKTsKK3N0YXRpYyB2b2lk
IGNkcm9tX2luc2VydF9pbnNlcnRlZChsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfX2Nkcm9tX2luc2VydF9zdGF0ZSAqY2lzKTsKK3N0YXRp
YyB2b2lkIGNkcm9tX2luc2VydF9kb25lKGxpYnhsX19lZ2MgKmVnYywKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUgKmNpcywKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCByYyk7CisKIGludCBsaWJ4bF9jZHJvbV9pbnNlcnQo
bGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kZXZpY2VfZGlzayAqZGlzaywK
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykK
IHsKICAgICBBT19DUkVBVEUoY3R4LCBkb21pZCwgYW9faG93KTsKICAgICBpbnQgbnVtID0gMCwg
aTsKLSAgICBsaWJ4bF9kZXZpY2VfZGlzayAqZGlza3MgPSBOVUxMLCBkaXNrX3NhdmVkOwotICAg
IGxpYnhsX2RvbWFpbl9jb25maWcgZF9jb25maWc7Ci0gICAgaW50IHJjLCBkbV92ZXI7Ci0gICAg
bGlieGxfX2RldmljZSBkZXZpY2U7Ci0gICAgY29uc3QgY2hhciAqYmVfcGF0aCwgKmxpYnhsX3Bh
dGg7Ci0gICAgY2hhciAqIHRtcDsKLSAgICBsaWJ4bF9fZG9tYWluX3VzZXJkYXRhX2xvY2sgKmxv
Y2sgPSBOVUxMOwotICAgIHhzX3RyYW5zYWN0aW9uX3QgdCA9IFhCVF9OVUxMOwotICAgIGZsZXhh
cnJheV90ICppbnNlcnQgPSBOVUxMLCAqZW1wdHkgPSBOVUxMOwotCi0gICAgbGlieGxfZG9tYWlu
X2NvbmZpZ19pbml0KCZkX2NvbmZpZyk7Ci0gICAgbGlieGxfZGV2aWNlX2Rpc2tfaW5pdCgmZGlz
a19zYXZlZCk7Ci0gICAgbGlieGxfZGV2aWNlX2Rpc2tfY29weShjdHgsICZkaXNrX3NhdmVkLCBk
aXNrKTsKKyAgICBsaWJ4bF9kZXZpY2VfZGlzayAqZGlza3MgPSBOVUxMOworICAgIGludCByYzsK
KyAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXM7CisKKyAgICBHQ05FVyhjaXMpOwor
ICAgIGNpcy0+YW8gPSBhbzsKKyAgICBjaXMtPmRvbWlkID0gZG9taWQ7CisgICAgY2lzLT5kaXNr
ID0gZGlzazsKKyAgICBsaWJ4bF9kZXZpY2VfZGlza19pbml0KCZjaXMtPmRpc2tfc2F2ZWQpOwor
ICAgIGxpYnhsX2RldmljZV9kaXNrX2NvcHkoY3R4LCAmY2lzLT5kaXNrX3NhdmVkLCBkaXNrKTsK
KyAgICBsaWJ4bF9fZXZfbG9ja19pbml0KCZjaXMtPnFtcF9sb2NrKTsKKyAgICBjaXMtPnFtcF9s
b2NrLmFvID0gYW87CisgICAgY2lzLT5xbXBfbG9jay5kb21pZCA9IGRvbWlkOwogCiAgICAgbGli
eGxfZG9tYWluX3R5cGUgdHlwZSA9IGxpYnhsX19kb21haW5fdHlwZShnYywgZG9taWQpOwogICAg
IGlmICh0eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0lOVkFMSUQpIHsKQEAgLTY3OCw4ICs2OTcs
OCBAQCBpbnQgbGlieGxfY2Ryb21faW5zZXJ0KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21p
ZCwgbGlieGxfZGV2aWNlX2Rpc2sgKmRpc2ssCiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAot
ICAgIGRtX3ZlciA9IGxpYnhsX19kZXZpY2VfbW9kZWxfdmVyc2lvbl9ydW5uaW5nKGdjLCBkb21p
ZCk7Ci0gICAgaWYgKGRtX3ZlciA9PSAtMSkgeworICAgIGNpcy0+ZG1fdmVyID0gbGlieGxfX2Rl
dmljZV9tb2RlbF92ZXJzaW9uX3J1bm5pbmcoZ2MsIGRvbWlkKTsKKyAgICBpZiAoY2lzLT5kbV92
ZXIgPT0gLTEpIHsKICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJDYW5ub3QgZGV0ZXJtaW5l
IGRldmljZSBtb2RlbCB2ZXJzaW9uIik7CiAgICAgICAgIHJjID0gRVJST1JfRkFJTDsKICAgICAg
ICAgZ290byBvdXQ7CkBAIC03MDgsNDAgKzcyNyw4MiBAQCBpbnQgbGlieGxfY2Ryb21faW5zZXJ0
KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNlX2Rpc2sgKmRpc2ss
CiAgICAgICAgIGRpc2stPmZvcm1hdCA9IExJQlhMX0RJU0tfRk9STUFUX0VNUFRZOwogICAgIH0K
IAotICAgIHJjID0gbGlieGxfX2RldmljZV9mcm9tX2Rpc2soZ2MsIGRvbWlkLCBkaXNrLCAmZGV2
aWNlKTsKLSAgICBpZiAocmMpIGdvdG8gb3V0Oworb3V0OgorICAgIGxpYnhsX19kZXZpY2VfbGlz
dF9mcmVlKCZsaWJ4bF9fZGlza19kZXZ0eXBlLCBkaXNrcywgbnVtKTsKKyAgICBpZiAocmMpIHsK
KyAgICAgICAgY2Ryb21faW5zZXJ0X2RvbmUoZWdjLCBjaXMsIHJjKTsgLyogbXVzdCBiZSBsYXN0
ICovCisgICAgfSBlbHNlIHsKKyAgICAgICAgY2lzLT5xbXBfbG9jay5jYWxsYmFjayA9IGNkcm9t
X2luc2VydF9sb2NrX2FjcXVpcmVkOworICAgICAgICBsaWJ4bF9fZXZfbG9ja19nZXQoZWdjLCAm
Y2lzLT5xbXBfbG9jayk7IC8qIG11c3QgYmUgbGFzdCAqLworICAgIH0KKyAgICByZXR1cm4gQU9f
SU5QUk9HUkVTUzsKK30KIAotICAgIGJlX3BhdGggPSBsaWJ4bF9fZGV2aWNlX2JhY2tlbmRfcGF0
aChnYywgJmRldmljZSk7Ci0gICAgbGlieGxfcGF0aCA9IGxpYnhsX19kZXZpY2VfbGlieGxfcGF0
aChnYywgJmRldmljZSk7CitzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfbG9ja19hY3F1aXJlZChs
aWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
aWJ4bF9fZXZfbG9jayAqbG9jaywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCByYykKK3sKKyAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXMgPSBDT05U
QUlORVJfT0YobG9jaywgKmNpcywgcW1wX2xvY2spOworICAgIFNUQVRFX0FPX0dDKGNpcy0+YW8p
OwogCi0gICAgLyogTm90ZTogQ1RYIGxvY2sgaXMgYWxyZWFkeSBoZWxkIGF0IHRoaXMgcG9pbnQg
c28gbG9jayBoaWVyYXJjaHkKLSAgICAgKiBpcyBtYWludGFpbmVkLgotICAgICAqLwotICAgIGxv
Y2sgPSBsaWJ4bF9fbG9ja19kb21haW5fdXNlcmRhdGEoZ2MsIGRvbWlkKTsKLSAgICBpZiAoIWxv
Y2spIHsKLSAgICAgICAgcmMgPSBFUlJPUl9MT0NLX0ZBSUw7Ci0gICAgICAgIGdvdG8gb3V0Owot
ICAgIH0KKyAgICBpZiAocmMpIGdvdG8gb3V0OwogCiAgICAgLyogV2UgbmVlZCB0byBlamVjdCB0
aGUgb3JpZ2luYWwgaW1hZ2UgZmlyc3QuIFRoaXMgaXMgaW1wbGVtZW50ZWQKICAgICAgKiBieSBp
bnNlcnRpbmcgZW1wdHkgbWVkaWEuIEpTT04gaXMgbm90IHVwZGF0ZWQuCiAgICAgICovCiAKLSAg
ICBpZiAoZG1fdmVyID09IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOKSB7Cisg
ICAgaWYgKGNpcy0+ZG1fdmVyID09IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVO
KSB7CiAgICAgICAgIGxpYnhsX2RldmljZV9kaXNrIGRpc2tfZW1wdHk7CiAKICAgICAgICAgbGli
eGxfZGV2aWNlX2Rpc2tfaW5pdCgmZGlza19lbXB0eSk7CiAgICAgICAgIGRpc2tfZW1wdHkuZm9y
bWF0ID0gTElCWExfRElTS19GT1JNQVRfRU1QVFk7Ci0gICAgICAgIGRpc2tfZW1wdHkudmRldiA9
IGxpYnhsX19zdHJkdXAoTk9HQywgZGlzay0+dmRldik7CisgICAgICAgIGRpc2tfZW1wdHkudmRl
diA9IGxpYnhsX19zdHJkdXAoTk9HQywgY2lzLT5kaXNrLT52ZGV2KTsKICAgICAgICAgZGlza19l
bXB0eS5wZGV2X3BhdGggPSBsaWJ4bF9fc3RyZHVwKE5PR0MsICIiKTsKICAgICAgICAgZGlza19l
bXB0eS5pc19jZHJvbSA9IDE7Ci0gICAgICAgIGxpYnhsX19kZXZpY2VfZGlza19zZXRkZWZhdWx0
KGdjLCBkb21pZCwgJmRpc2tfZW1wdHksIGZhbHNlKTsKKyAgICAgICAgbGlieGxfX2RldmljZV9k
aXNrX3NldGRlZmF1bHQoZ2MsIGNpcy0+ZG9taWQsICZkaXNrX2VtcHR5LCBmYWxzZSk7CiAKLSAg
ICAgICAgcmMgPSBsaWJ4bF9fcW1wX2luc2VydF9jZHJvbShnYywgZG9taWQsICZkaXNrX2VtcHR5
KTsKKyAgICAgICAgcmMgPSBsaWJ4bF9fcW1wX2luc2VydF9jZHJvbShnYywgY2lzLT5kb21pZCwg
JmRpc2tfZW1wdHkpOwogICAgICAgICBsaWJ4bF9kZXZpY2VfZGlza19kaXNwb3NlKCZkaXNrX2Vt
cHR5KTsKICAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKICAgICB9CiAKKyAgICBjZHJvbV9pbnNl
cnRfZWplY3RlZChlZ2MsIGNpcyk7IC8qIG11c3QgYmUgbGFzdCAqLworICAgIHJldHVybjsKKwor
b3V0OgorICAgIGNkcm9tX2luc2VydF9kb25lKGVnYywgY2lzLCByYyk7IC8qIG11c3QgYmUgbGFz
dCAqLworfQorCitzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfZWplY3RlZChsaWJ4bF9fZWdjICpl
Z2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0
X3N0YXRlICpjaXMpCit7CisgICAgRUdDX0dDOworICAgIGludCByYzsKKyAgICBsaWJ4bF9fZG9t
YWluX3VzZXJkYXRhX2xvY2sgKmRhdGFfbG9jayA9IE5VTEw7CisgICAgbGlieGxfX2RldmljZSBk
ZXZpY2U7CisgICAgY29uc3QgY2hhciAqYmVfcGF0aCwgKmxpYnhsX3BhdGg7CisgICAgZmxleGFy
cmF5X3QgKmVtcHR5ID0gTlVMTDsKKyAgICB4c190cmFuc2FjdGlvbl90IHQgPSBYQlRfTlVMTDsK
KyAgICBjaGFyICp0bXA7CisgICAgbGlieGxfZG9tYWluX2NvbmZpZyBkX2NvbmZpZzsKKworICAg
IC8qIGNvbnZlbmllbmNlIGFsaWFzZXMgKi8KKyAgICBsaWJ4bF9kb21pZCBkb21pZCA9IGNpcy0+
ZG9taWQ7CisgICAgbGlieGxfZGV2aWNlX2Rpc2sgKmRpc2sgPSBjaXMtPmRpc2s7CisKKyAgICBs
aWJ4bF9kb21haW5fY29uZmlnX2luaXQoJmRfY29uZmlnKTsKKworICAgIHJjID0gbGlieGxfX2Rl
dmljZV9mcm9tX2Rpc2soZ2MsIGRvbWlkLCBkaXNrLCAmZGV2aWNlKTsKKyAgICBpZiAocmMpIGdv
dG8gb3V0OworICAgIGJlX3BhdGggPSBsaWJ4bF9fZGV2aWNlX2JhY2tlbmRfcGF0aChnYywgJmRl
dmljZSk7CisgICAgbGlieGxfcGF0aCA9IGxpYnhsX19kZXZpY2VfbGlieGxfcGF0aChnYywgJmRl
dmljZSk7CisKKyAgICBkYXRhX2xvY2sgPSBsaWJ4bF9fbG9ja19kb21haW5fdXNlcmRhdGEoZ2Ms
IGRvbWlkKTsKKyAgICBpZiAoIWRhdGFfbG9jaykgeworICAgICAgICByYyA9IEVSUk9SX0xPQ0tf
RkFJTDsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorCiAgICAgZW1wdHkgPSBmbGV4YXJyYXlf
bWFrZShnYywgNCwgMSk7CiAgICAgZmxleGFycmF5X2FwcGVuZF9wYWlyKGVtcHR5LCAidHlwZSIs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kZXZpY2VfZGlza19zdHJpbmdfb2Zf
YmFja2VuZChkaXNrLT5iYWNrZW5kKSk7CkBAIC03ODAsMTYgKzg0MSw2NiBAQCBpbnQgbGlieGxf
Y2Ryb21faW5zZXJ0KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNl
X2Rpc2sgKmRpc2ssCiAgICAgcmMgPSBsaWJ4bF9fZ2V0X2RvbWFpbl9jb25maWd1cmF0aW9uKGdj
LCBkb21pZCwgJmRfY29uZmlnKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCi0gICAgZGV2aWNl
X2FkZF9kb21haW5fY29uZmlnKGdjLCAmZF9jb25maWcsICZsaWJ4bF9fZGlza19kZXZ0eXBlLCAm
ZGlza19zYXZlZCk7CisgICAgZGV2aWNlX2FkZF9kb21haW5fY29uZmlnKGdjLCAmZF9jb25maWcs
ICZsaWJ4bF9fZGlza19kZXZ0eXBlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY2lz
LT5kaXNrX3NhdmVkKTsKIAogICAgIHJjID0gbGlieGxfX2RtX2NoZWNrX3N0YXJ0KGdjLCAmZF9j
b25maWcsIGRvbWlkKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCi0gICAgaWYgKGRtX3ZlciA9
PSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTikgeworICAgIGlmIChjaXMtPmRt
X3ZlciA9PSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTikgewogICAgICAgICBy
YyA9IGxpYnhsX19xbXBfaW5zZXJ0X2Nkcm9tKGdjLCBkb21pZCwgZGlzayk7CiAgICAgICAgIGlm
IChyYykgZ290byBvdXQ7CiAgICAgfQogCisgICAgcmMgPSAwOworCitvdXQ6CisgICAgbGlieGxf
X3hzX3RyYW5zYWN0aW9uX2Fib3J0KGdjLCAmdCk7CisgICAgbGlieGxfZG9tYWluX2NvbmZpZ19k
aXNwb3NlKCZkX2NvbmZpZyk7CisgICAgaWYgKGRhdGFfbG9jaykgbGlieGxfX3VubG9ja19kb21h
aW5fdXNlcmRhdGEoZGF0YV9sb2NrKTsKKyAgICBpZiAocmMpIHsKKyAgICAgICAgY2Ryb21faW5z
ZXJ0X2RvbmUoZWdjLCBjaXMsIHJjKTsgLyogbXVzdCBiZSBsYXN0ICovCisgICAgfSBlbHNlIHsK
KyAgICAgICAgY2Ryb21faW5zZXJ0X2luc2VydGVkKGVnYywgY2lzKTsgLyogbXVzdCBiZSBsYXN0
ICovCisgICAgfQorfQorCitzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfaW5zZXJ0ZWQobGlieGxf
X2VnYyAqZWdjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19jZHJv
bV9pbnNlcnRfc3RhdGUgKmNpcykKK3sKKyAgICBFR0NfR0M7CisgICAgaW50IHJjOworICAgIGxp
YnhsX19kb21haW5fdXNlcmRhdGFfbG9jayAqZGF0YV9sb2NrID0gTlVMTDsKKyAgICBsaWJ4bF9k
b21haW5fY29uZmlnIGRfY29uZmlnOworICAgIGZsZXhhcnJheV90ICppbnNlcnQgPSBOVUxMOwor
ICAgIHhzX3RyYW5zYWN0aW9uX3QgdCA9IFhCVF9OVUxMOworICAgIGxpYnhsX19kZXZpY2UgZGV2
aWNlOworICAgIGNvbnN0IGNoYXIgKmJlX3BhdGgsICpsaWJ4bF9wYXRoOworICAgIGNoYXIgKnRt
cDsKKworICAgIC8qIGNvbnZlbmllbmNlIGFsaWFzZXMgKi8KKyAgICBsaWJ4bF9kb21pZCBkb21p
ZCA9IGNpcy0+ZG9taWQ7CisgICAgbGlieGxfZGV2aWNlX2Rpc2sgKmRpc2sgPSBjaXMtPmRpc2s7
CisKKyAgICBsaWJ4bF9kb21haW5fY29uZmlnX2luaXQoJmRfY29uZmlnKTsKKworICAgIHJjID0g
bGlieGxfX2RldmljZV9mcm9tX2Rpc2soZ2MsIGRvbWlkLCBkaXNrLCAmZGV2aWNlKTsKKyAgICBp
ZiAocmMpIGdvdG8gb3V0OworICAgIGJlX3BhdGggPSBsaWJ4bF9fZGV2aWNlX2JhY2tlbmRfcGF0
aChnYywgJmRldmljZSk7CisgICAgbGlieGxfcGF0aCA9IGxpYnhsX19kZXZpY2VfbGlieGxfcGF0
aChnYywgJmRldmljZSk7CisKKyAgICBkYXRhX2xvY2sgPSBsaWJ4bF9fbG9ja19kb21haW5fdXNl
cmRhdGEoZ2MsIGRvbWlkKTsKKyAgICBpZiAoIWRhdGFfbG9jaykgeworICAgICAgICByYyA9IEVS
Uk9SX0xPQ0tfRkFJTDsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgcmMgPSBsaWJ4
bF9fZ2V0X2RvbWFpbl9jb25maWd1cmF0aW9uKGdjLCBkb21pZCwgJmRfY29uZmlnKTsKKyAgICBp
ZiAocmMpIGdvdG8gb3V0OworCisgICAgZGV2aWNlX2FkZF9kb21haW5fY29uZmlnKGdjLCAmZF9j
b25maWcsICZsaWJ4bF9fZGlza19kZXZ0eXBlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmY2lzLT5kaXNrX3NhdmVkKTsKKwogICAgIGluc2VydCA9IGZsZXhhcnJheV9tYWtlKGdjLCA0
LCAxKTsKICAgICBmbGV4YXJyYXlfYXBwZW5kX3BhaXIoaW5zZXJ0LCAidHlwZSIsCiAgICAgICAg
ICAgICAgICAgICAgICAgbGlieGxfX2RldmljZV9kaXNrX3N0cmluZ19vZl9iYWNrZW5kKGRpc2st
PmJhY2tlbmQpKTsKQEAgLTgzMCwyMSArOTQxLDI0IEBAIGludCBsaWJ4bF9jZHJvbV9pbnNlcnQo
bGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kZXZpY2VfZGlzayAqZGlzaywK
ICAgICAgICAgaWYgKHJjIDwgMCkgZ290byBvdXQ7CiAgICAgfQogCi0gICAgLyogc3VjY2Vzcywg
bm8gYWN0dWFsIGFzeW5jICovCi0gICAgbGlieGxfX2FvX2NvbXBsZXRlKGVnYywgYW8sIDApOwot
CiAgICAgcmMgPSAwOwogCiBvdXQ6CiAgICAgbGlieGxfX3hzX3RyYW5zYWN0aW9uX2Fib3J0KGdj
LCAmdCk7Ci0gICAgbGlieGxfX2RldmljZV9saXN0X2ZyZWUoJmxpYnhsX19kaXNrX2RldnR5cGUs
IGRpc2tzLCBudW0pOwotICAgIGxpYnhsX2RldmljZV9kaXNrX2Rpc3Bvc2UoJmRpc2tfc2F2ZWQp
OwogICAgIGxpYnhsX2RvbWFpbl9jb25maWdfZGlzcG9zZSgmZF9jb25maWcpOworICAgIGlmIChk
YXRhX2xvY2spIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRhKGRhdGFfbG9jayk7CisgICAg
Y2Ryb21faW5zZXJ0X2RvbmUoZWdjLCBjaXMsIHJjKTsgLyogbXVzdCBiZSBsYXN0ICovCit9CiAK
LSAgICBpZiAobG9jaykgbGlieGxfX3VubG9ja19kb21haW5fdXNlcmRhdGEobG9jayk7CitzdGF0
aWMgdm9pZCBjZHJvbV9pbnNlcnRfZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsaWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXMsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCit7CisgICAgRUdDX0dDOwogCi0gICAgaWYg
KHJjKSByZXR1cm4gQU9fQ1JFQVRFX0ZBSUwocmMpOwotICAgIHJldHVybiBBT19JTlBST0dSRVNT
OworICAgIGxpYnhsX19ldl91bmxvY2soZ2MsICZjaXMtPnFtcF9sb2NrKTsKKyAgICBsaWJ4bF9k
ZXZpY2VfZGlza19kaXNwb3NlKCZjaXMtPmRpc2tfc2F2ZWQpOworICAgIGxpYnhsX19hb19jb21w
bGV0ZShlZ2MsIGNpcy0+YW8sIHJjKTsKIH0KIAogLyogbGlieGxfX2FsbG9jX3ZkZXYgb25seSB3
b3JrcyBvbiB0aGUgbG9jYWwgZG9tYWluLCB0aGF0IGlzIHRoZSBkb21haW4KLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
