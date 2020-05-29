Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70C1E774D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZge-0007qB-SG; Fri, 29 May 2020 07:44:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz0h=7L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jeZgd-0007q6-AM
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:44:15 +0000
X-Inumbo-ID: 30e74ab2-a180-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30e74ab2-a180-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 07:44:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j10so2269770wrw.8
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=roczZs7L61Vci60GG4PyZ2tp//AeYjJpdFj+UdVmozo=;
 b=kVT2UBVm/1EZryY/rKocSOM/k2UrcZ5kNCim3jJYL6LcJUT2aHEvzNhyDM4WJckU74
 gos3ymR4REE8hp9qGtCdT0qjXaE/djyD0jOEQU8wP/25U7xVgi2IoPgk4BfxOg9A2F2v
 93Hd1xmkdPf5B/4tnudxhTa02y18sfqeD1bPqC6QrgNrnpdYh4pne3Bq8i0HZO+C9xQV
 tIA/cij7jtBeLg4H0smg38SvYD9FHLWGn8Y/KpjI0jX653T+0UAwbn9v+hkl5vCeWRun
 bnCCEUfig3GKvMptggD9m9FfjOjmF6j6r0tUw4Tw5YpYFZ8a0MQ2vAdxyNFfg7zEELBJ
 qZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=roczZs7L61Vci60GG4PyZ2tp//AeYjJpdFj+UdVmozo=;
 b=QP46kkSS6zT3VQR73i0lmH6aNY8KFY0Xsrk0cY/X3JMPl2CsOFgIY6PxUg3yJ/uC7G
 +cSKCop2sxXDc897886evZT5pxphYV6h7MaabBFDOzRg0l3TxE78kfp+qiDVUDIayb9D
 U+cEBhnAz+QWTIxCFuwdGkMEphMtAZEzeqN7g5ZpyVw2reoKbaC3CpRnus0A9hCwTVZ/
 FEFkq1gDnpzzj6W8FzaGeyKaCh+zqzRO8Y3tGDIH0VyDIHRjGneBLmss3WEzZ05fgMV9
 7HdA6lbWzC1Vc56D2RSegBCeDbZkjCI5f8U8l2cRKhbjDQnGeqgj3T7PN9meSHSMd+ER
 REaA==
X-Gm-Message-State: AOAM530JYXQT82xOTHxvd+Ss1Snf3irFD0IW0JaIjT1YwS8WpM5ufRmU
 s3kTQXbu0oDiPelUwolhG5M=
X-Google-Smtp-Source: ABdhPJw3P3lScRsjcgafefCTJ413eRfiQVmkSNAZZX8pYMS3ltLolA7D7n+kaGxiJ0ddXBqW/sptlw==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr6978205wrj.333.1590738253250; 
 Fri, 29 May 2020 00:44:13 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id g69sm11901534wmg.15.2020.05.29.00.44.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 00:44:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Gerd Hoffmann'" <kraxel@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20200529073957.8018-1-kraxel@redhat.com>
 <20200529073957.8018-4-kraxel@redhat.com>
In-Reply-To: <20200529073957.8018-4-kraxel@redhat.com>
Subject: RE: [PATCH v3 3/4] x86: move max-ram-below-4g to pc
Date: Fri, 29 May 2020 08:44:10 +0100
Message-ID: <002c01d6358c$f20d74b0$d6285e10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQDGIkPqD5sx0/r6TkPYYJAoRbayPwH/kqgVqs7YoJA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>, 'Sergio Lopez' <slp@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, imammedo@redhat.com,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, 'Anthony Perard' <anthony.perard@citrix.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>, philmd@redhat.com,
 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Gerd Hoffmann <kraxel@redhat.com>
> Sent: 29 May 2020 08:40
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Eduardo Habkost =
<ehabkost@redhat.com>; Sergio Lopez
> <slp@redhat.com>; philmd@redhat.com; Marcel Apfelbaum =
<marcel.apfelbaum@gmail.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; =
xen-devel@lists.xenproject.org; Michael S.
> Tsirkin <mst@redhat.com>; Anthony Perard <anthony.perard@citrix.com>; =
Richard Henderson
> <rth@twiddle.net>; imammedo@redhat.com; Gerd Hoffmann =
<kraxel@redhat.com>
> Subject: [PATCH v3 3/4] x86: move max-ram-below-4g to pc
>=20
> Move from X86MachineClass to PCMachineClass so it disappears
> from microvm machine type property list.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Xen change...

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  include/hw/i386/pc.h  |  2 ++
>  include/hw/i386/x86.h |  4 ----
>  hw/i386/pc.c          | 46 =
+++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc_piix.c     | 10 +++++-----
>  hw/i386/pc_q35.c      | 10 +++++-----
>  hw/i386/x86.c         | 46 =
-------------------------------------------
>  hw/i386/xen/xen-hvm.c |  2 +-
>  7 files changed, 59 insertions(+), 61 deletions(-)
>=20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 5e3b19ab78fc..dce1273c7dad 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -35,6 +35,7 @@ struct PCMachineState {
>      PFlashCFI01 *flash[2];
>=20
>      /* Configuration options: */
> +    uint64_t max_ram_below_4g;
>      OnOffAuto vmport;
>=20
>      bool acpi_build_enabled;
> @@ -51,6 +52,7 @@ struct PCMachineState {
>  };
>=20
>  #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
> +#define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>  #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
>  #define PC_MACHINE_VMPORT           "vmport"
>  #define PC_MACHINE_SMBUS            "smbus"
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index b52285481687..b79f24e28545 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -51,9 +51,6 @@ typedef struct {
>      qemu_irq *gsi;
>      GMappedFile *initrd_mapped_file;
>=20
> -    /* Configuration options: */
> -    uint64_t max_ram_below_4g;
> -
>      /* RAM information (sizes, addresses, configuration): */
>      ram_addr_t below_4g_mem_size, above_4g_mem_size;
>=20
> @@ -82,7 +79,6 @@ typedef struct {
>      AddressSpace *ioapic_as;
>  } X86MachineState;
>=20
> -#define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>  #define X86_MACHINE_SMM              "smm"
>  #define X86_MACHINE_ACPI             "acpi"
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c5db7be6d8b1..6d6f6decb32c 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1831,6 +1831,45 @@ static void pc_machine_set_pit(Object *obj, =
bool value, Error **errp)
>      pcms->pit_enabled =3D value;
>  }
>=20
> +static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
> +                                            const char *name, void =
*opaque,
> +                                            Error **errp)
> +{
> +    PCMachineState *pcms =3D PC_MACHINE(obj);
> +    uint64_t value =3D pcms->max_ram_below_4g;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
> +                                            const char *name, void =
*opaque,
> +                                            Error **errp)
> +{
> +    PCMachineState *pcms =3D PC_MACHINE(obj);
> +    Error *error =3D NULL;
> +    uint64_t value;
> +
> +    visit_type_size(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +    if (value > 4 * GiB) {
> +        error_setg(&error,
> +                   "Machine option 'max-ram-below-4g=3D%"PRIu64
> +                   "' expects size less than or equal to 4G", value);
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    if (value < 1 * MiB) {
> +        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB =
boundary,"
> +                    "BIOS may not work with less than 1MiB", value);
> +    }
> +
> +    pcms->max_ram_below_4g =3D value;
> +}
> +
>  static void pc_machine_initfn(Object *obj)
>  {
>      PCMachineState *pcms =3D PC_MACHINE(obj);
> @@ -1840,6 +1879,7 @@ static void pc_machine_initfn(Object *obj)
>  #else
>      pcms->vmport =3D ON_OFF_AUTO_OFF;
>  #endif /* CONFIG_VMPORT */
> +    pcms->max_ram_below_4g =3D 0; /* use default */
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled =3D =
PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled =3D true;
> @@ -1938,6 +1978,12 @@ static void pc_machine_class_init(ObjectClass =
*oc, void *data)
>      mc->numa_mem_supported =3D true;
>      mc->default_ram_id =3D "pc.ram";
>=20
> +    object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, =
"size",
> +        pc_machine_get_max_ram_below_4g, =
pc_machine_set_max_ram_below_4g,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, =
PC_MACHINE_MAX_RAM_BELOW_4G,
> +        "Maximum ram below the 4G boundary (32bit boundary)");
> +
>      object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, =
"int",
>          pc_machine_get_device_memory_region_size, NULL,
>          NULL, NULL);
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index f66e1d73ce0b..503c35f7bf4c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -127,11 +127,11 @@ static void pc_init1(MachineState *machine,
>      if (xen_enabled()) {
>          xen_hvm_init(pcms, &ram_memory);
>      } else {
> -        if (!x86ms->max_ram_below_4g) {
> -            x86ms->max_ram_below_4g =3D 0xe0000000; /* default: 3.5G =
*/
> +        if (!pcms->max_ram_below_4g) {
> +            pcms->max_ram_below_4g =3D 0xe0000000; /* default: 3.5G =
*/
>          }
> -        lowmem =3D x86ms->max_ram_below_4g;
> -        if (machine->ram_size >=3D x86ms->max_ram_below_4g) {
> +        lowmem =3D pcms->max_ram_below_4g;
> +        if (machine->ram_size >=3D pcms->max_ram_below_4g) {
>              if (pcmc->gigabyte_align) {
>                  if (lowmem > 0xc0000000) {
>                      lowmem =3D 0xc0000000;
> @@ -140,7 +140,7 @@ static void pc_init1(MachineState *machine,
>                      warn_report("Large machine and max_ram_below_4g "
>                                  "(%" PRIu64 ") not a multiple of 1G; =
"
>                                  "possible bad performance.",
> -                                x86ms->max_ram_below_4g);
> +                                pcms->max_ram_below_4g);
>                  }
>              }
>          }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4ba8ac8774e4..90e8fb2cb737 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -154,18 +154,18 @@ static void pc_q35_init(MachineState *machine)
>      /* Handle the machine opt max-ram-below-4g.  It is basically =
doing
>       * min(qemu limit, user limit).
>       */
> -    if (!x86ms->max_ram_below_4g) {
> -        x86ms->max_ram_below_4g =3D 4 * GiB;
> +    if (!pcms->max_ram_below_4g) {
> +        pcms->max_ram_below_4g =3D 4 * GiB;
>      }
> -    if (lowmem > x86ms->max_ram_below_4g) {
> -        lowmem =3D x86ms->max_ram_below_4g;
> +    if (lowmem > pcms->max_ram_below_4g) {
> +        lowmem =3D pcms->max_ram_below_4g;
>          if (machine->ram_size - lowmem > lowmem &&
>              lowmem & (1 * GiB - 1)) {
>              warn_report("There is possibly poor performance as the =
ram size "
>                          " (0x%" PRIx64 ") is more then twice the size =
of"
>                          " max-ram-below-4g (%"PRIu64") and"
>                          " max-ram-below-4g is not a multiple of 1G.",
> -                        (uint64_t)machine->ram_size, =
x86ms->max_ram_below_4g);
> +                        (uint64_t)machine->ram_size, =
pcms->max_ram_below_4g);
>          }
>      }
>=20
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 7a3bc7ab6639..49884e5c1597 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -846,45 +846,6 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, =
bool isapc_ram_fw)
>                                  bios);
>  }
>=20
> -static void x86_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
> -                                             const char *name, void =
*opaque,
> -                                             Error **errp)
> -{
> -    X86MachineState *x86ms =3D X86_MACHINE(obj);
> -    uint64_t value =3D x86ms->max_ram_below_4g;
> -
> -    visit_type_size(v, name, &value, errp);
> -}
> -
> -static void x86_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
> -                                             const char *name, void =
*opaque,
> -                                             Error **errp)
> -{
> -    X86MachineState *x86ms =3D X86_MACHINE(obj);
> -    Error *error =3D NULL;
> -    uint64_t value;
> -
> -    visit_type_size(v, name, &value, &error);
> -    if (error) {
> -        error_propagate(errp, error);
> -        return;
> -    }
> -    if (value > 4 * GiB) {
> -        error_setg(&error,
> -                   "Machine option 'max-ram-below-4g=3D%"PRIu64
> -                   "' expects size less than or equal to 4G", value);
> -        error_propagate(errp, error);
> -        return;
> -    }
> -
> -    if (value < 1 * MiB) {
> -        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB =
boundary,"
> -                    "BIOS may not work with less than 1MiB", value);
> -    }
> -
> -    x86ms->max_ram_below_4g =3D value;
> -}
> -
>  bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
>  {
>      bool smm_available =3D false;
> @@ -958,7 +919,6 @@ static void x86_machine_initfn(Object *obj)
>=20
>      x86ms->smm =3D ON_OFF_AUTO_AUTO;
>      x86ms->acpi =3D ON_OFF_AUTO_AUTO;
> -    x86ms->max_ram_below_4g =3D 0; /* use default */
>      x86ms->smp_dies =3D 1;
>=20
>      x86ms->apicid_from_cpu_idx =3D x86_apicid_from_cpu_idx;
> @@ -980,12 +940,6 @@ static void x86_machine_class_init(ObjectClass =
*oc, void *data)
>      x86mc->save_tsc_khz =3D true;
>      nc->nmi_monitor_handler =3D x86_nmi;
>=20
> -    object_class_property_add(oc, X86_MACHINE_MAX_RAM_BELOW_4G, =
"size",
> -        x86_machine_get_max_ram_below_4g, =
x86_machine_set_max_ram_below_4g,
> -        NULL, NULL);
> -    object_class_property_set_description(oc, =
X86_MACHINE_MAX_RAM_BELOW_4G,
> -        "Maximum ram below the 4G boundary (32bit boundary)");
> -
>      object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
>          x86_machine_get_smm, x86_machine_set_smm,
>          NULL, NULL);
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 82ece6b9e739..d6f4674418e9 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -203,7 +203,7 @@ static void xen_ram_init(PCMachineState *pcms,
>      ram_addr_t block_len;
>      uint64_t user_lowmem =3D
>          object_property_get_uint(qdev_get_machine(),
> -                                 X86_MACHINE_MAX_RAM_BELOW_4G,
> +                                 PC_MACHINE_MAX_RAM_BELOW_4G,
>                                   &error_abort);
>=20
>      /* Handle the machine opt max-ram-below-4g.  It is basically =
doing
> --
> 2.18.4



