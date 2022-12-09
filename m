Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321E648808
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 18:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458135.716002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3hb6-0003vx-CI; Fri, 09 Dec 2022 17:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458135.716002; Fri, 09 Dec 2022 17:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3hb6-0003uA-8z; Fri, 09 Dec 2022 17:55:44 +0000
Received: by outflank-mailman (input) for mailman id 458135;
 Fri, 09 Dec 2022 17:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3hb4-0003u4-91
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 17:55:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff301b9-77ea-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 18:55:39 +0100 (CET)
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
X-Inumbo-ID: aff301b9-77ea-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670608539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Da5r3qrCgCJJbhjqKYMWV92A56wv9iJQTi9CRcKJV0k=;
  b=J7Ragh9rvO8Sb9i0DeCZangX4OpTGHuWU9Q8ZdoS9ugLDKD8qZofRy3/
   z1yEJKn+wRfhjwNif025yCerDVzWDRBhYflreB0Mvf75hbMHkPjCzwibm
   W/MGsI61hxExCJzzhZXHCz26+4Mv9iOEy6h6nE2imcoVDMQhAVevNI1hb
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87614104
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iKi7oKzOGSXipz98bjN6t+fmxirEfRIJ4+MujC+fZmUNrF6WrkVTn
 WYbCjyPOP6DNzakLosiaoXn9UIDvMPWn9QxTwdlrSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPaET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX9R9
 dkydRlVVxqGi/+o3Z6KcMxure12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZoLxxrB/
 j6uE2LRPys2bdyjzD68y2+suOnXsgDeZatDG+jtnhJtqALKnTFCYPEMbnO5vP24h0iWS99Zb
 UsO9UIGibU5/QqFR9/2Uhm8vVaNpBtaUN1Ve8Ul7Cmdx6yS5ByWbkAaTz1bYdlgu8YsRSMj0
 neAmt+vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTJC6Z6mCtHGD1PxFIJuHU3Wwh
 l0GsOHLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmB2ycnT2
 r/BK65A6Er27ow5pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlns/vZ+lmJq
 4cFbJLiJ/BjvArWO3i/zGLuBQpScShT6W7e9KS7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 ijVZ6Os83Km3SevAVzTOhhehEbHAc4XQYQTYXZ9Yj5FGhELPe6S0UvoX8FsJel8pbEzkqMco
 jtsU5zoP8mjgw/vo1w1BaQRZqQ7HPh3rWpi5xaYXQU=
IronPort-HdrOrdr: A9a23:ynZlvKrlIwh6scBT5trtBOkaV5oNeYIsimQD101hICG9JPbo7f
 xGuM5rrCMc7wxhPk3I+OrwX5VoJEm3yXcb2/hzAV7PZmnbUQiTXeVfBOnZsl/d8nbFh5ZgPM
 5bGsAUNDSaNykesS+V2miFOudl6MWb9rulnOLPpk0dNj2CqJsN0+66MGum+4FNKzWuzKBWKK
 ah
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87614104"
Date: Fri, 9 Dec 2022 17:55:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN][RFC PATCH v4 16/16] tools/xl: Add new xl command overlay
 for device tree overlay support
Message-ID: <Y5N2lU8f3PVOTNSa@perard.uk.xensource.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-10-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221207061815.7404-10-vikram.garhwal@amd.com>

On Tue, Dec 06, 2022 at 10:18:15PM -0800, Vikram Garhwal wrote:
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 35182ca196..868364c58d 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -630,6 +630,12 @@ const struct cmd_spec cmd_table[] = {
>        "Issue a qemu monitor command to the device model of a domain",
>        "<Domain> <Command>",
>      },
> +    { "dt_overlay",

Command with multiple words are using '-' instead of '_', could you
rename the command to "dt-overlay"?

> +      &main_dt_overlay, 0, 1,
> +      "Add/Remove a device tree overlay",
> +      "add/remove <.dtbo>"
> +      "-h print this help\n"
> +    },
>  };
>  
>  const int cmdtable_len = ARRAY_SIZE(cmd_table);
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 5518c78dc6..b5f04e2741 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1265,6 +1265,54 @@ int main_create(int argc, char **argv)
>      return 0;
>  }
>  
> +int main_dt_overlay(int argc, char **argv)
> +{
> +    const char *overlay_ops = NULL;
> +    const char *overlay_config_file = NULL;
> +    void *overlay_dtb = NULL;
> +    int rc;
> +    uint8_t op;
> +    int overlay_dtb_size = 0;
> +    const int overlay_add_op = 1;
> +    const int overlay_remove_op = 2;
> +
> +    if (argc < 2) {
> +        help("dt_overlay");
> +        return EXIT_FAILURE;
> +    }
> +
> +    overlay_ops = argv[1];
> +    overlay_config_file = argv[2];
> +
> +    if (strcmp(overlay_ops, "add") == 0)
> +        op = overlay_add_op;
> +    else if (strcmp(overlay_ops, "remove") == 0)
> +        op = overlay_remove_op;
> +    else {
> +        fprintf(stderr, "Invalid dt overlay operation\n");
> +        return ERROR_FAIL;

ERROR_FAIL isn't really a value to be used when exiting the programme,
it's value is -3. It's from libxl API.

Instead, could you return EXIT_FAILURE?

> +    }
> +
> +    if (overlay_config_file) {
> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
> +                                      &overlay_dtb, &overlay_dtb_size);
> +
> +        if (rc) {
> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
> +                    overlay_config_file);
> +            free(overlay_dtb);
> +            return ERROR_FAIL;
> +        }
> +    } else {
> +        fprintf(stderr, "overlay dtbo file not provided\n");
> +        return ERROR_FAIL;
> +    }
> +
> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);

Value returned by libxl_*() are going to be negative when there's an
error, so not something to be return by main(). Could you check if
there's an error and return EXIT_FAILURE instead?

> +    free(overlay_dtb);
> +    return rc;
> +}

Thanks,

-- 
Anthony PERARD

