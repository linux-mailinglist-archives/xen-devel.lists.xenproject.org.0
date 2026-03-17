Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKhWCLCiuWmiLQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 19:51:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED12B135A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 19:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256204.1550923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2ZUj-00061E-IC; Tue, 17 Mar 2026 18:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256204.1550923; Tue, 17 Mar 2026 18:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2ZUj-0005yg-CG; Tue, 17 Mar 2026 18:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1256204;
 Tue, 17 Mar 2026 17:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W07a=BR=oss.qualcomm.com=vikash.garodia@srs-se1.protection.inumbo.net>)
 id 1w2YLU-0005Fh-M2
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 17:36:44 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9189751-2227-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 18:36:37 +0100 (CET)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62HDo9r43124391
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 17:36:36 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbtb4f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 17:36:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2b064f043adso14753865ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 10:36:35 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b06e603937sm1236095ad.57.2026.03.17.10.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 10:36:33 -0700 (PDT)
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
X-Inumbo-ID: d9189751-2227-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zytiUP8Xce3T94fCwbA24WE4ff9eD1E8/ytUb5yxkwI=; b=DDNrKG6TBGPThpBu
	Qyx6FFRxPlo9Lsw9cg7D1U2tm8zxL8j42xvmYJAy8i0iWCAzgnYY0vH7Ul9raj6Z
	HwxUqbkaynZU+WVWdLr+MRDq4tz5iJzOfAFFTHtkdpJPhbSqh1/UMsdv4OMIufdB
	CvX5TsvYNSq4goCEBNHBJRVHgWt74xDg8XJsMHx9HGYEGWXYd4gS/ozpnjbkVYGC
	QnHJ/bTannKFVM7Z/DLt8BomcdqaqKYgFGrYJkse2i7sHtxmK6ZTs/FbkI1hFi3T
	brQEIdXMSyoL7duC5cni/eKj+yoGMQCFnf5reegtKcrLp16GOY3KvF58shbTVtD+
	sTIEqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773768995; x=1774373795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zytiUP8Xce3T94fCwbA24WE4ff9eD1E8/ytUb5yxkwI=;
        b=hS7d9xRjnFSCdhtqfR85hG83PvvAFNtD6MJyPGq45xAEh8q/75S2WfjQ+Ph8CtCx5/
         lALsaReg/ftrigfKLLWUa+oHGf/DX5LWMVy2ompDlITQyznSmlrW9lveDOFa6BzT30tr
         +ruWW3MwqoBUvSWzCHswIGg25fi86XykyCRoJuoewlw8Elah/FAFkPsmF13x/eLUzLH+
         UFzmNF5X1keSQj0NIBcVXnE0RKcKeobwh9OjkMPXF1okkncdPPv5kQeav7YBBhg82iWR
         q3fH6SIAMAgc4NvrSZ+NEHkkmauBkjWoiOJjMZdFWc97juFFOykKsJWxCvdS3Bxh9cOy
         qmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768995; x=1774373795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zytiUP8Xce3T94fCwbA24WE4ff9eD1E8/ytUb5yxkwI=;
        b=Mskr1XAizNqp3KgWLQJJL1203xjPy6g/ZdzpnrOZbkNtmwV5mX4YooFPcIBa25oDo0
         Ig1mkgmLF6xoRch9SS6wKFnfT8/ea19yIrM5DHXa8P8m4eN5i2HWqDoCItI4qbNiW5no
         QQlbEjJHKk0hlOHd4dzPAERJ3sK3rzfurE24EPUKOoyXv8aisbrxXj/0uAOiCT34WDTs
         KmAH4b3YoGp53E0cCzyAdkhEef4/irYIBMMdc1/d1Ytg24Fw2R8QapP9HWRF/F0K80YH
         43R1vw4UmVeaSSknv+95FlB3+EEUEYjUUEqNBg+5XzLSI8QNnGvHGbrsc9xRDKm+wgbG
         eOeg==
X-Forwarded-Encrypted: i=1; AJvYcCWDYRmt1wH7FFLdP1YOfcg5qsRRVCpNSD4UUqPZpEiKuE1FQQQHsTP/Q7YmVzgovTXCEivIDgiHolk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM0iqugFX0oyRaYjZn4ivdYt3/B6ylxjYjWXaYjQokJ8YXVkbB
	UAhhXr7Kn1UNxHhIdcINXc7CHo2Nug5RkJKYdQaWzp+T0MfUPtlenQlLAO3dlC9hhM/fxCidvkh
	C840kxqiUTOCUX63IEo4C8Y7T2E/nMa5/HV6HGAvljo5EpusO9e3N0xsVwiMhyJZx7hKqsA==
X-Gm-Gg: ATEYQzw2ZUZPg4Nd3PWFSFuaO6A/M5twXo7MIBAHCx9pP4ocdelkP/X7B9x1Lxg+xiG
	CQlasjHOwl6hnDHm3IVDYy/89i0h+rmgehhDTDY4k9yL1fCjTIAlPTcjj2N195Y7OYJwL58NLoy
	z2jh+fNAdBi1APGsZfHEcR6HIQfvp2ilU6i8nCvo14FOATGJySN86QcX96HKYUbTkJS5AC849Ah
	Z1p1jxJX0qfJsJLYkN3GEEkFJ829mF8DecCPij13IviGW9bCZVL4uQHmIUmcnKFXRxIJChY2mk2
	4Aq9BAG5jJO6fUS1oVGSD8eXNE1oulFHJzdvmBAYwgDtV9K0V9NY4pYCVdV4QF0i49iDkPoXFbQ
	a1gy5X3PXISyEsDa/GlY9kh+bMWS0X8VIPexGVzLP8k9ZRZMnSssophiv
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr2520795ad.43.1773768994518;
        Tue, 17 Mar 2026 10:36:34 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr2520265ad.43.1773768993782;
        Tue, 17 Mar 2026 10:36:33 -0700 (PDT)
Message-ID: <e2f5a1ab-2b1f-484c-b476-6c453abf0087@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 23:06:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of/iommu: support multiple iommu-map entries per input
 ID
To: Robin Murphy <robin.murphy@arm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
 <be41a533-46a8-411b-bf6c-d56b550691a7@arm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <be41a533-46a8-411b-bf6c-d56b550691a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V8CbklrlXHheyJtt7--f2BdRe-Jhv7Ex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NCBTYWx0ZWRfX2+kPkOArsTeO
 UZAJrFTnb0vJZj8UeIahaAVmxTHyctYJPoKUusydTKBnj4DTSE3s1DifQ8Sci0eG5bxrviizNcm
 ayoajurzXCxqdfIaL1FZKKje3OVRBVihnctZpW8sDIaxVqCbyKGqRF1phGyt1qaI32dGATlNywZ
 ye0A/EDcffhKm4L2pgr40pUP9Q7gzj1tu8r4eDNDW9PCroDeCXUNKSC2YVecGvKu8aXGK2COQo7
 ZdQ/kLdwPMxZvnMcCtGgFLxXorDKbXWJfii2WkWBTO5agrUhWdZUBM08MUf0qr1W7w1R3XuMMie
 GBgwHAooi/5atFqY9nC1vg2EpsNTH5cRFRIqpSany3X7UsXwiEd+glNEJHkk06+zDsF/i2p2lHp
 n31Ib5CEs5pK6QvWKamviiYf42TllZv9V6err98LPASVQVygw/WW6MsuW4pfigfu+4ooUvTVxbj
 RhWhsfYUdb6SXD/HnPA==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b99123 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=L0D9IIo8dDxUtxRzEGqq2w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dbrUTAiK8tO8QfTRFOUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V8CbklrlXHheyJtt7--f2BdRe-Jhv7Ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170154
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:maz@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,iommu_spec.np:url];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_TO(0.00)[arm.com,oss.qualcomm.com,8bytes.org,kernel.org,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3EED12B135A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Robin,

On 3/16/2026 5:18 PM, Robin Murphy wrote:
> On 2026-03-15 5:07 pm, Vijayanand Jitta wrote:
>> When multiple mappings are present for an input ID, linux matches
>> just the first one. There is a usecase [1] where all the mappings
>> are to be maintained in parallel for an iommu-map entry of a same
>> input id.
>>
>> Add a next_offset iterator parameter to of_map_iommu_id() and
>> refactor of_map_id() internals into a static helper to carry it.
>> Update of_iommu_configure_dev_id() to loop over all matching
>> entries to support this case. All other callers pass NULL and
>> are unaffected.
>>
>> [1] https://lore.kernel.org/all/20250627-video_cb- 
>> v3-0-51e18c0ffbce@quicinc.com/
> 
> That series doesn't even reference "iommu-map" though?
> 
> Once again, NAK to this - the purpose of "iommu-map"/"msi-map" is to 
> describe a translation from one hardware ID space to another, where a 
> one-to-many mapping of IDs to a single target would never make sense. 
> While it is in principle possible for a single device to map to multiple 
> different *targets*, that is ambiguous as to what it means - is it 
> giving the OS a choice to use whichever one it prefers, or implying they 
> must all be configured identically at all times? - so depending on how 
> you prefer to look at it, we either do not support that, or we have 
> chosen the first option.
> 

Ideally that should be the way to have unique hardware ID should be 
mapped to unique single target. In case of VPU hardware, there are few 
sub hardwares blocks, 2 of them would be bitstream engine (BE) and 
tensilica (XS). They generates unique ID as 0x1940 and 0x1a20 
respectively. There is a *single register interface* to program a mapped 
device address which both these hardware would access and processes on 
the data. To accomplish this, these unique stream-ids are being mapped 
to single target so as to generate single device address.
We can call this out as VPU hardware limitation, but thats how it is 
currently designed.

If you could please suggest any alternate way to acheive this, it would 
help us conclude.

Regards,
Vikash

>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>> On Qualcomm kaanapali, the VPU hardware has multiple internal blocks
>> that generate different stream IDs for the same input ID. The device
>> tree encodes them as separate iommu-map entries sharing the same input
>> ID:
> 
> And all that means is that your invented notion of "input IDs" is 
> clearly wrong. Please stop this abuse of common bindings and just come 
> up with a proper way to describe your hardware appropriately for what it 
> actually is and does.
> 
> Thanks,
> Robin.
> 
>>    iommu-map = <0x100 &apps_smmu 0x1940 0x1>,
>>                <0x100 &apps_smmu 0x1a20 0x1>, ...
>>
>> This requires multiple iommu-map entries per device.
>> of_iommu_configure_dev_id() currently stops at the first match,
>> so only one stream ID gets registered with the IOMMU.
>>
>> The v1 series [1] addressed this with a callback threaded through
>> of_map_id().
>>
>> This patch uses a next_offset iterator on of_map_iommu_id() instead,
>> keeping of_map_id() unchanged, and updates of_iommu_configure_dev_id()
>> to loop over all matching entries.
>>
>> This patch also depends on iommu-cells series [4].
>>
>> Changes since v1:
>>        - Split patches 2/7 [2] and 3/7 [3] out into this standalone 
>> series.
>>        - Dropped the callback (of_map_id_cb / of_map_id_arg) entirely.
>>        - Replaced with a next_offset iterator on of_map_iommu_id()
>>          only; of_map_id() public API is unchanged.
>>        - of_iommu_configure_dev_id() now loops explicitly; no
>>          bus-type heuristic (dev_is_platform()) needed.
>>
>> [1] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-0- 
>> e2646246bfc1@oss.qualcomm.com/
>> [2] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2- 
>> e2646246bfc1@oss.qualcomm.com/
>> [3] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3- 
>> e2646246bfc1@oss.qualcomm.com/
>> [4] https://lore.kernel.org/all/ce25b963-0e8e-4411- 
>> a406-7b466eadb1f9@oss.qualcomm.com/
>>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c              | 20 +++++++----
>>   drivers/of/base.c                     | 65 +++++++++++++++++++++++++ 
>> +++++-----
>>   drivers/pci/controller/dwc/pci-imx6.c |  2 +-
>>   drivers/pci/controller/pcie-apple.c   |  2 +-
>>   drivers/xen/grant-dma-ops.c           |  2 +-
>>   include/linux/of.h                    |  4 +--
>>   6 files changed, 75 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index a18bb60f6f3d..947eedd9a88b 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -46,14 +46,22 @@ static int of_iommu_configure_dev_id(struct 
>> device_node *master_np,
>>                        const u32 *id)
>>   {
>>       struct of_phandle_args iommu_spec = {};
>> -    int err;
>> +    int offset = 0, err;
>> +    bool found = false;
>> -    err = of_map_iommu_id(master_np, *id, &iommu_spec);
>> -    if (err)
>> -        return err;
>> +    while (!(err = of_map_iommu_id(master_np, *id, &iommu_spec, 
>> &offset))) {
>> +        err = of_iommu_xlate(dev, &iommu_spec);
>> +        of_node_put(iommu_spec.np);
>> +        iommu_spec.np = NULL;
>> +        if (err)
>> +            return err;
>> +        found = true;
>> +    }
>> +
>> +    /* -ENODEV means all entries exhausted; success if at least one 
>> was processed */
>> +    if (err == -ENODEV && found)
>> +        return 0;
>> -    err = of_iommu_xlate(dev, &iommu_spec);
>> -    of_node_put(iommu_spec.np);
>>       return err;
>>   }
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 9c44eb6d445d..71175e670757 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -2146,13 +2146,13 @@ static bool of_check_bad_map(const __be32 
>> *map, int len)
>>    *
>>    * Return: 0 on success or a standard error code on failure.
>>    */
>> -int of_map_id(const struct device_node *np, u32 id,
>> -           const char *map_name, const char *cells_name,
>> -           const char *map_mask_name,
>> -           struct of_phandle_args *arg)
>> +static int of_map_id_next(const struct device_node *np, u32 id,
>> +              const char *map_name, const char *cells_name,
>> +              const char *map_mask_name,
>> +              struct of_phandle_args *arg, int *next_offset)
>>   {
>>       u32 map_mask, masked_id;
>> -    int map_bytes, map_len, offset = 0;
>> +    int map_bytes, map_len, offset = next_offset ? *next_offset : 0;
>>       bool bad_map = false;
>>       const __be32 *map = NULL;
>> @@ -2161,7 +2161,7 @@ int of_map_id(const struct device_node *np, u32 id,
>>       map = of_get_property(np, map_name, &map_bytes);
>>       if (!map) {
>> -        if (arg->np)
>> +        if (arg->np || next_offset)
>>               return -ENODEV;
>>           /* Otherwise, no map implies no translation */
>>           arg->args[0] = id;
>> @@ -2262,9 +2262,16 @@ int of_map_id(const struct device_node *np, u32 
>> id,
>>           pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out- 
>> base: %08x, length: %08x, id: %08x -> %08x\n",
>>               np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>>               id_len, id, id_off + be32_to_cpup(out_base));
>> +
>> +        if (next_offset)
>> +            *next_offset = offset;    /* caller resumes from here */
>>           return 0;
>>       }
>> +    /* no (more) matches found in the map */
>> +    if (next_offset)
>> +        return -ENODEV;
>> +
>>       pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, 
>> map_name,
>>           id, arg->np);
>> @@ -2276,6 +2283,38 @@ int of_map_id(const struct device_node *np, u32 
>> id,
>>       pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, 
>> map_bytes);
>>       return -EINVAL;
>>   }
>> +
>> +/**
>> + * of_map_id - Translate an ID through a downstream mapping.
>> + * @np: root complex device node.
>> + * @id: device ID to map.
>> + * @map_name: property name of the map to use.
>> + * @cells_name: property name of target specifier cells.
>> + * @map_mask_name: optional property name of the mask to use.
>> + * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
>> + *    set to a target device node to match, or NULL to match any. On
>> + *    success, @arg->np will be set to the matched target node (with a
>> + *    reference held), @arg->args_count will be set to the number of
>> + *    output specifier cells as defined by @cells_name in the target 
>> node,
>> + *    and @arg->args[0..args_count-1] will contain the translated output
>> + *    specifier values.
>> + *
>> + * Given a device ID, look up the appropriate implementation-defined
>> + * platform ID and/or the target device which receives transactions 
>> on that
>> + * ID, as per the "iommu-map" and "msi-map" bindings. If @arg->np 
>> points to
>> + * a non-NULL device node, only entries targeting that node will be 
>> matched;
>> + * if it is NULL, it will receive the device node of the first matching
>> + * target phandle, with a reference held.
>> + *
>> + * Return: 0 on success or a standard error code on failure.
>> + */
>> +int of_map_id(const struct device_node *np, u32 id,
>> +          const char *map_name, const char *cells_name,
>> +          const char *map_mask_name,
>> +          struct of_phandle_args *arg)
>> +{
>> +    return of_map_id_next(np, id, map_name, cells_name, 
>> map_mask_name, arg, NULL);
>> +}
>>   EXPORT_SYMBOL_GPL(of_map_id);
>>   /**
>> @@ -2285,15 +2324,23 @@ EXPORT_SYMBOL_GPL(of_map_id);
>>    * @arg: pointer to a &struct of_phandle_args for the result. On 
>> success,
>>    *    @arg->np holds a reference to the target node that the caller 
>> must
>>    *    release with of_node_put().
>> + * @next_offset: if non-NULL, on success it is set to the map offset 
>> just
>> + *    past the matched entry. Pass this value back on the next call to
>> + *    resume scanning from where the previous call left off, allowing 
>> all
>> + *    matching entries for the same @id to be iterated. Pass NULL (or a
>> + *    pointer to 0) to find only the first match.
>>    *
>> - * Convenience wrapper around of_map_id() using "iommu-map" and 
>> "iommu-map-mask".
>> + * Wrapper around the internal iommu-map scanner using "iommu-map" and
>> + * "iommu-map-mask". When @next_offset is non-NULL, returns -ENODEV once
>> + * all matching entries have been exhausted.
>>    *
>>    * Return: 0 on success or a standard error code on failure.
>>    */
>>   int of_map_iommu_id(const struct device_node *np, u32 id,
>> -            struct of_phandle_args *arg)
>> +            struct of_phandle_args *arg, int *next_offset)
>>   {
>> -    return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map- 
>> mask", arg);
>> +    return of_map_id_next(np, id, "iommu-map", "#iommu-cells",
>> +                  "iommu-map-mask", arg, next_offset);
>>   }
>>   EXPORT_SYMBOL_GPL(of_map_iommu_id);
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/ 
>> controller/dwc/pci-imx6.c
>> index 5f8a11774eb5..0d7f5e6d037a 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1146,7 +1146,7 @@ static int imx_pcie_add_lut_by_rid(struct 
>> imx_pcie *imx_pcie, u32 rid)
>>       u32 sid = 0;
>>       target = NULL;
>> -    err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
>> +    err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec, NULL);
>>       if (!err_i) {
>>           target = iommu_spec.np;
>>           sid_i = iommu_spec.args[0];
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/ 
>> controller/pcie-apple.c
>> index 2e86f8fd300b..c780e3f9d14d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -765,7 +765,7 @@ static int apple_pcie_enable_device(struct 
>> pci_host_bridge *bridge, struct pci_d
>>       dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>           pci_name(pdev->bus->self), port->idx);
>> -    err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>> +    err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec, 
>> NULL);
>>       if (err)
>>           return err;
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index 36547d7cf1d6..062beb5825f5 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct 
>> device *dev,
>>           struct pci_dev *pdev = to_pci_dev(dev);
>>           u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>> -        if (of_map_iommu_id(np, rid, &iommu_spec)) {
>> +        if (of_map_iommu_id(np, rid, &iommu_spec, NULL)) {
>>               dev_dbg(dev, "Cannot translate ID\n");
>>               return -ESRCH;
>>           }
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 953f2dbe0e86..990849f00e74 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -467,7 +467,7 @@ int of_map_id(const struct device_node *np, u32 id,
>>              struct of_phandle_args *arg);
>>   int of_map_iommu_id(const struct device_node *np, u32 id,
>> -            struct of_phandle_args *arg);
>> +            struct of_phandle_args *arg, int *next_offset);
>>   int of_map_msi_id(const struct device_node *np, u32 id,
>>             struct of_phandle_args *arg);
>> @@ -943,7 +943,7 @@ static inline int of_map_id(const struct 
>> device_node *np, u32 id,
>>   }
>>   static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> -                  struct of_phandle_args *arg)
>> +                  struct of_phandle_args *arg, int *next_offset)
>>   {
>>       return -EINVAL;
>>   }
>>
>> ---
>> base-commit: 9e94742cffb7541f55fa904a40c1ca9d836d303d
>> change-id: 20260315-iommu_multi_map-8c9b78490ace
>>
>> Best regards,
> 


