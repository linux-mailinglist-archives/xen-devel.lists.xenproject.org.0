Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5273C1206BE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:13:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqA6-0000Hy-5w; Mon, 16 Dec 2019 13:11:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igqA4-0000Hn-0w
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:11:44 +0000
X-Inumbo-ID: 9ac37d2c-2005-11ea-93a1-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9ac37d2c-2005-11ea-93a1-12813bfff9fa;
 Mon, 16 Dec 2019 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scG5Kx9flS/O+fWEMZ9AL1b4bI3lFixtW/AfHlhLa/g=;
 b=WpxcdSknJhV9j8mjOQoHs3Jx4L0swk+zlp/lp8qi7DKOlo2tgsWz3n7maDYnhlBsXGnQg7
 JbtoW05rCSn/5ipk8/pVZ8A/YtdoRG2eZA2//nabOQj9vHup6cZnSYCx5JuDjAm/UUA8aH
 a5P6kHt+f7anGiuhzq2mWbJvw2qtfY4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-ngjwwVGSPmiNjtmIYFLddw-1; Mon, 16 Dec 2019 08:11:41 -0500
Received: by mail-wm1-f70.google.com with SMTP id l13so1013615wmj.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GGy7hA1R/Ff1cUj5iexZAw7T35hQcQ6yTVuO7Q49ddg=;
 b=l3JqihsVIhNp37kZAj3JRC/HCobbtMtp+hSEvG++FgX3S56I/cMRRXyeAiWgcOan12
 qyLW9DzAJqiHvKkpCXTzZlMChiQDPqyqoUzazYL6faFGcJDJmBsQyBB9S497DJ7w8hkV
 sJYS1FYbtrGtyeFLiAjsE7QDb5NvbTQHo8OLTUuwezLtOQfmBwMdhnB76QJyMe55y4Gc
 A0AzOH3u6GXd+zKPU320KUA8GjfSYxbTWv094X6R2eIfh9Pq4Fs1l+kA1QbyY/ER3rRw
 Yk3TCDxu6XnKfeXp8dzw5W0sIfax9rHXOhjFL5W9f4i+p8PmdYjBBQSzqOs4z3EJ8K5f
 cvHQ==
X-Gm-Message-State: APjAAAXRO028MOjgItchSk6rvNfFbWTfbuutVZl+oWYOGlNkuTOaBS0B
 06OuhBmbplDZ1/pGu6aVJ77CV4NUhIIYOiZh95Bz9D0ORH1D+q4rr/H66iZgYEpKGRi4/V1a9Ii
 v/pY+YzZOWSNXQZGWw1haMfATwFI=
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr29446738wrn.214.1576501900355; 
 Mon, 16 Dec 2019 05:11:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGHJubMRcjF3rMhfF0ZkDV3XSz2Wf97J4Nphi2H0AX4FuSFFoF7H4ntveSXYPOaUHPW1jkNg==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr29446705wrn.214.1576501900156; 
 Mon, 16 Dec 2019 05:11:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id z21sm21002520wml.5.2019.12.16.05.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:39 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-8-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6ea21857-7304-1016-2bd4-d2beb2b75551@redhat.com>
Date: Mon, 16 Dec 2019 14:11:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-8-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: ngjwwVGSPmiNjtmIYFLddw-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 07/12] hw/ide/piix: Remove superfluous
 DEVICE() cast
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

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IENvbW1p
dCAwMmE5NTk0YjRmMCBhbHJlYWR5IGNvbnZlcnRlZCAnZGV2JyB0byBEZXZpY2VTdGF0ZS4KPiBT
aW5jZSB0aGUgY2FzdCBpcyBzdXBlcmZsdW91cywgcmVtb3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAg
aHcvaWRlL3BpaXguYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvaWRlL3BpaXguYyBiL2h3L2lkZS9w
aWl4LmMKPiBpbmRleCBkYjMxM2RkM2IxLi5mZmVmZjRlMDk1IDEwMDY0NAo+IC0tLSBhL2h3L2lk
ZS9waWl4LmMKPiArKysgYi9ody9pZGUvcGlpeC5jCj4gQEAgLTE5Myw3ICsxOTMsOCBAQCBpbnQg
cGNpX3BpaXgzX3hlbl9pZGVfdW5wbHVnKERldmljZVN0YXRlICpkZXYsIGJvb2wgYXV4KQo+ICAg
ICAgICAgICAgICBibGtfdW5yZWYoYmxrKTsKPiAgICAgICAgICB9Cj4gICAgICB9Cj4gLSAgICBx
ZGV2X3Jlc2V0X2FsbChERVZJQ0UoZGV2KSk7Cj4gKyAgICBxZGV2X3Jlc2V0X2FsbChkZXYpOwo+
ICsKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+IAoKUXVldWVkLCB0aGFua3MuCgpQYW9sbwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
