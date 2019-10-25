Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA589E46F3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 11:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNvii-0007yc-L1; Fri, 25 Oct 2019 09:17:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cMeb=YS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNvih-0007yB-OO
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 09:17:19 +0000
X-Inumbo-ID: 2d12897e-f708-11e9-a531-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d12897e-f708-11e9-a531-bc764e2007e4;
 Fri, 25 Oct 2019 09:16:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z11so1408488wro.11
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pFFSinDfDG+eojxO6ZAruZ5d2cmA+pbfzhrKVPc1pNc=;
 b=u1Mryk9C8zbqSKL/8xx1Kqo2EPGmIUWXfVgp3yUIyORHS2bOKn6TtB0nsdaO01IUOm
 Elk1yBJsEAgbhsQdOZVYMwYvqvyy7TQdCDeq0mWuy16Zz2bZijjFUZYr/DYFs+wqP6ji
 Vj3uXac7a1MqkXwNzuTVxIqCsYvQSelrYqrwZeo1LcXvF50KtHhYzjBd6Q6FcvZxKxH6
 gfOVdkz2WxrmlhEzZd7H5++vCuIz6g62M66C4LFyf/bce5qld4t3y4rWGvB2EopGeF9g
 timXMRzellO/sBdJGvvC/yA0Y+eGiC/yp2rqOj/Wesm/eBKanakDmx7rS6I4N+cDji/a
 vl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pFFSinDfDG+eojxO6ZAruZ5d2cmA+pbfzhrKVPc1pNc=;
 b=XjcTsB2jyR0XoS34F/DoeoP05Y7yp/BYSFRwLQv8d/6RkJweDOJtiFfQ0qV8oiGmyM
 jHZqkJqoOxWguI9afjMk9OkcvOmtufzmgzbOIMLPmlFcKj8nRFaVDUomujQLDsw/3elZ
 ytoUgGTVfZoNbahqIj1aSwDK4xyBA4hUA/F79lgoh7y4Zhfuq4FIR8M6h9FariuBRsAv
 Bvd6RccDiNyrMfXiyCurX+o0I9Wl/ovqd0Dlstcdj05Jf0pW4c9SsNYZFDH/q9Wu1sXu
 RbS5SG3BdT4fS0QUYLvFZciCkv1luVjO7ni3JOLsNyEpCeY16eR3Jc8aqYPrAUhISA0q
 /png==
X-Gm-Message-State: APjAAAWXdsmPQAaIN8bwAxr1GVOT+bSmAcErMGC6iXsBek+Qj/kKbgeF
 nwzgm0RqjWEVlSes0waf8JxzsLNXyzs=
X-Google-Smtp-Source: APXvYqzXA/psT/wMrYqnbfQ2J0JO5Is0SIQaysEdOkAobeYO2cnOUCH7oDIQ1KNuWFgl6A/9vlRUfg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr1950190wru.174.1571995009404; 
 Fri, 25 Oct 2019 02:16:49 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b62sm1873283wmc.13.2019.10.25.02.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:16:48 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 10:16:18 +0100
Message-Id: <20191025091618.10153-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025091618.10153-1-liuwe@microsoft.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next 7/7] x86: implement Hyper-V clock source
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

SW1wbGVtZW50IGEgY2xvY2sgc291cmNlIHVzaW5nIEh5cGVyLVYncyByZWZlcmVuY2UgVFNDIHBh
Z2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KUmVs
ZXZhbnQgc3BlYzoKCmh0dHBzOi8vZ2l0aHViLmNvbS9NaWNyb3NvZnREb2NzL1ZpcnR1YWxpemF0
aW9uLURvY3VtZW50YXRpb24vcmF3L2xpdmUvdGxmcy9IeXBlcnZpc29yJTIwVG9wJTIwTGV2ZWwl
MjBGdW5jdGlvbmFsJTIwU3BlY2lmaWNhdGlvbiUyMHY1LjBDLnBkZgoKU2VjdGlvbiAxMi42Lgot
LS0KIHhlbi9hcmNoL3g4Ni90aW1lLmMgfCA4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKaW5kZXgg
ZDgyNDIyOTVlZi4uZjdlOTNiOGExZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwor
KysgYi94ZW4vYXJjaC94ODYvdGltZS5jCkBAIC0zMCw2ICszMCw3IEBACiAjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KICNpbmNsdWRlIDxhc20vZ3Vl
c3QuaD4KKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KICNpbmNsdWRlIDxhc20v
bWMxNDY4MThydGMuaD4KICNpbmNsdWRlIDxhc20vZGl2NjQuaD4KICNpbmNsdWRlIDxhc20vYWNw
aS5oPgpAQCAtNjE0LDYgKzYxNSw4OSBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX3RpbWVzb3Vy
Y2UgX19pbml0ZGF0YSBwbHRfeGVuX3RpbWVyID0KIH07CiAjZW5kaWYKIAorI2lmZGVmIENPTkZJ
R19IWVBFUlZfR1VFU1QKKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKKyAqIFBMQVRGT1JNIFRJTUVSIDY6IEhZUEVSLVYgUkVGRVJF
TkNFIFRTQworICovCisKK3N0YXRpYyBzdHJ1Y3QgbXNfaHlwZXJ2X3RzY19wYWdlIGh5cGVydl90
c2NfcGFnZSBfX2FsaWduZWQoUEFHRV9TSVpFKTsKKworc3RhdGljIGludDY0X3QgX19pbml0IGlu
aXRfaHlwZXJ2X3RpbWVyKHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlICpwdHMpCit7CisgICAg
dW5zaWduZWQgbG9uZyBtYWRkcjsKKyAgICB1aW50NjRfdCB0c2NfbXNyLCBmcmVxOworCisgICAg
aWYgKCAhaHlwZXJ2X2d1ZXN0IHx8CisgICAgICAgICAhKG1zX2h5cGVydi5mZWF0dXJlcyAmIEhW
X01TUl9SRUZFUkVOQ0VfVFNDX0FWQUlMQUJMRSkgKQorICAgICAgICByZXR1cm4gMDsKKworICAg
IG1hZGRyID0gdmlydF90b19tYWRkcigmaHlwZXJ2X3RzY19wYWdlKTsKKworICAgIC8qCisgICAg
ICogUGVyIEh5cGVyLVYgVExGUzoKKyAgICAgKiAgIDEuIFJlYWQgZXhpc3RpbmcgTVNSIHZhbHVl
CisgICAgICogICAyLiBQcmVzZXJ2ZSBiaXRzIFsxMToxXQorICAgICAqICAgMy4gU2V0IGJpdHMg
WzYzOjEyXSB0byBiZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIG9mIHRzYyBwYWdlCisgICAgICog
ICA0LiBTZXQgZW5hYmxlZCBiaXQgKDApCisgICAgICogICA1LiBXcml0ZSBiYWNrIG5ldyBNU1Ig
dmFsdWUKKyAgICAgKi8KKyAgICByZG1zcmwoSFZfWDY0X01TUl9SRUZFUkVOQ0VfVFNDLCB0c2Nf
bXNyKTsKKyAgICB0c2NfbXNyICY9IEdFTk1BU0tfVUxMKDExLCAxKTsKKyAgICB0c2NfbXNyID0g
dHNjX21zciB8ICh1aW50NjRfdCltYWRkciB8IDEgLyogZW5hYmxlZCAqLzsKKyAgICB3cm1zcmwo
SFZfWDY0X01TUl9SRUZFUkVOQ0VfVFNDLCB0c2NfbXNyKTsKKworICAgIC8qIEdldCBUU0MgZnJl
cXVlbmN5IGZyb20gSHlwZXItViAqLworICAgIHJkbXNybChIVl9YNjRfTVNSX1RTQ19GUkVRVUVO
Q1ksIGZyZXEpOworICAgIHB0cy0+ZnJlcXVlbmN5ID0gZnJlcTsKKworICAgIHJldHVybiBmcmVx
OworfQorCitzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2X3RpbWVyKHZvaWQpCit7
CisgICAgdWludDY0X3Qgc2NhbGUsIG9mZnNldCwgcmV0LCB0c2M7CisgICAgdWludDMyX3Qgc2Vx
OworICAgIHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gJmh5cGVydl90c2Nf
cGFnZTsKKworICAgIGRvIHsKKyAgICAgICAgc2VxID0gdHNjX3BhZ2UtPnRzY19zZXF1ZW5jZTsK
KworICAgICAgICAvKiBTZXEgMCBpcyBzcGVjaWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRl
bm1lbnQgaXMgbm90CisgICAgICAgICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBUaGUgcmVm
ZXJlbmNlIHRpbWUgY2FuIG9ubHkgYmUKKyAgICAgICAgICogb2J0YWluZWQgZnJvbSB0aGUgUmVm
ZXJlbmNlIENvdW50ZXIgTVNSLgorICAgICAgICAgKi8KKyAgICAgICAgaWYgKCBzZXEgPT0gMCAp
CisgICAgICAgIHsKKyAgICAgICAgICAgIHJkbXNybChIVl9YNjRfTVNSX1RJTUVfUkVGX0NPVU5U
LCByZXQpOworICAgICAgICAgICAgcmV0dXJuIHJldDsKKyAgICAgICAgfQorCisgICAgICAgIHNt
cF9ybWIoKTsKKworICAgICAgICB0c2MgPSByZHRzY19vcmRlcmVkKCk7CisgICAgICAgIHNjYWxl
ID0gdHNjX3BhZ2UtPnRzY19zY2FsZTsKKyAgICAgICAgb2Zmc2V0ID0gdHNjX3BhZ2UtPnRzY19v
ZmZzZXQ7CisKKyAgICAgICAgc21wX3JtYigpOworCisgICAgfSB3aGlsZSAodHNjX3BhZ2UtPnRz
Y19zZXF1ZW5jZSAhPSBzZXEpOworCisgICAgLyogeDg2IGhhcyBBUkNIX1NVUFBPUlRTX0lOVDEy
OCAqLworICAgIHJldCA9ICh1aW50NjRfdCkoKChfX3VpbnQxMjhfdCl0c2MgKiBzY2FsZSkgPj4g
NjQpICsgb2Zmc2V0OworCisgICAgcmV0dXJuIHJldDsKK30KKworc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV90aW1lc291cmNlIF9faW5pdGRhdGEgcGx0X2h5cGVydl90aW1lciA9Cit7CisgICAgLmlk
ID0gImh5cGVydiIsCisgICAgLm5hbWUgPSAiSFlQRVItViBSRUZFUkVOQ0UgVFNDIiwKKyAgICAu
cmVhZF9jb3VudGVyID0gcmVhZF9oeXBlcnZfdGltZXIsCisgICAgLmluaXQgPSBpbml0X2h5cGVy
dl90aW1lciwKKyAgICAuY291bnRlcl9iaXRzID0gNjMsCit9OworI2VuZGlmCisKIC8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAq
IEdFTkVSSUMgUExBVEZPUk0gVElNRVIgSU5GUkFTVFJVQ1RVUkUKICAqLwpAQCAtNzYzLDYgKzg0
Nyw5IEBAIHN0YXRpYyB1NjQgX19pbml0IGluaXRfcGxhdGZvcm1fdGltZXIodm9pZCkKICAgICBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2UgKiBfX2luaXRkYXRhIHBsdF90aW1lcnNb
XSA9IHsKICNpZmRlZiBDT05GSUdfWEVOX0dVRVNUCiAgICAgICAgICZwbHRfeGVuX3RpbWVyLAor
I2VuZGlmCisjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAorICAgICAgICAmcGx0X2h5cGVydl90
aW1lciwKICNlbmRpZgogICAgICAgICAmcGx0X2hwZXQsICZwbHRfcG10aW1lciwgJnBsdF9waXQK
ICAgICB9OwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
