Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD6850B9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOSm-00033q-Pw; Wed, 07 Aug 2019 16:06:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOSl-00033j-5Z
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:06:55 +0000
X-Inumbo-ID: 5f355c58-b92d-11e9-8980-bc764e045a96
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f355c58-b92d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:06:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id k8so41505612plt.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=BO7jbmlKDGnmlVwJmKWpYGu5SzuK5OHVlaXrkA/URamXOvPNdz5i9VL4nijoJaodKb
 dBmxAjVjIPrBV0v+f4UtFAEDLm7vG2ee5xgC/nx9forbO/73E5hOFrL+fyteD/tSRWpm
 SxH+rHiWUkXv62yj5kZEehx89ae8+sV1R3zIuH0S0taDYZTUCEDve3u5X5GjTiWkhALQ
 ROoRVqEuegZBEEVzcJJ0kiI/jd6ubTgbGSFTlP1WhZ+6nybVROugiGBMQU2+UmSju6az
 iRxMbr8fgGyzmZFnG/t/73sXpNiEYgwBiCUlMp46lnVkKEOmlpGgp519W68+Hlbq1xsU
 Bhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=irsXYMzYHQHV1wFd3KazwP0REZR+JxeGC7n+5ZQ2EAVsvGV6dKzDPfTncYunNfgTAn
 aDPbQ3SyvcjB4dPRYhq+G6epvKDkX8bkpsUAszC++niZHnCZUJVRB/hklvQhybteUDQt
 7Xcc8QOc8DILzjopLBHbj2k0PJDeI+bHq+XP6uGp+v9NKvn9zdu83XOMN/xnl3kt7uq7
 +85uIFkwyPvzm3Nl7c1OgIjIOMC2DcNHoIGWTS2Sg9cmu5+0N4hmyHSjFsF9C2T+hLkr
 LPoA2PXNYsfFaEn+AncIodHMGE3Vex8HjBPoW1F3FAMY7C5n9u4QQ2kOOxaXlXpoRxlr
 T+cw==
X-Gm-Message-State: APjAAAW9wzTt23pNGs348JrES5bjwbzIneDZnn/AU/lU4MrpTcIXKLNT
 BRv2sQU9PtjHLs5Rqx5sg8xA8A==
X-Google-Smtp-Source: APXvYqzKuDCIJn1srmeieaPi42oYx/ffxFAs1Ng06KJDLBUrxHZmY3i9IH2yaR+JOggoBNqXpR5eDQ==
X-Received: by 2002:a63:1455:: with SMTP id 21mr8320380pgu.116.1565194012775; 
 Wed, 07 Aug 2019 09:06:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s43sm387653pjb.10.2019.08.07.09.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166687895.25037@bt.com>
 <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <82ad9758-4afb-251d-383b-802c59b48d6a@linaro.org>
Date: Wed, 7 Aug 2019 09:06:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
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

T24gOC83LzE5IDg6NTkgQU0sIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOgo+IE9uIDgvNy8xOSAx
OjMxIEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICZzZXJpYWxfbW1fb3BzW2VuZCA9PSBERVZJQ0VfTElUVExFX0VORElBTiA/IDAgOiAx
XSwKPiAKPiBUaGlzIGlzIG9mIGNvdXJzZSAiZW5kICE9IERFVklDRV9MSVRUTEVfRU5ESUFOIi4K
CkFuZCBieSB0aGF0IEkgbWVhbiBkcm9wIHRoZSA/OiBvcGVyYXRvci4KCgpyfgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
