Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00C1FB545
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:00:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlD4D-0006Kt-75; Tue, 16 Jun 2020 15:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlD4C-0006Kn-6j
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:00:00 +0000
X-Inumbo-ID: 0be86411-afe2-11ea-b8f6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0be86411-afe2-11ea-b8f6-12813bfff9fa;
 Tue, 16 Jun 2020 14:59:59 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pBu22Ny6/rkHpKQhPQ09Ef2otRuF2f8Ttb/FxRStwF4PuuiR8sMw0qk2946Ik7UDfGIPSIoqzD
 LYVR0jV+pQSkAoJR2/iDv5z28XrzcOwL6oEcII5fPKIyJdeyFDg91ktQPerC3NcC8HPmh5koGM
 2sKTx4T4LmdgnD1WpNJuCtKsbj/sY6odzyTz/7dzi+1B2MRnyVHORaxDNUwYXpKHwTvenz/XD2
 lKZ5kyJgsybm+IsLxYJZ8XPLVBZDYe3SwN/uy58Wl0Lcq50nn4btBasqgl8d9L+7lOnqKVv3ys
 llE=
X-SBRS: 2.7
X-MesageID: 20188099
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20188099"
Date: Tue, 16 Jun 2020 16:59:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Message-ID: <20200616145951.GP735@Air-de-Roger>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 03:25:42PM +0200, Jan Beulich wrote:
> On 16.06.2020 12:32, Roger Pau Monné wrote:
> > On Tue, Jun 16, 2020 at 10:07:05AM +0200, Jan Beulich wrote:
> >> On 14.06.2020 16:36, Grzegorz Uriasz wrote:
> >>> --- a/xen/arch/x86/acpi/boot.c
> >>> +++ b/xen/arch/x86/acpi/boot.c
> >>> @@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
> >>>  		if (fadt->xpm_timer_block.space_id ==
> >>>  		    ACPI_ADR_SPACE_SYSTEM_IO) {
> >>>  			pmtmr_ioport = fadt->xpm_timer_block.address;
> >>> -			pmtmr_width = fadt->xpm_timer_block.bit_width;
> >>> +			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
> >>> +				pmtmr_width = 32;
> >>> +			else
> >>> +				pmtmr_width = 24;
> >>
> >> I think disagreement of the two wants logging, and you want to
> >> default to using the smaller of the two (or even to ignoring the
> >> timer altogether). Then there wants to be a way to override
> >> (unless we already have one) our defaulting, in case it's wrong.
> > 
> > TBH, I presume timer_block will always return 32bits, because that's
> > the size of the register. Then the timer can implement less bits than
> > the full size of the register, and that's what gets signaled using the
> > ACPI flags. What we care about here is the number of bits used by the
> > timer, not the size of the register.
> > 
> > I think we should only ignore the timer if pm_timer_block.bit_width <
> > pmtmr_width.
> > 
> > Printing a (debug) message when those values disagree is fine, but I
> > bet it's going to trigger always when the implemented timer is only
> > using 24bits.
> 
> The 2nd system I tried on would trigger it, so maybe there's no point
> in logging indeed. How about the below as a basis?
> 
> Jan
> 
> --- unstable.orig/xen/arch/x86/acpi/boot.c
> +++ unstable/xen/arch/x86/acpi/boot.c
> @@ -480,7 +480,9 @@ static int __init acpi_parse_fadt(struct
>  	if (fadt->header.revision >= FADT2_REVISION_ID) {
>  		/* FADT rev. 2 */
>  		if (fadt->xpm_timer_block.space_id ==
> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
> +		    (fadt->xpm_timer_block.access_width == 0 ||
> +		     fadt->xpm_timer_block.access_width == 3)) {

We should really have defines for those values, or else they seem to
imply actual access sizes. What about adding
ACPI_ADDR_ACCESS_{LEGACY,BYTE,WORD,DWORD,QWORD}?

Also the check for the access size seems kind of unrelated to the
patch itself? (not that I'm opposed to it)

>  			pmtmr_ioport = fadt->xpm_timer_block.address;
>  			pmtmr_width = fadt->xpm_timer_block.bit_width;
>  		}
> @@ -492,8 +494,10 @@ static int __init acpi_parse_fadt(struct
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
> --- unstable.orig/xen/arch/x86/time.c
> +++ unstable/xen/arch/x86/time.c
> @@ -465,7 +465,7 @@ static s64 __init init_pmtimer(struct pl
>      u64 start;
>      u32 count, target, mask = 0xffffff;
>  
> -    if ( !pmtmr_ioport || !pmtmr_width )
> +    if ( !pmtmr_ioport )
>          return 0;
>  
>      if ( pmtmr_width == 32 )
> @@ -473,6 +473,8 @@ static s64 __init init_pmtimer(struct pl
>          pts->counter_bits = 32;
>          mask = 0xffffffff;
>      }
> +    else if ( pmtmr_width != pts->counter_bits )
> +        return 0;
>  
>      count = inl(pmtmr_ioport) & mask;
>      start = rdtsc_ordered();

The rest LGTM.

Thanks, Roger.

