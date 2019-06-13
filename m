Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8343AA0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 17:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbRVx-0003gd-0t; Thu, 13 Jun 2019 15:19:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Ild=UM=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hbRVv-0003gY-5v
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 15:19:43 +0000
X-Inumbo-ID: aa030ed9-8dee-11e9-8980-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aa030ed9-8dee-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 15:19:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x15so10643994wmj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zentific-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ntnDAQF3aQIXVfu3U18nbpMDKQ6yys0j8bZheOXLG0g=;
 b=CPYiimtEpyxEEEBRP6ZCBIbuRKkBOqc7mk9uhlnfESJcgSq6WBthHJqK18ECRwqoD4
 mE5zGeTOfofoZkW2RJii9M7H5PaDQyVXL+dgaRmPKFkSXr4lYRmCZP85YnOpUtFCLpHL
 l/QWdAEb2GiV0qUE5GLmzFBI0NlmLAZah6kPdsGor3FGUW6+sGl6vsAORj98FblsVN8O
 37FyJwVcim6YoNjOBX+gv30YWAPMmg9QgdiTYYZAjDnd+/P8huNFM4C21ZFPedLDOrE4
 J9gXSS2wC7KPtSlpV9zonsqRZfh8wm0p98zUEqdtACFnbFwYXEnum/NbSa8yCLNBOuMi
 qMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ntnDAQF3aQIXVfu3U18nbpMDKQ6yys0j8bZheOXLG0g=;
 b=Ho2paEsU2FPEA17shD0FhA2Wi2/7EsHS1cjenyAm7FreRLriVPqP80R4qnVqWVkVmr
 3PPrI/gk4S4U8pI2nK+vjzPK75ubA+vlgiUZr5O0hDxWtlFjpVQiaQkj3tNn1mbmxCWp
 MhGp+LagSCkCjotnh7cxZIAm1CJo+G+wcNPsjSxdFB11WuTgeQGWqUwchattJCegW1R/
 VxmdEcowEFhZaNy1EUOJkOCc2akoRFlto6O/W62jhBxJqV3DED96jNb1sgZgbkcU/wrd
 MJROF4ZcCqkzp/CBi9GiVzouojrSlSmhaVZHURn3KOmJcsonwz4Z4paB+2AKvRPbk4vC
 nVsQ==
X-Gm-Message-State: APjAAAV8MOXurLLX77PEyvpMbIS7OaucuzKHdtQD9pv6rEq0LIYtHhUv
 LwQmxtGY8YUUDq1lu8ONdq+Bd57NtqGox9jkW8k=
X-Google-Smtp-Source: APXvYqxb3yzC0Y15YnGM1j1kTZwm8+vgnBR03wJ/PvDWy5fiCQlStP2NyaEK1DTEOJDkmcx/CXhGB7AN5OjhsA//HM0=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr4262748wmc.169.1560439179972; 
 Thu, 13 Jun 2019 08:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
In-Reply-To: <20180926164741.13405-2-george.dunlap@citrix.com>
From: Tamas Lengyel <tamas.lengyel@zentific.com>
Date: Thu, 13 Jun 2019 09:19:04 -0600
Message-ID: <CABfawh=+ufjv--79mJMJ685TYvDDh-O6v-rgw7hTcNXf8adXZQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
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
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Isaila Alexandru <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMTA6NDkgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IEZyb206IElzYWlsYSBBbGV4YW5kcnUgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGFjY2VzcyBjb250cm9sIGZv
ciBOUFQgbW9kZS4KPgo+IFRoZXJlIGFyZW7igJl0IGVub3VnaCBleHRyYSBiaXRzIHRvIHN0b3Jl
IHRoZSBhY2Nlc3MgcmlnaHRzIGluIHRoZSBOUFQgcDJtCj4gdGFibGUsIHNvIHdlIGFkZCBhIHJh
ZGl4IHRyZWUgdG8gc3RvcmUgZXh0cmEgaW5mb3JtYXRpb24uCj4KPiBGb3IgZWZmaWNpZW5jeToK
PiAgLSBPbmx5IGFsbG9jYXRlIHRoaXMgcmFkaXggdHJlZSB3aGVuIHdlIGZpcnN0IHN0b3JlICJu
b24tZGVmYXVsdCIKPiAgICBleHRyYSBpbmZvcm1hdGlvbgo+Cj4gIC0gUmVtb3ZlIGVudGlyZXMg
d2hpY2ggbWF0Y2ggdGhlIGRlZmF1bHQgZXh0cmEgaW5mb3JtYXRpb24gcmF0aGVyCj4gICAgdGhh
biBjb250aW51aW5nIHRvIHN0b3JlIHRoZW0KPgo+ICAtIEZvciBzdXBlcnBhZ2VzLCBvbmx5IHN0
b3JlIGFuIGVudHJ5IGZvciB0aGUgZmlyc3QgZ2ZuIGluIHRoZQo+ICAgIHN1cGVycGFnZS4gIFVz
ZSB0aGUgb3JkZXIgb2YgdGhlIHAybSBlbnRyeSBiZWluZyByZWFkIHRvIGRldGVybWluZQo+ICAg
IHRoZSBwcm9wZXIgcGxhY2UgdG8gbG9vayBpbiB0aGUgcmFkaXggdGFibGUuCj4KPiBNb2RpZnkg
cDJtX3R5cGVfdG9fZmxhZ3MoKSB0byBhY2NlcHQgYW5kIGludGVycHJldCBhbiBhY2Nlc3MgdmFs
dWUsCj4gcGFyYWxsZWwgdG8gdGhlIGVwdCBjb2RlLgo+Cj4gQWRkIGEgc2V0X2RlZmF1bHRfYWNj
ZXNzKCkgbWV0aG9kIHRvIHRoZSBwMm0tcHQgYW5kIHAybS1lcHQgdmVyc2lvbnMKPiBvZiB0aGUg
cDJtIHJhdGhlciB0aGFuIHNldHRpbmcgaXQgZGlyZWN0bHksIHRvIGRlYWwgd2l0aCBkaWZmZXJl
bnQKPiBkZWZhdWx0IHBlcm1pdHRlZCBhY2Nlc3MgdmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKVGhlIG1lbV9hY2Nl
c3MvbW9uaXRvciBiaXRzIGFyZSBmYWlybHkgdHJpdmlhbDoKCkFja2VkLWJ5OiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cgo+IC0tLQo+IE5CLCB0aGlzIGlzIGNvbXBpbGUt
dGVzdGVkIG9ubHkuCgpBcmUgeW91IHBsYW5uaW5nIHRvIGRvIHNvbWUgYWN0dWFsIHRlc3Rpbmc/
IEkgd291bGQgaGlnaGx5IHJlY29tbWVuZAp0aGF0IHdlIHNlZSByZWFsIHRlc3QgcmVzdWx0cyBi
ZWZvcmUgdGhpcyBpcyBtZXJnZWQgdG8gdmVyaWZ5CmZ1bmN0aW9uYWxpdHkuCgpUaGFua3MsClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
