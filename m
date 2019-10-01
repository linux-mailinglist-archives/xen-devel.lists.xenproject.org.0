Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5178BC3786
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:35:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJCy-0001nH-5e; Tue, 01 Oct 2019 14:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GEcb=X2=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iFJCw-0001mg-LV
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:32:54 +0000
X-Inumbo-ID: 5a5eb35c-e458-11e9-b588-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by localhost (Halon) with ESMTPS
 id 5a5eb35c-e458-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 14:32:53 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q10so8160505pfl.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+SbYujNgbSDKhfXci5G84np+JnKDePagwfaeO/q+AE=;
 b=C9R+eJYi5bIJc29DzNhuBn2VEX7aXSZGhZAYO6H3SDXslgQB29ax+kcLEXBfsA3qUS
 7VSz6CTEY0DjyUcPkdudIdSoQfldXEEnk22Yzmx3gj3UGVyfwEe9LcM9IpLeTg6ubQ8x
 fOgzMlPeuWOkNp0ivdpWyW8U3TR5Gt5WoUUcbqFNuGNBQXOrMV+Vb2vpdG0210vaHquk
 d3Q6yamTcCVKkkaN0xrWl2rtwAQao2ObSnbRUNNTzT6609DFsro2LLUIZOOd/OozTiQk
 KL2qaKTAxc9B8WZO7qkXlVanXo/zwsTOfeqlUna9W47NIh5wBNAlchS6bj0tkPNth43L
 7P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+SbYujNgbSDKhfXci5G84np+JnKDePagwfaeO/q+AE=;
 b=Z7ly+Tqtlg+HW9nO3zYQvtAWen+c9LkGmi9KN8+oxnLzi6p4hz2sI/svbchi3rXoua
 v2GitDJNzUDI6F7FqxkU0165DZ/JEJlWLHnmz6zS53DiKWwjfhY+RWtSKNJTMYO+PS2I
 K2YG8uZaljKStOWP70ihDv2QdzIGrwq0T1IFRa3cQm5D5IIt0kkDbyyMQAP+2K3XdouF
 0qLcsUt2XkfKHKzj2btsoX0KggdhW2WD5aXGNLg875Osa8R8NQL6s5dtFeii8N8vnc1b
 Ut0UlIQz7BjtVMSSfC10xugPs/tFryy53hlgpGvx213TlqM2J/1Bu8VeKDX8QMQW3w6I
 pj6w==
X-Gm-Message-State: APjAAAXKWyV9836Eovu3Cia1xfAwou8S84L4rpNbFhEokawrtqzKUeDp
 t8KxWywYUmcyKfGIJesOljQQpwGXbFuM5IT9lsgEtqBcsGk=
X-Google-Smtp-Source: APXvYqzqkcc1KTUKtsqlrrBbF5iViNeMJa5DJj2BHcNeACZ6QnnwBRDWpF38aovIwggC+e2WYJz4cydvVpfBTXrzaKo=
X-Received: by 2002:a17:90a:e017:: with SMTP id
 u23mr5594839pjy.55.1569940372982; 
 Tue, 01 Oct 2019 07:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
 <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
 <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
 <c2dff4f9265543629288d6cd64a6ddce@AMSPEX02CL03.citrite.net>
 <ba2b9cc4-bd80-6049-d759-c0a9400c295f@citrix.com>
 <CACCGGhCqaxkYY90Nsvcg2yxjsRvdBXEN+cwPBhLVOdJKscS1pg@mail.gmail.com>
 <ead796d4-a531-7f23-04c8-a60c3aa142d6@citrix.com>
 <CACCGGhDGsc3izYWbHzM9cGN1S5w8kgTw6Ny9pRuCp8vudpdLSQ@mail.gmail.com>
 <742ce14b-d57a-4ad3-ce50-5d939ba89e15@suse.com>
In-Reply-To: <742ce14b-d57a-4ad3-ce50-5d939ba89e15@suse.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Tue, 1 Oct 2019 15:32:40 +0100
Message-ID: <CACCGGhA1V9pj1cd+YGG+wZH2NRaJr_n02AD0-kz5ZnpSDq7+Ew@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxIE9jdCAyMDE5IGF0IDE1OjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Cj4gT24gMDEuMTAuMjAxOSAxNToyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
ID4gVGhlIGNoYW5nZXMgaW4gWEFQSSBhcmUgbm90IHZhc3Q7IHRoZSBtYWluIGNvbXBsZXhpdHkg
aXMgaW4gdGhlIGRldmljZQo+ID4gZW11bGF0b3IgKHRvIHByb3ZpZGUgaW5mb3JtYXRpb24gZHVy
aW5nIHRoZSBsaXZlIHBoYXNlIG9mIG1pZ3JhdGlvbikKPiA+IGJ1dCBJIHN0aWxsIGRvbid0IHNl
ZSB3aHkgQ2l0cml4J3MgY2hvaWNlIG9mIGNsb3NlZCB2cy4gb3BlbiBzb3VyY2UKPiA+IGltcGxl
bWVudGF0aW9uIG9mIHRoZSBlbXVsYXRvciByZWFsbHkgaGFzIGFueXRoaW5nIHRvIGRvIHdpdGgg
dGhpcy4gSXQKPiA+IGlzIHN0aWxsIG15IG9waW5pb24gdGhhdCBYZW4ncyBvbmx5IHZhbGlkIHJl
YXNvbiBmb3IgcmVmdXNpbmcgdG8KPiA+IGVuYWJsZSBsb2dkaXJ0eSBmb3IgYSBkb21haW4gaXMg
b25lIG9mIGhvc3Qgc2FmZXR5IGFuZCBJIHN0aWxsIGhhdmVuJ3QKPiA+IGhlYXJkIGFuIGFyZ3Vt
ZW50IGFzIHRvIHdoeSBYZW4gKmlzKiByaWdodCB0byByZWZ1c2UgaW4gb3RoZXIKPiA+IGNpcmN1
bXN0YW5jZXMuCj4KPiBMZXQgbWUgdGFrZSBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGV4YW1wbGUg
Zm9yIGNvbXBhcmlzb246Cj4gVGhlcmUncyBubyByaXNrIHRvIHRoZSBob3N0IGluIGFzc2lnbmlu
ZyB0aGUgc2FtZSwgc2F5LCBVU0IKPiBjb250cm9sbGVyIHRvIHR3byBndWVzdHMuIFlldCBYZW4g
cmVmdXNlcyB0byBkbyBzbywgZXZlbiBpZiB0aGUKPiB0b29sIHN0YWNrIGRpZG4ndCBhbHJlYWR5
IGZpbHRlciBzdWNoIGF0dGVtcHRzLCBhbmQgZXZlbiBpZiB0aGUKPiBhZG1pbiBtYXkga25vdyB0
aGF0IHRoZSB0d28gZG9tYWlucyBhcmUgY29vcGVyYXRpbmcsIGFuZCBoZW5jZQo+IHdvdWxkbid0
IGdldCBpbiB0aGUgd2F5IG9mIG9uZSBhbm90aGVyLiAoVGhlcmUgYXJlLCBJIHRoaW5rLAo+IG1h
bnkgb3RoZXIgc2ltaWxhciBleGFtcGxlcy4pCgpUaGF0IHNvdW5kcyBsaWtlIGEgcGVyZmVjdGx5
IHZhbGlkIHRoaW5nIHRvIGRvIGlmIHRoZSBzL3cgcnVubmluZyBpbgp0aGUgZG9tYWlucyBpcyB0
cnVzdGVkIHRvIGNvLW9wZXJhdGUgYXMgeW91IHNheS4gRm9yIE5WSURJQSB2R1BVCmltcGxlbWVu
dGF0aW9ucyBkaWZmZXJlbnQgTU1JTyByZWdpb25zIG9mIHRoZSBzYW1lIFBDSSBkZXZpY2UgYXJl
Cm1hcHBlZCBpbnRvIGRpZmZlcmVudCBndWVzdHMuCgo+Cj4gVGhhdCBzYWlkIEkgY2FuIGNlcnRh
aW5seSBzZWUgdGhlIHZhbGlkaXR5IG9mIHlvdXIgYW5kIEFuZHJldydzCj4gYXJndW1lbnRhdGlv
bi4gSXQncyBqdXN0IHRoYXQsIGFzIGluIHZhcmlvdXMgb3RoZXIgY2FzZXMsIEkKPiBkb24ndCB0
aGluayB0aGF0J3MgdGhlIG9ubHkgcmVhc29uYWJsZSB3YXkgb2YgYXJyYW5naW5nIHRoaW5ncy4K
PiBIZW5jZSBhdCB0aGUgdmVyeSBsZWFzdCB5b3VyIGNoYW5nZSB3b3VsZCBpbW8gbmVlZCB0byBj
b21lIHdpdGgKPiBhbiBleHRlbmRlZCBkZXNjcmlwdGlvbi4KPgoKT2ssIEkgd2lsbCBleHBhbmQg
b24gdGhlIHJlYXNvbmluZyBpbiB0aGUgY29tbWl0IGNvbW1lbnQgYW5kIHBvc3QgdjIuCgogIFBh
dWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
