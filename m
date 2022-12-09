Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151C648398
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 15:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457939.715875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3eB7-0005L8-PQ; Fri, 09 Dec 2022 14:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457939.715875; Fri, 09 Dec 2022 14:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3eB7-0005I2-MB; Fri, 09 Dec 2022 14:16:41 +0000
Received: by outflank-mailman (input) for mailman id 457939;
 Fri, 09 Dec 2022 14:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3eB5-0005Hw-Cm
 for xen-devel@lists.xen.org; Fri, 09 Dec 2022 14:16:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d944a2-77cc-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 15:16:37 +0100 (CET)
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
X-Inumbo-ID: 16d944a2-77cc-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670595397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wGvvzH91y6H3qPilRsGLDel2H6kqwOpGnwmPmSDEzDc=;
  b=PRkuu6+imBBxYdGZyIqgwjvMABNYzsSp9CAi83o6HVYCbsjXO8KWkOvQ
   bsRetKP13CiRqS/lk8RsiDhxDF2wmdgUqVzkyfFw5PPgTiNMwKUUt1PLJ
   U4p6pU5Konr4auLjfl0Q2JdaNDQ45Cw7Jz5iP+OS35eOKScQOWF30B5t9
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87570546
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xB4BiKJl0LrSahYaFE+RupIlxSXFcZb7ZxGr2PjKsXjdYENS12MAz
 GccCDvVM/qMMWuheo9zPNu19RtV6sDdy9M2QABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5oQm9f3
 P5Dcgsscw/EptmfmJy/ZrFj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozVGJoNwxrGz
 o7A10SoAVYWBefY8CamzCisqc6fsyP8aLtHQdVU8dY12QbOlwT/EiY+UFKnofi0lwimXNNFK
 kEO0i4vq6Eo8wqgSdyVdwakrXCNuBlaQMZZGeA+7ACLy4LE4gKYAHhCRTlEAPQvsMImAzYn0
 FmEkvvtBDpmqrrTTmiSnp+LqRuiNC5TKnUNDQcDSQYG+MXyu4EbgRfGT9IlG6mw5vXwGDL9h
 TCNqC0znJ0XjMgCzaL9+krI6xquqYLOVRUd/RjMUySu6QYRTJ6oYcmk5EbW6d5ELZ2FVR+Rs
 X5CnNKRhMgQDIuAjyzLQ/gIFauB4/eDOSfbx1l1EPEJ7Ci38mKkZsVc7S9WI18sNscfZSSvZ
 E7VsBlWophJMxOCc65xaI+3F4Il0Kn8CdP5fvTVaNNUZd52bgDv1CNzYU+d2Uj9nU5qlrswU
 ap3au71UyxcU/4+imPrGaFNitfH2xzS20vMBp7q5hb8i4G/eWHSaIwsaHWKQrg2ufbsTBruz
 /5TMM6DyhN6WeL4YzXK/YN7EW3mPUTXFrit9ZUJK7frzh5OXTh4VqSPme9Jl5lNxfw9qwvew
 p2qtqa0InLbjGaPFwiFY2sLhFjHDccm9iJT0cDB0D+VN5kfjWSHtv93m3gfJ+NPGAlfIRlcE
 ZE4lz2oWKgnd9g+0211gWPBhIJjbg+3ogmFIjCoZjMyF7Y5GVORp4W4IlO+rnJXZsZSiSfZi
 +Txvj43vLJZH1gyZCooQK3HI6yNUYg1x7spAhqgzih7c0Tw6ol6QxEdfdduS/zg3S7rn2PAv
 y7PWEdwmAU4i9NtmDU/rfze/tjB/ioXNhYyIlQ3Gp7qbHOCpTDzm9UbOAtKFBiEPF7JFGyZT
 b0955nB3DcvxwoiX1ZUe1qz8Z8D2g==
IronPort-HdrOrdr: A9a23:ehLjyqEDq7aWQR8dpLqEyseALOsnbusQ8zAXPiFKOHlom6mj/a
 2TdZsguSMc5Ax/ZJhYo6HmBEDiewK/yXcW2+ks1N6ZNWHbUQ2TQr2KhrGSoAEIdReeygdr79
 YFT0EvMrbN5IBB/LzHCdODYq4dKQS8gcaVbDvlvgxQpN9RGtxdB2gQMHfjLnFL
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87570546"
Date: Fri, 9 Dec 2022 14:16:19 +0000
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
Message-ID: <Y5NDM9DYnX3zAxpd@perard.uk.xensource.com>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
 <903506db6c7dadb2a5304e9894950c673e308f41.1670396758.git.viresh.kumar@linaro.org>
 <Y5InlfaQoY18WjZe@perard.uk.xensource.com>
 <20221209001354.ufvavrxvucdvzjks@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221209001354.ufvavrxvucdvzjks@vireshk-i7>

On Fri, Dec 09, 2022 at 05:43:54AM +0530, Viresh Kumar wrote:
> On 08-12-22, 18:06, Anthony PERARD wrote:
> > Nit: Something like:
> >     const char check[] = "virtio,device";
> >     const size_t checkl = sizeof(check) - 1;
> >     ... strncmp(tmp, check, checkl)...
> >     (or just strncmp(tmp, check, sizeof(check)-1))
> > would avoid issue with both string "virtio,device" potentially been
> > different.
> 
> I think that is a generic problem with all the strings I am using. What about
> this diff over current patch ?
> 
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index cdd155d925c1..a062fca0e2bb 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -166,6 +166,11 @@
>  /* Convert pfn to physical address space. */
>  #define pfn_to_paddr(x) ((uint64_t)(x) << XC_PAGE_SHIFT)
>  
> +/* Virtio device types */
> +#define VIRTIO_DEVICE_TYPE_GENERIC   "virtio,device"
> +#define VIRTIO_DEVICE_TYPE_GPIO      "virtio,device22"
> +#define VIRTIO_DEVICE_TYPE_I2C       "virtio,device29"

That a good idea.

>  /* logging */
>  _hidden void libxl__logv(libxl_ctx *ctx, xentoollog_level msglevel, int errnoval,
>               const char *file /* may be 0 */, int line /* ignored if !file */,
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index 64cec989c674..183d9c906e27 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -62,7 +62,7 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
>                                         libxl_device_virtio *virtio)
>  {
>      const char *be_path, *tmp = NULL;
> -    int rc;
> +    int rc, len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;

That `len` variable is initialized quite far away from where it's used,
so ...
>  
>      virtio->devid = devid;
>  
> @@ -112,8 +110,8 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
>      if (rc) goto out;
>  
>      if (tmp) {

... you could declare `len` here instead.

> -        if (!strncmp(tmp, "virtio,device", strlen("virtio,device"))) {
> -            virtio->type = strdup(tmp);
> +        if (!strncmp(tmp, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
> +            virtio->type = libxl__strdup(NOGC, tmp);
>          } else {
>              return ERROR_INVAL;
>          }
> 


Otherwise, those change looks fine.
Thanks,

-- 
Anthony PERARD

