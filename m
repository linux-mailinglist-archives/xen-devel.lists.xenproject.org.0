Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A264754F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 19:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457391.715289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LI0-0001Le-Mz; Thu, 08 Dec 2022 18:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457391.715289; Thu, 08 Dec 2022 18:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LI0-0001IT-K0; Thu, 08 Dec 2022 18:06:32 +0000
Received: by outflank-mailman (input) for mailman id 457391;
 Thu, 08 Dec 2022 18:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IV7D=4G=citrix.com=prvs=33468bdba=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3LHz-00014R-5Y
 for xen-devel@lists.xen.org; Thu, 08 Dec 2022 18:06:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07213886-7723-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 19:06:27 +0100 (CET)
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
X-Inumbo-ID: 07213886-7723-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670522789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BEkiCaG1nchMrBJckDTO6VnuMq3jaTUyieNG0dM2UWg=;
  b=Nc+XKny36DPm+aQOv7o+171b0j/dPxNNxve4yVXKqnoROAYy0WWb6zwW
   8J3RCB2S891STInmfhzfwoXRb4QPbv1443gU02irVch1nHKhbGb7fjudV
   qggY3zRXmygJzYk1rbzEz85+uoZaqieSS01Yc4qr0J/w45zi4rLI+8WV7
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86862358
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IbGY8q5/bz2hyq3Oda9IOAxRtFHAchMFZxGqfqrLsTDasY5as4F+v
 jAaUGCOPqrcYzSkKIpxPo6+oxsPvsSEydUyGwBopSowHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 8NBI2ACYxe/2O+R3riLbclSicp8BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0FwBbG/
 DmbrwwVBDkHCdmlyGe5yUjx2POVsgT6BthCNoe3o6sCbFq7mTVIVUx+uUGAifywlk6/Vs8ZM
 0sV4Csjt4A29UqiVN67VBq9yFafohMSUtxXVfYm4QuAzq7V5QexFmkATzhRLtchsaceTDgnx
 hmDktXvCDFHtLyTQGiasLCOoluaJiw9PWIEIygeQmMt5N3uo5ovnwnPZtlmGa+xyNbyHFnYx
 jGJoW4+gLEWgNUj06S99ErAxTW2qfDhTAEv4R7Mdnm49Q4/b4mgD6S45F6e4fteIYKxSliao
 GNCi8WYqucUAvmlii2XTf4NWrK04v+fGDndh1d1GN8m7TvF02W/Z4lM5yo7KEp3GsEcPDvoe
 1PI/wdQ4pZJOz2td6AfS5ywDc8ny7SmGsnkSuzTcvJKY554bgjB+zthDWaSwmTsnU4Egaw5f
 5CBfq6R4W0yUPo9imDsHqFEjOFtlntWKX7vqY7TlSv+2uqRaXmpFroiLlG+ScAH463biVCAm
 zpADPeixxJaWez4RyDY948PMFwHRUQG6YDKR99/LbDafFc/cI01I7qImO56JdQ590hAvr2Ql
 kxRTHO037YWaZfvDQyRIk5uZ7r0NXqUhSJqZHd8VbpENpVKXGpO0Ev9X8FvFVXE3LY5pRKRc
 xXiU5voPxi3Ym6bkwnxlLGkxGCYSDylhBiVIw2uayUlcphrSmTho4G7Jle0pHFVV3Dp7aPSR
 oFMMSuCEPI+q/lKVp6KOJpDMXvu1ZTipA6CdxSReYQCEKkd2INrNzbwnpcKzzIkcH3+Ks+h/
 1/OW38w/LCdy7LZBfGV3choWa/1SbohdqebdkGHhYuL2d7yoTr7kNARCr/VFd0fPUutkJifi
 Sxu56mUGJU6cJxi6uKQz54DIXoC2ubS
IronPort-HdrOrdr: A9a23:SP59SKvjjBOTi3F8UxGOYvHE7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.96,227,1665460800"; 
   d="scan'208";a="86862358"
Date: Thu, 8 Dec 2022 18:06:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH V7 1/3] libxl: Add support for generic virtio device
Message-ID: <Y5InlfaQoY18WjZe@perard.uk.xensource.com>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
 <903506db6c7dadb2a5304e9894950c673e308f41.1670396758.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <903506db6c7dadb2a5304e9894950c673e308f41.1670396758.git.viresh.kumar@linaro.org>

On Wed, Dec 07, 2022 at 12:50:42PM +0530, Viresh Kumar wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index fa3d61f1e882..ab3668b3b8a3 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> +static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
> +                                        uint32_t irq, const char *type,
> +                                        uint32_t backend_domid)
> +{
> +    int res, len = strlen(type);
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
> +    if (res) return res;
> +
> +    /* Add device specific nodes */
> +    if (!strncmp(type, "virtio,device22", len)) {

So with `len` been the strlen() of `type`, I think that a type "v" or
"virtio" or even "virtio,device" is going to create the "i2c" node. So I
don't think is going to be possible to create a generic virtio device
node.

Using strcmp() would be good enough here I think.

> +        res = make_virtio_mmio_node_i2c(gc, fdt);
> +        if (res) return res;
> +    } else if (!strncmp(type, "virtio,device29", len)) {
> +        res = make_virtio_mmio_node_gpio(gc, fdt);
> +        if (res) return res;
> +    } else if (!strncmp(type, "virtio,device", len)) {

The example in in the commit message has "virtio,devices" but that would
be rejected by this test due to the extra 's'.

> +        /* Generic Virtio Device */
> +        res = fdt_end_node(fdt);

Isn't this an extra end_node() call? As there's already one for the
return of the function.

> +        if (res) return res;
> +    } else {
> +        LOG(ERROR, "Invalid type for virtio device: %s", type);
> +        return -EINVAL;
> +    }
> +
> +    return fdt_end_node(fdt);
> +}
> +
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> new file mode 100644
> index 000000000000..64cec989c674
> --- /dev/null
> +++ b/tools/libs/light/libxl_virtio.c
> +static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
> +                                       libxl_devid devid,
> +                                       libxl_device_virtio *virtio)
> +{
> +    const char *be_path, *tmp = NULL;
> +    int rc;
> +
> +    virtio->devid = devid;
> +
> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> +                                  GCSPRINTF("%s/backend", libxl_path),
> +                                  &be_path);
> +    if (rc) goto out;
> +
> +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
> +    if (rc) goto out;
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/irq", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->irq = strtoul(tmp, NULL, 0);
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/base", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->base = strtoul(tmp, NULL, 0);
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/transport", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        if (!strncmp(tmp, "mmio", strlen(tmp))) {

Maybe just use strcmp(), otherwise we have "m" going to be match as MMIO
for example.

> +            virtio->transport = LIBXL_VIRTIO_TRANSPORT_MMIO;
> +        } else if (!strncmp(tmp, "unknown", strlen(tmp))) {
> +            virtio->transport = LIBXL_VIRTIO_TRANSPORT_UNKNOWN;

I don't think that value should be allowed in xenstore. If `transport`
isn't set to a proper value (only "mmio"), then I think that invalid.

> +        } else {
> +            return ERROR_INVAL;
> +        }
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/type", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        if (!strncmp(tmp, "virtio,device", strlen("virtio,device"))) {

Nit: Something like:
    const char check[] = "virtio,device";
    const size_t checkl = sizeof(check) - 1;
    ... strncmp(tmp, check, checkl)...
    (or just strncmp(tmp, check, sizeof(check)-1))
would avoid issue with both string "virtio,device" potentially been
different.


> +            virtio->type = strdup(tmp);

Could you use libxl__strdup(NO_GC, tmp) instead? That function is going
to check that strdup() doesn't fail the allocation.


Thanks,

-- 
Anthony PERARD

