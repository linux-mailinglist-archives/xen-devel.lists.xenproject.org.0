Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83285087
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:02:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOM5-0001Ks-Ke; Wed, 07 Aug 2019 16:00:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOM3-0001Kl-QT
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:59:59 +0000
X-Inumbo-ID: 67d69f5d-b92c-11e9-8980-bc764e045a96
Received: from mail-pl1-x629.google.com (unknown [2607:f8b0:4864:20::629])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67d69f5d-b92c-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:59:58 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t14so41435981plr.11
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LwmhxqlWLO0c3ADquMqkcSBhFu0xrziYI9uK0rfmer0=;
 b=exzhypAxNEb3jr5uqvNMqBOBGhDoLriOuid+FPpCzaq38W2aku/y/TgGNIzUHrD2Uu
 Ll0UujFTLbXOJuZnp330vk25sIwDxBn+a/x5JI6EqGwVA6bUxKqjOQdLlKj5SsU+FETH
 gFPpaxv0EqsWc4PmIJzRDQh8MPXA+ga9auZ87YmFVsIKga0d0P+mA8/U1KEqKuq1FlKn
 V0EhRjdbIPareXjlKkivJ2UM9qgF9Zf2DgOvKqWeVhSVDo6TNYNskpG574l3HtS1HhZ1
 75624pq+xQPeB+FqmHUafHU2GN06qU3yRHuNqvdR6AMNoG0MYN7LAmmOyuCtreXGzfuY
 b/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LwmhxqlWLO0c3ADquMqkcSBhFu0xrziYI9uK0rfmer0=;
 b=KzE7vdUHq5v7OgKyXQauncTtYQkJbYdxkxgl4QPK3GB0LMXda+PlQc/afXtKT6YQHq
 /U5qom22+H01oqZTAccIIBKA4j5+NDIo0N4ZULCoMSuj734NqT9QMDgeSqaYblq0O6CV
 Yg44z/1O/AWwBLLZmLjbWY3FpT99Zl4Smmdeetle0nCd4KXTMzicsbTjPeGXoFfL4vPA
 Aoh2M1nmGLlf5xqjbUbdxePHIzjfPEV9pSICiBZNJMOsyVI4CGz511P5QQWiFn40JoeR
 1gSMmLUw7wf/ngf5W2H1rzVc6GT/VBdC/0CnWfW97cCBnG+hKuIyeL8SYWkAaSFmTaRO
 3GpA==
X-Gm-Message-State: APjAAAXue9xKqRb4trN91a5HrdZXxLAEhgyoNbE32kwedAZES7ySnUpr
 okb3sQ/gnwuGhouRAsN4PlHn6g==
X-Google-Smtp-Source: APXvYqzZfClUUXKK0fiyq+vOcmEZ8OmFCKBP/Mp3+WhQktP5pDfCqZeaOGRpV1YNgSzn4XKKFrksSQ==
X-Received: by 2002:aa7:8651:: with SMTP id a17mr9985240pfo.138.1565193597931; 
 Wed, 07 Aug 2019 08:59:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p20sm132453086pgj.47.2019.08.07.08.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:59:57 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166687895.25037@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Date: Wed, 7 Aug 2019 08:59:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166687895.25037@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 16/26] exec: Map
 device_endian onto MemOp
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
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 pburton@wavecomp.com, marex@denx.de, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
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

T24gOC83LzE5IDE6MzEgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAmc2VyaWFsX21tX29wc1tlbmQgPT0gREVWSUNFX0xJVFRMRV9FTkRJ
QU4gPyAwIDogMV0sCgpUaGlzIGlzIG9mIGNvdXJzZSAiZW5kICE9IERFVklDRV9MSVRUTEVfRU5E
SUFOIi4KCgpyfgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
