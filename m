Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B84317BDDF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:13:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACkz-000217-NE; Fri, 06 Mar 2020 13:11:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jACkx-00020n-Ix
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:11:11 +0000
X-Inumbo-ID: f2bd5788-5fab-11ea-90c4-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2bd5788-5fab-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 13:11:10 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m25so2434925edq.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=KA+K3tiaBW+ZKPS1oFW0FsID5PkqUASS3SqbNZ8Di2Y=;
 b=ZTo4h+Si+qH+8qXGKLHwRfSKrsqNKfRj3i1tu7TqMGBoTHG8AS1LhxNEgLLqxVPZXr
 o0M+sMvbphwC7QJPZdHb2Dx0hrZ1oF2MCARsjOh9zqP/YYEsVt1d+OhRMCaPCV7DP7ub
 Zlc75v1ivYciOJqKhbRuDAHbwaptbpVRcsvYsbhUHBIBdDsvbN5RYzeYFjsr9MmljgyD
 el6xExzf110avGr8h1gVpYoBUbIEhxAw1L2ZLfKQblbozk4wkifhy8x+YHCd6m+nF3B2
 Z+AYQSBwruRCforwGKIUSuF6ektxRijpTWKY6Ywd9M4vMh6YurQFtukSN+TBGLClmVEZ
 CZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=KA+K3tiaBW+ZKPS1oFW0FsID5PkqUASS3SqbNZ8Di2Y=;
 b=KfXwW9ucHVkVZCj64p9bfzF+FKMSdmWlW1QXH7TMfaNP/fFWScPihYP/dIcSoKAHwI
 hLRM+w1LhQDz5qeiZhImtb9EZLu2cxKnZAPKdlwykR429K8oTbx4aGSIWThna53q5Vht
 AEN4Wr5OqkeqycWjphoLT7PpHhfgrNYKgJzyb5FrzJGRmCom+yEAUD/GXw/Nz9IucVrJ
 5WcFYF4Ud20KGyzZaDQ9iWGtXaOI/ENQ9lJv9+r3Od1pa4DSEEr1cQ9Ddd/GEwpcNxn6
 UXbt+EHlleavgJ6SKfpzAA+o4p6j3WtTUyxS70LiaKy4Dyjb18MJXjxsiwSHvgP8N720
 1urQ==
X-Gm-Message-State: ANhLgQ0MOg9CdZL9M6rnHO24Ly5117b0hODxqwhDNrAa4OUJy33m8TkS
 jEKdDSzEdhyoamoWVhn5IWk=
X-Google-Smtp-Source: ADFU+vvFAC+Rkk8LedBIsDunTEfxLAXZWbFC5TELNH0CAFjnQU/aJ4M17KCSttr6c6dirn7L1Kmdfw==
X-Received: by 2002:a50:8a95:: with SMTP id j21mr3111609edj.36.1583500270122; 
 Fri, 06 Mar 2020 05:11:10 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id g20sm1624561edp.69.2020.03.06.05.11.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:11:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
 <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
 <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
 <cddc7c8d65b6444a9c44f075fdca3b93@EX13D32EUC003.ant.amazon.com>
 <3e5296fe-4162-8f1e-7497-57359334a902@suse.com>
In-Reply-To: <3e5296fe-4162-8f1e-7497-57359334a902@suse.com>
Date: Fri, 6 Mar 2020 13:11:08 -0000
Message-ID: <007a01d5f3b8$b3e3f210$1babd630$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV86zPcz0SNzMCl02V4cFdHsApB6g7dx1AgAAMGICAAACBgIAABQoAgAAAZ0A=
Content-Language: en-gb
Subject: Re: [Xen-devel] [EXTERNAL][PATCH v3 2/6] x86 / p2m: remove
 page_list check in p2m_alloc_table
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
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjA3Cj4gVG86IER1cnJhbnQsIFBh
dWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiBDYzogcGR1cnJhbnRAYW16bi5jb207IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47Cj4gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsg
V2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdW1BBVENIIHYzIDIvNl0geDg2IC8gcDJtOiBy
ZW1vdmUgcGFnZV9saXN0IGNoZWNrIGluIHAybV9hbGxvY190YWJsZQo+IAo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25m
aXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiAKPiBP
biAwNi4wMy4yMDIwIDEzOjUwLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+ID4+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTI6NDcKPiA+PiBUbzogRHVycmFudCwgUGF1bCA8
cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+ID4+IENjOiBwZHVycmFudEBhbXpuLmNvbTsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsKPiA+PiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNl0geDg2IC8gcDJtOiByZW1v
dmUgcGFnZV9saXN0IGNoZWNrIGluIHAybV9hbGxvY190YWJsZQo+ID4+Cj4gPj4gT24gMDYuMDMu
MjAyMCAxMzowNywgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Pj4+PiBTZW50OiAwNiBNYXJjaCAyMDIwIDExOjQ2Cj4gPj4+PiBUbzogcGR1cnJhbnRAYW16bi5j
b20KPiA+Pj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBh
dWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXIKPiA+Pj4+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47Cj4gUm9nZXIKPiA+PiBQYXUKPiA+Pj4+IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIv
Nl0geDg2IC8gcDJtOiByZW1vdmUgcGFnZV9saXN0IGNoZWNrIGluIHAybV9hbGxvY190YWJsZQo+
ID4+Pj4KPiA+Pj4+IE9uIDA1LjAzLjIwMjAgMTM6NDUsIHBkdXJyYW50QGFtem4uY29tIHdyb3Rl
Ogo+ID4+Pj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+Pj4+
Pgo+ID4+Pj4+IFRoZXJlIGRvZXMgbm90IHNlZW0gdG8gYmUgYW55IGp1c3RpZmljYXRpb24gZm9y
IHJlZnVzaW5nIHRvIGNyZWF0ZSB0aGUKPiA+Pj4+PiBkb21haW4ncyBwMm0gdGFibGUgc2ltcGx5
IGJlY2F1c2UgaXQgbWF5IGhhdmUgYXNzaWduZWQgcGFnZXMuCj4gPj4+Pgo+ID4+Pj4gSSB0aGlu
ayB0aGVyZSBpczogSWYgYW55IHN1Y2ggYWxsb2NhdGlvbiBoYWQgaGFwcGVuZWQgYmVmb3JlLCBo
b3cKPiA+Pj4+IHdvdWxkIGl0IGJlIHJlcHJlc2VudGVkIGluIHRoZSBkb21haW4ncyBwMm0/Cj4g
Pj4+Cj4gPj4+IEluc2VydGlvbiBpbnRvIHRoZSBwMm0gaXMgYSBzZXBhcmF0ZSBhY3Rpb24gZnJv
bSBwYWdlIGFsbG9jYXRpb24uIFdoeSBzaG91bGQgdGhleSBiZSBsaW5rZWQ/Cj4gPj4KPiA+PiBU
aGV5IGFyZSwgYmVjYXVzZSBvZiBob3cgWEVOTUVNX3BvcHVsYXRlX3BoeXNtYXAgd29ya3MuIFll
cywKPiA+PiB0aGV5IF9jb3VsZF8gYmUgc2VwYXJhdGUgc3RlcHMsIGJ1dCB0aGF0J3Mgb25seSBh
IHRoZW9yZXRpY2FsCj4gPj4gY29uc2lkZXJhdGlvbi4KPiA+Cj4gPiBUaGVuIHN1cmVseSB0aGUg
Y2hlY2sgc2hvdWxkIGJlIGluIHRoZSBYRU5NRU1fcG9wdWxhdGVfcGh5c21hcCBjb2RlPwo+IAo+
IEhvdyB0aGF0PyBwb3B1bGF0ZS1waHlzbWFwIGNhbiBiZSBjYWxsZWQgYW55IG51bWJlciBvZiB0
aW1lcy4gV2UKPiBjYW4ndCByZWZ1c2UgYSAybmQgY2FsbCB0aGVyZSBqdXN0IGJlY2F1c2UgYSAx
c3Qgb25lIGhhZCBoYXBwZW5lZAo+IGFscmVhZHkuIE9yIGRpZCB5b3UgbWVhbiB0aGUgaW52ZXJz
ZSBjaGVjayAoaS5lLiB0aGF0IHRoZXJlCj4gYWxyZWFkeSBpcyBhIHAybSk/CgpZZXMsIEkgbWVh
biBjaGVjayB0aGUgcDJtIGhhcyBiZWVuIGluaXRpYWxpemVkIHRoZXJlLgoKPiBUaGlzIHN1cmVs
eSB3b3VsZG4ndCBiZSBhIGJhZCBpZGVhLCBhcwo+IG90aGVyd2lzZSBib3RoIGVwdF9nZXRfZW50
cnkoKSBhbmQgcDJtX3B0X2dldF9lbnRyeSgpIHdvdWxkCj4gYmxpbmRseSBtYXAgTUZOIDAuIEJ1
dCBhZGRpbmcgc3VjaCBhIGNoZWNrIHdvdWxkbid0IGVsaW1pbmF0ZQo+IHRoZSByZWFzb24gdG8g
YWxzbyBoYXZlIHRoZSBjaGVjayB0aGF0IHlvdSdyZSBwcm9wb3NpbmcgdG8gZHJvcC4KPiAKCldo
eSBub3Q/IEFueXdoZXJlIGFzc3VtaW5nIHRoZSBleGlzdGVuY2Ugb2YgYSBwMm0gb3VnaHQgdG8g
Y2hlY2sgZm9yIGl0OyBJIHN0aWxsIGNhbid0IHNlZSB3aHkgaW5pdGlhbGlzaW5nIHRoZSBwMm0g
YWZ0ZXIgaGF2aW5nIGFsbG9jYXRlZCBwYWdlcyAoUEdDX2V4dHJhIG9yIG90aGVyd2lzZSkgaXMg
aW5oZXJlbnRseSB3cm9uZy4KCiAgUGF1bAoKPiBKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
