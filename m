Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BAMHcD8p2mlnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F31FDAE1
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245188.1544575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxicw-0001ts-QZ; Wed, 04 Mar 2026 09:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245188.1544575; Wed, 04 Mar 2026 09:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxicw-0001rp-MW; Wed, 04 Mar 2026 09:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1245188;
 Wed, 04 Mar 2026 09:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gGj=BE=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1vxicv-0001Ug-LK
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 09:34:45 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fe27856-17ad-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 10:34:43 +0100 (CET)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249Kun41456217
 for <xen-devel@lists.xenproject.org>; Wed, 4 Mar 2026 09:34:42 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1801tv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 09:34:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-354490889b6so23311371a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 01:34:42 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359a8d65b31sm500720a91.0.2026.03.04.01.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 01:34:40 -0800 (PST)
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
X-Inumbo-ID: 5fe27856-17ad-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL/MxpDDt/5/2ALudUSxO1nN1iy4vdaNTzKBdYqEsSk=; b=eKEnwxk08ZSuuIb5
	kLnhOzDXKxPW3zLqbJ5i4X54fIBV8ekw6WA+QDZnIeum2m6HgZKdTzX4cPzMLchr
	5neNVC9YrL0B3EGsnHNgfXT05VeYt225ETdM/AVXVP7//SkXB+1NzN8TeDk5RuFC
	27wO/Anxs1VGEBZa4acXnCLLVSO0dORMonWjSO3FqxuXk8a43Wx2H73d1BKdA4cE
	cxQQpibSkWaWAkJiWBDKtr7fW54WyW1SeY84/O6qB+m+jZ3tI0VcQa8JbqlDPGP8
	LB1IrM9dcfY+1udtjPx+AYfb3o7TgoA/Gyl6T/sV5VyaqTfN5LbziEYbwNJlrEhZ
	gV/dBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616882; x=1773221682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eL/MxpDDt/5/2ALudUSxO1nN1iy4vdaNTzKBdYqEsSk=;
        b=ennUz2CnSnfHhWAsZQPKMoTlyZlJOcl+ytMWVqlJCjrzijy0eFi4Ib9+ZqUdRXCmBZ
         7GMwNlgjypji+YRjUTKlVWFsyJxFA2F3Yd6J0/SW+Ztf2c4RkMSBs5bMevwFn9vw/2Zv
         6h+JavABYIyfZR9crcItTZ9Hvze2Zt2QxFNCmScU6fMHullPJzRhZPsBD881U5BW33cZ
         9p4gaRQEsJjpJdoJb1KLW3FpV0WzqeTo4cAjhKytwcjBSPRvOcvGrvc4sitO8DDFOMth
         WEohUjgdX6xv/7VRzZh7/S/D4acdRMa1ljWuO7Lfb7lVE3Jf03LcX5BqG/XGYm12RNXS
         SDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616882; x=1773221682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL/MxpDDt/5/2ALudUSxO1nN1iy4vdaNTzKBdYqEsSk=;
        b=rmzfFFcVpaPlDklLhtZUS0kuX3BTP5wrM+PQdX64WvD004x1MComuMpOluYdp151tS
         KQ2CYuKgpa1HeSHNuqI35wzVtXf95G884k7plsV1crd42Rx2BMSmaG73/Ryo6MKNIFKY
         AigvAtIIVmA/0UXQ2fi/ENICwce7K3yK3HU1pPRZ4AZBsiTaHUr0PuSOuOhoeP0ydijZ
         riVx2fwgPTJmyrmGHZO3rlh0pbPBScl8/K15RuODGWekuFB2IFWw0B+9W8TJWWsK0+EE
         W17ZpiuGl9WIbocA/JWkyPmSI2TE69kKi/OFe/5NdRhysqM9LfBbFahlhcVbQZHBaUc8
         rWKw==
X-Forwarded-Encrypted: i=1; AJvYcCWuslrIOsmXuHK1N0mfoiPbwl1+4LhmUePGqbyt+2PwKk3CnvnUA9vV1istBLK79g6io2Yv5s/xlhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBgtl5Qn1kKnpSmKlm+1UKG0QMqe4FJbhYBs10IvsEWUUzW+NT
	Fudz3XPpjHYAgrWaW63hWwenN4BzAwYXwz4LlZ2UFvM6ZgX6Dn3Yyxi7o7sJQ6pVgUfiFNySGn0
	r49wzYVbLbEAJQ8qPylLavS9Bru75/75WTOjzGtOR0hasLeRhAWCQLO3BZcBy5+xAJc3rxA==
X-Gm-Gg: ATEYQzzm1DsrKmEqLktGKreb0POrpKchuBNEicZkUvejojB8ywTz13yPXhMYfno6q/i
	I04VVc3SjCG3REzentz1+iZ3LELXPB5c5XC99eMVW3+KatiaBzJj4agrVfbHX6GDqYJ6FpQ+LxE
	4eaVe1MmRZhr2Cg/7XnB7WH4YmpGeXGHX0orpvaZn3jrxqB0QvctuAMvnU9DmTab1W2G0aM+/xd
	6xwPKaHRH2qOShtQkAjVc79SsS5NPBv7ISE9137EcGti2ktdsQH2aoxYAsPCjDHgE3eGYrBPrKY
	9U4wXcql8PVkod2aa6JJN96QIyrkXZpYM40FVu76LSQhror/RuhAerEmGM9BVMXPAfWIw1saz/W
	eRamQPtZ2sIfXHa5yLWdVeBfqtqJ525uWPEl6NMINyDZZRR6wKNS1c5P7
X-Received: by 2002:a17:90b:5784:b0:359:8cad:bcdc with SMTP id 98e67ed59e1d1-359a69d6372mr1471625a91.10.1772616881617;
        Wed, 04 Mar 2026 01:34:41 -0800 (PST)
X-Received: by 2002:a17:90b:5784:b0:359:8cad:bcdc with SMTP id 98e67ed59e1d1-359a69d6372mr1471607a91.10.1772616881094;
        Wed, 04 Mar 2026 01:34:41 -0800 (PST)
Message-ID: <ebeb6f4b-4195-4e9f-b211-a8e11a875b7a@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XspXn515PnmnapL6GL7n1AZwCDAJaH6V
X-Proofpoint-ORIG-GUID: XspXn515PnmnapL6GL7n1AZwCDAJaH6V
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a7fcb2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=kVzFkbBwBCoyR44kgfkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfXxxBom8ZN0eMZ
 ispw6LZFd724n/Lb2bSCbI97PalpwYGNviVBwg7V8X8l4atLFg0FwPvWFsZJloDKzV2QEVu5648
 Zy6euuaAcfJEMSPdJVoP6LQO7GVQ+fjiBBtAtmcdvFl78flzK/iNMkkzUaDkgefRmlsGLqx3/Ub
 ngTtzPCpmakoFZ8Ssh6/7RAeww2VoljqT/CUdAQBQ4Ec1293HyjbosEj7pZ8lsoOt5bSOC9mnR9
 nTRK4TDmtFvZOrWk4HP5vQO+0NPmh2q839jWIGBoHWbfHKt74N+xh81o1Lh8zUUSgz2OTdXT8H8
 GySTwTgwkP0JHDdx0ztdDmvHPdUbTaWO2KyoMJg1GWedBVEyWA67oLDDvlnssE94LCZcG1AjovK
 LxZhbCP5F+gRna1r5FrkBazyN4FuqbcK2QVt70Fq5+z4bQkeyziyRDsLuoIuD7Mk0okte1aHNiX
 OwAgJ37QruQsmGpyAzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-Rspamd-Queue-Id: EF8F31FDAE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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



On 3/1/2026 4:29 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Subsequent patch will make use of the args_count field in
>> struct of_phandle_args.
>>
>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c              |  2 +-
>>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>>  drivers/xen/grant-dma-ops.c           |  2 +-
>>  include/linux/of.h                    | 21 +++++++++++++-------
>>  6 files changed, 44 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..e1d4b37d200d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
> Hmm, I didn't notice this. Parsing functions are expected to ignore
> of_phandle_args before the parsing. So passing .args_count = 1 is
> strange.
> 

You're right, This is not required. I'll remove these initializations in next 
series.

Thanks,
Vijay

>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
> 


