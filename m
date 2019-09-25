Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBFBDAD2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:20:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3Ps-0003Az-3t; Wed, 25 Sep 2019 09:16:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iD3Pq-0003As-8z
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:16:54 +0000
X-Inumbo-ID: 36951174-df75-11e9-962d-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id 36951174-df75-11e9-962d-12813bfff9fa;
 Wed, 25 Sep 2019 09:16:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v8so5753669wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 02:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jUYB9WQUa6kq0SPs41F8+CRuXEfdx63JM9pZ/Jk3Tno=;
 b=YUi4olORze44IK8kAfYck3kfEMELp05Ot4su0nsq7OkjO8O20AXzmq2zzXF/AnIsno
 IzPhghWXYBOZHr+fz+noDtLEz7QFtQoLKM9UBNLKU/M424KBVYYdR/fbZQkcFXmpnzlT
 Vfeix1qe9NyRfxDmHV8rwkEItAOM4AIfgov+lS+XEUnWQt5WFTC30MD2UMTanFuFgb/w
 v6d0qN0WlMgE75L0i3UoXhp33pTGYibjTvpd7vXZIewcp5mMjXJqzlDka7TPr6tuuR60
 rabrpyj8tjgrMAzmGrb0zHTvLeKTZ0xX1SGMNICtCr5wXB5e5rXm5Y9kXEKPvvwaMlkk
 Flog==
X-Gm-Message-State: APjAAAX6+FFlM9r0x0N2o28cDnCdicnIpmkUP+uI2Y2BKUHMX0pCvSxd
 E0NfYwSNwJPApzfnJPRR4zg=
X-Google-Smtp-Source: APXvYqwuoxBcbOOgp1kEnb03co1aABEn4wIHQo9RtE84aSoN6kHLfHdB/mljXmA8q9cCNjf9RmggjA==
X-Received: by 2002:adf:f081:: with SMTP id n1mr8718841wro.273.1569403012757; 
 Wed, 25 Sep 2019 02:16:52 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id b186sm3626984wmd.16.2019.09.25.02.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 02:16:52 -0700 (PDT)
Date: Wed, 25 Sep 2019 10:16:50 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190925091650.qgnfkabob6zrfebd@debian>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <20190918104113.3294-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104113.3294-2-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v13 1/4] remove late (on-demand)
 construction of IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTE6NDE6MTBBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE5vdyB0aGF0IHRoZXJlIGlzIGEgcGVyLWRvbWFpbiBJT01NVS1lbmFibGUgZmxhZywg
d2hpY2ggc2hvdWxkIGJlIHNldCBpZgo+IGFueSBkZXZpY2UgaXMgZ29pbmcgdG8gYmUgcGFzc2Vk
IHRocm91Z2gsIHN0b3AgZGVmZXJyaW5nIHBhZ2UgdGFibGUKPiBjb25zdHJ1Y3Rpb24gdW50aWwg
dGhlIGFzc2lnbm1lbnQgaXMgZG9uZS4gQWxzbyBkb24ndCB0ZWFyIGRvd24gdGhlIHRhYmxlcwo+
IGFnYWluIHdoZW4gdGhlIGxhc3QgZGV2aWNlIGlzIGRlLWFzc2lnbmVkOyBkZWZlciB0aGF0IHRh
c2sgdW50aWwgZG9tYWluCj4gZGVzdHJ1Y3Rpb24uCj4gCj4gVGhpcyBhbGxvd3MgdGhlIGhhc19p
b21tdV9wdCgpIGhlbHBlciBhbmQgaW9tbXVfc3RhdHVzIGVudW1lcmF0aW9uIHRvIGJlCj4gcmVt
b3ZlZC4gQ2FsbHMgdG8gaGFzX2lvbW11X3B0KCkgYXJlIHNpbXBseSByZXBsYWNlZCBieSBjYWxs
cyB0bwo+IGlzX2lvbW11X2VuYWJsZWQoKS4gUmVtYWluaW5nIG9wZW4tY29kZWQgdGVzdHMgb2Yg
aW9tbXVfaGFwX3B0X3NoYXJlIGNhbgo+IGFsc28gYmUgcmVwbGFjZWQgYnkgY2FsbHMgdG8gaW9t
bXVfdXNlX2hhcF9wdCgpLgo+IFRoZSBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoKSBh
bmQgaW9tbXVfY29uc3RydWN0KCkgZnVuY3Rpb25zIGJlY29tZQo+IHJlZHVuZGFudCwgYXMgZG9l
cyB0aGUgJ3N0cmljdCBtb2RlJyBkb20wIHBhZ2VfbGlzdCBtYXBwaW5nIGNvZGUgaW4KPiBpb21t
dV9od2RvbV9pbml0KCksIGFuZCBpb21tdV90ZWFyZG93bigpIGNhbiBiZSBtYWRlIHN0YXRpYyBp
cyBpdHMgb25seQo+IHJlbWFpbmluZyBjYWxsZXIsIGlvbW11X2RvbWFpbl9kZXN0cm95KCksIGlz
IHdpdGhpbiB0aGUgc2FtZSBzb3VyY2UKPiBtb2R1bGUuCj4gCj4gQWxsIGluIGFsbCwgYWJvdXQg
MjIwIGxpbmVzIG9mIGNvZGUgYXJlIHJlbW92ZWQgZnJvbSB0aGUgaHlwZXJ2aXNvciAoYXQKPiB0
aGUgZXhwZW5zZSBvZiBzb21lIGFkZGl0aW9ucyBpbiB0aGUgdG9vbHN0YWNrKS4KPiAKPiBOT1RF
OiBUaGlzIHBhdGNoIHdpbGwgY2F1c2UgYSBzbWFsbCBhbW91bnQgb2YgZXh0cmEgcmVzb3VyY2Ug
dG8gYmUgdXNlZAo+ICAgICAgIHRvIGFjY29tbW9kYXRlIElPTU1VIHBhZ2UgdGFibGVzIHRoYXQg
bWF5IG5ldmVyIGJlIHVzZWQsIHNpbmNlIHRoZQo+ICAgICAgIHBlci1kb21haW4gSU9NTVUtZW5h
YmxlIGZsYWcgaXMgY3VycmVudGx5IHNldCB0byB0aGUgdmFsdWUgb2YgdGhlCj4gICAgICAgZ2xv
YmFsIGlvbW11X2VuYWJsZSBmbGFnLiBBIHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBhZGQgYW4gb3B0
aW9uIHRvCj4gICAgICAgdGhlIHRvb2xzdGFjayB0byBhbGxvdyBpdCB0byBiZSB0dXJuZWQgb2Zm
IGlmIHRoZXJlIGlzIG5vIGludGVudGlvbgo+ICAgICAgIHRvIGFzc2lnbiBwYXNzdGhyb3VnaCBo
YXJkd2FyZSB0byB0aGUgZG9tYWluLgo+ICAgICAgIFRvIGFjY291bnQgZm9yIHRoZSBleHRyYSBy
ZXNvdXJjZSwgJ2lvbW11X21lbWtiJyBoYXMgYmVlbiBhZGRlZCB0bwo+ICAgICAgIGRvbWFpbl9i
dWlsZF9pbmZvLiBUaGlzIHBhdGNoIHNldHMgaXQgdG8gYSB2YWx1ZSBjYWxjdWxhdGVkIGJhc2Vk
Cj4gICAgICAgb24gdGhlIGRvbWFpbidzIG1heGltdW0gbWVtb3J5IHdoZW4gdGhlIFAyTSBzaGFy
aW5nIGlzIGVpdGhlciBub3QKPiAgICAgICBzdXBwb3J0ZWQgb3IgZ2xvYmFsbHkgZGlzYWJsZWQs
IG9yIHplcm8gb3RoZXJ3aXNlLiBIb3dldmVyLCB3aGVuCj4gICAgICAgdGhlIHRvb2xzdGFjayBv
cHRpb24gbWVudGlvbmVkIGFib3ZlIGlzIGFkZGVkLCBpdCB3aWxsIGFsc28gYmUgemVybwo+ICAg
ICAgIGlmIHRoZSBwZXItZG9tYWluIElPTU1VLWVuYWJsZSBmbGFnIGlzIHR1cm5lZCBvZmYuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
PiBSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
