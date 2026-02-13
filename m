Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPcHN+vsjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:20:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FA13464B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230362.1535845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpLZ-00051q-0u; Fri, 13 Feb 2026 09:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230362.1535845; Fri, 13 Feb 2026 09:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpLY-00050P-UD; Fri, 13 Feb 2026 09:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1230362;
 Fri, 13 Feb 2026 09:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz9v=AR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vqpLW-00050J-S4
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:20:19 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3499e7ca-08bd-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 10:20:15 +0100 (CET)
Received: from DU7P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::30)
 by DB9PR08MB6378.eurprd08.prod.outlook.com (2603:10a6:10:257::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 09:20:07 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::ca) by DU7P195CA0025.outlook.office365.com
 (2603:10a6:10:54d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 09:20:03 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 13 Feb 2026 09:20:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA6PR08MB10781.eurprd08.prod.outlook.com (2603:10a6:102:3d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:19:01 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 09:19:01 +0000
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
X-Inumbo-ID: 3499e7ca-08bd-11f1-b163-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sQZPqksH8ZeKwq2w5sjhi2qSkdTTMrNYDRFBO8EskHC+pR//UoPL21MxR/7JLWs+U5OWEeRnfOxQ+wuEHxZWf6EO5rbTcG3c58DA5rk5DJVqjnbJZEpZw0NoOU8S4eNApnlqNNRoP+g7hYtOF3t886Mg8fkx++7DBzX0rgq1l2sVRtldcsFIdVGckMpO70yONGd3bwoz0dy5+V8Uj86MbOjl3uCpHjtEra2M7FjQ7CBm5fnQnjCo6/BvRvOjwNYj8AGzU/zJroP5PkYGB5OYgz+ewckGr/T1UtVlZWGESvVIJMlKgSu2sIoLBkKLfIByqL0CooHYjOIWho0jIKFfeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s00ztgLAbziHEm6vt3o+FjLtKmooLKSneQ4KQrIXGdY=;
 b=zEfQYCGpexGBu1CyubaJAWvl4U6FfcjmQWwWADg0B2WeHFOoSrzegSQslYiVA1zAM2DbRipYHKvBfbjiRxqH3a9+6pSb4PTAW3nDlezbOxSnk/pE40wqENnDQ6MYD/lJY84Ui3D6tJcXl0XujFgTru8LpZJ78kskqIOyPPKsBhtQXqfnHk9zxd8mS7TSve8y9luxnlQ3mPdMWjJ5AAsHBDMUWZA69goU7xmFNOe1zfQaQRYG38FZNws8T36AyQBFC2sDNhZ8EWb2FD1D1gz62J9dWfuxvrUl6WkyTaIWEtR95x+6IkNO7CSGCzAU2W1y02l7ngdl2sGyq38K2cMPhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s00ztgLAbziHEm6vt3o+FjLtKmooLKSneQ4KQrIXGdY=;
 b=GfbVQIYkYSNMyz3ihrqvj/FbqOKFxNCZPlp/8/k4F2IizPjCW4LuA5meH8kE70KKDChzcxWT7/1cYpJKW+WXVVP59DB3zAj/DXMBRbH7Qk8JSseqzLXBYiVv41TaQMn77q6qDqCvmSTGaqL7sbaoobIwKmFiln2beuj0c+PmSx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEz387b4b6HZ3+B7AuoGOxTF7bkp89d5OJW0FC4bM52gw3WKhwWJeqiYXoTMHxpMjNoNIqhnZQ6KMcyHPSLZSbp4iohFAG+rYmopYbYwLrIfEyqeh10mBvILhFgkpGVPj2CpRoFk1jRbowhwDsgJA+qZSaWRE7Vt1jDlEDtkku0ZL7JN010aq2FrRI7GNFwLyYlxseIh72lTeO3Z6i4YlMkFHHdR8p09bg5FCu0JmqReaCHHXD7hSnf7HC3ga5VDS8NEkazIFE8NIbTF4Y3lbourxWKyg0Vvzwk+0mn28y/sGKLAbC1UDanXeryZnB8N6AnbYwqS4lSj8k+kAzC+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s00ztgLAbziHEm6vt3o+FjLtKmooLKSneQ4KQrIXGdY=;
 b=UtWkdw2Ja7QyRGG5WGnlJfHNcbFRh4DHtGyzC24EnTe/6WrESl42fdhEUIHvGkAbUsbGV0yOhXwCqUNUrG2lpQRyZO4SJu7zzCcmgD9WRDyMFbSE28DrEdRnmdeZW+ZzVgnlfDdoLavR4tCMTtvTfL4gedSKly1Nuj2He7C0KGS/jNmeetmqfApQGo9CwjoOawUFSJQbV38MqyWqELv7aaEhs+Xc5iA340szojdcsWKu7EMEgP9M5dBzpDB8r/MB8MJqdeMRvSNbAi9dIKovyAp+65S864pSDgW3+51NDPdRaz+MfK/yU/madGeNJI5L80yl4G2Q/w5R4qHZS0LYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s00ztgLAbziHEm6vt3o+FjLtKmooLKSneQ4KQrIXGdY=;
 b=GfbVQIYkYSNMyz3ihrqvj/FbqOKFxNCZPlp/8/k4F2IizPjCW4LuA5meH8kE70KKDChzcxWT7/1cYpJKW+WXVVP59DB3zAj/DXMBRbH7Qk8JSseqzLXBYiVv41TaQMn77q6qDqCvmSTGaqL7sbaoobIwKmFiln2beuj0c+PmSx4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Halder, Ayan Kumar" <ayankuma@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>,
	Hari Limaye <Hari.Limaye@arm.com>
Subject: Re: [PATCH 1/3] arm/mpu: implement setup_virt_paging for MPU system
Thread-Topic: [PATCH 1/3] arm/mpu: implement setup_virt_paging for MPU system
Thread-Index: AQHcnEZRjsHb6xYG00e+PVxLnB1X4LWAWuIA
Date: Fri, 13 Feb 2026 09:19:01 +0000
Message-ID: <044B5E7A-7DF4-46B0-B235-B4DE7FBE7E10@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-2-harry.ramsey@arm.com>
 <49fd6b8c-5a6e-4914-a3e4-80ede233ac93@amd.com>
In-Reply-To: <49fd6b8c-5a6e-4914-a3e4-80ede233ac93@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA6PR08MB10781:EE_|DU2PEPF00028D04:EE_|DB9PR08MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec40e5a-4c15-4ee8-6a61-08de6ae11340
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UUNOVUJzMUpMRHMwUDY1QmsvcUNFenc4K3VJMG5iOFptQWRYZUVIWWNuTFZG?=
 =?utf-8?B?VVowYnFqclJERGJVdW81OHdIMTFjTFBBVDBZWm9pRnBudUVkTnhrMytuSjBO?=
 =?utf-8?B?M1hoUk1XY1ZBQU5jL2ZUYlI3dThCcFNKbnh3WE9FdkFReTRVMDlBZzVsbmRR?=
 =?utf-8?B?WjUrc3ZaSFp4TEQwMENlMkJwQlJLOU04K25sdHB6VGhmOGs5UzhXbitFa3M5?=
 =?utf-8?B?Ni9CdE1vVjdJQWNMQ1NwUXZZUko3eTV5a3dLb1drRVFTUisxcU96Rm5hMFFP?=
 =?utf-8?B?alYwYVlIVXlTZDVvWnZna1M3dFNENGZYckZzdzduSktPL05abGw2NWE4YmFp?=
 =?utf-8?B?WVc4MVpFdmxRWC9wSlUxalJqZkRyd1FmYWI1UXN3WWJiSG5IVFpNTVhaRHhq?=
 =?utf-8?B?V0tIa2M1aEY0S2E4a2tmNzhHbHlEZlpHM1c1dUJvMUlYNE5JQjM2MzlTODUx?=
 =?utf-8?B?UTlWVUJvaDlxSFBFcjhFTFZCRExmVFpaanB6ZktWVUhhdnovZk0vYU5VRDBF?=
 =?utf-8?B?NlByR2g3bjZod2o3WXoyMlkydzYvR2M4dy9HaU1DNk1FN2JoeDM2eTkveHdl?=
 =?utf-8?B?aTdjaVZtTC9PZzdqaFJhaGpOMisyWHc1K2x3M3JGWG11YThsZzVhd0xRRDYx?=
 =?utf-8?B?NXJzb25sZERWUzNWcVJ0TzJqZjdYTWIveVZWRHBBUXRUbzFNNGJhb1FFNXBU?=
 =?utf-8?B?dEVZTnVVV2FacjRHbEVFbUk4WG4zUFhvMEhpUWRGOXdPcGF3ZHN3eG1ITC8y?=
 =?utf-8?B?MHBZVzJmV0VJdTNYZldtOVJzMCtzTjNISitEVjMwZE1VeGhMczY3d3BBdjVK?=
 =?utf-8?B?VU5JcVpqSFIzTkVkcEdEbWZIUkcvTEJNQmJqcUVWOHNKelNRUWZLMFcwRE45?=
 =?utf-8?B?OWF1NllHL0ttN29ZOVVEUHp5eGNXVDUvUFlUV05ZRnprV2hJQUp0Rm16Mk10?=
 =?utf-8?B?S2lxc0o3Q1pXV0tCYjUxRWY5K2tQR1NVRGFKZU5LcXFkdy9qdlR0bFVRS3RC?=
 =?utf-8?B?ZVBGTlVreFp6WHliR2w2SzUrVjZhVkJPbnlUR3VaVTE3WGNPVGM2UGVoamhx?=
 =?utf-8?B?cERjNlFnV1BGY0NHS04zd0VoRjhOUGhMSkJ6NTA2RHUvLzNDMFBQS0J5T3RL?=
 =?utf-8?B?KytqUUJrQi9VVlhCaExUSDRlR25wTTE5TXlNNC9kWHB3L3RKSUN0U3ZmeE1O?=
 =?utf-8?B?aWZCaHp6cmhCQ0g5ZWUwNFlvT21XYTZPNUd5a3AvUzgwV3FUTm9CNWU3V2V2?=
 =?utf-8?B?UGM3SUZhRGhybEZ6NXloSHFQbnFmTzZQMy9xd0dZeHZkQ1FlbTd5SnpLUmE2?=
 =?utf-8?B?N3Y4OXVqalBLcGtMS0l2aTgzM2d1eXFWY3V1MFNBZlJUOFQ1R2NEQzJ4bG5P?=
 =?utf-8?B?SHFpZWgvVy9HWkljOHUwdk9ibm5aNk8wcGlLYzF4K2dEZ0NMVlorR1BvY3lw?=
 =?utf-8?B?Tm1iZ0dzK0NhMDhVVUpSM1grMDBTSFQvMHJPMHZROGNVSkJITkNJRCtzSlls?=
 =?utf-8?B?dTdzbWpFWS9ySG9uc2pnUURDYmxXWGYrVFR5UVd1QzZBenEvY0xseWx0YnJr?=
 =?utf-8?B?ZU5EOGVFUGpDdUxLaDk0V2hGVEltZUxEbUFUN0NjTy95Z3N0NUd5RUNRSUlv?=
 =?utf-8?B?VFZ1SkZUaHlhcURRbmRwemVmMGtlSnNFcjhrbmRSTFBibW9lcENwemg3VXV4?=
 =?utf-8?B?RFJ2UWduanViQzRCOVpDd2sxY29Nb2dPL2h4K0cxcHZGMTZTZUhhV0xWdURF?=
 =?utf-8?B?UDRUa01MRFhVSVlsNVVmS0p5SnpQc2sxUzhGMFo1REVRNWpsVDZ5YXFpaU1q?=
 =?utf-8?B?dzAzT2xLNU5RMXMwYjFtaUhaS2xyUUxldFlheTc0UHEyUFRrdStqQnNWaUNt?=
 =?utf-8?B?VDZIWHpqUWhqOW81Qk8zNG9PWWZMdVU3cjRDZXYzbzhzejg4Z0g3Mk1KR2lU?=
 =?utf-8?B?MXY5TCtzK0QzRTFNSUhFVzBZQzJrdldpVUprWmw1MzdBNlhBeW9NWVd0YU1j?=
 =?utf-8?B?NDVZMENnY1dRcmVzQ2JRQzd5MFFxNzA3cXpUYXVVUWlsZ2tjQlBlOHE2NjRx?=
 =?utf-8?B?cHJsMkUwVWJXL0dMQlBrYWVmblJUTnk5blBzc0xIZVFVNlJ6M21PUFRLZytN?=
 =?utf-8?B?WnJ6eUpkZG11SFJ1ZTZpMCtkR1VoZ3pOZktXcVhRV1BxbmNsaW41SjJsdlNm?=
 =?utf-8?Q?IjtXZR+FJu1zgMMnqMXU//1nBgTk/Rz8sQMhzpu8R+BH?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD856116B6FFFF42A412378A1E5036D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f39f2da0-d85d-4dc4-bf99-08de6ae0ecd5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDIzMG56U3AwdjZ1ZitvelNwNndhZ1d3ZnVlNzZiblY3U08zWGxiMjVWeG1Y?=
 =?utf-8?B?ZXJqUG1UeTVDRkVZSGZNR0o4WDhuRkpuZkJUa29wMER6SCtxQ1Y0OXM4SjBT?=
 =?utf-8?B?S3dPOUs4WkVIZmhvaThPOHZNZ3FNRmk0RkNlb29SNjc2OEtCTGw1Um82NEpI?=
 =?utf-8?B?UkNWRXlyUzZYbEdWK0ppZXo2TnV6S3JMek9JR3lOaUdCcXVMeG9obXdzem5r?=
 =?utf-8?B?dzdjUFZWNmJSbTFjb2JHdXBmTHZNaG16SE9tdFJMSHEwUzNRd2dxVGdXWmNR?=
 =?utf-8?B?NG1SM1VGUVZYNzZEN3hWS0FiS25jUG43bytlNlB2enhuc2JqTXcvQUdnVHo4?=
 =?utf-8?B?a1QvbHNST0F5RmlMRUZ4Ni9OYVF2VEFHY3ptRHRBcW9GbEhOUVhpQ2JBWlk1?=
 =?utf-8?B?d1FtNk5NUGVEbkxQc3IzeHNpTmtZelZUcHhMbHpRTTA3TWtlYnJ1N1BTbWJk?=
 =?utf-8?B?bHFzR3ptbHRBL3VML3RxZjJsMHJxbFE4YkI5MkpYNENiV0djSC9tUDM1NEp5?=
 =?utf-8?B?MXkwM1VscncrZm9Od01QQmpIQno1OXNia3JGdTd5d1NvbWNkWHdTNXN4VERw?=
 =?utf-8?B?bklYTDdmYlV5TU9UdU1OYmZEOUpXUXdMN1ZIdjhUQ0tjTXBjZW9aODVOS2pC?=
 =?utf-8?B?d3BCbjFLUUpmWXVHRm5nemVBQ2JucC9CdTVyOStEMi9EcGx0ZFJhQkhNNWUv?=
 =?utf-8?B?R2xNOENmY0ZBNzhpbDZyWFFKWlcyYXA1NS9ISkZvSzZxaUdSeGhtQWFFUW1C?=
 =?utf-8?B?UFFHU3o4RnBiUlhycnRoWEhEWmRkMjloNm4zTDY0ZUV6b053Z2xUWU9BTEVv?=
 =?utf-8?B?VktpTk9URjVuNmJBcnBiZm53UU9PWDhuTWNKcUZtQ0QvZmpGVS9uNU5HWC9C?=
 =?utf-8?B?VDBqNTJxcTFMTXhZUWU0QmF3T2N6cldhbmhNT1R5cUtyUlZBNjg3VkMxTlcz?=
 =?utf-8?B?R1dRa1ZScEtDSnhzeW4zbDAwYWozVTVadE9xL1hBdUN2U0w2dDYyd0xzYzA2?=
 =?utf-8?B?NW5pNTN6cTF6Q21XZmUzUm51b29qaXpxTGQreGExUVBNa2ZKMTAwWlhoaHFi?=
 =?utf-8?B?YlR3eCtRbnliOTk3cWwySDZyQnJzUzZZcjBpR001a3JEcVY3UGJqTlNRc05z?=
 =?utf-8?B?Y1JtZFpGMDZxOWlLOTB2QjMvUG81RVBGRzdteXBkSnZLejZHbHlNeWlaR2RT?=
 =?utf-8?B?aWg0ZEc0NWt6TnNoT0orTnRtYmtxWTczbjdaY3IyMi96Nzdad28yYUd5TW5t?=
 =?utf-8?B?M1hxdWNLRW1XM3RxcjRYazBRM2V1ZFRVUEJ5cVNFRnBreG5ZeHJNcEh6VEFX?=
 =?utf-8?B?WDhjeXFuNHdHTEZyZGlRN0ZIRUM3aHZkc3ZqVVpiUllLSk1obldPdkwzbmNW?=
 =?utf-8?B?SHZiaDNZZHhuaDF6Y1lvend1ajRXRCtFT1FlVHZodFdlZ2dCOEYrdEFXRmtk?=
 =?utf-8?B?VVJjdCswaTNPL1N3Q245Q01RRmJUeldPS0s1OTJhZXYwc2xZQmt2eWtEZXFh?=
 =?utf-8?B?dGZWenhTcVFQY3o1OEQxVnVRdW8xaFMzREs1N3p3WVoxTHdNcUFtL2NtSzZo?=
 =?utf-8?B?c01IWFQ5aEdicWFmSDRWeXA0SGtTNmlmb2YwbFREODlhRHBCa2FibmpJQlBh?=
 =?utf-8?B?YTZPaFFOY1FDTjRxTitkbTQ4UHBJUy9XVGdjMnRqUThOU0FiU082V1RBazFx?=
 =?utf-8?B?TFB3dnVER3QyOGtMdWcwS2FMdnd5ZWR4NTlvV3NCVlpXYjhhTTF6QkNNdEhJ?=
 =?utf-8?B?Q3hEVnlKZnBhTkpjbFpaZlBGS2UwTnNMczlOa0tZTVB2ajBkZnRDbm53YnJu?=
 =?utf-8?B?Y3J0ZStuemFmSGpzbE1JRWVzbXQrVlp2ck5qMlhvK3QxOGZzMUEwRnlwQXhm?=
 =?utf-8?B?ODgxdjlhV1RxdFdUbi81Qk1LeDJDb1dUS0pxbVJtNTJqaXZaR096dWcrSVph?=
 =?utf-8?B?UmQ5UVNlcWtlaGNsc2JyZTR1SFNOMHN4OGlOL0tkRnkycFZ4MmxrOWZvTmlR?=
 =?utf-8?B?ZUN0SG1VSzU3QndQWlp0TEZrMWtJTlZQcDdVUzI4SHB2TmFaakNYbGRtQTdW?=
 =?utf-8?B?eGVMZENiWUJGdzVmUjMyZkpJRDQxQmsyZnlvanplelk4YnhwQkRsMlFvQTg3?=
 =?utf-8?B?RmtmVjBpUXlxVnJuMjFaaWNXYTFON3JlZDF2WS92M2VwbEtDdldZVWthSkJa?=
 =?utf-8?B?RjlvRFU2dFRWbWNXSzl6Z01CakoyS3grOTAxanhLMm5uMDBTOW8zNlplRG9h?=
 =?utf-8?Q?CtC0M3Sj84IE/D43sgIfFbJoV80fnE14DfAfd6Bmu8=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(35042699022)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2mexvmoixG9uQDFyUgMNkXpYvKCmp7yX4QyO02T23is3JbTD8CGaPL2MwgG46RWH8f7xbs/GJRh7vVy3B+LZhcvg7mceK7lsmOFgQm75o+7fIXCO7hzoL9v0a4HjhEffsFhtJ7kEn5c8vjwE+4MmyBrhWnfw5J9GPhiBgPL4U/yn3im4ITll2DM0OGM6Hs2ugMhlQLQ3WRylAIAeRAro48jwP0BJSA6GE5Jj9CDHOoFLso9jAnxdI6HmxzPemBIHh9GZ6HyxLGryFJZgWxj8I/wQuOFzB+Z2V71ivI++4JnVlXVzyAg2VqN9OtfFr9txfaHqD/IbqGy85fw6bEMlhVJV4sNb6ddfDooITt5exxoQPsA9MnIULan47UX0IyZb5zIWi+qBGqqvXbqkuTNNWGnAOCv/80z1KRvaEm2SCud7oIwX00cTUcFfVY+e8BOl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:20:05.5262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec40e5a-4c15-4ee8-6a61-08de6ae11340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6378
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:Harry.Ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Wei.Chen@arm.com,m:Hari.Limaye@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:url,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 153FA13464B
X-Rspamd-Action: no action

SGkgQXlhbiwNCg0KPj4gICAgdm9pZCBfX2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkNCj4+
ICB7DQo+PiAtICAgIEJVR19PTigidW5pbXBsZW1lbnRlZCIpOw0KPj4gKyAgICB1aW50NjRfdCB2
dGNyX2VsMiA9IFJFQURfU1lTUkVHKFZUQ1JfRUwyKSwNCj4gDQo+IEkgdGhpbmsgdGhpcyByZWdp
c3RlciBpcyByZWRlZmluZWQgZm9yIFI4MiAuIFNlZQ0KPiANCj4gaHR0cHM6Ly9kZXZlbG9wZXIu
YXJtLmNvbS9kb2N1bWVudGF0aW9uLzEwMjY3MC8wMzAxL0FBcmNoNjQtcmVnaXN0ZXJzL0FBcmNo
NjQtcmVnaXN0ZXItZGVzY3JpcHRpb25zL0FBcmNoNjQtR2VuZXJpYy1TeXN0ZW0tY29udHJvbC1y
ZWdpc3Rlci1kZXNjcmlwdGlvbi9WVENSLUVMMi0tVmlydHVhbGl6YXRpb24tVHJhbnNsYXRpb24t
Q29udHJvbC1SZWdpc3Rlcj9sYW5nPWVuIC4gU28NCj4gDQo+PiAgdnN0Y3JfZWwyID0gUkVBRF9T
WVNSRUcoVlNUQ1JfRUwyKTsNCj4+ICsNCj4+ICsgICAgLyogUEEgc2l6ZSAqLw0KPj4gKyAgICBj
b25zdCB1bnNpZ25lZCBpbnQgcGFfcmFuZ2VfaW5mb1tdID0gezMyLCAzNiwgNDAsIDQyLCA0NCwg
NDgsIDUyLCAwLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIEludmFsaWQgKi99Ow0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBSZXN0cmljdCAi
cDJtX2lwYV9iaXRzIiBpZiBuZWVkZWQuIEFzIFAyTSB0YWJsZSBpcyBhbHdheXMgY29uZmlndXJl
ZA0KPj4gKyAgICAgKiB3aXRoIElQQSBiaXRzID09IFBBIGJpdHMsIGNvbXBhcmUgYWdhaW5zdCAi
cGFiaXRzIi4NCj4+ICsgICAgICovDQo+PiArICAgIGlmICggcGFfcmFuZ2VfaW5mb1tzeXN0ZW1f
Y3B1aW5mby5tbTY0LnBhX3JhbmdlXSA8IHAybV9pcGFfYml0cyApDQo+PiArICAgICAgICBwMm1f
aXBhX2JpdHMgPSBwYV9yYW5nZV9pbmZvW3N5c3RlbV9jcHVpbmZvLm1tNjQucGFfcmFuZ2VdOw0K
Pj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBDbGVhciBWVENSX0VMMi5OU0EgYml0IHRvIGNv
bmZpZ3VyZSBub24tc2VjdXJlIHN0YWdlIDIgdHJhbnNsYXRpb24gb3V0cHV0DQo+PiArICAgICAq
IGFkZHJlc3Mgc3BhY2UgdG8gYWNjZXNzIHRoZSBTZWN1cmUgUEEgc3BhY2UgYXMgQXJtdjhyIG9u
bHkgaW1wbGVtZW50cw0KPj4gKyAgICAgKiBzZWN1cmUgc3RhdGUuDQo+PiArICAgICAqLw0KPj4g
KyAgICB2dGNyX2VsMiAmPSB+VlRDUl9OU0E7DQo+IA0KPiBCdXQgdGhlIFRSTSBzYXlzIHRoaXMN
Cj4gDQo+IFRoaXMgYml0IGJlaGF2ZXMgYXMgMSBmb3IgYWxsIHB1cnBvc2VzIG90aGVyIHRoYW4g
cmVhZGluZyBiYWNrIHRoZSB2YWx1ZSBvZiB0aGUgYml0IHdoZW4gdGhlIHZhbHVlIG9mIEFBcmNo
NjQtVlNUQ1JfRUwyLlNBIGlzIDEuDQo+IA0KPiBTbyBzaG91bGRuJ3Qgd2Uga2VlcCBpdCBhcyAx
Lg0KPiANCg0KVGhlIHdheSBJ4oCZbSByZWFkaW5nIHRoZSBhcm12OC1yIGFhcmNoNjQgcmVmZXJl
bmNlIG1hbnVhbCBbMV0gaXMgdGhhdCBpZiB3ZSBzZXQNClZTVENSX0VMMi5TQSB0byAwLCB3ZSBu
ZWVkIHRvIGNsZWFyIGFsc28gdGhpcyBvbmUuDQoNCg0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAg
ICAgKiBUaGUgTVNBIGFuZCBNU0FfZnJhYyBmaWVsZHMgaW4gdGhlIElEX0FBNjRNTUZSMF9FTDEg
cmVnaXN0ZXIgaWRlbnRpZnkgdGhlDQo+PiArICAgICAqIG1lbW9yeSBzeXN0ZW0gY29uZmlndXJh
dGlvbnMgc3VwcG9ydGVkLiBJbiBBcm12OC1SIEFBcmNoNjQsIHRoZQ0KPj4gKyAgICAgKiBvbmx5
IHBlcm1pdHRlZCB2YWx1ZSBmb3IgSURfQUE2NE1NRlIwX0VMMS5NU0EgaXMgMGIxMTExLg0KPj4g
KyAgICAgKi8NCj4+ICsgICAgaWYgKCBzeXN0ZW1fY3B1aW5mby5tbTY0Lm1zYSAhPSBNTTY0X01T
QV9QTVNBX1NVUFBPUlQgKQ0KPj4gKyAgICAgICAgZ290byBmYXVsdDsNCj4+ICsNCj4+ICsgICAg
LyogUGVybWl0dGVkIHZhbHVlcyBmb3IgSURfQUE2NE1NRlIwX0VMMS5NU0FfZnJhYyBhcmUgMGIw
MDAxIGFuZCAwYjAwMTAuICovDQo+PiArICAgIGlmICggc3lzdGVtX2NwdWluZm8ubW02NC5tc2Ff
ZnJhYyA9PSBNTTY0X01TQV9GUkFDX05PTkVfU1VQUE9SVCApDQo+PiArICAgICAgICBnb3RvIGZh
dWx0Ow0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBjcHVpbmZvIHNhbml0aXphdGlvbiBt
YWtlcyBzdXJlIHdlIHN1cHBvcnQgMTZiaXRzIFZNSUQgb25seSBpZiBhbGwgY29yZXMNCj4+ICsg
ICAgICogYXJlIHN1cHBvcnRpbmcgaXQuDQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAoIHN5c3Rl
bV9jcHVpbmZvLm1tNjQudm1pZF9iaXRzID09IE1NNjRfVk1JRF8xNl9CSVRTX1NVUFBPUlQgKQ0K
Pj4gKyAgICAgICAgbWF4X3ZtaWQgPSBNQVhfVk1JRF8xNl9CSVQ7DQo+PiArDQo+PiArICAgIC8q
IFNldCB0aGUgVlMgYml0IG9ubHkgaWYgMTYgYml0IFZNSUQgaXMgc3VwcG9ydGVkLiAqLw0KPj4g
KyAgICBpZiAoIG1heF92bWlkID09IE1BWF9WTUlEXzE2X0JJVCApDQo+PiArICAgICAgICB2dGNy
X2VsMiB8PSBWVENSX1ZTOw0KPiB0aGlzIGZpZWxkIGRvZXMgbm90IGV4aXN0Lg0KDQp5ZXMgdGhp
cyBleGlzdHMgaW4gYXJtdjgtciBhYXJjaDY0IFsxXQ0KDQo+PiANCj4+ICsvKiBOb3QgdXNlZCBv
biBNUFUgc3lzdGVtICovDQo+PiAgc3RhdGljIGlubGluZSB2b2lkIHAybV9jbGVhcl9yb290X3Bh
Z2VzKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pIHt9DQo+PiAgICBzdGF0aWMgaW5saW5lIHZvaWQg
cDJtX3RsYl9mbHVzaF9zeW5jKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pIHt9DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3AybS5oDQo+PiBpbmRleCAwMTBjZThjOWViLi5lZDFiNmRkNDBmIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vcDJtLmgNCj4+IEBAIC00OCw4ICs0OCwxMyBAQCBzdHJ1Y3QgcDJtX2Rv
bWFpbiB7DQo+PiAgICAgIC8qIEN1cnJlbnQgVk1JRCBpbiB1c2UgKi8NCj4+ICAgICAgdWludDE2
X3Qgdm1pZDsNCj4+ICArI2lmZGVmIENPTkZJR19NTVUNCj4+ICAgICAgLyogQ3VycmVudCBUcmFu
c2xhdGlvbiBUYWJsZSBCYXNlIFJlZ2lzdGVyIGZvciB0aGUgcDJtICovDQo+PiAgICAgIHVpbnQ2
NF90IHZ0dGJyOw0KPj4gKyNlbHNlDQo+PiArICAgIC8qIEN1cnJlbnQgVmlydHVhbGl6YXRpb24g
U3lzdGVtIENvbnRyb2wgUmVnaXN0ZXIgZm9yIHRoZSBwMm0gKi8NCj4+ICsgICAgcmVnaXN0ZXJf
dCB2c2N0bHI7DQo+IFRoaXMgZXhpc3Qgb25seSBmb3IgQXJtNjQgTVBVLiBTaG91bGQgd2UgZW5j
bG9zZSB0aGlzIGluIEFSTV82NCAgPw0KDQpJIGNhbiBzZWUgaXQgZXhpc3RzIGluIGFybXY4LXIg
YWFyY2gzMiBbMl0uDQoNCkNoZWVycywNCkx1Y2ENCg0KWzFdIGh0dHBzOi8vZGV2ZWxvcGVyLmFy
bS5jb20vZG9jdW1lbnRhdGlvbi9kZGkwNjI4L2xhdGVzdA0KWzJdIGh0dHBzOi8vZGV2ZWxvcGVy
LmFybS5jb20vZG9jdW1lbnRhdGlvbi9kZGkwNTY4L2xhdGVzdC8NCg0KDQo=

