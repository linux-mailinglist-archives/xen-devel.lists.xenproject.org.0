Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865C184611
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:41:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiex-0000lG-V3; Fri, 13 Mar 2020 11:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FVV1=46=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jCiew-0000lB-9D
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:39:22 +0000
X-Inumbo-ID: 47397fb2-651f-11ea-b2c9-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47397fb2-651f-11ea-b2c9-12813bfff9fa;
 Fri, 13 Mar 2020 11:39:20 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id ca19so11459615edb.13
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 04:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OlXXf2AuzcuBPTq0aWhw211nfhHfwya1X3ps5AdyIY4=;
 b=n0YdSa1+45XtSnTInkiKC+oQrud40mUR7yJCoeQko1+QwbI0wFPWgHJtGIV+3N1JLc
 gMcff7e5w7ikO2sWVeAkdX2dsCCkYBE1303iurwliToXvKKvNZyS1qSNJjew5srGaugk
 snOpzVjZ4MY6dg7aXazHM+gGmWFoaKMP5TMc49ZkcNmhz+r9ZTmVmFP+K0pdu1HXpera
 0/RFi+140yjGNvaL5JBPm+NC745hibd9TvWQDcTzUCpzdRKz1RL8jlty5ee4ypo9EVdH
 UzNUvLMHc3eZ8Oa7H/NOH7wLag09lxv1wY2A6TskBZ8fBKObgNguhesfsMpyoZ7WA8wP
 cnfA==
X-Gm-Message-State: ANhLgQ15Wr57+aqp1yCnC5siovKIZYwa+QZb2rMJZTM0KNaK6O+vxlAb
 JwPnUBa0SjeeZTJv28r4Yig=
X-Google-Smtp-Source: ADFU+vuflDqy6bf5TLaEFLmdg+l8fsdj4M7D8jsI9lUzoOdUeVxyuBgctsGNF0aActjdanxoBuYIiQ==
X-Received: by 2002:a17:907:105a:: with SMTP id
 oy26mr2748834ejb.308.1584099559757; 
 Fri, 13 Mar 2020 04:39:19 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id s22sm1390874eja.84.2020.03.13.04.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 04:39:19 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
 <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
 <41c5066a-17ef-31ca-afa6-f7ded8c31574@xen.org>
 <d20369e5-260e-6ff7-0eb0-aef426298509@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5f7b8cd3-19ee-2e7a-542e-4ca7040c929c@xen.org>
Date: Fri, 13 Mar 2020 11:39:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d20369e5-260e-6ff7-0eb0-aef426298509@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDEzLzAzLzIwMjAgMTE6MjMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4g
T24gMTMuMDMuMjAgMTE6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgSnVlcmdlbiwKPj4K
Pj4gT24gMTMvMDMvMjAyMCAxMDoxNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+IE9uIDEzLjAz
LjIwIDExOjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGkgSnVlcmdlbiwKPj4+Pgo+Pj4+
IE9uIDEzLzAzLzIwMjAgMDg6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IFNpbWlsYXIg
dG8gc3BpbmxvY2tzIHByZWVtcHRpb24gc2hvdWxkIGJlIGRpc2FibGVkIHdoaWxlIGhvbGRpbmcg
YQo+Pj4+PiByd2xvY2suCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9yd2xv
Y2suaCB8IDE4ICsrKysrKysrKysrKysrKysrLQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL3J3bG9jay5oIGIveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oCj4+Pj4+IGlu
ZGV4IDFjMjIxZGQwZDkuLjRlZTM0MWExODIgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9yd2xvY2suaAo+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+Pj4g
QEAgLTIsNiArMiw3IEBACj4+Pj4+IMKgICNkZWZpbmUgX19SV0xPQ0tfSF9fCj4+Pj4+IMKgICNp
bmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Cj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3ByZWVtcHQuaD4KPj4+
Pj4gwqAgI2luY2x1ZGUgPHhlbi9zbXAuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPHhlbi9zcGlubG9j
ay5oPgo+Pj4+PiBAQCAtNTcsMTAgKzU4LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IF9yZWFkX3Ry
eWxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+IMKgwqDCoMKgwqAgY250cyA9IGF0b21pY19yZWFk
KCZsb2NrLT5jbnRzKTsKPj4+Pj4gwqDCoMKgwqDCoCBpZiAoIGxpa2VseShfY2FuX3JlYWRfbG9j
ayhjbnRzKSkgKQo+Pj4+PiDCoMKgwqDCoMKgIHsKPj4+Pgo+Pj4+IElmIHlvdSBnZXQgcHJlZW1w
dGVkIGhlcmUsIHRoZW4gaXQgbWVhbnMgdGhlIGNoZWNrIGJlbG93IGlzIGxpa2VseSAKPj4+PiBn
b2luZyB0byBmYWlsLiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gZGlzYWJsZSBwcmVl
bXB0aW9uIAo+Pj4+IGJlZm9yZSwgdG8gZ2l2ZSBtb3JlIGNoYW5jZSB0byBzdWNjZWVkLgo+Pj4K
Pj4+IEFzIHByZWVtcHRpb24gcHJvYmFiaWxpdHkgYXQgdGhpcyB2ZXJ5IHBvaW50IHNob3VsZCBi
ZSBtdWNoIGxvd2VyIHRoYW4KPj4+IHRoYXQgb2YgaGVsZCBsb2NrcyBJIHRoaW5rIHRoYXQgaXMg
b3B0aW1pemluZyB0aGUgd3JvbmcgcGF0aC4KPj4KPj4gV2h5IHNvPyBMb2NrIGNvbnRlbnRpb24g
c2hvdWxkIGJlIGZhaXJseSBsaW1pdGVkIG9yIHlvdSBhbHJlYWR5IGhhdmUgYSAKPj4gcHJvYmxl
bSBvbiB5b3VyIHN5c3RlbS4gU28gcHJlZW1wdGlvbiBpcyBtb3JlIGxpa2VseS4KPiAKPiBUb2Rh
eSBwcm9iYWJpbGl0eSBvZiBwcmVlbXB0aW9uIGlzIDAuCgpJIGFtIGF3YXJlIG9mIHRoYXQuLi4K
Cj4gCj4gRXZlbiB3aXRoIHByZWVtcHRpb24gYWRkZWQgdGhlIHByb2JhYmlsaXR5IHRvIGJlIHBy
ZWVtcHRlZCBpbiBhIHNlcXVlbmNlCj4gb2YgYWJvdXQgYSBkb3plbiBpbnN0cnVjdGlvbnMgaXMg
X3ZlcnlfIGxvdy4KCi4uLiBidXQgSSBhbSBub3QgY29udmluY2VkIG9mIHRoZSBsb3cgcHJvYmFi
aWxpdHkgaGVyZS4KCj4gCj4+Cj4+PiBJJ20gbm90Cj4+PiBvcHBvc2VkIGRvaW5nIHRoZSBtb2Rp
ZmljYXRpb24geW91IGFyZSByZXF1ZXN0aW5nLCBidXQgd291bGQgbGlrZSB0bwo+Pj4gaGVhciBh
IHNlY29uZCBvcGluaW9uIG9uIHRoYXQgdG9waWMsIGVzcGVjaWFsbHkgYXMgSSdkIG5lZWQgdG8g
YWRkCj4+PiBhbm90aGVyIHByZWVtcHRfZW5hYmxlKCkgY2FsbCB3aGVuIGZvbGxvd2luZyB5b3Vy
IGFkdmljZS4KPj4KPj4gSSBkb24ndCByZWFsbHkgc2VlIHRoZSBwcm9ibGVtIHdpdGggYWRkaW5n
IGEgbmV3IHByZWVtcHRpb25fZW5hYmxlKCkgCj4+IGNhbGwuIEJ1dCB0aGUgY29kZSBjYW4gYWxz
byBiZSByZXdvcmtlZCB0byBoYXZlIG9ubHkgb25lIGNhbGwuLi4KPiAKPiBJdHMgdGhlIGR5bmFt
aWNhbCBwYXRoIEknbSBzcGVha2luZyBvZi4gQWNjZXNzaW5nIGEgbG9jYWwgY3B1IHZhcmlhYmxl
Cj4gaXMgbm90IHRoYXQgY2hlYXAsIGFuZCBpbiBjYXNlIHdlIGFkZCBwcmVlbXB0aW9uIGluIHRo
ZSBmdXR1cmUKPiBwcmVlbXB0X2VuYWJsZSgpIHdpbGwgYmVjb21lIGV2ZW4gbW9yZSBleHBlbnNp
dmUuCgpEbyB5b3UgcmVhbGl6ZSB0aGF0IHRoZSBsb2NrIGlzIG1vc3QgbGlrZWx5IGJlIHVuY29u
dGVudGVkPyBBbmQgaWYgaXQgCndlcmUsIHRoZSBjYWxsZXIgd291bGQgbGlrZWx5IG5vdCBzcGlu
IGluIGEgdGlnaHQgbG9vcCwgb3RoZXJ3aXNlIGl0IAp3b3VsZCBoYXZlIHVzZWQgcmVhZF9sb2Nr
KCkuCgpTbyB1bnRpbCB5b3UgcHJvdmVkIG1lIG90aGVyd2lzZSAod2l0aCBudW1iZXJzKSwgdGhp
cyBpcyAKbWljcm8tb3B0aW1pemF0aW9uIHRoYXQgaXMgbm90IGdvaW5nIHRvIGJlIHNlZW4gaW4g
YSB3b3JrbG9hZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
