Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4409157193
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 10:24:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j15Er-00013d-QQ; Mon, 10 Feb 2020 09:20:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbPx=36=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j15Ep-00013Y-G8
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 09:20:19 +0000
X-Inumbo-ID: 8bf2e911-4be6-11ea-b49c-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bf2e911-4be6-11ea-b49c-12813bfff9fa;
 Mon, 10 Feb 2020 09:20:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r11so3371404wrq.10
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2020 01:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rhqp/8CoCBwCdZ4ljgx53mbNKCeiWw461GghgFubWkM=;
 b=pFVdcMne8uoWp1rz/U9z08bk7STncOtcv5CZZkfb3ii9k92VJRMM5yLlL5pMl7XLjZ
 Lz7jUxqCnuvHgI4pmLuwMhkyHKr8hqn5/gliYK2VNOLHZ64uvl6Bny2S9iriuyr2sIfs
 PNU/tXKi+2uyI0g0Nx4KzIywQZMGGwZj6z4IyiW4UeL0mfw2q6Pt0y6GAfCy25NiN0dq
 F4uKJ/9et5G2IDQkg2mnmQJvRH0R99vV5rPMAwXiA670Qqs+tw9hUSi9x3L0zw0qAU+a
 FmXi5Myxds0vUOJrd3jEKYk8eJRSet9t43lQPXOA1TiRWieMLoU6sHZipBGmncsQjV49
 4Luw==
X-Gm-Message-State: APjAAAWLknFi80WO5MJ8QLp8AVKFuSBBDlHrde/6ILib3U4Ig4Jpo41Z
 MJMOEFmAg8R7iq6Xe066aj0=
X-Google-Smtp-Source: APXvYqzkQ8SAsEGlBDY5VIuilJjW5MnAcwLTFVtlhXE4KWH1NS3RU7eRMOZk3cvb4eyCIWba1h4f/g==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr867221wrq.206.1581326414347; 
 Mon, 10 Feb 2020 01:20:14 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id g15sm16020984wro.65.2020.02.10.01.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 01:20:13 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
 <775b8691-068d-2af9-1b59-d66233708595@suse.com>
 <69d410bd-2397-537d-6507-4c710d166396@xen.org>
 <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
Date: Mon, 10 Feb 2020 09:20:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTAvMDIvMjAyMCAwODo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDgu
MDIuMjAyMCAxNTozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAwNS8wMi8yMDIw
IDEzOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA1LjAyLjIwMjAgMTQ6MjEsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6NDY6MjVB
TSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA0LjAyLjIwMjAgMTg6MzQsIFJv
Z2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+IEltcG9ydCB0aGUgZnVuY3Rpb25zIGFuZCBpdCdz
IGRlcGVuZGVuY2llcy4gQmFzZWQgb24gTGludXggNS41LCBjb21taXQKPj4+Pj4+IGlkIGQ1MjI2
ZmE2ZGJhZTA1NjllZTQzZWNmYzA4YmRjZDY3NzBmYzQ3NTUuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pj4+Cj4+
Pj4+IFRoYW5rcyBmb3IgZ29pbmcgdGhpcyByb3V0ZTsgdHdvIHJlbWFya3MgLyByZXF1ZXN0czoK
Pj4+Pj4KPj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vYml0bWFwLmMKPj4+Pj4+ICsrKyBiL3hlbi9j
b21tb24vYml0bWFwLmMKPj4+Pj4+IEBAIC0yMTIsNiArMjEyLDQ3IEBAIGludCBfX2JpdG1hcF93
ZWlnaHQoY29uc3QgdW5zaWduZWQgbG9uZyAqYml0bWFwLCBpbnQgYml0cykKPj4+Pj4+ICAgICNl
bmRpZgo+Pj4+Pj4gICAgRVhQT1JUX1NZTUJPTChfX2JpdG1hcF93ZWlnaHQpOwo+Pj4+Pj4gICAg
Cj4+Pj4+PiArdm9pZCBfX2JpdG1hcF9zZXQodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBp
bnQgc3RhcnQsIGludCBsZW4pCj4+Pj4+PiArewo+Pj4+Pj4gKwl1bnNpZ25lZCBsb25nICpwID0g
bWFwICsgQklUX1dPUkQoc3RhcnQpOwo+Pj4+Pj4gKwljb25zdCB1bnNpZ25lZCBpbnQgc2l6ZSA9
IHN0YXJ0ICsgbGVuOwo+Pj4+Pj4gKwlpbnQgYml0c190b19zZXQgPSBCSVRTX1BFUl9MT05HIC0g
KHN0YXJ0ICUgQklUU19QRVJfTE9ORyk7Cj4+Pj4+PiArCXVuc2lnbmVkIGxvbmcgbWFza190b19z
ZXQgPSBCSVRNQVBfRklSU1RfV09SRF9NQVNLKHN0YXJ0KTsKPj4+Pj4+ICsKPj4+Pj4+ICsJd2hp
bGUgKGxlbiAtIGJpdHNfdG9fc2V0ID49IDApIHsKPj4+Pj4+ICsJCSpwIHw9IG1hc2tfdG9fc2V0
Owo+Pj4+Pj4gKwkJbGVuIC09IGJpdHNfdG9fc2V0Owo+Pj4+Pj4gKwkJYml0c190b19zZXQgPSBC
SVRTX1BFUl9MT05HOwo+Pj4+Pj4gKwkJbWFza190b19zZXQgPSB+MFVMOwo+Pj4+Pj4gKwkJcCsr
Owo+Pj4+Pj4gKwl9Cj4+Pj4+PiArCWlmIChsZW4pIHsKPj4+Pj4+ICsJCW1hc2tfdG9fc2V0ICY9
IEJJVE1BUF9MQVNUX1dPUkRfTUFTSyhzaXplKTsKPj4+Pj4+ICsJCSpwIHw9IG1hc2tfdG9fc2V0
Owo+Pj4+Pj4gKwl9Cj4+Pj4+PiArfQo+Pj4+Pj4gK0VYUE9SVF9TWU1CT0woX19iaXRtYXBfc2V0
KTsKPj4+Pj4+ICsKPj4+Pj4+ICt2b2lkIF9fYml0bWFwX2NsZWFyKHVuc2lnbmVkIGxvbmcgKm1h
cCwgdW5zaWduZWQgaW50IHN0YXJ0LCBpbnQgbGVuKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsJdW5zaWdu
ZWQgbG9uZyAqcCA9IG1hcCArIEJJVF9XT1JEKHN0YXJ0KTsKPj4+Pj4+ICsJY29uc3QgdW5zaWdu
ZWQgaW50IHNpemUgPSBzdGFydCArIGxlbjsKPj4+Pj4+ICsJaW50IGJpdHNfdG9fY2xlYXIgPSBC
SVRTX1BFUl9MT05HIC0gKHN0YXJ0ICUgQklUU19QRVJfTE9ORyk7Cj4+Pj4+PiArCXVuc2lnbmVk
IGxvbmcgbWFza190b19jbGVhciA9IEJJVE1BUF9GSVJTVF9XT1JEX01BU0soc3RhcnQpOwo+Pj4+
Pj4gKwo+Pj4+Pj4gKwl3aGlsZSAobGVuIC0gYml0c190b19jbGVhciA+PSAwKSB7Cj4+Pj4+PiAr
CQkqcCAmPSB+bWFza190b19jbGVhcjsKPj4+Pj4+ICsJCWxlbiAtPSBiaXRzX3RvX2NsZWFyOwo+
Pj4+Pj4gKwkJYml0c190b19jbGVhciA9IEJJVFNfUEVSX0xPTkc7Cj4+Pj4+PiArCQltYXNrX3Rv
X2NsZWFyID0gfjBVTDsKPj4+Pj4+ICsJCXArKzsKPj4+Pj4+ICsJfQo+Pj4+Pj4gKwlpZiAobGVu
KSB7Cj4+Pj4+PiArCQltYXNrX3RvX2NsZWFyICY9IEJJVE1BUF9MQVNUX1dPUkRfTUFTSyhzaXpl
KTsKPj4+Pj4+ICsJCSpwICY9IH5tYXNrX3RvX2NsZWFyOwo+Pj4+Pj4gKwl9Cj4+Pj4+PiArfQo+
Pj4+Pj4gK0VYUE9SVF9TWU1CT0woX19iaXRtYXBfY2xlYXIpOwo+Pj4+Pgo+Pj4+PiBEZXNwaXRl
IGFsbCB0aGUgb3RoZXIgRVhQT1JUX1NZTUJPTCgpIGluIHRoaXMgZmlsZSwgcGVyc29uYWxseSBJ
Cj4+Pj4+IHdvdWxkIHN1Z2dlc3QgdG8gcmVmcmFpbiBmcm9tIGFkZGluZyBtb3JlLiBCdXQgSSdt
IG5vdCBnb2luZyB0bwo+Pj4+PiBpbnNpc3QgKHVudGlsIHN1Y2ggdGltZSB0aGF0IHRoZXkgYWxs
IGdldCBjbGVhbmVkIHVwKS4KPj4+Pj4KPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
Yml0b3BzLmgKPj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYml0b3BzLmgKPj4+Pj4+
IEBAIC00ODAsNCArNDgwLDYgQEAgc3RhdGljIGlubGluZSBpbnQgZmxzKHVuc2lnbmVkIGludCB4
KQo+Pj4+Pj4gICAgI2RlZmluZSBod2VpZ2h0MTYoeCkgZ2VuZXJpY19od2VpZ2h0MTYoeCkKPj4+
Pj4+ICAgICNkZWZpbmUgaHdlaWdodDgoeCkgZ2VuZXJpY19od2VpZ2h0OCh4KQo+Pj4+Pj4gICAg
Cj4+Pj4+PiArI2RlZmluZSBCSVRfV09SRChucikgKChucikgLyBCSVRTX1BFUl9MT05HKQo+Pj4+
Pgo+Pj4+PiBBdCBmaXJzdCBJIHRob3VnaHQgLSB3aHkgZm9yIHg4NiBvbmx5PyBUaGVuIEkgbm90
aWNlZCBBcm0gaGFzIGFuCj4+Pj4+IGFsbW9zdCBpZGVudGljYWwgI2RlZmluZSBhbHJlYWR5LiBX
aGljaCBpbiB0dXJuIG1hZGUgbWUgbG9vayBhdAo+Pj4+PiBMaW51eCwgd2hlcmUgdGhhdCAjZGVm
aW5lIGxpdmVzIGluIGEgY29tbW9uIGhlYWRlci4gSSB0aGluayB5b3UKPj4+Pj4gd2FudCB0byBt
b3ZlIHRoZSBBcm0gb25lLiBPciB3YWl0LCBubyAtIEFybSdzIGlzbid0IGV2ZW4KPj4+Pj4gY29t
cGF0aWJsZSB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGZ1bmN0aW9ucyB5b3UgYWRk
Lgo+Pj4+PiBUaGlzIGRlZmluaXRlbHkgbmVlZHMgdGFraW5nIGNhcmUgb2YsIHBlcmhhcHMgYnkg
d2F5IG9mIGlnbm9yaW5nCj4+Pj4+IG15IHJlcXVlc3QgdG8gZ28gdGhpcyByb3V0ZSAoYXMgZ2V0
dGluZyB0b28gaW52b2x2ZWQpLgo+Pj4+Cj4+Pj4gVXJnLCB5ZXMsIEkgZGlkbid0IHJlYWxpemUg
dGhhdCBCSVRfV09SRCBvbiBBUk0gaXMgb25seSBtZWFudCB0byBiZQo+Pj4+IHVzZWQgd2hlbiB0
aGUgYml0bWFwIGlzIG1hcHBlZCB0byBhbiBhcnJheSBvZiAzMmJpdCB0eXBlIGVsZW1lbnRzLgo+
Pj4+Cj4+Pj4gSSBjb3VsZCBpbnRyb2R1Y2UgQklUX0xPTkcgdGhhdCB3b3VsZCBoYXZlIHRoZSBz
YW1lIGRlZmluaXRpb24gb24gQXJtCj4+Pj4gYW5kIHg4NiwgYW5kIHRoZW4gbW9kaWZ5IHRoZSBp
bXBvcnRlZCBmdW5jdGlvbnMgdG8gdXNlIGl0LCBidXQgSU1PIHRoZQo+Pj4+IHJpZ2h0IHNvbHV0
aW9uIHdvdWxkIGJlIHRvIGNoYW5nZSB0aGUgQXJtIEJJVF9XT1JEIG1hY3JvIHRvIGFsc28gdXNl
Cj4+Pj4gQklUU19QRVJfTE9ORyAoYW5kIGFkanVzdCB0aGUgY2FsbGVycykuCj4+Pgo+Pj4gU28g
ZG8gSS4gSnVsaWVuLCBTdGVmYW5vPwo+Pgo+PiBCSVRfV09SRCB1c2VkIHRvIHVzZSBCSVRTX1BF
Ul9MT05HIGJ1dCB0aGlzIHdhcyBjaGFuZ2VkIGluIGNvbW1pdDoKPj4KPj4gY29tbWl0IGNkMzM4
ZTk2N2M1OThiZjc0N2IwM2RjZmQ5ZDhkNDVkYzQwYmFjMWEKPj4gQXV0aG9yOiBJYW4gQ2FtcGJl
bGwgPGlhbi5jYW1wYmVsbEBjaXRyaXguY29tPgo+PiBEYXRlOiAgIFRodSBNYXkgOCAxNjoxMzo1
NSAyMDE0ICswMTAwCj4+Cj4+ICAgICAgIHhlbjogYXJtOiBiaXRvcHMgdGFrZSB1bnNpZ25lZCBp
bnQKPj4KPj4gICAgICAgWGVuIGJpdG1hcHMgY2FuIGJlIDQgcmF0aGVyIHRoYW4gOCBieXRlIGFs
aWduZWQsIHNvIHVzZSB0aGUKPj4gYXBwcm9wcmlhdGUgdHlwZS4KPj4gICAgICAgT3RoZXJ3aXNl
IHRoZSBjb21waWxlciBjYW4gZ2VuZXJhdGUgdW5hbGlnbmVkIDggYnl0ZSBhY2Nlc3NlcyBhbmQK
Pj4gY2F1c2UgdHJhcHMuCj4+Cj4+ICAgICAgIFNpZ25lZC1vZmYtYnk6IElhbiBDYW1wYmVsbCA8
aWFuLmNhbXBiZWxsQGNpdHJpeC5jb20+Cj4+ICAgICAgIEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUBldS5jaXRyaXguY29tPgo+Pgo+PiBPbiA2NC1iaXQg
QXJtLCB3aGlsZSB3ZSBhbGxvdyB1bmFsaWduZWQgYWNjZXNzLCB0aGUgYXRvbWljIG9wZXJhdGlv
bnMKPj4gc3RpbGwgZW5mb3JjZSBhbGlnbm1lbnQuCj4+Cj4+IE9uIDMyLWJpdCBBcm0sIHRoZXJl
IGFyZSBubyB1bmFsaWduZWQgYWNjZXNzIGFsbG93ZWQuIEhvd2V2ZXIsICB0aGUKPj4gY2hhbmdl
IG9mIEJJVF9XT1JEIGlzIG5vdCBhIGNvbmNlcm4gZm9yIDMyLWJpdC4KPj4KPj4gSSBoYXZlbid0
IGNoZWNrIHdoZXRoZXIgd2Ugc3RpbGwgaGF2ZSBwbGFjZXMgd2hlcmUgYml0b3BzIGFyZSB1c2Vk
IHdpdGgKPj4gNCBieXRlIGFsaWduZWQgbWVtb3J5LiBIb3dldmVyLCBhcyB0aGUgYml0b3BzIHRh
a2UgYSB2b2lkICogaW4KPj4gcGFyYW1ldGVyLCB0aGVyZSBhcmUgbm8gcHJvbWlzZSBvbiB0aGUg
YWxpZ25tZW50Lgo+IAo+IEknbSBwcmV0dHkgc3VyZSBmb3IgeDg2IHRoZSAzMi1iaXQgZ3Vlc3Qg
Y29tcGF0IGNvZGUgdXNlcyBzdWNoLCBhdAo+IHRoZSB2ZXJ5IGxlYXN0LgoKSSBoYXZlIHNwZW50
IHNvbWUgdGltZXMgbG9va2luZyBhdCBpdCBhbmQgbm90aWNlZCwgdGhlcmUgYXJlIHNvbWUgaW4g
dGhlIApjb21tb24gY29kZSAoZS5nIHNjaGVkdWxlciwgSVJRLi4uKS4KCj4gCj4+IFRoZXJlZm9y
ZSwgd2UgY2FuJ3QgcmV3cml0ZSBCSVRfV09SRCB3aXRob3V0IGFkZHJlc3NpbmcgdGhlIHVuZGVy
bHlpbmcKPj4gaXNzdWVzLiBJbnRyb2R1Y2luZyBCSVRfTE9ORyBpcyBwcm9iYWJseSB0aGUgZWFz
aWVzdCB3YXkgYXQgdGhlIG1vbWVudC4KPiAKPiBXaGljaCB3b3VsZCBtYWtlIHVzZSAoY29udGlu
dWUgdG8pIGRldmlhdGUgZnJvbSBMaW51eCdlcyBtZWFuaW5nIG9mCj4gQklUX1dPUkQoKS4KClRo
aXMgd291bGQgbm90IGJlIHJlYWxseSB0aGUgZmlyc3QgdGltZSB3ZSBkZXZpYXRlIGZyb20gTGlu
dXguLi4gV2UgCmNvdWxkIHBvc3NpYmx5IHJlbmFtZSBCSVRfV09SRCB0byBzb21ldGhpbmcgZGlm
ZmVyZW50LCBidXQgSSBkb24ndCBoYXZlIAphIGdvb2QgbmFtZSwgaGVuY2Ugd2h5IEkgdGhpbmsg
QklUX0xPTkcgaXMgdGhlIGJlc3Qgc29sdXRpb24gc28gZmFyLgoKPiAKPj4gSG93ZXZlciwgb3Vy
IGJpdG9wcyByZWFsbHkgb3VnaHQgdG8gc3BlY2lmeSB0aGUgYWxpZ25tZW50IGluIHBhcmFtZXRl
cgo+PiB0byBhdm9pZCBzdWNoIGlzc3VlcyBhcmlzaW5nLgo+Pgo+PiBJIHdvdWxkIGJlIGluIGZh
dm9yIG9mIHVzaW5nIHVuc2lnbmVkIGxvbmcgKi4KPiAKPiBJIGRvbid0IHRoaW5rIHRoZXkgc2hv
dWxkLCBhcyB0aGlzIGNvbXBsaWNhdGVzIHVzZXMgb24gbm9uLTY0LWJpdAo+IHF1YW50aXRpZXMu
IEluIGZhY3QgSSB0aGluayBiaXRvcHMgd291bGQgYmV0dGVyIGJlIHBlcm1pdHRlZCBhbHNvCj4g
b24gc3ViLTMyLWJpdCB2YWx1ZXMuIEJ1dCBhbnl3YXkgLSB4ODYgdW5kZXIgdGhlIGhvb2QgdXNl
cyAzMi1iaXQKPiBtZW1vcnkgYWNjZXNzZXMgdG9vLCBpbiBhIG51bWJlciBvZiBjYXNlcy4gSXQn
cyBub3Qgb2J2aW91cyB0byBtZQo+IHdoeSBBcm02NCBjb3VsZG4ndCBkbyBzbyBhcyB3ZWxsLCBk
ZXNwaXRlIEJJVF9XT1JEKCkgLSBmb3IgdGhlCj4gcHVycG9zZXMgb2YgZ2VuZXJpYyBjb2RlIC0g
YXNzdW1pbmcgInVuc2lnbmVkIGxvbmciIHRvIGJlIHRoZSBiYXNlCj4gIndvcmQiLgoKTXkgcG9p
bnQgaXMgd2Ugc2hvdWxkIGF2b2lkIG90IHVzZSB2b2lkICogYW5kIGltcGxpY2V0bHkgcmVxdWly
ZSBhbiAKYWxpZ25tZW50ICgzMi1iaXQgYXQgdGhlIG1vbWVudCkuIFRoaXMgaGFzIHJlc3VsdGVk
IHRvIG51bWVyb3VzIGlzc3VlcyAKaW4gdGhlIHBhc3Qgb24gQXJtLiBUbyBiZSBjbGVhciwgSSBh
bSBub3QgcmVxdWVzdGluZyB0byBoYW5kbGUgdGhlIHZvaWQgKi4KCkFueXdheSwgYmxpbmRseSB1
cGRhdGluZyBCSVRfV09SRCgpIGlzIGdvaW5nIHRvIGJyZWFrIEFybS4gU28geW91IGVpdGhlciAK
cmVuYW1lIHRvIGN1cnJlbnQgbWFjcm8gb3IgY3JlYXRlIGEgbmV3IG9uZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
