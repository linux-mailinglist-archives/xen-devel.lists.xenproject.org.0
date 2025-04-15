Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85570A89601
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 10:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952268.1347769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4bIm-000262-AR; Tue, 15 Apr 2025 08:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952268.1347769; Tue, 15 Apr 2025 08:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4bIm-000247-78; Tue, 15 Apr 2025 08:05:52 +0000
Received: by outflank-mailman (input) for mailman id 952268;
 Tue, 15 Apr 2025 08:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN3i=XB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4bIk-000241-Ut
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 08:05:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2606::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71913cd9-19d0-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 10:05:50 +0200 (CEST)
Received: from VI1PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:803:64::31)
 by GV1PR08MB8428.eurprd08.prod.outlook.com (2603:10a6:150:81::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 08:05:46 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:803:64:cafe::61) by VI1PR04CA0096.outlook.office365.com
 (2603:10a6:803:64::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 08:05:46 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.4 via
 Frontend Transport; Tue, 15 Apr 2025 08:05:45 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 VI1PR08MB5407.eurprd08.prod.outlook.com (2603:10a6:803:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 08:05:11 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 08:05:11 +0000
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
X-Inumbo-ID: 71913cd9-19d0-11f0-9eae-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B8tqpv8v4mYrWgWu2nCvEjTlo8tV865OAyQ5owHnzvl4CYeFJAq67WCqMiP8HwWoyIBHroso7lyex239ATNvRKhjUP0WIkJZrEJw8IFoHfwhjcarO4gUvVhPG0tbPaDhah5uyCS8ny48v7GU+epA22pOa5vJmALfixhQNUVtnzK9yukEby0/gYX+Cna3BHsEug670uZMJBT8Giry/Oio9N9eOaC4FyvlK2U1lzf9EARwTYA34qmkWvVOy/24jzozGkpf8pMnlHBx6iksBM5AGXVpvLJc5lY1BzAM6TaGakFtmc8z/aB5gwmzvDPX5xpFggPmrrObz4215fNUXRmEDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaWDn4iDDlTEs0Pclth1cnKrwDbmmXYItFew+jw/xMg=;
 b=UE2xFghgZasIXVKIwaFkQK9ujAyRmLqkvMCKusUigN88i8q9kcv6S2t5mqwYDQNPHPs0yja9tXI/rfvrhZrXX0xkSdhHT6OHSOONKBAITgqfmrrAmvg05UGlkmqGTAiJ+UL8uQmWFbzRGl1FwsRMCuuMWqmL/2SDxLlor1B9JJtCKIu0NAHpxcyZpCN2ezHv5TAzhmiFi6j4C67OZvkGWD3Twfx6VUUhLdGZ8UO7TKihhZSe5Nww5FHpmzGHWDqCPXT9Gxac/JRx9gKKWhaNMRCAoxnalHcJFjqhihgpxZmSz60xdumabwfQtyJIzJ5fcX/ewDJnwUOZu0ik2Zzi0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaWDn4iDDlTEs0Pclth1cnKrwDbmmXYItFew+jw/xMg=;
 b=Yv9dMgyTx8DrsvJPLUYHF7Yx8TYV2AYgjGR9k4YWx6EoVPC3g/633XLsCTSUXOzQMM+YgXO4FgXvrAkvhpplCZlHGIx7RB1xnu6Lgyf4ieoK0HRpz0kbQoIzkq25nWeeoW8SzfuaTg84hmzmQTtwbanNApu52isKdWkfnNFFoCQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNxTKawULkSRywT3Kk9jq7Ui4qDSKGdHNNXTouF16ZqYH9rHfXK/GsF2QgZN2X5Ak5hUWBFagPf3bN2e/bhN6vrMB8pE79b3UZA3d8SpPAsMiLMWEVX2v4SCf7mq7TDp3UJ8soxi54JNYi2UWJDSeMncU2+26TCXk4gSpsXr2MbSLHPf0QzjIYss94wWMkBqmloMp6GWQBrG976K7UQ0yo7Vmlp88/laY22qg6TZawTLeVrEOTLaXtG7BJvWRdlhKtf9ALsX95A58HXODd8KW3OZ7LJ3wCmCLIH4LKiEjlYmAq0VTgjP6jIqUzF521ozSfOG7UocLsbGhbfajsIxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaWDn4iDDlTEs0Pclth1cnKrwDbmmXYItFew+jw/xMg=;
 b=rSkn8+YrDHmv1B0MPIpjr5ivcVM4lG8jUqmxBZgZBNSZWHZ8vCP73jIL2FUAbvRxy48oHSNtng2xKx/DJzChAMiLDt9m8/zaBViMF5DESfIFcrRxWgCgyiJLN4NxGzv1W9M1vWw6nqswRpG9UhBUjJTkCnEMwJO5M7MkFOIZdxBVykOu6X8BRYp35DQ0PtV6dC4zR9TF+/padjM9RfLQgmsIyZkW1zyAkfSRNNfDkIFFba3KffGg/qyYlKXmSTeZlode+KBgfI1H2iPVbFdH+Jn7QFQ5tJMHMrlrnz15Q6/ltRMKjl0zxRh/cuvR09/COOUpSN8F2n3WlxcLMdI9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaWDn4iDDlTEs0Pclth1cnKrwDbmmXYItFew+jw/xMg=;
 b=Yv9dMgyTx8DrsvJPLUYHF7Yx8TYV2AYgjGR9k4YWx6EoVPC3g/633XLsCTSUXOzQMM+YgXO4FgXvrAkvhpplCZlHGIx7RB1xnu6Lgyf4ieoK0HRpz0kbQoIzkq25nWeeoW8SzfuaTg84hmzmQTtwbanNApu52isKdWkfnNFFoCQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Topic: [PATCH v7 0/3] Enable early bootup of Armv8-R AArch32 systems
Thread-Index: AQHbrVy2FcewxX2o4E+UbqBiK1+l+LOkX1uA
Date: Tue, 15 Apr 2025 08:05:11 +0000
Message-ID: <E38BD6F3-8A62-4FF0-8CAC-E35F4B518CDA@arm.com>
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|VI1PR08MB5407:EE_|AM4PEPF00025F97:EE_|GV1PR08MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b290ecd-199e-4d6e-ed42-08dd7bf4530b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ekhOdDhpUzJCaHhVb0t3Y2JlcVM0Y0UvenI5dk90V3NMTXFMVFhDMTJoTFps?=
 =?utf-8?B?bldnNFFQUDBnem1vc01mUzJkbHRGVTFEdmR3SVBKYmpnQjlQcjg3b2dJeDhW?=
 =?utf-8?B?TW5QZ2ZzOFJ0cFN1cVJEaStIOHpacndqMU5Wb1pqQUVSVU1hTlQveWwzeDdS?=
 =?utf-8?B?ZW1VYnk1cDFFKzFlNFBZY3RmYWpxN1JJSDZsYkJTU3JyV2VJMWpHcGxWTjhh?=
 =?utf-8?B?bkt0ZTdXSklsaUZWUzZRcDJqZzZ0dFFRa0I0ell6alBZb3Rwbmtud0tqY21Z?=
 =?utf-8?B?K3hnU2xmZVVyZlRBY1FsQS9PSmdsM0FycUdjKytya3Q2Yk5zOEJ2c1hFcXRF?=
 =?utf-8?B?bUNRVjdCMGZWSVBwaHB2eFIxQkp5VUNqRWcybTc0UkdFNHpXT3lnQkMyRXVw?=
 =?utf-8?B?bVlVeFBFSjY2NWw0eTI3eXBMMXZyZUNQelhiTExGUkhNcEhJMjl6VmtPalZ3?=
 =?utf-8?B?MDdIeEJNUWc1cE9rQ3ZCMTU3c2xLdUV5OUR5bHRzYklLUklwSnlJN3QyVmc2?=
 =?utf-8?B?b1doTldkVnFKTnRrSG5nZnFwbjBiZm9rYStQMmRJQnF0NUhpMjZQQmtOOStp?=
 =?utf-8?B?RlQvVS9BbENXTnlQL2tacXBUdmM5WVNRb1lkSzg3TXRtYlVvdUd4ZHNUTGRN?=
 =?utf-8?B?aGd6endHM0FDbkxzNDZWWW5ZK3IzdStkSUUweHZ3aTEySEh0NUMranVCV2hz?=
 =?utf-8?B?VG9zRzI1cklNSVEvNXV5bkNpc3kzeWxLU0Zza2pPbWxDNXFnN1J5ZG1JVnEz?=
 =?utf-8?B?clc0TG5odXRIeDEzR1JJQmYzM2tiKzNJVFVkOVY0aTN6ZDdlZXkrbFdxbXhx?=
 =?utf-8?B?OTlSU1NpanFlNi9Gdlo0aTJzaDQ0SXVQYm5pM3h1TDN4ck1EUFdSVFcvdkRw?=
 =?utf-8?B?QW0ycWtmRnpUVWRXWWMvWjQva25OSWRzMTRNR05rb2o4VXpPQ0k2bGV2S3hk?=
 =?utf-8?B?emxsclZzM2dla1U4eDlESm5iK0VITzVWeGFxTmNiOWVxQ3NJUE96b0hPS2Rs?=
 =?utf-8?B?eklBcHJkTjM2K1g0OWFiYkxCWXhKdWVSWmRPZW9EOHJpNUhYZWhxNzlydElh?=
 =?utf-8?B?L2dmZlArOEZZcFhVZmpSU29QbHBnZTlCaXJRMTI3UXJsTFFTUDV1aVVxWWsw?=
 =?utf-8?B?dVBKY2ZNM3ZjU2h2RnpvVS9PVGQ1cWt3OWlqNlhtRnVyT2E5cTI3MXQ4T2Z0?=
 =?utf-8?B?WDNnTjM5Q1BIRk53djFDV1NEWGtpK3NqdUg2VitHNTlIbnFrQWV0c2pKTUpY?=
 =?utf-8?B?VkpIamtBV1RjTVQ5ME1DaDdsN1N6TVNuSDZtVWd0NzQvczhkbWtUWVVKWUhB?=
 =?utf-8?B?ZTg4aGVWYTE5RHFyUWQzTWZNYWJFbG1ycktVci94cVBxU3JLbzlaTVMvUjdi?=
 =?utf-8?B?dVhzViswS05CK3hMemF5ZFFrY1RzdndtVkUrZkVMWkdnZVB3eklxMUd5WmFr?=
 =?utf-8?B?dW95Tk4rYWFFRXo2RHIxNTEwejlFL2tOSXRGdkJHNmVtMUMyNHoydi9OUDZy?=
 =?utf-8?B?QWgwK0ptRzhoRU9IQ0FoYUpxRFR1Z0pXWERIYmhLS0s3SGg3c1ZGY1g2cGhX?=
 =?utf-8?B?MkYyTGhyY3NGOUtrc1VyTUlsQVpmT2pYZHVGOFFxVzZJVDVTQmEzaXEzWUVY?=
 =?utf-8?B?aTQzdDRiODJxVjZYMCt2WVNDRmtqL3YxT2hGY21pbVF6NjZwcHZJS29GU0FB?=
 =?utf-8?B?T0VKV2M2Mkp4OVhxWUgxNWJwWVkzelBjVFZsVDdCc0Z3ZDUwdlpKdFJ1ZWRl?=
 =?utf-8?B?SU5ia2N2SHNFN2hJTlZqbGVwVlQ2Yk1JeFFIYnFJb2JDTmtoMHVrdXpTaGlC?=
 =?utf-8?B?Z2grcy9WNkRUdjlQdnFSYkhTcUlvaXgzSTcvRGZFMDl3d2xlNE8zWTBua24r?=
 =?utf-8?B?T291Q3Q2U0Yzb3pxMmdTOXErWlRKeFNpM2JEMGFLa2dxNWpHNWNjUXlGYmox?=
 =?utf-8?B?Njc2QVc0VjVRWWlpSTliaU9rWVJDYzNQMWdCaXV1ZTVmcWpBQTlVYnByQ0NT?=
 =?utf-8?B?OVpLeFVMd21RPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <997BA78F72E7044787E72EA1AF62174D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5407
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18acdc00-4393-48c0-c813-08dd7bf43ed6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|35042699022|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1ZKNk04MjRVMXZpZkNXSXY3SFRMcjQ5L1J5d3lCV2hJUi9vQVJYSHdyZ2pL?=
 =?utf-8?B?WUhONzQweTNqZU1MTGxwZVFENWpxUUM0NWlFYnViS3JBNTFZTnAya0lrRlhK?=
 =?utf-8?B?cXZzTDBoYms0aVlVL2pnOUJ6VUdnSjl0b25CSElZYTdxSXpIWldyOE0rem8w?=
 =?utf-8?B?TWV2RlBGakFlWXphdDVCR2ZTbnkyVjNZMVpXZGtlNG5HSHY0T24ybXBCTEh6?=
 =?utf-8?B?NUZyamNsdmRZRmN1UjRLaW9ucEYvazhtb2RzVGdJbDlBMHUyOTZyby9MZWQv?=
 =?utf-8?B?K3FiNEoyMVZ0NEZQdXRmUFMyY2Q1U1RmT0tWVU4rMXBuTERnMURhTXpGS01S?=
 =?utf-8?B?SGJyNXo5RTdmNFk1M0lWV2VybGxqRG9raHZ0TVlyUEpob1psZ3RCeURoa3Rw?=
 =?utf-8?B?dTh1STdvQjMvRVVjeWRieFZ3NUo4TEhpWTFNVnhwSzR4OUtVSDVLOFdxTGJh?=
 =?utf-8?B?L3loUXhvbFdnQ21ITDkrVEt1c1k3QSt6YVYyelNReTJxRmRPeHJKY0xROU05?=
 =?utf-8?B?eURVZkRmOVVPZVZHTDBsR0pXa0ZLdzFVbU9LTlJUbXpTZTJjUlFJdW1JaTJM?=
 =?utf-8?B?R1hybzArZ2kxeEt0ZHd0RlBabmlsWnBWdWFJcFl0aWdUWFpRcVpRSWxKd2ty?=
 =?utf-8?B?TlkyZDdUTkZsOUtOVlozTXZaelFvV0hxTlJTTTM4Y3cwcTUwdlkwK2l5VjE3?=
 =?utf-8?B?QVZHbVZUMTYxRzFuM21jZEFpN2FxdDNNVGQwbzZUN1c1SVpDSlRhMTdwajdH?=
 =?utf-8?B?TnVud0VaK0psditNb3pzMlNIVFlXRWtSc2xkaG1uWVlPMUVGeEtUQU5HWFNB?=
 =?utf-8?B?TXk5SHpqTUR0YUJvL3E2eDJoSDFwYjM5cTk5WHhiN21vejNIQndWeDk2eWty?=
 =?utf-8?B?eU5yUTFxM3ZTcUtRV3VndjNCZUR2clBpTnZNUHppNWJpQzdqbWxUQnBmRXF4?=
 =?utf-8?B?aWx4OUtqL1MycVFzM0lGd0pZNUVtanNCcWVFM2xCVTVFbVJaTU9vQ01mYVh2?=
 =?utf-8?B?d0ZSUWRGZTlFb2xMczZ4UG5lRklDOVZ5NkVrTENFdndQK3NQS1dVK0FYOHZ0?=
 =?utf-8?B?cnBlWlRianBmL1g5T0pTeG1MSXBPWE9TdWlaT3F6TEYycGhuVjB2bDhIMDlY?=
 =?utf-8?B?VzhFd1kvSERLTzZqWDJVTHoyRjhRL0o2SVpRZnpXUEtxTTVJN0xyUzd0S1Ny?=
 =?utf-8?B?emxhb0Z1NEZBV01ZYUcxY3pIYi9JMUF4UHRIOXdBRUFBdTRvUUJUU2twVDRr?=
 =?utf-8?B?bmtMeDRleUlhdGRtV1V0K29HRTBabmxReldnc0Q0L05WWm1TWWN6MFh0cWpJ?=
 =?utf-8?B?SXpnWkR1Tm5EcCtLWGxseWR2SWZpREViOHE5bEhXTmgvanZONW9mZzhVT0xs?=
 =?utf-8?B?c3FJT0V6aGJoelBvR004RWsxNkhGc3dZNExTbmdWR0tvMVZCT3VzZlJTOGR1?=
 =?utf-8?B?RjhtbVZ0d0N3SU1Qcml6cDcyb2VLRStQVElJb0ZtMHBLcEZ0MVpMd1RZbi9O?=
 =?utf-8?B?Wi83RWNCMWYzTXQ1S2xVRnBPcGtxdjJWL3l4eVlGWHVnc0w0RWxNdGsrMHlU?=
 =?utf-8?B?RDRVam5Sa3k0MkJ6U3lKZ0FwcThsWW9TQVBQUW51TldCR0o2akc2bSsvMzkr?=
 =?utf-8?B?WTk2eFE4d2R4VjdkWDNwWEpBWllyclpkZmZZb1NibUdNL25XemltNVQrTStN?=
 =?utf-8?B?WlVoYkUxR2Q0VHRBZmFQS1dMSnVvbmRVNFFjdWJNQ0VneElyYXJpVTIyOUVs?=
 =?utf-8?B?Q3NyeTRYMWM1c0RyRm9jdHFCTXJVZE9nak5OSFJaS01iUTF0eEZtOUhLdFR6?=
 =?utf-8?B?emxSNlB1VEpyaEd1UEs1T01lVituQ09TcldodTJrTXo4REQ0U1VjdUQxb3dk?=
 =?utf-8?B?aWlnU0RHWkhISW4rWEpWdm1xSHIrUUUzVzN2MXFiVDY3V09YMGw2dC90Zmtw?=
 =?utf-8?B?VVBLc0YrOTVWbHoweE54dEJqbS9nOHpuZmM4RVVlTW00bUtZZXB2ZU1kUUxB?=
 =?utf-8?B?WnRHck9XbERmQm1oaXY3enBBSHR5bXY5U3BHYTMvcTB1a00zNHNHd1FvMkE3?=
 =?utf-8?Q?z47kiV?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(35042699022)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 08:05:45.1105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b290ecd-199e-4d6e-ed42-08dd7bf4530b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8428

SGkgQXlhbiwNCg0KPiBPbiAxNCBBcHIgMjAyNSwgYXQgMTc6NDUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEVuYWJsZSBlYXJseSBi
b290aW5nIG9mIEFybXY4LVIgQUFyY2gzMiBiYXNlZCBzeXN0ZW1zLg0KPiANCj4gQWRkZWQgTHVj
YSdzIFItYiBpbiBhbGwgdGhlIHBhdGNoZXMuDQo+IEFkZGVkIE1pY2hhbCdzIFItYiBpbiBwYXRj
aCAxIGFuZCAzLg0KPiANCj4gQXlhbiBLdW1hciBIYWxkZXIgKDMpOg0KPiAgeGVuL2FybTogTW92
ZSBzb21lIG9mIHRoZSBmdW5jdGlvbnMgdG8gY29tbW9uIGZpbGUNCj4gIHhlbi9hcm0zMjogQ3Jl
YXRlIHRoZSBzYW1lIGJvb3QtdGltZSBNUFUgcmVnaW9ucyBhcyBhcm02NA0KPiAgeGVuL2FybTMy
OiBtcHU6IFN0dWJzIHRvIGJ1aWxkIE1QVSBmb3IgYXJtMzINCj4gDQoNCknigJl2ZSB0ZXN0ZWQg
YWdhaW4gdGhlIHNlcmllIHdpdGggdGhlIGxhdGVzdCBjaGFuZ2UsIG5vIGlzc3VlczoNCg0KVGVz
dGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0K

