Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g6V/MlzEH2qwpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47863484C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:06:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=l+tVXlta;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=EBscZrkz;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=WCUmnREP;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=hl83OjEt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325663.1591016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejx-000787-Ie; Wed, 03 Jun 2026 06:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325663.1591016; Wed, 03 Jun 2026 06:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUejx-00074a-Ec; Wed, 03 Jun 2026 06:06:09 +0000
Received: by outflank-mailman (input) for mailman id 1325663;
 Wed, 03 Jun 2026 06:06:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wUejw-0006ou-2c
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:06:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUejv-00E30R-FF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:06:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc44a-2eae-0a2a0a5409dd-0a2a4507e25a-28
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:06:07 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a1fc44d-229c-0a2a45070019-94a39217b866-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:06:06 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6534LKgS3385500
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 06:06:05 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011019.outbound.protection.outlook.com
 [40.93.194.19])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ej4p93xnv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:04 +0000 (GMT)
Received: from SN7PR04CA0201.namprd04.prod.outlook.com (2603:10b6:806:126::26)
 by DM4PR16MB5342.namprd16.prod.outlook.com (2603:10b6:8:18b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:06:02 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:126:cafe::26) by SN7PR04CA0201.outlook.office365.com
 (2603:10b6:806:126::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 06:06:01 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 06:06:01 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65365GE5096566
 for <xen-devel@lists.xenproject.org>; Wed, 3 Jun 2026 02:06:01 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egeh8cjq6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:06:00 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id UejlwgfwGntbrUejmw83C1; Wed, 03 Jun 2026 06:06:00 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=wZC
	4ArGPo98meKfB/VlI1NU2JGARNUjlG3ze3iZptq8=; b=l+tVXltamMnFaFPpm2v
	PmuM0l8msE2/lkxZiQ9O/iEeoLOWb1xtASZf97Aa1SLeXpKI78xgrKdHobjFdNgt
	uVICKxbONFQnt1vu0olJ8Vn2qe1MfQPJT1CObLci5GN/ybv7wg3VXVFLofBXH0jd
	oC3apy5MkqQe1yRzqADjvVcxhRyyR5flGp3XhQv03fnAI8aLl33qd3lrVmF8BWXV
	s4Q1j3LSoOU0RwfBGYRsSEiScd+qtcTZvE0TWMLQG6YuT6PMs/BPiW8BL0aNaTKX
	XyEtJlUpNynRtw7HJKQiDKu8ipKhcfBJVefWnS6Ytq25Y3Lvq96Zuhf/cPzlPvd9
	cTA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmMj+MgJNYoe6fV5pxomrLuJHoBrJ2oEkiYOjt9LY8kvRTXUbSl5BOPxXnFpZb53Q8Njf32tRfUDZXIVzRlxG6TIpH0jzAR7nlCSKEpUBT/rT3lpCnHWUFje1s9CumWprpSFOTRS9oLPBIoYM5Nr/xIH/Y/ZDu66jZnRjgRIXWarahzgkBIP1qIw7UQiCdPNTW6iqBM+fztqnz6PnhSwdpQ323D0S6skFZWfsGtuTB0u7pCw2xiTTXvyaOPYC1UQ8kshd3AFvXKP0Rjmo4eZjvR2Dv+5DtMVFKTzX315RdUSZiYqmCshl4HKOtZ/7cZ8OEmMsMQkg86zW/lUi4DOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZC4ArGPo98meKfB/VlI1NU2JGARNUjlG3ze3iZptq8=;
 b=pguw0iiA/JDIjIG7ri86FpP9A55XS+MakaltkyROJ3EqXnsrpJCOeF5AZwqDAOitYefzPRP4Lag2hZfChK+reCtlJjPTFJgmpf2pHM8ZvHXgOkJxICps7xfHr49jbpJEbI85CpByo8ywgyqr4k+Z0TBCzdT3kd/YKAxhQIAQqf4UzVb2+irJsqPlRCkYAodcq69ETtTg0GhNLQI3GHmRNlrIuCBr8x8VP7jVQK1uK8F2BRqgsgsRvQ1a1TQ92pL4b5mqY38Vss2bkkq0mO8U+uu+aCi4/AocneFRBwsG9AO5Vhs02GOOgmTzXgr1RSWEjCAZh/MLJHm+irQg3m0axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZC4ArGPo98meKfB/VlI1NU2JGARNUjlG3ze3iZptq8=;
 b=EBscZrkz2SE+D+C+5jdroDJb4MF4jD6QcUb3JOOcLlq6BM4SvZPUQX36HFM5qFBlNIfCxCvyrYGN/nzj6DCkfebXYOy+HJPSKnpt4ZCMflC9zMbyEUsGl4mXDAGplH86k5g9GMjsaqIGmQQ7zvhXC77lUo326b6Y8k655tNxcoE=
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
	ppserprodsaar; bh=wZC4ArGPo98meKfB/VlI1NU2JGARNUjlG3ze3iZptq8=; b=
	WCUmnREPF/G5S20LRbyBJG+Xb9z6xKxVVD+sjCkFhCmJjmDMA11wxCGwvsY6mLIe
	ux/gdfS7QeJDl09N3RMTYAmhlZdGcin123pxPmT3SPFm/4vJzjCcVdNmcwUKDqNA
	M85K2Q87dAsXIzkrqwR/c+wtv1v6DTf1oCjXX0jVgy75Ypc/x2/lzzIoj5H3neDg
	ToiBL3Hfz8uYjBpIl8PQlJZ/p33RlcRmUpRL+alVfR64poakYwWrgIE1Ric9Oq04
	DMqPjrxIEXUbx5qrcn1yh46crdzltuytQ0utPASvOHvYZf0XHk4sScDBbzEq1QTe
	ePREi5qZ6ihdjOkci9/yAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=wZC4ArG
	Po98meKfB/VlI1NU2JGARNUjlG3ze3iZptq8=; b=hl83OjEtq+BRS/3YRyFyhrY
	oRfV7+yv9HlEyTat9XAWTM7ZczBQAJWghTPgI/jjYPt7wDzWRMqmzS+1FmmJxc8h
	Quu0oETWpqILFRRU3SwEu8QlZQo9ZwXfDt3wHmYmqTIGuoESyALtn0QUZY2OdEMX
	C/LIlDjodeM20l15f4fchto3BlahT7OLeC6nq+6AoorBlNx0hx98+kFf743wKHpz
	Kne5aOGrSxy2X7SZ8nxroqOszRenRQX3Wg4ebSpZ9dF1mCNC9UHTsNiMTsHOFbOq
	3/HPyE2ZY93LGYKeI1oGbr8kjEruhyPwR8cLr+/eK4UxOKJMRMYgmlTn4U0sI/g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: UejlwgfwGntbrUejmw83C1
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 6/6] automation: enable Argo debugging in CI
Date: Tue,  2 Jun 2026 23:05:39 -0700
Message-ID: <20260603060539.1181809-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603060539.1181809-1-dmukhin@ford.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030056
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DM4PR16MB5342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c954efde-7ed8-4e74-7646-08dec1363073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jCxGh1Ai4zxwnAaTyYEej/+Qckf2keB0efPbTptoCD4sxT7EYXlDGTjkhy6vnygBjPN4/LsSMi8tkCe0C2iaKQqAyvgaMEE+ykZD/526RxUYOkObpFfZGrcjHivG1//1tg9Ec922nOZb9IM5yD0cESsiTMYV65A0YTI5IpEY6BsFwcaR4wBmUu1D5TJJ2bZlbY9gwhQnBurHfB5BrBp3D0KnsTsPG7msqPAs3tSLtS6FkPKvISFyfLCU25KtngILluB7WMHVDYE/mJG6ai0eHcVxHSNc28idHc30ECeNNn7LCufcAZDsN0EsHWGwhKPQA453NgcCRgkoEBEbJNImJBjqvTLQB2pxxncZiorB5Np3oTJtcplbwilVFH859MKlVGvVT7qJ9983zxjd6Sb2cb+H1M7Sv/WmZD2cOCQHxTkh+3Rk2lFrJECsMrifTWjcaEHDFCrZa+hX14zajvsSzN7JQ1swN9ssPzWX45Rujw4uOANrZMZgVKX8IvPeBJxclR9TJVHMJIB+VmjD1y9I09jRNe6JCpFQabjP913oWmFCjfVH6Q2W9MuzCyjos7NPkCNJ+piYe0ixHCbittnuBwH96TyqwQPgyO8uB5FBUjCaQdWPn9Udc8S3CrN53V96gnTL/X8oCFIoEPgxI+kgx/jL3+D+H6sxZlwXXTH4kQ1Jh8nbSRl2mCpNKsOqKEBaZS0qS6MXBMNzfV9+F+UkFiJphTajU21xYeb3hv++dbs=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	spJXDC8XpFKYMaZOpCaWeB2xbHWu+rJV8pYtjQRsJ6BMRzx9rDVgSnCn0TJrb5SzoF0LNLf2VD/XsqX7yRIl8v0Kro9H0SqoaDRSUNfYN5ogjJnAVYMi18d3YGebXSqrb3Wh62r3lr+2KoOx0ffj5YFgWnWGmQZirkYARDeq/3S1y/dX3OuEKXaqsKXfLVrJRwnR14NZEotgjAMVxE+rr/hcFP2u/DNuY/LEkgkkcgQzeqe4Nrp/tEhlENB01tOAKA+y18PpzXMBl0lc5adAdWWk0rIMZCaJTBzNSI8r6IjYSjGsS6tRbRejwMCMBjxg7CdTuqlDwaxCunw0fmkduRjHtyyQCIKQfQLnFG/hnLkunmtiQRmytqPlDV+zeT59sa4su5FHCqS4XuHmhSZZKcNeUaiXBG9VfC+3GiBrie44otZZtyJiQe2mExCRQJxq
X-Exchange-RoutingPolicyChecked:
	blYsr8KQ11eI7OwPd0yBrtr+mKLkiV07zboInwLPfYaFpzB29H24z07DhnLW3P+T+mh+a2Dsw/eoJELWLGX2FEQ75kn36QryJJZgc87UJbT5Xipy77kAuh/ZEblctUzcJOqsREn8cWNpWzO6YW3AY0g9TXS4kwYYeIRZUwh6JJdimUBfqL4gNCPs3zrb1PjysMTN/h47h+LDn7UjwEYSmvzRDpXNi99sd9uKJhbXfIHxBFL7dsYx8pvAnKb/zHk6WYeyeXRkHQw7xZ/Xrk3oz0Bz7884VPZXtiID68GNW2iMvKNfbKg26U1SgVH9ft7ltvAtnIcbQUXrfoXWdRZPfA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zySYwQ5+HjzIEXw3LdceQ360lbpxTOveIgdt6OfowypKh/jpEvnJr8FF0hkx4ILedz6SGY43LstedJmD8rGtbvGCNE+AGftoyJmisVo1quFeCNh105Ir0B1aiyD84exQT7SMYDpc2UmdfY+Ec/n7bBdtr0aBSk1H1k+JJIRqHJzsE3tmZNbCBtbY9A7UiKN//Hn8IYwF+PBYgOEdmp3rASIh4wUhp33zxbA65ayHI2q1fsj8S2DtdLaedDXnjUgQyf6ct1e7eNJuqHOd2efBlAx+Ky9TzpMyOCnBEZDE61bY6JNls2Iu7hYc641+lNMP+eTpgoXFiM1h4rEnCDEyu9ZJNXUC8u5311NXmmP5UQ2FBXxUDxx6qdkGYUnEFlN7AqqcdrszqEOqRUVg/QhzWMgUt/OprWTlLpRqIjVkoZDz6rIzjMVCTAO98ZE0Gi+9MWjZKsE9RbeprH0dd7VGRzKCc2ZmPB0mPOQeAvOhSTsMIWCrR+bOUQbB4imjhOCeIhNfFaFFuokr9eRGXPAnstFJYjsRAUSGOds/QFkoT6FWnLPP6aNgx5LDZqL1U/CGNT2NMHYWWfrmb3r9icGMEYBLMl6uKE5JTSMoi0MUnjrPLL7H33J7Gvgrx+Q8IF+2
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:06:01.7036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c954efde-7ed8-4e74-7646-08dec1363073
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5342
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1NSBTYWx0ZWRfX5dSVmST7K3o7
 gTnX4PE6n8Q7hJfTvtbGwxZ8+8Tjm9Rb+Gl9DN3JhVrNAh2r01xT3s3+D5opPWmP4qD7qYLX+vp
 QHwTnkvgrXFRPeiaO6E4oq80E5xAi5DXW7BSJ91HNgiIvvdygYg0gdfNqPFkV6TNgk64d7WVHih
 2KlemhPB70sfzQe3flV+ii8R1aSvoO6Ubh5xwpJ6+MhehdK89AZT3xK0KSOnfWUaRzfLFW36XSS
 4cm7kZU71eNMC0rq3EljYR938gXPwv3Bnw/CMK33m1kF2FJn33xsFtZfaYaWs8GBT07+c4GkZxc
 hP/BT9uO4YuD0WVVzG/QJFZpG77chzHo4tKhqppnmwSXV98qz9jcD26j3kAyH17e7lxgSCCYH1Q
 Qg0xtnrxgaX9Nm12JImoD73osSGIhuwGEGfktNQ5TBySwLGZ9a8nGRxVplHnTE8wIgebDBPRze/
 TAMlP5I39tbfs6QP1zw==
X-Proofpoint-GUID: bZ0V_08xhQJX7Vs2pnMTq9_i7cUMBXsq
X-Proofpoint-ORIG-GUID: bZ0V_08xhQJX7Vs2pnMTq9_i7cUMBXsq
X-Authority-Analysis: v=2.4 cv=MptiLWae c=1 sm=1 tr=0 ts=6a1fc44c cx=c_pps
 a=FOw1GTnNYXmOwZ/eduxC4w==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=E7v-y08j5IopDd4OsusA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030055
X-purgate-ID: tlsNG-ef75cf/1780466767-23175C48-EF55FA38/0/0
X-purgate-type: clean
X-purgate-size: 1654
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:dkim,ford.com:from_mime,ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,azureford.onmicrosoft.com:dkim,gitlab.com:url,saarlouis.ford.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A47863484C

Enable extra Argo traces in CI to help analyze any potential Argo issues.

That covers eclair-*-allcode and alpine-3.18-gcc-debug jobs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- enabled CONFIG_ARGO_DEBUG for eclair-*-allcode jobs
- example of extra argo traces in CI:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14661834468
---
 automation/gitlab-ci/analyze.yaml | 2 ++
 automation/gitlab-ci/build.yaml   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 9bf032931fc4..b5211bcc103d 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -47,6 +47,7 @@ eclair-x86_64-allcode:
     RULESET: "monitored"
     EXTRA_XEN_CONFIG: |
       CONFIG_ARGO=y
+      CONFIG_ARGO_DEBUG=y
       CONFIG_DEBUG_LOCK_PROFILE=y
       CONFIG_DEBUG_TRACE=y
       CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
@@ -126,6 +127,7 @@ eclair-ARM64-allcode:
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


