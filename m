Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL5gFvfe/GlFUwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 20:50:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88384ED9F4
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 20:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302998.1576599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL3mw-0004aK-Rh; Thu, 07 May 2026 18:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302998.1576599; Thu, 07 May 2026 18:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL3mw-0004XL-Ov; Thu, 07 May 2026 18:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1302998;
 Thu, 07 May 2026 18:49:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wL3mt-0004XF-KD
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 18:49:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL3mr-00E1pv-Up
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 20:49:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fcdea0-bab6-0a2a0a5309dd-0a2a450cd988-14
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 20:49:29 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 69fcdeb6-62f1-0a2a450c0019-94a38ff105d2-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 20:49:28 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 647HtY2H836176
 for <xen-devel@lists.xenproject.org>; Thu, 7 May 2026 11:49:26 -0700
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011028.outbound.protection.outlook.com
 [40.93.194.28])
 by m0482515.ppops.net (PPS) with ESMTPS id 4e0yjmgj64-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:49:26 -0700 (PDT)
Received: from PH0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:510:5::19)
 by CO6PR16MB4099.namprd16.prod.outlook.com (2603:10b6:303:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 18:49:23 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:510:5:cafe::4b) by PH0PR07CA0014.outlook.office365.com
 (2603:10b6:510:5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Thu,
 7 May 2026 18:49:23 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 18:49:23 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 647Gqpre1175075
 for <xen-devel@lists.xenproject.org>; Thu, 7 May 2026 14:49:22 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4dwyq567vr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 14:49:22 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id L3mhwvy9s7HbfL3miwXunr; Thu, 07 May 2026 18:49:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=/ws
	8l+9jhr+C2CzzVzi/VmIUfNL4bzsMGykxr9pw5Sk=; b=jrapVTPuaummudmVD4X
	FeKKb/MbltievKMiXUi/t1ElMeoAbkoawa/J3tlO3h2KNr7p450G3BfszS22Xh7m
	YNzxNUQMR/Aqc25cQuRkoFsW6jkjTnwRbnyaBvPrIUYDQdefdq6a4WM4P5Ipalvb
	RqHrlEAFFGoK0IdyRKA8oNxZuiYYIuZeLMxgen68f/+hfTj9M16OwVKQyTDkwOwx
	zyJIt8hZSR+NCkubucybgUH2/sRYMDlcCbz1YeNa/wF+VNOffMry5iFfeHT+4MJ8
	zGKZ6S7yGw5p9FNJUQhRXn7Hkn/w0x6LaecwbOo9GDXvWZNxMuJX8AAbKUaPZytD
	7vw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnAgJL8KOeb8+yMHggcdVz15VfEEsuA/8h/LEnfjLAP6LHpSkmKersGiVKqXp5fK06B/UBoWqOFSMgqVWktOPB5hDfl1niIur+9eslWVqVzPN+Ye98eBmVep1r0jrHWq3OmayI6bslOg5twQpvT3zJ9H0BZxmb6MbXAiDvEUWbEY/7+sKcxVmYen92FmQ9ovzUJkZlDZepddIb+IuGebbqHwzQwNS8RwhgJPj0SgV/LKmZ8+ga/74PWj58vyOlj8r9A8Q6kusTBEnVudA73lFSBK2IviYpBxm7jDO1O0vtgYWCipBUSJud9hwQJkBbQdMst5GiVBm/rZ7q7H1TaX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+/zsz5NkZVlosqx3ogJbwR4Y2x6fseFVXneQOSgoe8=;
 b=CPMVV7F03RYAJaN/A8S3g5mjTyOk5gSpaAxh1bIPu0t5nUCEaxUSNfMyHmZD1L53BeUliq8dv1tsbW8ey1zMjYk33suM+huIM8Ik3PEHHrISvgZ4iDVwneOHhdxQYWfoHqc1JYUJH9vFXor8xQW3nVdjSUyMJSy088hOqpLqbAgKt2qUDGrsjlKSBiFjRz+Qp3UIAz+HBR9cu5exiumPsGyoImiUcUHjf40G4C1QoVjylHEP4k1yVS/fOw2jAuMM+gxoqaGdNtxQcHEA1SMJkxWKFqA9V7q/p1inOriHVqRLZvDkEmzIjx+QubaW9luE6skNQ7TSMFxwdU9sI5M3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+/zsz5NkZVlosqx3ogJbwR4Y2x6fseFVXneQOSgoe8=;
 b=WwLsUM93mdgQGl878m9+v1EdwoK9yOs2lC2E+vJoOoHRFzZmU5v2UBxkG8brNBCwu9UwJIg0mUyUDhtsKxq6Lf/j1wB+7URUHu+Y2/0hCJh6zfijvMUxAgcmNu9HYW3bhcLqnzi9WzNl2MQx1o59C/kYeIM4FkwhPHZUlH5dBhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=/ws8l+9jhr+C2CzzVzi/VmIUfNL4bzs
	MGykxr9pw5Sk=; b=o1Lf3AWR/HxKk5nTPUt6xbCjVvZMsRYEZM+MzbffBOihd3V
	K4j7jNzB1PDnfQvhL19bQEqjI4q73ZoML3YjqUSlYiONOnOQy8Tf2jpCCje+Wr2W
	hezdO776sttf693+6tLOcVZqaAdQA6gQAEc88uCfz4g3sn5VMP9rwPZ/N962iH90
	EzY+mAP1FpBlId4IgBQz+BOp23uZMcd/+IixjB0iL9wHRlmhot7H+MwlzzhshwRE
	yqHG4sqQJCnsJzAX8DVlmTlCDiL7iq2tGWYonKzz7UpnSE61Kn9oLkEcOWz20z4s
	pRgwAJ+gq+1k2URT7jU4DcV4Z8pmv2bpe1bG1aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=/ws8l+9jhr+C2CzzVzi/VmIUfNL4bzsMGykxr9pw5Sk=; b=q/Nbg1nS7GLS
	S7tU4LwU2nxwLhfI2RruLw51nDnZZsWXUxvCpM4raZusc+g+IcDhYwuOAQ3vmP6Y
	fQmKzX9LRlX5rhyPZRXCXmqx1dSUcE24JvJXIPSqEnxDGLbx1UUr+VBZ5r+ZeiZ9
	h7jdNWPYFkvw/I1p+geqDKzLVMaJ9SY0yNQIzJrWn13B/+EW7gSbl8jlH/YmkCd5
	Vzl93Ml761qbvh1VmzA+j8Fcb82yOrK44vPhKKbSokFDPbzJofXEwSCNV+4BwJHm
	8K8hfa9Jumbdw09ERReKeIdf/eqpdrMJJupH8JgH13xSMKetCf+WLHBVAzlf9uqj
	Y9ThYuAdoA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: L3mhwvy9s7HbfL3miwXunr
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 7 May 2026 11:49:18 -0700
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
        dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/4] xen/public: introduce DOMID_ANY
Message-ID: <afzermFPg10iSxqy@kraken>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-2-jgross@suse.com>
 <bf54e159-c4ad-47e4-a6a8-574af834ac9f@amd.com>
 <ffc85ac6-2d32-48fe-a066-a8477fc085ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffc85ac6-2d32-48fe-a066-a8477fc085ff@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070190
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CO6PR16MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ca51f7-437f-4f55-b832-08deac695b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SiRhzBcJ6SFa39YQnfodO9+MFhoLXpmJkaRUNPb8J9ePbtMUx6NEURArTyv7hnjgCEH8CmC2XJXwTt5iYTyJ1EC6OlxV0d+jF0V1obgfl6O0buWRcJGC3RjMU4JP8aGBPtC+tSWX8sRcTOuyW1KbvK5ZS31scGUQ/Gp5HIYcPl7jpmVY4IwjP5cS4o/aqmNhNW6y6jJYNdzQKbKZFmFJozLmhrH8q+tLJcevQE5aAPU/2hLl2bMRRX7USd2xmIVrCVzAAo203dHpu+3anSDXwYjEYai4IxptVrupMyd6tS2Hu57DZPt4lAypwPJ4yY/SxShgFKqnvySFW4iBsOaNjUkdEXoK3mDiwXO3pc0GCg7KdoXenjGVvenreWjXlxiCB1hjG8EhVKQgjuJKMtT7OrdQIFCCaYrNvAiUK6kzOrVP/CXZ1n32mmOQOdT0SRB+EkzEUS9coMMKGaenitklxZQzH947wCU8uSO3rSjRBCrSXbimG3B8h/F38h0/XDlKddjDsjVkx/vea+BmyrwLPCURnWNaoysxY46Jbe5dnVC4UzKb/zRPZITHFuFMUrifvh94Ws+UOXh5QO9mjrEsO/YMkLCXV7UPwZzxElK43yBQLn4MPoDWH//Ti3JZT8x3VnLvnbuxsObZrmisEgNUQB6l0VlGKwko0yC9AjZpTv5M6r3MzqRe+e/WLB1qL9Dxkkb9CQLBfQXSCgVY3IuowUXle5I8v02e56woaXXGf8Y=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5sPxScjS4FtwW+9VI/qYHU5i66G6r+BVAggPZrXD8hU/6+hHGTUxwKDL0FUBHRgHiBqrdnetplEK7++wEL5ks275hiTGxJ78ei2SDn7vcgY5Mr6I21GywV/lO201Yy6L+g/91zaVouGlPfhMoO5b/t+9wMPOj7V3ALU6nx+thI81be4hypCQTcrTgtr11gdCzlx2m+yEWoYDml0+KpXJGv+ixZwgciJ9Zyl9gDvnu3uSP4L0DFYEz4ATWs473r6IY9yGb9p+Vw2RMovNziQBv1AchJPy560Rm5o/e4axJ9fhPTjur2qEJyRUquGhSG2cQWQO1n4I2YMHmk1HCHn4Uda4xhSOfZzKdUZNH3W7pzQO6kyaZyAj7Seqnhf0mRBi3FLPR8wQhpA3bhYJr1sMP3GYJmxl7wkR+LADfKXfu1GnvEolScaXN6pDc06JrlON
X-Exchange-RoutingPolicyChecked:
	fDa15GN4wtXLjL0V6bHmoRAmwK8uL9lZVM+Xc+gAiX/1jld7wsdLTcD6Pv7umOi25a73fnRHnGMODouypKDaJdut3N8mVh4WliCHDcEPucc58a9ZdQLJH32kgD9ebRTnVZr66L94pxt+LpSOhOqQqHUuVXAr8TuSnXmz8bsH+UycomhHm3dqUQvNfX/v8UN8wYZFETloBHvFQn1FhGgZwN8HzWjvqIZnfN3J5HYcB2NogRNm1l+pR0WrUgS6ebbav+TLt33GUAwKiSb4/BK9H8UevGXh1VpyEHovMFH7dL+LORJxKICUUd7RlibNOr6es4Hzcmbga22TFgDhYwYUBw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vYUqWn0YEFQS6nuI6BoOsyP1lx44w3etinJvboe6kzDdunxF711BsxGwzcZLjIkdNbkhaZumvbMN386hmzJlChiTBZw4M7sHCf3ARdSrQVImv5TNt9Hhs7XqwmzngBOL9Hv3yxszpVO4lWv7zwfP1yfHZl0pqPA1vtkfKoWpU1yxtWA3lptHqWdY+XN7ptzJ1zQJyZ/tNzhMPfLEzaWkezfSykjIM48rVWH81me5O6ep26Mi+84MODDA9mCCb1hx8YWGDhgFQMlxm7eNJ8LoFRxkSG+SiJIAwovvKdklXiK6rYBfakOKL+OzIKBvcfp38ykBOmkTS9Z478r5OLfIG7C/prdwAXXnfKpwzwTM9RX608OgkLeRX3nB8CrmY1ASSo+4VXj7tgdLxo8rbaxk4YVfqma8CQh3sx2rcmy7YSHyvSFHiqxveg7khkffx/hxN61Ryg8dK4if3lGPNU3BPcigCWZsHRFUIXmgU2lXBMy44yWhdA9rqQsEijTtm967AY7ppG/6rX3cB6QlKZobqlDtbY17U3mitol3f3Lyf7qFKbodUXhlMNJ0NKauUO6C6YcscBXXccvPrGkyH7t05gfLmx4uwDXgo8y072YdDW6vlLCsXUtExJkifuoIPJHV
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 18:49:23.0058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ca51f7-437f-4f55-b832-08deac695b09
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE4OSBTYWx0ZWRfXw1J7nX9tyipk
 YqKXi6RNJhbZfW6v7q9RJWI4qnHNjXy/weczZ9awh082lTNvY+hw1MmMcQrZqZYZtVuwuHyLYW6
 gwxVas9U7HJk/MyXqLuj8Kqcj6oh0oskcULX12fxL2IGK0o6HYlIoXwnJCJbz39p1BLxzbLAhNJ
 xhMYHZynYGgNdTOLWfbWGwxEgz7bWDm2C3ZDNth26/lDzhZrHWgle9QEGtNFd/CmMr867B1fCW3
 P//oG9cZLI0C8pPLwIUPeY3ojIYJAkKa8Jd8yUlMSW+oEaEwdAxK+bxoWCN79YsNw987qBTeZjg
 g6ue8Wb4Z5ot+A+1ZRlKlbD0AbUPzN7umN7c0JCoxqUjvo5c9nloxaHut/p62Ej1mshYcIoR/EH
 op/rucTKuAV8R4dNeXmqmFoGDr8nZuyMhGQpxS+oWVl3+c5lztIWMXWKqGhuu3luPKtdCbIdBtw
 h8BJyzVMV5DE4OHFBQw==
X-Authority-Analysis: v=2.4 cv=UM7t2ify c=1 sm=1 tr=0 ts=69fcdeb6 cx=c_pps
 a=auv0RDqIM0MEGdyBMEg3Kw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22
 a=cbNQJ9GKAAAA:8 a=iox4zFpeAAAA:8 a=jGDTz_yqp8HarqSbHhIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=G69WFyCBNqGPyalROSdv:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: Gw6kZly_RKAATdYQ9_V223V9e4HLTecN
X-Proofpoint-GUID: Gw6kZly_RKAATdYQ9_V223V9e4HLTecN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070189
X-purgate-ID: tlsNG-d25034/1778179769-E0159CF5-DACEFC92/0/0
X-purgate-type: clean
X-purgate-size: 905
X-Rspamd-Queue-Id: C88384ED9F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ford.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:-,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,saarlouis.ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

On Tue, Apr 28, 2026 at 03:36:20PM +0200, Jürgen Groß wrote:
> On 28.04.26 00:00, Jason Andryuk wrote:
> > On 2026-04-23 04:08, Juergen Gross wrote:
> > > Add DOMID_ANY to xen/include/public/xen.h meant to be a wildcard for
> > > domids.
> > > 
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > > This is based on Denis Mukhin's patch "xen/domain: introduce DOMID_ANY".
> > > As my series is another use case for DOMID_ANY and it is a backport
> > > candidate, I've split out the definition of DOMID_ANY from Denis'
> > > patch in order to make progress for my series.
> > 
> > I think we probably want Denis as the Author, since this is an
> > unmodified piece of his patch.
> 
> Apart from the commit message, yes.
> 
> Keeping Denis as the author is fine with me.

Thanks for taking care of this!

--
Denis

