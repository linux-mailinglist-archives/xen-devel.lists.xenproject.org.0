Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCA8510B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOjO-00057h-19; Wed, 07 Aug 2019 16:24:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvOjL-00057N-NT
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:24:03 +0000
X-Inumbo-ID: c4a067cb-b92f-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4a067cb-b92f-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:24:02 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t14so41529511plr.11
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
 b=y0bRoBWsit3vYVWoy2IIyQk2NlSE9Whdckg2ww8rJWfzkOyqG34pue44La9x5ZZXWM
 qrQe/8ZUXeINHn01gTY+5T2q4i8qP8tGe/+c7uVc1nZntD7ApW8gWrsaOHVqaigbYFXq
 zz7aLv6I2zYmeG5Jv/EtpA7A2X1U5ftBtkok6NKqk/4GZgVsklw8N6uD0f3eETNB86xK
 Slx0/+AvvMaK9/r3UPLrfytNDzazCOsPMzugsLRpTNma7avbpR0/5ZnWL0IPFj1rAD9i
 uSTrIk9RTgXOESR9qRVIFIsh1YOgv9PGBfO3EBPtzIVvFbU87YFURq+XJmUikprQhf70
 axPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
 b=MQa9eMJDVPLVxVua/hz8jjyMgkgsxGhEP9EAzyTrJH0YUjbVDetfyuUGl/WNKS7wjB
 TNaDfHEmzt4DiaQx4WB4qqm3g7Je1bu4xE2/Suymm9GvfWpzAs8gva44UiR72o+lhomq
 Q4qgyoywtqjHIJtpEa3HAgJJbaatmF5VpviFPomAVNTr53eXyLXs8gtV2Up3NyjG+rgR
 tcptQYiQZou2P8lBcqpQfLD8siEvRNV01a0AlwzIYXZjcue3VK+ML8wwK2ZJm/vYDtTn
 vVAzfphU7EZMmighJbplc9ERHBRN+j3g+AYO5qKlhwBKdqNSTqSIZ2+PIAnXbk3NtmrZ
 IhKQ==
X-Gm-Message-State: APjAAAXXRtocQ9KuZ0zOHTOEdCXvvtkK4G+ezzpP+qrC1iaVarZv/bE2
 jkOaHyq+FCmbBS0xvnsD9gIPBg==
X-Google-Smtp-Source: APXvYqzGXsQ8gfFJWMfJ6Wvw945mfh1EAHw+jqqHuUYS5VC5Evf2TyBzsxToaNuHhVuyolzFfmcvtA==
X-Received: by 2002:a63:e901:: with SMTP id i1mr8256677pgh.451.1565195042061; 
 Wed, 07 Aug 2019 09:24:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id j5sm107874000pfi.104.2019.08.07.09.23.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:24:01 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166747494.26346@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5afaa158-e9a4-96c5-841a-e4ffc041b35d@linaro.org>
Date: Wed, 7 Aug 2019 09:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166747494.26346@bt.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 18/26] exec: Delete
 device_endian
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

T24gOC83LzE5IDE6MzIgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBkZXZpY2VfZW5k
aWFuIGhhcyBiZWVuIG1hZGUgcmVkdW5kYW50IGJ5IE1lbU9wLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFRvbnkgTmd1eWVuIDx0b255Lm5ndXllbkBidC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZXhlYy9j
cHUtY29tbW9uLmggfCA4IC0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygt
KQoKUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPgoKCnJ+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
