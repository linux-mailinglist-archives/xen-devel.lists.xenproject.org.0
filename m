Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F3C76B0B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 00:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168030.1494159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMEWm-0004xv-J3; Thu, 20 Nov 2025 23:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168030.1494159; Thu, 20 Nov 2025 23:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMEWm-0004wN-FY; Thu, 20 Nov 2025 23:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1168030;
 Thu, 20 Nov 2025 23:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gr2H=54=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMEWk-0004wH-LN
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 23:57:26 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a848ed4d-c66c-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 00:57:24 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMEWX-00000005cYr-0ztq;
 Thu, 20 Nov 2025 23:57:13 +0000
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
X-Inumbo-ID: a848ed4d-c66c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=yLx8/kW/v6qUU6G/CxjaSljuRBbP90sLxOMR5Nm0pKA=; b=M+mrJZyL7werI5IY
	QaTeVA66JNcc6UmKX+IWfgWcCWSuWyHR7woCz+nK9VH5X6DShYGi0MnnpKdk9R3hWP01DVM9pwSO+
	0mHysCZkXmXtBm6gneQIoDYy329cHrq4QWGf+FTXK+uautA8L/u+kRXnHzpnKt8s9QlXtYFuaryRY
	wSIAGNeeevUTUeh/kN6c9EILJCGBnAqKriOxG+2PqaiaQF12+cH853scKM7WMr9MfwqCtDgaZNVtO
	gXnSKivBzAdvYq5xjXyQrtWf62qjquyoFcKQ+Ozoj8NzsmVeiTGM8WAQHu/FUVhGAqjlsbDzc600R
	s+g1gljwzFbH36fTkA==;
Date: Thu, 20 Nov 2025 23:57:13 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com, pizhenwei@bytedance.com,
	alistair.francis@wdc.com, stefanb@linux.vnet.ibm.com,
	kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
	qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
	imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
	shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com,
	jag.raman@oracle.com, sgarzare@redhat.com, pbonzini@redhat.com,
	fam@euphon.net, philmd@linaro.org, alex@shazbot.org, clg@redhat.com,
	peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
	jasowang@redhat.com, samuel.thibault@ens-lyon.org,
	michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
	mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
	liwei1518@gmail.com, dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
	qemu-block@nongnu.org, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	qemu-riscv@nongnu.org
Subject: Re: [PATCH 09/14] error: Use error_setg_file_open() for simplicity
 and consistency
Message-ID: <aR-q2YeegIEPmk2R@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-10-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251120191339.756429-10-armbru@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 23:56:31 up 24 days, 23:32,  2 users,  load average: 0.00, 0.01,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> Replace
> 
>     error_setg_errno(errp, errno, MSG, FNAME);
> 
> by
> 
>     error_setg_file_open(errp, errno, FNAME);
> 
> where MSG is "Could not open '%s'" or similar.
> 
> Also replace equivalent uses of error_setg().
> 
> A few messages lose prefixes ("net dump: ", "SEV: ", __func__ ": ").
> We could put them back with error_prepend().  Not worth the bother.

Yeh, I guess you could just do it with another macro using
the same internal function just with string concatenation.

> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>

> ---
>  hw/9pfs/9p-local.c        | 2 +-
>  hw/acpi/core.c            | 2 +-
>  hw/core/loader.c          | 2 +-
>  hw/pci-host/xen_igd_pt.c  | 2 +-
>  monitor/hmp-cmds-target.c | 2 +-
>  net/dump.c                | 2 +-
>  net/tap-bsd.c             | 6 +++---
>  net/tap-linux.c           | 2 +-
>  target/i386/sev.c         | 6 ++----
>  ui/ui-qmp-cmds.c          | 3 +--
>  util/vfio-helpers.c       | 5 ++---
>  11 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 31e216227c..376b377698 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -1456,7 +1456,7 @@ static int local_init(FsContext *ctx, Error **errp)
>  
>      data->mountfd = open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
>      if (data->mountfd == -1) {
> -        error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
> +        error_setg_file_open(errp, errno, ctx->fs_root);
>          goto err;
>      }
>  
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index ff16582803..d2677332af 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -277,7 +277,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>          int fd = open(*cur, O_RDONLY | O_BINARY);
>  
>          if (fd < 0) {
> -            error_setg(errp, "can't open file %s: %s", *cur, strerror(errno));
> +            error_setg_file_open(errp, errno, *cur);
>              goto out;
>          }
>  
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 590c5b02aa..b56e5eb2f5 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -379,7 +379,7 @@ void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
>  
>      fd = open(filename, O_RDONLY | O_BINARY);
>      if (fd < 0) {
> -        error_setg_errno(errp, errno, "Failed to open file: %s", filename);
> +        error_setg_file_open(errp, errno, filename);
>          return;
>      }
>      if (read(fd, hdr, EI_NIDENT) != EI_NIDENT) {
> diff --git a/hw/pci-host/xen_igd_pt.c b/hw/pci-host/xen_igd_pt.c
> index 5dd17ef236..f6016f2cd5 100644
> --- a/hw/pci-host/xen_igd_pt.c
> +++ b/hw/pci-host/xen_igd_pt.c
> @@ -55,7 +55,7 @@ static void host_pci_config_read(int pos, int len, uint32_t *val, Error **errp)
>  
>      config_fd = open(path, O_RDWR);
>      if (config_fd < 0) {
> -        error_setg_errno(errp, errno, "Failed to open: %s", path);
> +        error_setg_file_open(errp, errno, path);
>          goto out;
>      }
>  
> diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
> index e982061146..ad4ed2167d 100644
> --- a/monitor/hmp-cmds-target.c
> +++ b/monitor/hmp-cmds-target.c
> @@ -331,7 +331,7 @@ static uint64_t vtop(void *ptr, Error **errp)
>  
>      fd = open("/proc/self/pagemap", O_RDONLY);
>      if (fd == -1) {
> -        error_setg_errno(errp, errno, "Cannot open /proc/self/pagemap");
> +        error_setg_file_open(errp, errno, "/proc/self/pagemap");
>          return -1;
>      }
>  
> diff --git a/net/dump.c b/net/dump.c
> index 581234b775..0c39f09892 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -111,7 +111,7 @@ static int net_dump_state_init(DumpState *s, const char *filename,
>  
>      fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY | O_BINARY, 0644);
>      if (fd < 0) {
> -        error_setg_errno(errp, errno, "net dump: can't open %s", filename);
> +        error_setg_file_open(errp, errno, filename);
>          return -1;
>      }
>  
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index bbf84d1828..3fd300d46f 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -68,7 +68,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>          }
>      }
>      if (fd < 0) {
> -        error_setg_errno(errp, errno, "could not open %s", dname);
> +        error_setg_file_open(errp, errno, dname);
>          return -1;
>      }
>  
> @@ -118,7 +118,7 @@ static int tap_open_clone(char *ifname, int ifname_size, Error **errp)
>  
>      fd = RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
>      if (fd < 0) {
> -        error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
> +        error_setg_file_open(errp, errno, PATH_NET_TAP);
>          return -1;
>      }
>  
> @@ -166,7 +166,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>          snprintf(dname, sizeof dname, "/dev/%s", ifname);
>          fd = RETRY_ON_EINTR(open(dname, O_RDWR));
>          if (fd < 0 && errno != ENOENT) {
> -            error_setg_errno(errp, errno, "could not open %s", dname);
> +            error_setg_file_open(errp, errno, dname);
>              return -1;
>          }
>      }
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 2a90b58467..909c4f1fcf 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -57,7 +57,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>      if (fd < 0) {
>          fd = RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
>          if (fd < 0) {
> -            error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
> +            error_setg_file_open(errp, errno, PATH_NET_TUN);
>              return -1;
>          }
>      }
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index fd2dada013..8660ecd9e4 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -891,8 +891,7 @@ static SevCapability *sev_get_capabilities(Error **errp)
>  
>      fd = open(sev_device, O_RDWR);
>      if (fd < 0) {
> -        error_setg_errno(errp, errno, "SEV: Failed to open %s",
> -                         sev_device);
> +        error_setg_file_open(errp, errno, sev_device);
>          g_free(sev_device);
>          return NULL;
>      }
> @@ -1819,8 +1818,7 @@ static int sev_common_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>      devname = object_property_get_str(OBJECT(sev_common), "sev-device", NULL);
>      sev_common->sev_fd = open(devname, O_RDWR);
>      if (sev_common->sev_fd < 0) {
> -        error_setg(errp, "%s: Failed to open %s '%s'", __func__,
> -                   devname, strerror(errno));
> +        error_setg_file_open(errp, errno, devname);
>          g_free(devname);
>          return -1;
>      }
> diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
> index 74fa6c6ec5..d927121676 100644
> --- a/ui/ui-qmp-cmds.c
> +++ b/ui/ui-qmp-cmds.c
> @@ -371,8 +371,7 @@ qmp_screendump(const char *filename, const char *device,
>  
>      fd = qemu_open_old(filename, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0666);
>      if (fd == -1) {
> -        error_setg(errp, "failed to open file '%s': %s", filename,
> -                   strerror(errno));
> +        error_setg_file_open(errp, errno, filename);
>          return;
>      }
>  
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index fdff042ab4..8b1b2e2f05 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -309,7 +309,7 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
>      s->container = open("/dev/vfio/vfio", O_RDWR);
>  
>      if (s->container == -1) {
> -        error_setg_errno(errp, errno, "Failed to open /dev/vfio/vfio");
> +        error_setg_file_open(errp, errno, "/dev/vfio/vfio");
>          return -errno;
>      }
>      if (ioctl(s->container, VFIO_GET_API_VERSION) != VFIO_API_VERSION) {
> @@ -333,8 +333,7 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
>  
>      s->group = open(group_file, O_RDWR);
>      if (s->group == -1) {
> -        error_setg_errno(errp, errno, "Failed to open VFIO group file: %s",
> -                         group_file);
> +        error_setg_file_open(errp, errno, group_file);
>          g_free(group_file);
>          ret = -errno;
>          goto fail_container;
> -- 
> 2.49.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

