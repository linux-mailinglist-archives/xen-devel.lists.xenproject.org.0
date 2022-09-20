Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9F5BF0C0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 01:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409583.652567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamDa-0000lH-HP; Tue, 20 Sep 2022 22:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409583.652567; Tue, 20 Sep 2022 22:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamDa-0000iO-DJ; Tue, 20 Sep 2022 22:59:54 +0000
Received: by outflank-mailman (input) for mailman id 409583;
 Tue, 20 Sep 2022 22:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAgC=ZX=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oamDZ-0000iF-0k
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 22:59:53 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef306d8b-3937-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 00:59:51 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id a26so9748468ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 15:59:51 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de.
 [78.54.6.55]) by smtp.gmail.com with ESMTPSA id
 kw9-20020a170907770900b00781d411a63csm466007ejc.151.2022.09.20.15.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 15:59:50 -0700 (PDT)
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
X-Inumbo-ID: ef306d8b-3937-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5zGDMClH44o9kBaZpfqB55k2zUqfrg9XV0PUDaOzJJI=;
        b=fLhdMY9oJXsreiLcZGR2iqMruYR+8+TCZiJyOzjDIshhi2bT8T6q+tOne1hiOdyqXO
         VTm+mfBfnxXUp/6y/e1nSyP1Dn84N9RSnK9nSVgTSpuwcpk871Gfn+3pte5bQrIhLcRl
         eGbrMzV5MZcAqPSa7RkI/rIP+ODd6Bso+zAhveSvEjr2iX7tCpsYpQOzGMxKRuBrqoWv
         +RHUpwX3uIOzr495dtL2pNiP6gCRKUw0kDX34CF8YVOy2VTong7eOTkVA+a7yHmD1cBV
         qeJNxDhMGv21t0c0x7Yap8LkRSR3ZyVHRzCNFWE0M/lla9o40AxvSWMHge7zOl/LWLNS
         ENnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5zGDMClH44o9kBaZpfqB55k2zUqfrg9XV0PUDaOzJJI=;
        b=5mnSGUaYT6BxDpx1Xo2i1NllLnulL1AQrT37ZZou0Km4PuGe/XubbzlUeZX4cBuRaB
         Mu4/2nLnQHsf7KJP6FwbALE9cltGe8awPhHshxT+uyV1u5O4WMY0YISmETXQ6CNCgTBi
         xxLd2mNKP0qG7F2AvZUsZ1gWSb1+NMLlGH8vaVIKgKDHkQHXHZjsXnsDmqLCKGGXggPz
         zo/dLluns/hQFtWrgQu4iYUFwXx8cCj3tDsog7T1FpyOBpLP4LtNii5eaJmQYbjVYCjP
         UawnOq51NvTi3jAKzVfP9l0+tFqQYIwi8dPjgo7QGo7UXLorSqcCz2zmuVqohvJEw9RN
         ZGZA==
X-Gm-Message-State: ACrzQf0ZP+UZnfXSvWSjtJaxMC/IoipgO8NqkJkTJ5Ch9y2+5s34Yu/M
	vw7ner8h+ac3/AaTjgggCFk=
X-Google-Smtp-Source: AMsMyM68ho+SYOSTwNpH652r4SoJ1volg4FPzzUg+Xkd/7GxX6MGFhW5pQGNcXjCKdvhJIRWBodr2w==
X-Received: by 2002:a17:906:8a53:b0:781:6ee9:db96 with SMTP id gx19-20020a1709068a5300b007816ee9db96mr7656219ejc.301.1663714791350;
        Tue, 20 Sep 2022 15:59:51 -0700 (PDT)
Date: Tue, 20 Sep 2022 22:59:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
 Stefano Stabellini <sstabellini@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
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
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery <andrew@aj.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_Deprecate_sysbus=5Fget=5Fd?= =?US-ASCII?Q?efault=28=29_and_get=5Fsystem=5Fmemory=28=29_et=2E_al?=
In-Reply-To: <49325e7d-5020-23f7-4bce-c53d8d988c95@ilande.co.uk>
References: <20220919231720.163121-1-shentey@gmail.com> <CAFEAcA8GjXFO4WK=KybgSc8rMfqecwD9EXS0kZMKtqogNf1Tsg@mail.gmail.com> <49325e7d-5020-23f7-4bce-c53d8d988c95@ilande.co.uk>
Message-ID: <7DBD5114-15B2-42A7-AB97-35DBF9DDA825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20=2E September 2022 15:36:26 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 20/09/2022 10:55, Peter Maydell wrote:
>
>> On Tue, 20 Sept 2022 at 00:18, Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>>>=20
>>> In address-spaces=2Eh it can be read that get_system_memory() and
>>> get_system_io() are temporary interfaces which "should only be used te=
mporarily
>>> until a proper bus interface is available"=2E This statement certainly=
 extends to
>>> the address_space_memory and address_space_io singletons=2E
>>=20
>> This is a long standing "we never really completed a cleanup"=2E=2E=2E
>>=20
>>> This series attempts
>>> to stop further proliferation of their use by turning TYPE_SYSTEM_BUS =
into an
>>> object-oriented, "proper bus interface" inspired by PCIBus=2E
>>>=20
>>> While at it, also the main_system_bus singleton is turned into an attr=
ibute of
>>> MachineState=2E Together, this resolves five singletons in total, maki=
ng the
>>> ownership relations much more obvious which helps comprehension=2E
>>=20
>> =2E=2E=2Ebut I don't think this is the direction we want to go=2E
>> Overall the reason that the "system memory" and "system IO"
>> singletons are weird is that in theory they should not be necessary
>> at all -- board code should create devices and map them into an
>> entirely arbitrary MemoryRegion or set of MemoryRegions corresponding
>> to address space(s) for the CPU and for DMA-capable devices=2E But we
>> keep them around because
>>   (a) there is a ton of legacy code that assumes there's only one
>>       address space in the system and this is it
>>   (b) when modelling the kind of board where there really is only
>>       one address space, having the 'system memory' global makes
>>       the APIs for creating and connecting devices a lot simpler
>>=20
>> Retaining the whole-system singleton but shoving it into MachineState
>> doesn't really change much, IMHO=2E
>>=20
>> More generally, sysbus is rather weird because it isn't really a
>> bus=2E Every device in the system of TYPE_SYS_BUS_DEVICE is "on"
>> the unique TYPE_SYSTEM_BUS bus, but that doesn't mean they're
>> all in the same address space or that in real hardware they'd
>> all be on the same bus=2E sysbus has essentially degraded into a
>> hack for having devices get reset=2E I really really need to make
>> some time to have another look at reset handling=2E If we get that
>> right then I think it's probably possible to collapse the few
>> things TYPE_SYS_BUS_DEVICE does that TYPE_DEVICE does not down
>> into TYPE_DEVICE and get rid of sysbus altogether=2E=2E=2E
>
>Following on from one of the discussion points from Alex's KVM Forum BoF =
session: I think longer term what we need to aim for is for QEMU machines t=
o define their own address spaces, and then bind those address spaces conta=
ining memory-mapped devices to one or more CPUs=2E

Isn't that more or less impossible with singletons?

>
>Once this in place, as Peter notes above it just remains to solve the res=
et problem and then it becomes possible to eliminate sysbus altogether as e=
verything else can already be managed by qdev/QOM=2E

Also see my reply to Peter=2E

Thanks,
Bernhard
>
>
>ATB,
>
>Mark=2E


