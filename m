Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8518DF60
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2020 11:18:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFb9Q-0003XR-Ek; Sat, 21 Mar 2020 10:14:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6tT=5G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFb9P-0003XM-5y
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2020 10:14:43 +0000
X-Inumbo-ID: c77ab9c8-6b5c-11ea-bee1-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c77ab9c8-6b5c-11ea-bee1-12813bfff9fa;
 Sat, 21 Mar 2020 10:14:42 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e5so224013edq.5
 for <xen-devel@lists.xenproject.org>; Sat, 21 Mar 2020 03:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gojnHndV25Fsu2horNgV7MKJG6goQowySRJO4Yd/nHU=;
 b=NHdGBwT0xyVKTWbER264aBN3QaQgboJew94KN7nC6RZMs75saYuXADTo5w2QIL51Ro
 HVtoao76q+rxoWMt3b4FJMTgx+Uo4IO56Z74k7f/9reoImALISxMeacT+mJQnQ8jN1lJ
 mLKlDuwMuYPiKB1RqD1H027UES1BQwFPp3lS9XXT8889b27oQ1T7FIKm/eX3EdPuksVr
 Pqb+KQRBQ7JCw7iPBSxrvoH3XZ6pEAyW5KsPZiU2iH3/KQCuh+Qm+IBQjj8iVUx6Ib4j
 8A/GTyddw+wJ3rSS3xXcKVn0BmYIfEQG3fP4oore+k0YTuv9v98uL5k9kvucAnwp+yrb
 rkeA==
X-Gm-Message-State: ANhLgQ0GBUTHQxQ67iqg+x+OIJ4/DoL/ro719eJWcGrfnxH8uU6fS4aU
 vViFpQ5LZ/D7Yl3mcAs9Qm4=
X-Google-Smtp-Source: ADFU+vuNm+U/vv2YrU+/0hqK0lnta5YJsnNdpnBb4VQZ962PT3gBvGCe9oT27YjWRzMH+RmPuKs27w==
X-Received: by 2002:a50:e046:: with SMTP id g6mr12854571edl.172.1584785681249; 
 Sat, 21 Mar 2020 03:14:41 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id d26sm299617ejt.37.2020.03.21.03.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 03:14:40 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-4-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ee60956-f02c-d185-0df8-b69e9c3894cf@xen.org>
Date: Sat, 21 Mar 2020 10:14:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320212453.21685-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 3/4] xen: Drop raw_smp_processor_id()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMC8wMy8yMDIwIDIxOjI0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZXJlIGlzIG9u
bHkgYSBzaW5nbGUgdXNlciBvZiByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpIGxlZnQgaW4gdGhlIHRy
ZWUgKGFuZCBpdAo+IGlzIHVuY29uZGl0aW9uYWxseSBjb21waWxlZCBvdXQpLiAgRHJvcCB0aGUg
YWxpYXMgZnJvbSBhbGwgYXJjaGl0ZWN0dXJlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFs
bCA8amdyYWxsQGFtYXpvbi5jb20+CgpDaGVlcnMsCgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+Cj4gQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4KPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2FtZC5jIHwgMiArLQo+ICAg
eGVuL2luY2x1ZGUvYXNtLWFybS9zbXAuaCAgICAgICAgfCAyICstCj4gICB4ZW4vaW5jbHVkZS9h
c20teDg2L3NtcC5oICAgICAgICB8IDIgKy0KPiAgIHhlbi9pbmNsdWRlL3hlbi9zbXAuaCAgICAg
ICAgICAgIHwgMiAtLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2Ft
ZC5jIGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1kLmMKPiBpbmRleCBhMDUzZTQzOTIz
Li4wOTk4YTM2YjVjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2Ft
ZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1kLmMKPiBAQCAtMzA2LDcg
KzMwNiw3IEBAIHN0YXRpYyBpbnQgZ2V0X3Vjb2RlX2Zyb21fYnVmZmVyX2FtZCgKPiAgICAgICBt
ZW1jcHkobWNfYW1kLT5tcGIsIG1wYnVmLT5kYXRhLCBtcGJ1Zi0+bGVuKTsKPiAgIAo+ICAgICAg
IHByX2RlYnVnKCJtaWNyb2NvZGU6IENQVSVkIHNpemUgJXp1LCBibG9jayBzaXplICV1IG9mZnNl
dCAlenUgZXF1aXZJRCAlI3ggcmV2ICUjeFxuIiwKPiAtICAgICAgICAgICAgIHJhd19zbXBfcHJv
Y2Vzc29yX2lkKCksIGJ1ZnNpemUsIG1wYnVmLT5sZW4sICpvZmZzZXQsCj4gKyAgICAgICAgICAg
ICBzbXBfcHJvY2Vzc29yX2lkKCksIGJ1ZnNpemUsIG1wYnVmLT5sZW4sICpvZmZzZXQsCj4gICAg
ICAgICAgICAgICAgKChzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9hbWQgKiltY19hbWQtPm1wYikt
PnByb2Nlc3Nvcl9yZXZfaWQsCj4gICAgICAgICAgICAgICAgKChzdHJ1Y3QgbWljcm9jb2RlX2hl
YWRlcl9hbWQgKiltY19hbWQtPm1wYiktPnBhdGNoX2lkKTsKPiAgIAo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL3NtcC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zbXAuaAo+IGlu
ZGV4IGZkYmNlZmEyNDEuLmFmNWEyZmU2NTIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9zbXAuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc21wLmgKPiBAQCAtMTIsNyAr
MTIsNyBAQCBERUNMQVJFX1BFUl9DUFUoY3B1bWFza192YXJfdCwgY3B1X2NvcmVfbWFzayk7Cj4g
ICAKPiAgICNkZWZpbmUgY3B1X2lzX29mZmxpbmUoY3B1KSB1bmxpa2VseSghY3B1X29ubGluZShj
cHUpKQo+ICAgCj4gLSNkZWZpbmUgcmF3X3NtcF9wcm9jZXNzb3JfaWQoKSAoZ2V0X3Byb2Nlc3Nv
cl9pZCgpKQo+ICsjZGVmaW5lIHNtcF9wcm9jZXNzb3JfaWQoKSBnZXRfcHJvY2Vzc29yX2lkKCkK
PiAgIAo+ICAgLyoKPiAgICAqIERvIHdlLCBmb3IgcGxhdGZvcm0gcmVhc29ucywgbmVlZCB0byBh
Y3R1YWxseSBrZWVwIENQVXMgb25saW5lIHdoZW4gd2UKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9zbXAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKPiBpbmRleCA2MTUw
MzYzNjU1Li5mNzQ4NWY2MDJlIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21w
LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oCj4gQEAgLTUzLDcgKzUzLDcgQEAg
aW50IGNwdV9hZGQodWludDMyX3QgYXBpY19pZCwgdWludDMyX3QgYWNwaV9pZCwgdWludDMyX3Qg
cHhtKTsKPiAgICAqIGZyb20gdGhlIGluaXRpYWwgc3RhcnR1cC4gV2UgbWFwIEFQSUNfQkFTRSB2
ZXJ5IGVhcmx5IGluIHBhZ2Vfc2V0dXAoKSwKPiAgICAqIHNvIHRoaXMgaXMgY29ycmVjdCBpbiB0
aGUgeDg2IGNhc2UuCj4gICAgKi8KPiAtI2RlZmluZSByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpIChn
ZXRfcHJvY2Vzc29yX2lkKCkpCj4gKyNkZWZpbmUgc21wX3Byb2Nlc3Nvcl9pZCgpIGdldF9wcm9j
ZXNzb3JfaWQoKQo+ICAgCj4gICB2b2lkIF9fc3RvcF90aGlzX2NwdSh2b2lkKTsKPiAgIAo+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc21wLmggYi94ZW4vaW5jbHVkZS94ZW4vc21wLmgK
PiBpbmRleCBhNjRjOWIzODgyLi5kNWEzNjQ0NjExIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zbXAuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zbXAuaAo+IEBAIC02NSw4ICs2NSw2
IEBAIHZvaWQgc21wX2NhbGxfZnVuY3Rpb25faW50ZXJydXB0KHZvaWQpOwo+ICAgCj4gICB2b2lk
IHNtcF9zZW5kX2NhbGxfZnVuY3Rpb25fbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2spOwo+ICAg
Cj4gLSNkZWZpbmUgc21wX3Byb2Nlc3Nvcl9pZCgpIHJhd19zbXBfcHJvY2Vzc29yX2lkKCkKPiAt
Cj4gICBpbnQgYWxsb2NfY3B1X2lkKHZvaWQpOwo+ICAgCj4gICBleHRlcm4gdm9pZCAqc3RhY2tf
YmFzZVtOUl9DUFVTXTsKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
