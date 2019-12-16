Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A261206C5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:15:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqAl-0000V2-8a; Mon, 16 Dec 2019 13:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igqAj-0000US-FN
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:12:25 +0000
X-Inumbo-ID: aef531e6-2005-11ea-a914-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aef531e6-2005-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gLg1Jp9E8WO+3bPfrTlu11fIfKsZ0njITxJ48uZHgg=;
 b=ZiN/Nh3iM1rIe/tflPr4wNvxUyOwBLJhuIbP1so1rP2rdIeQIWYxLnFqpupbVtAfzxV6Cu
 aPC84/kOymnqAt/MORJ0drSQZD21PrxuXm5OhADcNlMawY/grvynzjoybMJgO3PdPYIPsT
 lCoduCE1CDcT8Gs5EppiaX4N3DkYlfw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-btIIVjN4PMuN73RX6VxC3g-1; Mon, 16 Dec 2019 08:11:29 -0500
Received: by mail-wm1-f72.google.com with SMTP id q21so1014904wmc.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FXYYP7m5x86Bk37M1YJB4xh6R0fOUNpBlIMCqcUij+E=;
 b=MJzrN2IV95yiL/DHuBgO+PqzIDBtfXCt7xeJO0516+g8k5wO7xCQrKM7ImWuxQtoH1
 pcO3n7UdZPeqD9iLfyAbA0xVlW+2N1LIhW7yD0pt7s1TmU6fja7aTyUV5haSL4tKZVS+
 uYdk25WOYsPVgV92QJQLXMZgM5cd4T+JPb78wuL4NImGgh1NK6Yz/evKoXefiq3Lh+O4
 NjzezPwz94dNGiwkKIMjEIUzb+ZMEJYyU4HkWCAoDc6yb/JtoWc40dbAqJeeK5tsm2yf
 6GeOvaiRNKznv66ILnrO40KAfw77IK9YgyIkgk64fBfEhx4gfwKZed9Ob+SzDNWr9SYx
 w78A==
X-Gm-Message-State: APjAAAWUkvuHAT3BACsXjqSnjQPLnlAljiWiBrcez2WnJJL85rD9CVbp
 UGf5wf14MuVpIC3ygckTS1dtIuUvWBEvytRjWtFmZj9wdfbltrH0qFIQiypdb6VuReygLN1Cwc5
 2S8SAyDOqLztC87r1pPChwqC0HMY=
X-Received: by 2002:a1c:8086:: with SMTP id b128mr30614671wmd.80.1576501887765; 
 Mon, 16 Dec 2019 05:11:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdE9VroDhn6zSvqLM+CRCLzGyJou2Umxg4Ryp4vAVu7qRvR4LrFZvhR++1aIuoI0i+slJgYw==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr30614636wmd.80.1576501887535; 
 Mon, 16 Dec 2019 05:11:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id d16sm23348661wrg.27.2019.12.16.05.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:27 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-6-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4f195401-f896-75cd-f590-0c1f4bd6c46f@redhat.com>
Date: Mon, 16 Dec 2019 14:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-6-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: btIIVjN4PMuN73RX6VxC3g-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 05/12] hw/i386/ich9: Remove unused include
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

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IFRoZSAi
cGNpZV9ob3N0LmgiIGhlYWRlciBpcyB1c2VkIGJ5IGRldmljZXMgcHJvdmlkaW5nIGEgUENJLWUg
YnVzLAo+IHVzdWFsbHkgTm9ydGggQnJpZGdlcy4gVGhlIElDSDkgaXMgYSBTb3V0aCBCcmlkZ2Uu
Cj4gU2luY2Ugd2UgZG9uJ3QgbmVlZCB0aGlzIGhlYWRlciwgZG8gbm90IGluY2x1ZGUgaXQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQu
Y29tPgo+IC0tLQo+ICBpbmNsdWRlL2h3L2kzODYvaWNoOS5oIHwgMSAtCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9pY2g5
LmggYi9pbmNsdWRlL2h3L2kzODYvaWNoOS5oCj4gaW5kZXggNzJlODAzZjZlMi4uZWViNzlhYzFm
ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2h3L2kzODYvaWNoOS5oCj4gKysrIGIvaW5jbHVkZS9o
dy9pMzg2L2ljaDkuaAo+IEBAIC03LDcgKzcsNiBAQAo+ICAjaW5jbHVkZSAiaHcvaXNhL2FwbS5o
Igo+ICAjaW5jbHVkZSAiaHcvaTM4Ni9pb2FwaWMuaCIKPiAgI2luY2x1ZGUgImh3L3BjaS9wY2ku
aCIKPiAtI2luY2x1ZGUgImh3L3BjaS9wY2llX2hvc3QuaCIKPiAgI2luY2x1ZGUgImh3L3BjaS9w
Y2lfYnJpZGdlLmgiCj4gICNpbmNsdWRlICJody9hY3BpL2FjcGkuaCIKPiAgI2luY2x1ZGUgImh3
L2FjcGkvaWNoOS5oIgo+IAoKUXVldWVkLCB0aGFua3MuCgpQYW9sbwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
