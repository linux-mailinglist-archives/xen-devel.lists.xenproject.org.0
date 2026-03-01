Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO6sH54RpGlcWQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:14:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A71CF116
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:14:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243794.1543383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwdop-0000VN-Nz; Sun, 01 Mar 2026 10:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243794.1543383; Sun, 01 Mar 2026 10:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwdop-0000Sp-L7; Sun, 01 Mar 2026 10:14:35 +0000
Received: by outflank-mailman (input) for mailman id 1243794;
 Sun, 01 Mar 2026 10:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDVR=BB=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vwdoo-0000Sj-6h
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 10:14:34 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f05364b-1557-11f1-9ccf-f158ae23cfc8;
 Sun, 01 Mar 2026 11:14:30 +0100 (CET)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61SH08QQ2942023
 for <xen-devel@lists.xenproject.org>; Sun, 1 Mar 2026 10:14:29 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd2fnq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 10:14:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso2611176785a.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 02:14:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bce377sm961212e87.15.2026.03.01.02.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 02:14:26 -0800 (PST)
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
X-Inumbo-ID: 6f05364b-1557-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaYtDY7i19JC+kgo6Aub+wpd
	CRyygwATCwFfvf7SeLs=; b=hppjOok7n3kZEvdpFxy+oGrOFaOPC7WA6YKIHC/P
	RLEYZxYbkUwgyYloRukhuv54XIuvwPWWpkPINmqgr0ipcG19c+mBC/unxCISJ5r8
	zv7oYZVSJSJYmp55jiMff6vOdPdxkh2HD9IUTL9/EGMSQq7cxEt5ifcUcnLdvyPQ
	CC0CKVFN4N93C/eKDl3lfXTKt14GvBGu6SOZqNz1kipYOf05iepCsnG0pQWfv/Tj
	WFKOcpyXYTiGyABliGv3BCzT079+WL77nYdK0AQqkVT1B1nEmAl3yQKyr4QgxvnL
	0GB6owfy1UPawDPjWgbesksP+P/Io90JOQoe94KPSYHL8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772360068; x=1772964868; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=;
        b=UJDpvag+7m3v0iJCv/61JOCJp+AH5V9lobHW76VtdlLaU2HYFK0DjHV6hn/86sDaDf
         Bamgdo8LQYE+QQK96Rg4uOSO2IkPXsRxgJdAzZkhco1r0yYRbVbsbW4t3M6A6/z4vQ0X
         GIlMNjjY8+RCVNxlJzqAZ/VZyYAz3rBbYdYqWiiA1+dDKOOUXgafK6DeVSiTD56m3Opm
         O4TBphQcJYZayj6MxzKw6xCs+2jmdsCxqGVu0sivClhGmkwOT2RzOYqxSckgdf1R/ILZ
         l15skYj7JVtagYq5Mbka9L3TEHgDjX5WQl6xWL35jl9Wfaqe+YqYoKQvCK2gfKs0A07z
         w3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360068; x=1772964868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=;
        b=WKacjeKdGsozyUcbM6opk/JWVMi7xuwCiGsdg73Assk4n9m2VQ281P3gwU23tO25ZH
         iiSKMr6nR+ksaAF+tNI0haDeqL+pnV7HLrrLbJtF1q2keMA5eCCf8fxykkRseuSY6Bf4
         wkhzTrg6d1l/rYbe0/D5XEdZ1Kylx4+WyxgA+0ry9VGxBYbToUhRLQQVBVvdZKr2tmzZ
         c7bJt01TrjWErb1BTCJHwFRRWi2EyX3E1CRJudOimqCirtXVEfd+51fhBdcXw2tUqqe3
         Igkn5d8vWZmy/nME987f8P6RQIdThJKpbm1+V4gZdRVGAVvFMQwPfPBoLIXbS3+c2IOo
         82mA==
X-Forwarded-Encrypted: i=1; AJvYcCUrdUvyEPCpgJvVYYfxBFhB3zbVHLS1t+SHj4wa1Q6TZB7LL62Tzc9cve6z7RotnPxaPl0vokBXxXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGUfzR/RCY2La22aK9F3k21MvXMfkJKAHPeTci//oKEY+NMpYU
	pUPfCrmZAoeaZGt4rhjvq5xvgkuDjmGevWoEEHhqwmHEZYG3OJk7DwOe4P869EDOa9Ivt/mbwaJ
	1bLcCm8KHDlSGe2hPxmgrf8jJhMDp2yki8y2L8dfxoQxrYgfoV32G96gtPVbRFSYvTsPOoQ==
X-Gm-Gg: ATEYQzyF1B5S2R2nkC2u1f0Qq46wkEu+OEBZwUPzL6bOIXH06g8pLcGd9T/xAkjdT4U
	0MzrLVSpLOusedgVS7ikinZkAx9jaOxuHZHsOhpKuGWgPVMUBoP2lkqNrXcbqcuJrXer8eca6fR
	zeQu0n3q9A9BpKSNbOUp/IXuQ0lQtuqK34w9S1WKKmqvGEoGkoijbxs7GgFwKNpQucJNZEj+bHI
	40bMoB4k9/vuHEkUtwcpLQMZ3ZZFkGA2jLaNMCqqbM97vKvpJmthhAIdtusrZrfkzRZ9fHohad1
	IqIB8ryHGy+4gvJbA0Dt+5qxGnmh0Iw+4Y3WCTpF2vZO4vvX77fExEBPNRqDAyR0PVWVh4ossUY
	6Py+bixsnxiNqvnMVzzavrLmt8jcCUWZLMWw9G3cQ1y+CLNiD7KW83MWhrv64O1joltl313jXWt
	vhuAu3hxeUStXfmlogjTrdwAHVvp2Uo4TrFCE=
X-Received: by 2002:a05:620a:c4a:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cbc8d9f7f5mr1039716085a.35.1772360067923;
        Sun, 01 Mar 2026 02:14:27 -0800 (PST)
X-Received: by 2002:a05:620a:c4a:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cbc8d9f7f5mr1039712785a.35.1772360067368;
        Sun, 01 Mar 2026 02:14:27 -0800 (PST)
Date: Sun, 1 Mar 2026 12:14:23 +0200
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
Subject: Re: [PATCH v9 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bHA-iXZAqDUafR2HJbsBttLMiP8UykgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5MSBTYWx0ZWRfXxX1VBNKYWRVU
 UpQ+V9K0LjgExjP19NlU3QtaP3RLg9caJPTZ5X0WdpR82xhuaPoBnEeExowKuw26nvHMgxaT3x4
 nKywnDH8GEa0a726lcypLeLpPOhsqp20WVJqWtclaZbPTE1Xioz2U9Td/Jpdfqxh+QaNJErzOc5
 14Eb7dT9miDa32YLyS/rHeqzZwKSs6WjnNb7yJwVcW5qGbF127Cngn2pyrEsBzt83A75ITK+he9
 8rFKUEUGMCt5d5rwd+dbidM1wSLjK5JZ8sVZ+LgHPqTJHiv4mfxsMxPLXQ2ivEnI8sZ0BolaqIH
 0phaThc0fLUKiq4tEePzz00l5EXK73r9wkdzSezKwfwl/hRQVdf+rsCpj8VXklzeDDORp6Eoz24
 oPmSSKYoQPLPGFhc19hsARPWeAS/ljr8d2C4/bIy0I+XtmuTufqzz9YiphtLWtNhNdumu3XPwpj
 Z/DJL0pRffgqhXhSxaw==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a41184 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=7GgscoS1Nejt2LJ9sp4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: bHA-iXZAqDUafR2HJbsBttLMiP8UykgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010091
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,arm.com:email,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: CD9A71CF116
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 02:04:21PM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properites has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use in being able to map at least single
> input IDs to multi-cell output specifiers (and properly support 0-cell
> outputs as well), add support for properly parsing and using the target
> nodes' #cells values, albeit with the unfortunate complication of still
> having to work around expectations of the old behaviour too.
> 
> Since there are multi-cell output specifiers, the callers of of_map_id()
> may need to get the exact cell output value for further processing.
> Added support for that part --charan
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c |   2 +-
>  drivers/of/base.c        | 117 +++++++++++++++++++++++++++++++++++++----------
>  include/linux/of.h       |  16 +++----
>  3 files changed, 102 insertions(+), 33 deletions(-)
> 

>  /**
>   * of_map_id - Translate an ID through a downstream mapping.
>   * @np: root complex device node.
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>   * @map_mask_name: optional property name of the mask to use.
>   * @arg: of_phandle_args structure,
>   *	which includes:
> @@ -2118,18 +2145,19 @@ int of_find_last_cache_level(unsigned int cpu)
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
> -int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> -	       struct of_phandle_args *arg)
> +int of_map_id(const struct device_node *np, u32 id, const char *map_name,
> +	      const char *cells_name, const char *map_mask_name,
> +	      struct of_phandle_args *arg)

Some extra whitespace-related noise in here. Last line wasn't changed,
so there is no need to touch it.

>  {
>  	u32 map_mask, masked_id;
> -	int map_len;
> +	int map_bytes, map_len, offset = 0;
> +	bool bad_map = false;
>  	const __be32 *map = NULL;
>  
>  	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
> -	map = of_get_property(np, map_name, &map_len);
> +	map = of_get_property(np, map_name, &map_bytes);
>  	if (!map) {
>  		if (arg->np)
>  			return -ENODEV;
> @@ -2138,11 +2166,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  		return 0;
>  	}
>  
> -	if (!map_len || map_len % (4 * sizeof(*map))) {
> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
> -			map_name, map_len);
> -		return -EINVAL;
> -	}
> +	if (map_bytes % sizeof(*map))
> +		goto err_map_len;
> +	map_len = map_bytes / sizeof(*map);
>  
>  	/* The default is to select all bits. */
>  	map_mask = 0xffffffff;
> @@ -2155,27 +2181,63 @@ int of_map_id(const struct device_node *np, u32 id,
>  		of_property_read_u32(np, map_mask_name, &map_mask);
>  
>  	masked_id = map_mask & id;
> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
> +
> +	while (offset < map_len) {
>  		struct device_node *phandle_node;
> -		u32 id_base = be32_to_cpup(map + 0);
> -		u32 phandle = be32_to_cpup(map + 1);
> -		u32 out_base = be32_to_cpup(map + 2);
> -		u32 id_len = be32_to_cpup(map + 3);
> +		u32 id_base, phandle, id_len, id_off, cells = 0;
> +		const __be32 *out_base;
> +
> +		if (map_len - offset < 2)
> +			goto err_map_len;
> +
> +		id_base = be32_to_cpup(map + offset);
>  
>  		if (id_base & ~map_mask) {
> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> -				np, map_name, map_name,
> -				map_mask, id_base);
> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
> +			       np, map_name, map_mask_name, map_mask, id_base);
>  			return -EFAULT;
>  		}
>  
> -		if (masked_id < id_base || masked_id >= id_base + id_len)
> -			continue;
> -
> +		phandle = be32_to_cpup(map + offset + 1);
>  		phandle_node = of_find_node_by_phandle(phandle);
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
> +			return -EINVAL;
> +		}

This will trigger the cells_name property check even if later we
discover that we have a "bad" map. Is it intended / required?

> +
> +		if (map_len - offset < 3 + cells)

of_node_put(phandle_node);

> +			goto err_map_len;
> +
> +		if (offset == 0 && cells == 2) {

... if it's not required, then the bad_map check can be moved before the
loop.

> +			bad_map = of_check_bad_map(map, map_len);
> +			if (bad_map) {
> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
> +					     np, map_name, cells_name);
> +				cells = 1;
> +			}
> +		}
> +
> +		out_base = map + offset + 2;
> +		offset += 3 + cells;
> +
> +		id_len = be32_to_cpup(map + offset - 1);
> +		if (id_len > 1 && cells > 1) {
> +			/*
> +			 * With 1 output cell we reasonably assume its value
> +			 * has a linear relationship to the input; with more,
> +			 * we'd need help from the provider to know what to do.
> +			 */
> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
> +			       np, map_name, id_len, cells);
> +			return -EINVAL;
> +		}
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len)
> +			continue;
> +
>  		if (arg->np)
>  			of_node_put(phandle_node);
>  		else
> @@ -2184,11 +2246,14 @@ int of_map_id(const struct device_node *np, u32 id,
>  		if (arg->np != phandle_node)
>  			continue;
>  
> -		arg->args[0] = masked_id - id_base + out_base;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
> +
> +		arg->args_count = cells;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			 np, map_name, map_mask, id_base, be32_to_cpup(out_base),
> +			 id_len, id, id_off + be32_to_cpup(out_base));

Again, having whitespace changes doesn't simplify reviewing.

>  		return 0;
>  	}
>  
> @@ -2198,5 +2263,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  	/* Bypasses translation */
>  	arg->args[0] = id;
>  	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);

-- 
With best wishes
Dmitry

