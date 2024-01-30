Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CD8425AD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 14:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673340.1047706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnk1-0006xl-Pr; Tue, 30 Jan 2024 13:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673340.1047706; Tue, 30 Jan 2024 13:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnk1-0006uW-N3; Tue, 30 Jan 2024 13:01:29 +0000
Received: by outflank-mailman (input) for mailman id 673340;
 Tue, 30 Jan 2024 13:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNcU=JI=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1rUnjz-0006uQ-Op
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 13:01:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abf94272-bf6f-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 14:01:25 +0100 (CET)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-BhDM7FeqMB233njGk3oRjA-1; Tue, 30 Jan 2024 08:01:22 -0500
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-429f3c43c66so72205211cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 05:01:22 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o18-20020ac84292000000b0042be0933c1csm118654qtl.15.2024.01.30.05.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 05:01:20 -0800 (PST)
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
X-Inumbo-ID: abf94272-bf6f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706619684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apKZmorjsr2taGieD0PrruP9G2qbgz7znJkCA3WbxIA=;
	b=BYg52de2quR0ZDofIW/8xwlFbyP+NayvUy7dPZwx7ihJaSKLbn2U8u4IrMuRDo30JGT3LK
	r4j55bRB/IoPwgKsIxM1jwZ9CMl9C61F6pGmB0xveiwCoeVsmUMlZt7zdq68ABxVjSOaCm
	z+G7rhAITTGiEXEPqGGlHOhbJlB31oc=
X-MC-Unique: BhDM7FeqMB233njGk3oRjA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706619682; x=1707224482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7s1ZBCu3sJthQ2nrjXaXTr8b5tVJwTBl9SA6zwisWY=;
        b=kobnOcVexB6DFQLHtvEH3qtxVeP+lD34LT+kCsCdyPWPqy7JAz8RXP7zVJULQpO+BW
         klBldflv4NZvB3PWa1kPsrxxvYR+D6EIgffPOVu6yPqAnIDawNOZAm/qd7rTWEU3GpcA
         FECT5yBBdiv5AUWsXthSdAFWekZAgtwI+82k++hOx4YbZFKVgD3I+r5S70SR0P0KmX8q
         Lt95I6G/L+ek0yQaurnKyJrAE7FOzE46ucR0catpMb33fEvQpFxa7trmnjxsKaYF7LM+
         gAZCqb8k3zRSw+e/Ls5nKEDCRA3sHnltbTbQ7HoZ4mLgg94YoWXYWRVcEFNF4kpBY3Yo
         uWKQ==
X-Gm-Message-State: AOJu0Yzrm+j72m5HU4Hnxb6amjsxu11TFNtZYYCzP4Z+aMh1SacMTRME
	xEcXz4JzD9jsuTPq14F5/gJvpC/QXi6SRxIwwuIcVkG7JXqszes72/vBfKeIzM4HGwjZA1PxaY4
	L+OgjprlVTzFtIuI/u+KDr4/zF23d1bPz35hcsbwnga/oZd7XbFc0+77NpoH0EejR
X-Received: by 2002:ac8:4e4d:0:b0:42a:b44f:e31f with SMTP id e13-20020ac84e4d000000b0042ab44fe31fmr1853917qtw.85.1706619681600;
        Tue, 30 Jan 2024 05:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBvczkl02R/u+A9Lg2jzfHDRLiCiDJy/EgTJw2KKi9HJ65qma+vt6e9D/zFhBdgx1YZ5Cl+Q==
X-Received: by 2002:ac8:4e4d:0:b0:42a:b44f:e31f with SMTP id e13-20020ac84e4d000000b0042ab44fe31fmr1853867qtw.85.1706619680817;
        Tue, 30 Jan 2024 05:01:20 -0800 (PST)
Date: Tue, 30 Jan 2024 14:01:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost
 <eduardo@habkost.net>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Cameron
 Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, Marcelo
 Tosatti <mtosatti@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 14/29] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Message-ID: <20240130140115.135f533d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240129164514.73104-15-philmd@linaro.org>
References: <20240129164514.73104-1-philmd@linaro.org>
	<20240129164514.73104-15-philmd@linaro.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Jan 2024 17:44:56 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.


commenting here since, I'm not expert on coccinelle scripts.

On negative side we are permanently loosing type checking in this area.
Is it worth it, what gains do we get with this series?

Side note,
QOM cast expenses you are replacing could be negated by disabling
CONFIG_QOM_CAST_DEBUG without killing type check code when it's enabled.
That way you will speed up not only cpuenv access but also all other casts
across the board.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
...
>  static inline void vmx_clear_nmi_blocking(CPUState *cpu)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> -
> -    env->hflags2 &=3D ~HF2_NMI_MASK;

> +    cpu_env(cpu)->hflags2 &=3D ~HF2_NMI_MASK;

this style of de-referencing return value of macro/function
was discouraged in past and preferred way was 'Foo f =3D CAST(me); f->some_=
access

(it's just imprint speaking, I don't recall where it comes from)

>      uint32_t gi =3D (uint32_t) rvmcs(cpu->accel->fd, VMCS_GUEST_INTERRUP=
TIBILITY);
>      gi &=3D ~VMCS_INTERRUPTIBILITY_NMI_BLOCKING;
>      wvmcs(cpu->accel->fd, VMCS_GUEST_INTERRUPTIBILITY, gi);
> @@ -207,10 +203,7 @@ static inline void vmx_clear_nmi_blocking(CPUState *=
cpu)
> =20
>  static inline void vmx_set_nmi_blocking(CPUState *cpu)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> -
> -    env->hflags2 |=3D HF2_NMI_MASK;
> +    cpu_env(cpu)->hflags2 |=3D HF2_NMI_MASK;
>      uint32_t gi =3D (uint32_t)rvmcs(cpu->accel->fd, VMCS_GUEST_INTERRUPT=
IBILITY);
>      gi |=3D VMCS_INTERRUPTIBILITY_NMI_BLOCKING;
>      wvmcs(cpu->accel->fd, VMCS_GUEST_INTERRUPTIBILITY, gi);
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index 7362daa45a..5239cd40fa 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -155,8 +155,7 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
> =20
>  void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
>  {
> -    X86CPU *cpu =3D X86_CPU(ms->possible_cpus->cpus[0].cpu);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(ms->possible_cpus->cpus[0].cpu);
>      uint32_t unused, ebx, ecx, edx;
>      uint64_t feature_control_bits =3D 0;
>      uint64_t *val;
> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
> index a8d014d09a..f292a14a15 100644
> --- a/hw/i386/vmmouse.c
> +++ b/hw/i386/vmmouse.c
> @@ -74,8 +74,7 @@ struct VMMouseState {
> =20
>  static void vmmouse_get_data(uint32_t *data)
>  {
> -    X86CPU *cpu =3D X86_CPU(current_cpu);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(current_cpu);
> =20
>      data[0] =3D env->regs[R_EAX]; data[1] =3D env->regs[R_EBX];
>      data[2] =3D env->regs[R_ECX]; data[3] =3D env->regs[R_EDX];
> @@ -84,8 +83,7 @@ static void vmmouse_get_data(uint32_t *data)
> =20
>  static void vmmouse_set_data(const uint32_t *data)
>  {
> -    X86CPU *cpu =3D X86_CPU(current_cpu);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(current_cpu);
> =20
>      env->regs[R_EAX] =3D data[0]; env->regs[R_EBX] =3D data[1];
>      env->regs[R_ECX] =3D data[2]; env->regs[R_EDX] =3D data[3];
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index f42621e674..61e5060117 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -487,8 +487,7 @@ static void regs_to_cpu(vmware_regs_t *vmport_regs, i=
oreq_t *req)
> =20
>  static void regs_from_cpu(vmware_regs_t *vmport_regs)
>  {
> -    X86CPU *cpu =3D X86_CPU(current_cpu);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(current_cpu);
> =20
>      vmport_regs->ebx =3D env->regs[R_EBX];
>      vmport_regs->ecx =3D env->regs[R_ECX];
> diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
> index c290910a04..8939ff9fa9 100644
> --- a/target/i386/arch_dump.c
> +++ b/target/i386/arch_dump.c
> @@ -203,7 +203,6 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f,=
 CPUState *cs,
>  int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, DumpState *s)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
>      x86_elf_prstatus prstatus;
>      Elf32_Nhdr *note;
>      char *buf;
> @@ -211,7 +210,7 @@ int x86_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,
>      const char *name =3D "CORE";
>      int ret;
> =20
> -    x86_fill_elf_prstatus(&prstatus, &cpu->env, cpuid);
> +    x86_fill_elf_prstatus(&prstatus, cpu_env(cs), cpuid);
>      descsz =3D sizeof(x86_elf_prstatus);
>      note_size =3D ELF_NOTE_SIZE(sizeof(Elf32_Nhdr), name_size, descsz);
>      note =3D g_malloc0(note_size);
> @@ -381,17 +380,13 @@ static inline int cpu_write_qemu_note(WriteCoreDump=
Function f,
>  int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cs,
>                                   DumpState *s)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -
> -    return cpu_write_qemu_note(f, &cpu->env, s, 1);
> +    return cpu_write_qemu_note(f, cpu_env(cs), s, 1);
>  }
> =20
>  int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cs,
>                                   DumpState *s)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -
> -    return cpu_write_qemu_note(f, &cpu->env, s, 0);
> +    return cpu_write_qemu_note(f, cpu_env(cs), s, 0);
>  }
> =20
>  int cpu_get_dump_info(ArchDumpInfo *info,
> diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_=
mapping.c
> index d1ff659128..c0604d5956 100644
> --- a/target/i386/arch_memory_mapping.c
> +++ b/target/i386/arch_memory_mapping.c
> @@ -269,8 +269,7 @@ static void walk_pml5e(MemoryMappingList *list, Addre=
ssSpace *as,
>  bool x86_cpu_get_memory_mapping(CPUState *cs, MemoryMappingList *list,
>                                  Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      int32_t a20_mask;
> =20
>      if (!cpu_paging_enabled(cs)) {
> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> index 40697064d9..5459d84abd 100644
> --- a/target/i386/cpu-dump.c
> +++ b/target/i386/cpu-dump.c
> @@ -343,8 +343,7 @@ void x86_cpu_dump_local_apic_state(CPUState *cs, int =
flags)
> =20
>  void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      int eflags, i, nb;
>      char cc_op_name[32];
>      static const char *seg_name[6] =3D { "ES", "CS", "SS", "DS", "FS", "=
GS" };
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 66345c204a..5d7a266d27 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5062,8 +5062,7 @@ static void x86_cpuid_version_get_family(Object *ob=
j, Visitor *v,
>                                           const char *name, void *opaque,
>                                           Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      int64_t value;
> =20
>      value =3D (env->cpuid_version >> 8) & 0xf;
> @@ -5077,8 +5076,7 @@ static void x86_cpuid_version_set_family(Object *ob=
j, Visitor *v,
>                                           const char *name, void *opaque,
>                                           Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      const int64_t min =3D 0;
>      const int64_t max =3D 0xff + 0xf;
>      int64_t value;
> @@ -5104,8 +5102,7 @@ static void x86_cpuid_version_get_model(Object *obj=
, Visitor *v,
>                                          const char *name, void *opaque,
>                                          Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      int64_t value;
> =20
>      value =3D (env->cpuid_version >> 4) & 0xf;
> @@ -5117,8 +5114,7 @@ static void x86_cpuid_version_set_model(Object *obj=
, Visitor *v,
>                                          const char *name, void *opaque,
>                                          Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      const int64_t min =3D 0;
>      const int64_t max =3D 0xff;
>      int64_t value;
> @@ -5140,11 +5136,9 @@ static void x86_cpuid_version_get_stepping(Object =
*obj, Visitor *v,
>                                             const char *name, void *opaqu=
e,
>                                             Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
>      int64_t value;
> =20
> -    value =3D env->cpuid_version & 0xf;
> +    value =3D cpu_env(CPU(obj))->cpuid_version & 0xf;
>      visit_type_int(v, name, &value, errp);
>  }
> =20
> @@ -5152,8 +5146,7 @@ static void x86_cpuid_version_set_stepping(Object *=
obj, Visitor *v,
>                                             const char *name, void *opaqu=
e,
>                                             Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      const int64_t min =3D 0;
>      const int64_t max =3D 0xf;
>      int64_t value;
> @@ -5173,8 +5166,7 @@ static void x86_cpuid_version_set_stepping(Object *=
obj, Visitor *v,
> =20
>  static char *x86_cpuid_get_vendor(Object *obj, Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      char *value;
> =20
>      value =3D g_malloc(CPUID_VENDOR_SZ + 1);
> @@ -5186,8 +5178,7 @@ static char *x86_cpuid_get_vendor(Object *obj, Erro=
r **errp)
>  static void x86_cpuid_set_vendor(Object *obj, const char *value,
>                                   Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      int i;
> =20
>      if (strlen(value) !=3D CPUID_VENDOR_SZ) {
> @@ -5208,8 +5199,7 @@ static void x86_cpuid_set_vendor(Object *obj, const=
 char *value,
> =20
>  static char *x86_cpuid_get_model_id(Object *obj, Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      char *value;
>      int i;
> =20
> @@ -5224,8 +5214,7 @@ static char *x86_cpuid_get_model_id(Object *obj, Er=
ror **errp)
>  static void x86_cpuid_set_model_id(Object *obj, const char *model_id,
>                                     Error **errp)
>  {
> -    X86CPU *cpu =3D X86_CPU(obj);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(CPU(obj));
>      int c, len, i;
> =20
>      if (model_id =3D=3D NULL) {
> @@ -7673,8 +7662,7 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
> =20
>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>  #if !defined(CONFIG_USER_ONLY)
>      if (interrupt_request & CPU_INTERRUPT_POLL) {
> @@ -7722,8 +7710,7 @@ static bool x86_cpu_has_work(CPUState *cs)
> =20
>  static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      info->mach =3D (env->hflags & HF_CS64_MASK ? bfd_mach_x86_64
>                    : env->hflags & HF_CS32_MASK ? bfd_mach_i386_i386
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 2070dd0dda..4c11ef70f0 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -230,8 +230,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t ne=
w_cr4)
>  hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>                                           MemTxAttrs *attrs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      target_ulong pde_addr, pte_addr;
>      uint64_t pte;
>      int32_t a20_mask;
> @@ -373,8 +372,7 @@ static void emit_guest_memory_failure(MemoryFailureAc=
tion action, bool ar,
>  static void do_inject_x86_mce(CPUState *cs, run_on_cpu_data data)
>  {
>      MCEInjectionParams *params =3D data.host_ptr;
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *cenv =3D &cpu->env;
> +    CPUX86State *cenv =3D cpu_env(cs);
>      uint64_t *banks =3D cenv->mce_banks + 4 * params->bank;
>      g_autofree char *msg =3D NULL;
>      bool need_reset =3D false;
> @@ -625,9 +623,7 @@ void cpu_load_efer(CPUX86State *env, uint64_t val)
> =20
>  uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      return address_space_ldub(as, addr, attrs, NULL);
> @@ -635,9 +631,7 @@ uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
> =20
>  uint32_t x86_lduw_phys(CPUState *cs, hwaddr addr)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      return address_space_lduw(as, addr, attrs, NULL);
> @@ -645,9 +639,7 @@ uint32_t x86_lduw_phys(CPUState *cs, hwaddr addr)
> =20
>  uint32_t x86_ldl_phys(CPUState *cs, hwaddr addr)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      return address_space_ldl(as, addr, attrs, NULL);
> @@ -655,9 +647,7 @@ uint32_t x86_ldl_phys(CPUState *cs, hwaddr addr)
> =20
>  uint64_t x86_ldq_phys(CPUState *cs, hwaddr addr)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      return address_space_ldq(as, addr, attrs, NULL);
> @@ -665,9 +655,7 @@ uint64_t x86_ldq_phys(CPUState *cs, hwaddr addr)
> =20
>  void x86_stb_phys(CPUState *cs, hwaddr addr, uint8_t val)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      address_space_stb(as, addr, val, attrs, NULL);
> @@ -675,9 +663,7 @@ void x86_stb_phys(CPUState *cs, hwaddr addr, uint8_t =
val)
> =20
>  void x86_stl_phys_notdirty(CPUState *cs, hwaddr addr, uint32_t val)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      address_space_stl_notdirty(as, addr, val, attrs, NULL);
> @@ -685,9 +671,7 @@ void x86_stl_phys_notdirty(CPUState *cs, hwaddr addr,=
 uint32_t val)
> =20
>  void x86_stw_phys(CPUState *cs, hwaddr addr, uint32_t val)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      address_space_stw(as, addr, val, attrs, NULL);
> @@ -695,9 +679,7 @@ void x86_stw_phys(CPUState *cs, hwaddr addr, uint32_t=
 val)
> =20
>  void x86_stl_phys(CPUState *cs, hwaddr addr, uint32_t val)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      address_space_stl(as, addr, val, attrs, NULL);
> @@ -705,9 +687,7 @@ void x86_stl_phys(CPUState *cs, hwaddr addr, uint32_t=
 val)
> =20
>  void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D cpu_get_mem_attrs(env);
> +    MemTxAttrs attrs =3D cpu_get_mem_attrs(cpu_env(cs));
>      AddressSpace *as =3D cpu_addressspace(cs, attrs);
> =20
>      address_space_stq(as, addr, val, attrs, NULL);
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 11ffdd4c69..772578e3f4 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -159,10 +159,7 @@ static bool ept_emulation_fault(hvf_slot *slot, uint=
64_t gpa, uint64_t ept_qual)
> =20
>  void hvf_arch_vcpu_destroy(CPUState *cpu)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> -
> -    g_free(env->hvf_mmio_buf);
> +    g_free(cpu_env(cpu)->hvf_mmio_buf);
>  }
> =20
>  static void init_tsc_freq(CPUX86State *env)
> @@ -313,8 +310,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> =20
>  static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t i=
dtvec_info)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> +    CPUX86State *env =3D cpu_env(cpu);
> =20
>      env->exception_nr =3D -1;
>      env->exception_pending =3D 0;
> diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
> index 80e36136d0..932635232b 100644
> --- a/target/i386/hvf/x86.c
> +++ b/target/i386/hvf/x86.c
> @@ -128,9 +128,7 @@ bool x86_is_real(CPUState *cpu)
> =20
>  bool x86_is_v8086(CPUState *cpu)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> -    return x86_is_protected(cpu) && (env->eflags & VM_MASK);
> +    return x86_is_protected(cpu) && (cpu_env(cpu)->eflags & VM_MASK);
>  }
> =20
>  bool x86_is_long_mode(CPUState *cpu)
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index 3a3f0a50d0..0d13b32f91 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -1419,8 +1419,7 @@ static void init_cmd_handler()
> =20
>  void load_regs(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      int i =3D 0;
>      RRX(env, R_EAX) =3D rreg(cs->accel->fd, HV_X86_RAX);
> @@ -1442,8 +1441,7 @@ void load_regs(CPUState *cs)
> =20
>  void store_regs(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      int i =3D 0;
>      wreg(cs->accel->fd, HV_X86_RAX, RAX(env));
> diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
> index f09bfbdda5..c173e9d883 100644
> --- a/target/i386/hvf/x86_task.c
> +++ b/target/i386/hvf/x86_task.c
> @@ -33,8 +33,7 @@
>  // TODO: taskswitch handling
>  static void save_state_to_tss32(CPUState *cpu, struct x86_tss_segment32 =
*tss)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> +    CPUX86State *env =3D cpu_env(cpu);
> =20
>      /* CR3 and ldt selector are not saved intentionally */
>      tss->eip =3D (uint32_t)env->eip;
> @@ -58,8 +57,7 @@ static void save_state_to_tss32(CPUState *cpu, struct x=
86_tss_segment32 *tss)
> =20
>  static void load_state_from_tss32(CPUState *cpu, struct x86_tss_segment3=
2 *tss)
>  {
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> +    CPUX86State *env =3D cpu_env(cpu);
> =20
>      wvmcs(cpu->accel->fd, VMCS_GUEST_CR3, tss->cr3);
> =20
> @@ -128,9 +126,7 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segmen=
t_selector tss_sel, int rea
>      uint32_t desc_limit;
>      struct x86_call_gate task_gate_desc;
>      struct vmx_segment vmx_seg;
> -
> -    X86CPU *x86_cpu =3D X86_CPU(cpu);
> -    CPUX86State *env =3D &x86_cpu->env;
> +    CPUX86State *env =3D cpu_env(cpu);
> =20
>      x86_read_segment_descriptor(cpu, &next_tss_desc, tss_sel);
>      x86_read_segment_descriptor(cpu, &curr_tss_desc, old_tss_sel);
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index be2c46246e..10f79849b3 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -238,8 +238,7 @@ void hvf_get_msrs(CPUState *cs)
> =20
>  int hvf_put_registers(CPUState *cs)
>  {
> -    X86CPU *x86cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &x86cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      wreg(cs->accel->fd, HV_X86_RAX, env->regs[R_EAX]);
>      wreg(cs->accel->fd, HV_X86_RBX, env->regs[R_EBX]);
> @@ -282,8 +281,7 @@ int hvf_put_registers(CPUState *cs)
> =20
>  int hvf_get_registers(CPUState *cs)
>  {
> -    X86CPU *x86cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &x86cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->regs[R_EAX] =3D rreg(cs->accel->fd, HV_X86_RAX);
>      env->regs[R_EBX] =3D rreg(cs->accel->fd, HV_X86_RBX);
> @@ -342,8 +340,7 @@ void vmx_clear_int_window_exiting(CPUState *cs)
> =20
>  bool hvf_inject_interrupts(CPUState *cs)
>  {
> -    X86CPU *x86cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &x86cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      uint8_t vector;
>      uint64_t intr_type;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 76a66246eb..e4f1c62888 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -754,8 +754,7 @@ static inline bool freq_within_bounds(int freq, int t=
arget_freq)
> =20
>  static int kvm_arch_set_tsc_khz(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      int r, cur_freq;
>      bool set_ioctl =3D false;
> =20
> @@ -5369,8 +5368,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_r=
un *run)
> =20
>  bool kvm_arch_stop_on_emulation_error(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      kvm_cpu_synchronize_state(cs);
>      return !(env->cr[0] & CR0_PE_MASK) ||
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index fc2c2321ac..10350a22d1 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -313,10 +313,7 @@ static int kvm_xen_set_vcpu_callback_vector(CPUState=
 *cs)
> =20
>  static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data da=
ta)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -
> -    env->xen_vcpu_callback_vector =3D data.host_int;
> +    cpu_env(cs)->xen_vcpu_callback_vector =3D data.host_int;
> =20
>      if (kvm_xen_has_cap(EVTCHN_SEND)) {
>          kvm_xen_set_vcpu_callback_vector(cs);
> @@ -325,8 +322,7 @@ static void do_set_vcpu_callback_vector(CPUState *cs,=
 run_on_cpu_data data)
> =20
>  static int set_vcpu_info(CPUState *cs, uint64_t gpa)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      MemoryRegionSection mrs =3D { .mr =3D NULL };
>      void *vcpu_info_hva =3D NULL;
>      int ret;
> @@ -362,8 +358,7 @@ static int set_vcpu_info(CPUState *cs, uint64_t gpa)
> =20
>  static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data d=
ata)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->xen_vcpu_info_default_gpa =3D data.host_ulong;
> =20
> @@ -375,8 +370,7 @@ static void do_set_vcpu_info_default_gpa(CPUState *cs=
, run_on_cpu_data data)
> =20
>  static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->xen_vcpu_info_gpa =3D data.host_ulong;
> =20
> @@ -479,8 +473,7 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcp=
u_id, int type)
>  /* Must always be called with xen_timers_lock held */
>  static int kvm_xen_set_vcpu_timer(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      struct kvm_xen_vcpu_attr va =3D {
>          .type =3D KVM_XEN_VCPU_ATTR_TYPE_TIMER,
> @@ -527,8 +520,7 @@ int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t =
virq, uint16_t port)
> =20
>  static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data=
)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->xen_vcpu_time_info_gpa =3D data.host_ulong;
> =20
> @@ -538,8 +530,7 @@ static void do_set_vcpu_time_info_gpa(CPUState *cs, r=
un_on_cpu_data data)
> =20
>  static void do_set_vcpu_runstate_gpa(CPUState *cs, run_on_cpu_data data)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->xen_vcpu_runstate_gpa =3D data.host_ulong;
> =20
> @@ -549,8 +540,7 @@ static void do_set_vcpu_runstate_gpa(CPUState *cs, ru=
n_on_cpu_data data)
> =20
>  static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->xen_vcpu_info_gpa =3D INVALID_GPA;
>      env->xen_vcpu_info_default_gpa =3D INVALID_GPA;
> @@ -1813,8 +1803,7 @@ uint16_t kvm_xen_get_evtchn_max_pirq(void)
> =20
>  int kvm_put_xen_state(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      uint64_t gpa;
>      int ret;
> =20
> @@ -1887,8 +1876,7 @@ int kvm_put_xen_state(CPUState *cs)
> =20
>  int kvm_get_xen_state(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      uint64_t gpa;
>      int ret;
> =20
> diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu=
/bpt_helper.c
> index 4d96a48a3c..90d6117497 100644
> --- a/target/i386/tcg/sysemu/bpt_helper.c
> +++ b/target/i386/tcg/sysemu/bpt_helper.c
> @@ -208,8 +208,7 @@ bool check_hw_breakpoints(CPUX86State *env, bool forc=
e_dr6_update)
> =20
>  void breakpoint_handler(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      if (cs->watchpoint_hit) {
>          if (cs->watchpoint_hit->flags & BP_CPU) {
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysem=
u/excp_helper.c
> index 5b86f439ad..1afa177551 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -639,6 +639,5 @@ G_NORETURN void x86_cpu_do_unaligned_access(CPUState =
*cs, vaddr vaddr,
>                                              MMUAccessType access_type,
>                                              int mmu_idx, uintptr_t retad=
dr)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    handle_unaligned_access(&cpu->env, vaddr, access_type, retaddr);
> +    handle_unaligned_access(cpu_env(cs), vaddr, access_type, retaddr);
>  }
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index e1405b7be9..8f8fd6529d 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -29,8 +29,7 @@
> =20
>  static void x86_cpu_exec_enter(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      CC_SRC =3D env->eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
>      env->df =3D 1 - (2 * ((env->eflags >> 10) & 1));
> @@ -40,8 +39,7 @@ static void x86_cpu_exec_enter(CPUState *cs)
> =20
>  static void x86_cpu_exec_exit(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      env->eflags =3D cpu_compute_eflags(env);
>  }
> @@ -65,8 +63,7 @@ static void x86_restore_state_to_opc(CPUState *cs,
>                                       const TranslationBlock *tb,
>                                       const uint64_t *data)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
>      int cc_op =3D data[1];
>      uint64_t new_pc;
> =20
> @@ -96,11 +93,8 @@ static void x86_restore_state_to_opc(CPUState *cs,
>  #ifndef CONFIG_USER_ONLY
>  static bool x86_debug_check_breakpoint(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -
>      /* RF disables all architectural breakpoints. */
> -    return !(env->eflags & RF_MASK);
> +    return !(cpu_env(cs)->eflags & RF_MASK);
>  }
>  #endif
> =20
> diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/ex=
cp_helper.c
> index b3bdb7831a..9ea5566149 100644
> --- a/target/i386/tcg/user/excp_helper.c
> +++ b/target/i386/tcg/user/excp_helper.c
> @@ -26,8 +26,7 @@ void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>                              MMUAccessType access_type,
>                              bool maperr, uintptr_t ra)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      /*
>       * The error_code that hw reports as part of the exception frame
> @@ -52,6 +51,5 @@ void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>  void x86_cpu_record_sigbus(CPUState *cs, vaddr addr,
>                             MMUAccessType access_type, uintptr_t ra)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    handle_unaligned_access(&cpu->env, addr, access_type, ra);
> +    handle_unaligned_access(cpu_env(cs), addr, access_type, ra);
>  }
> diff --git a/target/i386/tcg/user/seg_helper.c b/target/i386/tcg/user/seg=
_helper.c
> index c45f2ac2ba..2f89dbb51e 100644
> --- a/target/i386/tcg/user/seg_helper.c
> +++ b/target/i386/tcg/user/seg_helper.c
> @@ -78,8 +78,7 @@ static void do_interrupt_user(CPUX86State *env, int int=
no, int is_int,
> =20
>  void x86_cpu_do_interrupt(CPUState *cs)
>  {
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> +    CPUX86State *env =3D cpu_env(cs);
> =20
>      /* if user mode only, we simulate a fake exception
>         which will be handled outside the cpu execution


