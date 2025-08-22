Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFC8B310DA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 09:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089666.1447170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMcD-000429-0v; Fri, 22 Aug 2025 07:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089666.1447170; Fri, 22 Aug 2025 07:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMcC-00040P-Sr; Fri, 22 Aug 2025 07:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1089666;
 Fri, 22 Aug 2025 07:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upMcB-00040I-9J
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 07:55:11 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 538e3a6c-7f2d-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 09:55:10 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI1PR03MB6383.eurprd03.prod.outlook.com (2603:10a6:800:197::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 22 Aug
 2025 07:55:08 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:55:08 +0000
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
X-Inumbo-ID: 538e3a6c-7f2d-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ6GbQzTM6+MpcQ78cMwH8szAVinW4sfhhYh71ZV4bQurr5SU8c4wjzoq6CfPqy7RsKvjU1RBIWa7gN9Z8wS53+J0TeYyQvGUqeqer6993HSS6LslHG/g2zoGKcByeXDulRqgsRj6A5s/v0YlyLA8ruv+jpSKm/o+ntpEU/0Blh2HpfJQOyRLykv+JSAEy/OsYkrx6UXITXDkAaRQZ9Kg+16dvJLkux44YV6K2U8n+i7hh0kg+XG99kwT3Ae+8VsjmfTEDJS9cpOf53FRlceoTtqPT4DXxNaz/HyHlM2lVmrp5Tik0pa25u8DGmWwqQuFw+YGjNgY351+JpMqs3TKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfPfKE1Do8QEcjNohC4uY7VDSFVY3mXWjU1bt1Ku0P4=;
 b=v5IjjvrovVFLSDa236gOazo6NiDpLZ2GC6okFLt+3e+K7K1DXEKRGDfEeOfFHsmLLaIFBhd4YZBNSTaeohpvNqypx9PijkUV6lzPYp/n3oGgMqYj249uk+2YdgJnh181H01vkFo9TGFYUVXrt4a/DUzDhdzTurmyhdgOR/r5px/ivO7ew3XSsL3dLl0ziTVz2lN+SB6FSAYtqrC8/QLxLHLqXLqIG9pilJr3wcjcbcHUYAR4VxXjflRLHPtOMjZTia8xLNNCRpHHzNTxZJE0adRA3P/p3sZZ8/lM7cFNuqoIK09OeTitCiCzSCODyGRtOGR8xYSD3Xt57GE+Pe4JQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfPfKE1Do8QEcjNohC4uY7VDSFVY3mXWjU1bt1Ku0P4=;
 b=nUk90AkJRgv8piWlWAH5Jx8h4en8l1INJWLmlVu4c8aeoF4VMXMkksO1sr2BFbTOUN4EizjkD9ehu0aVNHutxah2OhhZ95iQKWkxYHclyVKpPvgf52CAeE6PY5XhtE1qkjKTRgZcz/mMFFn9biPYPRBvugnkpAJehsoKEoA4AralFpAsodn9JkA81bWc5efQt7ZDFzy+7BNIQXWZFJX9GpgW0YX94wH3pJtCgBb3TuHbgMXbXJVvMwIxAgnL2HFzmNLaeSQf1pQf7l4w4NnFCg52WXYS/4CE9NfWYF2UijFPAslyRLVQXu3kLG6zPVrA0IoCAihbKIzYbTHTS4i6CA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Topic: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcB5d76MRh/Swq2EGu624C+G/Fb7RuZPeA
Date: Fri, 22 Aug 2025 07:55:07 +0000
Message-ID: <7360fa14-2c55-4aa8-bbba-e355a47d2928@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
 <87y0rcekyo.fsf@epam.com>
In-Reply-To: <87y0rcekyo.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI1PR03MB6383:EE_
x-ms-office365-filtering-correlation-id: e8667e52-a779-4f3e-466f-08dde1513676
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkJaejRvSEw3M2JEaDdadDNnQ1RRRjZVS1o2VmY5Nk9lREd6Y2VJWjRnYjVz?=
 =?utf-8?B?STcxNjIycjludHZrTkFNVjN4YlNhdTV5M3FKVkxSM3VPOXBpRnpSSzlIajdy?=
 =?utf-8?B?MWVOUU1rQ3VDWDZTdUdjcnlrVHhoNXJNcXlvK3hScmNDa2tJdnE2aWJtU2Vx?=
 =?utf-8?B?YjNQZFhST0RodEk4VG9aUDJROHdCTGFVakFCTVdZM1ZjZ1Y2djFUVnIyejZk?=
 =?utf-8?B?bjBYbnZyWEFzMUo3d0kyYkhLRUMyN1Q2U2IyeWVYU2x5YnNObm9qYkhEeGRW?=
 =?utf-8?B?OEEzM3g3VFd5N1JWLytwVmxXRlVtQlFnNEtLa08xUDlvY0pXa3hBNnQ5VGlK?=
 =?utf-8?B?T2xQRnZtNVU3Ry83SDh3cDAzY0NoSGh5S0k5eGNLek1xSDdHYmhnaHFxWWY4?=
 =?utf-8?B?amMrTzU0QlI0eXhDa2c4aFBuQWFxblBtcmtNZEtoNU1STG1ldkZqK0JqMytP?=
 =?utf-8?B?TVNmMVFjT0c4U2NGYm1ZdFhjaGMyZ2o0Rk55bFQxQTZTNDY2RUExMGRha2xh?=
 =?utf-8?B?SmsxSzBkbGpWMDFheHpzeVZjdTc4cTRhL0xYNXAvZi9pZmRudk9ZWXlHNUpL?=
 =?utf-8?B?ZGdXZkQzdTZHaytKN3BhQXhOTytZVHZROG9DTm5WYmxFbVhoTW9XK0VCbTFP?=
 =?utf-8?B?Ri83TTBmWGRIc291UzNVK2R3N1VSd0ZPT0JBTHVBd0R5MlJMR2E0WTdhMnRM?=
 =?utf-8?B?MWJQaHQrWlBrQkppT09nc0NrRnBqUG1aNzFWZFRML3BFYVcvclBMaWlBdlhz?=
 =?utf-8?B?UU5HZWNiNHZSaEVDbnJmQTVtQjZRbEdnTUU2Vm9ZUWpRMXhJTjdZYjVWZWlP?=
 =?utf-8?B?WWtXc2tHWUZkSTdMRnl1bG9LcVNQVWlJUjZUYjRBTEQrMUNWMTdINjROSURX?=
 =?utf-8?B?dGxXUGxQeHlUU1praW1qTUtwcEl4eTdFdXVGUW9ONldjU3NGTlloQ0p5WThi?=
 =?utf-8?B?clFYOUVDQTlWbHIwRHFtdnAxU25qdHpqTEJjWWVlOVJuT3JrNFZZSC9ITWhY?=
 =?utf-8?B?eFh6Q2FVeXRzODR0Z3RDKzNSQVlkZWcrNkFha1g3OGJsSjhMNTVlU2FNdlV1?=
 =?utf-8?B?cS9abTgyOVFPazNTbnNzRFZGUlB1c0liNTUxRU1EaDZEbjRXeThSTFB1M1Rk?=
 =?utf-8?B?RnFhUW9HNHA4Qnl1TXNkd0NwMzI4VmdQM3FKQkVsY1FNNDZuZG5Oa3F0Ymxq?=
 =?utf-8?B?bXhlaHV4WmdRM2UxbVM5dWtHTjUxbVZLRzRjR3BWVVR6WVBaQ2YvWDZ5U0tQ?=
 =?utf-8?B?N211YlBhTnErSEVSV3NLS3gzc0UxM3VxS3doVkNlcGFsengwamg0cUFiMlE3?=
 =?utf-8?B?VDI5NGptMlZGb2hHQU52OHhlZHI2dWEzQytIeFo5T1h5VlZzNUhncXJaNG5C?=
 =?utf-8?B?TlJCaFNES21JUzJTRmdZVnljSzl1SENKbFBDcStpVUpXcTNkM0J4WjBTSCsr?=
 =?utf-8?B?UHJUMC9MMG4wOVUxN2Z3bTMrOXl4MmpUc0ZVczhuTEdDOGZiZTA4VVJwRVV3?=
 =?utf-8?B?MllLSzJ0eUFCa3FaREtzUkhkVmh2MkNsVG9tVU9ZbHIwNEQ0SUNwTjdUcEpE?=
 =?utf-8?B?a0kwcjBWalhWMmY2d3FLRzhWNkVlM2lBYk00L1VzQ0RmajQ3d2ZRSFdkWHJl?=
 =?utf-8?B?Z09YcGJHc1VOOTRCR3VPVllzeHllOGhIdW4wZlF0QU5mL1p6bFEzWXVrS2Mz?=
 =?utf-8?B?NUZiaE15NTVmQTJLMFBEanNUazV6U0RydGswd1BnUHh0MU5Eb1JhekZ5Z2Uw?=
 =?utf-8?B?VUZ3R0lia24vWXgyc3VXbTZ5SFpvRVFkYmlzcVhFb0haVEpwSVNGRGlBSW0y?=
 =?utf-8?B?NjhHcXpBMmlZQ0o1RHlhZXpiOWZBd09VSG41R2h1RGUyMFcvU1IweGhXTnN5?=
 =?utf-8?B?R3dDejJlaWh1MXFoQ3JsaEVWcDh3bXYzMXp4bTUwcnlqUFBraElYRnFKS3E3?=
 =?utf-8?B?NmphVnNkU2NQdkpDaS8rdkp0OUZ4WWpXVXNKQmd0QnRYcG9Vbm9jK0UrTzFV?=
 =?utf-8?B?TmZIczBuSllRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d29lanBGOENCN1BhQVdwTmJKQWU0QW5oVStYM2gwMzcvSHVQYWVybU40bWtq?=
 =?utf-8?B?WmNvUFpOMXpveUlrT2YwWU4zMG5PR1FPaW0yT2Q2cWxSdlk4ajl4YlNyUWJZ?=
 =?utf-8?B?SG8wc1FCaUlqVmJSUGo0Vk9yRmtBcWNGWk1oR2t2MUxtUks5aUtTNGdFeXpE?=
 =?utf-8?B?SHpHY3FqME5hRzR4OUNzcmJyWkpQZzlFQzJWb2NDeTlFNmtaaVBvRGlpUVJk?=
 =?utf-8?B?RGcyYzR3T1pTTHdCdTh4WkNWakZXQlJENXArQUVzOUlRT0pMQ25hYjdlazNj?=
 =?utf-8?B?WkthMjJlT2lGZ0NXS1FEeURUTzlyR0ZGaUVUdTlWbXd5dDNvNGlOcFNHbkNW?=
 =?utf-8?B?Z2lQaFRCejJWQnFtejE1VkNlUDY1K0Y0bGhta0FoVzR6RmJJOTI2eUt5bXdZ?=
 =?utf-8?B?cW1lTWdUTVNpRGtXNWpEdFJrM21mbzY2akpveWw0M1IzQWRQVVdPeGQzdmds?=
 =?utf-8?B?LzN2SmZocXNubWlFV3lrOTZPa0Y4dVZhVnNxV0FNUjhwMjVxYnoxNUxveE5p?=
 =?utf-8?B?WUsyUmpVWVJMdUFWSTBOeWNWT2srcmpyM0drbExhYWNpeUxhNUxHMGxkUGNW?=
 =?utf-8?B?ZXhDdzhXTUZrQWlnV0U0OG9XdTkwb2ZSRXhPazVnaFM1bXREU1lNY3I2U1Bk?=
 =?utf-8?B?TlJRQi9paWR1ZzZmNWtDMWZHVlFPRWhMU0cza29JUU9FYkczOVVZZ3hXUWV0?=
 =?utf-8?B?VmovckI3eGRpSzc3bHQ4MjNDQ1ZDSmp2N1h5bU5FNWNzT1I2c1g2aE9iTnE3?=
 =?utf-8?B?S09ERE9DUW1ScldNSTlBUjJoMnNvbXQxUS8wRWxmTERwck5LT2p5Z2dncDZ2?=
 =?utf-8?B?VlAwMVlxWkFoNE8vOFE3M1JzZVBPWWpXQlp1WU9HWXpaMXRUcXZPU3ZUZmhJ?=
 =?utf-8?B?ZGJGK1RoWFMwK2xiSGZiTWxUcHp0bHVJRGhIQk5WMitDN092YzV4T3BIcHcx?=
 =?utf-8?B?WWhNeDVBWG9xaFhIV3FZV0JJaDdmLzRmMlNuNEJraEQzazZXYnUxUThEbEo5?=
 =?utf-8?B?Z2VTWS85ZjUzRjBqSDl6NzBnVXN0QVcwa2pPdTRBLzNpTUhkQnQ2c3JFbHN0?=
 =?utf-8?B?Zkh5a2FjbDBBY3RsbVZVb0xqajV5Vm5Ybmtxd0hLZ1NFYzNjbEFOV25GZ0dC?=
 =?utf-8?B?QTBWZ1RkOUdPZ01oVExJZ0UwRWRYWmg0V0JnRVZsU0VNVmxHNWNMM3B5NWtu?=
 =?utf-8?B?ME1FaGRiNEgvR1lpVXNMYUdLazhqUG5KNElwQzUzTS9VZ3lBUUQ0OFB4cXpO?=
 =?utf-8?B?cGh5blBzVkVRcW5VazVEVmI1WGZBbWpYR2FKUi9Bd25MaDh5akZPM25aR29C?=
 =?utf-8?B?L3Q3ckpKVjMza3VSN2JyQ0FqNTNyWmVkUXplanRMSW1kNDBQODhzSUV4aUlI?=
 =?utf-8?B?eUtqMTN4ZjNiaFVYU1RLeHllK1RlTlRUYXA0RUhUcFM0OEQ3RXV3ZG9YcldN?=
 =?utf-8?B?NmhFdERtQkdaYkR5bDBPdDNoMllaWHdqZXhPdFdZVEg1RlFzb1BscGdwVVd0?=
 =?utf-8?B?L0FvN0NzUzk2cmFocG1aQkw2M2RuTVVuSEFGOE45aHh1ZlBheDUvbmJxc2J6?=
 =?utf-8?B?MmpGU1ZTeE15STVJbVk0eS80dCswdlJUTU5yNXp0MWxuYkxaUDN1ZkdlWkZD?=
 =?utf-8?B?bTVnd01MTDVOUXVHdlNRSVhhVmlYTXE4NE9nVnlEdHFSWHZaZEZZRlp4Wk01?=
 =?utf-8?B?TzhOb1pjWlhDRkZaT1UvQXZqZXJqdlhkMDFjelQzQmg1am9iejNYeDJpWlZs?=
 =?utf-8?B?ZHo2c1A1ckJ3RWdJUHBMZkFVTmhFSVVta0xjNU1EMHZRUjVXVi9qbWF3Tldh?=
 =?utf-8?B?OFFPMHdCbHJUVVVPTHhrc3lrRnNoWEhITHI4M0R3YWNJRWlFWmNPc25JblJ4?=
 =?utf-8?B?REh0MDFiMHYyQWJENmNQaFVtVk9ManVaUkFKQlpNeG12cHMzNHNBRkNtTkhG?=
 =?utf-8?B?M1I3N3R0bXZiYjdGa1Q4VU12R3dNL1VhU2tla0F2Mmt3YUh1ZTFmQlhEUHMx?=
 =?utf-8?B?bUo4VjlPZ1dKMUN4RkpULzlnbDBGWHc4OGhVeXFhTXFHQ2pvdnl5NnFpUStB?=
 =?utf-8?B?Rm43aFU1TVY5K0hpUGxxZVkxM3h0dmVYZnVrVkdPZjd4VWpDRldHdVFLWkF1?=
 =?utf-8?B?ZXhtRHF4alZjYW9ma3dxZWFnd3lwUmxqQlFyTU1DRWdtQ1ZqTUFIdVVDcEZs?=
 =?utf-8?Q?liGBhbRkO49GVvr/q1m1T+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABDCDC33229EF44DBC75DE2FB019BDDB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8667e52-a779-4f3e-466f-08dde1513676
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 07:55:07.8772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+cv9IWmsQdXAZzpw7RA11qtxRpMi0wYRFK91/z2oN5dYfl5un3luquwTtN22PXAOLBn1BAG3YKmCERTHkkb6XYBt0hoV6cLcguB5V4/tm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6383

SGkgVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdSBjb21tZW50Lg0KDQpPbiAyMS4wOC4y
NSAxODo0NiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+IA0KPiBMZW9uaWQgS29tYXJpYW5z
a3lpIDxMZW9uaWRfS29tYXJpYW5za3lpQGVwYW0uY29tPiB3cml0ZXM6DQo+IA0KPj4gSW50cm9k
dWNlZCB0d28gbmV3IGhlbHBlciBmdW5jdGlvbnMgZm9yIHZHSUM6IHZnaWNfaXNfdmFsaWRfaXJx
IGFuZA0KPj4gdmdpY19pc19zaGFyZWRfaXJxLiBUaGUgZnVuY3Rpb25zIGFyZSBzaW1pbGFyIHRv
IHRoZSBuZXdseSBpbnRyb2R1Y2VkDQo+PiBnaWNfaXNfdmFsaWRfaXJxIGFuZCBnaWNfaXNfc2hh
cmVkX2lycSwgYnV0IHRoZXkgdmVyaWZ5IHdoZXRoZXIgYSB2SVJRDQo+PiBpcyBhdmFpbGFibGUg
Zm9yIGEgc3BlY2lmaWMgZG9tYWluLCB3aGlsZSBHSUMtc3BlY2lmaWMgZnVuY3Rpb25zDQo+PiB2
YWxpZGF0ZSBJTlRJRHMgZm9yIHRoZSByZWFsIEdJQyBoYXJkd2FyZS4gRm9yIGV4YW1wbGUsIHRo
ZSBHSUMgbWF5DQo+PiBzdXBwb3J0IGFsbCA5OTIgU1BJIGxpbmVzLCBidXQgdGhlIGRvbWFpbiBt
YXkgdXNlIG9ubHkgc29tZSBwYXJ0IG9mIHRoZW0NCj4+IChlLmcuLCA2NDApLCBkZXBlbmRpbmcg
b24gdGhlIGhpZ2hlc3QgSVJRIG51bWJlciBkZWZpbmVkIGluIHRoZSBkb21haW4NCj4+IGNvbmZp
Z3VyYXRpb24uIFRoZXJlZm9yZSwgZm9yIHZHSUMtcmVsYXRlZCBjb2RlIGFuZCBjaGVja3MsIHRo
ZQ0KPj4gYXBwcm9wcmlhdGUgZnVuY3Rpb25zIHNob3VsZCBiZSB1c2VkLiBBbHNvLCB1cGRhdGVk
IHRoZSBhcHByb3ByaWF0ZQ0KPj4gY2hlY2tzIHRvIHVzZSB0aGVzZSBuZXcgaGVscGVyIGZ1bmN0
aW9ucy4NCj4+DQo+PiBUaGUgcHVycG9zZSBvZiBpbnRyb2R1Y2luZyBuZXcgaGVscGVyIGZ1bmN0
aW9ucyBmb3IgdkdJQyBpcyBlc3NlbnRpYWxseQ0KPj4gdGhlIHNhbWUgYXMgZm9yIEdJQzogdG8g
YXZvaWQgcG90ZW50aWFsIGNvbmZ1c2lvbiB3aXRoIEdJQy1yZWxhdGVkDQo+PiBjaGVja3MgYW5k
IHRvIGNvbnNvbGlkYXRlIHNpbWlsYXIgY29kZSBpbnRvIHNlcGFyYXRlIGZ1bmN0aW9ucywgd2hp
Y2gNCj4+IGNhbiBiZSBtb3JlIGVhc2lseSBleHRlbmRlZCBieSBhZGRpdGlvbmFsIGNvbmRpdGlv
bnMsIGUuZy4sIHdoZW4NCj4+IGltcGxlbWVudGluZyBleHRlbmRlZCBTUEkgaW50ZXJydXB0cy4N
Cj4+DQo+PiBPbmx5IHRoZSB2YWxpZGF0aW9uIGNoYW5nZSBpbiB2Z2ljX2luamVjdF9pcnEgbWF5
IGFmZmVjdCBleGlzdGluZw0KPj4gZnVuY3Rpb25hbGl0eSwgYXMgaXQgY3VycmVudGx5IGNoZWNr
cyB3aGV0aGVyIHRoZSB2SVJRIGlzIGxlc3MgdGhhbiBvcg0KPj4gZXF1YWwgdG8gdmdpY19udW1f
aXJxcy4gU2luY2UgSVJRIGluZGV4ZXMgc3RhcnQgZnJvbSAwICh3aGVyZSAzMiBpcyB0aGUNCj4+
IGZpcnN0IFNQSSksIHRoZSBjaGVjayBzaG91bGQgYmVoYXZlIGNvbnNpc3RlbnRseSB3aXRoIHNp
bWlsYXIgbG9naWMgaW4NCj4+IG90aGVyIHBsYWNlcyBhbmQgc2hvdWxkIGNoZWNrIGlmIHRoZSB2
SVJRIG51bWJlciBpcyBsZXNzIHRoYW4NCj4+IHZnaWNfbnVtX2lycXMuIFRoZSByZW1haW5pbmcg
Y2hhbmdlcywgd2hpY2ggcmVwbGFjZSBvcGVuLWNvZGVkIGNoZWNrcw0KPj4gd2l0aCB0aGUgdXNl
IG9mIHRoZXNlIG5ldyBoZWxwZXIgZnVuY3Rpb25zLCBkbyBub3QgaW50cm9kdWNlIGFueQ0KPj4g
ZnVuY3Rpb25hbCBjaGFuZ2VzLCBhcyB0aGUgaGVscGVyIGZ1bmN0aW9ucyBmb2xsb3cgdGhlIGN1
cnJlbnQgdklSUQ0KPj4gaW5kZXggdmVyaWZpY2F0aW9uIGxvZ2ljLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNreWlAZXBhbS5jb20+
DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBpbnRyb2R1Y2VkIHRoaXMgcGF0
Y2gNCj4+IC0tLQ0KPj4gICB4ZW4vYXJjaC9hcm0vZ2ljLmMgICAgICAgICAgICAgIHwgIDMgKy0t
DQo+PiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmggfCAgNyArKysrKysrDQo+PiAg
IHhlbi9hcmNoL2FybS9pcnEuYyAgICAgICAgICAgICAgfCAgNCArKy0tDQo+PiAgIHhlbi9hcmNo
L2FybS92Z2ljLmMgICAgICAgICAgICAgfCAxMCArKysrKysrKy0tDQo+PiAgIDQgZmlsZXMgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+PiBpbmRleCBlYjAz
NDZhODk4Li40N2ZjY2YyMWQ4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy5jDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+IEBAIC0xMzMsOCArMTMzLDcgQEAgaW50IGdp
Y19yb3V0ZV9pcnFfdG9fZ3Vlc3Qoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZpcnEs
DQo+PiAgIA0KPj4gICAgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZkZXNjLT5sb2NrKSk7DQo+
PiAgICAgICAvKiBDYWxsZXIgaGFzIGFscmVhZHkgY2hlY2tlZCB0aGF0IHRoZSBJUlEgaXMgYW4g
U1BJICovDQo+PiAtICAgIEFTU0VSVCh2aXJxID49IDMyKTsNCj4+IC0gICAgQVNTRVJUKHZpcnEg
PCB2Z2ljX251bV9pcnFzKGQpKTsNCj4+ICsgICAgQVNTRVJUKHZnaWNfaXNfc2hhcmVkX2lycShk
LCB2aXJxKSk7DQo+PiAgICAgICBBU1NFUlQoIWlzX2xwaSh2aXJxKSk7DQo+PiAgIA0KPj4gICAg
ICAgcmV0ID0gdmdpY19jb25uZWN0X2h3X2lycShkLCBOVUxMLCB2aXJxLCBkZXNjLCB0cnVlKTsN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmdpYy5oIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3ZnaWMuaA0KPj4gaW5kZXggMzVjMGM2YThiMC4uNDUyMDFmNGNh
NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS92Z2ljLmgNCj4+IEBAIC0zMzUsNiArMzM1LDEz
IEBAIGV4dGVybiB2b2lkIHZnaWNfY2hlY2tfaW5mbGlnaHRfaXJxc19wZW5kaW5nKHN0cnVjdCB2
Y3B1ICp2LA0KPj4gICAvKiBEZWZhdWx0IG51bWJlciBvZiB2R0lDIFNQSXMuIDMyIGFyZSBzdWJz
dHJhY3RlZCB0byBjb3ZlciBsb2NhbCBJUlFzLiAqLw0KPj4gICAjZGVmaW5lIFZHSUNfREVGX05S
X1NQSVMgKG1pbihnaWNfbnVtYmVyX2xpbmVzKCksIFZHSUNfTUFYX0lSUVMpIC0gMzIpDQo+PiAg
IA0KPj4gK2V4dGVybiBib29sIHZnaWNfaXNfdmFsaWRfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGludCB2aXJxKTsNCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgdmdpY19pc19z
aGFyZWRfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB2aXJxKQ0KPj4gK3sNCj4+
ICsgICAgcmV0dXJuICh2aXJxID49IE5SX0xPQ0FMX0lSUVMgJiYgdmdpY19pc192YWxpZF9pcnEo
ZCwgdmlycSkpOw0KPj4gK30NCj4+ICsNCj4+ICAgLyoNCj4+ICAgICogQWxsb2NhdGUgYSBndWVz
dCBWSVJRDQo+PiAgICAqICAtIHNwaSA9PSAwID0+IGFsbG9jYXRlIGEgUFBJLiBJdCB3aWxsIGJl
IHRoZSBzYW1lIG9uIGV2ZXJ5IHZDUFUNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJx
LmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+IGluZGV4IDEyYzcwZDAyY2MuLjUwZTU3YWFlYTcg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9pcnEuYw0KPj4gQEAgLTQ0Miw3ICs0NDIsNyBAQCBpbnQgcm91dGVfaXJxX3RvX2d1ZXN0KHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB2aXJxLA0KPj4gICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsNCj4+ICAgICAgIGludCByZXR2YWwgPSAwOw0KPj4gICANCj4+IC0gICAgaWYgKCB2
aXJxID49IHZnaWNfbnVtX2lycXMoZCkgKQ0KPj4gKyAgICBpZiAoICF2Z2ljX2lzX3ZhbGlkX2ly
cShkLCB2aXJxKSApDQo+PiAgICAgICB7DQo+PiAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VS
Ug0KPj4gICAgICAgICAgICAgICAgICAidGhlIHZJUlEgbnVtYmVyICV1IGlzIHRvbyBoaWdoIGZv
ciBkb21haW4gJXUgKG1heCA9ICV1KVxuIiwNCj4+IEBAIC01NjAsNyArNTYwLDcgQEAgaW50IHJl
bGVhc2VfZ3Vlc3RfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB2aXJxKQ0KPj4g
ICAgICAgaW50IHJldDsNCj4+ICAgDQo+PiAgICAgICAvKiBPbmx5IFNQSXMgYXJlIHN1cHBvcnRl
ZCAqLw0KPj4gLSAgICBpZiAoIHZpcnEgPCBOUl9MT0NBTF9JUlFTIHx8IHZpcnEgPj0gdmdpY19u
dW1faXJxcyhkKSApDQo+PiArICAgIGlmICggIXZnaWNfaXNfc2hhcmVkX2lycShkLCB2aXJxKSAp
DQo+PiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiAgIA0KPj4gICAgICAgZGVzYyA9IHZn
aWNfZ2V0X2h3X2lycV9kZXNjKGQsIE5VTEwsIHZpcnEpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy5jDQo+PiBpbmRleCBjNTYzYmE5M2Fm
Li40OGZiYWY1NmZiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMuYw0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL3ZnaWMuYw0KPj4gQEAgLTI0LDYgKzI0LDEyIEBADQo+PiAgICNpbmNs
dWRlIDxhc20vZ2ljLmg+DQo+PiAgICNpbmNsdWRlIDxhc20vdmdpYy5oPg0KPj4gICANCj4+ICsN
Cj4+ICtib29sIHZnaWNfaXNfdmFsaWRfaXJxKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGlu
dCB2aXJxKQ0KPiANCj4gSSBoYXZlIHRoZSBzYW1lIGNvbW1lbnQgYXMgZm9yIHRoZSBwcmV2aW91
cyBwYXRjaC4gVGhpcyBmdW5jdGlvbg0KPiBjb21wbGV0ZWx5IGlnbm9yZXMgTFBJcyBwcmVzZW5j
ZSwgd2hpbGUgeW91IGNhbid0IGFyZ3VlIHRoYXQgTFBJcyBhcw0KPiB2YWxpZC4gQWdhaW4sIGZ1
bmN0aW9uIGNhbGxlcnMgYXJlIGV4cGVjdGluZyB0aGlzIGJlaGF2aW9yLCBzbyB0aGlzIGlzDQo+
IGZpbmUsIGJ1dCBmdW5jdGlvbiBuYW1lIHNob3VsZCBiZXR0ZXIgcmVmbGVjdCBpdHMgYmVoYXZp
b3IuDQo+IA0KPiBbLi4uXQ0KPiANCg0KV291bGQgaXQgYmUgb2theSB0byByZW5hbWUgdGhlc2Ug
ZnVuY3Rpb25zIGFzIHByb3Bvc2VkIGluIHRoZSBwcmV2aW91cyANCnBhdGNoIGRpc2N1c3Npb246
DQp2Z2ljX2lzX3ZhbGlkX2lycSAtPiB2Z2ljX2lzX3ZhbGlkX2xpbmUNCnZnaWNfaXNfc2hhcmVk
X2lycSAtPiB2Z2ljX2lzX3NwaT8NCg0KT3IsIGluIHRoZSBjYXNlIG9mIHZnaWMsIGlzIGl0IG5v
dCBhIGdvb2QgaWRlYSB0byB1c2UgdGhlICJsaW5lIiBzdWZmaXggDQpiZWNhdXNlIHZnaWMgZG9l
cyBub3QgaGF2ZSBwaHlzaWNhbCBpbnRlcnJ1cHQgbGluZXM/IFdvdWxkIGl0IGJlIGJldHRlciAN
CnRvIHJlbmFtZSBpdCB0byB2Z2ljX2lzX3ZhbGlkX25vbl9scGkgaW5zdGVhZD8NCg0KQmVzdCBy
ZWdhcmRzLA0KTGVvbmlk

