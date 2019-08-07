Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D611852F2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQbM-0006tK-Fi; Wed, 07 Aug 2019 18:23:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvQbL-0006tC-3a
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 18:23:55 +0000
X-Inumbo-ID: 830b8322-b940-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 830b8322-b940-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 18:23:54 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id m9so41870467pls.8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
 b=Sfk5+alwu1VCU0qrulKu6QmaIsYdKxIU7Gg69SUf6UnahW78yEvPIcfLCY4kSDNXMq
 f4WymZm+Doh+AICi8mIVzgHEDU0rk9qd7RKt04rG8f+IhrZsp8Bf49iJNYEBZ3PN1lu8
 WMZp7duBLer60rzUM5QJpc44UkEmKYH3GCppCxHQYJJFjopiEku84fRjo83FdwueRLYl
 IMxR4+iqzD0yqZSMsGwkNYKbg2rwyP6LSkwZRHkL3azdqJ0J5NePyNBVYiojjJM5pB2i
 Pk7TEOzV5+PlvYyiEd4k+Q2XlHH+0AqyvWllLRUz9wgva39L6j9er0haVzJ57gmopyCP
 puQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
 b=G+DjqsvpNdtxw1t49FCqa5JJgTzOgP5zN9hh/w1k1rCERZbnxLlFNKxXPe5WpWWJDR
 8Drjbb723Ny9m84kzYkmGKsJBHVe9J5HFD0lgIfbLutTkEhdOvusnEUyeg8OHrtvSyX/
 RNUxhjKPIKk+O4LzRQ2Ymyq9mghzr3SQrXpqC4mSDG0TViyq8lmga/cRAjFhCVH/+I12
 09qJgTk8+z4LDpsSmTNUJcONLpKlVCNhkBn/rRfcbWWw0SA95yYGEpDJPOHYe4OQ0Qdv
 wzrMFkmOm3Ri4ybl9pg/bi/RYT6rWTA1yv+xj//U3PcAvWE1E5UZuJAYyix3GIv7ConO
 Fmmg==
X-Gm-Message-State: APjAAAWYX7kVMYIN8MLsvscdIAy0csIrOSvUh6boWpO0Jren4sKajkof
 Ac0vHl3Z5W9b5YPjghZN+7ZdXw==
X-Google-Smtp-Source: APXvYqxDnUiT2rafpEFrD9HngKcg+IeotfqUm0tJV4yP2eo54JFJv3aC6EECEHSGCSIObNhiKzxfzA==
X-Received: by 2002:a17:90a:a404:: with SMTP id
 y4mr1264188pjp.58.1565202233346; 
 Wed, 07 Aug 2019 11:23:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h14sm121761477pfq.22.2019.08.07.11.23.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:23:52 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
 <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
 <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <92720e5e-5bb9-a4be-a652-39e710071db1@linaro.org>
Date: Wed, 7 Aug 2019 11:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
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

T24gOC83LzE5IDExOjAwIEFNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+IE9uIDA3LzA4LzE5IDE5
OjQ5LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToKPj4gT24gOC83LzE5IDE6MzMgQU0sIHRvbnku
bmd1eWVuQGJ0LmNvbSB3cm90ZToKPj4+IEBAIC01NTEsNiArNTUxLDcgQEAgdm9pZCB2aXJ0aW9f
YWRkcmVzc19zcGFjZV93cml0ZShWaXJ0SU9QQ0lQcm94eSAqcHJveHksIGh3YWRkciBhZGRyLAo+
Pj4gICAgICAgICAgLyogQXMgbGVuZ3RoIGlzIHVuZGVyIGd1ZXN0IGNvbnRyb2wsIGhhbmRsZSBp
bGxlZ2FsIHZhbHVlcy4gKi8KPj4+ICAgICAgICAgIHJldHVybjsKPj4+ICAgICAgfQo+Pj4gKyAg
ICAvKiBGSVhNRTogbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0ZSBpZ25vcmVzIE1PX0JTV0FQ
LiAgKi8KPj4+ICAgICAgbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0ZShtciwgYWRkciwgdmFs
LCBzaXplX21lbW9wKGxlbiksCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TUVNVFhBVFRSU19VTlNQRUNJRklFRCk7Cj4+PiAgfQo+Pgo+PiBIZXJlIGlzIGFuIGV4YW1wbGUg
b2Ygd2hlcmUgUGFvbG8gaXMgcXVpdGUgcmlnaHQgLS0geW91IGNhbm5vdCBzaW1wbHkgYWRkIE1P
X1RFCj4+IHZpYSBzaXplX21lbW9wKCkuICBJbiBwYXRjaCAyMiB3ZSBzZWUKPj4KPj4+IEBAIC01
NDIsMTYgKzU0MiwxNSBAQCB2b2lkIHZpcnRpb19hZGRyZXNzX3NwYWNlX3dyaXRlKFZpcnRJT1BD
SVByb3h5ICpwcm94eSwgaHdhZGRyIGFkZHIsCj4+PiAgICAgICAgICB2YWwgPSBwY2lfZ2V0X2J5
dGUoYnVmKTsKPj4+ICAgICAgICAgIGJyZWFrOwo+Pj4gICAgICBjYXNlIDI6Cj4+PiAtICAgICAg
ICB2YWwgPSBjcHVfdG9fbGUxNihwY2lfZ2V0X3dvcmQoYnVmKSk7Cj4+PiArICAgICAgICB2YWwg
PSBwY2lfZ2V0X3dvcmQoYnVmKTsKPj4+ICAgICAgICAgIGJyZWFrOwo+Pj4gICAgICBjYXNlIDQ6
Cj4+PiAtICAgICAgICB2YWwgPSBjcHVfdG9fbGUzMihwY2lfZ2V0X2xvbmcoYnVmKSk7Cj4+PiAr
ICAgICAgICB2YWwgPSBwY2lfZ2V0X2xvbmcoYnVmKTsKPj4+ICAgICAgICAgIGJyZWFrOwo+Pj4g
ICAgICBkZWZhdWx0Ogo+Pj4gICAgICAgICAgLyogQXMgbGVuZ3RoIGlzIHVuZGVyIGd1ZXN0IGNv
bnRyb2wsIGhhbmRsZSBpbGxlZ2FsIHZhbHVlcy4gKi8KPj4+ICAgICAgICAgIHJldHVybjsKPj4+
ICAgICAgfQo+Pj4gLSAgICAvKiBGSVhNRTogbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0ZSBp
Z25vcmVzIE1PX0JTV0FQLiAgKi8KPj4+ICAgICAgbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0
ZShtciwgYWRkciwgdmFsLCBzaXplX21lbW9wKGxlbiksCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCk7Cj4+Cj4+IFRoaXMgaXMgYSBs
aXR0bGUtZW5kaWFuIHN0b3JlIC0tIE1PX0xFIG5vdCBNT19URS4KPiAKPiBPciBsZWF2ZSB0aGUg
c3dpdGNoIHN0YXRlbWVudCBhc2lkZSBhbmQgcmVxdWVzdCBob3N0IGVuZGlhbm5lc3MuICBFaXRo
ZXIKPiBpcyBmaW5lLgoKVGhlIGdvYWwgaXMgdG8gbWluaW1pemUgdGhlIG51bWJlciBvZiBwbGFj
ZXMgYW5kIHRoZSBudW1iZXIgb2YgdGltZXMgdGhhdApic3dhcHMgaGFwcGVuLiAgVGhhdCdzIHdo
eSBJIHRoaW5rIHB1c2hpbmcgdGhlIGNwdV90b19sZTE2IGludG8KbWVtb3J5X3JlZ2lvbl9kaXNw
YXRjaF93cml0ZSBpcyBhIGdvb2QgdGhpbmcuCgpIb3dldmVyLCBsZWF2aW5nIGEgaG9zdC1lbmRp
YW4gbWlnaHQgYmUgdGhlIGVhc2llc3Qgc2hvcnQtdGVybSBzb2x1dGlvbiBmb3IgdGhlCm1vcmUg
Y29tcGxpY2F0ZWQgY2FzZXMuICBJdCBhbHNvIHNlZW1zIGxpa2UgYSB3YXkgdG8gc3BsaXQgdGhl
IHBhdGNoIGZ1cnRoZXIgaWYKd2UgdGhpbmsgdGhhdCdzIGRlc2lyYWJsZS4KCgpyfgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
