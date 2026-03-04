Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GqpHOH8p2mlnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:35:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C3F1FDB06
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245201.1544584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxidS-0002YB-1H; Wed, 04 Mar 2026 09:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245201.1544584; Wed, 04 Mar 2026 09:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxidR-0002WO-U6; Wed, 04 Mar 2026 09:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1245201;
 Wed, 04 Mar 2026 09:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gGj=BE=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1vxidQ-0001p4-6i
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 09:35:16 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71bcb6dd-17ad-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 10:35:14 +0100 (CET)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6245TGeh1679276
 for <xen-devel@lists.xenproject.org>; Wed, 4 Mar 2026 09:35:12 GMT
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73ha95s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 09:35:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c70f137aa4aso3935512a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 01:35:12 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c73790f881esm1186795a12.10.2026.03.04.01.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 01:35:10 -0800 (PST)
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
X-Inumbo-ID: 71bcb6dd-17ad-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=; b=g1/MgbWp9GnnXzTd
	dYgjmB5pE0P9xO0EdT20U1vIXpi5wS3RFe61V/EBK+qRPr9eONuDqjb9UYV2umU/
	XCP7CoOKVrwU57sHnaAy4LUA4efHqaLUfjweLNBhhI7Q2qzZR8QazjyrvWniEyPb
	QQYK28Z1sRZka2ZE29KDYJXFNg/0EdRPi/TmeNbb4jH6w3G5fmFZKHC+H/PiUrdc
	PTgx64nHg5jzDRyyzQ51s1Le/VaT5IGp7W8hsfQ7Yb6zp3JOAUrD3gO0jK5zYDmi
	9lS2S2AOKeuSXQde+RvkHYShPDF/QlA7jTobiMPM3THAv1Ntk1wMS10nDiGYvKV5
	Hm/DGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616912; x=1773221712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=;
        b=BII/8yAkyBbmFkPTGyuSFcqj4pFgi9dfWM2SQ5ZmWXAFxh9vXEM9cQs9AbkvNH6BkV
         KL874RIZmQTLxh6xukjolnlazzx0xeUXbJw656UBNNRvf+D7NnhQi4PRePCIBb99vahp
         FGcTDxUxsmy494iayct4UHMfM0d0UoNaMC1XqDhWFmwvHcKABRCrHfWT0pLuBpOIUmv1
         koM2DECMdLAFfS27sF31J3pE3zuI47qOwZ8L82TKH7VsHGcjbvv0TDizf6E9ElBreu/b
         Cnm0JfjcXqvwtM2dhicwmGHKDiQSEXj+wxVMjpdfz0gofdsBoKoJFZSiKUj+1R3lsEYK
         KcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616912; x=1773221712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t80u5LhNs8dedbnLQe3vnPgp0bI1VMt5bD83HvKUNdE=;
        b=rn1poLbPXeTnQGW9wAze76Vli0JZFZ/Cznk8U6unaJFTtXwun8m91aP2XWOKkuuQbL
         GkluF8C8BneNiBA5e1uQaeVGQQ4ST6B9FP/vR8Z7/Zo7ZaOnWZgGjQCcg/HO5zPLmTyI
         053D5A2Wt6HHvTVrxPMLbtys5tLZUHzLVcAXITLQAGPo/cPiFbTsPBjkcMmDO5i5psgk
         0+Ax81QwSeqlpkF82ZWz34eIoHDRILRX15yDgvmeqIsd4BQtfxf1P02DgegGpgnMqb82
         /lF7mJ+2ZceRJ+BHd7QtJJu0ipFIzY1OVsJc1T7OC+vgWwlEevRr79j84yEYE6QprZti
         sBUg==
X-Forwarded-Encrypted: i=1; AJvYcCUYvu4Kjs/7DMWVtNSnwsmhjLM6lXAlV3N3ZDfO/BbqOXTqt9JVgWvFgAbG0NhRguq98KXD9HgfqKo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3iBvf+jB32ceqx0At695JlnoYcxnzEJyRkxXV9ZLv+YBbIrGK
	gH0qVTB85uuYnmiSvsMAMEJ37IGf/D46L814sRFRFDUGsDkXILfZcY0R2H+7mp/xpe0B0TUcP2P
	2JB3fRqXTBlczIbyQaBKbOc083T96X+peUV5/Xac+3VH3+f8k0xOyRgERGKt4QoVhFMzG0A==
X-Gm-Gg: ATEYQzzs0F4MEFCfRBLTKON1rdIwpIjmkzf96ejFNBBvfaSfoeAW0O1MRRe5c1mJn6h
	eUhVXsmwvIa9kEe8nrKbTRlEVpnu3QrmxHXX1j5SSI+thg6g8z7jDcfmwtZa2PKGmJ9asEH4Yzk
	qDlLD7GEZy9rrD7nCvExPf4/MrpxkgKKj5bip+19Yzby/hSUl/AJWtFvgPq3nQY47Pp6wied70h
	9tZfZ1UnJvITyZLOMPrfNMWUCoVuOaT3hjK2KTyFqKVWMwSc3rGlO1XbpOluS76VBK0ZO+KcOkm
	KRMFV+I06L8QjGmyxP14j8vfshbm4/65omeCYMK0M0H3YqnJ1uNxRLPpRWowLLlni/QnhAiWgIw
	T28KC7cf1N91eiKUv7qOACtWCGmR2nzbTibZw3wB5dmnGUKKpRuncrp2Q
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr1560336637.56.1772616911557;
        Wed, 04 Mar 2026 01:35:11 -0800 (PST)
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr1560306637.56.1772616910991;
        Wed, 04 Mar 2026 01:35:10 -0800 (PST)
Message-ID: <9aa4c1d3-713e-4137-8042-a73bea8e8f34@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] of: Respect #{iommu,msi}-cells in maps
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
 <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
 <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gl-nuMCTUihnsaDRqu-7thYD4wiimU3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX7Y/fPWeiWDGa
 IYW3syFEoAjVe2OtnCmYrrVwMdOB3HtTeamV19XnP5jQRTtiGLo0dw1tS1zxz3Kp01dXGkgQ1Ww
 2VtVf7W8zd2sjH1WXROe1npXT5FK306XWno2i6MSvJmMyxdQD9U0o3FJ2lKoZNFymGPvBrnNkkE
 k2GgfOE78hXeA7pbIQUJEJBit8k3lFivTYBdwcRuX/EUplZ4d0sM8nGbbADmJInPxqIheV+zDdn
 b14Kn6AH6AM5jV4n5vMbmhhfVxUJasusSY9QvbmPqMdn3G3EXEDo3faXwDnWfPYg+edrBgvAg47
 ec6EGz3oW1C0yls1J/UdRESo2yODBpWlQM6yoQlAzrv5ak1x5FDBNwTeSYvcaWXvzOF3bIH5hlo
 /YRFzoNeyri4v9cCBBFYfpA5txkyxjPDZv/mPmJxP/WJGU0mwyLgV2uUKQl2wJXv+2pL27SjKUE
 Ge6CFGWgeXABRORpKFg==
X-Proofpoint-ORIG-GUID: gl-nuMCTUihnsaDRqu-7thYD4wiimU3o
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a7fcd0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=FlLgGEtdp7AnL9SkOqcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040072
X-Rspamd-Queue-Id: C1C3F1FDB06
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,arm.com:email,qualcomm.com:dkim,qualcomm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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



On 3/1/2026 3:44 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:21PM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use in being able to map at least single
>> input IDs to multi-cell output specifiers (and properly support 0-cell
>> outputs as well), add support for properly parsing and using the target
>> nodes' #cells values, albeit with the unfortunate complication of still
>> having to work around expectations of the old behaviour too.
>>
>> Since there are multi-cell output specifiers, the callers of of_map_id()
>> may need to get the exact cell output value for further processing.
>> Added support for that part --charan
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c |   2 +-
>>  drivers/of/base.c        | 117 +++++++++++++++++++++++++++++++++++++----------
>>  include/linux/of.h       |  16 +++----
>>  3 files changed, 102 insertions(+), 33 deletions(-)
>>
> 
>>  /**
>>   * of_map_id - Translate an ID through a downstream mapping.
>>   * @np: root complex device node.
>>   * @id: device ID to map.
>>   * @map_name: property name of the map to use.
>> + * @cells_name: property name of target specifier cells.
>>   * @map_mask_name: optional property name of the mask to use.
>>   * @arg: of_phandle_args structure,
>>   *	which includes:
>> @@ -2118,18 +2145,19 @@ int of_find_last_cache_level(unsigned int cpu)
>>   *
>>   * Return: 0 on success or a standard error code on failure.
>>   */
>> -int of_map_id(const struct device_node *np, u32 id,
>> -	       const char *map_name, const char *map_mask_name,
>> -	       struct of_phandle_args *arg)
>> +int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>> +	      const char *cells_name, const char *map_mask_name,
>> +	      struct of_phandle_args *arg)
> 
> Some extra whitespace-related noise in here. Last line wasn't changed,
> so there is no need to touch it.
> 

Thanks for pointing this, Will fix it in next series.

>>  {
>>  	u32 map_mask, masked_id;
>> -	int map_len;
>> +	int map_bytes, map_len, offset = 0;
>> +	bool bad_map = false;
>>  	const __be32 *map = NULL;
>>  
>>  	if (!np || !map_name || !arg)
>>  		return -EINVAL;
>>  
>> -	map = of_get_property(np, map_name, &map_len);
>> +	map = of_get_property(np, map_name, &map_bytes);
>>  	if (!map) {
>>  		if (arg->np)
>>  			return -ENODEV;
>> @@ -2138,11 +2166,9 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		return 0;
>>  	}
>>  
>> -	if (!map_len || map_len % (4 * sizeof(*map))) {
>> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
>> -			map_name, map_len);
>> -		return -EINVAL;
>> -	}
>> +	if (map_bytes % sizeof(*map))
>> +		goto err_map_len;
>> +	map_len = map_bytes / sizeof(*map);
>>  
>>  	/* The default is to select all bits. */
>>  	map_mask = 0xffffffff;
>> @@ -2155,27 +2181,63 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		of_property_read_u32(np, map_mask_name, &map_mask);
>>  
>>  	masked_id = map_mask & id;
>> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
>> +
>> +	while (offset < map_len) {
>>  		struct device_node *phandle_node;
>> -		u32 id_base = be32_to_cpup(map + 0);
>> -		u32 phandle = be32_to_cpup(map + 1);
>> -		u32 out_base = be32_to_cpup(map + 2);
>> -		u32 id_len = be32_to_cpup(map + 3);
>> +		u32 id_base, phandle, id_len, id_off, cells = 0;
>> +		const __be32 *out_base;
>> +
>> +		if (map_len - offset < 2)
>> +			goto err_map_len;
>> +
>> +		id_base = be32_to_cpup(map + offset);
>>  
>>  		if (id_base & ~map_mask) {
>> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
>> -				np, map_name, map_name,
>> -				map_mask, id_base);
>> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
>> +			       np, map_name, map_mask_name, map_mask, id_base);
>>  			return -EFAULT;
>>  		}
>>  
>> -		if (masked_id < id_base || masked_id >= id_base + id_len)
>> -			continue;
>> -
>> +		phandle = be32_to_cpup(map + offset + 1);
>>  		phandle_node = of_find_node_by_phandle(phandle);
>>  		if (!phandle_node)
>>  			return -ENODEV;
>>  
>> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>> +			return -EINVAL;
>> +		}
> 
> This will trigger the cells_name property check even if later we
> discover that we have a "bad" map. Is it intended / required?
> 

It’s intended. We need the cells value here because determining whether
a map is “bad” depends on it, as mentioned in description of of_check_bad_map
this is specifically for the case where the DT has an iommu-map pointing to
a 2‑cell IOMMU node but only provides 1 cell in the map entry.

>> +
>> +		if (map_len - offset < 3 + cells)
> 
> of_node_put(phandle_node);
> 
>> +			goto err_map_len;
>> +
>> +		if (offset == 0 && cells == 2) {
> 
> ... if it's not required, then the bad_map check can be moved before the
> loop.
> 

Given that, the bad_map check can’t be moved before the loop, because we only
call of_check_bad_map() when cells == 2.

>> +			bad_map = of_check_bad_map(map, map_len);
>> +			if (bad_map) {
>> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
>> +					     np, map_name, cells_name);
>> +				cells = 1;
>> +			}
>> +		}
>> +
>> +		out_base = map + offset + 2;
>> +		offset += 3 + cells;
>> +
>> +		id_len = be32_to_cpup(map + offset - 1);
>> +		if (id_len > 1 && cells > 1) {
>> +			/*
>> +			 * With 1 output cell we reasonably assume its value
>> +			 * has a linear relationship to the input; with more,
>> +			 * we'd need help from the provider to know what to do.
>> +			 */
>> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
>> +			       np, map_name, id_len, cells);
>> +			return -EINVAL;
>> +		}
>> +		id_off = masked_id - id_base;
>> +		if (masked_id < id_base || id_off >= id_len)
>> +			continue;
>> +
>>  		if (arg->np)
>>  			of_node_put(phandle_node);
>>  		else
>> @@ -2184,11 +2246,14 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		if (arg->np != phandle_node)
>>  			continue;
>>  
>> -		arg->args[0] = masked_id - id_base + out_base;
>> +		for (int i = 0; i < cells; i++)
>> +			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
>> +
>> +		arg->args_count = cells;
>>  
>>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>> -			np, map_name, map_mask, id_base, out_base,
>> -			id_len, id, masked_id - id_base + out_base);
>> +			 np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>> +			 id_len, id, id_off + be32_to_cpup(out_base));
> 
> Again, having whitespace changes doesn't simplify reviewing.
> 

Will fix this in next series.

Thanks,
Vijay
>>  		return 0;
>>  	}
>>  
>> @@ -2198,5 +2263,9 @@ int of_map_id(const struct device_node *np, u32 id,
>>  	/* Bypasses translation */
>>  	arg->args[0] = id;
>>  	return 0;
>> +
>> +err_map_len:
>> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>> +	return -EINVAL;
>>  }
>>  EXPORT_SYMBOL_GPL(of_map_id);
> 


