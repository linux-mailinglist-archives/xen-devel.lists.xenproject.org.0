Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIBVI9cOpGlbWAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:03:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43251CF04C
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 11:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243774.1543363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwddG-0006bK-DG; Sun, 01 Mar 2026 10:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243774.1543363; Sun, 01 Mar 2026 10:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwddG-0006Zi-AV; Sun, 01 Mar 2026 10:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1243774;
 Sun, 01 Mar 2026 10:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDVR=BB=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vwddF-0006ZZ-5p
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 10:02:37 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23cc130-1555-11f1-9ccf-f158ae23cfc8;
 Sun, 01 Mar 2026 11:02:31 +0100 (CET)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6216kFTu530173
 for <xen-devel@lists.xenproject.org>; Sun, 1 Mar 2026 10:02:29 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq2j29-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 10:02:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb37db8b79so2689801985a.3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 02:02:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f302285fsm22929771fa.44.2026.03.01.02.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 02:02:26 -0800 (PST)
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
X-Inumbo-ID: c23cc130-1555-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0xpqoMV9nCv7588O/2lb3+Dy
	gEwHNzZq2QKo2gKrDEI=; b=MFDwcsRMUoLALjslv9VY/VdAydAxc3/eD8jPp+b0
	3dbJ7aTibd/9b6GV9IF2gWn6gSpe/I3btoHNAVjlHAbEwxC6eHSVdnwqOitswsKK
	BFmc5ona0teu2h6YmGm5UzCmJDzSNJQeil3gsT4tu2E/DuMyeeU2M4A9oTkvAzIU
	6Nj7aXpW3vgAMvolk/oLAysN+VfAUn/SXHBScRSfZ3wrgr7md5skbPHMUU+5C7cg
	PDWi6o6khIMR296Rtf2LMqviKvYVMgehPnRNL1VGGCDd7pD1khwDOQnaVh1y70D6
	5NTfRB58X2oh3kZa0pAyMmBzeNyGrUi6kb5A/jodMBBWgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772359348; x=1772964148; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=OOMuRFdYKywRNM5hVzYRAOhkRg2Ana2174wer/K75BaWKaztBxjyDQuDm85wqxrVyQ
         WQx5wA5Z1KKIDSqK/h+5crLr4NtIKUEErpcuSKlGOBYrOwRKkjMV3Bj/JDUGABvPpLVp
         zF7vcdLGVcFYuXo9R2cGJ3A6+lUG9PFecs+4bknvsXtA2VbfGZzRQbnAthznEPnmtDnQ
         saiZz36U/YPNPh1GkCLj7FUS+s8qzhuKmzV3WdLf04jOiYzGZxBWXB/3nSeBthQGZR/o
         kO8BkTAUaFW6gljuZuAUF64pwO5/hr6zb6Ef1qFFplEL/TQwl5wDtnF0tpLnrIP2UfFU
         XOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772359348; x=1772964148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=GZrHrvrxKA+UtjRIK96u5n1sT0Oj37qQdDj+K1foneb0Mq6LNrZuptH/soqLk6ooOp
         gZv0s7DftCLi+mOgjj94XiPWhrzEZOEYlb5F63fmZy25RCAxg1NJG1UTsprLZLIms0xZ
         gXeXpgK5stICYkSXqVdrICvRwwCnu9hzSZKnIpU2QZXNo05vzXRlLNLpgWIZEC/IdyqD
         sQKNaDZeQjVnTyXOcUyQqETiNLuIlQYBnEWeor80e3/jebtxrMqKIFEfSfXyXRI8dwTB
         AAjvFOuUvfLL1U0KeA0o/k2CICCIKmrKXJ67KaSl6PySp3VN7B9n/Jjm5d4SM1mWPdsu
         sYmA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRX3v574EoCMgxR6Z6XdfzZybrTnGdBurMt/MYtLL1j3TTECOpjccxT6cNtWcdCH7i6jJm66jZv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCB5iDc6TPJQbX1TOLdMpy+1s/Fv5ZMwcVo+9bWa1podVdavXV
	Cm+C8DaTuXZuPijQC4JfO/5T85qh3B8g47JY+GvWPxD2FG9Hk91LYXNzPZnBf9ViLdxtiCPZ6RG
	fkdcCxy7ShjWFGFjzNNkGdnXKGy/28d8dmJS4iahD+3WbtkwH6pMDAiQoHo6mya0B0JqAlg==
X-Gm-Gg: ATEYQzznfABLmkTTiWRckAqw4xIPOAtx60+OKZhlIoyrYEYqy1NNJWfQeyfmE2LNN64
	yk8h/F1YDku8pC9Eh5IBq+vh6AqL5Z3ilzzXsbU36iQXgH573NzcdBZ2dptBv/qnMhmymvatzSI
	e+KVoJhkP9TDPbIH7pqwZW8ubxhLZsixdsYcNBJ8Xwqk0e71uES9WT+hnNWVEAXGgqIOclqcEiQ
	eZ3gKpmKzIAIF2tk7adAyKhr6SqztVja839m1VcU5HXBw9FBk9wuMWO1ZTjg88yQ1Yw4zuZT76n
	QzHjOJAX6HkaCqG2BNZZP4idezBXT+2G11c53g798rGM9fpCgDaVjzwEgUScQPB5HmW26kk+/PT
	/0Vjvv7Sm4O6z83FJ0GluJWWzwI3jpO+FCWkNO8q0FgT8JwKp9Z25XpN7TcELIgpvfFgGFxclY0
	fyehleNCJ7fNJXeSCHHTh3lwmFJwfdGGkfT8E=
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244110785a.43.1772359348315;
        Sun, 01 Mar 2026 02:02:28 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244105085a.43.1772359347812;
        Sun, 01 Mar 2026 02:02:27 -0800 (PST)
Date: Sun, 1 Mar 2026 12:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-GUID: 6vKIxRpvDIiK-n-eqLiIHq-LFRBGMIST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA4OSBTYWx0ZWRfXyyBsmJawSHj1
 sYSf4u+EOjOK9onJiixHjYgXU9WWo/INWtnmtbSQl5DuGr2014dixxsb5O8c036OdPI3u6XNv4V
 +W41n+eZ2ojejtqzUUghDT6z0o+TAesU6erciSOljaFXflDnyitsX4CJijSYe3NA/e+cv0uN09D
 NZqqoR1BZA0Mz58GtRIxIDAQB12v2E4mrCnMnyOv5vRdSUSZ6hHggE+g98HELA85MBB7R3bcKYA
 0Y74kwlML0URQgIwvYfDgZ/pUzutYXrJaMc2/0lWqmgW+b8de7HFgqqLeiqc9o6kOnC/suRW7rZ
 vPBqaaE1BVM/jHpjEHGF0/og8oVHyedc3Wvzqom8Dfc9Ois5foGPLPFMCI/Y/X1l5YBbtfyRPdX
 Oz021a8X/BRLYsdZLAtEDXA2QuUrZAr3L5l8RWwPM96GpWHFJ3vq50YesCzSFDUX/Rglgl+kcQz
 fhbcPfmVFbogplVdL8A==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a40eb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZF1vm7_Oee5k7ESqZ6kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6vKIxRpvDIiK-n-eqLiIHq-LFRBGMIST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iommu_spec.np:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C43251CF04C
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 

> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	}
>  
>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> -		id, target && *target ? *target : NULL);
> +		id, arg->np ? arg->np : NULL);

Is it just 'args->np' then? If it's NULL, it's NULL anyway.

>  
>  	/* Bypasses translation */
> -	if (id_out)
> -		*id_out = id;
> +	arg->args[0] = id;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bff8289f804a..74fc603b3f84 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	u32 sid_i, sid_m;
>  	int err_i, err_m;
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	if (!err_i) {
> +		target = iommu_spec.np;
> +		sid_i = iommu_spec.args[0];
> +	}
> +
>  	if (target) {
>  		of_node_put(target);
>  	} else {
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;

of_node_put(iommu_spec.np);

>  
> +	sid = iommu_spec.args[0];
>  	mutex_lock(&port->pcie->lock);
>  
>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1b7696b2d762..5f1d6540049a 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>  
> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>  			dev_dbg(dev, "Cannot translate ID\n");
>  			return -ESRCH;
>  		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 824649867810..9d72d76f909d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
>  	       const char *map_name, const char *map_mask_name,
> -	       struct device_node **target, u32 *id_out);
> +	       struct of_phandle_args *arg);
>  
>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>  
> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
>  			     const char *map_name, const char *map_mask_name,
> -			     struct device_node **target, u32 *id_out)
> +			     struct of_phandle_args *arg)
>  {
>  	return -EINVAL;
>  }
> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>  }
>  
>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> -				  struct device_node **target, u32 *id_out)
> +				  struct of_phandle_args *arg)

Document that it's the caller's responsibility to of_node_put() returned
node. As it can be seen from the previous comment, it's not obvious.

>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> -			 target, id_out);
> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>  }
>  
>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>  				struct device_node **target, u32 *id_out)

Is there a reason for chaning the of_map_iommu_id() args but not
of_map_msi_id() args?

>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
> -			 target, id_out);
> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };

Which driver passes something being worth of storing in .np?

> +	int ret;
> +
> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
> +	if (!ret) {
> +		*target = msi_spec.np;
> +		*id_out = msi_spec.args[0];
> +	}
> +
> +	return ret;
>  }
>  
>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

