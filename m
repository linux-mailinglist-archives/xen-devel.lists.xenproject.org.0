Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIPrEN0mpGkiYwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 12:45:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9F1CF681
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 12:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243841.1543424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwfEd-0004fE-IY; Sun, 01 Mar 2026 11:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243841.1543424; Sun, 01 Mar 2026 11:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwfEd-0004cn-FD; Sun, 01 Mar 2026 11:45:19 +0000
Received: by outflank-mailman (input) for mailman id 1243841;
 Sun, 01 Mar 2026 11:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kch=BB=kernel.org=maz@srs-se1.protection.inumbo.net>)
 id 1vwfEc-0004ch-3h
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 11:45:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d49f44d-1564-11f1-b164-2bf370ae4941;
 Sun, 01 Mar 2026 12:45:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5687343D62;
 Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B912C2BCB2;
 Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <maz@kernel.org>) id 1vwfEW-0000000Evlq-39lc;
 Sun, 01 Mar 2026 11:45:12 +0000
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
X-Inumbo-ID: 1d49f44d-1564-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365515;
	bh=HO8YivHWw2NmKZjyR/AaPuMHAlumMfbukAjMxjZL6Ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pyVYHmTD0THNl+QW/OMlfXylHjgGxR6zOTKcWckHv/fbwcSv/a4MGsrLSPLyTt/9c
	 m1omC4beoBiybHQqt2Onfs+8XhXwJAipyW8ze6mQXR8U8BreiItSVgmAr6NLj/ekkH
	 6fPIA4qi2F20OWSxjPIKmEBjsD8FUWhITpueJbN4ShldBizLAMPh9d4HopLuCX/Yef
	 N5YF+fLvKzeP3QZQyUcqz/8XWY/svr2zap2p4hEns8t0BcDxROrFhSdvL/pcZ6bAYB
	 oMjheTQk2V+OPqyY2/h9Po+cVyjg74hJYXwEfnN2A11MOkZAlxtC/n+7KwEhDK8gt8
	 KVA0jtHMBACAQ==
Date: Sun, 01 Mar 2026 11:45:12 +0000
Message-ID: <86y0kb93jr.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,	Nipun Gupta
 <nipun.gupta@amd.com>,	Nikhil Agarwal <nikhil.agarwal@amd.com>,	Joerg
 Roedel <joro@8bytes.org>,	Will Deacon <will@kernel.org>,	Robin Murphy
 <robin.murphy@arm.com>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Saravana Kannan
 <saravanak@kernel.org>,	Richard Zhu <hongxing.zhu@nxp.com>,	Lucas Stach
 <l.stach@pengutronix.de>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Manivannan Sadhasivam <mani@kernel.org>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,	Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Prakash Gupta
 <prakash.gupta@oss.qualcomm.com>,	Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,	linux-pci@vger.kernel.org,	imx@lists.linux.dev,
	xen-devel@lists.xenproject.org,	linux-arm-msm@vger.kernel.org,	Charan Teja
 Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a struct
In-Reply-To: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
	<20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
	<bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dmitry.baryshkov@oss.qualcomm.com, vijayanand.jitta@oss.qualcomm.com, nipun.gupta@amd.com, nikhil.agarwal@amd.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, lpieralisi@kernel.org, tglx@kernel.org, robh@kernel.org, saravanak@kernel.org, hongxing.zhu@nxp.com, l.stach@pengutronix.de, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, krzk+dt@kernel.org, prakash.gupta@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org, charan.kalla@oss.qualcomm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[maz@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.
 qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AEA9F1CF681
X-Rspamd-Action: no action

On Sun, 01 Mar 2026 10:59:23 +0000,
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > 
> > Change of_map_id() to take a pointer to struct of_phandle_args
> > instead of passing target device node and translated IDs separately.
> > Update all callers accordingly.
> > 
> > Subsequent patch will make use of the args_count field in
> > struct of_phandle_args.
> > 
> > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >  drivers/iommu/of_iommu.c              |  2 +-
> >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> >  drivers/xen/grant-dma-ops.c           |  2 +-
> >  include/linux/of.h                    | 21 +++++++++++++-------
> >  6 files changed, 44 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a0937b7b3c4d..e1d4b37d200d 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  {
> >  	u32 sid, rid = pci_dev_id(pdev);
> >  	struct apple_pcie_port *port;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
> Hmm, I didn't notice this. Parsing functions are expected to ignore
> of_phandle_args before the parsing. So passing .args_count = 1 is
> strange.

It isn't strange. It is a semantic requirement. It explicitly
indicates the boundary of what the driver is prepared to receive, just
like passing a single u32 * is perfectly clear.

Frankly, this patch makes an absolute mess of the current API.

	M.

-- 
Without deviation from the norm, progress is not possible.

