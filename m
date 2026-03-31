Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPAuOzXiy2n0MAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:03:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6536B54C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269062.1558214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7acO-00074z-59; Tue, 31 Mar 2026 15:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269062.1558214; Tue, 31 Mar 2026 15:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7acO-00072S-2T; Tue, 31 Mar 2026 15:03:00 +0000
Received: by outflank-mailman (input) for mailman id 1269062;
 Tue, 31 Mar 2026 15:02:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ilpo.jarvinen@linux.intel.com>) id 1w7acM-000723-MM
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:02:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7acM-008jFp-2C
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:02:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ilpo.jarvinen@linux.intel.com>)
 id 69cbe218-2eae-0a2a0a5409dd-0a2a4505be9e-30
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:02:56 +0200
Received: from [192.198.163.9] (helo=mgamail.intel.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ilpo.jarvinen@linux.intel.com>)
 id 69cbe21e-5aeb-0a2a45050019-c0c6a30982d7-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:02:56 +0200
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:02:53 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:02:37 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774969376; x=1806505376;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lKc0nR0+3UMuWZyWz6l9MjXgdkdLagd8O+NJe9KaxV4=;
  b=F+VgHQWfalgDZR7+DXUrOTZbIFCO9gX3e0aVFmlQkhph+bZPKjQOLol8
   ryixn/jEJ3gHgKULmO5Jeffxxs6C8teDBbz9U3rkydZoeiLkeNVDKQq8C
   E3JaqdlsglB2zmIhcPtROCVTmWWP2XYvs+XJWy9En8ElVd0GQAdm9cyyN
   sbcY0i5+z1dAfaPQVzI4Gj2GuUV15lq+xMYLbKqQesmRVvNq3595hVp7n
   cJ7MjLt5OQWnOmMZQw/Qi7jO19cuuqH4f5FFrCheZv6WCF66F7F12e31n
   fXew6N8oYYJNjqHPLY7UETBKSPU6ZbrHgefuvnTCmrPIOaeWp5q6+rIr4
   A==;
X-CSE-ConnectionGUID: LIGBrtE1QUmVGo4tiRwZzA==
X-CSE-MsgGUID: dJNhuoN1S+S4Fh2xlD85+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86682249"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86682249"
X-CSE-ConnectionGUID: JHiKH3CWRemnPBHhcWS24A==
X-CSE-MsgGUID: Gcx1iYgWQJaJHg3SKbkrBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="221527611"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 18:02:33 +0300 (EEST)
To: Danilo Krummrich <dakr@kernel.org>
cc: Russell King <linux@armlinux.org.uk>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Ioana Ciornei <ioana.ciornei@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>, 
    Nikhil Agarwal <nikhil.agarwal@amd.com>, 
    "K. Y. Srinivasan" <kys@microsoft.com>, 
    Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
    Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Vineeth Vijayan <vneethv@linux.ibm.com>, 
    Peter Oberparleiter <oberpar@linux.ibm.com>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, 
    Harald Freudenberger <freude@linux.ibm.com>, 
    Holger Dengler <dengler@linux.ibm.com>, Mark Brown <broonie@kernel.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
    Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
    =?ISO-8859-15?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, 
    Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, driver-core@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
    linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
    linux-s390@vger.kernel.org, linux-spi@vger.kernel.org, 
    virtualization@lists.linux.dev, kvm@vger.kernel.org, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    Gui-Dong Han <hanguidong02@gmail.com>
Subject: Re: [PATCH 06/12] platform/wmi: use generic driver_override
 infrastructure
In-Reply-To: <20260324005919.2408620-7-dakr@kernel.org>
Message-ID: <f15629e4-ef8f-b1b6-0158-064f40f111da@linux.intel.com>
References: <20260324005919.2408620-1-dakr@kernel.org> <20260324005919.2408620-7-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1774969376-9F283488-BFCDF2BC/0/0
X-purgate-type: clean
X-purgate-size: 4261
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86
 @vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 2DB6536B54C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026, Danilo Krummrich wrote:

> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
> 
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
> 
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
> 
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
> Fixes: 12046f8c77e0 ("platform/x86: wmi: Add driver_override support")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/platform/wmi/core.c | 36 +++++-------------------------------
>  include/linux/wmi.h         |  4 ----
>  2 files changed, 5 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index b8e6b9a421c6..750e3619724e 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -842,39 +842,11 @@ static ssize_t expensive_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(expensive);
>  
> -static ssize_t driver_override_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct wmi_device *wdev = to_wmi_device(dev);
> -	ssize_t ret;
> -
> -	device_lock(dev);
> -	ret = sysfs_emit(buf, "%s\n", wdev->driver_override);
> -	device_unlock(dev);
> -
> -	return ret;
> -}
> -
> -static ssize_t driver_override_store(struct device *dev, struct device_attribute *attr,
> -				     const char *buf, size_t count)
> -{
> -	struct wmi_device *wdev = to_wmi_device(dev);
> -	int ret;
> -
> -	ret = driver_set_override(dev, &wdev->driver_override, buf, count);
> -	if (ret < 0)
> -		return ret;
> -
> -	return count;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
>  static struct attribute *wmi_attrs[] = {
>  	&dev_attr_modalias.attr,
>  	&dev_attr_guid.attr,
>  	&dev_attr_instance_count.attr,
>  	&dev_attr_expensive.attr,
> -	&dev_attr_driver_override.attr,
>  	NULL
>  };
>  ATTRIBUTE_GROUPS(wmi);
> @@ -943,7 +915,6 @@ static void wmi_dev_release(struct device *dev)
>  {
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  
> -	kfree(wblock->dev.driver_override);
>  	kfree(wblock);
>  }
>  
> @@ -952,10 +923,12 @@ static int wmi_dev_match(struct device *dev, const struct device_driver *driver)
>  	const struct wmi_driver *wmi_driver = to_wmi_driver(driver);
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  	const struct wmi_device_id *id = wmi_driver->id_table;
> +	int ret;
>  
>  	/* When driver_override is set, only bind to the matching driver */
> -	if (wblock->dev.driver_override)
> -		return !strcmp(wblock->dev.driver_override, driver->name);
> +	ret = device_match_driver_override(dev, driver);
> +	if (ret >= 0)
> +		return ret;
>  
>  	if (id == NULL)
>  		return 0;
> @@ -1076,6 +1049,7 @@ static struct class wmi_bus_class = {
>  static const struct bus_type wmi_bus_type = {
>  	.name = "wmi",
>  	.dev_groups = wmi_groups,
> +	.driver_override = true,
>  	.match = wmi_dev_match,
>  	.uevent = wmi_dev_uevent,
>  	.probe = wmi_dev_probe,
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index 75cb0c7cfe57..14fb644e1701 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -18,16 +18,12 @@
>   * struct wmi_device - WMI device structure
>   * @dev: Device associated with this WMI device
>   * @setable: True for devices implementing the Set Control Method
> - * @driver_override: Driver name to force a match; do not set directly,
> - *		     because core frees it; use driver_set_override() to
> - *		     set or clear it.
>   *
>   * This represents WMI devices discovered by the WMI driver core.
>   */
>  struct wmi_device {
>  	struct device dev;
>  	bool setable;
> -	const char *driver_override;
>  };
>  
>  /**
> 

Hi,

I tried applying this to platform-drivers tree but it failed to compile so 
I ended up dropping the changed.

-- 
 i.


