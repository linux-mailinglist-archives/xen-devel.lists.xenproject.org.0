Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oOHeDwbzIWpWQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E9643B14
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b=WWcCtN4S;
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=OEsXaKc8;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=b3hGBNN+;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=GalsF2sM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328594.1593005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwh-0003gE-Eu; Thu, 04 Jun 2026 21:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328594.1593005; Thu, 04 Jun 2026 21:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwh-0003eU-BD; Thu, 04 Jun 2026 21:49:47 +0000
Received: by outflank-mailman (input) for mailman id 1328594;
 Thu, 04 Jun 2026 21:49:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwf-0003cw-O6
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwf-00BQcJ-4V
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2f2-5cb7-0a2a0a5109dd-0a2a4501e2f2-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:45 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2f7-c1f2-0a2a45010019-94a392175f90-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:44 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654L5pI62666035
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 21:49:42 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ekgys88g7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 21:49:42 +0000 (GMT)
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by SA1PR16MB7076.namprd16.prod.outlook.com (2603:10b6:806:4b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 21:49:40 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::7d) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 21:49:40 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:39 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654LiWMM1072423
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:39 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4egexd8rmq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:39 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwVwLFX1brKTVFwWwWwln; Thu, 04 Jun 2026 21:49:38 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=427
	fQY0WC9SoNCzRxlfplx26kJaYiZXGxuZXC7/Nnaw=; b=WWcCtN4Ssb1S02XCzBC
	YUlnEnhXGldesOpNW4UHFJDnmnsNpE0wjFPJPqFE8fIashIaNAkMhFN4q3BsKrn2
	5oodHpwCoYNf/WR1YuDBn6HxjqYmDUL1S2uoKtcIP0+jm+nzkAtB2AOFKZwKESiD
	w+AHTajnwFVXuagIcc2lLTN9LNiNjN6cfNaNRK7Po6XHKlD9e08sM7EkGNXzcglB
	M66o/I7WbUO9mNxX5JTWvFuIvd21Qz1UKoYt/HE92SLcvim1Q/MxmN+xHlh2d2iy
	M0P7Hfy6M/7hGaBZuD0PMnOKCQERhGwayDKV/jhsRi8+l6GdrTDECRISXQOnf4Zn
	V/g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/30FwpIYON+Fg8zXTm2cjy+6RPoBTw6i6JPoUPpVr9QGTsPBq3O27x+QyEcW7tJSNcGZHnIuPjcXlsX1EK9c1CC32OE//cZaQgQRL/ZyfLL2xRn17X3vAXCIKALyPwMmRN4tzgVWya3vse1+q6RpZ/nsU23Pb0oIv6xS0vfa9T0uCe47GHrBbybCapi5ht0zJsS9Z50uRxVFqdLMC8nS5xO2c2hBampm1eDCPRxOW4k6Bp4JExv5vFRZHkKBJ5C7YM/phlJy6qOuA85L0Nzsfdky0bUcGigGIFapcJBYyEK0UgWnYN81eSBwQFwLRCrumMW4phCeP15cATcCFEqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=427fQY0WC9SoNCzRxlfplx26kJaYiZXGxuZXC7/Nnaw=;
 b=p+fXmEGqsNWDCa3YxQGW7AyHmOEfTKj3Wnm05VMyHoTvutHQKg97uZs0mkl9aebByXNoTF+4/ETxgc+f4zOkNU++NIuW8omtV0EUCNnJ/vAq0jOxa0B7NDJE2kfJ5x6X+9fz5fT10AS5SEjNA03CMLNBfqzIsAJIrtz34+UCYYwqenPzhS1tZHpMVwHvyrW2IMtTsFvuYoiuciHiSHoF4bUDurgnpNPD1jg10FX0oG1InqBHPQH+zLSF1ji5+uuTdfHWBXoJcNMZ2TiJoH/GQM+a2g4oK5zkswiBdpbtTVRDI+sh1GvZFOEoPbggOn+I1kCcGPViley0RGMIeSE5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=427fQY0WC9SoNCzRxlfplx26kJaYiZXGxuZXC7/Nnaw=;
 b=OEsXaKc89Te8nIDbzPrnr+p//cqChMM5AnLMfLPhukBKfa22TxtA12pRD81ixncVaPXEmUqxlSwnGjbJXs7MTRkXzWHMpAmIsjj7gadnm8pueRrDohSQJ0PvZmWY8l0wAFoghKXFMbf60bYVYr38tMOnqExTJP3cTwl0eHhwcNU=
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
	ppserprodsaar; bh=427fQY0WC9SoNCzRxlfplx26kJaYiZXGxuZXC7/Nnaw=; b=
	b3hGBNN+ii507FWfMeJUHU9emq20S5gciuWyUER7M9xOkcL6JhA1DsJNGakL5U9g
	rV1VKmSam4j5jdRABht8OLjokYN2eK5gkLrEj2uTERVRJnvfT7CcdYeo/5MzG+IG
	LlKhoIiTMDW6KGqC0W4RYdv9Dugy/BcuZuOg0FLxdQIdspQh8q+Rn1R3b8onp64V
	RsAlMjfl/jEm2og22rxpZeLPwsiw7/c3oKoRMJtkSQcUlrjBZohjCOO1EWpeWJ9t
	LGRg28SxUWPQpVEAAgw63yDWWIem2c3GbVFB7BHVYzrSuWUow8wVUmnUZ4iEab80
	S6sjzy+YpkKH4f5bO8FaRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=427fQY0
	WC9SoNCzRxlfplx26kJaYiZXGxuZXC7/Nnaw=; b=GalsF2sM2bj4YQpvOYh8aZi
	cE1tsCaIxPMHOaPiceCHl3AC4XALVJaCDd2/EgE7hAmsai6NrBDtIOsMixbxNzM8
	1Rj7zWJtqw3FB3H+6Av4G7v2XZlbnuwNrk3GfHKz+eAPMuDK41tpquFGOf/oYf/j
	W3uZg2LI/OB7mF2nEjfM9wTeGgF0DuozbBTQeQdF0zyf764iXatnAuwRY7axvdsl
	LijqYsjuo0M/KEX7kvDu30pmjyUdAbSc49akoUdB+bUeK7sFIv8jlJkALLLwYJX/
	J7X1v4Tp9J8yb9aqVHEFEWdTT+fiIlRTeNvDJhtn49JAzIvVCVAXHI03gSrNOzA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwVwLFX1brKTVFwWwWwln
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com,
        Mykola Kvach <mykola_kvach@epam.com>,
        Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v6 3/6] argo: drop argo prefix from argo_dprintk() calls
Date: Thu,  4 Jun 2026 14:49:23 -0700
Message-ID: <20260604214926.1735194-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040213
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|SA1PR16MB7076:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de977452-9e4a-4677-c08c-08dec2832df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/bobLp1A2AdgD8TfG58YW7c02ijT6vlvW0GH62K7zNN/ZQicICQPi+mGt6F91Ul+0RfQq9sTXt+AW7khfok422goalKJfrWwYxsaLf4PwkYkwszbX8YXVkkAiE8GB73V4QI10iXYN8+VoHt6gYo9OZERqoq0+wOcAV3l228zTJnzBtatMSrLDD6kEPwzvxahW6zucjsm9Lc78cGJ2UdEZOkAR2Qm2EZXc2GDDMpZXT0tyddv970SRIMaTqO0OOU5jCMKGjaMdS6kZoOPd6r8D2TAz6QDfxNUXjA+aHloWuTkchP66ZPfONWOUNDrop7cEWYF0NdlFaPd3owqm16N/BVrf/ECTx2skCFawdCuTap3u/ZrGsN6uGcf8Tbs6j9ufjaA95vr0SEDvjlRCVR3cly5Nvc4pfvU4xAUOGi6iyizM4SPIEuVU5Yrm6qyvo3JIYNLA3tlExyNj6fIU7wp6Wu8RSn7loKVFYz3XW+2RgNks+S3Kp7ccPazWcDETTMIodmw58IGZJlXpb4lzHd2H+gTjgn4uFyrxypl5DQ4+uy+SGcTyNYuhTIloQdPthtFQUYGnkIShIadOl3NlGvFLUorgPzfceXfYn92dFXe55ONMcq8OWN6/KjemGNjRk8OU/+6J+XFhSkQJNCuq/kBqhV5oyg/z6nPwmJ3MpFHwm7mBgeV1gHw50w7vF++umVz85hxqNHXiJrZp3csJgnqFNyMCeyWq8EpRqKwEhiHdhw=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7z62auJDU5X3R/jZguQiTyNPCA3Uyb+f05Xa2ykf2KTHqp5i/kGrkbDoJ2r9IItQ+cDMM1bDZflksq2lE0WyVvji/lLyw2SJ+1iQr3tyDD2S67Kl6/g1GIaGjLDxagGYe373VYlNYOLJxmHfaMhLGDUd+8KOmqR9IyHAGSVn4vo/Dq7ZkNEErEwfIFM1j7YOKstgUNrVqHqdXTWM9SVFypAU36WcmyfOlvBS4zCZ+Kff2U3Gwe9tmvm5ny7k6uubue9hOvwLfxsTQSAgaqbzLTaS2gh1pAKKKFN51fkb4svjQgM36REQuBcbBqDtkoDaZvK4LG5AVyZSHep+FjN6L7fMbqmLWR9DoOSo0c95VfL6j5ldNW4UC5RC0MHU2kPn7XJn/WRhfHI/e9ukrEETmX5DTqaUWTqvUVVl8Bpvoj2vcRDFOa7yBWCFPBLXmXIs
X-Exchange-RoutingPolicyChecked:
	R5RBaS24kA44XXLZj3xeoLS9fGzB/wfobyqV22Kp+4Zgkvd/SlM0M9QsqTUspb2x6cza+3AtEyEZa0xLr6qHTClN7ggSROrhP4Qrvwn/6Sf5g1hHdhJXOxZ5ht9au80SqX8BQoXFvdri2Gj7woBZZx6SACr4wVR+YkQnPgVaI7nSBpUWgQbKqKxaNinDhKWAKHue2dgfb7FCa6SX2vYdJryd+eyxvA215L4fMR+Z5tudHkEaJ1yGtRl60PXrKAeNfj3OIS95KgUToRjGU8VSFALT/SsQH/pgfDTubmv/yr6rhg6V5Ceyof7H2qxz6cL67E89X3oWIkZGS5vPuK722g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	739KJcBh9tz/Hu8ZR7H/HxNBG1rr168sVRFi5gQEZea4PQmhuB2WG1gRyrU67lawX+RPqj9M1n9q4v+ZpDHbYeW55F/z55jbWKs15b7+QBv0i9HWY1Cw5rFmdipqH5zDzX5BmtyhKuSPJFinPCIo8PZ5DSCRDf9xbD+eaca/WPFH9LMkJ0sF/GElHPqbPB3AY3+gKgI65HK6jzDtIogdPD4ebDwZDQrhCzuJndXFTBids1nX4CtR5vi/gMfEp7u8KZ57pScg3RXkRPEbg4de+UjKKwNTw4FfcK3bPj0Tj7Q6HBEX8K6I1LpC9OrxpdDNaMLMT43K4vH9XFAAEyHmJD/df/m2D/738lv53trjY5D5KrGFyjagYBUvAlMw9by2pFDKJ39oU+VkBR331RPN514tH5JOKRqrG53f13DSJ28x+XSyt6GUac3tuRaexDO3DuQlI95p/bwRlv0t+RK1nSpH2YAxzJlU4u9ZD7HtIODTppb6K2vDt9JcocMuMt7KOUhdcJmYr+EX/egUPL7uApXwUZYonzHarJH26kTMWT1EmDdrRe2v05XQyov1lfsKfrnTZoOvxOW4zxq38+eN/ypd9OTpFZLwrgdNQgAsxZ9/5tY+PHzkrdZjqxoGEzN2
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:39.9873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de977452-9e4a-4677-c08c-08dec2832df7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB7076
X-Proofpoint-GUID: CUVICJWc_jtyGCNYLGMmtTdgoxYCRcHQ
X-Authority-Analysis: v=2.4 cv=BbjoFLt2 c=1 sm=1 tr=0 ts=6a21f2f6 cx=c_pps
 a=Ftf85+eZhIav1RrYVnHJVQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=DBfv99YmAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=TweWIa6zg6WzoLAQ39YA:9
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: CUVICJWc_jtyGCNYLGMmtTdgoxYCRcHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfX0uqbsPbpbtLW
 dpjE/LMgq9tflyanh+3mOGQapT8ydjv7nNS7schvDNCmzJsUSa5Bt06cv/GBnnWENHZ98SGjqWj
 Mmm9SnQTEB9bQrDnUvSvnVRksbf34IdBL2cK19kJ2352gU/d9nNoqy1mYfbzCT7f4LTzRAKUbVh
 +33ftHRd8x+Y2FhtMWOtUu8QDf0bXTxohxxdS3qQIvOle0UmK2w9rFkyri2qSTuoMpDciM+U/ss
 hhV8gNdGpqjRgh4Lt19RTbuN2Jo7QirkCijmFLzGA79cOm9Y4dcBaZyxltJ+ULGf3/IBQ00QVp1
 rDldpYqubfCNdBnmqozR4ANrJ8dJ5vBjYyHVctE8d+V1wV/uCyvs81gnpllUxHX8Bx5C+cNC69c
 FTolIzCZpZChIpfVhKXQm7gQ2ejY0naADnTvdvZiaoe1eg84MEJpgPkTuSMDxQdeS5VP+g05sfc
 7Erahppu5X2LewTLbYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040214
X-purgate-ID: tlsNG-d62444/1780609785-ADB46FF4-72BD8AD3/0/0
X-purgate-type: clean
X-purgate-size: 2531
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:mykola_kvach@epam.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA2E9643B14

From: Denis Mukhin <dmukhin@ford.com> 

argo_dprintk() prefixes all log lines with "argo: " automatically.

Remove duplicate prefixes from log messages in the Argo module where
applicable.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- added Jason's R-b

Changes since v4:
- n/a
---
 xen/common/argo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 5da14c929e14..ffa1f43437ab 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1467,7 +1467,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
     if ( ring_info->mfns )
     {
         /* Ring already existed: drop the previous mapping. */
-        argo_dprintk("argo: vm%u re-register existing ring "
+        argo_dprintk("vm%u re-register existing ring "
                      "(vm%u:%x vm%u) clears mapping\n",
                      d->domain_id, ring_info->id.domain_id,
                      ring_info->id.aport, ring_info->id.partner_id);
@@ -1527,7 +1527,7 @@ find_ring_mfns(struct domain *d, struct argo_ring_info *ring_info,
     {
         ASSERT(ring_info->nmfns == NPAGES_RING(len));
 
-        argo_dprintk("argo: vm%u ring (vm%u:%x vm%u) %p "
+        argo_dprintk("vm%u ring (vm%u:%x vm%u) %p "
                      "mfn_mapping %p len %u nmfns %u\n",
                      d->domain_id, ring_info->id.domain_id,
                      ring_info->id.aport, ring_info->id.partner_id, ring_info,
@@ -1741,7 +1741,7 @@ register_ring(struct domain *currd,
         list_add(&ring_info->node,
                  &currd->argo->ring_hash[hash_index(&ring_info->id)]);
 
-        argo_dprintk("argo: vm%u registering ring (vm%u:%x vm%u)\n",
+        argo_dprintk("vm%u registering ring (vm%u:%x vm%u)\n",
                      currd->domain_id, ring_id.domain_id, ring_id.aport,
                      ring_id.partner_id);
     }
@@ -1781,7 +1781,7 @@ register_ring(struct domain *currd,
             goto out_unlock2;
         }
 
-        argo_dprintk("argo: vm%u re-registering existing ring (vm%u:%x vm%u)\n",
+        argo_dprintk("vm%u re-registering existing ring (vm%u:%x vm%u)\n",
                      currd->domain_id, ring_id.domain_id, ring_id.aport,
                      ring_id.partner_id);
     }
-- 
2.54.0


