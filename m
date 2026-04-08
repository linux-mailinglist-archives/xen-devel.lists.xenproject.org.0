Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN/MJyEo1mnqBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:04:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E63BA400
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275577.1561359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPlF-0004pR-Bc; Wed, 08 Apr 2026 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275577.1561359; Wed, 08 Apr 2026 10:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPlF-0004mx-8l; Wed, 08 Apr 2026 10:03:49 +0000
Received: by outflank-mailman (input) for mailman id 1275577;
 Wed, 08 Apr 2026 10:03:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wAPlD-0004ml-Sb
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:03:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPlB-0058Wf-N2
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:03:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69d627ed-2eae-0a2a0a5409dd-0a2a4507a306-48
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:03:46 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69d62800-ba2d-0a2a45070019-cddcb4837734-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:03:46 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63877UmF1619593
 for <xen-devel@lists.xenproject.org>; Wed, 8 Apr 2026 10:03:44 GMT
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrj7rt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 10:03:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c76ad3b732eso9137305a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 03:03:44 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9b5fb22sm25805584b3a.26.2026.04.08.03.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-Id:MIME-Version:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7S+jIsI8IolI8S/0NzS+SU
	gTDKQIENCfMEWeyQ17RZs=; b=E5a+CiVGxDzyfBjpQZeW+h8coO6mDpkw3C4VLr
	Il7IruwRRyGVifBF2tWEIh0RITVBUh7wynkqqBDiu0qvVthDXizphb40Z0fXg7l1
	4ePD+LWpuMLVmio17YTK1QVRNMPOyHYbMWFwoed9dZ4dSV6Mg9UfbYAstBHh0LrC
	ZcRfFoLo3Ctd4aDMK0HXfG7wz4TO1bUEzKb0WISeGCY/qyVcs8KZiv5bhjTW+QUi
	MjqFoHQ/Aq+Lu9LM0xUn0dFnnR/PTKUZzQwF1+yIbkQFbo36+N0foO3Q1elT13BM
	ppen4soBoDXUil18hOzE/8lDj63ocv022uBlYiZUp66jejBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642623; x=1776247423; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=fX7swSWBn02S82bZFlrwldi8/ZytSEL69f9F8mIuCnCDu/MTOqdYQSm2jsXgcphqZw
         tL2Hm5Hxr21LSdfya72/Qpu4QOrqNH+8xSM5GLQT9K9O0vDtp9cClb5x/zrmyrgd3N8w
         gUx5J3UG2tB7cXzUdjSrSKJ/hFuaQCTl7m0gefUXnCDiVOZrI+mOOI97GZi8C3T4SMpD
         RzuRRf+hddYKKpJ8HwG1ZEEKgC9D43Edbj149fD472Y2z/DbNZw1+e+JDw+hrovngyeV
         4iQsJMFS6M1GAsyOeC+uULNoHMlj0BetcX2oBoee5WGe/JYgiZSsvOQiH6xxUZt+vW8h
         PshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642623; x=1776247423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=LX17POHsye7lee7oV1Z2rQy8gJNCGqdSAiIl1PTYO5Irx6Ter9Kp9+UgwFyp/zyQGl
         pWHH4hDITi/t0DJLVlkzMTUG+4/mSmuiiBQkiWYy3mtC1SVH6ZS1agn2O2znXL9qkddG
         kbiINb9S0M9qEg97aIFLbOdnQmw4TvBn91cDwUw0FFpf7RRhsZF/nmHOKVaPxO4ZHgoR
         B5AZOqG8mrR2IOS8DXopYrX/tLKTWj5QM0+4tfONsTd2NzWdWaMxn/HgFv3jsZ/jsDfO
         xrhrgqNyBIEcRHkoplQdq2iYAr1Org/dJclUiTuV3iyOt20PdY5wTKTYpmxPUhP16oHs
         6oLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdWY9YyV60Rq++oyypFozdUA6HEYp24DdQB0lkA3AhQUK7ll/WbnbEtYZ4DZObXJhWA7KB2Z5hXvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8CNBnFUl7BRpypsfKeURJROOq2CYeQXEn/tMJz3cIHFC7o357
	lPd6PVMCJlOA1xGn+9m6lhfpgpmIq5WlqP3VygM3AF9208oc989ql+3M+Nw8xKZpsUeU6UZ2/HD
	C5FziIuHlW63B1UK93m87wfYb26tBWcgIUQS4TpD3F+608rIMV+tlMbMWlEblGRMcI2KRYA==
X-Gm-Gg: AeBDiev0+QuSdaLxFZuav3FBWxRBhYgUGbPKSt7ibhqOo/Rpv0j1GOc3MPBGldjJNYC
	vnpw5GnHg30bUGSCusjsDk81+zoVnTVTPH/F+GrqC3B3SauC7OWWiCzU/+1sPilxa6SVt1M8QU3
	9v5d0qtgK92A9Obvg8ZR69Xi69WnPje8yj7AviAoC8ox54++kN8m7VaZUHT9WjAMn2BQJ6jt7q9
	CCSapEO4mZQlbaCntPYeNWZk8D6wbACO2nxZDp4d2IyteX2uggL7GcCr0yO3OiqUbZ/C15eh61f
	+qeWrNXQci/FmnVScSJWCBmSrh1FqqkDywyGsvrTTZpK+lGzvY3+LqjC3GOEbPYOKbSOuUH11qU
	C7V6YjES/RLte0e5SM+KuzzStl4Z8BWSvno4FZL7s3y3q8lgUvwl6R9/b
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594608b3a.17.1775642623063;
        Wed, 08 Apr 2026 03:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594542b3a.17.1775642622439;
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v13 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 08 Apr 2026 15:33:24 +0530
Message-Id: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwn1mkC/33PQY7CMAwF0KugrCcoTkinnRX3QAi5jgORCmUSq
 ECod8ew6qKwsfQt+1l+qMI5cVF/i4fKPKSS+pMEcD8LRQc87VmnIA1lja2MM6DPmAvvUn88Xnf
 EXVc0kHO/VY3ctqhk75w5ptsb3WwlH1K59Pn+vjE0r+43bWi00asALTETeYZ1X8ry/4odydRSi
 nqhA5ip1MxJYISiykZC9Aih/kTBhLJ+lgKhIHJET4ZrS58oO6Hc7H9ghQpMMTjjmbGZocZxfAK
 rbA/VmwEAAA==
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
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
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642611; l=6465;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=k94qEoqP6LeaqMjZ56JkwcDL9Caxb++/1ywGR2aNrcE=;
 b=Fa93m6jMAv59XO0RGhV08H7u/lbeMgEu+VO89mYeYe9+udo03+OfW5l6aRjt+/+cujOgn9u6U
 /txq4POfFP1D4nQK6IieIAafLv29dRyBbPOkaAXwmZAh5zFPlwXVp/j
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: LRXHuetsYPN4AIdrux3S5NkkT1dYfojD
X-Proofpoint-GUID: LRXHuetsYPN4AIdrux3S5NkkT1dYfojD
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d62800 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=qMDWySynzQg1s02BiloA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfXwTNtKqxCEoD2
 CVkeZaP3+CfDG5O+zhjTHt/VC7/RVzguDDx2pbGbRh2Pn6SYfHdvdODmTT7RqkfgzKS2h4GrB79
 vXK8D9sO3f944OtipA3xjougtS2o084VN2V8wqOFjLGAFpzht9KX4wZTSAYz0eGCQmDNxdvPxds
 /vOgmS1BHlAqQu3cQ9wN0K73FcVJx/5tfy743KQP2Zxyl9Rt+MEQV7J3fJEPG6RBHGhEraoTgJe
 EHfjYxm/btGBy9i7xCmUFG9NbiYeMPiCVgEMsV5qqqyB1CJMYa+FInQMXNaem7A3aEBtb/FDH+0
 OIrR+Vc+V43SjWWti2u63Q7IMz/LzaJ3oHzdnS9Cqw3hO5NzqbWBiXDDcSsWeWDFrG4/zVsDJMc
 OnftxPFn7l1JSIJn6cu3oz34N2Hl9ayPw3JO1NKk5Jd2c+WpEO5mSDs/D1H6xSiujZ0AK5f10Sc
 S9FSExVml65w60vbkdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080091
X-purgate-ID: tlsNG-ef75cf/1775642626-89B5041E-287AF279/0/0
X-purgate-type: clean
X-purgate-size: 6467
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:
 charan.kalla@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 207E63BA400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't make
it into the v7.1 merge window? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another
cycle.

Thanks,
Vijay

V13:
  - Fix bad_map handling in of_map_id(): 'cells' is re-initialized to 0
    on each loop iteration, so the !bad_map guard was insufficient, cells
    stayed 0 for all entries after the first. Fix by explicitly setting
    cells=1 when bad_map is true on every iteration.
  - Collected Acked-by from Frank Li.

  Link to v12:
  https://patch.msgid.link/20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com

V12:
  - Call of_node_put() unconditionally in imx_pcie_add_lut_by_rid()
    thereby addressing comments from Bjorn Helgaas.

  Link to v11:
  https://lore.kernel.org/r/20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com

V11:
  - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
    per Dmitry Baryshkov's review feedback, making the filter explicit
    instead of overloading arg->np as both input filter and output parameter.
  - Removed of_node_put() from inside of_map_id(), making the caller responsible
    for reference management. Updated of_msi_xlate() to properly handle reference counting.
  - Collected ACKed by tags, and fixed minor typos.
  Link to v10:
  https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 215 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 242 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


