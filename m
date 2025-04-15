Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6998A89612
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 10:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952280.1347778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4bMR-0002gB-Pu; Tue, 15 Apr 2025 08:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952280.1347778; Tue, 15 Apr 2025 08:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4bMR-0002dn-MY; Tue, 15 Apr 2025 08:09:39 +0000
Received: by outflank-mailman (input) for mailman id 952280;
 Tue, 15 Apr 2025 08:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN3i=XB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4bMQ-0002dh-AQ
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 08:09:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f403:2613::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f69232f5-19d0-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 10:09:33 +0200 (CEST)
Received: from AS4P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::11)
 by DB5PR08MB10233.eurprd08.prod.outlook.com (2603:10a6:10:4aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 08:09:30 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::b1) by AS4P191CA0012.outlook.office365.com
 (2603:10a6:20b:5d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Tue,
 15 Apr 2025 08:09:30 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.4
 via Frontend Transport; Tue, 15 Apr 2025 08:09:28 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 VI1PR08MB5405.eurprd08.prod.outlook.com (2603:10a6:803:12f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 08:08:55 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 08:08:55 +0000
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
X-Inumbo-ID: f69232f5-19d0-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N2Nicq9j83ZjtCMZQoFgIE3oxFBVHZ10L/f3Kc3O3X1qoHrUnh+/KX+UrNbyYopnwZ8t8koLb4nr+hqFvtUxzKQKAxT7B+txW/SiICX9a8DOYcBzMRNPqQYP+B5pD3awmmCLR94RLr4ufBfsHgNd2cM5Kz5QcWOTtaewRPO2yWbuxBS6mWKdVAGoNnjHawxc0nrz2ll8OZBpLl1iy+IkyMBTThS0qQcFSd3W8QlxBcuf+q/OT0qpdXwcAgcfINhQz8A/HsXpiUurBihl/IRWUogsK9SLJhMIyZ25k6w8lodXGYF1b4pmStWBll1cJh09+Z7mWU36O76RSmb0KP5Vhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKGb6NygjL8lFl5nXyYcS71WTk3eOUwMF+6mEdFecqw=;
 b=y7WS4Il1MlEE4SmEM38T89CvLt58AM0M6vzNSI8kThU1rP5ies1Pu+doaQFU2Qff8UJuOF0ne1dsxjnGsEpFrzm0ZR1Xq1GDU+I5kPcnqX7zPPAEKKIGMj4M79MZMhbY2+h/4qYWW4tkiIbgXmQ/PlyKXI4r/jpS3qAln7LXI+hKucaejTwAlLekz/BrccOm+bdZQFEajVnba7zorwTuO1oQE6t+AHFIMATCswkZevsYT7wBJsuo/2W2nQyFXzu3LM1p7+JNuqYT0Iglm4AKecZGW8UIlLg9D6mOTB26yX6dNv7XonIqez/AgiXkxVi8n6BhhOCOi/JokkDfFhwu2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKGb6NygjL8lFl5nXyYcS71WTk3eOUwMF+6mEdFecqw=;
 b=JNe+ySs5/Q6MVC9Cyc7WzVmt1CRZeBNpKkfVudCAcfEg/FR24uPiPoB0FcxJLoyFZ6Lm8YoROqvw4iJOXy12KRXl3eCZ3U0L4kfLPBz1mT/K+fNtS7g3y4X9gEBP4MFt/gVvrClb7mpK+PkyQEwEshwSRBIo0VScS0QcGwWQmRU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0Cn7p6O732AGoB43xD0EMn00kj7Dj8DvdFEB2ZqsEfVgpQHf2NfovwfvKzb6sZ+j2/+qn76ZlKS6SWTbdfOfTRip8nP4GIz3QPctpio6drPAklofOxxWSTrMHXbCpyiX2rJqSd7Hl+dBueuACrqBLosOIRn6dqvXbdq5f/BN3gw8w4X3NNdVDsZPhdvAbFiW7o8WzWgiEZZSIiAYCmhESm3ed7g3HxdZMKkbE746Q2J16PmYPYlJ/ei5M7sqNdG1VqZtMgxKgDG3C3XlhzaWSpSfe8vDTnzRF3Xa6X7H2GHmlWyh2wSfRlKrpF66SfvUkFm0r3JeWsHH0gej0jxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKGb6NygjL8lFl5nXyYcS71WTk3eOUwMF+6mEdFecqw=;
 b=AkqUa4nQFpGw5GNoEjiwn3mIJvSX110e3hUNduBAB3dUiGW9ptfEqTAz9j1dy0FKdobS2SgUNPAPGg9h8t3fnEkFfbq/peKqgT5CEKYDYDq74PDiNkY0hIvtP4hVKEzlvM6SHfef5aRc7bBtdtwAVNNP5ubUdBBAIr3NyTrJAN4Ba6BrOmI7rAjdTNqwRC0YnraHbNWBQLH4FdK8O2HclkicQKCpcP36F4QwnMl+yBlcegW+GRVCNqCJOEXhLnPsPp4Spcwzl2Es+N3CZfkOc5EugocCUe/Z0L/tObvtvjiNB2+id/dcAUCeoQnhiLYM3OtZ2hk4gLEHJ21jyINl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKGb6NygjL8lFl5nXyYcS71WTk3eOUwMF+6mEdFecqw=;
 b=JNe+ySs5/Q6MVC9Cyc7WzVmt1CRZeBNpKkfVudCAcfEg/FR24uPiPoB0FcxJLoyFZ6Lm8YoROqvw4iJOXy12KRXl3eCZ3U0L4kfLPBz1mT/K+fNtS7g3y4X9gEBP4MFt/gVvrClb7mpK+PkyQEwEshwSRBIo0VScS0QcGwWQmRU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v3 2/7] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index: AQHbqvIQLPZqfCHfmUu6hn1OCHotk7OjDmYAgAA5foCAAJw1AIAAgSKA
Date: Tue, 15 Apr 2025 08:08:55 +0000
Message-ID: <72B2783C-AF90-4154-8EF9-4F81A0A537B2@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-3-luca.fancellu@arm.com>
 <d58be435-fd83-42bc-9fd0-a8884f358704@xen.org>
 <1A24757A-ECCB-4080-B370-DA44D469CC7D@arm.com>
 <6a681c92-8c61-43f5-b266-b0306bc0b1ce@xen.org>
In-Reply-To: <6a681c92-8c61-43f5-b266-b0306bc0b1ce@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|VI1PR08MB5405:EE_|AM4PEPF00025F9C:EE_|DB5PR08MB10233:EE_
X-MS-Office365-Filtering-Correlation-Id: 84188507-3933-45ba-6ea9-08dd7bf4d872
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VEZRSWpQSUM4TGFuUTZkNTlYL0Z5cUh3MFRnaXhtdEFGUjNxZTlqTXc3Vkg1?=
 =?utf-8?B?Mm96M0U3Zy82a3Y3c0V2UG9uNEtCWGttbVZQaXhNc1h6ZkcyNjdmWmY3d2U0?=
 =?utf-8?B?NlM1RDNoRDgvWGVUVStPakp6dUV6L1RnLzduelgyeGRrcjhubU5keG9LY24z?=
 =?utf-8?B?YXJyTXptMEgzS3dxRzhTMFNDc2RZWTZPSHo4MlRCRXZYakxQMmp4d3Q1alN6?=
 =?utf-8?B?K1NVZTZmeG9KS0V0dW5EVFJrWXkwbzhMYjVHbllydm9KQ0VUQlU4bi9CWDdu?=
 =?utf-8?B?b1cvT2ZaTmFlMGRPdnVCaVVNbWVvRkQzNU9iVWMwQkVxcTBkbTlXdXVwSlRp?=
 =?utf-8?B?d09kTDl3UHYwcTVlUzBldkRNeEpBclVld1l1MUhXL2VMWDJOTGRtSmUrQUMz?=
 =?utf-8?B?VlZnT0dVZjkrRGFDSS9DOE41R1I0V3llcFFnaldWbEV4MUZuUU1vRG4rc0JC?=
 =?utf-8?B?eUFWRFdYVWFJL0Ywdm1MUFlKaVhNRjI2OFZjNDlhb3NtdTdOelFDcTlmZWJK?=
 =?utf-8?B?bXpKT0R6Q1ZNM3lJaHg3OExkRjZSYm9kVTVHYkMrYW9VaVErSDB4dXA2bU5I?=
 =?utf-8?B?aURFZ2pCMmRyMkNpVzZ3bGt5RVZVemJSRlBmL3U5VDBoaGh1cUlJTkNNZ3JL?=
 =?utf-8?B?dE4yditCSVp0VU5XVk4wZ0QxS2NpT2d2cEM1blZQcHFHd1VYZVJ6dE9CeHlN?=
 =?utf-8?B?ZjFvNUwrSzlLR1dpUW1wbllXM2hBVlNTaEtXd3lDUzF6MVI0QjQ1aldON1J3?=
 =?utf-8?B?VUV3TjJLQ1hHNndHcWhodDkzbFhrUTkrZ2I2U3UzWnFwN2E5S042RTl1aW1t?=
 =?utf-8?B?UVA3OGdKQ2daUm9VdHZhU1BPS1RoVjZKdXlwSktxeDlRKzlZKzU0bVZhWDQ2?=
 =?utf-8?B?MUo0c2RaWXphUUd4emtrQ2xwR2Z3ZTQ2NVBTTGZSRFBQczUwSEw0aVFHeDYy?=
 =?utf-8?B?d2szUi9aeVBxQXdxOStkSzlwTVpqT3NiRmpqSmhPMnZzcUxHS3pmaktsSlpV?=
 =?utf-8?B?UXFUWlFhaHN6UExYWjlKazlEMmd6ZnRBTmh2dmhCaWJldGpMRjJmSTFqWS9n?=
 =?utf-8?B?NkxBMVhlRm1SUlVUMWhSUElxK3ZJV2JPSlo4akQydTBFb0tJQ09PVVFXQk4r?=
 =?utf-8?B?MjZtVDF2Mk83YXVSQUUxQXNHV0NEbGNPMHRIRUtySkNIQTNIVlZDaFQ2bTB1?=
 =?utf-8?B?clkxOUZ0eURvRDNFUWFXM1JYSmt5b1RMMS9RVlJJNW52eGxjVVVFdTVDbW9P?=
 =?utf-8?B?d05BYkptS3VVWDNhQi9WQWNqRTFROTBnRHlXRjFjU3NnK3VPNTZPSTg3VTVY?=
 =?utf-8?B?VWpkcVFUUjBMWmlsZUtYS1Vram9peGFldDNvRDJVN0FFUm1Lc2ZkV1pZS3NI?=
 =?utf-8?B?TzRuU2lWbm5jNmxmdzVXNGVRQUdEcVdBbTAza293T1A5TXBXNzhnbDNUdTFR?=
 =?utf-8?B?VEpQU01jYTZOSkFCVWQvdWVnWHJCdkMyK1MrT0p3alNUZ1Y3YWdoMWliNW9U?=
 =?utf-8?B?MlowcVJPRTJUUGVLcjBaWnBGcXptWkxTaHN3TzNVS2FtTXA0NjNQdFpSYnNj?=
 =?utf-8?B?eGxsby90UEFYMkRjMnN3MHR6ejhiYWpzNmcrYnlrV3NBc1ArTFZjWkh2L3Y1?=
 =?utf-8?B?VzFBd1c5MlVmVWwxZnNFZXBKVDVBaUtkaTVmT3M4U0JzQmJGWHNKZFFUenlM?=
 =?utf-8?B?WXNTNG5SeStvVGtkMFdJVzBYS0VJUVNpbitwRHlmeGtlU2xZbHZkMm54d3Jv?=
 =?utf-8?B?dGdSTld1TFhPY0lnK1QrZkM4KzhlK0RMWFdXaVpscGJBendEWnBkeDF4NU1l?=
 =?utf-8?B?WWJxdWw1eUhjUmtTUDBhTVZ0VVRNaDk5czcwcFNNYm9tVmdaMFhGY3g4Nm42?=
 =?utf-8?B?dTlQOXg2N2NpK0ZGTnFqWnBDY3pUVjB6Q2lBekJwZzNLQXZXalNQTWUyVzVl?=
 =?utf-8?B?N3FQVEpRM0FodzlPak1FYXVBMWhtWHhyaG8xbmlhMjJFUHg2QnF2akRUbWpS?=
 =?utf-8?B?NXJXM0ROSkpnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <63909C7F893D474EB5A29F1765DF265B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5405
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b301babc-c6df-4382-1e0c-08dd7bf4c453
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmphOEp6dzdOUDNiTWk1V01MQ2YxVFZETVBsd1g3RmxydXNsNGRtczBaeVcw?=
 =?utf-8?B?dkt4cUE3Unc3WEZTa0pXamdLN3RKbnBhb1lPVHVhMythbUJ2RysxTG52aHVV?=
 =?utf-8?B?SitwWmVoR0FFU1Y0enVCU3VuZU5hWDNBZElzV3lmUmx6L1ZuYVdENjhDUTBW?=
 =?utf-8?B?ZlhKNjNaN0FDYzF0ZStWTE9yamZEaFRPNXptSTFjWVliNjRZcytjeWpUcEla?=
 =?utf-8?B?R01EME5jYXZtV1JtVXphYUxud0xZbDh4YVNXZE1adTJBSVJZVDRLOEZBZHIv?=
 =?utf-8?B?Z1h5Q3ovRVVCNXg0QUpHak9kbGtOMjdLU2lrTUpERUl0dWl6eWQ4aThmemkr?=
 =?utf-8?B?NnZnc1VNT1Z1akRpQXgyOVVUMXpKVmxPcWxGbjRDd2FmdDJkem8wNU4zOG4y?=
 =?utf-8?B?RWl0QW1UaDhCS2lIOTNSZllRU3BHS1FMMzNhbGFLOTZxdzdzZjM2NWVDem9C?=
 =?utf-8?B?Z2JqZzQ1S1MydzNwZkgydVhpRVhkUnZQYjQ2SmxZdjhYTUh1Zk01L1UwSjly?=
 =?utf-8?B?MDlQQzM2NW8rYWpMZVQ0MmdxMWFWNk9HdUV6MEpPQUZzVUxNSFdRMm5NOVVW?=
 =?utf-8?B?OHJSWkJIVGV4OXhXSmJiQjViSmVacCtsOFRiM0NaU0xWYUN3MHNvQmJCRHNi?=
 =?utf-8?B?SW4zdzZtb1M5eXlPVmZKTlk2K3Fja3lqSFdIaGxqejJVb2hsTGJkb3JqY08x?=
 =?utf-8?B?N0VQbkJQSkZJMVU3Q0N1RWo4dkNBTlpic0xmWktlZ1NiUk9kSlY2c0tnbElO?=
 =?utf-8?B?eWxkM3ZPODRqbm4zd0dWK0V0czBOSWlLakVLNk1BTThyVWhSVThKT0VscXRI?=
 =?utf-8?B?MEJMR0xnR0ptSG00UlhFRWc3b1pncC9oWUh4RnY3NDR1a2tDazQrOE1UVGJJ?=
 =?utf-8?B?dmRtY1M3MldhRVlOTG4vWkdoVlAyb3ZmUk5yck14QnA2cmNKMEZ0bVZlcm5a?=
 =?utf-8?B?eVdHT2t6WTZoWVo4OEZwK2FTZ1M3UEc5ZllUQ2xWaklwSkFCSjNWc1d5T3BL?=
 =?utf-8?B?Vjg2cW1iUTVlVHV1UGRiU2tuaDBONTlRVitUOGo2MGRjTnViVERTeXk2Y203?=
 =?utf-8?B?Y3JONENrRTVFSGplT1JuV3UvS2JOTGZsY1N1VDBqRmhENTJlVVBRQ3hJYVhi?=
 =?utf-8?B?bFhDOCt5RWFPdjFzb1cwR0JEelNIOUJhU2FqVE9uSkwxaUpJcGpjNzlVTlVI?=
 =?utf-8?B?d2J3dlFteC9PRFhJc3ZwVlFubnFOVXJSdlR6TTNGdy9mOElYOVZZa014eE5L?=
 =?utf-8?B?YTRqZmE0YmdpeENML2htbE9XeCtjU3M1OHhVRFNCNnpXZEMzVGNFTWp2Sk1R?=
 =?utf-8?B?elV3ekVpOThMZmczenBLU2RQRXgxanQyWXpMNUJMYzZBZ1FVYXNIRHlRVmpH?=
 =?utf-8?B?ME52UnNSVTYzZHZhVm9Fbk5pZGlQbW5RRUZPUThNZ1BWMHNTMHg4MWIwN0Nl?=
 =?utf-8?B?OFhQMDBJSzlDUm83YUg3c2NNOVRRNmJXbS81YTdVRGNidk43TnlYbjVLMWFV?=
 =?utf-8?B?bDlPckZINVd2R1hBTk1CaUExQUxlMVBQck5xby9Fd0FBTFYrQkhwRi8yUFk4?=
 =?utf-8?B?Y1l2MXMxOW9VblZVVzl5TkhQTkMxVnh4QUx6MjVYTEwveVh1MTJpNW9waXhq?=
 =?utf-8?B?TldSZGZ0UHJzaDg5RjhIWHo1eVpJZnpIK3FQd1dOQjM2Mk9RdWtSekJpTW5D?=
 =?utf-8?B?YlBMYTVqRHFKWlppV0x0a0Q2dFhBTnVWdVNTUHdabWVTNjVWb09ZaHFOSElt?=
 =?utf-8?B?cFlpdm85QytGZlh0T3g3bGdiKzA4Nk5wYm84QVdzSWVCUmZtQndZaWVLSk9C?=
 =?utf-8?B?WVZYek1YOTdKVHNCMGpMWmsxbGJFbHVBWWhQNW1vTVZWUVRxeGtQNjRFWExL?=
 =?utf-8?B?T1hycExYaTY3NGYyNmJQWEhYdHRHVGErNmgxWUhTSjJxT2VBb1owblgxVTVq?=
 =?utf-8?B?T2M2SW9COU5KUGhwSUpzbnI4aFkxcFM3RHRyaXJtdzRObHVGVU9HSlpTSlBW?=
 =?utf-8?B?ZDZmOHdEL0JLRkxCN3hKL2tGbVJUcHRFc2YvejlHMGMxV1JUcS9UMmZrOVNL?=
 =?utf-8?Q?VSNyJd?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 08:09:28.9306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84188507-3933-45ba-6ea9-08dd7bf4d872
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10233

SGkgSnVsaWVuLA0KDQo+Pj4+ICArLyoNCj4+Pj4gKyAqIFRoZSBmb2xsb3dpbmcgYXJlIG5lZWRl
ZCBmb3IgdGhlIGNhc2UgZ2VuZXJhdG9ycyBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRQ0KPj4+
PiArICogYW5kIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0Ugd2l0aCBudW09PTANCj4+Pj4gKyAq
Lw0KPj4+PiArI2RlZmluZSBQUkJBUjBfRUwyIFBSQkFSX0VMMg0KPj4+PiArI2RlZmluZSBQUkxB
UjBfRUwyIFBSTEFSX0VMMg0KPj4+IA0KPj4+IFJhdGhlciB0aGFuIGFsaWFzaW5nLCBzaG91bGRu
J3Qgd2UganVzdCByZW5hbWUgUFJ7QixMfUFSX0VMMiB0byBQUntCLEx9QVIwX0VMMj8gVGhpcyB3
b3VsZCB0aGUgY29kZSBtaXhpbmcgYmV0d2VlbiB0aGUgdHdvLg0KPj4gUFJ7QixMfUFSMF9FTHgg
ZG9lcyBub3QgZXhpc3RzIHJlYWxseSwgdGhlIFBSe0IsTH1BUjxuPl9FTHggZXhpc3RzIGZvciBu
PTEuLjE1LCBoZXJlIEnigJltIG9ubHkgdXNpbmcgdGhpcyDigJxhbGlhc+KAnSBmb3IgdGhlIGdl
bmVyYXRvciwNCj4+IGJ1dCBQUntCLEx9QVJfRUwyIGFyZSB0aGUgcmVhbCByZWdpc3Rlci4NCj4g
DQo+IEluIHRoaXMgY2FzZSwgY2FuIFBSe0IsTH1BUjBfRUwyIGRlZmluZWQgaW4gbW0uYyBzbyB0
aGV5IGFyZSBub3QgdXNlZCBhbnl3aGVyZSBlbHNlPw0KDQpTbyB0aGlzIHdhcyB0aGUgY2FzZSBp
biBteSBwcmV2aW91cyBzZXJpZSwgYnV0IEF5YW4gYXNrZWQgbWUgdG8gcHV0IHRoZW0gaW4NCmhl
cmUgYmVjYXVzZSBQUkJBUl9FTDIgaXMgYXJtNjQgc3BlY2lmaWMsIG5vdCBzdXJlIG5vdywgc2hh
bGwgd2UgbW92ZSBpdCBiYWNrDQphbmQgcHJvdGVjdCBpdCB3aXRoIENPTkZJR19BUk1fNjQ/DQoN
Cj4+Pj4gDQo+Pj4+ICB9DQo+Pj4+ICArLyogVXRpbGl0eSBmdW5jdGlvbiB0byBiZSB1c2VkIHdo
ZW5ldmVyIE1QVSByZWdpb25zIGFyZSBtb2RpZmllZCAqLw0KPj4+PiArc3RhdGljIGlubGluZSB2
b2lkIGNvbnRleHRfc3luY19tcHUodm9pZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICAvKg0KPj4+PiAr
ICAgICAqIEFSTSBEREkgMDYwMEIuYSwgQzEuNy4xDQo+Pj4+ICsgICAgICogV3JpdGVzIHRvIE1Q
VSByZWdpc3RlcnMgYXJlIG9ubHkgZ3VhcmFudGVlZCB0byBiZSB2aXNpYmxlIGZvbGxvd2luZyBh
DQo+Pj4+ICsgICAgICogQ29udGV4dCBzeW5jaHJvbml6YXRpb24gZXZlbnQgYW5kIERTQiBvcGVy
YXRpb24uDQo+Pj4gDQo+Pj4gSSBrbm93IHdlIGRpc2N1c3NlZCBhYm91dCB0aGlzIGJlZm9yZS4g
SSBmaW5kIG9kZCB0aGF0IHRoZSBzcGVjaWZpY2F0aW9uIHNheXMgImNvbnRleHQgc3luY2hyb25p
emF0aW9uIGV2ZW50IGFuZCBEU0Igb3BlcmF0aW9uIi4gQXQgbGVhc3QgdG8gbWUsIGl0IGltcGxp
ZXMgImlzYiArIGRzYiIgbm90IHRoZSBvdGhlciB3YXkgYXJvdW5kLiBIYXMgdGhpcyBiZWVuIGNs
YXJpZmllZCBpbiBuZXdlciB2ZXJzaW9uIG9mIHRoZSBzcGVjaWZpY2F0aW9uPw0KPj4gdW5mb3J0
dW5hdGVseSBubywgSeKAmW0gbG9va2luZyBpbnRvIHRoZSBsYXRlc3Qgb25lIChBcm3CriBBcmNo
aXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCBTdXBwbGVtZW50IEFybXY4LCBmb3IgUi1wcm9maWxl
IEFBcmNoNjQgYXJjaGl0ZWN0dXJlIDA2MDBCLmEpIGJ1dCBpdCBoYXMgdGhlIHNhbWUgd29yZGlu
ZywgaG93ZXZlcg0KPj4gSSBzcG9rZSBpbnRlcm5hbGx5IHdpdGggQ29ydGV4LVIgYXJjaGl0ZWN0
cyBhbmQgdGhleSB0b2xkIG1lIHRvIHVzZSBEU0IrSVNCDQo+IA0KPiBTbyB5b3UgZGlkbid0IHNw
ZWFrIHdpdGggdGhlIEFybVY4LVIgYXJjaGl0ZWN0cz8gQXNraW5nIGJlY2F1c2Ugd2UgYXJlIHdy
aXRpbmcgY29kZSBmb3IgQXJtVjgtUiAoc28gbm90IG9ubHkgQ29ydGV4LVIpLg0KPiANCj4gSW4g
YW55IGNhc2UsIEkgc3RpbGwgdGhpbmsgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBuZWVkcyB0byBi
ZSBjbGFyaWZpZWQNCj4gaW4gdGhlIHNwZWNpZmljYXRpb24uIFNvIHBlb3BsZSB0aGF0IGRvbid0
IGhhdmUgYWNjZXNzIHRvIHRoZSBBcm0gaW50ZXJuYWwgYXJjaGl0ZWN0cyBrbm93IHRoZSBjb3Jy
ZWN0IHNlcXVlbmNlLiBJcyB0aGlzIHNvbWV0aGluZyB5b3UgY2FuIGZvbGxvdy11cCBvbj8NCg0K
WWVzIEkgd2lsbCBmb2xsb3cgdXAgdGhpcyBvbmUNCg0KQ2hlZXJzLA0KTHVjYQ==

