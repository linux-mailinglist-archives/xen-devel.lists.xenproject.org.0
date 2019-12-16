Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799C120E6A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 16:53:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igsc9-0005Lw-6V; Mon, 16 Dec 2019 15:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wTey=2G=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1igsc7-0005Lr-EA
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:48:51 +0000
X-Inumbo-ID: 8900ac5c-201b-11ea-88e7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8900ac5c-201b-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576511322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2v/Ok6ZvcnVhGX+VExCC/zEjb9qtt3LYiq8Bn2igZas=;
 b=bzrmsLYsqJaIhrDrApISxAtJO+APEnpvxM2hJr3UB4UzFeHwh5ZvlKzTqIcstHDb3xgf7w
 ldAzaBR/MDjNwfMKt3+YZtx8PRsOqzy5+wXcLsPqXTb8IpqeUrznn6PJHTmLfMkfws7xOv
 L1aHl00Ofg//8023KsmeDiNdMsqKMhY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-x2xGUwWVOsm_wR6R40y89w-1; Mon, 16 Dec 2019 10:48:39 -0500
Received: by mail-wr1-f70.google.com with SMTP id z15so3953033wrw.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 07:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NK24jcfG9UBuY8rN//ofB2n49byardjTFM1RJjyjWnM=;
 b=I3wGqvMOM4Jc6+c/O5qebf27F+AH4eD4z6rg5b8Mpnzu9LqDrQNCVMfUiZVqX6O8+m
 /RIKcXsKcJJWZh9COokhZEHN18mgkuv025C1Bu4rn0mnaIMVbynFA14mSOT8Q3jrbDnN
 Bl8OqPAUC72q1Scb/EdWEAK96NtB1Mf+zHXLsp05ACXNv1GCABvUEm2HGn5EHHqTjXje
 87JfhfQVRLn7pY3MwzkvlHOoFLYvHYerGP4bJhNZTsB+kMcuW+sRYZTOMAPqke+zrUKk
 VHUyALEhD7An+m5sjz3nnIQwbzV0gPdgkf22XP1DMPhk0BqjYg8aGDN/ip/6uCvhDg8u
 6aNQ==
X-Gm-Message-State: APjAAAXeESRGAuusgKuJ8R3B1m6xzSutC/XPs5lwNWIVJKg8a0nWMRiv
 1CrecOrisiXUARnbLCRAD5/6r+7lQUhlWh5B0eqS7Z/nSVlfWkNlsubt4bt9Ts8RdZ705WMDbid
 f8E1zNlYtsoz6ypxMcsP+dXElT20=
X-Received: by 2002:a05:600c:1003:: with SMTP id
 c3mr30651546wmc.120.1576511317837; 
 Mon, 16 Dec 2019 07:48:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqw91mpCMXRzNUnMlilO04dgXju+Jt835qTjzpZhengzNi+a5MHx1NtPbwEpwmIXe3771MmoCQ==
X-Received: by 2002:a05:600c:1003:: with SMTP id
 c3mr30651518wmc.120.1576511317615; 
 Mon, 16 Dec 2019 07:48:37 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id 4sm21037599wmg.22.2019.12.16.07.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 07:48:36 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-13-philmd@redhat.com>
 <d9792ff4-bada-fbb9-301d-aeb19826235c@redhat.com>
 <20191215045812-mutt-send-email-mst@kernel.org>
 <0d15c735-73b4-7875-ec0f-8c181508f0d4@redhat.com>
 <90d54a3b-ae96-43ac-0f8e-268c1257f7d0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76162c3a-1b66-dd49-901e-7435efc21873@redhat.com>
Date: Mon, 16 Dec 2019 16:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <90d54a3b-ae96-43ac-0f8e-268c1257f7d0@redhat.com>
Content-Language: en-US
X-MC-Unique: x2xGUwWVOsm_wR6R40y89w-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 12/12] hw/i386/pc: Move PC-machine specific
 declarations to 'pc_internal.h'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8xNi8xOSA0OjQxIFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+IE9uIDE2LzEyLzE5
IDE2OjM3LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4gT24gMTIvMTUvMTkgMTA6
NTggQU0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+IE9uIEZyaSwgRGVjIDEzLCAyMDE5
IGF0IDA1OjQ3OjI4UE0gKzAxMDAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pj4+
IE9uIDEyLzEzLzE5IDU6MTcgUE0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pj4+
PiBIaXN0b3JpY2FsbHksIFFFTVUgc3RhcnRlZCB3aXRoIG9ubHkgb25lIFg4NiBtYWNoaW5lOiB0
aGUgUEMuCj4+Pj4+IFRoZSAnaHcvaTM4Ni9wYy5oJyBoZWFkZXIgd2FzIHVzZWQgdG8gc3RvcmUg
YWxsIFg4NiBhbmQgUEMKPj4+Pj4gZGVjbGFyYXRpb25zLiBTaW5jZSB3ZSBoYXZlIG5vdyBtdWx0
aXBsZSBtYWNoaW5lcyBiYXNlZCBvbiB0aGUKPj4+Pj4gWDg2IGFyY2hpdGVjdHVyZSwgbW92ZSB0
aGUgUEMtc3BlY2lmaWMgZGVjbGFyYXRpb25zIGluIGEgbmV3Cj4+Pj4+IGhlYWRlci4KPj4+Pj4g
V2UgdXNlICdpbnRlcm5hbCcgaW4gdGhlIG5hbWUgdG8gZXhwbGljaXQgdGhpcyBoZWFkZXIgaXMg
cmVzdHJpY3RlZAo+Pj4+PiB0byB0aGUgWDg2IGFyY2hpdGVjdHVyZS4gT3RoZXIgYXJjaGl0ZWN0
dXJlIGNhbiBub3QgYWNjZXNzIGl0Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBNYXli
ZSBuYW1lIGl0ICdwY19tYWNoaW5lLmgnPwo+Pj4+Cj4+Pj4gSSBmb3Jnb3QgdG8gZGVzY3JpYmUg
aGVyZSAoYW5kIGluIHRoZSBjb3ZlciksIHdoYXQncyBmb2xsb3cgYWZ0ZXIgdGhpcwo+Pj4+IHBh
dGNoLgo+Pj4+Cj4+Pj4gUGF0Y2ggIzEzIG1vdmVzIFBDTWFjaGluZUNsYXNzIHRvCj4+Pj4KPj4+
PiBJZiB5b3UgaWdub3JlIFBDTWFjaGluZVN0YXRlLCAiaHcvaTM4Ni9wYy5oIiBub3cgb25seSBj
b250YWlucyA3Ngo+Pj4+IGxpbmVzLCBhbmQKPj4+PiBpdCBpcyBlYXNpZXIgdG8gc2VlIHdoYXQg
aXMgUEMgbWFjaGluZSBzcGVjaWZpYywgd2hhdCBpcyBYODYKPj4+PiBzcGVjaWZpYywgYW5kCj4+
Pj4gd2hhdCBpcyBkZXZpY2UgZ2VuZXJpYyAobm90IFg4NiByZWxhdGVkIGF0IGFsbCk6Cj4+Pj4K
Pj4+PiAtIEdTSSBpcyBjb21tb24gdG8gWDg2IChQYW9sbyBzZW50IFszXSwgWzZdKQo+Pj4+IC0g
SU9BUElDIGlzIGNvbW1vbiB0byBYODYKPj4+PiAtIGk4MjU5IGlzIG11bHRpYXJjaCAoUGFvbG8g
WzJdKQo+Pj4+IC0gUENJX0hPU1QgZGVmaW5pdGlvbnMgYW5kIHBjX3BjaV9ob2xlNjRfc3RhcnQo
KSBhcmUgWDg2Cj4+Pj4gLSBwY19tYWNoaW5lX2lzX3NtbV9lbmFibGVkKCkgaXMgWDg2IChQYW9s
byBzZW50IFs1XSkKPj4+PiAtIGhwZXQKPj4+PiAtIHRzYyAoUGFvbG8gc2VudCBbM10pCj4+Pj4g
LSAzIG1vcmUgZnVuY3Rpb25zCj4+Pj4KPj4+PiBTbyB3ZSBjYW4gbW92ZSBoYWxmIG9mIHRoaXMg
ZmlsZSB0byAicGNfaW50ZXJuYWwuaCIgYW5kIHRoZSBvdGhlciB0bwo+Pj4+Cj4+Pj4gT25lIHBy
b2JsZW0gaXMgdGhlIFEzNSBNQ0ggbm9ydGggYnJpZGdlIHdoaWNoIGRpcmVjdGx5IHNldHMgdGhl
IFBDSQo+Pj4+IFBDTWFjaGluZVN0YXRlLT5idXMgaW4gcTM1X2hvc3RfcmVhbGl6ZSgpLiBUaGlz
IHNlZW1zIGEgUU9NIHZpb2xhdGlvbgo+Pj4+IGFuZCBpcwo+Pj4+IHByb2JhYmx5IGVhc2lseSBm
aXhhYmxlLgo+Pj4+Cj4+Pj4gTWF5YmUgSSBjYW4gYXBwbHkgUGFvbG8ncyBwYXRjaGVzIGluc3Rl
YWQgb2YgdGhpcyAjMTIsIG1vdmUgWDg2LWdlbmVyaWMKPj4+PiBkZWNsYXJhdGlvbnMgdG8gImh3
L2kzODYveDg2LmgiLCBhbmQgZGlyZWN0bHkgZ2l0LW1vdmUgd2hhdCdzIGxlZnQgb2YKPj4+PiAi
aHcvaTM4Ni9wYy5oIiB0byAicGNfaW50ZXJuYWwuaCIuCj4+Pgo+Pj4gWWVhIHRoYXQgc291bmRz
IGEgYml0IGJldHRlci4KPj4KPj4gT0ssIEknbGwgd2FpdCBmb3IgUGFvbG8ncyBuZXh0IHB1bGwg
Z2V0IGluLCB0aGVuIGNvbnRpbnVlIGJhc2VkIG9uIHRoYXQsCj4+IGluY2x1ZGluZyBQYW9sbydz
ICJ4ODY6IGFsbG93IGJ1aWxkaW5nIHdpdGhvdXQgUEMgbWFjaGluZSB0eXBlcyIgc2VyaWVzLgo+
Pgo+PiAoVGhhbmtzIFBhb2xvIGZvciBwaWNraW5nIG1vc3Qgb2YgdGhpcyBzZXJpZXMhKQo+IAo+
IEZXSVcgSSBkb24ndCB0aGluayBrdm1faTgyNTlfaW5pdCBzaG91bGQgYmUgaW4gc3lzZW11L2t2
bS5oLCBzaW5jZSBpdCdzCj4geDg2LXNwZWNpZmljIGFuZCB0aGF0IHdvdWxkIGJlIHNvbWV0aGlu
ZyBsaWtlIHRoZSBzYW1lIG1pc3Rha2UgYWxyZWFkeQo+IGRvbmUgd2l0aCBody9pMzg2L3BjLmgu
CgpIbW0gT0suClNvIHRvIGZvbGxvdyB5b3VyIHJlYXNvbmluZywgCmt2bV9wY19nc2lfaGFuZGxl
ci9rdm1fcGNfc2V0dXBfaXJxX3JvdXRpbmcoKSBhcmUgeDg2LXNwZWNpZmljIGFuZCBjb3VsZCAK
YmUgbW92ZWQgb3V0LgpJJ2xsIGZpZ3VyZSB0aGF0IG91dCB3aGVuIEkgcmV3b3JrIHRoZSBsYXN0
IHBhdGNoZXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
