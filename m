Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B3132D4C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 18:43:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iospE-0004e5-Us; Tue, 07 Jan 2020 17:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iospD-0004dc-8m
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 17:39:27 +0000
X-Inumbo-ID: a15a2746-3174-11ea-b836-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a15a2746-3174-11ea-b836-bc764e2007e4;
 Tue, 07 Jan 2020 17:39:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u2so437169wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 09:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fhOwbwa9USlRJsIPtxOUHn3Qkv+pT5If6Tbtf2TMXAk=;
 b=uug6HvmBk3f8/UhDN0B/4860QyD1v20VqIChbEauQR2kJu2W8NsscVmsLxEwb7KIJ1
 gaBFPGH/hWAJ2NfGd1Az0zb2ojsOCzCflGulYJBpTmF/QAsH6z2SIDcUyzKvRi9ZWW88
 biCJIzCz6Cc4hv6pLTSo4R+4LWmCj1YD4Lv5pShIzFhIXINRYowdJEqVkArnM4Fzg9UL
 3H9wdScqjUrycdK7st3MFPx0R6IV/+PjptkIVzuO1UsUGDVHwF9ImkL+0g44a+qn4xqY
 IrSZjIP83u5Zp0NQyHR07G1rmmnPjmCDaYlyFDLUBKKkLncnxI12/TR8krqc0L61Exci
 UVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fhOwbwa9USlRJsIPtxOUHn3Qkv+pT5If6Tbtf2TMXAk=;
 b=j4HbxUmnoPAPl5pUbJrrAnlBJsv8Ua6vOKbV93dczjCsewEJNrXEZJqiTmZN/4S3l0
 fYtq0OzzLS3NDxiCrrfqaJ5ENY0YEYR1xBEzLMJDw3YMkOSnJI6kWKSDU8seRiuppXR9
 BApRNQfwRRLBFEvEut6SMLAGTteV3ob7iZCw5Ur0pSME9E5cYaVccHI6DJCH981Hdi7b
 9T7fjpj77XColEBwVGFB3jDzd3kJq5DqTJSrmeND/pK1d9V2zky8hrgzmJlq9Peac1m9
 wXG2RvyXJe1XXz91KMKJH9EXgT0i92w0twwssWVjU9k1vfp9GybyCEtBqL8IeTg0foCa
 thjA==
X-Gm-Message-State: APjAAAUlnC0B5HublgI4hw1MOcoJAUZ2ky9AA51/YSb+NyRQYDUdJc89
 /PkitPArXP6yfdFND5U+qeAjMWg2B9Q=
X-Google-Smtp-Source: APXvYqydUUNePcN4lnXnXk4I734EDhXvAJzsbAQCLpiZbxvpXhYfegs/LbNS1ksvS9qyPaBn4mXJew==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr191110wmh.164.1578418757565;
 Tue, 07 Jan 2020 09:39:17 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id u18sm648235wrt.26.2020.01.07.09.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:39:17 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  7 Jan 2020 17:39:02 +0000
Message-Id: <20200107173902.13768-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107173902.13768-1-liuwe@microsoft.com>
References: <20200107173902.13768-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/hyperv: drop all __packed from
 hyperv-tlfs.h
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIHN0cnVjdHVyZXMgYXJlIGFscmVhZHkgbmF0dXJhbGx5IGFsaWduZWQuIExpbnV4IGFkZGVk
IHRob3NlCmF0dHJpYnV0ZXMgb3V0IG9mIHBhcmFub2lhLgoKSW4gWGVuIHdlJ3ZlIGhhZCBpbnN0
YW5jZSB3ZSBoYWQgdG8gZHJvcCBwb2ludGxlc3MgX19wYWNrZWQgdG8gcGxhY2F0ZQpnY2MgOSAo
c2VlIGNhOTMxMGIyNGUpLCBpdCBpcyBiZXR0ZXIgZHJvcCB0aG9zZSBhdHRyaWJ1dGVzLgoKUmVx
dWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6
IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcnYtdGxmcy5oIHwgNTQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAppbmRleCBlNDE4M2M4MDJjLi4wODExNzg1MDAyIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCkBAIC0yODgsNyArMjg4LDcg
QEAgdW5pb24gaHZfeDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMgewogCQl1NjQgZW5hYmxlOjE7
CiAJCXU2NCByZXNlcnZlZDoxMTsKIAkJdTY0IGd1ZXN0X3BoeXNpY2FsX2FkZHJlc3M6NTI7Ci0J
fSBfX3BhY2tlZDsKKwl9OwogfTsKIAogLyoKQEAgLTMwMCw3ICszMDAsNyBAQCBzdHJ1Y3QgbXNf
aHlwZXJ2X3RzY19wYWdlIHsKIAl2b2xhdGlsZSB1NjQgdHNjX3NjYWxlOwogCXZvbGF0aWxlIHM2
NCB0c2Nfb2Zmc2V0OwogCXU2NCByZXNlcnZlZDJbNTA5XTsKLX0gIF9fcGFja2VkOworfTsKIAog
LyoKICAqIFRoZSBndWVzdCBPUyBuZWVkcyB0byByZWdpc3RlciB0aGUgZ3Vlc3QgSUQgd2l0aCB0
aGUgaHlwZXJ2aXNvci4KQEAgLTM0NywxNyArMzQ3LDE3IEBAIHN0cnVjdCBodl9yZWVubGlnaHRl
bm1lbnRfY29udHJvbCB7CiAJX191NjQgZW5hYmxlZDoxOwogCV9fdTY0IHJlc2VydmVkMjoxNTsK
IAlfX3U2NCB0YXJnZXRfdnA6MzI7Ci19ICBfX3BhY2tlZDsKK307CiAKIHN0cnVjdCBodl90c2Nf
ZW11bGF0aW9uX2NvbnRyb2wgewogCV9fdTY0IGVuYWJsZWQ6MTsKIAlfX3U2NCByZXNlcnZlZDo2
MzsKLX0gX19wYWNrZWQ7Cit9OwogCiBzdHJ1Y3QgaHZfdHNjX2VtdWxhdGlvbl9zdGF0dXMgewog
CV9fdTY0IGlucHJvZ3Jlc3M6MTsKIAlfX3U2NCByZXNlcnZlZDo2MzsKLX0gX19wYWNrZWQ7Cit9
OwogCiAjZGVmaW5lIEhWX1g2NF9NU1JfSFlQRVJDQUxMX0VOQUJMRQkJMHgwMDAwMDAwMQogI2Rl
ZmluZSBIVl9YNjRfTVNSX0hZUEVSQ0FMTF9QQUdFX0FERFJFU1NfU0hJRlQJMTIKQEAgLTQ0NSw3
ICs0NDUsNyBAQCB0eXBlZGVmIHN0cnVjdCBfSFZfUkVGRVJFTkNFX1RTQ19QQUdFIHsKIAlfX3Uz
MiByZXMxOwogCV9fdTY0IHRzY19zY2FsZTsKIAlfX3M2NCB0c2Nfb2Zmc2V0OwotfSAgX19wYWNr
ZWQgSFZfUkVGRVJFTkNFX1RTQ19QQUdFLCAqUEhWX1JFRkVSRU5DRV9UU0NfUEFHRTsKK30gSFZf
UkVGRVJFTkNFX1RTQ19QQUdFLCAqUEhWX1JFRkVSRU5DRV9UU0NfUEFHRTsKIAogLyogRGVmaW5l
IHRoZSBudW1iZXIgb2Ygc3ludGhldGljIGludGVycnVwdCBzb3VyY2VzLiAqLwogI2RlZmluZSBI
Vl9TWU5JQ19TSU5UX0NPVU5UCQkoMTYpCkBAIC01MDIsNyArNTAyLDcgQEAgdW5pb24gaHZfbWVz
c2FnZV9mbGFncyB7CiAJc3RydWN0IHsKIAkJX191OCBtc2dfcGVuZGluZzoxOwogCQlfX3U4IHJl
c2VydmVkOjc7Ci0JfSBfX3BhY2tlZDsKKwl9OwogfTsKIAogLyogRGVmaW5lIHBvcnQgaWRlbnRp
ZmllciB0eXBlLiAqLwpAQCAtNTExLDcgKzUxMSw3IEBAIHVuaW9uIGh2X3BvcnRfaWQgewogCXN0
cnVjdCB7CiAJCV9fdTMyIGlkOjI0OwogCQlfX3UzMiByZXNlcnZlZDo4OwotCX0gX19wYWNrZWQg
dTsKKwl9IHU7CiB9OwogCiAvKiBEZWZpbmUgc3ludGhldGljIGludGVycnVwdCBjb250cm9sbGVy
IG1lc3NhZ2UgaGVhZGVyLiAqLwpAQCAtNTI0LDcgKzUyNCw3IEBAIHN0cnVjdCBodl9tZXNzYWdl
X2hlYWRlciB7CiAJCV9fdTY0IHNlbmRlcjsKIAkJdW5pb24gaHZfcG9ydF9pZCBwb3J0OwogCX07
Ci19IF9fcGFja2VkOworfTsKIAogLyogRGVmaW5lIHN5bnRoZXRpYyBpbnRlcnJ1cHQgY29udHJv
bGxlciBtZXNzYWdlIGZvcm1hdC4gKi8KIHN0cnVjdCBodl9tZXNzYWdlIHsKQEAgLTUzMiwxMiAr
NTMyLDEyIEBAIHN0cnVjdCBodl9tZXNzYWdlIHsKIAl1bmlvbiB7CiAJCV9fdTY0IHBheWxvYWRb
SFZfTUVTU0FHRV9QQVlMT0FEX1FXT1JEX0NPVU5UXTsKIAl9IHU7Ci19IF9fcGFja2VkOworfTsK
IAogLyogRGVmaW5lIHRoZSBzeW50aGV0aWMgaW50ZXJydXB0IG1lc3NhZ2UgcGFnZSBsYXlvdXQu
ICovCiBzdHJ1Y3QgaHZfbWVzc2FnZV9wYWdlIHsKIAlzdHJ1Y3QgaHZfbWVzc2FnZSBzaW50X21l
c3NhZ2VbSFZfU1lOSUNfU0lOVF9DT1VOVF07Ci19IF9fcGFja2VkOworfTsKIAogLyogRGVmaW5l
IHRpbWVyIG1lc3NhZ2UgcGF5bG9hZCBzdHJ1Y3R1cmUuICovCiBzdHJ1Y3QgaHZfdGltZXJfbWVz
c2FnZV9wYXlsb2FkIHsKQEAgLTU0NSw3ICs1NDUsNyBAQCBzdHJ1Y3QgaHZfdGltZXJfbWVzc2Fn
ZV9wYXlsb2FkIHsKIAlfX3UzMiByZXNlcnZlZDsKIAlfX3U2NCBleHBpcmF0aW9uX3RpbWU7CS8q
IFdoZW4gdGhlIHRpbWVyIGV4cGlyZWQgKi8KIAlfX3U2NCBkZWxpdmVyeV90aW1lOwkvKiBXaGVu
IHRoZSBtZXNzYWdlIHdhcyBkZWxpdmVyZWQgKi8KLX0gX19wYWNrZWQ7Cit9OwogCiBzdHJ1Y3Qg
aHZfbmVzdGVkX2VubGlnaHRlbm1lbnRzX2NvbnRyb2wgewogCXN0cnVjdCB7CkBAIC01NTUsNyAr
NTU1LDcgQEAgc3RydWN0IGh2X25lc3RlZF9lbmxpZ2h0ZW5tZW50c19jb250cm9sIHsKIAlzdHJ1
Y3QgewogCQlfX3UzMiByZXNlcnZlZDsKIAl9IGh5cGVyY2FsbENvbnRyb2xzOwotfSBfX3BhY2tl
ZDsKK307CiAKIC8qIERlZmluZSB2aXJ0dWFsIHByb2Nlc3NvciBhc3Npc3QgcGFnZSBzdHJ1Y3R1
cmUuICovCiBzdHJ1Y3QgaHZfdnBfYXNzaXN0X3BhZ2UgewpAQCAtNTY2LDcgKzU2Niw3IEBAIHN0
cnVjdCBodl92cF9hc3Npc3RfcGFnZSB7CiAJX191OCBlbmxpZ2h0ZW5fdm1lbnRyeTsKIAlfX3U4
IHJlc2VydmVkMls3XTsKIAlfX3U2NCBjdXJyZW50X25lc3RlZF92bWNzOwotfSBfX3BhY2tlZDsK
K307CiAKIHN0cnVjdCBodl9lbmxpZ2h0ZW5lZF92bWNzIHsKIAl1MzIgcmV2aXNpb25faWQ7CkBA
IC03NDIsNyArNzQyLDcgQEAgc3RydWN0IGh2X2VubGlnaHRlbmVkX3ZtY3MgewogCQl1MzIgbmVz
dGVkX2ZsdXNoX2h5cGVyY2FsbDoxOwogCQl1MzIgbXNyX2JpdG1hcDoxOwogCQl1MzIgcmVzZXJ2
ZWQ6MzA7Ci0JfSAgX19wYWNrZWQgaHZfZW5saWdodGVubWVudHNfY29udHJvbDsKKwl9ICBodl9l
bmxpZ2h0ZW5tZW50c19jb250cm9sOwogCXUzMiBodl92cF9pZDsKIAogCXU2NCBodl92bV9pZDsK
QEAgLTc1Miw3ICs3NTIsNyBAQCBzdHJ1Y3QgaHZfZW5saWdodGVuZWRfdm1jcyB7CiAJdTY0IHBh
ZGRpbmc2NF81WzddOwogCXU2NCB4c3NfZXhpdF9iaXRtYXA7CiAJdTY0IHBhZGRpbmc2NF82Wzdd
OwotfSBfX3BhY2tlZDsKK307CiAKICNkZWZpbmUgSFZfVk1YX0VOTElHSFRFTkVEX0NMRUFOX0ZJ
RUxEX05PTkUJCQkwCiAjZGVmaW5lIEhWX1ZNWF9FTkxJR0hURU5FRF9DTEVBTl9GSUVMRF9JT19C
SVRNQVAJCUJJVCgwLCBVTCkKQEAgLTc5Myw3ICs3OTMsNyBAQCB1bmlvbiBodl9zdGltZXJfY29u
ZmlnIHsKIAkJdTY0IHJlc2VydmVkX3owOjM7CiAJCXU2NCBzaW50eDo0OwogCQl1NjQgcmVzZXJ2
ZWRfejE6NDQ7Ci0JfSBfX3BhY2tlZDsKKwl9OwogfTsKIAogCkBAIC04MDgsNyArODA4LDcgQEAg
dW5pb24gaHZfc3luaWNfc2NvbnRyb2wgewogCXN0cnVjdCB7CiAJCXU2NCBlbmFibGU6MTsKIAkJ
dTY0IHJlc2VydmVkOjYzOwotCX0gX19wYWNrZWQ7CisJfTsKIH07CiAKIC8qIERlZmluZSBzeW50
aGV0aWMgaW50ZXJydXB0IHNvdXJjZS4gKi8KQEAgLTgyMSw3ICs4MjEsNyBAQCB1bmlvbiBodl9z
eW5pY19zaW50IHsKIAkJdTY0IGF1dG9fZW9pOjE7CiAJCXU2NCBwb2xsaW5nOjE7CiAJCXU2NCBy
ZXNlcnZlZDI6NDU7Ci0JfSBfX3BhY2tlZDsKKwl9OwogfTsKIAogLyogRGVmaW5lIHRoZSBmb3Jt
YXQgb2YgdGhlIFNJTVAgcmVnaXN0ZXIgKi8KQEAgLTgzMSw3ICs4MzEsNyBAQCB1bmlvbiBodl9z
eW5pY19zaW1wIHsKIAkJdTY0IHNpbXBfZW5hYmxlZDoxOwogCQl1NjQgcHJlc2VydmVkOjExOwog
CQl1NjQgYmFzZV9zaW1wX2dwYTo1MjsKLQl9IF9fcGFja2VkOworCX07CiB9OwogCiAvKiBEZWZp
bmUgdGhlIGZvcm1hdCBvZiB0aGUgU0lFRlAgcmVnaXN0ZXIgKi8KQEAgLTg0MSwzNCArODQxLDM0
IEBAIHVuaW9uIGh2X3N5bmljX3NpZWZwIHsKIAkJdTY0IHNpZWZwX2VuYWJsZWQ6MTsKIAkJdTY0
IHByZXNlcnZlZDoxMTsKIAkJdTY0IGJhc2Vfc2llZnBfZ3BhOjUyOwotCX0gX19wYWNrZWQ7CisJ
fTsKIH07CiAKIHN0cnVjdCBodl92cHNldCB7CiAJdTY0IGZvcm1hdDsKIAl1NjQgdmFsaWRfYmFu
a19tYXNrOwogCXU2NCBiYW5rX2NvbnRlbnRzW107Ci19IF9fcGFja2VkOworfTsKIAogLyogSHZD
YWxsU2VuZFN5bnRoZXRpY0NsdXN0ZXJJcGkgaHlwZXJjYWxsICovCiBzdHJ1Y3QgaHZfc2VuZF9p
cGkgewogCXUzMiB2ZWN0b3I7CiAJdTMyIHJlc2VydmVkOwogCXU2NCBjcHVfbWFzazsKLX0gX19w
YWNrZWQ7Cit9OwogCiAvKiBIdkNhbGxTZW5kU3ludGhldGljQ2x1c3RlcklwaUV4IGh5cGVyY2Fs
bCAqLwogc3RydWN0IGh2X3NlbmRfaXBpX2V4IHsKIAl1MzIgdmVjdG9yOwogCXUzMiByZXNlcnZl
ZDsKIAlzdHJ1Y3QgaHZfdnBzZXQgdnBfc2V0OwotfSBfX3BhY2tlZDsKK307CiAKIC8qIEh2Rmx1
c2hHdWVzdFBoeXNpY2FsQWRkcmVzc1NwYWNlIGh5cGVyY2FsbHMgKi8KIHN0cnVjdCBodl9ndWVz
dF9tYXBwaW5nX2ZsdXNoIHsKIAl1NjQgYWRkcmVzc19zcGFjZTsKIAl1NjQgZmxhZ3M7Ci19IF9f
cGFja2VkOworfTsKIAogLyoKICAqICBIVl9NQVhfRkxVU0hfUEFHRVMgPSAiYWRkaXRpb25hbF9w
YWdlcyIgKyAxLiBJdCdzIGxpbWl0ZWQKQEAgLTkwNiw3ICs5MDYsNyBAQCBzdHJ1Y3QgaHZfdGxi
X2ZsdXNoIHsKIAl1NjQgZmxhZ3M7CiAJdTY0IHByb2Nlc3Nvcl9tYXNrOwogCXU2NCBndmFfbGlz
dFtdOwotfSBfX3BhY2tlZDsKK307CiAKIC8qIEh2Rmx1c2hWaXJ0dWFsQWRkcmVzc1NwYWNlRXgg
aHlwZXJjYWxsICovCiBzdHJ1Y3QgaHZfdGxiX2ZsdXNoX2V4IHsKQEAgLTkxNCw3ICs5MTQsNyBA
QCBzdHJ1Y3QgaHZfdGxiX2ZsdXNoX2V4IHsKIAl1NjQgZmxhZ3M7CiAJc3RydWN0IGh2X3Zwc2V0
IGh2X3ZwX3NldDsKIAkvKiB1NjQgZ3ZhX2xpc3RbXTsgKi8KLX0gX19wYWNrZWQ7Cit9OwogCiBz
dHJ1Y3QgaHZfcGFydGl0aW9uX2Fzc2lzdF9wZyB7CiAJdTMyIHRsYl9sb2NrX2NvdW50OwotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
