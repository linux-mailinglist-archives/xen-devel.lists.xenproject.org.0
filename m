Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD282EE3DF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:33:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iReJl-0008AV-Uz; Mon, 04 Nov 2019 15:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zIFX=Y4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iReJl-0008AQ-Cg
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:30:57 +0000
X-Inumbo-ID: 18199a40-ff18-11e9-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18199a40-ff18-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 15:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572881457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OVNr69J7iTrUVesWz3pgyddyZJTZVh8zfOLdea2x1TM=;
 b=fMezACitx+w2rh7sP2A6K0bZitQS1RhW1kpAM/yXHO4kgJ1s0U2yEUfa
 EFF0ZGdAfdYYzdUfGws+xIwvS8a+olcmKgfrJfXPCoAN6hbmpllzBI04a
 aDFLBv54/kJN4G3LamiwZV+qP8z3mC7/muNPE9htp3JmCGT2cQpFIFhvN w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0MyA82dzbK6BqnQtYFX4tUHkQof9KN8RvXNozCxLWPE/f+YUXSG4nzEaIXQYF/RgPNRYsmc4T0
 N73MQC666P4uWvU5Hqk0zcTXWr9MDxUf2qPMFLugVImrmaVV+/E3071FjO8JRBvKpaO1Dvfsz7
 vj+AsBa7ZSvZRLpuO8wc0NrUGq0nAyD6CEBHOorry1+ts82Ix46Utp4WGx8SUBatznhm4lizgT
 SZW2R3sgGuEsiIbMxi74pQlrvNOmt/xDlWq+iHudtlEgkVrENHHD/pYGjW42+cB33VXQ0ZWLhJ
 yy0=
X-SBRS: 2.7
X-MesageID: 7811060
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="7811060"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 4 Nov 2019 15:30:47 +0000
Message-ID: <20191104153047.568013-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix setting vncpasswd to
 empty string
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
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmVmb3JlIDkzZGNjMjIsIGVycm9yIGZyb20gc2V0dGluZyB0aGUgdm5jIHBhc3N3b3JkIHRvIGFu
IGVtcHR5CnN0cmluZywgd2hlbiBRRU1VIHdhc24ndCBleHBlY3RlZCBhIHBhc3N3b3JkLCBuZXZl
ciBwcmV2ZW50ZWQgdGhlIGNyZWF0aW9uCm9mIGEgZ3Vlc3QsIGFuZCBvbmx5IGxvZ2dlZCBhbiBl
cnJvciBtZXNzYWdlLgoKUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpGaXhlczogOTNkY2MyMmZlNzk4YzlmYTVjZTExN2YxZWQ2ZGIwZDhiZDc3OTAy
MApTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGli
eGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggN2U1MmYwOTczMTcyLi44ZTBm
Yjc4YmQyZjMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMv
bGlieGwvbGlieGxfZG0uYwpAQCAtMjkzNiw3ICsyOTM2LDcgQEAgc3RhdGljIHZvaWQgZGV2aWNl
X21vZGVsX3Bvc3Rjb25maWdfdm5jKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgaWYgKHJjKSBn
b3RvIG91dDsKICAgICB9CiAKLSAgICBpZiAodm5jICYmIHZuYy0+cGFzc3dkKSB7CisgICAgaWYg
KHZuYyAmJiB2bmMtPnBhc3N3ZCAmJiB2bmMtPnBhc3N3ZFswXSkgewogICAgICAgICBxbXAtPmNh
bGxiYWNrID0gZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfdm5jX3Bhc3N3ZDsKICAgICAgICAgbGli
eGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgInBhc3N3b3JkIiwgdm5jLT5wYXNz
d2QpOwogICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAiY2hhbmdlLXZu
Yy1wYXNzd29yZCIsIGFyZ3MpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
