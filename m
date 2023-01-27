Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D02567E198
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 11:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485414.752617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLyV-0002xE-Rl; Fri, 27 Jan 2023 10:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485414.752617; Fri, 27 Jan 2023 10:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLyV-0002un-P2; Fri, 27 Jan 2023 10:28:51 +0000
Received: by outflank-mailman (input) for mailman id 485414;
 Fri, 27 Jan 2023 10:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gttX=5Y=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pLLyT-0002uh-NX
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 10:28:49 +0000
Received: from ppsw-43.srv.uis.cam.ac.uk (ppsw-43.srv.uis.cam.ac.uk
 [131.111.8.143]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f18c8e-9e2d-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 11:28:47 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40252)
 by ppsw-43.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pLLyQ-000spr-VZ (Exim 4.96) (return-path <amc96@srcf.net>);
 Fri, 27 Jan 2023 10:28:46 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 990701FBA7;
 Fri, 27 Jan 2023 10:28:46 +0000 (GMT)
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
X-Inumbo-ID: 61f18c8e-9e2d-11ed-a5d9-ddcf98b90cbd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <547fab47-d4b5-2c04-74d5-baffa10b9638@srcf.net>
Date: Fri, 27 Jan 2023 10:28:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230127055421.22945-1-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
In-Reply-To: <20230127055421.22945-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2023 5:54 am, Juergen Gross wrote:
> When loading a Xenstore stubdom the loader doesn't know whether the
> lo be loaded kernel is a PVH or a PV one. So it tries to load it as
> a PVH one first, and if this fails it is loading it as a PV kernel.

Well, yes it does.

What might be missing is libxenguest's ability to parse the provided
kernel's ELF Notes ahead of trying to build the domain.

This is the same kind of poor design which has left us with a
dom0=pv|pvh cmdline option which must match the kernel the bootloader
gave us, if we want to not panic() on boot.

So while this might be an acceptable gross bodge in the short term, this...

>
> This results in errors being logged in case the stubdom is a PV kernel.
>
> Suppress those errors by setting the minimum logging level to
> "critical" while trying to load the kernel as PVH.
>
> Fixes: f89955449c5a ("tools/init-xenstore-domain: support xenstore pvh stubdom")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - retry PVH loading with logging if PV fails, too (Jan Beulich)
> ---
>  tools/helpers/init-xenstore-domain.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index 04e351ca29..4e2f8d4da5 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -31,6 +31,8 @@ static int memory;
>  static int maxmem;
>  static xen_pfn_t console_gfn;
>  static xc_evtchn_port_or_error_t console_evtchn;
> +static xentoollog_level minmsglevel = XTL_PROGRESS;
> +static void *logger;
>  
>  static struct option options[] = {
>      { "kernel", 1, NULL, 'k' },
> @@ -141,19 +143,29 @@ static int build(xc_interface *xch)
>          goto err;
>      }
>  
> +    /* Try PVH first, suppress errors by setting min level high. */

... needs to make the position clear.

/*  This is a bodge.  We can't currently inspect the kernel's ELF notes
ahead of attempting to construct a domain, so try PVH first, suppressing
errors by setting min level to high, and fall back to PV. */

~Andrew

>      dom->container_type = XC_DOM_HVM_CONTAINER;
> +    xtl_stdiostream_set_minlevel(logger, XTL_CRITICAL);
>      rv = xc_dom_parse_image(dom);
> +    xtl_stdiostream_set_minlevel(logger, minmsglevel);
>      if ( rv )
>      {
>          dom->container_type = XC_DOM_PV_CONTAINER;
>          rv = xc_dom_parse_image(dom);
>          if ( rv )
>          {
> -            fprintf(stderr, "xc_dom_parse_image failed\n");
> -            goto err;
> +            /* Retry PVH, now with normal logging level. */
> +            dom->container_type = XC_DOM_HVM_CONTAINER;
> +            rv = xc_dom_parse_image(dom);
> +            if ( rv )
> +            {
> +                fprintf(stderr, "xc_dom_parse_image failed\n");
> +                goto err;
> +            }
>          }
>      }
> -    else
> +
> +    if ( dom->container_type == XC_DOM_HVM_CONTAINER )
>      {
>          config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>          config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
> @@ -412,8 +424,6 @@ int main(int argc, char** argv)
>      char buf[16], be_path[64], fe_path[64];
>      int rv, fd;
>      char *maxmem_str = NULL;
> -    xentoollog_level minmsglevel = XTL_PROGRESS;
> -    xentoollog_logger *logger = NULL;
>  
>      while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
>      {
> @@ -456,9 +466,7 @@ int main(int argc, char** argv)
>          return 2;
>      }
>  
> -    logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
> -                                                               minmsglevel, 0);
> -
> +    logger = xtl_createlogger_stdiostream(stderr, minmsglevel, 0);
>      xch = xc_interface_open(logger, logger, 0);
>      if ( !xch )
>      {


