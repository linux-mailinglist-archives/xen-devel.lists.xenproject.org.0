Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A693167F1B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:52:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58gI-0003WZ-H8; Fri, 21 Feb 2020 13:49:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j58gH-0003WS-GN
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:49:25 +0000
X-Inumbo-ID: f848125c-54b0-11ea-ade5-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f848125c-54b0-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 13:49:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s10so1866699wmh.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 05:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ISNe5NiCQmQ6KH/zXhu+5kMESKJh9YE2MLUMsS2hl9I=;
 b=TvCcZZWLGyzcyiyBFcWGP/eC8hwmBoMjvvZ7tlreCyHwH4BZklzwwXq+zGCnsM231G
 oQN7dtZk2euLlxchvZM1Lk+nvVLx6EU53TcDj0eF2F3o2cDbdoMkbLD/wCFcvvEunxJU
 9Jfm4IJElGTxajT9aEAIJNkCit1vdlQcMONhU+cSqsdYBebRcpglNTshegLg2/LSrb0o
 0otDTpulJiSzWzcIvtLuX6XBCqrbxNs7WxRq90ZjM+tqjJE7uH6SLoh1Z2BMLuCsGjZt
 aXX53D7XcoAHty03elBTS86dReCN3h5YH/vLnYj/EC6tqI8jBTQDvUtcHPQuHgTPCphX
 l4DQ==
X-Gm-Message-State: APjAAAUKE7a7TZEnVhGGuN4NKxePDcvd6kWbQD6zNEobUGb1ak/iC1Qj
 YRni1qm0MInx+EDydioerN0T3HvZr/WIag==
X-Google-Smtp-Source: APXvYqxfo4MutoW43i03EcaF3FkyUCBaDAkeDXYTrgQkzSInbAW465KZcPbqBo/dbqIpEfrP6fBC6w==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr4198766wmg.151.1582292963504; 
 Fri, 21 Feb 2020 05:49:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id e22sm3891817wme.45.2020.02.21.05.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 05:49:22 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
Date: Fri, 21 Feb 2020 13:49:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMi8yMDIwIDEzOjQ2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDIxLjAyLjIw
IDE0OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0g
KzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDIwLzAyLzIw
MjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQWxsb3cgYSBDUFUgYWxyZWFk
eSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxzbyBsb2NrIGl0IGluCj4+Pj4+
IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFsbG93aW5nIHJlYWQgbG9ja2luZyBhIHJ3
bG9jayB0aGF0J3MKPj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBp
biB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+IGFjY2Vzc2VzIGlzIHJlcXVpcmVkIGF0
IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2UuCj4+Pj4+Cj4+Pj4+IEluIG9yZGVyIHRv
IGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBv
cnQKPj4+Pj4gdXAgdG8gMTYzODQgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFz
ayB0byAyIGJpdHM6IG9uZSB0bwo+Pj4+PiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVy
cyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3RoZXIgdG8KPj4+Pj4gc2lnbmFsIHRoZSBs
b2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQgZGF0YQo+
Pj4+PiBpcyB1c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9uZSBpbiBvcmRlciB0byBiZSBhYmxlIHRv
IGNsZWFyIGl0IChhbmQKPj4+Pj4gdGh1cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0
IGF0b21pYyB3cml0ZS4KPj4+Pj4KPj4+Pj4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJl
ciBvZiBjb25jdXJyZW50IHJlYWRlcnMgZnJvbSAxNjc3NzIxNiB0bwo+Pj4+PiA2NTUzNiwgSSB0
aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgZmllbGQK
Pj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1
cmVzIHN1cHBvcnQgYXRvbWljCj4+Pj4+IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdlcnMuCj4+
Pj4KPj4+PiBGV0lXLCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9wZXJhdGlvbnMg
b24gNjQtYml0IGludGVnZXJzLgo+Pj4+Cj4+Pj4+IMKgwqAgc3RhdGljIGlubGluZSB2b2lkIF93
cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+IMKgwqAgewo+Pj4+PiAtwqDCoMKgIC8q
Cj4+Pj4+IC3CoMKgwqDCoCAqIElmIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4g
YmUgY2xlYXJlZCBkaXJlY3RseS4KPj4+Pj4gLcKgwqDCoMKgICogT3RoZXJ3aXNlLCBhbiBhdG9t
aWMgc3VidHJhY3Rpb24gd2lsbCBiZSB1c2VkIHRvIGNsZWFyIGl0Lgo+Pj4+PiAtwqDCoMKgwqAg
Ki8KPj4+Pj4gLcKgwqDCoCBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+
Pj4gK8KgwqDCoCAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJl
IGNsZWFyZWQgCj4+Pj4+IGRpcmVjdGx5LiAqLwo+Pj4+PiArwqDCoMKgIEFTU0VSVChfaXNfd3Jp
dGVfbG9ja2VkX2J5X21lKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+Pj4+PiArwqDCoMKg
IEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+Pj4+PiArwqDCoMKgIHdyaXRlX2F0b21p
YygodWludDE2X3QgKikmbG9jay0+Y250cywgMCk7Cj4+Pj4KPj4+PiBJIHRoaW5rIHRoaXMgaXMg
YW4gYWJ1c2UgdG8gY2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5IGludG8gYSAKPj4+PiB1aW50
MTZfdC4gWW91Cj4+Pj4gd291bGQgYXQgbGVhc3Qgd2FudCB0byB1c2UgJmxvY2stPmNudHMuY291
bnRlciBoZXJlLgo+Pj4KPj4+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlzIG15c2Vs
Zi4KPj4+Cj4+PiBXaWxsIHdhaXQgZm9yIG1vcmUgY29tbWVudHMsIG5vdCBzdXJlIHdoZXRoZXIg
dGhpcyBjYW4gYmUgZml4ZWQgdXBvbgo+Pj4gY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBp
c3N1ZXMuCj4+Cj4+IEl0J3MgbW9yZSB0aGFuIGp1c3QgYWRkaW5nIGFub3RoZXIgZmllbGQgc3Bl
Y2lmaWVyIGhlcmUuIEEgY2FzdCBsaWtlCj4+IHRoaXMgb25lIGlzIGVuZGlhbm5lc3MtdW5zYWZl
LCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+IGVuZGlhbiBwb3J0IGF0dGVt
cHQgdG8gZmFsbCBpbnRvLiBBdCB0aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCBjYXVzZQo+PiBh
IGJ1aWxkIGZhaWx1cmUgb24gYmlnIGVuZGlhbiBzeXN0ZW1zLCBldmVuIGJldHRlciB3b3VsZCBi
ZSBpZiBpdCB3YXMKPj4gZW5kaWFubmVzcy1zYWZlLgo+IAo+IFdvdWxkbid0IGEgdW5pb24gYmUg
dGhlIGJldHRlciBjaG9pY2U/CgpZb3Ugd291bGQgbm90IGJlIGFibGUgdG8gdXNlIGF0b21pY190
IGluIHRoYXQgY2FzZSBhcyB5b3UgY2FuJ3QgYXNzdW1lIAp0aGUgbGF5b3V0IG9mIHRoZSBzdHJ1
Y3R1cmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
