Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F3F17BE52
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:27:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACyX-0003XF-Mv; Fri, 06 Mar 2020 13:25:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jACyW-0003X9-4e
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:25:12 +0000
X-Inumbo-ID: e7b92e14-5fad-11ea-b52f-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7b92e14-5fad-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:25:11 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m25so2484797edq.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 05:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=HdXbmL+Fli0jbFuMyICmrlkgSypcc7elKKswgDhjMsI=;
 b=ZzQoV3YL6JRl/eKlF4nwYzCTB5rd1W0Imurrv3c0Var1bj57jIZ+lROGbAdTkhkIbU
 Sz2LVlfhd6q1BR7OzO8bgBunOOwWoBUIO/synoGkXtRJwV0kvAwGDhPcKd4a33VderU2
 macnux9J/Fj/d2p1kbnPdOk4231aYw0CnB1Xr7fYiJcJAMQ5QnzgjCUWRbRFhHvokUP2
 Zu4g49rHZy9ITODFbwI4GdG4dm74YC23fHCttRPB6BhrdDjEAcTv80lowdskXafQWYu3
 +uMpAhSs4yiZSbh+tuq/8umm4tTqw3EqQCNGPkmYejzjrkNFEthcOzmtPDwguZ5wBiVr
 42xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=HdXbmL+Fli0jbFuMyICmrlkgSypcc7elKKswgDhjMsI=;
 b=sGi0rFL8H8xo2ueqAi+Nk9z8VQDxdO6d6+d6laewuJytAQzP6gjuIHesC5qaqII92G
 NYu5qJpxWj1ggH6QejLHKp0c0sjUPjrQX6rroZ4iOs0SFV1mhI+ACMoL08DeYuYt/N2H
 uRQeowv6Bm7y/UVyNyQxa3uLMxm9CG9TXdfFqdLslIfEV6w4WTejwK1AFgWdetUpWbTX
 oKJ6433IUl64ahUXYgLcW9TJ8QlZ/GHXzyu9imnRbpTMgYxbm6iOJtEJWmQfiXGZfF1O
 YSFnAwrH5rvFyXMmkljm4IsBz1HwoBGMJFJxLSk2SAKJQd7iNeBhqKSHs2yxLGwz3rgQ
 PTFA==
X-Gm-Message-State: ANhLgQ0r97NtI9dXQLC/Ccftzq/U+jU/15q93l2/Mg6XXVeBJpjtZC4f
 z2z1jxI9RyBlH/2I1mTdcQk=
X-Google-Smtp-Source: ADFU+vtVu/6l6K+Rio+4VhOjP19UQi38ELtFuZd/OcgZUqgZrJth/mz1DFpMgVcv+iJERGG6fHxcnA==
X-Received: by 2002:a17:906:57c7:: with SMTP id
 u7mr2836760ejr.135.1583501110612; 
 Fri, 06 Mar 2020 05:25:10 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v25sm293610eja.62.2020.03.06.05.25.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:25:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
 <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
 <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
 <cddc7c8d65b6444a9c44f075fdca3b93@EX13D32EUC003.ant.amazon.com>
 <3e5296fe-4162-8f1e-7497-57359334a902@suse.com>
 <007a01d5f3b8$b3e3f210$1babd630$@xen.org>
 <6c9fa2e7-5c02-102f-74f8-24b0ccc1b119@suse.com>
In-Reply-To: <6c9fa2e7-5c02-102f-74f8-24b0ccc1b119@suse.com>
Date: Fri, 6 Mar 2020 13:25:09 -0000
Message-ID: <008f01d5f3ba$a8e9d120$fabd7360$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV86zPcz0SNzMCl02V4cFdHsApB6g7dx1AgAAMGICAAACBgIAACPI7gAAAviA=
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
aEBzdXNlLmNvbT4KPiBTZW50OiAwNiBNYXJjaCAyMDIwIDEzOjE5Cj4gVG86IFBhdWwgRHVycmFu
dCA8eGFkaW1nbmlrQGdtYWlsLmNvbT4KPiBDYzogcGR1cnJhbnRAYW16bi5jb207IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgJ0FuZHJldyBDb29wZXInIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsKPiAnR2VvcmdlIER1bmxhcCcgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47
ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz47ICdSb2dlciBQYXUgTW9ubsOpJwo+IDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW0VYVEVSTkFMXVtQQVRDSCB2MyAyLzZdIHg4NiAv
IHAybTogcmVtb3ZlIHBhZ2VfbGlzdCBjaGVjayBpbiBwMm1fYWxsb2NfdGFibGUKPiAKPiBPbiAw
Ni4wMy4yMDIwIDE0OjExLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Pj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMzowNwo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+Cj4gPj4gQ2M6IHBkdXJyYW50QGFtem4uY29tOyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Owo+ID4+IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpCj4gPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+ID4+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdW1BBVENIIHYzIDIvNl0geDg2IC8gcDJt
OiByZW1vdmUgcGFnZV9saXN0IGNoZWNrIGluIHAybV9hbGxvY190YWJsZQo+ID4+Cj4gPj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0
aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbgo+ID4+IGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+
ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIDA2LjAzLjIwMjAgMTM6NTAsIER1cnJhbnQsIFBhdWwgd3Jv
dGU6Cj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+Pj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMjo0
Nwo+ID4+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiA+Pj4+
IENjOiBwZHVycmFudEBhbXpuLmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsKPiA+Pj4+IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBS
b2dlciBQYXUgTW9ubsOpCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAyLzZdIHg4NiAvIHAybTogcmVtb3ZlIHBhZ2VfbGlzdCBjaGVjayBp
biBwMm1fYWxsb2NfdGFibGUKPiA+Pj4+Cj4gPj4+PiBPbiAwNi4wMy4yMDIwIDEzOjA3LCBEdXJy
YW50LCBQYXVsIHdyb3RlOgo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+
Pj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4+Pj4+IFNlbnQ6
IDA2IE1hcmNoIDIwMjAgMTE6NDYKPiA+Pj4+Pj4gVG86IHBkdXJyYW50QGFtem4uY29tCj4gPj4+
Pj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwgPHBk
dXJyYW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXIKPiA+Pj4+Pj4gPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsKPiA+PiBSb2dlcgo+ID4+Pj4gUGF1Cj4gPj4+Pj4+IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMi82XSB4ODYgLyBwMm06IHJlbW92ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2FsbG9jX3Rh
YmxlCj4gPj4+Pj4+Cj4gPj4+Pj4+IE9uIDA1LjAzLjIwMjAgMTM6NDUsIHBkdXJyYW50QGFtem4u
Y29tIHdyb3RlOgo+ID4+Pj4+Pj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoZXJlIGRvZXMgbm90IHNlZW0gdG8gYmUgYW55IGp1
c3RpZmljYXRpb24gZm9yIHJlZnVzaW5nIHRvIGNyZWF0ZSB0aGUKPiA+Pj4+Pj4+IGRvbWFpbidz
IHAybSB0YWJsZSBzaW1wbHkgYmVjYXVzZSBpdCBtYXkgaGF2ZSBhc3NpZ25lZCBwYWdlcy4KPiA+
Pj4+Pj4KPiA+Pj4+Pj4gSSB0aGluayB0aGVyZSBpczogSWYgYW55IHN1Y2ggYWxsb2NhdGlvbiBo
YWQgaGFwcGVuZWQgYmVmb3JlLCBob3cKPiA+Pj4+Pj4gd291bGQgaXQgYmUgcmVwcmVzZW50ZWQg
aW4gdGhlIGRvbWFpbidzIHAybT8KPiA+Pj4+Pgo+ID4+Pj4+IEluc2VydGlvbiBpbnRvIHRoZSBw
Mm0gaXMgYSBzZXBhcmF0ZSBhY3Rpb24gZnJvbSBwYWdlIGFsbG9jYXRpb24uIFdoeSBzaG91bGQg
dGhleSBiZSBsaW5rZWQ/Cj4gPj4+Pgo+ID4+Pj4gVGhleSBhcmUsIGJlY2F1c2Ugb2YgaG93IFhF
Tk1FTV9wb3B1bGF0ZV9waHlzbWFwIHdvcmtzLiBZZXMsCj4gPj4+PiB0aGV5IF9jb3VsZF8gYmUg
c2VwYXJhdGUgc3RlcHMsIGJ1dCB0aGF0J3Mgb25seSBhIHRoZW9yZXRpY2FsCj4gPj4+PiBjb25z
aWRlcmF0aW9uLgo+ID4+Pgo+ID4+PiBUaGVuIHN1cmVseSB0aGUgY2hlY2sgc2hvdWxkIGJlIGlu
IHRoZSBYRU5NRU1fcG9wdWxhdGVfcGh5c21hcCBjb2RlPwo+ID4+Cj4gPj4gSG93IHRoYXQ/IHBv
cHVsYXRlLXBoeXNtYXAgY2FuIGJlIGNhbGxlZCBhbnkgbnVtYmVyIG9mIHRpbWVzLiBXZQo+ID4+
IGNhbid0IHJlZnVzZSBhIDJuZCBjYWxsIHRoZXJlIGp1c3QgYmVjYXVzZSBhIDFzdCBvbmUgaGFk
IGhhcHBlbmVkCj4gPj4gYWxyZWFkeS4gT3IgZGlkIHlvdSBtZWFuIHRoZSBpbnZlcnNlIGNoZWNr
IChpLmUuIHRoYXQgdGhlcmUKPiA+PiBhbHJlYWR5IGlzIGEgcDJtKT8KPiA+Cj4gPiBZZXMsIEkg
bWVhbiBjaGVjayB0aGUgcDJtIGhhcyBiZWVuIGluaXRpYWxpemVkIHRoZXJlLgo+ID4KPiA+PiBU
aGlzIHN1cmVseSB3b3VsZG4ndCBiZSBhIGJhZCBpZGVhLCBhcwo+ID4+IG90aGVyd2lzZSBib3Ro
IGVwdF9nZXRfZW50cnkoKSBhbmQgcDJtX3B0X2dldF9lbnRyeSgpIHdvdWxkCj4gPj4gYmxpbmRs
eSBtYXAgTUZOIDAuIEJ1dCBhZGRpbmcgc3VjaCBhIGNoZWNrIHdvdWxkbid0IGVsaW1pbmF0ZQo+
ID4+IHRoZSByZWFzb24gdG8gYWxzbyBoYXZlIHRoZSBjaGVjayB0aGF0IHlvdSdyZSBwcm9wb3Np
bmcgdG8gZHJvcC4KPiA+Pgo+ID4KPiA+IFdoeSBub3Q/IEFueXdoZXJlIGFzc3VtaW5nIHRoZSBl
eGlzdGVuY2Ugb2YgYSBwMm0gb3VnaHQgdG8gY2hlY2sKPiA+IGZvciBpdDsKPiAKPiBBcyBzYWlk
IC0gSSBhZ3JlZSB0aGlzIHdvdWxkbid0IGJlIGEgYmFkIHRoaW5nIHRvIGRvLiBJdCB3b3VsZAo+
IGJlIGEgcmVxdWlyZW1lbnQgaWYgcGFnaW5nX2VuYWJsZSgpIHdhc24ndCBjYWxsZWQgZnJvbQo+
IGh2bV9kb21haW5faW5pdGlhbGlzZSgpLCBidXQgdmlhIGEgZGlzdGluY3QgZG9tY3RsLiBCdXQg
c2luY2UKPiBpdCBpcywgdGhlcmUncyBubyB3YXkgdG8gaW52b2tlIHBvcHVsYXRlLXBoeXNtYXAg
b24gYSBkb21haW4KPiB3aXRob3V0IGl0cyBwMm0gcm9vdCB0YWJsZSBhbHJlYWR5IGFsbG9jYXRl
ZC4KPiAKPiA+IEkgc3RpbGwgY2FuJ3Qgc2VlIHdoeSBpbml0aWFsaXNpbmcgdGhlIHAybSBhZnRl
ciBoYXZpbmcgYWxsb2NhdGVkCj4gPiBwYWdlcyAoUEdDX2V4dHJhIG9yIG90aGVyd2lzZSkgaXMg
aW5oZXJlbnRseSB3cm9uZy4KPiAKPiAiaW5oZXJlbnRseSIgYXMgaW4gImZyb20gYW4gYWJzdHJh
Y3QgcG92IiAtIHllcy4gQnV0IHdpdGhpbiB0aGUKPiBjb25zdHJhaW50cyBvZiB0aGUgaHlwZXJj
YWxscyBhdmFpbGFibGUgLSBuby4gWWV0IHdoYXQgZ2V0cwo+IGNoZWNrZWQgaGFzIHRvIGJlIG9m
IHByYWN0aWNhbCB1c2UsIG5vdCBqdXN0IG9mIHRoZW9yZXRpY2FsIG9uZS4KPiBJLmUuIEknZCBi
ZSBmaW5lIHRvIHNlZSB0aGUgY2hlY2sgZ28gYXdheSB3aGVuIGEgdmlhYmxlCj4gYWx0ZXJuYXRp
dmUgbWVjaGFuaXNtIHRvIGFsbG9jYXRlIGFuZCBfdGhlbl8gcG9wdWxhdGUgcDJtIGdldHMKPiBp
bnRyb2R1Y2VkLgo+IAoKT0suLi4gaXQgc3RpbGwgc2VlbXMgbGlrZSB0aGUgd3JvbmcgcGxhY2Ug
dG8gbWUsIGJ1dCBJJ2xsIGxlYXZlIHRoZSBjaGVjayBhbmQgc2ltcGx5IGV4Y2x1ZGUgUEdHX2V4
dHJhIHBhZ2VzLgoKICBQYXVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
