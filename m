Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B492E3BCB11
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 12:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151089.279273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ilC-0008Og-A2; Tue, 06 Jul 2021 10:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151089.279273; Tue, 06 Jul 2021 10:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ilC-0008LT-6H; Tue, 06 Jul 2021 10:57:02 +0000
Received: by outflank-mailman (input) for mailman id 151089;
 Tue, 06 Jul 2021 10:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fRgM=L6=linaro.org=srinivas.kandagatla@srs-us1.protection.inumbo.net>)
 id 1m0ilA-0008LH-CK
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 10:57:00 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72e8b367-3935-47c9-8861-e74d2066ff95;
 Tue, 06 Jul 2021 10:56:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i8so12669854wrp.12
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 03:56:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o3sm16468134wrw.56.2021.07.06.03.56.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:56:57 -0700 (PDT)
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
X-Inumbo-ID: 72e8b367-3935-47c9-8861-e74d2066ff95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l+H215FJz8pJPI4hh9v/iWNuVbn0nifA4Jaafd28qC4=;
        b=UCSZee8bkwQhVbXkWa9n6dda1YB5cGQkIPiVKhb8KKz80S/zIXHEgxifSSr+8L29bp
         bwv7fkXzMNhKGGQN2c3BmsUcjrj/WCoXm6Ben2qP8+Bg0YH95vQBsFhGIbEyGr/lrU1Q
         Ln5txN4w7J+T5EMRaT/NpEGp+Hm9dI3o+V77bGk/sdRf0SYC4Lr7n5Wxc/3RjcZaFj49
         pMNis8YQVecjuUzjIFQPnwBJPdiGSBK5ZHDxUgMGNPSzs1az976bZyXyvd6ztydUQ9Xm
         nwGGg1WV1KPpW+turyU66Gq6SgHBmHxg/+HCmUj/1/PNr7tZsqoiZrxGaduOWyUClunz
         BuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l+H215FJz8pJPI4hh9v/iWNuVbn0nifA4Jaafd28qC4=;
        b=o9KZn0J9CZVFWX9rG76JYFb4jrukADMmusPRHR7/r+8nfIOwb3b5mXivlMui8NviIc
         qhOtFmu5lFU6jwq/rmZmJtoCfkVnMVhSQBfxfBhYfSHyALy38OMG8sphhMJIizWhCV+4
         utiDJiQuD8WSWTTtwpHmR7FNmvapybRD41LZGwLzraykHfyaDApcLuv8lxc1p+njCBnL
         y3J2UiuqLlsmK5+lA4nJN7wANFh+cuEMFDdUHCMJmD6Pd8HTlgpVhk9XfqYnIqJWiFqe
         NQvK2Gd7a0coAS5YJ76lmdV6L+ZOEhooCywV9EiU6HD7HTA35oGZzw72axNB5/s7ua0+
         ZTUw==
X-Gm-Message-State: AOAM531+wdRr809yzAX3eRWPH3Kb8wmulf5/RGYknu8RyxTjIZnJDbGB
	2D0FEQs49eQcBeETgAtQC7q2G19KSDoY1fQN
X-Google-Smtp-Source: ABdhPJwMhrNwpvhovE9XwK0jC9OIuq8TBsnt9DrnKno6fhX9rnIZO8Cd1er4LBIyS1GM0G/5i1HmFw==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr21172584wrq.355.1625569018612;
        Tue, 06 Jul 2021 03:56:58 -0700 (PDT)
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>, William Breathitt Gray
 <vilhelm.gray@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bd408732-a23d-d3e6-3786-ea9fbf114d50@linaro.org>
Date: Tue, 6 Jul 2021 11:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 06/07/2021 10:50, Uwe Kleine-König wrote:
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
> Signed-off-by: Uwe Kleine-König<u.kleine-koenig@pengutronix.de>
> ---
...

>   drivers/slimbus/core.c                    | 4 +---

for slimbus changes:

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


