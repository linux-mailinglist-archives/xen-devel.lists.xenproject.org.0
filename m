Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDxtIaL8p2mlnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BE1FDAB3
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245180.1544556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxic5-00014S-8A; Wed, 04 Mar 2026 09:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245180.1544556; Wed, 04 Mar 2026 09:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxic5-00011k-3a; Wed, 04 Mar 2026 09:33:53 +0000
Received: by outflank-mailman (input) for mailman id 1245180;
 Wed, 04 Mar 2026 09:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gGj=BE=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1vxic2-00011U-Mc
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 09:33:50 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e475509-17ad-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 10:33:48 +0100 (CET)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249KdIv1455844
 for <xen-devel@lists.xenproject.org>; Wed, 4 Mar 2026 09:33:45 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1801me-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 09:33:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae65d5cc57so62979005ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 01:33:44 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae541358d4sm76250575ad.75.2026.03.04.01.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 01:33:42 -0800 (PST)
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
X-Inumbo-ID: 3e475509-17ad-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=; b=jG7fGQ4v5uKwi+m6
	jYRS3LTZutxZaRvtn8jkQxwWB2a0rTwd5e4FuO+g0wWd5G6gGJcJF4AE1G5i+wFk
	OVKDaM+De548acZWpPzF3QrgKX7M0ybyyo9T9nH5iq1FCKDwI9itphQ7adIazLDh
	RCVUSxnyEZWmuQHAooPZDGtWaMjcWZ8Cwxhrap9wNj/tneGiKaSjMDD1SK277er9
	zx1qlz8KOShYrjRR+IbVJPOroaviNiAlxyRY0ZMUgNqTvVo0VGxfRXNQzqpcimU5
	5LEprhOHTQYA/7ocebT16KTOpnKkzt3JtoAKgir2XJgo30Zc72Ql1lf/KJbK5HwK
	TOtKHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616824; x=1773221624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=;
        b=PGuhz+lm2m3hsnHBlQw9ib9vrdWL7CD5Rv6Q/rlGSVnpzXQZLlXVtME4VDaiKobjHv
         VtElYb6VUdOiwGqeLHdlJynZIwDsURbo+8WN5qvVTyTAjUbcDArllaE+2a3Io45jHirb
         jRyE4dLv9LjY2U+kqj8P+cqQqZ44FFj/MGd69Wi1sL4MvXFdoJduHPGvLD5F36gKJrMz
         /lJP/yZQFFtI073Ee2H3WNB1PoAyS9sTC7ruk/aqJhUa7V7SeqGRfTzVPGiQ9Nqgr2NH
         oZRpfE/qvwT8sKt/BrJ8gviUHWeMkJkV0VwJyC3bAEx9GjDcNXBURxs4PnAJSg1q5z9R
         tUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616824; x=1773221624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=;
        b=Jaxt53OhTfZXBu749Fa1hR8sjCG9S1HsaKCUVz7sRxrzs+yxButdtnAIPT275k/eSe
         f1ee6KZws0pkaEvG1YGnJ79RL3Z3JUT9/5odZDZ7qAJRp/W6S2uWSIec3FC46cfxWNJ5
         xWJvg/0d3hB3CHiwBS6znaToCh+2rfdjjqHYrZOElJ+k07fxAre5Tfo7Pq1UXbavNg5P
         pEVlAtczOwV5EBWg9j55fyQWmzfO/1KWgFDb8td1SnczCQcnLAR82iFUO0mzGwQYDAAG
         a9BdZsxNZWHbgzI1U6MZS93O/RFqikOiFlKfxXaMSZ/jgQ/hPqOawNZPMK6aLGH2W/tc
         gspw==
X-Forwarded-Encrypted: i=1; AJvYcCWsTIJdfWlkQzZuNnZi/SACM1zuCJobPa3ap5pL2iY1HJ2ct9PR6QyDlCj9NbwvU6dURjXUnNQ+EjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCHkBQIo83NZob4ivxUtk7yEZ7srQw1nCr3tTridg14jOqdp95
	MCLW1H/yhMuyiTShjbsk7asPLvwO9tBcOuhN1d3HcCiW32ZlffH0hLVLWLJvGR2LzJPEZlBz8mZ
	v8H2H0kmqEFJDgGQEMJFTrbokN7wG554mJwCJMxBKlRkEqxGshYrZYemPTfrDqJK4CMBMqw==
X-Gm-Gg: ATEYQzwNnOkY2vJEWWGxuni3ow4OFgo/Li1tmFlfPrBc8V+wu0CZC4lHWSOavpKgAVF
	dCtfS8ovF91UW/YYkMbPQQ4cGUNEZJiD6NWo49Jk+nCZIFlaZUm6XKemNZHsfBKObmzQdM3Fbau
	ECMTISAob9LeY+K8SyWYGPzEs2JEvulgCqrJhUI2KlDd7BXZ0YrW2QlQFDNm7hakmriu3FvbplQ
	dtnfkmAtZKC74MA96/KPY5u2IAH9M3FVd6Y9mQsXQrobUve+3wFtMvwrOXGBcutFVxYAs4dgbij
	BAfqZkuCyx3ggIwDS4xn9n1VNAgxhUGZM0ts2ubBiHuafZ/UpOSrTMEZxR5heGYB3Yk+WGPWv22
	xI4pYUW2O+sYoEIMLwPnAc+7vmRkuMoDS8Cop4XY/72DjX85JIen2MGbW
X-Received: by 2002:a17:903:3586:b0:2ae:483f:b23b with SMTP id d9443c01a7336-2ae6aaae620mr19109905ad.32.1772616824005;
        Wed, 04 Mar 2026 01:33:44 -0800 (PST)
X-Received: by 2002:a17:903:3586:b0:2ae:483f:b23b with SMTP id d9443c01a7336-2ae6aaae620mr19109655ad.32.1772616823507;
        Wed, 04 Mar 2026 01:33:43 -0800 (PST)
Message-ID: <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:02:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
To: Marc Zyngier <maz@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
 <86342janlx.wl-maz@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <86342janlx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gPrIPuWDPDWSv3sVI6dBGPwhrJQWIOml
X-Proofpoint-ORIG-GUID: gPrIPuWDPDWSv3sVI6dBGPwhrJQWIOml
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a7fc79 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=xEgsDuFUHT4EKXnybycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfXww1T3Whyklwa
 ls5pvfv5Ox03jQhQiuelVVgiI9b1bg86e9xxsPgFbH9kSX6b3Sj993+bAHRVaIoqjBnVn34ZpNk
 A60OwvZYXzgj9idW1admPHNmeC3WRjL1d40jROM6yMTIEs9EHs6gpYv60KHeLbTOhYzdvIwGh2t
 RjlXD666y4q8CvElXYI2UGnwmQwbDJOuME+qP52ar2D+xXbc8FK/1vUwoZcHy/50hugIhihq7+V
 4rkS3xhdu5A3ehSR3WQMPRHnWJJ05ySf6F5V+qK7uFoQXP7VDNQHaQi1uZHc0oxk5dLOmHfemP0
 jHRv5K3HJHb72FPSgI0F7pCCBXhfkKpYlxlxsedgtV3wfas03oRw73m90n1cxfyuGd+60Y9EoMr
 SiyZ7YmEYCEFjhSz6cWLm3Kb8cdQbAeDXTLSKnmuOreNXgSmggj6EAwYXPoX46Z/eyI++h1DtNH
 tg0aHV9VgbrQxyl7uFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-Rspamd-Queue-Id: C32BE1FDAB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,nxp.com:email,arm.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s
 :lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 3/1/2026 3:16 PM, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 08:34:19 +0000,
> Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
>>
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Since we now have quite a few users parsing "iommu-map" and "msi-map"
>> properties, give them some wrappers to conveniently encapsulate the
>> appropriate sets of property names. This will also make it easier to
>> then change of_map_id() to correctly account for specifier cells.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  3 +--
>>  drivers/iommu/of_iommu.c                 |  4 +---
>>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>>  drivers/of/irq.c                         |  3 +--
>>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>>  drivers/pci/controller/pcie-apple.c      |  3 +--
>>  drivers/xen/grant-dma-ops.c              |  3 +--
>>  include/linux/of.h                       | 14 ++++++++++++++
>>  8 files changed, 22 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
>> index 91b95422b263..63b3544ec997 100644
>> --- a/drivers/cdx/cdx_msi.c
>> +++ b/drivers/cdx/cdx_msi.c
>> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>  	int ret;
>>  
>>  	/* Retrieve device ID from requestor ID using parent device */
>> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
>> -			NULL, &dev_id);
>> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
>>  	if (ret) {
>>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>>  		return ret;
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 6b989a62def2..a511ecf21fcd 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	int err;
>>  
>> -	err = of_map_id(master_np, *id, "iommu-map",
>> -			 "iommu-map-mask", &iommu_spec.np,
>> -			 iommu_spec.args);
>> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
>> index d36b278ae66c..b63343a227a9 100644
>> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
>> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
>> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>>  
>>  	struct device_node *msi_ctrl __free(device_node) = NULL;
>>  
>> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
>> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
>>  }
>>  
>>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 6367c67732d2..e37c1b3f8736 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>>  	 * "msi-map" or an "msi-parent" property.
>>  	 */
>>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
>> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
>> -				"msi-map-mask", msi_np, &id_out))
>> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
>>  			break;
>>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
>>  			break;
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index a5b8d0b71677..bff8289f804a 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
>> -			  &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>>  	if (target) {
>>  		of_node_put(target);
>>  	} else {
>> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	}
>>  
>>  	target = NULL;
>> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
>> -			  &target, &sid_m);
>> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>>  
>>  	/*
>>  	 *   err_m      target
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index 2d92fc79f6dd..a0937b7b3c4d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
>> -			"iommu-map-mask", NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index c2603e700178..1b7696b2d762 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>  		struct pci_dev *pdev = to_pci_dev(dev);
>>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>>  
>> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
>> -				iommu_spec.args)) {
>> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>>  			dev_dbg(dev, "Cannot translate ID\n");
>>  			return -ESRCH;
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index be6ec4916adf..824649867810 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
>>  	return of_property_read_u32(np, propname, (u32*) out_value);
>>  }
>>  
>> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> +				  struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
>> +			 target, id_out);
>> +}
>> +
>> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
>> +				struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
>> +			 target, id_out);
>> +}
>> +
> 
> Any particular reason why this is made inline instead of out of line
> in of/base.c? Also, some documentation would be helpful for the
> aspiring hackers dipping into this.
> 
> Other than that,
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> 	M.
> 

Thanks Marc.

I made them static inline mainly because they’re just trivial wrappers
around of_map_id(), so keeping them in include/linux/of.h avoids adding
new global symbols/exports and keeps the callsites simple (similar to
the existing of_property_read_*() inline wrappers).

That said, I don’t have a strong preference—if you’d rather have
out-of-line helpers in drivers/of/base.c, I’m happy to respin accordingly.

Re Documentation, Sure I'll add comments for of_map_iommu_id() and
of_map_msi_id() in follow up patch.

Thanks,
Vijay




