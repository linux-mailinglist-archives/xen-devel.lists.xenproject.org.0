Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56667B78EE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 14:11:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAvF0-0000bp-5u; Thu, 19 Sep 2019 12:08:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAvEy-0000bO-Fd
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 12:08:52 +0000
X-Inumbo-ID: 3dfa72c2-dad6-11e9-b299-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dfa72c2-dad6-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 12:08:51 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r22so2194011lfm.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=anhbgPSwzBRPJC6XzXR6lPh+gfvvWdc6ywTpqdb2Jjg=;
 b=fSLh5AZENBEh6tiWPDmEd4wJ/aCpLR6++VucFeGFZS8872v2FGMcJgO213i68cPBhZ
 IKfh2I1LCLkWrP8nFRzZMSGe8a75vIcmlQLOyec69ODm9OZL4ybTc7Yf8NNA1jP88OME
 xaJX+BynRsotULA5bn19p1anXsEanlTL9WCFb5hBhgLNpky8O4ZOtXLIvbpuwjx+xQhw
 3Q85AtsJaD2ruKQJFMfODiOtcDBMXRuTxU8/Zu0FShjyGbcZhlTz8H3abPULv5cnJg2S
 y6UYCDyrhemZv37rTpscHoI9jCgZPh/d82EYvkav5EPQqmfOWYShShOcgjpdJ42S6d4l
 3klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=anhbgPSwzBRPJC6XzXR6lPh+gfvvWdc6ywTpqdb2Jjg=;
 b=H0QonJqikBfTG+LH/zt+53nE7+PP3qtVNXtqZua50fI53ACPrUxEyknyo6Yxl7VhjE
 Xjl2PI7gdF4gl2qE46zC1SMg/D+Ua2cbFZyATNJymyP5J8ZqaKVEhxJ1v3zDBplLVY3w
 PPk7dNVSWoLPr2nCfFA+shnQMbILihGskLUGGzgp9sg0WJuKFEPlTkt+MmA1md0b05PA
 j24Swv+Ahv9ebQLJwKsqzz4anQjd/hvpsSUy9J7a79nP0PN4EKBohCHI/yGmiN/rjhmX
 A/ELbM+MIDJ6L3ly1o0s5bXM+U5kPpBQsbxkrggL+ZBPEV/Logc9hxQpVjsF1arnOzUj
 hCVQ==
X-Gm-Message-State: APjAAAXXeD8YMoXWHHnaeWqbxHen8sJ/zanBxTBeICrW+AohxAve1vuU
 77jLES1+ix02Im0ZPWlyh+4=
X-Google-Smtp-Source: APXvYqya53ImuWu/vL5XhE4RvkmTZqLXkRVCKxXArWlU+TqYDU/kaDMPEQZSkLuOkBLTQugkRSghQw==
X-Received: by 2002:ac2:515b:: with SMTP id q27mr4984969lfd.154.1568894930382; 
 Thu, 19 Sep 2019 05:08:50 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id m6sm1608096ljj.3.2019.09.19.05.08.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 05:08:49 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
 <fd0e0580-2796-40c8-1f53-642e56d2c98e@arm.com>
 <5adb3723-8252-1aca-3f63-86a232d68004@gmail.com>
 <b15b654a-5176-5acb-5eb6-bd870494ab78@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6f7d51ae-538e-dfde-d8c7-4e1caeafe558@gmail.com>
Date: Thu, 19 Sep 2019 15:08:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b15b654a-5176-5acb-5eb6-bd870494ab78@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA5LjE5IDE1OjA1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4u
CgoKPgo+IE9uIDE5LzA5LzIwMTkgMTI6NTgsIE9sZWtzYW5kciB3cm90ZToKPj4KPj4gT24gMTku
MDkuMTkgMTQ6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpIE9sZWtzYW5kciwKPj4KPj4K
Pj4gSGkgSnVsaWVuCj4+Cj4+Cj4+Pgo+Pj4gT24gMTMvMDkvMjAxOSAxNjozNSwgT2xla3NhbmRy
IFR5c2hjaGVua28gd3JvdGU6Cj4+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtz
YW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+Cj4+Pj4gVGhlIElQTU1VLVZNU0EgaXMgVk1T
QS1jb21wYXRpYmxlIEkvTyBNZW1vcnkgTWFuYWdlbWVudCBVbml0IChJT01NVSkKPj4+PiB3aGlj
aCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBhY2Nlc3MgcHJvdGVjdGlvbiAKPj4+
PiBmdW5jdGlvbmFsaXRpZXMKPj4+PiB0byBwcm9jZXNzaW5nIHVuaXRzIGFuZCBpbnRlcmNvbm5l
Y3QgbmV0d29ya3MuCj4+Pj4KPj4+PiBQbGVhc2Ugbm90ZSwgY3VycmVudCBkcml2ZXIgaXMgc3Vw
cG9zZWQgdG8gd29yayBvbmx5IHdpdGggbmV3ZXN0Cj4+Pj4gUi1DYXIgR2VuMyBTb0NzIHJldmlz
aW9ucyB3aGljaCBJUE1NVSBoYXJkd2FyZSBzdXBwb3J0cyBzdGFnZSAyIAo+Pj4+IHRyYW5zbGF0
aW9uCj4+Pj4gdGFibGUgZm9ybWF0IGFuZCBpcyBhYmxlIHRvIHVzZSBDUFUncyBQMk0gdGFibGUg
YXMgaXMgaWYgb25lIGlzCj4+Pj4gMy1sZXZlbCBwYWdlIHRhYmxlICh1cCB0byA0MCBiaXQgSVBB
KS4KPj4+Pgo+Pj4+IFRoZSBtYWpvciBkaWZmZXJlbmNlcyBjb21wYXJlIHRvIHRoZSBMaW51eCBk
cml2ZXIgYXJlOgo+Pj4+Cj4+Pj4gMS4gU3RhZ2UgMS9TdGFnZSAyIHRyYW5zbGF0aW9uLiBMaW51
eCBkcml2ZXIgc3VwcG9ydHMgU3RhZ2UgMQo+Pj4+IHRyYW5zbGF0aW9uIG9ubHkgKHdpdGggU3Rh
Z2UgMSB0cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQpLiBJdCBtYW5hZ2VzCj4+Pj4gcGFnZSB0YWJs
ZSBieSBpdHNlbGYuIEJ1dCBYZW4gZHJpdmVyIHN1cHBvcnRzIFN0YWdlIDIgdHJhbnNsYXRpb24K
Pj4+PiAod2l0aCBTdGFnZSAyIHRyYW5zbGF0aW9uIHRhYmxlIGZvcm1hdCkgdG8gYmUgYWJsZSB0
byBzaGFyZSB0aGUgUDJNCj4+Pj4gd2l0aCB0aGUgQ1BVLiBTdGFnZSAxIHRyYW5zbGF0aW9uIGlz
IGFsd2F5cyBieXBhc3NlZCBpbiBYZW4gZHJpdmVyLgo+Pj4+Cj4+Pj4gU28sIFhlbiBkcml2ZXIg
aXMgc3VwcG9zZWQgdG8gYmUgdXNlZCB3aXRoIG5ld2VzdCBSLUNhciBHZW4zIFNvQyAKPj4+PiBy
ZXZpc2lvbnMKPj4+PiBvbmx5IChIMyBFUzMuMCwgTTMtVyssIGV0Yy4pIHdoaWNoIElQTU1VIEgv
VyBzdXBwb3J0cyBzdGFnZSAyIAo+Pj4+IHRyYW5zbGF0aW9uCj4+Pj4gdGFibGUgZm9ybWF0Lgo+
Pj4+Cj4+Pj4gMi4gQUFyY2g2NCBzdXBwb3J0LiBMaW51eCBkcml2ZXIgdXNlcyBWTVNBdjgtMzIg
bW9kZSwgd2hpbGUgWGVuIGRyaXZlcgo+Pj4+IGVuYWJsZXMgQXJtdjggVk1TQXY4LTY0IG1vZGUg
dG8gY292ZXIgdXAgdG8gNDAgYml0IGlucHV0IGFkZHJlc3MuCj4+Pj4KPj4+PiAzLiBDb250ZXh0
IGJhbmsgKHNldHMgb2YgcGFnZSB0YWJsZSkgdXNhZ2UuIEluIFhlbiwgZWFjaCBjb250ZXh0IAo+
Pj4+IGJhbmsgaXMKPj4+PiBtYXBwZWQgdG8gb25lIFhlbiBkb21haW4uIFNvLCBhbGwgZGV2aWNl
cyBiZWluZyBwYXNzIHRocm91Z2hlZCB0byB0aGUKPj4+PiBzYW1lIFhlbiBkb21haW4gc2hhcmUg
dGhlIHNhbWUgY29udGV4dCBiYW5rLgo+Pj4+Cj4+Pj4gNC4gSVBNTVUgZGV2aWNlIHRyYWNraW5n
LiBJbiBYZW4sIGFsbCBJT01NVSBkZXZpY2VzIGFyZSBtYW5hZ2VkCj4+Pj4gYnkgc2luZ2xlIGRy
aXZlciBpbnN0YW5jZS4gU28sIGRyaXZlciB1c2VzIGdsb2JhbCBsaXN0IHRvIGtlZXAgdHJhY2sK
Pj4+PiBvZiByZWdpc3RlcmVkIElQTU1VIGRldmljZXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+
Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4gQ0M6IFlvc2hp
aGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4KPj4+Cj4+PiBU
aGUgWGVuIHNwZWNpZmljIGJpdHMgbG9va3MgZ29vZCBub3cuIEFzc3VtaW5nIFlvc2hpaGlybyB3
aWxsIGdpdmUgCj4+PiBoaXMgcmV2aWV3ZWQtYnkvYWNrZWQtYnk6Cj4+Pgo+Pj4gQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IFRoYW5rIHlvdSEKPj4K
Pj4KPj4gT25lIG5vdGUsIGl0IHR1cm5lZCBvdXQgWzFdIHRoYXQgImFyZ3MiIHBhcmFtZXRlciBp
biAiZHRfeGxhdGUiIAo+PiBjYWxsYmFjayBuZWVkcyAiY29uc3QiIGFkZGVkIChpdCBpcyBub3Qg
YXNzdW1lZCB0byBtb2RpZnkgaXQgaW5zaWRlIAo+PiB0aGUgY2FsbGJhY2spLgo+Pgo+PiBUaGlz
IGxlYWRzIHRvIGFkZGl0aW9uYWwgY2hhbmdlcyB0byB0aGUgSVBNTVUgZHJpdmVyLiBJZiB5b3Ug
aGFwcHkgCj4+IHdpdGggdGhlIGNoYW5nZXMgYmVsb3csIEkgd2lsbCByZXRhaW4geW91ciBBLWIu
Cj4+Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUt
dm1zYS5jIAo+PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKPj4g
aW5kZXggYjVjMThjMi4uNDNlNGE4NCAxMDA2NDQKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL2lwbW11LXZtc2EuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
cm0vaXBtbXUtdm1zYS5jCj4+IEBAIC02OTYsNyArNjk2LDcgQEAgc3RhdGljIHZvaWQgaXBtbXVf
ZGV0YWNoX2RldmljZShzdHJ1Y3QgCj4+IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4sCj4+IMKg
wqB9Cj4+Cj4+IMKgwqBzdGF0aWMgaW50IGlwbW11X2luaXRfcGxhdGZvcm1fZGV2aWNlKHN0cnVj
dCBkZXZpY2UgKmRldiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkdF9waGFuZGxlX2Fy
Z3MgKmFyZ3MpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHRfcGhhbmRsZV9h
cmdzIAo+PiAqYXJncykKPj4gwqDCoHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaW9tbXVfZndzcGVj
ICpmd3NwZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOwo+PiDCoMKgwqDCoMKgIHN0cnVj
dCBpcG1tdV92bXNhX2RldmljZSAqbW11Owo+PiBAQCAtMTE3NCw3ICsxMTc0LDggQEAgc3RhdGlj
IGludCBpcG1tdV9yZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAKPj4gKnMsIHN0cnVjdCBk
b21haW4gKnQsCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgwqB9Cj4+Cj4+IC1zdGF0aWMg
aW50IGlwbW11X2R0X3hsYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGR0X3BoYW5kbGVf
YXJncyAKPj4gKnNwZWMpCj4+ICtzdGF0aWMgaW50IGlwbW11X2R0X3hsYXRlKHN0cnVjdCBkZXZp
Y2UgKmRldiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnN0IHN0cnVjdCBkdF9waGFuZGxlX2FyZ3MgKnNwZWMpCj4+IMKgwqB7Cj4+IMKg
wqDCoMKgwqAgaW50IHJldDsKPj4KPj4gQEAgLTExODcsNyArMTE4OCw3IEBAIHN0YXRpYyBpbnQg
aXBtbXVfZHRfeGxhdGUoc3RydWN0IGRldmljZSAqZGV2LCAKPj4gc3RydWN0IGR0X3BoYW5kbGVf
YXJncyAqc3BlYykKPj4gwqDCoMKgwqDCoCBpZiAoIHNwZWMtPmFyZ3NfY291bnQgIT0gMSB8fCBz
cGVjLT5hcmdzWzBdID49IElQTU1VX1VUTEJfTUFYICkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+Pgo+PiAtwqDCoMKgIHJldCA9IGlvbW11X2Z3c3BlY19hZGRfaWRzKGRl
diwgc3BlYy0+YXJncywgMSk7Cj4+ICvCoMKgwqAgcmV0ID0gaW9tbXVfZndzcGVjX2FkZF9pZHMo
ZGV2LCAodWludDMyX3QgKilzcGVjLT5hcmdzLCAxKTsKPgo+IE5BY2ssIHlvdSBzaG91bGQgbmV2
ZXIgdXNlIGEgY2FzdCB0byByZW1vdmUgYSBjb25zdC4gTG9va2luZyBhdCB0aGUgCj4gY29kZSwg
aW9tbXVfZndzcGVjX2FkZF9pZHMoKSBkb2VzIG5vdCBuZWVkIHRvIG1vZGlmeSB0aGUgaWRzIHNv
IHRoZSAKPiBjb25zdCBzaG91bGQgYmUgcHJvcGFnYXRlZC4KPgo+IFdpdGggdGhhdCBpbiBwbGFj
ZSwgbXkgYWNrIGNhbiBzdGFuZC4KCkZhaXIgZW5vdWdoLCB3aWxsIHByb3BhZ2F0ZS4KCgotLSAK
UmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
