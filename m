Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFa8ASkcpGnSXQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:59:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602941CF3E8
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243818.1543404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vweWM-0006Op-9V; Sun, 01 Mar 2026 10:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243818.1543404; Sun, 01 Mar 2026 10:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vweWM-0006Mj-6W; Sun, 01 Mar 2026 10:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1243818;
 Sun, 01 Mar 2026 10:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDVR=BB=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vweWK-0006Md-TX
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 10:59:32 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b83a6768-155d-11f1-9ccf-f158ae23cfc8;
 Sun, 01 Mar 2026 11:59:30 +0100 (CET)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6216rYmt2276909
 for <xen-devel@lists.xenproject.org>; Sun, 1 Mar 2026 10:59:28 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6jhex-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 10:59:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb403842b6so3546395085a.1
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 02:59:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a116de019esm872280e87.3.2026.03.01.02.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 02:59:26 -0800 (PST)
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
X-Inumbo-ID: b83a6768-155d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tWvbzoSirp2+/mfj208EVtuC
	kSsURTVI0XL++QIzXe8=; b=ZbRtpKNVrLZlATBeln8U+o1HVMJ1NJFODQD2g1Xt
	5zqmD26FEi7oT89X6dB/3Kf0XkkF6A8sXLJiy6k2cdCfTElYXz+CjMK5FIy3AQPe
	xpwFsAEbry2aIJz+ovYfTdhNnokCCupYZNrBBmfiE6N5iXxEnaecxqJfkBq7jA6g
	atxv+7P2SKJ+CThu9PnqyE+e14r5zyxB6+fChJWyb7bmsbhO1nbIl9sdXtyQ92aF
	9NNtP7wU75FlG/y0oxLuqIE1sXvncry7ovuFrwD64sbYiUvq0bz1X2QeTCCuTyIj
	PQrXowySKFMO/mebdHFA3zvBB6060oQ2+M3ZZuPrtLkY+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772362768; x=1772967568; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=Qg0SasUz6gZf4s5euvPZwSPcATKKIMaNscPyHYwyWkBXUO4DNtvlrBqdbtygHVc1yP
         zLcAnypjfrHTgWInQYPh9LlMWGAjdq5PTAt7FRTJ51G6M0DWrb7Vl1ilTs7bfBl4TdsF
         Us3WgFRfHh6fxTwlvlfr2Bgm19Q+SVHrXduE5khIkNr/JSOvrdWt08m00jFjTkiw9Tqz
         seTpcR3ZYBMObNMap8E6xDjywP6pfopQEkDHxgB+l2aI4ZiAu+HIhJfHlR3BmjmnNrAW
         IcFU79RXY7XKzOICTqP6H12YCRYDYwvdjHYZdjnOtwOzHl/rykbTqRyiAA1zbtcU3/kP
         QFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362768; x=1772967568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=FP8eV5TnvZrtFGlu8ZvS+qFFsKSzM7COXkzqNzj6Mpr3HzyTEVy30eH/idv+WCUW1a
         X2jDzOif8P+tkQxFQYUV+oK6GYc5gOq5fkcWzFhvG8W1nJS0ZeBLJi7SpuBsSih3euY1
         4+dfxPnzI41uacGulN24RIhmL4zOmmY6ZfziIu9nr/lxcKCH3P3WjqMR0lg2U2cCxpFO
         AI6x2fXBOwN1O2QCT1a1muEb60ftET47trYp7A+Yaz1HiOdpt1iUZVlXH289lp6PRWTV
         fU8s/i113kjKJN6QXDsItWvoikwGk7taFA0MFg7oSOxgDkYZ0Za+KKdJOMPJybxscM9r
         9enQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm/N++qBxd20APkQhMJR3vDnRbr53Yj2D8pph6aQsBB9f2xOhTZkmJ53eDGdgLHyqA5i9Uz4X3yGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvRWBXh/qbu//ZjtFR6U8fpx3FhAOifKnoauouDEDLljSRfa7b
	MbeLhAVj2zrSIWh4/odlAjkAzVHx9R0gGpDFRLTfhOT4NyNbcG9cC7fcB/8DnhPqlQ6yfHwyiKY
	yoOM7ml6kOkh8XMtT9xgjLhJX975IwAjsKm/BDe0PP2SkANMC9Azy5to/5B79yoPPPkZTWA==
X-Gm-Gg: ATEYQzxTSUdWTcLCfZg5/J1E/332WlDUIr4Hx5r1lmA2aZv456f6b9OewVMwXgy7dCq
	XP5Q13umuR2MMMYr3YOQ5phGzOpWhBq7Ww3QOmFxuiwLfYLv/zhE6eq1uGbwGFFkNqVVYkSS7Ix
	mZPLrxUAb/8P8b79UHbinaHIt8EuQXgrXEGZFezQja/H8+PI9ZWHnuKdK4ExNW/xw3f4+j49gFF
	XfX6A9VfTQnVyizRw7zwlW7KVUyMLQ+EUzfjnQ22ficO4tRQxNBNBs+Uf9dk++eeZ4KRSiMxX8J
	FjuuVdhrUP43dgKhsfThqL2vhA6GkdqyOjlXAshrEhUBn8XvIJ8fbVh0pJSz1THUzFoqvSesNMA
	aDdxNUY4IXms0+75F/M1VkFiSjGFTDtthGMD9SqDxQp7N/iyYkcabDtOBKj+mCoWi8/yp84B4Su
	PPHKA1Qgpns1+i2MuPFy7+eSTT7tJM/tCW0hI=
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090398185a.16.1772362767988;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090393285a.16.1772362767407;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
Date: Sun, 1 Mar 2026 12:59:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AqYHgkeaIFy1I0tZBoVWJRpFOlKOp3bZ
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a41c10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Dq95N7oyZucg39lo86YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5OSBTYWx0ZWRfX1CMnxWNYOxdD
 61g6NC0A7ONFCP2KoLCXBasSdyGsWn2PEmAClqHws9s6HMAWfsMIxkduQW9XJeBoR5CkEOnmdEN
 G5Nresuh53mjd6vOAmUOWaJ3WUk6ugqUSESgZCPVzHApp7Bnzx85A2T7HU5VUf6RI5kFL/jkXn6
 Zw5bmr/Kxoen1EHiaGi3lrFGKB8uI/rDWyF5Rbwom3jx8BOsp8OuUxAf/KnoLurB+kLBUyq31x8
 uvL2igXJ5M/ZMYJN/ZgjcOROiXQddg4adFPi9uHzEb+JxgR0mN2O4v9CfpPB/e6oqAr4ttx0mI1
 WqDDUIJraNU3tdJBlWj3nysErGN9e1WgDrb9vEpvbxzC/I1Lw5XjvxfLhPkiB3C1I8iinT5tTyy
 mR7Gt1tZf0TI3VyC0q2tCLtbzeUN+yzmM+rFlUbNQXfi4zWHdusdZQmNjLxt7+wzvUqdFnp83+y
 Q6FkkJzV47vT8jFEMMw==
X-Proofpoint-GUID: AqYHgkeaIFy1I0tZBoVWJRpFOlKOp3bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010099
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
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 602941CF3E8
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };

Hmm, I didn't notice this. Parsing functions are expected to ignore
of_phandle_args before the parsing. So passing .args_count = 1 is
strange.

>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);

-- 
With best wishes
Dmitry

