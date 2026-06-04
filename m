Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ROwJQ7zIWpaQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:50:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27932643B20
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:50:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=jEdORuWN;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=F8hxl4xw;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=mAPvuBDd;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=Bhh6znJP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328602.1593041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFws-0004sV-0t; Thu, 04 Jun 2026 21:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328602.1593041; Thu, 04 Jun 2026 21:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwr-0004p8-Sr; Thu, 04 Jun 2026 21:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1328602;
 Thu, 04 Jun 2026 21:49:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwq-0004e0-Qg
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwq-00BQhY-7d
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2db-5cb7-0a2a0a5109dd-0a2a45028e0a-22
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:56 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f302-af86-0a2a45020019-94a38ff1bc50-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:55 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654Jq0i8981709
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 21:49:54 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ekfw6gvu1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:49:54 +0000 (GMT)
Received: from BN9PR03CA0708.namprd03.prod.outlook.com (2603:10b6:408:ef::23)
 by PH0PR16MB7153.namprd16.prod.outlook.com (2603:10b6:510:390::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:49:50 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::6f) by BN9PR03CA0708.outlook.office365.com
 (2603:10b6:408:ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 21:49:49 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:48 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654I8Q8r034326
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:48 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eghss8yxe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:48 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwewVJCxYPuRVFwfw7WxE; Thu, 04 Jun 2026 21:49:47 +0000
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
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=dek
	cxd484B/EtXjB9WQgam9+JhpbvJo8k2v8ywhETos=; b=jEdORuWNPgJWaAXYbOX
	8BxqgLWv5v/uRG23pXJswp2E/XucxxSCT/Zvu1hQvTCiJx3LPc2+uw1xWZxkEnF+
	nWEzXUqzVggmHK6eNRACtoB+mVtXgQE0llrJe4eS/TNCnQlhSls5NB4iKplgWr0u
	3BEzWQXwQdPgg0Z4mIiwVn5SOQB0w5//fNkUtEmgnQWkQfQiweX3FbvmPMVePqyY
	oXfKZguXuBZe1VbM/tJZwEU34oOppcnBDfh2cnNa+Q0HMMKTJAhKa0uPrEACZ3xm
	/V1cQz6hPAHkKaf4G5mLlFfnRUKbr6Y3coJoCyIEuuki82DpN+Wkl5H4KHvvqIGO
	b4w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVkhAjNZWm1s21DVY13gh4ebiqf7+b2NYrv//qbCCBbucsh9dG6jw5zns30vJ9GS/90O+zfYQkvu9ckAaljyNtK9SQNNCtaE78TJ+mxLytlhJrdt0eUdXRjwFYZYsmWUguUX1LZMHbIEHj6ogLOnmRw7/F9iPLJdV3ge+WtdSqRYHyu5f6IUa5ZkpNEjEpUvEMEn1NXuOV7imT6Yb43nmGpWFZPEH5ERTIMJCrYHLkGDJPvuCrBTrX/UHB4BFIikmCOV5f5oK06wKqky0W+C8d/ER3B+hBUac8OeZCftTJtThekq2y+Sh5YVbrzRPPU+Unzucx3thXKDFeOJZnlQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dekcxd484B/EtXjB9WQgam9+JhpbvJo8k2v8ywhETos=;
 b=EtUOaG9ZgO9gm/KahpxbgvY+XbkoXk4AjkZjFkmesVS+oz8j5kmzI/Bj0SQt8onMRbhO7raZvRvVab2PuuUNdvyBdYz9NNTRyBjWgKLfnH6AZOYdEpbQeYxtDU2BeUunZ5hDkFfewAcNmLYiccjZ5h3qP1zWQiffp6g3FN5iykkr4f98c6NRL1MIJEUulVsFFArprgrusSnvC5dPMKgPdo/0JaZeMNiR4CAyH/M7dNHDPzH5bZczayWkiszqjOOFu8ovRwbDrX0ahy3ktQKHaaL4aN03qHdnrqgBacAlptSdCSjdQQY9Wl0yd9meakNTdO4miHiHPsTiOh0+FVIqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dekcxd484B/EtXjB9WQgam9+JhpbvJo8k2v8ywhETos=;
 b=F8hxl4xwKWbmqEFqMfvYBgO3qCRwYoAO4j4pByaAeGqwKbg5uE3jzrbKVKomklAdd0IYCwJuS8mkS2QZC/FTsPAgB4GR6HP0UwLtSwZFG/zhaxS0jt78yTCxEazI2/8OQAEsUoUuahEtus/t1DyBxJFpeLkmEikzC+I5bQG5j7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=dekcxd484B/EtXjB9WQgam9+JhpbvJo8k2v8ywhETos=; b=
	mAPvuBDdJEWE60ujbGu5egK7m3tBsLtysKP0EEEl+9pJa9wI/pnqGgkfffK40LXu
	UZ5+tbvxVNOxSLB89RO70VGkkKY4sVzqXobaXF+HRfIuD006h/DGlAi77ME1Lf6G
	M/AK+GG2Bpkxtcx/aAp1AflBAvjoO8M6bvD8LPQSv4jM4Ka8qegFazVJjmj9toYp
	jkBcG2352gxsOACndZ5ybda0kCfERyqL7gBGH2Xz/KOp8F45+D9xKCuxYR4D8I2z
	U28NCHRw7jpDRKolR7IWeM+ypC3WhPo1p2DRc6fCn4AcGsAjR0UyvUy5+2vPc+8+
	scbYUMTLyTzr3WlUdw2utA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=dekcxd4
	84B/EtXjB9WQgam9+JhpbvJo8k2v8ywhETos=; b=Bhh6znJPBz5VPz/nrkMlMlS
	jDvK9phIPTZHygvXXsiVbesaJCD/myANREjVk9TGpOdnaigqLa8sv5oetPgGxVSe
	/YRHL9Nr7tKeG0Rm9fBNKfbIW/rdCJqjRQOsXveOA+VHusdQ7nGOJzXG/RCYu3Tx
	mRwTeBB0cx4znJ6gemW2MuRtrkVPRHgP35YoG9cUtXYP7vVYBDBOYtYUPi18WI0L
	o7PDtPvsas/EH6F4q007t80/LMfByBs4hITOMuqPTyU88pnvB8pCnIs9K0vORA/d
	i1omrZzyyAaEAtxNUXAKxNf2m243qgib32jHw5zOh9PJNd/bumq9iph2hzhl43g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwewVJCxYPuRVFwfw7WxE
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 6/6] automation: enable Argo debugging in CI
Date: Thu,  4 Jun 2026 14:49:26 -0700
Message-ID: <20260604214926.1735194-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040214
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|PH0PR16MB7153:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f97c1794-807e-4fe2-6e44-08dec283334c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CcOghBCdbg8VFc4/uC8lCVxHJhx0RSc+5CTkidyuLLlI2VFY4OnwRPUUPGkEvYmG2yMQfJCW0IBQ77+ZBYxoivBZry1omiQhkvmPK8m5k8hboj5FcrTM2S/vm5XDLpW0G5VPoRoWnXuP2ZwDzq+GnCeAm5WpWtpFZPt/28fUJPKJi41Kt7MQjNEzQ1joG0XeZzKu1smvCK9HA1L5troD3iTppB56d3EM9evqo/25tclg0hR+3l3OOQo8jNpOSIdzJs5hctpd/+mSq5ucWsLUYS9H7e8T4FQzSf2FxTmnH2Av9nnJDrZrdfBZdbeyL4CB66qxxpFTompvEQTM1iE8KEm2a2/BXGP2aLHoGUAlQuI57c44kMwwkEuEiyTxT2kdIoAGLZMMYEulgI2YrjRMLYQKPLtC6FuBEUCV1frotW8+zuggbozE3LLEmK6JXWRcelI5ejRlUtEcXKw3lJYDVKzRbXIHf81FliVfk475AFDQhJgBakJr4OgqKiy3UPldeS4qQPm2DpQvzyybtcJ3heb8K975e7AgNh9/6y9Ljy4oqSrsC8C45O82Drqfc3v83c+62KFPelZ0TQpzaCy6y0Q0aAaIT5cbybIrBFSoRC1XJq+vi/J0kUtQ32qwGcc8aM38GyPB0DlW41n09IIAu08Lt92vW7u9QE1rUHzmMi+IZcxcmjfud4faF19c7PkqBsW2c0ItEMX9AZmOQvfcgvbkpAylWlh8m1+K3wvFM/4=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hxjrZtVGA7CPUaDMa9WoC/kROFvb4pnOiupP2kcwSSSExE7xNBb1S5oqR88/6iomsZT4oP64i6JiVPFhbxa1+K9lw/Xy9077F1BWd9OgGT8YCzdyTb+vtdKKZNSOKHdTYeYG1q8iBhBLoQytU0/ArDzqJ1IJ6RR7WFH9cBzbE7QILj1F3rBmLDSg3UkxD9nrgJ9yUliXOnlJp34YH69mNY/HX+CpcwhW1clFT1sdSomBxa1NCTnBtcJxDOb38oLNxro+fU4R8ddz85lF46tWjQrDLSg7TmG4lNIbrCHKK5ahZqx9zAm+9zrtGUmGyNoof/Q9U4wIjV9gEnYI2B99s8sus2stbjSAMHXkMBtkF6gBI6GwIsC7ptbaurS0iTf6vACy2IrSFzxBbeo7OKtuGD5rumfMMTQcYxiYutq5kwV1bsy11IFCD2SyO2zSy/A0
X-Exchange-RoutingPolicyChecked:
	FeiNf0UVxZrn1U5cJJbF0/bYyYiIiTIcJKnMldcCHnQDkxPDD9NOrpZxWue6/yZFeuC5bXkMvpDJ4bzcuu5UUlzHUS0HF2eUEYwLYkV94GxPvHNMg1JjbUsk/7fhdL4X4xxrQnxFTQ2oLQ446Vg33pjcNrUA3QMhGpbTO96ZIrJ1K1UAqZrLhmHGd5srZfjLjox3a9QoXEibWiVWMxvu95ey3KyjYmXAmbCCYa3gc3CGaCOzbMMIXcI9BhDnzUjk0Y+Whd9pDQRqm+gTOWrIrilg1sBYgnJrBzx+Uw0fG2dkRJOd5/03E7aJa7mLrwEkpexxjw9PutUugxN6GIg2WA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V2OpyIx+x+OvgLI3qmdhm7zPsv+3HCR6MOsCRr1cS/btzF3Gqb05mNiVJsh2FT2xpa1DcuLRn/+kVE0BQp6IfnIIldRt7giVTIP3q+SpFI6N/0Is5YjlQ7XWYZwN4KbsgQmz+9/r2fZXCkHWwvMhLjN8/l/C0RjSZKtgiAtol8KkcjTrW7v3sn4qR3n4wuf82QZNazj/QnvqkmhZ2oMQNMhamEq3Jhqyc8HN2/fCWAHSZWa6luF0fzXl+nkU5n3707QIWIwbLprXyzAFFveQV+Bq02itVpZiZzXKXYQ+TZ9xaS3hKJg6CCMhOhJcFwqc5ZehPzn+DhdYHwUduWAE0BVvYKGiyhxYSaje7JYkVLYRWxmybczzlPRlz80hvWMC5q0IzazHpuPcYTtqA2XaDOVjkQNkZjNUjpwkyet4wBLjSZenGleTnnBObXAQ9dOZo2AtNrCKJh+Xf7y73lPaZ88RSyhwlwVmYhrXZ02/7ckGe9Eiycmh4pUA8342IiD2qNbTPXwzSKHjkuROBXdmx51JNkLxg0UGoe2WGdiaUTlzKepWBhTTMi6DGZhi7ZtOAwD4le3yAF+Wkuze0KCkNErKDzi09+sSUFH4cBumA4ehcFwCdrNDmxQCn+1Pomlp
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:48.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f97c1794-807e-4fe2-6e44-08dec283334c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB7153
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfX2BB6WkD7xs04
 lOcu9lZTiNxIu9luV2W3ngxkeF/X5D8ehBEpnkRBqfrBLrq1ncOcyx5xsQ8+DaIuZtYxQ/UdSx6
 CuyZZAvAGc/avUkN4odNAYILbX1RfkpnjvFUDnNq2ZX85e1Vrr0MjEJjzdqF1/d6+ShnrDhspIw
 QUiCZLO+fHakrES+PRNyTfmzkl160LoPzM6vqn6WwnXltuT94lkReRVv6mPy6wh7q7dH5XcnyWh
 iHG0aCXr9nq49QG2HkdTq5y9bSGSmO3ktWKYvPQjP/a3OTKA/QRCJqnEgirb7bV/Z5r28OnqJ98
 wQBr1ZuHTyNmHpI0bQjKJEBF6v1qxOh1FUMsb87ZXPKcjcymORyyeyYzOHGc5Z/JHwbWNGfAn4c
 IIgO7+XjqRtHQS49AcCj8YPy3JFns/RvNu87j7KHyfs3uKRzLKiWWKXrtgdvvwPa83JqBr+sdVw
 NOQUvkgZGARXZKXO/FQ==
X-Authority-Analysis: v=2.4 cv=A41c+aWG c=1 sm=1 tr=0 ts=6a21f302 cx=c_pps
 a=pKPYWX2mfyrwmcKrUbCwIA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=zd2uoN0lAAAA:8 a=2dKu_0XMzK5_71BGg0AA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: CaSTTHeROny1uwLgJ6Z5RL3_NEOh32-Y
X-Proofpoint-ORIG-GUID: CaSTTHeROny1uwLgJ6Z5RL3_NEOh32-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606040214
X-purgate-ID: tlsNG-720697/1780609796-8077A161-1A88D911/0/0
X-purgate-type: clean
X-purgate-size: 1933
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27932643B20

From: Denis Mukhin <dmukhin@ford.com> 

Enable extra Argo traces in CI to help analyze any potential Argo issues.

That covers eclair-*-allcode and alpine-3.18-gcc-debug jobs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- added Jason's R-b

Changes since v4:
- n/a

Changes since v3:
- enabled CONFIG_ARGO_DEBUG for eclair-*-allcode jobs
  Note, eclair-x86_64-allcode is failing on staging (known):
  https://gitlab.com/xen-project/hardware/xen/-/pipelines/2567857238
- example of extra argo traces in CI:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14661834468
---
 automation/gitlab-ci/analyze.yaml | 2 ++
 automation/gitlab-ci/build.yaml   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 3f7532ee1d25..ae0929d13565 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -47,6 +47,7 @@ eclair-x86_64-allcode:
     RULESET: "monitored"
     EXTRA_XEN_CONFIG: |
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_DEBUG_INFO=n
       CONFIG_DEBUG_LOCK_PROFILE=y
       CONFIG_DEBUG_TRACE=y
@@ -127,6 +128,7 @@ eclair-ARM64-allcode:
     EXTRA_XEN_CONFIG: |
       CONFIG_ACPI=y
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_ARM64_SVE=y
       CONFIG_ARM_SMMU_V3=y
       CONFIG_BOOT_TIME_CPUPOOLS=y
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 0e5fb26c853e..b864443d0243 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -286,6 +286,7 @@ alpine-3.18-gcc-debug:
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
       CONFIG_MICROCODE_SCAN_DEFAULT=y
-- 
2.54.0


