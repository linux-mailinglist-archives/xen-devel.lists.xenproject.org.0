Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDZBJkNX4GnyfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 05:28:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6F409F6B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 05:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282958.1565290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDDNO-00080a-BR; Thu, 16 Apr 2026 03:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282958.1565290; Thu, 16 Apr 2026 03:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDDNO-0007xa-4e; Thu, 16 Apr 2026 03:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1282958;
 Thu, 16 Apr 2026 03:26:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wDDNM-0007xU-RT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 03:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDDNL-00Gn7I-GX
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 05:26:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69e056d0-e002-0a2a0a5209dd-0a2a4501af84-22
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:26:43 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69e056f1-c1f2-0a2a45010019-cddca88395ca-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:26:42 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63G0UTZQ2834981
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 03:26:40 GMT
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvj3fr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 03:26:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-82f2478c37bso6176814b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 20:26:40 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f6707b6b8sm4265094b3a.22.2026.04.15.20.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 20:26:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDK6pAlGwxYE897uZGp1sSM8FaPwo0OHKjiLMvDJlSM=; b=SWY9Qd3WKivoaF5z
	JCNUWFn6lHYDHyOuTykCB5IdRbNsUrvJXHcbkMpoXZzEFaGmmiVh4/iNs5m2m3/d
	1ctBxyEGpnQhAu31duNagl7MvxO6Dphq86jgT8s1bddtRVBYt5aiZvC0Q06xHb4f
	pJ5mQ251/oFa31hOjocFi81oL7nTanhTsaxGMhiRvRj3+79HdoaaaOzK6DQpIlj8
	DMKRTns25lEdApCluihx1mohx8vnRlScMBm04DII0VQ2demD5TuPnhQ0Qu4l9aQk
	+r4A6uDr4avQHRyxxypoO1lgUgcJ9ZoXxMNexwA1OoF0Yg1Uo5d1Y4vVKNY0rEpu
	3CT5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776310000; x=1776914800; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDK6pAlGwxYE897uZGp1sSM8FaPwo0OHKjiLMvDJlSM=;
        b=hwFvBdHvLdqB6TUnyx1q8nwzoCCm/VUE4GicCwVwSIValWezyP30/w3rvnrlOwzKtB
         NbhCD8RLQCL7TJiJnr2TzV+6bQ8BW2RoPZjLZOlmplmew6hXiU1n3G70FtX6URX2RjXj
         gSByxuybyuk/fPFtBsa2zgfstVnyCxo3Ht/OgFxgSdDP8vqB+1Ud1K3z0MT5N1GjPBkP
         giItmh5xSvNu62+f3Jyk6da5BQFfJjiNyEy+OfvrarML9uhT8X6WDTO00ksARdd5iKNy
         rkhsHS/+0QaNBnnCl8in/8UdKFtGbVIaUbky2wx3+9ywLT7xX5BeO71MN38TCqNHZ+c6
         4mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776310000; x=1776914800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDK6pAlGwxYE897uZGp1sSM8FaPwo0OHKjiLMvDJlSM=;
        b=FR3RjQd9CeiHbJzQ/t3AGyHsOj9lTdOTwexUaZWSojcRoJZAhG9ExiN2GRdRST4eye
         +wpplwtFXdQXDm6fFu+JnPaEbl+s8GpRMZVHD3i5Mi07FaTFxEkN2l4yvTWiX5gW2lK3
         fNE+cmffP02yFigwsH5216UuyRrY88irl+QZN1EoFjM8vcj4WA2wKOWYQBeqJD05MBfy
         7KpqUID2wxo00N5lK4T+v8viyanXBKrzC+Cual6+IBQUa33vSs1bfNIQm9AnnPxiJKjP
         otSUnb8NDjNPX84hmWDMV8H9G7kyw8X6hcfFbsXzgzUBpB7p3VN0wxiZ2MLtsLD38Ig6
         kd1g==
X-Forwarded-Encrypted: i=1; AFNElJ/ScQ1+c+V9448J8kSS+1Qz4zFd25KjBVt5t0U/A/OPZXpMY8f4zaTZuCnqcTENfAavTlDqxLXhTv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMJkuxHebQarb0SDNXpc8GeClIArWxoPQA19ri91J/jiT4Kolb
	Hy0iY5ZuQtRK3Cg08OhVUxvjHAfyHiegUnrs9Nm0Q+qs0C32nzzPjqIhqFLtkhVsgSJ4ziss32T
	qXyVGAIl0kqzYS8eryK0X5A1wKaahD/JxbU4VU7YRqDFAD8cLk1bPLKOkO1vnpkp/sCHZQg==
X-Gm-Gg: AeBDietEzj6JIhQ+GuKX1kHt/PsSgY5oUsTePgC9jUxYzmq9wsgFny9OU5eX6SUihj+
	aRthhPg+WI4bwQszG6rTV53T6NqK9cLMDa/fdKfpQ7Uig40u3lTmZr+JqwJz+C1SIOQV49N2UMv
	vvX9h39etUmX4hMWYAsvKFkHd4Cy0mDJeu338dunlLO71/Duk6o9xSR3oGNRLpP0yQ4fjzwevkG
	2uEWHv8gpt6bYNBij4K4URvbfqHKp7drfRnjR42+JgDnSalFabbqEsp8oQ8Qxq6Uk2iz5W/hA1j
	WXMO5iFc62D0zkaFOiN06kstBj4BEeo2X0iOYBaX9Jgud50K/jFPqTcZlMI7Xtv/vJ+C2eZ1UH1
	Gy4oh8w9J4vWK+OFkOiVamOTlLxqnED0Ivd4hDpL4vpqQ6QgrfAVUjzxd
X-Received: by 2002:a05:6a00:3924:b0:82c:77cd:50e8 with SMTP id d2e1a72fcca58-82f0c30f593mr23470678b3a.27.1776309999733;
        Wed, 15 Apr 2026 20:26:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3924:b0:82c:77cd:50e8 with SMTP id d2e1a72fcca58-82f0c30f593mr23470629b3a.27.1776309999089;
        Wed, 15 Apr 2026 20:26:39 -0700 (PDT)
Message-ID: <555b2695-1feb-482b-aec2-d6f3f2b2ef0e@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 08:56:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/3] of: Respect #{iommu,msi}-cells in maps
To: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
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
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
 <20260408-parse_iommu_cells-v13-3-fa921e92661b@oss.qualcomm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260408-parse_iommu_cells-v13-3-fa921e92661b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6O7hIPU-KsNlEwkCnCKDetfjLj9HUHBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyOSBTYWx0ZWRfX1dbmOrPr6IHL
 xhT7bbt8Wy+vx7CLhftFT6xSqiHtwqsfjL/h0paqvJKvmXWH1Wi6B5YBNpgFaCXVt6vMQjW1JXI
 IQqLSZk3H/LbAoN0/6/DWMkCOnGYQQkCBLruWOuLdaYME+J6o/d5lMTQR66TEUn3eXKCjiTVXdl
 SVG/xjmg3oep92fjSmQUJicqTiPLfqaxYopRB6Z23deV+WTpVgW9vn6B6uwGJclsFg4ZzQ7E/eF
 YGjpWGRJJOxxiI6UBZbJ7kICbFbqodrAz5zz4SmUlOIF2UFZdTRelaFc7xjjKEQhGev9xDeUnRV
 PW1VtPMvvC3BYiEaA9KJjognlqxoia2s/Fyej9n5411MFQz/hoD1/quWPEk9SsOcPO9lvcZ6Nmc
 4TmdrbhOfxSlNiDcrK9/ua7kUACo0ss0k5Cgd9nF31pJ3+1rF3M+73BLUsOzc12z3DA+j+zxWv2
 gJL5ZRcn1mcaVmWhsqg==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69e056f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=OsyBWCJeBE2wmg0BnjgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 6O7hIPU-KsNlEwkCnCKDetfjLj9HUHBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160029
X-purgate-ID: tlsNG-d62444/1776310003-B6C7CFF4-926DCFCE/0/0
X-purgate-type: clean
X-purgate-size: 12762
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 31A6F409F6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 3:33 PM, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properties has always blindly
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
> Update of_map_id() to set args_count in the output to reflect the actual
> number of output specifier cells.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/of/base.c  | 157 +++++++++++++++++++++++++++++++++++++++++------------
>  include/linux/of.h |   6 +-
>  2 files changed, 125 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b3d002015192..2554e4f1a181 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2096,18 +2096,48 @@ int of_find_last_cache_level(unsigned int cpu)
>  	return cache_level;
>  }
>  
> +/*
> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> + * specifying only 1 cell. Fortunately they all consist of value '1'
> + * as the 2nd cell entry with the same target, so check for that pattern.
> + *
> + * Example:
> + *	IOMMU node:
> + *		#iommu-cells = <2>;
> + *
> + *	Device node:
> + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> + *			    <0x0100 &smmu 0x0100 0x1>;
> + */
> +static bool of_check_bad_map(const __be32 *map, int len)
> +{
> +	__be32 phandle = map[1];
> +
> +	if (len % 4)
> +		return false;
> +	for (int i = 0; i < len; i += 4) {
> +		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
> +			return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * of_map_id - Translate an ID through a downstream mapping.
>   * @np: root complex device node.
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>   * @map_mask_name: optional property name of the mask to use.
>   * @filter_np: optional device node to filter matches by, or NULL to match any.
>   *	If non-NULL, only map entries targeting this node will be matched.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] will contain the translated ID. If a map entry was
> - *	matched, @arg->np will be set to the target node with a reference
> - *	held that the caller must release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	as defined by @cells_name in the target node, and
> + *	@arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np will be set
> + *	to the target node with a reference held that the caller must release
> + *	with of_node_put().
>   *
>   * Given a device ID, look up the appropriate implementation-defined
>   * platform ID and/or the target device which receives transactions on that
> @@ -2116,17 +2146,19 @@ int of_find_last_cache_level(unsigned int cpu)
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>  	       const struct device_node *filter_np, struct of_phandle_args *arg)
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
>  		if (filter_np)
>  			return -ENODEV;
> @@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
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
> @@ -2153,39 +2183,84 @@ int of_map_id(const struct device_node *np, u32 id,
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
> +		if (bad_map) {
> +			cells = 1;
> +		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +
> +		if (map_len - offset < 3 + cells) {
> +			of_node_put(phandle_node);
> +			goto err_map_len;
> +		}
> +
> +		if (offset == 0 && cells == 2) {
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
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len) {
> +			of_node_put(phandle_node);
> +			continue;
> +		}
> +
>  		if (filter_np && filter_np != phandle_node) {
>  			of_node_put(phandle_node);
>  			continue;
>  		}
>  
>  		arg->np = phandle_node;
> -		arg->args[0] = masked_id - id_base + out_base;
> -		arg->args_count = 1;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
> +		arg->args_count = cells;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
> +			id_len, id, id_off + be32_to_cpup(out_base));
>  		return 0;
>  	}
>  
> @@ -2196,6 +2271,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	arg->args[0] = id;
>  	arg->args_count = 1;
>  	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
>  
> @@ -2205,18 +2284,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
>   * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
>   *      stream/device ID) used as the lookup key in the iommu-map table.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>   *
> - * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
> + * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
> + * and "iommu-map-mask".
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_iommu_id(const struct device_node *np, u32 id,
>  		    struct of_phandle_args *arg)
>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
> +	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
>  }
>  EXPORT_SYMBOL_GPL(of_map_iommu_id);
>  
> @@ -2229,17 +2311,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
>   *	to match any. If non-NULL, only map entries targeting this node will
>   *	be matched.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>   *
> - * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
> + * and "msi-map-mask".
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_msi_id(const struct device_node *np, u32 id,
>  		  const struct device_node *filter_np, struct of_phandle_args *arg)
>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
> +	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
>  }
>  EXPORT_SYMBOL_GPL(of_map_msi_id);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 8548cd9eb4f1..51ac8539f2c3 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
>  bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>  	       const struct device_node *filter_np, struct of_phandle_args *arg);
>  
>  int of_map_iommu_id(const struct device_node *np, u32 id,
> @@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  }
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
> -			     const char *map_name, const char *map_mask_name,
> +			     const char *map_name, const char *cells_name,
> +			     const char *map_mask_name,
>  			     const struct device_node *filter_np,
>  			     struct of_phandle_args *arg)
>  {
> 

Gentle ping.

Thanks,
Vijay

