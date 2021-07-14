Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA103C82CF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 12:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156018.287949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3c7A-00017E-6C; Wed, 14 Jul 2021 10:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156018.287949; Wed, 14 Jul 2021 10:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3c7A-00014W-34; Wed, 14 Jul 2021 10:27:40 +0000
Received: by outflank-mailman (input) for mailman id 156018;
 Wed, 14 Jul 2021 10:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+8P=MG=arm.com=sudeep.holla@srs-us1.protection.inumbo.net>)
 id 1m3c6Z-00013Q-3e
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 10:27:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e2d9be36-e026-4d30-a2d8-d63594d36c4e;
 Wed, 14 Jul 2021 10:27:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3209A1042;
 Wed, 14 Jul 2021 03:27:00 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF633F774;
 Wed, 14 Jul 2021 03:26:27 -0700 (PDT)
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
X-Inumbo-ID: e2d9be36-e026-4d30-a2d8-d63594d36c4e
Date: Wed, 14 Jul 2021 11:25:29 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
	Sudeep Holla <sudeep.holla@arm.com>,
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
	Finn Thain <fthain@linux-m68k.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <lznuaa@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Geoff Levand <geoff@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hannes Reinecke <hare@suse.de>, Hans de Goede <hdegoede@redhat.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Ira Weiny <ira.weiny@intel.com>, Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
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
	xen-devel@lists.xenproject.org, Johannes Thumshirn <jth@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 5/5] bus: Make remove callback return void
Message-ID: <20210714102529.ehwquc2s2qlbccyg@bogus>
References: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
 <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>

On Tue, Jul 13, 2021 at 09:35:22PM +0200, Uwe Kleine-König wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 

[...]

> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 784cf0027da3..2682c3df651c 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -116,15 +116,13 @@ static int scmi_dev_probe(struct device *dev)
>  	return scmi_drv->probe(scmi_dev);
>  }
>  
> -static int scmi_dev_remove(struct device *dev)
> +static void scmi_dev_remove(struct device *dev)
>  {
>  	struct scmi_driver *scmi_drv = to_scmi_driver(dev->driver);
>  	struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	if (scmi_drv->remove)
>  		scmi_drv->remove(scmi_dev);
> -
> -	return 0;
>  }
>  
>  static struct bus_type scmi_bus_type = {

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

