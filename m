Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNYqIyE5uGmpagEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 18:08:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E800529DD61
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 18:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255669.1550555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2BPu-0005vz-4S; Mon, 16 Mar 2026 17:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255669.1550555; Mon, 16 Mar 2026 17:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2BPt-0005sz-UK; Mon, 16 Mar 2026 17:07:45 +0000
Received: by outflank-mailman (input) for mailman id 1255669;
 Mon, 16 Mar 2026 17:07:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O1rk=BQ=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1w2BPs-0005st-QA
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 17:07:44 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ed33db-215a-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 18:07:43 +0100 (CET)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62GF2bE81533915
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 17:07:41 GMT
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k0fwr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 17:07:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c73935acff2so2708734a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 10:07:41 -0700 (PDT)
Received: from [192.168.1.12] ([38.254.186.229])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a072418e9sm14954842b3a.3.2026.03.16.10.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 10:07:39 -0700 (PDT)
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
X-Inumbo-ID: a4ed33db-215a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=; b=X+Nlgmj4OOaKssRg
	4e+d6j+YInLZbUUYEhBCPUFKoIM4YtGoc99GwqQ10TJmPjB/CmSuHpPwmbV7wSg+
	gmPOqgVaLk8ZRcWDLGYwb4WoBNwYGGAQu9LwjKdtBF4Vq/PP8ILX80VePosnAn9/
	VUBBXlO9VluIzXokZac37bTWrwu/A3+s3GmM9CEKFq++6YzLLn0yfllLDnndTx2S
	kyronXorVd/CLR6pMaqTIWmB5SUN5szZpHBFg6AuY1JRWB88ClPlvnATCqj73Fae
	8wnwP1NqnvRuRn/MfB0lX8kaZ0Fjrfu8XnfDTCed23SOC09MYiYYPVBbVNuAGwNZ
	/Pg+zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773680861; x=1774285661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=;
        b=A35/X7sdQsR2OC6SC35xgegf+gTg1HCd31LARJU/GrcHKqE4S1G12wlVxEHCqC5Kp8
         Xyi7VLC5YSbLnoT01NUE6JMa3zGi0tjHSS8RyyLc6Xum07DGBUHKlMICs1E9HJKVD/CR
         u2VnURKoFTywqm5P0zjRNsRLrBS6lRgcDni/gx64Tik4qJjNWVx5rbKKPdfuQM6xYtTw
         WE0sWKge6JKGJNjeNlf7buA1YcOym1V8qJfxHrKak4CgS8aKJ+TJzt0EgDLVhZFgGNp4
         psbqeGrXI0UB1VH7Y0goFVzIXKY4FGZ6PhpH4ZKNcdE2YTdmtImtT/84mkM5lqscr2Ed
         nuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773680861; x=1774285661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1xeMoYeUM0iSmvPxnEiOO/lpTwBXAxToBC2I8g5MT0=;
        b=hHT/vZDyeg4qCh8gufshx3C71jIvLnpGlu8fpLmdYCCY7DimCIb5pKF0cf7JXOlU//
         0ondJrcFAexBGtNKE2hxVNGihj//3OR1IwuWZv2B6LJnpH2do9UFUsKzi9Z90vX9ymi+
         3XZHeee/4ZxbtpT5IOLhfJkk7iB0pxMdi+p+e6en2whGfOEFaUUHXMJyShwvxY0L5n6T
         HJ/bdSww7qiKXm6zCN/3QzzZwNHZwlqpXiFAqEO2DeDYC+GrTdTCgXSrVlScOrfrJ9lK
         Vk6xFVnl4ymW16obE6SpNa7VHVNVpE0gMSNXGdLbP+ZDU5SfaI9a4/2T2Aw8MF+YWYLn
         TfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5GU1+Ax4oGruBey6yEgFqIs6qbV5V7IzyfFdAySpb+czL0qCd1v6ueteWKF4qMoL52hmi4GM1hL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+ZRf9dcJ2PuOUHaAUtQE8ndaG4zAOy6ub9vCAvZ53nczcwvyK
	ca1iVD6y7Ek2LM12dyhrVoK+qAJ8nS3XHaLdaAXcc0Lq4fktWTTl9r80aeN9/Lorh0LXG3D66YF
	NfMDNayUyCWS1Ql0ETiU3BXaF++tEUGNccdKmK/x3/hE5kySO6T7kaMPjV3sabvk7LewUuw==
X-Gm-Gg: ATEYQzxuBo7/rMvsJ4PdcxKZe8nWjaCmD5Qy6u6gD/UTZcSUNtj79Z2p0woxu+ZEZ1Y
	7M0mogx1H+YDpwAHXvyAXBGGuiVvy82DyM5t0cMIDgqlX6BewLu6gx6dmK1xlLeBwTSs699bk0z
	XHN3+AQHf6bJKS2w2Yq/Oyw1J3g4fxLrX5Lhr3bTvHVLC2i6ndQHnquHFy8hpqAX0u8QNIzPgZs
	dEDoBERcJim3ZYtVfRB32J9vkBiMOd+bw3DuUlxSf1yw9s9T4xLdj+Zbt1zksYOYDbstkJeub/W
	h4zNgrIX8+ATvcOyV+XSOppHFRj9kdmqHoLPynmJR1fukMAlmjWfNO4bi0Y5G3pWP/Dq4GMIT3L
	3Pwo/mvi/tOEg5qA+9FQAOS0gw4TUs/C6LB9GHu8vTHYjtOyBVkTiMe3yWQ==
X-Received: by 2002:a05:6a00:854:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-82a196d9795mr12519520b3a.11.1773680860304;
        Mon, 16 Mar 2026 10:07:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:854:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-82a196d9795mr12519484b3a.11.1773680859759;
        Mon, 16 Mar 2026 10:07:39 -0700 (PDT)
Message-ID: <dbfcbc9c-2175-49a3-aee4-434b69cbaece@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 22:37:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
 <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b838dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GQrJT2J37VpXmJLvS4cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfXzPV3/SP2yudL
 IZLajUsGZLqAjZhNtwmY6q6+dBIisyiPIrrFC2ES222WumAwZ9Yxo5sisTdjiU/yWQ07tSqmUfm
 RtLpYAncqKxqBnymfAaKX6ZSm3cU02v8OXHraL33FOLJOcIs5aB2nnarKxEnfCI/TFQNQFQLDI5
 jkFnNFPN6J1X8AM7n6uwJvwytBpcqjW9RZhIJl8htsLfo4aqQ7LbwLwloOcZF7pssIKgJt/GhC3
 ZI85M/Kp4YTInt8meRmDBCobf5Bz827sdPYmzdMlomKvXBaBl/q1Wj/uTSd2ELXZch0PplbWtX5
 cvy5dVkBKzX5ISETgsalSOGZPMM3FHei4VXJLDsS5shNHpUMv6iPy/xE/VuJpB5qVppZvM2bLqV
 nmzk0wBIoqHPMW9Dd6jSRwrKyx0DOQEdELFJA9+KKZH00IcqMUrCbbJdWWYlUifDMiJ2GbIkCUP
 9QlrgvwhLhR40+pp5Pg==
X-Proofpoint-GUID: EJ6PbtZf79aibYy7y6pihTahqogIvTS4
X-Proofpoint-ORIG-GUID: EJ6PbtZf79aibYy7y6pihTahqogIvTS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: E800529DD61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/2026 7:48 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
>>
>>
>> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
>>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>>
>>>> Change of_map_id() to take a pointer to struct of_phandle_args
>>>> instead of passing target device node and translated IDs separately.
>>>> Update all callers accordingly.
>>>>
>>>> Subsequent patch will make use of the args_count field in
>>>> struct of_phandle_args.
>>>>
>>>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/cdx/cdx_msi.c                    |  5 ++-
>>>>  drivers/iommu/of_iommu.c                 |  2 +-
>>>>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
>>>>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
>>>>  drivers/of/irq.c                         |  8 +++-
>>>>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
>>>>  drivers/pci/controller/pcie-apple.c      |  5 ++-
>>>>  drivers/xen/grant-dma-ops.c              |  4 +-
>>>>  include/linux/of.h                       | 12 +++---
>>>>  9 files changed, 76 insertions(+), 50 deletions(-)
>>>>
>>>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
>>>> index 63b3544ec997..03232b5ffbca 100644
>>>> --- a/drivers/cdx/cdx_msi.c
>>>> +++ b/drivers/cdx/cdx_msi.c
>>>> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>>>  			   struct device *dev,
>>>>  			   int nvec, msi_alloc_info_t *info)
>>>>  {
>>>> +	struct of_phandle_args msi_spec = { .np = NULL };
>>>
>>> Why do you need to set it? Parse functions ignore passed args, don't
>>> they?
>>>
>>
>> The parse function does check arg->np on input — if it is non-NULL,
>> it is used to match only entries targeting that specific node.
>>
>> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
>> pre-sets the node and passes it as input to of_msi_xlate(), so the node
>> pointer is not ignored by the parse code:
> 
> Is it only being used for MSIs? If so, can we make that explicit in the
> API by having the 'filter' device_node pointer?
> 

Yes, I see this is used only in the MSI path via of_msi_xlate(). 

By filter do you mean the below changes ? here of_map_id() and of_map_msi_id() would accept the filter
as a separate parameter so that arg becomes a pure output:


int of_map_id(const struct device_node *np, u32 id, const char *map_name,
              const char *cells_name, const char *map_mask_name,
              const struct device_node *filter_np, struct of_phandle_args *arg);

int of_map_msi_id(const struct device_node *np, u32 id,
                  const struct device_node *filter_np, struct of_phandle_args *arg);

of_msi_xlate() would then pass *msi_np as filter_np down to of_map_msi_id
and IOMMU callers would pass NULL to of_map_id. 

Does this look fine ? I can include this in v11.

Thanks,
Vijay

>>
>> u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
>> {
>>         struct device_node *of_node;
>>         u32 rid = pci_dev_id(pdev);
>>
>>         pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
>>
>>         of_node = irq_domain_get_of_node(domain);
>>         rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
>>                         iort_msi_map_id(&pdev->dev, rid);
>>
>>         return rid;
>> }
>>
> 


