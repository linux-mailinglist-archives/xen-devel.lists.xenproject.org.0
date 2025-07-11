Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980E0B0134B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040465.1411900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6u2-00072W-24; Fri, 11 Jul 2025 06:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040465.1411900; Fri, 11 Jul 2025 06:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6u1-000709-Ux; Fri, 11 Jul 2025 06:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1040465;
 Fri, 11 Jul 2025 06:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cwzd=ZY=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1ua6tz-000700-P8
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:06:31 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 303218a7-5e1d-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 08:06:30 +0200 (CEST)
Received: from DB3PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:8::48) by
 VI1PR08MB10051.eurprd08.prod.outlook.com (2603:10a6:800:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 11 Jul
 2025 06:06:23 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::d6) by DB3PR08CA0035.outlook.office365.com
 (2603:10a6:8::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 06:06:23 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 06:06:22 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by DB5PR08MB10047.eurprd08.prod.outlook.com (2603:10a6:10:4a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 06:05:50 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 06:05:50 +0000
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
X-Inumbo-ID: 303218a7-5e1d-11f0-a318-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BpmHN2i1d89Ku4sw5wpC5MqEo6AcqGcFOLufI7Jja7oS3YWcMqSzN47/+72qn/oSJGmAjsG5OEmsmBFyhILht2wBWeLZWwmTBNaEAQTxtj+uuJmOI4/6a+1UL37oJvS/DKM0BAuasZ2yXdDfF4yZTQ9OgduB+kSsCDeY3jIQ6l1NYmwyl67Ebm6c3YK7vgQX8yh0oW2Nr3tzHCmO/2AYapafK4QVvMgL0zhYY3xj/OFC/qs2VubW75OmAx5faYIfb+t5afjkIHgEgf4mww9ITggBU243N/b2WeUCjeWn/Di5m8RgO2KNtwYqM6eBQUhGJq0xq0imJzucvwa0j29+UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erd5/faxuRfWmEQB3GUBSosP5YZADYgCv7m961NYMXU=;
 b=a1E7uSuE0S6TESfqhtal4IDu5g7Hz+9SEJkybvVcYnv8RVqdJMUSmfmo2+DRaiOdnSjW9XpgrMrzhvuPcUIMjbgGnP7tNXnCtGPA5Y5ZS0jcoMNYcNxXNZrBpQTqsEJPMIF4h1TDWtQWmMdT09yYO+q9cO3llgTVmXmlVRZ3/AhehjYZztbq0EYcuqbzHKrijYtKwJcqvfeJGqv8EW/MvtBP22YD/Japt0S//Kpk80FhyvmBCZ1EhjDTjfLFpUrILkW9mh/SvfqqTycDvsyZ3uQRUt+2kiZ2wa8RUZkDz3SqZbiO3E1Tnop7OS7ZQdf19LRNmy5QsPO3SLSeEzjr3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erd5/faxuRfWmEQB3GUBSosP5YZADYgCv7m961NYMXU=;
 b=pl6Wso4rlRORB3iRzM6u9vt50sHshy3J6h7VwfxIoG31sk6w0H86chS578RP2nIHy34ZtE8DaraUpSzI87qLWoIRSLgrztiaYJNfsx/fdfmNpxD+Ht+KCduy6InzvhMcM51uZgksHd7JZOGy1ymnHj+g90Q9mcE7gsmagmSfGi8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhpKhhdqTMjXq7Dtw+jfPk6W6RwN5fiFtk/vqcbkUwIvxB3VS9skYbn7YQ2HSdQRJgmxdx/nxN85QUNf+dGdc5+b93y20zIDx5OpD5ELxIfDkjKMqjhPmD7HG92TRp6p/jkxZNZaTU/AaERhO3nrJDAuomhFqmKAbC/d4S0w4IeBx8se4foTHsVQMx+Vwcpyl+7YkYkwwAmtmMgUuDj6OfhJegYQahwHElHZPn0NpfqnYUyhBjxW5iQjD1qmjeK4cFNJyNbb5S/VGHquYrcUqNvIejVDfhOCOGdlFy7Wejd//TtoGMtNxsYUQUf0dlfOxYW1r5ItdSqEXr3A8mOK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erd5/faxuRfWmEQB3GUBSosP5YZADYgCv7m961NYMXU=;
 b=gpqmriEmZkWYG2jkKPZz0XfrCqeFGSG0fK1RRS8c6lc2Mlc8zlKu8liJjQPPH7Kglw50AZBE2h6+nsqurTncnL9mGWQZzwstCdDkIeaRMQ/VKDPlJ5z+X+67ZmoUoKyPIz+KaUYeBMUfWTt8e6l94YA0HN6QvzoobCPpEaMjzqcMZH4w8XWnJeuzQk5OE0bEwrwQNcg/NARPSbq0ph38Of9xY9YyhzMZavl7fiyJ1bRWwhR6aU07RHvgRFL8x+QXLVz/yPUSmS8cgtg7mua5SPKCmVpd5HFKxjGz3zUA2KKpuCANwmHwYSIlpTjPy8zuDSwlGVSyH7B6Lgw0U0QAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erd5/faxuRfWmEQB3GUBSosP5YZADYgCv7m961NYMXU=;
 b=pl6Wso4rlRORB3iRzM6u9vt50sHshy3J6h7VwfxIoG31sk6w0H86chS578RP2nIHy34ZtE8DaraUpSzI87qLWoIRSLgrztiaYJNfsx/fdfmNpxD+Ht+KCduy6InzvhMcM51uZgksHd7JZOGy1ymnHj+g90Q9mcE7gsmagmSfGi8=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH v2 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Topic: [PATCH v2 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Index: AQHb8KxaVj5A0pu2bkyucXmjCMBL8rQscg07
Date: Fri, 11 Jul 2025 06:05:50 +0000
Message-ID:
 <AS2PR08MB8745049622AD6F6D553EAABDE24BA@AS2PR08MB8745.eurprd08.prod.outlook.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <100cc63353021067e3eae68d092ebd73f484f416.1751464757.git.hari.limaye@arm.com>
 <10c17850-7e53-4547-9ce0-29d58e35ca7e@amd.com>
In-Reply-To: <10c17850-7e53-4547-9ce0-29d58e35ca7e@amd.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-reactions: allow
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|DB5PR08MB10047:EE_|DU2PEPF00028D01:EE_|VI1PR08MB10051:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a9bb46-cb58-4412-7e89-08ddc0410fbe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?c7F1BXeNAEDiUWDxJskFEFgE/0dqislfZXzHOMk4tj/xy5I7YWKR+Zy1ntLc?=
 =?us-ascii?Q?w3ZGb97qOzySaBjxPEAPMdbArwcDXeEVsxn3PedjRTKQr4rKdve/jaGiNNwb?=
 =?us-ascii?Q?A0DmVatGEIx2OJF3N966iI1mh08LcgtERUkFz3G7JFwgpMVgZhpu9q8wDimV?=
 =?us-ascii?Q?fNA6pWYALQENJmW1Ze5dDsDT6YxZ28SIOilbfWcmosRSpz3VVKatjXh8nCos?=
 =?us-ascii?Q?m6zX6pvi820xcnnOriA0vG0ErQZzbqWJZUsw8tEyElYrT+Q0mFdmR/9FPMhR?=
 =?us-ascii?Q?W4DumGrRofjcqd5smgXKHf9BpTXEVNjbc7IxeSzIWhf1UrIvJxv7VNytEsjA?=
 =?us-ascii?Q?VSpPh9GdG3nmAAjk4LJuevaR+33ni2T+ro095BudrtlbpmrbiBkqq2opszUb?=
 =?us-ascii?Q?JIwPuv+Wcx3K5GMsl2X2u07ktBVykOtfibCf5Ru8jCGrvztOaLq9SWmoYFJb?=
 =?us-ascii?Q?R9MzhooC5O9lIMnoc1C32KR+OqaAf1B6qtDbm1Dqsi+DahI9KIMldcR8eL7l?=
 =?us-ascii?Q?7Z4UuX8a/8QKgTzbjK9V8f/WRkuPe8yNytINC46Wht4GVjyQYe8w2fIy5vqZ?=
 =?us-ascii?Q?7uJBRoc0YJ9IcMYiL/60lfOwke2xYvi5hKTnhBf8v6EBkOpbfoHk/EwGVMbP?=
 =?us-ascii?Q?R0FyCQFE+6+8i9IoYIhG2qA+jP0pV6UWHug7ZcJhoJf+rVBWl2wlOTaBkEWY?=
 =?us-ascii?Q?/hjZfnl0i3m5AGDsuCSZNHEl7NpZ3O2lasZvS2lFy62uF8j7LuTYpGUNsSrS?=
 =?us-ascii?Q?frh9xkZrUz89dKLyZqlaY10r2S3zVknav22rUGVj8ElR3s77i9kg99l37/ZX?=
 =?us-ascii?Q?9ZUJjo7098c8Vm+hLzODmiW63oioVq1RbbT7PL6aZX5ponvDFlxZsWcYGlpS?=
 =?us-ascii?Q?4xKujXSp+3bWFxRA8XIOF8trFqba7b/pwBRP3WDOtPaWOf5Qof4WwWD0LPu1?=
 =?us-ascii?Q?zswr1mPauhBToi5vbFFz5ZxBfojVAoxlzVnujNMfsJHrHdGvf3r9mLcqJrMz?=
 =?us-ascii?Q?8H6d81cCXJHN3+CrqbU9dYCJV2CJHiYp5qRKx/SWOb4GxYVz4sMmQk7Rs4t1?=
 =?us-ascii?Q?n7ZnMwx/4+PRi4IZTRjPrzx4ChO5WJUcVGeLQJwWvAlCBYqZEpdSIshJCcUN?=
 =?us-ascii?Q?MWAVnJIMgo2bsg6vytKgzmUwoGaG3eEuTXLrbUdF8y4xDZ8RMJkTZznv/3A8?=
 =?us-ascii?Q?VisN0gQlq3mhm8nhyEfpJgzxk2yWcAGIuO7Y4z/L//SHf7MzOzSOFSxDKe67?=
 =?us-ascii?Q?bHPiQQ45no8b2vHrxMu/YpEqeT8Diu89FFX0yGQP5C5SlwS5x5hZiib/+ZlD?=
 =?us-ascii?Q?Ra6QUQQl3H6Mn39wTjUvgdpkFrO4vM+tV4Gt12u1bTcr+JscbWmEejdOtfg1?=
 =?us-ascii?Q?edunn60z1Vqg1TKKUujLRrZIgd9JhW88JZOe3WTj4RSXpFOSG82pjN+YpQWO?=
 =?us-ascii?Q?Tvw8GXeqMLeR+gYYta4Ol0kAAahunIvJnP+MmzqikaL46sNflBhn6Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS2PR08MB8745049622AD6F6D553EAABDE24BAAS2PR08MB8745eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10047
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2036d21-d822-496a-b81d-08ddc040fc8a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|35042699022|14060799003|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JBeougCBPXiO6qKAn9LTuub6/nymzVV7KVdb0krBo/1LdzEG1dBj1Lw+1YAW?=
 =?us-ascii?Q?cJBJXB/pAP5Cli7L7qxRYcwh3M3XTxlJN5xdqgJXqol26tPREwsNQYDMQQq+?=
 =?us-ascii?Q?o/OiiKSemuEG5/9wMtL7MWfDX50qhuczTLzdvWjvOHsfac+rhoQqlcBRg/UW?=
 =?us-ascii?Q?8mfKvap2gGX4bgGsP+r/g79i4gswc1/iVetBM4R8xCVZGjGIvyutyIfQOP7w?=
 =?us-ascii?Q?SMZGYljUOUBGF28/CS8HpBQ2rQ2k4pDaZcTiVyiMqa5zZWTz4yXn1qTzQ+HZ?=
 =?us-ascii?Q?0NyB3LZjD/ENbB0ABF/VTCdo3Vd/kwPUkyBIyJG+5E1MChj4OBw6i3I/gVIW?=
 =?us-ascii?Q?7KuczwLyQ6sizs2POkeZY2uhqcNNJkAj0ukcJzDssnlDCkC2fqYXuV2o2ORT?=
 =?us-ascii?Q?I8YC+AASlzyAj0SMu5RDskWeNlGEff93WBzhi/bzCUTpy5CKmQ+VjSOcpBxn?=
 =?us-ascii?Q?fIoodpBucUAgN8ThGs6J9Sm1OfeL5N5TzXuLjYNRlaG9JxgJCNWitMKVmBzi?=
 =?us-ascii?Q?eYhojPTqJjpkDCfnoye/1yxOl7n61NVKPEVwNirO+nV1GJVW4HjsPXYCo553?=
 =?us-ascii?Q?IZ4Rl3YPUuKlEEJP1g6o9aZaPFDp9ddE0RhPB6niYqxLdT8OQhOHSl1FsyiV?=
 =?us-ascii?Q?zdUxL8TNJN+TTXThn7tgleMY4/cgcotmrifw+lkT3OYVaCNQQ3Ewzmv1qddq?=
 =?us-ascii?Q?TmvQasLLgbZ/4YJHQ5X5x2OPj7C9jCaKygs/eIlbpVlKCtVDrtkOSfUp4BQa?=
 =?us-ascii?Q?4369O9rcNjIZEgkc2e35TxqOgv/5IdcypH5iurhlFgb4Q9YqEe5M4s0vOI3I?=
 =?us-ascii?Q?RaL13qTQXUqvJ5GpU3Kvfg3EPSWEoDyS661PXOuST8DII36e9WIy0Vn/PhG4?=
 =?us-ascii?Q?9//x2JZedb8/YXNtIX3CBz2bn39rVNW7VZp5Z09zTrH+DinZoX0pLpntDVrX?=
 =?us-ascii?Q?KtbbxLKxOzXnCwzMGFcn7jvdp1UbY+gYYPyRRRLugsFokXbOuJeoaObbUZuH?=
 =?us-ascii?Q?4budTuvmLh8YSqYQUTdyLQLKW2YRyxa+8RMh/y34+DHV4XQjW2kAM1ZA1qvg?=
 =?us-ascii?Q?LfLiDnewGbbKJPKu/ufJ+fDhHIO0RQijBbpyUpgvoXkwMbFRBZ1KRInYDEiw?=
 =?us-ascii?Q?SlzZP4F7DYrbXbzIBobPTGaBxLbs5T1IIOOYRLMhMlGbPcARJo4MNecLGOyL?=
 =?us-ascii?Q?CzbKCgw+5RCqbDzq+pHdkL3tdV8i7tLzeQGt7eo8k85PQNGfCTgCPu+43abK?=
 =?us-ascii?Q?E6zhY0OzU4yv8RSX7ZA9esycP17xz9L9hO3dLlIaoU6iKTYJLlivsUVAd71l?=
 =?us-ascii?Q?JQRrh0bhyIom5WYMfVKoXc93UXw8Hou3CbZcgNE9VweULV5J4HrGoAzG/UsJ?=
 =?us-ascii?Q?Ra8ILhBqGW+A47REy6mer+VxwBnOXNyjUPhdT4fIo5nnauB1nRw5slXypraP?=
 =?us-ascii?Q?0K88BpRwioZANKJtoIVS5OyX9io2uoSRy+9KK019U2E9PlRiksUuOX8ZFLPm?=
 =?us-ascii?Q?XE5w+v+9Sazjg+KEGl5sQXKZ6MFiz0TS0gms?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(35042699022)(14060799003)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 06:06:22.5034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a9bb46-cb58-4412-7e89-08ddc0410fbe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10051

--_000_AS2PR08MB8745049622AD6F6D553EAABDE24BAAS2PR08MB8745eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thank you for reviewing the patch. To answer the following question:
> > +    /* DTB starting at this address has already been mapped. */
> When can this happen?

In xen/arch/arm/setup.c `start_xen` early_fdt_map(fdt_paddr) is called twic=
e,
before and after `setup_page_tables` - which is a no-op on an MPU system. T=
his
seemed like the neatest way to handle this - but maybe you'd prefer further
clarification in the comment here?

Many thanks,
Hari

--_000_AS2PR08MB8745049622AD6F6D553EAABDE24BAAS2PR08MB8745eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hi Michal,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Thank you for reviewing the patch. To answer the following question=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; &gt; +&nbsp;&nbsp;&nbsp; /* DTB starting at this address has a=
lready been mapped. */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&gt; When can this happen?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">In xen/arch/arm/setup.c `start_xen` early_fdt_map(fdt_paddr) is cal=
led twice,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">before and after `setup_page_tables` - which is a no-op on an MPU s=
ystem. This<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">seemed like the neatest way to handle this - but maybe you'd prefer=
 further<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">clarification in the comment here?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Many thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Hari<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_AS2PR08MB8745049622AD6F6D553EAABDE24BAAS2PR08MB8745eurp_--

