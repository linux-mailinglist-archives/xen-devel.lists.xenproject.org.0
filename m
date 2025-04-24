Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A5A9AF7A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 15:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966343.1356579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wpi-0005II-DT; Thu, 24 Apr 2025 13:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966343.1356579; Thu, 24 Apr 2025 13:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wpi-0005GU-AZ; Thu, 24 Apr 2025 13:41:42 +0000
Received: by outflank-mailman (input) for mailman id 966343;
 Thu, 24 Apr 2025 13:41:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7wph-0005GO-3g
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 13:41:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7wpg-001ffi-0t;
 Thu, 24 Apr 2025 13:41:40 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7wpf-00EgXS-2w;
 Thu, 24 Apr 2025 13:41:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=0bCs0z5h8TGFizTQyCrHG4bQMUs8ZugPkiXUI3Afgug=; b=JJbEwZOZbXmUjS/dwH7gwKJ/fM
	Dice1FKgf9+bli8vPpPIq0B4LsSGWEqLecqya2dCmiD+5YmHyqiB0HFNifcvk8qtyXOhwgd4L8K6I
	/OoyYBYK1pr530VCkBc2UvZVnRoAyHxcn9Za7TNRJQqK1EjYvJ4feA488iT6xK+O8Saw=;
Date: Thu, 24 Apr 2025 15:41:37 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 3/6] tools: remove support for running a guest with
 qemu-traditional
Message-ID: <aAo_kQKhjRMqRNhO@l14>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408123526.14613-4-jgross@suse.com>

On Tue, Apr 08, 2025 at 02:35:21PM +0200, Juergen Gross wrote:
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index c3c61ca060..a00acdd45b 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -113,19 +113,9 @@ void pci_setup(void)
>       * increase the size of the lowmem MMIO hole?  Defaulting to 1

This say "default to 1", but the default is changing to 0 instead.

>       * here will mean that non-libxl toolstacks (including xend and
>       * home-grown ones) means that those using qemu-xen will still
> -     * experience the memory relocation bug described below; but it
> -     * also means that those using qemu-traditional will *not*
> -     * experience any change; and it also means that there is a
> -     * work-around for those using qemu-xen, namely switching to
> -     * qemu-traditional.
> -     *
> -     * If we defaulted to 0, and failing to resize the hole caused any
> -     * problems with qemu-traditional, then there is no work-around.
> -     *
> -     * Since xend can only use qemu-traditional, I think this is the
> -     * option that will have the least impact.
> +     * experience the memory relocation bug described below.
>       */
> -    bool allow_memory_relocate = 1;
> +    bool allow_memory_relocate = 0;

I would keep this as 1. libxl does set it to 0 so there's no need to
change the default here. I don't know if non-libxl toolstack will set
the xenstore entry "hvmloader/allow-memory-relocate" with "1" if they
need it.

>  
>      BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
>                   PCI_COMMAND_IO);
> @@ -347,10 +337,7 @@ void pci_setup(void)
>      {
>          /*
>           * At the moment qemu-xen can't deal with relocated memory regions.
> -         * It's too close to the release to make a proper fix; for now,
> -         * only allow the MMIO hole to grow large enough to move guest memory
> -         * if we're running qemu-traditional.  Items that don't fit will be
> -         * relocated into the 64-bit address space.
> +         * It's too close to the release to make a proper fix.

I feel like this is removing too much information. Maybe instead of "if
we are running qemu-traditional", we could have "if
allow_memory_relocate is true".

>           *
>           * This loop now does the following:
>           * - If allow_memory_relocate, increase the MMIO hole until it's
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index 2d07ce1290..79c0e6bd4a 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -843,14 +843,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>  
>      /* If the device model is specified switch to the corresponding tables */
>      s = xenstore_read("platform/device-model", "");
> -    if ( !strncmp(s, "qemu_xen_traditional", 21) )
> -    {
> -        config->dsdt_anycpu = dsdt_anycpu;
> -        config->dsdt_anycpu_len = dsdt_anycpu_len;
> -        config->dsdt_15cpu = dsdt_15cpu;
> -        config->dsdt_15cpu_len = dsdt_15cpu_len;

Those `dsdt_anycpu` and `dsdt_15cpu` blob are still built in. The are
both associated with qemu-trad so should not be included in hvmloader
anymore.

> -    }
> -    else if ( !strncmp(s, "qemu_xen", 9) )
> +    if ( !strncmp(s, "qemu_xen", 9) )
>      {
>          config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
>          config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index e7667f1ce3..02c4d8d123 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -70,7 +70,6 @@ ChannelConnectionSocket ChannelConnection = 2
>  type DeviceModelVersion int
>  const(
>  DeviceModelVersionUnknown DeviceModelVersion = 0
> -DeviceModelVersionQemuXenTraditional DeviceModelVersion = 1
>  DeviceModelVersionQemuXen DeviceModelVersion = 2
>  )
>  
> diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
> index 34f6753f61..396e3e01e2 100644
> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -105,7 +80,7 @@ int main(int argc, char **argv)
>  {
>      unsigned int cpu, max_cpus;
>  #if defined(CONFIG_X86)
> -    dm_version dm_version = QEMU_XEN_TRADITIONAL;
> +    dm_version dm_version = QEMU_XEN;

This change means that we are going to have "dsdt_anycpu" (.asl and blob)
been the same as "dsdt_anycpu_qemu_xen". Instead of changing the
default, could you ensure that `--dm-version` is provided on the command
line or return an error? No more default `dm_version`.

>      unsigned int slot, dev, intx, link;
>  
>      max_cpus = HVM_MAX_VCPUS;
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e03599ea99..9c56c4c9e5 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -100,12 +100,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>  
>      if (!b_info->device_model_version) {

A lot more can be removed in this blocks. In all cases, we set
device_model_version=qemu-xen. Which mean it's qemu-xen in the condition
just after.

>          if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
> -            if (libxl_defbool_val(b_info->device_model_stubdomain)) {
> -                b_info->device_model_version =
> -                    LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
> -            } else {
> -                b_info->device_model_version = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
> -            }
> +            b_info->device_model_version = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
>          } else {
>              b_info->device_model_version =
>                  LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
> @@ -117,16 +112,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>              dm = libxl__domain_device_model(gc, b_info);
>              rc = access(dm, X_OK);
>              if (rc < 0) {
> -                /* qemu-xen unavailable, use qemu-xen-traditional */
> -                if (errno == ENOENT) {
> -                    LOGE(INFO, "qemu-xen is unavailable"
> -                         ", using qemu-xen-traditional instead");
> -                    b_info->device_model_version =
> -                        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
> -                } else {
> -                    LOGE(ERROR, "qemu-xen access error");
> -                    return ERROR_FAIL;
> -                }
> +                LOGE(ERROR, "qemu-xen access error");
> +                return ERROR_FAIL;
>              }
>          }
>      }
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index b193a5dc37..4146ee0ea1 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2429,16 +2155,11 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>                          "%s",
>                          libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
>      }
> -    /* Disable relocating memory to make the MMIO hole larger
> -     * unless we're running qemu-traditional and vNUMA is not
> -     * configured. */
> +    /* Disable relocating memory to make the MMIO hole larger. */

I don't think this sentence as the right meaning :-). I feel like this
read as " the following make the MMIO hole larger", but I think it is
just an explanation of what "relocating memory" mean, and what is
messing.

We might want to rewrite the comment, "disable relocating memory, see
comment in hvmloader about the meaning". Or "disable relocating memory,
having a lager MMIO hole isn't implemented with qemu-xen". Or something
like that.

There's the same comment in the non-stubdom code path
(device_model_launch) just below..

>      libxl__xs_printf(gc, XBT_NULL,
>                       libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate",
>                                      libxl__xs_get_dompath(gc, guest_domid)),
> -                     "%d",
> -                     guest_config->b_info.device_model_version
> -                        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
> -                     !libxl__vnuma_configured(&guest_config->b_info));
> +                     "0");
>      ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
>      if (ret<0) {
>          LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
> @@ -3162,26 +2879,16 @@ static void device_model_launch(libxl__egc *egc,
>          libxl__xs_printf(gc, XBT_NULL,
>                           GCSPRINTF("%s/hvmloader/bios", path),
>                           "%s", libxl_bios_type_to_string(b_info->u.hvm.bios));
> -        /* Disable relocating memory to make the MMIO hole larger
> -         * unless we're running qemu-traditional and vNUMA is not
> -         * configured. */
> +        /* Disable relocating memory to make the MMIO hole larger. */
>          libxl__xs_printf(gc, XBT_NULL,
>                           GCSPRINTF("%s/hvmloader/allow-memory-relocate", path),
> -                         "%d",
> -                         b_info->device_model_version==LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
> -                         !libxl__vnuma_configured(b_info));
> +                         "0");
>          free(path);
>      }
>  
> diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
> index 6091a5f3f6..f0a74fc82c 100644
> --- a/tools/libs/light/libxl_dom_suspend.c
> +++ b/tools/libs/light/libxl_dom_suspend.c
> @@ -85,15 +85,8 @@ void libxl__domain_suspend_device_model(libxl__egc *egc,
>      STATE_AO_GC(dsps->ao);
>      int rc = 0;
>      uint32_t const domid = dsps->domid;
> -    const char *const filename = dsps->dm_savefile;
>  
>      switch (libxl__device_model_version_running(gc, domid)) {
> -    case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL: {
> -        LOGD(DEBUG, domid, "Saving device model state to %s", filename);
> -        libxl__qemu_traditional_cmd(gc, domid, "save");
> -        libxl__wait_for_device_model_deprecated(gc, domid, "paused", NULL, NULL, NULL);

That function isn't used anymore, and can be removed from libxl. Same
for libxl__xenstore_child_wait_deprecated() which is used by it.

> -        break;
> -    }
>      case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
>          /* calls dsps->callback_device_model_done when done */
>          libxl__qmp_suspend_save(egc, dsps); /* must be last */
> diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
> index 634f3240d1..98d44597a7 100644
> --- a/tools/libs/light/libxl_stream_write.c
> +++ b/tools/libs/light/libxl_stream_write.c
> @@ -252,10 +252,6 @@ void libxl__stream_write_start(libxl__egc *egc,
>          stream->device_model_version =
>              libxl__device_model_version_running(gc, dss->domid);
>          switch (stream->device_model_version) {
> -        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
> -            stream->emu_sub_hdr.id = EMULATOR_QEMU_TRADITIONAL;

EMULATOR_QEMU_TRADITIONAL is still defined in libxl_sr_stream_format.h,
we probably what to comment it out.

> -            break;
> -
>          case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
>              stream->emu_sub_hdr.id = EMULATOR_QEMU_UPSTREAM;
>              break;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 9bb2969931..246bb3ddd2 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -104,7 +104,6 @@ libxl_channel_connection = Enumeration("channel_connection", [
>  
>  libxl_device_model_version = Enumeration("device_model_version", [
>      (0, "UNKNOWN"),
> -    (1, "QEMU_XEN_TRADITIONAL"), # Historical qemu-xen device model (qemu-dm)

I think we need to keep that, so application using libxl and using this
value don't need to be changed. At least, that's a promise made in
libxl.h about the API.

>      (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
>      ])
>  
> diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migration/libxl.py
> index 5dcb50fe02..dc5c7ac355 100644
> --- a/tools/python/xen/migration/libxl.py
> +++ b/tools/python/xen/migration/libxl.py
> @@ -51,12 +51,10 @@ rec_type_to_str = {
>  EMULATOR_HEADER_FORMAT = "II"
>  
>  EMULATOR_ID_unknown       = 0x00000000
> -EMULATOR_ID_qemu_trad     = 0x00000001

Should we keep this value as a comment? Or maybe the information in
"docs/specs/libxl-migration-stream.pandoc" is enough.

>  EMULATOR_ID_qemu_upstream = 0x00000002
>  
>  emulator_id_to_str = {
>      EMULATOR_ID_unknown       : "Unknown",
> -    EMULATOR_ID_qemu_trad     : "Qemu Traditional",
>      EMULATOR_ID_qemu_upstream : "Qemu Upstream",
>  }
>  

Thanks,

-- 
Anthony PERARD

