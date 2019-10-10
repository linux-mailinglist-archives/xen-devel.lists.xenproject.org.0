Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE73D2DD8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:36:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaQS-0000tu-5J; Thu, 10 Oct 2019 15:32:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0VXC=YD=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1iIaQQ-0000tp-Hf
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:32:22 +0000
X-Inumbo-ID: 26a0ac7e-eb73-11e9-931e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26a0ac7e-eb73-11e9-931e-12813bfff9fa;
 Thu, 10 Oct 2019 15:32:21 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E479E21835
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570721541;
 bh=OCbNHp9XfcUM0QmcYZHuxvuZ72tVMIWV5NkzlJUXnf4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nHVklzU1lmcKAHuGh682Tq/tEEzBngD2WqvYJqJr7e4qIvJg1BX+gBZgdqqPWMH5f
 qJgvNTw/UJT6GKgfZIqF0duoSeK+X8hMiQA4tzIQ0rxN6MaDu9wQfYcfGU9HYGF4KB
 iIVLMM6CpdQSoU0lwlicUbBsLkgjoftACQGyj35E=
Received: by mail-yb1-f173.google.com with SMTP id v1so2061125ybo.11
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 08:32:20 -0700 (PDT)
X-Gm-Message-State: APjAAAXYNU/42bCTQ+ROnGvGggxzVa8ZizIc9WAXV63YVhmk/zU7nrtl
 W3Us1LMPurbt4R37reUOSn7CCUXlgJcMRvFcFg==
X-Google-Smtp-Source: APXvYqzEPhAkVCbQQjjzo3IU4PJ7Pf1s3lEphJMuRfUgT2YpW+iGwzGZuhEIh3L+n8n4IVIq7CX9WAYQbFh77rEa5+A=
X-Received: by 2002:a25:c883:: with SMTP id y125mr6956870ybf.358.1570721540132; 
 Thu, 10 Oct 2019 08:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191008194155.4810-1-robh@kernel.org>
 <fd2f61bb-1ff8-f90b-9514-e662db2ff19f@epam.com>
 <362d1eac-e352-d8de-1b6f-586acc0007ce@oracle.com>
In-Reply-To: <362d1eac-e352-d8de-1b6f-586acc0007ce@oracle.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Oct 2019 10:32:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+OajTgKoV2gWQCfGbE32LNp23tjgOpTTLcwLx19jBU9A@mail.gmail.com>
Message-ID: <CAL_Jsq+OajTgKoV2gWQCfGbE32LNp23tjgOpTTLcwLx19jBU9A@mail.gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [Xen-devel] [PATCH v2] xen: Stop abusing DT of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgOTowMCBBTSBCb3JpcyBPc3Ryb3Zza3kKPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPgo+IE9uIDEwLzkvMTkgNzo0MiBBTSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gPiBPbiAxMC84LzE5IDEwOjQxIFBNLCBSb2IgSGVy
cmluZyB3cm90ZToKPiA+PiBBcyB0aGUgcmVtb3ZlZCBjb21tZW50cyBzYXksIHRoZXNlIGFyZW4n
dCBEVCBiYXNlZCBkZXZpY2VzLgo+ID4+IG9mX2RtYV9jb25maWd1cmUoKSBpcyBnb2luZyB0byBz
dG9wIGFsbG93aW5nIGEgTlVMTCBEVCBub2RlIGFuZCBjYWxsaW5nCj4gPj4gaXQgd2lsbCBubyBs
b25nZXIgd29yay4KPiA+Pgo+ID4+IFRoZSBjb21tZW50IGlzIGFsc28gbm93IG91dCBvZiBkYXRl
IGFzIG9mIGNvbW1pdCA5YWI5MWU3YzVjNTEgKCJhcm02NDoKPiA+PiBkZWZhdWx0IHRvIHRoZSBk
aXJlY3QgbWFwcGluZyBpbiBnZXRfYXJjaF9kbWFfb3BzIikuIERpcmVjdCBtYXBwaW5nCj4gPj4g
aXMgbm93IHRoZSBkZWZhdWx0IHJhdGhlciB0aGFuIGRtYV9kdW1teV9vcHMuCj4gPj4KPiA+PiBB
Y2NvcmRpbmcgdG8gU3RlZmFubyBhbmQgT2xla3NhbmRyLCB0aGUgb25seSBvdGhlciBwYXJ0IG5l
ZWRlZCBpcwo+ID4+IHNldHRpbmcgdGhlIERNQSBtYXNrcyBhbmQgdGhlcmUncyBubyByZWFzb24g
dG8gcmVzdHJpY3QgdGhlIG1hc2tzIHRvCj4gPj4gMzItYml0cy4gU28gc2V0IHRoZSBtYXNrcyB0
byA2NCBiaXRzLgo+ID4+Cj4gPj4gQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5j
b20+Cj4gPj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPj4gQ2M6
IE5pY29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Cj4gPj4gQ2M6
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPiA+PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
PiA+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4+IENjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPj4gQ2M6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4g
QWNrZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4KPgo+Cj4gSXMgdGhpcyBnb2luZyB0byBnbyB2aWEgZHJtIHRyZWUgb3Igc2hv
dWxkIEkgcGljayBpdCB1cCBmb3IgWGVuIHRyZWU/CgpQbGVhc2UgYXBwbHkgdG8gdGhlIFhlbiB0
cmVlLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
