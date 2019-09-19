Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5ACB76DB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 12:00:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAtBc-000663-CK; Thu, 19 Sep 2019 09:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAtBb-00065t-Bx
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 09:57:15 +0000
X-Inumbo-ID: dacc5ede-dac3-11e9-978d-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dacc5ede-dac3-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 09:57:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j19so1450598lja.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PSlEb9C7GoT71czVnblZYorHuXEZqNRT+JC0mP2Sprc=;
 b=p3e6ZqxLhh6Arl+EQdp6ehlkpN2q4p9N54w6Doc3OrhMVfkPP/FhD3MPorf4ZI01Zk
 J+ZJ1OUL9QWG9WqEseQ1uT0Dbab6BQOMYlUzxs11UcMUdBIavMY7mZuJaqaIj98bP48t
 h4/WN0dusCXq+4vm42WbFKb6rFc++YVFdVOLa5VhjUlie64f+O8ybXRGvzSiOjN5YL2s
 XW30nqoFcG9fFVrMzJfv+Hvsj1ySkn8GJZSiUog0kvELroDuxJBXHlJTFgBsl6BWqQkM
 JOhQvk6fdnuntH9iqhVBeBCt6+s+IHuoztQ+iEHSa1/MbCsAeKVtolgcJS6YvHK69ztb
 cn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PSlEb9C7GoT71czVnblZYorHuXEZqNRT+JC0mP2Sprc=;
 b=Opzo2o6S6xi65plFX4S55jnzO4huEU3koHClgtp3qFuqc7PM/9nT+jx357fyyRZ1UB
 s1ar8U8gjA6izrWpwX4hAlgU5M2s/nr6gt6itzL3/mn8sfVRo31K0GVFIJ4u0/7Sd0nv
 gMoR0TWZMEpYNodv9iz4gLChI87AgYV+rKL3yyzr1IMRkyebrJVIvLTGAhoAmRDxFi+Z
 K6JEZdrtr47HSuf7AN2VAo4p6Xru1+lM4I4WzgAZ+UhpACjXQPIhuZtYxlxueU+rwRtD
 vVGcVQcJPKUb42AmBVgVmVPKorasfjUeYr6BRhHyVzx9zTosJYCmIisn4jevXF+MTpT7
 DiFw==
X-Gm-Message-State: APjAAAUkHXTPoOJ84et4pwVOHtE7UjTnoqQ0Mks9KGuaAM5fecpRM6oJ
 vm/M4RoNdp6E7XpF9nEFcvA=
X-Google-Smtp-Source: APXvYqz2J1eA9i/wbPZeGlmrkZCYVIa6BrHRPV0Xo9FlECHHV7Ui/FUtgR9ndrChAj4wzo2FNuUVIw==
X-Received: by 2002:a2e:8656:: with SMTP id i22mr4955493ljj.32.1568887033028; 
 Thu, 19 Sep 2019 02:57:13 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id q19sm1685845lfj.9.2019.09.19.02.57.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 02:57:12 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-3-git-send-email-olekstysh@gmail.com>
 <4fa60fde-b4c2-9653-57fa-beb846373a77@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9984ab6e-9406-c243-54fb-4af272d11e66@gmail.com>
Date: Thu, 19 Sep 2019 12:57:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4fa60fde-b4c2-9653-57fa-beb846373a77@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 2/8] iommu/arm: Add ability to handle
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA5LjE5IDEyOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbi4KCgo+Cj4gT24gMTMvMDkvMjAxOSAxNjozNSwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9t
bXUuYyAKPj4gYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYwo+PiBpbmRleCBm
MjE5ZGU5Li41NTVhY2ZjIDEwMDY0NAo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaW9tbXUuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYwo+
PiBAQCAtMjAsNiArMjAsMTIgQEAKPj4gwqAgI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPgo+
PiDCoCAjaW5jbHVkZSA8YXNtL2RldmljZS5oPgo+PiDCoCArLyoKPj4gKyAqIERlZmVycmVkIHBy
b2JlIGxpc3QgaXMgdXNlZCB0byBrZWVwIHRyYWNrIG9mIGRldmljZXMgZm9yIHdoaWNoIAo+PiBk
cml2ZXIKPj4gKyAqIHJlcXVlc3RlZCBkZWZlcnJlZCBwcm9iaW5nIChyZXR1cm5lZCAtRUFHQUlO
KS4KPj4gKyAqLwo+PiArc3RhdGljIF9faW5pdGRhdGEgTElTVF9IRUFEKGRlZmVycmVkX3Byb2Jl
X2xpc3QpOwo+PiArCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICppb21tdV9v
cHM7Cj4+IMKgIMKgIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmlvbW11X2dldF9vcHModm9pZCkK
Pj4gQEAgLTQyLDcgKzQ4LDcgQEAgdm9pZCBfX2luaXQgaW9tbXVfc2V0X29wcyhjb25zdCBzdHJ1
Y3QgaW9tbXVfb3BzICpvcHMpCj4+IMKgIMKgIGludCBfX2luaXQgaW9tbXVfaGFyZHdhcmVfc2V0
dXAodm9pZCkKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnA7Cj4+
ICvCoMKgwqAgc3RydWN0IGR0X2RldmljZV9ub2RlICpucCwgKnRtcDsKPj4gwqDCoMKgwqDCoCBp
bnQgcmM7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG51bV9pb21tdXMgPSAwOwo+PiDCoCBA
QCAtNTEsNiArNTcsMjEgQEAgaW50IF9faW5pdCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmMgPSBkZXZpY2VfaW5pdChucCwgREVWSUNFX0lPTU1VLCBO
VUxMKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggIXJjICkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbnVtX2lvbW11cysrOwo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIHJj
ID09IC1FQUdBSU4gKQo+PiArwqDCoMKgwqDCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogV2UgZXhwZWN0IG5vYm9keSB1
c2VzIGRldmljZSdzIGRvbWFpbl9saXN0IGF0IHN1Y2ggCj4+IGVhcmx5IHN0YWdlLAo+Cj4gTklU
OiBzL1dlIGV4cGVjdCBub2JvZHkgdXNlcy9Ob2JvZHkgc2hvdWxkIHVzZS8KCm9rCgoKPgo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc28gd2UgY2FuIHJlLXVzZSBpdCB0byBsaW5rIHRo
ZSBkZXZpY2UgaW4gdGhlIAo+PiBkZWZlcnJlZCBsaXN0IHRvCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKiBhdm9pZCBpbnRyb2R1Y2luZyBleHRyYSBsaXN0X2hlYWQgZmllbGQgaW4gc3Ry
dWN0IAo+PiBkdF9kZXZpY2Vfbm9kZS4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBU1NFUlQobGlzdF9lbXB0eSgmbnAtPmRvbWFpbl9s
aXN0KSk7Cj4KPiBbLi4uXQo+Cj4+IMKgIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfY2hl
Y2tfYXV0b3RyYW5zbGF0ZWRfaHdkb20oc3RydWN0IAo+PiBkb21haW4gKmQpCj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2RldmljZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9k
ZXZpY2UuaAo+PiBpbmRleCA2M2EwZjM2Li5lZTFjM2JjIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL2RldmljZS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZGV2aWNl
LmgKPj4gQEAgLTQ0LDcgKzQ0LDExIEBAIHN0cnVjdCBkZXZpY2VfZGVzYyB7Cj4+IMKgwqDCoMKg
wqAgZW51bSBkZXZpY2VfY2xhc3MgY2xhc3M7Cj4+IMKgwqDCoMKgwqAgLyogTGlzdCBvZiBkZXZp
Y2VzIHN1cHBvcnRlZCBieSB0aGlzIGRyaXZlciAqLwo+PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVj
dCBkdF9kZXZpY2VfbWF0Y2ggKmR0X21hdGNoOwo+PiAtwqDCoMKgIC8qIERldmljZSBpbml0aWFs
aXphdGlvbiAqLwo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIERldmljZSBpbml0aWFsaXph
dGlvbi4KPj4gK8KgwqDCoMKgICoKPj4gK8KgwqDCoMKgICogLUVBR0FJTiBpcyB1c2VkIHRvIGlu
ZGljYXRlIHRoYXQgZGV2aWNlIHByb2JpbmcgaXMgZGVmZXJyZWQuCj4+ICvCoMKgwqDCoCAqLwo+
PiDCoMKgwqDCoMKgIGludCAoKmluaXQpKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LCBjb25z
dCB2b2lkICpkYXRhKTsKPj4gwqAgfTsKPj4gwqAgZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi9kZXZpY2VfdHJlZS5oIAo+PiBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCj4+IGlu
ZGV4IDlhN2E4ZjIuLjM3MDJlOWIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kZXZp
Y2VfdHJlZS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oCj4+IEBAIC05
Miw2ICs5MiwxMyBAQCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgewo+PiDCoCDCoMKgwqDCoMKgIC8q
IElPTU1VIHNwZWNpZmljIGZpZWxkcyAqLwo+PiDCoMKgwqDCoMKgIGJvb2wgaXNfcHJvdGVjdGVk
Owo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIFRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBs
aXN0IG5vZGUgaXMgdG8gbGluayB0aGUgc3RydWN0dXJlIAo+PiBpbiB0aGUgbGlzdAo+Cj4gcy9u
b2RlLy8/CgpvawoKCj4KPj4gK8KgwqDCoMKgICogb2YgZGV2aWNlcyBhc3NpZ25lZCB0byBkb21h
aW4uCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIEJvb3QgY29kZSAoaW9tbXVfaGFyZHdh
cmVfc2V0dXApIHJlLXVzZXMgdGhpcyBsaXN0IHRvIGxpbmsgCj4+IHRoZSBzdHJ1Y3R1cmUKPj4g
K8KgwqDCoMKgICogaW4gdGhlIGxpc3Qgb2YgZGV2aWNlcyBmb3Igd2hpY2ggZHJpdmVyIHJlcXVl
c3RlZCBkZWZlcnJlZCAKPj4gcHJvYmluZy4KPj4gK8KgwqDCoMKgICovCj4+IMKgwqDCoMKgwqAg
c3RydWN0IGxpc3RfaGVhZCBkb21haW5fbGlzdDsKPj4gwqAgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2
aWNlIGRldjsKPj4KPgo+IFdpdGggdGhlIHR3byBhYm92ZSBhZGRyZXNzZWQgYW5kIHBlbmRpbmcg
dGhlIHBhdGNoIGl0IGRlcGVuZHMgb24gWzFdIAo+IGlzIGFja2VkOgo+Cj4gUmV2aWV3ZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFuayB5b3UuCgoKQ2FuIEkg
ZG8gYW55dGhpbmcgdG8gc3BlZWQgdXAgWzFdPyBUaGF0IHBhdGNoIHdhcyB0ZXN0ZWQgYW5kIHdv
cmtlZCBmaW5lLgoKCj4KPiBDaGVlcnMsCj4KPiBbMV0gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAxOTI0Lmh0bWwKPgot
LSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
