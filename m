Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A447124A0C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:47:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaXS-0004UB-ST; Wed, 18 Dec 2019 14:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihaXR-0004Tt-QA
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:42:57 +0000
X-Inumbo-ID: a3d792fe-21a4-11ea-a914-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3d792fe-21a4-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 14:42:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f129so2175879wmf.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HzHXwmX1THqnPZ4zD46lRMhs898RczITxfDztH4aKiw=;
 b=bTedDF851cMfk++51N2+wcMHN33dmbBEh6BDhSdVAi7EQB6JL7wh8qbQZEU2NQB58x
 wMweboGXg85GmktYzjmLQI2Qesc/85xqEVs3S4XcxE4GfPJX4DuYVD+nQaXrtkuYkD/X
 vKXu1eknaK17y+14zhsBCi3PEjna1XOKTmjaUXe1XTPPb4EytiWUO3HLx4z45tuA3uOf
 TVGQG+rH+vttAtaqgFzbT/RO3B/zzeIVWJ05JNPS4f+Hn2/CCUtSEdYH1iZIZCN2mr+6
 czczRuMcqWw31vaoPuNMSvKj7wT4eBbsDX/xpYRUvkLfzhojZRwvhtRAspycEoHwqZLh
 f6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HzHXwmX1THqnPZ4zD46lRMhs898RczITxfDztH4aKiw=;
 b=HKo1CDxHeUsvi6Az/OEchcLKq2uzGF7vdR3qf5333xgNKYfCdqFB137T50HrsQYunw
 Q+iiz7eBOEJWp6NtHGkp5GRrFCNcwVYX9HlJPKROExY229DkqzS4MsmdvNs9MdTRd9gy
 2ShlW4IPR31EmtCv2lGNGLkl34kYk5w5uAA+Oz4l1VdiCAiSzhfKUsRa3+d0yyx/B95m
 cFlym02Pu4r+JefmwVnCW+cZRG4bajvDBRu2pahQQ4G/xk+TwQeA+r9PIDr89MIm1l6P
 Vr2zJv7gqY6Di4x4PJQWNCdcqBbPSG2Fss4LIlqq4CwRT/mYfZt+JOZkfhCURgfz5Yri
 bKWg==
X-Gm-Message-State: APjAAAWHonacbu4QwGW33rKsvkYsc48K2E24KCuX9VfL8MK/vA/SieXa
 Ltw92m7YRkN3hiQUaS8bxffETW4Z
X-Google-Smtp-Source: APXvYqzEv+XZyl/Wz4WHVku7KNco41qRGT2Kf0kV8WFJcUyXKRCp9MldJ0q5bk3k7d8VZHw8Lcthmg==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr3698995wmb.79.1576680159046; 
 Wed, 18 Dec 2019 06:42:39 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p17sm2724894wmk.30.2019.12.18.06.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 06:42:38 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 14:42:30 +0000
Message-Id: <20191218144233.15372-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218144233.15372-1-liuwe@microsoft.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/6] x86/viridian: drop private copy of
 definitions from synic.c
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

VXNlIGh5cGVydi10bGZzLmggaW5zdGVhZC4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
CgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9odm0vdmlyaWRpYW4vc3luaWMuYyB8IDY4ICsrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMgYi94ZW4v
YXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMKaW5kZXggMjc5MTAyMWJjYy4uNTRjNjJmODQz
ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5pYy5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vc3luaWMuYwpAQCAtMTIsNTggKzEyLDIyIEBACiAjaW5j
bHVkZSA8eGVuL3ZlcnNpb24uaD4KIAogI2luY2x1ZGUgPGFzbS9hcGljLmg+CisjaW5jbHVkZSA8
YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+CiAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+CiAj
aW5jbHVkZSA8YXNtL2h2bS92bGFwaWMuaD4KIAogI2luY2x1ZGUgInByaXZhdGUuaCIKIAotdHlw
ZWRlZiBzdHJ1Y3QgX0hWX1ZJUlRVQUxfQVBJQ19BU1NJU1QKLXsKLSAgICB1aW50MzJfdCBub19l
b2k6MTsKLSAgICB1aW50MzJfdCByZXNlcnZlZF96ZXJvOjMxOwotfSBIVl9WSVJUVUFMX0FQSUNf
QVNTSVNUOwotCi10eXBlZGVmIHVuaW9uIF9IVl9WUF9BU1NJU1RfUEFHRQotewotICAgIEhWX1ZJ
UlRVQUxfQVBJQ19BU1NJU1QgQXBpY0Fzc2lzdDsKLSAgICB1aW50OF90IFJlc2VydmVkWkJ5dGVQ
YWRkaW5nW1BBR0VfU0laRV07Ci19IEhWX1ZQX0FTU0lTVF9QQUdFOwotCi10eXBlZGVmIGVudW0g
SFZfTUVTU0FHRV9UWVBFIHsKLSAgICBIdk1lc3NhZ2VUeXBlTm9uZSwKLSAgICBIdk1lc3NhZ2VU
aW1lckV4cGlyZWQgPSAweDgwMDAwMDEwLAotfSBIVl9NRVNTQUdFX1RZUEU7Ci0KLXR5cGVkZWYg
c3RydWN0IEhWX01FU1NBR0VfRkxBR1MgewotICAgIHVpbnQ4X3QgTWVzc2FnZVBlbmRpbmc6MTsK
LSAgICB1aW50OF90IFJlc2VydmVkOjc7Ci19IEhWX01FU1NBR0VfRkxBR1M7Ci0KLXR5cGVkZWYg
c3RydWN0IEhWX01FU1NBR0VfSEVBREVSIHsKLSAgICBIVl9NRVNTQUdFX1RZUEUgTWVzc2FnZVR5
cGU7Ci0gICAgdWludDE2X3QgUmVzZXJ2ZWQxOwotICAgIEhWX01FU1NBR0VfRkxBR1MgTWVzc2Fn
ZUZsYWdzOwotICAgIHVpbnQ4X3QgUGF5bG9hZFNpemU7Ci0gICAgdWludDY0X3QgUmVzZXJ2ZWQy
OwotfSBIVl9NRVNTQUdFX0hFQURFUjsKLQotI2RlZmluZSBIVl9NRVNTQUdFX1NJWkUgMjU2Ci0j
ZGVmaW5lIEhWX01FU1NBR0VfTUFYX1BBWUxPQURfUVdPUkRfQ09VTlQgMzAKLQotdHlwZWRlZiBz
dHJ1Y3QgSFZfTUVTU0FHRSB7Ci0gICAgSFZfTUVTU0FHRV9IRUFERVIgSGVhZGVyOwotICAgIHVp
bnQ2NF90IFBheWxvYWRbSFZfTUVTU0FHRV9NQVhfUEFZTE9BRF9RV09SRF9DT1VOVF07Ci19IEhW
X01FU1NBR0U7CiAKIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnMo
dm9pZCkKIHsKLSAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKEhWX01FU1NBR0UpICE9IEhWX01FU1NB
R0VfU0laRSk7CisgICAgQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgaHZfbWVzc2FnZSkgIT0g
SFZfTUVTU0FHRV9TSVpFKTsKIH0KIAogdm9pZCB2aXJpZGlhbl9hcGljX2Fzc2lzdF9zZXQoY29u
c3Qgc3RydWN0IHZjcHUgKnYpCiB7CiAgICAgc3RydWN0IHZpcmlkaWFuX3ZjcHUgKnZ2ID0gdi0+
YXJjaC5odm0udmlyaWRpYW47Ci0gICAgSFZfVlBfQVNTSVNUX1BBR0UgKnB0ciA9IHZ2LT52cF9h
c3Npc3QucHRyOworICAgIHN0cnVjdCBodl92cF9hc3Npc3RfcGFnZSAqcHRyID0gdnYtPnZwX2Fz
c2lzdC5wdHI7CiAKICAgICBpZiAoICFwdHIgKQogICAgICAgICByZXR1cm47CkBAIC03NywxOCAr
NDEsMTggQEAgdm9pZCB2aXJpZGlhbl9hcGljX2Fzc2lzdF9zZXQoY29uc3Qgc3RydWN0IHZjcHUg
KnYpCiAgICAgICAgIGRvbWFpbl9jcmFzaCh2LT5kb21haW4pOwogCiAgICAgdnYtPmFwaWNfYXNz
aXN0X3BlbmRpbmcgPSB0cnVlOwotICAgIHB0ci0+QXBpY0Fzc2lzdC5ub19lb2kgPSAxOworICAg
IHB0ci0+YXBpY19hc3Npc3QgPSAxOwogfQogCiBib29sIHZpcmlkaWFuX2FwaWNfYXNzaXN0X2Nv
bXBsZXRlZChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBzdHJ1Y3QgdmlyaWRpYW5fdmNw
dSAqdnYgPSB2LT5hcmNoLmh2bS52aXJpZGlhbjsKLSAgICBIVl9WUF9BU1NJU1RfUEFHRSAqcHRy
ID0gdnYtPnZwX2Fzc2lzdC5wdHI7CisgICAgc3RydWN0IGh2X3ZwX2Fzc2lzdF9wYWdlICpwdHIg
PSB2di0+dnBfYXNzaXN0LnB0cjsKIAogICAgIGlmICggIXB0ciApCiAgICAgICAgIHJldHVybiBm
YWxzZTsKIAotICAgIGlmICggdnYtPmFwaWNfYXNzaXN0X3BlbmRpbmcgJiYgIXB0ci0+QXBpY0Fz
c2lzdC5ub19lb2kgKQorICAgIGlmICggdnYtPmFwaWNfYXNzaXN0X3BlbmRpbmcgJiYgIXB0ci0+
YXBpY19hc3Npc3QgKQogICAgIHsKICAgICAgICAgLyogQW4gRU9JIGhhcyBiZWVuIGF2b2lkZWQg
Ki8KICAgICAgICAgdnYtPmFwaWNfYXNzaXN0X3BlbmRpbmcgPSBmYWxzZTsKQEAgLTEwMSwxMiAr
NjUsMTIgQEAgYm9vbCB2aXJpZGlhbl9hcGljX2Fzc2lzdF9jb21wbGV0ZWQoY29uc3Qgc3RydWN0
IHZjcHUgKnYpCiB2b2lkIHZpcmlkaWFuX2FwaWNfYXNzaXN0X2NsZWFyKGNvbnN0IHN0cnVjdCB2
Y3B1ICp2KQogewogICAgIHN0cnVjdCB2aXJpZGlhbl92Y3B1ICp2diA9IHYtPmFyY2guaHZtLnZp
cmlkaWFuOwotICAgIEhWX1ZQX0FTU0lTVF9QQUdFICpwdHIgPSB2di0+dnBfYXNzaXN0LnB0cjsK
KyAgICBzdHJ1Y3QgaHZfdnBfYXNzaXN0X3BhZ2UgKnB0ciA9IHZ2LT52cF9hc3Npc3QucHRyOwog
CiAgICAgaWYgKCAhcHRyICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgcHRyLT5BcGljQXNzaXN0
Lm5vX2VvaSA9IDA7CisgICAgcHRyLT5hcGljX2Fzc2lzdCA9IDA7CiAgICAgdnYtPmFwaWNfYXNz
aXN0X3BlbmRpbmcgPSBmYWxzZTsKIH0KIApAQCAtMzU4LDcgKzMyMiw3IEBAIGJvb2wgdmlyaWRp
YW5fc3luaWNfZGVsaXZlcl90aW1lcl9tc2coc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBz
aW50eCwKIHsKICAgICBzdHJ1Y3QgdmlyaWRpYW5fdmNwdSAqdnYgPSB2LT5hcmNoLmh2bS52aXJp
ZGlhbjsKICAgICBjb25zdCB1bmlvbiB2aXJpZGlhbl9zaW50X21zciAqdnMgPSAmdnYtPnNpbnRb
c2ludHhdOwotICAgIEhWX01FU1NBR0UgKm1zZyA9IHZ2LT5zaW1wLnB0cjsKKyAgICBzdHJ1Y3Qg
aHZfbWVzc2FnZSAqbXNnID0gdnYtPnNpbXAucHRyOwogICAgIHN0cnVjdCB7CiAgICAgICAgIHVp
bnQzMl90IFRpbWVySW5kZXg7CiAgICAgICAgIHVpbnQzMl90IFJlc2VydmVkOwpAQCAtMzgyLDE5
ICszNDYsMTkgQEAgYm9vbCB2aXJpZGlhbl9zeW5pY19kZWxpdmVyX3RpbWVyX21zZyhzdHJ1Y3Qg
dmNwdSAqdiwgdW5zaWduZWQgaW50IHNpbnR4LAogCiAgICAgbXNnICs9IHNpbnR4OwogCi0gICAg
aWYgKCBtc2ctPkhlYWRlci5NZXNzYWdlVHlwZSAhPSBIdk1lc3NhZ2VUeXBlTm9uZSApCisgICAg
aWYgKCBtc2ctPmhlYWRlci5tZXNzYWdlX3R5cGUgIT0gSFZNU0dfTk9ORSApCiAgICAgewotICAg
ICAgICBtc2ctPkhlYWRlci5NZXNzYWdlRmxhZ3MuTWVzc2FnZVBlbmRpbmcgPSAxOworICAgICAg
ICBtc2ctPmhlYWRlci5tZXNzYWdlX2ZsYWdzLm1zZ19wZW5kaW5nID0gMTsKICAgICAgICAgX19z
ZXRfYml0KHNpbnR4LCAmdnYtPm1zZ19wZW5kaW5nKTsKICAgICAgICAgcmV0dXJuIGZhbHNlOwog
ICAgIH0KIAotICAgIG1zZy0+SGVhZGVyLk1lc3NhZ2VUeXBlID0gSHZNZXNzYWdlVGltZXJFeHBp
cmVkOwotICAgIG1zZy0+SGVhZGVyLk1lc3NhZ2VGbGFncy5NZXNzYWdlUGVuZGluZyA9IDA7Ci0g
ICAgbXNnLT5IZWFkZXIuUGF5bG9hZFNpemUgPSBzaXplb2YocGF5bG9hZCk7CisgICAgbXNnLT5o
ZWFkZXIubWVzc2FnZV90eXBlID0gSFZNU0dfVElNRVJfRVhQSVJFRDsKKyAgICBtc2ctPmhlYWRl
ci5tZXNzYWdlX2ZsYWdzLm1zZ19wZW5kaW5nID0gMDsKKyAgICBtc2ctPmhlYWRlci5wYXlsb2Fk
X3NpemUgPSBzaXplb2YocGF5bG9hZCk7CiAKLSAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHBheWxv
YWQpID4gc2l6ZW9mKG1zZy0+UGF5bG9hZCkpOwotICAgIG1lbWNweShtc2ctPlBheWxvYWQsICZw
YXlsb2FkLCBzaXplb2YocGF5bG9hZCkpOworICAgIEJVSUxEX0JVR19PTihzaXplb2YocGF5bG9h
ZCkgPiBzaXplb2YobXNnLT51LnBheWxvYWQpKTsKKyAgICBtZW1jcHkobXNnLT51LnBheWxvYWQs
ICZwYXlsb2FkLCBzaXplb2YocGF5bG9hZCkpOwogCiAgICAgaWYgKCAhdnMtPm1hc2sgKQogICAg
ICAgICB2bGFwaWNfc2V0X2lycSh2Y3B1X3ZsYXBpYyh2KSwgdnMtPnZlY3RvciwgMCk7Ci0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
