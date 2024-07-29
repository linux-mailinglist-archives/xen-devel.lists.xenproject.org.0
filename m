Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A693F814
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766833.1177362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRQc-0006s0-Da; Mon, 29 Jul 2024 14:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766833.1177362; Mon, 29 Jul 2024 14:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRQc-0006pa-B1; Mon, 29 Jul 2024 14:32:46 +0000
Received: by outflank-mailman (input) for mailman id 766833;
 Mon, 29 Jul 2024 14:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITaz=O5=bounce.vates.tech=bounce-md_30504962.66a7a802.v1-9d9836ec55ae402c865cf5993de36484@srs-se1.protection.inumbo.net>)
 id 1sYRQa-0006pU-Va
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:32:44 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f897ae-4db7-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:32:43 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WXgn56MjDzCf9KK2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 14:32:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9d9836ec55ae402c865cf5993de36484; Mon, 29 Jul 2024 14:32:34 +0000
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
X-Inumbo-ID: 69f897ae-4db7-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722263561; x=1722524061;
	bh=0B0hEUJ0vxMyrd1PzytLoS0fLlQWml7ZY89g/4uhyso=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AL/63MKiDIoG+WEWzS6mEb04ZXTLICfImTEzVLNtqLLBFynj3d7QHY2TwP2IDVpZX
	 bCUHVZwz/1okiy/l9B/OOJfSjFyoiIa2kGt6L+AHbgFGl1Spyaal00mPfslKJ1HQA+
	 WosRurtFobI/zONdkZqisAWwIc3TwSc6eNvfOHekQF/p/i0eXmsCLOPmY2+uyqOUpQ
	 id8FIMiARm5h2SiU1GY1DzCuE/s+JFJmyVEqRJaAdKYBIhhq269czr8PYpR15oFPw3
	 ELjBJIyM/wMbCXFPykuqr7jdwFAuAYVYhBnGVSJcvDqgTa8qGmKsmCdoJypcSX+ylB
	 2/I9bVg3FtDrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722263561; x=1722524061; i=anthony.perard@vates.tech;
	bh=0B0hEUJ0vxMyrd1PzytLoS0fLlQWml7ZY89g/4uhyso=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=katNSv9fq365Ifvm5vDu8/7kyNFnS4SPqCD2AeMwgIi5aHl3vRyS3iSZP2w7sBmQJ
	 20RDrYUG+ptYTbdNG+VFJLVR7zHD18h/NqjYE+laY2/8xaCMS3D3RhQ4QdQY8nDvip
	 8yp1zu3ELnF4GsN5M4zXJn0BMb9j4iVvVef3Qt6fYsvBCrHc+igvvy9F+WEbaOOLdD
	 iNV8UCqzZdbbYyyiTgkfErLGaF+cPgEC4wD5dt6ZkdHTrT9lJPJGoP0OJkMBk7T2ID
	 bU6VjFEk6cUDIxLXEYV34wjuFXGiyLeI9Kwzwrb5HycylatuNKt+jYwlbq1koeTDs4
	 jMV1evIH736mw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4]=20libxl:=20Enable=20stubdom=20cdrom=20changing?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722263553595
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Message-Id: <ZqeoAElP7fWJc15s@l14>
References: <20240728210856.310083-1-jandryuk@gmail.com>
In-Reply-To: <20240728210856.310083-1-jandryuk@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9d9836ec55ae402c865cf5993de36484?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240729:md
Date: Mon, 29 Jul 2024 14:32:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sun, Jul 28, 2024 at 05:08:56PM -0400, Jason Andryuk wrote:
> +static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
> +                                             libxl__ev_qmp *qmp,
> +                                             const libxl__json_object *response,
> +                                             int rc)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    int devid;
> +    int fdset;
> +
> +    if (rc) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
> +    fdset = query_fdsets_find_fdset(gc, response, devid);
> +    if (fdset == ERROR_NOTFOUND) {
> +        /* Give the stubdom a little time before trying again. */
> +        rc = libxl__ev_time_register_rel(cis->ao, &cis->retry_timer,
> +                                         cdrom_insert_stubdom_query_fdset,
> +                                         200);
> +        if (rc) goto out;

There's a missing "return;" here.

And looks like it's the only issue,
with that fixed: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

> +    } else if (fdset < 0) {
> +        rc = fdset;
> +        goto out;
> +    }
> +
> +    cis->stubdom_fdset = fdset;
> +
> +    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
> +    cdrom_insert_ejected(egc, &cis->qmp, NULL, rc);
> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}
> +

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

