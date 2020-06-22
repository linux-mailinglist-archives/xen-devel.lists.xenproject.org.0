Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA3203295
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 10:54:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnIDS-0007Uz-HT; Mon, 22 Jun 2020 08:54:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnIDQ-0007Uu-Ll
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 08:54:08 +0000
X-Inumbo-ID: ee44fc74-b465-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee44fc74-b465-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 08:54:07 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HWnmjrmVZgCMpEtOY4vA0aZV95vVKdFN4K+3jruL1UoEekN79rS7pekQR17zyZVi/h59yCAwCE
 PWrNKb9IdYkwdYwG6WY79NgfmUiC9sfsbtv0iNEB9is4WikHeUxYC44l2FT1jDsO+cAOiLbzKj
 CYwk2ZMYTp9ISA+Xpw3P6xZ9dkDu0pz3+Q9o1IvJMlS8NNHGo+ne+NeW4lW6ZqxdC5QkJQaaBZ
 oiR5pI6poymasx2vHRtTw3dBLfSs///Jf5l7ZZUel2MRMwpRvPqIVUWHw5tWOHHR+JimtEkg7O
 5Rk=
X-SBRS: 2.7
X-MesageID: 20605835
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,266,1589256000"; d="scan'208";a="20605835"
Date: Mon, 22 Jun 2020 10:54:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
Message-ID: <20200622085400.GG735@Air-de-Roger>
References: <cover.1592603468.git.gorbak25@gmail.com>
 <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski, Andrew
 Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Jan Beulich <jbeulich@suse.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 10:00:16PM +0000, Grzegorz Uriasz wrote:
> On some computers the bit width of the PM Timer as reported
> by ACPI is 32 bits when in fact the FADT flags report correctly
> that the timer is 24 bits wide. On affected machines such as the
> ASUS FX504GM and never gaming laptops this results in the inability
> to resume the machine from suspend. Without this patch suspend is
> broken on affected machines and even if a machine manages to resume
> correctly then the kernel time and xen timers are trashed.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: marmarek@invisiblethingslab.com
> Cc: contact@puzio.waw.pl
> Cc: jakub@bartmin.ski
> Cc: j.nowak26@student.uw.edu.pl
> 
> Changes in v2:
> - Check pm timer access width
> - Proper timer width is set when xpm block is not present
> - Cleanup timer initialization
> 
> Changes in v3:
> - Check pm timer bit offset
> - Warn about acpi firmware bugs
> - Drop int cast in init_pmtimer
> - Merge if's in init_pmtimer
> ---
>  xen/arch/x86/acpi/boot.c    | 19 +++++++++++++++----
>  xen/arch/x86/time.c         | 12 ++++--------
>  xen/include/acpi/acmacros.h |  8 ++++++++
>  3 files changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
> index bcba52e232..24fd236eb5 100644
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -475,10 +475,17 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>  
>  #ifdef CONFIG_X86_PM_TIMER
>  	/* detect the location of the ACPI PM Timer */
> -	if (fadt->header.revision >= FADT2_REVISION_ID) {
> +	if (fadt->header.revision >= FADT2_REVISION_ID &&
> +	    fadt->xpm_timer_block.space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
>  		/* FADT rev. 2 */
> -		if (fadt->xpm_timer_block.space_id ==
> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
> +		if (fadt->xpm_timer_block.access_width != 0 &&
> +		    ACPI_ACCESS_BIT_WIDTH(fadt->xpm_timer_block.access_width) != 32)
> +			printk(KERN_WARNING PREFIX "PM-Timer has invalid access width(%u)\n",
> +			       fadt->xpm_timer_block.access_width);
> +		else if (fadt->xpm_timer_block.bit_offset != 0)

This should be a plain if instead of an else if, it's possible the
block has both the access_width and the bit_offset wrong.

> +			printk(KERN_WARNING PREFIX "PM-Timer has invalid bit offset(%u)\n",
> +			       fadt->xpm_timer_block.bit_offset);
> +		else {
>  			pmtmr_ioport = fadt->xpm_timer_block.address;
>  			pmtmr_width = fadt->xpm_timer_block.bit_width;
>  		}
> @@ -490,8 +497,12 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>   	 */
>  	if (!pmtmr_ioport) {
>  		pmtmr_ioport = fadt->pm_timer_block;
> -		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
> +		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
>  	}
> +	if (pmtmr_width < 32 && fadt->flags & ACPI_FADT_32BIT_TIMER)
> +        printk(KERN_WARNING PREFIX "PM-Timer is too short\n");

Indentation. Also this should be a fatal error likely? You should set
pmtmr_ioport = 0?

> +	if (pmtmr_width > 24 && !(fadt->flags & ACPI_FADT_32BIT_TIMER))
> +		pmtmr_width = 24;
>  	if (pmtmr_ioport)
>  		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
>  		       pmtmr_ioport, pmtmr_width);
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index d643590c0a..8a45514908 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -457,16 +457,13 @@ static u64 read_pmtimer_count(void)
>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>  {
>      u64 start;
> -    u32 count, target, mask = 0xffffff;
> +    u32 count, target, mask;
>  
> -    if ( !pmtmr_ioport || !pmtmr_width )
> +    if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
>          return 0;
>  
> -    if ( pmtmr_width == 32 )
> -    {
> -        pts->counter_bits = 32;
> -        mask = 0xffffffff;
> -    }
> +    pts->counter_bits = pmtmr_width;
> +    mask = (1ull << pmtmr_width) - 1;
>  
>      count = inl(pmtmr_ioport) & mask;
>      start = rdtsc_ordered();
> @@ -486,7 +483,6 @@ static struct platform_timesource __initdata plt_pmtimer =
>      .name = "ACPI PM Timer",
>      .frequency = ACPI_PM_FREQUENCY,
>      .read_counter = read_pmtimer_count,
> -    .counter_bits = 24,
>      .init = init_pmtimer
>  };
>  
> diff --git a/xen/include/acpi/acmacros.h b/xen/include/acpi/acmacros.h
> index 6765535053..86c503c20f 100644
> --- a/xen/include/acpi/acmacros.h
> +++ b/xen/include/acpi/acmacros.h
> @@ -121,6 +121,14 @@
>  #define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (char,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
>  #endif
>  
> +/*
> + * Algorithm to obtain access bit or byte width.
> + * Can be used with access_width of struct acpi_generic_address and access_size of
> + * struct acpi_resource_generic_register.
> + */
> +#define ACPI_ACCESS_BIT_WIDTH(size)     (1 << ((size) + 2))
> +#define ACPI_ACCESS_BYTE_WIDTH(size)    (1 << ((size) - 1))

Note sure I would introduce this last one, since it's not used by the
code.

Thanks, Roger.

