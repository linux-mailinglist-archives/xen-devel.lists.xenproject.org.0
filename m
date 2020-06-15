Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879371F8F03
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 09:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkjBz-0003wy-SJ; Mon, 15 Jun 2020 07:06:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkjBy-0003wt-Nv
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 07:06:02 +0000
X-Inumbo-ID: aadc3fcc-aed6-11ea-b7c5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aadc3fcc-aed6-11ea-b7c5-12813bfff9fa;
 Mon, 15 Jun 2020 07:06:00 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0WTN05Vi8M7oqOf5ArlUqW6cmr8syDAfoJDQqIWPIVHkjdE+tFQ1Gr/hyliRwcvcCAWlMwDtlG
 DlPFbTm5CDdeChWpSWIoQlYETY5GZkYEa8wWq9StiOc5UgKnM9xJ5y0PzN0JoUjEyDz8cbe7Hk
 LdOK5t4fhtKTW7yuCIK7K7OqIytjp1NGvgDfAzWdPH8HL6aeHsxuFeQC4u85oLOVb1tVo9YPr7
 a2Tc0mPt2hQtNQ3I1O7O2nm0gBzd1ikzmWGZSK4qMR4b5GpCMxtJ3uabkJuGi+IWFDp+hJ6ZXz
 0DU=
X-SBRS: 2.7
X-MesageID: 20374503
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20374503"
Date: Mon, 15 Jun 2020 09:05:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Message-ID: <20200615070549.GA735@Air-de-Roger>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski, Andrew
 Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Jan Beulich <jbeulich@suse.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jun 14, 2020 at 02:36:28PM +0000, Grzegorz Uriasz wrote:
> On some computers the bit width of the PM Timer as reported
> by ACPI is 32 bits when in fact the FADT flags report correctly
> that the timer is 24 bits wide. On affected machines such as the
> ASUS FX504GM and never gaming laptops this results in the inability
> to resume the machine from suspend. Without this patch suspend is
> broken on affected machines and even if a machine manages to resume
> correctly then the kernel time and xen timers are trashed.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>

Thanks for the patch! I'm not sure it's required to add your
Tested-by, I usually assume a patch has been tested by it's author
unless told otherwise.

> ---
>  xen/arch/x86/acpi/boot.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
> index bcba52e232..2ad3eb4abc 100644
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>  		if (fadt->xpm_timer_block.space_id ==
>  		    ACPI_ADR_SPACE_SYSTEM_IO) {
>  			pmtmr_ioport = fadt->xpm_timer_block.address;
> -			pmtmr_width = fadt->xpm_timer_block.bit_width;
> +			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
> +				pmtmr_width = 32;
> +			else
> +				pmtmr_width = 24;

I think there's also a block below that you need to fix, when
xpm_timer_block is not set the data is fetched from pm_timer_block
instead, which AFAICT also needs to take ACPI_FADT_32BIT_TIMER into
account in order to use the correct size.

FWIW, I would set pmtmr_width only once after pmtmr_ioport has been
set, since regardless of whether the port is discovered using
xpm_timer_block or pm_timer_block the size will always be derived from
the flags field.

Thanks, Roger.

