Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A0320329E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 10:58:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnIHe-0007iY-3Z; Mon, 22 Jun 2020 08:58:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnIHd-0007iT-EN
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 08:58:29 +0000
X-Inumbo-ID: 89e6a75e-b466-11ea-be4c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89e6a75e-b466-11ea-be4c-12813bfff9fa;
 Mon, 22 Jun 2020 08:58:28 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8geRtY5uERBwhau9Jk2Wbodh6QmEHkneOYPOUy9Adx5myeR4R6tyRvz93guA69ufqyIWpiRUOI
 N9CyGxmjSkfmju4J85oHgPl9sIObgB5huRlMtNHESoUAsNm9wgU7UF2MukZFldzEnY6o/d6t2o
 WMgmA5knywRpJ12slehtSyC+ut8WXOf4rap1a8mEDs7rv97msMdqEc5/okrG6jQfueQ3FAJhbZ
 adwGRX8FN36tkZnZpqDe7L51MRFoBNgIBfmT6KG9bLPyKKj89AAC0Ymh1Tcw4qaYVfWPcQCDJG
 xVM=
X-SBRS: 2.7
X-MesageID: 20943361
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,266,1589256000"; d="scan'208";a="20943361"
Date: Mon, 22 Jun 2020 10:58:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
Message-ID: <20200622085819.GH735@Air-de-Roger>
References: <cover.1592603468.git.gorbak25@gmail.com>
 <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
 <20200622085400.GG735@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200622085400.GG735@Air-de-Roger>
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Jan Beulich <jbeulich@suse.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 10:54:00AM +0200, Roger Pau Monné wrote:
> On Fri, Jun 19, 2020 at 10:00:16PM +0000, Grzegorz Uriasz wrote:
> > On some computers the bit width of the PM Timer as reported
> > by ACPI is 32 bits when in fact the FADT flags report correctly
> > that the timer is 24 bits wide. On affected machines such as the
> > ASUS FX504GM and never gaming laptops this results in the inability
> > to resume the machine from suspend. Without this patch suspend is
> > broken on affected machines and even if a machine manages to resume
> > correctly then the kernel time and xen timers are trashed.
> > 
> > Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > ---
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> > Cc: marmarek@invisiblethingslab.com
> > Cc: contact@puzio.waw.pl
> > Cc: jakub@bartmin.ski
> > Cc: j.nowak26@student.uw.edu.pl
> > 
> > Changes in v2:
> > - Check pm timer access width
> > - Proper timer width is set when xpm block is not present
> > - Cleanup timer initialization
> > 
> > Changes in v3:
> > - Check pm timer bit offset
> > - Warn about acpi firmware bugs
> > - Drop int cast in init_pmtimer
> > - Merge if's in init_pmtimer
> > ---
> >  xen/arch/x86/acpi/boot.c    | 19 +++++++++++++++----
> >  xen/arch/x86/time.c         | 12 ++++--------
> >  xen/include/acpi/acmacros.h |  8 ++++++++
> >  3 files changed, 27 insertions(+), 12 deletions(-)
> > 
> > diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
> > index bcba52e232..24fd236eb5 100644
> > --- a/xen/arch/x86/acpi/boot.c
> > +++ b/xen/arch/x86/acpi/boot.c
> > @@ -475,10 +475,17 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
> >  
> >  #ifdef CONFIG_X86_PM_TIMER
> >  	/* detect the location of the ACPI PM Timer */
> > -	if (fadt->header.revision >= FADT2_REVISION_ID) {
> > +	if (fadt->header.revision >= FADT2_REVISION_ID &&
> > +	    fadt->xpm_timer_block.space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
> >  		/* FADT rev. 2 */
> > -		if (fadt->xpm_timer_block.space_id ==
> > -		    ACPI_ADR_SPACE_SYSTEM_IO) {
> > +		if (fadt->xpm_timer_block.access_width != 0 &&
> > +		    ACPI_ACCESS_BIT_WIDTH(fadt->xpm_timer_block.access_width) != 32)
> > +			printk(KERN_WARNING PREFIX "PM-Timer has invalid access width(%u)\n",
> > +			       fadt->xpm_timer_block.access_width);
> > +		else if (fadt->xpm_timer_block.bit_offset != 0)
> 
> This should be a plain if instead of an else if, it's possible the
> block has both the access_width and the bit_offset wrong.

My bad, realized this avoids setting pmtmr_ioport.

Roger.

