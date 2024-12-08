Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40C9E87D1
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2024 21:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850903.1265137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKO3H-0006UN-Nd; Sun, 08 Dec 2024 20:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850903.1265137; Sun, 08 Dec 2024 20:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKO3H-0006RN-I6; Sun, 08 Dec 2024 20:38:51 +0000
Received: by outflank-mailman (input) for mailman id 850903;
 Sun, 08 Dec 2024 20:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=khsb=TB=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1tKO3G-0006RG-9A
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2024 20:38:50 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c075fb2-b5a4-11ef-99a3-01e77a169b0f;
 Sun, 08 Dec 2024 21:38:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 33603A1F94;
 Sun,  8 Dec 2024 21:38:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rbm3GzcPKTYY; Sun,  8 Dec 2024 21:38:46 +0100 (CET)
Received: from begin.home (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B7DD3A1F72;
 Sun,  8 Dec 2024 21:38:45 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1tKO3B-00000004HD0-0HE9; Sun, 08 Dec 2024 21:38:45 +0100
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
X-Inumbo-ID: 6c075fb2-b5a4-11ef-99a3-01e77a169b0f
Date: Sun, 8 Dec 2024 21:38:45 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 7/7] tools/xenstored: use new stable interface instead
 of libxenctrl
Message-ID: <Z1YD1TgATdCcyG9Z@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206130221.17773-8-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le ven. 06 déc. 2024 14:02:21 +0100, a ecrit:
> Replace the current use of the unstable xc_domain_getinfo_single()
> interface with the stable domctl XEN_DOMCTL_get_domain_state call
> via the new libxenmanage library.
> 
> This will remove the last usage of libxenctrl by Xenstore, so update
> the library dependencies accordingly.
> 
> For now only do a direct replacement without using the functionality
> of obtaining information about domains having changed the state.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V1:
> - use library instead of direct hypercall, only replace current
>   libxenctrl use case
> 
> Please note that this patch can be committed only after the related
> Mini-OS patch "config: add support for libxenmanage" has gone in AND
> the Mini-OS commit-id has been updated in Config.mk accordingly!
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  stubdom/Makefile                |  8 ++---
>  stubdom/mini-os.mk              |  1 +
>  tools/xenstored/Makefile        |  2 +-
>  tools/xenstored/Makefile.common |  2 +-
>  tools/xenstored/core.h          |  1 -
>  tools/xenstored/domain.c        | 52 ++++++++++++---------------------
>  tools/xenstored/lu.c            |  1 +
>  tools/xenstored/lu_daemon.c     |  1 +
>  8 files changed, 28 insertions(+), 40 deletions(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 2a81af28a1..ca800b243c 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -307,7 +307,7 @@ endif
>  # libraries under tools/libs
>  #######
>  
> -STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest
> +STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest manage
>  
>  LIBDEP_guest := cross-zlib
>  
> @@ -465,7 +465,7 @@ grub: cross-polarssl grub-upstream $(CROSS_ROOT) grub-$(XEN_TARGET_ARCH)-minios-
>  # xenstore
>  ##########
>  
> -xenstore-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog ctrl
> +xenstore-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog manage
>  xenstore-minios.gen.cfg: xenstore-minios.cfg Makefile
>  	$(GEN_config) >$@
>  
> @@ -480,7 +480,7 @@ xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
>  # xenstorepvh
>  #############
>  
> -xenstorepvh-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog ctrl
> +xenstorepvh-minios.gen.cfg: APP_LIBS = gnttab evtchn toollog manage
>  xenstorepvh-minios.gen.cfg: xenstorepvh-minios.cfg Makefile
>  	$(GEN_config) >$@
>  
> @@ -523,7 +523,7 @@ else
>  pv-grub-if-enabled:
>  endif
>  
> -XENSTORE_DEPS := libxenevtchn libxengnttab libxenctrl
> +XENSTORE_DEPS := libxenevtchn libxengnttab libxenmanage
>  
>  .PHONY: xenstore-stubdom
>  xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore $(XENSTORE_DEPS) xenstore
> diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
> index 7e4968e026..be32302f9e 100644
> --- a/stubdom/mini-os.mk
> +++ b/stubdom/mini-os.mk
> @@ -13,5 +13,6 @@ GNTTAB_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
>  CALL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
>  FOREIGNMEMORY_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
>  DEVICEMODEL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
> +MANAGE_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/manage
>  CTRL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/ctrl
>  GUEST_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/guest
> diff --git a/tools/xenstored/Makefile b/tools/xenstored/Makefile
> index 09adfe1d50..81c42838e0 100644
> --- a/tools/xenstored/Makefile
> +++ b/tools/xenstored/Makefile
> @@ -5,7 +5,7 @@ include Makefile.common
>  
>  xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
>  xenstored: LDLIBS += $(LDLIBS_libxengnttab)
> -xenstored: LDLIBS += $(LDLIBS_libxenctrl)
> +xenstored: LDLIBS += $(LDLIBS_libxenmanage)
>  xenstored: LDLIBS += -lrt
>  xenstored: LDLIBS += $(SOCKET_LIBS)
>  
> diff --git a/tools/xenstored/Makefile.common b/tools/xenstored/Makefile.common
> index 27fdb3b49e..271134fcc1 100644
> --- a/tools/xenstored/Makefile.common
> +++ b/tools/xenstored/Makefile.common
> @@ -12,7 +12,7 @@ XENSTORED_OBJS-$(CONFIG_MiniOS) += minios.o lu_minios.o
>  # Include configure output (config.h)
>  CFLAGS += -include $(XEN_ROOT)/tools/config.h
>  CFLAGS += $(CFLAGS_libxenevtchn)
> -CFLAGS += $(CFLAGS_libxenctrl)
> +CFLAGS += $(CFLAGS_libxenmanage)
>  CFLAGS += $(CFLAGS_libxentoolcore)
>  
>  $(XENSTORED_OBJS-y): CFLAGS += $(CFLAGS_libxengnttab)
> diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
> index e58779e88c..632886cecf 100644
> --- a/tools/xenstored/core.h
> +++ b/tools/xenstored/core.h
> @@ -19,7 +19,6 @@
>  #ifndef _XENSTORED_CORE_H
>  #define _XENSTORED_CORE_H
>  
> -#include <xenctrl.h>
>  #include <xengnttab.h>
>  
>  #include <sys/types.h>
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index 64c8fd0cc3..c0264d9477 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -34,14 +34,15 @@
>  #include "control.h"
>  
>  #include <xenevtchn.h>
> -#include <xenctrl.h>
> +#include <xenmanage.h>
> +#include <xen-barrier.h>
>  #include <xen/grant_table.h>
>  
>  #ifdef __MINIOS__
>  #include <mini-os/xenbus.h>
>  #endif
>  
> -static xc_interface **xc_handle;
> +static xenmanage_handle *xm_handle;
>  xengnttab_handle **xgt_handle;
>  static evtchn_port_t virq_port;
>  
> @@ -619,32 +620,28 @@ static int destroy_domain(void *_domain)
>  	return 0;
>  }
>  
> -static bool get_domain_info(unsigned int domid, xc_domaininfo_t *dominfo)
> -{
> -	return xc_domain_getinfo_single(*xc_handle, domid, dominfo) == 0;
> -}
> -
>  static int check_domain(const void *k, void *v, void *arg)
>  {
> -	xc_domaininfo_t dominfo;
> +	unsigned int state;
>  	struct connection *conn;
> -	bool dom_valid;
> +	int dom_invalid;
>  	struct domain *domain = v;
>  	bool *notify = arg;
>  
> -	dom_valid = get_domain_info(domain->domid, &dominfo);
> +	dom_invalid = xenmanage_get_domain_info(xm_handle, domain->domid,
> +						&state, NULL);
>  	if (!domain->introduced) {
> -		if (!dom_valid)
> +		if (dom_invalid)
>  			talloc_free(domain);
>  		return 0;
>  	}
> -	if (dom_valid) {
> -		if ((dominfo.flags & XEN_DOMINF_shutdown)
> +	if (!dom_invalid) {
> +		if ((state & XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN)
>  		    && !domain->shutdown) {
>  			domain->shutdown = true;
>  			*notify = true;
>  		}
> -		if (!(dominfo.flags & XEN_DOMINF_dying))
> +		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DYING))
>  			return 0;
>  	}
>  	if (domain->conn) {
> @@ -786,10 +783,9 @@ static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
>  static struct domain *find_or_alloc_existing_domain(unsigned int domid)
>  {
>  	struct domain *domain;
> -	xc_domaininfo_t dominfo;
>  
>  	domain = find_domain_struct(domid);
> -	if (!domain && get_domain_info(domid, &dominfo))
> +	if (!domain && !xenmanage_get_domain_info(xm_handle, domid, NULL, NULL))
>  		domain = alloc_domain(NULL, domid);
>  
>  	return domain;
> @@ -1187,12 +1183,6 @@ int do_reset_watches(const void *ctx, struct connection *conn,
>  	return 0;
>  }
>  
> -static int close_xc_handle(void *_handle)
> -{
> -	xc_interface_close(*(xc_interface**)_handle);
> -	return 0;
> -}
> -
>  static int close_xgt_handle(void *_handle)
>  {
>  	xengnttab_close(*(xengnttab_handle **)_handle);
> @@ -1258,15 +1248,9 @@ void domain_early_init(void)
>  	if (!domhash)
>  		barf_perror("Failed to allocate domain hashtable");
>  
> -	xc_handle = talloc(talloc_autofree_context(), xc_interface*);
> -	if (!xc_handle)
> -		barf_perror("Failed to allocate domain handle");
> -
> -	*xc_handle = xc_interface_open(0,0,0);
> -	if (!*xc_handle)
> -		barf_perror("Failed to open connection to hypervisor");
> -
> -	talloc_set_destructor(xc_handle, close_xc_handle);
> +	xm_handle = xenmanage_open(NULL, 0);
> +	if (!xm_handle)
> +		barf_perror("Failed to open connection to libxenmanage");
>  
>  	xgt_handle = talloc(talloc_autofree_context(), xengnttab_handle*);
>  	if (!xgt_handle)
> @@ -1306,6 +1290,8 @@ void domain_deinit(void)
>  {
>  	if (virq_port)
>  		xenevtchn_unbind(xce_handle, virq_port);
> +
> +	xenmanage_close(xm_handle);
>  }
>  
>  /*
> @@ -1335,13 +1321,13 @@ int domain_alloc_permrefs(struct node_perms *perms)
>  {
>  	unsigned int i, domid;
>  	struct domain *d;
> -	xc_domaininfo_t dominfo;
>  
>  	for (i = 0; i < perms->num; i++) {
>  		domid = perms->p[i].id;
>  		d = find_domain_struct(domid);
>  		if (!d) {
> -			if (!get_domain_info(domid, &dominfo))
> +			if (xenmanage_get_domain_info(xm_handle, domid,
> +						      NULL, NULL))
>  				perms->p[i].perms |= XS_PERM_IGNORE;
>  			else if (!alloc_domain(NULL, domid))
>  				return ENOMEM;
> diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
> index bec2a84e10..4fccbbc195 100644
> --- a/tools/xenstored/lu.c
> +++ b/tools/xenstored/lu.c
> @@ -11,6 +11,7 @@
>  #include <stdlib.h>
>  #include <syslog.h>
>  #include <time.h>
> +#include <unistd.h>
>  #include <sys/mman.h>
>  #include <sys/stat.h>
>  
> diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daemon.c
> index 6df6c80a2a..88d8d9e1b3 100644
> --- a/tools/xenstored/lu_daemon.c
> +++ b/tools/xenstored/lu_daemon.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <syslog.h>
> +#include <unistd.h>
>  #include <sys/stat.h>
>  
>  #include "talloc.h"
> -- 
> 2.43.0
> 

-- 
Samuel
Client: "This program has been successfully installed."
Vendeur (surpris): "Et où voyez-vous une erreur ?"
Client: "C'est << HAS BEEN >> !"

