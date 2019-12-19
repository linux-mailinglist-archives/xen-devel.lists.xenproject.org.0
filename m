Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB2126654
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 17:01:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihyCR-0005PL-W7; Thu, 19 Dec 2019 15:58:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihyCQ-0005PG-VV
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 15:58:51 +0000
X-Inumbo-ID: 6daf71cc-2278-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6daf71cc-2278-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 15:58:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576771122; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=vBOCJzd612Byv5y8yhkDiX9Yddy+RxYMLm3JYvSt/Ds=;
 b=jI6JizbidOjtVjXRRUAgi/cnCs1vmPpsveDkFgbKhf0zZgGeEdfy/prVEUGGs36qymKdfKGM
 V55Z03umCrEe+K4IlBdlpmj/oo9wTjl5HqU3puuzPVT8+j7sgm1jEd0X8dAwqoJEgT51At/b
 2shenHyknb4e0CiCV4zFw8pCHiM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mxa.mailgun.org with ESMTP id 5dfb9e30.7f4dbfdf5970-smtp-out-n02;
 Thu, 19 Dec 2019 15:58:40 -0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p17so6177412wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 07:58:39 -0800 (PST)
X-Gm-Message-State: APjAAAXsqDMPnZv4IfFBKbqa+qL8fFlYAUMW5MfV3urdZnXYXa2X2mXP
 ZWWCFSWEa1eJT0nKFxQH9iE5owLqlqJM7CVzYdE=
X-Google-Smtp-Source: APXvYqw2oQGNGrmSVbKKZQrGCtxSMxzUlHN9VOima7wEjhUihNUksjWjgfTiRRVV34eUnaSdTI+sI/GU+EQvK2a+pDM=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr11484188wme.125.1576771118213; 
 Thu, 19 Dec 2019 07:58:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
In-Reply-To: <20191219094814.GB11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 08:58:01 -0700
X-Gmail-Original-Message-ID: <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
Message-ID: <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Julien Grall <julien@xen.org>, Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMjo0OCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAxOCwgMjAxOSBhdCAxMTo0MDoz
N0FNIC0wODAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBUaGUgZm9sbG93aW5nIHNlcmll
cyBpbXBsZW1lbnRzIFZNIGZvcmtpbmcgZm9yIEludGVsIEhWTSBndWVzdHMgdG8gYWxsb3cgZm9y
Cj4gPiB0aGUgZmFzdCBjcmVhdGlvbiBvZiBpZGVudGljYWwgVk1zIHdpdGhvdXQgdGhlIGFzc29z
Y2lhdGVkIGhpZ2ggc3RhcnR1cCBjb3N0cwo+ID4gb2YgYm9vdGluZyBvciByZXN0b3JpbmcgdGhl
IFZNIGZyb20gYSBzYXZlZmlsZS4KPiA+Cj4gPiBKSVJBIGlzc3VlOiBodHRwczovL3hlbnByb2pl
Y3QuYXRsYXNzaWFuLm5ldC9icm93c2UvWEVOLTg5Cj4gPgo+ID4gVGhlIG1haW4gZGVzaWduIGdv
YWwgd2l0aCB0aGlzIHNlcmllcyBoYXMgYmVlbiB0byByZWR1Y2UgdGhlIHRpbWUgb2YgY3JlYXRp
bmcKPiA+IHRoZSBWTSBmb3JrIGFzIG11Y2ggYXMgcG9zc2libGUuIFRvIGFjaGlldmUgdGhpcyB0
aGUgVk0gZm9ya2luZyBwcm9jZXNzIGlzCj4gPiBzcGxpdCBpbnRvIHR3byBzdGVwczoKPiA+ICAg
ICAxKSBmb3JraW5nIHRoZSBWTSBvbiB0aGUgaHlwZXJ2aXNvciBzaWRlOwo+ID4gICAgIDIpIHN0
YXJ0aW5nIFFFTVUgdG8gaGFuZGxlIHRoZSBiYWNrZWQgZm9yIGVtdWxhdGVkIGRldmljZXMuCj4g
Pgo+ID4gU3RlcCAxKSBpbnZvbHZlcyBjcmVhdGluZyBhIFZNIHVzaW5nIHRoZSBuZXcgInhsIGZv
cmstdm0iIGNvbW1hbmQuIFRoZQo+ID4gcGFyZW50IFZNIGlzIGV4cGVjdGVkIHRvIHJlbWFpbiBw
YXVzZWQgYWZ0ZXIgZm9ya3MgYXJlIGNyZWF0ZWQgZnJvbSBpdCAod2hpY2gKPiA+IGlzIGRpZmZl
cmVudCB0aGVuIHdoYXQgcHJvY2VzcyBmb3JraW5nIG5vcm1hbGx5IGVudGFpbHMpLiBEdXJpbmcg
dGhpcyBmb3JraW5nCj4gICAgICAgICAgICAgICAgXiB0aGFuCj4gPiBvcGVyYXRpb24gdGhlIEhW
TSBjb250ZXh0IGFuZCBWTSBzZXR0aW5ncyBhcmUgY29waWVkIG92ZXIgdG8gdGhlIG5ldyBmb3Jr
ZWQgVk0uCj4gPiBUaGlzIG9wZXJhdGlvbiBpcyBmYXN0IGFuZCBpdCBhbGxvd3MgdGhlIGZvcmtl
ZCBWTSB0byBiZSB1bnBhdXNlZCBhbmQgdG8gYmUKPiA+IG1vbml0b3JlZCBhbmQgYWNjZXNzZWQg
dmlhIFZNSS4gTm90ZSBob3dldmVyIHRoYXQgd2l0aG91dCBpdHMgZGV2aWNlIG1vZGVsCj4gPiBy
dW5uaW5nIChkZXBlbmRpbmcgb24gd2hhdCBpcyBleGVjdXRpbmcgaW4gdGhlIFZNKSBpdCBpcyBi
b3VuZCB0bwo+ID4gbWlzYmVoYXZlL2NyYXNoIHdoZW4gaXRzIHRyeWluZyB0byBhY2Nlc3MgZGV2
aWNlcyB0aGF0IHdvdWxkIGJlIGVtdWxhdGVkIGJ5Cj4gPiBRRU1VLiBXZSBhbnRpY2lwYXRlIHRo
YXQgZm9yIGNlcnRhaW4gdXNlLWNhc2VzIHRoaXMgd291bGQgYmUgYW4gYWNjZXB0YWJsZQo+ID4g
c2l0dWF0aW9uLCBpbiBjYXNlIGZvciBleGFtcGxlIHdoZW4gZnV6emluZyBpcyBwZXJmb3JtZWQg
b2YgY29kZSBzZWdtZW50cyB0aGF0Cj4gPiBkb24ndCBhY2Nlc3Mgc3VjaCBkZXZpY2VzLgo+ID4K
PiA+IFN0ZXAgMikgaW52b2x2ZXMgbGF1bmNoaW5nIFFFTVUgdG8gc3VwcG9ydCB0aGUgZm9ya2Vk
IFZNLCB3aGljaCByZXF1aXJlcyB0aGUKPiA+IFFFTVUgWGVuIHNhdmVmaWxlIHRvIGJlIGdlbmVy
YXRlZCBtYW51YWxseSBmcm9tIHRoZSBwYXJlbnQgVk0uIFRoaXMgY2FuIGJlCj4gPiBhY2NvbXBs
aXNoZWQgc2ltcGx5IGJ5IGNvbm5lY3RpbmcgdG8gaXRzIFFNUCBzb2NrZXQgYW5kIGlzc3Vpbmcg
dGhlCj4gPiAieGVuLXNhdmUtZGV2aWNlcy1zdGF0ZSIgY29tbWFuZCBhcyBkb2N1bWVudGVkIGJ5
IFFFTVU6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2Jsb2IvbWFzdGVyL2RvY3Mv
eGVuLXNhdmUtZGV2aWNlcy1zdGF0ZS50eHQKPiA+IE9uY2UgdGhlIFFFTVUgWGVuIHNhdmVmaWxl
IGlzIGdlbmVyYXRlZCB0aGUgbmV3ICJ4bCBmb3JrLWxhdW5jaC1kbSIgY29tbWFuZCBpcwo+ID4g
dXNlZCB0byBsYXVuY2ggUUVNVSBhbmQgbG9hZCB0aGUgc3BlY2lmaWVkIHNhdmVmaWxlIGZvciBp
dC4KPgo+IElNTyBoYXZpbmcgdHdvIGRpZmZlcmVudCBjb21tYW5kcyBpcyBjb25mdXNpbmcgZm9y
IHRoZSBlbmQgdXNlciwgSQo+IHdvdWxkIHJhdGhlciBoYXZlIHNvbWV0aGluZyBsaWtlOgo+Cj4g
eGwgZm9yay12bSBbLWRdIC4uLgo+Cj4gV2hlcmUgJy1kJyB3b3VsZCBwcmV2ZW50IGZvcmtpbmcg
YW55IHVzZXItc3BhY2UgZW11bGF0b3JzLiBJIGRvbid0Cj4gdGhpbmtzIHRoZXJlJ3MgYSBuZWVk
IGZvciBhIHNlcGFyYXRlIGNvbW1hbmQgdG8gZm9yayB0aGUgdW5kZXJseWluZwo+IHVzZXItc3Bh
Y2UgZW11bGF0b3JzLgoKS2VlcGluZyBpdCBhcyB0d28gY29tbWFuZHMgYWxsb3dzIHlvdSB0byBz
dGFydCB1cCB0aGUgZm9yayBhbmQgbGV0IGl0CnJ1biBpbW1lZGlhdGVseSBhbmQgb25seSBzdGFy
dCB1cCBRRU1VIHdoZW4geW91IG5vdGljZSBpdCBpcyBuZWVkZWQuClRoZSBpZGVhIGJlaW5nIHRo
YXQgeW91IGNhbiBtb25pdG9yIHRoZSBrZXJuZWwgYW5kIHNlZSB3aGVuIGl0IHRyaWVzCnRvIGRv
IHNvbWUgSS9PIHRoYXQgd291bGQgcmVxdWlyZSB0aGUgUUVNVSBiYWNrZW5kLiBJZiB5b3UgY29t
YmluZSB0aGUKY29tbWFuZHMgdGhhdCBvcHRpb24gZ29lcyBhd2F5LiBBbHNvLCBRRU1VIGl0c2Vs
ZiBpc24ndCBnZXR0aW5nIGZvcmtlZApyaWdodCBub3csIHdlIGp1c3Qgc3RhcnQgYSBuZXcgUUVN
VSBwcm9jZXNzIHdpdGggdGhlIHNhdmVkLXN0YXRlCmdldHRpbmcgbG9hZGVkIGludG8gaXQuIEkg
bG9va2VkIGludG8gaW1wbGVtZW50aW5nIGEgUUVNVSBmb3JrIGNvbW1hbmQKYnV0IGl0IHR1cm5z
IG91dCB0aGF0IGZvciB0aGUgdmFzdCBtYWpvcml0eSBvZiBvdXIgdXNlLWNhc2VzIFFFTVUKaXNu
J3QgbmVlZGVkIGF0IGFsbCwgc28gZGV2ZWxvcGluZyB0aGF0IGFkZGl0aW9uIHdhcyB0YWJsZWQu
CgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
