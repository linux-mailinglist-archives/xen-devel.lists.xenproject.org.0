Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1DB77B517
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 11:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583486.913740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTWx-0007SY-9B; Mon, 14 Aug 2023 09:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583486.913740; Mon, 14 Aug 2023 09:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTWx-0007Q0-5i; Mon, 14 Aug 2023 09:06:31 +0000
Received: by outflank-mailman (input) for mailman id 583486;
 Mon, 14 Aug 2023 08:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bJaN=D7=kernel.org=hawk@srs-se1.protection.inumbo.net>)
 id 1qVTDF-0003rl-IJ
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 08:46:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff0f225a-3a7e-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 10:46:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55A6763064;
 Mon, 14 Aug 2023 08:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9824C433C7;
 Mon, 14 Aug 2023 08:45:44 +0000 (UTC)
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
X-Inumbo-ID: ff0f225a-3a7e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692002760;
	bh=B3y8EHsDG3ckVBJqhMu+4wNcutKVET22OPIzB3BHlZ0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=IAwz4csbyfvh6Sc60rY3F4KQBQhcpuI6oJ+2qyYb1X2EbPWPD3nk515LAGsCCsdua
	 /RrfgQ8LZe60yxmHXmLqV2iNhQXTZt2yJNHTUAdt5j2LnL1x91+2f5crAXVuXr7I+M
	 4yclnHX6puLJ4n3dhyx6fFlKoAJrUyCEJEOmcFpwYcb5oz6hDBAECRGUtxHoU2pTIO
	 MFGXP339tDE3ExQFau5AQwyOMqlNhNAVCuVXJbJGJti/5BtYxFL5HOtTmPoxvb3ZI5
	 /6NUgd6v072+ZFgYjyLs9xp0kxcFYsd108Ld5M+KyiFrmZ+S1cmRAt8Vy6EnHsgF6C
	 14tNDLeY82NTw==
Message-ID: <cceef8a4-6f38-bfd4-4f77-5dffa558b287@kernel.org>
Date: Mon, 14 Aug 2023 10:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: hawk@kernel.org, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "ast@kernel.org" <ast@kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "jiawenwu@trustnetic.com" <jiawenwu@trustnetic.com>,
 "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>,
 "yang.lee@linux.alibaba.com" <yang.lee@linux.alibaba.com>,
 "error27@gmail.com" <error27@gmail.com>,
 "linyunsheng@huawei.com" <linyunsheng@huawei.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "longli@microsoft.com" <longli@microsoft.com>,
 "shradhagupta@linux.microsoft.com" <shradhagupta@linux.microsoft.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "michael.chan@broadcom.com" <michael.chan@broadcom.com>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>,
 "salil.mehta@huawei.com" <salil.mehta@huawei.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "nbd@nbd.name" <nbd@nbd.name>, "john@phrozen.org" <john@phrozen.org>,
 "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "Mark-MC.Lee@mediatek.com" <Mark-MC.Lee@mediatek.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "saeedm@nvidia.com" <saeedm@nvidia.com>, "leon@kernel.org"
 <leon@kernel.org>,
 "gerhard@engleder-embedded.com" <gerhard@engleder-embedded.com>,
 "maciej.fijalkowski@intel.com" <maciej.fijalkowski@intel.com>,
 "alexanderduyck@fb.com" <alexanderduyck@fb.com>,
 "wei.fang@nxp.com" <wei.fang@nxp.com>,
 "shenwei.wang@nxp.com" <shenwei.wang@nxp.com>,
 "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 "horatiu.vultur@microchip.com" <horatiu.vultur@microchip.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "simon.horman@corigine.com" <simon.horman@corigine.com>,
 "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
 "aleksander.lobakin@intel.com" <aleksander.lobakin@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "mw@semihalf.com" <mw@semihalf.com>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 Geethasowjanya Akula <gakula@marvell.com>,
 Subbaraya Sundeep Bhatta <sbhatta@marvell.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "kvalo@kernel.org" <kvalo@kernel.org>, "andrii@kernel.org"
 <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "song@kernel.org" <song@kernel.org>,
 "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@google.com"
 <sdf@google.com>, "haoluo@google.com" <haoluo@google.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>
Subject: Re: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
Content-Language: en-US
To: Ratheesh Kannoth <rkannoth@marvell.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
 <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
 <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2023 10.05, Ratheesh Kannoth wrote:
>> From: Johannes Berg <johannes@sipsolutions.net>
>> Subject: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
>>> Please find discussion at
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_l
>>>
>> I'm not the one who's going to apply this, but honestly, I don't think that will
>> work as a commit message for such a change ...
>> Sure, link to it by all means, but also summarize it and make sense of it for
>> the commit message?
> 
> Why do you think it will not work ?. There is a long discussion about pros and cons of different approaches by
> Page pool maintainers in the discussion link.  However I  summarize it here, as commit message, it will
> Lead to some more questions by reviewers.
> 

I agree with Johannes, this commit message is too thin.

It makes sense to give a summary of the discussion, because it show us
(page_pool maintainers) what you concluded for the discussion.

Further more, you also send another patch:
  - "[PATCH net-next] page_pool: Set page pool size"
  - 
https://lore.kernel.org/all/20230809021920.913324-1-rkannoth@marvell.com/

That patch solves the issue for your driver marvell/octeontx2 and I like
than change.

Why did you conclude that PP core should also change?

--Jesper
(p.s. Cc/To list have gotten excessive with 89 recipients)




