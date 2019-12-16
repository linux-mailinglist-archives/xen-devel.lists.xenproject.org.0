Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D692D1206C3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:14:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqA0-0000HY-Sy; Mon, 16 Dec 2019 13:11:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igq9z-0000HS-3D
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:11:39 +0000
X-Inumbo-ID: 97e1c172-2005-11ea-93a1-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 97e1c172-2005-11ea-93a1-12813bfff9fa;
 Mon, 16 Dec 2019 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5vHxeCZJ0xVZEMwUtEzCnwTU4HB2NgrECx9MicRG6o=;
 b=C2LQGDX3T0N0fLnL/ypVQPWVmM/4+3t8qAWoL+XkEyAXoD7Ur+EHCz8DMoeDbDZcoMUCBu
 U4jS0AqLqVjIYVVEkSwTxnd8kqVJTtTwl1FJMInDl+CI5mLn/0c+m+ZyLXl89RTGERcrHK
 n2iExnrYChTc8b9H17GhyxRvzmgFsDY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-QG91erJzPJeu00o_GhjCjg-1; Mon, 16 Dec 2019 08:11:34 -0500
Received: by mail-wm1-f70.google.com with SMTP id o24so1005349wmh.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O9cATtB6pbYt1/J3PE5x5GGao7scjTW4c1UJnxl2UqM=;
 b=f/bKJGXU9dRgMUasKMRGKivPQ7NRdBegsLEey0OrNNbUdF1Pk9UHP945PQeuU8VMvf
 /vQ266/BtLRvUBdIMCGviGW00bnnZUOCdemgTuLgiaIM5rRLEvtEnkN9AHcGdZ89CCiq
 hagb4t13kZhjdUG+M8HNCA82EOX7/u3CGZMchyivrEB68bylwvxUCfjAFbq2A2kaVpnA
 bXqacCNbxcjNLvudjzwDnzIygLaxNCGVzufRIfm6xIQwXb7UXgRMVrf6MRLESZjQaWrN
 VE23P4ru4MyN5Fay8FnFs+5n1oYUVi91kc6gy+pIThkHYUNifuebRcMdeWxsTIo4+Bvb
 Ysbw==
X-Gm-Message-State: APjAAAXl/nH484KNMLdc9Bqsz4IGZGoGIO2UsN87m38kxrMbxOwkFc7P
 tv/nfdXGOEJtDZRg3ul5/Oj7+P4s+AH5brq289oud4WXyfwp/m8fLFnEKdi99lA1cAkCGfW4whD
 uyKKRlO0Y/W/zOzYwf4ygsTfp3V0=
X-Received: by 2002:adf:df8e:: with SMTP id z14mr29964677wrl.190.1576501893620; 
 Mon, 16 Dec 2019 05:11:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQRXuwtsErZVb6m+PpFDPU/O5P8Uccsrb7klFy/bxWKMqwMlqFrlhlnta+/vHq8ERR9JDVmQ==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr29964634wrl.190.1576501893313; 
 Mon, 16 Dec 2019 05:11:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id b16sm22033755wrj.23.2019.12.16.05.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:32 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <622546ed-9117-0be8-1631-dfba81a9353d@redhat.com>
Date: Mon, 16 Dec 2019 14:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-7-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: QG91erJzPJeu00o_GhjCjg-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 06/12] hw/i386/ich9: Move unnecessary
 "pci_bridge.h" include
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

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IFdoaWxl
IHRoZSBJQ0g5IGNoaXBzZXQgaXMgYSAnU291dGggQnJpZGdlJywgaXQgaXMgbm90IGEgUENJIGJy
aWRnZS4KPiBOb3RoaW5nIGluICJody9pMzg2L2ljaDkuaCIgcmVxdWlyZXMgZGVmaW5pdGlvbnMg
ZnJvbSAicGNpX2JyaWRnZS5oIgo+IHNvIG1vdmUgaXRzIGluY2x1c2lvbiB3aGVyZSBpdCBpcyBy
ZXF1aXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcvaTM4Ni9pY2g5LmggICAgfCAxIC0K
PiAgaHcvaTM4Ni9hY3BpLWJ1aWxkLmMgICAgICB8IDEgKwo+ICBody9wY2ktYnJpZGdlL2k4Mjgw
MWIxMS5jIHwgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9pY2g5LmggYi9pbmNsdWRl
L2h3L2kzODYvaWNoOS5oCj4gaW5kZXggZWViNzlhYzFmZS4uMzY5YmM2NDY3MSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2h3L2kzODYvaWNoOS5oCj4gKysrIGIvaW5jbHVkZS9ody9pMzg2L2ljaDku
aAo+IEBAIC03LDcgKzcsNiBAQAo+ICAjaW5jbHVkZSAiaHcvaXNhL2FwbS5oIgo+ICAjaW5jbHVk
ZSAiaHcvaTM4Ni9pb2FwaWMuaCIKPiAgI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKPiAtI2luY2x1
ZGUgImh3L3BjaS9wY2lfYnJpZGdlLmgiCj4gICNpbmNsdWRlICJody9hY3BpL2FjcGkuaCIKPiAg
I2luY2x1ZGUgImh3L2FjcGkvaWNoOS5oIgo+ICAjaW5jbHVkZSAiaHcvcGNpL3BjaV9idXMuaCIK
PiBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMgYi9ody9pMzg2L2FjcGktYnVpbGQu
Ywo+IGluZGV4IDEyZmY1NWZjZmIuLjI5MTkwOWZhMDUgMTAwNjQ0Cj4gLS0tIGEvaHcvaTM4Ni9h
Y3BpLWJ1aWxkLmMKPiArKysgYi9ody9pMzg2L2FjcGktYnVpbGQuYwo+IEBAIC0yNyw2ICsyNyw3
IEBACj4gICNpbmNsdWRlICJxZW11L2JpdG1hcC5oIgo+ICAjaW5jbHVkZSAicWVtdS9lcnJvci1y
ZXBvcnQuaCIKPiAgI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKPiArI2luY2x1ZGUgImh3L3BjaS9w
Y2lfYnJpZGdlLmgiCj4gICNpbmNsdWRlICJody9jb3JlL2NwdS5oIgo+ICAjaW5jbHVkZSAidGFy
Z2V0L2kzODYvY3B1LmgiCj4gICNpbmNsdWRlICJody9taXNjL3B2cGFuaWMuaCIKPiBkaWZmIC0t
Z2l0IGEvaHcvcGNpLWJyaWRnZS9pODI4MDFiMTEuYyBiL2h3L3BjaS1icmlkZ2UvaTgyODAxYjEx
LmMKPiBpbmRleCAyYjM5MDc2NTViLi4wMzNiM2M0M2M0IDEwMDY0NAo+IC0tLSBhL2h3L3BjaS1i
cmlkZ2UvaTgyODAxYjExLmMKPiArKysgYi9ody9wY2ktYnJpZGdlL2k4MjgwMWIxMS5jCj4gQEAg
LTQzLDYgKzQzLDcgQEAKPiAgCj4gICNpbmNsdWRlICJxZW11L29zZGVwLmgiCj4gICNpbmNsdWRl
ICJody9wY2kvcGNpLmgiCj4gKyNpbmNsdWRlICJody9wY2kvcGNpX2JyaWRnZS5oIgo+ICAjaW5j
bHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKPiAgI2luY2x1ZGUgInFlbXUvbW9kdWxlLmgiCj4g
ICNpbmNsdWRlICJody9pMzg2L2ljaDkuaCIKPiAKClF1ZXVlZCwgdGhhbmtzLgoKUGFvbG8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
