Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0BC6D442
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 08:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165628.1492330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLd5F-0001lb-9e; Wed, 19 Nov 2025 07:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165628.1492330; Wed, 19 Nov 2025 07:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLd5F-0001iw-62; Wed, 19 Nov 2025 07:58:33 +0000
Received: by outflank-mailman (input) for mailman id 1165628;
 Wed, 19 Nov 2025 07:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtRO=53=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vLd5E-0001iq-5L
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 07:58:32 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8931a227-c51d-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 08:58:29 +0100 (CET)
Received: from DU2PR04CA0156.eurprd04.prod.outlook.com (2603:10a6:10:2b0::11)
 by AS8PR08MB5989.eurprd08.prod.outlook.com (2603:10a6:20b:297::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Wed, 19 Nov
 2025 07:58:26 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::16) by DU2PR04CA0156.outlook.office365.com
 (2603:10a6:10:2b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 07:58:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Wed, 19 Nov 2025 07:58:25 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DBBPR08MB10508.eurprd08.prod.outlook.com (2603:10a6:10:53c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:57:52 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:57:52 +0000
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
X-Inumbo-ID: 8931a227-c51d-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wpDvLZOSLsP2hCkPtvFw4HuF26Asz6pEPNCy1UpYnG5Ee0RbA2ZbCVaVM85KS1owHE+SQ+tgV/KPzABwAzXUfhehj3BTXxTOwqBUfvAMlfASlRrb1QaWQuL1+bl9Zwcf97UdFbyYssjxonhuCtSE+/HdOShlYhBhhWfZmqafBuBsnP2OYRHx4gFstAm9+A6C13M/jTLzzzyki1Q9RkImT4A889tCs5g9E08dkgKk8VPj6NsLCHLubq25Rz3Dy/vYYRQ7tAakI077fim9DBp+gS01+eSS5viug9OxIMQ5elCoDUHi5kmsqlW0ZLv8mSWl3WgRbRGEezM/MlAPeppsBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF+r6PUhu1ZO3ZLsX3xu4uAvR/+8l+dWM47DUPqgtIA=;
 b=ZCtVgS/6FrVZJ97lRSwMZrPkQCI109rX9L96vKwI2/qdMYDk7Q+UcQNVqZQ2t776KxtmSCzjaI/RNUqXz4Up737vRX1ZOXX4ivNhGwXn+puGDx494GIjE9CeIK7nzxElZ0qQkIH2yIyy39aJrqWEe/39dik4as+924iL53tppgzqfckw1P9vgAP7bMFVIl8R0kH1pX4aNEkhjnFeS1LsxRk3rSGuokdR1dkKYhbCwY73/CBP/9XHfEZ+LVZ1A+NERv7ztyj89j3L3Re6x6oFC3tyUhB/K3oltzwm2891nXTPbxCuIIb/S7wP7Z3I0AS5Te9fX/31KRj//RyxFjafuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF+r6PUhu1ZO3ZLsX3xu4uAvR/+8l+dWM47DUPqgtIA=;
 b=cJQrqNGa6uOP4jvl74s2qtGwNlraoHp6ha/l2slACxDvbwekOG/CG8QNv1zHvrl4a3YhX+AfeJHqREQE3Z7EUnQW4cnMfzf/43eu51IetCWkOxq85x3PGlxZw10AgdR4wUbGb+mWlpi5zYlIGwRCKHIb0y4BUfZOirQoqv3DgVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEbs09UBuaqn7U1Ev/uBlnvlZe96n5eweXkCLykImir41YfyeeaC+cEbbkkKoa4oqWkA9wFspOpzQNBRkxfa+yMhXDyL+fCeHJUe1WMfeL1tiwL9bUBQInIDYoxtYdpfD7QPE6mg3fVJZW2gNoiIq6JddiljdVaQz81j79x0lcGQuU17MGDjZMwdw1GwrlYMWZbFKYDVnDr2YJeJ5P+uDR7H7K2ZeHmihI6RfL7VXMXwQ08rWtwMvPGF/vEfblceAABoi3bwdbHRg6vUkg1qEouwCHb0T8KvYks1f/YKx4EIooK8Xs+ZshKqLiZB9IKBhf1WfV3fhv9U5RmwTrkzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF+r6PUhu1ZO3ZLsX3xu4uAvR/+8l+dWM47DUPqgtIA=;
 b=ncz+ATZP8cUP+RHX1pjHicPhvWsMzftOEM7mJttDCyLID+wCVJAXi9cXNeokHXDGkrJureMlDXC34uHoLyra0ySN3FAL7ZK5dZQLlzk0TZq+g7n0dQflCsy92OF56gG33WsVkbLfdVNN2duhs/DRe5mmZ26yxLc4RkGpVdYkp43Blj65CIV53r4HKCjsWcoio0a8faXSB2xSvYZgEgomg259IXfzBz2CCf5dXNoO7CxLx7hpx3yo1Mn1q/u7Tg8i/myvq8qheZIx6ImvFgsTZaDel2399CgqIp6pnq2sl4vmBltZaReviKdSTri3czi837e/BpToyfQhSZirbLT2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF+r6PUhu1ZO3ZLsX3xu4uAvR/+8l+dWM47DUPqgtIA=;
 b=cJQrqNGa6uOP4jvl74s2qtGwNlraoHp6ha/l2slACxDvbwekOG/CG8QNv1zHvrl4a3YhX+AfeJHqREQE3Z7EUnQW4cnMfzf/43eu51IetCWkOxq85x3PGlxZw10AgdR4wUbGb+mWlpi5zYlIGwRCKHIb0y4BUfZOirQoqv3DgVc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Harry Ramsey <Harry.Ramsey@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/3] arm/mpu: Implement ioremap_attr for MPU
Thread-Topic: [PATCH v3 3/3] arm/mpu: Implement ioremap_attr for MPU
Thread-Index: AQHcWSm12J9R4GyDBUGq1Kes7XNCkLT5ofCA
Date: Wed, 19 Nov 2025 07:57:52 +0000
Message-ID: <F8E5188A-6ACE-42B0-B579-737D89F898E4@arm.com>
References: <20251119075351.3926690-1-harry.ramsey@arm.com>
 <20251119075351.3926690-4-harry.ramsey@arm.com>
In-Reply-To: <20251119075351.3926690-4-harry.ramsey@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DBBPR08MB10508:EE_|DB5PEPF00014B8F:EE_|AS8PR08MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1dd2e6-339d-44c3-25a5-08de27416b44
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N2N1dHhJdXpxMjNnUXJaUEZkblZFWTB5cjVEUDhzbDZGVDI0YWVjRUsxbTB6?=
 =?utf-8?B?ZWgwVkJUajRYK1ZROHR3S1pOYm9tTFhkZG1Ob2dRc1V6VXR6R1A5ZDl3Y2RD?=
 =?utf-8?B?ZjhnOUN3RnNya1JlRjIrRHkzRjdXWXhMbEIxOEdhUFlmUGVKQ3VUNlMycEhF?=
 =?utf-8?B?NzdTenI0aUx4Ty91T3NRMTZLLzgzNUpRYkRMZFhReUhBQWVSS0FZejBuWWl3?=
 =?utf-8?B?cUYzSnpNTHo4YXYxMnNGR2hxUGJoeDNzUUo3NXZkODU2Y0FhdUVhVWE0bklu?=
 =?utf-8?B?MnJFOXRUL21QdVZCcXQvWjRKRFVtYkJacS9TUFBtWFlRck9uR241NzN5T0Fi?=
 =?utf-8?B?LzllaG5vdlE1NEQ5US9VTnovVVkwUCtFYk9wdFpEWVB2RDFGWVMxK1h5UVZG?=
 =?utf-8?B?QkFpaEtkZnhYK0Q2VkozMzl3NGdndnhyNWZDVCt0RmZLL0lUQ081UXBvMTRv?=
 =?utf-8?B?emdZc1Q2RmxUMngvaGttSjh1ZnFPM3MwOW1nOWlwOVVvVjkzcEpKRWhYY0Jp?=
 =?utf-8?B?L3FtRUVBOUNRSmsvQ01xZTYrQU9LN29HaVBxNU9kT04ySHZoMTlXZUpJTFA0?=
 =?utf-8?B?bm5hRnVGZUlIbmRyVi9Ya0p6UnUxQ1NobGVRa1Z2SDVzSlVpdGk4cEhWZld2?=
 =?utf-8?B?WDZMZkZOQXNTU0RBZ3IxUFJKMWUzRVltSzQvTUJiNSswcUtvWUxCdTNJNmx0?=
 =?utf-8?B?dTMxd3hseUU5cnpucFYvSkh0THNTSXRLdFJFZlpUVDA3Q0hUcDRtM1o3SEgz?=
 =?utf-8?B?K1ZQRWFZL25QWk9Wb1NkZXlVdGRiTVh4MEIwWll6SlRKSENKN0ZjQWFBSU9i?=
 =?utf-8?B?VnhqWTVHWjgvQlRRYjEvL0hJYkRnSEVQOW1ZUStTdUsxa1ZnTzFjbDlnQlpV?=
 =?utf-8?B?ay9vd3djaEtsb3VWMUh6azFnVlNXTDRQS2VucVN2R1BaeTZFdEJyWTcwcTFG?=
 =?utf-8?B?YlBUWFIrYVNWRXVQM1hDVVBRWi9ncGpoMXZWaXQrcXY0ZWVuRk00U0xwcFd3?=
 =?utf-8?B?dTdtanVwSzVOMmNQQVlyRUdQQTNPTFV6RUcrVDlMYnFycUxlWlkxbndheWdh?=
 =?utf-8?B?MVBGWWl1ZjkzaFJwV1BubWVGdWVIRzJsY3FKdVBtclVGdzJDZVE2MGxOS2Rx?=
 =?utf-8?B?Y1dSMEoydnlRQ015b2NRV2VuSXoraFNZVTV6KzdUOEF4aUMycmNmYWtVUFdW?=
 =?utf-8?B?amYvck1BSlZlR2VvRnZabXA5aVVuZkFPTXZnWWpXZnZVbWZSbm9QSEtPSXl4?=
 =?utf-8?B?N3RERTUrcDRlZ2V3VHFETk5URDJQcGZBcjZOU29yc1ZqK1F4bGIwQUR6QkR5?=
 =?utf-8?B?V3AyTW5ka1oyeXBQRHJjK1ZlaXlURXhuZUZQdkI5TDJpMDI2WjNQeklLbzRM?=
 =?utf-8?B?OGdRTFppSFM3Y3g3V1VRRTBZcFJCT25LOGdPbU1makQzQ0d5SGFhTTg0azIy?=
 =?utf-8?B?ZElLc3BxVnZaemtqVWYxWENodlZXTXVkUURiMzFiQ0h4S3c0Q0JUVWdBempq?=
 =?utf-8?B?UjAxTjRkZEs3WkozWTBwQkgyOUk0NnNLNXlEWHY0RWpqQUdBM0ZNRklrTnRS?=
 =?utf-8?B?QmpQQkphSFlVenBoV1B1MDByL0Z2akcwL2tMT3k3OEpLZjBuUVlyRFo1cjZl?=
 =?utf-8?B?aGR6L2ZrckdjaWkvTFQxeEhyT1BXb1RvZllXWDZCLzdaNTI2bStxZm5jNm5s?=
 =?utf-8?B?aUlGVHoyMTNOU1RIeTYyYm9sb2VIU1RFdExTSnFIL0JVUGx4bFBKVlkzcm1o?=
 =?utf-8?B?UnR6Y3V3bDM0ZFFjM1AvNzRHTkVXc2c2T3BBK3IwNkxJN0ZyY2pXdEo3QkJk?=
 =?utf-8?B?NGIxcjdPZ1hYZXRpaW1aVmdtcjJ5SHFYZktZanMvSmFvMm5iL3hPeXNIZHJ6?=
 =?utf-8?B?bWNUaUhaN3U2dHFCOFY3WFlFRmpZWTFoc1hISnQrSWZiNmQ2NzVWdGFRYTZH?=
 =?utf-8?B?Z3c0TDhBMnFvR29JOTJYcVdESGs0TjVnWTRyQ01IWEFNeXh1NzdiMkVEQU5M?=
 =?utf-8?B?Y09QRkROMUkrMFNEcDFtMUo1YlFYZVdsSjlEZTM2emliMUkzS2gyTW5vRllm?=
 =?utf-8?Q?4eEPQH?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <54D2F04C5A904E4E9AC9E4FBEE23CDA5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10508
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6618b684-7bea-4e43-9f5b-08de2741573e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGdYTzlSTGxHcVpia0pKMXl2M1N2ZEhEZzVya0J2K1g3b2FPVmI4K2lYcDI2?=
 =?utf-8?B?SWpIcWdvclBqa3BJL3QyUnROOGdKK2JzaE1LcVh2eEFoU1N5WklORjIrNGJq?=
 =?utf-8?B?R0VGc3hhcVBoUW51ZWFzL2J3UkxqbzRxTDVnSVJPKzFqbkFYSzE1aHdzY2FD?=
 =?utf-8?B?eFBiWlZ4bVZnYUJkSTg2TkdPOW1XUTZQU0NyVFh3R1BJQ2NVQjM0NzVHemJM?=
 =?utf-8?B?WFp1d0hsNFpsc0NwVVdMekxraSs1WTFyaVJBTVhiQWtGTDlkaFB5aTk4Q091?=
 =?utf-8?B?T0FDTmUycEl2MXVKbzdoeFd1NDFJOUk5RmtKcStDeC9NTzllN1U2aHRuNGNZ?=
 =?utf-8?B?eW5NRGlvcSt6OUFpWEczYTVaVFlIak9WOElrdUc4T09Xdmo1Q25iOVlZNDFY?=
 =?utf-8?B?d0tVUklqOU5SOGFwRTI5UlBLZlBOMWt1VTUvU2xBQ1JjQ3BGUm16VjFuVDFO?=
 =?utf-8?B?enpJNFMzckszSjI0OTVjV3BaZlUzeTkzUGcrYU1HcHJQT0dXRWlnN0RlYWo2?=
 =?utf-8?B?b0FHQmFqY2h6Qms3bkV4bS80SUZZQVZrYzRMTjVOVUh2WThFK3g4NzhCei96?=
 =?utf-8?B?cUIvV0JicmpTbGwvYXVUWk42Q0prZUk3Wjc2S0V0OXNHT0s0aWNLMU1TUmZN?=
 =?utf-8?B?ckc1azgyVkh1TWNxT3E4NXJLc3dFcWo3WEgvUTQrWU1lUFRwMXdPQ2d3UkUw?=
 =?utf-8?B?UVhUSVhMSWNCTjZUMmJQVVgvS2dKbDU0OXNhY1gzSGZMK1dyQmJqZTJSODg2?=
 =?utf-8?B?Y0xQK2FwTG9NT2Zqd0lSaWNqcTRkQWRvOGV3MFFhS2JRQiswclVnY0FJNHZM?=
 =?utf-8?B?VFJUcUx0c2FIZVNkMTJFdlNVWGw0RVRIb1k5UXpLTDRKSDBwQUpndDNCTk16?=
 =?utf-8?B?cFJYZ1Nqb3J4ZjNQSHRhY0piL042dEdheUZaaTBxMzJ5aXZYM3RxWUgvTnUx?=
 =?utf-8?B?OEltOGZjSEZXS2xJaUJwZUlxeFpvZ3FJRzdxWmc3M1JJNHZMRUFYRUpncEpx?=
 =?utf-8?B?WWZGeXlSTzA0WnVaN2JFRDJuLzAzakVqczNrTkdNbElpTmxkL0dIblhHWUJE?=
 =?utf-8?B?VVRxVE1wSjZRdkNxc1d4SWRibVRDbVJjYitTZm0yUFNVdjBqSm5sNklxOVk0?=
 =?utf-8?B?UzA3ZDliUWdWWm9BWncxd3dsN0FUM3BDamZjbERLMUlhSmgwTjQvQmliSmxI?=
 =?utf-8?B?VVVtNGxDV2p2VXgvNUpOZmxyUlJtaUNJM2JWKzhZa3dtaU80cXI5ZmUwVHF6?=
 =?utf-8?B?Q012Ujl1a0V2bzNucEh4UVdoSGxSYk1lV09JRkVlY3hVMVFLUnBFaEh0ay8x?=
 =?utf-8?B?NGcwbXZtc0xVc0NvS2ZSMjRoVG5FQkdLMHBQN0JYNkd2OXJjUUZwa3ExLytu?=
 =?utf-8?B?bm1BVVkxTTZ4WlhLSjdER3lydlVKNDN6ZHVhRGRJSFRRUm1ENUdWNnUrQTVP?=
 =?utf-8?B?UHRLVnB4blVqVi9PekFRUkFNU2phRlh4bW9Ka0JMN01JTXNKemdNeGloODM3?=
 =?utf-8?B?aUtnSk1jMTZ1cVhILzBnSWlwV3lCVG4zbkJYa1JGNzF4a2ZrV04ydm5COWt3?=
 =?utf-8?B?Tm44MkxQZDlQVHEzNVBlUGdHN0gxdTZxZ2gvUHFEQ0NvUnRBNXlVak1HdlB6?=
 =?utf-8?B?TnpqKzc3RGtIZTQyZjFEYmZDMXBiMXVrWTIzNmcwNE1INk5OS3UxTUxodWdz?=
 =?utf-8?B?RVpWdlhtRzcwZmVSZk1LRGVHcVV3OThKalRmZ3ZoRUxvZnk2VmI0VE9XZE1H?=
 =?utf-8?B?M2R1NWlQOVhiR0RTVTY2MEJmbTVYMmtSc3lJaVRYZTF3Vk5WaTN5MkU4YUdj?=
 =?utf-8?B?ck9oSFJDcGhqS0c0b3hjaFVXeC9UVXR1OStnc1RrVnl3OGdtazFLSzBldnpI?=
 =?utf-8?B?Qk5Ca3MrUXd3bVJxRUovNS82NFk0MkprTTJTeTV4dEYwVjIrVitlU3o2OGFS?=
 =?utf-8?B?ZC9sOTFDS015NlhRWTBNeU5neGFSdXlpdnQ2YVZVMWtEN2xyZWZlRHRUSVVi?=
 =?utf-8?B?cEMwOHVGMU1rVjFNeWJSRWs2dnlGSWYvWTkzOE1TWVRYekJHc05qRlExVkR6?=
 =?utf-8?B?dUJsZ1U2YTY4MzhRRkVQbVFrUWM0M3p6bWw5SE9TbUNuQVlBYUF3OWkzbGNF?=
 =?utf-8?Q?FLCI=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:58:25.8154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1dd2e6-339d-44c3-25a5-08de27416b44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5989

SGkgSGFycnksDQoNCj4gT24gMTkgTm92IDIwMjUsIGF0IDA3OjUzLCBIYXJyeSBSYW1zZXkgPEhh
cnJ5LlJhbXNleUBhcm0uY29tPiB3cm90ZToNCj4gDQo+IEltcGxlbWVudCB0aGUgZnVuY3Rpb24g
YGlvcmVtYXBfYXR0cmAgZm9yIE1QVSBzeXN0ZW1zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFy
cnkgUmFtc2V5IDxoYXJyeS5yYW1zZXlAYXJtLmNvbT4NCj4gQWNrZWQtYnk6IE1pY2hhbCBPcnpl
bCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IC0tLQ0KDQpMb29rcyBnb29kIHRvIG1lLCBJ4oCZ
dmUgYWxzbyB0ZXN0ZWQgdGhhdCB3aXRoIHRoZSBGVlAuDQoNClJldmlld2VkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUg
PGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

