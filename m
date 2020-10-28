Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F029D15F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 18:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13807.34535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXpUz-0001uI-KY; Wed, 28 Oct 2020 17:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13807.34535; Wed, 28 Oct 2020 17:44:37 +0000
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
	id 1kXpUz-0001tt-HA; Wed, 28 Oct 2020 17:44:37 +0000
Received: by outflank-mailman (input) for mailman id 13807;
 Wed, 28 Oct 2020 17:44:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2Gk=ED=gmail.com=richardcochran@srs-us1.protection.inumbo.net>)
 id 1kXpUy-0001tm-Fq
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 17:44:36 +0000
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c361b3e-38cf-401a-978e-43b2fa062533;
 Wed, 28 Oct 2020 17:44:35 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c20so46886pfr.8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 10:44:35 -0700 (PDT)
Received: from hoboy.vegasvil.org (c-73-241-114-122.hsd1.ca.comcast.net.
 [73.241.114.122])
 by smtp.gmail.com with ESMTPSA id d26sm224049pfo.82.2020.10.28.10.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 10:44:34 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m2Gk=ED=gmail.com=richardcochran@srs-us1.protection.inumbo.net>)
	id 1kXpUy-0001tm-Fq
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 17:44:36 +0000
X-Inumbo-ID: 5c361b3e-38cf-401a-978e-43b2fa062533
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c361b3e-38cf-401a-978e-43b2fa062533;
	Wed, 28 Oct 2020 17:44:35 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c20so46886pfr.8
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GeMX+k14VhxeG76k1/qSlgb4+cXieu72K4e08pwdt1o=;
        b=InpLHLruF700Q395/JUSDPFi5ct3Q0NFGhIrDU/UmIhGdDThKH8GKD+cw6T2N6QNcD
         PUvF0K87ShFDKaAjJCfvpeMCAaEiJ8eHb269GNLlCVUSVFBQarvkQDFEeK2v65rPe7+J
         tC/1aFfwnYWg9j8u/6Ud/Yyen1uhouxurM0nLvzz3MYFdzPpthJUWusVU6lftQoy21uA
         qiW9X1ZTMFe3cniRtPQ+TCgotIme378DGRcyAXvYYZgBHvV1ur7fGjNBhSILa0vbkqSM
         tRUkeNha3rVBlOMkNme6QRGiAF7X/US6S2FlZ9tPWrsV95ioL0sZyvBU99MP8xfC1Ema
         woPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GeMX+k14VhxeG76k1/qSlgb4+cXieu72K4e08pwdt1o=;
        b=sn+m+5GF+Yh/tHLzNoBwmOz8s+oaTjBF77eOMWtLfh3AR/3n+WPoAp3/raCdcfQo6F
         CiWOKjQg0IOLh+CRGkZg6yXFcXpoYtQJGxaoHP4pI/zNjnMj7b2gtIA6s5PK4lP3gO9u
         6Ov2BS0dlSKw8uA/bQggOrz2L/AdOC6HvbyzDGzS+bgUbN1ZdQmk6myPuwSVgPNJCvWd
         YQ3kfKxz+KI6j2nCzqj5MfL92y/9AVnWawDt+KGQbzG3YTPYPx5+Muj18Am7wSY5fEoh
         xGCSn0ONkv6TvDmUTPR0zu4xxxxdmYp4Rqzd5UiziKnFFqR+e2BXN7xB7flRmOz0wynL
         A3Sg==
X-Gm-Message-State: AOAM532o2T7mDknJZn1jVZn5aVcjF7KdGoRQtkEqSpXhiIC2DNh3YPX7
	/X5lREjh54SrAGnLy6M+ZIQ=
X-Google-Smtp-Source: ABdhPJw+P7PZ1ANDYILo79Hsg7TsK8M0hrdd6+wFNAfXxYnBAlE0Wr2vQTH+qAkmHlbh1+XaD9f7GA==
X-Received: by 2002:a63:78c3:: with SMTP id t186mr490857pgc.12.1603907075050;
        Wed, 28 Oct 2020 10:44:35 -0700 (PDT)
Received: from hoboy.vegasvil.org (c-73-241-114-122.hsd1.ca.comcast.net. [73.241.114.122])
        by smtp.gmail.com with ESMTPSA id d26sm224049pfo.82.2020.10.28.10.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 10:44:34 -0700 (PDT)
Date: Wed, 28 Oct 2020 10:44:27 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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
	Fabrice Gasnier <fabrice.gasnier@st.com>,
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Oleh Kravchenko <oleg@kaa.org.ua>, Orson Zhai <orsonzhai@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Peter Rosin <peda@axentia.se>, Petr Mladek <pmladek@suse.com>,
	Philippe Bergheaud <felix@linux.ibm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 20/33] docs: ABI: testing: make the files compatible with
 ReST output
Message-ID: <20201028174427.GE9364@hoboy.vegasvil.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Oct 28, 2020 at 03:23:18PM +0100, Mauro Carvalho Chehab wrote:

> diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> index aa39f8d7bcdf..d0893dad3f38 100644
> --- a/Documentation/ABI/testing/sysfs-uevent
> +++ b/Documentation/ABI/testing/sysfs-uevent
> @@ -19,7 +19,8 @@ Description:
>                  a transaction identifier so it's possible to use the same UUID
>                  value for one or more synthetic uevents in which case we
>                  logically group these uevents together for any userspace
> -                listeners. The UUID value appears in uevent as
> +                listeners. The UUID value appears in uevent as:

I know almost nothing about Sphinx, but why have one colon here ^^^ and ...

> +
>                  "SYNTH_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" environment
>                  variable.
>  
> @@ -30,18 +31,19 @@ Description:
>                  It's possible to define zero or more pairs - each pair is then
>                  delimited by a space character ' '. Each pair appears in
>                  synthetic uevent as "SYNTH_ARG_KEY=VALUE". That means the KEY
> -                name gains "SYNTH_ARG_" prefix to avoid possible collisions
> +                name gains `SYNTH_ARG_` prefix to avoid possible collisions
>                  with existing variables.
>  
> -                Example of valid sequence written to the uevent file:
> +                Example of valid sequence written to the uevent file::

... two here?

Thanks,
Richard

