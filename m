Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E85B1E54
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403361.645450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHMz-0005Yg-VS; Thu, 08 Sep 2022 13:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403361.645450; Thu, 08 Sep 2022 13:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHMz-0005W1-SN; Thu, 08 Sep 2022 13:15:01 +0000
Received: by outflank-mailman (input) for mailman id 403361;
 Thu, 08 Sep 2022 13:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUpx=ZL=citrix.com=prvs=24378778c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWHMz-0005NL-4r
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 13:15:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc3f604-2f78-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 15:14:59 +0200 (CEST)
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
X-Inumbo-ID: 3cc3f604-2f78-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662642899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QHACZeHQLuGgufpcNAkKJ8fvLFdqoUPLAp2O4ex5vAM=;
  b=X1jL6ZIdoJ6IC/DHEgoPSvzU9BVOBWhcP4lleD/HCy7bR1LKC/XZxI2j
   p6BcMyCiIj/fbwk8dsmmricM4EBb7m5x024NgQkA4YSW0AQ1qZaNTsGZK
   bMe/EfT9w/4AI/eO8AyG3HzKX7wddxDGDsBhJYsIbzxkD2V6/6BmiyEhU
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79752218
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oSu5DK5VsFIkfZ1i6+E8bgxRtDDHchMFZxGqfqrLsTDasY5as4F+v
 mccUDzQbvmLNGryL4x2Pdng8UlQvpSHn4RmGQprqXw8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks+5KSq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJB41JKA8oepYOzlHz
 NgnJBdVUhmapcvjldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESxRJJlcQDoN4hOqyj2PzWzZZtEiUtew85G27IAlZj+mybYCPI4ziqcN9nAGi/
 mmd3kfDLDIDaN6fxjjZ33yNmbqa9c/8cN1LT+DpnhJwu3WJwXcZEhoRVl2Trvywi0r4UNVaQ
 2QW9TAptrMa71GwQ5/2WBjQiGGAlg4RXZxXCeJSwAOEzKbO8huaLmcBRz9FLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxmvw
 CmniHMyqI9LhPcv6KmcpWzOmhCF882hohEO2unHYo60xlonOtT7PNXztQezAeVod9jAEATY1
 JQQs43Htb1VU8nQ/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+yzMUJVJdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDOhT2yzRd8yv1mZ
 /93lPpA6l5DUMxaIMeeHb9BgdfHOAhlrY8seXwL50v+iufPDJJkYbwELEGPfogE0U9wmy2Mq
 o43Cid/408AOAEISnWIrNV7wJFjBSRTOK0aXOQGKbXTeVQ5RTxJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:YtNMIKBCUcuNNVzlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.93,300,1654574400"; 
   d="scan'208";a="79752218"
Date: Thu, 8 Sep 2022 14:14:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH 3/3] xl/libxl: Add OEM string support to smbios
Message-ID: <Yxnqw7wLlkMtijDK@perard.uk.xensource.com>
References: <20220810194827.103428-1-jandryuk@gmail.com>
 <20220810194827.103428-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220810194827.103428-4-jandryuk@gmail.com>

On Wed, Aug 10, 2022 at 03:48:27PM -0400, Jason Andryuk wrote:
> Add support for OEM strings in the SMBIOS type 11.
> 
> hvmloader checks them sequentially, so hide the implementation detail.
> Allow multiple plain oem= items and assign the numeric values
> internally.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  docs/man/xl.cfg.5.pod.in           |  4 ++
>  tools/golang/xenlight/types.gen.go | 99 ++++++++++++++++++++++++++++++
>  tools/libs/light/libxl_types.idl   | 99 ++++++++++++++++++++++++++++++
>  tools/xl/xl_parse.c                | 15 +++++
>  4 files changed, 217 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 7edf5d23f3..7947bf07ea 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2104,8 +2104,12 @@ Each B<SMBIOS_SPEC_STRING> is a C<KEY=VALUE> string from the following list:
>  
>  =item B<battery_device_name=STRING>
>  
> +=item B<oem=STRING>
> +
>  =back
>  
> +oem= strings can be specified mutiple times up to a limit of 99.

This could be move to just before =back I think.

> +
>  =item B<ms_vm_genid="OPTION">
>  
>  Provide a VM generation ID to the guest.
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d04207748e..58f404af37 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -436,6 +436,105 @@ libxl_smbios_type = Enumeration("smbios_type", [
>      (15, "enclosure_asset_tag"),
>      (16, "battery_manufacturer"),
>      (17, "battery_device_name"),
> +    (18, "oem_1"),
> +    (19, "oem_2"),
> +    (20, "oem_3"),
[...]
> +    (115, "oem_98"),
> +    (116, "oem_99"),

Instead of this long lists of enum value, could we just have one "oem"
type, and allow it to be used more than once? I know that would mean
having a special case in libxl, but that also mean that libxl will be
the only one to deal with the implementation detail on how to write oem
string for hvmloader (as opposed to deal with this in every application
using libxl).

>      ])
>  
>  libxl_smbios = Struct("smbios", [
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 4f3f962773..fb7f1f6867 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1787,12 +1787,16 @@ void parse_config_data(const char *config_source,
>          switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
>          {
>          case 0: /* Success */
> +        {
> +            unsigned int num_oem = 1;
> +
>              b_info->u.hvm.num_smbios = num_smbios;
>              b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
>              for (i = 0; i < num_smbios; i++) {
>                  char *option_untrimmed, *value_untrimmed;
>                  char *option, *value;
>                  libxl_smbios_type v;
> +                char oem_buf[] = "oem_99";
>  
>                  buf = xlu_cfg_get_listitem(smbios, i);
>                  if (!buf) continue;
> @@ -1807,6 +1811,16 @@ void parse_config_data(const char *config_source,
>                  trim(isspace, option_untrimmed, &option);
>                  trim(isspace, value_untrimmed, &value);
>  
> +                if (strcmp(option, "oem") == 0) {
> +                    if (num_oem > 99) {
> +                        fprintf(stderr, "xl: sbmios oem strings limited to 99\n");
> +                        exit(-ERROR_FAIL);
> +                    }
> +                    sprintf(oem_buf, "oem_%d", num_oem);
> +                    num_oem++;
> +                    option = oem_buf;

This mean that my proposal to free option in the previous patch isn't
going to work well. But you could free option before assigning a new
value.

An alternative to generate a string to be converted to an enum
value would be to simply do "LIBXL_SMBIOS_TYPE_OEM_1+num_oem-1".
Or just deal with oem string in libxl as proposed above.

> +                }
> +
>                  e = libxl_smbios_type_from_string(option, &v);
>                  if (e) {
>                      fprintf(stderr,
> @@ -1819,6 +1833,7 @@ void parse_config_data(const char *config_source,
>                  b_info->u.hvm.smbios[i].value = value;
>              }
>              break;
> +        }
>          case ESRCH: break; /* Option not present */
>          default:
>              fprintf(stderr,"xl: Unable to parse smbios options.\n");

Thanks,

-- 
Anthony PERARD

