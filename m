Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D88488144
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 05:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254803.436696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62wF-0003t9-66; Sat, 08 Jan 2022 04:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254803.436696; Sat, 08 Jan 2022 04:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62wF-0003qW-36; Sat, 08 Jan 2022 04:02:43 +0000
Received: by outflank-mailman (input) for mailman id 254803;
 Sat, 08 Jan 2022 04:02:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n62wD-0003qQ-Tj
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 04:02:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62wC-000320-P0; Sat, 08 Jan 2022 04:02:40 +0000
Received: from [5.195.40.20] (helo=[10.235.48.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62wC-00067n-C4; Sat, 08 Jan 2022 04:02:40 +0000
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
	bh=NkXqpWc2NU0k6G1sSWXUyM8nVSowUpkdUp7aalfeor8=; b=j3ENTKbnMS19k5FzRqOaHhL/Or
	A9PQsfX+lf1UN9Rna4+nyNw9SWrNwGw1gULxdlIkOI+S0Ebsxj0LBY7P37hny8IxzZOMVjqrLNNz3
	50aA7ZJf0syWlQNhjt6Pj0hbo/O9n2olcZIDkCjLfYrXIULZgGJHBPIYJxJ4+BRdnVDw=;
Message-ID: <47834af4-6c87-afd5-f8a0-c4086a938fb4@xen.org>
Date: Sat, 8 Jan 2022 08:02:35 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 7/7] tools: add example application to initialize
 dom0less PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-7-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220108004912.3820176-7-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/01/2022 00:49, Stefano Stabellini wrote:
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
>   tools/helpers/Makefile        |  13 ++
>   tools/helpers/init-dom0less.c | 263 ++++++++++++++++++++++++++++++++++
>   2 files changed, 276 insertions(+)
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
> +	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenevtchn) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxenlight) $(LDLIBS_libxenguest)  $(APPEND_LDFLAGS)
> +
>   .PHONY: install
>   install: all
>   	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> new file mode 100644
> index 0000000000..055bf76cf5
> --- /dev/null
> +++ b/tools/helpers/init-dom0less.c
> @@ -0,0 +1,263 @@
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
> +#define CONSOLE_PFN_OFFSET 0
> +#define XENSTORE_PFN_OFFSET 1
> +#define STR_MAX_LENGTH 64
> +
> +static int alloc_magic_pages(struct xc_dom_image *dom)
> +{
> +    int rc, i;
> +    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> +    xen_pfn_t p2m[NR_MAGIC_PAGES];
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
> +
> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
> +                     dom->xenstore_pfn);

I think it would be best if the page is initialized in Xen. This would 
allow to use the fields in the interface to propage the connection state 
(see my comment in patch #1).

> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_EVTCHN,
> +                     dom->xenstore_evtchn);

On patch #1, you wrote the domain will have to wait on the event 
channel. So shouldn't the event channel be initialized before the domain 
is created? Otherwise, how would the domain knows when it is set?

> +    return 0;
> +}
> +
> +static void do_xs_write(struct xs_handle *xsh, xs_transaction_t t,
> +                        char *path, char *val)
> +{
> +    if (!xs_write(xsh, t, path, val, strlen(val)))
> +        fprintf(stderr, "writing %s to xenstore failed.\n", path);
> +}
> +
> +static void do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> +                            domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/local/domain/%d/%s", domid, path);
> +    do_xs_write(xsh, t, full_path, val);
> +}
> +
> +static void do_xs_write_libxl(struct xs_handle *xsh, xs_transaction_t t,
> +                              domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/libxl/%d/%s", domid, path);
> +    do_xs_write(xsh, t, full_path, val);
> +}
> +
> +static void do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
> +                           libxl_uuid uuid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +
> +    snprintf(full_path, STR_MAX_LENGTH,
> +             "/vm/" LIBXL_UUID_FMT "/%s", LIBXL_UUID_BYTES(uuid), path);
> +    do_xs_write(xsh, t, full_path, val);
> +}
> +
> +static int restore_xenstore(struct xs_handle *xsh,

I think "restore" is misleading because the domain was never in 
Xenstore. So how about "create"?

> +                            libxl_dominfo *info, libxl_uuid uuid,
> +                            evtchn_port_t xenstore_port)
> +{
> +    domid_t domid;
> +    int i;
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
> +    snprintf(xenstore_port_str, STR_MAX_LENGTH, "%d", xenstore_port);
> +
> +retry_transaction:
> +    t = xs_transaction_start(xsh);
> +    if (t == XBT_NULL)
> +        return errno;
> +
> +    /* /vm */
> +    do_xs_write_vm(xsh, t, uuid, "name", dom_name_str);
> +    do_xs_write_vm(xsh, t, uuid, "uuid", uuid_str);
> +    do_xs_write_vm(xsh, t, uuid, "start_time", "0");
> +
> +    /* /domain */
> +    do_xs_write_dom(xsh, t, domid, "vm", vm_val_str);
> +    do_xs_write_dom(xsh, t, domid, "name", dom_name_str);
> +    do_xs_write_dom(xsh, t, domid, "cpu", "");
> +    for (i = 0; i < info->vcpu_max_id; i++) {
> +        snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%d/availability/", i);
> +        do_xs_write_dom(xsh, t, domid, cpu_str,
> +                        (info->cpupool & (1 << i)) ? "online" : "offline");
> +    }
> +    do_xs_write_dom(xsh, t, domid, "cpu/0", "");
> +    do_xs_write_dom(xsh, t, domid, "cpu/availability", "online");
> +
> +    do_xs_write_dom(xsh, t, domid, "memory", "");
> +    do_xs_write_dom(xsh, t, domid, "memory/static-max", max_memkb_str);
> +    do_xs_write_dom(xsh, t, domid, "memory/videoram", "-1");
> +
> +    do_xs_write_dom(xsh, t, domid, "device", "");
> +    do_xs_write_dom(xsh, t, domid, "device/suspend", "");
> +    do_xs_write_dom(xsh, t, domid, "device/suspend/event-channel", "");
> +
> +    do_xs_write_dom(xsh, t, domid, "control", "");
> +    do_xs_write_dom(xsh, t, domid, "control/shutdown", "");
> +    do_xs_write_dom(xsh, t, domid, "control/feature-poweroff", "1");
> +    do_xs_write_dom(xsh, t, domid, "control/feature-reboot", "1");
> +    do_xs_write_dom(xsh, t, domid, "control/feature-suspend", "");
> +    do_xs_write_dom(xsh, t, domid, "control/sysrq", "");
> +    do_xs_write_dom(xsh, t, domid, "control/platform-feature-multiprocessor-suspend", "1");
> +    do_xs_write_dom(xsh, t, domid, "control", "platform-feature-xs_reset_watches");
> +
> +    do_xs_write_dom(xsh, t, domid, "domid", id_str);
> +    do_xs_write_dom(xsh, t, domid, "data", "");
> +    do_xs_write_dom(xsh, t, domid, "drivers", "");
> +    do_xs_write_dom(xsh, t, domid, "feature", "");
> +    do_xs_write_dom(xsh, t, domid, "attr", "");
> +
> +    do_xs_write_dom(xsh, t, domid, "store/port", xenstore_port_str);
> +    do_xs_write_dom(xsh, t, domid, "store/ring-ref", ring_ref_str);
> +
> +    do_xs_write_libxl(xsh, t, domid, "type", "pvh");
> +    do_xs_write_libxl(xsh, t, domid, "dm-version", "qemu_xen");

Can you outline how you decided which nodes need to be created?

Cheers,

-- 
Julien Grall

