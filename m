Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9235BF088
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 00:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409577.652556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oam4x-0008St-L2; Tue, 20 Sep 2022 22:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409577.652556; Tue, 20 Sep 2022 22:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oam4x-0008Pt-IC; Tue, 20 Sep 2022 22:50:59 +0000
Received: by outflank-mailman (input) for mailman id 409577;
 Tue, 20 Sep 2022 22:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAgC=ZX=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oam4w-0008Pn-NQ
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 22:50:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0491c88-3936-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 00:50:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id 29so6066194edv.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 15:50:56 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de.
 [78.54.6.55]) by smtp.gmail.com with ESMTPSA id
 w19-20020a170906185300b00781dbdb2917sm419441eje.208.2022.09.20.15.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 15:50:55 -0700 (PDT)
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
X-Inumbo-ID: b0491c88-3936-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=QvFwsZxA6MHmqPpgPr1kmpEeALNsZz3EkiO3t151YWs=;
        b=ibNCByyuTGhFGP39XO+xweQozEi3tAqcBRhZ/WOmAMtm/9JZXAqTHeKDVMR3haUUku
         bX/KG2i8BLKYyZZ5r9zS7NpGgT5D6bwJNH/6EaOJaQxYpBu64mBI46gWkHJPUonkqqL5
         uEs9gpr+y/TWGp+xV48d0PI7qu18qvMXd4eqt6zEm9WuFkfVSx7rwO4U1MQF3yaSFsY/
         5Jo9YA+0CW00j9RSccq2/MAvvNkxPNwQERMk4xSHlaFAE0ymgCLA5CQSoPJv8sXQ2J8b
         J45/4/j74hFU0Hj4c7mQT5wxM/yWl5q+XEBIfdHitK28VSjZ22xsRBuBV8AWfo2iUnYv
         RJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QvFwsZxA6MHmqPpgPr1kmpEeALNsZz3EkiO3t151YWs=;
        b=Fo3g3p/kkfl9e7PdVbGmaUiMNWdJthuzbcEbYqbeF7lLiMPnBcFnLs7A6fpj2lZioC
         1NMxpQFtxyjY2H/caxyaTeEVGNTAbe4oYUxi0faP/M/lpjmf1SG7fJTgYQ0ni4BW/Jnj
         Viq5kGqnXoJL6yN9Al5YFIgjmKG5587qOMw3jtlq8QEK1SK4eE8J3SsyDNiaZ3trM+x2
         I6LLsUkKiATFshSbeY4kyCG5SsDH9pFs5FN37duZm6xX/8GmLHQ/tZGPanlOmcGe2eBe
         STQRrG1jz6kdOw1t1ipUaxJ0TloCvjUEmFqK5ejzjee0b0OMD7O/Yu9NGEGem1UYS+gu
         HRHQ==
X-Gm-Message-State: ACrzQf1MPR3UgUmVAmFvv0LaRHFw3O/Xklru373iKnCJ6S34nv3jIdet
	XpLz+VwOuc5mKgEJqjMmTTY=
X-Google-Smtp-Source: AMsMyM67oSTOvXd574lZXg8CCJPXcxUdWt09EbcZYxRTm1trv1PkATVyBPnkcoMu+n0wqofhvURSSQ==
X-Received: by 2002:a05:6402:1e8c:b0:44f:f70:e75e with SMTP id f12-20020a0564021e8c00b0044f0f70e75emr21468748edf.405.1663714256321;
        Tue, 20 Sep 2022 15:50:56 -0700 (PDT)
Date: Tue, 20 Sep 2022 22:50:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
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
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery <andrew@aj.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/9=5D_Deprecate_sysbus=5Fget=5Fd?= =?US-ASCII?Q?efault=28=29_and_get=5Fsystem=5Fmemory=28=29_et=2E_al?=
In-Reply-To: <CAFEAcA8GjXFO4WK=KybgSc8rMfqecwD9EXS0kZMKtqogNf1Tsg@mail.gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com> <CAFEAcA8GjXFO4WK=KybgSc8rMfqecwD9EXS0kZMKtqogNf1Tsg@mail.gmail.com>
Message-ID: <AD2F1750-F579-4F3B-A9FD-F2ADDF29D9E8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20=2E September 2022 09:55:37 UTC schrieb Peter Maydell <peter=2Emaydell=
@linaro=2Eorg>:
>On Tue, 20 Sept 2022 at 00:18, Bernhard Beschow <shentey@gmail=2Ecom> wro=
te:
>>
>> In address-spaces=2Eh it can be read that get_system_memory() and
>> get_system_io() are temporary interfaces which "should only be used tem=
porarily
>> until a proper bus interface is available"=2E This statement certainly =
extends to
>> the address_space_memory and address_space_io singletons=2E
>
>This is a long standing "we never really completed a cleanup"=2E=2E=2E
>
>> This series attempts
>> to stop further proliferation of their use by turning TYPE_SYSTEM_BUS i=
nto an
>> object-oriented, "proper bus interface" inspired by PCIBus=2E
>>
>> While at it, also the main_system_bus singleton is turned into an attri=
bute of
>> MachineState=2E Together, this resolves five singletons in total, makin=
g the
>> ownership relations much more obvious which helps comprehension=2E
>
>=2E=2E=2Ebut I don't think this is the direction we want to go=2E
>Overall the reason that the "system memory" and "system IO"
>singletons are weird is that in theory they should not be necessary
>at all -- board code should create devices and map them into an
>entirely arbitrary MemoryRegion or set of MemoryRegions corresponding
>to address space(s) for the CPU and for DMA-capable devices=2E

My intention was to allow exactly that: By turning sytem memory and system=
 IO into non-singletons, one could have many of them, thus allowing boards =
to create arbitrary mappings of memory and IO=2E Since QEMU currently assum=
es one set (memory and IO) of addresses, I for now instantiated the SysBus =
once in the machine class to preserve behavior=2E

>But we
>keep them around because
> (a) there is a ton of legacy code that assumes there's only one
>     address space in the system and this is it
> (b) when modelling the kind of board where there really is only
>     one address space, having the 'system memory' global makes
>     the APIs for creating and connecting devices a lot simpler

Indeed, the APIs may look simpler=2E The issue I see here though is that d=
evices may make assumptions about these globals which makes the code hard t=
o change in the long run=2E If devices are given their dependencies by the =
framework, they must make less assumptions, putting the framework into cont=
rol=2E This makes the code more homogenious and therefore easier to change=
=2E

>Retaining the whole-system singleton but shoving it into MachineState
>doesn't really change much, IMHO=2E
>
>More generally, sysbus is rather weird because it isn't really a
>bus=2E Every device in the system of TYPE_SYS_BUS_DEVICE is "on"
>the unique TYPE_SYSTEM_BUS bus, but that doesn't mean they're
>all in the same address space or that in real hardware they'd
>all be on the same bus=2E

Again, having multiple SysBuses may solve that issue=2E

>sysbus has essentially degraded into a
>hack for having devices get reset=2E I really really need to make
>some time to have another look at reset handling=2E If we get that
>right then I think it's probably possible to collapse the few
>things TYPE_SYS_BUS_DEVICE does that TYPE_DEVICE does not down
>into TYPE_DEVICE and get rid of sysbus altogether=2E=2E=2E

There are many SysBusDevices which directly access the globals I intended =
to deprecate=2E If those devices could be changed to use the SysBus equival=
ents instead, this would put the boards in control of memory mappings=2E

Best regards,
Bernhard

>
>thanks
>-- PMM


