Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0804A318E
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 20:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262309.454496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDtVt-0000wo-ON; Sat, 29 Jan 2022 19:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262309.454496; Sat, 29 Jan 2022 19:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDtVt-0000u0-L9; Sat, 29 Jan 2022 19:35:57 +0000
Received: by outflank-mailman (input) for mailman id 262309;
 Sat, 29 Jan 2022 19:35:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDtVs-0000tu-82
 for xen-devel@lists.xenproject.org; Sat, 29 Jan 2022 19:35:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDtVq-0000Qk-If; Sat, 29 Jan 2022 19:35:54 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.0.221]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDtVq-0002R3-4I; Sat, 29 Jan 2022 19:35:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=SUpACoatmumCflNy9goUAOvgBbJnKcKXhf6mIFUZ9JU=; b=Lvk0uV3GiWTH1miozh26rsZfuU
	3wBjJuDkofEGZG/oAOiwRc3flapQ1p5unoRapFzvpO/s9qafbxxGGfKPnf7AyeypN5SKf4SstGXpS
	zcjGzKTGwF4HbQ8j/ci3Vg9ew2sDs0baHWWeIyU+x8ZCKir7Ky2v4dDJPKaTSo2P9/3c=;
Message-ID: <395710eb-ba51-eb67-1519-2a949326f699@xen.org>
Date: Sat, 29 Jan 2022 19:35:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-5-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220128213307.2822078-5-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/01/2022 21:33, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add an example application that can be run in dom0 to complete the
> dom0less domains initialization so that they can get access to xenstore
> and use PV drivers.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> ---
> Changes in v3:
> - handle xenstore errors
> - add an in-code comment about xenstore entries
> - less verbose output
> - clean-up error path in main
> 
> Changes in v2:
> - do not set HVM_PARAM_STORE_EVTCHN twice
> - rename restore_xenstore to create_xenstore
> - increase maxmem
> ---
>   tools/helpers/Makefile        |  13 ++
>   tools/helpers/init-dom0less.c | 269 ++++++++++++++++++++++++++++++++++

Should we document how this is meant to be used?

>   2 files changed, 282 insertions(+)
>   create mode 100644 tools/helpers/init-dom0less.c
> 
> diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
> index 7f6c422440..8e42997052 100644
> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -10,6 +10,9 @@ ifeq ($(CONFIG_Linux),y)
>   ifeq ($(CONFIG_X86),y)
>   PROGS += init-xenstore-domain
>   endif
> +ifeq ($(CONFIG_ARM),y)
> +PROGS += init-dom0less
> +endif >   endif
>   
>   XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
> @@ -26,6 +29,13 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenstore)
>   $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
>   $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
>   
> +INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
> +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
> +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
> +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
> +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
> +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
> +
>   .PHONY: all
>   all: $(PROGS)
>   
> @@ -35,6 +45,9 @@ xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
>   init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
>   	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
>   
> +init-dom0less: $(INIT_DOM0LESS_OBJS)
> +	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest)  $(APPEND_LDFLAGS)
> +
>   .PHONY: install
>   install: all
>   	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> new file mode 100644
> index 0000000000..b6a3831cb5
> --- /dev/null
> +++ b/tools/helpers/init-dom0less.c
> @@ -0,0 +1,269 @@
> +#include <stdbool.h>
> +#include <syslog.h>
> +#include <stdio.h>
> +#include <err.h>
> +#include <stdlib.h>
> +#include <xenstore.h>
> +#include <xenctrl.h>
> +#include <xenguest.h>
> +#include <libxl.h>
> +#include <xenevtchn.h>
> +
> +#include "init-dom-json.h"
> +
> +#define NR_MAGIC_PAGES 4

Why are we allocating 4 pages when only 2 (maybe 1) is necessary?

> +#define CONSOLE_PFN_OFFSET 0
> +#define XENSTORE_PFN_OFFSET 1
> +#define STR_MAX_LENGTH 64
> +
> +static int alloc_magic_pages(libxl_dominfo *info, struct xc_dom_image *dom)
> +{
> +    int rc, i;
> +    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> +    xen_pfn_t p2m[NR_MAGIC_PAGES];
> +
> +    rc = xc_domain_setmaxmem(dom->xch, dom->guest_domid,
> +                             info->max_memkb + NR_MAGIC_PAGES * 4);

Please don't rely on the fact the page size will be 4KB in Xen. Instead, 
use XC_PAGE_*.

> +    if (rc < 0)
> +        return rc;
> +
> +    for (i = 0; i < NR_MAGIC_PAGES; i++)
> +        p2m[i] = base + i;
> +
> +    rc = xc_domain_populate_physmap_exact(dom->xch, dom->guest_domid,
> +                                          NR_MAGIC_PAGES, 0, 0, p2m);
> +    if (rc < 0)
> +        return rc;
> +
> +    dom->xenstore_pfn = base + XENSTORE_PFN_OFFSET;
> +
> +    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);

So you allocate 4 pages, use 2, but only clear 1. Can you explain why?

Also, should not you check the error return here and  ...

> +
> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
> +                     dom->xenstore_pfn);

here...?

Also, in theory, as soon as you set xc_hvm_param_set(), the guest may be 
able to start using Xenstore. So wouldn't it be better to set it once 
you know everything is in place (i.e. just before calling 
xs_introduce_domain())?

> +    return 0;
> +}
> +
> +static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> +                            domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/local/domain/%d/%s", domid, path);
> +    return xs_write(xsh, t, full_path, val, strlen(val));

 From my understanding, xs_write() will create a node that will only be 
readable/writable by the domain executing this binary (i.e. dom0). IOW, 
the guest will not see the nodes.

So shouldn't you also set the permissions?

> +}
> +
> +static bool do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
> +                              domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/libxl/%d/%s", domid, path);

Please use %u when you refer to unsigned value. Also, I think it would 
be a good practice to check the return value of snprintf(). This would 
avoid any future surprise of value truncated by mistake.

The same is valid for all the other use below.

> +    return xs_write(xsh, t, full_path, val, strlen(val));
> +}
> +
> +static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
> +                           libxl_uuid uuid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path);
> +    return xs_write(xsh, t, full_path, val, strlen(val));
> +}
> +
> +/*
> + * The xenstore nodes are the xenstore nodes libxl writes at domain
> + * creation.
> + *
> + * The list was retrieved by running xenstore-ls on a corresponding
> + * domain started by xl/libxl.
> + */
> +static int restore_xenstore(struct xs_handle *xsh,

As I wrote in v1, I think "restore" is misleading because the domain was 
never in Xenstore. So how about "create"? (Which BTW you agreed on back 
then).

> +                            libxl_dominfo *info, libxl_uuid uuid,
> +                            evtchn_port_t xenstore_port)
> +{
> +    domid_t domid;
> +    int i;

This is used as an iterator for a uint32_t value. So I think it should 
at least be unsigned int.

> +    char uuid_str[STR_MAX_LENGTH];
> +    char dom_name_str[STR_MAX_LENGTH];
> +    char vm_val_str[STR_MAX_LENGTH];
> +    char id_str[STR_MAX_LENGTH];
> +    char max_memkb_str[STR_MAX_LENGTH];
> +    char cpu_str[STR_MAX_LENGTH];
> +    char xenstore_port_str[STR_MAX_LENGTH];
> +    char ring_ref_str[STR_MAX_LENGTH];
> +    xs_transaction_t t;
> +
> +    domid = info->domid;
> +    snprintf(id_str, STR_MAX_LENGTH, "%d", domid);
> +    snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%d", domid);
> +    snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> +    snprintf(vm_val_str, STR_MAX_LENGTH,
> +             "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> +    snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
> +    snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
> +             (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
> +    snprintf(xenstore_port_str, STR_MAX_LENGTH, "%d", xenstore_port); > +
> +retry_transaction:
> +    t = xs_transaction_start(xsh);
> +    if (t == XBT_NULL)
> +        return -errno;
> +
> +    /* /vm */
> +    if (!do_xs_write_vm(xsh, t, uuid, "name", dom_name_str)) return -EIO;

You should terminate the transaction in case of an error.

> +    if (!do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str)) return -EIO;
> +    if (!do_xs_write_vm(xsh, t, uuid, "start_time", "0")) return -EIO;

Wouldn't it be better to create based on the time now?

> +
> +    /* /domain */
> +    if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) return -EIO;
> +    for (i = 0; i < info->vcpu_max_id; i++) {
> +        snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%d/availability/", i);
> +        if (!do_xs_write_dom(xsh, t, domid, cpu_str,
> +                             (info->cpupool & (1 << i)) ? "online" : "offline"))
> +            return -EIO;
> +    }
> +    if (!do_xs_write_dom(xsh, t, domid, "cpu/0", "")) return -EIO;

I am a bit confused. You created 0 above, so why do you need to create 
it here again?

> +    if (!do_xs_write_dom(xsh, t, domid, "cpu/availability", "online")) return -EIO;

I can't seem to find this node in xenstore and libxl.

> +
> +    if (!do_xs_write_dom(xsh, t, domid, "memory", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "memory/static-max", max_memkb_str)) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1")) return -EIO;

How about "memory/target"?

> +
> +    if (!do_xs_write_dom(xsh, t, domid, "device", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "device/suspend", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel", "")) return -EIO;
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "control", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/shutdown", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-suspend", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/sysrq", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/platform-feature-multiprocessor-suspend", "1")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "control", "platform-feature-xs_reset_watches")) return -EIO;

It sounds like this wants to be "control/platform-feature...". If this 
hasn't been done, I would diff the libxl version and your version to 
check if all are the same (names, values, permissions).

> +
> +    if (!do_xs_write_dom(xsh, t, domid, "domid", id_str)) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "data", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "drivers", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "feature", "")) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "attr", "")) return -EIO;
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str)) return -EIO;
> +    if (!do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str)) return -EIO;
> +
> +    if (!do_xs_write_libxl(xsh, t, domid, "type", "pvh")) return -EIO;
> +    if (!do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen")) return -EIO;
> +
> +    if (!xs_transaction_end(xsh, t, false))
> +        if (errno == EAGAIN)
> +            goto retry_transaction;
> +        else
> +            return -errno;
> +
> +    return 0;
> +}
> +
> +static int init_domain(struct xs_handle *xsh, libxl_dominfo *info)
> +{
> +    struct xc_dom_image dom;

I would initialize dom to 0 to avoid any undef behavior.

> +    libxl_uuid uuid;
> +    uint64_t v;
> +    int rc;
> +
> +    printf("Init dom0less domain: %d\n", info->domid);
> +    dom.guest_domid = info->domid;
> +    dom.xenstore_domid = 0;
> +    dom.xch = xc_interface_open(0, 0, 0);
> +
> +    rc = xc_hvm_param_get(dom.xch, info->domid, HVM_PARAM_STORE_EVTCHN, &v);
> +    if (rc != 0) {
> +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> +        return 1;
> +    }
> +    dom.xenstore_evtchn = v;
> +
> +    /* Console won't be initialized but set its data for completeness */
> +    dom.console_domid = 0;

I find a bit odd you set the domid but not the event channel, page. Can 
you explain?

Actually, can you explain why only half of the structure is initialized?

> +
> +    /* Alloc magic pages */
> +    if (alloc_magic_pages(info, &dom) != 0) {
> +        printf("Error on alloc magic pages\n");
> +        return 1;
> +    }
> +
> +    xc_dom_gnttab_init(&dom);

This call as the risk to break the guest if the dom0 Linux doesn't 
support the acquire interface. This is because it will punch a hole in 
the domain memory where the grant-table may have already been mapped.

Also, this function could fails.

> +
> +    libxl_uuid_generate(&uuid);
> +    xc_domain_sethandle(dom.xch, info->domid, libxl_uuid_bytearray(&uuid));
> +
> +    rc = gen_stub_json_config(info->domid, &uuid);
> +    if (rc)
> +        err(1, "gen_stub_json_config");
> +
> +    rc = restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
> +    if (rc)
> +        err(1, "writing to xenstore");
> +
> +    xs_introduce_domain(xsh, info->domid,
> +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
> +            dom.xenstore_evtchn);

xs_introduce_domain() can technically fails.

> +    return 0;
> +}
> +
> +/* Check if domain has been configured in XS */
> +static bool domain_exists(struct xs_handle *xsh, int domid)
> +{
> +    return xs_is_domain_introduced(xsh, domid);
> +}

Would not this lead to initialize a domain with PV driver disabled?

In addition to that, I think we should warn the users (maybe in some 
documentation) that this should not be called in parallel of scripts 
that may create new domain. Otherwise they may be picked up here as well...

> +
> +int main(int argc, char **argv)
> +{
> +    libxl_dominfo *info = NULL;
> +    libxl_ctx *ctx;
> +    int nb_vm = 0, rc = 0, i;
> +    struct xs_handle *xsh = NULL;
> +
> +    xsh = xs_daemon_open();

 From my understanding xs_daemon_open() is deprecated. Instead, you want 
to use xs_open(0).

However, libxl_ctx_alloc() is already opening a xenstore connection. So 
I think it would be better to rely on libxl and other the provided 
helpers (introduce new one if necessary) or just completely drop libxl 
from the equations.

> +    if (xsh == NULL) {
> +        fprintf(stderr, "Could not contact XenStore");
> +        rc = -errno;
> +        goto out;
> +    }
> +
> +    rc = libxl_ctx_alloc(&ctx, LIBXL_VERSION, 0, NULL);
> +    if (rc) {
> +        fprintf(stderr, "cannot init xl context\n");
> +        goto out;
> +    }
> +
> +    info = libxl_list_domain(ctx, &nb_vm);
> +    if (!info) {
> +        fprintf(stderr, "libxl_list_vm failed.\n");
> +        rc = -1;
> +        goto out;
> +    }
> +
> +    for (i = 0; i < nb_vm; i++) {
> +        domid_t domid = info[i].domid;
> +
> +        /* Don't need to check for Dom0 */
> +        if (!domid)
> +            continue;
> +
> +        printf("Checking domid: %u\n", domid);
> +        if (!domain_exists(xsh, domid))
> +            init_domain(xsh, &info[i]);

init_domain() could return an error. So shouldn't you check it?

If yes, then the question is whether you want to continue to handle the 
other domain or abort?

If the former, then what's the next steps if the domain is half 
initialized? So we try again?

> +        else
> +            printf("Domain %d has already been initialized\n", domid);
> +    }
> +out:
> +    libxl_dominfo_list_free(info, nb_vm);
> +    xs_close(xsh);
> +    return rc;
> +}

Cheers,

-- 
Julien Grall

