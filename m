Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKRJO106r2n7SQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 22:23:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B52419AE
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 22:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249755.1547167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzi4T-0007Cj-Lf; Mon, 09 Mar 2026 21:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249755.1547167; Mon, 09 Mar 2026 21:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzi4T-0007AV-J2; Mon, 09 Mar 2026 21:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1249755;
 Mon, 09 Mar 2026 21:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fXxp=BJ=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vzi4R-0007AH-JZ
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 21:23:23 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3198570e-1bfe-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 22:23:20 +0100 (CET)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629HC5OW3280630
 for <xen-devel@lists.xenproject.org>; Mon, 9 Mar 2026 21:23:18 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb93u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 21:23:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cd8b37d4b2so809163385a.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 14:23:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d02b7e5sm2278544e87.32.2026.03.09.14.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 14:23:15 -0700 (PDT)
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
X-Inumbo-ID: 3198570e-1bfe-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TtfIg1OCm36qvkMhTOZUWOO1
	bZpr9t+AjKAbArsxNiE=; b=eyJPpq3Ig7NxG3aU7DJtqhc3PsNXLt5yKHOlINSp
	78iEyJkx1Kv9HVu6lMkbquLLkhFVRe5VDgVx9MdIMWcWpERBlViQyHeWKFr7V/43
	lAexD7de/jtwjnixjFWElOdRtTAIZNMzoznOULVcEij4or/w85O0w5pOTYqfMFzD
	wgLOlGhGMmOrikUaOuSMbrHYIzoWhjJeHlO1Qrx5j6m2GqcbpZQ1RTGMGok0jfFB
	XGjD8yimz+eA29vgC3DWQ7BPQBxPpoNpuMsj+8cgHe4x9pLY4Yzr1buVqa0zukzA
	m+HUjpVrpT5ki3Gp8XA+FcQIiEHg+NxuCR1N3G0DZTdEOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091397; x=1773696197; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtfIg1OCm36qvkMhTOZUWOO1bZpr9t+AjKAbArsxNiE=;
        b=Fu5t+K5rE51VQhevNF/pDl+e1b245p9mYtwOOKDg4pDjMchNhxs/mGXlzzDQdYd/u4
         qVYBXFiPB7G6NNdCJeyh6h6S2teopPTX1qZJG6SzhVugiuAVho12GaZTIVjbYdjycHZt
         G1sDe8o1+UnAUojGRM9dxUc2wKHDRWavA/yfOfZQU/gNN8q9s7VqW8p0KSqITh7EsDjt
         pysolNK4Vlw+r69ydW7hQCsTg0V4GMftawVmx0PB9TDRSEAJhGxPKOl3kral/vxXDXNM
         iznBtX2hZo3NlltzhR3sF177oht9WEIFvU7i+w7WJYGEUf5Veefh94CzwnSAwbeCw1hM
         ecTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091397; x=1773696197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtfIg1OCm36qvkMhTOZUWOO1bZpr9t+AjKAbArsxNiE=;
        b=bypc/3kpl3kCwpgILOWfvJNlZovkDoA+6J1webwavcZwnR5e2LSSK/dG+HdXOkzHEB
         GewCs4uQyc+wt6zPZAcsXsVjbi0Lvcd1gbaBJTn/E9VExAtuwPXZrDlM582FFxmDwz+I
         7fsGuqIK7r3V3tY2C/54oj5dXKs2KjBH4BtFSQIeG1opGDvQ5Pqn+vj31n4Q3U3bZ+Qc
         g25MQB9x6BhO3lByczRiFpu73H7POoZkRlaR2SxirR/phI1wqVZQKSnf4MSu7X8k64t4
         xQC9qjUnOv8BWgI67nYEZV+HxOVaN/1X7EKbpw2K/fHHabtlukvKHCLsI2606fKoj4tb
         8LfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHsLXux6jrkSVpGcXzFpsLOEhUtHCHDmsyxK67UWgXFAE12dEcZWPaVnu2UZ2rZEp4LFUneYMHThg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX/wxFLfwD1H0Q/AoxjWw8o046mOPUZ9i90p31bAY84HG75/FX
	OTzVXqwxONFdZr5sugYSFPDiUFzLn7KCGFfP9BT8Cpu78SLHDDAYYWPjl4jnqWwVH9c8t0KDD5K
	4SS/nG1r8rqMd3fz1wPDxfoQ7v0fnAukN/CDZNJF5N8nq0NxVchv118QOw5a++KiZQIPTng==
X-Gm-Gg: ATEYQzxznwoTKAtSvFmXDXcNJss4JcRA16mdjn/3Q+0YWiM3xo2+oZ4Kv+ZpkB6gclu
	jANZT/HJl20kPhb/rztZWomYAlduQBDeAjEPm17/VkM1bxJIgxvUVod81I32NDJ4v0vtS+eu0eP
	T9wMvOwNf2JN+sKVa91cMWzoTazQDI1iIfLU1zV41rysTr1DGSXNMq+mV12SCyh9hoxOOkumEd/
	Dzi3ipio9cjFNXG3hn+ZE2eq3iCvKf0u8muiOboNphN0RTIiKHyK65RDVZSI5dJu/63k1rqyc+W
	PeFcfFjaYpM4keDKTYNLnrTtndFjpxWKNBpQxVGtuZDwk/KH8Fbne05DnBxoIX6PpziS9ENSJz6
	Cxbow15sew8QBYh/Ay6JKzTYKW97qwWryjHFEMvC0NeF9PRxVk35BaFyZJI4o1Wb082l+OlExlO
	RS5PHwLYCZD4gd3l2iRvx0qiHJD/VJjF1jv48=
X-Received: by 2002:a05:620a:40c3:b0:8cd:8f18:d1d3 with SMTP id af79cd13be357-8cd8f18d5demr363277185a.58.1773091397432;
        Mon, 09 Mar 2026 14:23:17 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:8cd:8f18:d1d3 with SMTP id af79cd13be357-8cd8f18d5demr363272685a.58.1773091396812;
        Mon, 09 Mar 2026 14:23:16 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:23:14 +0200
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MCBTYWx0ZWRfXzGxDle9W+Rrv
 GhlTY6w5b6yjK6Ym/IAYZdOsdUJPUguMTirY5OzNhUH1+4ilklILotAlzjbtKkd762bLXcuwhS0
 80QgOwcJ5gLmNyp7Lp7ZlViiA5qRRuoHXdFjsj8JDFYbYKtgZLbzugkPz3onXoh5mzxdYVQLTNe
 dbFwzQiHFgaUUsNKIIrKGDl+6EGuFzulWfRi4V1HHK6ZUpZ5axM57uO7SgyJoxYJfQLsoVjkMj5
 1dmJaM9g60xh2Dfe2q2lYt4CFy9NKhhPyx9caSETaQvPTm4JbLNKqJ73pdi3miXivwd7b1TS7b9
 46iN/4VU1yyi1gjS71m4r0L6RVmlMpbNOr8KMmE9dvu0Moh/6QWk90rqIXl3bGDyVJsA/7gf6Ow
 JtRhhkoQMaMe8WacRdcxcBX6AtWCU4sQv/E9fnmkuXxc1IwbTGU+pL0I1vc/+yKsXn3Q1sYUMcT
 yCNGjNOOsf021Lo9ZIA==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af3a46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=eKfNa9SdMFmDU-kgw3kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lBcBBpm6i9hwRRbqvFlToXI4ABktjZdN
X-Proofpoint-GUID: lBcBBpm6i9hwRRbqvFlToXI4ABktjZdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090190
X-Rspamd-Queue-Id: 404B52419AE
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
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,msi_spec.np:url];
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

On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
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
>  drivers/cdx/cdx_msi.c                    |  5 ++-
>  drivers/iommu/of_iommu.c                 |  2 +-
>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
>  drivers/of/irq.c                         |  8 +++-
>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
>  drivers/pci/controller/pcie-apple.c      |  5 ++-
>  drivers/xen/grant-dma-ops.c              |  4 +-
>  include/linux/of.h                       | 12 +++---
>  9 files changed, 76 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> index 63b3544ec997..03232b5ffbca 100644
> --- a/drivers/cdx/cdx_msi.c
> +++ b/drivers/cdx/cdx_msi.c
> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>  			   struct device *dev,
>  			   int nvec, msi_alloc_info_t *info)
>  {
> +	struct of_phandle_args msi_spec = { .np = NULL };

Why do you need to set it? Parse functions ignore passed args, don't
they?

>  	struct cdx_device *cdx_dev = to_cdx_device(dev);
>  	struct device *parent = cdx_dev->cdx->dev;
>  	struct msi_domain_info *msi_info;
> @@ -128,11 +129,13 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>  	int ret;
>  
>  	/* Retrieve device ID from requestor ID using parent device */
> -	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, &msi_spec);
>  	if (ret) {
>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>  		return ret;
>  	}
> +	of_node_put(msi_spec.np);
> +	dev_id = msi_spec.args[0];
>  
>  #ifdef GENERIC_MSI_DOMAIN_OPS
>  	/* Set the device Id to be passed to the GIC-ITS */
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a511ecf21fcd..d255d0f58e8c 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>  	struct of_phandle_args iommu_spec = { .args_count = 1 };

.args_count = 1 should be set by of_map_iommu_id now (and dropped here).

>  	int err;
>  
> -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index b63343a227a9..729fa2f9f758 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -152,6 +152,8 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u32 *dev_id,
>  				phys_addr_t *pa)
>  {
> +	struct device_node *msi_ctrl __free(device_node) = NULL;
> +	struct of_phandle_args msi_spec = { .np = NULL };
>  	struct of_phandle_iterator it;
>  	int ret;
>  
> @@ -178,9 +180,12 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>  		}
>  	}
>  
> -	struct device_node *msi_ctrl __free(device_node) = NULL;
> -
> -	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
> +	ret = of_map_msi_id(dev->of_node, dev->id, &msi_spec);
> +	if (!ret) {
> +		msi_ctrl = msi_spec.np;
> +		*dev_id = msi_spec.args[0];
> +	}
> +	return ret;
>  }
>  
>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 959305a84748..b6e07c5fe715 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2102,36 +2102,37 @@ int of_find_last_cache_level(unsigned int cpu)
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
>   * @map_mask_name: optional property name of the mask to use.
> - * @target: optional pointer to a target device node.
> - * @id_out: optional pointer to receive the translated ID.
> + * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
> + *	set to a target device node to match, or NULL to match any. On
> + *	success, @arg->np will be set to the matched target node (with a
> + *	reference held) and @arg->args[0] will contain the translated ID.

Is this part being actually used (and useful)?

>   *
>   * Given a device ID, look up the appropriate implementation-defined
>   * platform ID and/or the target device which receives transactions on that
> - * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
> - * @id_out may be NULL if only the other is required. If @target points to
> - * a non-NULL device node pointer, only entries targeting that node will be
> - * matched; if it points to a NULL value, it will receive the device node of
> - * the first matching target phandle, with a reference held.
> + * ID, as per the "iommu-map" and "msi-map" bindings. If @arg->np points to
> + * a non-NULL device node, only entries targeting that node will be matched;
> + * if it is NULL, it will receive the device node of the first matching
> + * target phandle, with a reference held.
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_id(const struct device_node *np, u32 id,
>  	       const char *map_name, const char *map_mask_name,
> -	       struct device_node **target, u32 *id_out)
> +	       struct of_phandle_args *arg)
>  {
>  	u32 map_mask, masked_id;
>  	int map_len;
>  	const __be32 *map = NULL;
>  
> -	if (!np || !map_name || (!target && !id_out))
> +	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
>  	map = of_get_property(np, map_name, &map_len);
>  	if (!map) {
> -		if (target)
> +		if (arg->np)
>  			return -ENODEV;
>  		/* Otherwise, no map implies no translation */
> -		*id_out = id;
> +		arg->args[0] = id;
>  		return 0;
>  	}
>  
> @@ -2173,18 +2174,15 @@ int of_map_id(const struct device_node *np, u32 id,
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> -		if (target) {
> -			if (*target)
> -				of_node_put(phandle_node);
> -			else
> -				*target = phandle_node;
> +		if (arg->np)
> +			of_node_put(phandle_node);
> +		else
> +			arg->np = phandle_node;
>  
> -			if (*target != phandle_node)
> -				continue;
> -		}
> +		if (arg->np != phandle_node)
> +			continue;
>  
> -		if (id_out)
> -			*id_out = masked_id - id_base + out_base;
> +		arg->args[0] = masked_id - id_base + out_base;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>  			np, map_name, map_mask, id_base, out_base,

-- 
With best wishes
Dmitry

