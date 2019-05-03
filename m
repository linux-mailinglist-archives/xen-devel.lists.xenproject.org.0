Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EDE12D2A
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 14:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMWwt-0000xg-80; Fri, 03 May 2019 12:05:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fhF8=TD=gmail.com=ckoenig.leichtzumerken@srs-us1.protection.inumbo.net>)
 id 1hMWwr-0000xb-P6
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 12:05:53 +0000
X-Inumbo-ID: cb543425-6d9b-11e9-843c-bc764e045a96
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb543425-6d9b-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 12:05:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r7so7525313wrr.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YGu1Y9VezXVMpHUohZOs9+Bd2dI9N9DmPcOF3xiObZc=;
 b=dHc+xc8DYo3RihRctct4xWfaqJ5SiX1ja6MN1EHUcGdv8NLKKo084y9NitaTrPJgYv
 aAhc+nzQ5ZZWKvAkpv28d6EAduw3v39ezTmTYG/PwQ3UidrlrHS8yr52WR103xl+lxfY
 YyXTAVmH0V2lfgBbhIqhimNFXV2fMOQr3s5NklwAKZ+0NHpclKF//gDz7h2uYE7a8g8D
 UJEjKTsLt4q2uzP9/i/RSejAxgqvj2CpFIO2ZejuY2/sZfmbDspQ4oqw2cW/LVRkRvAN
 QA73UZngNoLmxfu7il/Q30G1JR104TYnxZBZ11sCnK2HEkQk5mjFkgF+I+6aFsPh1Mj0
 WIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=YGu1Y9VezXVMpHUohZOs9+Bd2dI9N9DmPcOF3xiObZc=;
 b=DVePTMLobZJ0GWs+uU/iWayYqR3L6ePgEqEoC4V/yq2ukljqixZEtFtlq5CKWegXOE
 z549dQau8wXHbKWhGjh8N94Nihd1jTyf/UmSvrcLw15Rd4gQNkK2WppFh/gr7iUOf9ZB
 VGFYFnfs3G31icXEfTuthzLLoZtfcQxJEGMa2BJSHezPs1E4JGGYnWwNNWrT6g3zlL5b
 FtJdktNw0pfEafKHjV7F7Q3JfdxcscMTqq1WuAteQFZZEGMbaeG9fueww0jLGX3SnTtz
 XyBYyU2n2zd8lvN9qCCepLCsTSuWD/XasEO6JwMxIQbmYi916S3oDEx8G6lyNyIeXoRd
 E4pA==
X-Gm-Message-State: APjAAAXpKQeTHUiHsSq5W3wyRygdh87kacVgR535bd9E/HmUCNHbQf7T
 8LyzzgwkAhUt5JPKGg9JHlE=
X-Google-Smtp-Source: APXvYqyYwnyo89NT41zbGJYLycJsHIGyjlMBU4l16+rP/hKAeRwZLEqVDzlM9YpnUIa9E2fhjOMM6Q==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr2832098wro.219.1556885150671; 
 Fri, 03 May 2019 05:05:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s16sm2232061wrg.71.2019.05.03.05.05.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 05:05:49 -0700 (PDT)
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20190430111002.106168-1-christian.koenig@amd.com>
 <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cbcbb076-a8b0-67b0-8c16-daf1d060fc1d@gmail.com>
Date: Fri, 3 May 2019 14:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] dma-buf: add struct dma_buf_attach_info v2
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
Reply-To: christian.koenig@amd.com
Cc: maxime.ripard@bootlin.com, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, digetx@gmail.com,
 sumit.semwal@linaro.org, m.szyprowski@samsung.com, devel@driverdev.osuosl.org,
 sstabellini@kernel.org, arnd@arndb.de, jonathanh@nvidia.com,
 tomi.valkeinen@ti.com, xen-devel@lists.xenproject.org,
 linux-media@vger.kernel.org, pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org,
 boris.ostrovsky@oracle.com, mchehab@kernel.org, sean@poorly.run,
 jgross@suse.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gMzAuMDQuMTkgdW0gMTk6MzEgc2NocmllYiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRt
aW46Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDE6MTA6MDJQTSArMDIwMCwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4gQWRkIGEgc3RydWN0dXJlIGZvciB0aGUgcGFyYW1ldGVycyBvZiBk
bWFfYnVmX2F0dGFjaCwgdGhpcyBtYWtlcyBpdCBtdWNoIGVhc2llcgo+PiB0byBhZGQgbmV3IHBh
cmFtZXRlcnMgbGF0ZXIgb24uCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcmVhc29uaW5nLiAg
V2hhdCBhcmUgdGhlICJuZXcgcGFyYW1ldGVycyIgdGhhdAo+IGFyZSBiZWluZyBwcm9wb3NlZCwg
YW5kIHdoeSBkbyB3ZSBuZWVkIHRvIHB1dCB0aGVtIGludG8gbWVtb3J5IHRvIHBhc3MKPiB0aGVt
IGFjcm9zcyB0aGlzIGludGVyZmFjZT8KPgo+IElmIHRoZSBpbnRlbnRpb24gaXMgdG8gbWFrZSBp
dCBlYXNpZXIgdG8gY2hhbmdlIHRoZSBpbnRlcmZhY2UsIHBhc3NpbmcKPiBwYXJhbWV0ZXJzIGlu
IHRoaXMgbWFubmVyIG1lYW4gdGhhdCBpdCdzIGVhc3kgZm9yIHRoZSBpbnRlcmZhY2UgdG8KPiBj
aGFuZ2UgYW5kIGRyaXZlcnMgbm90IHRvIG5vdGljZSB0aGUgY2hhbmdlcywgc2luY2UgdGhlIGNv
bXBpbGVyIHdpbGwKPiBub3Qgd2FybiAodW5sZXNzIHNvbWUgbWVtYmVyIG9mIHRoZSBzdHJ1Y3R1
cmUgdGhhdCB0aGUgZHJpdmVyIGlzIHVzaW5nCj4gZ2V0cyByZW1vdmVkLCBpbiB3aGljaCBjYXNl
IGl0IHdpbGwgZXJyb3IuKQo+Cj4gQWRkaXRpb25zIHRvIHRoZSBzdHJ1Y3R1cmUgd2lsbCBnbyB1
bm5vdGljZWQgYnkgZHJpdmVycyAtIHdoYXQgaWYgdGhlCj4gY2FsbGVyIGlzIGV4cGVjdGluZyBz
b21lIGRpZmZlcmVudCBraW5kIG9mIGJlaGF2aW91ciwgYW5kIHRoZSBkcml2ZXIKPiBpZ25vcmVz
IHRoYXQgbmV3IGFkZGl0aW9uPwoKV2VsbCwgZXhhY3RseSB0aGF0J3MgdGhlIGludGVudGlvbiBo
ZXJlOiBUaGF0IHRoZSBkcml2ZXJzIHVzaW5nIHRoaXMgCmludGVyZmFjZSBzaG91bGQgYmUgYWJs
ZSB0byBpZ25vcmUgdGhlIG5ldyBhZGRpdGlvbnMgZm9yIG5vdyBhcyBsb25nIGFzIAp0aGV5IGFy
ZSBub3QgZ29pbmcgdG8gdXNlIHRoZW0uCgpUaGUgYmFja2dyb3VuZCBpcyB0aGF0IHdlIGhhdmUg
bXVsdGlwbGUgaW50ZXJmYWNlIGNoYW5nZXMgaW4gdGhlIApwaXBlbGluZSwgYW5kIGVhY2ggc3Rl
cCByZXF1aXJlcyBuZXcgb3B0aW9uYWwgcGFyYW1ldGVycy4KCj4gVGhpcyBkb2Vzbid0IHNlZW0g
dG8gbWUgbGlrZSBhIGdvb2QgaWRlYS4KCldlbGwsIHRoZSBvYnZpb3VzIGFsdGVybmF0aXZlcyBh
cmU6CgphKSBDaGFuZ2UgYWxsIGRyaXZlcnMgdG8gZXhwbGljaXRseSBwcm92aWRlIE5VTEwvMCBm
b3IgdGhlIG5ldyBwYXJhbWV0ZXJzLgoKYikgVXNlIGEgd3JhcHBlciwgc28gdGhhdCB0aGUgZnVu
Y3Rpb24gc2lnbmF0dXJlIG9mIGRtYV9idWZfYXR0YWNoIHN0YXlzIAp0aGUgc2FtZS4KCktleSBw
b2ludCBoZXJlIGlzIHRoYXQgSSBoYXZlIGFuIGludmFsaWRhdGlvbiBjYWxsYmFjayBjaGFuZ2Us
IGEgUDJQIApwYXRjaCBzZXQgYW5kIHNvbWUgbG9ja2luZyBjaGFuZ2VzIHdoaWNoIGFsbCByZXF1
aXJlIGFkZGluZyBuZXcgCnBhcmFtZXRlcnMgb3IgZmxhZ3MuIEFuZCBhdCBlYWNoIHN0ZXAgSSB3
b3VsZCB0aGVuIHN0YXJ0IHRvIGNoYW5nZSBhbGwgCmRyaXZlcnMsIGFkZGluZyBzb21lIG1vcmUg
TlVMTCBwb2ludGVycyBvciBmbGFncyB3aXRoIDAgZGVmYXVsdCB2YWx1ZS4KCkknbSBhY3R1YWxs
eSBwZXJmZWN0bHkgZmluZSBnb2luZyBkb3duIGFueSByb3V0ZSwgYnV0IHRoaXMganVzdCBzZWVt
ZWQgCnRvIG1lIHNpbXBsZXN0IGFuZCB3aXRoIHRoZSBsZWFzdCByaXNrIG9mIGJyZWFraW5nIGFu
eXRoaW5nLiBPcGluaW9ucz8KClRoYW5rcywKQ2hyaXN0aWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
