Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D379F3BE1BD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 06:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151452.280560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ykp-0003pP-Vj; Wed, 07 Jul 2021 04:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151452.280560; Wed, 07 Jul 2021 04:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ykp-0003mc-RK; Wed, 07 Jul 2021 04:01:43 +0000
Received: by outflank-mailman (input) for mailman id 151452;
 Tue, 06 Jul 2021 15:12:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gg2m=L6=linux.intel.com=alexander.shishkin@srs-us1.protection.inumbo.net>)
 id 1m0mka-0004TB-F5
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:12:40 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 999a881a-de6c-11eb-84a5-12813bfff9fa;
 Tue, 06 Jul 2021 15:12:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 08:12:36 -0700
Received: from um.fi.intel.com (HELO um) ([10.237.72.62])
 by orsmga002.jf.intel.com with ESMTP; 06 Jul 2021 08:12:00 -0700
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
X-Inumbo-ID: 999a881a-de6c-11eb-84a5-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196414592"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; 
   d="scan'208";a="196414592"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; 
   d="scan'208";a="427618041"
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, William
 Breathitt Gray <vilhelm.gray@gmail.com>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82eck?=
 =?utf-8?Q?i?= <zajec5@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Ben Widawsky <ben.widawsky@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
 <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>, Tom Rix
 <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Wolfram Sang <wsa@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Samuel Iglesias Gonsalvez
 <siglesias@igalia.com>, Jens Taprogge <jens.taprogge@taprogge.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov
 <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones
 <lee.jones@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Arnd
 Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Jon Mason <jdmason@kudzu.us>, Allen Hubbe
 <allenbh@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84sk?=
 =?utf-8?Q?i?=
 <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Dominik Brodowski
 <linux@dominikbrodowski.net>, Maximilian Luz <luzmaximilian@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>,
 Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine
 <alex.bou9@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Thorsten Scherer <t.scherer@eckelmann.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross
 <agross@kernel.org>, Mark Brown <broonie@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Michael Buesch <m@bues.ch>, Sven Van Asbroeck
 <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder
 <elder@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Michael
 Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Rob Herring <robh@kernel.org>, Jiri Slaby
 <jirislaby@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Martyn
 Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Johannes
 Berg <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Marc Zyngier <maz@kernel.org>, Tyrel
 Datwyler <tyreld@linux.ibm.com>, Vladimir Zapolskiy <vz@mleia.com>, Samuel
 Holland <samuel@sholland.org>, Qinglang Miao <miaoqinglang@huawei.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>, Joey Pabalan <jpabalanb@gmail.com>, Pali
 =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Frank Li
 <lznuaa@gmail.com>, Mike Christie <michael.christie@oracle.com>, Bodo
 Stroesser <bostroesser@gmail.com>, Hannes Reinecke <hare@suse.de>, David
 Woodhouse <dwmw@amazon.co.uk>, SeongJae Park <sjpark@amazon.de>, Julien
 Grall <jgrall@amazon.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
 dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, industrypack-devel@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, alexander.shishkin@linux.intel.com
Subject: Re: [PATCH] bus: Make remove callback return void
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Date: Tue, 06 Jul 2021 18:11:59 +0300
Message-ID: <87eecbjx34.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

FWIW, the intel_th bit is

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

