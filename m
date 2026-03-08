Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBRkD2XPrWn/7gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 20:35:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AD231F1A
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 20:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248994.1546541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzJtJ-0003Bl-Hl; Sun, 08 Mar 2026 19:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248994.1546541; Sun, 08 Mar 2026 19:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzJtJ-00039c-Ex; Sun, 08 Mar 2026 19:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1248994;
 Sun, 08 Mar 2026 19:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VeQK=BI=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1vzJtI-00037z-9C
 for xen-devel@lists.xenproject.org; Sun, 08 Mar 2026 19:34:16 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73b53fa-1b25-11f1-b164-2bf370ae4941;
 Sun, 08 Mar 2026 20:34:11 +0100 (CET)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 628CPhag3683510
 for <xen-devel@lists.xenproject.org>; Sun, 8 Mar 2026 19:34:09 GMT
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14u517-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 19:34:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bce224720d8so6236825a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 12:34:08 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a4676593sm7818909b3a.28.2026.03.08.12.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 12:34:06 -0700 (PDT)
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
X-Inumbo-ID: c73b53fa-1b25-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DNMdCDB4m/JS2Eqb4Zd/0G
	6oEd9rQSbuN+RA5pJMqjw=; b=Iz5I4QQh+5X+EdI7ZbWYkCwMd0XsXKEgZSSk7u
	fZ9Y3l6+S7LKgAOi7D3AfsdoMASdDUtGTK7RZzHvs5t01JfUzEaojPuJ6bMc9ofc
	2/bd2VGoUOQMpwJRFzwOorskgCxsdkMtTQplIHuOzWjx8AvvZ9lxxJMGtGLNxgSn
	anN7DXhtVfkGW27Ex2TmfG1rL90bMyaGXdzyW12WT3YHHeNaHtVQP07xfglcjK+U
	3Hq+dgArnD8ScoB11PW9t66PZ9SMoa2utjEkZ1vtKayFBjoNbGSTSExpPj7knnQH
	KyxIdiH5oJAi7giVdLeW41AZ3NV+Hguvx/+DxBT7wj64Xk/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998448; x=1773603248; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=;
        b=YtGBGotXNbZV8VKbqs1gxm9gdjEYdtiQZMp8ieAfQwTJ1g2/iYY33u4jXe5/BvH5hO
         0rTDzpp4eoPnjOKHEnttXJkr5guvDzdGEol9g2XXvp4B/eX0w3EXMDGSOsWSCAkYUVm6
         akZFdpCQL3O7UezlQ5nvnCOiZIas5mIxZPVbWCR0rzyKAWQwWbN4Z3dnauVqLQwXB8dI
         80Kq85uZ58BxauI6ohVmLrmnc89a/AY1FcaIeeADy+CxBukFsJkCo3kILIwNXC4dTzZn
         uoKMLIYbdwLQGSe6AN5L3SaxrvQnjnefmHlyGa8BJP0qrmZJmVTA9P4ZyptUn6zObdNP
         LNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998448; x=1773603248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=;
        b=nSBypgUzLHbRG7Ga7ptw6ISp970e+9l7jTgeV6v4d203QP8a6VrWJqLGFPRlUxVEKZ
         F74kz8fNQZnwAAyNlgS5PdMBITej5ZlVt1vPslxLyb9BQtH4bTcnatq0wF9Rogmjt0Mj
         7Aau6cW8RcwCVvztjD+0ZiftZSi+n/h2YU4CmcsyGFq9HVOzBjwQ4KYw/rzh9N13lo9r
         hpFQmCoRwH0RDisKcrWWmfsz4V2sH1/VbqPdozzu+YiuqMkSrjQCnkQfBvTS+EXySHBw
         4wE4JxF+9K30m81xGujzLOBmA2bXVC4y7Dco3s/C1M2zrXadIz83APIxmnIqYq5blbs6
         BIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjrlD+B3XU1Hul0g9sopb0Ff0ZhBWcGCLqccYenmz/a3D8YV2fXyHY0K2cG32G4LuJ3Un4U46LT0A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqO5Wxdjz8tXQ7uHgkszGDXdIuUovtsZ5w3/hRxmkPjw/TDIwp
	ZoHOEdgdVbXMdCytypbbAEkVVvgbu+t5qbtw0zk1rIrgq507yfiKzuaiVdMZG0VfaNjTIvYGg9F
	Rf3tmokVMKF7xQt2e17lKN/RRp6pDb3meRhh6RtdoiYAR5IZGl/A3uPA7vOPdsoKssjpirw==
X-Gm-Gg: ATEYQzwtKW+b7CzNxhG9mueberngpIiupx/uF4W1Rtrdp8frFpMtIFxv1WFKdke2C1H
	LTpZvmDnEg/bieBchwNLUHNqrXtVEiGsSI24SSHpE/C+eKw6Xwt7fhlf1VRCPYVi3WQc3rTjVas
	OmVMbaKkO755W9aZPXCewq5nM/1FObRTiITJtFz4Ux3f8OzvFOoyTY4ORrX5qNqOiX1HMnmsrpg
	Q7P4yes2SjlnAGSGh7eC/hTLr2L2tyRef3hsV3D/UKCrxm6tZ4ipKtFWFUcbNYLbMqvN+jGKrWF
	fLeyBff74XL6GbqHKlqnSp+lqdoVrjlcdrAmGsMDirS1qvjdrB9tz8VfAil8z9OI7G8Ks7N5jge
	oh2iJMAuYHZP9WNSxnTFFiRe71ettpE4wJo071KZKd3LfVw4dmI4QSE7B
X-Received: by 2002:a05:6a00:4b53:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-829a2e3d086mr8046006b3a.20.1772998447756;
        Sun, 08 Mar 2026 12:34:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b53:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-829a2e3d086mr8045981b3a.20.1772998447234;
        Sun, 08 Mar 2026 12:34:07 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Mon, 09 Mar 2026 01:03:36 +0530
Message-Id: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDPrWkC/32NUQ6CMBBEr0L225KWKgpf3sMQUpZVNgGKXSEaw
 t2tHMCfSWYy82YFocAkUCYrBFpY2I/RGH1IADs3PkhxGwPIdJZrq42aXBCq2Q/DXCP1vSiD1p7
 zi6OmcRB3U6A7v3forYq+Y3n58Nk/luKX/qMthdLq2JoGiRBPZK5eJH3OrsfYSqNAtW3bF4mVr
 Ue6AAAA
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772998436; l=4795;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=PtTdudtjBZ/xPMrnHDRK1H9Z6n/XjfTDJSglqtupcDI=;
 b=EBb8Dk6BIlgjCH0Fqcmr+R/Zem16FjzSLlrw2KGhDvNxeYgPJwLHInLgJNWKtbmBgHLkCc5NK
 xDxh7Np2VUaB9ZsluGW3jBruuRfE5BZGHAei8UQe3BXzG9rX5bRMd84
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69adcf30 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=hUMMoPFcHhpVZiwYRzIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: C3N61NEbB5_rPmOm3kCQzkC6ijS8kSQE
X-Proofpoint-ORIG-GUID: C3N61NEbB5_rPmOm3kCQzkC6ijS8kSQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MSBTYWx0ZWRfX0zoZVdlAmNtm
 uAobE8tvezPo4o5SDvQD3bCm3FmUBZ0pnAPTypm7zD40/zclABuj1jookJAWE4doA7V3O3pXZ+W
 IebCIpDo6urdwHsTOoTCq/hSbeq09d2m+HJrLc7JZ65v/t4B28A9mD+skGrDjmWoKr7bGl9jJ++
 kVfikDUCK1lA4c1M1BxbWe+oneqew3bxfDWWBdrt6dSsrd4nkuLmeVqSTZJ4ZdErl66dJdihlD0
 VANVG5o29r6zJ+LvGx3y8IBDLSorsSvY0N13rFbZPKE/751kEQB3sMe4lk9hAgaZgas98PdB0ih
 x7TuHv8xZU+p4kYlYI9TFUB846hsCDHD3V4jUTripbDaWmJ3oIICtSceNI8ggYwdLc2nlTN0plD
 nPGhgkFto0CNvVErIy4rKsOOdABwu230EnftZNL1KngXuP6qy0+0IvBSjRlEGtTfpD6x3DGkpxG
 e0++g6ERVZKI93gcgIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080181
X-Rspamd-Queue-Id: 968AD231F1A
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:vijayanand.jitta@oss.qualcomm.com,m:
 charan.kalla@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

So far our parsing of {iommu,msi}-map properites has always blindly
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

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

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
      of: factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   6 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 202 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |   9 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  28 ++++-
 9 files changed, 222 insertions(+), 69 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


