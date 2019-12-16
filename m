Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02C1206B7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:12:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igq7y-0007wT-Fo; Mon, 16 Dec 2019 13:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igq7x-0007wL-JK
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:09:33 +0000
X-Inumbo-ID: 4d1c8cd0-2005-11ea-93a0-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d1c8cd0-2005-11ea-93a0-12813bfff9fa;
 Mon, 16 Dec 2019 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qc4ibrP4nAwK6bD/tUj1hE6UHONdwrtV8vpp480hFK8=;
 b=fANUBvVbVIxdI4Ud7u0qJlTgfDhJqUoiJEJJ5OSiJyQmYJpAjGYKevpuQ+BQqCefwRREVh
 K8nJCe3muY9dVN6zELGVKofnHAlXkfvGAvO4GUD/2OxnLZzuKEJtXpCxeK/GPQIepolnKC
 nMzz7UbuAd1YFrbs1FLz3dKRoXJpSa8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-iI5umfB1O1SFViIQPPsCQw-1; Mon, 16 Dec 2019 08:09:30 -0500
Received: by mail-wm1-f72.google.com with SMTP id l13so1011655wmj.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Jk6Cpq3pdn1ZWdM3Du7M0QmuQp8H64fwAOoLUEB6AA=;
 b=ZECPfN63rruDAFq3AeWPprvJ+FkLwRjGi2K16JTPP954f4MimXjMAGBMN7aJWEYSFA
 lRFp4HPW0GJ06TxFS9CTUN68ceK/K/x6YgbWGPSrFjE1Bd0TZfN5xVMKXv4Ue4yR8QDN
 /Ud287/B4mVrbeb6J0lmbNv7lo8405e2xxNQEdejiscBLB+Mqfn3/gsIPwCeHDp3eeXY
 r4ONN26UJBL0QG7+ixHho+BelhF2c4o4ci+2BQ3z0HH3sQVzWPll0XbnaB+KP0fK3eyn
 wkUyO1d1uKhtHLVUDY2KeELUbio7SSGACa/fH3qbgLcxErYBdpSkzCGEOYkwyRENY0Px
 RGPg==
X-Gm-Message-State: APjAAAUoGiELxOvTHx2vXFDBNFep63OXfGnXKuYywyv0MzJJOWKrgpQN
 cvEyCqnMv6Zcy+hI7mkTFQx+7LX+H/uYID8fnZQTqkNa8t1xMfe4t/3BFe6gVqQCYjNPwqNMM5I
 s0trZHDsn8KycWYoG3QE8tw1r3Ko=
X-Received: by 2002:adf:806e:: with SMTP id 101mr31411913wrk.300.1576501769478; 
 Mon, 16 Dec 2019 05:09:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYyxUkn02vgY6dZmRCZwsGERI4x52mCVKPdFOym4lzQgGYRZERott/od+zxPFmJAq+fK4eBQ==
X-Received: by 2002:adf:806e:: with SMTP id 101mr31411887wrk.300.1576501769266; 
 Mon, 16 Dec 2019 05:09:29 -0800 (PST)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id l2sm20367946wmi.5.2019.12.16.05.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:09:28 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4d450dd-fa12-6a02-8225-37d467ed3628@redhat.com>
Date: Mon, 16 Dec 2019 14:09:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-5-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: iI5umfB1O1SFViIQPPsCQw-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 04/12] hw/i386/pc: Remove obsolete
 cpu_set_smm_t typedef
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
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IEluIGNv
bW1pdCBmODA5YzYwNTEgd2UgcmVwbGFjZWQgdGhlIHVzZSBvZiBjcHVfc2V0X3NtbV90IGNhbGxi
YWNrcwo+IGJ5IHVzaW5nIGEgTm90aWZpZXIgdG8gbW9kaWZ5IHRoZSBNZW1vcnlSZWdpb24uIFRo
aXMgcHJvdG90eXBlIGlzCj4gbm93IG5vdCB1c2VkIGFueW1vcmUsIHdlIGNhbiBzYWZlbHkgcmVt
b3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9ody9pMzg2L3BjLmggfCAyIC0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3
L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCj4gaW5kZXggYmM3ZDg1NWFhYS4uNzQz
MTQxZTEwNyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2h3L2kzODYvcGMuaAo+ICsrKyBiL2luY2x1
ZGUvaHcvaTM4Ni9wYy5oCj4gQEAgLTIxMiw4ICsyMTIsNiBAQCB2b2lkIHBjX2Ntb3NfaW5pdChQ
Q01hY2hpbmVTdGF0ZSAqcGNtcywKPiAgICAgICAgICAgICAgICAgICAgSVNBRGV2aWNlICpzKTsK
PiAgdm9pZCBwY19uaWNfaW5pdChQQ01hY2hpbmVDbGFzcyAqcGNtYywgSVNBQnVzICppc2FfYnVz
LCBQQ0lCdXMgKnBjaV9idXMpOwo+ICAKPiAtdHlwZWRlZiB2b2lkICgqY3B1X3NldF9zbW1fdCko
aW50IHNtbSwgdm9pZCAqYXJnKTsKPiAtCj4gIHZvaWQgcGNfaTgyNTlfY3JlYXRlKElTQUJ1cyAq
aXNhX2J1cywgcWVtdV9pcnEgKmk4MjU5X2lycXMpOwo+ICB2b2lkIGlvYXBpY19pbml0X2dzaShH
U0lTdGF0ZSAqZ3NpX3N0YXRlLCBjb25zdCBjaGFyICpwYXJlbnRfbmFtZSk7Cj4gIAo+IAoKUXVl
dWVkLCB0aGFua3MuCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
