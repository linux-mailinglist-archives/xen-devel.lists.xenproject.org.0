Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBiaCo3KxGlP3wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 06:56:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286832F87B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 06:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263324.1555306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5dgf-0006mo-Qu; Thu, 26 Mar 2026 05:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263324.1555306; Thu, 26 Mar 2026 05:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5dgf-0006kE-NQ; Thu, 26 Mar 2026 05:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1263324;
 Thu, 26 Mar 2026 05:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1w5dge-0006k8-5c
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 05:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5dgd-002hcs-FV
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 06:55:19 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69c4ca3b-bab6-0a2a0a5309dd-0a2a4508ba40-18
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:55:19 +0100
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69c4ca45-1950-0a2a45080019-cddca8833b4a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:55:18 +0100
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62Q3Zxhm4015116
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 05:55:16 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q8btn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 05:55:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2aeb90532f6so7590835ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 22:55:16 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc87e820sm17098715ad.50.2026.03.25.22.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 22:55:14 -0700 (PDT)
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
	808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=; b=g6USjlaGedJfM+6c
	sh043EGNYzelCOV0izT4tNV/QLb3n01n46Bcfmfqhk0dekR80UJbYOv+ECiKyqF5
	hDGBoDW4HjYW1FAnHB6HQjPL6wiU4HzOonNQwpb/m8z7iZT58NXSi3dOBPrIjoKw
	wuQ+A2qImDN45is0qhRImk0Fg9/VXYXt4bbMo7IOL2woERqueHmWAt0hrmhyhiv0
	JLF5Kd2kqXU71weN+dS35T63ejg75uq5aWodNW+gv5W1MJbCfegg49wHfqx8ROk+
	Zh+yu0VCeaDvVnApliD+U5Gk5SVWVPwHYOe3DC9JmVtMZhekVG/bxeogXSihbsCE
	J0PCCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774504516; x=1775109316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=;
        b=ZU501NKLjfVUglsy9xGKdwyyM2wtiNMo8S+k3WIr0YEdCfWu4ymoMECOCwPP+7SO2M
         ylZ2MEoezbGwx2EMZnUNZuDoAEOcgSJo1LUQ8LSIdi8SSoAz5ouacCieCHVOUmscav9u
         Tk01bSPVkxBdyxb694vz0orXMSlhcAEJhLOIZZvv7O2n7HGRprZGTKHKrrMSwtBQy1HT
         3Oawwse/Ve6eAPdn2s4HTtRqtFUv6mSZEQ3uiqzZRdb9JbrfhwDy7Xz94ADbh2QruA/x
         vwS0ncg7WxRKput+E7t4VjEJ81n26pVRmxuj6tFwz5fi4WZbYrOvaxdmmEwZjkfSka0z
         KznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774504516; x=1775109316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=808xdNmKLCaAFJRD8fSiUQE9ujHk0+F2A04hZAqckLw=;
        b=CDV/S/o8FO2TIhoOD1sg13o5U2to1ZgXpUnt9sWJPb3nlhFJW1T4bTVSS7YD8YIidV
         L1lIRowm+Mwxa8cI8a0AXFe6a5b0yYkir6+2tw7TMrBlLWrG9OY8uVveezxO7tjgQM+g
         OnbNOQ8mK2u5XzwZ/ENX0Ahfaw45ZTo96TFYiRZ48Dr8gKtHPMBNVR8Ym3gHStFC4kDV
         xPVVhyOPq2PDgW6x3bAsxj9VBm4SJ8r5sIv15J1d8JXWyUGz1IZxD72oWvbJIYr0Za4Z
         7sftcrdZCImu7B9dLsxrOMjXg9X6+8o2zxw6a5ePGYZBRBPPmkEfNkee/9NxsqwHec9x
         gOQg==
X-Forwarded-Encrypted: i=1; AJvYcCUQMVVIJ3iOWqSBkv+zZaqc7Ir01w+vsMLgJGkx4pB826KSOVX+o/98CVD5Sxqb2SyG/rQDSgd4yE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5s5omX0i7CSduWl5ihM25JTz5mNyEW7tH/m3FSW17HxVyRbdG
	9qBw5Xmg7o4RDTHoGD3XZpfC3Es9aSZoFHwqkT9EpPLzPRTBiDhjeZEApdmiI7Z0YEBf4yQJTEL
	cKMECEXylap/vRMDHmO+tHUsh+4pXMkPSmRGYm5Efaa6Wnc/lFUNZM6wxAoPxaw68N4KS6A==
X-Gm-Gg: ATEYQzxzgsa0/RsVi7Hg5Jmp4Pi6BMtuWsldle5J/T955jfv1OTjzfuxP0wlQrR0vAw
	bm6VZHEWt7ioC66jImSEIZSBN/iP7PRDQpJHAH40Oh+cTKoAd0VVXvasoPJ7uB4kJM/sKZe3xC7
	YfNvb/WXG4T3GTVHlKv0E18u+uoCGAE66kuaqlPSMpK+OPjeQTxv2xPTySty9dK/SJ9Xtg9C8Pe
	JLf6JCBgkVP06uHB8VA01Z9ATUh8pvK4yXQ4fzuhKSo52gmNyYMAHRgVaoazduBNUM+VLmbie9O
	3cw7ScAFL4BKKXexTjVsNRuOv7eFVv7LVq/Vch2w9i+P6L0hls9LgmKIq9+EPkeYnaQ/oDRSq1g
	Gg8zWswBrfB0+bISJVbcdeLn0mqfOw/f9JeWvn+A466nAM/1T4kXFZ0/a
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr74442855ad.28.1774504515833;
        Wed, 25 Mar 2026 22:55:15 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b0b0aad881mr74442365ad.28.1774504515275;
        Wed, 25 Mar 2026 22:55:15 -0700 (PDT)
Message-ID: <65f76d05-1474-46d3-aa71-4acfe86c5718@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:23:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] of: parsing of multi #{iommu,msi}-cells in maps
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
References: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qmodhHmfsEw0YHkAwswg9KyGXpGcuIsK
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4ca44 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=G4NFmJWIaiRLgIwbil8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0MiBTYWx0ZWRfX+eqXZixJV8mb
 zbrg6iPWrDvp17AZZPOkCfh/u1iHeswZz4EKkkudeTO8GQq+jEP8xOv3xTsziGaSq0Y/VjIRDNm
 m/eBnm5AQUBCt7LVp+C1qKs7+IjkhZhnpuHAKUSMc5OpJFUfM6b6mPZXcMEWqb2YSW+5xS3ZACt
 y3brYnqhXe0kjKB4kj1yXYlrHbwoxvFXFYK0Vk6k0jTh/rmpNPVGavxZCjLbPJ/0ISbfXN6e313
 NvddO4n4sQ60BA8CU+tJf88WGCL2PGsXU+vfw18otpZcYU9cU64lIzD2+1Q4EbjQnOkf0Pxvjat
 PG1C9tWehkfyCbcHOrk/NUqwIKTEeuoo0A/l5KnNAforCbmGOp4TPwufXPWcq88cfD1PNhVhuhd
 U8fejyM7d3ausDhJcxdC1YLY1YIf1CRj0HjVqqxvsZIuKE9ZO3Ypa+pMeUur4xk/fB4c1zgk946
 GGLXCWmCZiUi/pcK9jQ==
X-Proofpoint-GUID: qmodhHmfsEw0YHkAwswg9KyGXpGcuIsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260042
X-purgate-ID: tlsNG-c1860d/1774504519-E9488726-5D04B4BB/0/0
X-purgate-type: clean
X-purgate-size: 6062
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
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 6286832F87B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 4:38 PM, Vijayanand Jitta wrote:
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use[1] in being able to map at least
> single input IDs to multi-cell output specifiers (and properly support
> 0-cell outputs as well), add support for properly parsing and using the
> target nodes' #cells values, albeit with the unfortunate complication of
> still having to work around expectations of the old behaviour too.
> 							-- Robin.
> 
> Unlike single #{}-cell, it is complex to establish a linear relation
> between input 'id' and output specifier for multi-cell properties, thus
> it is always expected that len never going to be > 1. 
> 
> These changes have been tested on QEMU for the arm64 architecture.
> 
> Since, this would also need update in dt-schema, raised PR[2] for the
> same.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> [2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
> 
> V11:
>   - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
>     per Dmitry Baryshkov's review feedback, making the filter explicit
>     instead of overloading arg->np as both input filter and output parameter.
>   - Removed of_node_put() from inside of_map_id(), making the caller responsible
>     for reference management. Updated of_msi_xlate() to properly handle reference counting.
>   - Collected ACKed by tags, and fixed minor typos.
>   Link to v10:
>   https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com
> 
> V10:
>   - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
>     drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
>     and Rob Herring.
>   - Add kernel-doc to document both helpers for discoverability and
>     usage clarity.
>   - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
>     irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
>     struct of_phandle_args-based API with proper of_node_put() handling
>     as per feeback from Dmitry.
>   Link to v9:
>   https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com
> 
> V9:
>   - Updated TO/CC list based on feedback to include all relevant
>     maintainers.
>   - No functional changes to the patches themselves.
> 
>   Link to V8:
>   https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V8:
>   - Removed mentions of of_map_args from commit message to match code.
> 
>   Link to V7:
>   https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V7:
>   - Removed of_map_id_args structure and replaced it with
>     of_phandle_args as suggested by Dmitry.
> 
>   Link to V6:
>   https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V6:
>   - Fixed build error reported by kernel test bot.
> 
>   Link to V5:
>   https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V5:
>   - Fixed Build Warnings.
>   - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184
> 
>   Link to V4:
>   https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V4:
>   - Added Reviewed-by tag.
>   - Resolved warnings reported by kernel test bot, minor code
>     reorganization.
> 
>   Link to V3:
>   https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V3:
>   - Added Reviewed-by tag.
>   - Updated of_map_id_args struct as a wrapper to of_phandle_args and
>     added comment description as suggested by Rob Herring.
> 
>   Link to V2:
>   https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/
> 
> V2:
>   - Incorporated the patches from Robin that does the clean implementation.
>   - Dropped the patches the were adding multi-map support from this series
>     as suggested.
> 
> V1:
>  https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/
> 
> RFC:
>  https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> 
> ---
> Charan Teja Kalla (1):
>       of: Factor arguments passed to of_map_id() into a struct
> 
> Robin Murphy (2):
>       of: Add convenience wrappers for of_map_id()
>       of: Respect #{iommu,msi}-cells in maps
> 
>  drivers/cdx/cdx_msi.c                    |   8 +-
>  drivers/iommu/of_iommu.c                 |   6 +-
>  drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
>  drivers/of/base.c                        | 213 ++++++++++++++++++++++++-------
>  drivers/of/irq.c                         |  11 +-
>  drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
>  drivers/pci/controller/pcie-apple.c      |   6 +-
>  drivers/xen/grant-dma-ops.c              |   5 +-
>  include/linux/of.h                       |  30 ++++-
>  9 files changed, 237 insertions(+), 71 deletions(-)
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260301-parse_iommu_cells-1c33768aebba
> 
> Best regards,

Hi Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't
make it into the v7.1 merge window ? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another cycle.

Thanks,
Vijay

