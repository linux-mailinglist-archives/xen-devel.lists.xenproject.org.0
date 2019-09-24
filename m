Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F181BD4C7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 00:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCsqO-0000kQ-H4; Tue, 24 Sep 2019 21:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B2n8=XT=kernel.org=robh+dt@srs-us1.protection.inumbo.net>)
 id 1iCsqM-0000kL-Ly
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 21:59:34 +0000
X-Inumbo-ID: 971da3b2-df16-11e9-9627-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 971da3b2-df16-11e9-9627-12813bfff9fa;
 Tue, 24 Sep 2019 21:59:33 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67DE621848
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569362372;
 bh=7EnBQLGJXbJ0krx6sf9eAXMt0SpVcFYHvJ4Ffxc+GEI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZUjBfJ5y+ysHUqZVHvVQV6vmXEF5m5l7X/D3o8MMo6T+fnXCBe1Len91UdIVSmNm8
 1+IgmCK2yWkyLXKdLfON0wTF2uVY6/Zj+z4CbqBQ8S1mTFhTzxJ4K+kIhlIbeitlp5
 qXtcO6SJzhSJ74/8s14mN0YBxYms1LJJP0SwTimA=
Received: by mail-qt1-f176.google.com with SMTP id r5so4121300qtd.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 14:59:32 -0700 (PDT)
X-Gm-Message-State: APjAAAXUpo/EwgYh+qNcVsCMjwak7DRdzxmn9gfNtiA579vqeufzFn21
 3zQy8NSt1y50xSy3vrSw+OrEJY7Hi/kWjsoLeg==
X-Google-Smtp-Source: APXvYqxu7lx2ORNXYuD01RyoAdK8YY//zQYn3oJnMVZaPVMMDgXcioCqkbUXveNdRfpBkQzN/4OY/SjTncH5t1k8eUk=
X-Received: by 2002:ac8:6982:: with SMTP id o2mr5274643qtq.143.1569362371529; 
 Tue, 24 Sep 2019 14:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 24 Sep 2019 16:59:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
Message-ID: <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Xen-devel] [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMToxMiBQTSBOaWNvbGFzIFNhZW56IEp1bGllbm5lCjxu
c2FlbnpqdWxpZW5uZUBzdXNlLmRlPiB3cm90ZToKPgo+IEhpIEFsbCwKPiB0aGlzIHNlcmllcyB0
cmllcyB0byBhZGRyZXNzIG9uZSBvZiB0aGUgaXNzdWVzIGJsb2NraW5nIHVzIGZyb20KPiB1cHN0
cmVhbWluZyBCcm9hZGNvbSdzIFNUQiBQQ0llIGNvbnRyb2xsZXJbMV0uIE5hbWVseSwgdGhlIGZh
Y3QgdGhhdAo+IGRldmljZXMgbm90IHJlcHJlc2VudGVkIGluIERUIHdoaWNoIHNpdCBiZWhpbmQg
YSBQQ0kgYnVzIGZhaWwgdG8gZ2V0IHRoZQo+IGJ1cycgRE1BIGFkZHJlc3NpbmcgY29uc3RyYWlu
dHMuCj4KPiBUaGlzIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IG9mX2RtYV9jb25maWd1cmUoKSBh
c3N1bWVzIGl0J3MgcmVjZWl2aW5nIGEKPiBEVCBub2RlIHJlcHJlc2VudGluZyB0aGUgZGV2aWNl
IGJlaW5nIGNvbmZpZ3VyZWQsIGFzIG9wcG9zZWQgdG8gdGhlIFBDSWUKPiBicmlkZ2Ugbm9kZSB3
ZSBjdXJyZW50bHkgcGFzcy4gVGhpcyBjYXVzZXMgdGhlIGNvZGUgdG8gZGlyZWN0bHkganVtcAo+
IGludG8gUENJJ3MgcGFyZW50IG5vZGUgd2hlbiBjaGVja2luZyBmb3IgJ2RtYS1yYW5nZXMnIGFu
ZCBtaXNzZXMKPiB3aGF0ZXZlciB3YXMgc2V0IHRoZXJlLgo+Cj4gVG8gYWRkcmVzcyB0aGlzIEkg
Y3JlYXRlIGEgbmV3IEFQSSBpbiBPRiAtIGluc3BpcmVkIGZyb20gUm9iaW4gTXVycGh5cwo+IG9y
aWdpbmFsIHByb3Bvc2FsWzJdIC0gd2hpY2ggYWNjZXB0cyBhIGJ1cyBEVCBub2RlIGFzIGl0J3Mg
aW5wdXQgaW4KPiBvcmRlciB0byBjb25maWd1cmUgYSBkZXZpY2UncyBETUEgY29uc3RyYWludHMu
IFRoZSBjaGFuZ2VzIGdvIGRlZXAgaW50bwo+IG9mL2FkZHJlc3MuYydzIGltcGxlbWVudGF0aW9u
LCBhcyBhIGRldmljZSBiZWluZyBoYXZpbmcgYSBEVCBub2RlCj4gYXNzdW1wdGlvbiB3YXMgcHJl
dHR5IHN0cm9uZy4KPgo+IE9uIHRvcCBvZiB0aGlzIHdvcmssIEkgYWxzbyBjbGVhbmVkIHVwIG9m
X2RtYV9jb25maWd1cmUoKSByZW1vdmluZyBpdHMKPiByZWR1bmRhbnQgYXJndW1lbnRzIGFuZCBj
cmVhdGluZyBhbiBhbHRlcm5hdGl2ZSBmdW5jdGlvbiBmb3IgdGhlIHNwZWNpYWwgY2FzZXMKPiBu
b3QgYXBwbGljYWJsZSB0byBlaXRoZXIgdGhlIGFib3ZlIGNhc2Ugb3IgdGhlIGRlZmF1bHQgdXNh
Z2UuCj4KPiBJTU8gdGhlIHJlc3VsdGluZyBmdW5jdGlvbnMgYXJlIG1vcmUgZXhwbGljaXQuIFRo
ZXkgd2lsbCBwcm9iYWJseQo+IHN1cmZhY2Ugc29tZSBoYWNreSB1c2FnZXMgdGhhdCBjYW4gYmUg
cHJvcGVybHkgZml4ZWQgYXMgSSBzaG93IHdpdGggdGhlCj4gRFQgZml4ZXMgb24gdGhlIExheWVy
c2NhcGUgcGxhdGZvcm0uCj4KPiBUaGlzIHdhcyBhbHNvIHRlc3RlZCBvbiBhIFJhc3BiZXJyeSBQ
aSA0IHdpdGggYSBjdXN0b20gUENJZSBkcml2ZXIgYW5kCj4gb24gYSBTZWF0dGxlIEFNRCBib2Fy
ZC4KCkh1bW0sIEkndmUgYmVlbiB3b3JraW5nIG9uIHRoaXMgaXNzdWUgdG9vLiBMb29rcyBzaW1p
bGFyIHRob3VnaCB5b3VycwpoYXMgYSBsb3QgbW9yZSBjaHVybiBhbmQgdGhlcmUncyBzb21lIG90
aGVyIGJ1Z3MgSSd2ZSBmb3VuZC4KCkNhbiB5b3UgdGVzdCBvdXQgdGhpcyBicmFuY2hbMV0uIEkg
ZG9uJ3QgaGF2ZSBhbnkgaC93IG5lZWRpbmcgdGhpcywKYnV0IHdyb3RlIGEgdW5pdHRlc3QgYW5k
IHRlc3RlZCB3aXRoIG1vZGlmaWVkIFFFTVUuCgpSb2IKClsxXSBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcm9iaC9saW51eC5naXQgZG1hLW1hc2tzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
