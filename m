Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B01B116B55
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:45:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGUP-0002Ee-D8; Mon, 09 Dec 2019 10:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iyN9=Z7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ieGUN-0002EW-K0
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:42:03 +0000
X-Inumbo-ID: 88fe118c-1a70-11ea-88e7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 88fe118c-1a70-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575888122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faWikn8ZwvgnT1S5A6OW/eAq3CswZxBEGN2w96rdV+o=;
 b=et1yr/QGsKqnpn6TaX9wxP6hZkf3koygtxxtzIVHDwjSclg9XQIH9KKOcIiw+taXk8hyNu
 4BTEt5hMa8bmNDJ+ROl/Dl0iLnH4xG6sUC8Nj0tLrTROIZIjkDlLPXZkgH1hPvAu0oK2SC
 ZsEh/XIkOgHPzZq8yaDA83JIBZiX+Yo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-G5IvizmsMFGG4dtjVRNWBQ-1; Mon, 09 Dec 2019 05:42:00 -0500
Received: by mail-wr1-f69.google.com with SMTP id c17so7278152wrp.10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 02:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AOGg0FupmGSBGT96UmLkohViFxNYvdwXFb83majsKxk=;
 b=X/LhZx/hwa0jhqSStpK+0jVLyvawUihG51JKah2ZvlCvfK8cB1sWRJp6IQ9koR0aH8
 sNP8L1dQqepqORg4LgwfVvObLd6itx/TrUrCR210xvVCDi+6o++p1wKEN2ievYEeJc6R
 CHPGwiBeCQ7MFJlvYilDZ8dtuz6ZCQxbhG/ffL40eQjoOCwAa4iH+SXceZtqPk0GmEOk
 lZNFMeKtZxIuNFnDdjcxCOJqOMZoOJV4izOZSSTtsbqIy4Um5bQrX5GFzuFuf8hDRe7T
 I8nUIB35p5kn/yMy3Dk+mYZoPRyEZKHolNxezKpIdYBgG4ViYIWBlbfgb+7NdeO/vrgv
 FU2g==
X-Gm-Message-State: APjAAAW9kkj/phO+Lljv/MmX1JAucuHLDyevHvy1zZB3gvJRH43SUSbh
 vqe02fYjTeDfd2+LQIWT9y0ia0M23v5RLAdXoJ1ahJNDCQ6IAllxngDoofD8njVmIYCgBqR+UF8
 +Ezra1nldNlYJxKuahI+bZm9eCI8=
X-Received: by 2002:a1c:740b:: with SMTP id p11mr23167402wmc.78.1575888119519; 
 Mon, 09 Dec 2019 02:41:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0Pr9r4MAVP0uz9FUqFcrZaLxD7X5ZsPiOgOV7Kdp+D1GHhsBLypdcVa4XI8GG9pCRaFxg8g==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr23167375wmc.78.1575888119292; 
 Mon, 09 Dec 2019 02:41:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id b185sm14349018wme.36.2019.12.09.02.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 02:41:58 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-7-philmd@redhat.com>
 <3f1702b0765841b19328366af11fd3ed@EX13D32EUC003.ant.amazon.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <083d0d7f-766d-9e72-5395-b4e82858ef4d@redhat.com>
Date: Mon, 9 Dec 2019 11:42:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <3f1702b0765841b19328366af11fd3ed@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
X-MC-Unique: G5IvizmsMFGG4dtjVRNWBQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig
 entry to select the IGD Passthrough Host Bridge
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMTkgMTE6MTAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4gLS0tCj4+
IHYzOiBPbmx5IGRlZmF1bHQgd2l0aCBYZW4gKEFsZXggV2lsbGlhbXNvbikKPj4KPj4gSSBkaWQg
bm90IHVzZWQgJ2RlcGVuZHMgb24gWEVOJyBhcyBzdWdnZXN0ZWQgYnkgQWxleCBidXQKPj4gJ2Rl
ZmF1bHQgeSBpZiBYRU4nLCBzbyBvbmUgY2FuIGJ1aWxkIFhFTiB3aXRob3V0IHRoaXMgZmVhdHVy
ZQo+PiAoZm9yIGV4YW1wbGUsIG9uIG90aGVyIEFSQ0ggdGhhbiBYODYpLgoKSSB0aGluayB3aGF0
IHlvdSB3YW50IGlzIGFjaGlldmVkIGJ5CgoJZGVmYXVsdCB5CglkZXBlbmRzIG9uIFhFTiAmJiBQ
Q19JNDQwRlgKCj8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
