Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEfABLH8p2mlnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB31FDADA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245186.1544565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxicj-0001XR-Ib; Wed, 04 Mar 2026 09:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245186.1544565; Wed, 04 Mar 2026 09:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxicj-0001Uw-FQ; Wed, 04 Mar 2026 09:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1245186;
 Wed, 04 Mar 2026 09:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gGj=BE=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1vxich-0001Ug-P6
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 09:34:31 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56c78cb7-17ad-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 10:34:28 +0100 (CET)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6245Sf2Y2861376
 for <xen-devel@lists.xenproject.org>; Wed, 4 Mar 2026 09:34:27 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9kcsc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 09:34:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-359918118ebso7750008a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 01:34:27 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359a8d65b31sm500720a91.0.2026.03.04.01.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 01:34:25 -0800 (PST)
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
X-Inumbo-ID: 56c78cb7-17ad-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=; b=JFVTiT7lxucAne5+
	vWI+HQTpVk9V3jWmx1PWUucrFvamP0yDOFY034alLz3ZBgzIEfMi0MS4uquN1hh8
	EI7aXuxp6dMz6qO68oU/aQSWUICNJo/sGcNoD0kPndEVtSWs5OCjVP5rcLH80Phg
	ky3wGQTwGMI2mB5E91AT27+H0OF6l0sY8Q3oWToivevSOK2GADQjRFKwWcBWEA11
	9S/eTjbdqGKh/aZMhmaHEf1pdgu2dgjd13zO95DicZf3Ff6fn+rEkPSwwJQABuHd
	scgJ1dbD5faRcuu9tqpogs2bthEi90+/7K8PlySiEJVEWT4ZR/QIh7aqipwVG5tU
	9sDJBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616866; x=1773221666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=;
        b=Scrxj3RuAIAsTGa1+PiBWfh9OJccHtZbcPIEWh5DcpqJ+CsrqQ8xCPxAv3oXIWobFV
         olxOsS5FLy881tULhe6OarqbQW1eHKq7IHNPAxabPH9Uc3ftlSuPNm7VIfGQdp9LhTEX
         wvzQ88aPcAOVHpun/B/xLuwcqAXEVKWEwKMc7IBn/OCgJhK3G4hKl4TgeZzd9F1dAkSm
         j3ziyC29nzOqvy0zY/HF8SQnyGIMS48+SdzmOLwwDC+YqPuKRuSmPqBWVZWisvsGfhJZ
         3unf/8pzAdA2IiRaso2p8+cr4gA5GTZ51Bkty4eWWA3KWiK/CWZJ4Lo69vBq9IX38RIO
         jBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616866; x=1773221666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=;
        b=AXBWGlIkxU8qsG3Zo+M12hT5/I8wFTUjw6hU4N0tZEiIJKYHD58AxcLn9l8SSCodsi
         BB7J3xMo43RSKwWZez9+jFXwHJrz/EMOvfOYNdckD9/bLkr8Cy46Y4LYSoePRRLjd1VL
         QBgcLmkjAoDcurKlSuQ8uNpC6mt+WVcGkFtGELIjf2+SJ+8Ff+hhZXJPCxjPlJP4LiL9
         xBD0BUJe4ivZLv8JQZ8CkOyMpGkICMuux5adB//1VvOeznwqVCK0lbSUaHVD7EklbzVh
         lQcVAcUgVvH2Sa3LCBK/Ig5yqi2YUZ8x6uIVP1wTVQ1Tji2RHuMhL8oL0wysVIxZLgzw
         K+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXdfqEmXyhjMaLmFK011eHM3frTtEg8Tg1PG4u1it7syIW5JcBtMKZOlOoItS2h6TcatGdfM7iIk0A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLQq2T7NtgxWTZgdmkHd2RmffbuNbW1pDFiEOmipeXGKDEOtx2
	VnrV94j2HJDxEOhe30R6hVojCncnEAI3QxCSGpGhU8wTVu1KUkaClZf3qnL9fJ2y73dPDy9hYWj
	+Jkddn2+Va9eKshB+cMHPbvobhgw9e6e8CW1JuwZWIdcezY3cvolVYWwzt5u8nDnNdfsSPg==
X-Gm-Gg: ATEYQzzpvzUnNV0eXqHO/pg8138364tI6B+Y0+7Xy3dMvAX1hGY5wpP7v7/E7cnRpFe
	ZsBqw29JkSZ7k3Vu6ngSygI/rwWQLBQrLxGGbqgQBG4Crpq4Fh/R2vTYgTrpgA4si0QlK5EnjAe
	mFnFbBsh+FqLbN9ju+M0zCbAD42aoAdFmTGUg7P+setE3Y+zWmysO99iDsj6mECu2Cb8mVECvPF
	bHzb096RupU4Km+/uvwHcqxZaHKowi0XkT1+n2LRRctodpGRwu1g6JKuA50zvFMBVFTwT2KvWzB
	KQWN2xG76MjHImXs2Dn3d+avedXrsyj+uvVU6UCDXTQnOKDFtmviIYc2VQi+lpFUIayyoSg85s3
	sZEafp2jyUtRW3JGsmgOkMW20pOAEt+KgVUBZDcxinL1/P5lpFelxLEyt
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr1241348a91.5.1772616866193;
        Wed, 04 Mar 2026 01:34:26 -0800 (PST)
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr1241312a91.5.1772616865529;
        Wed, 04 Mar 2026 01:34:25 -0800 (PST)
Message-ID: <4bc86c4d-3a4e-4ece-a01f-dce735ee9bd3@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:13 +0530
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
 <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfXwOt5a71sSCNJ
 7kNpE5LkbgtC8k5WXPJjy4Q1iRJhINCvWGcbwjx+89cO+5ADR5HaDWIDX/DY4hJb44IpCj6nbtu
 +Chy01zsq7MG+PXdfRntYyT/5om3+he5pPkxP0DhzKGKDWo9bWn9O95snSnUCK3DecN5De0/Huz
 Q4HKHcY9zTckDH0dXRI8ajJWqn9QS95BhYZk8dfxdbMWHwYYBn8O9v8BOi+XnPIrEAXA/7Ko4IL
 eRrtSCbPg2dSykGXYrq/44rI0gF+jQ6bYM8ByraQLAOPLbJJtERiyKW1/SBs74E0hsx1wpieLJn
 6b1rkz7WudvyglT82YbsWEoCclH6VfZiQOzGf0QJpGjDXzOUcS2/obn5n8jTd2c/W/O8DOgrvu7
 rdhUgx6F/Q70TpuG86K7+hKYkL+dTh+7gZ/I+wDLMY5fJTxERAphyCPSUb1xYHPqzpnu80lj4jZ
 7V4C51dRclE8jJwfOPg==
X-Proofpoint-ORIG-GUID: SHv01H7QYpiVWvg2iJORcrsAdPAmGW9b
X-Proofpoint-GUID: SHv01H7QYpiVWvg2iJORcrsAdPAmGW9b
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7fca3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MLUpyK7X_zb698vRSG8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040072
X-Rspamd-Queue-Id: 63CB31FDADA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,iommu_spec.np:url,qualcomm.com:dkim,qualcomm.com:email];
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



On 3/1/2026 3:32 PM, Dmitry Baryshkov wrote:
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
> 
>> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>>  	}
>>  
>>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>> -		id, target && *target ? *target : NULL);
>> +		id, arg->np ? arg->np : NULL);
> 
> Is it just 'args->np' then? If it's NULL, it's NULL anyway.
> 
Right, will update this.

>>  
>>  	/* Bypasses translation */
>> -	if (id_out)
>> -		*id_out = id;
>> +	arg->args[0] = id;
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(of_map_id);
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index bff8289f804a..74fc603b3f84 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  {
>>  	struct device *dev = imx_pcie->pci->dev;
>>  	struct device_node *target;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	u32 sid_i, sid_m;
>>  	int err_i, err_m;
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
>> +	if (!err_i) {
>> +		target = iommu_spec.np;
>> +		sid_i = iommu_spec.args[0];
>> +	}
>> +
>>  	if (target) {
>>  		of_node_put(target);
>>  	} else {
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..e1d4b37d200d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
>> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>>  	if (err)
>>  		return err;
> 
> of_node_put(iommu_spec.np);
> 

Sure, will add this.

>>  
>> +	sid = iommu_spec.args[0];
>>  	mutex_lock(&port->pcie->lock);
>>  
>>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index 1b7696b2d762..5f1d6540049a 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>  		struct pci_dev *pdev = to_pci_dev(dev);
>>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>>  
>> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>>  			dev_dbg(dev, "Cannot translate ID\n");
>>  			return -ESRCH;
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 824649867810..9d72d76f909d 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>>  
>>  int of_map_id(const struct device_node *np, u32 id,
>>  	       const char *map_name, const char *map_mask_name,
>> -	       struct device_node **target, u32 *id_out);
>> +	       struct of_phandle_args *arg);
>>  
>>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>>  
>> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>>  
>>  static inline int of_map_id(const struct device_node *np, u32 id,
>>  			     const char *map_name, const char *map_mask_name,
>> -			     struct device_node **target, u32 *id_out)
>> +			     struct of_phandle_args *arg)
>>  {
>>  	return -EINVAL;
>>  }
>> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>>  }
>>  
>>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> -				  struct device_node **target, u32 *id_out)
>> +				  struct of_phandle_args *arg)
> 
> Document that it's the caller's responsibility to of_node_put() returned
> node. As it can be seen from the previous comment, it's not obvious.
> 

Sure, will add comment regarding this.

>>  {
>> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
>> -			 target, id_out);
>> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>>  }
>>  
>>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>>  				struct device_node **target, u32 *id_out)
> 
> Is there a reason for chaning the of_map_iommu_id() args but not
> of_map_msi_id() args?
> 
 
Thanks for pointing this out. I’ll update the series to keep of_map_iommu_id()
and of_map_msi_id() aligned.

>>  {
>> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
>> -			 target, id_out);
>> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };
> 
> Which driver passes something being worth of storing in .np?
> 

You're right, There is no need to store these input args. Will remove these initializations.

Thanks,
Vijay

>> +	int ret;
>> +
>> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
>> +	if (!ret) {
>> +		*target = msi_spec.np;
>> +		*id_out = msi_spec.args[0];
>> +	}
>> +
>> +	return ret;
>>  }
>>  
>>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
>>
>> -- 
>> 2.34.1
>>
> 

