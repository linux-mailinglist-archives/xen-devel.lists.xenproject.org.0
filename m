Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B3ADCAAB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 14:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018203.1395118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRVAD-0001Fu-4T; Tue, 17 Jun 2025 12:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018203.1395118; Tue, 17 Jun 2025 12:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRVAD-0001Dd-1I; Tue, 17 Jun 2025 12:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1018203;
 Tue, 17 Jun 2025 12:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5XJT=ZA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uRVAB-0001DX-SH
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 12:11:40 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35cb093f-4b74-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 14:11:34 +0200 (CEST)
Received: from AS4P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::18)
 by DB5PR08MB10287.eurprd08.prod.outlook.com (2603:10a6:10:4a5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 12:11:31 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::5) by AS4P190CA0014.outlook.office365.com
 (2603:10a6:20b:5de::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Tue,
 17 Jun 2025 12:11:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 12:11:29 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB4PR08MB8101.eurprd08.prod.outlook.com (2603:10a6:10:387::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.27; Tue, 17 Jun 2025 12:10:55 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 12:10:55 +0000
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
X-Inumbo-ID: 35cb093f-4b74-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P2vQ55CcVn4k0FOC3YGQs9DAKXwxx26QCJ4UNa+E2YNi/hyjGlkLyOjPwrNv/dOObhvzjgQOJe7yHKoxmviBaf0KLPo0DkPaJsrOxZEEcE2nUvl1EmeIlmSJ0dySgayEvaHMyjezlvBwS9WGS46ieEH8YA5LsI5AbkrFuZHgqlqBPIlngLfNgE4xD22FBZktla2uI0pq/+mgVd/UA1srlSeCEA2uhMbD6Wn8teDcELbWRNHZKF7t6wpVGK5UqJ+NqPPaKGfeWQtulcul3GjLlIExgr8pICoUXsDh8WIZEh4u3ZGj6qfWq89IRDmnHXE7UQoU0fHkAXBkyv5JtzGX+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olLLjdyqXVGiqCNTPf9sFi0kcBRSa5KdI4XNMGPFlgo=;
 b=eIWEtG77b51slEJ4YBQ9ee4cEVH4xJgrKWv1+F9yvbUKGxVb4AwO0JlN795ZGQ70eJinFLvempCZGudh5JUyU8b7EQ1X/a0ovuIMYV681QhhiviUhh/FMuLg3CzSR4PH+vw8vIj+D3CYCuWO0mfZoQstZm3+6YpNvD2RZvJZPtsp3r3diCk3GcuETS6jNCEFZUADBIU/UgXViN3BCeLTYNfPnA8OuHOh/5AMyC1rpqUF1d6c/tcndx85USn2Qza9u6bLtfZ2TrvVmnHPt/FfBNpXAU0dGuvxCbMVCIlQbB5J5qG9wgl76kKFF5QcrBlIOMqBbgCC1HKEsJ0+TAHJnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olLLjdyqXVGiqCNTPf9sFi0kcBRSa5KdI4XNMGPFlgo=;
 b=CNW5w16gfUIxDih7hi1Bkx1mrIBHBpEy6Ylc/dhwMwx0Ra02qu1shMlc9t7yOJqED19oPdTRRgVxDcNNW90ISRxyxRx3A5o5TjFSNn80jGu8HvkG/lZAOcOMhKT0Vus/bTLbCukAV9RYuRdQkkXpY1qcZU732sRtWwYt4EKaXjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dc+1ubszXks+zfdK5Na/n4XyQDTwVK7IaSqFELuCwdcYlKvc0zttY8GaDKpGDdeH5zHhu/+AkeS/7gMGyrJsZTG3Apv1GCn81QM8MCU8EEC7zeNTSYXjwNC92Vqs0y7hVmdZ7zsGi4wQHF7GfhdnJAsSZt0UROx/xZPg/omVLh2o1HJgZCeUWa3P2ykKeWM+FfjAd7YWATr+W7eu7ymMXPI1uokTIh0Cxqek1nkoM51CWMgeBAP9TSYDEN7rttXK9d1Tr61N4AChlTdbc8ojZ665E4/d51cNpj1QZUvmcADad/K6EeD98iU5U6KM/2YsQSVk6KkUxfqMQWudqd2Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olLLjdyqXVGiqCNTPf9sFi0kcBRSa5KdI4XNMGPFlgo=;
 b=Ta6lUy9Da2/kur1lxsA+TeQF2+31umt3YTqar5Wjgh0KcVMOh6NmKFRLXwihA1etf8jt1jYlYnHKT++RuOc2iNTKoe03/130QiGywSU105ZDDnLJNj9lugJBWwNOYjHUMhuSVk69pYNaK8hBT1cXKyA86G1zabMI4aVZO/n5HbE22nQWnbX/RIbfzNtlEX4yPGhaT7wHxyXL72gKlEWPf6XwFRfSAH7lbfNy8uv00UMryutUKhEMBYMuGdQtzsn9MqQc8eDZnKeca/W7wMrhePLB8AvFJc0bG4yA2dQrWMPivaDylHV1KWFgpsAPuAcD7BXO1RYIHXrqSFduf6sP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olLLjdyqXVGiqCNTPf9sFi0kcBRSa5KdI4XNMGPFlgo=;
 b=CNW5w16gfUIxDih7hi1Bkx1mrIBHBpEy6Ylc/dhwMwx0Ra02qu1shMlc9t7yOJqED19oPdTRRgVxDcNNW90ISRxyxRx3A5o5TjFSNn80jGu8HvkG/lZAOcOMhKT0Vus/bTLbCukAV9RYuRdQkkXpY1qcZU732sRtWwYt4EKaXjw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Hari Limaye
	<Hari.Limaye@arm.com>
Subject: Re: [PATCH v4 3/3] arm/mpu: Enable read/write to protection regions
 for arm32
Thread-Topic: [PATCH v4 3/3] arm/mpu: Enable read/write to protection regions
 for arm32
Thread-Index: AQHb33jUYqpTUMJwa0i5eroPaBJrrLQHQquA
Date: Tue, 17 Jun 2025 12:10:55 +0000
Message-ID: <918086D9-A60F-4A07-A898-DF9AD3610191@arm.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
 <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB4PR08MB8101:EE_|AMS0EPF00000196:EE_|DB5PR08MB10287:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9b5b63-f655-4393-e2a7-08ddad9817ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Si9TdHNnR1huTmZnMXNDakd3MStNcUtYSldYeStYR2hmUjJBV3hHV0ErZXFU?=
 =?utf-8?B?OC9XS3JjNU9IUUtqaG9vdGhyaHJJNFZmTExJbHljQVdjd3laQWQwTDZSTkJu?=
 =?utf-8?B?bEJrTUlMSFhaMmVDbXBkQW1PRVpCa0ZQL1QyeGp0MjhqUTV2ZUozK2FMWEVk?=
 =?utf-8?B?VGRLUTFWR0o3U2xEZUpFSzJEdFRWUnNITzVvbGcyWjAzbWJTeFgyeFRMV2h5?=
 =?utf-8?B?RTJoZVY4KytUWk1pTmhpNmZxVi92MFNON1ZiSnFNOHVqSGFDblVnSk82MkJ2?=
 =?utf-8?B?WnUxRVNwbG85MjREYkV4bEIycTlFUnpZZWNIWkZ3MUR5QjlyeTBWdDdzSTgx?=
 =?utf-8?B?dkJoSHlWUjJWUEI0cVJMMlM4V3ZTYS92N1VkSnR2aDlaa3BzbVhCU1ZMVGNj?=
 =?utf-8?B?LzdKS0J1WE9aNTFwV1FqblVOZ0QydVhkeUpmRDFRWk9FZGdkOEVLb1NweTF1?=
 =?utf-8?B?N1k0SitKUCtnalMrN3Bselh1STl1b09lZmJnRnU2cXB0N1QrNW1lcjBWbmdK?=
 =?utf-8?B?bm9pU0xVVUo3ZDU4azhaUzBqL1lOaHhsaVo4TkFOejRSWUpvSlNEN29qTFZz?=
 =?utf-8?B?eFgwbjJLdTd3bngwclJjVFFWQ29hdnFET0RPMytpR28rUHgrOXhYeFRIUnBB?=
 =?utf-8?B?Nm5DcGNsNHl4NHJlejh3SStvSHpxNG1pOHgzN004ZzZPbWdQcWxWR2x6OGlH?=
 =?utf-8?B?WmhleFhtQkd2VkRyMXhtSW51ZHlKczhQcmNuS2JpT2tzaEpKRXVmcTllSFNp?=
 =?utf-8?B?QXVxRVlnbVVHVlYrdUZaeDZWb0tucVc4Rzd4SXA1Um92TmxVSUNESkl4cHlr?=
 =?utf-8?B?RVRnQnk1Y0xtWnJFT0VVOHBkRXlDZy94S1pWVWhFTEc2SVdpV2U4NXpaUDZB?=
 =?utf-8?B?U0srRUQ1aUR2L2lsbHNpSnM4cndNT3Z1S3VWcjJ1MnZWcjVtdDNvNm5aaFBM?=
 =?utf-8?B?YmlybDI4RmZWT213c2JwOEQ5TTdnUGN2QXo5RERLYlhJMnhVc0dJdi9wbVgy?=
 =?utf-8?B?RnNINmp1UHBVU3hyRG80KzZER3MxZTFRQWYrTVhhSTR3MGE1MlR2VHZyVTgv?=
 =?utf-8?B?REJ1eW5ycWZZaXFZbDlhcjFUM2RmTnM3TC9VaXBhTy8xR2pEVHp1cWhXZ2ZD?=
 =?utf-8?B?a0ptK05IZjVSUks2NlFvaC9PU0MyK3VFVjYybkhESEhjV21BQm1NUFpTejUy?=
 =?utf-8?B?d2JNcXFIV1hjNDFQaEJmNHYwaTRvUG0wSFpzdUNWZzBINTNEMVRJVFoxQkFF?=
 =?utf-8?B?MGhWTDlnekorOXAwUUg3cVEvM0U4eWFCRDhSdkFUdEtWVWw0TS9DV0xDRmZ5?=
 =?utf-8?B?NEVlODJyMStsY1Q4Z25jbThKcEQrMXYvT2R4dkRpZmtpeER5UW4xU0JNcnNT?=
 =?utf-8?B?OUNnZWhTdS9zUTJ2dDVRL2gvRDVxRithWEZiRGVNMmVZQ3U2azRKL1JCM0Zy?=
 =?utf-8?B?ZUdxNGFkNi9hWHA5eFM2Zm02VFZBT1dCWXVjVjNLY0ZGUStRdGQzamVrK1Vm?=
 =?utf-8?B?RytIcHdodks3bnhhNVh0aG5BQ092QVpzOG90VHBKRU9SaG03MCs0MjBFMnR3?=
 =?utf-8?B?NjhKbGhaM2ZtbkFEMFpNODdGZktqV2J4K2JXajVST0p5ektBR0VmdTg4Qnpr?=
 =?utf-8?B?RVVRdXQzTDQyQWtYU0Yrc3NiOFk0d01Nc2w0MzAwUWNDRnVLbFc2b3gvaGMy?=
 =?utf-8?B?a1NjUTZFMExMdEVtby9BNW10QUJlWk8vcWJqYzRiYzBmMzhKVTdac0pJN2c0?=
 =?utf-8?B?Y2VnVU1yMU5vSzFkeEpJSnZlSU9YdTl4SE91RXovL0YyR2dQVytEM3NzRVZv?=
 =?utf-8?B?M0dxU1E3OVJJdTlFekFjdDUxWlE4MVVxbmtDRFowZXhPL2VKbjZuYkUzMWhq?=
 =?utf-8?B?RW5WUnFDQ3BoV1Y0dWlCMktTR3VlZXd6ZUlWdE5IWXRTSWkvOVZNS0xpQi9G?=
 =?utf-8?B?akhxc3gzbkdQL2htbXN1OHN4blQwMFN3dzVjd1lkMFFrc1NRcWdtSTVEMnE3?=
 =?utf-8?B?aFU0VVFwVWlRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE368CA711B7ED489362100349CB93A0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8101
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6bbf9e0-426c-4635-7c9b-08ddad980322
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|376014|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC96VlUwR0ErMll6bmdmL29vK1ZSbC94MU5oOFZQai9wbzNjRlV0ZER0UWRY?=
 =?utf-8?B?WjFhUXdoWmREZnVOc0loaU45Snkxams3eDl5SFIxMCt2M1AzQ2lRS0U2NUhY?=
 =?utf-8?B?WEo3U1Z6TGV3c2wyUEZIWVFUbHpJVURxTUVTaWFiUjZwN2dqWVB5VmRvaWRK?=
 =?utf-8?B?dzBuOWY0ejVPbGEwTjB2eWlLMzgyWjNCTWJDRFBDQ2lhd2J1dnhHMzh0S1ZW?=
 =?utf-8?B?U2hRY0xDVEQrT25uRFlyMkh3cnNFdURzSXhwRTh5QnZGbVBDc3cvK0c1dGlJ?=
 =?utf-8?B?Z2htVGtHTXROWHVSbGRpM3NBT0d2VHV6SGdEUGdnUC94ampnMXdIQ0dkRk82?=
 =?utf-8?B?bVdCUG5aVGUwK3F5d2VORW01QmVBNWt6REQ5RlhWSUswbGhRM0kxU0JmWmd1?=
 =?utf-8?B?blBJQWVFdnNYcVM4Y3lMZkhJbWh6bTVaUnJyamJTMWQwUFYybDRHMXJCK1ZN?=
 =?utf-8?B?WVJtMVJsckJSU3BkWXlKUFNuWTlsVytsNENsdzZnM1ZlN3NNU3RpTFRqS2tY?=
 =?utf-8?B?RU8xNWlCaFpvcE9VczVxNStvcXhiQis3WUNyK3hlNjE5cThQY210WUp5K2hX?=
 =?utf-8?B?S0hzTnNESEt0c1U0YmJydUF3b3NMRkVzL2h2N28rdDN0WHV3S25vaTd0Q3VZ?=
 =?utf-8?B?SEl4c3JIS1doa0VZa3VidGdiMWFyR1hzc0lBZDgyOWE3WjZFaG45Unl2a2pY?=
 =?utf-8?B?WDhPT0NRNjlNVzFrcWZONjVLR2xxTkZTUHRXTTJ2MXFZUisxUnZNaTA2NEFR?=
 =?utf-8?B?MXljQTNQdE5SZ0VodWZ5eVhCY0FoZTcrRG5HOHNjWmNmaGlMeTVoaWdRZmVC?=
 =?utf-8?B?U3VBTzY2b2VsS2RDYVVub1ZNN2hqbzFjSmNqeWVkQkFKTVNiaDJPc05IYTNM?=
 =?utf-8?B?bzhsMFU5S0VLR01TaklQbkxpcjdkUEpEVDVpNTE4QjZ3ZlNrQ0JwY0QrS2Z1?=
 =?utf-8?B?cnhRdmpEMXZRL3lGK2xDRCs3bHlkZGx6b0JpWG5yVGg4N045WU5WMnVFanNq?=
 =?utf-8?B?cndQc2lqTkpOK1pJZnJyKzB0aHgxOWlPc05WcXdGNHNRRXdveG95M0tVLzdW?=
 =?utf-8?B?RXNUREtGeEZTOWVMWDUrMTFHT0tWdyt0emI0VTJIRWE2dVhmaFRJOGl0ekho?=
 =?utf-8?B?dkxJbkNqc1BUR25mQm8xL1FoRnFISTczSS9DTHEydDQzb1ltRllUWTZCbGtt?=
 =?utf-8?B?RDllWS9Xb1NRWlEvSXRPVCtzS3N0eWVDSVV0TWRsWmkzU0R4VDJQb3hWWDJt?=
 =?utf-8?B?VDlldlMwMjh2LzVGU3FFeTg2elZlcWN0R2VTeXh4czUrenh2c2xUd0RsMHhs?=
 =?utf-8?B?T2pQL0RFUWhyYmlrMXRjdEZ3WDFjNjdKTjEzTnVDWE1JYWdtaTIrT2VpK1lm?=
 =?utf-8?B?SjV4bWRqNEtEWjFoVUUySVlTdGFXcnBxRytmUlpwUU1MTTBFSXU2NEd6a2lL?=
 =?utf-8?B?b1BxVGlyU2crbWQ1Y3FVcmdQelBQcGZFMEFzZTJ5RHBRbUdGOVE1RzQ3R3JE?=
 =?utf-8?B?RldBeHc3T3ZpQlJ1Z2RJMUxKQ0ZWN2w3dER6UURBcWhWZndXa0xkbGcvajJL?=
 =?utf-8?B?cmFCa2lmUHhMWjZiaGZwQ0krVHowNXY1NkNsNGY2aStUdFVzdGVMNy9nTjg0?=
 =?utf-8?B?ZkZON0JZZXBXL1VmVm9KcmNjcmZTQ2E4MEpEc2xwQXNPdjBVcElMK3hYakxS?=
 =?utf-8?B?YVU1ckh3YXVKNUhDZGhxVGFCeWpQbHhLWjRxMEkyMEFmYk1RMTIwbzRRcUJa?=
 =?utf-8?B?bE5tdTBCUzhpT2tKU0paS0RYQndUeDlIK2JPL3JKZXJDbTFlVHBXQktsYkQ0?=
 =?utf-8?B?MWJYclk2dlpxczQ0eUloYW53RVlTaHM4VXFzVm12K3RoTm5YeUZHRmlqbS8w?=
 =?utf-8?B?RzU4S1I5M3o2emthYkl0VkkrZlU3MVZseHZQWnFSa000Ykw5c2dnbUdiQlVt?=
 =?utf-8?B?OVhZOEdyekd0ODlOYUR6K0ZpOFNJdGhURFNrajF3V0o5OUN1bmNVVU1UOVEy?=
 =?utf-8?B?SjJ1TGFMclFXc0k2elJVdkpRK002cHBKY2ozYzFaYXBYSkppWVRYWEF4N09Q?=
 =?utf-8?Q?Gvtlox?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(376014)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:11:29.9288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9b5b63-f655-4393-e2a7-08ddad9817ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10287

SGkgQXlhbiwNCg0KPiBPbiAxNyBKdW4gMjAyNSwgYXQgMTI6MTIsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IERlZmluZSBwcmVwYXJl
X3NlbGVjdG9yKCksIHJlYWRfcHJvdGVjdGlvbl9yZWdpb24oKSBhbmQNCj4gd3JpdGVfcHJvdGVj
dGlvbl9yZWdpb24oKSBmb3IgYXJtMzIuIEFsc28sIGRlZmluZQ0KPiBHRU5FUkFURV97UkVBRC9X
UklURX1fUFJfUkVHX09USEVSUyB0byBhY2Nlc3MgTVBVIHJlZ2lvbnMgZnJvbSAzMiB0byAyNTQu
DQo+IA0KPiBFbmFibGUgcHJfe2dldC9zZXR9X3tiYXNlL2xpbWl0fSgpLCByZWdpb25faXNfdmFs
aWQoKSBmb3IgYXJtMzIuDQo+IEVuYWJsZSBwcl9vZl9hZGRyKCkgZm9yIGFybTMyLg0KPiANCj4g
VGhlIG1heGltdW0gbnVtYmVyIG9mIHJlZ2lvbnMgc3VwcG9ydGVkIGlzIDI1NSAod2hpY2ggY29y
cmVzcG9uZHMgdG8gdGhlDQo+IG1heGltdW0gdmFsdWUgaW4gSE1QVUlSKS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPg0K
PiDigJQNClRoaXMgbG9va3MgZ29vZCB0byBtZSENCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2Vs
bHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

