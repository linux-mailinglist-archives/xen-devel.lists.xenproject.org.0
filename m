Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F55BDC28
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 07:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409134.652052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaVY6-0005Rf-82; Tue, 20 Sep 2022 05:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409134.652052; Tue, 20 Sep 2022 05:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaVY6-0005PO-5G; Tue, 20 Sep 2022 05:11:58 +0000
Received: by outflank-mailman (input) for mailman id 409134;
 Tue, 20 Sep 2022 05:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9R7n=ZX=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1oaVY4-0005PH-Ti
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 05:11:56 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bec36bc4-38a2-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 07:11:55 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id t7so2327424wrm.10
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 22:11:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adfe6cc000000b0022a293ab1e9sm452848wrm.11.2022.09.19.22.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 22:11:53 -0700 (PDT)
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
X-Inumbo-ID: bec36bc4-38a2-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=pnla9efotYFd/3Jw4qRJIL4xlOWxFHoq332oc/9bbqo=;
        b=WvvRv/4VUhzyb4J7QRcwkeJBidNZGJR96FFEPsAXWbf8VLcpCXht2BEDjJNBcmmf4q
         B9BYrOZLleB7KiX3SS/A3sJvc264Ej3tiwc3zGaUvi5i726p0npX6EaT2nlzWeA2+YFX
         8GTlDoczWFQldhtWnsIUiRTYwYsgNJm3kyA/24figJL3TCNySpOfwDjd3289KgW1XDyL
         ERzD6kKsPvOAQCvh+laZl5zPT/ZSZiZs1LcmpHaoACHzTBRIGuB5hrb+MzvGTkUhNaoj
         4ok/LujOcM0U/ZAvrwSbQDTdue9Vb6REatLt7pz9bKtwK5aVEYH2l8wALn4jushh7SCo
         jWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=pnla9efotYFd/3Jw4qRJIL4xlOWxFHoq332oc/9bbqo=;
        b=7G8T7A96wz+TuokV+/b3FXyzH8G+FsTJ/VyihiAb4wTTlkVis4KblWMGlxfeKG01S2
         cYSSxCzLCrJxg7422Ym+TnePmIFDuwhkjLgczo6EtVkT4RgcRQL8HBYBjEGoerSZvMXP
         xA1JGSG7MYlKAXDQCQxCFA3oAqxm6BwMNeYtwpICJkQmjVtVuZEmnizz5SkzlUjYepEM
         PMs3CWiGzqrMAPPEUvxzjVWLKwC/Y6S9QWiBGatm0qm1F4nWqa3npETyR6bD2itt+J18
         hc7qJX1M0GryvDlpuduysExQzNBxK5GMU+wkw8swQbMScLdFBvaIkes4JQjLr/0V+xH1
         paMw==
X-Gm-Message-State: ACrzQf2GSEgpY0ZafLcprK1l9Lbp4RUEiPh2JEMkdguNy0ak/P585/sG
	SRtdYlH3utekLndL7ut9RHE=
X-Google-Smtp-Source: AMsMyM68Pblt5BIGotnw6q4CbijQ/TryMLJf4D1jxUGITEtnEY/vODYKCiaQW21HjH1kYP7yEoWclA==
X-Received: by 2002:a5d:6147:0:b0:22a:6035:a878 with SMTP id y7-20020a5d6147000000b0022a6035a878mr12295976wrt.528.1663650715031;
        Mon, 19 Sep 2022 22:11:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <be558812-199c-0909-d2e1-d2dd6be54dec@amsat.org>
Date: Tue, 20 Sep 2022 07:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 8/9] softmmu/physmem: Let SysBusState absorb memory region
 and address space singletons
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-9-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220919231720.163121-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/9/22 01:17, Bernhard Beschow wrote:
> These singletons are actually properties of the system bus but so far it
> hasn't been modelled that way. Fix this to make this relationship very
> obvious.
> 
> The idea of the patch is to restrain futher proliferation of the use of
> get_system_memory() and get_system_io() which are "temprary interfaces"

"further", "temporary"

> "until a proper bus interface is available". This should now be the
> case.
> 
> Note that the new attributes are values rather than a pointers. This
> trades pointer dereferences for pointer arithmetic. The idea is to
> reduce cache misses - a rule of thumb says that every pointer
> dereference causes a cache miss while arithmetic is basically free.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/exec/address-spaces.h | 19 ++++++++++++---
>   include/hw/sysbus.h           |  6 +++++
>   softmmu/physmem.c             | 46 ++++++++++++++++++-----------------
>   3 files changed, 45 insertions(+), 26 deletions(-)
> 
> diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
> index d5c8cbd718..b31bd8dcf0 100644
> --- a/include/exec/address-spaces.h
> +++ b/include/exec/address-spaces.h
> @@ -23,17 +23,28 @@
>   
>   #ifndef CONFIG_USER_ONLY
>   
> -/* Get the root memory region.  This interface should only be used temporarily
> - * until a proper bus interface is available.
> +/**
> + * Get the root memory region.  This is a legacy function, provided for
> + * compatibility. Prefer using SysBusState::system_memory directly.
>    */
>   MemoryRegion *get_system_memory(void);

> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 5bb3b88501..516e9091dc 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -17,6 +17,12 @@ struct SysBusState {
>       /*< private >*/
>       BusState parent_obj;
>       /*< public >*/
> +
> +    MemoryRegion system_memory;
> +    MemoryRegion system_io;
> +
> +    AddressSpace address_space_io;
> +    AddressSpace address_space_memory;

Alternatively (renaming doc accordingly):

        struct {
            MemoryRegion mr;
            AddressSpace as;
        } io, memory;

>   };
>   
>   #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 0ac920d446..07e9a9171c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -86,12 +86,6 @@
>    */
>   RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
>   
> -static MemoryRegion *system_memory;
> -static MemoryRegion *system_io;
> -
> -static AddressSpace address_space_io;
> -static AddressSpace address_space_memory;
> -
>   static MemoryRegion io_mem_unassigned;
>   
>   typedef struct PhysPageEntry PhysPageEntry;
> @@ -146,7 +140,7 @@ typedef struct subpage_t {
>   #define PHYS_SECTION_UNASSIGNED 0
>   
>   static void io_mem_init(void);
> -static void memory_map_init(void);
> +static void memory_map_init(SysBusState *sysbus);
>   static void tcg_log_global_after_sync(MemoryListener *listener);
>   static void tcg_commit(MemoryListener *listener);
>   
> @@ -2667,37 +2661,45 @@ static void tcg_commit(MemoryListener *listener)
>       tlb_flush(cpuas->cpu);
>   }
>   
> -static void memory_map_init(void)
> +static void memory_map_init(SysBusState *sysbus)
>   {

No need to pass a singleton by argument.

        assert(current_machine);

You can use get_system_memory() and get_system_io() in place :)

LGTM otherwise, great!

> -    system_memory = g_malloc(sizeof(*system_memory));
> +    MemoryRegion *system_memory = &sysbus->system_memory;
> +    MemoryRegion *system_io = &sysbus->system_io;
>   
>       memory_region_init(system_memory, NULL, "system", UINT64_MAX);
> -    address_space_init(&address_space_memory, system_memory, "memory");
> +    address_space_init(&sysbus->address_space_memory, system_memory, "memory");
>   
> -    system_io = g_malloc(sizeof(*system_io));
>       memory_region_init_io(system_io, NULL, &unassigned_io_ops, NULL, "io",
>                             65536);
> -    address_space_init(&address_space_io, system_io, "I/O");
> +    address_space_init(&sysbus->address_space_io, system_io, "I/O");
>   }
>   
>   MemoryRegion *get_system_memory(void)
>   {
> -    return system_memory;
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.system_memory;
>   }
>   
>   MemoryRegion *get_system_io(void)
>   {
> -    return system_io;
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.system_io;
>   }
>   
>   AddressSpace *get_address_space_memory(void)
>   {
> -    return &address_space_memory;
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.address_space_memory;
>   }
>   
>   AddressSpace *get_address_space_io(void)
>   {
> -    return &address_space_io;
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.address_space_io;
>   }


