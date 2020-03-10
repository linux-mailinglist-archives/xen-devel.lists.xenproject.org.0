Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533617F55D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 11:50:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBcQF-0004ic-Ic; Tue, 10 Mar 2020 10:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBcQD-0004iU-PD
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 10:47:37 +0000
X-Inumbo-ID: 8e281132-62bc-11ea-8eb3-bc764e2007e4
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e281132-62bc-11ea-8eb3-bc764e2007e4;
 Tue, 10 Mar 2020 10:47:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c21so15729962edt.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=2BMepFBfXV+M06pjt+ngQPcyH3gawdJttAnWOUc/ZyY=;
 b=kYsvojnVGEE7cssWfvnJ9cWoRgV6qzzoNvXITzrxsy58cdSboplG+2xnFujVVPkgf1
 meeAJbpIXS5nN6kUgcLQZmX/Vidr19nY32UgM8ywBbd2OFvW74QcxOM9hjCAoxBuVEpf
 n9ygyKePJvMQmM1iqaZPf7a3GO/jpn+PWeFnb+YTaOFqxmMprJ26AfAxINWmlmXzPi0E
 lFVjh16zhYrMB0yJG7JllbZCPbosf7/F9TYga/5vzlmnV6g/txCK9GLh/jQP/9CpBn3u
 e5tvSkuG0PFWeUyrOJErFXVEIx57tS0Q1C9UkmoerWpZx/ep4mnBLoPZW6lYZosBLKoK
 5BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=2BMepFBfXV+M06pjt+ngQPcyH3gawdJttAnWOUc/ZyY=;
 b=Kh+AguDUy31gfb4ZfBnEFNWvppD1eDNhyB9+gA1OUnX4ofVE0Hxk00/X28A6zvnWo1
 Nja4TWq/n/uEhR0xBiZmwStUj3fPB3iFuwdsDHfaBtkUqJu7aFSeqHYhRccLRUdtlHjP
 1qrP1HB4BCCO+LvarnbQ6KGSxIzMuyMb6BLXEnyMc0ehX590bI+9ZBqTF8deFTUkMih+
 oQXaReVjVIu5tkCuSR1aKu+MR09GpJJrNVHiEdDuDNpcTohSiSNKjhsW6dvPR3Jm3Z0D
 Fyrw99houpBE/kEIsFVCjPuVaaEqNPJ1+cDocc2sGwqT4I5Hfd9erW1HeXfVfLGt5Og0
 ZcGg==
X-Gm-Message-State: ANhLgQ1dBQszLVS+fUtatHvfNpxBLRF+9kDouDAjM5Bdh8pWEzmmQPgo
 VwNLz3jlbetQo08gWkrDv1s=
X-Google-Smtp-Source: ADFU+vu5jEME74+Y34fVnkdkrvzZpDeDiHWUFV9zuMavqirGQnV9Lu8zYCwQYV8cDyeEf921ojK6/w==
X-Received: by 2002:aa7:d704:: with SMTP id t4mr20671255edq.46.1583837256382; 
 Tue, 10 Mar 2020 03:47:36 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id z19sm2281780eja.53.2020.03.10.03.47.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 03:47:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <7c8f0108-0d51-91bb-86b3-dd5ea6e0a269@suse.com>
In-Reply-To: <7c8f0108-0d51-91bb-86b3-dd5ea6e0a269@suse.com>
Date: Tue, 10 Mar 2020 10:47:34 -0000
Message-ID: <000901d5f6c9$4f513880$edf3a980$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIwGZkq90C1TSWQGzHpu7p2ZALtpgGdvWUbp4BxTHA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 4/5] IOMMU: iommu_qinval is x86-only
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
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDEwOjQ0Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBH
cmFsbAo+IDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBLb25yYWQgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxh
cEBldS5jaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IElhbiBKYWNrc29uCj4gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNC81XSBJT01NVTogaW9tbXVfcWlu
dmFsIGlzIHg4Ni1vbmx5Cj4gCj4gSW4gZmFjdCBpdCdzIFZULWQgc3BlY2lmaWMsIGJ1dCB3ZSBk
b24ndCBoYXZlIGEgd2F5IHlldCB0byBidWlsZCBjb2RlCj4gZm9yIGp1c3Qgb25lIHZlbmRvci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZp
ZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cgo+IAo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCj4gQEAgLTMzLDcgKzMzLDYgQEAgYm9vbF90IF9fcmVhZF9tb3N0bHkgZm9yY2VfaW9t
bXU7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3ZlcmJvc2U7Cj4gIGJvb2wgX19yZWFk
X21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gdHJ1ZTsKPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkg
aW9tbXVfc25vb3AgPSAxOwo+IC1ib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9xaW52YWwgPSAx
Owo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9jcmFzaF9kaXNhYmxlOwo+IAo+ICBzdGF0
aWMgYm9vbCBfX2h3ZG9tX2luaXRkYXRhIGlvbW11X2h3ZG9tX25vbmU7Cj4gQEAgLTc1LDEzICs3
NCwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9pb21tdV9wYXJhbShjb25zCj4gICNpZmRl
ZiBDT05GSUdfWDg2Cj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJp
Z2Z4Iiwgcywgc3MpKSA+PSAwICkKPiAgICAgICAgICAgICAgaW9tbXVfaWdmeCA9IHZhbDsKPiAr
ICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInFpbnZhbCIsIHMsIHNzKSkg
Pj0gMCApCj4gKyAgICAgICAgICAgIGlvbW11X3FpbnZhbCA9IHZhbDsKPiAgI2VuZGlmCj4gICAg
ICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJ2ZXJib3NlIiwgcywgc3MpKSA+
PSAwICkKPiAgICAgICAgICAgICAgaW9tbXVfdmVyYm9zZSA9IHZhbDsKPiAgICAgICAgICBlbHNl
IGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNub29wIiwgcywgc3MpKSA+PSAwICkKPiAgICAg
ICAgICAgICAgaW9tbXVfc25vb3AgPSB2YWw7Cj4gLSAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBw
YXJzZV9ib29sZWFuKCJxaW52YWwiLCBzLCBzcykpID49IDAgKQo+IC0gICAgICAgICAgICBpb21t
dV9xaW52YWwgPSB2YWw7Cj4gICNpZm5kZWYgaW9tbXVfaW50cmVtYXAKPiAgICAgICAgICBlbHNl
IGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImludHJlbWFwIiwgcywgc3MpKSA+PSAwICkKPiAg
ICAgICAgICAgICAgaW9tbXVfaW50cmVtYXAgPSB2YWwgPyBpb21tdV9pbnRyZW1hcF9mdWxsIDog
aW9tbXVfaW50cmVtYXBfb2ZmOwo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAt
NTEsNiArNTEsNyBAQCBzdHJ1Y3QgbWFwcGVkX3JtcnIgewo+ICBib29sIF9fcmVhZF9tb3N0bHkg
dW50cnVzdGVkX21zaTsKPiAKPiAgYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X2lnZnggPSB0cnVl
Owo+ICtib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gdHJ1ZTsKPiAKPiAgaW50IG5y
X2lvbW11czsKPiAKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9pb21tdS5oCj4gQEAgLTU0LDcgKzU0LDcgQEAgc3RhdGljIGlubGluZSBib29s
X3QgZGZuX2VxKGRmbl90IHgsIGRmbgo+IAo+ICBleHRlcm4gYm9vbF90IGlvbW11X2VuYWJsZSwg
aW9tbXVfZW5hYmxlZDsKPiAgZXh0ZXJuIGJvb2wgZm9yY2VfaW9tbXUsIGlvbW11X3F1YXJhbnRp
bmUsIGlvbW11X3ZlcmJvc2U7Cj4gLWV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3Fp
bnZhbDsKPiArZXh0ZXJuIGJvb2xfdCBpb21tdV9zbm9vcDsKPiAKPiAgI2lmZGVmIENPTkZJR19Y
ODYKPiAgZXh0ZXJuIGVudW0gX19wYWNrZWQgaW9tbXVfaW50cmVtYXAgewo+IEBAIC03MCw3ICs3
MCw3IEBAIGV4dGVybiBlbnVtIF9fcGFja2VkIGlvbW11X2ludHJlbWFwIHsKPiAgICAgaW9tbXVf
aW50cmVtYXBfcmVzdHJpY3RlZCwKPiAgICAgaW9tbXVfaW50cmVtYXBfZnVsbCwKPiAgfSBpb21t
dV9pbnRyZW1hcDsKPiAtZXh0ZXJuIGJvb2wgaW9tbXVfaWdmeDsKPiArZXh0ZXJuIGJvb2wgaW9t
bXVfaWdmeCwgaW9tbXVfcWludmFsOwo+ICAjZWxzZQo+ICAjIGRlZmluZSBpb21tdV9pbnRyZW1h
cCBmYWxzZQo+ICAjZW5kaWYKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
