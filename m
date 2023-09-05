Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8817921B9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595533.929130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSoX-00025p-FS; Tue, 05 Sep 2023 09:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595533.929130; Tue, 05 Sep 2023 09:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdSoX-00023C-CX; Tue, 05 Sep 2023 09:57:41 +0000
Received: by outflank-mailman (input) for mailman id 595533;
 Tue, 05 Sep 2023 09:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/I5=EV=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1qdSoW-000236-AW
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:57:40 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a51fd4af-4bd2-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 11:57:38 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50091b91a83so3823361e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 02:57:38 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b0031435731dfasm16913703wrp.35.2023.09.05.02.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 02:57:37 -0700 (PDT)
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
X-Inumbo-ID: a51fd4af-4bd2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693907857; x=1694512657; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AKHR62ul+UyAMBBLZNZLoFrH8efwjpri67YRyIEqGb8=;
        b=PwDCoPUBD/4seHd+G+LNsZyILf/+Wh3VMPoxn9OO0gwdkwvl++0/jv/qNVmLDnLV3j
         96ttU+WHrckOEkRkvAidkIuwN5qo5C0+7L4TdhPmGqatpKvmJgQYPnzts7MYqAPDL+dM
         xxX6HlZteN0VGhVzJUI18X1IUVFjUkiW6TeOAZCbbPct1VCVm97F6+s2mGaPx/iBJ1Xz
         ylvufRK7a+xVVmeEv3qeVE8c5lRHm4MOnyYhAcTEEwzQwtu3GV3uPpqQ3SxhktwbnMIW
         qE3KO+qrJponKACU4DLzOAPZxRz0CBqNct5+BNAysJSE/awNSe5EAa8H6lKLAdrZ578u
         KPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693907857; x=1694512657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKHR62ul+UyAMBBLZNZLoFrH8efwjpri67YRyIEqGb8=;
        b=hmHACXvDUhNo3BVeg18pLEqJPjOzMcXEhU+g/Kv4he/uepdRoy3FgwNuaVUKmBvfMY
         ugfCQ5zgX/RHCy2F9d4FM/NT00MUlzm4efmDaWuNFdvu2y8eIqxb15yZzL9qf1bJPgll
         Iw7ktw4+TAmwoDAZ1s5cvzBuhqKFMHw1znV9o0QnbOn82qpMZsW7EZjkTo2Lhtdd8R+H
         /Ub8mqMO0wJw8yKr/pcSz1k1MadeY2Sh6clJ3qYvjQe2HNuc9I3FagqRY8PvCiPfAm0F
         C/7+ftc1xYIHh3c+EIeNydL2sQlf6jiBF5nQzfex/BNztPU6gRF2i/9VGil8VTUlUU2E
         AZNw==
X-Gm-Message-State: AOJu0YwfJFJujhfef4rLVbxq7Ee1eHtZlJ6vRV45BzouMUzMZ+sdegJb
	2FmtJ5vTK6Lc/CxPVsf6I6/hPQ==
X-Google-Smtp-Source: AGHT+IF/Krv9XoaHXmgTX6hA95PT3mrsyeECELy7hFWygISVfjLi7nO3m0A/foR0u3zSojYLTMDlFA==
X-Received: by 2002:a19:8c09:0:b0:500:9d6c:913e with SMTP id o9-20020a198c09000000b005009d6c913emr7472258lfd.52.1693907857446;
        Tue, 05 Sep 2023 02:57:37 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:57:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, ast@kernel.org, daniel@iogearbox.net,
	hawk@kernel.org, john.fastabend@gmail.com, jiawenwu@trustnetic.com,
	mengyuanlou@net-swift.com, yang.lee@linux.alibaba.com,
	error27@gmail.com, linyunsheng@huawei.com,
	linux-hyperv@vger.kernel.org, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, shradhagupta@linux.microsoft.com,
	linux-hwmon@vger.kernel.org, michael.chan@broadcom.com,
	richardcochran@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
	yisen.zhuang@huawei.com, salil.mehta@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
	linux-rdma@vger.kernel.org, saeedm@nvidia.com, leon@kernel.org,
	gerhard@engleder-embedded.com, maciej.fijalkowski@intel.com,
	alexanderduyck@fb.com, wei.fang@nxp.com, shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com, linux-imx@nxp.com, lgirdwood@gmail.com,
	broonie@kernel.org, jaswinder.singh@linaro.org,
	ilias.apalodimas@linaro.org, UNGLinuxDriver@microchip.com,
	horatiu.vultur@microchip.com, linux-omap@vger.kernel.org,
	grygorii.strashko@ti.com, simon.horman@corigine.com,
	vladimir.oltean@nxp.com, aleksander.lobakin@intel.com,
	linux-stm32@st-md-mailman.stormreply.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com, p.zabel@pengutronix.de,
	thomas.petazzoni@bootlin.com, mw@semihalf.com, sgoutham@marvell.com,
	gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com,
	xen-devel@lists.xenproject.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	linux-wireless@vger.kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, kvalo@kernel.org, andrii@kernel.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org
Subject: Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
Message-ID: <75bcd331-9a62-486f-a15f-6aebf4d1838b@kadam.mountain>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814060411.2401817-1-rkannoth@marvell.com>

On Mon, Aug 14, 2023 at 11:34:11AM +0530, Ratheesh Kannoth wrote:
> Clamp to 32k instead of returning error.

What is the motivation here?  What is the real world impact for the
users?

> 
> Please find discussion at
> https://lore.kernel.org/lkml/
> CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
> namprd18.prod.outlook.com/T/

Please don't break the URL up like this.  I think normally we would just
write up a normal commit message and use the Link: tag.

Fixes: ff7d6b27f894 ("page_pool: refurbish version of page_pool code")
Link: https://lore.kernel.org/lkml/CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.namprd18.prod.outlook.com/
Signed-off-by:

> @@ -171,9 +171,10 @@ static int page_pool_init(struct page_pool *pool,
>  	if (pool->p.pool_size)
>  		ring_qsize = pool->p.pool_size;
>  
> -	/* Sanity limit mem that can be pinned down */
> +	/* Cap queue size to 32k */
>  	if (ring_qsize > 32768)
> -		return -E2BIG;
> +		ring_qsize = 32768;
> +
>  
>  	/* DMA direction is either DMA_FROM_DEVICE or DMA_BIDIRECTIONAL.

Don't introduce a blank line here.  Checkpatch will complain if you
have to blank lines in a row.  It won't complain about the patch but it
will complain if you apply the patch and then re-run checkpatch -f on
the file.  (I didn't test this but it's wrong either way. :P).

regards,
dan carpenter


