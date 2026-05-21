Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOkBFsGUD2o1NgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 01:26:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECB5ACAD7
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 01:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316098.1585654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQCmV-0003xL-Dk; Thu, 21 May 2026 23:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316098.1585654; Thu, 21 May 2026 23:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQCmV-0003vC-AW; Thu, 21 May 2026 23:26:23 +0000
Received: by outflank-mailman (input) for mailman id 1316098;
 Thu, 21 May 2026 23:26:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wQCmS-0003v5-O0
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 23:26:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQCmS-004cIy-4U
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 01:26:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f9485-5cb7-0a2a0a5109dd-0a2a450ad838-10
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 01:26:18 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a0f9497-56b3-0a2a450a0019-94a39217c18c-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 01:26:16 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LKEtj82580071
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:26:14 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ea6tp2p0s-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:26:14 +0000 (GMT)
Received: from PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::8)
 by SA0PR16MB3805.namprd16.prod.outlook.com (2603:10b6:806:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Thu, 21 May
 2026 23:26:11 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::d0) by PH8P220CA0027.outlook.office365.com
 (2603:10b6:510:348::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 23:26:11 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 23:26:10 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64LLoIgJ1923897
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:26:10 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4e9u9ys3q1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:26:09 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id QCmEwvGzwdhUUQCmFwIADb; Thu, 21 May 2026 23:26:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=QeS7mk7Q8nU1KgP6uhv4jkAvI
	8fGYa8i2nyzo6Eee+U=; b=EljAue7bjayX+hHFC7tdNoKJh7OsJTCfXsmnhH2KX
	c5/6yIHjKzQVDApGT+hZs0b0hRZ1JitadDudQQxM2W544jHWWHIl43b/cFs5RtFx
	k/OZANeZXNZULaz/xzwjij2+9EuXHRZ8NaWrmulLNoXzqn0MDzbWI+s6cal9eEUP
	bVKqsBkFT5KABCTUclYnKmacnPIBsuZ6qytztN4ZKlHuvGBFWphv2IvE8UJgiMCe
	c62AY7GQp9X2vcMIaP9aeQDjeWVodiqyTohnuudmTjJyxwzG/5IXPSU1Df/mFp/U
	TgSzhIymEUoMagqns7HUEShZexYUWPqu+9gXM9Tc2RzhA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VloQgEUrZF9ol9bWfU9++OwYx/cTmjmof74gVl5PkCjzmXZjWDgnxzfNLZplp8omAl8fkTFGn2vdd6m4Is3QdVNzT4agg/9E+vc537ElmTiWMZHXi1REig5suM+Q/7pqeBuySF5r5ZHMQUmUj3xQDm8YKBs7r3QVqzikERdUe81t2M4SYPafwAwOkEYeXrylD1nuT2LWfgtmVT7onS0t6RL0EFw1b015dUOb+41Z8gT3iLSy2U7KWMBm9VRgD3dF+fER7pM7JpWJ44S8XE9HKBoZfZHKa5hi5qH0DOn+prsQJ0OcRk83hvfhLtHoaZCQEvtCobHtN6oeJr1T32YvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeS7mk7Q8nU1KgP6uhv4jkAvI8fGYa8i2nyzo6Eee+U=;
 b=eNE9rokTr49z8ZGV0n2oT1GatbrqbTEfxrmxP+SdOEN6cXg2P+6mVCJegPR0n8DxWRTMX8vy3kaMXYiPZWVXk42lCyuMk8AcnyelRiTw6wyqRl89NuOBazZij/2eK0tdkh79rgt6Ddp5mmTWOqUXy/xisKVWCEf6butC9eh79kmeltQHzJmQ99dTyVG5uY9q+/T12AHm8PB/Ynt/pGuGrzZ7rs/M/dMpZhwwF/KI4iN4/wTXlmZYWIVHDRb5g1NiUf+o17ZsJ1Z/9O7qFlU0wzckhtVVADSpU7HPSzKWbgDNz13wolVDqcQSgTb+AL+ZEL1erZgyU4vvmfnno1U5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeS7mk7Q8nU1KgP6uhv4jkAvI8fGYa8i2nyzo6Eee+U=;
 b=QO275TybHVjvSlUNZY8x5oHpsqiWdpFUm94Ic0qfdZ460TzF0PU6kj+T65YDywlk7qlA8x4eS6Wh6rHNXsUUAdaMhxqOx3PTBMqUKxZiFzhnIiHV3AVE/XvvcXIpWom5DhfmGZdkP0k6jM1yE7aWH4AUgbwBwh1BB+lY7s1es/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=QeS7mk7
	Q8nU1KgP6uhv4jkAvI8fGYa8i2nyzo6Eee+U=; b=Jv1LBlJSwGWDi4WG78oGeV5
	NAFWTYwudS+Lhou9saSAJCWvn42MaJyM+y8xwuvgvMMh3xaSCbUqaSSVth6br2kC
	VH43yh4F0BKphzDa3pqf0zqv0w9kk0Ny4S2KTQEkkIpbeo25hEyNPMPsLG7KYTsJ
	KDK7K2bNlcBFurwksPm2dSfhM0lgEI4W+WfnSfQ5TioFLfmPp0QGk73PBVe7XhwL
	93xRXin4NZlgwYS/L9pG0MwNiSHZaR3cP2A/STrcoF0wydcsxyUIFhff6y37tOoF
	FPbU/mDdv5pF0lTNsfQHAihOqtnj5WIUtaxALvQMTeBsYPMrd3gzPb/1Rusbcew=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=QeS7mk7Q8nU1KgP6uhv4jkAvI8fGYa8
	i2nyzo6Eee+U=; b=JMDZw2XW2Dkc8RZAiIrIZPausW4i6TJwQy5ct1Diw82I9xp
	bw0hbufpX0EK84e/4fkO6EyJKlkdgGR37dfvn2fUURQpB75xLhmH02Y3d3w2tjfa
	h2UVuHiM/8rP4PEH7HIAlFQh/Ft4NkjNratuCnAMsoKQLaBlg5aDbqtoBgPV9PW3
	7RPdQabsfwZeY8q+Qn/GGiA1rEWArpdgwWA+pWB6wfoAIGNhmE36b+Pjt2sBorsD
	dCxeEnBWA8aDdD5f+3WnS21JFwXRuHu1PVEWH8AhK++JeXBuVeowkzLDGVXLaLWL
	1ZLpPXj5GcRTwl+zK+UuswLNsDBX8y0tbx6rtWA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: QCmEwvGzwdhUUQCmFwIADb
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, christopher.w.clark@gmail.com,
        dpsmith@apertussolutions.com, dmukhin@ford.com
Subject: [PATCH 0/2] argo: few loglevel fixes
Date: Thu, 21 May 2026 16:25:27 -0700
Message-ID: <20260521232529.694570-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210235
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|SA0PR16MB3805:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 875b8476-e381-4a13-94ef-08deb7905778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|13003099007|11063799006;
X-Microsoft-Antispam-Message-Info:
	0yUQdGDGM1ggtp9JkWkou8374gTWdQwUJwSGt79UUo4A/kPmBdm+lJmKa6RCklwR/H0F1qNqIMsYxWArm3td3yBEfg90rxZJGr0FmHqNNslDrhifwavwCxjdTAADFyzvQxZ0UNihkmiP0m1q68U+1kfOM1y0Kq0OEVxnoyp3DTPXmT1Zx4DR4N+TB6FDX7umIRTGvkfo//hiKozuYdBwvP64nYgqVNCTQVVEEm0Uzsq1DEmVXlcPx1HJRNvSXYxbMuJCR8PYF2BZ7vtVbo16m+mqzgh84eO/4CKdCdOAziGG9B1rEDYlrwfF04StrVQcA+OoXB0bp/xf5SMdbwxr+nGoWxCcgKhpzzlaknuEw5EReQefUAXwwKxQPxenG8yRT0ZrQ5NxV4B4ZCOEHi8jaNsl4Tzttkg1ctrqiyo7QWsOnDE2ZLHbf9zIQ+ZBMYVHoqzlarjVIZXdxo2C3ZCUHiywonCsFafdwpo23JHyjMnuH7KFuU6JG5fzOu7Q7OKKZDNjYqypLt8MGlTiMUiIFV40LysOSwje8ZeVp9sNdie+s/Hsnk5XtULSroHtSoEfoHoNI66rle4K10BAIf6WQQSxFNkEureH9LOTlhvaYaUUKrJVPbZk9PMmQlmifwqvNiRmyU5S6/hD8D/TOK1GYtO5MR4bRn73ohh4IlsvSk2B348ZXzRPo4BE0lwsnr0XKHA8t8yKKIKJbBpL6tmvCj/eD8TJFIrUT9mEWm0xs1GayrlRH4+spIZEi+fye51v
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(13003099007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YBB8EWzEb00Gnwlx59oTzX2j5kiBiThiJdQZ2yD43dlShzDSlAntW6GxOcK6x0EIXgW7mAn6GuruTF02AENbqr7W4d0VwWk34b/0zK+Dqnhcgm3y7rI8FzglsLFr6qEnOucV7RzjoiGZJTq75CAa/iOz4sRerP9nywam5huKr18iUJ3uDY6vnDW7km/BNPvBe70iS0FJgOhd9xEUStN48cOj9GM5ZYBUJ1C+6TRlVXPuJAv/dNdCJC36sKCvNwlZ2KdcFfww3j6MDxVc8oa0U4LJ5iFPXssPGYuWSz4IjwBI6qYQbk+akajsfZve7rYudl27cgExoUAKshepgicqOLejmwnwawZ3Q0BhdAFPaoRti/cDHQ5NqkTjbz/kLiA8InmvfoEIoWy9rTlNC7tH0XY4H2lYDdzihyEcHPE4xdRF7sdcaf3PrlrGgkNHcCdg
X-Exchange-RoutingPolicyChecked:
	ZZaWE6tZeW24gcu0e3il6Fc6gqjQ+QGeEkYBtQtJgUrJqjCjzHAnCseZOJ2aY1Vcye1Sqjw93LcpbZK+F1Ab32oCKTWaOUQ8Ny8TnBJHd1/RPjTjQEaPMLHfbR6TdvkIo1DKjPXxh+2kmA5h5koNY8rbQKaszn8cPuwEgJwcBW58s/nFGcpsQdg6mZZtj+keYx7AmTAjBZwAVypfjwLrAFbAtg2depZvDsdSJ984fQesW5bjD4oGGZ84CiNX+8NfI5LM+gFkQcxGMZ6gCNjgSkSrg+BS9jQZGwqpOhDVwGCSnIX9AlguQaaOHAG2xuWGR4Cx+U64ZPjR/YQwdajXOA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f+0+YS2GDCwQmh5y4JC055F+SCpoF3aftgVIHSn8VF6LdoWIa9kS3x4nqkiPEFyHPIsjoCzx9DCeWPgP1kTh4mUUWs9B4k/D6EEw5nekBuFZCNHsU4NJHSjhYPEjhHqElVuZa6khlyqDIG87yZXcTe9ov525Qc63AJbrgvxe9pvaixamv1U6dkB0JDMRPr1mePWkeM7y854VktKw4hJAnuts+Ny/JZ4fTsnD6FXz3pTWxLU5rn4Fqd8WT3B30s7G20UKBvEw1LefrigEKcg3ZFOgBHtnNHoOumG+hbAazw395bAl0hfGgBj9Of2CPFD/iqBpNx56tOLTwDqFzb4byUZKUbCd8iQKlUDis1NScrQ6AMS9O9AxkINN4pnWo3MklX0CE/Y06wRP5ZS14XNK1DTFRDHOxPhOLho3jHRi1GS1vF4RihQApTzy2wqTPAxVfEKJ38ZXltV9wUZih99HkgA/6o3vo81DQZtALQcNCyEDfLlIHKgoUtmulQwmI1Hr2I/NixFqFS1GucPeWHd+vXkek/b7JoYjYTTicumYmILmdOzgB5sQLg9xQ6PzUsbNxUfFH0go1M11Vzbf04jonpCHivTx73yyxjuy1jVEKBk0hnaaGU3Cn0lL+669CL7taJUBqjOTR7xgRRM1Gc9/Rg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 23:26:10.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 875b8476-e381-4a13-94ef-08deb7905778
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR16MB3805
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIzNSBTYWx0ZWRfX4hw83YTrSC6K
 hg91OzbvIr2CTjPilZaXxIgdfPzuaNrXAWfOk0mDTl0+mKEVczxkB1R4QcdoqYHxvvd85adaSy9
 h+eEbiRxnHJBqmWoMU9ARimQwkgKS3w9eO3+Q6XK6VbncDmZt9a7mhOMQZjQRJ09PF+m9w0ZdM0
 siLxF/0ff4YW6oeJ7MxqwkmzqtoyvCamvt9yMEyAjaqq2QAWDDROShTohj08yKh9cmcWQvOzTiv
 IV5mlXEdGlFTwq6U/P75QMBUsCdldRGNAKzxsHi3aCtRCGZ5C4OwuTms28Ls7noLZ1t53nA5SlQ
 tFsy6QBtzd7kgcezTE+k5JPs/NzvFkH3WV+JIMbso0KsiEB49rPGMafdLkLaBBoBKwV5KxJM5au
 x7+Y/gk+tzv0HqoG3FetHHxyqYkCdJ5NVxTyOV7aRk85JfVRPE8SST3ZYJakD+902f1z4lXL3My
 c0ZBrUFrHkDGYu0IglQ==
X-Authority-Analysis: v=2.4 cv=WaI8rUhX c=1 sm=1 tr=0 ts=6a0f9496 cx=c_pps
 a=ETG1guYRlgXENsW4hp29Cg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=NGcC8JguVDcA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=p0WdMEafAAAA:8
 a=f8sLD6d1oYygO2dfQ3oA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: QB9eAMwf5piLK9LKSYGdfcUscrgIX-Ra
X-Proofpoint-GUID: QB9eAMwf5piLK9LKSYGdfcUscrgIX-Ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210235
X-purgate-ID: tlsNG-4011c0/1779405978-7E38D8B7-25F23FEC/0/0
X-purgate-type: clean
X-purgate-size: 455
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,ford.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:dmukhin@ford.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,ford.com:mid,ford.com:dkim,azureford.onmicrosoft.com:dkim,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: A4ECB5ACAD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This mini-series fixes a few log messages in the Argo module.

Patch 1 lowers the verbosity of a spammy log message.
Patch 2 corrects the debug logline.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2544856081

Denis Mukhin (2):
  argo: lower level of noisy connection-refused log
  argo: correct logline in ring_unmap()

 xen/common/argo.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.54.0


