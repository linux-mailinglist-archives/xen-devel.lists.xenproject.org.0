Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D45B1D52
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 14:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403313.645384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGpr-0007FT-Qr; Thu, 08 Sep 2022 12:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403313.645384; Thu, 08 Sep 2022 12:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGpr-0007DV-O9; Thu, 08 Sep 2022 12:40:47 +0000
Received: by outflank-mailman (input) for mailman id 403313;
 Thu, 08 Sep 2022 12:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUpx=ZL=citrix.com=prvs=24378778c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWGpq-0007DP-CW
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 12:40:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 732b018e-2f73-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 14:40:44 +0200 (CEST)
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
X-Inumbo-ID: 732b018e-2f73-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662640844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UHirX8ZPWwvVlfHgN7hlU5UlJmwUZ9tZfxRV1Ldodlo=;
  b=XZK7YDFT/5QKpDYfvPD+rksul6C0jfN74oKuiO5BF+n1A7tvzM9aDWmj
   YRZ+OXNLhCXbw/GJ6ua4qQXZnys6wijNEC4RY7AgZ/bH93VLVFo+Oytbq
   7zrFs5suwUxm6AXa0hFNBBj2/H542qe31Y1iN/TzsKlWaqR5UWxSnkAva
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80056515
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AkUJ2NanOrW9Qf0QNoBP76pjo5mJPLROUhFxM2?=
 =?us-ascii?q?KjiYuv7R7IEGpDEwMcbYTqtoJ1vIw21LNOo3Mk2BvF9wazN9m8VGLUgYDXkQ?=
 =?us-ascii?q?8hXp2zUHSnUq+RCPCajnZkjn7x+WCIf3eL+ceqrcJ7NAvO7zvUWAk2Cfz9Td?=
 =?us-ascii?q?+6fiOT9ni94OVfOOMABpWVIPf7g4n5HD2FdEJfU2v+O34E/NXwgLaSf7qxnd?=
 =?us-ascii?q?Fy6fcz1kdRFS3azE2hG8vzxBNDL3L3YwcJuXeaDvzKBq/6HxfGO1C/40gZbe?=
 =?us-ascii?q?MbvBS/VEgnn9sFsY8sZtJbTGCkR5cNnWjT2HBfNKpjRWKgD4ebEJUNZkob4y?=
 =?us-ascii?q?QhnX/U+dDKdDUN8NQdmK34bFEUd76nEInWD+fzM+Eed9Hr5aMdeJxl4W3BSN?=
 =?us-ascii?q?fKxcJKVgtr7RDQE4bvGbTWTqmpHeQsuKwlpF9fyHIwvQIln4IxwCRPeningC?=
 =?us-ascii?q?eWNA/w/R6LLXp25YMHQDLaewdVVylxDR6t8YTCVv455ZP1z3Q4VozD7BlUsv?=
 =?us-ascii?q?P3o14rBVYUXSPenoEwTY95kBgU6zHTKt7saVpATCSdrpF8SQa/YfMpmDAqhQ?=
 =?us-ascii?q?X9rvotWU45spBlPOrZo4opdlclo4SOlFH0g6ht/jo9ofulKt0ngrkdb6XOP6?=
 =?us-ascii?q?T+EcY+N9k+AnYLWK2Mb6+RLQCOuijS6UP9IrmK55o3+cT6Ya63IjZXo+EuRg?=
 =?us-ascii?q?DV3GgtrlWH8OosmHhgtbwNWp7MikqCowdyxp1qHElDta7Ac0EbUgSSuO7dqy?=
 =?us-ascii?q?3sOACFPCRD719gYI/QKzITlV8+xHQjsGve0J9dLGGOoxh6mbpW6avGvydbCY?=
 =?us-ascii?q?YzaDIyHtGN0BCmHGhpaKhU2KD+IWH7Ef7459YEOosZb+08Hbv/cgGWxkTzEz?=
 =?us-ascii?q?iTXIgHH6S01JI26T8gF8Q8OOA5ZywDKB9cdINjMX4UCNak2Tp+BcEXO2VtKi?=
 =?us-ascii?q?Zit3i4eHnOzCVfURGtVKvnbE0oud9k5bZTsI/ld1Dnb5o+rnxeitoVL59Kdu?=
 =?us-ascii?q?3ilvKH5JJ27VjDLgzPOHLEZ/tXBxx8+EMhWAxj8sefi1TnkbXkAOeUoX7eBQ?=
 =?us-ascii?q?0lPYtlkARy+vQK7ExiFNLOSTrocCoEsDF554s0L6qaTyS90bYuW46WvqiRzf?=
 =?us-ascii?q?oxXxfrSmdhimcI+0kfb7aWU+G2i4lSZpyDXFLw5wLjvx3JvnCWKYjnXvrIka?=
 =?us-ascii?q?OzSLEcJB3u+Vs2PsauuR864xfWsEPOwIa/UJzQ37RtTAjL0IniZmYMUUTIyb?=
 =?us-ascii?q?d/g6WMSZiwRpdGmPktpr1fjTzGeJopTKwAwydwF3L64txQ0lirNhRz/UgOx+?=
 =?us-ascii?q?wviD55wVT+CA6z1x/5BiZbAFdGrpElorXzHQTCl0J6bi5yWuoi4DhtUN4xpm?=
 =?us-ascii?q?v50nwrUF+1Syc/TBzglhYDfeI7T0dEa9GAm3ULnpb+JVN7KyZ8cfub2sUpGc?=
 =?us-ascii?q?rEYjuNEnGjbBmYC00A+tVXCFzw4mUh5kNgEU9HEiFL43/cqlEkdMTPhhAh3S?=
 =?us-ascii?q?fyKmRF6XXqzb5pWyCINOUjcmyyEosZbSuIyBcy/a4QXRHGMwSy/++G541dGh?=
 =?us-ascii?q?/t/+2WVeJMkK2gSVxrcVajNq/K1C0aXKXWTMB16Re+uR8CGe2/gBPQ/636YO?=
 =?us-ascii?q?aN3H8CKpQ3/SeqoZTC1z47J57lSaG4yr1SldR6kgyyAdiYVBq+RUXm14w0GA?=
 =?us-ascii?q?deSX4PKNPeeIySd5ViSZHFWOiXtwXVcW7/QemVxh4tmmy6QGPUub/F+/wujk?=
 =?us-ascii?q?23577D0cFpcOjZHp/TeQMzz7Q119D3uV1IAgxRTE/h8bZv3ugPaYUeycMMKn?=
 =?us-ascii?q?0DcfuEFZ3SIRw3tpuYrgETlyCgVdQgrE0T4ZhKfDwNy1j+TliWtoYF9h7g0Q?=
 =?us-ascii?q?vzBTJDA65Qu07g5U1KpnNjS5AdqnfCRb/qpqEzfU/+WC4ywI6LRrmdgRRBP6?=
 =?us-ascii?q?vor6Pvgxicq2NIIxyC5t6kYtnksXLtw1ekGaNd09QlXDeIc8lkbdrtfhDY9Z?=
 =?us-ascii?q?h8eox5slaGecvMp2W29xATm6vvjNkHAk+bbX3eAqFUHMjV41QePF/hGs8pGx?=
 =?us-ascii?q?9vWZNtk2Qd5Y5u7AjTSSgdGiCuev/UjAvWVQTsnGDI6s6iEnDgeH8oE0xR5D?=
 =?us-ascii?q?/+Rb75lxgxcEtOowIeGx1162XaFaxoCtCLshFXxsXLUp0ssTUvlHThB5t52d?=
 =?us-ascii?q?s9AA0Ud0gzJjZKCX/ishaWGnn+S576LxlF0YWraq9HMAykph3+ZEiu/XRHjV?=
 =?us-ascii?q?9QCWK9VYPPBSVM7l/rW73+LlMuGIqy7NGOB++gIRXUI7SuZiSubGPfOQGY5Z?=
 =?us-ascii?q?R9AN6sXfLM6zF5a3nqfL/ZdshDjPLT49qrYK8XrsxPSBC2os1LYVhAMr9gkR?=
 =?us-ascii?q?zGxAFjgARw8Tx8FTwt1XjoyGFqFTC5UT7ZRgCdrQAy15dSpg++jMM4TIcIdz?=
 =?us-ascii?q?nz10VsJ/FwopocrCWXa00vUgyQpieKisk8Vt3gWqSJyyq28kHXdztTLzPqX/?=
 =?us-ascii?q?XlxPpwybaIZrAI0bU37zc6QMavu6aJ+DgNVBkJGSZBCVspFAITAhIkwMyXxV?=
 =?us-ascii?q?Sp0qHV3QRIerf3h+rdcUaOBLX05hnXeDtmU140yfA7+yZ2UbunxYA1XCaEtR?=
 =?us-ascii?q?2O15+Co4IuBOqIG1hGzPdcWcja2Rt2G9aOVU4i0/wlg+s1Ga8IPlgVOD3yOU?=
 =?us-ascii?q?9v1Fw8yYRRjjumOfK8Duhn9/At/yN2yrXzvSVdiRKvDt3va5wzZ9dAyjh7Z6?=
 =?us-ascii?q?h5vSe5Y0+NMGdYUtvB3l7tX6Naf4rwYqTg0zA5B7fzKi4lSH1/aeAJn1UzTY?=
 =?us-ascii?q?wQlrHeL5UeXRlS5lNCKLwp9z09cWILrF7uiGmLQdqRnJTD9OaZ5ZQGxYtEjm?=
 =?us-ascii?q?60CYItJCnVw74mdsTmNeQ4YpuxJQg+o4+NXv7jhI8w9iM9RHoY2C7c5mA=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.93,300,1654574400"; 
   d="scan'208";a="80056515"
Date: Thu, 8 Sep 2022 13:40:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH 2/3] xl/libxl: Add ability to specify SMBIOS strings
Message-ID: <YxnixSEDEoYOlzfm@perard.uk.xensource.com>
References: <20220810194827.103428-1-jandryuk@gmail.com>
 <20220810194827.103428-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220810194827.103428-3-jandryuk@gmail.com>

On Wed, Aug 10, 2022 at 03:48:26PM -0400, Jason Andryuk wrote:
> hvm_xs_strings.h specifies xenstore entries which can be used to set or
> override smbios strings.  hvmloader has support for reading them, but
> xl/libxl support is not wired up.
> 
> Allow specifying the strings with the new xl.cfg option:
> smbios=["bios_vendor=Xen Project","system_version=1.0"]
> 
> In terms of strings, the SMBIOS specification 3.5 says:
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf
> """
> Strings must be encoded as UTF-8 with no byte order mark (BOM). For
> compatibility with older SMBIOS parsers, US-ASCII characters should be
> used.  NOTE There is no limit on the length of each individual text
> string. However, the length of the entire structure table (including all
> strings) must be reported in the Structure Table Length field of the
> 32-bit Structure Table Entry Point (see 5.2.1) and/or the Structure
> Table Maximum Size field of the 64-bit Structure Table Entry Point (see
> 5.2.2).
> """
> 
> The strings aren't checked for utf-8 or length.  hvmloader has a sanity
> check on the overall length.
> 
> The libxl_smbios_type enum starts at 1 since otherwise the 0th key is
> not printed in the json output.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> The rendered man page and html don't have a newline at then end of the
> new section.
> """
>            battery_device_name=STRING
>        ms_vm_genid="OPTION"
> """
> 
> however the txt format is correct:
> """
>         battery_device_name=STRING
> 
>     ms_vm_genid="OPTION"
> """
> 
> I'm at a loss as to why this is happening.

Maybe it's because =back just cancel =over, and pod2man just keeps going
as if it's the same list. Adding some text for the =item or after =back
would help, but that's done in the next patch, so I guess we can live
with that for one commit.

> ---
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c..9034933ea8 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -771,6 +771,26 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
>              goto err;
>      }
>  
> +    for (int i = 0; i < info->u.hvm.num_smbios; i++) {
> +        char *p;
> +        path = GCSPRINTF("/local/domain/%d/"HVM_XS_BIOS_STRINGS"/%s", domid,
> +                   libxl_smbios_type_to_string(info->u.hvm.smbios[i].key));
> +
> +        /* libxl defines are all "_", but the HVM_XS_ strings are "-". */

"libxl defines are all "_"" seems a bit weird to me as a comment in
the source code, maybe a better comment would the conversion we need to
do, something like:

    Convert libxl_smbios_type string to xenstore path that hvmloader
    will use, as defined by HVM_XS_*. That is convert the '_' to '-'.

> +        p = strrchr(path, '/');
> +        for ( ; *p; p++) {
> +            if (*p == '_')
> +                *p = '-';
> +        }
> +
> +        LOGD(DEBUG, domid, "Writing %d %s %s\n", i, path,

I don't think printing the value of i would be useful here. Also adding
a '=' before the value and putting the value between double-quote would
be a bit better.

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
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1b5381cef0..4f3f962773 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
>      XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
>                     *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
>      XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
> -                   *mca_caps;
> +                   *mca_caps, *smbios;
>      int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
> +    int num_smbios;
>      int pci_power_mgmt = 0;
>      int pci_msitranslate = 0;
>      int pci_permissive = 0;
> @@ -1783,6 +1784,47 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_replace_string(config, "acpi_firmware",
>                                 &b_info->u.hvm.acpi_firmware, 0);
>  
> +        switch (xlu_cfg_get_list(config, "smbios", &smbios, &num_smbios, 0))
> +        {
> +        case 0: /* Success */
> +            b_info->u.hvm.num_smbios = num_smbios;
> +            b_info->u.hvm.smbios = xcalloc(num_smbios, sizeof(libxl_smbios));
> +            for (i = 0; i < num_smbios; i++) {
> +                char *option_untrimmed, *value_untrimmed;
> +                char *option, *value;
> +                libxl_smbios_type v;
> +
> +                buf = xlu_cfg_get_listitem(smbios, i);
> +                if (!buf) continue;

Isn't this an error? It seems that xlu_cfg_get_listitem would return 0
if 'i' is outside of the array or if the value isn't a string. I think
it would also mean that "smbios[i].key" and ".value" would have
uninitialized value and potentially garbage.

> +
> +                if (split_string_into_pair(buf, "=",
> +                                           &option_untrimmed,
> +                                           &value_untrimmed)) {
> +                    fprintf(stderr, "xl: failed to split \"%s\" into pair\n",
> +                            buf);
> +                    exit(EXIT_FAILURE);
> +                }
> +                trim(isspace, option_untrimmed, &option);
> +                trim(isspace, value_untrimmed, &value);

I think you could free "option_untrimmed" and "value_untrimmed", as
"option" and "value" are newly allocated strings. Also, "option" won't
be needed after it's been converted to an enum value.
> +
> +                e = libxl_smbios_type_from_string(option, &v);
> +                if (e) {
> +                    fprintf(stderr,
> +                            "xl: unknown smbios type '%s'\n",
> +                            buf);
> +                    exit(-ERROR_FAIL);
> +                }
> +
> +                b_info->u.hvm.smbios[i].key = v;
> +                b_info->u.hvm.smbios[i].value = value;
> +            }
> +            break;
> +        case ESRCH: break; /* Option not present */

Could you move the "break" to a new line? It will make it easier to read
that ESRCH is just ignore instead of throwing an error.

> +        default:
> +            fprintf(stderr,"xl: Unable to parse smbios options.\n");
> +            exit(-ERROR_FAIL);
> +        }
> +
>          if (!xlu_cfg_get_string(config, "ms_vm_genid", &buf, 0)) {
>              if (!strcmp(buf, "generate")) {
>                  e = libxl_ms_vm_genid_generate(ctx, &b_info->u.hvm.ms_vm_genid);

Thanks,

-- 
Anthony PERARD

