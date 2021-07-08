Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007CE3C171D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 18:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153229.283090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1WwL-0007gc-AD; Thu, 08 Jul 2021 16:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153229.283090; Thu, 08 Jul 2021 16:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1WwL-0007em-6V; Thu, 08 Jul 2021 16:31:53 +0000
Received: by outflank-mailman (input) for mailman id 153229;
 Thu, 08 Jul 2021 16:31:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6RBA=MA=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m1WwJ-0007eg-Pe
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 16:31:51 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 508ce9f9-b69a-48e7-b915-3b5631caf8db;
 Thu, 08 Jul 2021 16:31:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id p24so3430646ljj.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jul 2021 09:31:49 -0700 (PDT)
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
X-Inumbo-ID: 508ce9f9-b69a-48e7-b915-3b5631caf8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KWmUfTnqkNlHdqJRREseSiCTtVrfIdoQtm/dHJKOlzE=;
        b=B5W5LVpMBA+M63ZPywCVhrRlC856xcDFAkNAg+Q3Dfn8xietPe97IAoYoszxSIHcpC
         ZBJUwfuBxkMuIZLHUzSvuTGOiP2moUBDk5sRWwpqlXPDdMNXoqQNJuuK7sd1vFY+Kjfm
         QEovmpBYoVwaqtp+AqclUKVoqvZ9mHXNmHtivFHGB6R3KLb8bepoekQukO9ydJSTWUuB
         ds/VpIsyr8rRWsxZ/1DGGLubJqWtk7afL+UVAMPFuVkRB0tnbktHZluDtm+kgQmEwpvG
         V8X/tvmgzydXIK8TBhfpk4h3ZO+s0WdD4JgMm5dwa43CdtMIGgPct4a6cEVUA8kX6WWR
         pJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KWmUfTnqkNlHdqJRREseSiCTtVrfIdoQtm/dHJKOlzE=;
        b=J/UuSdueHJRO9brBpJjr9iCXk48whI6FBb/L1S2Wj1Nf4yqHv7SUyFkY3NWAhKa0bg
         SNpCA2OJlWEXJFZxMTDMqlElqL8yp0+viZO1aM+G2NNnpdPOMz88Uy7khtu2owNfrJYo
         Aa05Kj3LLl5I1T+57qz/J96gZRbjV0MUasiol/KsOv8VpDkglDBGafMDu4bKV9+DooR8
         l4cQAG/5D7n0PeMIx2ehdIwywH7ATtX0zjyxBhfj8GVuk2OKaJl2d7vcsRUIggJfAjjW
         O0Qu1CC5iux1AnVoIL5jyOaT0NsHILpHpAHE3NSQtHjOcoMpZkRqUbyTRlR6mAbOeTVW
         W/iQ==
X-Gm-Message-State: AOAM5319RLNMnzIPcATz4a6hZ4gn27W9napm2esyayO1IC9Fjralm4pS
	PK8GQTcyvPZQ1JvoghY+52VwXWTAY7Bvah3fLwM=
X-Google-Smtp-Source: ABdhPJzcTZkp2zZUE6dyxTjzMiPS9P7Mt0ty0+CPn2C8h4jZAp7kqmW86w1HEM2IkOHkVZAl89nR5+kOgOsvvWxyIf8=
X-Received: by 2002:a05:651c:210:: with SMTP id y16mr9741000ljn.437.1625761908266;
 Thu, 08 Jul 2021 09:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210706100141.303960-1-pbonzini@redhat.com> <20210706100141.303960-37-pbonzini@redhat.com>
In-Reply-To: <20210706100141.303960-37-pbonzini@redhat.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Jul 2021 12:31:36 -0400
Message-ID: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 6:43 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Switch from QemuOpts to keyval.  This enables the introduction
> of non-scalar machine properties, and JSON syntax in the future.
>
> For JSON syntax to be supported right now, we would have to
> consider what would happen if string-based dictionaries (produced by
> -M key=val) were to be merged with strongly-typed dictionaries
> (produced by -M {'key': 123}).
>
> The simplest way out is to never enter the situation, and only allow one
> -M option when JSON syntax is in use.  However, we want options such as
> -smp to become syntactic sugar for -M, and this is a problem; as soon
> as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
> together with -smp.  Therefore, allowing JSON syntax right now for -M
> would be a forward-compatibility nightmare and it would be impossible
> anyway to introduce -M incrementally in tools.
>
> Instead, support for JSON syntax is delayed until after the main
> options are converted to QOM compound properties.  These include -boot,
> -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
> syntax is introduced, these options will _also_ be forbidden together
> with -M '{...}'.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 315 ++++++++++++++++++++++++---------------------------
>  1 file changed, 146 insertions(+), 169 deletions(-)

Xen's osstest bisector found this commit breaks starting a Xen vm:
https://lore.kernel.org/xen-devel/E1m1HlC-0005Ra-Ff@osstest.test-lab.xenproject.org/

qemu fails to start with:
Unexpected error in object_property_find_err() at
../qemu-xen-dir-remote/qom/object.c:1299:
qemu-system-i386: Property 'xenfv-3.1-machine.accel' not found

The Xen machines have `default_machine_opts =
"accel=xen,suppress-vmdesc=on"` which may be the problem?

Regards,
Jason


> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7dd2d72d0b..f848abd31a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -145,6 +145,8 @@ static const char *cpu_option;
>  static const char *mem_path;
>  static const char *incoming;
>  static const char *loadvm;
> +static const char *accelerators;
> +static QDict *machine_opts_dict;
>  static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
>  static ram_addr_t maxram_size;
>  static uint64_t ram_slots;
> @@ -235,21 +237,6 @@ static QemuOptsList qemu_option_rom_opts = {
>      },
>  };
>
> -static QemuOptsList qemu_machine_opts = {
> -    .name = "machine",
> -    .implied_opt_name = "type",
> -    .merge_lists = true,
> -    .head = QTAILQ_HEAD_INITIALIZER(qemu_machine_opts.head),
> -    .desc = {
> -        /*
> -         * no elements => accept any
> -         * sanity checking will happen later
> -         * when setting machine properties
> -         */
> -        { }
> -    },
> -};
> -
>  static QemuOptsList qemu_accel_opts = {
>      .name = "accel",
>      .implied_opt_name = "accel",
> @@ -498,16 +485,6 @@ static QemuOptsList qemu_action_opts = {
>      },
>  };
>
> -/**
> - * Get machine options
> - *
> - * Returns: machine options (never null).
> - */
> -static QemuOpts *qemu_get_machine_opts(void)
> -{
> -    return qemu_find_opts_singleton("machine");
> -}
> -
>  const char *qemu_get_vm_name(void)
>  {
>      return qemu_name;
> @@ -815,33 +792,6 @@ static MachineClass *find_default_machine(GSList *machines)
>      return default_machineclass;
>  }
>
> -static int machine_help_func(QemuOpts *opts, MachineState *machine)
> -{
> -    ObjectProperty *prop;
> -    ObjectPropertyIterator iter;
> -
> -    if (!qemu_opt_has_help_opt(opts)) {
> -        return 0;
> -    }
> -
> -    object_property_iter_init(&iter, OBJECT(machine));
> -    while ((prop = object_property_iter_next(&iter))) {
> -        if (!prop->set) {
> -            continue;
> -        }
> -
> -        printf("%s.%s=%s", MACHINE_GET_CLASS(machine)->name,
> -               prop->name, prop->type);
> -        if (prop->description) {
> -            printf(" (%s)\n", prop->description);
> -        } else {
> -            printf("\n");
> -        }
> -    }
> -
> -    return 1;
> -}
> -
>  static void version(void)
>  {
>      printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
> @@ -1554,33 +1504,31 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
>                    object_class_get_name(OBJECT_CLASS(mc1)));
>  }
>
> -static MachineClass *machine_parse(const char *name, GSList *machines)
> +static void machine_help_func(const QDict *qdict)
>  {
> -    MachineClass *mc;
> -    GSList *el;
> +    GSList *machines, *el;
> +    const char *type = qdict_get_try_str(qdict, "type");
>
> -    if (is_help_option(name)) {
> -        printf("Supported machines are:\n");
> -        machines = g_slist_sort(machines, machine_class_cmp);
> -        for (el = machines; el; el = el->next) {
> -            MachineClass *mc = el->data;
> -            if (mc->alias) {
> -                printf("%-20s %s (alias of %s)\n", mc->alias, mc->desc, mc->name);
> -            }
> -            printf("%-20s %s%s%s\n", mc->name, mc->desc,
> -                   mc->is_default ? " (default)" : "",
> -                   mc->deprecation_reason ? " (deprecated)" : "");
> +    machines = object_class_get_list(TYPE_MACHINE, false);
> +    if (type) {
> +        ObjectClass *machine_class = OBJECT_CLASS(find_machine(type, machines));
> +        if (machine_class) {
> +            type_print_class_properties(object_class_get_name(machine_class));
> +            return;
>          }
> -        exit(0);
>      }
>
> -    mc = find_machine(name, machines);
> -    if (!mc) {
> -        error_report("unsupported machine type");
> -        error_printf("Use -machine help to list supported machines\n");
> -        exit(1);
> +    printf("Supported machines are:\n");
> +    machines = g_slist_sort(machines, machine_class_cmp);
> +    for (el = machines; el; el = el->next) {
> +        MachineClass *mc = el->data;
> +        if (mc->alias) {
> +            printf("%-20s %s (alias of %s)\n", mc->alias, mc->desc, mc->name);
> +        }
> +        printf("%-20s %s%s%s\n", mc->name, mc->desc,
> +               mc->is_default ? " (default)" : "",
> +               mc->deprecation_reason ? " (deprecated)" : "");
>      }
> -    return mc;
>  }
>
>  static const char *pid_file;
> @@ -1633,32 +1581,31 @@ static const QEMUOption *lookup_opt(int argc, char **argv,
>      return popt;
>  }
>
> -static MachineClass *select_machine(void)
> +static MachineClass *select_machine(QDict *qdict, Error **errp)
>  {
> +    const char *optarg = qdict_get_try_str(qdict, "type");
>      GSList *machines = object_class_get_list(TYPE_MACHINE, false);
> -    MachineClass *machine_class = find_default_machine(machines);
> -    const char *optarg;
> -    QemuOpts *opts;
> -    Location loc;
> +    MachineClass *machine_class;
> +    Error *local_err = NULL;
>
> -    loc_push_none(&loc);
> -
> -    opts = qemu_get_machine_opts();
> -    qemu_opts_loc_restore(opts);
> -
> -    optarg = qemu_opt_get(opts, "type");
>      if (optarg) {
> -        machine_class = machine_parse(optarg, machines);
> +        machine_class = find_machine(optarg, machines);
> +        qdict_del(qdict, "type");
> +        if (!machine_class) {
> +            error_setg(&local_err, "unsupported machine type");
> +        }
> +    } else {
> +        machine_class = find_default_machine(machines);
> +        if (!machine_class) {
> +            error_setg(&local_err, "No machine specified, and there is no default");
> +        }
>      }
>
> -    if (!machine_class) {
> -        error_report("No machine specified, and there is no default");
> -        error_printf("Use -machine help to list supported machines\n");
> -        exit(1);
> -    }
> -
> -    loc_pop(&loc);
>      g_slist_free(machines);
> +    if (local_err) {
> +        error_append_hint(&local_err, "Use -machine help to list supported machines\n");
> +        error_propagate(errp, local_err);
> +    }
>      return machine_class;
>  }
>
> @@ -1677,42 +1624,70 @@ static int object_parse_property_opt(Object *obj,
>      return 0;
>  }
>
> -static int machine_set_property(void *opaque,
> -                                const char *name, const char *value,
> -                                Error **errp)
> +/* *Non*recursively replace underscores with dashes in QDict keys.  */
> +static void keyval_dashify(QDict *qdict, Error **errp)
>  {
> -    g_autofree char *qom_name = g_strdup(name);
> +    const QDictEntry *ent, *next;
>      char *p;
>
> -    for (p = qom_name; *p; p++) {
> -        if (*p == '_') {
> -            *p = '-';
> +    for (ent = qdict_first(qdict); ent; ent = next) {
> +        g_autofree char *new_key = NULL;
> +
> +        next = qdict_next(qdict, ent);
> +        if (!strchr(ent->key, '_')) {
> +            continue;
>          }
> +        new_key = g_strdup(ent->key);
> +        for (p = new_key; *p; p++) {
> +            if (*p == '_') {
> +                *p = '-';
> +            }
> +        }
> +        if (qdict_haskey(qdict, new_key)) {
> +            error_setg(errp, "Conflict between '%s' and '%s'", ent->key, new_key);
> +            return;
> +        }
> +        qobject_ref(ent->value);
> +        qdict_put_obj(qdict, new_key, ent->value);
> +        qdict_del(qdict, ent->key);
>      }
> +}
> +
> +static void qemu_apply_legacy_machine_options(QDict *qdict)
> +{
> +    const char *value;
> +
> +    keyval_dashify(qdict, &error_fatal);
>
>      /* Legacy options do not correspond to MachineState properties.  */
> -    if (g_str_equal(qom_name, "accel")) {
> -        return 0;
> -    }
> -    if (g_str_equal(qom_name, "igd-passthru")) {
> -        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value,
> -                                   false);
> -        return 0;
> -    }
> -    if (g_str_equal(qom_name, "kvm-shadow-mem")) {
> -        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value,
> -                                   false);
> -        return 0;
> -    }
> -    if (g_str_equal(qom_name, "kernel-irqchip")) {
> -        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value,
> -                                   false);
> -        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), qom_name, value,
> -                                   false);
> -        return 0;
> +    value = qdict_get_try_str(qdict, "accel");
> +    if (value) {
> +        accelerators = g_strdup(value);
> +        qdict_del(qdict, "accel");
>      }
>
> -    return object_parse_property_opt(opaque, name, value, "type", errp);
> +    value = qdict_get_try_str(qdict, "igd-passthru");
> +    if (value) {
> +        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), "igd-passthru", value,
> +                                   false);
> +        qdict_del(qdict, "igd-passthru");
> +    }
> +
> +    value = qdict_get_try_str(qdict, "kvm-shadow-mem");
> +    if (value) {
> +        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kvm-shadow-mem", value,
> +                                   false);
> +        qdict_del(qdict, "kvm-shadow-mem");
> +    }
> +
> +    value = qdict_get_try_str(qdict, "kernel-irqchip");
> +    if (value) {
> +        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kernel-irqchip", value,
> +                                   false);
> +        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), "kernel-irqchip", value,
> +                                   false);
> +        qdict_del(qdict, "kernel-irqchip");
> +    }
>  }
>
>  static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
> @@ -1827,16 +1802,14 @@ static bool object_create_early(const char *type)
>      return true;
>  }
>
> -static void qemu_apply_machine_options(void)
> +static void qemu_apply_machine_options(QDict *qdict)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
> -    QemuOpts *machine_opts = qemu_get_machine_opts();
>      const char *boot_order = NULL;
>      const char *boot_once = NULL;
>      QemuOpts *opts;
>
> -    qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
> -                     &error_fatal);
> +    object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
>      current_machine->ram_size = ram_size;
>      current_machine->maxram_size = maxram_size;
>      current_machine->ram_slots = ram_slots;
> @@ -1865,10 +1838,8 @@ static void qemu_apply_machine_options(void)
>      current_machine->boot_once = boot_once;
>
>      if (semihosting_enabled() && !semihosting_get_argc()) {
> -        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
> -        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append") ?: "";
>          /* fall back to the -kernel/-append */
> -        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
> +        semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
>      }
>  }
>
> @@ -1924,8 +1895,7 @@ static void qemu_create_early_backends(void)
>
>      /*
>       * Note: we need to create audio and block backends before
> -     * machine_set_property(), so machine properties can refer to
> -     * them.
> +     * setting machine properties, so they can be referred to.
>       */
>      configure_blockdev(&bdo_queue, machine_class, snapshot);
>      audio_init_audiodevs();
> @@ -2091,16 +2061,14 @@ static void set_memory_options(MachineClass *mc)
>      loc_pop(&loc);
>  }
>
> -static void qemu_create_machine(MachineClass *machine_class)
> +static void qemu_create_machine(QDict *qdict)
>  {
> +    MachineClass *machine_class = select_machine(qdict, &error_fatal);
>      object_set_machine_compat_props(machine_class->compat_props);
>
>      set_memory_options(machine_class);
>
>      current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
> -    if (machine_help_func(qemu_get_machine_opts(), current_machine)) {
> -        exit(0);
> -    }
>      object_property_add_child(object_get_root(), "machine",
>                                OBJECT(current_machine));
>      object_property_add_child(container_get(OBJECT(current_machine),
> @@ -2131,8 +2099,12 @@ static void qemu_create_machine(MachineClass *machine_class)
>       * specified either by the configuration file or by the command line.
>       */
>      if (machine_class->default_machine_opts) {
> -        qemu_opts_set_defaults(qemu_find_opts("machine"),
> -                               machine_class->default_machine_opts, 0);
> +        QDict *default_opts =
> +            keyval_parse(machine_class->default_machine_opts, NULL, NULL,
> +                         &error_abort);
> +        object_set_properties_from_keyval(OBJECT(current_machine), default_opts,
> +                                          false, &error_abort);
> +        qobject_unref(default_opts);
>      }
>  }
>
> @@ -2154,7 +2126,8 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
>   */
>  static bool is_qemuopts_group(const char *group)
>  {
> -    if (g_str_equal(group, "object")) {
> +    if (g_str_equal(group, "object") ||
> +        g_str_equal(group, "machine")) {
>          return false;
>      }
>      return true;
> @@ -2167,6 +2140,13 @@ static void qemu_record_config_group(const char *group, QDict *dict,
>          Visitor *v = qobject_input_visitor_new_keyval(QOBJECT(dict));
>          object_option_add_visitor(v);
>          visit_free(v);
> +    } else if (g_str_equal(group, "machine")) {
> +        /*
> +         * Cannot merge string-valued and type-safe dictionaries, so JSON
> +         * is not accepted yet for -M.
> +         */
> +        assert(!from_json);
> +        keyval_merge(machine_opts_dict, dict, errp);
>      } else {
>          abort();
>      }
> @@ -2297,13 +2277,11 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
>
>  static void configure_accelerators(const char *progname)
>  {
> -    const char *accelerators;
>      bool init_failed = false;
>
>      qemu_opts_foreach(qemu_find_opts("icount"),
>                        do_configure_icount, NULL, &error_fatal);
>
> -    accelerators = qemu_opt_get(qemu_get_machine_opts(), "accel");
>      if (QTAILQ_EMPTY(&qemu_accel_opts.head)) {
>          char **accel_list, **tmp;
>
> @@ -2391,12 +2369,11 @@ static void create_default_memdev(MachineState *ms, const char *path)
>                              &error_fatal);
>  }
>
> -static void qemu_validate_options(void)
> +static void qemu_validate_options(const QDict *machine_opts)
>  {
> -    QemuOpts *machine_opts = qemu_get_machine_opts();
> -    const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
> -    const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
> -    const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
> +    const char *kernel_filename = qdict_get_try_str(machine_opts, "kernel");
> +    const char *initrd_filename = qdict_get_try_str(machine_opts, "initrd");
> +    const char *kernel_cmdline = qdict_get_try_str(machine_opts, "append");
>
>      if (kernel_filename == NULL) {
>           if (kernel_cmdline != NULL) {
> @@ -2736,7 +2713,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_add_opts(&qemu_trace_opts);
>      qemu_plugin_add_opts();
>      qemu_add_opts(&qemu_option_rom_opts);
> -    qemu_add_opts(&qemu_machine_opts);
>      qemu_add_opts(&qemu_accel_opts);
>      qemu_add_opts(&qemu_mem_opts);
>      qemu_add_opts(&qemu_smp_opts);
> @@ -2777,6 +2753,7 @@ void qemu_init(int argc, char **argv, char **envp)
>          }
>      }
>
> +    machine_opts_dict = qdict_new();
>      if (userconfig) {
>          qemu_read_default_config_file(&error_fatal);
>      }
> @@ -2866,8 +2843,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  parse_display(optarg);
>                  break;
>              case QEMU_OPTION_nographic:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "graphics=off", false);
> +                qdict_put_str(machine_opts_dict, "graphics", "off");
>                  nographic = true;
>                  dpy.type = DISPLAY_TYPE_NONE;
>                  break;
> @@ -2891,16 +2867,16 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  break;
>              case QEMU_OPTION_kernel:
> -                qemu_opts_set(qemu_find_opts("machine"), "kernel", optarg, &error_abort);
> +                qdict_put_str(machine_opts_dict, "kernel", optarg);
>                  break;
>              case QEMU_OPTION_initrd:
> -                qemu_opts_set(qemu_find_opts("machine"), "initrd", optarg, &error_abort);
> +                qdict_put_str(machine_opts_dict, "initrd", optarg);
>                  break;
>              case QEMU_OPTION_append:
> -                qemu_opts_set(qemu_find_opts("machine"), "append", optarg, &error_abort);
> +                qdict_put_str(machine_opts_dict, "append", optarg);
>                  break;
>              case QEMU_OPTION_dtb:
> -                qemu_opts_set(qemu_find_opts("machine"), "dtb", optarg, &error_abort);
> +                qdict_put_str(machine_opts_dict, "dtb", optarg);
>                  break;
>              case QEMU_OPTION_cdrom:
>                  drive_add(IF_DEFAULT, 2, optarg, CDROM_OPTS);
> @@ -3010,7 +2986,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  break;
>              case QEMU_OPTION_bios:
> -                qemu_opts_set(qemu_find_opts("machine"), "firmware", optarg, &error_abort);
> +                qdict_put_str(machine_opts_dict, "firmware", optarg);
>                  break;
>              case QEMU_OPTION_singlestep:
>                  singlestep = 1;
> @@ -3281,17 +3257,20 @@ void qemu_init(int argc, char **argv, char **envp)
>                  preconfig_requested = true;
>                  break;
>              case QEMU_OPTION_enable_kvm:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "accel=kvm", false);
> +                qdict_put_str(machine_opts_dict, "accel", "kvm");
>                  break;
>              case QEMU_OPTION_M:
>              case QEMU_OPTION_machine:
> -                olist = qemu_find_opts("machine");
> -                opts = qemu_opts_parse_noisily(olist, optarg, true);
> -                if (!opts) {
> -                    exit(1);
> +                {
> +                    bool help;
> +
> +                    keyval_parse_into(machine_opts_dict, optarg, "type", &help, &error_fatal);
> +                    if (help) {
> +                        machine_help_func(machine_opts_dict);
> +                        exit(EXIT_SUCCESS);
> +                    }
> +                    break;
>                  }
> -                break;
>              case QEMU_OPTION_accel:
>                  accel_opts = qemu_opts_parse_noisily(qemu_find_opts("accel"),
>                                                       optarg, true);
> @@ -3318,12 +3297,10 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  break;
>              case QEMU_OPTION_usb:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "usb=on", false);
> +                qdict_put_str(machine_opts_dict, "usb", "on");
>                  break;
>              case QEMU_OPTION_usbdevice:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "usb=on", false);
> +                qdict_put_str(machine_opts_dict, "usb", "on");
>                  add_device_config(DEV_USB, optarg);
>                  break;
>              case QEMU_OPTION_device:
> @@ -3342,12 +3319,10 @@ void qemu_init(int argc, char **argv, char **envp)
>                  vnc_parse(optarg);
>                  break;
>              case QEMU_OPTION_no_acpi:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "acpi=off", false);
> +                qdict_put_str(machine_opts_dict, "acpi", "off");
>                  break;
>              case QEMU_OPTION_no_hpet:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "hpet=off", false);
> +                qdict_put_str(machine_opts_dict, "hpet", "off");
>                  break;
>              case QEMU_OPTION_no_reboot:
>                  olist = qemu_find_opts("action");
> @@ -3600,7 +3575,7 @@ void qemu_init(int argc, char **argv, char **envp)
>       */
>      loc_set_none();
>
> -    qemu_validate_options();
> +    qemu_validate_options(machine_opts_dict);
>      qemu_process_sugar_options();
>
>      /*
> @@ -3633,7 +3608,7 @@ void qemu_init(int argc, char **argv, char **envp)
>
>      configure_rtc(qemu_find_opts_singleton("rtc"));
>
> -    qemu_create_machine(select_machine());
> +    qemu_create_machine(machine_opts_dict);
>
>      suspend_mux_open();
>
> @@ -3641,12 +3616,14 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_create_default_devices();
>      qemu_create_early_backends();
>
> -    qemu_apply_machine_options();
> +    qemu_apply_legacy_machine_options(machine_opts_dict);
> +    qemu_apply_machine_options(machine_opts_dict);
> +    qobject_unref(machine_opts_dict);
>      phase_advance(PHASE_MACHINE_CREATED);
>
>      /*
>       * Note: uses machine properties such as kernel-irqchip, must run
> -     * after machine_set_property().
> +     * after qemu_apply_machine_options.
>       */
>      configure_accelerators(argv[0]);
>      phase_advance(PHASE_ACCEL_CREATED);
> --
> 2.31.1
>
>
>

