Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE30A7F878
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 10:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941601.1341051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24hA-0002Ee-3p; Tue, 08 Apr 2025 08:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941601.1341051; Tue, 08 Apr 2025 08:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24hA-0002D2-0r; Tue, 08 Apr 2025 08:52:36 +0000
Received: by outflank-mailman (input) for mailman id 941601;
 Tue, 08 Apr 2025 08:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wetR=W2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u24h7-0002Cw-Rr
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 08:52:33 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce0d8d08-1456-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 10:52:30 +0200 (CEST)
Received: from DU7PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::29) by AS2PR08MB8363.eurprd08.prod.outlook.com
 (2603:10a6:20b:546::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 08:52:28 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::3) by DU7PR01CA0008.outlook.office365.com
 (2603:10a6:10:50f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 08:52:28 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Tue, 8 Apr 2025 08:52:26 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DBBPR08MB6298.eurprd08.prod.outlook.com (2603:10a6:10:1f7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Tue, 8 Apr 2025 08:51:54 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 08:51:54 +0000
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
X-Inumbo-ID: ce0d8d08-1456-11f0-9eaa-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GYoW/adiGzIpYkdWexESXNhXWAfPsfy+XUiTh7eQel3Oc3Tln3mNVFx7iGfDCsfubRWbpE5wIefIUFuD15b11AR2lmSlVV96/bwrI9vABtvfe5T5bgO8Alz+/OVU5E5Mr7UX9iCQYUUeXUwMcZIl1RbQQuYjrygIt2B5m/oswksubdnRmQZeFReGD27quBZqfBHUZ3FeD6/bQZ65H+0UX4ZA6ioyOevqNrSfYqewM2EHfdA8Dybz6VNn57nxF5RrFQD6SxMfRygCHBHyTBwgF5PtlgqXSPMYvYKP90hvhbLcgUHpGUm1l3XqzG2L3hsJwy0I07y1HY9uAHi6Asm/rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX5SMfnGQQRj7Sok1mXkBaN9VVB+e2HR+LHp6LNcOXU=;
 b=aU+1ksvt9GyumJWc6zwqELs8HXk0Qdz6SYZaYpVTsVb/t8Pp2dHBRjCW8P3URPy7MGDtnyX5awUmnN164eHlpAJom53zxplX5aAJxkrb1vNTkuadgkcl1STFr0Wf9bSnEG+S/yaxfsWROCpQ8++xSPJ6xK08dLL9OOc1Tkz4/qwAIR/TUPc4Rw3RwwOE4oQPaH2gjDGCb9mj6zcGpWI7jWR3pUDJyKuTU7+CrRfmFJjX/tMPMQsWlAJKtbmkV66yw+2LstNtcPgbcXZ5KKD56ruxAu7katR4SBoW/Zq/2+dLsPCmB0Z9I7Kks5GiGU3GxY6aOaepvT9YGesLhC43tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX5SMfnGQQRj7Sok1mXkBaN9VVB+e2HR+LHp6LNcOXU=;
 b=JmKA5zI8+2mI6F7GbgEnWlLVIu4BF4PbuUf4ER7JkLvaVFizf907zQhJ1u2I5uLc40SUEOtsQEC6AFtZ5oXg4wEVAZ86iwJrP2rr/FfnyT/Po9gwuUjkGOP+wHcpZMJb0Ce7op3GfdHXVeEDaSQ1Vc1K2BRRb+in3uFa0fwwE8U=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUIWSQlrzCtR+QHat0nITifJK6RnIln+OD7Vym64BiJCwsFfUNUEl4MAN6oPna4tsh/Pdc0mPHCbzfGyKLa6+iwzTuTp0Z0G8UFYagTWAp2o2n51P3i3sE+bMvWhFJ672hCbIFTQuMjxFlUsi1CGEb3tDoBh5wZ3QrxEmdkra0M9lZb5++vFNIdeYzMWjoELSLMkHJR5e2IGKfzwoff3BnzHR8vWtQq46ao1UkI113IKgKy2HkobVmS1UIzj33sKpiOUub0t2kmth/blvyelh2GVzET6E8K1gS7y764TILHvBHMjRhgUf94HyJJ+iADWJEa53nNZ93ID7AUSgDA+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX5SMfnGQQRj7Sok1mXkBaN9VVB+e2HR+LHp6LNcOXU=;
 b=InYsRLeu+uMWd09LSOXblAC9uFpoIpj0sd11oajzEVd9GBIELbCTPOB0X7mF1+NHexd9MXujceIe4NbKs2JE5zKzfiOBpSdZq2C/4uPebCtPxIHKekihlCcA7EoVCnAZvZqRJWzyDCSNqPLiauqgVqZENZ+rfFZm+xsy73+WeeMgx1fNKqRqD3U/BLiURSkSK/tRaaTFJUbs4owWfuwqpF/bYBKXUXy0OTJ2LbNmde3ptXaU0Si15OuuGXCmtrZj7Giy1/5fDsym3XWRKnUdU7NygfAYdDlLN7RxVvyuGK+cSHemCDoajuCFlSYHb5Og01mfLYDl0Q2/GF/6Bw7F6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX5SMfnGQQRj7Sok1mXkBaN9VVB+e2HR+LHp6LNcOXU=;
 b=JmKA5zI8+2mI6F7GbgEnWlLVIu4BF4PbuUf4ER7JkLvaVFizf907zQhJ1u2I5uLc40SUEOtsQEC6AFtZ5oXg4wEVAZ86iwJrP2rr/FfnyT/Po9gwuUjkGOP+wHcpZMJb0Ce7op3GfdHXVeEDaSQ1Vc1K2BRRb+in3uFa0fwwE8U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 1/3] xen/arm: Move some of the functions to common file
Thread-Topic: [PATCH v5 1/3] xen/arm: Move some of the functions to common
 file
Thread-Index: AQHbp+1Intz3ipmah0uCxwQ9Q6LVGbOZdvUA
Date: Tue, 8 Apr 2025 08:51:54 +0000
Message-ID: <F4C240B0-E1BA-462F-B348-EEFD2AAA736D@arm.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250407184443.1790995-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DBBPR08MB6298:EE_|DB5PEPF00014B91:EE_|AS2PR08MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 145778e8-22cc-415f-6782-08dd767aafe8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dlI2TkRLcjRjVzZPdDh6V1hYYUxrSHFZY0lPMkpvWWNZQUtKYThIUkIrODZv?=
 =?utf-8?B?anJoSjE5MlNOQ1pYQ2x4NWpyWStRdGR2c3RZY1RUdHM1SnljQ09FZ3RQQS90?=
 =?utf-8?B?eWhRT3JjYTJrVUpDaFVwbmVKdkYyc2pQbEFZMU0xSW1nVkh4c21aV1FXUjZO?=
 =?utf-8?B?Y3FYUEphRWJPRlNPaFZTelFFMDA4aU9iQ3VReUlCOGVMVVpVa3dVbHQvRGQy?=
 =?utf-8?B?MTNJS05POEJPeEFrWTFVNktuWmZ1UDJZWVd3dHBUYXY1QVJoL29EZUQzN2xX?=
 =?utf-8?B?MFJIWll3QktuRWlJTTZid09ON1BxNXIwUzFlUEt0ekEvdmxaMnBySnhqR2xt?=
 =?utf-8?B?WTlkUkV2Zmh2WE9JTFFTWE5Vdy9Db1lXREpYUkRpRlFxaGh3UTQwb0ZCRVNR?=
 =?utf-8?B?RUh2anpoYnI4UU9KY3QyZGs1Nk85LzFiamdKMVZOOXBtU1BwMURmSE1HVXNU?=
 =?utf-8?B?WDFQNnVmUzB2WXNMUWdLZmpBRDhTdm1VaDZBVkhhb1RoTThrSWFZZW1lc0hC?=
 =?utf-8?B?Q1NFaWtPZTZzc1JaTHBtYnZhWEZFUk1VWmpoN3pGM09uZnJJcmR5bHBIY1di?=
 =?utf-8?B?WDZaZC9jMkxqSG04cDdSQWI2WGFzcVNLNHp5NWVIRUtKSWY5b1VSV3ltRUpk?=
 =?utf-8?B?cDZjSkdncTVxZzluUm1lcTh6ZndKRlFlcVRYbWM1WmsvaFZETWhBeEVibG1P?=
 =?utf-8?B?VEs3TkhLbmpvM1JYSnZVdDNVUC9jQmk1b2Zqb0VXOEJDdnFiT1g4eFBYL1B1?=
 =?utf-8?B?ZVNFV1BvQmJqbDlOMUlWUXptZlFVWnNoQ3puck9RR3BjeFZtN2FzT050V3Iv?=
 =?utf-8?B?eTBKMVdsaFZPRWNJQnJWRUVxWUd0Rks1amc1N0dVcVB2cVRiQVNYMk43S1Uz?=
 =?utf-8?B?dnFOU2N4RnlxYjNxRHlwaExhU2dXSG51SmxNVG04dW5aenJ0SlNHMXBRRkg4?=
 =?utf-8?B?S2FlUTVYT0JNMERvOXVLZjZoL1NVelpRem5DMWJvcm1LaEJIc2xtcVdQRE8v?=
 =?utf-8?B?OXZ4dkxoRFZHcXY2bzArdWZFOWgrR0p1eEI4dXV5YlZpUnZFeHcvZVhGQlR1?=
 =?utf-8?B?bFlVWW5teVJrd3BOT2V2VVRZVDVFem82T3ArRDU4Q1EyRVZnOVB1YmI0VXRE?=
 =?utf-8?B?TUFCRkhHZFh0dTYzTUV0alQ4NmNtTUhtbHFIOVV1WUxZQTVKY0NQWUU2RlYx?=
 =?utf-8?B?YjBpZGluQ3lITEtFUDdRalhRUytkbjF2bDRGOHdpaXlmNzlCb0grNUFORUIz?=
 =?utf-8?B?SzRxVHA2cTdnWVkxMVF1blZITTVvWGJEclZPRmRXVDZhYU5vdDltVit5S1Mx?=
 =?utf-8?B?Y3MwN01iMk5zKy8zTU5uQk1adFJyM0lNWlVLQmhiL3lvVVIxa3FnZjdtb0Jk?=
 =?utf-8?B?Um94MVpETThBUWxrRFZwZGtsdlR0NHNVeU5Fb1I3KzY0YzhYUGVFYXlhVzZv?=
 =?utf-8?B?OTZCaXl0UFdPRW5yNkJkVzV2eHRhR2JZQURlRHZjT2ZUMFMvRXA5TnMxTFJD?=
 =?utf-8?B?ODArU0xrVG1iSEpjUFhmMVZ5Vi9mMFFERDdJSkRWcFBiMWZXYVRkTGZPbExT?=
 =?utf-8?B?ckJOay9vT21BajhTRC81QjdyckhKbEttdndkekt0TWJ1Y2N3cVg0dTFkZFBO?=
 =?utf-8?B?WHRwcjY2dXZvU1FSNXlROWlVanJsWTFPcHkyNldHeXVxYWl1NmFzTHJJTEFP?=
 =?utf-8?B?WVZ0WXJPOHpCa2E4enlVQTBHOWE3U0RhVzk0QWpCQytHVDZhUjhiaHk0Zks5?=
 =?utf-8?B?SC9xRHpWSnllL215MWhWMXZsWVpKTFRQb3lUaTBqcUdMN0JHQnRuR0FHbW5U?=
 =?utf-8?B?RkpHNDJ0MC9tK21kbXlIR2ViTzlGSEF5OUlBMERvUzlRclJ0bWRWZ0FXT1ZU?=
 =?utf-8?B?bk1iVG9GUnFFeTk4aWVNSEZyMHhEeFljazJMTTdkemhzSEFDVVRoL0s5bTRv?=
 =?utf-8?B?bk1WQ0M0SmNYb0ZQQk5ndUJqRjZtTDNZM09neFRUdXQ3ZERCMTg2SzVUQlgy?=
 =?utf-8?B?aDJxeEc4V0V3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73872FC4D3D2F74292E438E82D827029@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6298
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	330952ac-bc72-4afb-b87c-08dd767a9ce3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|376014|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGw0cXFPc2xPTzNUd0dzNkowRTBxQTRKQklqMmlyOGdqMlhQVFVHYzAvUFB4?=
 =?utf-8?B?VTNEN2xSdTg4SmpkNUQyTUM0cFd2RThwUnpUYWZBT2RBeHlJSS8yTFdXWGxj?=
 =?utf-8?B?Y1dUTmN0RTZxZmJLN2ZRMnh2NllHbERtSEtSUXFLcGxaMFovRVlmK29ESG5O?=
 =?utf-8?B?V3ozQzIzUy9rSTdiUFBrb0l2Yy90anU4aE5MRmxxYjNvS2pzZGRseTZQME9V?=
 =?utf-8?B?emtTSlYrWHJtR0g2Q3YraHpYK2tsMHhmM29oWHgvNTZROEw4OEU5am1HRG9s?=
 =?utf-8?B?Z215cU5FQkVyM2g2S3BGSytHUjNaNkYrdndyZHR6QVBLanlwMm5Rd1B6WTB3?=
 =?utf-8?B?bzdncUZHd0ZWcFM1UExWcGtHZE9Wd25QYW9RQm1iOWJ3WHdXVnN4T2JsSXNC?=
 =?utf-8?B?N0RkRnlOUHVwYUZkeWFJazV6YXNyd1MrYi9iSEk0bUVvYVdJWGZxVDJOUmVm?=
 =?utf-8?B?UER6VjllNi9NRkVld2JWVVREdkNlUFF1OGpNV1FiOHF4MENqL3JpMHA0RFow?=
 =?utf-8?B?aHpGNFpKZkI0MVp6VUd4TmxGd1VhdDNma1llY1Z6OENGVURqN0daakVpaHB0?=
 =?utf-8?B?VnFGWHBKemZaWHU5UUgwVU1wME12QjVyUUR2UHE4cTQ4aDZqVmp1Yno4TzRr?=
 =?utf-8?B?VU91cmNMRFBRWFRpU2hvclJ1WGRKbGJyWjg0dTNiNGFrckRIWnlZbzdOVXc3?=
 =?utf-8?B?MHJTOVVpbWxyVE9XUFRjRFltOVZ6ZGtFdW9GVFFhUEtlMnh3emRuQkNVdzI1?=
 =?utf-8?B?c0Y2NTNobC92Y3E3MVROaE1WenplaXNBOUZFN0NYeDNNNWhVbWpaYnJWaStM?=
 =?utf-8?B?Sk9BcVByN0NSR1l4RFBGM1JJWVBOeTdaN2UzSThnWXZEZE9lUnBkT2FUSDFp?=
 =?utf-8?B?S0kyM3NtVVZtajVjaXQ5d1E3cDRRbnFuTTNjSm1uRmVtelFmQmMybHh5aVJ2?=
 =?utf-8?B?WGVDR1NGTGthNHZSbFBDd0tWQ25maDQ0WW84UUpuVk1FUm9sTnVvZWExVDlT?=
 =?utf-8?B?SWZManFzcG03amxaMzIwU09UREVEakhjUEI3Y09pM1hHdmVsL28rWlVGaytI?=
 =?utf-8?B?U2V5cjl1bFJxMDNiV0p0NkU5SjlkY1lWMWFacGZMS1VVTUdsRnduWnpDRFlX?=
 =?utf-8?B?MFhVVmlRS0tFVE5NT1diSGk4T083QkpjVWhvS09QaHBsTUE0UkVSTWRhNWpi?=
 =?utf-8?B?WXNBckVzRm5ESjI3eXBudDUrTkU3KytDOFJKYXg2SW9hQ2dnN1B1dWxKUmE3?=
 =?utf-8?B?dCtXdDRlZ0tpRVlHSjhmNnBOQ1YwRGphd1BKcGhzeHVuMzZnSHpDQ1RSZDl4?=
 =?utf-8?B?MzdWcWRydEx2L1RTazdaK252cSt2YlFMSm1mUUJlWjB4V2xqRThwUUpyazFC?=
 =?utf-8?B?clU5WlBhR2pZMGtMeEZOeGdlWkhxaVRDMzhkZUJuZG90TlZmeEY0K081WnYv?=
 =?utf-8?B?N3I3MlRoOWo4T3huOUhTdkF3TkhkL3pOM0YxSnkraDd3d2U2Wkg5Znp5UFNZ?=
 =?utf-8?B?ZDRtT3JIUnN3dFlMRmVtWlB4eVByRjNoRDVsL1JUSHI4SXJPeVJuZTU0QU5L?=
 =?utf-8?B?QWhodFNYdGdidU1SNWUvMFlLdS9YNHRXZkNyYWhWRmVJTXZBQ3FkSngyY0Rt?=
 =?utf-8?B?cG1IWHJkbHllV0FoTDN3V0FKU25LajVDQUJRelJQWnhBMWxNT0loWUNMVng2?=
 =?utf-8?B?YXdPZzJHTGw1aU81ZmMxR2pzWjlHMUlxeHhhMkp2VElRZUtIVXFjVWtRbnRF?=
 =?utf-8?B?MEd0U09DZWxlUGJLbVA5SGdzYldYTFNxdHZOSkZvRWNldVlDQUo1c254Szkr?=
 =?utf-8?B?c2NvVmVYOC9kdE1Ya1VEa3hvUjE5ZUNyNEhWUkJTdHFxdUdldi9kNkdNRXZD?=
 =?utf-8?B?NWpPaUZrSTZZV2crTFJ5eEU5dHRCMmcyNi9SeWR6aDV4RHFxM3VHb1ZSQlUz?=
 =?utf-8?B?Y3NkZjB6MjhpMjZkTEFLdm9oQ3FDc3YxVlBLem1IdThsWVpGdGJEYXJ5bnV2?=
 =?utf-8?Q?42jPA+Gj59ljGCEa8ZxrPJOAtulJA0=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(376014)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:52:26.4872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145778e8-22cc-415f-6782-08dd767aafe8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8363

SGkgQXlhbiwNCg0KPiBPbiA3IEFwciAyMDI1LCBhdCAxOTo0NCwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gQWRkZWQgYSBuZXcgZmls
ZSBjb21tb24uaW5jIHRvIGhvbGQgdGhlIGNvbW1vbiBlYXJseWJvb3QgTVBVIHJlZ2lvbnMNCj4g
Y29uZmlndXJhdGlvbnMgYWNyb3NzIGFybTY0IGFuZCBhcm0zMi4NCj4gDQo+IHByZXBhcmVfeGVu
X3JlZ2lvbiwgZmFpbF9pbnN1ZmZpY2llbnRfcmVnaW9ucygpIHdpbGwgYmUgdXNlZCBieSBib3Ro
IGFybTMyIGFuZA0KPiBhcm02NC4gVGh1cywgdGhleSBoYXZlIGJlZW4gbW92ZWQgdG8gY29tbW9u
LmluYy4NCj4gDQo+ICpfUFJCQVIgYXJlIG1vdmVkIHRvIGFybTY0L3N5c3JlZ3MuaC4NCj4gKl9Q
UkxBUiBhcmUgbW92ZWQgdG8gY29tbW9uLmluYyBhcyB0aGV5IGFyZSBjb21tb24gYmV0d2VlbiBh
cm0zMiBhbmQgYXJtNjQuDQo+IA0KPiBJbnRyb2R1Y2UgV1JJVEVfU1lTUkVHX0FTTSB0byB3cml0
ZSB0byB0aGUgc3lzdGVtIHJlZ2lzdGVycyBmcm9tIHRoZSBjb21tb24gYXNtDQo+IGZpbGUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJA
YW1kLmNvbT4NCj4g4oCUDQo+IA0KDQpQcm92aWRlZCB0aGF0IHlvdSBmaXggTWljaGFs4oCZcyBj
b21tZW50IGFib3V0IGZpbGUgbmFtZSAoZXZlbiBpZiB7bXB1LX1jb21tb24uaW5jIGlzIG1vcmUg
ZmxleGlibGUgYW5kDQp3b3VsZCBub3QgbmVlZCBhbnkgcmVuYW1pbmcgaW4gY2FzZSBhZGRpdGlv
bmFsIGNvZGUgaXMgYWRkZWQgdGhhdCBkb2VzbuKAmXQgaW52b2x2ZSByZWdpb24gbWFuaXB1bGF0
aW9uLA0KYnV0IGF0IHRoaXMgc3RhZ2UgSSBjYW7igJl0IGZvcmVzZWUgYW55KSBhbmQgcHJvdGVj
dCB0aGUgYXNtIG1hY3JvOg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KDQpQbGVhc2Uga2VlcCBpdCBpZiB5b3UgY2hhbmdlIHRoZSBjb2RlIGZv
ciB0aGUgYWJvdmUgY29tbWVudC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg0K

