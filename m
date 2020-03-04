Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4187179235
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:22:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Urj-0003On-VK; Wed, 04 Mar 2020 14:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nFHQ=4V=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1j9Uri-0003Oc-2y
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:19:14 +0000
X-Inumbo-ID: 1fa8809a-5e23-11ea-a3ec-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1fa8809a-5e23-11ea-a3ec-12813bfff9fa;
 Wed, 04 Mar 2020 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583331553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNvxBkc+0sLn/M93sJq0r8WECREa81du/QTpzjZXEt8=;
 b=Mx5wbmJuzJ5pn7iuYPO+0jnU9i9NWZHP99oT9XiEgV2k3ypbfBGNilyHvZgzO8JpekB7+Q
 McQBMWUw12FPuPojBt7x7RBOb6cP7wcpcWRUiGIt44eeVliYpBf//Yfh1ynDOe7uN0i6a2
 Z8ATrvsbi+GJovy7PlOFianG7YEx3u0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-epWfzG2QO7udgeZyjfNMUg-1; Wed, 04 Mar 2020 09:19:10 -0500
X-MC-Unique: epWfzG2QO7udgeZyjfNMUg-1
Received: by mail-wr1-f72.google.com with SMTP id m13so924312wrw.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 06:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=18OMrVfu00BGHTajXs/3slGyD4i/96bG2uMqkT7G3sA=;
 b=uKZlK28lrbm3S6qs0KPIEv09tGeQfLEaZ9svzMlRxoDWqvcu3USCBytqYSlDDk1Ag+
 MNeLb8p7G1alkhjNhFaWXCyT09unrfLxNdA3QISB/MR7EqklQOd+vrsu8JsGNevLg59Z
 DpnT/nkRoThmW9d7IwzF+wvJ05HZnkyKciYTLgELGLy/gfIB0NSiUZLC9qQI2Hr9li0J
 icGJvkAjiyqqCXdElg8f8hcsEQ7IiCVaA0oce2rBDvez0wBcgiFeGL0KTGf1v9rU5Emu
 10umNuonX7spHxu/0qVr0H0TSOab8khSkfbewWYfD604zmVOyfazRKkNEAO8VEUL+LM2
 Nytg==
X-Gm-Message-State: ANhLgQ0txzf55sJREgmPjsvfD6xCjuyhlvcNYFHVlSqYRBJ30bYV2Jd2
 hsgdWpG0pF2O/9iO1ICF2DX3n4KxWBJUAmMwjxQylTvXNmYDzJIRjWjhc7YQNW/q9Cqn8OHyD+N
 yvflAOXbCrojfes5kjyRgnPdo6uA=
X-Received: by 2002:adf:ed42:: with SMTP id u2mr4446963wro.345.1583331548692; 
 Wed, 04 Mar 2020 06:19:08 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsEcToJJ6f8QbbBHBqWodF6qXnmm+v231lj0jYmyJ2AAOJZwxYVnD7AK7dmnZoEvl9kglaFJQ==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr4446930wro.345.1583331548416; 
 Wed, 04 Mar 2020 06:19:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id o3sm5426191wme.36.2020.03.04.06.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 06:19:07 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
 <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
 <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
 <f1d4241c-e82e-53db-cc33-898890a0b070@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f10c129e-bef2-67ab-2aff-d3c9bda14b82@redhat.com>
Date: Wed, 4 Mar 2020 15:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f1d4241c-e82e-53db-cc33-898890a0b070@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 1/2] misc: Replace zero-length arrays with
 flexible array member (automatic)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDMvMjAgMTU6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IEknbGwg
c2VuZCBhIGZpeCBmb3IgdGhlIGRhbmdlcm91cyBjb2RlLgo+IERvIHlvdSB3YW50IHRvIGRyb3Ag
dGhpcyBzZXJpZXMsIG9yIG9ubHkgdGhlIGNoYW5nZSBpbiAnc3RydWN0IHNycF9yc3AnCj4gKG9y
IGluIGFsbCBody9zY3NpL3NycC5oKS4gQWN0dWFsbHkgSSBndWVzcyBpdCBtYWtlcyBzZW5zZSBJ
IG1vdmUgdGhlCj4gJ2h3L3Njc2kvc3JwLmgnIGNoYW5nZXMgd2l0aCB0aGUgc2VyaWVzIGNsZWFu
aW5nIGRhbmdlcm91cyBjb2RlLgoKQXMgeW91IHByZWZlciwgaXQncyBub3QgdXJnZW50IHRvIG1l
cmdlIGl0LgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
