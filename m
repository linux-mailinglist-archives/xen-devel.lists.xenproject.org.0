Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73275A15E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 00:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566225.884762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMFJl-0003Lu-4Z; Wed, 19 Jul 2023 22:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566225.884762; Wed, 19 Jul 2023 22:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMFJl-0003IZ-1P; Wed, 19 Jul 2023 22:06:45 +0000
Received: by outflank-mailman (input) for mailman id 566225;
 Wed, 19 Jul 2023 22:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMFJj-0003IR-Lu
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 22:06:43 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 890ff670-2680-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 00:06:41 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JM6NZ3035313
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 18:06:29 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JM6MK7035312;
 Wed, 19 Jul 2023 15:06:22 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 890ff670-2680-11ee-b23a-6b7b168915f2
Date: Wed, 19 Jul 2023 15:06:22 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/7] tools/utils: introduce xlu_cfg_printf() function
Message-ID: <ZLheXrr33YFd9nPU@mattapan.m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
 <a3a352b0ce0038eeaa708ba1db279cc8912ef9ba.1689779749.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a352b0ce0038eeaa708ba1db279cc8912ef9ba.1689779749.git.ehem+xen@m5p.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Jul 13, 2023 at 07:01:19PM -0700, Elliott Mitchell wrote:
> 
> diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
> index 874f5abfb9..b2947cbfc9 100644
> --- a/tools/libs/util/libxlu_cfg.c
> +++ b/tools/libs/util/libxlu_cfg.c
> @@ -18,12 +18,19 @@
>  #include "libxlu_cfg_i.h"
>  
> +struct XLU_Config {
> +    XLU_ConfigSetting *settings;
> +    FILE *report;
> +    char *config_source;
> +};

When exploring further, for several places config_source being constant
works better.  The single exception is `xlu_cfg_destroy()` which would
then need to cast it to void *.


> @@ -703,6 +710,24 @@ void xlu__cfg_yyerror(YYLTYPE *loc, CfgParseContext *ctx, char const *msg) {
>      if (!ctx->err) ctx->err= EINVAL;
>  }
>  
> +int xlu_cfg_printf(XLU_Config *cfg, const char *format, ...)
> +{
> +	va_list args;
> +	int ret;
> +
> +	if (!cfg || !cfg->report)
> +		return EFAULT;
> +
> +	fwrite(cfg->config_source, 1, strlen(cfg->config_source), cfg->report);
> +	fwrite(": ", 2, 1, cfg->report);

The spots where this doesn't work so well are in libxlu_cfg.c.  Several
spots in libxlu_cfg.c use a format of "%s:%d: <message>" where the %d is
a line number.

Two approaches come to mind to use `xlu_cfg_printf()` for those.  First,
those messages could be modified to include the space.  Second,
`xlu_cfg_printf()` could merely add the colon, but not the space.

I'm pretty sure the upsides and downsides to those approaches are
obvious.  Only issue is which the maintainers would prefer.

(either messages get modified, or else have to add the space in many
places)


> diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
> index 1f7559ecd9..2ef5eb7f5e 100644
> --- a/tools/libs/util/libxlu_internal.h
> +++ b/tools/libs/util/libxlu_internal.h
> @@ -73,6 +67,9 @@ typedef struct {
>  #define STRINGIFY(x) #x
>  #define TOSTRING(x) STRINGIFY(x)
>  
> +extern int xlu_cfg_printf(XLU_Config *cfg, const char *format, ...)
> +    __attribute__((__format__ (__printf__, 2, 3)));

Again, after a bit more experimentation, the first argument should be
declared constant.

Hopefully 1-3 go through fine though.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



