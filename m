Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF9296856
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 20:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i08aP-000664-Ke; Tue, 20 Aug 2019 18:10:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3t4G=WQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i08aO-00065T-1E
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 18:10:24 +0000
X-Inumbo-ID: c06f55ba-c375-11e9-92eb-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c06f55ba-c375-11e9-92eb-bc764e2007e4;
 Tue, 20 Aug 2019 18:10:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h28so4835786lfj.5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kZfdOq/+AGxkg2VwkO+D5NSs5HyNMq9JZ1kdANT+Bnk=;
 b=Jrb2DpazIWO88b8zrS0b/B+vEYrMcfRKrSJxbA/qKv3hcCTLsaqT7oTeNsfM9sZ1qe
 NeTMVoDfXZpm36IC3H721epT3qwE78+SfF/bDAR70TpsY8iZ/E0Ixfv0Q43bvT44kWej
 0TJVFMM75DzM5KkCx/hVNJsS6YdirrI+I0dlrh/AKS5jwIr5UxXKrBnWyaEfELmcf+pR
 dn1Xx8222XwSuoCYv+uOuwRA3JWbOm6GRcvcMXy92Q3qmodmbHobWwIBuR4F0uyrVQNi
 1G3quZaaBYDeQyEbXFF9mJ0I6aKdcobuVWPkD3IkJjcJA2508zE2XHYLwgi2udx/m9HX
 W/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kZfdOq/+AGxkg2VwkO+D5NSs5HyNMq9JZ1kdANT+Bnk=;
 b=AZ9xd8OvoBn8m0rjK69Pw8EOU++rLuLCRByqZW1XnDLPPrV3JwAKoOiOmrZe32tShp
 xOaS3ShpGHoUkeW4ljb7Ssznp+6aXklLE2DlwljrhRL76w9jASyqP3cseHTshexvr3Ox
 j3A/88tiveOjVDalehq/reHM3hVuuXMOr+W8teHVqHLPQLCngrfycAgIkMzMfh/f94tE
 L9NPjTdGcWruWesueZVb3pMgYI+tRyPX5mL9Y2Phw9OucoOVRzj6E3GvfgFo3BNv8xeh
 6iN0GtqA7yVaE7SkOMWouA1vhx557dJXMNvd6sTEPH1Sp1Ak9KgN3fekc8hUdAtA30Ue
 0wEg==
X-Gm-Message-State: APjAAAVTy2O1+s6BBBx9zGWfy01bV+9PXYYtXv2ItbU+EJ+Iq6jQgnRZ
 WAKpVZ0dkfqj/YyttfUZud3zIvCJ
X-Google-Smtp-Source: APXvYqzsR+0iryHKEfyRBzm7bowhHAc9PeG/t72fd1UwYtnM1rZpvp5996FpJoFVfnfzYDdJFMUPWA==
X-Received: by 2002:ac2:4289:: with SMTP id m9mr17484739lfh.49.1566324611260; 
 Tue, 20 Aug 2019 11:10:11 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id f6sm2900642lja.16.2019.08.20.11.10.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 20 Aug 2019 11:10:10 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 20 Aug 2019 21:09:43 +0300
Message-Id: <1566324587-3442-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V3 4/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Jan Beulich <jbeulich@suse.com>, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHR5cGUtc2FmZSBoZWxwZXIgbWFjcm9zIHRvIHJlLWFs
bG9jYXRlIHNwYWNlCmZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlw
ZWQgb2JqZWN0cy4KCkZvciBleGFtcGxlLCBpZiB3ZSBuZWVkIHRvIHJlLXNpemUgYW4gYXJyYXkg
d2l0aCBhIHNpbmdsZSBlbGVtZW50OgoKICAgc3RydWN0IGFycmxlbgogICB7CiAgICAgIHNpemVf
dCBsZW47CiAgICAgIGludCBkYXRhWzFdOwogICB9OwoKV2UgY2FuIHVzZSB0aGUgcHJvcG9zZWQg
bWFjcm9zIGluIHRoZSBmb2xsb3dpbmcgd2F5OgoKICAgbmV3X3B0ciA9IHJlYWxsb2NfZmxleF9z
dHJ1Y3Qob2xkX3B0ciwgc3RydWN0IGFycmxlbiwgZGF0YSwgbnVtX2VsZW0pOwoKU3Vic2VxdWVu
dCBwYXRjaCB3aWxsIHVzZSB0aGlzIG1hY3Jvcy4KCkFsc28sIHdoaWxlIGhlcmUsIGludHJvZHVj
ZSB4bWFsbG9jX2ZsZXhfc3RydWN0KCkgdG8gYWxsb2NhdGUgc3BhY2UKZm9yIGEgc3RydWN0dXJl
IHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmplY3RzLgoKU3VnZ2VzdGVkLWJ5OiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+ClNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
Q0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4K
Q0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaCB8
IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oIGIveGVuL2luY2x1ZGUveGVuL3htYWxs
b2MuaAppbmRleCA4MzExNTJmLi4yZWI4OGE4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
eG1hbGxvYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmgKQEAgLTM1LDYgKzM1LDE4
IEBACiAjZGVmaW5lIHh6YWxsb2NfYXJyYXkoX3R5cGUsIF9udW0pIFwKICAgICAoKF90eXBlICop
X3h6YWxsb2NfYXJyYXkoc2l6ZW9mKF90eXBlKSwgX19hbGlnbm9mX18oX3R5cGUpLCBfbnVtKSkK
IAorLyogUmUtYWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0dXJlIHdpdGggYSBmbGV4aWJsZSBh
cnJheSBvZiB0eXBlZCBvYmplY3RzLiAqLworI2RlZmluZSB4cmVhbGxvY19mbGV4X3N0cnVjdChf
cHRyLCBfdHlwZSwgX2ZpZWxkLCBfbGVuKSAoeyAgICAgICAgICAgICAgICAgICBcCisgICAgLyog
dHlwZSBjaGVja2luZzogbWFrZSBzdXJlIHRoYXQgaW5jb21pbmcgcG9pbnRlciBpcyBvZiBjb3Jy
ZWN0IHR5cGUgKi8gIFwKKyAgICAodm9pZCkoKHR5cGVvZihfcHRyKSkgMCA9PSAoX3R5cGUgKikg
MCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICgoX3R5cGUgKilfeHJl
YWxsb2MoX3B0ciwgb2Zmc2V0b2YoX3R5cGUsIF9maWVsZFtfbGVuXSksICAgICAgICAgICAgICAg
ICBcCisgICAgICAgICAgICAgICAgICAgICAgICBfX2FsaWdub2ZfXyhfdHlwZSkpKTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKK30pCisKKy8qIEFsbG9jYXRlIHNwYWNlIGZvciBh
IHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlwZWQgb2JqZWN0cy4gKi8KKyNk
ZWZpbmUgeG1hbGxvY19mbGV4X3N0cnVjdChfdHlwZSwgX2ZpZWxkLCBfbGVuKSBcCisgICAgKChf
dHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKF90eXBlLCBfZmllbGRbX2xlbl0pLCBfX2FsaWdub2Zf
XyhfdHlwZSkpKQorCiAvKiBBbGxvY2F0ZSB1bnR5cGVkIHN0b3JhZ2UuICovCiAjZGVmaW5lIHht
YWxsb2NfYnl0ZXMoX2J5dGVzKSBfeG1hbGxvYyhfYnl0ZXMsIFNNUF9DQUNIRV9CWVRFUykKICNk
ZWZpbmUgeHphbGxvY19ieXRlcyhfYnl0ZXMpIF94emFsbG9jKF9ieXRlcywgU01QX0NBQ0hFX0JZ
VEVTKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
