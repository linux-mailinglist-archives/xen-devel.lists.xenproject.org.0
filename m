Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPBvEikExGnOvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:50:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80143286F1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262698.1555117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QUL-0001m1-JP; Wed, 25 Mar 2026 15:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262698.1555117; Wed, 25 Mar 2026 15:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QUL-0001iy-Gb; Wed, 25 Mar 2026 15:49:45 +0000
Received: by outflank-mailman (input) for mailman id 1262698;
 Wed, 25 Mar 2026 15:49:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mathieu.poirier@linaro.org>) id 1w5QUK-0001is-6g
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:49:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QUJ-00GgsW-EG
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:49:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mathieu.poirier@linaro.org>)
 id 69c40403-5cb7-0a2a0a5109dd-0a2a4504d784-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:49:43 +0100
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <mathieu.poirier@linaro.org>)
 id 69c40417-c823-0a2a45040019-d155d034aca6-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:49:43 +0100
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-66a33f61d80so4392970a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:49:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1774453782; cv=none;
        d=google.com; s=arc-20240605;
        b=X5fmlTZvxkVlDBdu3B9kMqirVBbp88cfiGZuxAXV3QMhDRDv+ZIaGPvZ0tq227XTDD
         4RunYdQiCMHUoifkZAxSQQ42S6V8tR5E0yYTjyFu8l6PCrwbrLnBwOy9OnSycikplUvy
         M6PAk/jxYFdNuQjZuqJ3IJZT3a1uQuj3CbtKkaKhsB+yr84mJC7c403VnZa1WiZgICGX
         e2+VG8gWoSqCUV7Xnbkl/xe0NGte0JaUqO2abZc43lsxgP99l2UuKA3kyoFxCcBNFEEA
         J+0KEWmO7CQ+TmW5xiVRswl3wABy87TqY6YSIxbdfgAFfs3kq0qsawrOVLVPt/qDqWiI
         gv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=;
        fh=BEse2LHURIga/im0N7SjF34mecH3uUNBuQ4L12A4nsI=;
        b=N+RdvQQ+DEJgot399QbSZVMcscuVCWpqqMKuP6O9J+gdIv5uQSnn8TvYD9Dg4mHBTg
         f5n0kykbP/D5YKhCsMFpHPDfwlVjiyDvuK3+YKPO/wm5ZAFkzvc0UiYev74Q+aXzPD/e
         t3xpLIWL7Ne8hJi8oE0FTexROHFR7+17ilDobOBT7l/8E52ppyNLGxOuWnBrGeuv8FMx
         hl5CUAzMp8K2MNot/GoXqXz62/3ciJYAJIC12l6/jFyqCTw5jeNXRVZFzy0RvzR1fqB7
         euG+d5QhEK1G4egoFmoC0gVa8COgBy8QqWqADanR30tB4GmYxKFeXskQpwQw5kTVtPSV
         uqZA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774453782; x=1775058582; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=;
        b=fxXlZ0Iqyim9I+ZN8Jq+jhpjFiTa8D2BjXIij+3YM54eMacwm1LaFBKyYFdkU20nNU
         sPeyrOO/yBxZVK4k8SXvrV/+0n1D5W7q+YmitC3qY96Q82MdChi+bpn/TX+cgTTPmkcg
         kHrudwnus0HmSmAfLzHLPIM3g9Mvn/fHs4TyqxNF31wJQR9CAtkWIAnhEMXYQq/hhpMI
         /z1RkNHZdxumDYbEGQe965Vp5olhU/YRkOs+7kBzbHhlKTAfs1Plm9IDaaVPULQoOTJZ
         C+OaHgR4WjTGs5PGZjbJ1FhrUMRwV7MD+7QdaEYZyVS+sSfNmPUOey2XPHh7w17kcu/u
         ZO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774453782; x=1775058582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PetZC3qxgw91I7G4PL1kgiG97oaIIgIA0g2FQ1jwb8M=;
        b=XU1Gd2zsg24BpZ5yXBuvSVaP3OT9ivr47d5gmE5fvH2pqCMLDuCij6jL6vnSaLRo/s
         CAusDQiN/45Y3nxON9Mn4WVpXkDvgYplbHtf1b3+4BqMkAhNQ/xH/rQ8I4XI6sLn/rUc
         enKZJNo2QmqJQJbhpTpQCRjBRDlJQddptX3RAXdg6gMbFZwZ1oh4XJi4/ne2d8IZJL+w
         Q6u6O2URYJlqvh7gp15PTaAfqoo1Wo0a7VeeSe+kEepYxF9tKTf4ZHiMi1mbLFyJDvUj
         HDHvXhtlP01ESWsT61wwoTBYtwOpIQDnnAC1lE0449+RpTWne8pjVSgAvr7C8F/2W6qT
         JY5g==
X-Forwarded-Encrypted: i=1; AJvYcCWBi7Wx0F+/wUtNCVppAV5pW7jY2HC08vSWb/diasyb2VW+0pcKsntSiE+CvXFGlVAOBdpZggTkiGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy2rm0Yb9s64/CyRmGSMF9ci35TifKSbfOB2wrZj1xIlCICd6K
	F/xdcr6MLOwJ+RtkIH6LGQLeA5thodA5t4Nc6wVakwq2lQN0ePZgBxNGGYZ9iudVoTsMN3ucH14
	X/gqWYZYuXiddghPPlJNL3Fm1v293PLhI88ah1bYyfw==
X-Gm-Gg: ATEYQzznbOVF6SbACe5Nc0ZoHJUe7adFyZy8AdyJElRinZkPPqjDswalC1PYRDIgtGA
	0oStJH0+HlPgG9oRN1LZr3TG3pSFNld2jboNcPibuCrc8jN0VKQnB72uExUk1Shhrr82gtu4eBB
	dJhKqjnkvug+wCEMkNv0JGZ0Et5fNrDkeZN/GT4HEhs878WOmv5sVwXXyioXg5sy6Z33Oj7R5VR
	OkO8y84S6RO+RTIXtBB+tL2eWlY65E1rMYDn3wlP+ZA1KYLGyNZuw2JOjYJt3UxAOSzcEb7NClY
	DIfaCf3VdIGtJsGNDpZ1OvornHWQZdJv085tyjg5pg==
X-Received: by 2002:a05:6402:3251:b0:668:368b:38d3 with SMTP id
 4fb4d7f45d1cf-66a82634560mr2196905a12.12.1774453782373; Wed, 25 Mar 2026
 08:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260324005919.2408620-1-dakr@kernel.org> <20260324005919.2408620-8-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-8-dakr@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 25 Mar 2026 09:49:31 -0600
X-Gm-Features: AQROBzDaUkN0ZNcFR8HLoPUZ0UwwRolGugOyW2ifJVz-O5YTothUc8ZwonnT9P8
Message-ID: <CANLsYkyNx+e=QrSc=ZOqgMcOpwqdpCWsuhrvByJYcXLHPSHMUw@mail.gmail.com>
Subject: Re: [PATCH 07/12] rpmsg: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
	Bjorn Andersson <andersson@kernel.org>, Vineeth Vijayan <vneethv@linux.ibm.com>, 
	Peter Oberparleiter <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-spi@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-arm-kernel@lists.infradead.org, Gui-Dong Han <hanguidong02@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1774453783-108609D1-FC7C9E44/0/0
X-purgate-type: clean
X-purgate-size: 7141
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-arm-
 msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A80143286F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Mar 2026 at 19:00, Danilo Krummrich <dakr@kernel.org> wrote:
>
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
> Fixes: e95060478244 ("rpmsg: Introduce a driver override mechanism")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 --

For the below files:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  drivers/rpmsg/rpmsg_core.c        | 43 +++++--------------------------
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  1 -
>  include/linux/rpmsg.h             |  4 ---
>  4 files changed, 7 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 9ef17c2e45b0..e9d1b2082477 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1623,7 +1623,6 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  {
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> @@ -1859,7 +1858,6 @@ static void qcom_glink_device_release(struct device *dev)
>
>         /* Release qcom_glink_alloc_channel() reference */
>         kref_put(&channel->refcount, qcom_glink_channel_release);
> -       kfree(rpdev->driver_override);
>         kfree(rpdev);
>  }
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 96964745065b..2b9f6d5a9a4f 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -358,33 +358,6 @@ rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       int ret;
> -
> -       ret = driver_set_override(dev, &rpdev->driver_override, buf, count);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *buf)
> -{
> -       struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len = sysfs_emit(buf, "%s\n", rpdev->driver_override);
> -       device_unlock(dev);
> -       return len;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> -
>  static ssize_t modalias_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
> @@ -405,7 +378,6 @@ static struct attribute *rpmsg_dev_attrs[] = {
>         &dev_attr_dst.attr,
>         &dev_attr_src.attr,
>         &dev_attr_announce.attr,
> -       &dev_attr_driver_override.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(rpmsg_dev);
> @@ -424,9 +396,11 @@ static int rpmsg_dev_match(struct device *dev, const struct device_driver *drv)
>         const struct rpmsg_driver *rpdrv = to_rpmsg_driver(drv);
>         const struct rpmsg_device_id *ids = rpdrv->id_table;
>         unsigned int i;
> +       int ret;
>
> -       if (rpdev->driver_override)
> -               return !strcmp(rpdev->driver_override, drv->name);
> +       ret = device_match_driver_override(dev, drv);
> +       if (ret >= 0)
> +               return ret;
>
>         if (ids)
>                 for (i = 0; ids[i].name[0]; i++)
> @@ -535,6 +509,7 @@ static const struct bus_type rpmsg_bus = {
>         .name           = "rpmsg",
>         .match          = rpmsg_dev_match,
>         .dev_groups     = rpmsg_dev_groups,
> +       .driver_override = true,
>         .uevent         = rpmsg_uevent,
>         .probe          = rpmsg_dev_probe,
>         .remove         = rpmsg_dev_remove,
> @@ -560,11 +535,9 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>
>         device_initialize(dev);
>         if (driver_override) {
> -               ret = driver_set_override(dev, &rpdev->driver_override,
> -                                         driver_override,
> -                                         strlen(driver_override));
> +               ret = device_set_driver_override(dev, driver_override);
>                 if (ret) {
> -                       dev_err(dev, "device_set_override failed: %d\n", ret);
> +                       dev_err(dev, "device_set_driver_override() failed: %d\n", ret);
>                         put_device(dev);
>                         return ret;
>                 }
> @@ -573,8 +546,6 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
>         ret = device_add(dev);
>         if (ret) {
>                 dev_err(dev, "device_add failed: %d\n", ret);
> -               kfree(rpdev->driver_override);
> -               rpdev->driver_override = NULL;
>                 put_device(dev);
>         }
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8d9e2b4dc7c1..e0dacb736ef9 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -373,7 +373,6 @@ static void virtio_rpmsg_release_device(struct device *dev)
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>         struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>
> -       kfree(rpdev->driver_override);
>         kfree(vch);
>  }
>
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index fb7ab9165645..c2e3ef8480d5 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -41,9 +41,6 @@ struct rpmsg_channel_info {
>   * rpmsg_device - device that belong to the rpmsg bus
>   * @dev: the device struct
>   * @id: device id (used to match between rpmsg drivers and devices)
> - * @driver_override: driver name to force a match; do not set directly,
> - *                   because core frees it; use driver_set_override() to
> - *                   set or clear it.
>   * @src: local address
>   * @dst: destination address
>   * @ept: the rpmsg endpoint of this channel
> @@ -53,7 +50,6 @@ struct rpmsg_channel_info {
>  struct rpmsg_device {
>         struct device dev;
>         struct rpmsg_device_id id;
> -       const char *driver_override;
>         u32 src;
>         u32 dst;
>         struct rpmsg_endpoint *ept;
> --
> 2.53.0
>

