Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79F1625DB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:59:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41VB-00047R-6S; Tue, 18 Feb 2020 11:57:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj48=4G=amazon.co.uk=prvs=310c99ada=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j41VA-00047M-Cd
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:57:20 +0000
X-Inumbo-ID: d0d32d0a-5245-11ea-ade5-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0d32d0a-5245-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582027040; x=1613563040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XLQln2qMQ2TswKEaKGilnG4vUMpdWGTiyaalhdFU2tA=;
 b=s/0GEsw7Uo6i4K5caBeYR+ncskfl+Y7dCWkl7Jw2je3pHwW5vgm7FWTg
 EUg2R/pEhiyrCxixgA7Xp71jeAHN/xoi5prJTq1Q9en2mms2VLvsFVUW1
 oAz4JV2kpUg/mLJPAmUMN3j72tCCvgbQ1YtnFqgvlXkk5ixIDnEirfRSG o=;
IronPort-SDR: rgtt9XbQMTLYuJY1q/VCxDPVw4+lzBHou9VOyCcKpQgJqfNeCrUUMYlnQy8tWLKfJCVZctmPtQ
 +LnlbkwNqyyg==
X-IronPort-AV: E=Sophos;i="5.70,456,1574121600"; d="scan'208";a="18263024"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 18 Feb 2020 11:57:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id BEDEBA1F8A; Tue, 18 Feb 2020 11:57:03 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 18 Feb 2020 11:57:03 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Feb 2020 11:57:02 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 18 Feb 2020 11:57:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v5 5/7] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHV2EdkLYnXyHJB5UGgi2AWokWodagfxTaAgAEEvfCAAB9oAIAAAZGggAAG+QCAAAIhAA==
Date: Tue, 18 Feb 2020 11:57:01 +0000
Message-ID: <2c3e8b5eeb124e349fdeda3c5ef5c0c3@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-6-pdurrant@amazon.com>
 <24138.53923.699587.944099@mariner.uk.xensource.com>
 <78ccdd687a344eaf92ed8c978dc04f3c@EX13D32EUC003.ant.amazon.com>
 <24139.51124.66017.255351@mariner.uk.xensource.com>
 <39fbefb0489942e498dfe20695021275@EX13D32EUC003.ant.amazon.com>
 <24139.52958.979063.189567@mariner.uk.xensource.com>
In-Reply-To: <24139.52958.979063.189567@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 5/7] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE4IEZlYnJ1YXJ5IDIwMjAgMTE6NDgKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZAo+IDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47Cj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsKPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Owo+IEphc29uIEFu
ZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDUvN10g
bGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhCj4gc3BlY2lmaWVkIG9yIHJh
bmRvbSBkb21pZAo+IAo+IER1cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtQQVRDSCB2NSA1Lzdd
IGxpYnhsOiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5zCj4gd2l0aCBhIHNwZWNpZmllZCBvciBy
YW5kb20gZG9taWQiKToKPiA+IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgo+
ID4gPiBTb3JyeSBpZiBJIHdhcyBjb25mdXNlZDsgSSB3aWxsIHJlYWQgdGhpcyBhZ2Fpbi4KPiA+
Cj4gPiBJdCBpcyBoYXJkIHRvIGZvbGxvdyB0aGUgZXJyb3IgcGF0aHMuIEVhcmx5IG9uIGluIGRl
dmVsb3BtZW50IEkgZW5kZWQgdXAKPiB3aXRoIGRvbWFpbnMgZ2V0dGluZyBkZXN0cm95ZWQgd2hl
biBJIGRpZG4ndCB3YW50IHRoZW0gdG8gYmUgKHdoZW4KPiB4Y19kb21haW5fY3JlYXRlKCkgZmFp
bGVkIGR1ZSB0byBhIGR1cGxpY2F0ZSBkb21pZCkuCj4gCj4gSGF2aW5nIHJlYWQgdGhlIHBhdGNo
IGFnYWluLCBJIHN1Z2dlc3QgdGhlIGZvbGxvd2luZyBkaXNjaXBsaW5lICh3aGljaAo+IGlzIGFs
b25nIHRoZSBsaW5lcyBjb250ZW1wbGF0ZWQgYnkgQ09EWUlOR19TVFlMRSk6Cj4gCj4gVGhlIGxv
Y2FsIHZhcmlhYmxlIGBkb21pZCcgY29udGFpbnMgb25seSBhIGRvbWlkIHdlIGFyZSB0cnlpbmcg
dG8KPiBjcmVhdGUgYW5kIGRvZXMgbm90IGNvbnN0aXR1dGUgYSAibG9jYWwgW3ZhcmlhYmxlXSBy
ZWZlcnJpbmcgdG8KPiByZXNvdXJjZXMgd2hpY2ggbWlnaHQgbmVlZCBjbGVhbmluZyB1cCIgKGlu
IHRoZSB3b3JkcyBvZgo+IENPRElOR19TVFlMRSkuICBUaGVyZWZvcmUgaXQgc2hvdWxkIG5ldmVy
IGJlIHBhc3NlZCB0byBkZXN0cm95Lgo+IE1heWJlIGl0IHNob3VsZCBiZSBjYWxsZWQgYHByb3Nw
ZWN0aXZlX2RvbWlkJy4KPiAKPiBUaGUgdmFyaWFibGUgKmRvbWlkIF9pc18gYSAibG9jYWwgW3Zh
cmlhYmxlXSByZWZlcnJpbmcgdG8gcmVzb3VyY2VzCj4gd2hpY2ggbWlnaHQgbmVlZCBjbGVhbmlu
ZyB1cCIuICBUaGVyZWZvcmUgaXQgbXVzdCBvbmx5IGV2ZXIgY29udGFpbiBhCj4gZG9tYWluIHdo
aWNoIGFjdHVhbGx5IGV4aXN0cy4gIEl0IHNob3VsZCBiZSBzZXQgZnJvbSBwcm9zcGVjdGl2ZV9k
b21pZAo+IHdoZW4geGNfZG9tYWluX2NyZWF0ZSBzdWNjZWVkcywgYW5kIGNsZWFyZWQgKHNldCBi
YWNrIHRvIElOVkFMSUQpIHdoZW4KPiB4Y19kb21haW5fZGVzdHJveSBzdWNjZWVkcyBpbiBvdXIg
cmV0cnkgbG9vcC4KPiAKPiBUaGF0IHdheSBhbnkgYGdvdG8gb3V0JyBhbnl3aGVyZSB3aWxsIGNs
ZWFyIHVwIGEgZG9tYWluIGlmZiB0aGVyZSBpcwo+IG9uZSB0byBjbGVhciB1cC4KPiAKPiBUaGVy
ZSBpcyBhIGh1bmsgaW4gdGhpcyBwYXRjaCB3aGljaCBJIHRoaW5rIGlzIGluY29tcGF0aWJsZSB3
aXRoIHRoaXMKPiBkaXNjaXBsaW5lOgo+IAo+ICAgLSAgICBhc3NlcnQoc29mdF9yZXNldCB8fCAq
ZG9taWQgPT0gSU5WQUxJRF9ET01JRCk7Cj4gICAtCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdo
YXQgdGhpcyBodW5rIGlzIGZvci4gIElmIHdlIGFkb3B0IHRoZSBkaXNjaXBsaW5lCj4gSSBzdWdn
ZXN0LCBjYW4gaXQgZ28gYXdheSA/CgpPaywgSSdsbCBnaXZlIHRoYXQgYSB0cnkuIEl0J3MgcG9z
c2libGUgdGhpbmdzIGFyZSBzdWZmaWNpZW50bHkgY29tcGxleCB0aGF0IGEgc3ViLWZ1bmN0aW9u
IG1heSBiZSBhcHByb3ByaWF0ZSwgd2hpY2ggc2hvdWxkIGFsc28gYWNoaWV2ZSB0aGUgbG9jYWxp
emF0aW9uLgoKICBQYXVsCgo+IAo+IElhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
