Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D397084F71
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNTp-00043A-4j; Wed, 07 Aug 2019 15:03:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvNTn-000430-Rv
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:03:55 +0000
X-Inumbo-ID: 92e8587d-b924-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 92e8587d-b924-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:03:54 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b7so41297549pls.6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
 b=m9hc/ZPvf0oKc2ofnxDXra2HBXylt4M9/iWEUE7A5+da5UzFcS1Z34iSyHOVMpgboZ
 /zuam3ye+iOLSDNyFXcXzCUY8t+9fHGeYqEYkwBXawuqvSSKS8sGizofeh5fhFc/+9T3
 gIj6f2kpuUao/ZW7UIO1wQ0fARYx41FxM3/++1o6dxqc67PoB6Qqt6Dp2ZxjF/eH0lxb
 OK+rLmcul5O7v32jpHVyLKV76RdtM+OvM4r/CcbUtL0k33qf7zDlg9AFBWhZ96Rnl337
 m2W6aRjhJreJhSDt9gG+YToZ+oArpXUp/c74GgjRbP4ERag95UU5rT52M3BbogifA7FL
 itOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
 b=E39yDVsVJDNcR6LtVRufZX6Jz3PhjX5RQ8asEqDWNqWBwetkueGR4DLwOCN/Be78tu
 MPEuUbzafPWkP3IjKs8WXI7rkX4Z6eIbeI5P6UOuxpimaVnjatLDEFKaXwDdVyFE32BS
 WLmv5vkx4YSZqk56J+KvzZBnpKbxUV/KKAjpeLujTxYrxo+i0Xo6ktmzgSwf+FwChRg8
 Htc5TMCpbQ30lw/RxWUxAb5/chEzCLx8NJgLO1Iw/sP+v4RVwtID4kYHfuQ0sVujhJd8
 7lWrPL++FXXr9sZSsJZH4ZryqekyldLQ2lmasozX/MThvh5evegUi5zdwqnNhRjSlNU5
 uAlA==
X-Gm-Message-State: APjAAAUtKe9x1TPdm9UgVwMIyL/GDaghraMF0FJ+PTPGaQl48aDrgs70
 YScn4B3HCJsKaDx7Lc4dek0hCQ==
X-Google-Smtp-Source: APXvYqyAOIfGUzAREqA7EGLNEB0s/1IU1ofPjQgwemIv4dsGo32q9YA/L1lnNFbdY00miSOuTPKNbQ==
X-Received: by 2002:a62:ac11:: with SMTP id v17mr9765690pfe.236.1565190234054; 
 Wed, 07 Aug 2019 08:03:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a128sm104461852pfb.185.2019.08.07.08.03.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:03:53 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166771281.2734@bt.com> <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b0906e2-0d51-7de4-c99e-8d2e1af62efe@linaro.org>
Date: Wed, 7 Aug 2019 08:03:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 19/26] exec: Delete
 DEVICE_HOST_ENDIAN
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

T24gOC83LzE5IDM6MjIgQU0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMDcvMDgvMTkgMTA6
MzIsIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPj4gKyNpZiBkZWZpbmVkKEhPU1RfV09SRFNf
QklHRU5ESUFOKQo+PiArIMKgIMKgLmVuZGlhbm5lc3MgPSBNT19CRSwKPj4gKyNlbHNlCj4+ICsg
wqAgwqAuZW5kaWFubmVzcyA9IE1PX0xFLAo+PiArI2VuZGlmCj4gCj4gSG9zdCBlbmRpYW5uZXNz
IGlzIGp1c3QgMCwgaXNuJ3QgaXQ/CgpZZXMuICBKdXN0IGxlYXZpbmcgYSBjb21tZW50IHRvIHRo
YXQgZWZmZWN0IGhlcmUgZm9yIHRoZSBvbmUgdXNlIGlzIHByb2JhYmx5CnN1ZmZpY2llbnQuCgoK
cn4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
