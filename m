Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65884FF4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:33:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNtu-0006i6-Na; Wed, 07 Aug 2019 15:30:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvNtt-0006hO-BA
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:30:53 +0000
X-Inumbo-ID: 568b7bd8-b928-11e9-8980-bc764e045a96
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 568b7bd8-b928-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:30:51 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b3so41386493plr.4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pCpCz+CvOCQ4pr1rksowSTze+rOo02yQPlaBVcHqATE=;
 b=XZ+7YslttNOCrt7toERtmFJPyciz+nlLvKU+YMjuaKFeRqjyiTNJhpHnxCBA656sv5
 bXm9lc6HoVEsiYbeBFc5D1YUYCZ1DL3Mz54Mu7QB1zOf3pQm/CErkxyPK4hFFd/E2VOf
 l3ASNiZQFQVF6qKGV/KonB+hx+5hF+qoIAOsTVl52DCvyeKxpAb/6ha/4FQd5+UTR1r1
 l+Sw1Q+wryV/0jsnRdS19fFEnG9eY5PNMZ3PJb1Noi/QFkqdr1GDxJuPR9JZegDVV1ZA
 ZxOsjL58c+r99JCaLAs0+ab+rWmV7PC/7XE3JCbCWv9G1sRw30q1h4eGIFHWlliDZtIW
 Mc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pCpCz+CvOCQ4pr1rksowSTze+rOo02yQPlaBVcHqATE=;
 b=mCCvWMzu8Jxs+waKOAL+yyHX4FjbvrTv/HnCabDOTMy77Q+f0+K9iMZVthfjLV8war
 IX0oVCLUdMmsSfJFsiSV9DykyItiKSSu2PeUuA5byl4pKLru2T98QujhG9p6KHpBbylP
 Dq+acBRT7/kC5VRblosiZm4GpPlP0/vXZj0neR7nGVeb5gC02Mp7RaVS41UJJWtazyEV
 KVem0g/erPQfq0A0I2g3S1n78vJrwbXleO0JLeVTEkZzBtJjy3JA57CRHhzBX3unEpcB
 UGLvhHs6QY+RqpF7jHrKm7vHpA7+iemsa9tkjkZUmI12wM++tkGn3Nf9NqEmrqQfPDo6
 EK6g==
X-Gm-Message-State: APjAAAViqOOPeCfzukvXqBWkqV5Xy19vNOLqvCBmS8Ux/ODk+bpcqNc0
 bG/D838aBsFL0INmShze4i7KNQ==
X-Google-Smtp-Source: APXvYqyzEKXZhyWbZHS9mUCJhdYcCK08eh017J9JqBLo284jw3umKEd2sQYd69ZxwNR55VZOhXHr6A==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id
 d20mr533420pjw.28.1565191850899; 
 Wed, 07 Aug 2019 08:30:50 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r12sm75560234pgb.73.2019.08.07.08.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:30:50 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166407497.21726@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ebba4aef-c264-53c2-a503-e82219a2df35@linaro.org>
Date: Wed, 7 Aug 2019 08:30:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166407497.21726@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 03/26] memory: Introduce
 size_memop
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

T24gOC83LzE5IDE6MjYgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiArLyogU2l6ZSBp
biBieXRlcyB0byBNZW1PcC4gICovCj4gK3N0YXRpYyBpbmxpbmUgTWVtT3Agc2l6ZV9tZW1vcCh1
bnNpZ25lZCBzaXplKQo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogRklYTUU6IE5vLW9wIHRvIGFp
ZCBjb252ZXJzaW9uIG9mIG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfe3JlYWR8d3JpdGV9Cj4gKyAg
ICAgKiAidW5zaWduZWQgc2l6ZSIgb3BlcmFuZCBpbnRvIGEgIk1lbU9wIG9wIi4KPiArICAgICAq
Lwo+ICsgICAgcmV0dXJuIHNpemU7Cj4gK30KPiArCgpSZXR1cm4gdHlwZSBzaG91bGQgcmVtYWlu
IHVuc2lnbmVkIHVudGlsIHBhdGNoIDExLgpPdGhlcndpc2UsClJldmlld2VkLWJ5OiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KCgpyfgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
