Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B17FED4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htab5-0003r4-0i; Fri, 02 Aug 2019 16:40:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/l75=V6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htab3-0003jG-N3
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 16:40:01 +0000
X-Inumbo-ID: 2a9756b4-b544-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a9756b4-b544-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 16:39:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h10so1991828ljg.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tUi536buQuYUiKH6fBHUyB21xHhva7OYwGdSrgDouS8=;
 b=OhQJYRbC8wPW6QUTfCsBVEphNLWPtFcJk6vLuxjDTGoXt0I76omw/OXteMDk/xRtw3
 6UngcBpzvgv+vvMOozbuyEHXajRJF5tGWLfoMzCxYGxGjqfAJCmubCUlFd+zDT4piySG
 HrYkPQsVOZ/DYkKg+9QQVs2u4Ec9PqD04SFumy2xAzjT/Jx1yiJD/3s1QqgEWCb77wj2
 I3GZA9MMK5/N4Dk1Tsav7HBEew4Tr4OY+Y44kAKijQ5XviIAw2HTmfwB7BqDyDGtW3im
 x+CT6cqVeCA5CD+Vq4WrAenQKWBXBzxzDurkrlteadtmsu1QP9SnV3yuPkztnWL/XPI0
 wX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tUi536buQuYUiKH6fBHUyB21xHhva7OYwGdSrgDouS8=;
 b=uaM+0XBRZ5Z8tr7VVadwx0DN/EtpmCZjMml7hBQ/bOCZ5viZ38U66dk7+mQ2RbegmM
 KE6f60n4GUtnNqc+7+u93JZuZy6ZFw9R0R4Ta0SgQ90m008CUDPp0f1k+cj7HPSw+ejq
 xPoVkYzW+vj3KHxCU0r5ffitRi7pR7W24ITUyZPqj1SLmF2xhmmMYvLeja/mrn1P+gg+
 Mjs+Yw0UjYjFoo1Z8WnHb0nQTiepWtpurR1d5dyDuwr1MTjdfVN2iO55CB6iD0d84IH1
 QJGP1OwNWxymfuvWouRSCNexnoeScciYPxrs7KKKdvOt1EwJHqpTqrWe6HezDEwNMy1r
 Y4Dg==
X-Gm-Message-State: APjAAAV9479PG7JjfgiZ2HzWLg0sBr/TUV9CSMI5OaYBnrvelBveGORK
 4lMD3AWFM1I37i0wg6ITp/qNJE7UmOY=
X-Google-Smtp-Source: APXvYqwP9X/+6muLLHYVaPnqD11YWTQGSf9t8+delRGYlZEGHtX2SSxGmGTXKCw+XHQxsjlno3Cv9Q==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr32320025ljj.203.1564763998179; 
 Fri, 02 Aug 2019 09:39:58 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q6sm15378998lji.70.2019.08.02.09.39.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Aug 2019 09:39:57 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  2 Aug 2019 19:39:40 +0300
Message-Id: <1564763985-20312-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V2 1/6] iommu/arm: Add iommu_helpers.c file to
 keep common for IOMMUs stuff
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSW50cm9kdWNlIGEgc2VwYXJhdGUgZmlsZSB0byBrZWVwIHZhcmlvdXMgaGVscGVycyB3aGlj
aCBjb3VsZCBiZSB1c2VkCmJ5IG1vcmUgdGhhbiBvbmUgSU9NTVUgZHJpdmVyIGluIG9yZGVyIG5v
dCB0byBkdXBsaWNhdGUgY29kZS4KClRoZSBmaXJzdCBjb25kaWRhdGVzIHRvIGJlIG1vdmVkIHRv
IHRoZSBuZXcgZmlsZSBhcmUgU01NVSBkcml2ZXIncwoibWFwX3BhZ2UvdW5tYXBfcGFnZSIgY2Fs
bGJhY2tzLiBUaGVyZSBjYWxsYmFja3MgbmVpdGhlciBjb250YWluIGFueQpTTU1VIHNwZWNpZmlj
IGluZm8gbm9yIHBlcmZvcm0gYW55IFNNTVUgc3BlY2lmaWMgYWN0aW9ucyBhbmQgYXJlIGdvaW5n
CnRvIGJlIHRoZSBzYW1lIGFjcm9zcyBhbGwgSU9NTVUgZHJpdmVycyB3aGljaCBIL1cgSVAgc2hh
cmVzIFAyTQp3aXRoIHRoZSBDUFUgbGlrZSBTTU1VIGRvZXMuCgpTbywgbW92ZSBjYWxsYmFja3Mg
dG8gaW9tbXVfaGVscGVycy5jIGZvciB0aGUgdXBjb21pbmcgSVBNTVUgZHJpdmVyCnRvIGJlIGFi
bGUgdG8gcmUtdXNlIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8
b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL01ha2VmaWxlICAgICAgICB8ICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaW9tbXVfaGVscGVycy5jIHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgICAgICAgICAgfCA0OCArLS0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgICAgICAgICAgICAgfCAg
NyArKysKIDQgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11X2hl
bHBlcnMuYwoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmls
ZSBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZQppbmRleCBiM2VmY2ZkLi40
YWJiODdhIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUK
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCkBAIC0xLDIgKzEsMiBA
QAotb2JqLXkgKz0gaW9tbXUubworb2JqLXkgKz0gaW9tbXUubyBpb21tdV9oZWxwZXJzLm8KIG9i
ai0kKENPTkZJR19BUk1fU01NVSkgKz0gc21tdS5vCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVycy5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL2lvbW11X2hlbHBlcnMuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41
M2U4ZGFhCi0tLSAvZGV2L251bGwKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lv
bW11X2hlbHBlcnMuYwpAQCAtMCwwICsxLDc4IEBACisvKgorICogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL2lvbW11X2hlbHBlcnMuYworICoKKyAqIENvbnRhaW5zIHZhcmlvdXMgaGVscGVy
cyB0byBiZSB1c2VkIGJ5IElPTU1VIGRyaXZlcnMuCisgKgorICogQ29weXJpZ2h0IChDKSAyMDE5
IEVQQU0gU3lzdGVtcyBJbmMuCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0
ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNl
LCB2ZXJzaW9uIDIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLAorICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2
ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisgKiBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2Vp
dmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uCisgKi8KKworI2luY2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4K
KyNpbmNsdWRlIDx4ZW4vaW9tbXUuaD4KKyNpbmNsdWRlIDxhc20vZGV2aWNlLmg+CisKKy8qIFNo
b3VsZCBvbmx5IGJlIHVzZWQgaWYgUDJNIFRhYmxlIGlzIHNoYXJlZCBiZXR3ZWVuIHRoZSBDUFUg
YW5kIHRoZSBJT01NVS4gKi8KK2ludCBfX211c3RfY2hlY2sgYXJtX2lvbW11X21hcF9wYWdlKHN0
cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3QgbWZuLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpmbHVzaF9mbGFncykKK3sKKyAgICBwMm1f
dHlwZV90IHQ7CisKKyAgICAvKgorICAgICAqIEdyYW50IG1hcHBpbmdzIGNhbiBiZSB1c2VkIGZv
ciBETUEgcmVxdWVzdHMuIFRoZSBkZXZfYnVzX2FkZHIKKyAgICAgKiByZXR1cm5lZCBieSB0aGUg
aHlwZXJjYWxsIGlzIHRoZSBNRk4gKG5vdCB0aGUgSVBBKS4gRm9yIGRldmljZQorICAgICAqIHBy
b3RlY3RlZCBieSBhbiBJT01NVSwgWGVuIG5lZWRzIHRvIGFkZCBhIDE6MSBtYXBwaW5nIGluIHRo
ZSBkb21haW4KKyAgICAgKiBwMm0gdG8gYWxsb3cgRE1BIHJlcXVlc3QgdG8gd29yay4KKyAgICAg
KiBUaGlzIGlzIG9ubHkgdmFsaWQgd2hlbiB0aGUgZG9tYWluIGlzIGRpcmVjdGVkIG1hcHBlZC4g
SGVuY2UgdGhpcworICAgICAqIGZ1bmN0aW9uIHNob3VsZCBvbmx5IGJlIHVzZWQgYnkgZ250dGFi
IGNvZGUgd2l0aCBnZm4gPT0gbWZuID09IGRmbi4KKyAgICAgKi8KKyAgICBCVUdfT04oIWlzX2Rv
bWFpbl9kaXJlY3RfbWFwcGVkKGQpKTsKKyAgICBCVUdfT04obWZuX3gobWZuKSAhPSBkZm5feChk
Zm4pKTsKKworICAgIC8qIFdlIG9ubHkgc3VwcG9ydCByZWFkYWJsZSBhbmQgd3JpdGFibGUgZmxh
Z3MgKi8KKyAgICBpZiAoICEoZmxhZ3MgJiAoSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRh
YmxlKSkgKQorICAgICAgICByZXR1cm4gLUVJTlZBTDsKKworICAgIHQgPSAoZmxhZ3MgJiBJT01N
VUZfd3JpdGFibGUpID8gcDJtX2lvbW11X21hcF9ydyA6IHAybV9pb21tdV9tYXBfcm87CisKKyAg
ICAvKgorICAgICAqIFRoZSBmdW5jdGlvbiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSByZXBsYWNl
cyB0aGUgY3VycmVudCBtYXBwaW5nCisgICAgICogaWYgdGhlcmUgaXMgYWxyZWFkeSBvbmUuLi4K
KyAgICAgKi8KKyAgICByZXR1cm4gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoZCwgX2dmbihkZm5f
eChkZm4pKSwgX21mbihkZm5feChkZm4pKSwgMCwgdCk7Cit9CisKKy8qIFNob3VsZCBvbmx5IGJl
IHVzZWQgaWYgUDJNIFRhYmxlIGlzIHNoYXJlZCBiZXR3ZWVuIHRoZSBDUFUgYW5kIHRoZSBJT01N
VS4gKi8KK2ludCBfX211c3RfY2hlY2sgYXJtX2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFp
biAqZCwgZGZuX3QgZGZuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgKmZsdXNoX2ZsYWdzKQoreworICAgIC8qCisgICAgICogVGhpcyBmdW5jdGlv
biBzaG91bGQgb25seSBiZSB1c2VkIGJ5IGdudHRhYiBjb2RlIHdoZW4gdGhlIGRvbWFpbgorICAg
ICAqIGlzIGRpcmVjdCBtYXBwZWQgKGkuZS4gZ2ZuID09IG1mbiA9PSBkZm4pLgorICAgICAqLwor
ICAgIGlmICggIWlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICkKKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CisKKyAgICByZXR1cm4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZShkLCBfZ2ZuKGRm
bl94KGRmbikpLCBfbWZuKGRmbl94KGRmbikpLCAwKTsKK30KKworLyoKKyAqIExvY2FsIHZhcmlh
YmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAqIGMtYmFzaWMtb2Zm
c2V0OiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwpkaWZmIC0tZ2l0
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9zbW11LmMKaW5kZXggZjE1MWI5Zi4uOGFlOTg2YSAxMDA2NDQKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hcm0vc21tdS5jCkBAIC0yNzM0LDUwICsyNzM0LDYgQEAgc3RhdGljIHZvaWQgYXJtX3Nt
bXVfaW9tbXVfZG9tYWluX3RlYXJkb3duKHN0cnVjdCBkb21haW4gKmQpCiAJeGZyZWUoeGVuX2Rv
bWFpbik7CiB9CiAKLXN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGFybV9zbW11X21hcF9wYWdlKHN0
cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwKLQkJCQkJICBtZm5fdCBtZm4sIHVuc2lnbmVkIGlu
dCBmbGFncywKLQkJCQkJICB1bnNpZ25lZCBpbnQgKmZsdXNoX2ZsYWdzKQotewotCXAybV90eXBl
X3QgdDsKLQotCS8qCi0JICogR3JhbnQgbWFwcGluZ3MgY2FuIGJlIHVzZWQgZm9yIERNQSByZXF1
ZXN0cy4gVGhlIGRldl9idXNfYWRkcgotCSAqIHJldHVybmVkIGJ5IHRoZSBoeXBlcmNhbGwgaXMg
dGhlIE1GTiAobm90IHRoZSBJUEEpLiBGb3IgZGV2aWNlCi0JICogcHJvdGVjdGVkIGJ5IGFuIElP
TU1VLCBYZW4gbmVlZHMgdG8gYWRkIGEgMToxIG1hcHBpbmcgaW4gdGhlIGRvbWFpbgotCSAqIHAy
bSB0byBhbGxvdyBETUEgcmVxdWVzdCB0byB3b3JrLgotCSAqIFRoaXMgaXMgb25seSB2YWxpZCB3
aGVuIHRoZSBkb21haW4gaXMgZGlyZWN0ZWQgbWFwcGVkLiBIZW5jZSB0aGlzCi0JICogZnVuY3Rp
b24gc2hvdWxkIG9ubHkgYmUgdXNlZCBieSBnbnR0YWIgY29kZSB3aXRoIGdmbiA9PSBtZm4gPT0g
ZGZuLgotCSAqLwotCUJVR19PTighaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkpOwotCUJVR19P
TihtZm5feChtZm4pICE9IGRmbl94KGRmbikpOwotCi0JLyogV2Ugb25seSBzdXBwb3J0IHJlYWRh
YmxlIGFuZCB3cml0YWJsZSBmbGFncyAqLwotCWlmICghKGZsYWdzICYgKElPTU1VRl9yZWFkYWJs
ZSB8IElPTU1VRl93cml0YWJsZSkpKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCXQgPSAoZmxhZ3Mg
JiBJT01NVUZfd3JpdGFibGUpID8gcDJtX2lvbW11X21hcF9ydyA6IHAybV9pb21tdV9tYXBfcm87
Ci0KLQkvKgotCSAqIFRoZSBmdW5jdGlvbiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSByZXBsYWNl
cyB0aGUgY3VycmVudCBtYXBwaW5nCi0JICogaWYgdGhlcmUgaXMgYWxyZWFkeSBvbmUuLi4KLQkg
Ki8KLQlyZXR1cm4gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoZCwgX2dmbihkZm5feChkZm4pKSwg
X21mbihkZm5feChkZm4pKSwKLQkJCQkgICAgICAgMCwgdCk7Ci19Ci0KLXN0YXRpYyBpbnQgX19t
dXN0X2NoZWNrIGFybV9zbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZu
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgKmZsdXNoX2ZsYWdzKQotewotCS8qCi0JICogVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBi
ZSB1c2VkIGJ5IGdudHRhYiBjb2RlIHdoZW4gdGhlIGRvbWFpbgotCSAqIGlzIGRpcmVjdCBtYXBw
ZWQgKGkuZS4gZ2ZuID09IG1mbiA9PSBkZm4pLgotCSAqLwotCWlmICggIWlzX2RvbWFpbl9kaXJl
Y3RfbWFwcGVkKGQpICkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KLQlyZXR1cm4gZ3Vlc3RfcGh5c21h
cF9yZW1vdmVfcGFnZShkLCBfZ2ZuKGRmbl94KGRmbikpLCBfbWZuKGRmbl94KGRmbikpLCAwKTsK
LX0KLQogc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgYXJtX3NtbXVfaW9tbXVfb3BzID0g
ewogICAgIC5pbml0ID0gYXJtX3NtbXVfaW9tbXVfZG9tYWluX2luaXQsCiAgICAgLmh3ZG9tX2lu
aXQgPSBhcm1fc21tdV9pb21tdV9od2RvbV9pbml0LApAQCAtMjc4Niw4ICsyNzQyLDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgYXJtX3NtbXVfaW9tbXVfb3BzID0gewogICAgIC5p
b3RsYl9mbHVzaF9hbGwgPSBhcm1fc21tdV9pb3RsYl9mbHVzaF9hbGwsCiAgICAgLmFzc2lnbl9k
ZXZpY2UgPSBhcm1fc21tdV9hc3NpZ25fZGV2LAogICAgIC5yZWFzc2lnbl9kZXZpY2UgPSBhcm1f
c21tdV9yZWFzc2lnbl9kZXYsCi0gICAgLm1hcF9wYWdlID0gYXJtX3NtbXVfbWFwX3BhZ2UsCi0g
ICAgLnVubWFwX3BhZ2UgPSBhcm1fc21tdV91bm1hcF9wYWdlLAorICAgIC5tYXBfcGFnZSA9IGFy
bV9pb21tdV9tYXBfcGFnZSwKKyAgICAudW5tYXBfcGFnZSA9IGFybV9pb21tdV91bm1hcF9wYWdl
LAogfTsKIAogc3RhdGljIF9faW5pdCBjb25zdCBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpmaW5k
X3NtbXUoY29uc3Qgc3RydWN0IGRldmljZSAqZGV2KQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLWFybS9pb21tdS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oCmluZGV4IDkwNGM5
YWUuLjIwZDg2NWUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmgKQEAgLTI2LDYgKzI2LDEzIEBAIHN0cnVjdCBh
cmNoX2lvbW11CiBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICppb21tdV9nZXRfb3BzKHZvaWQpOwog
dm9pZCBpb21tdV9zZXRfb3BzKGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKm9wcyk7CiAKKy8qIG1h
cHBpbmcgaGVscGVycyAqLworaW50IF9fbXVzdF9jaGVjayBhcm1faW9tbXVfbWFwX3BhZ2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5fdCBtZm4sCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsdXNoX2ZsYWdzKTsKK2ludCBfX211c3Rf
Y2hlY2sgYXJtX2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsdXNo
X2ZsYWdzKTsKKwogI2VuZGlmIC8qIF9fQVJDSF9BUk1fSU9NTVVfSF9fICovCiAKIC8qCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
