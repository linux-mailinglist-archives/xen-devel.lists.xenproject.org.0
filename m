Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D00C558D9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 22:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfs2V-0006qE-G5; Tue, 25 Jun 2019 20:27:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TDZb=UY=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hfs2T-0006q9-T2
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 20:27:37 +0000
X-Inumbo-ID: ab4ced8a-9787-11e9-8980-bc764e045a96
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab4ced8a-9787-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 20:27:36 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id s7so485164iob.11
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GngQt+7sYRsK1OaxlQ/AAphkBCKhFvpi+4RlYmLSsdo=;
 b=hrpYU19Z4SgwXiKr16cLK6WQV4S2la4/f1PlR6G7lmoaSudNQteKM00+GuHMXTX/p9
 BpxqCF1yD9f89RQpnq8xaFMkE9/hG+R0Gx9LiudPWCAcnG7ag0TTBQY0ZwsW0572rn0T
 /ZB+fAHi08qPUbYIKfvRGBZH+bJjTfqTmlL/dm5GmbIaOF98a8w3CDE0Bo8yfK7mn/Zd
 OHmVPagt4tVxJ8Ft8pMlXFV9jbJkkth/dSMGTUl3ktNnNASpb9mMgyVyvptksQHloi93
 o1vRjWQeY3FlvkrMU7tTY06p3MfyjXH5LLZ6Zz9ZcxEPs/VSuptZUO3N67hmUDiuZcnD
 kL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GngQt+7sYRsK1OaxlQ/AAphkBCKhFvpi+4RlYmLSsdo=;
 b=N1U2pf4fAv3UQsdDNWR6jtfIAGyyX8ZtvjrYqQcN2ZX4B/66STUUJEyXeRmh0t448l
 wbahSLWa6LiHXD2fSNu5tYCsmYwP3L9hmFKhZnHuY4Qig5YHfk36pTCXARFzpbxOE+v0
 rdauanVkQpJGGPrYh8XZQUy+NFQEx3KSu3CrL4frYdq83qym6Cz/Ie44CpOXzxt0F9Kb
 KCW9K0z5h0y53zXFWGyJZ6LSiraXQStXyKEEZLzrxQ4WnBWf3bYvhR3cWLenxMlOrkUf
 ERGfUkdqyzHC6JyE+RsseyLqxemwXGFt9HHepaYm37DXN9BxxKIVhfqkNLkuH2XuZ4jq
 FVQw==
X-Gm-Message-State: APjAAAVTu4/htwtVrqNdQBQothhotamLjMSrSoiKBRZ5emLY/W/xo9nj
 I2nTD7bId5iNgZrxXBDiun4=
X-Google-Smtp-Source: APXvYqyqvZxWpGFh+jWaI+UJHwhB93aaU/la7rzpRgvtT5EbQ4gCMSjrmjfxNl6hQNStGDfz0ovTyg==
X-Received: by 2002:a6b:8b0d:: with SMTP id n13mr585807iod.222.1561494455867; 
 Tue, 25 Jun 2019 13:27:35 -0700 (PDT)
Received: from [100.64.73.93] ([205.185.206.113])
 by smtp.gmail.com with ESMTPSA id t5sm13295034iol.55.2019.06.25.13.27.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 13:27:35 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <8eff1449-3e65-ed1c-6359-342a3df34d62@arm.com>
Date: Tue, 25 Jun 2019 16:27:34 -0400
Message-Id: <23191F9A-BDE0-4D9B-8F50-A87E9AA783FC@gmail.com>
References: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
 <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
 <FDD05784-1F9E-4654-8E79-3D432C571D4C@gmail.com>
 <8eff1449-3e65-ed1c-6359-342a3df34d62@arm.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen Project Community Call June 27th (instead of
 July 4th): @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian Woods <brian.woods@amd.com>, "Natarajan, Janakarajan" <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKdW4gMjUsIDIwMTksIGF0IDE2OjE3LCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPiB3cm90ZToKPiAKPiBIaSBSaWNoLAo+IAo+IE9uIDYvMjUvMTkgODozOCBQTSwgUmlj
aCBQZXJzYXVkIHdyb3RlOgo+Pj4gT24gSnVuIDI1LCAyMDE5LCBhdCAxMjozNiwgTGFycyBLdXJ0
aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToKPj4+IAo+Pj4gSGkgYWxsOgo+Pj4gcGxl
YXNlIGFkZCB5b3VyIGFnZW5kYSBpdGVtcy4gSSBoYWQgb25seSBPTkUgc2VyaWVzIHdoaWNoIHdh
cyBoaWdobGlnaHRlZCBhcyBuZWVkaW5nIGF0dGVudGlvbiBmcm9tIG90aGVycy4gSXMgdGhpcyBz
ZXJpb3VzbHkgdGhlIG9ubHkgb25lPwo+PiBQcm9wb3NlZCBhZ2VuZGEgaXRlbTogaW4gdGhlIGFi
c2VuY2Ugb2YgSmlyYSB0aWNrZXRzLCB3b3VsZCBpdCBiZSB1c2VmdWwgdG8gaGF2ZSBhIGxpc3Qg
KGUuZy4gZ2VuZXJhdGVkIGJ5IGEgc2NyaXB0KSB3aXRoIHRoZSBsaWZlY3ljbGUgc3RhdHVzIG9m
IGFsbCBvdXRzdGFuZGluZyBwYXRjaCBzZXJpZXMsIGUuZy4KPj4gTUVUQURBVEEKPj4gLSBidWcg
Zml4IC8gaW1wcm92ZW1lbnQgLyByZWZhY3RvciAvIGNsZWFudXAgLyBuZXcgZmVhdHVyZQo+PiAt
IGltcGFjdGVkIFhlbiBzdWJzeXN0ZW1zL2NvbXBvbmVudHMvZmVhdHVyZXMKPj4gLSB0YXJnZXRl
ZCB2ZXJzaW9uIG9mIFhlbgo+PiAtIGNvbnRyaWJ1dGluZyBwZXJzb24vb3JnCj4+IC0gcmVsZXZh
bmNlIG9mIHBhdGNoIHNlcmllcyB0byB0aGUgZ29hbHMgc2V0IGJ5IFJNIGZvciB0aGUgbmV4dCBY
ZW4gcmVsZWFzZQo+PiAtIHJlbGF0ZWQgcGF0Y2ggc2VyaWVzICh3aXRoIGJlbG93IHN0YXR1cyBp
bmZvKQo+PiBTVEFUVVM6Cj4+IC0gcGF0Y2ggc2VyaWVzIHZlcnNpb24KPj4gLSBkYXRlIG9mIHBh
dGNoIHNlcmllcyB2MQo+PiAtIG5vIHJlc3BvbnNlcyByZWNlaXZlZCArIHBpbmcgY291bnQgKyBk
YXlzIHNpbmNlIHN1Ym1pc3Npb24gKyBkYXlzIHNpbmNlIHBpbmcKPj4gLSByZXZpZXdlZCB3aXRo
IG9iamVjdGlvbnMKPj4gLSByZXZpZXdlZCB3aXRob3V0IG9iamVjdGlvbnMsIGF3YWl0aW5nIGFj
awo+PiAtIGFja2VkLCBhd2FpdGluZyBtZXJnZQo+PiBGcm9tIHN1Y2ggYSBzdW1tYXJ5LCBwYXRj
aCBzZXJpZXMgY291bGQgYmUgcHJpb3JpdGl6ZWQgZm9yIHJldmlldy90cmlhZ2UgaW4gdGhlIGNv
bW11bml0eSBjYWxsLCBiYXNlZCBvbiB1bmlmb3JtIGNyaXRlcmlhIGFuZCBwcm9qZWN0LXdpZGUg
Y29udGV4dC4KPiAKPiBXaGlsZSBJIHRoaW5rIHJhaXNpbmcgYXdhcmVuZXNzIG9mIHRoZSBzdHVj
ayBzZXJpZXMgaXMgYSBnb29kIGlkZWEuIEkgc3RpbGwgaGF2ZSBzb21lIGNvbmNlcm4gcmVnYXJk
aW5nIHRoZSBwcmlvcml0aXphdGlvbi4gV2hvIGlzIGdvaW5nIHRvIGNvbnN1bWUgdGhlIHJlc3Vs
dCBvZiB0aGUgZGlzY3Vzc2lvbj8gSXMgaXQgdGhlIG1haW50YWluZXJzPwoKQW55b25lIHdobyB0
eXBpY2FsbHkgYW5zd2VycyB0aGUgcXVlc3Rpb24gcmFpc2VkIGJ5IExhcnMgaW4gdGhpcyB0aHJl
YWQsIHByZXN1bWFibHkgYSBzdWJzZXQgb2YgY2FsbCBhdHRlbmRlZXMuCgpSaWNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
