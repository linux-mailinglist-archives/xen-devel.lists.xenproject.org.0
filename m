Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B65BF0C7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 01:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409589.652578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamHZ-0002Aw-1C; Tue, 20 Sep 2022 23:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409589.652578; Tue, 20 Sep 2022 23:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamHY-00028e-Uk; Tue, 20 Sep 2022 23:04:00 +0000
Received: by outflank-mailman (input) for mailman id 409589;
 Tue, 20 Sep 2022 23:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAgC=ZX=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oamHX-00028Y-5s
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 23:03:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82017187-3938-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 01:03:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id bj12so9647594ejb.13
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 16:03:58 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de.
 [78.54.6.55]) by smtp.gmail.com with ESMTPSA id
 x16-20020aa7dad0000000b004548dfb895asm662307eds.34.2022.09.20.16.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 16:03:56 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 82017187-3938-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=PxKeXBgXDwhU6B1ik/sUia4kvwdWE2K6hWQ95wE2Drk=;
        b=HEjiVh9w/3uCTeKWv5xTLYFpaViWsk1vtcDV5uQGkSAxseV3doz8CMX3FWw2WdZCHR
         RcYX/eRukcl9SLItOd8D1rCIKwttT7lhGff2RwC7ww60l1XOfWWmLKzBYHGUeV7pPFsd
         P6QdGWOYlxu4X8tnvMr7B+LQXRg5qP3SnC1gIWLJ5g7+BYCYhv4PWiOReQpR2NqO04s6
         ncY0vtK8AjDW/NwmHfxb2t82Lq8SPDtde4ij2gGlDjf5vewhZZg+mS1Wl6X2X+rTl900
         QNyrUQhD4kT+8PNRDeXGczO8mxCYzv5qaZoZCd2YXXoBhhst+vNWlk3So56OtpqodqAY
         VXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PxKeXBgXDwhU6B1ik/sUia4kvwdWE2K6hWQ95wE2Drk=;
        b=W9UKX4AqFpPJ8/Ljk1r9I/JIdYUXIJ0tfieTQHV9km+C1wOD5akFrSqatrEHISJHXb
         ERi+zgeHgNgoWPu9aS//SMGi4FySyl69HcreXCY4yF/Z4+cpfVtqvRCFIadXdqZRjE/f
         C5ljkWFLdgD/82NWAHXQ6EdbNYcmZ2+PPe6PrWdqAUguq7dY99e9GUgoFu8R6mSaS064
         5EQ2PU74TrI0JZGbGBVDsQtzcaSPFBbzCuo0JvpB+T/7z+VMA86bLsr0hj8XZNVva7OK
         VZwxxs/LQjyRWFoBNWF1CMGW77sA14Ule4mh6MVjAUGbi8MrRzfnjePvLPVZptsBDKTj
         sXOQ==
X-Gm-Message-State: ACrzQf1ruRegRl8orDaD061Jvw7DG9QciA46/C8J3fmVvPZnz1u2MEP6
	Uwm/JYkendPTGwKZOzpxZAc=
X-Google-Smtp-Source: AMsMyM6o2HZboVTIuCsGaPRZJv5x4LFAzYPhH4MOs0KGTsqesz3HK/dGZx2nOXDSIqcv/rFb4zYPxw==
X-Received: by 2002:a17:906:6a14:b0:774:a998:d9a2 with SMTP id qw20-20020a1709066a1400b00774a998d9a2mr18208772ejc.496.1663715037704;
        Tue, 20 Sep 2022 16:03:57 -0700 (PDT)
Date: Tue, 20 Sep 2022 23:03:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani <dirty@apple.com>,
 Michael Rolnik <mrolnik@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Jagannathan Raman <jag.raman@oracle.com>, Greg Kurz <groug@kaod.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Peter Xu <peterx@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery <andrew@aj.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 2/9] exec/hwaddr.h: Add missing include
In-Reply-To: <3fcb707c-47c3-7696-86ec-62048e39bfe1@amsat.org>
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-3-shentey@gmail.com> <3fcb707c-47c3-7696-86ec-62048e39bfe1@amsat.org>
Message-ID: <AAFF4CBF-E710-4E08-A5AE-E8DF8CB02F63@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20=2E September 2022 04:50:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<f4bug@amsat=2Eorg>:
>On 20/9/22 01:17, Bernhard Beschow wrote:
>> The next commit would not compile w/o the include directive=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/exec/hwaddr=2Eh | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/include/exec/hwaddr=2Eh b/include/exec/hwaddr=2Eh
>> index 8f16d179a8=2E=2E616255317c 100644
>> --- a/include/exec/hwaddr=2Eh
>> +++ b/include/exec/hwaddr=2Eh
>> @@ -3,6 +3,7 @@
>>   #ifndef HWADDR_H
>>   #define HWADDR_H
>>   +#include "qemu/osdep=2Eh"
>
>NAck: This is an anti-pattern=2E "qemu/osdep=2Eh" must not be included
>in =2Eh, only in =2Ec=2E
>
>Isn't including "hw/qdev-core=2Eh" in "include/hw/boards=2Eh" enough in
>the next patch?

Yes, this works just fine indeed! This patch could be dropped if in the ne=
xt iteration, if any=2E

Thanks,
Bernhard


