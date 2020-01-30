Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5514D975
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:05:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix7ae-0006Rx-HM; Thu, 30 Jan 2020 11:02:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix7ad-0006Rs-KD
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:02:27 +0000
X-Inumbo-ID: ffd8c61e-434f-11ea-8a37-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffd8c61e-434f-11ea-8a37-12813bfff9fa;
 Thu, 30 Jan 2020 11:02:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A6E0AFBB;
 Thu, 30 Jan 2020 11:02:25 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <pdurrant@amazon.com>
References: <20200129171030.1341-1-pdurrant@amazon.com>
 <20200129171030.1341-3-pdurrant@amazon.com>
Message-ID: <aa731ded-b87a-8ed8-864d-54c8be979ac0@suse.com>
Date: Thu, 30 Jan 2020 12:02:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129171030.1341-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 2/3] mm: make pages allocated with
 MEMF_no_refcount safe to assign
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KHJlcGx5aW5nIGZyb20gc2VlaW5nIHlvdXIgcmVwbHkgb24gdGhlIGxpc3QgYXJjaGl2ZXMsIGku
ZS4KdGhyZWFkaW5nIGxvc3QvYnJva2VuKQoKT24gMzAuMDEuMjAyMCAxMDo0MCwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+IFRoaXMgaXMgZ2V0dGluZyB2ZXJ5IHZlcnkgY29tcGxpY2F0ZWQgbm93LCB3
aGljaCBtYWtlcyBtZSB0aGluayB0aGF0IG15IAo+IG9yaWdpbmFsIGFwcHJvYWNoIHVzaW5nIGEg
J25vcm1hbCcgcGFnZSBhbmQgc2V0dGluZyBhbiBpbml0aWFsIG1heF9wYWdlcyBpbiAKPiBkb21h
aW5fY3JlYXRlKCkgd2FzIGEgYmV0dGVyIGFwcHJvYWNoLgoKSSBkb24ndCB0aGluayBzbywgbm8u
IEkgYWxzbyBkb24ndCB0aGluZyBhdWRpdGluZyBhbGwgLT57bWF4LHRvdH1fcGFnZXMKdXNlcyBj
YW4gYmUgY2FsbGVkICJ2ZXJ5IHZlcnkgY29tcGxpY2F0ZWQiLiBBbGwgSSBjYW4gc2F5IChhZ2Fp
biwgSQp0aGluaykgaXMgdGhhdCB0aGVyZSB3YXMgYSByZWFzb24gdGhpcyBBUElDIHBhZ2UgdGhp
bmcgd2FzIGRvbmUgdGhlCndheSBpdCB3YXMgZG9uZS4gKEl0J3MgYW5vdGhlciB0aGluZyB0aGF0
IHRoaXMgcHJvYmFibHkgd2Fzbid0IGEKX2dvb2RfIHJlYXNvbi4pCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
