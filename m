Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541101793C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:40:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9W5V-0003ir-26; Wed, 04 Mar 2020 15:37:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l4g8=4V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j9W5T-0003iZ-BR
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:37:31 +0000
X-Inumbo-ID: 0ce93f5c-5e2e-11ea-a426-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0ce93f5c-5e2e-11ea-a426-12813bfff9fa;
 Wed, 04 Mar 2020 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583336246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLwegWhksnCSFhbTsg9HBFdexec8o5i8mlRI0ZESlcU=;
 b=Igjk1gTWezrO+ymg1xKPaVHx70IYPIe6u5xACWYS9FdPMBmTXmTtZtm5k/qrF1ZrcYrKhY
 w5qTnTo3u8tsmGcdiV+SrGXvEPLYYzkR9efAtA76tyGCd453PagHi/6vc+VNGKhGZftpQZ
 Uf+cws4ONKBP7AM/KEj3VR+1lpC/Krg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-rpxv9Bn-NKq87AjzXcibaQ-1; Wed, 04 Mar 2020 10:37:24 -0500
X-MC-Unique: rpxv9Bn-NKq87AjzXcibaQ-1
Received: by mail-ed1-f70.google.com with SMTP id g26so583225edj.17
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 07:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IaZb3jZXgXUQ0Ui30FG9rDWKE080uydwkImMg1ijy3A=;
 b=SkJepDg3Lio49Ep3Exx/n7Ie8oCj52hysk5OSAuZUV8niQzBQL1AbA7sqwJM7GDmbw
 bIU5ZcQvKOQtxKAXAhfLfuOe+uhnsRyvf1k7PzhzLp+RMlbC+v0IhWpO7bC2j68WZyu2
 RHVp9pWtJPk4DHiFzDlsbyyfrAjBBwMmgje7dxh0CzjMmXeawo4RD48dxse6Z9LBg5Mz
 MMWnwc/GCo7uiRxSaXfUEcJoO43TlYszlTHvssodxwWBgXv8oo5sx3TeztZGGQ6KrwwJ
 QTinZ+tVDI8qTeW00YezUGW4uW13YDI7jYnoorcpJrPNrJdI6XH4zL24bjKSXkFY79Rh
 qiKQ==
X-Gm-Message-State: ANhLgQ33IbxIMThws1isnb5tdWJYPxJvOUbWl8UD8vcGh1hpCorBRYcJ
 AibITi+S5QDq8zkpZx8uPQwIhNPCvtv4vHFwD+hhz387MRreSsU5m3K8Egt4uIBRJCHEyPEltaC
 IOrD8PUfrSAnlDv+oA0DdcWvtOt4=
X-Received: by 2002:a05:6402:6d2:: with SMTP id
 n18mr3445008edy.32.1583336243656; 
 Wed, 04 Mar 2020 07:37:23 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsZUTa/Z4JcOus7Mkiel3UTDwR46BnUNrc9oaaHYPOWmHXNDraW56M/7eYwioDkLZFQp4cI1g==
X-Received: by 2002:a05:6402:6d2:: with SMTP id
 n18mr3444980edy.32.1583336243519; 
 Wed, 04 Mar 2020 07:37:23 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id d2sm97623edz.1.2020.03.04.07.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 07:37:23 -0800 (PST)
To: qemu-devel@nongnu.org
References: <20200304153601.23423-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <307b81ff-a56a-5f43-20d4-edb75776390a@redhat.com>
Date: Wed, 4 Mar 2020 16:37:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304153601.23423-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 0/2] misc: Replace zero-length arrays with
 flexible array member
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy80LzIwIDQ6MzUgUE0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IHYyOgo+
IC0gZG8gbm90IG1vZGlmeSBxZWQuaCAoc3RydWN0dXJlIHdpdGggc2luZ2xlIG1lbWJlcikKPiAt
IGJhc2VkIG9uIGh3L3Njc2kvc3BhcHJfdnNjc2kgZml4IHNlcmllcwo+IAo+IFRoaXMgaXMgYSB0
cmVlLXdpZGUgY2xlYW51cCBpbnNwaXJlZCBieSBhIExpbnV4IGtlcm5lbCBjb21taXQKPiAoZnJv
bSBHdXN0YXZvIEEuIFIuIFNpbHZhKS4KClBsZWFzZSBpZ25vcmUsIGZvciBzb21lIHJlYXNvbiB0
aGUgJ3YyJyB0YWcgaXMgbWlzc2luZy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
