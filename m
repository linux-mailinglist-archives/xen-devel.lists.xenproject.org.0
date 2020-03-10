Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6A1180159
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:15:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgZb-0006rY-D7; Tue, 10 Mar 2020 15:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBgZZ-0006rL-Qo
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:13:33 +0000
X-Inumbo-ID: b4b0d5c6-62e1-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4b0d5c6-62e1-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 15:13:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h62so16744684edd.12
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=0fOvlu6sP0Wv6WLFCRz84PA3cenGoKGNaTAj8Xb+FHo=;
 b=LJPyyXi8hQ0qhaZpZ27HlgWa7lmr2ChtFpCI9nXvZDViPmI7xoXKoKoz5hOekxmRd1
 YFjPEr6HDLtagfWMPPrirBXuJS1ROe8Js8gokep9OAx+yjnKCq2OZgLd9dFpTxeT4BlW
 b8ZYDaLgfhdIxhPfgee5Gcxm9YSU/sc81F66kIX+PZcp/PzpR7AJBNMzTb+5F5XzXU+J
 NK4glKRY76yaG4TAe1PYNcuxNvQd+MIaOLndFlvRnUGZHR8h0Di0eubGdGuEAbTvexCA
 Mm0D2u9YqcmbSBnbY/NEGJLP/TcjcG9qOBUHiMr5wdCn4gFoxFn+khLvIsavhM/hGBVa
 nX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=0fOvlu6sP0Wv6WLFCRz84PA3cenGoKGNaTAj8Xb+FHo=;
 b=nL8Tnng2oNmDuDpcxXKgg07D7b00l8VfOYTSzQccEaRjt+DIk+y00i9VZ5BYrl1Nca
 mWYXXzTl6F7koSBsgm6qtf9K5awvSXzM7eHhg05m5zOYnwdB7fpoft4QnIHEjsefpuhm
 M2E8+ysh70btJFtPdGZoKppolMedyPDWN9u/iVKnRtKhdvu8iKdF7Zxrb6NBpWTS/bh9
 nmMnO4y5tg3Cl13OUEEXTCH5Iu9FHk8i+G+U/RBM+4C0s9IRq4EGowmPZIRv06pbl4+B
 pEY5Rz0Q0ukSkSP7uHTemg301upsBUHPtOpGJDlzwuN2YLT/xERsuNgah4ht6P4rewgK
 c4tQ==
X-Gm-Message-State: ANhLgQ0CJd/nind2NzuO5Q7Gj70JriTWPgbooPxBkNps0jqFzdk7yyG+
 7f5IFDYXu4VLmOTe4Egfzdk=
X-Google-Smtp-Source: ADFU+vszPjukXF5+4ORxwaHiJ7UaBXEh9+te/+48URRa5WD3i3fKous9EdbJbWZtH21Ng0yXQz4JCw==
X-Received: by 2002:a17:906:6483:: with SMTP id
 e3mr1467470ejm.284.1583853212315; 
 Tue, 10 Mar 2020 08:13:32 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id g4sm2436121ejh.47.2020.03.10.08.13.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 08:13:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
 <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
 <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
In-Reply-To: <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
Date: Tue, 10 Mar 2020 15:13:31 -0000
Message-ID: <002e01d5f6ee$75e09700$61a1c500$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJZoBACz6CdVNlWCO6Kdq3kziJjnAF185EEAMB17mkBaZvhrgKeHsAlpwipoMA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: xen-devel@lists.xenproject.org, "'Tian, Kevin'" <kevin.tian@intel.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE1OjA1Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiAnVGlhbiwgS2V2aW4nIDxrZXZpbi50aWFuQGludGVsLmNvbT47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgJ0FuZHJldyBDb29wZXInCj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gSU9NTVU6IG1ha2UgRE1BIGNvbnRh
aW5tZW50IG9mIHF1YXJhbnRpbmVkIGRldmljZXMgb3B0aW9uYWwKPiAKPiBPbiAxMC4wMy4yMDIw
IDEzOjMwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gU2VudDog
MTAgTWFyY2ggMjAyMCAxMDoyNwo+ID4+IFRvOiBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiA+PiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIElPTU1VOiBtYWtlIERNQSBjb250YWlu
bWVudCBvZiBxdWFyYW50aW5lZCBkZXZpY2VzIG9wdGlvbmFsCj4gPj4KPiA+PiBPbiAxMC4wMy4y
MDIwIDA0OjQzLCBUaWFuLCBLZXZpbiB3cm90ZToKPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggOSwgMjAyMCA3OjA5
IFBNCj4gPj4+Pgo+ID4+Pj4gSSdtIGhhcHB5IHRvIHRha2UgYmV0dGVyIHN1Z2dlc3Rpb25zIHRv
IHJlcGxhY2UgdGhlICJmdWxsIiBjb21tYW5kIGxpbmUKPiA+Pj4+IG9wdGlvbiBhbmQgS2NvbmZp
ZyBwcm9tcHQgdG9rZW5zLiBJIGRvbid0IHRoaW5rIHRob3VnaCB0aGF0ICJmYXVsdCIgYW5kCj4g
Pj4+PiAid3JpdGUtZmF1bHQiIGFyZSByZWFsbHkgc3VpdGFibGUgdGhlcmUuCj4gPj4+Cj4gPj4+
IEkgdGhpbmsgd2UgbWF5IGp1c3QgYWxsb3cgYm90aCByL3cgYWNjZXNzIHRvIHNjcmF0Y2ggcGFn
ZSBmb3Igc3VjaCBib2d1cwo+ID4+PiBkZXZpY2UsIHdoaWNoIG1heSBtYWtlICdmdWxsJyBtb3Jl
IHJlYXNvbmFibGUgc2luY2Ugd2Ugbm93IGZ1bGx5Cj4gPj4+IGNvbnRhaW4gaW4tZmx5IERNQXMu
IEknbSBub3Qgc3VyZSBhYm91dCB0aGUgdmFsdWUgb2Yga2VlcGluZyB3cml0ZS1mYXVsdAo+ID4+
PiBhbG9uZSBmb3Igc3VjaCBkZXZpY2VzIChqdXN0IGJlY2F1c2Ugb25lIG9ic2VydmVkIGhpcyBz
cGVjaWZpYyBkZXZpY2Ugb25seQo+ID4+PiBoYXMgcHJvYmxlbSB3aXRoIHJlYWQtZmF1bHQpLgo+
ID4+Cj4gPj4gV2VsbCwgYSBmdW5kYW1lbnRhbCBwcm9ibGVtIEkgaGF2ZSBoZXJlIGlzIHRoYXQg
SSBzdGlsbCBkb24ndCBrbm93Cj4gPj4gdGhlIF9leGFjdF8gY29uZGl0aW9ucyBmb3IgdGhlIG9i
c2VydmVkIGhhbmdzLiBJIGNvbnNpZGVyIGl0IHVubGlrZWx5Cj4gPj4gZm9yIElPTU1VIHJlYWQg
ZmF1bHRzIHRvIGNhdXNlIGhhbmdzLCBidXQgZm9yIHdyaXRlIGZhdWx0cyB0byBiZQo+ID4+ICJm
aW5lIi4KPiA+Cj4gPiBBRkFJSyBpdCdzIGJlY2F1c2UgdGhlIHdyaXRlcyBhcmUgcG9zdGVkIGFu
ZCBzbyBhbnkgZmF1bHRzIGFyZSBqdXN0IGlnbm9yZWQsIHdoZXJlYXMgYSByZWFkIGZhdWx0Cj4g
YmVpbmcgc3luY2hyb25vdXMgY2F1c2VzIHRoZSBkZXZpY2UncyBzdGF0ZSBtYWNoaW5lIHRvIGxv
Y2sgdXAuIEl0IHJlYWxseSBpcyBvYnNlcnZlZCBiZWhhdmlvdXIuCj4gPgo+ID4+IEl0IHdvdWxk
IHNlZW0gbW9yZSBsaWtlbHkgdG8gbWUgdGhhdCBlLmcuIGEgbm9uLXByZXNlbnQKPiA+PiBjb250
ZXh0IGVudHJ5IG1pZ2h0IGNhdXNlIGlzc3Vlcy4gSWYgdGhhdCB3YXMgdGhlIGNhc2UsIHdlIHdv
dWxkbid0Cj4gPj4gbmVlZCB0byBoYW5kbGUgcmVhZHMgYW5kIHdyaXRlcyBkaWZmZXJlbnRseTsg
d2UgY291bGQgaW5zdGVhZCBpbnN0YWxsCj4gPj4gYW4gYWxsIHplcm8gdG9wIGxldmVsIHBhZ2Ug
dGFibGUuIEFuZCB3ZSdkIHN0aWxsIGdldCBhbGwgZmF1bHRzIHRoYXQKPiA+PiBhcmUgc3VwcG9z
ZWQgdG8gc3VyZmFjZS4gQnV0IHBlcmhhcHMgUGF1bCBkaWQgdHJ5IHRoaXMgYmFjayB0aGVuLCBh
bmQKPiA+PiBpdCB0dXJuZWQgb3V0IHRvIG5vdCBiZSBhbiBvcHRpb24uCj4gPj4KPiA+Cj4gPiBU
aGUgb25seSBpbmZvIEkgaGFkIHdhcyB0aGF0IGZhdWx0cyBvbiBETUEgcmVhZHMgaGFkIHRvIGF2
b2lkZWQKPiA+IGNvbXBsZXRlbHkuIEkgZGlkIG5vdCBoYXZlIGFjY2VzcyB0byB0aGUgaC93IGlu
IHF1ZXN0aW9uIGF0IHRoZQo+ID4gdGltZS4gSSBtYXkgYmUgYWJsZSB0byBnZXQgaXQgbm93Lgo+
IAo+IEkgc2VlLiBUaGUgaW1wbGljYXRpb24gdGhlbiBpcywgYXMgS2V2aW4gc2FpZCwgdGhhdCB3
ZSBtdXN0bid0IHJ1bgo+IGd1ZXN0cyB3aXRoIF9hbnlfIElPTU1VIFBURXMgaGF2aW5nIHRoZWly
ICJyZWFkIiBiaXRzIGNsZWFyLgo+IEFueXRoaW5nIHRoYXQncyAibm90IHByZXNlbnQiIG5vdyB3
b3VsZCBuZWVkIGRpcmVjdGluZyB0byBhIHNjcmF0Y2gKPiBwYWdlLiBJIHRoZW4gZnVydGhlciB3
b25kZXIgd2hhdCBlZmZlY3QgcmVhZHMgdG8gYWRkcmVzc2VzIGJleW9uZAo+IEFHQVcgd291bGQg
aGF2ZS4gSXQgbWF5IGJlIGltcG9zc2libGUgdG8gYXJyYW5nZSBmb3Igc3VmZmljaWVudGx5Cj4g
c2VjdXJlIHBhc3MtdGhyb3VnaCB3aXRoIHN1Y2ggYSBkZXZpY2UsIGF0IHdoaWNoIHBvaW50IC0g
YWdhaW4gYXMKPiBzYWlkIGJ5IEtldmluIC0gdGhlcmUgbWF5IGJlIGxpdHRsZSBwb2ludCBpbiB0
aGUgc2NyYXRjaCBwYWdlCj4gYmFzZWQgcXVhcmFudGluaW5nLgo+IAoKV2VsbCwgSSBjYW4ndCBz
YXkgdGhlcmUncyBsaXR0bGUgcG9pbnQgaW4gaXQgYXMgaXQgZG9lcyBmaXggYSBob3N0IGxvY2st
dXAuCgpZb3Ugc2F5ICJhcyBLZXZpbiBzYWlkLCB0aGF0IHdlIG11c3RuJ3QgcnVuIGd1ZXN0cyB3
aXRoIF9hbnlfIElPTU1VIFBURXMgaGF2aW5nIHRoZWlyICJyZWFkIiBiaXRzIGNsZWFyIi4uLiBJ
IGNhbid0IGZpbmQgdGhhdC4gSSBkaWQgZmluZCB3aGVyZSBoZSBzYWlkICJJbiBjb25jZXB0IGFu
eSBJT01NVSBwYWdlIHRhYmxlIChkb20wLCBkb21faW8gb3IgZG9tVSkgZm9yIHN1Y2ggYm9ndXMg
ZGV2aWNlIHNob3VsZCBub3QgaW5jbHVkZSBpbnZhbGlkIGVudHJ5IiwgYnV0IHRoYXQncyBhIGRp
ZmZlcmVudCB0aGluZy4gSG93ZXZlciwgaXMgYSByZWFsbHkgc2F5aW5nIHRoYXQgdGhpbmdzIHdp
bGwgYnJlYWsgaWYgYW55IG9mIHRoZSBQVEVzIGhhcyB0aGVpciBwcmVzZW50IGJpdCBjbGVhcj8K
CiAgUGF1bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
