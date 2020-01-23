Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AAB146B9F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:46:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iudh0-0003rd-PA; Thu, 23 Jan 2020 14:42:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=prnW=3M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iudgz-0003r0-91
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 14:42:45 +0000
X-Inumbo-ID: 987d2ebc-3dee-11ea-aecd-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987d2ebc-3dee-11ea-aecd-bc764e2007e4;
 Thu, 23 Jan 2020 14:42:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so2829217wmj.5
 for <xen-devel@lists.xen.org>; Thu, 23 Jan 2020 06:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ah30OKRJ8rLBcbfccIYILf1jaaVKCic80eyclHRR+4=;
 b=T5SN9ZlPjE8Vg1JP02kEwVsPemDJHzU7+ahY4J6mUdGJ6yhl9VlxMUuVl5aqOq5zRW
 MfYZSkza+tXhcTzoaoy0VQUnEnhFEKQOIjan1p2SqRAhjabtCvwSopcRZ9KZABP3lbc+
 FSZWaoNHo04gYxMah4ZfsNgeE1fgmK5ts7NK/A05tDifUcMhH0spvb4y0gQS7jhaJZ4R
 Do9lvzjpY/isXjY1SyUHLykg+M24XgTj2hVUgKuCjQH6IBqcNQciSkz/sO4VxqCMN7sw
 UkXNFG/4CGLJxq7nDHv6tCWdqVX0BF2H3LL20KGaib7+zJ55mkG0Kf+2nGZkF5nrNEYY
 s94g==
X-Gm-Message-State: APjAAAVDxQ9fnHkoWlGHOqvRxsMLvaHEwKNF7QfwscvCGzA5ljWFzCP8
 /NKux9Xd2nYcHGgZMhlB8g4=
X-Google-Smtp-Source: APXvYqyiD/h8jxVAceQbrRctFgpvNn9S9FQWRvOh9k4eKFEFx6jC3SnuoeGTI+tvUyjLDp+8aCix9w==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr1424421wmm.98.1579790555452; 
 Thu, 23 Jan 2020 06:42:35 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id s15sm3252104wrp.4.2020.01.23.06.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 06:42:34 -0800 (PST)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
 <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
 <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <01b8360a-803b-e409-0ced-9f6cf75ba609@xen.org>
Date: Thu, 23 Jan 2020 14:42:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMy8wMS8yMDIwIDExOjMyLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+IE9uIDIyLzAx
LzIwMjAgMTE6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4KPj4gT24gMjIvMDEvMjAyMCAx
MToxOSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+IE9uIDIyLzAxLzIwMjAgMTA6MTQsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjIvMDEvMjAyMCAxMDowMSwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+Pj4gT24gMjAvMDEvMjAyMCAxMDowMSwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+
Pj4+IHYyIC0tPiB2MzoKPj4+Pj4+PiAtIFJlbW92ZSBodm1sb2FkZXIgZmlsdGVyaW5nCj4+Pj4+
Pgo+Pj4+Pj4gV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1c3Npb24sIGhvdyBhYm91dCBhZGRp
bmcgWEVOVkVSX2RlbmllZCB0bwo+Pj4+Pj4gcmV0dXJuIHRoZSAiZGVuaWVkIiBzdHJpbmcsIGFs
bG93aW5nIGNvbXBvbmVudHMgd2hpY2ggd2FudCB0byBmaWx0ZXIKPj4+Pj4+IHRvIGtub3cgZXhh
Y3RseSB3aGF0IHRvIGxvb2sgZm9yPyBBbmQgdGhlbiByZS1hZGQgdGhlIGZpbHRlcmluZyB5b3UK
Pj4+Pj4+IGhhZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hvdWxkIHRo
ZW4gcGVyaGFwcyBiZQo+Pj4+Pj4gZXh0ZW5kZWQgdG8gbWFrZSB2ZXJ5IGNsZWFyIHRoYXQgdGhl
IGNob3NlbiBzdHJpbmcgc2hvdWxkIG5vdCBtYXRjaAo+Pj4+Pj4gYW55dGhpbmcgdGhhdCBjb3Vs
ZCBwb3RlbnRpYWxseSBiZSByZXR1cm5lZCBieSBhbnkgb2YgdGhlIFhFTlZFUl8KPj4+Pj4+IHN1
Yi1vcHMuKQo+Pj4+Pgo+Pj4+PiBJIGhhZCB0aGUgZm9sbG93aW5nIHJlYXNvbmluZzoKPj4+Pj4K
Pj4+Pj4gMS4gTW9zdCByZWFsLXdvcmxkIHVzZXJzIHdvdWxkIHNldCBDT05GSUdfWFNNX0RFTklF
RF9TVFJJTkc9IiIgYW55d2F5Lgo+Pj4+Pgo+Pj4+PiAyLiBGaWx0ZXJpbmcgaW4gRE1JIHRhYmxl
cyBpcyBub3QgYSBjb21wbGV0ZSBzb2x1dGlvbiwgc2luY2UgZGVuaWVkCj4+Pj4+IHN0cmluZyBs
ZWFrcyBlbHNld2hlcmUgdGhyb3VnaCB0aGUgaHlwZXJjYWxsIChQViBndWVzdHMsIHN5c2ZzLCBk
cml2ZXIKPj4+Pj4gbG9ncykgYXMgQW5kcmV3IGhhcyBwb2ludGVkIG91dCBpbiB0aGUgcHJldmlv
dXMgZGlzY3Vzc2lvbi4KPj4+Pj4KPj4+Pj4gT24gdGhlIG90aGVyIGhhbmQsIFNNQmlvcyBmaWx0
ZXJpbmcgc2xpZ2h0bHkgaW1wcm92ZXMgdGhlIHNpdHVhdGlvbiBmb3IKPj4+Pj4gSFZNIGRvbWFp
bnMsIHNvIEkgY2FuIHJldHVybiBpdCBpZiBtYWludGFpbmVycyBmaW5kIGl0IHdvcnRoeS4KPj4+
Pgo+Pj4+IFdoaWxlIEkgYW0gbm90IGEgbWFpbnRhaW5lciBvZiB0aGlzIGNvZGUsIG15IGNvbmNl
cm4gaXMgeW91IGltcG9zZSB0aGUgY29udmVyc2lvbiBmcm9tICJkZW5pZWQiIHRvICIiIHRvIGFs
bCB0aGUgdXNlcnMgKGluY2x1ZGUgdGhvc2Ugd2hvIHdhbnRzIHRvIGtlZXAgImRlbmllZCIpLgo+
Pj4KPj4+IFRoaXMgaXMgbm90IHdoYXQncyBoYXBwZW5pbmcgaGVyZTogdGhlIGRlZmF1bHQgaXMg
c3RpbGwgIjxkZW5pZWQ+IiAoYXMKPj4+IHBlciBwYXRjaCAxKTsgYnV0IHBhdGNoIDIgbWFrZXMg
WEVOVkVSX2V4dHJhdmVyc2lvbiwgWEVOVkVSX2NvbXBpbGVfaW5mbwo+Pj4gYW5kIFhFTlZFUl9j
aGFuZ2VzZXQgdG8gcmV0dXJuICI8ZGVuaWVkPiIgaW5zdGVhZCBvZiB0aGUgcmVhbCB2YWx1ZXMK
Pj4+IHdoaWNoIGNhdXNlcyB0aGUgVUkgLyBsb2dzIGlzc3Vlcy4KPj4KPj4gSSB3YXMgcmVmZXJy
aW5nIHRoZSBTTUJpb3MgZmlsdGVyaW5nLi4uIEkgZG9uJ3QgdGhpbmsgZG9pbmcgYSBibGFuayBm
aWx0ZXJpbmcgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGluIHRoZSBodm1sb2FkZXIgZm9yIHRo
ZSByZWFzb24gZXhwbGFpbmVkIGFib3ZlLgo+IAo+IEFwb2xvZ2llcyBmb3IgbWlzdW5kZXJzdGFu
ZGluZyB0aGUgY29udGV4dC4gQnV0IEkgZGlzYWdyZWUgYWJvdXQKPiBodm1sb2FkZXIuIFJldHVy
bmluZyAiZGVuaWVkIiBmcm9tIHhlbl92ZXJzaW9uIGh5cGVyY2FsbCB0byBndWVzdHMgaXMKPiBv
bmUgdGhpbmcsIGJ1dCBodm1sb2FkZXIgYW5kIFNNQmlvcyB0YWJsZXMgYXJlIHBhcnRzIG9mIHRo
ZSBoeXBlcnZpc29yCj4gYW5kIHB1dHRpbmcgImRlbmllZCIgdGhlcmUgaXMgc2ltcGx5IGEgdGVy
cmlibGUgdXNlciBleHBlcmllbmNlLgoKSSBhbSBub3QgZ29pbmcgdG8gY29tbWVudCBvbiB0aGUg
dXNlciBleHBlcmllbmNlIGJlY2F1c2UgdGhpcyBpcyB1cCB0byAKYW5vdGhlciBiaWtlc2hlZGRp
bmcuIFRoZSBxdWVzdGlvbiBpcyB3aGljaCBzdHJpbmcgd2lsbCB5b3UgdXNlPyBXaHkgYW4gCmVt
cHR5IHN0cmluZyBvdmVyIHNvbWV0aGluZyBkaWZmZXJlbnQ/CgpIb3dldmVyLCBpZiBhbiBhZG1p
biBoYXMgY29udHJvbCBvdmVyIHRoZSAiZGVueSIgc3RyaW5nLCB3aHkgd291bGQgaGUgCmV2ZXIg
d2FudCB0byBmaWx0ZXIgaXQgaW4gaHZtbG9hZGVyPyBXaHkgY2FuJ3QgaGUganVzdCByZXBsYWNl
IHRoZSBvbmUgCmluIEtjb25maWc/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
