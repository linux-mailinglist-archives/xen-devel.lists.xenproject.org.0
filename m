Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF9677B314
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583357.913569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSRT-0001Bb-F0; Mon, 14 Aug 2023 07:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583357.913569; Mon, 14 Aug 2023 07:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSRT-00018q-Bh; Mon, 14 Aug 2023 07:56:47 +0000
Received: by outflank-mailman (input) for mailman id 583357;
 Mon, 14 Aug 2023 07:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WLPj=D7=sipsolutions.net=johannes@srs-se1.protection.inumbo.net>)
 id 1qVSRR-0000tF-4K
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:56:46 +0000
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:242:246e::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b6ec8aa-3a78-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:56:43 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qVSQ8-006VTj-1d; Mon, 14 Aug 2023 09:55:24 +0200
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
X-Inumbo-ID: 1b6ec8aa-3a78-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2P1CtK0EpHYNB0bkUEbNbkfg4BjOcYJ3BMKesAvDyvc=;
	t=1691999803; x=1693209403; b=WKNykBHqv/J0FfY04pWh1bZQ0pnJYL70gG91iyZM4huSCGx
	aVhEeCd3d+yUEUQvhqQ+zEp9jfMhZcX4+kY6EkGuAtKIWJg0G6ufSMcisVY9fXV/kwjPLIbCdOMg+
	ebimUe+Vv3ZT5cbPbVfKpqB+1JOElzS+/Gfy7MJGg68Vj4prjKKHDXnWgLPTPdTy0aMj2oVtwLSrr
	N1arGzClyg0SqnwDYt1t+1ciiM1+LgA/xa86z2VXAnK9PLVikw9ou60+ZruT/LFTQHsQu2d1ntFwy
	VHSAf3nYw4s+yOZwLB5hG0CrvAfp9SoC5QmMEx/g/T4V42Bt22cqxgXzW4X0Ks1Q==;
Message-ID: <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
Subject: Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
From: Johannes Berg <johannes@sipsolutions.net>
To: Ratheesh Kannoth <rkannoth@marvell.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com,  ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com,  jiawenwu@trustnetic.com,
 mengyuanlou@net-swift.com, yang.lee@linux.alibaba.com,  error27@gmail.com,
 linyunsheng@huawei.com, linux-hyperv@vger.kernel.org,  kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
 longli@microsoft.com, shradhagupta@linux.microsoft.com, 
 linux-hwmon@vger.kernel.org, michael.chan@broadcom.com,
 richardcochran@gmail.com,  jdelvare@suse.com, linux@roeck-us.net,
 yisen.zhuang@huawei.com,  salil.mehta@huawei.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 nbd@nbd.name, john@phrozen.org,  sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,  matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,  linux@armlinux.org.uk,
 linux-rdma@vger.kernel.org, saeedm@nvidia.com,  leon@kernel.org,
 gerhard@engleder-embedded.com, maciej.fijalkowski@intel.com, 
 alexanderduyck@fb.com, wei.fang@nxp.com, shenwei.wang@nxp.com, 
 xiaoning.wang@nxp.com, linux-imx@nxp.com, lgirdwood@gmail.com,
 broonie@kernel.org,  jaswinder.singh@linaro.org,
 ilias.apalodimas@linaro.org,  UNGLinuxDriver@microchip.com,
 horatiu.vultur@microchip.com,  linux-omap@vger.kernel.org,
 grygorii.strashko@ti.com, simon.horman@corigine.com, 
 vladimir.oltean@nxp.com, aleksander.lobakin@intel.com, 
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com, 
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, p.zabel@pengutronix.de, 
 thomas.petazzoni@bootlin.com, mw@semihalf.com, sgoutham@marvell.com, 
 gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com, 
 xen-devel@lists.xenproject.org, jgross@suse.com, sstabellini@kernel.org, 
 oleksandr_tyshchenko@epam.com, linux-wireless@vger.kernel.org, 
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, kvalo@kernel.org, 
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev,  kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org
Date: Mon, 14 Aug 2023 09:54:56 +0200
In-Reply-To: <20230814060411.2401817-1-rkannoth@marvell.com>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2023-08-14 at 11:34 +0530, Ratheesh Kannoth wrote:
> Clamp to 32k instead of returning error.
>=20
> Please find discussion at
> https://lore.kernel.org/lkml/
> CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
> namprd18.prod.outlook.com/T/
>=20

I'm not the one who's going to apply this, but honestly, I don't think
that will work as a commit message for such a change ...

Sure, link to it by all means, but also summarize it and make sense of
it for the commit message?

johannes

