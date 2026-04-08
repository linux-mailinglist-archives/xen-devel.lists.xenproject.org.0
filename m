Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLDGH1co1mnqBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:05:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EC3BA42C
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275597.1561386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPmM-0006H2-AA; Wed, 08 Apr 2026 10:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275597.1561386; Wed, 08 Apr 2026 10:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPmM-0006Dz-6t; Wed, 08 Apr 2026 10:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1275597;
 Wed, 08 Apr 2026 10:04:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wAPmJ-0006DS-TK
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:04:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPmJ-007JgT-9H
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:04:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69d62834-bab6-0a2a0a5309dd-0a2a450ce9d2-0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:04:36 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69d62820-f40c-0a2a450c0019-cddca8832f48-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:04:18 +0200
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6385WD1b1006023
 for <xen-devel@lists.xenproject.org>; Wed, 8 Apr 2026 10:04:16 GMT
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpaqdy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 10:04:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-82c646e980bso3136999b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 03:04:16 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9b5fb22sm25805584b3a.26.2026.04.08.03.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 03:04:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOXXFN9mhZ7JxzI+hTQo1c6CYH+05MRwTlhFigPlnEI=; b=pMZPZKCo75OvsLso
	d9DPZFL3vc8yVgEVCwLlGHiqOMFIqILxswpmIsseKtSgLpSsmWLenSfjDIc4ws6G
	eGJNHOkLGFAG2sbF5UA0EV4mr6wiXjL0PsTvNuVsnTlJr9tGWike6QP0Abz3Mp3K
	buYfJvEDdLkDQtnP4mokOvpFZxvJZYeDlUNDdSaLBdbQRr25ah4tgvr6FpjOr5nH
	HlU6mnURWxleTTGrBlFmhtavAfK8U61f3UTpCrLzGVUrxrkXkn/Rzfc5o8cs2V6f
	Iv4eR82dCqRZ9zJTtKcKRSpbMm/EOwU0d4YQlCtG07pZOeVA6jB/lSRMTnWT8SfA
	b8nmaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642655; x=1776247455; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOXXFN9mhZ7JxzI+hTQo1c6CYH+05MRwTlhFigPlnEI=;
        b=kDJXMFyFkyYNcqd3V4kA6oz9XglN26aNypv6axnvSwGVvsKArckVeJQ7p4gW/S71U0
         +MCrh8iCUp2q0ffwcZNmBrZOQJTA+82ke56qZGDaGxLD29q5j46EConOSnsw+mVQRfnQ
         MpP6eAjAmZcq4JDAGjQJO3ZTLGC+jwqSuIqVpIhO673o3CQGPGDH5eGQ/Lj2vTzIDAPz
         +r+DgiVU5hS4mS/qpx9a6v7mKuRbGokibpMMcyZhLsF0odQNuk9mSFwHXhdK6oNEL6Jm
         lEXxHh8qKQBu19rMEZvpZsh4cW4oQucbP9uX+BZ3bNwllq4Cjbn72lWaqWS334/FXwsn
         dAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642655; x=1776247455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fOXXFN9mhZ7JxzI+hTQo1c6CYH+05MRwTlhFigPlnEI=;
        b=MZSq8DXuvbgKmDQxroszU+Z+9OFmzwy8VzwkXq9IZ3JQ1uDUcQ3QVK2guGFGTgw15f
         QwfdRtY4cmYA0ErHm+mX8CDTGHz+B6Fk7DivHAmIMpNKpb8kIZdkGjVzDOUd3gfa/WvK
         fqYf8RxGn5R3GmFHpxEpeXMcvoiyHxUXETkr3if27rS+Opqqv7QEO1FtCJE0jaYQLnSt
         zolIzTgY/U+6tAjATIUiddOZol2fiCwwlCJ39hB3dTSLAsPpEugjiWFdOLDD67SIq3a5
         X/LFaGuZrgoo3cF54uL+UI7+PNiDWk6jpb+Zie3KyIDAcEn0lt8DsFImYBQNLV3LHw3/
         vBxw==
X-Forwarded-Encrypted: i=1; AJvYcCWwuFJdvnBX5KsK3iBxuTggqmkzTDFsLut12ykx7Jn2yg1GRQ9xpitK6NkQT2tX9IqqeIyDr+gPalA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxaj+VmQd1FYPyKH7MF+poF8u0Pc3QnQBxzMMrEfcjLYO5g/TiV
	GGYJicfh3qstvaMxulE0JiNPp227Q13SW+Zi+4CHPwyD3/1Y328TxfTy1oFAhc34T/uFlweBJdO
	poe71V23TFAut6LJ2jeDpZq3hXa7BlgrQdD/NhR6PfotiQgS0xdEBlQOlqCp8mfV9jIvUcQ==
X-Gm-Gg: AeBDietj0niRrnsaRjaUrOniKiJFyJ13+Ie8yO1GoME0ZjryWvdoHW8T/iTqavZD/LZ
	l0NRyXXOZ14ybr2E1ixfsL3O6Pi0frkkSYsdHsvLKk+n8Tj0JXLCovCzG1g0eqG5i9/OJRlZP72
	gwKVfrWdarW482EcOshrEctuJPkh7AiBDIHaq4CLq/tCIVP3fmKsuaKtFNwkxNnOaKiePlgu207
	5Fi+pkpHPGqcFQIcT5PKF7sQ647xdy8Gnufet8o9uyjhMam3rfrEk+7aXY4GGqTZebYPoZM2hZG
	S/Yl26jPCRpqVSQHEAy1xiQOXEr6RbK5rzJ0VqkLk3yn3rHZ9QWqvmgVf/fADpuRrLdDy8VrKrH
	w4WHdLO6c8lXUPGZrwuEwf5zk33SsmnjOP+jJrX1FVvzhdyAhl3lNpW3O
X-Received: by 2002:a05:6a00:414b:b0:829:7a15:9b96 with SMTP id d2e1a72fcca58-82d0dbd3ad4mr20930784b3a.54.1775642655245;
        Wed, 08 Apr 2026 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:414b:b0:829:7a15:9b96 with SMTP id d2e1a72fcca58-82d0dbd3ad4mr20930728b3a.54.1775642654481;
        Wed, 08 Apr 2026 03:04:14 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 15:33:27 +0530
Subject: [PATCH v13 3/3] of: Respect #{iommu,msi}-cells in maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-parse_iommu_cells-v13-3-fa921e92661b@oss.qualcomm.com>
References: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
In-Reply-To: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642611; l=12022;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=d1eDTLSvaaoV8Pjb6ssN/wlaFmWHAsxlhBaIWB039ns=;
 b=Qz9Bew7teeuYpMRibThlE+2spUrFr6YAsTdYy+DdombPTIwVDXiEwEkO1fgZ/TZdvZ2d817JE
 fJz68Xogd71BSLUNzAZKADh171mv0irdXgfbICdZqYgPzhVLjuc2+8p
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: hMGCanpU5PH0PNdHNHlKo_Dsf1RuNZnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfX/CyDT3WwlWj2
 rGxKLeqXsmoVYlQIl7DEZEA0QnRj2bHAVJFPggsgVd/JwDpOoEUAEReVxnipDEzNG30WUqaeiPF
 rybvQKPn72ID7xL/F7qaYL2/0KfkFBgAUj9QmsfIeidzin6sbQq/Fd59C0K4XPQqmpmb8VpHDDQ
 yKffM7thprAhsfO6DOaHQBYaW1mcgUF/RIerhYbYn2cyBUzQ3qHQ+VSPiHV/hDNbIk0zi2Ffw1o
 cE8tcsn80tya+EDR/EKldgU/zvdLCyzrRcN7Op5Kjf0+G0z7I8lJy1D0ICjP1czPxyOZ7Mm4rxg
 msyRM0eJqvZtMe7eUZpsv5bJByZFo/FVFmnYlybQcjPY8U5BYaFuBURwcd2Edct8dga6wTzgpsy
 EM83iNWgdk2ttGus7j7QL41Ci7lMf6Ee8Xl3MtAc0QAYkrhIUYO0zm5b/Rja5ilw6vTvoaQdZva
 Yh//AMaMH+yJw3Mqhbg==
X-Proofpoint-ORIG-GUID: hMGCanpU5PH0PNdHNHlKo_Dsf1RuNZnu
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d62820 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=klF1l1D6msg2vEcBgDUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080091
X-purgate-ID: tlsNG-d25034/1775642658-FDD53A3D-3874DBFC/0/0
X-purgate-type: clean
X-purgate-size: 12069
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: BC3EC3BA42C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Robin Murphy <robin.murphy@arm.com>

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use in being able to map at least single
input IDs to multi-cell output specifiers (and properly support 0-cell
outputs as well), add support for properly parsing and using the target
nodes' #cells values, albeit with the unfortunate complication of still
having to work around expectations of the old behaviour too.

Since there are multi-cell output specifiers, the callers of of_map_id()
may need to get the exact cell output value for further processing.
Update of_map_id() to set args_count in the output to reflect the actual
number of output specifier cells.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c  | 157 +++++++++++++++++++++++++++++++++++++++++------------
 include/linux/of.h |   6 +-
 2 files changed, 125 insertions(+), 38 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b3d002015192..2554e4f1a181 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2096,18 +2096,48 @@ int of_find_last_cache_level(unsigned int cpu)
 	return cache_level;
 }
 
+/*
+ * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
+ * specifying only 1 cell. Fortunately they all consist of value '1'
+ * as the 2nd cell entry with the same target, so check for that pattern.
+ *
+ * Example:
+ *	IOMMU node:
+ *		#iommu-cells = <2>;
+ *
+ *	Device node:
+ *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
+ *			    <0x0100 &smmu 0x0100 0x1>;
+ */
+static bool of_check_bad_map(const __be32 *map, int len)
+{
+	__be32 phandle = map[1];
+
+	if (len % 4)
+		return false;
+	for (int i = 0; i < len; i += 4) {
+		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
+			return false;
+	}
+	return true;
+}
+
 /**
  * of_map_id - Translate an ID through a downstream mapping.
  * @np: root complex device node.
  * @id: device ID to map.
  * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: optional device node to filter matches by, or NULL to match any.
  *	If non-NULL, only map entries targeting this node will be matched.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] will contain the translated ID. If a map entry was
- *	matched, @arg->np will be set to the target node with a reference
- *	held that the caller must release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	as defined by @cells_name in the target node, and
+ *	@arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np will be set
+ *	to the target node with a reference held that the caller must release
+ *	with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
@@ -2116,17 +2146,19 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       const struct device_node *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || !arg)
 		return -EINVAL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (filter_np)
 			return -ENODEV;
@@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
 		return 0;
 	}
 
-	if (!map_len || map_len % (4 * sizeof(*map))) {
-		pr_err("%pOF: Error: Bad %s length: %d\n", np,
-			map_name, map_len);
-		return -EINVAL;
-	}
+	if (map_bytes % sizeof(*map))
+		goto err_map_len;
+	map_len = map_bytes / sizeof(*map);
 
 	/* The default is to select all bits. */
 	map_mask = 0xffffffff;
@@ -2153,39 +2183,84 @@ int of_map_id(const struct device_node *np, u32 id,
 		of_property_read_u32(np, map_mask_name, &map_mask);
 
 	masked_id = map_mask & id;
-	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
+
+	while (offset < map_len) {
 		struct device_node *phandle_node;
-		u32 id_base = be32_to_cpup(map + 0);
-		u32 phandle = be32_to_cpup(map + 1);
-		u32 out_base = be32_to_cpup(map + 2);
-		u32 id_len = be32_to_cpup(map + 3);
+		u32 id_base, phandle, id_len, id_off, cells = 0;
+		const __be32 *out_base;
+
+		if (map_len - offset < 2)
+			goto err_map_len;
+
+		id_base = be32_to_cpup(map + offset);
 
 		if (id_base & ~map_mask) {
-			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
-				np, map_name, map_name,
-				map_mask, id_base);
+			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
+			       np, map_name, map_mask_name, map_mask, id_base);
 			return -EFAULT;
 		}
 
-		if (masked_id < id_base || masked_id >= id_base + id_len)
-			continue;
-
+		phandle = be32_to_cpup(map + offset + 1);
 		phandle_node = of_find_node_by_phandle(phandle);
 		if (!phandle_node)
 			return -ENODEV;
 
+		if (bad_map) {
+			cells = 1;
+		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		if (id_len > 1 && cells > 1) {
+			/*
+			 * With 1 output cell we reasonably assume its value
+			 * has a linear relationship to the input; with more,
+			 * we'd need help from the provider to know what to do.
+			 */
+			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
+			       np, map_name, id_len, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
+
 		if (filter_np && filter_np != phandle_node) {
 			of_node_put(phandle_node);
 			continue;
 		}
 
 		arg->np = phandle_node;
-		arg->args[0] = masked_id - id_base + out_base;
-		arg->args_count = 1;
+		for (int i = 0; i < cells; i++)
+			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
+		arg->args_count = cells;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
-			np, map_name, map_mask, id_base, out_base,
-			id_len, id, masked_id - id_base + out_base);
+			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
+			id_len, id, id_off + be32_to_cpup(out_base));
 		return 0;
 	}
 
@@ -2196,6 +2271,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	arg->args[0] = id;
 	arg->args_count = 1;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2205,18 +2284,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
+ * and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
 		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
+	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2229,17 +2311,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *	to match any. If non-NULL, only map entries targeting this node will
  *	be matched.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
+ * and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  const struct device_node *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index 8548cd9eb4f1..51ac8539f2c3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       const struct device_node *filter_np, struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
@@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     const struct device_node *filter_np,
 			     struct of_phandle_args *arg)
 {

-- 
2.34.1


