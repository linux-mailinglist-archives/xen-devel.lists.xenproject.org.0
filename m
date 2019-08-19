Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62694CD9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:29:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmMd-0003wu-Gz; Mon, 19 Aug 2019 18:26:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gzz1=WP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hzmMb-0003wD-IE
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:26:41 +0000
X-Inumbo-ID: e223ab06-c2ae-11e9-b90c-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e223ab06-c2ae-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 18:26:38 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1558E19CF92
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 18:26:38 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id k15so5633130wrw.18
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 11:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Es2ujF4TQs/L1dGPbqNiort7s9yCy3mx7V8CuxWsAc=;
 b=IV1VJEinRHkuSMtm+wkMNEzSqVKXepEzwROSi5cJZUPHxpNEg9FfA32majx1asglVL
 M7CF9VrJAuZzaw+xyvE15PZ34WQXtLJXW3V2l7SLSabMTeOxISwbh19KaN9aWsZ9Pwr4
 X/HWi58gvwnY/IwBnE5fYDP9Kvci+8ms+Cm2Udf/1sTRq37JM3QkLSumiNBH0jxyBZvS
 MnT4Uzm4aC+U0Kd975NlJSJt5DHP9lmaE8qjde1LCZlfxy+cSQA2Bfq5TS20LkKtrSmz
 mQEQxx8b+3gurGMDk/u7NJSbqa88v1SBsTDiWF5URnvR6ntQPfbIBszjdW0/67BLlhKR
 +nMQ==
X-Gm-Message-State: APjAAAUgkmIxedJlXN2/9Zw7QfBNmn8OYeuhnwfUWOdbXwuIBlg4+Sgt
 zM9qDrn5dst3RFuAwcnuCgXXHbEDAR3N3x7I5CMYN8hDT/Bx4t8ZZWq8oVL/q560cuUYOdTaolc
 TNyKZOrmFYCKkmvZuDS6Tskm5CBI=
X-Received: by 2002:adf:dd88:: with SMTP id x8mr30951595wrl.331.1566239196731; 
 Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2EVL34Ciz7ioA+ani3uT0x7z6ZHUoOsQkIK2FHJfgumsldLIKL+Pq9V3Dl32Rw0+pybaCXQ==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr30951570wrl.331.1566239196446; 
 Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id k124sm36671949wmk.47.2019.08.19.11.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:26:35 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940884636.2215@bt.com> <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1ac89581-d52a-cdce-3c5a-786d4cb0d9c1@redhat.com>
Date: Mon, 19 Aug 2019 20:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare
 device little or big endian
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
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, kraxel@redhat.com, claudio.fontana@suse.com,
 edgar.iglesias@gmail.com, mreitz@redhat.com, pburton@wavecomp.com,
 marex@denx.de, robh@kernel.org, hare@suse.com, gxt@mprc.pku.edu.cn,
 berto@igalia.com, proljc@gmail.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de, david@redhat.com,
 magnus.damm@gmail.com, yuval.shaia@oracle.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, hpoussin@reactos.org, joel@jms.id.au,
 marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDgvMTkgMTI6MDQsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+PiBkaWZm
IC0tZ2l0IGEvaHcvbWlzYy9hOXNjdS5jIGIvaHcvbWlzYy9hOXNjdS5jCj4+IGluZGV4IDQzMDdm
MDAuLjNkZThjZDMgMTAwNjQ0Cj4+IC0tLSBhL2h3L21pc2MvYTlzY3UuYwo+PiArKysgYi9ody9t
aXNjL2E5c2N1LmMKPj4gQEAgLTk0LDcgKzk0LDcgQEAgc3RhdGljIHZvaWQgYTlfc2N1X3dyaXRl
KHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNldCwKPj4gwqBzdGF0aWMgY29uc3QgTWVtb3J5UmVn
aW9uT3BzIGE5X3NjdV9vcHMgPSB7Cj4+IMKgIMKgIMKgLnJlYWQgPSBhOV9zY3VfcmVhZCwKPj4g
wqAgwqAgwqAud3JpdGUgPSBhOV9zY3Vfd3JpdGUsCj4+IC0gwqAgwqAuZW5kaWFubmVzcyA9IERF
VklDRV9OQVRJVkVfRU5ESUFOLAo+PiArIMKgIMKgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExF
X0VORElBTiwKPiBVaCwgSSBkb3VidCB0aGF0Lgo+IAoKLi4uIHdoeT8gOikKClJlbWVtYmVyIHRo
YXQgQkUzMiBhbmQgQkU4IEFSTSBPU2VzIHN0aWxsIGFyZSAibmF0aXZlbHkiIGxpdHRsZS1lbmRp
YW4uCgpQYW9sbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
