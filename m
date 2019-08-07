Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D585297
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQF2-00053l-7s; Wed, 07 Aug 2019 18:00:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAF0=WD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hvQF0-00053g-F3
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 18:00:50 +0000
X-Inumbo-ID: 48cc82e9-b93d-11e9-8980-bc764e045a96
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48cc82e9-b93d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 18:00:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k2so6409358wrq.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 11:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnNcTkcEY3ZbfGxsdEEUpb9QGclJr+HC6jfSpFEWpCc=;
 b=kdgGQnbob0ivjFmoDt97aExjpanEVW2tyRnFTIEN+kVuhP1QM1RC77AqM7eANZ3P4O
 EMQPeQ/lF53+bQxi+ChoFO+TOUA8nccD6AAXrehEzLGFrYEIPfWamrFWEpP0d6DMeZ8r
 9lFIDYoYa0J2BWQ5+J7bDlMIzURnpQau4e/9ghKdHUbUywr8L9NupqXAKpIv4Z5KsWZD
 nULF0n3BhiNPTiJFIkwMozeaLKfj9tyliz/XfbUpRVtncaamuK81kcHH55YOB6cOa+YO
 uXWnlMFgK3JMteuKH5rrCZV+XqMZg9m9LLQ8naklZQm3C4OO3kaUEKxzKFiCUV0Fcq4F
 fyBg==
X-Gm-Message-State: APjAAAW2wWEV9McARtIYsTRW7Ik4v6nOPe+FoDzbLG9XmIL/5gJL5LpC
 bPEui1D/GP6KCCjhO1WSy1z/Kw==
X-Google-Smtp-Source: APXvYqyYoV6gvukGjStjYXXYOxG2iT1OUTlYjsb5W/KdyagD9b54ohMavaSsDHFf998uWCLRMeYzRA==
X-Received: by 2002:adf:8bd1:: with SMTP id w17mr12968197wra.50.1565200846958; 
 Wed, 07 Aug 2019 11:00:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id a19sm6155981wra.2.2019.08.07.11.00.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:00:46 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
 <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
Date: Wed, 7 Aug 2019 20:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
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
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 marex@denx.de, robh@kernel.org, hare@suse.com, sstabellini@kernel.org,
 berto@igalia.com, proljc@gmail.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de, mst@redhat.com,
 magnus.damm@gmail.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, rth@twiddle.net,
 philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMTkgMTk6NDksIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOgo+IE9uIDgvNy8xOSAx
OjMzIEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4+IEBAIC01NTEsNiArNTUxLDcgQEAg
dm9pZCB2aXJ0aW9fYWRkcmVzc19zcGFjZV93cml0ZShWaXJ0SU9QQ0lQcm94eSAqcHJveHksIGh3
YWRkciBhZGRyLAo+PiAgICAgICAgICAvKiBBcyBsZW5ndGggaXMgdW5kZXIgZ3Vlc3QgY29udHJv
bCwgaGFuZGxlIGlsbGVnYWwgdmFsdWVzLiAqLwo+PiAgICAgICAgICByZXR1cm47Cj4+ICAgICAg
fQo+PiArICAgIC8qIEZJWE1FOiBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3dyaXRlIGlnbm9yZXMg
TU9fQlNXQVAuICAqLwo+PiAgICAgIG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfd3JpdGUobXIsIGFk
ZHIsIHZhbCwgc2l6ZV9tZW1vcChsZW4pLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCk7Cj4+ICB9Cj4gCj4gSGVyZSBpcyBhbiBleGFt
cGxlIG9mIHdoZXJlIFBhb2xvIGlzIHF1aXRlIHJpZ2h0IC0tIHlvdSBjYW5ub3Qgc2ltcGx5IGFk
ZCBNT19URQo+IHZpYSBzaXplX21lbW9wKCkuICBJbiBwYXRjaCAyMiB3ZSBzZWUKPiAKPj4gQEAg
LTU0MiwxNiArNTQyLDE1IEBAIHZvaWQgdmlydGlvX2FkZHJlc3Nfc3BhY2Vfd3JpdGUoVmlydElP
UENJUHJveHkgKnByb3h5LCBod2FkZHIgYWRkciwKPj4gICAgICAgICAgdmFsID0gcGNpX2dldF9i
eXRlKGJ1Zik7Cj4+ICAgICAgICAgIGJyZWFrOwo+PiAgICAgIGNhc2UgMjoKPj4gLSAgICAgICAg
dmFsID0gY3B1X3RvX2xlMTYocGNpX2dldF93b3JkKGJ1ZikpOwo+PiArICAgICAgICB2YWwgPSBw
Y2lfZ2V0X3dvcmQoYnVmKTsKPj4gICAgICAgICAgYnJlYWs7Cj4+ICAgICAgY2FzZSA0Ogo+PiAt
ICAgICAgICB2YWwgPSBjcHVfdG9fbGUzMihwY2lfZ2V0X2xvbmcoYnVmKSk7Cj4+ICsgICAgICAg
IHZhbCA9IHBjaV9nZXRfbG9uZyhidWYpOwo+PiAgICAgICAgICBicmVhazsKPj4gICAgICBkZWZh
dWx0Ogo+PiAgICAgICAgICAvKiBBcyBsZW5ndGggaXMgdW5kZXIgZ3Vlc3QgY29udHJvbCwgaGFu
ZGxlIGlsbGVnYWwgdmFsdWVzLiAqLwo+PiAgICAgICAgICByZXR1cm47Cj4+ICAgICAgfQo+PiAt
ICAgIC8qIEZJWE1FOiBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3dyaXRlIGlnbm9yZXMgTU9fQlNX
QVAuICAqLwo+PiAgICAgIG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfd3JpdGUobXIsIGFkZHIsIHZh
bCwgc2l6ZV9tZW1vcChsZW4pLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TUVNVFhBVFRSU19VTlNQRUNJRklFRCk7Cj4gCj4gVGhpcyBpcyBhIGxpdHRsZS1lbmRpYW4gc3Rv
cmUgLS0gTU9fTEUgbm90IE1PX1RFLgoKT3IgbGVhdmUgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgYXNp
ZGUgYW5kIHJlcXVlc3QgaG9zdCBlbmRpYW5uZXNzLiAgRWl0aGVyCmlzIGZpbmUuCgpQYW9sbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
