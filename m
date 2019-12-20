Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D741282EC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:54:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOJU-0005EA-0o; Fri, 20 Dec 2019 19:51:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiOJS-0005Dp-CO
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:51:50 +0000
X-Inumbo-ID: 24652dbe-2362-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24652dbe-2362-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 19:51:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d16so10505399wre.10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p63vANUUHWEiaTG5fEa7etsoj01L2p/h59chGd1If3w=;
 b=WvrmGTxkUZLbvsTmPoOjsQ7aNTFj99Yc9qsu72SmuE37wjzSsP0dk356wAc2carLgV
 2CtbtZcLOVRMAbWfVOoNqVTqvkM6v1rNufVdpzoIZ1V2DA8pK4AqMXSZbm1KNQ2IGszd
 DY3cO3VFvDjlbsY7eUx3cVGMpN8QUtV0PRYPlflgqtpG2kyb7iH+bp34lIZgHZn7GSD6
 BtwIRuZGZYNmWOS8TURS1AwJYR5Fgz5vqL4TvBr9klYWtjl0plltBY0WI8Ylt9kSn4BW
 hBARswRsPkkoym/5v4VDtdAm9DNR7M/FE4PWKH0VcJRnAh6YPuVq8ov326G/MXzHSexE
 Y1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p63vANUUHWEiaTG5fEa7etsoj01L2p/h59chGd1If3w=;
 b=a7xaM49prkBlbfpdz78uagYySITv/M1LO/uYygGTY2hF4zCmkRuw34dw4HatgcROQB
 VsraYmeziJFdfvlHch5KlJgL9AmgSb6PQqifk+oDA6pLQNoY6BOeDqXCa6nCn9NTUy7V
 6C30cSOfk7vQGFCcJBeFJpOcaVv2XOaprMA/nH88q7kha+ka2oCY3fqAH7Sk5JcYxbsB
 qrQOal6du6t8iAQx+j1tUk/saTYG/utdP1IbBpg5CZU9CSMqiq4NJ+DPC3RQ2HkZtc4y
 6U0mx3hi+2WtTA8sGSXormWFwcX5jZh4TQOmBreH0+uq20d531e4mR4w+s1q1RaecyTg
 Nzaw==
X-Gm-Message-State: APjAAAUOmJ6+UNl8JbFsHKP2Afcl0aQMSw2cIgGTfleNU1GnIAY7aJbT
 7fDYYP1YGaY9m66WKhXQ4wLAPxGW
X-Google-Smtp-Source: APXvYqw2prC6ibEdVfsX3UNHDe+TFEYmtnkAVF+mTWOBh8bEfgvQDlNCrkm3OKy+E4BolihQtcuA5g==
X-Received: by 2002:a05:6000:1142:: with SMTP id
 d2mr15998129wrx.253.1576871500770; 
 Fri, 20 Dec 2019 11:51:40 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id a184sm11006287wmf.29.2019.12.20.11.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 11:51:40 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 19:51:33 +0000
Message-Id: <20191220195135.20130-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220195135.20130-1-liuwe@microsoft.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/viridian: drop private copy of
 HV_REFERENCE_TSC_PAGE in time.c
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHRoZSBvbmUgZGVmaW5lZCBpbiBoeXBlcnYtdGxmcy5oIGluc3RlYWQuIE5vIGZ1bmN0aW9u
YWwgY2hhbmdlCmludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYyB8IDIwICsrKysr
Ky0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYyBi
L3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCmluZGV4IDZkZGNhMjliMjkuLjMyZTc5
YmJjYzQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCkBAIC0xMywxOSArMTMsMTEgQEAKIAog
I2luY2x1ZGUgPGFzbS9hcGljLmg+CiAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+CisjaW5jbHVkZSA8
YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+CiAK
ICNpbmNsdWRlICJwcml2YXRlLmgiCiAKLXR5cGVkZWYgc3RydWN0IF9IVl9SRUZFUkVOQ0VfVFND
X1BBR0UKLXsKLSAgICB1aW50MzJfdCBUc2NTZXF1ZW5jZTsKLSAgICB1aW50MzJfdCBSZXNlcnZl
ZDE7Ci0gICAgdWludDY0X3QgVHNjU2NhbGU7Ci0gICAgaW50NjRfdCAgVHNjT2Zmc2V0OwotICAg
IHVpbnQ2NF90IFJlc2VydmVkMls1MDldOwotfSBIVl9SRUZFUkVOQ0VfVFNDX1BBR0UsICpQSFZf
UkVGRVJFTkNFX1RTQ19QQUdFOwotCiBzdGF0aWMgdm9pZCB1cGRhdGVfcmVmZXJlbmNlX3RzYyhj
b25zdCBzdHJ1Y3QgZG9tYWluICpkLCBib29sIGluaXRpYWxpemUpCiB7CiAgICAgc3RydWN0IHZp
cmlkaWFuX2RvbWFpbiAqdmQgPSBkLT5hcmNoLmh2bS52aXJpZGlhbjsKQEAgLTYxLDcgKzUzLDcg
QEAgc3RhdGljIHZvaWQgdXBkYXRlX3JlZmVyZW5jZV90c2MoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCwgYm9vbCBpbml0aWFsaXplKQogICAgICAgICAgKiB2aW9sYXRlIHRoZSBzcGVjLiBhbmQgcmVs
eSBvbiBhIHZhbHVlIG9mIDAgdG8gaW5kaWNhdGUgdGhhdCB0aGlzCiAgICAgICAgICAqIGVubGln
aHRlbm1lbnQgc2hvdWxkIG5vIGxvbmdlciBiZSB1c2VkLgogICAgICAgICAgKi8KLSAgICAgICAg
cC0+VHNjU2VxdWVuY2UgPSAwOworICAgICAgICBwLT50c2Nfc2VxdWVuY2UgPSAwOwogCiAgICAg
ICAgIHByaW50ayhYRU5MT0dfR19JTkZPICJkJWQ6IFZJUklESUFOIFJFRkVSRU5DRV9UU0M6IGlu
dmFsaWRhdGVkXG4iLAogICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkKTsKQEAgLTc5LDE1ICs3
MSwxNSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVmZXJlbmNlX3RzYyhjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLCBib29sIGluaXRpYWxpemUpCiAgICAgICogVGhlIG9mZnNldCB2YWx1ZSBpcyBjYWxj
dWxhdGVkIG9uIHJlc3RvcmUgYWZ0ZXIgbWlncmF0aW9uIGFuZAogICAgICAqIGVuc3VyZXMgdGhh
dCBXaW5kb3dzIHdpbGwgbm90IHNlZSBhIGxhcmdlIGp1bXAgaW4gUmVmZXJlbmNlVGltZS4KICAg
ICAgKi8KLSAgICBwLT5Uc2NTY2FsZSA9ICgoMTAwMDB1bCA8PCAzMikgLyBkLT5hcmNoLnRzY19r
aHopIDw8IDMyOwotICAgIHAtPlRzY09mZnNldCA9IHRyYy0+b2ZmOworICAgIHAtPnRzY19zY2Fs
ZSA9ICgoMTAwMDB1bCA8PCAzMikgLyBkLT5hcmNoLnRzY19raHopIDw8IDMyOworICAgIHAtPnRz
Y19vZmZzZXQgPSB0cmMtPm9mZjsKICAgICBzbXBfd21iKCk7CiAKLSAgICBzZXEgPSBwLT5Uc2NT
ZXF1ZW5jZSArIDE7CisgICAgc2VxID0gcC0+dHNjX3NlcXVlbmNlICsgMTsKICAgICBpZiAoIHNl
cSA9PSAweEZGRkZGRkZGIHx8IHNlcSA9PSAwICkgLyogQXZvaWQgYm90aCAnaW52YWxpZCcgdmFs
dWVzICovCiAgICAgICAgIHNlcSA9IDE7CiAKLSAgICBwLT5Uc2NTZXF1ZW5jZSA9IHNlcTsKKyAg
ICBwLT50c2Nfc2VxdWVuY2UgPSBzZXE7CiB9CiAKIC8qCi0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
