Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGxbNXJrDWqHxAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 10:06:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4D58960D
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 10:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313694.1583811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbwF-00040Y-Th; Wed, 20 May 2026 08:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313694.1583811; Wed, 20 May 2026 08:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbwF-0003yk-Q7; Wed, 20 May 2026 08:05:59 +0000
Received: by outflank-mailman (input) for mailman id 1313694;
 Wed, 20 May 2026 08:05:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wPbwD-0003yb-NV
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:05:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPbwD-00353W-3J
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:05:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a0d6b5f-2eae-0a2a0a5409dd-0a2a4506b4aa-16
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:05:56 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a0d6b62-7371-0a2a45060019-cddca88386aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:05:56 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K7Z6L4629753
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:05:54 GMT
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nur5d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:05:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c82ba4715b6so4808960a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:05:54 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb11683fsm18637582a12.26.2026.05.20.01.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 01:05:52 -0700 (PDT)
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
	h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=; b=ZaRSheFuPELGrHrU
	5bq5fVMfyqResKiQ70JQ9GcmVcwVO++BNdtAGa8VE2RcuXKOS1fdXMzwTJtDbph5
	Kdz4noyWWRWd6d23UxPQMSbSlVPYhaCaEpU8/dR7MIrPBCAKu4u2eeLWD7A9h8Ru
	U3reVb2kI1+5mBFvP29oQxg4eDYm25BSrQS33OCcAsX2dxLWXMzwkxEAzAllr/T5
	SbMuaMtk4zoKuAm4QahqJUCu0TasoEKPmouhj+BzAYKQPlph23Nquuv+5EWqtMuO
	plY7E2DXbNgLQ53IfLC/cnaAcIDD30ZwYB/zcqQY/p+D8n8MDMmrXgdUON6gqfI7
	uk+kjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264354; x=1779869154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=Wz18DJLibymhAWuJX1rNdsy3JgQLYghh/o593ZUNsMEVcJjLpnB67O6GGmvjCyWiE9
         z+X3hXaKEjGgeNlJnUQGVXs+U71L8sLqkkWnB6uCotYIs/4Mvlyh0/ZHDOxjN+skcgKb
         hXNRktvlzG7v368S2XqnIlhfF3/xekfGF9/cybKCD/4jhBBqGiJ21uZhnHDa/N6FXRjx
         hcEVJwMUiStqRXlM9yUxo6iF0s+shNH12po2CAWGJ+he/qcmt4m4Rwvi0OkKiogp188u
         9jC+2w6W0wgjZszNIOi5QARjhqtk7hKg+BBnnpi9cu0qr0tmRj6uJzU0zfc2bkTO94cS
         w3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264354; x=1779869154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4o4tguLJ2M8UFVCSQAOmrgjGYGYAaNNp+BkOJSYljs=;
        b=IDhw6fdsEWXG9sRRZV27/cW5oS0b+BwW4kLogMC9rmWbmXHLa98L1lDaZ15ZOJsett
         cpj/qDQZ1OsrCIFNWjADt7UOassqziKdTg0KE+zcXTKRuh7xMrzSs4KGmoil3SE76aIU
         ujs+9l9n4WNbvoW8CoonAhXUF4K7F0wQuF9o+Hu8xkuNFEHIAwNyyGCX2FhTgwe7mR1W
         v2bWnnqojpl2xRn8nVteGnEgKoyojHR8T8TYe2ByPF+1W/kd8N8veLcgOEf/Gh1d/uzP
         cSY0JnS8yM9ISuwKjUq7htt6kiqd1goZ6KUzGcBgbgJBdAki5bMqMswcFYXrV67xcKzb
         lMVg==
X-Forwarded-Encrypted: i=1; AFNElJ9vmHMxIKp6GPIAErNgKld7+cdLfE9p8irg7n78Na7fYsM9omM2ULnn8r1V9ymbkxeWWXCVfGumRog=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXqiyCscgqs1yfn3gjAw3LKoz6k59r0xu0hegShd6ftcF8FXKX
	c2Ux3YfpiSVzGAYV2jpjBVz2BxVnnWe+x6+su0rg1r/GyvHkBVIi1OagZs2YEQepS7ykYqHGjXj
	HiQ+a067M2duN0jTZYyNuXq5Hd7RLZc1FxJVfll8fsHRHOLLYWqrhc+WRzpvTEisHehTZng==
X-Gm-Gg: Acq92OGn2AFAyP6djNga4R4lZ/68E/HOCV7nFRu4EDNSRnnIVTwyCVq0JorlD6Adg1g
	qZxhpZqh77uv+hKtbP1kGZGzh1PvPgs47w7XDzHnnDeUKscSMH5DtlbQkU6e4AxHWD0yRMepcXr
	SBK4Q1tIWciwCj/5I9OFyLvI7S06vumldBvXesHspjJzu8rT13G8FauIIDdmpRWySNDK8YmhJmn
	Hi9QJE8xQcJwOXJsG8rzHy51dsMt7eDjjT3jHq2bz6WOsQ28xkiIptRiz9hd3LmtiZjl3WWrD6F
	FRLcXfJ3SjkoU6UxStsOq/CgHAppOekKfQE86bVuJIFKx0lk2G41133IdAK8EFlK4RfDKeC65Ut
	rhbNEWitSumTDoltAyfRtI2MoMkSmVx6YeoCmdToXLl0/ar7t3qdkU6LzckARgOQ368E=
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955115637.50.1779264353644;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9f:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3b22ecb031amr25955066637.50.1779264353199;
        Wed, 20 May 2026 01:05:53 -0700 (PDT)
Message-ID: <11b91838-9b24-4a62-8760-fdeb3703afc4@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:35:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Rob Herring <robh@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
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
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
 <20260506221915.GA3290640-robh@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260506221915.GA3290640-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX+aM4afpsp/wZ
 YJiY6BhZzXEmIVwbienWjat6KeyMU0US7xxff90viZIFVhCg5SihNsl+7xUmDvp4Cc80w5AXSKV
 5R1F5u9y0NfOkV2Lv+4gqSZN8R3OPWRnVXsdU1qwaEwc4J4F/7Be1GvBPhprMgeEBhR4Rv/RITf
 YZ2ufh3hKDp6zBBeGssZqJH/oDOQyCQmxTNOgSUjgzVDVHyh8Y8N7VgeS7GIbJ4Rv/l18qvvYCs
 pQaPTTVo99RAlnohCC5WJvigeMDvXc2XXi5xrl6W72lWTCUfR5qoF4nDF2pqGnBl12QjR3oEfez
 e4tmpVh6Esqfq1m7aSKRHBdQEoiOdDUIjIw1yvN7zNhGXOAiPb/PvgfhaqPqm6xU12+5YwG2t6H
 zr0Pkmx+MyttbklG1jl2U3z1g4XEtQFcvYtLOBA3u4B1pB1y0EUO9TpJjD/yXnPVyaAq12zVFFr
 rsmzkUlvQvnhw/G07Xw==
X-Proofpoint-GUID: zEeL0ux16ZTk98mKvaRsx4xv_rt-TteS
X-Proofpoint-ORIG-GUID: zEeL0ux16ZTk98mKvaRsx4xv_rt-TteS
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d6b62 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zmrd7r8un3QtD10oEDQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200076
X-purgate-ID: tlsNG-16d1c6/1779264356-8FD7AD75-E81BF915/0/0
X-purgate-type: clean
X-purgate-size: 1756
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sashiko.dev:url,qualcomm.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 39F4D58960D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/7/2026 3:49 AM, Rob Herring wrote:
> On Fri, Apr 24, 2026 at 11:26:07AM +0530, Vijayanand Jitta wrote:
>> So far our parsing of {iommu,msi}-map properties has always blindly
>> assumed that the output specifiers will always have exactly 1 cell.
>> This typically does happen to be the case, but is not actually enforced
>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>> cells) - as a result we've now ended up with dodgy DTs out in the field
>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>> provider, despite that being bogus per the bindings themselves.
>>
>> Since there is some potential use[1] in being able to map at least
>> single input IDs to multi-cell output specifiers (and properly support
>> 0-cell outputs as well), add support for properly parsing and using the
>> target nodes' #cells values, albeit with the unfortunate complication of
>> still having to work around expectations of the old behaviour too.
>> 							-- Robin.
>>
>> Unlike single #{}-cell, it is complex to establish a linear relation
>> between input 'id' and output specifier for multi-cell properties, thus
>> it is always expected that len never going to be > 1.
>>
>> These changes have been tested on QEMU for the arm64 architecture.
>>
>> Since, this would also need update in dt-schema, raised PR[2] for the
>> same.
> 
> Sashiko has some thoughts on the series:
> 
> https://sashiko.dev/#/patchset/20260424-parse_iommu_cells-v14-0-fd02f11b6c38%40oss.qualcomm.com
> 
> Rob

Thanks for the feedback, I have Posted v15 addressing comments from Sashiko.

v15: https://lore.kernel.org/all/20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com/

Thanks,
Vijay

