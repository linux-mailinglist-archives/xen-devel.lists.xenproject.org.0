Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO8tGjQWEWqvhAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 04:51:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C815BCCCC
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 04:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317568.1586479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQcRQ-00059K-66; Sat, 23 May 2026 02:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317568.1586479; Sat, 23 May 2026 02:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQcRQ-00056j-00; Sat, 23 May 2026 02:50:20 +0000
Received: by outflank-mailman (input) for mailman id 1317568;
 Sat, 23 May 2026 02:50:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQcRN-00056d-U0
 for xen-devel@lists.xenproject.org; Sat, 23 May 2026 02:50:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQcRN-0016Aq-30
 for xen-devel@lists.xenproject.org; Sat, 23 May 2026 04:50:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a11149d-2eae-0a2a0a5409dd-0a2a4508b376-44
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 04:50:16 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1115e4-63b5-0a2a45080019-94a39217db38-3
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 04:50:14 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MIBMBZ3853570
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 02:50:12 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4eaukqk13m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 02:50:11 +0000 (GMT)
Received: from CH0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:610:11a::35)
 by SN7PR16MB5105.namprd16.prod.outlook.com (2603:10b6:806:32d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 02:50:08 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::76) by CH0PR03CA0344.outlook.office365.com
 (2603:10b6:610:11a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Sat, 23
 May 2026 02:50:08 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sat, 23 May 2026 02:50:07 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64N1JJxS3360427
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 22:50:07 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4eactj9fgm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 22:50:07 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id QcR9wbJGcdhUUQcRAwNLGg; Sat, 23 May 2026 02:50:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=Ai/
	UBQTQ1+1jF1sm1fPwgeKCq8TksnMnkKTRAmhwHkE=; b=LIEGmITtsFADyP/IZjq
	TJa6xsKXIBYIa/zHwi9OjDvxvP0bDgnv1A96RatwhtB1U2PtXnSbs3mWNk7NfC/w
	8S9ZiVO7pBZt5zZbXxGWE+JVt3BmH/uBbCvIYz9FMfOQBF2vuSQRqCCqp33fGvmY
	Qo2Tfnl6a0KhkozMBVj8BPrt9AORZhTOr70TM1ZcQK73eCjZi7MLFs3/cTf6Du6D
	Ijz4YLRVrc5x+k8m2LyQvmVD44w1nn0TvWMrqAheIP4RYlLdrjtPDYUTMAUHHONh
	yuH5LFJ5IVrQhkkvFM1DpQNknhO7MmCK2UIpoCkdYuNYCLqMxCf2Gse9LRdnYvS6
	Bcw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9GPT76ZnMFZ5yAVN7JYAxDwtjWrSL0GvWvxaMhAS17HRNyxRiyhXSrHMEVqaMiNb5YMO4+YmTbBgxMRf4qrdA4fWDH4HxaLeWyyQXFm3p1VdRstqBoZrFio1XD29zysIfX8KkkHXWK6Trl1hndQ2qIysrx3rDztyefexjsmdnTASngFGePPKFnslng0n/9Q4fvUB7RoVE7gZp+XSK5VXpoFBfNCWuKwkAlSyprdMBrRrUOppKnnx1ihIy7vgPJUg5ZbSu3lmwBlNm1fkEE+txkUxTDZoscaTFLmRAqeLskCWY3QhMG42+hUaYNUuj6XzmL3ckHGHS8Xl8q5I2C/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai/UBQTQ1+1jF1sm1fPwgeKCq8TksnMnkKTRAmhwHkE=;
 b=ZduYL5y/OBgFURHHbAaMkkWsBHyc6meGe6b5J5EZK0Y/34WqfZ6rW2VZv2F+GAcY7UN0PggQ7OfhfLbMLgcw3qxXKfGssOZGoJpi1s6NlgFPBDAlscSUZN0ye3MaiUwujy0ZBiXF5nkKLLAF8Ge7SzmLT6IruT9iGlx5DI+pqVOZ0+4PC51W+mcCHvb5/r4pXtEWLtJGZp/ecZFEecTQW0In6hJtcJbONcY5QRhL6NbeImDFw9Fan6JcaV1/D5RlM8VtFJiYxLxrKHv6mfxNK+B6Mh9EQYyBq8l46Uy2m9hjGLC0LORkbYNK0rPCGu7xk9xCWN+e0QRKpkAru0cgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai/UBQTQ1+1jF1sm1fPwgeKCq8TksnMnkKTRAmhwHkE=;
 b=E/S19SMYmFz0pW0av4PWvkDcmbMRAI+4f30wyfZMHHo0cC3j7nk/Tc/BuL2Osw9i2xhaLXlvvQuEgLMwPhz9/M2B/+XkzUxHLospddnzjmQUIcmIttQ1784qnKJUYMSbOZ5D/XJLN8qUch8w5247MOMXA18PoO3Ge2UkPsHRo9s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=Ai/UBQTQ1+1jF1sm1fPwgeKCq8TksnM
	nkKTRAmhwHkE=; b=SgYtWAq9KX7Sek3hMjw3bd4Yg62e0UyeWoEjKGnnvXW+5Zw
	teAbXoobJqmRGwJVZCTt8COmZoQCEkLnIiUPg0ZeLi6qDg2HhNfANDSj11MFhe3t
	7MACqFmHUJlXjUfeTobyNiGY8YGOE7w7SVHz5JbUj4u7TYFmo/QpaX8rIIDBwe3w
	TvCUQ56t35qC+Xyf0qOMwjnku0K4JGTlUju9X7elN9gXqD5aHSKBFigSBtWsnitm
	6L3UjPM3Mjx/Ne3sAUM24aUitCNbcnr+TayBFk6XI4pVaDF20r2epeUnxnKKBxJy
	tpXCdakpB9QpCx5WI3ZdXpAhfFmG14RZd+L0/lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=Ai/UBQTQ1+1jF1sm1fPwgeKCq8TksnMnkKTRAmhwHkE=; b=EJdkgmmVWmKv
	GURS4MunJiYIVcLZlZt0C2yeMp6se+0/WJwGk3g4QPEkjrJ0MAIgOzPEzmXiUjOq
	sTbwPhfa26KK3Y5KeUQA/XZz2RG9TUTBFo37T5y2k77//IPL1IyrVQpRY1C8VITm
	vIyh3Nd4LTvyuBuIslHlTZiOL8X3dZJIDih2znirWYJ/iRO9WKyBDFf2YXnAp9D/
	9eupbxxJzunVQEr9k7Se2Y2ybIJiEF7Fs/DnQphADckO8e3BHwGLte96F2Dqtw+t
	HjYprcFTxeFmUxQebpRn0qP5FWkHYtgLznPiLxrBzWEoMC/0+vbx7fM+f0HJGziH
	Yw0vqP79wA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QcR9wbJGcdhUUQcRAwNLGg
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 22 May 2026 19:50:03 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org,
        christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Re: [PATCH v2 1/3] argo: lower level of noisy connection-refused log
Message-ID: <ahEV27RO2ClsIrJR@kraken>
References: <20260522165238.844649-1-dmukhin@ford.com>
 <20260522165238.844649-2-dmukhin@ford.com>
 <CAGeoDV9Q=+qujawck1CBtvAgT7hNxFgy2uLdVyJXrCwNEAsD8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV9Q=+qujawck1CBtvAgT7hNxFgy2uLdVyJXrCwNEAsD8A@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230025
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SN7PR16MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc9dc01-10af-47b0-36c4-08deb876000c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|56012099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Yz3DzmnLfLbdU6YB1gI6Q3QmqKZ6BBPxKkA3FsDRFS+5822piltruPKuld3EH4Y/nUVein+x4fXjMG2/3GFKYq2Vs7N29LvduZ9tQYaDhQqZ2e2Z80hVJmNtUkBAnlFbKvlCvPIHP4jOPcVkSmuFTro3phnWc7iEIeM9+WZlt9fYWhtAbZ0ozDnyG74UUcBzpIzcDxRrhKxx40KutHb9LsFSaKYRva2EaKhKescQJn8fsCkryE7Gn4dfPYAnKCJer2faPu3ex2kL8Fuk+t5xakCcNzO7yECFy8f7I6toXnY1hND5fcZua8YAJLIWAiEUa/xEGaehfZXW7byAUDdiJ4ngM+dnIqAnnuvisQ38B1GMxjQDYxrmPhGCLhDVYNyGKnM9cEjymMvtb7OEVk7fJWwe2Za/MecDDtbUNQ6zyO9Efpdpi81bCZxwPFlWvK1R4vk3ih7KCEb3t16k9naG8FNe6JScx57zeOOxqeDUNry6F3372Bt8pFSuub8O0cZsEeVkI0MHt/+LfRctmeXJ8Daxhevz+o4l8X8XUf5QbozhNsz/g313+AuvwAMVqWf8n0W7Z/ydcLnJ40WQYIfB/LEzESDzFW9tYyoKZiREemT0iNBaD4IAxetWrKEUKhUPUgKCW5EijJkRlkqv5xtATn2JItM70E2SBLSVW1EjBPbQPriEHqGbmssQwaU8VuW2pFpVVElbo4P+469jkxniSDGstd2ZFuloyvOKEggti/I=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ECvg+FfRw2ZKZprgXdsO+nN0g7OSO1p/qqaIPxR4rXy/OGy0O3mLwiHxox7drTRlJDeI/8mTfx2/grCsFP/4LA7PxTd7+xMHw5M9ElMygGdQReDDEElPBGBJU3Ct7eXHhILcIki9hWPo/mhZ8BVJpqHCo1mDrK2zs//VvlZfTQGLatUw/+MyVt1P96xgQueMngv4CIg3FrG/xyrhXlcbwpVtsFCKXG2CGzjVjLvTciMJKsGxfZ0xdzXa2VEuL+hv76su4c6pJ5y7gvwHvoSSi2TDmU2mSW1Ol0FxffoZZEw2zOLT59Kfychb1RK7gmKeSnUUSAAua9hKu7p9Kx22Peqp1HRwnEWCxBQfwtqaeaGFm2kWt+1InS5EfJbKi/AzmgToPIUC5IKaE61DRoVsgnj4nMRiEfjklMT4Zrjh5/g5AdSl6EfP2A0sg9iG0FKI
X-Exchange-RoutingPolicyChecked:
	GfXgPuR3jf2x0SDdvahnNuF2dMZInso2+wHVXvZGonehdjz0rvOuefJfEI+QeeM+fn3hQixznfUY3+7RhZJLlHz/j6ZpgZs2UkL0lKyTnmZsxvV0NjZDLZm2cDMh6vhNpUUzFGxCR5Gsg/HAS2/+kk7WVEBbtq+9stwevCQmlvc2hAh0YNjHmGDnyAfOYkEPnQvjzCi7+C4gAIjotJTABxhKRGqTvfa4drl8UCDoaspKgGaGw4MTknmmL122VGScrUNoosHgT3pCn33Pb82LYNbOlUEpZQcs8t0mStXoixLpOCJX/m5XbEG/HXI8G2PiT31EEiD63/6SbjN4W0k6cQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lE3QgnK0gkzaAhFJKO3ThCl/jjv3qmta9Ze2B4rKu+eLe8d9BEHE6J+oyh6ngk6BU+s2U0BcBlmTGWjtLvU6Asyp6AO03+McS9QiMSIKX4yxVdMLwcbgsaMm2nnpfxCVVVuRwyE/YxOrmGOFQWK7T+xQulmeJVrF5QYN7iPNhsviD0Qw9VKfQPAJFl/joC8jc2rEx3Q7YgqEUCaNpj+xOVy+Ym1b8yLUcGogdeGCtE5Nuc4v3sal4yIvBjzZUNw3lx8fnHjcNkcVrCw8oyH4TjCVOntp53cNxyBAz7rdGXNEKAlfV0PclKRQn9QKscfWAFg0eYQdFmLcllEvZrwwTVzoBQXPujpD5O40wwKLk6KSnEUco2JRV/Fn09LDv81PWgddpMOvm2EGOp0fycrYUtP0pOK/FD+SkoaPoIc64H6e8HOheyyJMCKkG5ebkvsSREthXhdRC4QVNZGI2Pm1Ay1EdBqrBXt29IQTe1oh7IzTE90NKItZsBKbblaCiuO3BKJ2AjIJSssoxinzKAOqmhr7uBmg/2YbYFpaLsTTdWUfvc9vJuztSCDEF2jXMtRYbD1178Y331KZ6zFzrGcTyrc6ERj/I1EEp2w/gG/pAYXFXjUpeARCc0WI+8zIlojqnFbZJS9jVoUl8AWBCIoA3g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 02:50:07.8203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc9dc01-10af-47b0-36c4-08deb876000c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR16MB5105
X-Proofpoint-GUID: ILfQ7Qu9cS3nOp4Q1MXYW3NIKVeuDPx2
X-Proofpoint-ORIG-GUID: ILfQ7Qu9cS3nOp4Q1MXYW3NIKVeuDPx2
X-Authority-Analysis: v=2.4 cv=fvHsol4f c=1 sm=1 tr=0 ts=6a1115e3 cx=c_pps
 a=0p5N1A/s2xr2YPsuh+j7dg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22
 a=cbNQJ9GKAAAA:8 a=-nBlMIZhapJqLXGN05oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAyNSBTYWx0ZWRfX/ShwCstWeiuo
 VkANJ7z67nMThVCR7U5VmznZ29uWbIzzAEbLRKzZuBWt/OZTDHcvVK15+Tgzfal9mSp32/uLX9c
 3NctO23D5oh9R2UM7RjTqxF0Qy/5WXN03KXvR4jLykOgfYt1ohWjMgZwlRvC+DE35DFAflByjQI
 2bJzz95X/ohVEIUVojt3hhij889lxUAHtXs0/Q8lZeUtIMvLMJqVCySqxRNEKc+PX/JXc8oMz8K
 s/TfK+/JhrvSp/j6RhBU/CFLbf735bndHGmiAJCM3y3RJPNW7OdN159AKGhMPNXTJ0fR8rjq+kH
 1lzUy/FzV+Gw/CVr28tJT7hnQNqA8LDamablFZSq4DNxpW940PnNmq7oRcwe5n5llX2pvaJ/Ny0
 VhodP5GgTgtJ5bKptraQdaFXMIVTFxiASj/fWup2AF4YrzfBGnOuvzHNvblMC32pSRgW9PY/8oB
 fnxvSwh9iPNuHBBFKOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605230025
X-purgate-ID: tlsNG-c1860d/1779504616-C5187DB1-405D449E/0/0
X-purgate-type: clean
X-purgate-size: 2583
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:xakepamatop@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D1C815BCCCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 08:36:58PM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> Just one follow-up after sending my Reviewed-by.
> 
> The patches look fine to me and my tag still stands, but there are a
> couple of side effects worth considering here.
> 
> On Fri, May 22, 2026 at 7:53 PM <dmukhin@ford.com> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Lower the log level of the "connection refused" log line, as it can
> > spam the logs when a dom0 service using the Argo hypercall tries to
> > communicate with a domain that is still starting up.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - dropped duplicate "argo: " prefix
> > ---
> >  xen/common/argo.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/common/argo.c b/xen/common/argo.c
> > index 28626e00a8cb..98a3db7fd070 100644
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
> >                                          src_id.domain_id);
> >      if ( !ring_info )
> >      {
> > -        gprintk(XENLOG_ERR,
> > -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> > -                current->domain->domain_id, src_id.domain_id, src_id.aport,
> > -                dst_addr->domain_id, dst_addr->aport);
> > +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%x)\n",
> 
> First, switching from gprintk() to argo_dprintk() means the message will
> no longer include the "%pv" context printed by gprintk(), i.e. the
> current vCPU/domain context. If that context is still useful for this
> message, it may need to be added explicitly.

I think %pv context is useful for debugging, I will add another small
patch to re-wire argo_dprintk() to gprintk().

> 
> Second, this also changes when the message is printed. gprintk() is a
> regular printk() wrapper with a guest prefix and the requested log level,
> while argo_dprintk() is compiled as a no-op unless ARGO_DEBUG is enabled.
> So the change is not only lowering the log level from error to debug, but
> also making the message depend on ARGO_DEBUG.
> 
> This may be intended, but in that case it might be worth mentioning this
> in the commit message.

Yes, this specific logline should be fine to be compiled out, the error
is propaged back to the caller domain via XEN_ARGO_OP_sendv hypercall.

I will update the commit message.

Thanks!

> 
> ~Mykola
> 

