Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D15BF0E0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 01:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409595.652589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamQV-0003hM-UO; Tue, 20 Sep 2022 23:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409595.652589; Tue, 20 Sep 2022 23:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oamQV-0003f8-QI; Tue, 20 Sep 2022 23:13:15 +0000
Received: by outflank-mailman (input) for mailman id 409595;
 Tue, 20 Sep 2022 23:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAgC=ZX=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1oamQU-0003f1-5D
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 23:13:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cca45c61-3939-11ed-bad8-01ff208a15ba;
 Wed, 21 Sep 2022 01:13:12 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id y8so6073352edc.10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 16:13:12 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de.
 [78.54.6.55]) by smtp.gmail.com with ESMTPSA id
 s4-20020aa7d784000000b0044838efb8f8sm662810edq.25.2022.09.20.16.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 16:13:12 -0700 (PDT)
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
X-Inumbo-ID: cca45c61-3939-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bbUnGfY0T65vpw4i+PmIv1V+pOshk83ucIJf1T2aWdo=;
        b=ls5u4mWmzc7wWpojyA20Bt3CadigjecKwPHtS0ugar11GBW4QxG01c7I+FSv4aEXxx
         kfudSa+UgDRMWTzRygtowcdKEHXM5GhKSjDLK0f2PLRvZIHMbf+W1SzB1+XALNHvhjW7
         4987PFAS9fT1/Z2mRZcalcGftAZQCRnM29/Lw4ihqN+YcRt7EqKea73SSK6H/ErlqRm+
         eRN4LIy9KlwhU/fgPV+wWQmi561yMiUm42Ec5eZg1sQnL56KUGoSxeLemHtRlxrro7fZ
         ycbw7arvaIDn0R9vRYC3WYmTTuUO6i/iW6lP47ORjlIApektwFfB4gNxqCasGaZu8dlV
         DKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bbUnGfY0T65vpw4i+PmIv1V+pOshk83ucIJf1T2aWdo=;
        b=H0NoAayzvgscSrV4QcNxhG63BEwg21YctWzsQvA0EeTT/3zzZ8o7nw2giH1HwU4oGj
         fmzp5mfA39gibSPNJmAI+ptHNgEP2pEk7Fqh0WkugkUZ/BxBQORHokNrGClhgr/Qu9Aq
         PfgKKNUn09c7CAJmjt7CdSxjoblZeaKY/vgT79hPQruQS++PBX0EI1iz9JHl2v5GI6+J
         pgfzfBBruIXGvbBZvLDDlx+7H6n9O/2DJfXxMbDwEHHDgALNaW2BmceqFtzRk6s+n0vG
         LH5AYKBpBnbx6f79bwDJV5nFHD+/abdfUfRxutQwSCq80LnextQRuribYN3k9f52BmNC
         z9Wg==
X-Gm-Message-State: ACrzQf1kLv5QMi6uaRELuBydmpon0LeH9yb0h+hU7OPRJDluo+PCMSr6
	msPNebWxgSTyvj9M4VpxF+4=
X-Google-Smtp-Source: AMsMyM5MIIf9aJBnS9EdzxA+J+yQnJxRSxuHpH9qx7oUct/GFhyGI64mHGWWOkudI6DPkfOPMpThSQ==
X-Received: by 2002:a50:ff13:0:b0:43e:76d3:63e1 with SMTP id a19-20020a50ff13000000b0043e76d363e1mr22127037edu.271.1663715592403;
        Tue, 20 Sep 2022 16:13:12 -0700 (PDT)
Date: Tue, 20 Sep 2022 23:13:04 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_8/9=5D_softmmu/physmem=3A_Let_SysBusState_?= =?US-ASCII?Q?absorb_memory_region_and_address_space_singletons?=
In-Reply-To: <fcb592e-a346-2ae-47e9-8af4b9f5ba3@eik.bme.hu>
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-9-shentey@gmail.com> <be558812-199c-0909-d2e1-d2dd6be54dec@amsat.org> <fcb592e-a346-2ae-47e9-8af4b9f5ba3@eik.bme.hu>
Message-ID: <D64FE5B4-84EF-4E6A-8400-E9501FA8C0E9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 20=2E September 2022 08:50:01 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>
>
>On Tue, 20 Sep 2022, Philippe Mathieu-Daud=C3=A9 via wrote:
>
>> On 20/9/22 01:17, Bernhard Beschow wrote:
>>> These singletons are actually properties of the system bus but so far =
it
>>> hasn't been modelled that way=2E Fix this to make this relationship ve=
ry
>>> obvious=2E
>>>=20
>>> The idea of the patch is to restrain futher proliferation of the use o=
f
>>> get_system_memory() and get_system_io() which are "temprary interfaces=
"
>>=20
>> "further", "temporary"
>>=20
>>> "until a proper bus interface is available"=2E This should now be the
>>> case=2E
>>>=20
>>> Note that the new attributes are values rather than a pointers=2E This
>>> trades pointer dereferences for pointer arithmetic=2E The idea is to
>>> reduce cache misses - a rule of thumb says that every pointer
>>> dereference causes a cache miss while arithmetic is basically free=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>   include/exec/address-spaces=2Eh | 19 ++++++++++++---
>>>   include/hw/sysbus=2Eh           |  6 +++++
>>>   softmmu/physmem=2Ec             | 46 ++++++++++++++++++-------------=
----
>>>   3 files changed, 45 insertions(+), 26 deletions(-)
>>>=20
>>> diff --git a/include/exec/address-spaces=2Eh b/include/exec/address-sp=
aces=2Eh
>>> index d5c8cbd718=2E=2Eb31bd8dcf0 100644
>>> --- a/include/exec/address-spaces=2Eh
>>> +++ b/include/exec/address-spaces=2Eh
>>> @@ -23,17 +23,28 @@
>>>     #ifndef CONFIG_USER_ONLY
>>>   -/* Get the root memory region=2E  This interface should only be use=
d temporarily
>>> - * until a proper bus interface is available=2E
>>> +/**
>>> + * Get the root memory region=2E  This is a legacy function, provided=
 for
>>> + * compatibility=2E Prefer using SysBusState::system_memory directly=
=2E
>>>    */
>>>   MemoryRegion *get_system_memory(void);
>>=20
>>> diff --git a/include/hw/sysbus=2Eh b/include/hw/sysbus=2Eh
>>> index 5bb3b88501=2E=2E516e9091dc 100644
>>> --- a/include/hw/sysbus=2Eh
>>> +++ b/include/hw/sysbus=2Eh
>>> @@ -17,6 +17,12 @@ struct SysBusState {
>>>       /*< private >*/
>>>       BusState parent_obj;
>>>       /*< public >*/
>>> +
>>> +    MemoryRegion system_memory;
>>> +    MemoryRegion system_io;
>>> +
>>> +    AddressSpace address_space_io;
>>> +    AddressSpace address_space_memory;
>>=20
>> Alternatively (renaming doc accordingly):
>>=20
>>       struct {
>>           MemoryRegion mr;
>>           AddressSpace as;
>>       } io, memory;
>
>Do we really need that? Isn't mr just the same as as=2Eroot so it would b=
e enough to store as only? Or is caching mr and not going through as to get=
 it saves time in accessing these?

as=2Eroot is just a pointer=2E That's why we need mr as a value as well=2E

> Now we'll go through SysBusState anyway instead of accessing globals so =
is there a performance impact?

Good question=2E Since both attributes are now next to each another I'd ho=
pe for an improvement ;-) That depends on on many things of course, such as=
 if they are located in the same cache line=2E As written in the commit mes=
sages I tried to minimize pointer dereferences=2E

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>>>   };
>>>     #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
>>> diff --git a/softmmu/physmem=2Ec b/softmmu/physmem=2Ec
>>> index 0ac920d446=2E=2E07e9a9171c 100644
>>> --- a/softmmu/physmem=2Ec
>>> +++ b/softmmu/physmem=2Ec
>>> @@ -86,12 +86,6 @@
>>>    */
>>>   RAMList ram_list =3D { =2Eblocks =3D QLIST_HEAD_INITIALIZER(ram_list=
=2Eblocks) };
>>>   -static MemoryRegion *system_memory;
>>> -static MemoryRegion *system_io;
>>> -
>>> -static AddressSpace address_space_io;
>>> -static AddressSpace address_space_memory;
>>> -
>>>   static MemoryRegion io_mem_unassigned;
>>>     typedef struct PhysPageEntry PhysPageEntry;
>>> @@ -146,7 +140,7 @@ typedef struct subpage_t {
>>>   #define PHYS_SECTION_UNASSIGNED 0
>>>     static void io_mem_init(void);
>>> -static void memory_map_init(void);
>>> +static void memory_map_init(SysBusState *sysbus);
>>>   static void tcg_log_global_after_sync(MemoryListener *listener);
>>>   static void tcg_commit(MemoryListener *listener);
>>>   @@ -2667,37 +2661,45 @@ static void tcg_commit(MemoryListener *liste=
ner)
>>>       tlb_flush(cpuas->cpu);
>>>   }
>>>   -static void memory_map_init(void)
>>> +static void memory_map_init(SysBusState *sysbus)
>>>   {
>>=20
>> No need to pass a singleton by argument=2E
>>=20
>>       assert(current_machine);
>>=20
>> You can use get_system_memory() and get_system_io() in place :)
>>=20
>> LGTM otherwise, great!
>>=20
>>> -    system_memory =3D g_malloc(sizeof(*system_memory));
>>> +    MemoryRegion *system_memory =3D &sysbus->system_memory;
>>> +    MemoryRegion *system_io =3D &sysbus->system_io;
>>>         memory_region_init(system_memory, NULL, "system", UINT64_MAX);
>>> -    address_space_init(&address_space_memory, system_memory, "memory"=
);
>>> +    address_space_init(&sysbus->address_space_memory, system_memory, =
"memory");
>>>   -    system_io =3D g_malloc(sizeof(*system_io));
>>>       memory_region_init_io(system_io, NULL, &unassigned_io_ops, NULL,=
 "io",
>>>                             65536);
>>> -    address_space_init(&address_space_io, system_io, "I/O");
>>> +    address_space_init(&sysbus->address_space_io, system_io, "I/O");
>>>   }
>>>     MemoryRegion *get_system_memory(void)
>>>   {
>>> -    return system_memory;
>>> +    assert(current_machine);
>>> +
>>> +    return &current_machine->main_system_bus=2Esystem_memory;
>>>   }
>>>     MemoryRegion *get_system_io(void)
>>>   {
>>> -    return system_io;
>>> +    assert(current_machine);
>>> +
>>> +    return &current_machine->main_system_bus=2Esystem_io;
>>>   }
>>>     AddressSpace *get_address_space_memory(void)
>>>   {
>>> -    return &address_space_memory;
>>> +    assert(current_machine);
>>> +
>>> +    return &current_machine->main_system_bus=2Eaddress_space_memory;
>>>   }
>>>     AddressSpace *get_address_space_io(void)
>>>   {
>>> -    return &address_space_io;
>>> +    assert(current_machine);
>>> +
>>> +    return &current_machine->main_system_bus=2Eaddress_space_io;
>>>   }
>>=20
>>=20
>>=20

