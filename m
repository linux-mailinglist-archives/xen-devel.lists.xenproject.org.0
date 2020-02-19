Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BB16494F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:57:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Rfb-00060x-RH; Wed, 19 Feb 2020 15:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4Rfa-00060s-Bg
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:53:50 +0000
X-Inumbo-ID: 03efa778-5330-11ea-83b5-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03efa778-5330-11ea-83b5-12813bfff9fa;
 Wed, 19 Feb 2020 15:53:48 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a6so1207192wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 07:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dUwAl60Q6QEK/LS1j9mq8UFufwK0AHCIwVa7A9OEplQ=;
 b=uU19xMWb6Hl7HD+8fNPTd34cEfhzzEE9cWRHsAgUIcT/NkD/PieUOdy4jHDVh39GCA
 Gapb0vOv5A/Idnf6296Cx2w7GaBmvGvGgsjoE7hUu/XpLPqpJS0HTdVzp9VxwvGU4FFR
 5j+/s8P0dnFxR2WZ3hmzKwDh16P0PWsJLHRtawgr63kgGGIRCDq26cu0uaRApLvfokDL
 z8S6lv30GSRvxfhNbQz1zUAm5wueszxVzi11yPWnCDfrWLXIpqjslmObOTG7v+vju5Ft
 GoiKjZFS1PxSz2HbDzqAfPPzZjZka8KgXOtrWiWHrwtlqoFvaUNx1ToJ005eF3/mX4zr
 hoKg==
X-Gm-Message-State: APjAAAU6B5ok4QNlhdAvVYhw8hruc40qdDgQd7amrbjCqKB4Kj1XVndI
 nWzaspA3X+0q6W2ECwG3EdY=
X-Google-Smtp-Source: APXvYqxyfhG2PygDVJghHDJjhFgz+Nwbqxul7U8sRfYyRgyN6a8dkREQz3m7OZtWk4Whar2+bAzrgw==
X-Received: by 2002:a7b:c5da:: with SMTP id n26mr10470291wmk.138.1582127627312; 
 Wed, 19 Feb 2020 07:53:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id l6sm275343wmg.42.2020.02.19.07.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 07:53:46 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200210184549.28707-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <76a0538a-f4e5-65ba-4dc7-aa4fe5a4fe6f@xen.org>
Date: Wed, 19 Feb 2020 15:53:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200210184549.28707-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: Restrict access to most HVM_PARAM's
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKVGhhbmsgeW91IGZvciBzdGVwcGluZyB1cCBhbmQgdHJ5aW5nIHRvIG1ha2Ug
SFZNX1BBUkFNIGJldHRlciA6KS4KCk9uIDEwLzAyLzIwMjAgMTg6NDUsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4gQVJNIGN1cnJlbnRseSBoYXMgbm8gcmVzdHJpY3Rpb25zIG9uIHRvb2xzdGFjayBh
bmQgZ3Vlc3QgYWNjZXNzIHRvIHRoZSBlbnRpcmUKPiBIVk1fUEFSQU0gYmxvY2suICBBcyB0aGUg
cGFnaW5nL21vbml0b3Ivc2hhcmluZyBmZWF0dXJlcyBhcmVuJ3QgdW5kZXIgc2VjdXJpdHkKPiBz
dXBwb3J0LCB0aGlzIGRvZXNuJ3QgbmVlZCBhbiBYU0EuCgpBY3R1YWxseSwgb25seSBtb25pdG9y
IGlzIGVmZmVjdGl2ZWx5IHdvcmtpbmcgKHlldCBub3Qgc2VjdXJpdHkgCnN1cHBvcnRlZCkgb24g
QXJtLiBUaGUgdHdvIG90aGVycyBhcmUgeDg2IHNwZWNpZmljLgoKPiAKPiBUaGUgQ0FMTEJBQ0tf
SVJRIGFuZCB7U1RPUkUsQ09OU09MRX1fe1BGTixFVlRDSE59IGRldGFpbHMgZXhwb3NlZCByZWFk
LW9ubHkgdG8KPiB0aGUgZ3Vlc3QsIHdoaWxlIHRoZSAqX1JJTkdfUEZOIGRldGFpbHMgYXJlIHJl
c3RyaWN0ZWQgdG8gb25seSB0b29sc3RhY2sKPiBhY2Nlc3MuICBObyBvdGhlciBwYXJhbWV0ZXJz
IGFyZSB1c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiBDQzog
Vm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgo+IAo+IFRoaXMg
aXMgb25seSBjb21waWxlIHRlc3RlZCwgYW5kIGJhc2VkIG9uIG15IHJlYWRpbmcgb2YgdGhlIHNv
dXJjZS4gIFRoZXJlCj4gbWlnaHQgYmUgb3RoZXIgUEFSQU1TIG5lZWRpbmcgaW5jbHVkaW5nLgo+
IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2h2bS5jIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2h2bS5jIGIveGVuL2FyY2gvYXJtL2h2bS5jCj4gaW5kZXggNzZiMjdjOTE2OC4uMTQ0NmQ0MDEw
YyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC9hcm0v
aHZtLmMKPiBAQCAtMzEsNiArMzEsNjAgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGFzbS9oeXBlcmNh
bGwuaD4KPiAgIAo+ICtzdGF0aWMgaW50IGh2bV9hbGxvd19zZXRfcGFyYW0oY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHBhcmFtKQo+ICt7CgpTaG91bGQgd2UgbW92ZSB0aGUg
WFNNIGNoZWNrIGhlcmUgdG9vPyBUaGlzIGlzIG5vdCB0b28gaW1wb3J0YW50IHRob3VnaC4KCj4g
KyAgICBzd2l0Y2ggKCBwYXJhbSApCj4gKyAgICB7Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAg
KiBUaGUgZm9sbG93aW5nIHBhcmFtZXRlcnMgYXJlIGludGVuZGVkIGZvciB0b29sc3RhY2sgdXNh
Z2Ugb25seS4KPiArICAgICAgICAgKiBUaGV5IG1heSBub3QgYmUgc2V0IGJ5IHRoZSBkb21haW4u
Cj4gKyAgICAgICAgICoKPiArICAgICAgICAgKiBUaGUge1NUT1JFLENPTlNPTEV9X0VWVENITiB2
YWx1ZXMgd2lsbCBuZWVkIHRvIGJlY29tZSByZWFkL3dyaXRlIGlmCj4gKyAgICAgICAgICogYSBu
ZXcgQUJJIGhhc24ndCBhcHBlYXJlZCBieSB0aGUgdGltZSBtaWdyYXRpb24gc3VwcG9ydCBpcyBh
ZGRlZC4KClRoZSBjb21tZW50IHN1Z2dlc3RzIHtTVE9SRSwgQ09OU09MRX1fRVZUQ0hOIHZhbHVl
cyBzaG91bGQgbm90IGJlIApyZWFkL3dyaXRlLiBCdXQgeW91IGltcGxlbWVudCB0aGVtIGFzIHJl
YWQvd3JpdGUuIElzIGl0IGludGVuZGVkPwoKPiArICAgICAgICAgKi8KPiArICAgIGNhc2UgSFZN
X1BBUkFNX0NBTExCQUNLX0lSUToKPiArICAgIGNhc2UgSFZNX1BBUkFNX1NUT1JFX1BGTjoKPiAr
ICAgIGNhc2UgSFZNX1BBUkFNX1NUT1JFX0VWVENITjoKPiArICAgIGNhc2UgSFZNX1BBUkFNX0NP
TlNPTEVfUEZOOgo+ICsgICAgY2FzZSBIVk1fUEFSQU1fQ09OU09MRV9FVlRDSE46Cj4gKyAgICBj
YXNlIEhWTV9QQVJBTV9QQUdJTkdfUklOR19QRk46Cj4gKyAgICBjYXNlIEhWTV9QQVJBTV9NT05J
VE9SX1JJTkdfUEZOOgo+ICsgICAgY2FzZSBIVk1fUEFSQU1fU0hBUklOR19SSU5HX1BGTjoKCkkg
d291bGQgZHJvcCBIVk1fUEFSQU1fUEFHSU5HX1JJTkdfUEZOIGFuZCBIVk1fUEFSQU1fU0hBUklO
R19SSU5HX1BGTiBhcyAKdGhleSBhcmUgbm90IHVzZWQgYnkgQXJtIGFuZCBBRkFJQ1QgdGhlIHRv
b2xzdGFjayB3aWxsIG5vdCBzZXQgdGhlbS4KCj4gKyAgICAgICAgcmV0dXJuIGQgPT0gY3VycmVu
dC0+ZG9tYWluID8gLUVQRVJNIDogMDsKPiArCgpMb29raW5nIGF0IHRoZSBsaXN0IG9mIEhWTSBw
YXJhbSwgSSB0aGluayB5b3UgZm9yZ290IHRvIGFkZCAKSFZNX1BBUkFNX1ZNX0dFTkVSQVRJT05f
SURfQUREUi4KCj4gKyAgICAgICAgLyogV3JpdGVhYmxlIG9ubHkgYnkgWGVuLCBob2xlLCBkZXBy
ZWNhdGVkLCBvciBvdXQtb2YtcmFuZ2UuICovCj4gKyAgICBkZWZhdWx0Ogo+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ICsgICAgfQo+ICt9CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
