Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870CCBC490
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 11:13:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCgq0-0002f4-95; Tue, 24 Sep 2019 09:10:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCgpy-0002ex-Mm
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 09:10:22 +0000
X-Inumbo-ID: 22a0a806-deab-11e9-9610-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 22a0a806-deab-11e9-9610-12813bfff9fa;
 Tue, 24 Sep 2019 09:10:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0886BB694;
 Tue, 24 Sep 2019 09:10:19 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <e0a904bf-b6a0-6224-88f6-e89a95867718@suse.com>
 <1b23caa9eb9a424d919c2aed1a5ba80f@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d977330a-88e0-e145-84ad-e0271232e477@suse.com>
Date: Tue, 24 Sep 2019 11:10:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1b23caa9eb9a424d919c2aed1a5ba80f@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/8] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxODozMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4gU2VudDogMTkgU2Vw
dGVtYmVyIDIwMTkgMTQ6MjUKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
PiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFN1cmF2ZWUg
U3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4+IFN1YmplY3Q6
IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiA3LzhdIEFNRC9JT01NVTogYWxsb2NhdGUgb25lIGRldmlj
ZSB0YWJsZSBwZXIgUENJIHNlZ21lbnQKPj4KPj4gSGF2aW5nIGEgc2luZ2xlIGRldmljZSB0YWJs
ZSBmb3IgYWxsIHNlZ21lbnRzIGNhbid0IHBvc3NpYmx5IGJlIHJpZ2h0Lgo+IAo+IFRoZSBjb3B5
IG9mIHRoZSBzcGVjLiBJIGhhdmUgc2F5cyAob24gcGFnZSAyNTM6IEZpeGVkLUxlbmd0aCBJVkhE
Cj4gQmxvY2tzKSB0aGF0IElWSEQgZW50cmllcyBtdXN0IGhhdmUgYSBzZWdtZW50IGdyb3VwIG9m
IDAsIHNvIGNhbid0Cj4gdGhlIGNvZGUganVzdCByZXF1aXJlIGlvbW11LT5zZWcgPT0gMD8KClRo
ZSB3b3JkaW5nIGluIG15IHZlcnNpb24gaXMgIkF0IHRoaXMgdGltZSwgb25seSBQQ0kgU2VnbWVu
dCBHcm91cCAwIGlzCnN1cHBvcnRlZC4iIFRoaXMgc3VnZ2VzdHMgdG8gbWUgdGhhdCBpdCBpcyBu
b3QgYSBnb29kIGlkZWEgdG8gaGF2ZSBsb2dpYwpiYWtlZCBpbiB0aGF0IGRlcGVuZHMgb24gdGhp
cyByZW1haW5pbmcgdHJ1ZS4gSSByZWFsaXplIHRob3VnaCB0aGF0IHRoZXJlCmFyZSBtb3JlIHBs
YWNlcyB0aGFuIGp1c3QgdGhpcyBvbmUgd2hlcmUgd2UgKGhhdmUgdG8pIGFzc3VtZSBzZWdtZW50
IDAKKGFsbCBpbiBpb21tdV9hY3BpLmMsIGFuZCBhbGwgbWFya2VkIHdpdGggYW4gWFhYIGNvbW1l
bnQpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
