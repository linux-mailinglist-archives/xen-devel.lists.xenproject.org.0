Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2340105367
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 14:43:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXmgV-0003D7-1t; Thu, 21 Nov 2019 13:39:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tdvM=ZN=gmail.com=2rushikeshj@srs-us1.protection.inumbo.net>)
 id 1iXmgT-0003D2-J6
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 13:39:45 +0000
X-Inumbo-ID: 5fde21d0-0c64-11ea-984a-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fde21d0-0c64-11ea-984a-bc764e2007e4;
 Thu, 21 Nov 2019 13:39:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r16so2819030edq.2
 for <xen-devel@lists.xen.org>; Thu, 21 Nov 2019 05:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=anihtQKbMFT27F039GFrf1RgohmoB1m5CXJbR2k+qzI=;
 b=eUHJhG1QmwNjxgV3olHVpHjzHTaXEforFr4X96QifeHOa+3lz0QookGKDnUZ1p2nYW
 +q7tgmlJCHEI3zcRb78IVIu7xuBmwWBxGGepwsXC2sH3WzYqSJLUloKOlJMhpqGFD0h9
 MA0GO5AbmCJCQuFp6QgmfjELD62QP8IphroCcRRwhTPFh7TXMT48aY86l6RjSi0B0fac
 AIAFrHMsYt5Vjnd0HodjD8FiAv1plVRW9syI4vGe+f34Z2eVqi1Tt1rIUeMGe8agrZxw
 KznBxvdpCR0H+1N22HNkhX6O70XNYQ/+EYjOGVyDF3URltjtVy9MfGBdaqqnhOz+dN+3
 l31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=anihtQKbMFT27F039GFrf1RgohmoB1m5CXJbR2k+qzI=;
 b=ifQqG7lfJamFqDT/RU4OMbWCZk1xMmSYo8s9mmkx6uDRsAPSMsVxvS5N3CWUT+gv/F
 1+F6Jl4wqFUci6DX6X4ZUxjx6zcxKngYVSzpCQRcPZqMUpYixLzwUohtisxS3W6+XNE/
 txNDRAAq/HTS2211wGmiXhyj15zLz1+MdEzVoRQrZE/VwwW8n0SMCukXU2D/3/43kSTf
 AI3jhLmZnN2k1k9fJKr7vCESQF8nKacqarZ1FOXQB6XnYTbciCJQ69GYjDY/qXYO4SnJ
 6mnInlsVaQjs7eddig0tEGpxm8crm7rEM0ZzGKOPZ8VDBdx3pnQqGsFuAtm6tkE2UEKh
 DTaQ==
X-Gm-Message-State: APjAAAV2keAi8toc7hg0ZsDgjYVgGXA028z1IDsNOlHu1syK91s+lJld
 OPOZKOW5F7Dl4WNHVNyituknH8K/lc0fsiJBcSw=
X-Google-Smtp-Source: APXvYqwgvwHQA4qYdbr6tfChQoaIHFkfqVjn6O1rOnWk8j98YUHNELirujpFfM3sIyo9eg+OtvdXPFiZEIiqTTiqFk8=
X-Received: by 2002:a17:906:4913:: with SMTP id
 b19mr13812928ejq.61.1574343582786; 
 Thu, 21 Nov 2019 05:39:42 -0800 (PST)
MIME-Version: 1.0
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
In-Reply-To: <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
From: Rishi <2rushikeshj@gmail.com>
Date: Thu, 21 Nov 2019 19:09:31 +0530
Message-ID: <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMjo0NyBQTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTkuMTEuMjAxOSAwNjoyMywgUmlzaGkgd3JvdGU6Cj4gPiBv
aywgdGhhbmtzIGZvciBjbGVhcmluZyBpdCB1cC4gV291bGQgYSBwYXRjaCBiZSBhY2NlcHRlZCBp
ZiB0aGlzCj4gPiBvcHRpb24gb2Ygc2hvd2luZyBFQVggbGVhZiBpcyBzZWxlY3RpdmVseSBkb25l
IHRocm91Z2ggY29tbWFuZCBsaW5lCj4gPiAoZGVmYXVsdCBkaXNhYmxlZCk/Cj4KPiBJbiBnZW5l
cmFsIEknZCBleHBlY3QgdGhpcyB0byBiZSByYXRoZXIgdW5saWtlbHksIGJ1dCBJIGd1ZXNzIG11
Y2gKPiB3b3VsZCBkZXBlbmQgb24gdGhlIGFjdHVhbCByZWFzb25pbmcgZG9uZSBpbiB0aGUgZGVz
Y3JpcHRpb24uCj4KPiA+IE9uIGxvbmdlciBydW4sIHdoYXQgaXMgYW4gZXhwZWN0ZWQgc2FuZSBt
b2RlbCBvZiB2aXJ0dWFsaXppbmcgdGhpcz8KPiA+IFdpdGggc29tZSBndWlkYW5jZSwgbWF5IGJl
IEkgb3Igc29tZW9uZSBlbHNlIGNhbiBjb2RlIHRvIGJyaW5nIHRoZQo+ID4gZnVuY3Rpb25hbGl0
eSBiYWNrLgo+Cj4gV2hpY2ggZnVuY3Rpb25hbGl0eT8gU28gZmFyIHlvdSd2ZSB0YWxrZWQgb2Yg
b25seSBDUFVJRCBiaXRzIEkKPiB0aGluaywgd2l0aG91dCBleHBsYWluaW5nIGF0IGFsbCB3aGF0
IGZ1bmN0aW9uYWxpdHkgeW91IHdhbnQgdG8KPiBoYXZlIHRoYXQgZGVwZW5kcyBvbiB0aGVzZS4g
SW4gZ2VuZXJhbCwgYXMgc2FpZCBlYXJsaWVyLCBDUFUKPiBtYW5hZ2VtZW50IGlzIHRoZSBoeXBl
cnZpc29yJ3MgcmVzcG9uc2liaWxpdHksIHNvIEknZCByYXRoZXIKPiBub3Qgc2VlIHRoaXMgdmly
dHVhbGl6ZWQsIGJ1dCB0aGUgaHlwZXJ2aXNvciBiZSBwdXQgaW50byBhCj4gcG9zaXRpb24gb2Yg
ZG9pbmcgd2hhdGV2ZXIgaXMgbmVlZGVkLgo+Cj4gSmFuCgpUaGUgcmVhc29uaW5nIHRvIGhhdmUg
RUFYKDB4MDZoKSBleHBvc2VkIHRvIERvbTAgaXMgZm9yIFRoZXJtYWwgYW5kClBvd2VyIG1hbmFn
ZW1lbnQuCldpdGhvdXQgRUFYKDB4MDZoKSBEb20wIGlzIHVuYWJsZSB0byBzZW5zZSBwcmVzZW5j
ZSBvZiBDUFUgY29yZQp0ZW1wZXJhdHVyZSBvciBkbyBUaGVybWFsIG1hbmFnZW1lbnQgLSBpbmNs
dWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvCm9wZXJhdGluZyBGYW4gc3BlZWQuCkRvbTAgaGFzIHRv
IHJlbHkgb24gb3RoZXIgcG9zc2libGUgd2F5cyBzdWNoIGFzIGlwbWkgb3IgQklPUyB3aGljaCBh
cmUKb3B0aW9uYWxseSBhdmFpbGFibGUuCgpGcm9tIHRoZSBwYXRjaCBkZXNjcmlwdGlvbgpodHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD03MmUw
Mzg0NTBkM2Q1ZGUxYTM5ZjBjZmEyZDJiMGY5YjNkNDNjNmM2Cml0IHNlZW1zIHRoYXQgdGhlIGNo
YW5nZSB3YXMgaW50cm9kdWNlZCB0byBub3QgZXhwb3NlIEVBWCgweDA2aCkgdG8KdW5wcml2aWxl
Z2VkIFBWIGd1ZXN0cyBidXQgbm90aGluZyBpcyBzYWlkIGZvciBEb20wIGl0c2VsZi4gSSB0aGlu
awp5b3UgYWxyZWFkeSBtZW50aW9uZWQgdGhhdCB0aGUgZmxhZyBpcyBoaWQgZnJvbSBEb20wIGFz
IHdlbGwKaW50ZW50aW9uYWxseS4KClNvIHVubGVzcyBoeXBlcnZpc29yIHdhbnRzIHRvIGRvIHRo
ZXJtYWwgbWFuYWdlbWVudCBvZiB0aGUgQ1BVIGJvYXJkLAppdCB3b3VsZCBpbmhpYml0IERvbTAn
cyBhYmlsaXR5IHRvIGRvIHRoaXMgZnVuY3Rpb24uCgpXaGF0IGlzIGFuIGFsdGVybmF0aXZlIHdh
eSBmb3IgY29yZXRlbXAga2VybmVsIG1vZHVsZSB0byBkZXRlY3QKIkRUSEVSTSIgcHJvY2Vzc29y
IGZsYWcgYW5kL29yIHByb2NlZWQgZm9yIHNhZmUgcmVhZGluZyBvZiBNU1IgdG8gZG8KZnVydGhl
ciB0ZW1wZXJhdHVyZSB2YWx1ZSByZWFkcz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
