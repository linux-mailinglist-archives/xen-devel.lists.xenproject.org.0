Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5055B3507
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404134.646481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWb75-0000UE-O2; Fri, 09 Sep 2022 10:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404134.646481; Fri, 09 Sep 2022 10:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWb75-0000SE-LH; Fri, 09 Sep 2022 10:19:55 +0000
Received: by outflank-mailman (input) for mailman id 404134;
 Fri, 09 Sep 2022 10:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWb74-0000S6-WC
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:19:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c49d28-3028-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 12:19:53 +0200 (CEST)
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
X-Inumbo-ID: f0c49d28-3028-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662718793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5QzqMoYYexDvmV4qRCgPFEnGFIR2jMBBPwRamOYQ/s4=;
  b=e4e9H55iLWxqM2CnbvsCmNaAf4mz/REz/lS3k34V60/tu/9TwqsO8Vz8
   dReaDYSR6BwhVaMk6bWKIiauIg0iPYd7ILT9ye+9rEYFGsMr+ur45h+tJ
   4sfyPAxDFxUInAAVLwPxWfYL+l9lwoKQdum3f9NtuIi+uoAQ/0IVQaqsJ
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79831939
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yOF/tq+VlObAcl4/8ZZ0DrUDi36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DMfWmqFbK6IamWgfNl3b4/g8hkO7ZPXzoRmHVFr/Co8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EI37ayr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGS24SAaM/wu1MUFpA+
 OQfDW1KVxyyiLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQugei2aYuOK7RmQ+1llFyH5
 V6X3FjeB0pFN9CRkxOK9Cqz07qncSTTB9tJSezQGuRRqEeU3WYJDxoVU3O0pPC4jgi1XNc3A
 04b4C01toAp6VemCNL6WnWQv3qsrhMaHd1KHIUS6giLxrDF/gWxCW0NTzoHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMXbf5
 wykixA1vOQog8MT0IDmumnLsj358/AlUTUJChXrsnONt10nPtD+Ptf0tjA3/t4bct/HEwDpU
 Gws3pHHsbtQVczleDmlGr1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeB5vsU70IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxDKgT63yRd2yPxgU
 Xt+TSpLJS9CYZmLMRLsH7tNuVPV7ntWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt0EAFe/iFyMq
 75i2z6ikUo3vBvWPnaKqub+7DkicRAGOHwBg5AJKbXbf1E5RgnMyZb5mNscRmCspIwN/s+gw
 513chYGoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:J7US+qGTfx7+cF3HpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.93,302,1654574400"; 
   d="scan'208";a="79831939"
Date: Fri, 9 Sep 2022 11:19:39 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v2 2/3] xl/libxl: Add ability to specify SMBIOS strings
Message-ID: <YxsTO9Ds2RNJo/3W@perard.uk.xensource.com>
References: <20220908195113.218201-1-jandryuk@gmail.com>
 <20220908195113.218201-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220908195113.218201-3-jandryuk@gmail.com>

On Thu, Sep 08, 2022 at 03:51:12PM -0400, Jason Andryuk wrote:
> hvm_xs_strings.h specifies xenstore entries which can be used to set or
> override smbios strings.  hvmloader has support for reading them, but
> xl/libxl support is not wired up.
> 
> Allow specifying the strings with the new xl.cfg option:
> smbios=["bios_vendor=Xen Project","system_version=1.0"]

I've tried something like:
    smbios=['oem=foo=bar']
And only "foo" is added to the smbios string. Shouldn't we allow users
to have '=' in their smbios strings?

> ---
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c..c3125ed310 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -771,6 +771,27 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
>              goto err;
>      }
>  
> +    for (int i = 0; i < info->u.hvm.num_smbios; i++) {
> +        char *p;
> +        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
> +                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
> +
> +        /* Convert libxl_smbios_type string to xenstore path that hvmloader
> +           will use, as defined by HVM_XS_*. That is convert the '_' to '-'. */

Could you add a '*' on the second line of that multi-line comment ?
    /* Multi-line
     * comments */

> +        p = strrchr(path, '/');
> +        for ( ; *p; p++) {
> +            if (*p == '_')
> +                *p = '-';
> +        }
> +
> +        LOGD(DEBUG, domid, "Writing %s = \"%s\"\n", path,

Could you remove the \n ? LOGD() macro already adds a new line.

> +             info->u.hvm.smbios[i].value);
> +        ret = libxl__xs_printf(gc, XBT_NULL, path, "%s",
> +                               info->u.hvm.smbios[i].value);
> +        if (ret)
> +            goto err;
> +    }
> +
>      /* Only one module can be passed. PVHv2 guests do not support this. */
>      if (dom->acpi_modules[0].guest_addr_out && 
>          info->type == LIBXL_DOMAIN_TYPE_HVM) {

The rest of the patch looks fine, even if I can't say much about the
generated golang code.

Thanks,

-- 
Anthony PERARD

