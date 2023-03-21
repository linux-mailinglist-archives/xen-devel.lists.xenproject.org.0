Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928846C34FA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512787.792997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedVe-0000sN-KN; Tue, 21 Mar 2023 15:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512787.792997; Tue, 21 Mar 2023 15:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedVe-0000pz-HI; Tue, 21 Mar 2023 15:02:46 +0000
Received: by outflank-mailman (input) for mailman id 512787;
 Tue, 21 Mar 2023 15:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/aZB=7N=citrix.com=prvs=43775ecc5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pedVd-0000pt-ED
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:02:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e299eb4-c7f9-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 16:02:44 +0100 (CET)
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
X-Inumbo-ID: 6e299eb4-c7f9-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679410964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9SCTAVMMYkr7BIFLkf7x/7u6+aCX6Pig8uQ5GWaVuU=;
  b=YocS+MhHyJ7RZNA1ij7fQnDkmXkuzFsuoZLYxq/2deXA3AitWRIwvnB8
   FvRqN+8rQX5ru8RMbzLCL2wY5k3Z3lIr1MWKokz5WZtrZo3L9cljxIc7e
   Y7ntCPlYV6IlIDDKucSsEsRm+rKMwlvSS+OpeiH+yIV66drcbb1kqVdSW
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101088654
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:K7a9lqBJwhq4bBVW/yfjw5YqxClBgxIJ4kV8jS/XYbTApGslhDYBn
 GdKWzzUaf+PNGugKot0Pd6wp0MA6MPUyYAwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5r9+EVBU9
 84hczkqfz3Su8nsmei5c7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TTHZUFwBvEz
 o7A1zj9PiwCaPnC9T+i1n+OhdPKpSDQXbtHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3I
 lQZ4CM0oYAu9UagSZ/2WBjQiHyLpBkHQPJLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bkkvGXud5EpyM1dTSCByh/
 xvQ9XI8vuBG5SIU7JlX7Wwrkhr1+MeYFVBotlyMNo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28zaK7ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMYsVOccpKlTfrHsGiausM4bFyhBErE3CE
 c3DLZbE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa3GI+Cc+ePGPha9EO5dWHPXN7BR0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhTdyFmXsCq8JwPHgNBSyI/cFwc5zbq6etJU+RYc259zY8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:ESoW3a+25k79lxOFmnpuk+AbI+orL9Y04lQ7vn2ZLiYlC/Bw9v
 re+sjzsCWetN9/YhAdcLy7WJVoIkmskqKdg7NhX4tKNTOO0AGVxedZnOjfKhLbalXDH4VmuZ
 uIHZISNDXUZWIK9reBkXTIb6de/DGlmJrY9Ns39B9WPH9XgtlbnmNE4tDyKCNLrEUqP/UE/e
 Gnl696TwjJQwVmUiyMbkN1LNQqkLXw5eDbXSI=
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101088654"
Date: Tue, 21 Mar 2023 15:02:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools: use libxenlight for writing xenstore-stubdom
 console nodes
Message-ID: <49c631aa-2a88-4223-a63d-0058bfdbc9e6@perard>
References: <20230315154226.4238-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230315154226.4238-1-jgross@suse.com>

On Wed, Mar 15, 2023 at 04:42:26PM +0100, Juergen Gross wrote:
> @@ -1982,6 +1987,13 @@ int libxl_console_get_tty(libxl_ctx *ctx, uint32_t domid, int cons_num,
>   */
>  int libxl_primary_console_get_tty(libxl_ctx *ctx, uint32_t domid_vm, char **path);
>  
> +/* libxl_console_add_xenstore writes the Xenstore entries for a domain's
> + * primary console based on domid, event channel port and the guest frame
> + * number of the PV console's ring page.
> + */
> +int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
> +                               int evtch, uint64_t gfn);

Could you make this function async, by adding "const libxl_asyncop_how
*ao_how" parameter in last position?

You can follow libxl_domain_pause() example has to write an async
function that is actually synchronous (AO_CREATE, libxl__ao_complete,
AO_INPROGRESS, AO_CREATE_FAIL).

Adding the async capability now means that we won't need to change the
API if the function actually need to be async one day.

> +
>  /* May be called with info_r == NULL to check for domain's existence.
>   * Returns ERROR_DOMAIN_NOTFOUND if domain does not exist (used to return
>   * ERROR_INVAL for this scenario). */
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index d8b2bc5465..ce3de100cc 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -346,6 +346,26 @@ out:
>      return rc;
>  }
>  
> +int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
> +                               int evtch, uint64_t gfn)
> +{
> +    GC_INIT(ctx);
> +    int rc;
> +    libxl__device_console console = { .backend_domid = backend,
> +                                      .output = "pty",
> +                                      .consback = LIBXL__CONSOLE_BACKEND_XENCONSOLED,
> +                                    };
> +    libxl__domain_build_state state = { .console_port = evtch,

`console_port` is "uint32_t", shouldn't `evtchn` be the same type, or at
least also be unsigned?

> +                                        .console_mfn = gfn,

I wonder if we should check if `gfn` fit in `console_mfn`, as it could
be smaller when building the toolstack on 32bit platform.


Thanks,

-- 
Anthony PERARD

