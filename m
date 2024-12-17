Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FFF9F47AD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 10:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858690.1270941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTzS-0003ON-Im; Tue, 17 Dec 2024 09:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858690.1270941; Tue, 17 Dec 2024 09:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTzS-0003LE-FZ; Tue, 17 Dec 2024 09:35:42 +0000
Received: by outflank-mailman (input) for mailman id 858690;
 Tue, 17 Dec 2024 09:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8UP=TK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tNTzQ-0003L4-PN
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 09:35:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2415::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45cb2059-bc5a-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 10:35:38 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 09:35:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:35:35 +0000
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
X-Inumbo-ID: 45cb2059-bc5a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yANEByN02JMuuEiOgt+x7j8tzVlfmeeaI2Cl2HENnt71hwQa+p5QMeCNFNGo9DWADp5Qc8wCob6ebnWNflEbskIe0/Fdh4zvg8JlD0WTyAGbQIQ6KewS/EGPGuFl/+FIl9NlHhg+rgc6sHEJh9y7zlTeZpdeW0FBHcUcc5yetzyiNAQPZ8BY0sk6uYE1Q4ufTqg6oZC16Ejeifz5st6arkOSjhPFhPknwbOEbvjOyCyP+dkvW2I3LddQNTHkQnEA1ho6l+xWUD7dsGxFNR6DlPLqbeMoGsnlnyp5ME1/sofCdFGTKpnRn8lsfKUL3DSKbYxrezrGmWtr4BY9E5g+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYu04RuHbmyfowJoJn4dLaNNZdmuTAGtDJ7f8WmEpRY=;
 b=yuoMOTDV8whUGfBawijOsw5mJZm6QrpxttV9QsIg5CPr+FEuRn/FGa6zInAPAt8W6ueUSDL2iAFg5Brf8zwExSezhFCKvsX6In3fzTs4U9RId4Cu6YtGPfULB08yUf3CIBs5H++XXsYHjFKC6DDk4YNE9PJyO0OkA3SHJBLE2mG/eZYCdo1pDl+SStEIxsUhed9AyndXefh4E/E26wmqu0YQ3LlDLZv9CAtqrovn+zFCgYF9kz0a5xppRph7hPrZyjvEtKMNcRo2aNx3D0UedsMKdrXzpgtjA+/HcCEFvCJo3xMaN5w26Y+8VYC/pPaxoKkkq06NMAx82mJ9Kv9GDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYu04RuHbmyfowJoJn4dLaNNZdmuTAGtDJ7f8WmEpRY=;
 b=eSxg5RnbcFQPszuXf9Uhudlr+lIpjb4j4DQ6JW2k8rFVf4jKnsfzwRtxTQY9kbIh8F1AWFX+sQSapz1kanqFmXny/QXwf/tS+Gz0kTWMcHhvSnRFuzOF2vzDBCN56LPqb6IoKuiUsTIz7eayaqwU0EXROpNTmpkro8JM8QmzLw4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] vpci: Add resizable bar support
Thread-Topic: [PATCH v3] vpci: Add resizable bar support
Thread-Index: AQHbTSHk/+a4JH45i0iSPkOFUem08bLov7+AgAHlKwD//4B7AIAAlB2A
Date: Tue, 17 Dec 2024 09:35:35 +0000
Message-ID:
 <BL1PR12MB58495A86839B89C4F09EF4D5E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
 <0f75fcd2-6c5d-4be6-9fc9-3c7b6c10ae51@suse.com>
 <BL1PR12MB5849A5497B2C72283B8143D6E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f5d5ca69-a7ea-430e-87d3-dd76338389e2@suse.com>
In-Reply-To: <f5d5ca69-a7ea-430e-87d3-dd76338389e2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8251.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB7409:EE_
x-ms-office365-filtering-correlation-id: 20dac6f3-6266-42c7-57fc-08dd1e7e28d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ukc3QWtDNzNqQTBCYVZBOEE1ek15WnlyblNOU2V3ek9sNGdrcnd3d2VycmE0?=
 =?utf-8?B?V1kxaGdmTW9JWUUwQ0VkMkpxU2Qzb015dVd4VG5xQU9YZDRpQWNQVGxsZkRT?=
 =?utf-8?B?VFNtTkhxQWtMV01RcGhPMHdJME90dk9JVVJaa0RSL09UaGxXT2ZUbDkzSVlY?=
 =?utf-8?B?K1k2eUl0NEliZzRISklzWWZmaGpHSmpMYUhiNE5nZXZQbHRpNEZCNlVQVDNi?=
 =?utf-8?B?T2dFNWE5MU10dVlpK256VEpGZmFwSEhFL0QwMVRtcVJaelV6MHIvanFRRzVh?=
 =?utf-8?B?S1cyREl1NXJXanppNmVxcjFtUlJYZU5QbmwyZGRmcTUvdnNpV1NYdEZQNU45?=
 =?utf-8?B?ZUdQN2tJRFp3ZnJidEcyNHJSZlpOYUJLSWJWVlpZNGRMNHRESjlvZUc2RHcx?=
 =?utf-8?B?NG5ZWW1JRG1pbDg1TjZLTHU1dUVaZXRiY3ZkTU1la1RwKzVmRmIxODdSR0ZF?=
 =?utf-8?B?UVZXVkUzWDhnaGR6d3FNb2M4dE5WdUw3UVNuZmgwbXZ0T1dnOXVQWHlqQ0RF?=
 =?utf-8?B?b2VDZFlIVkJERmNleWRNK25PUkpzZjgwNWtaNjJNR1QxNGZ4WEEwVmY3ZTh2?=
 =?utf-8?B?UG5hQXBjL0tXMVZVaUt3WlFnbUtTdm5OVVpMSlJYL05hcmNrZlkxdHZudXJP?=
 =?utf-8?B?OTU2bnI3YkM5QU5vc25KWjFLbmxIbHlMSGE4OUFaWnpyYVJBVi9weEdBSzJZ?=
 =?utf-8?B?clMvbEo1R0xoZGlXK1VuWWdTcGlvc3VPQWRDUWFBMkxqOFYxancyNDZlTUkz?=
 =?utf-8?B?KzhVcEtHRUNzOUdoV01LQk10dWp0WWM4VTliQ1dzd0xwNW1OK1EyV0hZTnkx?=
 =?utf-8?B?RlZhdWhCbXdGb2d4czdXRDk0dWd4T3ZET0Q4RGFKcUYxWEFpRVJpZURaaG9F?=
 =?utf-8?B?MmdZT3R5Y2N6S29acDNmRThCWi94NVNaNTJwZFhxckhFcGgzazY5VXdCSUFr?=
 =?utf-8?B?dVQ5alBkYmMyZlkvWEhrT3hNVDBSY1IvUUJuZ3JqeG5xUk5ya0hIKytETUdz?=
 =?utf-8?B?UytFdGIxa3BidTd5cDBuaTdRYWRtRXJxMDRKeEVKT1RKeDFLTzB1ZFpoOTNx?=
 =?utf-8?B?WHU4RVVEVjNFaGxib3VrQkhBa3dsOUFZbGQzN2w4MFlWSkN6cTk3Wlk0ak8w?=
 =?utf-8?B?aFBoTmFTNGIyanlaemwvc0c1V296U3JDbE9aWWUxMVFYTEdkUXZZQW5nVlo2?=
 =?utf-8?B?V0I1dURkZ1ZueHltc2NkMXV0V1JiQVlxUjdvcTl5ci9FWEZ0eE93K3R3bkpG?=
 =?utf-8?B?cEttcnhNT2RnQVd4Y2Ircm1uditxc0YxY3REN0VoclUyZy8vbVlPVGRUbGlC?=
 =?utf-8?B?bWJHRmdURSt5OUNaU3EydmxRZDZiRmdhYmtia3QwaEo0UmxHZ3loRk5lb3Fs?=
 =?utf-8?B?cmhqRGlKRzFLUDJ4eFdmeDNTc3E2T3A0VWtlZDBkcXV1Z3VDYUMxSEZBdU8x?=
 =?utf-8?B?M0VUUnhib2VJK1NkZStTRzRrUG9uSlNuemlQZDJBa3lqOEpuQ3hvTFRKNE5z?=
 =?utf-8?B?ZjYwbVFEbW0zUXZJVmdjNmg4dk9mNGR5OGxxQmNXSVVqbzdmT2FQTEdiRDBV?=
 =?utf-8?B?Z1pmUmJIZDE0MHB3dXgvSndtTUR2TkZxUlBhSjdWYi9YUlNISkJTYU1qeFlO?=
 =?utf-8?B?cW5MdkpqS3Qvb2lVb2luN3NudVdkRGZLZ1Nmazl1WlljUUJYcUtQQmw5am5E?=
 =?utf-8?B?Vlc3UkVGbkRpTURQaGMwSzlaUXlNWFhpMW1FVkEvTXFKcEZXQ2YzNEFlckVs?=
 =?utf-8?B?cUttRWFYeERVSHFscHlNSHRQcU1NRHl2TThrZERnOHdVVFlyQTUxTlB5UGhK?=
 =?utf-8?B?dDc1Znk4M21kTTY4Wmw1NHlOdWZMVjM2ZXVXOHpWUEhUUmhvL3lUMTZOWGhO?=
 =?utf-8?B?Ulpva3BmandlK2c1V3dCcTFTbldwQU8xZkt5emJtTkNsbVZabUNLbFd3LzBx?=
 =?utf-8?Q?fTU1pCfUgvMIHfGadEInou5fs3um9mNa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkMrNWxhbE5BMlFrclFxQ1dPalJxam80RjkrUG5nZ3RscnhBRWNCTDBDWmhB?=
 =?utf-8?B?SW8yVUszZDMrU3BHMCsrK1ZObkZCajhHdG5DZjJoL1JMekFIL2RGa0pTUzc3?=
 =?utf-8?B?UkorclYwWVFZSjBZcVNqVWJyMFd5ZXYrTW9uTlNGdzJ3U0pQaHZWR0U0MlFZ?=
 =?utf-8?B?ZGdpY0ZsdDlLMFY2RWJZZlAwZlFlRUg0TW14ZFhVRGxVNElKbmlia1VTVHlx?=
 =?utf-8?B?WHF4cDgvczJDU3NZTnd3SXZaS3NxNmFyY0pPcUFBTStpRFR6T0FoSEJlNmVW?=
 =?utf-8?B?c0FULzVxcEV4NEtMcDZ2OWViZURqREJXK09PQTFWekFCWC9VclJHZkd6VldP?=
 =?utf-8?B?UklsaEVkMW9USC9EVHVzMUw5WlRSbnYraVc4MVF1WFdIMXZVeHpib0QvT1RY?=
 =?utf-8?B?TGpIY21zaVdKWjRHamk0cjQ5ZFdiN05yUUcwQTlDZjJOSmxLVW9NU1JZRm1O?=
 =?utf-8?B?VXFkd21yRm5Pd09iYzVEM0FTWXErUGRxcFk0N2oyelpxWG8zNitZKy8zdVhY?=
 =?utf-8?B?TlNuSDl5elZCNlpzZ29hWGc5c2hQNXlZV0ZUWGNOWHNDNlNzaFV3RXU4aE5I?=
 =?utf-8?B?OFFXN0lmd2w1K2c0cEorVnE4WE1BR0l3WXBtZ2k4Tm5uamNSSkJrWk5qTTlS?=
 =?utf-8?B?Ynlzazczb3JtWHExMDQxM0NoMVhUNU9rdXM2MVl6R1RLRkRsUW9TaUJZS1dx?=
 =?utf-8?B?c2RzbzhGdXhyV201MW9DME5IcFR3K2s0N01KTWRCRlJvS1A4WHhwWHRoTHlo?=
 =?utf-8?B?MFVkTHVGUjZ1VjJHZGpwYllwMHlJLzkzRHBsSXFLMU1UVUpKV2k4Z1BsRkNF?=
 =?utf-8?B?ZW12TFpsZ1o4dkVNMFpRTzZON1VaWlRmeGFRQnV6dVorVlVaS3JHa0pHQXR1?=
 =?utf-8?B?aWlBSW5BUkdEN0NWZVVFUTJoazdDejA4QkdpekFEYnprSjZKbVFaMmdMNjBN?=
 =?utf-8?B?MFJsQmpTdXRqZzcvN21PK25mOCs2RnpiU3FLZDBpb004UitoUk5LODFEMTlq?=
 =?utf-8?B?QlFCQWxmRzA3T0k5NjVIamNTdnpYSVFWM1o1WUpUQTVTU005cU5sbUphVDlK?=
 =?utf-8?B?VVI2Z1JuVUtLMjRtemlKeXpWQ2hKSmcvVVVNaXJFOHNSWWNKL3p1R2ZtbDB4?=
 =?utf-8?B?Qmw4TTBVK0ZGVzFjaVlLSWt1cktYbUxrczh6QkZTQy9SU1htQUNYWmYxeUF0?=
 =?utf-8?B?WlA1Wk8vWVJnUkhsRHlKQUttdHZvNFI1eGlRdEwzeVk3WlpOMEQ3aWZZNlhJ?=
 =?utf-8?B?SUFTMng5K3FSRzc1V1BFSkhsWC9JbFVxR2l0NG9mK0FHaXAxSnBSSU1GMjZQ?=
 =?utf-8?B?Ynh6RGZYcTUzcU1Lc1pOVTR0T0JmUlBRL3UwNVVDWnczWVpZNjQ0dDYraGdD?=
 =?utf-8?B?V3V5TkRrNVNDdjZRTUxjSmJDeGE5U2Y3a0p1QXUvQ3FNWEgyQk94QVhXaUdS?=
 =?utf-8?B?Q00vQlRGQnRDYXRCdHJrMlNGcWNRdE9XNFVEMFRqRi8reXRQQ0ZtRjkyZVpm?=
 =?utf-8?B?T21tMlNRMWVHN0lKZ0FENWdRcUdHSm44bU5DVGJqTDIxVEx6SlJMcnJWSkNG?=
 =?utf-8?B?VHplaTZZQzc1SmYyQXNjNzdQdzhoRjRWbUpaRnFiTjRKM2J0S2lhZGNORGI2?=
 =?utf-8?B?UkZFcG5vSTJvQlozL0kvZTk2a2tVb3phdGlCNGcvV3ZVRHNxTnlndXZLWktt?=
 =?utf-8?B?ZkE1MG95WVZoZzhqWDd0c1ZvQTBsNFhJV01sSWw3MGtWelBuMVNGams3UTVG?=
 =?utf-8?B?cXhYT3BWSThEVjJia21FanB0V3pCbkllazBkRVhSVnBZNWN2Y3RJR3J3Y3Aw?=
 =?utf-8?B?akRIS2ZOMmdvaG9EdEpINWQvM3hXNUZpckdYWUdUVDYvdUEwKzFLR3o5ZHFU?=
 =?utf-8?B?RXZFUWZuY1BmMUk1UWYxRjZQZ1R4N3V1MDR0dkhtYzVvanRKdDJMMlVQTzN2?=
 =?utf-8?B?SnRPeEFnWmd2amFZVEg2SWUwckY1ZDNYc050c0xwMEZWeFdzKzg5MjRCTzFE?=
 =?utf-8?B?VlNQcytNeGx3S0o4aFhaVEV4T2FUb090eTZjYkZwMWdlZUE3cStRRCtjdE9u?=
 =?utf-8?B?eVlVM3dmaVJpaVJqaTQyNDF1a3ZsaWVXUlpTYXVWZlY1RWppdytQT1FvT1ds?=
 =?utf-8?Q?RMhU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFA306722CC3ED45B842D542A0B6921E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20dac6f3-6266-42c7-57fc-08dd1e7e28d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 09:35:35.5833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i70YJM7ZeiUTstg7AyRbCIVVqQK46FD7x8vLUA3qu7gxen+RIfG01viALhNGy6MXlNFMAGYwUQSLTQ5siBjAuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

T24gMjAyNC8xMi8xNyAxNjo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjEyLjIwMjQg
MDk6MjIsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjQvMTIvMTYgMTk6MjQsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEzLjEyLjIwMjQgMDY6NDIsIEppcWlhbiBDaGVuIHdyb3Rl
Og0KPj4+PiArc3RhdGljIGludCBjZl9jaGVjayBpbml0X3JlYmFyKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIHVpbnQzMl90IGN0cmw7DQo+Pj4+ICsgICAgdW5zaWdu
ZWQgaW50IHJlYmFyX29mZnNldCwgbmJhcnM7DQo+Pj4+ICsNCj4+Pj4gKyAgICByZWJhcl9vZmZz
ZXQgPSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LT5zYmRmLCBQQ0lfRVhUX0NBUF9JRF9S
RUJBUik7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoICFyZWJhcl9vZmZzZXQgKQ0KPj4+PiArICAg
ICAgICByZXR1cm4gMDsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFp
bihwZGV2LT5kb21haW4pICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIHByaW50aygiUmVC
YXIgaXMgbm90IHN1cHBvcnRlZCBmb3IgZG9tVXNcbiIpOw0KPj4+PiArICAgICAgICByZXR1cm4g
LUVPUE5PVFNVUFA7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgY3RybCA9IHBjaV9j
b25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTCk7DQo+
Pj4+ICsgICAgbmJhcnMgPSBNQVNLX0VYVFIoY3RybCwgUENJX1JFQkFSX0NUUkxfTkJBUl9NQVNL
KTsNCj4+Pj4gKw0KPj4+PiArICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8IG5iYXJz
OyBpKyssIHJlYmFyX29mZnNldCArPSBQQ0lfUkVCQVJfQ1RSTCApDQo+Pj4NCj4+PiBQQ0lfUkVC
QVJfQ1RSTCBpcyBhbiBvZmZzZXQ7IGl0IGNhbid0IGJlIHVzZWQgdG8gYnVtcCByZWJhcl9vZmZz
ZXQgaGVyZS4NCj4+PiBUaGF0J2xsIG5lZWQgYSBzZXBhcmF0ZSBjb25zdGFudCwgZXZlbiBpZiBi
b3RoIGV2YWx1YXRlIHRvIDguDQo+PiBJIHdpbGwgYWRkIGEgbmV3IG1hY3JvIHRvIHJlcHJlc2Vu
dCB0aGUgJzgnIGluIHJlYmFyLmMNCj4+IE1heWJlIEkgY2FuIG5hbWUgaXQgIlBDSV9SRUJBUl9T
SU5HTEVfQkFSX0xFTiIgPw0KPiANCj4gTmFtaW5nIGlzIGEgMm5kIHN0ZXAgb25seSwgSSB0aGlu
ayAoYW5kIG5vIHJlYWxseSBzdWl0YWJsZSBuYW1lIGNvbWVzIHRvIG1pbmQpLg0KPiBCZWZvcmUg
dGhpbmtpbmcgb2YgbmFtZXMsIEkgdGhpbmsgdGhlIGFwcHJvYWNoIG9mIGRvaW5nIHRoZSBhY2Nl
c3NlcyBoZXJlIHdhbnRzDQo+IHJlY29uc2lkZXJpbmcuIEl0IGlzbid0IHF1aXRlIHJpZ2h0IHRv
IGJ1bXAgcmViYXJfb2Zmc2V0LiBXaGVuIHVzaW5nICNkZWZpbmUtcywNCj4gSSdkIGluc3RlYWQg
ZXhwZWN0IHRvIGZpcnN0IG1vdmUgX2p1c3RfIHBhc3QgdGhlIGNhcGFiaWxpdHkgaGVhZGVyLCBh
bmQgdGhlbg0KPiB1c2UgY29uc3RhbnRzIHRvIGdldCBhdCBjYXBhYmlsaXR5IGFuZCBjb250cm9s
IHJlZ2lzdGVycy4gQWx0ZXJuYXRpdmVseSwgaWYgd2UNCj4gd2FudCB0byBleHByZXNzIGV2ZXJ5
dGhpbmcgcmVsYXRpdmUgdG8gcmViYXJfb2Zmc2V0LCBJIHRoaW5rIHdlJ2Qgd2FudA0KPiANCj4g
I2RlZmluZSBQQ0lfUkVCQVJfQ0FQKG4pICg0ICsgOCAqKG4pKQ0KPiAjZGVmaW5lIFBDSV9SRUJB
Ul9DVFJMKG4pICg4ICsgOCAqKG4pKQ0KPiANCj4gZWxpbWluYXRpbmcgdGhlIG5lZWQgdG8gYWx0
ZXIgcmViYXJfb2Zmc2V0IChhbmQgaGVuY2UgZGlzY29ubmVjdGluZyB2YXJpYWJsZQ0KPiBuYW1l
IGZyb20gaXRzIHB1cnBvc2UpLg0KSXQgc291bmRzIG11Y2ggYmV0dGVyLCB0aGFuayB5b3UgdmVy
eSBtdWNoIQ0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4N
Cg==

