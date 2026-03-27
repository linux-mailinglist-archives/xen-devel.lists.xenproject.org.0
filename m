Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCYCM39Pxmk2IgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 10:35:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB0341CDB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 10:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265264.1556269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w63b9-00057a-Tp; Fri, 27 Mar 2026 09:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265264.1556269; Fri, 27 Mar 2026 09:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w63b9-00055J-R0; Fri, 27 Mar 2026 09:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1265264;
 Fri, 27 Mar 2026 09:35:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1w63b8-00055D-Sv
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 09:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w63b8-00BtAg-5z
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:35:22 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69c64f56-bab6-0a2a0a5309dd-0a2a4506db0e-32
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 10:35:21 +0100
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69c64f57-3034-0a2a45060019-cddca883a0ba-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 10:35:21 +0100
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62R6w3QH1860253
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:35:19 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2drx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:35:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2b064884a7cso63019405ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 02:35:19 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc7a7e3bsm72543195ad.27.2026.03.27.02.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 02:35:17 -0700 (PDT)
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
	iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=; b=dfqtedcKdd+VWg1M
	7rr8jESz/4pyob5K2fouLMEhfpda0yOt9fk6Il6m7RWjeliiACai4e+ZB2hlrx1I
	9MgYxRv0KQ/ku0BWB2gtqXXvKiBRNyf12jRfiUQuuolYntBskTlFgAufv+olHd4U
	9+pYzSrzGS/nBGGzKPqngAx3//YA4A3M7kaA4l965KaJ1iChtAww5Rf4BioiNEed
	zzoIYSIj9ktfWv7IMm3l/NGkcKvqOL4pYOu59I2WfsLqBIG6r82rTb5Ka8Nq3b8H
	ykkyk8hGHoSagfqLpuEBqOyCW+kifxN5Cw9NttYhmJ8EX02pYG8IZakCzrf4EwZ0
	7Q/RGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604119; x=1775208919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=;
        b=JWxyX2YREtD3Bd756VAi6+tA2CzQ90gFE8GxHp56fvDNFeFfmQqLyP1WYjsD4U435A
         f6WDdgQbTG/vVwYZAUw9cNAys4CATFpCkvvHEz+sqQqILwXurouVcRSTT7eDXo3R/t7f
         jPgLsKKr9fk1BW6Bxw/UL5JtN4Hb5GM4Mt/tC/us2pF7zS/MODdcKSLnmT/zbK9kL4tW
         I4pydNeG5A5itUgeujy555WVbYWaEbjxyD6kdaf9XsVAykH89qtGuE8dYPP73Uh7YVqJ
         ebWPVkx9mK0+VfPfv/ur6WG38zGSkIKz4eFLSRNrCdQ26I2SgmuB74mF9frtSEx0F9mK
         MIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604119; x=1775208919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=;
        b=AV60DXW4dzitufg/GvUZ0DROc5r2ZSYnNJ5mw5KXeDlWstx/VH+DprjsErqmCheD/X
         dk6f6e8h9eBPdCroG5xfdvXb8OQjo+EkfAQNLaCi4mRqs37NqVciLlALiYI1Wv5mo2JU
         hu4H0IEDeaP00y5Uw+uV3ZEKhnXriMcASYc3jCawEmvvkTWETVav+XoIbz4coPGxmwm2
         O4C4SYwJhsQLAvzzIS9oXC0h4eM0vvg9IyGkEQseKGQvQj9fKS8KI65AHneR3ZQ7HvDt
         S7Ir5/Q9OwyN3jAsj01mdbxZo0h+7RvtBHa9lJTdYLcNqoNlsA71yJxTE4O9tyFrLlkz
         vMBA==
X-Forwarded-Encrypted: i=1; AJvYcCUNHtJ/0n23F+4GPO1JS2t0HMaEtEKIAcMsc7WbbYj6djO85VFrSg+B4MhY+8CAIOQdWRsAeXvPfac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLc5KEI9NNqeT5rczLKL2BMkrEok/YMTnwCa0yLL660fp+Fa6U
	Lb6bDfnBEajtXrXPq6EzmN/FdKYgwpM7gLLicqynTuVu+nOEIcmUH1MAHPBKGqubRjJdoqS6E06
	a5zORMrcD6F1kcCTndh6uNXwlCx4MY0y9B2huublB3NVTI2u857zJurLePXbXAC/fOIx+qA==
X-Gm-Gg: ATEYQzzF3IwujmyunB5kqYfAnt4dceZ5WBXCecUpHey+aeVflGeLfEbgpxZcUfRcPbI
	j1XevXk3L53eQsSmjZd3lq9MuTXoRYfwXN1K2Zm3IrTaq7H+e6nZTt1l0mMiwK1Xsj/gu1kPPs+
	deeIz9GyLdzlVIx7VJuK/QOZ4ha6DqroWWAvdBmLg2tUNvUQJA+CdaeYH2ybtDSiLl/9Ob2hYCz
	a/P/21gkjVbCKjse6ChDADxgJl6DRZBSJ7Zf9P/5UsWFIYla5Y5UQiv8M4/S/EMDgAdryzc760H
	ovgBz+tjfQsIyOoYaQK22IL/T+aSevVceupW9MMYBnYbHEKw+uoxnwKb5fY5XbA3YX+J5dCmoiF
	02gFvF0f3fqAREVSnyrOmFfscEa1qlswwb/ynvxOwyuxpZMNkmoA+DLr8
X-Received: by 2002:a17:902:d502:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b0cdcaa738mr20284085ad.25.1774604118577;
        Fri, 27 Mar 2026 02:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:d502:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b0cdcaa738mr20283585ad.25.1774604117910;
        Fri, 27 Mar 2026 02:35:17 -0700 (PDT)
Message-ID: <2c21c307-99bd-4051-8c09-06d370ad9b24@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:05:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] of: Factor arguments passed to of_map_id() into a
 struct
To: Bjorn Helgaas <helgaas@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
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
References: <20260326161957.GA1324845@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260326161957.GA1324845@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c64f57 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vU6kfqNVzfA0ps7fDeEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 8OvA6rrdqbCzTFgL72ghcCOc2FXzA7dc
X-Proofpoint-GUID: 8OvA6rrdqbCzTFgL72ghcCOc2FXzA7dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfXyjXpxrCa3nsR
 N2et4W/SqXvJyEKdkmLpoWPPyoQFzmDvPv6++NIgrLMpR4aeYXXt1yVu8ONPvWeSWe7cbmGGN1s
 GZTE5RT+1fMdpfgikzLjD25zJQQFQpX1fnhDkGBk1KWJAYVsFn06ioDvtyOZhQzjZnWj20qXkde
 FD45dwZrxW0U4xQeZnZSY0Ufv7re1yxmh0/ZUtzdu5Nl8C7gb4rNNyxWQUa/wBZSfDuioXNFFdi
 uT4G/4h4RLi8dqubKB15zTZH63voG1gejRcIAxsaiajvJrVNu39VddsL5KIa+c/qxVCfVXUOjLX
 zUlIGc5z/dDVYMJW2MPnVyC85wkivmpgcaP6F7sKU1H4vQPcIuus7RCmIT2jPANAlXjiOC5g3jJ
 iG1i6oygG58tO7nQ7BgBemFXc7rSJySnL2GJUx7yX8IfKYfTr4eG9ktQyoyF1arYVaYsaeBp0Vd
 el8JPFaJTVnmPfZICvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070
X-purgate-ID: tlsNG-16d1c6/1774604121-7BA981C2-75A3C9E2/0/0
X-purgate-type: clean
X-purgate-size: 4901
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,google.com,nxp.com,pengutronix.de,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@os
 s.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.712];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,iommu_spec.np:url]
X-Rspamd-Queue-Id: 2FBB0341CDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/2026 9:49 PM, Bjorn Helgaas wrote:
> [cc->to: Richard, Lucas for pci-imx6.c question]
> 
> On Wed, Mar 25, 2026 at 04:38:23PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
>> to separate the filter input from the output. Previously, the target
>> parameter served dual purpose: as an input filter (if non-NULL, only
>> match entries targeting that node) and as an output (receiving the
>> matched node with a reference held). Now filter_np is the explicit
>> input filter and arg->np is the pure output.
>>
>> Previously, of_map_id() would call of_node_put() on the matched node
>> when a filter was provided, making reference ownership inconsistent.
>> Remove this internal of_node_put() call so that of_map_id() now always
>> transfers ownership of the matched node reference to the caller via
>> arg->np. Callers are now consistently responsible for releasing this
>> reference with of_node_put(arg->np) when done.
>> ...
> 
> Not actually part of *this* patch, and AFAICS this patch is correct
> as-is, but is it necessary to have different logic around
> of_node_put() for imx_pcie_add_lut_by_rid() and
> apple_pcie_enable_device()?
> 

Thanks for the review comments. Right, there is no need to have different
logic, I will update imx_pcie_add_lut_by_rid() in v12 so that of_node_put()
would be called unconditionally.

>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1137,6 +1137,8 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
>>  
>>  static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  {
>> +	struct of_phandle_args iommu_spec = {};
>> +	struct of_phandle_args msi_spec = {};
>>  	struct device *dev = imx_pcie->pci->dev;
>>  	struct device_node *target;
>>  	u32 sid_i, sid_m;
>> @@ -1144,7 +1146,12 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
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
> 
> Here it's conditional on "target" even though of_node_put() checks
> internally for non-NULL, so it would be safe without the conditional
> here.
> 

Agreed, here of_node_put can be called unconditionally , will fix it in v12. 

>>  	} else {
>> @@ -1156,8 +1163,11 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  		err_i = -EINVAL;
>>  	}
>>  
>> -	target = NULL;
>> -	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>> +	err_m = of_map_msi_id(dev->of_node, rid, NULL, &msi_spec);
>> +	if (!err_m) {
>> +		target = msi_spec.np;
>> +		sid_m = msi_spec.args[0];
>> +	}
>>  
>>  	/*
>>  	 *   err_m      target
> 
> And here (outside the diff context) we also call of_node_put()
> conditionally:
> 
>   ...
>   else if (target)
>     of_node_put(target);
> 

Agreed, same as above.

>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..c2cffc0659f4 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = {};
>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
>> @@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>>  	if (err)
>>  		return err;
>>  
>> +	of_node_put(iommu_spec.np);
> 
> Here we call of_node_put() unconditionally.
> 
> I think it would be much nicer if imx_pcie_add_lut_by_rid() used the
> same style as apple_pcie_enable_device() and did the of_node_put()
> unconditionally.  That would untangle the function a bit and make it
> easier to analyze.
> 

Sure, as mentioned above will align imx_pcie_add_lut_by_rid() and
apple_pcie_enable_device().

Thanks,
Vijay
>> +	sid = iommu_spec.args[0];
>>  	mutex_lock(&port->pcie->lock);
>>  
>>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);


