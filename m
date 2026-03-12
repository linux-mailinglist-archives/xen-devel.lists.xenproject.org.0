Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KFqFqGmsmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:42:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2762712AF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252167.1548941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eQh-0005zF-AN; Thu, 12 Mar 2026 11:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252167.1548941; Thu, 12 Mar 2026 11:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eQh-0005wP-76; Thu, 12 Mar 2026 11:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1252167;
 Thu, 12 Mar 2026 11:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DV6w=BM=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1w0eQg-0005h8-8X
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:42:14 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8232573f-1e08-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:42:13 +0100 (CET)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62C9Yd9C4025894
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:42:11 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50swqs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2adc527eaf5so7701925ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:42:11 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
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
X-Inumbo-ID: 8232573f-1e08-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=; b=P5phZrdji2XNB1A7
	dTTi/RsItP2yc1RU394FYJtIegEYWxTNyrkQb0nAwMYAKmSD8GZ0IhcKP0iEn39T
	gPpRZjfwGbi1uO32Yfl3TFFBlGMioBr9HyrKxTKT8kBqhEkU2yEOd8CFcf6t9eyv
	CqE9kdZD7mCqzR8uNPVT4RBKJOpmu73ReHRA/EkhWeGpxE2vkNMzto6iDdQJgujY
	LOGl+LoKIbBfmjlUgTd3w3s3q1mw3x1d3hdxAvi6MWs7VO5s+YYappVus92gUf+M
	U2peZk8AIN/AUUgB+VjEDiVd6wpnW54pw9QdSIRCsBJQQnWWpQcwYQoQm+ZwhEgs
	wMOK5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315730; x=1773920530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=DL+61k1o1sp056Z6Uc7h7v+SRET/lztzVyc9lMKIKL+YFh4kLmONU070IZACvYeOhL
         As8sZza9hw9CZFG4TCItIie2L0pBMWnMkurYs7eKql8K3DhSzvm00FpJLUD5i1X+8K58
         po6kc7NHBzBo4XHtKET25GVzP2FcK5B/iQMZHzBWY5sKk5T5g6fOY0bxqjseVvfCebOh
         qOkYVcmQGSvjHwLN14enPABVXLD3mZc6VNMxulxJ1OFsZ8Ntc87UZbhJnyIc9CEasAYx
         2pCCizUvO8gLMya1HdbNRa+WM0gZOys/TL7rU0OE3d7OKhXKDVxkOYsWH2uPhlE8+uKJ
         f32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315730; x=1773920530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=qANVhPdGZOxdlFX+b2iBFPZ476xpmK44yYsQsfhhK4tipuoOOXl/v8+GbqfBCveues
         a1KUGCIXXQ4ivPaseBoDe2UQ59b6D1FwdWnC7qCT87+0B8WNXGWmwIjhpKjACZj9o7PH
         lYHjoMEIK5s9QUPhGqKzJsvmPj7KuTUwR0TQE1kVRyZ2x0EUcv1g+EWVBU8GpGMci+au
         ZrKb8rWW43bgmWqwEFaC1aj3FroG6gcMwLXX+4g9N1iQB6PZL7BBd9JO4ZGCJ60kaU9V
         YJOl1PeC6PY0fI/jnY090IXEstNiqC03Di7PCmIFKTY10SY/zahI+b0vw5pf1Y4vyc6U
         jOog==
X-Forwarded-Encrypted: i=1; AJvYcCWIyeItdiNbXaLfdbvwLOLHKJmMwf0f+I/PIu3uDoqNJeRITWnDCLOexiDZ32OB0HoVNM1pObzpm8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLdfNUb6aPyAkgwY9od6zVPLcpaBnZfMAMi/36WzjzxvF5MBlJ
	986g9cIYIUjXolIA/FutdS1DpOtN8ckAsUq8coKecI9qucNCcx/NbfGX5nOZxA3pDWzMGnZ23yC
	2lk4OYMeBy29Fq40+UgLsRxWiI+swAU7q2dYDqxUPT8mLbwZnt+O6tSlO8Ue+cjLM5vLq8g==
X-Gm-Gg: ATEYQzyxOZNO8ysCYHSjXxUDg47Poe7Y5n4TgPwQNW5S9P/cwLxlr07EHG/lsou4s3x
	fOCb9tbfas4uk/OyS7axQJoBRq6KywH7A7mKQr3KC80evOtSjlTohUIXwBtvnm0SuAd8xUaTa6q
	EDN/ALNE4OVEJ+SyU9Qsjrm5wBEkvDk1yZtckDr5rF8Af0LrPqq+EIbBmvwpisFdICAweXNe7DT
	A+XJasYti2lbUc/5A3EMaNlXJ8ZjbAGkCfBkPgSJIIDoPccEMuInGJSYEz9KpB44gyDMrtrNPjd
	SuYV4iH4POW72YLSK29qe5JlU2A/GS4wtGWT5bIyp0gzKU+kYxi3FMIaIt6xCuXP9o9h29RTGpM
	SjhfWAViHb9/PF6kwshQ+mCUO/SbnS6HvdYPu24JXLRMs05/8U8z1dyv9ag==
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54674275ad.57.1773315730446;
        Thu, 12 Mar 2026 04:42:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54673835ad.57.1773315729939;
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Message-ID: <ce25b963-0e8e-4411-a406-7b466eadb1f9@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:11:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
To: Bjorn Helgaas <helgaas@kernel.org>
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
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260309210506.GA589665@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210506.GA589665@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sh7rxbXagaDByQQEAdQ1b1ahHIewXRnF
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2a693 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Iq-Xo7JqGUrbNy38CdcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Sh7rxbXagaDByQQEAdQ1b1ahHIewXRnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX5nfzaf1IoEfJ
 aQ/hXsO0ozsYGz0N6PpCowcQWtr8yBmioZtUqnhSYjtx9uzXGu0vZ8F07+MKJD9YfWpsiNtYTtm
 93eFuD9lssw35aGbFT67NvnA+HZOK1eTlCCtkQj18phdC5BZvu+g2P3l8wcmHcUYNXW8DVNyn2u
 kNx2Uo1FwIRbp1CQ+UeMjz/EdadxaQN/fJU1qstPo6BT5MHQT+MeH8MtQIqe1ewr/ZPpcEOCwFm
 dnLQ0sA4ZS3YxhRin74XJJ4i1Cw1xOUhz3+F3uI4ksieFGAJA/0b/s0S1aTXNSBoShs5Nz/vZXd
 XcFFkvKzVmMNfDWCHS42hC/qFkEi27Ynqye1HoB3cum9c3zS3PJ/GXY7tQ2lZsKFYyTF6uHXLA0
 yAuoQo6SUZG+gitM559ne4GJ3nkE4v9J9qbeM8YrFnpn/b1mJ9yuAoAhRzVCBiGSTaF7/lFuwmX
 5HvNeuMaoXeraCblD5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120092
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@os
 s.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 0E2762712AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 2:35 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:36AM +0530, Vijayanand Jitta wrote:
>> ...
> 
>> Charan Teja Kalla (1):
>>       of: factor arguments passed to of_map_id() into a struct
> 
> Please make this subject line match the capitalization of those below,
> i.e., "of: Factor arguments ..."
> 

Sure, I'll update it.

Thanks,
Vijay

>> Robin Murphy (2):
>>       of: Add convenience wrappers for of_map_id()
>>       of: Respect #{iommu,msi}-cells in maps


