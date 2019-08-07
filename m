Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8D85046
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:50:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOB3-0008Ld-JV; Wed, 07 Aug 2019 15:48:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOB2-0008LQ-Fj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:48:36 +0000
X-Inumbo-ID: d0ad581d-b92a-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d0ad581d-b92a-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:48:35 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id a93so41358073pla.7
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 08:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=IK+EC8rxSLj6GnhhMqmFSBOePtP4VGVXguG7qL48rfGiQnzRq4ct9g7jz1KwQ+ZFNw
 CTnE50cpiGbWhKHIInyj7AxKpvzUGkGykuEnQgWG2IUbKeaN+ems8FkmPgx8Ex4+kFD1
 tXsycNBHqgk3W/q+TgXl55usAJSoLowUlCU2OM5Tcpx4HYLD9DkQT0JoOSsPf+/CYexH
 EOSw7eT9wff9WPsOs2RP8iAVYrjEOazEnOEHMSWcdNjcEyyqbuRCDO4fapIWJH9RH7NM
 y7JsyIccajdyh5IN5l8M/xTx3F+rCeNU03PdY3Adi3YNmEwkoqo6YHXnsghfPoYxwQT2
 GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=ONluYmO6CsKuXyIf3/K+fmBKgZEGK9WyN1jzptMKHIgqKgIld4qdV3w5ujAGFB7jmx
 uv67pY2HJqCEuE0BoLIwdD8paFd4teLBxUZiGQ1yoce73/4otS1GMEU/A6VlpcxXQf43
 +Ok58nzeofoMTMpEUr4XAMtDAD2CT6N57o4NHtmYGG7VmKoSDxPvJ8fJAW+kHyBvO+ue
 UEQpYR98R+9TAndkMyeE7DTyBqlNnzIf/BSWLiTtrxd+kXN5kMuwcLDz1FhTeBb4lSKi
 42UFG469dpk7nXDaNsnpC+tLsFTz6Qsbm9I4FsnLRaGNVZ+AOZaAz9UuisCd7RksinWO
 FGYw==
X-Gm-Message-State: APjAAAW7mwh2rq69Lh8KRmldv+3eze9KdRV4gL34WEFuigva14/MqHdq
 Rik1lMXES6zhE9Y4xI1xMBAmQg==
X-Google-Smtp-Source: APXvYqyNog3De3+XAOQ8+7tLtpVuHhFeBrAofS85n6QRADl8JNRs6vEyXF5uH0HNH0kJXkAI1KBdEg==
X-Received: by 2002:a62:5253:: with SMTP id g80mr9900905pfb.179.1565192914835; 
 Wed, 07 Aug 2019 08:48:34 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f14sm10154655pgu.8.2019.08.07.08.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:48:33 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166644883.25395@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bc5dbc6e-c690-35fa-8090-2b695891a02a@linaro.org>
Date: Wed, 7 Aug 2019 08:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166644883.25395@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 14/26] exec: Hard code size
 with MO_{8|16|32|64}
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

T24gOC83LzE5IDE6MzAgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBUZW1wb3Jhcmls
eSBuby1vcCBzaXplX21lbW9wIHdhcyBpbnRyb2R1Y2VkIHRvIGFpZCB0aGUgY29udmVyc2lvbiBv
Zgo+IG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfe3JlYWR8d3JpdGV9IG9wZXJhbmQgInVuc2lnbmVk
IHNpemUiIGludG8KPiAiTWVtT3Agb3AiLgo+IAo+IE5vdyBzaXplX21lbW9wIGlzIGltcGxlbWVu
dGVkLCBhZ2FpbiBoYXJkIGNvZGVkIHNpemUgYnV0IHdpdGgKPiBNT197OHwxNnwzMnw2NH0uIFRo
aXMgaXMgbW9yZSBleHByZXNzaXZlIGFuZCBhdm9pZCBzaXplX21lbW9wIGNhbGxzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRvbnkgTmd1eWVuIDx0b255Lm5ndXllbkBidC5jb20+Cj4gLS0tCj4gIG1l
bW9yeV9sZHN0LmluYy5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+CgoKcn4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
