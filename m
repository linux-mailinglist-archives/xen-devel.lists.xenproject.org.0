Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BBC7224F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 05:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166526.1493037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLvzo-0004gS-Kt; Thu, 20 Nov 2025 04:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166526.1493037; Thu, 20 Nov 2025 04:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLvzo-0004do-IA; Thu, 20 Nov 2025 04:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1166526;
 Thu, 20 Nov 2025 04:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sF88=54=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLvzn-0004di-26
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 04:10:11 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb3e9143-c5c6-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 05:10:06 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Thu, 20 Nov 2025 04:10:00 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 04:09:57 +0000
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
X-Inumbo-ID: cb3e9143-c5c6-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+eDAb8Yuz+sj1QbthWAc2qSFd5ogy8oMbuiBvHopl0edGjE1ntLHu/sQlK9Dt2ZLSizT+SHiUnDiVBUrQn0YB8fSYUFYgctOehdppVGlPDeap6WBwgW3eUlzmtWra5qJLNyqQ1RRw1RKJjrzhu2WltsUOYgfI9iz86tGUughjHtgDxv86oM3VMfObQqWzhcR9iZ/AxziTRTVuBT5iHcEBZmEAaSHPfqKN8lV4hrwkkrgOoZK0EU26WReCV37aOBWSF8l8ipv63XNLK7BjcC6dlwYy5jhyO1GvFbFznRXzZvfPMpepYS5ihNutfYuiG3goiqgLjaPmfT0NWv8jCFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFztgpEeeeIvO7rAoYPXmnwqaR9zXoVttoavI78r6Bs=;
 b=uc7tsrDxCH0GQrCBEg3WfixGSGbr0e2NPv81mjYJuvHOCcfU/YteraMvuMzcvspLsmKGVn4vSersTdAWwNvUh8iWEGQ4IvD2so+Dmk9sF5E/yTbKnOkMSg7x2Ed1keP6Vn5gFe8caeefdeAiQ0fHTgXFQg70CteKbsSkkxhn64FLmm8OyGI2eLP3Ci5XYCYrVv3Sz/8KVy5YCzRPuM26Baq6RNub9ioenX7psXyPadMCySIsDBjEKOzeG8C/1ZOAQNeuKmAoNRTFzqWEwNfA7ViZa8O7WSezv9/n1flTl8gP+oqE8W104RswUzuGu8IINlOIvFdAwLNjmIpEznpGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFztgpEeeeIvO7rAoYPXmnwqaR9zXoVttoavI78r6Bs=;
 b=hABrYTssWprybGL9dd/Lhqvnb0H0mXEZrMwEkBqb7iRnet3IMFwKrx7jghtbaflq+CEsXqh4lV+hCtxCOuHTQI1mTuSMpjexTgqhEZvUxfes4lk6r+GuGqvGg7JukVOBae7jNtAWD8gGqsjNDeVQRJrSmoC+NMwvQsEbMD1qWRo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "Andryuk, Jason" <Jason.Andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcPCqhC21cJdWa5E25eCgk7enLhrTazScAgB1wfK+AAAbwUIAAxogAgAIjbCA=
Date: Thu, 20 Nov 2025 04:09:55 +0000
Message-ID:
 <DM4PR12MB84515DFA314A150C4E0C5B45E1D4A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-29-Penny.Zheng@amd.com>
 <c18cdb1c-f2b3-4eeb-b064-670c86e19e67@suse.com>
 <DM4PR12MB84511357C8F6FB1976244CA0E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <ea81a0f2-d3d9-41f4-ae88-1426123129a6@suse.com>
 <DM4PR12MB8451B211FB0F01DD1F744502E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <120bb273-60b2-4405-8db6-defc27715250@amd.com>
In-Reply-To: <120bb273-60b2-4405-8db6-defc27715250@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-20T04:09:49.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CYYPR12MB8989:EE_
x-ms-office365-filtering-correlation-id: 0272605d-767a-4c39-2ea6-08de27eaa971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1grMzZHSWhoaUxZYUkzQ3NqcWdJRll1bzdpR1cxWWIvaFR4ZTFpdGtJYnhE?=
 =?utf-8?B?eUlDNUdVRENZb0tDU0wrNWw4cTg1ejBNS3lsUUdJS0N5eVFOd01JN081NGlm?=
 =?utf-8?B?U0xWczNjM01ndHdQTDk0eVBRMnZFcnY3MTJOZmxscTJSK0pYMEROd2I0Q1NU?=
 =?utf-8?B?NjVDSHNSWmY3UHFaNHc1UlZoMXZxU25SOVVDaG9TWkRwbmk2aFdiQ0lvUHVy?=
 =?utf-8?B?ZkZJMmVyZHppV3hYRVZqY0MyMW41ZGcxR3MwNWJOY2lwY1FiUkhscjFDOXpw?=
 =?utf-8?B?aXJQaUtVSHRCOTZGTFZsQ1FZTlVUTEFFY0tDTzBRM2JMTGNRQVBjVDNvOGFO?=
 =?utf-8?B?NXdJajl4NTNUQWRhTXIzaXo1R3J4NUdHZDBQbUplb3N0QVNDa25FRE9HdlR6?=
 =?utf-8?B?OUlYd0JCMjI0TDVFSlNQdCtXQ3Y2WXEzd0duN2NLRkV4Rm9Va3ZvVVhKV0dw?=
 =?utf-8?B?eXFoeFNMdDdoVXVFSm5JVTBLRjRQUzZ2OUk0SjJNdXNOVHpzVWpVY1BDSmt6?=
 =?utf-8?B?RGcyelYzWUJCRm14M2FpMUVBNHl1UnJvUm8rakNTZlJGMG5vWEVBUFp1dlRQ?=
 =?utf-8?B?b0U0U3YvL00yYW1zTmNaU2NMZUVEYkNaTlluM0J3SDc5L1d5QzB1RHdmekNv?=
 =?utf-8?B?b0NzV01KbCtaUDEwN2dhN1F5R1R1K2xnVVdmYXJLN2kyTFkyVHFpT2p3c2RJ?=
 =?utf-8?B?ZjZrVlRta1FBMlU4aFhFY3FhcjdNOTYrVmEyV3pLWlBUbzdIcHZ3VDArYnN0?=
 =?utf-8?B?TGhGdHd1SmRITnBtbEhMNVdRSXUreG9RN1Zydkk1VUMrUU5sVGxMbmhzSXg1?=
 =?utf-8?B?SUVWUitORnp2aUl0eXBhMlcrMG0zK2JxQnZRTDNjUmFMbnI2d20vcW5VaXBi?=
 =?utf-8?B?d0poMnpKenk0ZTA0VmlwRWxaZFJsL0NMV2lYUG5POWlXcTVrZXo5OVl4ZDhO?=
 =?utf-8?B?Zm1pQzVFTXdtZmJ4UXNOanpGcitZTVMwSHcrc2VLM2FqUi9MZUY1NXB4K0t4?=
 =?utf-8?B?eUZaNE9OdVdJZHhrU3JFcjRvMThBTlgzTWwzYTQ1cGFFSXA3dkp2WkluVzNx?=
 =?utf-8?B?T3p2YnVtN21mZlJRbEVwbml6eUlNU0J5MG1xRlR6cjRkM0pyQnl3cDFURmd3?=
 =?utf-8?B?Zk5pRDJjYmhRRHJ2Ym5hQk5wRG5vNnl0dm83QUdDUFUrcUw0UHhHRW8rbkli?=
 =?utf-8?B?ZEUxQndGcDlkcEQrdFZXZU5JYis3b2UxeTVtTWd6bUlhb3VpVWVkTFRPZ2ZL?=
 =?utf-8?B?M25rcEpteHg5V25US2cyVlBkY2FsdjVZc0tQQW81SXVHcWhLb3dtRlo1RStO?=
 =?utf-8?B?QUE5WEQxaWRhWE9jam9hZnpMcEpaY1hEQUF1V2FpSzhlUlJaRFJsNGdFTmY2?=
 =?utf-8?B?Z1dhS2ZKeEFmU1RoUnh5cnBnN0tENTc3TnVsTGZxVkRHbG9TRTFxNE95VFNo?=
 =?utf-8?B?YVBRSDNlZk9CdVg0M3J5em9IdzYxZTYxcEpud21VK3ZSeDZWNC81eEpvNmlH?=
 =?utf-8?B?NzZRK21od0VMeHFUaEJyZ2luSzk1aW1mUVFqRkt4eHVlclErK0NDanZ1czc5?=
 =?utf-8?B?a2Y4U0s2cXgyYXVLbVhmNFZBVVNtSkZLUGYySHZWcXZWUkZ0clJFMXFRZzZP?=
 =?utf-8?B?L3hUa3J4NlN3cEsrejBrTXNBbTQzYXFWN3ZMRGdyNndGeUFJaENuTlBoVGtY?=
 =?utf-8?B?S2xESkw1V1NZL0F6UEtMZlJmYjZidDhPdHp3RWp6TlltZ29SRG5pTVpRMmJL?=
 =?utf-8?B?bG4rN212NlNhZWFXZk1rUHFlbnZUcWp4MjllRU9WdWh5UXp2RXV5RHBQaEEy?=
 =?utf-8?B?K3BaemNQUzBYc0NDcmU4M2M2VkY1YWd4aXRmRWYxTlhIeWF0TUZ4aWFCQmpD?=
 =?utf-8?B?SXBqK3FkV1NyQnlTbm9rTFJPYzZrdDJzOThQL0djYXhMd2RCRU1IYmQ2cmxs?=
 =?utf-8?B?bHN6WmtlYXFDcms3SjJWTno3Vkt2OEY1Ty9RWlgwYmF6TUlhQVVSeitIRmVp?=
 =?utf-8?B?UXBUUVJVaGR3SmJEMFVFOG02d0xjY1N0U0ZwVVhhcWFYSUZVczZ0Q1QwaWhZ?=
 =?utf-8?Q?KJRldz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eldKazV1S0NpZTNBMytTREtXUmduRnQvekVFblNxN2JIYTd0ckhQcEJjUTFl?=
 =?utf-8?B?R3hEQkIxS2thSWlmaEFsL3VQOFpPU1ZLR2owMzVrQ1lkelROKzFQbHZPT3RI?=
 =?utf-8?B?TE5QM2lrOWhYV3dXalB4NjdrdGlVVmxVSzBYMUFJMnVyb0U4QTR4Rlp4aFN5?=
 =?utf-8?B?QVBqS29nd3RnUVZpVEM3NTIwWjVSNWlSb1FZSGdzZEpmYnY3T05acGluUUF0?=
 =?utf-8?B?eEkza280MTkwTzVXc1FPbVJNempHZjF4YlBXY25VMGEzOTlhY3VZdXdOeVRS?=
 =?utf-8?B?SnhXZFNLYWZNVkpDYnl6Rkl5eFB2MGNDZlRiTmVXaUE0U2Ezc3NSUlJXVFFY?=
 =?utf-8?B?MkpweWVWSkkra3RvT1YyRmxHajAzQ002TE5rU3htY083WHdOakxtdVNmcDlV?=
 =?utf-8?B?K2taOXlWdlRPYzBHUExXRFZWR3NWMmdHSmdIdW1Mejl4QVJkYkZjUkVDUFZC?=
 =?utf-8?B?Yks1LzQ3bW1mckk1Ri9CVHZaajIwQ0ZrdEY1YktWeW1UL2RYWno4ZW0yT2tr?=
 =?utf-8?B?aW9qYkErVE15Yk9pOUxSWHVNR1ZJTm5GV01zU0xLR2RWKzA2OE44RGs1TnVG?=
 =?utf-8?B?STVXQkM3YlJtZ2djaVlGZVF2TmdTTXFHSE41M2dFaG5RZjVGaE8za01QOFZF?=
 =?utf-8?B?cWNMSnFQKzNMS1NTTW5qeVdaMVJoNlh5QnptN2YyVWpqT0JVWTdIUXRXQldu?=
 =?utf-8?B?SDVicUVaSTV0SGt1NFFsaVF0NjhOTEpIOG81RW5LSHlFZDN3RXNnZUFGY1M5?=
 =?utf-8?B?SndlZDRtaEVuWXRPQVlPdnlLVVFaY0RLZFkyQ3dKalNnTDhUZ1FUNlozRXMr?=
 =?utf-8?B?MnYrMzBsQlVnTjRnVElSenRHTXN2OEl2TzNwTXJrMS9yVXB5TXhuUURFSzlw?=
 =?utf-8?B?cDVxR1MvcTJwUi85Rzh3VXE5alJFa1hoTDZjT3Q1TnBFYWlQU3hvZlZSZlQ0?=
 =?utf-8?B?U1lEUmhDZ2dhT2tIaTZSd1A0UWllL00yMWVkL2cxOTkwSXRhYUxUcGhCcnlx?=
 =?utf-8?B?V1NYOUJzRGErbW5pb3F0WUpWR3piWlp5T2prV1FnZzdsZEtHaUVkTlF5VWsy?=
 =?utf-8?B?THlKQzVlbWJxYmpGSVRGYmQvdTV4QmdvbFpRZTh2UnBqNnJNU2JobGhlVnM5?=
 =?utf-8?B?VHNiaTFsa0Z1RDZjRlNGYUdCSmFlMkw4eXg4eXh3SEtjclRLZHZ3cmpCUUsw?=
 =?utf-8?B?V201ZEM5c0lWWjZoeVZRZXpBQ1RvSXdaWnlKQXR2dVFHTVdub3B5WFF6TVRp?=
 =?utf-8?B?U1ZUVEJCZmFabFc2UnhCQUNySkd1bjdteGpjcHFXWnhzam5PaFJ6R05DUzMx?=
 =?utf-8?B?WHBPem9JaU5VQnNOYTZnTEE3YkY2emQ1amI4b3ZtNit0dkFZbTVKRmZHL3Vw?=
 =?utf-8?B?ZjlxUzJMUGJsdjdaWC9oZ2lkZmExcmFyVjMvK1l3ZlM1SHVRZW5HYVhqc2N1?=
 =?utf-8?B?TXFLTVJ1LzV6N2s1S0tZMHVnaTFsZ2c1U1p6bzlGY1VKRC84VnNlU3ZUUHl0?=
 =?utf-8?B?VjhkR2JlMHZ4eU5lVEw5OU54SjJmVVFSN09UZmU4NHRQQ2tWblRFZURZKzZP?=
 =?utf-8?B?dUhvYWZmalFubTB1U1VKTWRMU1h1WklWcFpIN3l5UXdMcEY0NVUxNk9qUVlQ?=
 =?utf-8?B?TlBWMXRJRyswQ0JYcE9jYnVJYkdtdXJ4ampoU1B4KzUwY2gxZEhuT05VKzdD?=
 =?utf-8?B?UEdscENkK3NJaTg4R1ZjbTB6UzE5cGdxbU9YMXB4ekNDS216cllnU2ZCWVJF?=
 =?utf-8?B?bWNlSkt2YnlZOFJreE5WZ3NSaStpT1dhQlJ2dXdiQStKYWJMdnk2VStoeWh0?=
 =?utf-8?B?aE1LZ2QyODJ1MjA2TXl2ekFBaTJZRkh5dFFHUE5YVmphS3ppMVNuMGgzVHc2?=
 =?utf-8?B?SnZtUFJOczNzZ1hJY0g2SHRLNUtQZFRWdnhickJFVGt1RVlVdllDejRPem96?=
 =?utf-8?B?MnNTdkI3eXFDOVNKV2dNbW5Gc3NLM3MvZ1VvUzQvMnlURmNUd2ZnL0JKWHRa?=
 =?utf-8?B?VGVlSi91elRxcm9oSFlYWlVzU0drVkJOcXFTck9TeUFNZ3FucHdpTjgwWWhl?=
 =?utf-8?B?R3hpSUtrczlzbDlxeTlHYUJLOUxad3ZQOU5IREZRY3pZVEh0dzlzK2hwRjNk?=
 =?utf-8?Q?7nbc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0272605d-767a-4c39-2ea6-08de27eaa971
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 04:09:55.1364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8tpCK+Ln4wu1ZSgqXZKt0xYDCVQrN3AfrBXKHdBvhEsJTLnIgh9AVsIVIfadK08659E++JvqlvscNG5n6Jkrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBB
bmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1i
ZXIgMTksIDIwMjUgMzozMCBBTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQu
Y29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogSHVhbmcsIFJheSA8
UmF5Lkh1YW5nQGFtZC5jb20+OyBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbTsgQW5kcmV3DQo+
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxh
bnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFt
ZC5jb20+OyBKdWxpZW4NCj4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAyOC8yOF0geGVuL2RvbWN0bDogd3JhcCBjb21tb24vZG9tY3RsLmMg
d2l0aA0KPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+DQo+IE9uIDIwMjUtMTEtMTggMDI6NTEs
IFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTgsIDIwMjUgMzoxNCBQTQ0KPiA+PiBU
bzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+PiBDYzogSHVhbmcsIFJh
eSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbTsNCj4gPj4g
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJE
DQo+ID4+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbCA8TWljaGFs
Lk9yemVsQGFtZC5jb20+Ow0KPiA+PiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9n
ZXIgUGF1IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyOC8yOF0geGVuL2RvbWN0
bDogd3JhcCBjb21tb24vZG9tY3RsLmMgd2l0aA0KPiA+PiBDT05GSUdfTUdNVF9IWVBFUkNBTExT
DQo+ID4+DQo+ID4+IE9uIDE4LjExLjIwMjUgMDc6NDMsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4g
Pj4+IFtQdWJsaWNdDQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6
IFRodXJzZGF5LCBPY3RvYmVyIDMwLCAyMDI1IDk6NDAgUE0NCj4gPj4+PiBUbzogUGVubnksIFpo
ZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+Pj4+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVh
bmdAYW1kLmNvbT47IG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tOw0KPiA+Pj4+IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA+Pj4+
IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVs
QGFtZC5jb20+Ow0KPiA+Pj4+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQ
YXUgTW9ubsOpDQo+ID4+Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+ID4+Pj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDI4LzI4XSB4ZW4vZG9t
Y3RsOiB3cmFwIGNvbW1vbi9kb21jdGwuYyB3aXRoDQo+ID4+Pj4gQ09ORklHX01HTVRfSFlQRVJD
QUxMUw0KPiA+Pj4+DQo+ID4+Pj4gT24gMTMuMTAuMjAyNSAxMjoxNSwgUGVubnkgWmhlbmcgd3Jv
dGU6DQo+ID4+Pj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+Pj4+PiArKysgYi94ZW4v
Y29tbW9uL0tjb25maWcNCj4gPj4+Pj4gQEAgLTY0NiwxMSArNjQ2LDEzIEBAIGNvbmZpZyBTWVNU
RU1fU1VTUEVORA0KPiA+Pj4+PiAgICAgICAgSWYgdW5zdXJlLCBzYXkgTi4NCj4gPj4+Pj4NCj4g
Pj4+Pj4gICBjb25maWcgTUdNVF9IWVBFUkNBTExTDQo+ID4+Pj4+IC0gICBkZWZfYm9vbCB5DQo+
ID4+Pj4+ICsgICBib29sICJFbmFibGUgcHJpdmlsZWdlZCBoeXBlcmNhbGxzIGZvciBzeXN0ZW0g
bWFuYWdlbWVudCINCj4gPj4+Pj4gICAgICBoZWxwDQo+ID4+Pj4+ICAgICAgICBUaGlzIG9wdGlv
biBzaGFsbCBvbmx5IGJlIGRpc2FibGVkIG9uIHNvbWUgZG9tMGxlc3Mgc3lzdGVtcywgb3INCj4g
Pj4+Pj4gICAgICAgIFBWIHNoaW0gb24geDg2LCB0byByZWR1Y2UgWGVuIGZvb3RwcmludCB2aWEg
bWFuYWdpbmcNCj4gPj4+Pj4gdW5uZXNzYXJ5DQo+DQo+ICJ1bm5lY2Vzc2FyeSINCj4NCj4gPj4+
Pj4gLSAgICAgaHlwZXJjYWxscywgbGlrZSBzeXNjdGwsIGV0Yy4NCj4gPj4+Pj4gKyAgICAgaHlw
ZXJjYWxscywgbGlrZSBzeXNjdGwsIGRvbWN0bCwgZXRjLg0KPiA+Pj4+PiArICAgICBCZSBjYXV0
aW91cyB0byBkaXNhYmxlIGl0LCBhcyB1c2VycyB3aWxsIGZhY2UgbWlzc2luZyBhIGZldyBiYXNp
Yw0KPiA+Pj4+PiArICAgICBoeXBlcmNhbGxzIGxpa2UgbGlzdGRvbWFpbnMsIGdldGRvbWFpbmlu
Zm8sIGV0Yy4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgaXMgc3RpbGwgdG9vIGxpdHRsZSwgaW1vLiBG
b3Igb25lIEknbSBub3Qgc3VyZSAidXNlcnMiIGlzDQo+ID4+Pj4gcXVpdGUgdGhlIHJpZ2h0IHRl
cm0uIEknZCBzYXkgaXQncyBtb3JlICJhZG1pbnMiLiBBbmQgdGhlbiwgYXMNCj4gPj4+PiBtZW50
aW9uZWQsIHRoZXJlIGFyZSBhIGZldyBkb21jdGwtcyB3aGljaCBhcmUgdXNhYmxlIGJ5IERNcy4g
QWl1aQ0KPiA+Pj4+IGRldmljZSBwYXNzLXRocm91Z2ggbWF5IGFsc28gYmUgaW1wYWN0ZWQsIHdo
aWNoIGltbyB3aWxsIHdhbnQNCj4gPj4+PiBtZW50aW9uaW5nIGhlcmUgYXMgd2VsbC4gT3IgZWxz
ZSwgaWYgdGhlcmUgaXMgYW4gaW1wbGljYXRpb24gdGhhdA0KPiA+Pj4+IERNcyBhcmVuJ3QgdG8g
YmUgdXNlZCB3aGVuDQo+ID4+IE1HTVRfSFlQRVJDQUxMUz1uLCB0aGF0IGlzIHdoYXQgd291bGQg
d2FudCBjYWxsaW5nIG91dC4NCj4gPj4+DQo+ID4+PiBIb3cgYWJvdXQNCj4gPj4+ICINCj4gPj4+
ICAgICAgICAgIEJlIGNhdXRpb3VzIHRvIGRpc2FibGUgaXQsIGFzIGFkbWlucyB3aWxsIGZhY2Ug
bWlzc2luZyBhIGZldyBiYXNpYw0KPiA+Pj4gICAgICAgICAgaHlwZXJjYWxscyBsaWtlIGxpc3Rk
b21haW5zLCBnZXRkb21haW5pbmZvLCBldGMsIGhlbmNlIGxlYWRpbmcgdG8NCj4gPj4+ICAgICAg
ICAgIGhhdmUgYW4gaW1wYWN0IG9uIHhsLWRldmljZS1wYXNzdGhyb3VnaCBhbmQgcmVzdHJpY3Rl
ZCBETS4NCj4gPj4+ICINCj4gPj4NCj4gPj4gTXVjaCBiZXR0ZXIuIEhvd2V2ZXIsIHdoeSAieGwt
IiBhbmQgd2h5ICJyZXN0cmljdGVkIj8gTmVpdGhlciBhc3BlY3QNCj4gPj4gbWF0dGVycyBoZXJl
LCB1bmxlc3MgSSBvdmVybG9vayBzb21ldGhpbmcuDQo+ID4+DQo+ID4NCj4gPiBMYXRlciwgaW4g
aHlwZXJsYXVuY2ggc2NlbmFyaW8sIGRldmljZSBwYXNzdGhyb3VnaCBpcyBzdGlsbCBuZWVkZWQs
DQo+ID4gYnV0IGl0J3Mgbm90IGN1cnJlbnQgZGV2aWNlIHBhc3N0aHJvdWdoIG1vZGUsIHdoaWNo
IGRlcGVuZHMgb24NCj4gPiB4bC10b29sLXN0YWNrIHRvIGRlLWFzc2lnbiBpdCBmcm9tIGhhcmR3
YXJlIGRvbWFpbiBhbmQgcmUtYXNzaWduIGl0IHRvDQo+ID4gZ3Vlc3QuIEl0IHdpbGwgYmUgbGlt
aXRlZCBpbiBib290LXVwIHN0YWdlLCBhbmQgY29uZmlndXJlZCB2aWEgZGV2aWNlDQo+ID4gdHJl
ZSBvbmx5LiBGV0lVLCB3ZSBtYXkgcmV1c2UgVlBDSSBmcmFtZXdvcmssIGJ1dCBjb21tYW5kcyBs
aWtlICJ4bA0KPiA+IGFzc2lnbi9kZWFzc2lnbiB4eHgiIHdpbGwgbm90IGJlIG5lZWRlZCBhbnlt
b3JlLiBQTFogY29ycmVjdCBtZSBpZg0KPiA+IHVuZGVyc3RhbmQgd3JvbmdseSwgQEFuZHJ5dWss
IEphc29uDQo+DQo+IFllcywgdGhpcyBpcyBjb3JyZWN0Lg0KPg0KPiA+DQo+ID4gQW5kIERNLCBs
aWtlIFFFTVUsIGlzIHN0aWxsIGFwcGxpY2FibGUsIGJ1dCBvbmx5IHN1cHBvcnRzIGEgbmV3IG1h
Y2hpbmUgdHlwZSwNCj4gInB2aCIuDQo+DQo+IHZQQ0kgaXMgdXNlZCB0byBhc3NpZ24gdGhlIFBD
SSBkZXZpY2VzIHRvIGEgUFZIIGRvbWFpbiBkdXJpbmcgYm9vdC4NCj4gUUVNVSBpcyBwcmVzZW50
IGFuZCBwcm92aWRlcyB2aXJ0aW8gZGV2aWNlcywgYnV0IGl0IGRvZXMgbm90IHBsYXkgYSByb2xl
IGluIFBDSQ0KPiBwYXNzdGhyb3VnaC4gIFNvIGZhciB3ZSd2ZSB1c2VkIGluZGVwZW5kZW50IFBD
SSBzZWdtZW50cyBmb3IgdlBDSSBhbmQNCj4gUUVNVS92aXJ0aW8uDQo+DQo+IEFueXdheSwgbWF5
YmUgc29tZXRoaW5nIGxpa2UgdGhpcyBmb3IgdGhlIGhlbHAgdGV4dDoNCj4gIiIiDQo+IE1hbmFn
ZW1lbnQgaHlwZXJjYWxscyBwcm92aWRlIHRoZSBtZWFucyBmb3IgZG9tMCB0byBtYW5hZ2UgdGhl
IG92ZXJhbGwgWGVuDQo+IHN5c3RlbSBhbmQgb3RoZXIgZG9tYWlucy4gIFRoaXMgaW5jbHVkZXMg
dGhlIGh5cGVyY2FsbHMgbmVlZGVkIHRvIGNvbnN0cnVjdCBuZXcNCj4gZG9tYWlucy4gIEluIGEg
ZG9tMGxlc3Mgb3IgcHYtc2hpbSBidWlsZCwgdGhleSBjYW4gYmUgb21pdHRlZCB0byBjdXQgZG93
biBvbiB0aGUNCj4gWGVuIGJpbmFyeSdzIHNpemUuICBIb3dldmVyLCB0aGlzIGNvbWVzIGF0IHRo
ZSBsb3NzIG9mIHNpZ25pZmljYW50IHJ1bnRpbWUNCj4gZnVuY3Rpb25hbGl0eS4NCj4NCj4gVW5s
ZXNzIHlvdSBrbm93IHdoYXQgeW91IGFyZSBkb2luZywgeW91IHNob3VsZCBlbmFibGUgdGhpcy4N
Cj4gIiIiDQo+DQoNClRoeCEhISBJJ2xsIGNvbWJpbmUgdGhlbSBhbGwNCg0KPiBSZWdhcmRzLA0K
PiBKYXNvbg0K

