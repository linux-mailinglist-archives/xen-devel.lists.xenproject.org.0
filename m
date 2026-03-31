Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDwKGIzty2m5MgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:51:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816E36C1FF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269139.1558259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bNA-00006e-Kz; Tue, 31 Mar 2026 15:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269139.1558259; Tue, 31 Mar 2026 15:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bNA-0008Vn-Hy; Tue, 31 Mar 2026 15:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1269139;
 Tue, 31 Mar 2026 15:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ilpo.jarvinen@linux.intel.com>) id 1w7bN9-0008Vh-2c
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bN8-003adj-BC
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:51:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ilpo.jarvinen@linux.intel.com>)
 id 69cbed75-5cb7-0a2a0a5109dd-0a2a4509cfa4-0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:51:17 +0200
Received: from [192.198.163.18] (helo=mgamail.intel.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ilpo.jarvinen@linux.intel.com>)
 id 69cbed72-e484-0a2a45090019-c0c6a31211c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:51:16 +0200
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:51:14 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:50:56 -0700
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
  t=1774972276; x=1806508276;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Nge5zor6zpLsko98SNlgKwkLdBZ67zYKvW4fhw7iRFI=;
  b=jPPVnCRl3+uoiRh+4DgQvV86Ct1cBMK5Eq9riRtLf5ynwETwAs/xPLNS
   vHUtLgsnSno/c58W4rANBoF6O+V4wT3AyTUpwRL9qBeD5ZnURhUWTWCz9
   51IZVfzVR32MjE/vjcZRvU8kYerekzLHWZWMmTkZ0v6GUGzWU2JuTN55w
   GJHySzkENll/g0YKzOQvaV4pHBuhjqEz1WMQVyYgFXPoRXq4QQSt/aBQy
   y0hjhZj01hRlapoRekY6Dg2vbc473HahP8SOy9Qzp5Xk9Jwh51zWuVjB+
   L+WmFoDez6QEQ0B5EcwwiOLpEB1fNC6ZdAuRJTm/mae43oeeSmJtzol4C
   A==;
X-CSE-ConnectionGUID: /MMVSNQJSjSaHGX53JaJGA==
X-CSE-MsgGUID: 37YirV9NRo2yOnErl1Evnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75162631"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75162631"
X-CSE-ConnectionGUID: Erx6h0j4SBaLVonmWZa8AQ==
X-CSE-MsgGUID: i5Ax2DCyQZGon6IlICWnbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230465746"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 18:50:52 +0300 (EEST)
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
In-Reply-To: <f819b7d8-5c80-4463-9afa-933a2ddc8ab3@kernel.org>
Message-ID: <dc11f3fd-a5c7-16e9-8417-6dddb63129fa@linux.intel.com>
References: <20260324005919.2408620-1-dakr@kernel.org> <20260324005919.2408620-7-dakr@kernel.org> <f15629e4-ef8f-b1b6-0158-064f40f111da@linux.intel.com> <f819b7d8-5c80-4463-9afa-933a2ddc8ab3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2141551316-1774972252=:989"
X-purgate-ID: tlsNG-bad1c0/1774972277-628ADA73-D19E4F0F/0/0
X-purgate-type: clean
X-purgate-size: 988
X-Spamd-Result: default: False [-0.19 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86
 @vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1816E36C1FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2141551316-1774972252=:989
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 31 Mar 2026, Danilo Krummrich wrote:

> On 3/31/26 5:02 PM, Ilpo J=C3=A4rvinen wrote:
> > I tried applying this to platform-drivers tree but it failed to compile=
 so=20
> > I ended up dropping the changed.
>=20
> As the cover letter mentions, it sits on top of v7.0-rc5, did you conside=
r this?

I noticed it but I just assumed you were working on top of that, not that=
=20
there's something past -rc1 that is required.

> I can also pick it up via the driver-core tree.

If there's some post -rc1 material this depends, it's probably better that=
=20
way.

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2141551316-1774972252=:989--

