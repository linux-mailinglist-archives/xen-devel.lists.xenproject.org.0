Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB32A2AEE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 13:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17632.42396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZZDb-0005Hl-83; Mon, 02 Nov 2020 12:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17632.42396; Mon, 02 Nov 2020 12:45:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZZDb-0005HM-4t; Mon, 02 Nov 2020 12:45:51 +0000
Received: by outflank-mailman (input) for mailman id 17632;
 Mon, 02 Nov 2020 12:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+SPx=EI=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kZZDZ-0005HH-4L
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 12:45:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00866e5f-1b31-4c79-bbf0-9b7014648075;
 Mon, 02 Nov 2020 12:45:48 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 889FA223EA;
 Mon,  2 Nov 2020 12:45:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+SPx=EI=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
	id 1kZZDZ-0005HH-4L
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 12:45:49 +0000
X-Inumbo-ID: 00866e5f-1b31-4c79-bbf0-9b7014648075
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 00866e5f-1b31-4c79-bbf0-9b7014648075;
	Mon, 02 Nov 2020 12:45:48 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 889FA223EA;
	Mon,  2 Nov 2020 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604321146;
	bh=ncwNHxV3miBTR7+Pee29GvWhEvy0Pry8NIrln2TBpDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fplJUMXVQzQPj7nj4dUnCkxvodKHovhtsUbV4g2aUQ79+fJ6E4tzwHHtLwPrawdfm
	 ygXz9B3qUMtetcgvuAGg7Eh6Ty6IbDb7/eMxgsGMBrLyyTRXblVKHla6o0f+HiEPyI
	 A/3xupQPmbuXzKqd7UnamHtVajjU98f5F1v6PGqY=
Date: Mon, 2 Nov 2020 13:46:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bruno Meneguele <bmeneg@redhat.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Dan Murphy <dmurphy@ti.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Felipe Balbi <balbi@kernel.org>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Guenter Roeck <groeck@chromium.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Konstantin Khlebnikov <koct9i@gmail.com>,
	Kranthi Kuntala <kranthi.kuntala@intel.com>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Len Brown <lenb@kernel.org>,
	Leonid Maksymchuk <leonmaxx@gmail.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	Mark Gross <mgross@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Oded Gabbay <oded.gabbay@gmail.com>,
	Oleh Kravchenko <oleg@kaa.org.ua>, Orson Zhai <orsonzhai@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Peter Rosin <peda@axentia.se>, Petr Mladek <pmladek@suse.com>,
	Philippe Bergheaud <felix@linux.ibm.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>,
	Vaibhav Jain <vaibhav@linux.ibm.com>,
	Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, xen-devel@lists.xenproject.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 20/39] docs: ABI: testing: make the files compatible
 with ReST output
Message-ID: <20201102124641.GA881895@kroah.com>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <58cf3c2d611e0197fb215652719ebd82ca2658db.1604042072.git.mchehab+huawei@kernel.org>
 <5326488b-4185-9d67-fc09-79b911fbb3b8@st.com>
 <20201030110925.3e09d59e@coco.lan>
 <cb586ea3-b6e6-4e48-2344-2bd641e5323f@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb586ea3-b6e6-4e48-2344-2bd641e5323f@st.com>

On Mon, Nov 02, 2020 at 12:04:36PM +0100, Fabrice Gasnier wrote:
> On 10/30/20 11:09 AM, Mauro Carvalho Chehab wrote:
> > Em Fri, 30 Oct 2020 10:19:12 +0100
> > Fabrice Gasnier <fabrice.gasnier@st.com> escreveu:
> > 
> >> Hi Mauro,
> >>
> >> [...]
> >>
> >>>  
> >>> +What:		/sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available
> >>> +KernelVersion:	4.12
> >>> +Contact:	benjamin.gaignard@st.com
> >>> +Description:
> >>> +		Reading returns the list possible quadrature modes.
> >>> +
> >>> +What:		/sys/bus/iio/devices/iio:deviceX/in_count0_quadrature_mode
> >>> +KernelVersion:	4.12
> >>> +Contact:	benjamin.gaignard@st.com
> >>> +Description:
> >>> +		Configure the device counter quadrature modes:
> >>> +
> >>> +		channel_A:
> >>> +			Encoder A input servers as the count input and B as
> >>> +			the UP/DOWN direction control input.
> >>> +
> >>> +		channel_B:
> >>> +			Encoder B input serves as the count input and A as
> >>> +			the UP/DOWN direction control input.
> >>> +
> >>> +		quadrature:
> >>> +			Encoder A and B inputs are mixed to get direction
> >>> +			and count with a scale of 0.25.
> >>> +  
> >>
> > 
> > Hi Fabrice,
> > 
> >> I just noticed that since Jonathan question in v1.
> >>
> >> Above ABI has been moved in the past as discussed in [1]. You can take a
> >> look at:
> >> b299d00 IIO: stm32: Remove quadrature related functions from trigger driver
> >>
> >> Could you please remove the above chunk ?
> >>
> >> With that, for the stm32 part:
> >> Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > 
> > 
> > Hmm... probably those were re-introduced due to a rebase. This
> > series were originally written about 1,5 years ago.
> > 
> > I'll drop those hunks.
> 
> Hi Mauro, Greg,
> 
> I just figured out this patch has been applied with above hunk.
> 
> This should be dropped: is there a fix on its way already ?
> (I may have missed it)

Can you send a fix for just this hunk?

thanks,

greg k-h

