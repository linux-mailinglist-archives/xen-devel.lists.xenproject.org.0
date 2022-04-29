Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DB514978
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 14:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317268.536524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkPq0-0004Ku-Ui; Fri, 29 Apr 2022 12:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317268.536524; Fri, 29 Apr 2022 12:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkPq0-0004I4-RJ; Fri, 29 Apr 2022 12:35:08 +0000
Received: by outflank-mailman (input) for mailman id 317268;
 Fri, 29 Apr 2022 12:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxz=VH=citrix.com=prvs=111f028e5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nkPpz-0004Hy-1L
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 12:35:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac05772-c7b8-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 14:35:05 +0200 (CEST)
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
X-Inumbo-ID: cac05772-c7b8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651235704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j7VY6uzq3Gf+9w6ZGEsdVEoRlQbbe7j2kbmZoluxX4Y=;
  b=cMN0qAbSrHXjkNwGh43Yv1gbStIK5zDDMEpxckkFRqEt24a1Dc5VchaP
   QPcgBKtxdNMjXaAp+OUYDjwFNQexF1eNb2P8ok7pMMRHadtPtDGZtSiMD
   vlctAWXv2rIVQiszoX71yC8BLdALWTpRN1+Ae2XPab18smbukoxqsK0pQ
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70108997
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9D4fsqPaaxEhVbPvrR3Yl8FynXyQoLVcMsEvi/4bfWQNrUp2hTIPz
 mRLUT/UOveMZjSneIx+a9nip0kHvZ+BnYMyTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZl2N8w2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 d4UiceaETcTObDentgzDyRgGi9QBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRRa+GN
 5tINlKDajzcTAdVIG40Iq4hv9mMliP4eAVb8nWs8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7y2weDV4GWF2TpKShzEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0RtEJL7YQsDG3zbfG5Tq3WlU8RzBvUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpif6JdoJuWokfRoB3iM4ldnBO
 R67VeR5vsI7AZdXRfUvP9LZ5zoCkMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPmL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3apXalk0DALGvCsQVmKZKRW03wbEALcieg6RqmiSreGKKxElJ5yft/I4c
IronPort-HdrOrdr: A9a23:zdOLRa2d47yVU/omrdJlFgqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="70108997"
Date: Fri, 29 Apr 2022 13:34:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] tools/xl: Allow specifying JSON for domain
 configuration file format
Message-ID: <YmvbYHbmfXYx47r2@perard.uk.xensource.com>
References: <cover.1650422517.git.ehem+xen@m5p.com>
 <09213ac26738ee51401b454534c6b437766481b7.1650422518.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <09213ac26738ee51401b454534c6b437766481b7.1650422518.git.ehem+xen@m5p.com>

On Tue, Apr 19, 2022 at 06:23:41PM -0700, Elliott Mitchell wrote:
> JSON is currently used when saving domains to mass storage.  Being able
> to use JSON as the normal input to `xl create` has potential to be
> valuable.  Add the functionality.

"potential", right, but it isn't hasn't been really tested. When
implemented, I think the intend of the json format was for libxl to
communicate with itself while migrating a guest (or save/restore). It
would be nice to know if it actually can work.

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..a0c03f96df 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -49,6 +49,11 @@ struct domain_create {
>      int migrate_fd; /* -1 means none */
>      int send_back_fd; /* -1 means none */
>      char **migration_domname_r; /* from malloc */
> +    enum {
> +        FORMAT_DEFAULT,
> +        FORMAT_JSON,
> +        FORMAT_LEGACY,
> +    } format;

I think the name "format" here is too generic, we are in the struct
"domain_create" and this new format field isn't intended to specify the
format of the domain. I think "config_file_format" would be better, as
it is only used for the format of the config_file.

Also I don't think having "_DEFAULT" would be useful, we need to know
what the format is intended to be before starting to parse the file, and
I don't think changing the default is going to work. So for the enum, we
could have "_LEGACY = 0".

The prefix "FORMAT_" feels a bit generic, maybe "CONFIG_FORMAT_" would
be better, or something else.

>  };
>  
>  int create_domain(struct domain_create *dom_info);
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index f546beaceb..04d579a596 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -31,6 +31,8 @@ const struct cmd_spec cmd_table[] = {
>        "-h                      Print this help.\n"
>        "-p                      Leave the domain paused after it is created.\n"
>        "-f FILE, --defconfig=FILE\n                     Use the given configuration file.\n"
> +      "-j, --json              Interpret configuration file as JSON format\n"
> +      "-J                      Use traditional configuration file format (current default)\n"

I don't think this new "-J" option would be useful, just the "-j" should be
enough.

>        "-n, --dryrun            Dry run - prints the resulting configuration\n"
>        "                         (deprecated in favour of global -N option).\n"
>        "-q, --quiet             Quiet.\n"
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 2ec4140258..41bd919d1d 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -789,7 +789,7 @@ int create_domain(struct domain_create *dom_info)
>                  extra_config);
>          }
>          config_source=config_file;
> -        config_in_json = false;
> +        config_in_json = dom_info.format == FORMAT_JSON ? true : false;

This doesn't build, "dom_info" is a pointer.

Also, "? true : false;" is weird in C.


>      } else {
>          if (!config_data) {
>              fprintf(stderr, "Config file not specified and"
> @@ -1173,6 +1173,7 @@ int main_create(int argc, char **argv)
>          {"defconfig", 1, 0, 'f'},
>          {"dryrun", 0, 0, 'n'},
>          {"ignore-global-affinity-masks", 0, 0, 'i'},
> +        {"json", 0, 0, 'j'},
>          {"quiet", 0, 0, 'q'},
>          {"vncviewer", 0, 0, 'V'},
>          {"vncviewer-autopass", 0, 0, 'A'},
> @@ -1181,18 +1182,23 @@ int main_create(int argc, char **argv)
>  
>      dom_info.extra_config = NULL;
>  
> +    dom_info.format = FORMAT_DEFAULT;
> +
>      if (argv[1] && argv[1][0] != '-' && !strchr(argv[1], '=')) {
>          filename = argv[1];
>          argc--; argv++;
>      }
>  
> -    SWITCH_FOREACH_OPT(opt, "Ffnq:AVcdeip", opts, "create", 0) {
> +    SWITCH_FOREACH_OPT(opt, "FJfjnq:AVcdeip", opts, "create", 0) {
>      case 'A':
>          vnc = vncautopass = 1;
>          break;
>      case 'F':
>          daemonize = 0;
>          break;
> +    case 'J':
> +        dom_info.format = FORMAT_LEGACY;
> +        break;
>      case 'V':
>          vnc = 1;
>          break;
> @@ -1212,6 +1218,9 @@ int main_create(int argc, char **argv)
>      case 'i':
>          ignore_masks = 1;
>          break;
> +    case 'j':
> +        dom_info.format = FORMAT_JSON;

This setting is ignored, as "dom_info" is reset later.

> +        break;
>      case 'n':
>          dryrun_only = 1;
>          break;

Thanks,

-- 
Anthony PERARD

