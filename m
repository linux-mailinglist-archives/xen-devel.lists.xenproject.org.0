Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864357CCEE
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 21:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuO6-0007aM-TH; Wed, 31 Jul 2019 19:35:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=92Dq=V4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hsuO5-0007aH-77
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 19:35:49 +0000
X-Inumbo-ID: 64fa10e7-b3ca-11e9-8980-bc764e045a96
Received: from mail-qk1-x72f.google.com (unknown [2607:f8b0:4864:20::72f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 64fa10e7-b3ca-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 19:35:47 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id g18so50106477qkl.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Zar7FJGnGb8n0nJ11eSRN+Uv1aRhhmOh0eN+oRHdCc=;
 b=I0qU/EBmpUJC7nQKNbIjTTxlq7NnBrMLwwHLOuzZI1VT8ocA2az1pbnbnaj2466h3n
 39v2eZG5wxFMySeDAEvxjx7YXzbRqtGu/yregtvgwp6yEbtTsWj3+A9rxXIhmYqlxTy0
 1IkBbEhUCEqXhGM8Cu+EggyZmem8CF28aMBMHj9RLvIcml/tkVF7LygmEHzyd+WhztYw
 Ly5Im3OjXVyA6dqAFmDm6pIb+vyNicqsBNZ+eq50S0jVBXj52BKQuj1jEpm56KsOgG7f
 xzf9zJ9kCMbXAAYC3TxM654VjEEx0VmDkvoVUim02qjWklv44is0xUe6q+K+wZnGKe26
 U+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Zar7FJGnGb8n0nJ11eSRN+Uv1aRhhmOh0eN+oRHdCc=;
 b=A7qDUo3dWlcVBDzgo6OXHCwuvRZgkquRzeNuqwrAZ02mAqswtyt9sMZ7qTOmk0zCcl
 20VVLQy0BqPjqnhs/kWsCt7AJYv5ixAnmrNxmayzhK1r4JhKdSo0OVR5nXFTdwibR00T
 JE81iEB/lH/xz3vY+KNA3bTO9ISxVHZ8ByiWS2e/PLJe2KLB5J3G/zzXTZ9rRv7Hq9rH
 Fb80pi75mJyO3rpP7aWtxsXoIfio6wFGBk67oqIAsZsyyRtfhjwrtkAJPG0m3+YMQ52F
 VzUZJa+Fjf9j+PGQTdb4MgPGwtHNYITiuWzN+H1ojQeRDFs3MnUIeg7IPDUp/yD24yQn
 DuTQ==
X-Gm-Message-State: APjAAAWlW2A0C5rQl8EaSgKC+ircx329TdVoP2Y1fQ7+J4fWOZY3UV5M
 jcUQCekeSm6Z7MUL/tWgOsNtSyOn/7+5kqMMxnZVjA==
X-Google-Smtp-Source: APXvYqzOla1ViOZeqYzN2fH9QHMqIfIS2X6msqewCsx8SFKJHdImqvgc0KPxZnTAn9mtQMY5xavi3pbwq3FPTIQJrG0=
X-Received: by 2002:a05:620a:247:: with SMTP id
 q7mr87167968qkn.265.1564601746733; 
 Wed, 31 Jul 2019 12:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
In-Reply-To: <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 31 Jul 2019 12:35:35 -0700
Message-ID: <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTo0MyBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMDozNjoz
MUFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMzAsIDIw
MTkgYXQgMTA6NTU6MjRBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+ID4gU29y
cnkgLS0gZ290IGEgYml0IGRpc3RyYWN0ZWQgeWVzdGVyZGF5LiBBdHRhY2hlZCBpcyB0aGUgbG9n
IHdpdGggb25seQo+ID4gPiB5b3VyIGxhdGVzdCBwYXRjaCBhdHRhY2hlZC4gSW50ZXJlc3Rpbmds
eSBlbm91Z2ggdGhlIGJveCBib290ZWQgZmluZQo+ID4gPiB3aXRob3V0IHNjcmVlbiBhcnRpZmFj
dHMuIFNvIEkgZ3Vlc3Mgd2UncmUgZ2V0dGluZyBjbG9zZXIuLi4KPiA+ID4KPiA+ID4gVGhhbmtz
IGZvciBhbGwgdGhlIGhlbHAhCj4gPgo+ID4gVGhhdCdzIHF1aXRlIHdlaXJkLCB0aGVyZSdzIG5v
IGZ1bmN0aW9uYWwgY2hhbmdlcyBiZXR3ZWVuIHRoZQo+ID4gcHJldmlvdXMgcGF0Y2hlcyBhbmQg
dGhpcyBvbmUsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhhdCB0aGlzIHBhdGNoCj4gPiBoYXMg
bW9yZSB2ZXJib3NlIG91dHB1dC4KPiA+Cj4gPiBBcmUgeW91IHN1cmUgeW91IGRpZG4ndCBoYXZl
IGFueSBsb2NhbCBwYXRjaGVzIG9uIHRvcCBvZiBYZW4gdGhhdAo+ID4gY291bGQgZXhwbGFpbiB0
aGlzIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3VyPwo+Cj4gRldJVywgY2FuIHlvdSBwbGVhc2UgdHJ5
IHRoZSBwbGFpbiBwYXRjaCBhZ2FpbjoKPgo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTU0Ny5odG1sCj4KPiBBbmQgcmVw
b3J0IGJhY2s/Cj4KPiBJIHdvdWxkIGxpa2UgdG8gZ2V0IHRoaXMgY29tbWl0dGVkIEFTQVAgaWYg
aXQgZG9lcyBmaXggeW91ciBpc3N1ZS4KCkknZCBsaWtlIHRvIHNheSB0aGF0IGl0IGRpZCAtLSBi
dXQgSSB0cmllZCBpdCBhZ2FpbiBqdXN0IG5vdyBhbmQgaXQKc3RpbGwgZ2FyYmxlZCBzY3JlZW4g
YW5kIHRvbnMgb2Y6CgooWEVOKSBwcmludGs6IDI2NjY1IG1lc3NhZ2VzIHN1cHByZXNzZWQuCihY
RU4pIFtWVC1EXURNQVI6W0RNQSBSZWFkXSBSZXF1ZXN0IGRldmljZSBbMDAwMDowMDowMi4wXSBm
YXVsdCBhZGRyCjhlMTRjMDAwLCBpb21tdSByZWcgPSBmZmZmODJjMDAwOGRlMDAwCgpJJ20gdmVy
eSBtdWNoIGNvbmZ1c2VkIGJ5IHdoYXQncyBnb2luZyBvbiwgYnV0IGl0IHNlZW1zIHRoYXQncyB0
aGUKY2FzZSAtLSBhZGRpbmcgdGhvc2UgZGVidWcgcHJpbnQgc3RhdGVtZW50cyBtYWtlIHRoZSBp
c3N1ZSBnbyBhd2F5CgpIZXJlIGFyZSB0aGUgcGF0Y2hlcyB0aGF0IGFyZSBiZWluZyBhcHBsaWVk
OgogICBOT1QgV09SS0lORzoKaHR0cHM6Ly9naXRodWIuY29tL3J2cy9ldmUvYmxvYi94ZW4tYnVn
L3BrZy94ZW4vMDEtaW9tbXUtbWFwcGluZ3MucGF0Y2gKCiAgIFdPUktJTkc6IGh0dHBzOi8vZ2l0
aHViLmNvbS9ydnMvZXZlL2Jsb2IvYTEyOTFmY2Q0ZTY2OWRmMmE2MzI4NWFmYjVlOGI0ODQxZjQ1
YzFjOC9wa2cveGVuLzAxLWlvbW11LW1hcHBpbmdzLnBhdGNoCgpBdCB0aGlzIHBvaW50IEknbSBy
ZWFsbHkgbm90IHN1cmUgd2hhdCdzIGdvaW5nIG9uLgoKVGhhbmtzLApSb21hbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
