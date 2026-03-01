Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMa1IWwZpGm2XAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:48:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C130F1CF355
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243803.1543394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vweKM-0004aI-3O; Sun, 01 Mar 2026 10:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243803.1543394; Sun, 01 Mar 2026 10:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vweKM-0004Zb-0H; Sun, 01 Mar 2026 10:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1243803;
 Sun, 01 Mar 2026 10:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDVR=BB=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vweKK-0004ZV-Ha
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 10:47:08 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb96339f-155b-11f1-9ccf-f158ae23cfc8;
 Sun, 01 Mar 2026 11:47:04 +0100 (CET)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6214Ea7A3978903
 for <xen-devel@lists.xenproject.org>; Sun, 1 Mar 2026 10:47:02 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshktfyx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 10:47:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb37db8b79so2721104285a.3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 02:47:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bce377sm971860e87.15.2026.03.01.02.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 02:47:00 -0800 (PST)
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
X-Inumbo-ID: fb96339f-155b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zMjjSX07o27ArEy58bafhXTf
	zgI0LtEb8dLPu9QRg6g=; b=YHzedMVvaaQRmITBFe8xlRAGp8P99EssBQY/pKU4
	5F2QJ5TRhTc6aItMbvykuefuUQIazptsv9UE9PHpvwpC1M+e1jXsUT62ohJytu/e
	RldhLQBp18YepRjUSmK6wuw5wmhrPTkxHh0nYq0lBb+4nK4Ztl0J/nvTVcQEhFmQ
	jAhvb//acoWSA3UXKpi1kdahy8aWY8gtcFTmo0MoXVHVDbZtADY+PBM2PDG5mLct
	9m7MkPMdZ843hZ+h40XdTx1WGnDLataaldhWe/qsX5StDb8rU25k1g+v6s9gPp5d
	3cg1+H4J+zKzj/uIE/BAyVD607KfK0kE+a/7LiwBCbbnSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772362022; x=1772966822; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMjjSX07o27ArEy58bafhXTfzgI0LtEb8dLPu9QRg6g=;
        b=XC0G5Ls6bLClgeMflWtxNL0t1rdp+B3JkQc/nvk7JdtNUdV+l/YFgSoeqM4BYOmS4b
         K1jt9Nmkv+2qkcWOBw1LsrZlDU297qBw6QOM74zpUDAMVw3E3xtauI8eOXKst7M8h0Gt
         FkNsR4ehpJtN8D3q9vBkBUvJ0U25XA4aIkwHh6EmbjIrVgkqiyn2Vi3yPQbtByQiejnY
         jcCR/sre5aWJpGnluiipiK7MbcWhJHNZTdcbT9cfqsyx5zpKBLoTuX+fuWYKljgD6oV0
         KvoNxUtPJJxF+1bKNzYNUT/3J8fkFS/Pm/JwtgKncbyILBerk0HKBpLVPvXCXWhW/a8p
         3eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362022; x=1772966822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMjjSX07o27ArEy58bafhXTfzgI0LtEb8dLPu9QRg6g=;
        b=pxy0NIFZ7AGmXMSA+buBr4QZ33+MN7MvDP2a9rjvIpVg9U/CInAK9RTFKnGQ9XDf76
         IOVImUWEG7mR9Rf0SIVNZ5ZaZS/szw2Aat5iWwuPWRqBnZbooyEf4W1t/9w4EGdp01St
         oAbr8MwM9EUxXwzr9D5+ZsYtlU1TAoT9gNseCaZ5TvLWu+LIDytrkEzoPloEAuLStays
         nLf0wBgrt5p1IUhS76DQbOFZ+cKAhEatOip6YnTmyYPQ9B/p/Y7uWRIfWVpvvdHECUdM
         ZAZ4WElXGwWK8SPrKbeCH2URFamu6eXMsEeQpPF785TMVUp3L7lThvMwrwcolholmomL
         KIVw==
X-Forwarded-Encrypted: i=1; AJvYcCVPj4Qrm29M8HceLD3LIzTUu5wA9oteaEDtamFIgrNPOE7XlDMonT88sqtoLQ0SmMbBKC+B8f380Ag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKyfJCFGMrFNxA+vgi718CXP2n6owoGtc+F/VP3t4kULese58d
	/tqoqZO/jFFsy35l7mDGp2ytiPfhbJ8K61qTq8nGv7FELT0c9cBR38xg97R2Q/Lnw9P9iPh5RMn
	OF/FZvHyBk+PXg1d0h6/qjAwBMP69BesE2Xz5iczCWJ5bKWiISrFHLbxT/TEdSfnZ67LaNQ==
X-Gm-Gg: ATEYQzzvD26fScucBUszrHZaUrH0Lri0KKnpUFoEyhPf1w8IohCuvJNmiV9hUT0aZL3
	rcfzRv2SFzPTtkNWl8t15oJCw+QnmP2jBAIODtn3m0YjF3fTJLDklemm1pZgyoKdFP6AfvdpECy
	B7WfldIThWOQgQM56VuSoijZEEurorBY4KLNALfjifKk9VJ0GQFFYpH1ChC5uKQvN8kussE1Hd2
	xw75QPq6HSGoS0Ybo2OhX/Pmh1rb0TdhoUpl2otKincY3hyEY3P0zUWBzNzzDjP+1oDEqHGUVE4
	tKMdbxuJMjbiiG8lUeQ9nmGAjOqVfq8mw03LjQ9HUyRz03KbY3RETyXSF6VEHsGpDCgsWrrxmZf
	Jjr/w0wNh2g6IddeHV4uQ+bBA89kRzWhvEMS7l35DJFkvMSp6NpnB+4/AuypNZCyAFwAnxuu7we
	hbzcvsZzf0RKybkwl2nKVt4ze1vmWqSjGXtcs=
X-Received: by 2002:a05:620a:199c:b0:8cb:50d6:18c3 with SMTP id af79cd13be357-8cbc8d6ef5bmr1217220385a.1.1772362021859;
        Sun, 01 Mar 2026 02:47:01 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8cb:50d6:18c3 with SMTP id af79cd13be357-8cbc8d6ef5bmr1217215585a.1.1772362021320;
        Sun, 01 Mar 2026 02:47:01 -0800 (PST)
Date: Sun, 1 Mar 2026 12:46:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <ehhnta6zvfua723llpb52hh3lwqdh4ttomzt7xqrmcjnsslbop@p4w3gjzxp4rn>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <861pi3amuu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pi3amuu.wl-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5NiBTYWx0ZWRfX79fsq6WkQFxx
 /4CvNQ5ZavR3XP8yY3s7qbK4hDi2JhSeowfHc9Fjw/6Arj1toQM2qX6B+DuJFLLGuZVeyffKlEs
 yIo6v17DnBmkTZxCEKywqlTuTg+pQdyu/yHczRMt4UbSPfx3UIkcqzJ7LDjWU+NfgXqqUqihJLr
 yIwttF1z4bPv9mIReaXdFzbP8Wg+hN/mpRpvhZsGCxZmsvfRTkRW9BE/oDzMjIEEFJrg8ryilIY
 uqnHrfKOq9e+2ZKY84iF4Yp/DcbuGA/W/GZYq90LIKDzENWy8hOqoa603q8uLc5FzAEgpP4OD37
 NkOrGp/FSTg+1sPSQ+5bHHJ+P2dlmbl2W/Gr8sorxlWXivxqzhHF+wWdf1DyqNxxn21RVRt3aQT
 DeNDBiadEYNLxMhiTTi8sP21blSa/ZrRgIMD5pg3tz0jAInRT7XCqez9GjQn0FPJYKBAPnHVY2e
 fVIwIHvCr9wflRFIG8A==
X-Proofpoint-ORIG-GUID: HDdCV8scuzg9j5vqD-yrLcITck0T3K2n
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a41926 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=YG64nluAAAAA:20
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Pq9JgrngHnaR5_AiyuMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: HDdCV8scuzg9j5vqD-yrLcITck0T3K2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,17d90000:email,1.111.188.160:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.228.225.192:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C130F1CF355
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 10:02:49AM +0000, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 08:34:20 +0000,
> Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> > 
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
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index a511ecf21fcd..d255d0f58e8c 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> >  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >  	int err;
> >  
> > -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> > +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 57420806c1a2..6c3628255908 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2102,8 +2102,11 @@ int of_find_last_cache_level(unsigned int cpu)
> >   * @id: device ID to map.
> >   * @map_name: property name of the map to use.
> >   * @map_mask_name: optional property name of the mask to use.
> > - * @target: optional pointer to a target device node.
> > - * @id_out: optional pointer to receive the translated ID.
> > + * @arg: of_phandle_args structure,
> > + *	which includes:
> > + *	np: pointer to the target device node
> > + *	args_count: number of arguments
> 
> Number of arguments *to what*? Isn't that the size of args[] instead?

It is a number of values corresponding to the phandle in the DT
property. It might be not obvious here for iommu-maps, but the struct is
idiomatic in OF world. Let me quote a (trimmed) example from
qcom/sm8650.dtsi (for a different property, but it explains the meaning
of the values here):

gem_noc: interconnect@24100000 {
	#interconnect-cells = <2>;
};

epss_l3: interconnect@17d90000 {
	#interconnect-cells = <1>;
};

interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
		 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
		<&epss_l3 MASTER_EPSS_L3_APPS
		 &epss_l3 SLAVE_EPSS_L3_SHARED>;
/* I skipped the second pair, it adds nothing here */

Here the parsing function for this property (of_icc_get_by_index()) will
call of_parse_phandle_with_args() 4 times and it expects to return the
following values in the of_phandle_args:

1. { .np = gem_noc, .args_count = 2, .args = [MASTER_APPSS_PROC,
                                              QCOM_ICC_TAG_ACTIVE_ONLY] }
2. { .np = gem_noc, .args_count = 2, .args = [SLAVE_LLCC,
                                              QCOM_ICC_TAG_ACTIVE_ONLY] }
3. { .np = epss_l3, .args_count = 1, .args = [MASTER_EPSS_L3_APPS] }
4. { .np = epss_l3, .args_count = 1, .args = [SLAVE_EPSS_L3_SHARED] }

The whole of_phandle_args is then typically passed to the corresponding
xlate function, specific to the paricular .np ('provider'), which will
use #args_count values from the #args array to return the object from
the provider.

Now let's see iommu-maps (again, qcom/sm8650.dtsi):

apps_smmu: iommu@15000000 {
	#iommu-cells = <2>;
};

iommu-map = <0     &apps_smmu 0x1400 0x1>,
	    <0x100 &apps_smmu 0x1401 0x1>;

The property matches current definition at [1], however this spec
doesn't match the DT practice. It forces that the property should use 1
cell for identifying the "object" in the IOMMU provider, even if the
provider expects to use 2 cells (two args).

The correct property should look like:

iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
	    <0x100 &apps_smmu 0x1401 0x0 0x1>;

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-iommu.yaml

> 
> > + *	args[]: array to receive the translated ID(s).
> >   *
> >   * Given a device ID, look up the appropriate implementation-defined
> >   * platform ID and/or the target device which receives transactions on that
> > @@ -2117,21 +2120,21 @@ int of_find_last_cache_level(unsigned int cpu)
> >   */
> >  int of_map_id(const struct device_node *np, u32 id,
> >  	       const char *map_name, const char *map_mask_name,
> > -	       struct device_node **target, u32 *id_out)
> > +	       struct of_phandle_args *arg)
> >  {
> >  	u32 map_mask, masked_id;
> >  	int map_len;
> >  	const __be32 *map = NULL;
> >  
> > -	if (!np || !map_name || (!target && !id_out))
> > +	if (!np || !map_name || !arg)
> >  		return -EINVAL;
> >  
> >  	map = of_get_property(np, map_name, &map_len);
> >  	if (!map) {
> > -		if (target)
> > +		if (arg->np)
> >  			return -ENODEV;
> >  		/* Otherwise, no map implies no translation */
> > -		*id_out = id;
> > +		arg->args[0] = id;
> 
> What if args_count is 0? Given that you place no restriction on the
> way this can be called, that'd be entirely legitimate, and you'd
> corrupt something you're not supposed to touch.

args is an array (not a pointer) in of_phandle_args. As such we know
that args[0] is legit.

> 
> >  		return 0;
> >  	}
> >  
> > @@ -2173,18 +2176,15 @@ int of_map_id(const struct device_node *np, u32 id,
> >  		if (!phandle_node)
> >  			return -ENODEV;
> >  
> > -		if (target) {
> > -			if (*target)
> > -				of_node_put(phandle_node);
> > -			else
> > -				*target = phandle_node;
> > +		if (arg->np)
> > +			of_node_put(phandle_node);
> > +		else
> > +			arg->np = phandle_node;
> >  
> > -			if (*target != phandle_node)
> > -				continue;
> > -		}
> > +		if (arg->np != phandle_node)
> > +			continue;
> >  
> > -		if (id_out)
> > -			*id_out = masked_id - id_base + out_base;
> > +		arg->args[0] = masked_id - id_base + out_base;
> >  
> >  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> >  			np, map_name, map_mask, id_base, out_base,
> > @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
> >  	}
> >  
> >  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> > -		id, target && *target ? *target : NULL);
> > +		id, arg->np ? arg->np : NULL);
> >  
> >  	/* Bypasses translation */
> > -	if (id_out)
> > -		*id_out = id;
> > +	arg->args[0] = id;
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(of_map_id);
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index bff8289f804a..74fc603b3f84 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >  {
> >  	struct device *dev = imx_pcie->pci->dev;
> >  	struct device_node *target;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >  	u32 sid_i, sid_m;
> >  	int err_i, err_m;
> >  	u32 sid = 0;
> >  
> >  	target = NULL;
> > -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> > +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> > +	if (!err_i) {
> > +		target = iommu_spec.np;
> > +		sid_i = iommu_spec.args[0];
> > +	}
> > +
> >  	if (target) {
> >  		of_node_put(target);
> >  	} else {
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a0937b7b3c4d..e1d4b37d200d 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  {
> >  	u32 sid, rid = pci_dev_id(pdev);
> >  	struct apple_pcie_port *port;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >  	int idx, err;
> >  
> >  	port = apple_pcie_get_port(pdev);
> > @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
> >  		pci_name(pdev->bus->self), port->idx);
> >  
> > -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> > +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
> >  	if (err)
> >  		return err;
> >  
> > +	sid = iommu_spec.args[0];
> 
> I find this stuff absolutely unreadable. You're fishing the SID in a
> random position of a random structure, without any documentation of
> how this is supposed to work. This really needs a wrapper that hides
> this implementation detail.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

-- 
With best wishes
Dmitry

