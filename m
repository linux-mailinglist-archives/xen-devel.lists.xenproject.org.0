Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD9B4EA1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 14:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iACzL-0004t7-Ce; Tue, 17 Sep 2019 12:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IAWU=XM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iACzK-0004sx-87
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 12:53:46 +0000
X-Inumbo-ID: 2e75f35e-d94a-11e9-960c-12813bfff9fa
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e75f35e-d94a-11e9-960c-12813bfff9fa;
 Tue, 17 Sep 2019 12:53:44 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id d5so3369918lja.10
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2019 05:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lQ6upS5qL1zXbckc+WhrGAJQisVKf3oDBkQDSNXZTUw=;
 b=PWZ/1IIA9qGyHAR1Z1IcTU1AJDA4PY8TmTRgwR0FBcZMTTtgIOfMW8CVXS7sjI8/Pt
 J0oqW545cklfDLq33RmSSb5fmSzK8MuhJi3KcdTdqfzqvqO9d+q4wb4Yzel8pxlLKoO2
 wYp5XxVqCl9wY0UOGZGAmoilqYR1dOEYxNpsVztsC9oPupzExQEHO0L9fHkWSfYZYV8i
 zz6CkPlv8ayopgzVUz8iBXparxQShD4QJ5IGokUp9cW5S7+xCcm4a7p2MoWBZ0K1SEM1
 fXBOYPv8wuuOMKKcSzUWRgz/0KG4Xu20uzcv0QtqUMZWmEKuR5bGPfVVKp2JMjc+L9Of
 ZO1A==
X-Gm-Message-State: APjAAAW3zb22N67eI2PV9+6lyZXyVwSCibY+ofO1Vw8oVzK/I5OxqLhe
 IAG+rjbCgkbzkMYDfEh7uCUHQ9nboOg=
X-Google-Smtp-Source: APXvYqxY0Y/l4mlZiWBbalwt48m9Qg6n+NL+s8x/2fi/RzEagcAzyLqOMP6r6ZQtb+MtZyuy20dqdg==
X-Received: by 2002:a05:651c:1031:: with SMTP id
 w17mr1834089ljm.16.1568724823623; 
 Tue, 17 Sep 2019 05:53:43 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id m6sm422963ljj.3.2019.09.17.05.53.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2019 05:53:43 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id q64so3354213ljb.12
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2019 05:53:43 -0700 (PDT)
X-Received: by 2002:a2e:1409:: with SMTP id u9mr1790619ljd.162.1568724823043; 
 Tue, 17 Sep 2019 05:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-4-paul.durrant@citrix.com>
In-Reply-To: <20190913105826.2704-4-paul.durrant@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 17 Sep 2019 13:53:27 +0100
X-Gmail-Original-Message-ID: <CAK9nU=oR3GASeTZtPeW=RmquqrCq2F68ZX_YZhQEc9t0d+Dtww@mail.gmail.com>
Message-ID: <CAK9nU=oR3GASeTZtPeW=RmquqrCq2F68ZX_YZhQEc9t0d+Dtww@mail.gmail.com>
To: Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [Xen-devel] [PATCH v11 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAxMTo1OCwgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGRlZmluZXMgYSBuZXcgYml0IHJlcG9y
dGVkIGluIHRoZSBod19jYXAgZmllbGQgb2Ygc3RydWN0Cj4geGVuX3N5c2N0bF9waHlzaW5mbyB0
byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBzaGFyaW5nIG9mCj4gSEFQ
IHBhZ2UgdGFibGVzIChpLmUuIHRoZSBQMk0pIHdpdGggdGhlIElPTU1VLiBUaGlzIGluZm9ybXMg
dGhlIHRvb2xzdGFjawo+IHdoZXRoZXIgdGhlIGRvbWFpbiBuZWVkcyBleHRyYSBtZW1vcnkgdG8g
c3RvcmUgZGlzY3JldGUgSU9NTVUgcGFnZSB0YWJsZXMKPiBvciBub3QuCj4KPiBOT1RFOiBUaGlz
IHBhdGNoIG1ha2VzIHN1cmUgaW9tbXVfaGFwX3B0X3NoYXJlZCBpcyBjbGVhciBpZiBIQVAgaXMg
bm90Cj4gICAgICAgc3VwcG9ydGVkIG9yIHRoZSBJT01NVSBpcyBkaXNhYmxlZCwgYW5kIGRlZmlu
ZXMgaXQgdG8gZmFsc2UgaWYKPiAgICAgICAhQ09ORklHX0hWTS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IENocmlz
dGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+Cj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+
IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6
IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+Cj4gQ2M6IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+
Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ2M6IFN1
cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gQ2M6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+Cj4gdjExOgo+ICAtIEZpeCBhYmkt
Y2hlY2sgYnJlYWthZ2UKPgo+IHYxMDoKPiAgLSBTZXQgZmxhZyBpbiBjb21tb24gY29kZSAod2hp
Y2ggbWVhbnMgY2xlYXJpbmcgaW9tbXVfaGFwX3B0X3NoYXJlIGlmCj4gICAgSEFQIGNhbm5vdCBi
ZSBlbmFibGVkIG9yIGlzIGNvbmZpZ3VyZWQgb3V0KS4KPgo+IHY5Ogo+ICAtIE5ldyBpbiB2OQo+
IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysK
PiAgdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysK
PiAgdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICAgICAgICAgICAgICB8ICAxICsKCkhtbS4u
LiBJIHRob3VnaHQgSSBhY2tlZCB0aGlzIGJlZm9yZSwgYnV0IHRoYXQgY291bGQgYmUgYW4gb2xk
IHZlcnNpb24KdGhhdCBJIGFja2VkLgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
