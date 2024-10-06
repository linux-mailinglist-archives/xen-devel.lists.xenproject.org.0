Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B000992034
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 20:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811281.1223841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxVZ8-0001fS-64; Sun, 06 Oct 2024 18:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811281.1223841; Sun, 06 Oct 2024 18:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxVZ8-0001cr-2e; Sun, 06 Oct 2024 18:01:10 +0000
Received: by outflank-mailman (input) for mailman id 811281;
 Sun, 06 Oct 2024 18:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lfc9=RC=aculab.com=david.laight@srs-se1.protection.inumbo.net>)
 id 1sxVZ6-0001ca-5E
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 18:01:08 +0000
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f539e23c-840c-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 20:01:06 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-241-ir4EC8PtM6i_SZDW15CpKA-1; Sun, 06 Oct 2024 19:01:03 +0100
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 6 Oct
 2024 19:00:09 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 6 Oct 2024 19:00:09 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f539e23c-840c-11ef-99a2-01e77a169b0f
X-MC-Unique: ir4EC8PtM6i_SZDW15CpKA-1
From: David Laight <David.Laight@ACULAB.COM>
To: 'Uros Bizjak' <ubizjak@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
CC: Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds
	<torvalds@linux-foundation.org>, Ard Biesheuvel <ardb+git@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo
	<tj@kernel.org>, Christoph Lameter <cl@linux.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Vitaly Kuznetsov" <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>,
	"Boris Ostrovsky" <boris.ostrovsky@oracle.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
	<masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>, Keith Packard <keithp@keithp.com>, Justin Stitt
	<justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	"Jiri Olsa" <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian
 Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-efi@vger.kernel.org"
	<linux-efi@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-sparse@vger.kernel.org"
	<linux-sparse@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>
Subject: RE: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
Thread-Topic: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
Thread-Index: AQHbF8Wqw+hKPqg6T0aWZJZtJXxJh7J5/LJw
Date: Sun, 6 Oct 2024 18:00:09 +0000
Message-ID: <bfa1a86c3e4348159049e8277e9859dd@AcuMS.aculab.com>
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com>
 <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com>
 <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
 <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com>
In-Reply-To: <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

Li4uDQo+IER1ZSB0byB0aGUgbm9uLW5lZ2xpZ2libGUgaW1wYWN0IG9mIFBJRSwgcGVyaGFwcyBz
b21lIGtpbmQgb2YNCj4gQ09ORklHX1BJRSBjb25maWcgZGVmaW5pdGlvbiBzaG91bGQgYmUgaW50
cm9kdWNlZCwgc28gdGhlIGFzc2VtYmx5DQo+IGNvZGUgd291bGQgYmUgYWJsZSB0byBjaG9vc2Ug
b3B0aW1hbCBhc20gc2VxdWVuY2Ugd2hlbiBQSUUgYW5kIG5vbi1QSUUNCj4gaXMgcmVxdWVzdGVk
Pw0KDQpJIHdvdWxkbid0IGhhdmUgdGhvdWdodCB0aGF0IHBlcmZvcm1hbmNlIG1hdHRlcmVkIGlu
IHRoZSBhc20gY29kZQ0KdGhhdCBydW5zIGR1cmluZyBzdGFydHVwPw0KDQpXaGlsZSB4ODYtODQg
Y29kZSAoaWdub3JpbmcgZGF0YSByZWZlcmVuY2VzKSBpcyBwcmV0dHkgbXVjaCBhbHdheXMNCnBv
c2l0aW9uIGluZGVwZW5kZW50LCB0aGUgc2FtZSBpc24ndCB0cnVlIG9mIGFsbCBhcmNoaXRlY3R1
cmVzLg0KU29tZSAoYXQgbGVhc3QgTmlvcy1JSSkgb25seSBoYXZlIGFic29sdXRlIGNhbGwgaW5z
dHJ1Y3Rpb25zLg0KU28geW91IGNhbid0IHJlYWxseSBtb3ZlIHRvIHBpYyBjb2RlIGdsb2JhbGx5
Lg0KDQpZb3UnZCBhbHNvIHdhbnQgJ2JhZCcgcGljIGNvZGUgdGhhdCBjb250YWluZWQgc29tZSBm
aXh1cHMgdGhhdA0KbmVlZGVkIHRoZSBjb2RlIHBhdGNoaW5nLg0KKFdoaWNoIHlvdSByZWFsbHkg
ZG9uJ3Qgd2FudCBmb3IgYSBzaGFyZWQgbGlicmFyeS4pDQpPdGhlcndpc2UgeW91IGdldCBhbiBl
eHRyYSBpbnN0cnVjdGlvbiBmb3Igbm9uLXRyaXZpYWwgZGF0YQ0KYWNjZXNzZXMuDQoNClRoaW5r
aW5nLi4uLg0KRG9lc24ndCB0aGUgY29kZSBnZW5lcmF0ZWQgZm9yIC1mcGljIGFzc3VtZSB0aGF0
IHRoZSBkeW5hbWljIGxvYWRlcg0KaGFzIHByb2Nlc3NlZCB0aGUgcmVsb2NhdGlvbnMgYmVmb3Jl
IGl0IGlzIHJ1bj8NCkJ1dCB0aGUga2VybmVsIHN0YXJ0dXAgY29kZSBpcyBydW5uaW5nIGJlZm9y
ZSB0aGV5IGNhbiBoYXZlIGJlZW4gZG9uZT8NClNvIGV2ZW4gaWYgdGhhdCBDIGNvZGUgd2VyZSAn
cGljJyBpdCBjb3VsZCBzdGlsbCBjb250YWluIHRoaW5ncyB0aGF0DQphcmUgaW52YWxpZCAocHJv
YmFibHkgYXJyYXlzIG9mIHBvaW50ZXJzPykuDQpTbyB5b3UgbG9zZSBvbmUgc2V0IG9mIGJ1Z3Mg
YW5kIGdhaW4gYW5vdGhlci4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtl
c2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBV
Sw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==


