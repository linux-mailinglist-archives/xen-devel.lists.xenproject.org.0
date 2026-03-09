Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLuGJt04r2kPQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 22:17:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A56241859
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 22:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249741.1547158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzhyE-0005Ys-Tj; Mon, 09 Mar 2026 21:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249741.1547158; Mon, 09 Mar 2026 21:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzhyE-0005W9-Qz; Mon, 09 Mar 2026 21:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1249741;
 Mon, 09 Mar 2026 21:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fXxp=BJ=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vzhyD-0005W3-55
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 21:16:57 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bdf1f80-1bfd-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 22:16:54 +0100 (CET)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629HBqeH3148233
 for <xen-devel@lists.xenproject.org>; Mon, 9 Mar 2026 21:16:53 GMT
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ua53a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 21:16:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50900e9803aso189295131cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 14:16:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d01cbfasm2323612e87.14.2026.03.09.14.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 14:16:50 -0700 (PDT)
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
X-Inumbo-ID: 4bdf1f80-1bfd-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KLgWRaioXqeIrwHgYBcxPqE/
	kg4Fe+2f2o7A+PfgTZw=; b=eYrTi12bsFRg+Ep63Gvyrpkz6qz+XZZnxJnhHzZ8
	Afqkljn6AGFqwUNG6Hi9uCb6ZzQda58iRJHt3K5YZu6fE5lb/rlDs3LPJDnuIy9X
	R2Y9ER606cwX+ZHgCY8VFLE+xAxUWo2O4Thd+KKh+iYlFQhrYQ0g6GO+JQptJ4KE
	6f0gsKaivSPOXL1lrK/xqQc3elp326ygArdomugL7e78pyCIveo8V0I+Gp/yH752
	qn3L1fJOi+1y8gGG02UGdrOgFKCLS1JmoihvFsIZX4/Br1ShuSsjy4BmL2Iv75+1
	0Iz/BPpRhzYykPy9UUlKCrzFisiTC2PnI1DfQMHXc4YBKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091012; x=1773695812; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=;
        b=YBvG900VLbelKbArd2GrhU0/17rMOvtDrX/WHXT+YfYcMkAZW+XhglRT5ktWEhWYwY
         JMjJ+Mb1dbwkXOhqoPBshKs0PnkG52diMl8JjkxfitfU9Hr43mOI2dvwlZRkkM+aFu9B
         rIDOJssm+n0+aHq92wlA0+t5aSH4zoXYPrmOtsRb8lM5HG+PQPvgrucWhs4NeCVCIpgU
         x/XLuXAapoXqci92TZSnaYLNz6fSoA2/BnHG20IbjYQ0IGWW1YwM+/piVD6NTA82nE6x
         mKQgq6Yeazysl5VEA6YmopTX6kW+OTM60SV3IwnS2AHmTNLZsV8UrvYfkdjmZgfcUDGi
         RgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091012; x=1773695812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=;
        b=dPL4bAG/xRBEtC/h0NUmBR6+Q7l9IqP31M5bjcez0Dy2IWAatn+GvgbFt+C7EYUKsC
         g/kzTXA2pol3M7VfAiiKqYJjpNWR+ZysdIniktnf27XoJq5SMcgVaFv/AIxBGtAFUBuX
         r1lV8cqcLupLRPxnHgNAZOyOduWezB3j6pLhpmRJO9ADbpouUY0dbQNpY5gzAVJbTDWn
         pZY4azpg5yXk6u0yzsEK6oO5svxnYgwu2/JB6KQwLBXW99r1/upooYqOjajckoi1pBHg
         dRJwb3Le1ZICfth/G0kf7zTib+oqnaWXBV/cS78i6HII/OmAPXNp9/csAuZ8zsetcMHm
         ghxw==
X-Forwarded-Encrypted: i=1; AJvYcCVq1TQ6LHT8G9i5mVvOFxqmLNwD46LzfViKyT4F0R0+GS5gtoDKdB3DCi7VLOqFnWww3XcsojgjhFE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5aSug+lK9v9QBZM4zuHIQBhcqcYSzdyDzOXq6GAmYL8b/CLXL
	ghE7b/dX5Nb5GRvKdVjB0p0eKP873qWzE1YSZKp1+/ZSijO3usRL0pleKE/XkGnzPMDzzOUfYLg
	BeQsF5PHbw+mm8XG+A0iQ0V9RHWDEhCtK/DHHGBzY55YyKBbQRTa9pmRFVJPr+THFaKwRmA==
X-Gm-Gg: ATEYQzw27STEevhm7AmigV3VEMplRitjyQ4Sp4fcwPXkMu62CuIgPatQ6Ljn7/uhXM/
	/grkk/kyhg4+A+haZQFeJptVg3+eDyRDIGAGUfC90NH6NB26uQ3Nmg36pG0nm+/+fKJVsClvQDs
	iRHScba/MTxPpKYLxlzJ1MhkVr9KoBf8RRZy/yVx2waep4IUi2YLoo3dGCId7DYNZzKRHjAfQdy
	GgtViDSyoI6H0llnwaT8LddR9N3FOZKsUIwKMS6FeRLpodYPX4nRYDpQLRcQaJuZFSPZGID2rmb
	VOqgHu8hyQz3NeWpCHSvZqBzV2oGRJuBidRMYYetKpBj+S5zp4ok/mV/8dfCzfkVnmZG3RHz+wj
	Zx+9JJ0GsPOf6oML4II+VF53m6bv9Ekfz6KeZ6HASI4yrI9rx5kMyTLoyHhKHJAJIQZBj2W2PeV
	SDzim1P+vlC1qx1hfBY/EjTMewtDyFvnf9O5c=
X-Received: by 2002:a05:620a:2946:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cd6d4b5029mr1566977985a.78.1773091012403;
        Mon, 09 Mar 2026 14:16:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2946:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cd6d4b5029mr1566971885a.78.1773091011890;
        Mon, 09 Mar 2026 14:16:51 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:16:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
X-Proofpoint-GUID: 6_yulVzokgJlJ8zTfldfI44zalv2-rYd
X-Proofpoint-ORIG-GUID: 6_yulVzokgJlJ8zTfldfI44zalv2-rYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4OCBTYWx0ZWRfX3SHK2/4Bi9kJ
 4bwyS2EYRgSOUVzpxGYs8exPK3Af9EvVolSyAH1Cs8dKATw1Gtc0TVPqwLIMrBMGTMnoMtAUloI
 hHb63vl2cj76QeEYeoZ6E7pGssO0xFdrsBhktFtFI0HCkKZBi7A1bGhZaVyNo0tEuivxPXnt+Gd
 tJiclvW2M9kHP3aO2X8kEiVVVJjgmnihUcFv0N4r/EatkL/saB5kH2a93ww6vnxpNh5Qs1Txqvk
 buRKZTyyR/l65Skv7BUfSCBhaDDCuCna2pfKgu62sDTgdgyaMGxbZam6ysHzglM4smUlW+qqANW
 2jq9xGOjkilsOl16Y1euSJfsX7rVOERXCZk4DloZ8J0z99LGwz0kwMobkTZM8FxCXXQHrMc0QCZ
 74xeEPu2unMUqPHMCIZoVRv8Uq0gE11O6nA8oy+xA3iMecWEnukCiqqjEeSNDCmk4aUnIZcu5g3
 IO5xJFO6aNAPx2KIntg==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af38c5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=5ndfpk7zZlG9lj9R3R4A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090188
X-Rspamd-Queue-Id: 01A56241859
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s
 :lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,nxp.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:03:37AM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> properties, give them some wrappers to conveniently encapsulate the
> appropriate sets of property names. This will also make it easier to
> then change of_map_id() to correctly account for specifier cells.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/cdx/cdx_msi.c                    |  3 +--
>  drivers/iommu/of_iommu.c                 |  4 +---
>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>  drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
>  drivers/of/irq.c                         |  3 +--
>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>  drivers/pci/controller/pcie-apple.c      |  3 +--
>  drivers/xen/grant-dma-ops.c              |  3 +--
>  include/linux/of.h                       | 18 ++++++++++++++++
>  9 files changed, 62 insertions(+), 16 deletions(-)
> 
> +
> +/**
> + * of_map_msi_id - Translate an ID using "msi-map" bindings.

Which ID are we talking about wrt. MSI interrupts?

> + * @np: root complex device node.
> + * @id: device ID to map.
> + * @target: optional pointer to a target device node.
> + * @id_out: optional pointer to receive the translated ID.
> + *
> + * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + *
> + * Return: 0 on success or a standard error code on failure.
> + */
> +int of_map_msi_id(const struct device_node *np, u32 id,
> +		  struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
> +}
> +EXPORT_SYMBOL_GPL(of_map_msi_id);

-- 
With best wishes
Dmitry

