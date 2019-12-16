Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD91209F0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 16:41:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igsRu-0004IR-H1; Mon, 16 Dec 2019 15:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wTey=2G=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1igsRt-0004IM-6F
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:38:17 +0000
X-Inumbo-ID: 0ee0cd0e-201a-11ea-a1e1-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0ee0cd0e-201a-11ea-a1e1-bc764e2007e4;
 Mon, 16 Dec 2019 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576510687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBa2MGn7DCueqf8x4FUEtixtox7g2G365/dy7anp4ic=;
 b=e0tqlpHCQH6UW4bzOFINPj+PMD9tqyred5M3kvRil8TV2yu6fx+hcMlmbffEWxthGiy+Fk
 VZVnzARWYXpYkspg/i9kxTi6kuhOWHxDu3md4B71as1wcOrXPRwY8Jvu4xN+tCz50FtCCb
 92oarXuKbCm8nV4GnPLSzW5/7LrdiEE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-TwBv4FDvMdW6-ce8thbgpA-1; Mon, 16 Dec 2019 10:38:02 -0500
Received: by mail-wr1-f69.google.com with SMTP id o6so2793020wrp.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 07:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0QV9lNd6bej2B81hrPU/3K56BtQwJme8N81caAcyeHo=;
 b=pn4Fj5+Uq2jksy7wO4bMkbMLY3BM3c8mfZodEMhMx3odAaLqjLx0lxjauWbPqmlxez
 W1g1wq+TWx6259Yii/1QKNJMPVcD1zrom2NimaXUL80Zrx5uHibo+LNcQX84/mxxP/PL
 NzKZLlO4C1hmClrLBU/+qarVD6c6g/CF+sNaAS0MLpZCPArQ2JjLE4RcMZBlDBJ7EK0Q
 nrJGFzst+NmgIYKe/XS2O+yOmLHEqKtcDyAYmGDflLGzMa3qkzKQelLhay0lzJZeKnZz
 IHnlT8aLjeOH8nxRFK0xIpryKx1TIHU/KxSqyIIZRTemoxillO5jxAty/NRNOCCDq6RW
 VPkQ==
X-Gm-Message-State: APjAAAW6dQhTMe0I2ft+wdzyTmkq/rqN2b6kQ5Yh84ij4gzfqxUJdPP3
 fYe+7Dgdw4JorKk0P6dPibGcGZ1rEYY5SR49ZA3+GGNKSXhBVGzoQzlE8pTeL0xatGSQi/2YiEC
 0QpZVrhnS55tmxldso3bgfQriRK8=
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr30633311wrt.229.1576510681812; 
 Mon, 16 Dec 2019 07:38:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVFqYNqlSPAPVs60swdvhy63zZvYx1UQ4uo3h1+kQkDGxRT/1HmtmODXpIzHE45ZzE9ki/sw==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr30633290wrt.229.1576510681631; 
 Mon, 16 Dec 2019 07:38:01 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id f1sm21818222wro.85.2019.12.16.07.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 07:38:00 -0800 (PST)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-13-philmd@redhat.com>
 <d9792ff4-bada-fbb9-301d-aeb19826235c@redhat.com>
 <20191215045812-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d15c735-73b4-7875-ec0f-8c181508f0d4@redhat.com>
Date: Mon, 16 Dec 2019 16:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191215045812-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-MC-Unique: TwBv4FDvMdW6-ce8thbgpA-1
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTUvMTkgMTA6NTggQU0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBGcmks
IERlYyAxMywgMjAxOSBhdCAwNTo0NzoyOFBNICswMTAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToKPj4gT24gMTIvMTMvMTkgNToxNyBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
d3JvdGU6Cj4+PiBIaXN0b3JpY2FsbHksIFFFTVUgc3RhcnRlZCB3aXRoIG9ubHkgb25lIFg4NiBt
YWNoaW5lOiB0aGUgUEMuCj4+PiBUaGUgJ2h3L2kzODYvcGMuaCcgaGVhZGVyIHdhcyB1c2VkIHRv
IHN0b3JlIGFsbCBYODYgYW5kIFBDCj4+PiBkZWNsYXJhdGlvbnMuIFNpbmNlIHdlIGhhdmUgbm93
IG11bHRpcGxlIG1hY2hpbmVzIGJhc2VkIG9uIHRoZQo+Pj4gWDg2IGFyY2hpdGVjdHVyZSwgbW92
ZSB0aGUgUEMtc3BlY2lmaWMgZGVjbGFyYXRpb25zIGluIGEgbmV3Cj4+PiBoZWFkZXIuCj4+PiBX
ZSB1c2UgJ2ludGVybmFsJyBpbiB0aGUgbmFtZSB0byBleHBsaWNpdCB0aGlzIGhlYWRlciBpcyBy
ZXN0cmljdGVkCj4+PiB0byB0aGUgWDg2IGFyY2hpdGVjdHVyZS4gT3RoZXIgYXJjaGl0ZWN0dXJl
IGNhbiBub3QgYWNjZXNzIGl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gTWF5YmUgbmFtZSBpdCAn
cGNfbWFjaGluZS5oJz8KPj4KPj4gSSBmb3Jnb3QgdG8gZGVzY3JpYmUgaGVyZSAoYW5kIGluIHRo
ZSBjb3ZlciksIHdoYXQncyBmb2xsb3cgYWZ0ZXIgdGhpcwo+PiBwYXRjaC4KPj4KPj4gUGF0Y2gg
IzEzIG1vdmVzIFBDTWFjaGluZUNsYXNzIHRvCj4+Cj4+IElmIHlvdSBpZ25vcmUgUENNYWNoaW5l
U3RhdGUsICJody9pMzg2L3BjLmgiIG5vdyBvbmx5IGNvbnRhaW5zIDc2IGxpbmVzLCBhbmQKPj4g
aXQgaXMgZWFzaWVyIHRvIHNlZSB3aGF0IGlzIFBDIG1hY2hpbmUgc3BlY2lmaWMsIHdoYXQgaXMg
WDg2IHNwZWNpZmljLCBhbmQKPj4gd2hhdCBpcyBkZXZpY2UgZ2VuZXJpYyAobm90IFg4NiByZWxh
dGVkIGF0IGFsbCk6Cj4+Cj4+IC0gR1NJIGlzIGNvbW1vbiB0byBYODYgKFBhb2xvIHNlbnQgWzNd
LCBbNl0pCj4+IC0gSU9BUElDIGlzIGNvbW1vbiB0byBYODYKPj4gLSBpODI1OSBpcyBtdWx0aWFy
Y2ggKFBhb2xvIFsyXSkKPj4gLSBQQ0lfSE9TVCBkZWZpbml0aW9ucyBhbmQgcGNfcGNpX2hvbGU2
NF9zdGFydCgpIGFyZSBYODYKPj4gLSBwY19tYWNoaW5lX2lzX3NtbV9lbmFibGVkKCkgaXMgWDg2
IChQYW9sbyBzZW50IFs1XSkKPj4gLSBocGV0Cj4+IC0gdHNjIChQYW9sbyBzZW50IFszXSkKPj4g
LSAzIG1vcmUgZnVuY3Rpb25zCj4+Cj4+IFNvIHdlIGNhbiBtb3ZlIGhhbGYgb2YgdGhpcyBmaWxl
IHRvICJwY19pbnRlcm5hbC5oIiBhbmQgdGhlIG90aGVyIHRvCj4+Cj4+IE9uZSBwcm9ibGVtIGlz
IHRoZSBRMzUgTUNIIG5vcnRoIGJyaWRnZSB3aGljaCBkaXJlY3RseSBzZXRzIHRoZSBQQ0kKPj4g
UENNYWNoaW5lU3RhdGUtPmJ1cyBpbiBxMzVfaG9zdF9yZWFsaXplKCkuIFRoaXMgc2VlbXMgYSBR
T00gdmlvbGF0aW9uIGFuZCBpcwo+PiBwcm9iYWJseSBlYXNpbHkgZml4YWJsZS4KPj4KPj4gTWF5
YmUgSSBjYW4gYXBwbHkgUGFvbG8ncyBwYXRjaGVzIGluc3RlYWQgb2YgdGhpcyAjMTIsIG1vdmUg
WDg2LWdlbmVyaWMKPj4gZGVjbGFyYXRpb25zIHRvICJody9pMzg2L3g4Ni5oIiwgYW5kIGRpcmVj
dGx5IGdpdC1tb3ZlIHdoYXQncyBsZWZ0IG9mCj4+ICJody9pMzg2L3BjLmgiIHRvICJwY19pbnRl
cm5hbC5oIi4KPiAKPiBZZWEgdGhhdCBzb3VuZHMgYSBiaXQgYmV0dGVyLgoKT0ssIEknbGwgd2Fp
dCBmb3IgUGFvbG8ncyBuZXh0IHB1bGwgZ2V0IGluLCB0aGVuIGNvbnRpbnVlIGJhc2VkIG9uIHRo
YXQsIAppbmNsdWRpbmcgUGFvbG8ncyAieDg2OiBhbGxvdyBidWlsZGluZyB3aXRob3V0IFBDIG1h
Y2hpbmUgdHlwZXMiIHNlcmllcy4KCihUaGFua3MgUGFvbG8gZm9yIHBpY2tpbmcgbW9zdCBvZiB0
aGlzIHNlcmllcyEpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
