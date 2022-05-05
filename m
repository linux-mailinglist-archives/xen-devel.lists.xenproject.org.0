Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143751CA88
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 22:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322370.543642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmi1a-0000s3-Ae; Thu, 05 May 2022 20:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322370.543642; Thu, 05 May 2022 20:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmi1a-0000pH-7r; Thu, 05 May 2022 20:24:34 +0000
Received: by outflank-mailman (input) for mailman id 322370;
 Thu, 05 May 2022 20:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmi1Y-0000pB-Fz
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 20:24:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d80063f-ccb1-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 22:24:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4FAC61E85;
 Thu,  5 May 2022 20:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA354C385A8;
 Thu,  5 May 2022 20:24:26 +0000 (UTC)
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
X-Inumbo-ID: 5d80063f-ccb1-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651782268;
	bh=CBuzmjBh48/sYHsi2B6nLWpcttvPPlK7PxopTiAVXHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FY/VOdEhW9e/OtJmEWSqW7/7NemdbJ7o3QuEfZWR2DW+0ie6IlHSKxSQz6F/rrogM
	 dg9vZBCgmt99w9FFwkkRgj0czOPMkEfdbPR+4B3v+IuE112WTKtukvvR2QHeoEo5aU
	 u0d5iS7/D+7kklyX48wCKb6uEPEgw/CWsi+ddWys90VknMws5rqD7BX3+L/0yXndaw
	 O8MPOn4GjTuZFBNhSa16CHaN3vEE7guz9XIV5eRJnLo+Sl/WlNnWPFDfrtubEORTqy
	 2tlYUN671BLWWG6kpBIUxP+vFJ3SaFnxOqhhcOlB7uk4cm6l+162JFsKAYnsF9Atqc
	 NwVNFlI3LIZTQ==
Date: Thu, 5 May 2022 13:24:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 6/7] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <04d6f32d-56a9-f6b2-96d0-3087328769ae@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205051322050.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-6-sstabellini@kernel.org> <04d6f32d-56a9-f6b2-96d0-3087328769ae@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 May 2022, Juergen Gross wrote:
> On 05.05.22 02:16, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > Add an example application that can be run in dom0 to complete the
> > dom0less domains initialization so that they can get access to xenstore
> > and use PV drivers.
> > 
> > The application sets "connection" to XENSTORE_RECONNECT on the xenstore
> > page before calling xs_introduce_domain to signal that the connection is
> > not ready yet to be used. XENSTORE_RECONNECT is reset soon after by
> > xenstored.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: Wei Liu <wl@xen.org>
> > CC: Anthony PERARD <anthony.perard@citrix.com>
> > CC: Juergen Gross <jgross@suse.com>
> > ---
> > Changes in v6:
> > - include xs_wire.h and use its definitions
> > 
> > Changes in v5:
> > - set XS_CONNECTION_STATE_RECONNECTING before xs_introduce_domain
> > 
> > Changes in v4:
> > - only alloc xs page (no other magic pages)
> > - add xenstore permissions
> > - check all return values
> > - rename restore_xenstore to create_xenstore
> > - set target_memkb
> > - set start_time properly
> > - close xs transaction on error
> > - call xc_dom_gnttab_seed instead of xc_dom_gnttab_init
> > - xs_open instead of xs_daemon_open
> > 
> > Changes in v3:
> > - handle xenstore errors
> > - add an in-code comment about xenstore entries
> > - less verbose output
> > - clean-up error path in main
> > 
> > Changes in v2:
> > - do not set HVM_PARAM_STORE_EVTCHN twice
> > - rename restore_xenstore to create_xenstore
> > - increase maxmem
> > 
> > connection reconnecting
> > ---
> >   tools/helpers/Makefile        |  13 ++
> >   tools/helpers/init-dom0less.c | 340 ++++++++++++++++++++++++++++++++++
> >   2 files changed, 353 insertions(+)
> >   create mode 100644 tools/helpers/init-dom0less.c
> > 
> > diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
> > index 7f6c422440..8d78ab1e90 100644
> > --- a/tools/helpers/Makefile
> > +++ b/tools/helpers/Makefile
> > @@ -10,6 +10,9 @@ ifeq ($(CONFIG_Linux),y)
> >   ifeq ($(CONFIG_X86),y)
> >   PROGS += init-xenstore-domain
> >   endif
> > +ifeq ($(CONFIG_ARM),y)
> > +PROGS += init-dom0less
> > +endif
> >   endif
> >     XEN_INIT_DOM0_OBJS = xen-init-dom0.o init-dom-json.o
> > @@ -26,6 +29,13 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS +=
> > $(CFLAGS_libxenstore)
> >   $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
> >   $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include
> > $(XEN_ROOT)/tools/config.h
> >   +INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
> > +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
> > +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
> > +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
> > +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
> > +$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
> > +
> >   .PHONY: all
> >   all: $(PROGS)
> >   @@ -35,6 +45,9 @@ xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
> >   init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
> >   	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS)
> > $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl)
> > $(LDLIBS_libxenguest) $(LDLIBS_libxenlight) $(APPEND_LDFLAGS)
> >   +init-dom0less: $(INIT_DOM0LESS_OBJS)
> > +	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl)
> > $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore)
> > $(LDLIBS_libxenlight) $(LDLIBS_libxenguest) $(LDLIBS_libxenforeignmemory)
> > $(APPEND_LDFLAGS)
> > +
> >   .PHONY: install
> >   install: all
> >   	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> > diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> > new file mode 100644
> > index 0000000000..bfd5ff0761
> > --- /dev/null
> > +++ b/tools/helpers/init-dom0less.c
> > @@ -0,0 +1,340 @@
> > +#include <stdbool.h>
> > +#include <syslog.h>
> > +#include <stdio.h>
> > +#include <err.h>
> > +#include <stdlib.h>
> > +#include <sys/time.h>
> > +#include <xenstore.h>
> > +#include <xenctrl.h>
> > +#include <xenguest.h>
> > +#include <libxl.h>
> > +#include <xenevtchn.h>
> > +#include <xenforeignmemory.h>
> > +#include <xen/io/xs_wire.h>
> > +
> > +#include "init-dom-json.h"
> > +
> > +#define XENSTORE_PFN_OFFSET 1
> > +#define STR_MAX_LENGTH 64
> > +
> > +static int alloc_xs_page(struct xc_interface_core *xch,
> > +                         libxl_dominfo *info,
> > +                         uint64_t *xenstore_pfn)
> > +{
> > +    int rc;
> > +    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> > +    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) +
> > XENSTORE_PFN_OFFSET;
> > +
> > +    rc = xc_domain_setmaxmem(xch, info->domid,
> > +                             info->max_memkb + (XC_PAGE_SIZE/1024));
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
> > +    rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    return 0;
> > +}
> > +
> > +static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> > +                            domid_t domid, char *path, char *val)
> > +{
> > +    char full_path[STR_MAX_LENGTH];
> > +    struct xs_permissions perms[2];
> > +
> > +    perms[0].id = domid;
> > +    perms[0].perms = XS_PERM_NONE;
> > +    perms[1].id = 0;
> > +    perms[1].perms = XS_PERM_READ;
> > +
> > +    if (snprintf(full_path, STR_MAX_LENGTH,
> > +                 "/local/domain/%u/%s", domid, path) < 0)
> > +        return false;
> > +    if (!xs_write(xsh, t, full_path, val, strlen(val)))
> > +        return false;
> > +    return xs_set_permissions(xsh, t, full_path, perms, 2);
> > +}
> > +
> > +static bool do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
> > +                              domid_t domid, char *path, char *val)
> > +{
> > +    char full_path[STR_MAX_LENGTH];
> > +
> > +    if (snprintf(full_path, STR_MAX_LENGTH,
> > +                 "/libxl/%u/%s", domid, path) < 0)
> > +        return false;
> > +    return xs_write(xsh, t, full_path, val, strlen(val));
> > +}
> > +
> > +static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
> > +                           libxl_uuid uuid, char *path, char *val)
> > +{
> > +    char full_path[STR_MAX_LENGTH];
> > +
> > +    if (snprintf(full_path, STR_MAX_LENGTH,
> > +                 "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path)
> > < 0)
> > +        return false;
> > +    return xs_write(xsh, t, full_path, val, strlen(val));
> > +}
> > +
> > +/*
> > + * The xenstore nodes are the xenstore nodes libxl writes at domain
> > + * creation.
> > + *
> > + * The list was retrieved by running xenstore-ls on a corresponding
> > + * domain started by xl/libxl.
> > + */
> > +static int create_xenstore(struct xs_handle *xsh,
> > +                           libxl_dominfo *info, libxl_uuid uuid,
> > +                           evtchn_port_t xenstore_port)
> > +{
> > +    domid_t domid;
> > +    unsigned int i;
> > +    char uuid_str[STR_MAX_LENGTH];
> > +    char dom_name_str[STR_MAX_LENGTH];
> > +    char vm_val_str[STR_MAX_LENGTH];
> > +    char id_str[STR_MAX_LENGTH];
> > +    char max_memkb_str[STR_MAX_LENGTH];
> > +    char target_memkb_str[STR_MAX_LENGTH];
> > +    char cpu_str[STR_MAX_LENGTH];
> > +    char xenstore_port_str[STR_MAX_LENGTH];
> > +    char ring_ref_str[STR_MAX_LENGTH];
> > +    xs_transaction_t t;
> > +    struct timeval start_time;
> > +    char start_time_str[STR_MAX_LENGTH];
> > +    int rc;
> > +
> > +    if (gettimeofday(&start_time, NULL) < 0)
> > +        return -errno;
> > +    rc = snprintf(start_time_str, STR_MAX_LENGTH, "%jd.%02d",
> > +            (intmax_t)start_time.tv_sec, (int)start_time.tv_usec / 10000);
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +    domid = info->domid;
> > +    rc = snprintf(id_str, STR_MAX_LENGTH, "%u", domid);
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%u", domid);
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT,
> > LIBXL_UUID_BYTES(uuid));
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(vm_val_str, STR_MAX_LENGTH,
> > +                  "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memkb);
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%lu",
> > info->current_memkb);
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
> > +                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) +
> > XENSTORE_PFN_OFFSET);
> > +    if (rc < 0)
> > +        return rc;
> > +    rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
> > +    if (rc < 0)
> > +        return rc;
> > +
> > +retry_transaction:
> > +    t = xs_transaction_start(xsh);
> > +    if (t == XBT_NULL)
> > +        return -errno;
> > +
> > +    rc = -EIO;
> > +    /* /vm */
> > +    if (!do_xs_write_vm(xsh, t, uuid, "name", dom_name_str)) goto err;
> > +    if (!do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str)) goto err;
> > +    if (!do_xs_write_vm(xsh, t, uuid, "start_time", start_time_str)) goto
> > err;
> > +
> > +    /* /domain */
> > +    if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
> > +    for (i = 0; i < info->vcpu_max_id; i++) {
> > +        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
> > +        if (rc < 0)
> > +            goto err;
> > +        rc = -EIO;
> > +        if (!do_xs_write_dom(xsh, t, domid, cpu_str,
> > +                             (info->cpupool & (1 << i)) ? "online" :
> > "offline"))
> > +            goto err;
> > +    }
> > +
> > +    if (!do_xs_write_dom(xsh, t, domid, "memory", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "memory/static-max",
> > max_memkb_str)) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "memory/target", target_memkb_str))
> > goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1")) goto err;
> > +
> > +    if (!do_xs_write_dom(xsh, t, domid, "device", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "device/suspend", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel",
> > "")) goto err;
> > +
> > +    if (!do_xs_write_dom(xsh, t, domid, "control", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "control/shutdown", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1"))
> > goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1"))
> > goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "control/feature-suspend", ""))
> > goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "control/sysrq", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid,
> > "control/platform-feature-multiprocessor-suspend", "1")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid,
> > "control/platform-feature-xs_reset_watches", "1")) goto err;
> > +
> > +    if (!do_xs_write_dom(xsh, t, domid, "domid", id_str)) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "data", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "drivers", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "feature", "")) goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "attr", "")) goto err;
> > +
> > +    if (!do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str))
> > goto err;
> > +    if (!do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str))
> > goto err;
> > +
> > +    if (!do_xs_write_libxl(xsh, t, domid, "type", "pvh")) goto err;
> > +    if (!do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen")) goto
> > err;
> > +
> > +    if (!xs_transaction_end(xsh, t, false)) {
> > +        if (errno == EAGAIN)
> > +            goto retry_transaction;
> > +        else
> > +            return -errno;
> > +    }
> > +
> > +    return 0;
> > +
> > +err:
> > +    xs_transaction_end(xsh, t, true);
> > +    return rc;
> > +}
> > +
> > +static int init_domain(struct xs_handle *xsh,
> > +                       struct xc_interface_core *xch,
> > +                       xenforeignmemory_handle *xfh,
> > +                       libxl_dominfo *info)
> > +{
> > +    libxl_uuid uuid;
> > +    uint64_t xenstore_evtchn, xenstore_pfn;
> > +    int rc;
> > +    struct xenstore_domain_interface *intf;
> > +
> > +    printf("Init dom0less domain: %u\n", info->domid);
> > +
> > +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
> > +                          &xenstore_evtchn);
> > +    if (rc != 0) {
> > +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> > +        return 1;
> > +    }
> > +
> > +    /* Alloc xenstore page */
> > +    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
> > +        printf("Error on alloc magic pages\n");
> > +        return 1;
> > +    }
> > +
> > +    intf = xenforeignmemory_map(xfh, info->domid, XS_READ | XS_WRITE, 1,
> 
> I don't think you want to pass the xenstore wire commands here. Did you mean
> PROT_READ | PROT_WRITE?

Ops, you are right. I'll fix that.


> > +                                &xenstore_pfn, NULL);
> > +    if (!intf) {
> > +        printf("Error mapping xenstore page\n");
> > +        return 1;
> > +    }
> > +    intf->connection = XENSTORE_RECONNECT;
> > +    xenforeignmemory_unmap(xfh, intf, 1);
> > +
> > +    rc = xc_dom_gnttab_seed(xch, info->domid, true,
> > +                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> 
> So no support for Xenstore running in a stub-domain?

We don't have stub-domains on ARM yet (unfortunately), so we cannot run
xenstore in one. It would not be possible for me to test it at the moment.

