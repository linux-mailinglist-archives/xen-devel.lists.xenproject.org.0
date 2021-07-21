Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657873D0BC1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 12:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159260.292961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m69Bu-0002t0-HQ; Wed, 21 Jul 2021 10:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159260.292961; Wed, 21 Jul 2021 10:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m69Bu-0002qv-Cy; Wed, 21 Jul 2021 10:11:02 +0000
Received: by outflank-mailman (input) for mailman id 159260;
 Wed, 21 Jul 2021 10:09:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9/7=MN=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1m69Ag-00025T-Ul
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 10:09:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13d3a32d-c754-49bd-877e-37ddd4865f96;
 Wed, 21 Jul 2021 10:09:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BAC960FE7;
 Wed, 21 Jul 2021 10:09:43 +0000 (UTC)
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
X-Inumbo-ID: 13d3a32d-c754-49bd-877e-37ddd4865f96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626862185;
	bh=AkCAzoeKK4dm3J0IYr3eqKdLUog3VqnY+aXSEhth1R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1tD+1+8N7ya+U+R4FoCk5r1AY0+njsEQDtKrpnu5fKg2Nsyw8ad0RAbDRa8LMlYN
	 kIGK/SB0S4EC/Bt9LoElGD8+QX12QgKfoR1683w3NYrmezl45haNH7nWDa/e7NVumf
	 ZIzS+wQ0FwO2WzFS4jJEXOjj+Re557OYzd+zf9Xc=
Date: Wed, 21 Jul 2021 12:09:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Alex Elder <elder@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Eric Farman <farman@linux.ibm.com>,
	Finn Thain <fthain@linux-m68k.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <lznuaa@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Geoff Levand <geoff@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Halil Pasic <pasic@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Ira Weiny <ira.weiny@intel.com>, Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jaroslav Kysela <perex@perex.cz>, Jason Wang <jasowang@redhat.com>,
	Jens Taprogge <jens.taprogge@taprogge.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Joey Pabalan <jpabalanb@gmail.com>, Johan Hovold <johan@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Johannes Thumshirn <morbidrsa@gmail.com>,
	Jon Mason <jdmason@kudzu.us>, Juergen Gross <jgross@suse.com>,
	Julien Grall <jgrall@amazon.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lee Jones <lee.jones@linaro.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Gross <mgross@linux.intel.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Martyn Welch <martyn@welchs.me.uk>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Matt Porter <mporter@kernel.crashing.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>,
	Michael Jamet <michael.jamet@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mike Christie <michael.christie@oracle.com>,
	Moritz Fischer <mdf@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Mackerras <paulus@samba.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rich Felker <dalias@libc.org>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
	SeongJae Park <sjpark@amazon.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Van Asbroeck <TheSven73@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Tomas Winkler <tomas.winkler@intel.com>, Tom Rix <trix@redhat.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Wei Liu <wei.liu@kernel.org>,
	William Breathitt Gray <vilhelm.gray@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	YueHaibing <yuehaibing@huawei.com>, Yufen Yu <yuyufen@huawei.com>,
	alsa-devel@alsa-project.org, dmaengine@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	industrypack-devel@lists.sourceforge.net, kvm@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-fpga@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-ntb@googlegroups.com,
	linux-parisc@vger.kernel.org, linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	nvdimm@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	sparclinux@vger.kernel.org, target-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/5] bus: Make remove callback return void
Message-ID: <YPfyZen4Y0uDKqDT@kroah.com>
References: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>

On Tue, Jul 13, 2021 at 09:35:17PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this is v4 of the final patch set for my effort to make struct
> bus_type::remove return void.
> 
> The first four patches contain cleanups that make some of these
> callbacks (more obviously) always return 0. They are acked by the
> respective maintainers. Bjorn Helgaas explicitly asked to include the
> pci patch (#1) into this series, so Greg taking this is fine. I assume
> the s390 people are fine with Greg taking patches #2 to #4, too, they
> didn't explicitly said so though.
> 
> The last patch actually changes the prototype and so touches quite some
> drivers and has the potential to conflict with future developments, so I
> consider it beneficial to put these patches into next soon. I expect
> that it will be Greg who takes the complete series, he already confirmed
> via irc (for v2) to look into this series.
> 
> The only change compared to v3 is in the fourth patch where I modified a
> few more drivers to fix build failures. Some of them were found by build
> bots (thanks!), some of them I found myself using a regular expression
> search. The newly modified files are:
> 
>  arch/sparc/kernel/vio.c
>  drivers/nubus/bus.c
>  drivers/sh/superhyway/superhyway.c
>  drivers/vlynq/vlynq.c
>  drivers/zorro/zorro-driver.c
>  sound/ac97/bus.c
> 
> Best regards
> Uwe

Now queued up.  I can go make a git tag that people can pull from after
0-day is finished testing this to verify all is good, if others need it.

thanks,

greg k-h

