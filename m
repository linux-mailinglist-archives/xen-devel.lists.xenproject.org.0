Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LKZGKhCg2nqkgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 13:59:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DFDE6198
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 13:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220485.1529171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncTA-00008l-OD; Wed, 04 Feb 2026 12:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220485.1529171; Wed, 04 Feb 2026 12:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncTA-00006a-Le; Wed, 04 Feb 2026 12:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1220485;
 Wed, 04 Feb 2026 12:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdGc=AI=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vncT9-00006U-OL
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 12:58:55 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40031405-01c9-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 13:58:50 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB10193.eurprd03.prod.outlook.com
 (2603:10a6:20b:5fd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:58:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 12:58:47 +0000
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
X-Inumbo-ID: 40031405-01c9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzGlcKM6qkajc3qbuYJKLLJo1daCc0w4gxYKP7gpu3ViArIL5Gs4dLeXggOmOGkPPOuzX/udVoeMn0l3o7QfBpBm+nIuOrXPERyWmuS990fCNS73IvQy4eckrYwcxbyXO3CchGCi+6QbJFmexmicqDwIORTu6irVAnZB4cdxUdu79o7praNDL/6nuUcWzINkXAcZR0Ki79ui2e7ZLPp3N7VtORHHAc26uyUoZvzUfWUvU60bExvBNRIDDcBbfMo6+/cEgywmZkgAr21VT6cEq6G+d2fuOzUL1z40k27BiY6HEQDysFRPXCKvlrDEXXvjecNOtzXLexL+OTwNF08I3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSINJfpvZh3l4Rh6jlfvjN1nlUg1hVFCG71RUub+cV4=;
 b=b1SHbNA6x0CTVcHEvFinxcErg7H7P5vdKQerHwxC7A3tJda1AE+p376rPH6zgl7FeGELu2CFNdZuOhtyrm0DocIYCfQZ9/QUxU9xc18Cr70LChW9zOYLfK4f1rvNWj/lCkcvwgKPtV3Yxjycn8gx9q7ljWGN5PAwwdMH2gEdRhJD0ux7rrgiL+j+ut14TZ/W7TdrpyNejGM056Q7MUJGA/n2faJAAKdrSDd0N09OiH0R1PbZzTJZvlleZhVu29b2qgV/dGCMB+X3/FK0o8duVDW8ZtfVEiANrzZUsHqv4cqrWXkCmp7QiLjPsnOX3y4ydWX2fOAhVvwyKPVeBvWfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSINJfpvZh3l4Rh6jlfvjN1nlUg1hVFCG71RUub+cV4=;
 b=UhJ31HQb/+Kc8rDXEoP7+BYpiHCe+aFvbV/qcNcpDEa/G/1lyy2RiQN2AceWtYBV32pE9wYv2zwnjrZ4ZHQnChPj03g7DCca2lj8M5s/5/9W7POoHIPgkfiANhRUGpZCsR2FbcqtkWeRWeGVb9ff+D14+g3bWNiP54/CG6c+o0VOWWVNQEOJCqQBgG3xywd7wp1mxOf/t+1U+r3fy3/V0n5lVyCu86Z+7/TtFAA6Wvm4sjQ7EQo6gja/GE9Vdxm5hkK41dHY7OZVs3TYTmz8cVcbKCfQMXJp9anFBMdy0nff57Hv0nDeoGuYggG3VYHR7c+P873bvZHTvYOr8Mv5Rg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v5 0/5] Implement CPU hotplug on Arm
Thread-Index: AQHchGj6Bf8iLxj9KkKeGyrpjQwglLVxTT0AgAFV7wA=
Date: Wed, 4 Feb 2026 12:58:46 +0000
Message-ID: <e653b557-7423-4bd1-8e84-a72ecad5d40f@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <51B975F5-C0EB-43AE-97FD-CC937DBC593B@arm.com>
In-Reply-To: <51B975F5-C0EB-43AE-97FD-CC937DBC593B@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB10193:EE_
x-ms-office365-filtering-correlation-id: f7410853-4243-4b9f-6619-08de63ed2282
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bHN6UVk3RXpPM3dKd1pqVE4rMmE0WXRGTVJrTWhSUHJOL2NHc0JYQWJ4RHNP?=
 =?utf-8?B?TFY5dnlUVERMcXFvM1J5c0lYLzJ4QUlRWjBkNG13R2lRc1JEMDhQQzRWY1Vm?=
 =?utf-8?B?UVByRVFuVHRyaTlGQXZVYjB3M0xVdDhJQ096cUdJUWZsTlpQRE1hLzNwVzJS?=
 =?utf-8?B?ektRTHZ6NnZYZWE0ZFJZR0VTMHFOb2JZQWgxZDA4emVlQk11bDM2cmZHRFhi?=
 =?utf-8?B?RjhHcU1zTTVRSngwUFRuY05UOFVUZlJLc1Z4Qko5RlZLWlFyWGxzZ2xYOU5O?=
 =?utf-8?B?UWRHMjZ6ZTVFQWZOUGdvSHJNRk1JeDIxeklYTXEzWWEvcEd0d2N6ekE2YnZE?=
 =?utf-8?B?TnY2cFhUbHVqdTQzL3V6UU5mdHk4bC81M21mSFZHaHIrU0JPdk41SitmRkRB?=
 =?utf-8?B?MFZhbEw4MFhwWDFnRUgyL2FjU1ljMG5hQzlMVm5SUmgwdGZxNmxnejkrV25s?=
 =?utf-8?B?aXJXbTZLdFA2WmhCSWtha1RlcVZQc2xvKzhkaDNtN1YvOWVYUGExdGFOSE0y?=
 =?utf-8?B?dWVHKzZCS1Z2K2lxczIrcVg5ZWdobHRmMnFwTmZkNHhmazIxd21DOC81TXBR?=
 =?utf-8?B?dW9zRDhndkZHUlVXTnYyV0RndkN0bEtiak0yOGpISU5zSWJReG1VbUZCYXdU?=
 =?utf-8?B?ZmFRSzF3UUkvcU1kVFJzdzF5eGtJbXI1WUc0L0FNVElzSlBScWx4MnRPb0Ri?=
 =?utf-8?B?OW5xc1pTOUVHaEhtYUlVdEFJeXNEMXZNZ0FYbDd6S3Q3L0pxWE5wMSs0ZzQy?=
 =?utf-8?B?R3lLcnU5TUl2YVJXakpIOW5waXlTSE5ybWdtRlpQR3hnMjJsbExhYTdtSmhU?=
 =?utf-8?B?bXdEVVp5ci9CRnRmdWxUK2tCL2pEcXE5bW5MNkw2OHEvL2E4d1A2eExJWjAv?=
 =?utf-8?B?RGM2MXgxelZmczJndEFYaGZ5U1JGRStqMWRsVlA3V2NzSXJxVjZjN1M1aUZU?=
 =?utf-8?B?UWZiSXliTTU3SVJvWVpxU0cxSkZQN0R5NUk3ZnQ2MitWZjdHMEkyNXNpQW81?=
 =?utf-8?B?Q1lxWkdUdFg4aFNjYnA4KzlHZXhUTnN3ZnF3K0FuRk4xbjI5d1ppWHF5dTRi?=
 =?utf-8?B?bklSeVE5SUFRR1RUbzMvUUhBTUlWb0hvWWR5OWd2cVZYN0lSSHIzWGdNTzhE?=
 =?utf-8?B?YTFtNmdDT3ExQktmMzFna0sxVTJZajU1akhJZzJMd25PWmhTWXl6Qzk3OXlY?=
 =?utf-8?B?Zk9jWGpvMjFxTk9MeVgzTHpXblE2R0srNUVXK1BRaVJHMnM0OVBUWHhLTUdL?=
 =?utf-8?B?QjEydG5uMkpKTDUzTmh6N2NlbDQ1b2R6WFhtN0VYSFJqbDloa01vbEhzYVdy?=
 =?utf-8?B?TkpnRWpRS0RlSjlMSGtvMkpnc1dQSm4vSUNUMEs3MnR6ZC85bmZ1eTF0V3FF?=
 =?utf-8?B?V21MTzdUbXpaUVhRb0I4K2l2NUFFWGtKbHFybFNXVisyRjJyME13dWp2SkJI?=
 =?utf-8?B?VnpNb1p3dEJUNFdjM2MzNngvZzZRNXZiT25vMUtQSlM5WmVENGlreTBZWUJa?=
 =?utf-8?B?bzRPa3Bxdy9sMHRQaEIzbVQyOGFhb1czZkhPdTdCZVdueG9VRHVkaVRSNUpV?=
 =?utf-8?B?eFVuWVdpZFlUcmJ0cE9DUC9SVmxwNk9qaWVna25iL0UyVXhXMG5QaGFLMmNS?=
 =?utf-8?B?RG5tMmlMUnlqZEp6ekw3VjlEeEwvT2hSMUw1Nyt1UktGU2luN1pGbm52MW1p?=
 =?utf-8?B?ZjN5azl5RVF5L2FkeHo5U3lpaS9JZys5ZklsWGlNU1VaVHlMWUpXNkxxenZX?=
 =?utf-8?B?S2dScFhuUUxkT3BWbkJjOFdsRTdRbFV2SmJTNnpQc1dONUFxeEZKOFBxOTd1?=
 =?utf-8?B?RTFWbVRlZi9MZ1F2dFMvZG5xczA4cVVoR2FmRWFHdTNMdEtGQmF0ZHBkR3Ns?=
 =?utf-8?B?V2c3R01QV2pJMndQZEhvc3BZTllYZENSU0c4akYrS0xZQlBDYWdzYmc0d1Z4?=
 =?utf-8?B?TFBEM1FFQlNnZWovQ2RZRG9DMFhQVlhlOG5tRnZYejRiZFFtTEd5dFhTeHdw?=
 =?utf-8?B?dTc0amw2TDl0M01lNVVxbm5xbkdVd00yQXFZNnNvbEZyVHdMMGZmUUVNUzYz?=
 =?utf-8?B?ZFZUSktOVk1HS2ZoZ2hsV0szQUNjaWZ6ZVp6RUhzWGxOWkRMVUJRNTNRUnRo?=
 =?utf-8?B?Nm5HTkwrY044TTdEb2VBZ1JYN1YxQnpzSCtJTXZhRHZtOGx2ekxudUhOOTI1?=
 =?utf-8?Q?17DVT84YBr8kidR8xRgqvCI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGlLZjhaTnFmMDR1SWVCZG83WUgwSmtncGFIM0czdlRlT0dEdDlQSWh0d2Jt?=
 =?utf-8?B?K2NST2FnekZMOUc5a0YreVdOeEVBdURPWm1PZWJERVJGVWNGcURSWEhuZUFr?=
 =?utf-8?B?aUFFRi9LejNzN3VTZWlERkMzcnZ0UVRGaTliZThTMTh6UnUxOWZYbGlhOVNN?=
 =?utf-8?B?SjRVR3NkWjZLYVlsV0ZLdWF4TUpzN28vVVIwMGw4S1A0QStuaWJLQVRLMVl3?=
 =?utf-8?B?dGNqNnA0a3dkSUZxQ0lodmdzbVBmcFJPNHloOXNhRXZrc3o4aUdHaENGRjdq?=
 =?utf-8?B?UjdTL2JveGNaeUxDQzFheWlOeVhtTzR5S3RjR3ZlQkkvSnIxVzdNSkhYZlFB?=
 =?utf-8?B?Nk5FQ1BveXA4UjZrcTY0Ry9wZ0UxeEg3Q1BIazhwYU1vUlplZzA5NXhPbUF3?=
 =?utf-8?B?aG1qOGVoeGU4YzVTWXhIZE9DTVVIV0wvT2lWc2kxMmZoVDRqdzEydGxYWURS?=
 =?utf-8?B?bmxOTUpNMktvVGVmQjRieStFN1lCVkxXTGFZYWtzWmpFdzZYZkhhWkFHOXEx?=
 =?utf-8?B?d2NDWDJpcGhjTDlKZ0VncGJKcmNyOTRBbHdONVRIa0U0SG85aHI0cWg5MTM1?=
 =?utf-8?B?cGduZVRxa0JCT09mY0RzVUxQV1JaWS9DbEZXa3hMWlZ1NXQyMG5BanBpQ1p2?=
 =?utf-8?B?bmJYZmVhTzRxRmplSC9yeVJFZzlPSytzSHZ1SElOL3F4YWM3WS9xSHErLzE4?=
 =?utf-8?B?a3BZRXdlQnJtRm1YdXR4UTBzZk11cVQrKzJIUWtlOFVrUEJPQWN4WjJ4Q1hE?=
 =?utf-8?B?UFZ3TnhaVWNmRDFRbWpNZFM5UTZRK2trMHUrTGN4a1V1UHVzV2NVcDV4Z3Az?=
 =?utf-8?B?ZE9yeVZjM1ZkVG5YN0taWHladWdBU3FONyt2OXVpdnVMMmpKU1RiKy9qWUJV?=
 =?utf-8?B?dVRmMVZod2hEa3dHaCt0NytsUFJ3REJwaVRGQmhaVHJ4dEQxS3c0YXpnN2RQ?=
 =?utf-8?B?YmlNeVg2Y05PaHVoRmgwZ2ZXYklGZUc1Y0lvYVdpeXpoZ2hKdlYreGVxYTZS?=
 =?utf-8?B?eXVHYzFtVnhLTUpPSnZDNlYrejQyUnhBdFF1bjlQQ2pYMkpIMDRuNnQwV3lG?=
 =?utf-8?B?Q256c3publJlSzd3R1J1aFE2Q1ZSekRIQVluNkdDMVdtZTMzc3E5VXlaY01w?=
 =?utf-8?B?Zjd6NVcwS0ZoSW1qUk9mKzc0R0dLRm54TUY3alZNckRGRWp6dldKR3hwRXVn?=
 =?utf-8?B?RjZXV2U4UVo2Q2QxbFNxa094TFVBSUYvQUViNkh6VHZKUzFrYjM4bG1UdThy?=
 =?utf-8?B?cW5LVmlLVVdObzcybjVBU3RNNksxZHk5NjhLLzVNSnBoVUR0SE5OeWFZaVFN?=
 =?utf-8?B?ZzdaQUR5dVF4TTh4VERoUzVDd2dhdWE1YzhMNDI5VllvNVVTMjcrVkNrdUJa?=
 =?utf-8?B?VnFSOXVDTkN6TEhKK2VBbjZkWmFPZkRITEVDeWNaZkV3RUY5L2ZqT1g1SXRo?=
 =?utf-8?B?ZDNhRTFhbkpFR0FQekFlck5uU2wvNzBiYVErU3hwK3g2aFJMS0tLSXhCZmFO?=
 =?utf-8?B?eEFxM2N5WjRic1djd1Z6NnNjMWM0Ly9obDdSejkzbmszbXZNVnJUaFp5UkZt?=
 =?utf-8?B?TEhJWFAzaDNCM3JDUVFXdzF2WFp0dDBZTGh6WDU3OHZ3Y28rb1RUdjJlaXhJ?=
 =?utf-8?B?dU5OeE9NSDlrMnA0M0p4SWJ0VEt6djVEcFVmbFgrOWZicTY0Qjg3ZE9qYW8w?=
 =?utf-8?B?UnJEMGdDb0o4TS8xSWloSTJhTHhYK24zVHg5ZHVlSU1zcTc1bFp0K0pNRmhD?=
 =?utf-8?B?QVlsTHFnOEYwNldDVktBV3lqeTlnU0tzbXl3dldDdTNacXhKNmNtTGFHZUtT?=
 =?utf-8?B?WUNjVGQybVczYzBDZ0hMR0QzUG9xeTNRQVhmRmJjUjRCWndWeVljY0UxTFdT?=
 =?utf-8?B?S0l3WUJpNURJUys1aFBzWS9nU3hqNFFBbU1rcVZTT2VJbFErUlNiRjREeURp?=
 =?utf-8?B?NHRVU1c5bmlTc3JQQXliWEZpaE9vc2VRa2VHRm5rTDRFQm9jNXRHeFdEY0xo?=
 =?utf-8?B?NTdIS2hEaXJtanRPTEtXMno2Y2pYNS8ycjljSG53RkNWWTFNZHFWdlJIaWpV?=
 =?utf-8?B?V1JNa3E3ZHVJQ1ljTmNhaU9QYmpyMmVLbmlVK0FFdzh1eFlGeGUzMVk2cWtZ?=
 =?utf-8?B?ZUF2RDJUQ3FuNUU5R1hRVVdObUI4SDJpRStieHZTK1Nuamk0U1k4ZUlaNzBZ?=
 =?utf-8?B?TGYxckFib2R1ZGtubnAzSHdZOWdvS3hPdC9TVWI2VGwvR0xmQzJCYkhIWnZX?=
 =?utf-8?B?TlV1REJxdDlNTHEwOEtyOGRKbDgzS3NSaFUyeTVyeHRlT3ptVWxiaC9QdUZo?=
 =?utf-8?B?RmdGanZmbDVSb2MrN1Z6UlgxTUk0RHdkTGJkOXBoenRqbkFNSkFScGgwR1Rz?=
 =?utf-8?Q?LCkJq1TKhshZbIl0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <691154034CFCA04789628EC613B062F1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7410853-4243-4b9f-6619-08de63ed2282
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 12:58:47.0162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAzElO8IV7HrTDa1Annby0dzuHcD3jB46cFP6SD5/GP4kBFBSSOeMcf5PTh/fxFJZ3Oazc8AQR6V1cXsDs8Rmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3DFDE6198
X-Rspamd-Action: no action

T24gMDMuMDIuMjYgMTg6MzUsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhpIE15a3l0YSwN
Cj4gDQo+PiBPbiAxMyBKYW4gMjAyNiwgYXQgMDk6NDUsIE15a3l0YSBQb3R1cmFpIDxNeWt5dGFf
UG90dXJhaUBlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBz
dXBwb3J0IGZvciBDUFUgaG90cGx1Zy91bnBsdWcgb24gQXJtLiBUbyBhY2hpZXZlIHRoaXMsDQo+
PiBzZXZlcmFsIHRoaW5ncyBuZWVkIHRvIGJlIGRvbmU6DQo+Pg0KPj4gMS4gWEVOX1NZU0NUTF9D
UFVfSE9UUExVR18qIGNhbGxzIGltcGxlbWVudGVkIG9uIEFybTY0Lg0KPj4gMi4gRW5hYmxlZCBi
dWlsZGluZyBvZiB4ZW4taHB0b29sLg0KPj4gMy4gTWlncmF0aW9uIG9mIGlycXMgZnJvbSBkeWlu
ZyBDUFVzIGltcGxlbWVudGVkLg0KPj4NCj4+IFRlc3RlZCBvbiBRRU1VLg0KPiANCj4gRG8geW91
IGhhdmUgYSB3YXkgdG8gdmFsaWRhdGUgdGhpcyBvbiByZWFsIGhhcmR3YXJlID8NCj4gRG9pbmcg
aG90cGx1Zy91bnBsdWcgbWlnaHQgaGF2ZSBzaWRlIGVmZmVjdHMgKGNhY2hlcywgY29oZXJlbmN5
LCBpbnRlcnJ1cHRzLCBldGMpIHRoYXQNCj4gSSB3b3VsZCBub3QgYmUgY29tcGxldGVseSBjb25m
aWRlbnQgdG8gaGF2ZSB2YWxpZGF0ZWQgYnkgb25seSB0ZXN0aW5nIHRoaXMgaW4gcWVtdS4NCj4g
DQo+IENvdWxkIHlvdSBleHBsYWluIGhvdyB5b3UgdmFsaWRhdGVkIHRoaXMgKHdoYXQga2luZCBv
ZiB0ZXN0cyB5b3UgZGlkKS4NCj4gDQo+IEkgd291bGQgYmUgaW50ZXJlc3RlZCB0byBrbm93IGhv
dyB0aGUgc3lzdGVtIGJlaGF2ZSBpbiB0aGUgZm9sbG93aW5nIGNhc2VzOg0KPiAtIHN0b3BwaW5n
IGNwdSB3aXRoIGd1ZXN0cyBwaW5uZWQgdG8gc3BlY2lmaWMgY29yZXMNCj4gLSBzdG9wcGluZyBh
IGNwdSB3aXRoIGEgZ3Vlc3QgcGlubmVkIGFuZCBvbmx5IHJ1bm5pbmcgb24gdGhhdCBvbmUNCj4g
LSBjaGVja2luZyB3aXRoIHBhc3N0aHJvdWdoIGRldmljZXMgKGZvciBpcnEgYmFsYW5jaW5nKQ0K
PiANCj4gVGhlbiBhIGdlbmVyYWwgcmVtYXJrIGkgaGF2ZSBpcyB0aGF0IG1vc3Qgb2YgdGhpcyBj
b2RlIChpZiBub3QgYWxsKSBpcyBhbHdheXMgaW4gWGVuDQo+IGV2ZW4gaWYgQ09ORklHX0NQVV9I
T1RQTFVHIGlzIG5vdCBhY3RpdmF0ZWQgaW4geGVuIGNvbmZpZyB3aGljaCB3aWxsIHByb2JhYmx5
DQo+IGdlbmVyYXRlIHNvbWUgZGVhZCBjb2RlLiBDb3VsZCB3ZSBwcm90ZWN0IHNvbWUgb2YgdGhl
IGNvZGUgbm90IHVzZWQgd2hlbg0KPiBIT1RQTFVHIGlzIG5vdCBhY3RpdmF0ZWQgd2l0aCBpZiAo
aXNfZW5hYmxlZChDT05GSUdfQ1BVX0hPVFBMVUcpKSBvcg0KPiBlcXVpdmFsZW50IGZvcm1zID8N
Cj4gDQo+IENoZWVycw0KPiBCZXJ0cmFuZA0KPiANCg0KSGkgQmVydHJhbmQNCg0KSeKAmXZlIHRl
c3RlZCB2YXJpb3VzIHBpbm5pbmcgc2NlbmFyaW9zLCBhbmQgYWxsIG9mIHRoZW0gd29yayBmaW5l
LCBhcyBYZW4gDQpmb3JjaWJseSB1bnBpbnMgZXZlcnl0aGluZyB0aGF0IHdhcyBwaW5uZWQgdG8g
dGhlIG9mZmxpbmVkIENQVS4NCknigJl2ZSBhbHNvIGV4cGxpY2l0bHkgY2hlY2tlZCB0aGF0IGlu
dGVycnVwdHMgYXJlIGdldHRpbmcgbW92ZWQgdG8gYW5kIA0KZnJvbSBjb3JlcyB3aGVuIG5lZWRl
ZC4NCg0KSSB3aWxsIHVwZGF0ZSB0aGUgbmV4dCBjb3ZlciBsZXR0ZXIgdG8gZXhwbGFpbiB0ZXN0
aW5nIGJldHRlciBhbmQgYWxzbyANCnRyeSB0byB0ZXN0IG9uIHNvbWUgaGFyZHdhcmUgdG8gYmUg
c3VyZS4NCg0KQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlIGEgbGl0dGxlIG9uIHdoYXQgZXhhY3Rs
eSB5b3UgbWVhbiBieSDigJxjaGVja2luZyANCndpdGggcGFzc3Rocm91Z2ggZGV2aWNlc+KAnT8g
SSBzdXNwZWN0IEkgYW0gbm90IGZ1bGx5IGdldHRpbmcgdGhlIGlkZWEuDQoNCg0KLS0gDQpNeWt5
dGE=

