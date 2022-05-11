Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0BF523D2F
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 21:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327214.549976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nork3-0008Ec-N0; Wed, 11 May 2022 19:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327214.549976; Wed, 11 May 2022 19:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nork3-0008By-Jh; Wed, 11 May 2022 19:11:23 +0000
Received: by outflank-mailman (input) for mailman id 327214;
 Wed, 11 May 2022 19:11:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nork2-0008Bs-1y
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 19:11:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nork1-0005jR-0J; Wed, 11 May 2022 19:11:21 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nork0-0000D1-LS; Wed, 11 May 2022 19:11:20 +0000
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
	bh=04Q/AoO5d+dRR2uR5jQMdAo53AUpbXkcMlcA+4zr+EQ=; b=UeAo5kDxz03ayAU49H2STUezkn
	VEUPn21JgG9EsPLxNjMQ50137NDAzw1hEME8PE/5+x7U6n8t8lB73MXhMRk4Hff5x6pFjirAp8OVE
	Yx7Rq8xR2jJKPkVUcuAux5PbBIULkRn4Ir9JUlWfxLEiI4B7e83TFhMFqmpjH+yHchDc=;
Message-ID: <fb9aefed-ef4b-c26e-9ff0-1eb59e7d215c@xen.org>
Date: Wed, 11 May 2022 20:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 6/7] tools: add example application to initialize
 dom0less PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-6-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220505001656.395419-6-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/05/2022 01:16, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add an example application that can be run in dom0 to complete the
> dom0less domains initialization so that they can get access to xenstore
> and use PV drivers.
> 
> The application sets "connection" to XENSTORE_RECONNECT on the xenstore
> page before calling xs_introduce_domain to signal that the connection is
> not ready yet to be used. XENSTORE_RECONNECT is reset soon after by
> xenstored.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> ---
> Changes in v6:
> - include xs_wire.h and use its definitions
> 
> Changes in v5:
> - set XS_CONNECTION_STATE_RECONNECTING before xs_introduce_domain
> 
> Changes in v4:
> - only alloc xs page (no other magic pages)
> - add xenstore permissions
> - check all return values
> - rename restore_xenstore to create_xenstore
> - set target_memkb
> - set start_time properly
> - close xs transaction on error
> - call xc_dom_gnttab_seed instead of xc_dom_gnttab_init
> - xs_open instead of xs_daemon_open
> 
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
> 
> connection reconnecting
> ---
>   tools/helpers/Makefile        |  13 ++
>   tools/helpers/init-dom0less.c | 340 ++++++++++++++++++++++++++++++++++
>   2 files changed, 353 insertions(+)
>   create mode 100644 tools/helpers/init-dom0less.c
> 
> diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
> index 7f6c422440..8d78ab1e90 100644
> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -10,6 +10,9 @@ ifeq ($(CONFIG_Linux),y)
>   ifeq ($(CONFIG_X86),y)
>   PROGS += init-xenstore-domain
>   endif
> +ifeq ($(CONFIG_ARM),y)
> +PROGS += init-dom0less
> +endif
>   endif
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
> +	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest) $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
> +
>   .PHONY: install
>   install: all
>   	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> new file mode 100644
> index 0000000000..bfd5ff0761
> --- /dev/null
> +++ b/tools/helpers/init-dom0less.c
> @@ -0,0 +1,340 @@
> +#include <stdbool.h>
> +#include <syslog.h>
> +#include <stdio.h>
> +#include <err.h>
> +#include <stdlib.h>
> +#include <sys/time.h>
> +#include <xenstore.h>
> +#include <xenctrl.h>
> +#include <xenguest.h>
> +#include <libxl.h>
> +#include <xenevtchn.h>
> +#include <xenforeignmemory.h>
> +#include <xen/io/xs_wire.h>
> +
> +#include "init-dom-json.h"
> +
> +#define XENSTORE_PFN_OFFSET 1
> +#define STR_MAX_LENGTH 64
> +
> +static int alloc_xs_page(struct xc_interface_core *xch,
> +                         libxl_dominfo *info,
> +                         uint64_t *xenstore_pfn)
> +{
> +    int rc;
> +    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> +    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
> +
> +    rc = xc_domain_setmaxmem(xch, info->domid,
> +                             info->max_memkb + (XC_PAGE_SIZE/1024));
> +    if (rc < 0)
> +        return rc;
> +
> +    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
> +    if (rc < 0)
> +        return rc;
> +
> +    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
> +    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
> +    if (rc < 0)
> +        return rc;
> +
> +    return 0;
> +}
> +
> +static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> +                            domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +    struct xs_permissions perms[2];
> +
> +    perms[0].id = domid;
> +    perms[0].perms = XS_PERM_NONE;
> +    perms[1].id = 0;
> +    perms[1].perms = XS_PERM_READ;
> +
> +    if (snprintf(full_path, STR_MAX_LENGTH,
> +                 "/local/domain/%u/%s", domid, path) < 0)
> +        return false;
> +    if (!xs_write(xsh, t, full_path, val, strlen(val)))
> +        return false;
> +    return xs_set_permissions(xsh, t, full_path, perms, 2);
> +}
> +
> +static bool do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
> +                              domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    if (snprintf(full_path, STR_MAX_LENGTH,
> +                 "/libxl/%u/%s", domid, path) < 0)
> +        return false;
> +    return xs_write(xsh, t, full_path, val, strlen(val));
> +}
> +
> +static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
> +                           libxl_uuid uuid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    if (snprintf(full_path, STR_MAX_LENGTH,
> +                 "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path) < 0)
> +        return false;
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
> +static int create_xenstore(struct xs_handle *xsh,
> +                           libxl_dominfo *info, libxl_uuid uuid,
> +                           evtchn_port_t xenstore_port)
> +{
> +    domid_t domid;
> +    unsigned int i;
> +    char uuid_str[STR_MAX_LENGTH];
> +    char dom_name_str[STR_MAX_LENGTH];
> +    char vm_val_str[STR_MAX_LENGTH];
> +    char id_str[STR_MAX_LENGTH];
> +    char max_memkb_str[STR_MAX_LENGTH];
> +    char target_memkb_str[STR_MAX_LENGTH];
> +    char cpu_str[STR_MAX_LENGTH];
> +    char xenstore_port_str[STR_MAX_LENGTH];
> +    char ring_ref_str[STR_MAX_LENGTH];
> +    xs_transaction_t t;
> +    struct timeval start_time;
> +    char start_time_str[STR_MAX_LENGTH];
> +    int rc;
> +
> +    if (gettimeofday(&start_time, NULL) < 0)
> +        return -errno;
> +    rc = snprintf(start_time_str, STR_MAX_LENGTH, "%jd.%02d",
> +            (intmax_t)start_time.tv_sec, (int)start_time.tv_usec / 10000);
> +    if (rc < 0)
> +        return rc;
> +
> +    domid = info->domid;
> +    rc = snprintf(id_str, STR_MAX_LENGTH, "%u", domid);
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%u", domid);
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(vm_val_str, STR_MAX_LENGTH,
> +                  "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%lu", info->current_memkb);
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
> +                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
> +    if (rc < 0)
> +        return rc;
> +    rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
> +    if (rc < 0)
> +        return rc;
> +
> +retry_transaction:
> +    t = xs_transaction_start(xsh);
> +    if (t == XBT_NULL)
> +        return -errno;
> +
> +    rc = -EIO;
> +    /* /vm */
> +    if (!do_xs_write_vm(xsh, t, uuid, "name", dom_name_str)) goto err;
> +    if (!do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str)) goto err;
> +    if (!do_xs_write_vm(xsh, t, uuid, "start_time", start_time_str)) goto err;
> +
> +    /* /domain */
> +    if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
> +    for (i = 0; i < info->vcpu_max_id; i++) {
> +        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
> +        if (rc < 0)
> +            goto err;
> +        rc = -EIO;
> +        if (!do_xs_write_dom(xsh, t, domid, cpu_str,
> +                             (info->cpupool & (1 << i)) ? "online" : "offline"))
> +            goto err;
> +    }
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "memory", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "memory/static-max", max_memkb_str)) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "memory/target", target_memkb_str)) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1")) goto err;
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "device", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "device/suspend", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel", "")) goto err;
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "control", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/shutdown", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-suspend", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/sysrq", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/platform-feature-multiprocessor-suspend", "1")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "control/platform-feature-xs_reset_watches", "1")) goto err;
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "domid", id_str)) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "data", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "drivers", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "feature", "")) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "attr", "")) goto err;
> +
> +    if (!do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str)) goto err;
> +    if (!do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str)) goto err;
> +
> +    if (!do_xs_write_libxl(xsh, t, domid, "type", "pvh")) goto err;
> +    if (!do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen")) goto err;
> +
> +    if (!xs_transaction_end(xsh, t, false)) {
> +        if (errno == EAGAIN)
> +            goto retry_transaction;
> +        else
> +            return -errno;
> +    }
> +
> +    return 0;
> +
> +err:
> +    xs_transaction_end(xsh, t, true);
> +    return rc;
> +}
> +
> +static int init_domain(struct xs_handle *xsh,
> +                       struct xc_interface_core *xch,
> +                       xenforeignmemory_handle *xfh,
> +                       libxl_dominfo *info)
> +{
> +    libxl_uuid uuid;
> +    uint64_t xenstore_evtchn, xenstore_pfn;
> +    int rc;
> +    struct xenstore_domain_interface *intf;
> +
> +    printf("Init dom0less domain: %u\n", info->domid);
> +
> +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
> +                          &xenstore_evtchn);
> +    if (rc != 0) {
> +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> +        return 1;
> +    }
> +
> +    /* Alloc xenstore page */
> +    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
> +        printf("Error on alloc magic pages\n");
> +        return 1;
> +    }
> +
> +    intf = xenforeignmemory_map(xfh, info->domid, XS_READ | XS_WRITE, 1,
> +                                &xenstore_pfn, NULL);
> +    if (!intf) {
> +        printf("Error mapping xenstore page\n");
> +        return 1;
> +    }
> +    intf->connection = XENSTORE_RECONNECT;
> +    xenforeignmemory_unmap(xfh, intf, 1);
> +
> +    rc = xc_dom_gnttab_seed(xch, info->domid, true,
> +                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> +    if (rc)
> +        err(1, "xc_dom_gnttab_seed");
> +
> +    libxl_uuid_generate(&uuid);
> +    xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
> +
> +    rc = gen_stub_json_config(info->domid, &uuid);
> +    if (rc)
> +        err(1, "gen_stub_json_config");
> +
> +    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
> +    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
> +                          xenstore_pfn);
> +    if (rc < 0)
> +        return rc;
> +
> +    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
> +    if (rc)
> +        err(1, "writing to xenstore");
> +
> +    rc = xs_introduce_domain(xsh, info->domid,
> +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
> +            xenstore_evtchn);

I might be missing something here. In an ealier version, I pointed out 
that xs_introduce_domain() would fail in the case the dom0less domain 
doesn't have "xen,enhanced".

AFAICT, you agreed that the (part?) of initialization should be skipped. 
But I don't see the change in the code. Regarding the placement, we 
could either fully skip init_domain() or just xs_introduce_domain(). The 
latter might be better so all the domains are listed using xenstore-ls.

So something like below should work:

if ( xenstore_evtchn )
{
     rc = xs_introduce...();
     ...
}


Cheers,

-- 
Julien Grall

