Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0dLlFZ3yIWo/QwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:48:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4A643AD3
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=jE2I6I2P;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b="i/Q+l3lY";
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=dt+dh3Ji;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=rhNFFd8g;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328575.1592968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFub-0001wX-58; Thu, 04 Jun 2026 21:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328575.1592968; Thu, 04 Jun 2026 21:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFub-0001um-23; Thu, 04 Jun 2026 21:47:37 +0000
Received: by outflank-mailman (input) for mailman id 1328575;
 Thu, 04 Jun 2026 21:47:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFuZ-0001uM-I1
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:47:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFuY-00BQLk-Kc
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:47:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f270-bab6-0a2a0a5309dd-0a2a450ba226-2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:47:34 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f274-212f-0a2a450b0019-94a38ff1f618-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:47:33 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654IpVrk2151872
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 21:47:32 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ekf0uhew1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:47:31 +0000 (GMT)
Received: from PH2PEPF00003851.namprd17.prod.outlook.com (2603:10b6:518:1::76)
 by IA3PR16MB6749.namprd16.prod.outlook.com (2603:10b6:208:51f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:47:27 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2a01:111:f403:f912::5) by PH2PEPF00003851.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 21:47:27 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:47:26 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654K6YO5133194
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:47:26 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeyps40y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:47:26 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id VFuMw8JocKoqdVFuNwHc1p; Thu, 04 Jun 2026 21:47:25 +0000
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
	:references:subject:to; s=ppford; bh=OKuUim0XHBTmoKqBC2L84b1tnn2
	gZJvVnuzUdKCrPwg=; b=jE2I6I2P8jdk/lc2+WyaWheU6eCrdVKhZ5jm8FJKin3
	eUh4l6OucwzXFdM5KsH5DAAM6FiM3V3q5sjRvAZ4pPYox7lDLAnf3zqQrE+eolml
	BxxQSzfo/ujFJF83zaCQzGWxCT0/Kb6dVObwgGeByetY6LC5Pt4mO2Vo5dy6vYcn
	B27pjt8SHOAPual+/ZMHf/j1LwJ9NPmkWiHDCMYG3hNnqtIR1ls6QMWcuiCmO/uc
	palaf+eufC586GsIs7tHQbe+wiR+gIQI4JpumefBzMqvb2HA8rW/befU2lGu1ZCn
	aqSl4QEzPDtn/Pv2ZIPcA1NCgF+iBRQDnFKl8lbXrdw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ty4XNM04o8hImDJx9KUGHtYgrfHwc5u0jkcotRwDNTWhuCMDoAs6lrg9te1tnH5nlw3HOrURmfTKyrXwnO44PeFjpzfkj55S1frsQoGh5ZAj77leTkMBSr7bckZUEWbwa1M1XwMMksih1Y8IRqCU/q9m2HitZE/C7051HpXqb9SV/odwF8eNWZSzYert4sXKpBnlJH7PGMXFzsDHysw16K+H+jm7ZbBtwoH1X6UL5gZZ+aMNcbU7EmymKL6kRe3HMrNPkx5L9OEqJcYRBmKY5anBVH2J9T6yDQUQt2EjxRpJ1jz1TOpcKkqasjnnP0c+ZRau1lggUrNkH/eLpNPmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKuUim0XHBTmoKqBC2L84b1tnn2gZJvVnuzUdKCrPwg=;
 b=P7StWGXFKzWlh7hIFHwi5DYTyNYprb7G2zEe9hA1JeyW8wQR/XsIhgezP428TZCjDheqYRAGRW2sGFgT+7GmNBQ5115oCwONyzQXV2jvRskEnnGnOj4MdKut535Ic2c6ILigUKp0Tm11aMEJdIVCnzAwBrfEt3ubeYGjmOcd0gkIoBTk7fP9tfiTLC/ZWOFaFkvl7oDGcYBtKB3zt8HHhpbcaAnGdSZdC+k80JcUbi9I/AI+cWXPfPQuOQ+kqldVwiBnVe+w1qjUTVNQw6EknP9d0exg/6yw31sIQ6yBp5b33xscI3ZZeEs1d1M406QKkHHuT4NnC4dLInE89p1ftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKuUim0XHBTmoKqBC2L84b1tnn2gZJvVnuzUdKCrPwg=;
 b=i/Q+l3lY2v9vCem5FW4NgIIllrAOBSNTC6bFTU6ScEGGF5TF3y70nyB0tOV2rLtXcdufBVcodSwYDF3KBu66Pg5Hc/6fZsObxJ7Rjbvi6p3hJROLeeJOSuJlAtuj9KS3w4wUluZyYGmwIUIZYGX592udFCqcQiEUBYal6E+nMwg=
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
	 bh=OKuUim0XHBTmoKqBC2L84b1tnn2gZJvVnuzUdKCrPwg=; b=dt+dh3JiLBgo
	Kb/0hWSoVbKxn6ZvyAyC8jVDNqoqnBt7Guktku/1SRccC/h7TGBgLHFyBl6KWD8j
	fBhlEoOQtoLc64196BHGnqN2uL6Pn6aSXVhv0f+ILhXvt1jVtSPV8lu2pxsy1JK5
	ncL6sIJHjFgPnqG7xv1ykm7Cs5tw4LSrAsh+9pAxlQp9WNKoBE0bc3t/u1OzLuFT
	Wj48K//9TEwqvC5JTRhuIylFYdUM4/u4/28mlnhUkbwmQCWbSTK5fRGkhdTxInUF
	tkJZ5XZga59jiopPf+mhKgkKYka6r//zeyN1P3jk1X5QiYLi73EaIKdzMQ8i6qUD
	hnlHTrrU9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=OKuUim0XHBTmoKqBC2L8
	4b1tnn2gZJvVnuzUdKCrPwg=; b=rhNFFd8gzSgxmL1KVx6oyeJHG2fSRHIrvC2j
	BiVUdErJRj5uuGemfWYgVwvscgTKuOie3HGH5gAaStsQhLJuIi2LEL19gR6Tgw6K
	llXw2v3EKQGr/pokqZ9JBX5LcIsZzZBzliVOdr1XBK4fNO+n6WWwFbuU4lgAheai
	fThbEVGRSXr+RihFP2A22AtdbSut/5ASRVtfyT/fqdtJU9Pp1R/kiEmi5dnb/AnX
	PrT4HZ1RHgP+mrIcsYR81P6BHH0pUIaszjQTj3uFzydm8juqz923ku0gEmDpMCZx
	XjfWpzOq90gtDV0wv2DkPgXoJEiAmHKS8kL/bwqemqkmHjKnvw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFuMw8JocKoqdVFuNwHc1p
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 4 Jun 2026 14:47:22 -0700
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, dmukhin@ford.com,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 5/6] argo: introduce CONFIG_ARGO_DEBUG
Message-ID: <aiHyav3G8pIN1RTu@kraken>
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-6-dmukhin@ford.com>
 <34ddb2d2-d3ec-4042-a57c-7095513c099c@suse.com>
 <51167652-548d-48b9-a10b-872f31ea9e2b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51167652-548d-48b9-a10b-872f31ea9e2b@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040213
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|IA3PR16MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 80476842-b897-4468-be0b-08dec282de8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	in5P0tD3mCpjHZ3jzlzGHPaiKr4SZ+nuJSdDubLm+E7zgbKUrfriFWtxHALeaRJwGMrnG3lJ2W0ea2sn22QLpUmWXHf5jWcFOpj1//zWOvcYTcLR5/Hz0zKQ0XtnKL4M1pMYLbKldx4yjLW2aJYpSxFzzWaFsfTOLbT0s6teVfshKUvg+23krGO1c6VfiInVcMCHPsMYaHWCwhN5ObK8U95g0Mzp8y8GnnFFPgEUDVYjFIGoXGnG6DnLfbr7I436GrvRYDcSisgvuH282rt9mHLhk9VPmCVJHiMlbXKAlCxxRnzI4nHkNhpnBCmVT8P3gzLPZlFYRqAR+Y+VY46QNwoC6AfnDrfd5XSXKD9wyZk0fxHTpgv2XHFCuo+7DpHcBmco4RHAKmBwjOiiTsREkQeV7BQsmM2AajNb2yQbMSUjLRq81CjCoe1yqbNyx5VQgMPezbaTrJhpgDl7xKUL484JcmHcagizJAPucjRWjnnQGURDU4r74P6i/x4BF+jA9HjrLBsVXAWCjaXkyAsWWCNIWO5wziB+HbvVPKiQIq+pLGoovBnZnb2fKeAzyXCSMi06d0KC9nnZZB+a0bEE0aptnbty4O+dOVUAIihHUvbs0z/pZdydUwuzpwRg9PDkSl0f1TXon26sLnQyq2meWpZKOjPbjHW3+/nbu9BFWRyz8k53JbObl8dQVmIwN2OsTIE3fzT8ZjzVcrQFiZBCn5OREOvNqmQSf+1TNNtBDVg=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZlWfI+wr+yehvabXKMZZRRDqu0jG3Y/D9BoFupoeF5A902bbUp6XqUTXg3Kdm94siQ2hXy0kYaLJBM9QlHN5QICzVYc7YssdrOGvGTUDFl68rNrtkPsdbqbjlZiLid5b/ghS3+hhtqGpjFJFNfs9b9VDtj9j57YvCn1s1szb680lkkBy7yIZonZbY1AAdWGG0wV+47kPEBknIrYB4LQhbqU5DZ7l0dQWoNrQFx/WsfkXbE5qHn1cln7C72E9ZdaqOYIXa0HN/CDFCcga9BJ9WXAT67zksvrxvxJmFIDsCgQylcrqj0qIk6nibQdPO5ipC1FG4+7fo6/eceKCQ4MsakUNOXO2HM7B0mf7LpCX7mz3KejB5s5mZJxvHzVNkNgs4vruz3bG6UsdUG41oSSJ+sOdB2RcfyfLe7RWAlOA3wi+pQHAQd8M0kwQHJEWdVtv
X-Exchange-RoutingPolicyChecked:
	CzBAptPaZdO2rvK6SQts7EwrXICBMB+JGxuf/6Mv32/H8HSflzb9HwInE3HnAanMZVyu1rue2dUS1n0rkEImdLudccPqkjNK0KpXiZDNRfni+gbUts42YGfqTxRCc9+uokcutGVt89Bp4e9wfxOpepj+xeTnap56H+oy0oHus7zLegNETM/JOsh0+U1z9Xc+OVeEa2yPE5JE9DMkZERVU/y9U6Y419x0C8sycvdh/u4OvAX3JDxKV3FX2ovHmG1MTP2cmh1yn6PAODz5B00q4HWcfTXbSwsO0c7QxnDw8H14wt2DSEjSdUaj8DgM05PmoxWNGKDks/0KpVKB7F2k7Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A+iAdMPJZvk+x/jBxAEhHmcdJoyR/eI67brc1A8tdbh2i+0BB8TKOVDf6R98TVbiMgHrK0iwBatVJP4yjpSI2IkbJbTLnctyuM6ofw/lViwD/0aeQ7rNelc9/EzdigZ+m9AWE44xY/WgS6+Lpz20ltBijDkFyWkO//+o/TpVRA/iaX6u99qluytTQI2aON8iL+/71j9Lr+xF1eXbxTjh/F0fhycFWC/auzXEYakG9RrEc+cNkuL0MCmYiOaVQqzYpcwrTvqF3WtcZlY6FRs18yrdijSgMv6QCPdWFXJzFzcGmecu03wE5bhU5CicQnfuFu1ZwAQIVMepmdL8H75HrUlymqETwk6ryHfaG1qtuiPcmAuPIEiBiERasRW6hdmyfi6z8/QA7fbSK+mfzEZKUrTe9ZIWBJlbquZ5+/vknDO6G7iCfTUz3B9qJCqWqCLy7rWBgIUhzzCoNfaDOzhNS91PWLoPew3MJOREpIJSadSOOZgjB4bNvWJAvf85UvjjMz2Hi50T8/vHABH89XRT5A+gkhSBBwp9hc7rjdTqwpLgTE+fHF44CTZpFRqx6g9ajcf5WjfOI5BtLxrb0u8YHwL3KpipRjE9yAV1ZgiyNLVIpM7YX0PkmgWStDxlAzKa
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:47:26.7090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80476842-b897-4468-be0b-08dec282de8d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR16MB6749
X-Authority-Analysis: v=2.4 cv=bo18wkai c=1 sm=1 tr=0 ts=6a21f273 cx=c_pps
 a=U7vFK3P1qsHFYF4fogjkkw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22
 a=cbNQJ9GKAAAA:8 a=zd2uoN0lAAAA:8 a=pf7PB32T8bRgVuXhqQgA:9 a=CjuIK1q_8ugA:10
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: P4QjG8N-Hk2hzNiQ58d_bGJ7kFHHPFdp
X-Proofpoint-GUID: P4QjG8N-Hk2hzNiQ58d_bGJ7kFHHPFdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxMyBTYWx0ZWRfXy6+wLVcHA2ZX
 xZJqmAJDCKdqQiLiahh5UmsAZrCOeGi1ml7DaQtLtXrIz0WXnINMeiImhG2VZJoO5tc5VnI1Otu
 PKOF76cNVNhjf62oyn24/iw/3NxTGKWiV6JzefJ7SkBBfn+B1KIeOXRfMe0dQQ4WGdnbu8CuaGL
 L7DXIxLyk/+/2Qy/LeGDKVJ8eLY2SVnI3zW7A7lkK99rD7CEjN93rwKPOgPAt8L0Xt7q4DlcQxc
 vRlsM6uK92+3s1iNyVyFo3cpdfwIY3Jz27kGzEWYEKSe7kbCu63U6B7DzsnPqOysRkchO6V6oE5
 AqhqbMnU9shsHHg9UJFqPLQfQ4PiP+6cfoiXFNVqJa1pLqa4Bcf+MsTK7Fq6dt22C+pV/gq+vqf
 W3ZV6eDb8UWW79dy833hIcNRuCDdwYH3R30EP7swLrk1mSzM0l6umJ7EGarbeRnyocz+ZwWrbkL
 QcTZrlqiKJa+L4Bo0cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040213
X-purgate-ID: tlsNG-42698a/1780609654-1AF76F3B-1354C9BC/0/0
X-purgate-type: clean
X-purgate-size: 1362
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 22A4A643AD3

On Thu, Jun 04, 2026 at 02:52:50PM -0400, Jason Andryuk wrote:
> On 2026-06-04 13:37, Jan Beulich wrote:
> > On 03.06.2026 21:41, dmukhin@ford.com wrote:
> > > Add Kconfig knob to enable traces for Argo debugging.
> > > 
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > > Changes since v4:
> > > - fixed dependency on a new Kconfig knob on ARGO
> > > 
> > > Changes since v3:
> > > - dropped uneeded "If unsure, say N." from new Kconfig description
> > > ---
> > >   xen/common/Kconfig | 6 ++++++
> > >   xen/common/argo.c  | 3 +--
> > >   2 files changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > > index 5ff71480eebe..7676a78dca71 100644
> > > --- a/xen/common/Kconfig
> > > +++ b/xen/common/Kconfig
> > > @@ -491,6 +491,12 @@ config ARGO
> > >   	  If unsure, say N.
> > > +config ARGO_DEBUG
> > > +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> > 
> > Why is the "if ARGO" still there? That's fully redundant with ...
> > 
> > > +	depends on ARGO
> > 
> > ... this. I said the v4 issue could be fixed while committing. Now you've
> > posted another version (adding to overall mail volume) and an adjustment
> > still needs doing.
> 
> With the if ARGO removed:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thank you!

