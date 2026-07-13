Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w41qBqArVWpwkwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:17:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F79474E696
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 20:17:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=mSWg7FKo;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=B4QLz9O7;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=Ka7Qzl1F;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=lLLEckob;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361823.1613932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLD5-0005vw-Lu; Mon, 13 Jul 2026 18:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361823.1613932; Mon, 13 Jul 2026 18:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjLD5-0005sb-EQ; Mon, 13 Jul 2026 18:16:55 +0000
Received: by outflank-mailman (input) for mailman id 1361823;
 Mon, 13 Jul 2026 18:16:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wjLD4-0005pe-0u
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 18:16:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjLD3-00EXVa-E8
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:16:53 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b8a-5cb7-0a2a0a5109dd-0a2a4501c2ae-30
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:53 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <dmukhin@ford.com>)
 id 6a552b93-3ea4-0a2a45010019-94a39217d146-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 20:16:53 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DI3KXB4006357
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:51 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fd38b1gev-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 18:16:50 +0000 (GMT)
Received: from CH5PR05CA0002.namprd05.prod.outlook.com (2603:10b6:610:1f0::8)
 by CH1PPF801F77A33.namprd16.prod.outlook.com
 (2603:10b6:61f:fc00::a1e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 18:16:46 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::e) by CH5PR05CA0002.outlook.office365.com
 (2603:10b6:610:1f0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:16:43 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 18:16:42 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DHfusW3407614
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:42 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4f7svft-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:16:41 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id jLCowgyFpDexijLCpwt0bM; Mon, 13 Jul 2026 18:16:41 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=cyF
	5ugYOqwZ9hJzOD3szdmvtHv1xbZee9OgAzDKVR9Q=; b=mSWg7FKoAd9abTPQuFE
	dToOpjy0oxNhmMkQrgOs9juV5yK8jv1lxlKIAYBv4MDppFLF4xhT09NOVEOKgdSM
	5deY8WiyWSjPBTtTUFN0cleQeSfzTsFEt+R5FXDfiSCwIfD3R0KT6+fVLXwgJzRB
	K4d5YUyxZqZ2gF6cRIbhlUVfPCAMPbVjJBwo+N7Bzsl5ImUJucJveFud1tYkJowA
	sy+GiOY8p/8CrHbAMscX7optpmrJR5+1/OYKN1bJgtGG9WCf7r2rAR4A+Z8NFvGr
	uEO5e9iW17S4W5ZZIFFISQtvlE+uN1hfPiRUap2hmfJn6yVnGX+IuGYzi1OzOP2n
	ASg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNjntrxchv5Z4vIZfEo9M2cXUKrFTVjr9uG2UBjqjXCXx4FzBfmoKjJ9CBab/vnDgBSFvTr2gmZjELm++/9s6MmW2ZN2h88HTM0hveMF9HyahnS/4mrPNa4FENHV/jICZ12D8pv91AbD51b7n0QiVWJvb1U326ec3g8PHJos7aNgjhTrDeh3im4sENPb+/gOtiDLC6G+P57ph2Ias3Tyxn50sqQ6hq8+qHl6D/pyfuVglTbzSsTgoruHvufZfrn62Y1cAy5lk+2qdU8WLTIxlbK1zsaSrtgYSYZCjdnJg8jH1cbIptPCETpqBg3vN8rPEDsG/G64uIiOzkHfg0I0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyF5ugYOqwZ9hJzOD3szdmvtHv1xbZee9OgAzDKVR9Q=;
 b=vsH8Y2UIYnquAiwipbu6S0pfPHVge7c3qk9o6z+OIfXXH/UtIohV8bWcaFTZyHI6ph9PjwrZ4kjujdKOD5aefYUhldUKe3P4Y0LaThFtMB0cyFRIX6BZ8JD2DIJUIXJ0WdUCeYMMF68dcQJJcIH8xYlIFRI18jzDNDnG85rqFq2nYl0Se+1sVP8TweWne07i90sLIBxDIrRi7zEOkXjBPL1Wgro6+HGiJK76djC1UetASB147cAYsqlwfVlPu8XqjcEF15mZvqddACXT6Inl5koHlaZkJ6Ih1QYXRfIsaIrwfT52+KFqyZUwFg7WV+i4V6ViMLA8DXkvPXFyLVBp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyF5ugYOqwZ9hJzOD3szdmvtHv1xbZee9OgAzDKVR9Q=;
 b=B4QLz9O7B2Ki9GqNxtoVYPEJmN5L/7vRuqWty+XAPcPpiBkEIakAciptAkJhxLOmIVcz4N7RTuGd0cnKT0KERC8bRAk5GT/1ZeNlq9+vNPWTv1yWXdYKuRRpdJh9jXwkBUBScM1Vo+O68Opv/o+Zk4XPRAFEYeMNG0e1+NVAmc4=
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
	ppserprodsaar; bh=cyF5ugYOqwZ9hJzOD3szdmvtHv1xbZee9OgAzDKVR9Q=; b=
	Ka7Qzl1F0Hl6rxGCU6gFqYh3HfWpk8PxJ+NfEB0fICrXFe1WjyHP+MpjmPZXi+PA
	D2hMraaySmqelIhgPhzAQbNY6hl5cZAJnzyTwMyGIC6cMarepy6Il7eBUgNtHMU4
	GMdipYdrSuu7DZhCr6vFDvwsDLMKnjLnfgzsDI2oxvdjr9nsSTTtzmQr28mpg1vB
	BCtesARq4YCLLtODzLGrGYU/eXYJIyGSukU4OfhcMg4PA0F4Br1CMPwql9Kw3bvo
	6O6cZiQ3AtcjKxtRkA1MMFg6THvv6g6NXw+1HEBLZqU4h/01qEFwR8UWO+29aDu7
	lorgQsKtZjg+4SSq+tuodg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=cyF5ugY
	OqwZ9hJzOD3szdmvtHv1xbZee9OgAzDKVR9Q=; b=lLLEckob1zibpF5Xato99LD
	8iDDKUznIIsBVbs9qwwifh+/wMtsC+YsM8HmtB3PKlbO7MAcGDIykprU4L2+oPM6
	rHx/dxli3WsiizjxKYQsmdKPh+5Q8gVxTWUw4fN35TYIrxteDsQ8+0EfSkdJzcfi
	o7hiHst5laVagjs6N47G+HPbZBBjDq8myDq0fEemdkHOjEITtEl7wZkoTDWrVQNq
	KzsfiTx2yklqXmfnGjTU4vxnZjcRwLd+bX7D26W4QrEPyN9uUdREnxT86xLY0GSt
	cnw/EBbm5eLEKaU2O0IusrQWQLcVf1Thk06m0gpkxb62u2o5gbxJyqrFnxKzGCw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: jLCowgyFpDexijLCpwt0bM
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v7 6/7] xen/serial: harden serial_tx_buffer checks
Date: Mon, 13 Jul 2026 11:16:18 -0700
Message-ID: <20260713181619.672176-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713181619.672176-1-dmukhin@ford.com>
References: <20260713181619.672176-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130189
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CH1PPF801F77A33:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 84077b64-1eb4-461e-65ac-08dee10ae45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	55FCN/5oYzO4BI8kGBeGWpcglsM6lX5OTNsQ/YqTQeUbQ2Xt1mqhHflS+FrgCkbJpKhANdM2hIb+HTTB1p17IUWHXN92AdJUFD3PpajMZhzbdTIKskh5ngjxnpqpOlJqr6zQNdIQyq9yA5b9kxV/hfO0739Gzvh4SqWc2lr5G5bJvFnv75UK1bxUphgGWuDYnH/7s2WZ/Bl6DPOKEoXAA+dgo/Wq4jI3KbOutLXF6tyF8NKon7+vtwrjJuA2Izf7UbFYSnBOEQf3prCCEz0CWIrkPfpCOxkYBySDqO8hofjRUBoPD0wVbd80YfqsjNxz0z+AiegLcYKXWhHzlPCOV5h2NW69N3yES31Tns1sqMh4lV4uNUzvae5m1+vQ4r3XlaXWIiTDXwJyou+2uyf/HQ0IwAotm3FVduSgOLt+v54MnUweUDJmEuMT8HjWcEXvgBojEum6X+iDBrYgwyMXLNrhHhosvcgRxNE6szljBQZFgVFJdZlnbZTASz+B8GbCYTHorNQoY0/k6uMuMIn7dc4NthNTGTS9w0yI50duIX8rDfipwdhvbmfPwOmaxPON8i71JawcK3AoCJHc8a2ePCgebst4liR5DmssZ2pISULquXvXN9Gzg5HemZOKOtCG7NLuQNoDf+7bFokP6vdYEDkOjCyKNbZltzKOL9oERhxeNhzIN3EIPD8tjm5dcRUTKM9++pMm5pOQAQYICer2qw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y/p1zA4VfJQJqyh7AMd9jaN2vQ8p5UvNJOOhDHl8+XT5pzHQ6FUZTHTRrF7t081bJq+y0FqbxKoOKNBWc1CxDg+GPzCePYljcavLOA2fhcxWDTctVhzKbiAFyy2wgi7oWHq9xRbrw04NR8e6nOwqyX/EHNBGFEsa7J5g7Cd+4bKiSEH55HR8oIoqSOU6iTGoF+qaEQAmmSX7px5dhwjwkyeSRXS9xf85oufQ2GHlfoHKkEIR/4fXFdSmHZ0d+/7JRHBM7HFVVEcSboRHu/wesoZ7+15Y7G2BcsMKA8u7um6dpK6s6MyYkOnuyvTRvmT82DCb+Wp+KGwFWVWE1EgKlazDY+vHjfr2cVfnLk6kspaCX7sIGhCUQa/k00eqx5SMtWvvNOsvqFKa2qAqFXKr8REbikinI7PqN0cS6HWnllYaiuN7m3fS+D4kBVztQQs3
X-Exchange-RoutingPolicyChecked:
	P3H98ZB4N7gDFwWa6x25lcZSypydsLoattaOZfH/g5qR5CY8fWvuJSf5zK6NerUWoChadM3EzIVI+ORoR3/s8Gf80t1bJ7QSUoNnO1E6fgwpqbnUXEPtmbBUSyepA0CRfHigJMWrspxARgFIbxB/+5Q1dVTgUAaLgHOjfpy47jr/7uTgLQFQX1A4G/rxweQiYCDz6T6+y5LDtwLiDpYQeeF53kTxOZkW3M4K9/YmcuQREhHDYT/GfWIADmEigzcwEPPar54/rijqRXbCe8y7yY9aVXQji90za51DbAWXQ7cUH0EUlmkLvcvUoiF4HqYoqfrGxVmPMtxe+7WP1/QUHA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BW6phsokzxVhyEuOCFIprSkL/B9aYXEfVqsfBtLdKlftwmhEhnQYC3ZcdLZTjEZJDOETHwE9vIqGj+ZFCGcpBMBWm1Wp6YUeb9oOPFqfvtoX1/VJHwr9+yZZRyI8T6RrMKrWOvz5Mi8BJFwkZ/apdL0qmwvdA5QASve8Xw8Kkd+qtc90Qw6bkGJlieLwx+1JMDVmEx9DoYNFSCNXmumvWBpt61hZrTmZz4wNJwvARj9WlRCiK8wnhFuQawyoK8EfSnYo2sIOT+tZl2bRWxxs9901radQ+vPI/stQuQRJtQEcMihoYrrS9elrkRauCcBuKy1H+NuE63Whcqox0XlYVhHHI7gHnI6m6KnCIexJC2Rkto1WG+lBBuv9kDiv313GjFGTWR6pu9+D65sqjpe34jYxo4xewKGkTpNlbWK3LADEgvaOLkgFaOCNFdc9DaFu4SNSsxeQvRrwi17CWlrL5d/6ZWLXBqvJymwKIom8iXg3gjgQeNCdeQhpFcdrJzeDONEf6fcarfyKuQ99VTITgC1GRRct7y+eU/85Wukr8EyIUbQFX6m9VlWHvqSMt8IsXqIiuvtBCEGrp2PgciSa571ofkp15/0RYkKezPxNsF4js1VcfqhBU55ILcH0v0ZbGXPhRBl7kZJtff7Mdj1lYw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:16:42.9009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84077b64-1eb4-461e-65ac-08dee10ae45d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF801F77A33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX0ghqBMPzJWYI
 Dtfx02GDTidn7DMwXKX3NLnZAYFMMR1c3XUhzRX38NWrfDZwedXHs1xMJTeZ08TSBcjMCyK3DbT
 qYXKO8cClk0B2bk77eyv3Jilq0vjaLoWTuxIfx5Po/gV3Kjs7N6Nd4rP0WcyJbKfF5QcWTfkW2V
 YTBHrD57wVs8wqxbKtKkWXeVXLhYbt1hloXaTRJ4YWhD6uSPhx75TphPz17HxnRV7eL/boem2Ps
 s0SmkJL03UrcnF0JzSkioj+U5yLmwIJNDf/d83yQpbYGtjCI5iMadzHHWgkIHNcLogmiHVKM1rx
 KUc34Y6Noa0nJDVrUhIHIYAk4dySKfqrAxg7TjkiiBsqhVa/Ot76CwifVkd/I+Jo7nzMZw1trxw
 nE1bQwHAeEIXXyE8NvNvJ8czrajB5UjdyUWfpffgCLJfVw01X3jAtT2T7gCKoX/KWoYc/8hGdkE
 5TpHCPAIHpGw3XwpYPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4OSBTYWx0ZWRfX2jP/imDd1tQT
 tAdGNx9BFqb142hz2NyOr3IFkBQx/p06zfOhqtiK9gwWrXOdb3Djyg/qOOCTsSGubfaiFFcPs94
 yzX9PgZmVOOWY6SBxspPPBBiRN87vDGEeoN4lvFMQ06f7D81hYAF
X-Proofpoint-ORIG-GUID: TAPFnlXEhw-xewCqZvZ-a5HHfhoBKN0A
X-Proofpoint-GUID: TAPFnlXEhw-xewCqZvZ-a5HHfhoBKN0A
X-Authority-Analysis: v=2.4 cv=XszK/1F9 c=1 sm=1 tr=0 ts=6a552b93 cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=d_7IluH7EV2a-zxrXzAA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130189
X-purgate-ID: tlsNG-d62444/1783966613-BA4F30A8-F136AC75/0/0
X-purgate-type: clean
X-purgate-size: 1986
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:from_mime,ford.com:mid,ford.com:email,ford.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F79474E696

From: Denis Mukhin <dmukhin@ford.com> 

Ensure the user-defined value never crosses 2GB boundary and always
rounded to the next power of 2 to align with console driver conring
buffer management code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- new patch
---
 docs/misc/xen-command-line.pandoc |  2 ++
 xen/drivers/char/serial.c         | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c711fa98086..2be8772b329a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2396,6 +2396,8 @@ accidentally leaking secrets by releasing pages without proper sanitization.
 
 Set the serial transmit buffer size.
 
+The value provided will be rounded down to the nearest power of 2.
+
 ### serrors (ARM)
 > `= diverse | panic`
 
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index e3c356408987..25d0dbf91ae9 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -16,7 +16,26 @@
 #include <asm/processor.h>
 
 unsigned int __ro_after_init serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
-size_param("serial_tx_buffer", serial_txbufsz);
+
+static int __init cf_check parse_serial_txbufsz(const char *s)
+{
+    long long val;
+
+    if ( parse_signed_integer("serial_tx_buffer", s, NULL, &val) )
+        return 0;
+
+    if ( val < KB(16) || val > GB(2) )
+    {
+        printk(XENLOG_WARNING "'serial_tx_buffer=%lld' value out of range, "
+               "falling back to default\n", val);
+        val = CONFIG_SERIAL_TX_BUFSIZE;
+    }
+
+    serial_txbufsz = PAGE_SIZE << get_order_from_bytes(val);
+
+    return 0;
+}
+custom_param("serial_tx_buffer", parse_serial_txbufsz);
 
 #define mask_serial_rxbuf_idx(_i) ((_i)&(serial_rxbufsz-1))
 #define mask_serial_txbuf_idx(_i) ((_i)&(serial_txbufsz-1))
-- 
2.54.0


