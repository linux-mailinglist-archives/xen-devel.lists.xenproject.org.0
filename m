Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6877E21A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 20:22:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htFg1-00064n-8y; Thu, 01 Aug 2019 18:19:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIOK=V5=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1htFg0-00064i-FF
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 18:19:44 +0000
X-Inumbo-ID: eeb98722-b488-11e9-8980-bc764e045a96
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eeb98722-b488-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 18:19:42 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r4so52698709qkm.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zNZS1Cf26NTXewvSc3MzrLOx/GVHbYBowBUxXXpJQG0=;
 b=Ndmz/Q/ToDbA2OjOH1IedR6d/3P5P0Un8aZsg9Z/x4IepOu+3RNkKstxZ2PXuUK7lD
 975yRj0aPWuqIu6fkyboSvAm8Dot4VtC/43ez0z98vw2dx6WWUGdxAD4Q//Y6Tm4ZhPT
 KrClMoEKofVJJUpLPZfDczhEmyD/WOdHQeDDrcI+DX12Pp14ZmqbDm8640n1Vm8vRh1D
 qehJolop40WfjicXnKnX9hLh2+scMSnnw5uQs4jBjJmpJKMVhUznaiPw8ORLuqyWZKQw
 50jHWHTLmNXixYsAv7L64qKjMwZ7Cr8/YaO2FYfsq/S2Nrf4K4c88Cgq7DhNA4treSUK
 SPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zNZS1Cf26NTXewvSc3MzrLOx/GVHbYBowBUxXXpJQG0=;
 b=N36Gtbi+7HPVNd+KKwIm+vwqy1S7aFeBP2N94Gx9rE1vnySvMb5IOzgdXb0w+XMK9s
 cIp/hG4SCGYHSiMRjm7JxnvRpEb9NFAunjQLpwVtoWEoEfJnwL0vFo5WzeAlPIzBtFQu
 4Ptj0aC71IFP/RJaAhmksxd1f3BexEZrcjHsOADneet5X+BBPHM2OqKUYsluc19UxJ2E
 +AAdvmYTKZ7KHFRRPMxsUyVe6tZP3cbvMVZhB26OR3GJRZJF4x6yXwyx1ifStxmFsS6G
 uBzS2jfEcbNHegPbhJY/SPHk4VDQY8hkwLEuJScmPBfHsqgFp93TPiBhY3eB+N/5rep2
 0jrw==
X-Gm-Message-State: APjAAAXxKqt6wxxqiywLLnfX3W9Ht+ctz08pmeZXsGfBbpg55bLiyDjV
 FJxhrVLNMa++/IfVeDeLiUoiKXCm9p2vAKeE3EmuFg==
X-Google-Smtp-Source: APXvYqy7PIiQuR1N5HqJPQeO/1WReoh4QLnFfvbcqEznkyIYtrp30s1e/fPNS/OGPZ7hnxGb20NUSK45GgqnqmP5KII=
X-Received: by 2002:a37:a7d2:: with SMTP id
 q201mr58724432qke.403.1564683582164; 
 Thu, 01 Aug 2019 11:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <CAMmSBy85tZjSA7Yd2HG=F4dmK8uzxXPVY20UwAaNGYhJ1LjzKA@mail.gmail.com>
 <20190801084509.rdfoxya5lkjmoidq@Air-de-Roger>
In-Reply-To: <20190801084509.rdfoxya5lkjmoidq@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 1 Aug 2019 11:19:30 -0700
Message-ID: <CAMmSBy-myHf0ZkpStFDsn_C+R8D7=cGSWD8hFgO5BhRX2LQ=mw@mail.gmail.com>
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

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAxOjQ1IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDEyOjMwOjA0
UE0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAzMSwgMjAx
OSBhdCAxOjM2IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTA6NTU6MjRBTSAtMDcwMCwg
Um9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+ID4gPiBTb3JyeSAtLSBnb3QgYSBiaXQgZGlzdHJh
Y3RlZCB5ZXN0ZXJkYXkuIEF0dGFjaGVkIGlzIHRoZSBsb2cgd2l0aCBvbmx5Cj4gPiA+ID4geW91
ciBsYXRlc3QgcGF0Y2ggYXR0YWNoZWQuIEludGVyZXN0aW5nbHkgZW5vdWdoIHRoZSBib3ggYm9v
dGVkIGZpbmUKPiA+ID4gPiB3aXRob3V0IHNjcmVlbiBhcnRpZmFjdHMuIFNvIEkgZ3Vlc3Mgd2Un
cmUgZ2V0dGluZyBjbG9zZXIuLi4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgYWxsIHRoZSBo
ZWxwIQo+ID4gPgo+ID4gPiBUaGF0J3MgcXVpdGUgd2VpcmQsIHRoZXJlJ3Mgbm8gZnVuY3Rpb25h
bCBjaGFuZ2VzIGJldHdlZW4gdGhlCj4gPiA+IHByZXZpb3VzIHBhdGNoZXMgYW5kIHRoaXMgb25l
LCB0aGUgb25seSBkaWZmZXJlbmNlIGlzIHRoYXQgdGhpcyBwYXRjaAo+ID4gPiBoYXMgbW9yZSB2
ZXJib3NlIG91dHB1dC4KPiA+Cj4gPiBUaGF0J3Mgc3VwZXIgd2VpcmQgaW5kZWVkLiBJJ20gcmUt
dHJ5aW5nIHlvdXIgdmVyeSBmaXJzdCBwYXRjaCByaWdodAo+ID4gbm93IHRvIHNlZSBpZiBpdCBt
YXkgYmUgYSBwaWxvdCBlcnJvciBvbiBteSBwYXJ0IChob3BlIG5vdCkuCj4gPgo+ID4gPiBBcmUg
eW91IHN1cmUgeW91IGRpZG4ndCBoYXZlIGFueSBsb2NhbCBwYXRjaGVzIG9uIHRvcCBvZiBYZW4g
dGhhdAo+ID4gPiBjb3VsZCBleHBsYWluIHRoaXMgZGlmZmVyZW5jZSBpbiBiZWhhdmlvdXI/Cj4g
Pgo+ID4gUHJldHR5IHN1cmUgLS0gYnV0IGxldCBtZSBwdXNoIG15IGJyYW5jaCBpbiBFVkUgYW5k
IHNob3cgdG8geW91IGFsbAo+ID4gKHlvdSB3aWxsIG5lZWQgRG9ja2VyIGluc3RhbGxlZCB0byBi
dWlsZCBYZW4gdGhlIHdheSBFVkUgZG9lcykuCj4KPiBJJ20gYWZyYWlkIGl0J3MgcXVpdGUgaGFy
ZCBmb3IgbWUgdG8gZmlndXJlIG91dCB3aGV0aGVyIHlvdSBoYXZlIGFueQo+IHBhdGNoZXMgb24g
dG9wIG9mIFhlbiBvciBub3QuCgpJdCBpcyBhY3R1YWxseSBzdXBlciBzaW1wbGUuIFdlIHVzZSBE
b2NrZXIgY29udGFpbmVycyBhcyBtZXRob2QgZm9yCmd1YXJhbnRlZWluZyB0aGF0IG91ciBidWls
ZCBlbnZpcm9ubWVudCBpcyBhbHdheXMgcHJpc3RpbmUgYW5kIGNvbnRyb2xsZWQuClByZWNpc2Vs
eSB0byBhdm9pZCB0aGlzIHR5cGUgb2YgaXNzdWVzIGxpa2UgcmFuZG9tIHBhdGNoZXMgZ2V0dGlu
ZyBpbiwgZXRjLgoKU28uLi4gbGV0IG1lIGV4cGxhaW4gKG5vdCBzbyBtdWNoIHRvIGNvbnZpbmNl
IHlvdSB0byB1c2UgaXQsIGJ1dCByYXRoZXIKdG8gaGF2ZSBhbiBleHRyYSBwYWlyIG9mIGV5ZSBv
biBhbiBvZmYgY2hhbmNlIHRoYXQgSSBhY3R1YWxseSBtaXNzZWQKc29tZXRoaW5nKToKCkFsbCBv
ZiBvdXIgYnVpbGRzIHN0ZXBzIGFyZSBjYXB0dXJlZCBpbiB0aGUgZm9sbG93aW5nIERvY2tlcmZp
bGU6CiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ydnMvZXZlL2Jsb2IveGVuLWJ1Zy9wa2cveGVu
L0RvY2tlcmZpbGUKaXQgaXMgYmFzZWQgb24gQWxwaW5lIExpbnV4IDMuNyBhbmQgd2Ugb25seSBp
bnN0YWxsIHRoZSBmb2xsb3dpbmcKcGFja2FnZXMgaW50byBhIHByaW50aW5nIEFscGluZToKICAg
ICAgaHR0cHM6Ly9naXRodWIuY29tL3J2cy9ldmUvYmxvYi94ZW4tYnVnL3BrZy94ZW4vRG9ja2Vy
ZmlsZSNMNQp0aGVuIHdlIHByb2NlZWQgd2l0aCBkb3dubG9hZGluZyBYZW4gZnJvbSBhIHByaW50
aW5nIHVwc3RlcmFtCnRhcmJhbGw6CiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ydnMvZXZlL2Js
b2IveGVuLWJ1Zy9wa2cveGVuL0RvY2tlcmZpbGUjTDM2CmFuZCBvbmx5IGFwcGx5IHBhdGNoZXMg
dGhhdCBzaXQgbmV4dCB0byB0aGUgRG9ja2VyZmlsZSBhbmQgaGF2ZQpwYXRjaCBmaWxlIGV4dGVu
c2lvbjoKICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3J2cy9ldmUvYmxvYi94ZW4tYnVnL3BrZy94
ZW4vRG9ja2VyZmlsZSNMNTAKCkF0IHRoaXMgcG9pbnQgdGhpcyBpcyBhIHNpbmdsZSBwYXRjaDoK
ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3J2cy9ldmUvYmxvYi94ZW4tYnVnL3BrZy94ZW4vMDEt
aW9tbXUtbWFwcGluZ3MucGF0Y2gKdGhlcmUncyBsaXRlcmFsbHkgbm90aGluZyBlbHNlIGluIHRo
YXQgZm9sZGVyOgogICAgICBodHRwczovL2dpdGh1Yi5jb20vcnZzL2V2ZS9ibG9iL3hlbi1idWcv
cGtnL3hlbgoKVGhlbiB3ZSBwcm9jZWVkIHdpdGggYnVpbGRpbmcgWGVuIGluIGEgdmVyeSB2YW5p
bGxhIGZhc2hpb246CiAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ydnMvZXZlL2Jsb2IveGVuLWJ1
Zy9wa2cveGVuL0RvY2tlcmZpbGUjTDY0CgpUaGF0J3MgaXQhIFRoYXQncyBsaXRlcmFsbHkgYWxs
IHRoZSBidWlsZCBsb2dpYy4KCj4gRm9yIGZ1cnRoZXIgdGVzdGluZyBjYW4geW91IG1ha2Ugc3Vy
ZSB5b3UgZG9uJ3QgaGF2ZSBhbnkgY3VzdG9tCj4gcGF0Y2hlcyBvbiB0b3Agb2YgWGVuIChpZiB5
b3UgaW5kZWVkIGhhZCBhbnkgaW4gdGhlIHByZXZpb3VzCj4gYXR0ZW1wdHMpPwoKSSBkb24ndCB0
aGluayB0aGVyZSdzIGFueSB3YXkgZm9yIGV4dHJhIHBhdGNoZXMgdG8gc25lYWsgaW4sIGJ1dCBw
bGVhc2UKc2VlIHRoZSBhYm92ZSBleHBsYW5hdGlvbi4KClRoYW5rcywKUm9tYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
