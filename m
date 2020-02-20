Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42316689C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 21:40:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4sZN-0008Ru-8D; Thu, 20 Feb 2020 20:37:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zM8Q=4I=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1j4sZL-0008Rp-MV
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 20:37:11 +0000
X-Inumbo-ID: c49aea64-5420-11ea-8597-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c49aea64-5420-11ea-8597-12813bfff9fa;
 Thu, 20 Feb 2020 20:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582231030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpVntnYFcRNRYp9vd38D9RLd3ZoZgdoVy3FSxPuLQ18=;
 b=RmiVa+6NWfzQl/7OOMT6BahYlKE9SVF7kBaZgREjBHjAJCHvPG8IMCyZ1I7s16ZhX9oaVN
 vIcRftyxfi0v5ZVwb7n2GTu2EMn4G+HPneHM8kfnnB+Nfry4V2WDCaQJBD3q1J6HRka8ku
 SrALkBaUuSROcSR/Mt3VE3AJSYQU960=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-BTA5LkQ2Mz6iF9zpUIGxkw-1; Thu, 20 Feb 2020 15:37:06 -0500
Received: by mail-qt1-f198.google.com with SMTP id l25so9453qtu.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 12:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=so8lauUUoGRoi/jJSytdd24qTKrEHkl0ntF8odMqIEk=;
 b=HoGCOBdYLefBy/DkR+Zi8g4By1zGxlHGbhqDWijSwR6w7IysNSU68Jz6C79ZxkhI3X
 rIYG5XdgQ5VHd+nNYRHKRqNXHyu5Ru4pfmDhJlGn/ljB6c3dD8mGRGy4usn9vVSR4t8s
 PJ9GGYGGZB5+zfTznT+tiVJp4Ppux5EOYJJ2D+r3k3WB5GTjpGtKo1f2lEWoJuYseede
 3Sn5BGPCStcKNux5Ad96bWT1c6pJ+Qr4j7biNPBAq5J+ofuwHHnuq+UfC9PK1925R0XU
 rVRGYx1zfCSWnUiK3QcSmc+XXcAco2+NmH1mphjdfBIqboFimArJcXsrAMl399yPObPz
 B7UQ==
X-Gm-Message-State: APjAAAXXM57Dd2jODNvKRpmkxJf07p4LDCSLLVlS08++FDgeeAzEZfdn
 f0lqUcaZs+t9ki1gTCqst7kSF5AUH33qRTYD0BxS360TgKp/DYHTqkz5Ecd/1eih4nNnOOTtXi+
 N3CyiK7PNZsEKT6fU8kEH3Y2T96A=
X-Received: by 2002:a05:6214:1708:: with SMTP id
 db8mr26944594qvb.129.1582231025547; 
 Thu, 20 Feb 2020 12:37:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2CDQ9YV75e83hj4oP1c/1mOoRGzxY5Z43juejD8dEw+xmm2eKkwPF3YfbhM2cUNmFM6trdQ==
X-Received: by 2002:a05:6214:1708:: with SMTP id
 db8mr26944566qvb.129.1582231025364; 
 Thu, 20 Feb 2020 12:37:05 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id a2sm397978qka.75.2020.02.20.12.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:37:04 -0800 (PST)
Date: Thu, 20 Feb 2020 15:36:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20200220153648-mutt-send-email-mst@kernel.org>
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200220130548.29974-2-philmd@redhat.com>
X-MC-Unique: BTA5LkQ2Mz6iF9zpUIGxkw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 01/20] scripts/git.orderfile: Display
 Cocci scripts before code modifications
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDI6MDU6MjlQTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gV2hlbiB3ZSB1c2UgYSBDb2NjaW5lbGxlIHNlbWFudGljIHNjcmlw
dCB0byBkbyBhdXRvbWF0aWMKPiBjb2RlIG1vZGlmaWNhdGlvbnMsIGl0IG1ha2VzIHNlbnNlIHRv
IGxvb2sgYXQgdGhlIHNlbWFudGljCj4gcGF0Y2ggZmlyc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBzY3JpcHRzL2dp
dC5vcmRlcmZpbGUgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2l0Lm9yZGVyZmlsZSBiL3NjcmlwdHMvZ2l0Lm9yZGVy
ZmlsZQo+IGluZGV4IDFmNzQ3YjU4M2EuLjdjZjIyZTBiZjUgMTAwNjQ0Cj4gLS0tIGEvc2NyaXB0
cy9naXQub3JkZXJmaWxlCj4gKysrIGIvc2NyaXB0cy9naXQub3JkZXJmaWxlCj4gQEAgLTIyLDYg
KzIyLDkgQEAgTWFrZWZpbGUqCj4gIHFhcGkvKi5qc29uCj4gIHFnYS8qLmpzb24KPiAgCj4gKyMg
c2VtYW50aWMgcGF0Y2hlcwo+ICsqLmNvY2NpCj4gKwo+ICAjIGhlYWRlcnMKPiAgKi5oCj4gIAo+
IC0tIAo+IDIuMjEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
