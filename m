Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB73BCB87
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:34:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmmM-0007oZ-As; Tue, 24 Sep 2019 15:31:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCmmK-0007oI-VV
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:31:00 +0000
X-Inumbo-ID: 4a50ba46-dee0-11e9-97fb-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by localhost (Halon) with ESMTPS
 id 4a50ba46-dee0-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 15:30:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y127so1770733lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xDq40Au2Mh7HyP1hj5EVpnkLX/Wo7KofiZYfsJMVXjI=;
 b=n2G6jw8Ln7O7S1FaAg88uaPetKqNjc3LUqU1/u77mIGZ5hBQ45/Uu5jz4qHwC2zzWT
 bCgQvrou2/C7+kTNiNn6KqnVbe2HjN1DSxJJ5Zbqy4CGfSXaDrzjWBEI0tyRbUph7QQ2
 rtjkZA05cj5ZMmWehZcNI0FhpmAseboczMUlChcYM49UIrasTYFWhroqdwGQ6vGN0V9Y
 FrQ6INdDRC3wVJq8zivzDgGPzTF5YX8RsKTGm3Dj5hi99Hfjx4c5tk6g6Dffmk2vnjaA
 /zlQiE1cMQJ0Ym5fhrPpM1Kjeoj/2DqXiUBygXV/yzRueDKa+MSj85gva7FZygZS7XvP
 VBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xDq40Au2Mh7HyP1hj5EVpnkLX/Wo7KofiZYfsJMVXjI=;
 b=fxto3CJVv/f036Jp6Ew9aAu7RsSRvNkD5y43VrdI+B2P0fqs2vabavwnOnnKq7d7XO
 PKkKSyvTfqR7LQKavHUzxlDuGaPAz37+TIpgkkiKBfpsmhwpPviTYiX7Sq7ktTXveLrx
 roggza4PHoqhJ3SkK9M7qg9PdBYV6mlN7ldjFtwdJyVhvv8xKGnxw4fCIf72W6Cws4oZ
 XdJxtxu21t7sukyxWqEHatMEfryqwvu/X7t6RSqxK2Np1T6UoMSN9DAh6V0vtONfc7ZP
 /dhMvhbqz5LmRWsYnaIvnPSOgw9dVsV/qkJTLucBA36p5bfuFk6GtPOX9G3C0IkWT8l1
 ph6w==
X-Gm-Message-State: APjAAAVLpzH59uwKh1iMP6oFxlgM0TYg/HxtkiyLupuhD2BlBnafy1hs
 nmcDndXUFCNx1pda8R7RdAuRUuXMl/Q=
X-Google-Smtp-Source: APXvYqzWnom2pf5wI0dodtFvA0qnCGVcPInR0foBKtLLIvWuqw82toki2gmmIWzOA2werorF22P5Pg==
X-Received: by 2002:ac2:483a:: with SMTP id 26mr2240195lft.188.1569339050626; 
 Tue, 24 Sep 2019 08:30:50 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z128sm525818lfa.1.2019.09.24.08.30.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Sep 2019 08:30:50 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 18:30:21 +0300
Message-Id: <1569339027-19484-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V5 2/8] iommu/arm: Add ability to handle
 deferred probing request
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBhZGRzIG1pbmltYWwgcmVxdWlyZWQgc3VwcG9ydCB0byBHZW5lcmFsIElP
TU1VIGZyYW1ld29yawp0byBiZSBhYmxlIHRvIGhhbmRsZSBhIGNhc2Ugd2hlbiBJT01NVSBkcml2
ZXIgcmVxdWVzdGluZyBkZWZlcnJlZApwcm9iaW5nIGZvciBhIGRldmljZS4KCkluIG9yZGVyIG5v
dCB0byBwdWxsIExpbnV4J3MgZXJyb3IgY29kZSAoLUVQUk9CRV9ERUZFUikgdG8gWGVuCndlIGhh
dmUgY2hvc2VuIC1FQUdBSU4gdG8gYmUgdXNlZCBmb3IgaW5kaWNhdGluZyB0aGF0IGRldmljZQpw
cm9iaW5nIGlzIGRlZmVycmVkLgoKVGhpcyBpcyBuZWVkZWQgZm9yIHRoZSB1cGNvbWluZyBJUE1N
VSBkcml2ZXIgd2hpY2ggbWF5IHJlcXVlc3QKZGVmZXJyZWQgcHJvYmluZyBkZXBlbmRpbmcgb24g
d2hhdCBkZXZpY2Ugd2lsbCBiZSBwcm9iZWQgdGhlIGZpcnN0Cih0aGVyZSBpcyBzb21lIGRlcGVu
ZGVuY3kgYmV0d2VlbiB0aGVzZSBkZXZpY2VzLCBSb290IGRldmljZSBtdXN0IGJlCnJlZ2lzdGVy
ZWQgYmVmb3JlIENhY2hlIGRldmljZXMuIElmIG5vdCB0aGUgY2FzZSwgZHJpdmVyIHdpbGwgZGVu
eQpmdXJ0aGVyIENhY2hlIGRldmljZSBwcm9iZXMgdW50aWwgUm9vdCBkZXZpY2UgaXMgcmVnaXN0
ZXJlZCkuCkFzIHdlIGNhbid0IGd1YXJhbnRlZSBhIGZpeGVkIHByZS1kZWZpbmVkIG9yZGVyIGZv
ciB0aGUgZGV2aWNlIG5vZGVzCmluIERULCB3ZSBuZWVkIHRvIGJlIHJlYWR5IGZvciB0aGUgc2l0
dWF0aW9uIHdoZXJlIGRldmljZXMgYmVpbmcKcHJvYmVkIGluICJhbnkiIG9yZGVyLgoKU2lnbmVk
LW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0u
Y29tPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0t
LQpDaGFuZ2VzIFY0IC0+IFY1OgogICAgLSBhZGRlZCBKdWxpZW4ncyBSLWIKICAgIC0gZml4ZWQg
R3JhbW1hdGljYWwgZXJyb3IKCkNoYW5nZXMgVjMgLT4gVjQ6CiAgICAtIG1vdmVkIGNoYW5nZXMg
cmVsYXRlZCB0byB0aGUgImhlYWRlcnMgb3JkZXJpbmciCiAgICAgIHRvIGEgc2VwYXJhdGUgcGF0
Y2gKICAgIC0gYWRkZWQgZXhwbGFpbmF0aW9uIHdoeSBkb21haW5fbGlzdCBpcyByZS11c2VkCiAg
ICAtIHJlbW92ZWQgdGhlIHVubmVjZXNzYXJ5IHBhaXIgb2Ygb3V0ZXJtb3N0IHBhcmVudGhlc2Vz
CiAgICAgIHdoZW4gY2hlY2tpbmcgdGhlIGxpc3RfZW1wdHkKCkNoYW5nZXMgVjIgLT4gVjM6CiAg
ICAtIHJlbW92ZWQgZGVmZXJyZWRfcHJvYmUgZmllbGQgZnJvbSBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUsCiAgICAgIHJlLXVzZWQgZG9tYWluX2xpc3QgaW5zdGVhZAogICAgLSBkb2N1bWVudGVkIGRv
bWFpbl9saXN0IHVzYWdlCiAgICAtIGFkZGVkIEFTU0VSVCB0byBjaGVjayB0aGF0IG5wLT5kb21h
aW5fbGlzdCBpcyBlbXB0eQogICAgICBiZWZvcmUgcmUtdXNpbmcgaXQKICAgIC0gcHV0IGRlZmVy
cmVkX3Byb2JlX2xpc3QgdG8gaW5pdCBzZWN0aW9uCiAgICAtIHVzZWQgbW9yZSBzdHJpY3QgbG9n
aWMgcmVnYXJkaW5nIHByb2Nlc3NpbmcgZGV2aWNlcyBpbgogICAgICB0aGUgZGVmZXJyZWQgbGlz
dAogICAgLSBhZGRlZCBtb3JlIGNvbW1lbnRzIHRvIGNvZGUKICAgIC0gcHV0IGhlYWRlcnMgaW4g
YWxwaGFiZXRpY2FsIG9yZGVyCi0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11
LmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL2RldmljZS5oICAgICAgICB8ICA2ICsrKy0KIHhlbi9pbmNsdWRlL3hlbi9kZXZp
Y2VfdHJlZS5oICAgICAgIHwgIDcgKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCmluZGV4
IDI2NzhlZjUuLjc2ZTExNTIgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCkBAIC0y
MSw2ICsyMSwxMiBAQAogCiAjaW5jbHVkZSA8YXNtL2RldmljZS5oPgogCisvKgorICogRGVmZXJy
ZWQgcHJvYmUgbGlzdCBpcyB1c2VkIHRvIGtlZXAgdHJhY2sgb2YgZGV2aWNlcyBmb3Igd2hpY2gg
ZHJpdmVyCisgKiByZXF1ZXN0ZWQgZGVmZXJyZWQgcHJvYmluZyAocmV0dXJuZWQgLUVBR0FJTiku
CisgKi8KK3N0YXRpYyBfX2luaXRkYXRhIExJU1RfSEVBRChkZWZlcnJlZF9wcm9iZV9saXN0KTsK
Kwogc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X29wczsKIAogY29uc3Qgc3Ry
dWN0IGlvbW11X29wcyAqaW9tbXVfZ2V0X29wcyh2b2lkKQpAQCAtNDMsNyArNDksNyBAQCB2b2lk
IF9faW5pdCBpb21tdV9zZXRfb3BzKGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKm9wcykKIAogaW50
IF9faW5pdCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQogewotICAgIHN0cnVjdCBkdF9kZXZp
Y2Vfbm9kZSAqbnA7CisgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpucCwgKnRtcDsKICAgICBp
bnQgcmM7CiAgICAgdW5zaWduZWQgaW50IG51bV9pb21tdXMgPSAwOwogCkBAIC01Miw2ICs1OCwy
MSBAQCBpbnQgX19pbml0IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpCiAgICAgICAgIHJjID0g
ZGV2aWNlX2luaXQobnAsIERFVklDRV9JT01NVSwgTlVMTCk7CiAgICAgICAgIGlmICggIXJjICkK
ICAgICAgICAgICAgIG51bV9pb21tdXMrKzsKKyAgICAgICAgZWxzZSBpZiAoIHJjID09IC1FQUdB
SU4gKQorICAgICAgICB7CisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICogTm9ib2R5IHNo
b3VsZCB1c2UgZGV2aWNlJ3MgZG9tYWluX2xpc3QgYXQgc3VjaCBlYXJseSBzdGFnZSwKKyAgICAg
ICAgICAgICAqIHNvIHdlIGNhbiByZS11c2UgaXQgdG8gbGluayB0aGUgZGV2aWNlIGluIHRoZSBk
ZWZlcnJlZCBsaXN0IHRvCisgICAgICAgICAgICAgKiBhdm9pZCBpbnRyb2R1Y2luZyBleHRyYSBs
aXN0X2hlYWQgZmllbGQgaW4gc3RydWN0IGR0X2RldmljZV9ub2RlLgorICAgICAgICAgICAgICov
CisgICAgICAgICAgICBBU1NFUlQobGlzdF9lbXB0eSgmbnAtPmRvbWFpbl9saXN0KSk7CisKKyAg
ICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBEcml2ZXIgcmVxdWVzdGVkIGRlZmVycmVkIHBy
b2JpbmcsIHNvIGFkZCB0aGlzIGRldmljZSB0bworICAgICAgICAgICAgICogdGhlIGRlZmVycmVk
IGxpc3QgZm9yIGZ1cnRoZXIgcHJvY2Vzc2luZy4KKyAgICAgICAgICAgICAqLworICAgICAgICAg
ICAgbGlzdF9hZGQoJm5wLT5kb21haW5fbGlzdCwgJmRlZmVycmVkX3Byb2JlX2xpc3QpOworICAg
ICAgICB9CiAgICAgICAgIC8qCiAgICAgICAgICAqIElnbm9yZSB0aGUgZm9sbG93aW5nIGVycm9y
IGNvZGVzOgogICAgICAgICAgKiAgIC0gRUJBREY6IEluZGljYXRlIHRoZSBjdXJyZW50IGlzIG5v
dCBhbiBJT01NVQpAQCAtNjIsNyArODMsMzggQEAgaW50IF9faW5pdCBpb21tdV9oYXJkd2FyZV9z
ZXR1cCh2b2lkKQogICAgICAgICAgICAgcmV0dXJuIHJjOwogICAgIH0KIAotICAgIHJldHVybiAo
IG51bV9pb21tdXMgPiAwICkgPyAwIDogLUVOT0RFVjsKKyAgICAvKiBSZXR1cm4gaW1tZWRpYXRl
bHkgaWYgdGhlcmUgYXJlIG5vIGluaXRpYWxpemVkIGRldmljZXMuICovCisgICAgaWYgKCAhbnVt
X2lvbW11cyApCisgICAgICAgIHJldHVybiBsaXN0X2VtcHR5KCZkZWZlcnJlZF9wcm9iZV9saXN0
KSA/IC1FTk9ERVYgOiAtRUFHQUlOOworCisgICAgcmMgPSAwOworCisgICAgLyoKKyAgICAgKiBQ
cm9jZXNzIGRldmljZXMgaW4gdGhlIGRlZmVycmVkIGxpc3QgaWYgaXQgaXMgbm90IGVtcHR5Lgor
ICAgICAqIENoZWNrIHRoYXQgYXQgbGVhc3Qgb25lIGRldmljZSBpcyBpbml0aWFsaXplZCBhdCBl
YWNoIGxvb3AsIG90aGVyd2lzZQorICAgICAqIHdlIG1heSBnZXQgYW4gaW5maW5pdGUgbG9vcC4g
QWxzbyBzdG9wIHByb2Nlc3NpbmcgaWYgd2UgZ290IGFuIGVycm9yCisgICAgICogb3RoZXIgdGhh
biAtRUFHQUlOLgorICAgICAqLworICAgIHdoaWxlICggIWxpc3RfZW1wdHkoJmRlZmVycmVkX3By
b2JlX2xpc3QpICYmIG51bV9pb21tdXMgKQorICAgIHsKKyAgICAgICAgbnVtX2lvbW11cyA9IDA7
CisKKyAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlICggbnAsIHRtcCwgJmRlZmVycmVk
X3Byb2JlX2xpc3QsIGRvbWFpbl9saXN0ICkKKyAgICAgICAgeworICAgICAgICAgICAgcmMgPSBk
ZXZpY2VfaW5pdChucCwgREVWSUNFX0lPTU1VLCBOVUxMKTsKKyAgICAgICAgICAgIGlmICggIXJj
ICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBudW1faW9tbXVzKys7CisKKyAgICAg
ICAgICAgICAgICAvKiBSZW1vdmUgaW5pdGlhbGl6ZWQgZGV2aWNlIGZyb20gdGhlIGRlZmVycmVk
IGxpc3QuICovCisgICAgICAgICAgICAgICAgbGlzdF9kZWxfaW5pdCgmbnAtPmRvbWFpbl9saXN0
KTsKKyAgICAgICAgICAgIH0KKyAgICAgICAgICAgIGVsc2UgaWYgKCByYyAhPSAtRUFHQUlOICkK
KyAgICAgICAgICAgICAgICByZXR1cm4gcmM7CisgICAgICAgIH0KKyAgICB9CisKKyAgICByZXR1
cm4gcmM7CiB9CiAKIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfY2hlY2tfYXV0b3RyYW5z
bGF0ZWRfaHdkb20oc3RydWN0IGRvbWFpbiAqZCkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vZGV2aWNlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RldmljZS5oCmluZGV4IDYzYTBm
MzYuLmVlMWMzYmMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZGV2aWNlLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9kZXZpY2UuaApAQCAtNDQsNyArNDQsMTEgQEAgc3RydWN0
IGRldmljZV9kZXNjIHsKICAgICBlbnVtIGRldmljZV9jbGFzcyBjbGFzczsKICAgICAvKiBMaXN0
IG9mIGRldmljZXMgc3VwcG9ydGVkIGJ5IHRoaXMgZHJpdmVyICovCiAgICAgY29uc3Qgc3RydWN0
IGR0X2RldmljZV9tYXRjaCAqZHRfbWF0Y2g7Ci0gICAgLyogRGV2aWNlIGluaXRpYWxpemF0aW9u
ICovCisgICAgLyoKKyAgICAgKiBEZXZpY2UgaW5pdGlhbGl6YXRpb24uCisgICAgICoKKyAgICAg
KiAtRUFHQUlOIGlzIHVzZWQgdG8gaW5kaWNhdGUgdGhhdCBkZXZpY2UgcHJvYmluZyBpcyBkZWZl
cnJlZC4KKyAgICAgKi8KICAgICBpbnQgKCppbml0KShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRl
diwgY29uc3Qgdm9pZCAqZGF0YSk7CiB9OwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
ZGV2aWNlX3RyZWUuaCBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCmluZGV4IDlhN2E4
ZjIuLmYyYWQyMmIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCkBAIC05Miw2ICs5MiwxMyBAQCBzdHJ1
Y3QgZHRfZGV2aWNlX25vZGUgewogCiAgICAgLyogSU9NTVUgc3BlY2lmaWMgZmllbGRzICovCiAg
ICAgYm9vbCBpc19wcm90ZWN0ZWQ7CisgICAgLyoKKyAgICAgKiBUaGUgbWFpbiBwdXJwb3NlIG9m
IHRoaXMgbGlzdCBpcyB0byBsaW5rIHRoZSBzdHJ1Y3R1cmUgaW4gdGhlIGxpc3QKKyAgICAgKiBv
ZiBkZXZpY2VzIGFzc2lnbmVkIHRvIGRvbWFpbi4KKyAgICAgKgorICAgICAqIEJvb3QgY29kZSAo
aW9tbXVfaGFyZHdhcmVfc2V0dXApIHJlLXVzZXMgdGhpcyBsaXN0IHRvIGxpbmsgdGhlIHN0cnVj
dHVyZQorICAgICAqIGluIHRoZSBsaXN0IG9mIGRldmljZXMgZm9yIHdoaWNoIGRyaXZlciByZXF1
ZXN0ZWQgZGVmZXJyZWQgcHJvYmluZy4KKyAgICAgKi8KICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGRv
bWFpbl9saXN0OwogCiAgICAgc3RydWN0IGRldmljZSBkZXY7Ci0tIAoyLjcuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
