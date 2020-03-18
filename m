Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A391899CA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:43:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEW8r-0002qu-Eg; Wed, 18 Mar 2020 10:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oC7P=5D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jEW8q-0002qp-BN
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:41:40 +0000
X-Inumbo-ID: 0cbd04b4-6905-11ea-bec1-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cbd04b4-6905-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 10:41:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f28so37777254qkk.13
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 03:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=7q5OXhwFGpEsZKX/j3tRxogVHcclNLf+74sw2kds1g0=;
 b=uH+MVkZ8kI+vhJH0wjxh61xsHaqQKbiE0byVq5JadFh2Rl4TZhYY+pVy1jGGd9l1dL
 a8wtOF3y+oFyYXDpjQ64NeUOOcwEVfhuSaJtIy1KaFN1JDCVONgbch2srW03FTAibFC0
 yNJVHRRVSU86MYqpHDNgef6Ll1PkezL4MZlrg/tHjOGO3wn80wvjDQN9KBjBGVyQZ383
 MIghDdRMXZJA3/M5mX6TNdYaNt0p4cngsxi/Q6r0muaYMqCpJyBQrBFdOaL7Spfpgn1v
 AINYJMaGEW3X+cqbaGjx06kFuXeFRbvwO4TsoUHLxekT/qBG9zBejU05EumT1GmouL5c
 2wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=7q5OXhwFGpEsZKX/j3tRxogVHcclNLf+74sw2kds1g0=;
 b=TgvCoJGooNTvqyyevY/ORcsWaK9RLEnXqrHTvOU1hC6Iah9Pybd9Z8X0tIOEz2YfRw
 tDd4JqLLx15VcdJFwsnOtyW0JRcH2UyVi+OmJpa/2vKJOUKbGvA33Bq8+Xh53VzT/Bou
 aSQJUTB50bZK8xSrpOFyfv78266hFvN3mdQsBui1Mp8oOCx6nNIBD0TNpNxUML9UzVMx
 Us74N2TY8hfOkP/IsotH91YTxj8hzRtYRLioSHvScgfMJoOucvG6C5AVlE60RshETSN6
 ak3LApZ1vLuxQx0Qcsi8pLaf2eLQUSTgM4C3wqzovvZIagmRhDRnNcFqddNgz9gWQ4GG
 QvDQ==
X-Gm-Message-State: ANhLgQ0tj71cA8r20Dnrhy3rS26/reyg1YAdExgUJjyRwmbBO5lTebCZ
 wnA12V8psyoAsoGElMImFSM=
X-Google-Smtp-Source: ADFU+vvkfIzCuvKpUJHwBkDnIBQwjcJFGEA8vTmjRPAlo468nl/7TuufsLJ7k2b2RtRwexA6is0cyA==
X-Received: by 2002:a37:c41:: with SMTP id 62mr3159053qkm.342.1584528099496;
 Wed, 18 Mar 2020 03:41:39 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id 124sm3827083qkl.31.2020.03.18.03.41.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Mar 2020 03:41:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
 <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
 <005f01d5fd02$b7aa2240$26fe66c0$@xen.org>
 <6bed9bf3-1d2b-286a-cd3f-55e5dd2d8efd@suse.com>
In-Reply-To: <6bed9bf3-1d2b-286a-cd3f-55e5dd2d8efd@suse.com>
Date: Wed, 18 Mar 2020 10:41:35 -0000
Message-ID: <006401d5fd11$cdf31930$69d94b90$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLJFAfqp+GM6M5D8UrpK4lT1oBe3AGkGb2bAUDgoMUBUDuLzgGt2p0pALGuH7ECPAQBuAHzVUdOAovrbzABvTS7jgD30NQWpefPwZA=
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jeff.kubascik@dornerworks.com, "'Xia, Hongyan'" <hongyxia@amazon.com>,
 stewart.hildebrand@dornerworks.com, xen-devel@lists.xenproject.org,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxOCBNYXJjaCAyMDIwIDEwOjEwCj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiAnRGF2aWQgV29vZGhvdXNlJyA8ZHdtdzJAaW5mcmFkZWFkLm9yZz47IHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnOyB3bEB4ZW4ub3JnOwo+IGtvbnJhZC53aWxr
QG9yYWNsZS5jb207IGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbTsgYW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbTsKPiBpYW4uamFja3NvbkBldS5jaXRyaXguY29tOyBnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb207IGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tOyAnWGlhLCBIb25neWFuJwo+
IDxob25neXhpYUBhbWF6b24uY29tPjsgc3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNv
bTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCAy
LzJdIHhlbi9tbTogSW50cm9kdWNlIFBHX3N0YXRlX3VuaW5pdGlhbGlzZWQKPiAKPiBPbiAxOC4w
My4yMDIwIDA5OjUzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhl
bnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgRGF2aWQgV29vZGhvdXNlCj4gPj4gU2VudDogMTcg
TWFyY2ggMjAyMCAyMjoxNQo+ID4+Cj4gPj4gT24gVGh1LCAyMDIwLTAyLTIwIGF0IDEyOjU5ICsw
MTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDcuMDIuMjAyMCAxOTowNCwgRGF2aWQg
V29vZGhvdXNlIHdyb3RlOgo+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiA+Pj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPj4+PiBAQCAtNDg4LDcgKzQ4OCw4IEBAIHZvaWQgc2hh
cmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBzdHJ1Y3QgZG9t
YWluICpkLAo+ID4+Pj4KPiA+Pj4+ICAgICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwo+ID4+
Pj4gICAgICAgc21wX3dtYigpOyAvKiBpbnN0YWxsIHZhbGlkIGRvbWFpbiBwdHIgYmVmb3JlIHVw
ZGF0aW5nIHJlZmNudC4gKi8KPiA+Pj4+IC0gICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYg
flBHQ194ZW5faGVhcCkgPT0gMCk7Cj4gPj4+PiArICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5m
byAmIH5QR0NfeGVuX2hlYXApID09IFBHQ19zdGF0ZV9pbnVzZSB8fAo+ID4+Pj4gKyAgICAgICAg
ICAgKHBhZ2UtPmNvdW50X2luZm8gJiB+UEdDX3hlbl9oZWFwKSA9PSBQR0Nfc3RhdGVfdW5pbml0
aWFsaXNlZCk7Cj4gPj4+Cj4gPj4+IENhbiB1bmluaXRpYWxpemVkIHBhZ2VzIHJlYWxseSBtYWtl
IGl0IGhlcmU/Cj4gPj4KPiA+PiBZZXAsIHdlIHNoYXJlIHRoZSBsb3cgMU1pQiB3aXRoIGRvbV9p
by4KPiA+Pgo+ID4KPiA+IE9PSSBhbnlvbmUga25vdyB3aHkgd2UgZG8gdGhpcz8gSXMgaXQgYWN0
dWFsbHkgbmVjZXNzYXJ5Pwo+IAo+IFllcywgZm9yIERvbTAgdG8gYmUgYWJsZSB0byBhY2Nlc3Mg
dGhpbmdzIGxpa2UgRUJEQSwgSUJGVCwgb3IgZGF0YQo+IGZvdW5kIGluIEJJT1Mgc3BhY2UuCj4K
Ck9rLiBJIGFtIHN0aWxsIHdvbmRlcmluZyB3aHkgZG9tMCdzIGxvdyAxTWlCIG9mIHBmbiBzcGFj
ZSBpcyBub3Qgc2ltcGx5IG1hcHBlZCAxOjEgdGhvdWdoLiBKdXN0IGhpc3RvcmljYWw/CgogIFBh
dWwKIAo+IEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
