Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA9B01B2F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 13:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040799.1412102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCJ4-0001m9-Ok; Fri, 11 Jul 2025 11:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040799.1412102; Fri, 11 Jul 2025 11:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCJ4-0001j2-Ld; Fri, 11 Jul 2025 11:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1040799;
 Fri, 11 Jul 2025 11:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5XY=ZY=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uaCJ2-0001iu-BF
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 11:52:44 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d848f38-5e4d-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 13:52:43 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB8570.eurprd03.prod.outlook.com (2603:10a6:20b:573::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 11:52:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 11:52:40 +0000
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
X-Inumbo-ID: 8d848f38-5e4d-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPqAcgQMse4UUTA6EZ+t4RyeffZH60j4OTPbvJq1rCdVvUg55ZcDFZZAYhskYl/B9/NpUnNWURFzrrt9TFtaCIF+LMKmWIyqcHpQ2KKsTTT6qDro6pnnTCdJGjoeufrJbIgGN465zmL63DkjE/rIDOUwpabjG+Rq9pTuUABeVhKvYR+M1jjK7FL7euURdoYVFfWE1QmCDPKuNATNmXy4+k09e+TdNLaEJ36K/heWwpQmzYA7b4MYtr8EWhA37WzM49pBVHtC/7eyRHjOd6OlfzMJp9DzK3xvVu86j/VmEzVGYXeuElAzUkf4lLlhce/gLFPvA5pUWcYKPUTvgbVpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGlg/ic7k5PoP8yMhjTfN8rOoU4Z4OZQd8SmQ3FK/fc=;
 b=mNfgLSuJf2jGTSfdg2cVDBDy4XMMeLfYYBMVxKIkdyzrTqv7xx3J4kFRV57N17ePsxbxVVjQlKwajbVfITk/edewUaVSnZu7Ir2QnhwKrdO0jvdp/0sL/N5Bqor8OHDShBbI9VmeGl4n/SMNbNoPRrQ5CVGJWnyPFNx0XcRPjuVgeGOUHmNp0lf+YetBwMeXy46Gf7zjC/apj6AraMce9XJ/tDJAgZk/3MKiP8A8XVCRC8HzdJmI10bdrL7PVez0cePThdV2WLdZgV7rBz33hi/YIL5N/1X42n8PjrseyjcsnACHnQt7qMXCvl1Pzge80Xpd7gZWw3K0kZZiUrhtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGlg/ic7k5PoP8yMhjTfN8rOoU4Z4OZQd8SmQ3FK/fc=;
 b=NH4XVSzQfWsrPi+Mu+NASVrV2x2EnunU9bvsitQevmmolf61DIninbnUMC+pZvRSI8RZ+PCigmZwYIFzqAbZYg1+g/Wyu6jAnX1jVtW5u2Z+RQnei06IIYCX+sD1irZ8lt7+zOuGvw9mrYtK6PPW8uUT5xex4jgAUGrHva1g8qGR2ZmckWd9xZH2FaAE+xURHSHZSGPluZPwGuWJHBTMm76Z1EyU63Fvp6Zd/IYI2F2GCsQOrloxnrjDd+1RmI8pzmchKQ3S1gyAS4LJQU0ciqLVjgiUgK6pSJoqZgfSGhDmQaJwQBXPXROleidlMFhDjwe93TUJSDA3gf/tBtQ5gw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb8lj8U0c0yIOr5EqfSUQdGwVgzbQsz+YA
Date: Fri, 11 Jul 2025 11:52:40 +0000
Message-ID: <03612a12-e905-4487-a05b-a5307e450308@epam.com>
References:
 <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB8570:EE_
x-ms-office365-filtering-correlation-id: 5b106ab4-1a86-404d-c252-08ddc0717043
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|7416014|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Rm1JRkFmWWxDRHJDTmFtWTdRdFlESGM3cS9zRTRGcWk5bExpSEtNdEZ5SmRB?=
 =?utf-8?B?NHlSWlpYYnBKZ1NWS2JLQXdPU3hrQUU4NXZucFpjU1FqSW9TcDZYTytJZ0pJ?=
 =?utf-8?B?ZEtScjV2U2t4bjdrMEUwMmE5cGJhbXNrWU9DaEVxa2NxaWxGSUJhdS94WU9V?=
 =?utf-8?B?elJZbkhYNVRlL29hSERIRzcwc1RkNmorQXBheG96dXA2YXFOcjF1VlA2L253?=
 =?utf-8?B?Ums4ci9DOG1sLzNpaWhPYjdoOGlpdzZyWThQZk5jMFJrTWhvWkh0MlNoVStW?=
 =?utf-8?B?bnU5RlhFdWo1RWpZcDUwUzhMZHB2Z1EwWmc4cWt4dy9IdXZUSVQrZWRXWlU2?=
 =?utf-8?B?R21oeGo3K010VHMvZURranBNWXZRd0Z0MGtwSzJueWRpYUpNRCt6ZWhZb0tu?=
 =?utf-8?B?enBCZ3hWa2Q5QXB1Yi9lTWtuSHhSNE02bFJFMi9hWHFkZUgyL3BZcFVySGt4?=
 =?utf-8?B?TDljVTZLbWw4UjJGSVkwUm8zcnVVZkRMMnRZSFgrVnRKc2p0V2JmZTdWNlJ6?=
 =?utf-8?B?dlJpUXhTa09DZ3hmQjBOdTFJMXp4eTBESnN1WWVveGJOZUE4UFBrWUttWS9y?=
 =?utf-8?B?c2FIeW1HeUVpWUNDdFE5aXptaHhEOW5PVkdmRzUwOTVjS2JaZ3lmckFodDlo?=
 =?utf-8?B?eGg5MS9jWU9SMlVsT1l5QWFjclBKdUhXRXAybU5xZ0dzeEJnRWFPVmJpaTRY?=
 =?utf-8?B?WjA2dlZpdzcxTmxCazUzMUh4SjgxUmxwdHRDcHdLTlVDMVRBR2ZtdmRSdXA4?=
 =?utf-8?B?bHFMYlVPMzBGTWQyd3NrRkFyZ3VYUVZpeXhlNmJFQmxycnNtKzRMOFdRb2FC?=
 =?utf-8?B?NFhTUDFIV3M0dDZBOUJXeERmbHE3cmVXNFpWN1J1UG5KMnp3YkUvbE5BWjR3?=
 =?utf-8?B?OGZvUjhoc3VCYldsZElJVmFPbDZQUXVXNTA3T3h1QzE0UVh3UU1mUWRtQjAx?=
 =?utf-8?B?RG5zSTJEWWlKRDZTTWdPSjBzNi9VKzVmVzFxNUtGVjdCbXNDeUZ0b3lEeDdI?=
 =?utf-8?B?NXRUUG80MjYxZGlhZEV5cU9kM1J3cmtKOEJFUjRBTHEybENPRk8rWTJSWTc2?=
 =?utf-8?B?SG5oODhhSFNRcnBadUpRSXRiNS9waWh6Y05oNTJvMzB5ZXE3bC9tOTV3WWZC?=
 =?utf-8?B?NGdKK3BUNE93TERGdVgwYjB2WWhWRk9scUN4dmpUd3VkcjNTem1tbHkxUmdX?=
 =?utf-8?B?V1dtRUV4dWJBMmxTajJEK0REKzl1VXVDeGNvNHo1V0w5TUszN0txcGVEOEEz?=
 =?utf-8?B?a0NmWHlDREVwTlkxWXhSRDVheXpHcVk0eTk1cXhTN2d2NlVYR3psNXhkRFg3?=
 =?utf-8?B?cStDUnpnQVlndTV1U1dOK3oySFNua3QxaFllazh5NHNJL0s1OGRKeE45bjRW?=
 =?utf-8?B?RE1NeHNOZlpjMGUzSjZQMUVONEp5Q1J0Zk1iWWUvSW1pVy81NVJuQVpZUVZ5?=
 =?utf-8?B?ZkdiczJxaXNSVlhPSWlDSWorWVlCdXcwbjJyQkoyTk9SYlpJNWJ4Tkk3cVJW?=
 =?utf-8?B?alhrY3RlVEJ3akE0V3lwaS9lMi9WSjlkTEN5U3lqeVJwVUJNQVdnMjEvT1dL?=
 =?utf-8?B?eEdRRy8vMEkyd3JnclVjRE9ROUJvUzY3V2EzZ1Z3b1AvbDdMaXl5MFVrZ1VC?=
 =?utf-8?B?VCtXVVg2R2ZKOHhZVjl2ZG5KQ1MxOENJNmFnVUtYMHJCZXZncFBSMlhHYkJw?=
 =?utf-8?B?dmM0VGxISDFOK3ZpWHVpWXF6eEpyeHE0d2NaYVJ3NVg2Tm1yVWFPQ3lZU1Jj?=
 =?utf-8?B?cHgvTzkrOGpRelZHL1BDTVNJdzMzMjRlQmZZY3Z5bWNQOGZwbE55R1lxcHJs?=
 =?utf-8?B?cG1ERndKV0o4TjVyWnU2Q2R2eDdXczMvS1RJSHZkK2VNdXpPNzk4UVNRWHd6?=
 =?utf-8?B?SzFUVStZdDlzMUJJMnRjUHRSV29wZnU4aXRpRG9xbkwxM05NV2htVmN5dXNO?=
 =?utf-8?Q?pNrRnkPdxwA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(7416014)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjZSTFU2OUZ4OUlXMzg0NnRRWllERlFmMXlYZHUzbCszd0JnWjhLMUp3cGFK?=
 =?utf-8?B?SUZRWnhqR2h6aVpQVkNncE5XQ25LS0tPblczT1p2MGxVNmV1cnpiN0VkRnRm?=
 =?utf-8?B?U3Y3WkxwZndDd3FwN0w0UG5DdEdBaWw4RmVOc09mTk43SHo4UEMzbFFLLzI3?=
 =?utf-8?B?MmkyV0lLblk3SGQvN1BLdTZRS0R5OUhaY3JoZEx5NzdSQ1lvNTV1T0VBaytn?=
 =?utf-8?B?b1BYTDhueGlEdm4wVEhTZmppREo4QVhYeWZLSXp2UFl2Y2pnbUF3MndERlcw?=
 =?utf-8?B?V1RuRjdhR1JBQ2ZDYndjQUFoQUNZZ3YxR25kRit1OGk1TjFMMThmS3NGcy83?=
 =?utf-8?B?eDlWVWltTG01K3lSc1JTSUwrdCtKTTRlSU4wQ1VybUxYaEd4Q0NqaEY4QzlN?=
 =?utf-8?B?Q25qeXJvTnh1eGoxVDgyeFV6MndYalJOZ0svbkNVQzFOME4wTGMyV1pCeW16?=
 =?utf-8?B?dSswenRWTC91MFZVR1d5MnJzdnN4Q2s5dlE0SEpOVlNSUDdzUWRkcDVvZ1Zi?=
 =?utf-8?B?ZU1RMGQ2KzZpUjEySGkxYjZJZjJtZUVpVFk5SEgreVNuczk5c1ZtV0RJVERB?=
 =?utf-8?B?bmFNcDQ2RTRuODJpSVlhaUE5Zk9LYzEraXdZSmtBN0hISVdPWlArcVZYU3lG?=
 =?utf-8?B?bml0dG9KazlOQkNGR256RFptb05YZjFRN25mTDhodXFRRFFtcVllNGxOYjVK?=
 =?utf-8?B?b1U3K3QvT2I0Qmd0dFVPQVlyekNGcmpNTDJtYTlSZWs1Q0RCTXMwK1hRWGFY?=
 =?utf-8?B?SE5pU2JRd21SRTYvbkkzN0VVZzB0SFdvUzhDZkVZZ3RCb2hTc3NtMVp0OVJJ?=
 =?utf-8?B?d0tqc2IzMXo0TDFwQzg4aXlsREJYUTRGN0Nsd1BCVEtxa3htYjF1am5ReEtP?=
 =?utf-8?B?bWRUS0pBRWFaSmZKWUxvKzRrWXdGdnhoVW55OTVQUzdNTzF6by92bzIyeTkw?=
 =?utf-8?B?clcvS3V5dHJzd1B3WkJqSUxWOTBLME9Kb0JraHdzb3BnSFd2U0cycHM1NHhm?=
 =?utf-8?B?L05IaG9JSVVsdXZEeDRYL3NFOUwzZHAvSFJjZitEV2htdE5MNkJtRnptbEs5?=
 =?utf-8?B?SWVWVWlEZFF1ZG5VdUloRlQzQkVGeE9CVzBIWW5MQ2hxM1o0SVBhamF1WUVk?=
 =?utf-8?B?aFhYcTRRK3hZN2MyUDNsMW1hU3JiT0lKVWVZTVhzSG02WmNBdDFuN2RRV1Bt?=
 =?utf-8?B?TmJmci90eUtQWm1TKzh3Rkc0VTJmL2xQV2JKV0kyRmRuaTJkb1VDc0dHdzVm?=
 =?utf-8?B?MTFWSG1mTitHZk1jUC9jU1FhSVluOG5UWEROd2dVeDRDeVY4N3RDdUtxM2lz?=
 =?utf-8?B?S1FSN2MxeXo5QlpiMzJwRDRUTEx0SkNpN25XZEhpTFVRZlJ6VU1RbkxRcDNj?=
 =?utf-8?B?QVp0NUxIK0I0UFJiVlhnaDZVNG0zVk04dlR1dmpPSStFS3BjbmtWclQ4TGJ6?=
 =?utf-8?B?bkllMkZLM0hRWkRPeUdsZk9ueERwU1BiMVZSNG1OZ2R0S0JJU0NmMmxDb1VJ?=
 =?utf-8?B?VTNQOVJtbmFIM2d0L3dPb2g3NmFQOW81ZnZtYXZPWjA4YW1tRDZMRFVBYWYw?=
 =?utf-8?B?RXpvM2d5VHBiM1AyVVJiZmJuanNyRDl1TmJuSUZnVUh5bVZtSGNTd0NHVElN?=
 =?utf-8?B?bU1tOTBtTDZvNEhmQW5DdnNnQkRmRDRUUUhVVWx4QWEyTXM2TVE4Z2RjTGJ1?=
 =?utf-8?B?OC9nVXlDN1RvM2txdUtlaldCSU1VUFhRVys3QWFsbklURm9GUDUrZmRIZko3?=
 =?utf-8?B?cm9RUnM2SENVT2JDRExmeitraTB2dnRzRGMzUWREK3pYcnFoSng5YnJsVE5H?=
 =?utf-8?B?NHlvNTlLbmZnMVo3aW45ZnJJdFJsc1YxVzdIZ0lpVzRTRHJwNUp0TnNHL09l?=
 =?utf-8?B?U3NKQVB1bmF4V2VRYWUzNWtpOWU1YmdWR3F0aGZSNWpNWWRyb3hIKytLRTBU?=
 =?utf-8?B?d0pZVlh0VFE1MmNFQnBrbFdSSitZMUpBVjhmd01XZ2oreFpMclBQRER0YWk3?=
 =?utf-8?B?ZFFPZ25jNHE4WkFZTGxDaG9ZbE1RZ09MVFdCYWoyN2FVanc1cFc4aXdwKzMv?=
 =?utf-8?B?cERVMXNWUXJ0Ti9FYTBiV0dCUkVmMGJpVDVrT0p0NFluL25LL1pUTnhmMWRV?=
 =?utf-8?B?WXN1cGJ3MTlaQXFRTlN3K1lIcWkxWTFLa3VlaFlLb1I4aitqSmJCdGRQd1NM?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <724BE0D94D8F2B4B8F75F07FBD895486@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b106ab4-1a86-404d-c252-08ddc0717043
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 11:52:40.3592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3fZl8T8+Mv+m3dWvMSzDIw7OoBVtv477xMLw4x+hRvW8nD0e3RQ99/21L2Kql7qU757pFqGmFakNrTk1SnQJINNpagRmUdWjt+torJzknc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8570

SGkgQWxsLg0KDQpJbiB0aGlzIDJuZCB2ZXJzaW9uIEkgbWFkZSBjaGFuZ2VzIGFjY29yZGluZyB0
byB0aGUNCmh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuL2Q5MmNmMDhhNjRkODE5N2ExZDFhNDVmOTAx
ZTU5MTgzMTA1ZDNkYTUuMTc1MjE4MzQ3Mi5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVwYW0u
Y29tLw0KDQpUaGVyZSBhcmUgMCB2aW9sYXRpb25zIG9uIHRoZSBBUk02NCBhcyB5b3UgY2FuIHNl
ZSBpbiB0aGUgcmVwb3J0Og0KaHR0cHM6Ly9zYWFzLmVjbGFpcml0LmNvbTozNzg3L2ZzL3Zhci9s
b2NhbC9lY2xhaXIveGVuLXByb2plY3QuZWNkZi94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBya3A0
ay94ZW4vRUNMQUlSX25vcm1hbC9maXhfMTAuMV9ydWxlL0FSTTY0LzEwNjUwMDk3OTg4L1BST0pF
Q1QuZWNkOy9ieV9zZXJ2aWNlLmh0bWwjc2VydmljZSZraW5kDQoNCkphbiBtZW50aW9uZWQ6DQoi
QXMgdG8gdGhlIGtpbmQgb2YgY2hhbmdlIGhlcmUgLSBkaWRuJ3Qgd2UgZGV2aWF0ZSBhcHBseWlu
ZyB1bmFyeSBtaW51cw0KdG8gdW5zaWduZWQgdHlwZXM/Ig0KDQpIZXJlIGlzIHRoYXQgZGV2aWF0
aW9uOg0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vN2M3YjdhMDllOWQ1YWMxY2M2ZjkzZmVjYWNk
ODA2NWZiNmYyNTMyNC4xNzQ1NDI3NzcwLmdpdC52aWN0b3JtLmxpcmFAYW1kLmNvbS8NCkFzIHlv
dSBjYW4gc2VlIGZyb20gcmVwb3J0DQpodHRwczovL3NhYXMuZWNsYWlyaXQuY29tOjM3ODcvZnMv
dmFyL2xvY2FsL2VjbGFpci94ZW4tcHJvamVjdC5lY2RmL3hlbi1wcm9qZWN0L3Blb3BsZS9kaW1h
cHJrcDRrL3hlbi9FQ0xBSVJfbm9ybWFsL2RldmlhdGVfMTAuMV9ydWxlL0FSTTY0LzEwNjQ4NzQ5
NTU1L1BST0pFQ1QuZWNkOy9ieV9zZXJ2aWNlLmh0bWwjc2VydmljZSZraW5kDQp0aGVyZSBhcmUg
c3RpbGwgMiB2aW9sYXRpb25zLg0KQW5kIHRoZXkgY2FuIGJlIGVhc2lseSBmaXhlZC4NCg0KU28s
IEphbiBhbmQgU3RlZmFubywNCndoaWNoIGFwcHJvYWNoIHNob3VsZCB3ZSBzZWxlY3Q/DQoNCkJS
LCBEbXl0cm8uDQoNCk9uIDcvMTEvMjUgMTQ6NDMsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToN
Cj4gUnVsZSAxMC4xOiBPcGVyYW5kcyBzaGFsbCBub3QgYmUgb2YgYW4NCj4gaW5hcHByb3ByaWF0
ZSBlc3NlbnRpYWwgdHlwZQ0KPg0KPiBUaGUgZm9sbG93aW5nIGFyZSBub24tY29tcGxpYW50Og0K
PiAtIHVuYXJ5IG1pbnVzIG9uIHVuc2lnbmVkIHR5cGU7DQo+IC0gYm9vbGVhbiB1c2VkIGFzIGEg
bnVtZXJpYyB2YWx1ZS4NCj4NCj4gUHJlY2VkZSB1bmFyeSAnLScgb3BlcmF0b3Igd2l0aCBjYXN0
aW5nIHRvIHNpZ25lZCB0eXBlLg0KPiBSZXBsYWNlIG51bWVyaWMgY29uc3RhbnQgJy0xVUwnIHdp
dGggJ34wVUwnLg0KPiBSZXBsYWNlIG51bWVyaWMgY29uc3RhbnQgJy0xVUxMJyB3aXRoICd+MFVM
TCcuDQo+IFJlcGxhY2UgYm9vbGVhbiB3aXRoIG51bWVyaWMgdmFsdWUuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAtIGNoYW5nZWQgcGF0Y2ggc3ViamVjdCBwcmVm
aXgNCj4gLSBtdWx0aXBsaWNhdGlvbiByZXBsYWNlZCB3aXRoIGNhc3QNCj4gTGluayB0byB2MTog
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vZDkyY2YwOGE2NGQ4MTk3YTFkMWE0NWY5MDFlNTkxODMx
MDVkM2RhNS4xNzUyMTgzNDcyLmdpdC5kbXl0cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vDQo+
IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS9naWMtdmdpYy5jICAgICAgICAgICAgICAgfCAyICstDQo+
ICAgeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gICB4ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgIHwgNiArKystLS0NCj4gICB4ZW4vY29t
bW9uL3RpbWUuYyAgICAgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9zbW11LXYzLmMgfCAyICstDQo+ICAgeGVuL2xpYi9zdHJ0b2wuYyAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gICB4ZW4vbGliL3N0cnRvbGwuYyAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQ0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMg
Yi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiBpbmRleCBlYTQ4YzUzNzVhLi5hMzVmMzNjNWYy
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiArKysgYi94ZW4vYXJj
aC9hcm0vZ2ljLXZnaWMuYw0KPiBAQCAtMTcsNyArMTcsNyBAQA0KPiAgICNpbmNsdWRlIDxhc20v
dmdpYy5oPg0KPg0KPiAgICNkZWZpbmUgbHJfYWxsX2Z1bGwoKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgKHRoaXNfY3B1KGxyX21hc2spID09ICgt
MVVMTCA+PiAoNjQgLSBnaWNfZ2V0X25yX2xycygpKSkpDQo+ICsgICAgKHRoaXNfY3B1KGxyX21h
c2spID09ICh+MFVMTCA+PiAoNjQgLSBnaWNfZ2V0X25yX2xycygpKSkpDQo+DQo+ICAgI3VuZGVm
IEdJQ19ERUJVRw0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9tZW1vcnkuYyBiL3hlbi9j
b21tb24vbWVtb3J5LmMNCj4gaW5kZXggNDY2MjBlZDgyNS4uMGE1YjNmYWIwNCAxMDA2NDQNCj4g
LS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiArKysgYi94ZW4vY29tbW9uL21lbW9yeS5jDQo+
IEBAIC03NzMsNyArNzczLDcgQEAgc3RhdGljIGxvbmcgbWVtb3J5X2V4Y2hhbmdlKFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0oeGVuX21lbW9yeV9leGNoYW5nZV90KSBhcmcpDQo+DQo+ICAgICAgICAg
ICAgICAgICAgIG5yc3Bpbl9sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOw0KPiAgICAgICAgICAg
ICAgICAgICBkcm9wX2RvbV9yZWYgPSAoZGVjX2NvdW50ICYmDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICFkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAtZGVjX2NvdW50KSk7
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFkb21haW5fYWRqdXN0X3RvdF9w
YWdlcyhkLCAtKGxvbmcpZGVjX2NvdW50KSk7DQo+ICAgICAgICAgICAgICAgICAgIG5yc3Bpbl91
bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+DQo+ICAgICAgICAgICAgICAgICAgIGlmICgg
ZHJvcF9kb21fcmVmICkNCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gaW5kZXggOGY5M2E0YzM1NC4uZGE4ZGRkZjkzNCAx
MDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gKysrIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMNCj4gQEAgLTY5MSw3ICs2OTEsNyBAQCBzaXplX3BhcmFtKCJsb3dfbWVt
X3ZpcnFfbGltaXQiLCBvcHRfbG93X21lbV92aXJxKTsNCj4gICAvKiBUaHJlc2hvbGRzIHRvIGNv
bnRyb2wgaHlzdGVyZXNpcy4gSW4gcGFnZXMgKi8NCj4gICAvKiBXaGVuIG1lbW9yeSBncm93cyBh
Ym92ZSB0aGlzIHRocmVzaG9sZCwgcmVzZXQgaHlzdGVyZXNpcy4NCj4gICAgKiAtMSBpbml0aWFs
bHkgdG8gbm90IHJlc2V0IHVudGlsIGF0IGxlYXN0IG9uZSB2aXJxIGlzc3VlZC4gKi8NCj4gLXN0
YXRpYyB1bnNpZ25lZCBsb25nIGxvd19tZW1fdmlycV9oaWdoICAgICAgPSAtMVVMOw0KPiArc3Rh
dGljIHVuc2lnbmVkIGxvbmcgbG93X21lbV92aXJxX2hpZ2ggICAgICA9IH4wVUw7DQo+ICAgLyog
VGhyZXNob2xkIGF0IHdoaWNoIHdlIGlzc3VlIHZpcnEgKi8NCj4gICBzdGF0aWMgdW5zaWduZWQg
bG9uZyBsb3dfbWVtX3ZpcnFfdGggICAgICAgID0gMDsNCj4gICAvKiBPcmlnaW5hbCB0aHJlc2hv
bGQgYWZ0ZXIgYWxsIGNoZWNrcyBjb21wbGV0ZWQgKi8NCj4gQEAgLTcxMCw3ICs3MTAsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbG93X21lbV92aXJxKHZvaWQpDQo+ICAgICAgICAqIHRv
IGV2ZXIgdHJpZ2dlci4gKi8NCj4gICAgICAgaWYgKCBvcHRfbG93X21lbV92aXJxID09IDAgKQ0K
PiAgICAgICB7DQo+IC0gICAgICAgIGxvd19tZW1fdmlycV90aCA9IC0xVUw7DQo+ICsgICAgICAg
IGxvd19tZW1fdmlycV90aCA9IH4wVUw7DQo+ICAgICAgICAgICByZXR1cm47DQo+ICAgICAgIH0N
Cj4NCj4gQEAgLTc3OCw3ICs3NzgsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19sb3dfbWVtX3ZpcnEo
dm9pZCkNCj4gICAgICAgICAgIGxvd19tZW1fdmlycV90aF9vcmRlcisrOw0KPiAgICAgICAgICAg
bG93X21lbV92aXJxX3RoID0gMVVMIDw8IGxvd19tZW1fdmlycV90aF9vcmRlcjsNCj4gICAgICAg
ICAgIGlmICggbG93X21lbV92aXJxX3RoID09IGxvd19tZW1fdmlycV9vcmlnICkNCj4gLSAgICAg
ICAgICAgIGxvd19tZW1fdmlycV9oaWdoID0gLTFVTDsNCj4gKyAgICAgICAgICAgIGxvd19tZW1f
dmlycV9oaWdoID0gfjBVTDsNCj4gICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICBsb3df
bWVtX3ZpcnFfaGlnaCA9IDFVTCA8PCAobG93X21lbV92aXJxX3RoX29yZGVyICsgMik7DQo+ICAg
ICAgIH0NCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vdGltZS5jIGIveGVuL2NvbW1vbi90aW1l
LmMNCj4gaW5kZXggOTJmN2I3MjQ2NC4uOTgwZGRkZWUyOCAxMDA2NDQNCj4gLS0tIGEveGVuL2Nv
bW1vbi90aW1lLmMNCj4gKysrIGIveGVuL2NvbW1vbi90aW1lLmMNCj4gQEAgLTg0LDcgKzg0LDcg
QEAgc3RydWN0IHRtIGdtdGltZSh1bnNpZ25lZCBsb25nIHQpDQo+ICAgICAgIH0NCj4gICAgICAg
dGJ1Zi50bV95ZWFyID0geSAtIDE5MDA7DQo+ICAgICAgIHRidWYudG1feWRheSA9IGRheXM7DQo+
IC0gICAgaXAgPSAoY29uc3QgdW5zaWduZWQgc2hvcnQgaW50ICopX19tb25fbGVuZ3Roc1tfX2lz
bGVhcCh5KV07DQo+ICsgICAgaXAgPSAoY29uc3QgdW5zaWduZWQgc2hvcnQgaW50ICopX19tb25f
bGVuZ3Roc1tfX2lzbGVhcCh5KSA/IDEgOiAwXTsNCj4gICAgICAgZm9yICggeSA9IDA7IGRheXMg
Pj0gaXBbeV07ICsreSApDQo+ICAgICAgICAgICBkYXlzIC09IGlwW3ldOw0KPiAgICAgICB0YnVm
LnRtX21vbiA9IHk7DQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
c21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiBpbmRl
eCBkZjE2MjM1MDU3Li40MDU4YjE4ZjJjIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hcm0vc21tdS12My5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9zbW11LXYzLmMNCj4gQEAgLTMxNSw3ICszMTUsNyBAQCBzdGF0aWMgaW50IHF1ZXVlX3BvbGxf
Y29ucyhzdHJ1Y3QgYXJtX3NtbXVfcXVldWUgKnEsIGJvb2wgc3luYywgYm9vbCB3ZmUpDQo+DQo+
ICAgICAgIHdoaWxlIChxdWV1ZV9zeW5jX2NvbnNfaW4ocSksDQo+ICAgICAgICAgICAgIChzeW5j
ID8gIXF1ZXVlX2VtcHR5KCZxLT5sbHEpIDogcXVldWVfZnVsbCgmcS0+bGxxKSkpIHsNCj4gLSAg
ICAgICAgICAgICBpZiAoKE5PVygpID4gdGltZW91dCkgPiAwKQ0KPiArICAgICAgICAgICAgIGlm
IChOT1coKSA+IHRpbWVvdXQpDQo+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVUSU1F
RE9VVDsNCj4NCj4gICAgICAgICAgICAgICBpZiAod2ZlKSB7DQo+IGRpZmYgLS1naXQgYS94ZW4v
bGliL3N0cnRvbC5jIGIveGVuL2xpYi9zdHJ0b2wuYw0KPiBpbmRleCAzMGRjYTc3OWNmLi5jNjhk
MTMzNjU3IDEwMDY0NA0KPiAtLS0gYS94ZW4vbGliL3N0cnRvbC5jDQo+ICsrKyBiL3hlbi9saWIv
c3RydG9sLmMNCj4gQEAgLTEzLDcgKzEzLDcgQEANCj4gICBsb25nIHNpbXBsZV9zdHJ0b2woY29u
c3QgY2hhciAqY3AsIGNvbnN0IGNoYXIgKiplbmRwLCB1bnNpZ25lZCBpbnQgYmFzZSkNCj4gICB7
DQo+ICAgICAgIGlmICggKmNwID09ICctJyApDQo+IC0gICAgICAgIHJldHVybiAtc2ltcGxlX3N0
cnRvdWwoY3AgKyAxLCBlbmRwLCBiYXNlKTsNCj4gKyAgICAgICAgcmV0dXJuIC0obG9uZylzaW1w
bGVfc3RydG91bChjcCArIDEsIGVuZHAsIGJhc2UpOw0KPiAgICAgICByZXR1cm4gc2ltcGxlX3N0
cnRvdWwoY3AsIGVuZHAsIGJhc2UpOw0KPiAgIH0NCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9saWIv
c3RydG9sbC5jIGIveGVuL2xpYi9zdHJ0b2xsLmMNCj4gaW5kZXggNWQyM2ZkODBlOC4uNjg2MWQ1
NTkyOSAxMDA2NDQNCj4gLS0tIGEveGVuL2xpYi9zdHJ0b2xsLmMNCj4gKysrIGIveGVuL2xpYi9z
dHJ0b2xsLmMNCj4gQEAgLTEzLDcgKzEzLDcgQEANCj4gICBsb25nIGxvbmcgc2ltcGxlX3N0cnRv
bGwoY29uc3QgY2hhciAqY3AsIGNvbnN0IGNoYXIgKiplbmRwLCB1bnNpZ25lZCBpbnQgYmFzZSkN
Cj4gICB7DQo+ICAgICAgIGlmICggKmNwID09ICctJyApDQo+IC0gICAgICAgIHJldHVybiAtc2lt
cGxlX3N0cnRvdWxsKGNwICsgMSwgZW5kcCwgYmFzZSk7DQo+ICsgICAgICAgIHJldHVybiAtKGxv
bmcgbG9uZylzaW1wbGVfc3RydG91bGwoY3AgKyAxLCBlbmRwLCBiYXNlKTsNCj4gICAgICAgcmV0
dXJuIHNpbXBsZV9zdHJ0b3VsbChjcCwgZW5kcCwgYmFzZSk7DQo+ICAgfQ0KPg0K

