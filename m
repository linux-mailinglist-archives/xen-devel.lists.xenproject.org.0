Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCmWOJkqpGkgZgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 13:01:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5E1CF7DB
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 13:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243856.1543433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwfTU-0007ZY-R4; Sun, 01 Mar 2026 12:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243856.1543433; Sun, 01 Mar 2026 12:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwfTU-0007XM-OK; Sun, 01 Mar 2026 12:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1243856;
 Sun, 01 Mar 2026 12:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDVR=BB=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vwfTT-0007XG-7j
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 12:00:39 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 422a1042-1566-11f1-b164-2bf370ae4941;
 Sun, 01 Mar 2026 13:00:37 +0100 (CET)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61SMU8QJ3616510
 for <xen-devel@lists.xenproject.org>; Sun, 1 Mar 2026 12:00:36 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg72jh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 12:00:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70fadd9a3so4001143285a.0
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 04:00:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bd5a66sm1006367e87.34.2026.03.01.04.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 04:00:32 -0800 (PST)
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
X-Inumbo-ID: 422a1042-1566-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CHM6ea+T/SQTyKD6VE8gREYx
	tQS0AV0BBIY+fO3U/+Q=; b=WoP5ZbKpVdVKlkXv2aH+KEPi03kUWMTYBCJXM+o0
	bueM9nMs/bFFYl420otJKZY2dXshgOWxzxAFKqgZHYZv9Y+wfE00JUx9gc9JCh6y
	V+d7SqShjxe+e3A4/hPi/TSmO2SHHa3u4E4bpGSwPJrOw7mX9mMBDw/bmCKTBp/I
	txGW5FF5wCHDF770OacBskjkh+vvedtPD21saeukgigmMIxit4IgxQAnS+fsvhPs
	F+p68LXBy/X93NlrWUCnmXUMXNp8Iordm9wjkO/Ua6JnTSz5zG0EFCHsrsYlGufg
	Kw00/KOKaJQnpLM74TWrU6XkLJxwFn1k/m3ivgU4SjGccA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772366435; x=1772971235; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHM6ea+T/SQTyKD6VE8gREYxtQS0AV0BBIY+fO3U/+Q=;
        b=cgSJQYr+k+82bgGdMF4UCkz/hzNtYGcDGaQfve4Sm8O10z8Gjh3uwEoRJeoYv6Mc4h
         TK5HMYUDhj6ckhnS3JXeHdYt4UZC64ulhogI6vMTOyqJybZGfErNficnd2Nxcx3lefJX
         xG1JKJXrBGe0X9l0/JfE6wLdOkwXbNqMVgI4bv2ad7e3TtY04iWnpiDj3htwxJw63kc7
         8ryKYYcbKd64Q4+g0p5yicLwiljE2hA8nO0+YFuP0PnQbiNbmrVTx2ayCVQp5FSu0viJ
         ub9bKCRdOX9LkHE9oAOFblbSXtc3OjUQ5Zm7PCsPF/bN92tSzh9S3Rrj8G2reYHqviUj
         0LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772366435; x=1772971235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHM6ea+T/SQTyKD6VE8gREYxtQS0AV0BBIY+fO3U/+Q=;
        b=c5bATWlC4xWj+0PwUTnR8QrsHO6y+24L1m4F0SRs5fKxytx8cSF/ZM46nTACxReQ9N
         PmbdskkDWm863T+qVOcsBAsCWNFKGPoAPjNZajdiUV/k3huxN2nA9xoqAsAtIGudbLSc
         j9Inmad4fB4fAw1bI/Plnb7vuIRL2Ct9VpLjkReTNxBJToER52xxUWT2RwvHOXbDNwX9
         FPxcCLHOKnn/wev0ukkYrjELetCzz/Xhms3DWpWk2O+NWzOhdoxuBULWNEZdAe9apu8f
         7pZPY5ACLqDyVJpmXrdkRQQe0Na3YTXXK4wGZXCjYbqedLwB7jItjG5RXpHXr76Qntmq
         Bt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuw786dOZhhGDYTHSouIp/Ux+c+ggqyp+h/Pmz3zMmMlUS60Dvz0XvBTisnef7lly/4Uo7kUr6yFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDULQQxT+HdvHEiDbuAT1o2lE/LFkZ1jfNhri5Dkr3WKhAijeK
	wyDMHZWeS+fVAcM1HXyx9LhM1WdTmpHoni3D+gyM9zyYBXUcbn6tvqTqt3de9hgZ49dl/eBZp7R
	LGxhsWfpKjrm90oEph+m0HjOpiGA27x7iu+btPy76LBKzVs6/C3BdfHg+6PjOAs2vQ8d1ag==
X-Gm-Gg: ATEYQzy6M7kVN0LtFJBZwQVlIwMuoPQu1dhnwqLYto2EsyTBracF0+TKF2b5GKD0l/W
	A/aZHOK7CbekMWRDrdLmUouDSzSnRZyyarjvde3gmMoPy4MpGp8crdODLugzmSof4jDcyF0nbbj
	HEO6yqKuheJjr1rxjBSRfc9o417UHfUVE51btD8FTgcvQ/AdsQ8endiVVv2Oz4lyjZu4y8gRya/
	/pFJARNuzIj5eRPb+oIoQPLxA0OrtY6Q5jwFR6UH/StcxVtez/NEqRMKc2Xnt6lHVZylEWNN5qi
	3zlZo5Ena21oIS6ZgIYDoKLobimvSz0n6/tlq8hcXJx2YK/cmmc5kdKWV2WxACBX6PM5U0N6jFb
	AFmaYiMaFhUuUK2wPcOXgTDAnMfH+F3mgfqNoQiV4bB3bkb+t4NqX0hLPcdIOhhzsxoFEFbu/K0
	BAdvL2D+fkf6frUH/ngU/p7etB7v+1oTkXv2o=
X-Received: by 2002:a05:620a:198a:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8cbc8e4f7a8mr1056040185a.41.1772366434884;
        Sun, 01 Mar 2026 04:00:34 -0800 (PST)
X-Received: by 2002:a05:620a:198a:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8cbc8e4f7a8mr1056033185a.41.1772366434283;
        Sun, 01 Mar 2026 04:00:34 -0800 (PST)
Date: Sun, 1 Mar 2026 14:00:28 +0200
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
Message-ID: <khlwmcip3dacnkdc55w37sxplcshfb3uahgfb3cjm4kpdlfi4y@fletnzhayazf>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <861pi3amuu.wl-maz@kernel.org>
 <ehhnta6zvfua723llpb52hh3lwqdh4ttomzt7xqrmcjnsslbop@p4w3gjzxp4rn>
 <86zf4r93ns.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zf4r93ns.wl-maz@kernel.org>
X-Proofpoint-ORIG-GUID: H51xz7HrqNA3PM1J_tRM-p4gZKWcB4fC
X-Proofpoint-GUID: H51xz7HrqNA3PM1J_tRM-p4gZKWcB4fC
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a42a63 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=YG64nluAAAAA:20
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BCSTLeMbECCLQgZ0D0gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEwOCBTYWx0ZWRfX0pAeYKvU+Pfy
 tj392hXrG0VguXMbtV/3JLBIhJ1VxRWYrbUimoRtnUAWFv4ebQYhJIHZfYiA1X/2WIVlS5Gj+Gp
 SMgHtLaG1If3HT4FUu7K2KP9/EZWhtSQlKV4uGQg714o+FbnQxLVMAY+jkzppH8wBWLSiPurEN2
 kDwWU+i2gZ923ZNoIp4aWWo2qQH9zwsyN4V7e4BTw2d39/SLhkWgPpv5XNguP+rRBVOOrfA+O3u
 3Cw7kn2RRbvjpaC/tWQcoFi3GaQerQOiwz/JF9p0mMNFbBWArjXT4RuPLOMcQ8BR/LV2WZlgP/I
 HOR0KF0gBr/vaTbFuuzjBaOgJZ9VvO8/DZFOHjxi3l5f51GGG5bAIzTnLmnp4cdJAtWF8Zi1rfE
 9m9spBa6PX8Jzx6/yDxsgUM7I5yxL0c1I2coQdTWXp9APPj1sghSQeLlW781mjs+LgA4lfzgCFA
 2618DG6/DoCAH6F7/IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010108
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
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,0.228.225.192:email,1.111.188.160:email,17d90000:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: C5D5E1CF7DB
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 11:42:47AM +0000, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 10:46:57 +0000,
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > 
> > On Sun, Mar 01, 2026 at 10:02:49AM +0000, Marc Zyngier wrote:
> > > On Sun, 01 Mar 2026 08:34:20 +0000,
> > > Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> > > > 
> > > > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > > > 
> > > > Change of_map_id() to take a pointer to struct of_phandle_args
> > > > instead of passing target device node and translated IDs separately.
> > > > Update all callers accordingly.
> > > > 
> > > > Subsequent patch will make use of the args_count field in
> > > > struct of_phandle_args.
> > > > 
> > > > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > > > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > > > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > > > ---
> > > >  drivers/iommu/of_iommu.c              |  2 +-
> > > >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> > > >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> > > >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> > > >  drivers/xen/grant-dma-ops.c           |  2 +-
> > > >  include/linux/of.h                    | 21 +++++++++++++-------
> > > >  6 files changed, 44 insertions(+), 30 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > > > index a511ecf21fcd..d255d0f58e8c 100644
> > > > --- a/drivers/iommu/of_iommu.c
> > > > +++ b/drivers/iommu/of_iommu.c
> > > > @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> > > >  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> > > >  	int err;
> > > >  
> > > > -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> > > > +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
> > > >  	if (err)
> > > >  		return err;
> > > >  
> > > > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > > > index 57420806c1a2..6c3628255908 100644
> > > > --- a/drivers/of/base.c
> > > > +++ b/drivers/of/base.c
> > > > @@ -2102,8 +2102,11 @@ int of_find_last_cache_level(unsigned int cpu)
> > > >   * @id: device ID to map.
> > > >   * @map_name: property name of the map to use.
> > > >   * @map_mask_name: optional property name of the mask to use.
> > > > - * @target: optional pointer to a target device node.
> > > > - * @id_out: optional pointer to receive the translated ID.
> > > > + * @arg: of_phandle_args structure,
> > > > + *	which includes:
> > > > + *	np: pointer to the target device node
> > > > + *	args_count: number of arguments
> > > 
> > > Number of arguments *to what*? Isn't that the size of args[] instead?
> > 
> > It is a number of values corresponding to the phandle in the DT
> > property.
> 
> No. It is what the *caller* expects. Not what is is in the DT, which
> could be (and generally is) a pile of random crap.

Nice

> If the two don't
> match, return an error. But don't randomly overwrite data that is not
> yours.

Mark, no. The caller can't know how many cell arguments the provider
uses until:
- the provider handle is parsed
- provider node is consulted for the #foo-cells

It is not a number of arguments for the _caller_. It is how many u32
values are used by the _provider_.

In case of IOMMUs, enough IOMMU devices have #iommu-cells = <2>, which
means that it uses two u32 values to identify the SID or set of SIDs.

Following your analogy, if we force 1 cell in the iommu-map property, we
are trying to force the function which expects to take two arguments to
accept just one. But it's not the caller, it's the IOMMU's xlate
function.


> 
> [...]
> 
> > It might be not obvious here for iommu-maps, but the struct is
> > idiomatic in OF world. Let me quote a (trimmed) example from
> > qcom/sm8650.dtsi (for a different property, but it explains the meaning
> > of the values here):
> > 
> > gem_noc: interconnect@24100000 {
> > 	#interconnect-cells = <2>;
> > };
> > 
> > epss_l3: interconnect@17d90000 {
> > 	#interconnect-cells = <1>;
> > };
> > 
> > interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > 		 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
> > 		<&epss_l3 MASTER_EPSS_L3_APPS
> > 		 &epss_l3 SLAVE_EPSS_L3_SHARED>;
> > /* I skipped the second pair, it adds nothing here */
> > 
> > Here the parsing function for this property (of_icc_get_by_index()) will
> > call of_parse_phandle_with_args() 4 times and it expects to return the
> > following values in the of_phandle_args:
> > 
> > 1. { .np = gem_noc, .args_count = 2, .args = [MASTER_APPSS_PROC,
> >                                               QCOM_ICC_TAG_ACTIVE_ONLY] }
> > 2. { .np = gem_noc, .args_count = 2, .args = [SLAVE_LLCC,
> >                                               QCOM_ICC_TAG_ACTIVE_ONLY] }
> > 3. { .np = epss_l3, .args_count = 1, .args = [MASTER_EPSS_L3_APPS] }
> > 4. { .np = epss_l3, .args_count = 1, .args = [SLAVE_EPSS_L3_SHARED] }
> > 
> > The whole of_phandle_args is then typically passed to the corresponding
> > xlate function, specific to the paricular .np ('provider'), which will
> > use #args_count values from the #args array to return the object from
> > the provider.
> > 
> > Now let's see iommu-maps (again, qcom/sm8650.dtsi):
> > 
> > apps_smmu: iommu@15000000 {
> > 	#iommu-cells = <2>;
> > };
> > 
> > iommu-map = <0     &apps_smmu 0x1400 0x1>,
> > 	    <0x100 &apps_smmu 0x1401 0x1>;
> > 
> > The property matches current definition at [1], however this spec
> > doesn't match the DT practice. It forces that the property should use 1
> > cell for identifying the "object" in the IOMMU provider, even if the
> > provider expects to use 2 cells (two args).
> > 
> > The correct property should look like:
> > 
> > iommu-map = <0     &apps_smmu 0x1400 0x0 0x1>,
> > 	    <0x100 &apps_smmu 0x1401 0x0 0x1>;
> > 
> > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-iommu.yaml
> > 
> > > 
> > > > + *	args[]: array to receive the translated ID(s).
> > > >   *
> > > >   * Given a device ID, look up the appropriate implementation-defined
> > > >   * platform ID and/or the target device which receives transactions on that
> > > > @@ -2117,21 +2120,21 @@ int of_find_last_cache_level(unsigned int cpu)
> > > >   */
> > > >  int of_map_id(const struct device_node *np, u32 id,
> > > >  	       const char *map_name, const char *map_mask_name,
> > > > -	       struct device_node **target, u32 *id_out)
> > > > +	       struct of_phandle_args *arg)
> > > >  {
> > > >  	u32 map_mask, masked_id;
> > > >  	int map_len;
> > > >  	const __be32 *map = NULL;
> > > >  
> > > > -	if (!np || !map_name || (!target && !id_out))
> > > > +	if (!np || !map_name || !arg)
> > > >  		return -EINVAL;
> > > >  
> > > >  	map = of_get_property(np, map_name, &map_len);
> > > >  	if (!map) {
> > > > -		if (target)
> > > > +		if (arg->np)
> > > >  			return -ENODEV;
> > > >  		/* Otherwise, no map implies no translation */
> > > > -		*id_out = id;
> > > > +		arg->args[0] = id;
> > > 
> > > What if args_count is 0? Given that you place no restriction on the
> > > way this can be called, that'd be entirely legitimate, and you'd
> > > corrupt something you're not supposed to touch.
> > 
> > args is an array (not a pointer) in of_phandle_args. As such we know
> > that args[0] is legit.
> 
> Again, no. The caller is telling you what it expects. This is strictly
> equivalent to:
> 
> 	void func(void *blah[], int sz);
> 
> func() is not supposed to look beyond sz. As it stands, this change in
> not acceptable.

DT parsing functions follow a different approach, because of the "random
crap". It is:

    int parse(void *phandle, u32 **args, int *sz);

So, if the caller insists that it can handle only one argument, it
should call parse(), then check that (sz == 1) and return -EINVAL
otherwise (kfreeing *args and of_node_puting phandle while it does so).

I will quote of_phandle_args here:

struct of_phandle_args {
        struct device_node *np;
        int args_count;
        uint32_t args[MAX_PHANDLE_ARGS];
};


Please take a look at how of_parse_phandle_with_args() works.

-- 
With best wishes
Dmitry

