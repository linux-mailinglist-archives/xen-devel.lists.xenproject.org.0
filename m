Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A696085263
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 19:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQ49-0003dN-1m; Wed, 07 Aug 2019 17:49:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mnz/=WD=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1hvQ48-0003dI-8b
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 17:49:36 +0000
X-Inumbo-ID: b72f34cc-b93b-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b72f34cc-b93b-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 17:49:34 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id k8so41902850plt.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
 b=YSd01dq4KtF6aeZkw5hkDHENoAmzJOdch2P9Xl6k7iJhJOozBH08Xd6X8MdTgN8uFL
 dayMMbNyz7ZSR+VFJ605dDSnaIApm2E3utOwDPHFZ38Ww0Yq2hW49lnxsZfbp4yn6FDL
 WbwqPP7yVik0d0cAAsPPdv9U+Jm1KuDYmSkVnREqiqvjtBwIcUnH5Xc/gl9O6lnkIiYk
 VhL9l6TrN+DQt2wAGnIhc0ENdijp3rUv/YraMyGDu6wMe9x+ZMo7AjxGpCB5GwWDzR8S
 4mEFZrxsfoOHb2BNG7md9SL+3ARxa9EvmllUIzDfD4ZcsqQgw4KkThE7J5q6hLkKOjqW
 ercg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
 b=nl4gQBUKTLXkja+k99F+tlrXjaonjeXP4Mm0Mf6S6LgmE5up5ie6ST0BN+mJnA6w3J
 6nWVf2cRQwAZ2dZJ3mHDeNrf2rEVCW8GT3rCzacf1RmwXgmSkc3eB3F4uDmyIPq16FIF
 ginqE0oyFr4Ui44N1bDKgrAwGjweDLMuZhxPakN/erIIqYt02voWCDa0QXQOwBGfyN5+
 ql+adE5NhHumD5kF+5LJphCbtyq9nK72gKjytC09vFrg31O9UrOWJDHnTJNsJjAFyiwA
 Rp8e5Y8pKGYEI400Hb+MFMM49qc+b2zKygBOufaa3PsMCiK8BL1tLZqKJa6lu40bubw7
 ljgQ==
X-Gm-Message-State: APjAAAV6ELrZgUTqeLVRkPHr3f1S5fpwtxsNnd21kz2lphPQVGKYBfdf
 xwLBJshK1q99pPgMM+ivElEkNA==
X-Google-Smtp-Source: APXvYqxt9kYRUX4/TWB3mOIj77BhJmpABYE2zE095tt7JwCrrSgoc6T05CxabiOshYqLLsydsy93lQ==
X-Received: by 2002:a17:902:6b02:: with SMTP id
 o2mr8483559plk.99.1565200173396; 
 Wed, 07 Aug 2019 10:49:33 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id w1sm489442pjt.30.2019.08.07.10.49.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:49:32 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
Date: Wed, 7 Aug 2019 10:49:29 -0700
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

T24gOC83LzE5IDE6MzMgQU0sIHRvbnkubmd1eWVuQGJ0LmNvbSB3cm90ZToKPiBAQCAtNTUxLDYg
KzU1MSw3IEBAIHZvaWQgdmlydGlvX2FkZHJlc3Nfc3BhY2Vfd3JpdGUoVmlydElPUENJUHJveHkg
KnByb3h5LCBod2FkZHIgYWRkciwKPiAgICAgICAgICAvKiBBcyBsZW5ndGggaXMgdW5kZXIgZ3Vl
c3QgY29udHJvbCwgaGFuZGxlIGlsbGVnYWwgdmFsdWVzLiAqLwo+ICAgICAgICAgIHJldHVybjsK
PiAgICAgIH0KPiArICAgIC8qIEZJWE1FOiBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3dyaXRlIGln
bm9yZXMgTU9fQlNXQVAuICAqLwo+ICAgICAgbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF93cml0ZSht
ciwgYWRkciwgdmFsLCBzaXplX21lbW9wKGxlbiksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQpOwo+ICB9CgpIZXJlIGlzIGFuIGV4YW1w
bGUgb2Ygd2hlcmUgUGFvbG8gaXMgcXVpdGUgcmlnaHQgLS0geW91IGNhbm5vdCBzaW1wbHkgYWRk
IE1PX1RFCnZpYSBzaXplX21lbW9wKCkuICBJbiBwYXRjaCAyMiB3ZSBzZWUKCj4gQEAgLTU0Miwx
NiArNTQyLDE1IEBAIHZvaWQgdmlydGlvX2FkZHJlc3Nfc3BhY2Vfd3JpdGUoVmlydElPUENJUHJv
eHkgKnByb3h5LCBod2FkZHIgYWRkciwKPiAgICAgICAgICB2YWwgPSBwY2lfZ2V0X2J5dGUoYnVm
KTsKPiAgICAgICAgICBicmVhazsKPiAgICAgIGNhc2UgMjoKPiAtICAgICAgICB2YWwgPSBjcHVf
dG9fbGUxNihwY2lfZ2V0X3dvcmQoYnVmKSk7Cj4gKyAgICAgICAgdmFsID0gcGNpX2dldF93b3Jk
KGJ1Zik7Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIDQ6Cj4gLSAgICAgICAgdmFsID0g
Y3B1X3RvX2xlMzIocGNpX2dldF9sb25nKGJ1ZikpOwo+ICsgICAgICAgIHZhbCA9IHBjaV9nZXRf
bG9uZyhidWYpOwo+ICAgICAgICAgIGJyZWFrOwo+ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAv
KiBBcyBsZW5ndGggaXMgdW5kZXIgZ3Vlc3QgY29udHJvbCwgaGFuZGxlIGlsbGVnYWwgdmFsdWVz
LiAqLwo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0KPiAtICAgIC8qIEZJWE1FOiBtZW1vcnlf
cmVnaW9uX2Rpc3BhdGNoX3dyaXRlIGlnbm9yZXMgTU9fQlNXQVAuICAqLwo+ICAgICAgbWVtb3J5
X3JlZ2lvbl9kaXNwYXRjaF93cml0ZShtciwgYWRkciwgdmFsLCBzaXplX21lbW9wKGxlbiksCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQp
OwoKVGhpcyBpcyBhIGxpdHRsZS1lbmRpYW4gc3RvcmUgLS0gTU9fTEUgbm90IE1PX1RFLgoKCnJ+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
