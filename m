Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEB124A02
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:45:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaX8-0004Nm-RG; Wed, 18 Dec 2019 14:42:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihaX7-0004Ng-Pt
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:42:37 +0000
X-Inumbo-ID: a23c0862-21a4-11ea-a914-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a23c0862-21a4-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 14:42:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so2106337wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 06:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+N7tWGaF5ILnM83JwOZQCbkB3hDbIn5eAo1LQt3tYvc=;
 b=jsT6xTFnBnYvIPGCOfvmlBiPcTdPJDQSBBkdfM+a/nyfvsiom8Zt8Y5lQp59pfENf8
 NVgrBYJIwZnoAzxZX6KmGSP7DRuUBcEdQaxX2mGBTzTEl91VVKu+8vNCYfDpHowYw4sM
 ztvXjbs/lVP4D50ECZlOgar/TLG+qOMOHuDOBrg0YfzNgEagE86a94s/6x8qJUqJ5k8n
 P5yHBOsoC+UWs++gohiOL1Aoy4otpFCLLh/Q27iwuJ2PzG5NzXYCYXg/ZUDBudwvNvOo
 J5XGpzAm2TBZP+kq83vsmU2SPvWjmhpJyTpbcFQ8wY0qKxsnvyoa0MH8XkDuEhYW0WvF
 9LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+N7tWGaF5ILnM83JwOZQCbkB3hDbIn5eAo1LQt3tYvc=;
 b=BAKzg10m41fwfEAJ+OHQ1DSsKV2rncH7lhNPr91FC3zqDk8JndS82ROOHMV4kNOXoL
 JwM8fRDnNOguGjyjt6KnNIYEPpIvo3OQP0h/i9v+RzRTEhB6SKWnIHJ0XvFTw74I9G8s
 1fDZcX79OdcMsMnlLsANJSurjsyxLrUq7Smu1mKqT5l+xP7xOouwgOmZ+pJIMV2Xyugm
 hgbyQDIQqJHUEQkoH6LFawh7xXIKCq6uLqAeYlWGO0ah7PW9KZVMmTN2594AFYkVKAQk
 mdElpBiGay3U7CPduK6NwDkAvcghYZrSBcFDkJsemNNBi0E7g1nrl3NXloyQDj+x87io
 zbEQ==
X-Gm-Message-State: APjAAAXlWY7361yE6ZWTCwNVERC/yj57fnX7Xd2KAi0egdejTTGyHorC
 8ILvDyEN6tIlQREeZANvEo1ZQdRb
X-Google-Smtp-Source: APXvYqzVgJ7D02N2HXmBBRmn4DQgVCdjCeLoggWeBVHS+AOdSGEeUUh2TzRMA0vPdp47wn7XXgMfAQ==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr3781940wmi.107.1576680156376; 
 Wed, 18 Dec 2019 06:42:36 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p17sm2724894wmk.30.2019.12.18.06.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:42:35 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 14:42:27 +0000
Message-Id: <20191218144233.15372-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/6] Implement Hyper-V reference TSC based
 clock source
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpUaGlzIHNlcmllcyBhZGRzIGEgY2xvY2sgc291cmNlIGJhc2VkIG9uIEh5cGVyLVYn
cyByZWZlcmVuY2UgVFNDLiBUaGUKbWVhdCBpcyBpbiB0aGUgbGFzdCBwYXRjaC4gSSBhbHNvIHB1
dCBpbiBzb21lIGNsZWFuIHVwIHBhdGNoZXMgdG8gWGVuJ3MKdmlyaWRpYW4gY29kZSBwZXIgUGF1
bCdzIHJlcXVlc3QuCgpXaXRoIHRoaXMgc2VyaWVzLCBYZW4gb24gSHlwZXItViBubyBsb25nZXIg
cnVucyBvbiBlbXVsYXRlZCBQSVQuCgooWEVOKSBQbGF0Zm9ybSB0aW1lciBpcyAyMjk0LjY4Nk1I
eiBIWVBFUi1WIFJFRkVSRU5DRSBUU0MKCldlaS4KCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpD
YzogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgpDYzogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29t
PgoKV2VpIExpdSAoNik6CiAgeDg2OiBpbXBvcnQgaHlwZXJ2LXRsZnMuaCBmcm9tIExpbnV4CiAg
eDg2L3ZpcmlkaWFuOiBkcm9wIGR1cGxpY2F0ZSBkZWZpbmVzIGZyb20gcHJpdmF0ZS5oIGFuZCB2
aXJpZGlhbi5jCiAgeDg2L3ZpcmlkaWFuOiBkcm9wIHByaXZhdGUgY29weSBvZiBkZWZpbml0aW9u
cyBmcm9tIHN5bmljLmMKICB4ODYvdmlyaWRpYW46IGRyb3AgcHJpdmF0ZSBjb3B5IG9mIEhWX1JF
RkVSRU5DRV9UU0NfUEFHRSBpbiB0aW1lLmMKICB4ODYvaHlwZXJ2OiBleHRyYWN0IG1vcmUgaW5m
b3JtYXRpb24gZnJvbSBIeXBlci1WCiAgeDg2OiBpbXBsZW1lbnQgSHlwZXItViBjbG9jayBzb3Vy
Y2UKCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgfCAgMTcgKwogeGVu
L2FyY2gveDg2L2h2bS92aXJpZGlhbi9wcml2YXRlLmggICAgIHwgIDY2IC0tCiB4ZW4vYXJjaC94
ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMgICAgICAgfCAgNjggKy0KIHhlbi9hcmNoL3g4Ni9odm0v
dmlyaWRpYW4vdGltZS5jICAgICAgICB8ICAzMCArLQogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlh
bi92aXJpZGlhbi5jICAgIHwgIDIzICstCiB4ZW4vYXJjaC94ODYvdGltZS5jICAgICAgICAgICAg
ICAgICAgICAgfCAxMDEgKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZz
LmggfCA5MDcgKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVydi5oICAgICAgfCAgMTIgKwogOCBmaWxlcyBjaGFuZ2VkLCAxMDcwIGluc2VydGlv
bnMoKyksIDE1NCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKCi0tCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
