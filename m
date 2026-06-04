Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dVkPH57yIWpBQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:48:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE6643ADB
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="V/cj+T1O";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=I+bnvopM;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=W2QBomPG;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=gIKL2b+g;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328583.1592978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFv2-0002VA-Ea; Thu, 04 Jun 2026 21:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328583.1592978; Thu, 04 Jun 2026 21:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFv2-0002Sk-Aj; Thu, 04 Jun 2026 21:48:04 +0000
Received: by outflank-mailman (input) for mailman id 1328583;
 Thu, 04 Jun 2026 21:48:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFv1-0002SH-00
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:48:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFv0-00BQLk-CT
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:48:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f270-bab6-0a2a0a5309dd-0a2a450ba226-28
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:48:02 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f290-212f-0a2a450b0019-94a39217f3ca-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:48:02 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654J5cSF3645821
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 21:48:00 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010068.outbound.protection.outlook.com
 [40.93.198.68])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ekbe0c9e9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:47:59 +0000 (GMT)
Received: from DS1PR02CA0011.namprd02.prod.outlook.com (2603:10b6:8:452::19)
 by PH0PR16MB7109.namprd16.prod.outlook.com (2603:10b6:510:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:47:57 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:452:cafe::7d) by DS1PR02CA0011.outlook.office365.com
 (2603:10b6:8:452::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 21:47:57 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:47:56 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654IU0V5913785
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:47:56 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4eggry12vn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:47:56 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id VFurwVFT0YPuRVFurw7Qfz; Thu, 04 Jun 2026 21:47:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=i86LWflfbdRQYxQ8/glz7nIi8Sc
	I+Hzjd5gdA+tm5uQ=; b=V/cj+T1OqAYg050sXeyhXyMPC6tdjCRuCIZVDHgP3+J
	NWYHFgFI61ZIqNvLbJcN6ibWawEwIaKV7dbzfB1gxTM28bXKcn43pT/0gvu7XVLc
	Y5LwTzL05EkR/8X7yMRY+VblXxKehYAbGNaaXKiVG0cuh7s04pnPKlUVTETccfV/
	EJE1a3vsjdwSHw7U23h0ihjk7Nm4ydkbia38/dIBHViRqRAtX4LdW8vegqCa/mO1
	gfaxH1Ef/TKrLN86hURnCMee3HQGThT1rWrLpzvmg5wqjK6zYNtk/owks3KHwrYi
	CQyXkeaNhFIC/Afz8Za7NWMcY6QerCdle+LyOq4d4DQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gO66UPrrCVK01pcWxlDrAM01oKCjEizbabVPiglISm20BqI/sLA8VUimty5/gR9E20p5yJIBoXXqhRGjXAXHixe061ORJL608G50t6XOe6kCXfB7go9cdAGLt4YT3QFfmy3KCaIEel/Xen8q4YKwPqAMbbk+7tLFQ/wLqVetnKNdCXOHnBYl2gQsGfmutfFN2DgpuBdeWNUKI5K4GD0KM8RiTjtgcWFOJvA3CdTqcHf+7h6pX4Zhsyh93XgwQp8GD8IR5WOm/GR7cFr6A0RxAIRryVKSSeGXnlZTYXOdZsIK68mkspYckY+U2GRfVlryn8ov+mN+nyyXQCCEAF1dqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i86LWflfbdRQYxQ8/glz7nIi8ScI+Hzjd5gdA+tm5uQ=;
 b=oKQb8h1jlv3Hk8nI/U7A+SrT/s96nG7+CabFDDLX59T5tqj81eTcIQ187pKDYMyzFZcW2yYvUIpjrkuA+Kr3423uNKBZvyX7GvLR9tOz76CNlGSk3VtVuqEvQAbENN79VGkiVOdz3VjXGeTG/0umJSu+YdsS+d2FfVZ143i2uwihLRRkQaSnx7nin5ZxmCewx1o1XbLw2hM4+tkp2KFCe+LJTCohyfEe30B5v2gFlXHo6TM88Sbg+uAMdMeeHJSvAq6l7mfaZEPqlGZdjN8296ugfh+i77FXsNEtXK+pkwkao1oXoevV1YoFr2sq8f5oYHkKiJxUZyKOXsmMHeOHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i86LWflfbdRQYxQ8/glz7nIi8ScI+Hzjd5gdA+tm5uQ=;
 b=I+bnvopM1M85z9nfuRjpOFi9CBeewvIBnSqcf5LOwvGdp4Xh9BmVYSdZ1lGwYqxItK4m600WYxSqy/iNxxYTiyQ3GEim+fVFLQqg1uckwPqoszzPNJGcjxOJDvWkAhuVL8+hnGvkXBCVrnL0nCKJedByu4/gNXSQ6EEmkzADQ9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=i86LWflfbdRQYxQ8/glz7nIi8ScI+Hzjd5gdA+tm5uQ=; b=W2QBomPGwZOu
	EyqOkMNjE69nHTpS8zvn/O+yAY77hf5cutAtQ/dDbv1ertg9qoz7ww0T/UbC3g0u
	eRb6MUwNPu50Y/2WbRTmWDh+vrrnzxyFz9ii2usepjPhV4VQgiygEtNd+VO30nT5
	NHZdg14gQC8QcF+D4n6+Tyvo1HKIngV155ODUgifvDQgYs36YRoKXAoGZ5RSRbgv
	2PvzYNigO8JPIlGlhuDUhQ0ESIoR+A0j86xoTu3lN+y9W7SM2qoAON7SZt26u07X
	OMLtuGa4Rgk5oUrQeBnITh1hN6PfXUX3blpvV6V1/uBpjxAe5/LjRYcBPbwZnGXE
	gd1QKk6pXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=i86LWflfbdRQYxQ8/glz
	7nIi8ScI+Hzjd5gdA+tm5uQ=; b=gIKL2b+gnOcqUSurEUbKG2xmGDUFrXcHIaEC
	zUEsGy2u7KQdEbtmA2F5fxHkGDq7E6tMQjB0hhifmdrKz9gA7w5WtVDLBJyxXczq
	HRDK7GAINQGJHxQ+n8ey7URm2xx2bHTinRr6KqMhneW4IPUUEAfp4GFDPjxThCOn
	A5N/pUl1HneVtBdnB02ehJKv/AEB99LFl52EWWIrfrgM03+N/eVoPMcm4W+QOY4V
	dwN8Y8udGx/UfdsCxmDSPPjdwMu20Q9PWFWoTucJXfA2zpPR/S9OI8CQjviQvCET
	x4+tuvDO3YKRdwWQ/i6a1oDSHBr5wuPtQHk3eQzVEim7F5iwQw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFurwVFT0YPuRVFurw7Qfz
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 4 Jun 2026 14:47:52 -0700
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v5 4/6] argo: fixup argo_dprintk()
Message-ID: <aiHyiArzNCIZ4SAL@kraken>
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-5-dmukhin@ford.com>
 <f2007ab7-05a0-4163-b5b9-9300453fe653@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2007ab7-05a0-4163-b5b9-9300453fe653@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040213
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH0PR16MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf0c582-c2ec-4f1a-9c0b-08dec282f09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xTUom1HbjXGJtvUINQRlvXpfgohImmhC986UyNiHTvU1N4RJKETHgPAleVYas338mHbbsVcoJuIiD6sUy1gGjGA1Nwy5mSENUuwZmBwOEp8boz36bZy3MAduKV1P9ab1BDK00HNkNMx5RtckjZSlmEyoUZ4+0YmF09mEkgh/SlX2+6+P4qLXChCXy3h4tUlTd6/6ZP3hCWdm4dx/KtROGb6z4s+ihLBssbgv5SyPRh114iGQGPanVEh5wZGywOk1Kkd9+peL/qib6Zp6nZo3cNj0W46sBAH8xQZAtkHSHH/VR0snG5sMTGbxIs/3ysUqXcYORjK3VTK/4Iq2I41gWaVfrbWBkuvY3iXFxLzWHIAQ67RNBJw5z0Pi/Mfo8kIVZxRIU/gASanTvh/Ngz6DF/0QJif7INjfuk54tj1ekno+Bnre7JY4UFmkx2I988YcrL4BBddWqLt0odvPWCR5bm8uhvW7wJMNJChhoLrj+J5vtxN1OMmlxU9JIavg/wG2nM/lrb1DTBok6q6Dw3H/xYo3i3w1zFuUgk9vXZwOpL7QwOSoQPyoSTPv7WwlFWOLYl+p5GEg/OpWGewMX6unRwc13gXQPlAZWK1ZMHAbaQI0XJwWPcYgcbA5jW6ln9Rc6+kyx0RSMRB1eKJ60geE3qLM5YrmGxvEA7jO3AGXzoByaIwcQNwWPPuHnh+c3+/l2hIN/ZOC4R543gEpVBrvQQh5ub6XUMlNe/NSWtOcKhk=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yNreJkzYohryCTJ3qyFUoggbHHa86J/bB6+e9ixEU+bzW7dDhrh7JLEVoFHfw7pE6gWikc344Vwl3ZRWAe3znGRqEpf88a7oBX6BM+nzo66tUZOuzLJn7RNKbAfasMBWbL2W07d1wPdqTLA+oXCLas6bH0ZBJAxMV03lquVLF4Hn1uJTsvJmYsu6j0cGZaMsBXdPRA3fr4UVMgVNmicJMVfj28aFKRv+oew3CTrlyvf5dLgy1DHWY7YkQvO8MwQVMmNgsdWWT/PIwu/iwZWzd/qThCbOsqajYAVNIOOYLneyIcauMpbrRSj0T4/eUpMu8NazYGIcbU2u4llf7loIT9H8N4sCVJtBBP2O8si3XneoUUXNcWjELTSWKZvB+R7hLfWM9iU308QnelvMWtoy0JOlNR+ceBegCmOc19zzoRxYvU/XTAKYT/n1qTqNMHyA
X-Exchange-RoutingPolicyChecked:
	pJ/xQ+aDwbt424hIaX+2rpDMgP6UqO98i6/xLaNjeh4n0ZqWT4whNfzgmsOT0kfdT42all63MdBlou91mS+MlgS6WMlTWD/AeyURc/Jn6Tb6Jq5CQUQ0aBV/IYBMZOIvmjxE1sYEInRk2B1z2T7ovs+c5WcHNvkIER/MRU5o5nNeuX2KuOZAnCypIElesJwm6Sc0an/sY1KhQ2iS7VMmgm0tvjeyuFjB9fjojvAKzprOQczdwo84pim0l6MTvME6rhkL8+nTmf/NjXP2ZrgblRI1LmvkCLyhK9utn3PrpAAMDUYVueZYhmihhuVARw9BjvBG9WCAk9oJg+Zrl8i+/A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fYOuyUfw5ImfR1kqLO2b4+EsNvvivMwYejsd0TNWyw1feNaMypmmUsu+N+BTLhOcS0pHba7lFNO2z1j8mnYyasjpj/zX+yWw8hID8tu78FmU895s4k9R6ym7K8YHUkzB3X2w9sIcef6W3pdY3UoG9QaUDHClM+UgkOZyVmIMX6eaiJYZzFSxQj2Ei0urkUL9gbWg1rs3C6W+blM4gR7LVXV7ECKhhPMIg7zvHbUuoSizIUD+swOgDbm0+GFWfYaGfzobjPANWHCbzkgUw00yCAK9+eNyKlXaE5SQvzhdoVRFweXbXNfLOh1jsU5ffYGdZAu/eV5GIiU6MufhF6sX0ckPk3FKkV4nU+bTwErwZCxt36y72394vONdMREzq4u4IOqorocd5nJq8aP7S7iYZW527wHB2ybCelkWTymva7g4/7jsC6y/x8SiaYWzc4jj4RO3LNcDuq/xHbiQsiY2OfQHexsvS2C8VcFqL4LOOie6DbjfOE5dBAwIQer90fIStn4lITKegOCJuN+Qu84FPm8rjfL3OlEGCEu1oeZ+dRXdJjGL1D9bzRPlvCG5Kua96Qu7gIcIGcu7YqyJxPtOghJiC1ciSr2AU5rubFiB2ViIym9Qkx91U0F6Ng30SWRX
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:47:56.9333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf0c582-c2ec-4f1a-9c0b-08dec282f09b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB7109
X-Proofpoint-GUID: U4sfbJ6k2J6Y2skVxeqaakB0y4ZW83ae
X-Proofpoint-ORIG-GUID: U4sfbJ6k2J6Y2skVxeqaakB0y4ZW83ae
X-Authority-Analysis: v=2.4 cv=Efj4hvmC c=1 sm=1 tr=0 ts=6a21f28f cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22
 a=cbNQJ9GKAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=JOVtEiCz2LbfareFmNoA:9
 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxMyBTYWx0ZWRfX05WbxZSLcMCO
 BeztTFlKQO4RW+ZUNFzpwIFDhJylz2AVGDEU3dYuJUOvSQWxPL+q1UCA31usmbhTJRg179kDGYk
 2CjsG3y/+ywysSS8mR+G5vKYJET4zDHU6ej1IjV6T21+7fiAv2JVgPUipdq3wcjwX4fhHhxtaub
 YFCNQ/qd53yfELbXeTFBmIw6SnAkmBeb4b+fKaJs88Jw+/sdvDP09Kn2+MkPjeE6neDuwMSCc25
 a2xC1F0BqujDGzbdpnT3k+pxJ/RA6ysN5rWgPD2upECAH8HDBJP8oRNW3Ak3Ndt3qAojp0rs8+n
 7ld7+1R8yAZXY00Fm43ys9iG4DlB0NrLJ12hswF5pZSNF1AWqxFoXCiLOdXRyNqwpL5VSxCJCmx
 5oqCttZBZ7AAdgDqzXsC2A81xJqZNMT0gu6xT/1xh6o2FfiO08nBOKewY2tjlwXmQtbgOsUDnVp
 H3cskKUpfnKIHaD3a2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040213
X-purgate-ID: tlsNG-42698a/1780609682-1AF76F3B-83DC49CA/0/0
X-purgate-type: clean
X-purgate-size: 662
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11DE6643ADB

On Thu, Jun 04, 2026 at 02:51:50PM -0400, Jason Andryuk wrote:
> On 2026-06-03 15:41, dmukhin@ford.com wrote:
> > Current argo_dprintk() implementation is a wrapper around raw printk().
> > 
> > Rewire it through gprintk() to allow for better debugging context
> > (such as domain ID).
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> > Changes since v4:
> 
> Oops, sorry for replying to the v4 patches.  I'm in the correct thread now.
> All the patches are unchanged, so the R-b stands.

Thanks for taking a look!

