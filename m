Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CB78497D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJAd-0004XL-Ce; Wed, 07 Aug 2019 10:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAF0=WD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hvJAc-0004XG-3t
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:27:50 +0000
X-Inumbo-ID: 0050dec4-b8fe-11e9-accb-7f35132f73be
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0050dec4-b8fe-11e9-accb-7f35132f73be;
 Wed, 07 Aug 2019 10:27:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so81250557wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 03:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/LJjhzk0pzvPz9qFfoMgQKRDTJEZj0sV+l+GJ63ac0c=;
 b=HGm/A/sn+Ju9nqRYtPrdOcYwo7H00cFpXeOlfPuUVCTfw0+LlvOpjfmnf8oHfebl/k
 mJXKw2vOmaZr4bQoFzncqAThqexqjphIzZH4yyz1FBKv2edRRkdsKE/XNHqxMhUg3pRz
 cOTXbHhH8MSnLR9n4wGOesWTY4po4bVTkZ7G4GGQSd5lcwA7nF/97R3ORl+a3Urz0U0V
 BpRiajJccR+TSNaZ4dylW09Xze5z1+rDqMKc7o+WkjBQMGWsyAwKVWxLM+uxrYT1hBCo
 nuQlCO5xr+99QOtg0bzB4XhSDath71MdxvxreEE+nTLRdHDOpXc5M61Xi+Nvydh/3iX0
 9JoQ==
X-Gm-Message-State: APjAAAVI1w5+/ajuiWah/B9MtrdJqoUFryvKha+6qwetWdve8bacb/FF
 i9jAKcxjsQbN0r4ck3vYiwt/fQ==
X-Google-Smtp-Source: APXvYqz4iLX1VO1K4HM5uTH5Oz0mkyqdb3kYfynHu7N486VbbAEvU1tohn3vbMZ99+4swNbqoqYynQ==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr4445252wmm.70.1565173667357; 
 Wed, 07 Aug 2019 03:27:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id z25sm93483780wmf.38.2019.08.07.03.27.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:27:46 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <089fb8b0-c5ad-00ab-ee85-437b022b54eb@redhat.com>
Date: Wed, 7 Aug 2019 12:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166794966.57397@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 20/26] memory: Access
 MemoryRegion with endianness
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 andrew@aj.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMTkgMTA6MzMsIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiArI2lmZGVmIE5F
RURfQ1BVX0gKPiArIMKgIMKgcmV0dXJuIGN0ejMyKHNpemUpIHwgTU9fVEU7Cj4gKyNlbHNlCj4g
wqAgwqAgwqByZXR1cm4gY3R6MzIoc2l6ZSk7Cj4gKyNlbmRpZgoKUGxlYXNlIHVzZSB0d28gc2Vw
YXJhdGUgZnVuY3Rpb25zIGZvciB0aGlzLCBmb3IgZXhhbXBsZSBzaXplX3RvX21lbW9wCmFuZCB0
YXJnZXRfc2l6ZV90b19tZW1vcCwgb3IgZXZlbiBqdXN0IGFkZCBNT19URSB0byB0aGUgY2FsbGVy
cyB0aGF0Cm5lZWQgaXQgKG9ubHkgY3B1dGxiLmM/KS4KClBhb2xvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
