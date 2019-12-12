Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81A11CCFD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:20:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNOe-0006Gy-2M; Thu, 12 Dec 2019 12:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LpKE=2C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ifNOc-0006Gt-P8
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:16:42 +0000
X-Inumbo-ID: 3c642972-1cd9-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c642972-1cd9-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 12:16:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so2117249wmj.5
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2019 04:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UBukhBoMe7W5uhxHnPb7cg159pqqhP81ZB+nj44NeoY=;
 b=K0yKt9G1mWeqiZtOcgT8HsfQ/1n8L18fs2tLhLZlNoD0m2NpRPkMUNNG0oIP/cGsJL
 sKr8XoaSUrndf1KX5xxbawdVa5ZPZTwO+3CEJARDYShobmfuYivqDo5J8oAj0BtbA/Eg
 eTnxQDpvBXl3SJQNVABHO8tbaCgjaGur/bp9hCNpHdBSBPULAM9P2PaEjuOohO5DFBnn
 hF5fyWKWRJvixOZKsDGUgfJ8ta+C/Ea4XbCZdyiV/JYrg3F80GbcqDCo+CTtj0R+/Xex
 avk8wF+V4b6lGR5cnmKS2jdsoX2nkusa3VKT+5bXwZpdE1PpEh8+ybfeNDsh2fiEnBhK
 nKlw==
X-Gm-Message-State: APjAAAVYlGCqiC3Rdn9fXn2DbBBoCBZ6pXysQDBAJTFPZpw9esyXBwXG
 5SxHOvWNVyqjY88GVVdR4cs=
X-Google-Smtp-Source: APXvYqxSLI3pgc4MCxKPRzWdOhZQ4yNr6TtQgnzl/WO7vnw4dM47DxHruNHs9FJkolKKIiZpuUC1mg==
X-Received: by 2002:a1c:dc82:: with SMTP id t124mr6556500wmg.122.1576152993058; 
 Thu, 12 Dec 2019 04:16:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id p15sm1124798wma.40.2019.12.12.04.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:16:32 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191126211324.122736-1-jeff.kubascik@dornerworks.com>
 <4bb351b7-a7b0-4491-fdc5-265724457359@xen.org>
 <bf9c620e-600a-37d4-e1b0-d329d8d225be@dornerworks.com>
 <5a335a96-930c-bf59-19ae-0fbc21600809@xen.org>
 <0d2c3c0d-02b4-468b-00c2-b10843559bd6@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db511b31-2d97-1402-f348-6224861d0785@xen.org>
Date: Thu, 12 Dec 2019 12:16:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <0d2c3c0d-02b4-468b-00c2-b10843559bd6@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: remove physical timer offset
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8xMi8yMDE5IDIwOjAwLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IE9uIDEyLzUv
MjAxOSAzOjI4IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIb3dldmVyLCBzZXRfdGltZXIg
ZXhwZWN0cyBhIHNpZ25lZCA2NCBiaXQgdmFsdWUgaW4gbnMuIFRoZSBjb252ZXJzaW9uIG9mIGN2
YWwKPj4+ICh1bnNpZ25lZCA2NCBiaXQpIGZyb20gdGlja3MgdG8gbnMgaXMgZ29pbmcgdG8gb3Zl
cmZsb3cgdGhpcy4gSSdtIG5vdCBzdXJlIHdoYXQKPj4+IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0
byB3b3JrIGFyb3VuZCB0aGlzIGxpbWl0YXRpb24uIEF0IHRoZSB2ZXJ5IGxlYXN0LCBJIHRoaW5r
Cj4+PiB3ZSBzaG91bGQgcHJpbnQgYSB3YXJuaW5nIG1lc3NhZ2UuCj4+Cj4+IEEgd2FybmluZyBt
ZXNzYWdlIGluIGVtdWxhdGlvbiBpcyBkZWZpbml0ZWx5IG5vdCB0aGUgcmlnaHQgc29sdXRpb24u
IElmCj4+IGEgdXNlciBhc2tzIHNvbWV0aGluZyB0aGF0IGlzIHZhbGlkIGZyb20gdGhlIHNwZWMg
UG9WIHRoZW4gd2Ugc2hvdWxkCj4+IGltcGxlbWVudCBpdCBjb3JyZWN0bHkuIFRoZSBtb3JlIHRo
YXQgSSBkb24ndCB0aGluayBib290X2NvdW50IHN0b3JlCj4+IHdoYXQgeW91IGV4cGVjdCAoc2Vl
IGFib3ZlKS4KPj4KPj4gQnV0IHdlIGRlZmluaXRlbHkgY2FuJ3QgYWxsb3cgdGhlIGNhbGxlciBv
ZiB0aWNrc190b19ucygpIHRvIHBhc3MgYQo+PiBuZWdhdGl2ZSB2YWx1ZSBhcyBhcmd1bWVudCBi
ZWNhdXNlIChjdmFsIC0gYm9vdF9jb3VudCkgbWF5IGJlIG92ZXIgMl42Mwo+PiBmb3IgaW5zdGFu
Y2UgaWYgdGhlIHVzZXIgcmVxdWVzdHMgYSB0aW1lciB0byBiZSBzZXQgaW4gYSBtaWxsaW9uIG9m
IHllYXIKPj4gKEkgZGlkbid0IGRvIHRoZSBtYXRoISkuCj4gCj4gQXNzdW1pbmcgMTAwTUh6IHRp
bWVyIGZyZXF1ZW5jeSwgdGhlIG1hdGggd29ya3Mgb3V0IHRvIGJlIGFib3V0IDUsODUwIHllYXJz
LAo+IGdpdmUgb3IgdGFrZS4gSSdtIGFzc3VtaW5nIHdlIGRvbid0IG5lZWQgdG8gd29ycnkgYWJv
dXQgcm9sbG92ZXIgY29uZGl0aW9ucz8KCkRvIHlvdSBtZWFuIGZvciB0aGUgdGltZXIgZXhwb3Nl
ZCB0byB0aGUgZ3Vlc3Q/IElmIHNvLCBJIHRoaW5rIHRoaXMgaXMgCnVwIHRvIHRoZSBndWVzdCB0
byB0YWtlIGNhcmUgb2YgdGhlIHJvbGwtb3Zlci4KCkluIFhlbiwgd2Ugb25seSBoYXZlIHRvIGJl
IGNhcmVmdWwgaWYgdGhpcyB3aWxsIHJvbGwtb3ZlciBvdXIgY291bnRlci4gCkxvb2tpbmcgYXQg
dGhlIGNvZGUsIEkgZG9uJ3QgdGhpbmsgd2UgYXJlIHRha2luZyBjYXJlIG9mIHRoaXMuCgogRnJv
bSB0aGUgQXJtIEFybSBtYW5kYXRlcyB0aGUgdGltZXIgdG8gaGF2ZSByb2xsLW92ZXIgdGltZSBv
ZiBub3QgbGVzcyAKdGhhbiA0MCB5ZWFycy4gU28gYW55dGhpbmcgcnVubmluZyBYZW4gbW9yZSB0
aGFuIDQwIHllYXJzIGNvbnRpbnVvdXNseSAKbWF5IGhpdCB0aGUgcHJvYmxlbS4KClRoZSBtYWpv
ciBodXJkbGUgdG8gaGFuZGxlIHJvbGxvdmVyIGlzIHRoYXQgdGhlIHNpemUgb2YgdGhlIGNvdW50
ZXIgaXMgCmF0IGxlYXN0IDU2IGJpdHMgb24gQXJtdjguIEJ1dCB5b3UgaGF2ZSBubyB3YXkgdG8g
ZGV0ZWN0IHRoZSBudW1iZXIgb2YgCmJpdHMuIEluIHNob3J0LCBmb3Igcm9sbC1vdmVyLCB3ZSBt
YXkgbmVlZCB0byB1c2UgVFZBTCByYXRoZXIgdGhhbiBDVkFMIAppbiBYZW4uCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
