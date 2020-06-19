Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039222009C9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:17:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGtx-0008JG-Q8; Fri, 19 Jun 2020 13:17:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jmGtx-0008J7-5J
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:17:49 +0000
X-Inumbo-ID: 45133414-b22f-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45133414-b22f-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 13:17:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78971B142;
 Fri, 19 Jun 2020 13:17:46 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
To: Grzegorz Uriasz <gorbak25@gmail.com>
References: <cover.1592539868.git.gorbak25@gmail.com>
 <b56bc897f22acc537a15740d779cb096fb2d6733.1592539868.git.gorbak25@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a64cd64b-9717-a23a-561c-497aa4686ac0@suse.com>
Date: Fri, 19 Jun 2020 15:17:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b56bc897f22acc537a15740d779cb096fb2d6733.1592539868.git.gorbak25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.06.2020 06:28, Grzegorz Uriasz wrote:
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -478,7 +478,9 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>  	if (fadt->header.revision >= FADT2_REVISION_ID) {
>  		/* FADT rev. 2 */
>  		if (fadt->xpm_timer_block.space_id ==
> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
> +		    (fadt->xpm_timer_block.access_width == 0 ||
> +		    ACPI_ACCESS_BIT_WIDTH(fadt->xpm_timer_block.access_width) == 32)) {

Thinking about it again, since we're already tightening this
check, I think we would better also verify bit_offset == 0.

There also looks to be an indenting blank missing here.

> @@ -490,8 +492,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>   	 */
>  	if (!pmtmr_ioport) {
>  		pmtmr_ioport = fadt->pm_timer_block;
> -		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
> +		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
>  	}
> +	if (pmtmr_width > 24 && !(fadt->flags & ACPI_FADT_32BIT_TIMER))
> +		pmtmr_width = 24;
>  	if (pmtmr_ioport)
>  		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
>  		       pmtmr_ioport, pmtmr_width);

I thought we had agreed to log at the very least the case where
the FADT flag is set but the width is less than 32 bits. (And I
agree that perhaps there's not much more to log, unless we'd
suspect e.g. strange access widths to be present somewhere.)

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -457,16 +457,16 @@ static u64 read_pmtimer_count(void)
>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>  {
>      u64 start;
> -    u32 count, target, mask = 0xffffff;
> +    u32 count, target, mask;
>  
> -    if ( !pmtmr_ioport || !pmtmr_width )
> +    if ( !pmtmr_ioport )
>          return 0;
>  
> -    if ( pmtmr_width == 32 )
> -    {
> -        pts->counter_bits = 32;
> -        mask = 0xffffffff;
> -    }
> +    if ( pmtmr_width != 24 && pmtmr_width != 32 )
> +        return 0;
> +
> +    pts->counter_bits = (int) pmtmr_width;
> +    mask = (1ull << pmtmr_width) - 1;
>  
>      count = inl(pmtmr_ioport) & mask;
>      start = rdtsc_ordered();
> @@ -486,7 +486,6 @@ static struct platform_timesource __initdata plt_pmtimer =
>      .name = "ACPI PM Timer",
>      .frequency = ACPI_PM_FREQUENCY,
>      .read_counter = read_pmtimer_count,
> -    .counter_bits = 24,
>      .init = init_pmtimer
>  };

I'm struggling a little to see why this code churn is needed / wanted.
The change I had suggested was quite a bit less intrusive. I'm not
entirely opposed though, but at the very least please drop the odd
(int) cast. If anything we want the struct field changed to unsigned
int (but unlikely in this very patch).

If you want to stick to this larger change, then also please fold the
two if()s at the beginning of the function.

Jan

