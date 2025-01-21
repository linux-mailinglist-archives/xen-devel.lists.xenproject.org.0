Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08BA17742
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 07:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875111.1285431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta7c0-00088m-DR; Tue, 21 Jan 2025 06:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875111.1285431; Tue, 21 Jan 2025 06:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta7c0-00086W-AF; Tue, 21 Jan 2025 06:19:44 +0000
Received: by outflank-mailman (input) for mailman id 875111;
 Tue, 21 Jan 2025 06:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcK4=UN=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ta7by-00086L-En
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 06:19:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2009::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1b7911b-d7bf-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 07:19:40 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 06:19:37 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 06:19:37 +0000
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
X-Inumbo-ID: b1b7911b-d7bf-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOwue6UZbWc2qwe129o8ULdwZ7t7oIMGn2SDiVgthGzbRTaBkHefeGZ2OQx7fLn2vjZqB4qt+U+a4osT5AcBO39pkVcejiVhmHogd0t8WHmh2kMlxASn2A26qK5ezVIDmyy+stzq+VcrKuy4+9BoKJvtZ5xeyqym1Bxl/C4A7dYC/yDVgDCxhnJWgUQn+LaXW0dlj+lHDWMyoy8ka+p+wT7PKi3Gs26hI3ZN+on6BSvlSoEiFw/Z0I3LjpPNiqNPB+SBjmoVikwgsdSD/xF32RdjmlOExnAXBRHRarYGywlNpk0cJs9e1m3iqSBi44EB+o+GUyqVB2+TrWg5rBhw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZB/lM3mqHRulFmPNjWYrE4z9pniZHNsTosKeURX3eo=;
 b=l0ckpZaSVwfVx8nPWtGyqFrkVQzbLKf3OP36gqLmBaKr/JF5LqMLv7QIqvZenDL9Or599IUB68c2YC7RGmUviQu99+TT0DztR6NPCf/ZwnleUDedHNWR/uPf2rl2lipWuLzU/r+D5+1kxIcwrJkfz2bOUzeI19BAs2p4l83jpk/DTbv36pwxSe/MLoxGVZO8fp8st371m+hpc7HMuG+kcksypLrgGyfYj5IeD0WJvsuiVV1ecNH4KSg3+vSoyI46k+FSEu63erEUqif+yKggOjjRn9cM9IQmks/luUmb7A+9rOyf6Esx1B9mxpC044upAKrr/T+vO9wjYNuZQCr+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZB/lM3mqHRulFmPNjWYrE4z9pniZHNsTosKeURX3eo=;
 b=aDX16ecnGVB28iumcMTD7UJCNeps7RIA3Ug4hBxAHsrakD4e10WrdQup2sJPEK9kigT4Oxij7dEbTnQ0ydNp5sGFzBNm6fUEhgTi1tm+kv+8KzPuj8T+W6SmxFwaLBacoBUaJLzysxxqEdsQMV2UnyO9XB0WKfZ9r5Wia3G0lKM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5] vpci: Add resizable bar support
Thread-Topic: [PATCH v5] vpci: Add resizable bar support
Thread-Index: AQHbZjRJ+4D0uojYEUmC9gRuRAux1rMf1XqAgAF7xoA=
Date: Tue, 21 Jan 2025 06:19:37 +0000
Message-ID:
 <BL1PR12MB58493331595F4C3AB561DA2AE7E62@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
 <3e535294-8e68-476f-9958-d8c870f85f7c@suse.com>
In-Reply-To: <3e535294-8e68-476f-9958-d8c870f85f7c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8356.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA0PR12MB7627:EE_
x-ms-office365-filtering-correlation-id: 64bbc25f-849d-4ee6-fc17-08dd39e394a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Wnd3Wk5ocm9yWkJZT2kydC9yWWNFTWJhNi9wd2QzVDB4ck9yODZxQlNyMzl1?=
 =?utf-8?B?b24wMXVDN2NNK1JMeDdFNzV0eUxtYnNVeE1tVmd1WWFYaXJpV0M4RytBL1J3?=
 =?utf-8?B?ckpJVENnREtML2grOHU2UmdGZ2c2aDA2bUU4RlhsTWVmd3hQSUI0Wm5uUUV2?=
 =?utf-8?B?Si8vT3FJenhGZ0c1UWJGZVJaY0t2aXdUWUNwaGhEL1Q1TVBBd2IxVzVFdE9J?=
 =?utf-8?B?VjYxTDBmWEFGbzNZUTV0enlucWZYZS90a2VKaGVrNXVzSzV2V2crazZTV1Rn?=
 =?utf-8?B?SjhCWHV0dkVueTBFVWkvQXhFVlhMeXc5WXNpcTVqUjFGYUo4YVU4Y3VUc1NG?=
 =?utf-8?B?WTZubUE1Wk5rdGpIL2MrZm1yMVhSQmZ5Mll6SjNHR05ha1BvUHpsM0dIQXZX?=
 =?utf-8?B?VGxzQ2ZPa2h2MFk5NlRTK0x1Z3ZYWUc1T2NaQmFQNGJTeU1jN0d0VkdiUC9u?=
 =?utf-8?B?L1g3dkloQVljQ3c4clIzVHlzL0FUdnpiUmpZSk8rQXdqOWptUDV0cit1UkZL?=
 =?utf-8?B?SHptdWJMKzZWOUlCL2xuMkplSkxIakR3Q2pDbCtPRVdmVjlmL2dtQlZNYmJE?=
 =?utf-8?B?MEZDNEhLUTNxWWIzbGcvcmp0ajFlWDVUWmF0cXhwQlVTRm81S3J6ZmpBNkEr?=
 =?utf-8?B?NjZ6akZTYm03d0txOXZRQVdiT2luUTJVOWdMbHlaeE9IM245OVN1RVNMUzRK?=
 =?utf-8?B?TklZeUpQZ3llVHBEVWVtMjJxbTB1aG9jK0FQN0RrRVB2N2FHV2hCaXkyVDNH?=
 =?utf-8?B?d0hBenhJSnN2QlN3bFU0Yk5pRjI3K3Q2UC8rQVI1Y0xvc3pia2MzcXErcHFC?=
 =?utf-8?B?bmc0S29Vc1R3Y1J1dFRZYmJlOEc4SVVTZlFGUm03OHlKMTlWSmw2bCtadUIz?=
 =?utf-8?B?K2RWYWFDY1RYV3hkLzR3aUd5dGRWRlMvTkFFaDBUOVJ0RTBlQU9ZRURRTVp5?=
 =?utf-8?B?RG9xZHRGR3J3bUhlOEhhUzZ6am5iY05MdVVSU2dBOVc4YURiNG5RUCt0N0s3?=
 =?utf-8?B?RDlVL1cxU3JzcGNFL0RHRW5LL3p3a0VYVEVRMUhCemdKcFdnd1NxMnM2SEdv?=
 =?utf-8?B?aEZoNm5GNHJVcmNRVkQ1M0x6aFFzTFErTkdIWkVKYVVVMGVEeDM3Q1hhbzVC?=
 =?utf-8?B?L0RIRVY0d28xK3FtUXVqZ29rOXJlWGRhTlNkamgwOCtFSTBsaTk5aGRROU5i?=
 =?utf-8?B?ZlNzK0Z6aEtlMEVzS0puMlpIbTNuQzdYalR0QTlqbjNhTjdWKzF1MkY2QUhQ?=
 =?utf-8?B?OHJxNm5Ba0hHelVaanVUVkwxRG52MlhjeGZBL09TQW5FcmNSM3Joc0ZvdG5H?=
 =?utf-8?B?VmMxdmQyd0ZFejYxdVFnOHh3UFEvQWZnS28vb2c3ZlgyTjlxbzhLMWkrVUhR?=
 =?utf-8?B?RHhFMEx0TExPSG1GNGhveXA5d2R0dEpuOU1ERUtpVmNwWUV4VGlmOUFBSmdS?=
 =?utf-8?B?NWdGQUJkeFZ4enNtbDdzeGVseUJIU3V2MHY3d1FmYjIySEpIdU9SU2EvdjNP?=
 =?utf-8?B?OU9mZU5OVURXZTdtZGxDKzlxRllVdXdET2h3SS9aelhqUG1wRDlBL2lKNEZl?=
 =?utf-8?B?YmJiN0twMXIzNkNiMWh3d2w1M2h6QnlZaHBDUmhRRGYzMjg3Z0FlUytXT2Uv?=
 =?utf-8?B?YjVkMGJueCt1SGQ5VVcxSUNuakVseEgrV0NqRWNBVDAyMTg2cEZFb1FLYlZQ?=
 =?utf-8?B?ZFJDU1dTSjljbFJDcy9iVGZyNmFFeEcvRzNDRXJ3TVcyQjBDanltREFVeksr?=
 =?utf-8?B?V3pZMytPMFROb2FnNVQ1L0p5a1VUNjM2V1M2N0lZalBmcUJ2dUtiakRCL1B1?=
 =?utf-8?B?UUw0TGpGNkVhaUdpOGhFYkF5Rk9BYzQ2SEZlUjRkeEJyeFBmditRcGJCdDdt?=
 =?utf-8?B?WWo3NTQ1eVdsSEFoOHp1K1d4VGhjWWsrTThWc1RKRWUzaG9kb3dyQ0VFdDlk?=
 =?utf-8?Q?WvHmS2DcBuZxGyE1ynL2L/dmrjTOObHo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlJrSGM3NUxVZy82L000NE00T1pudisyL1puY3FteTdjTExnTkdDSlMxK3RM?=
 =?utf-8?B?SGlYVDhkdXc0TTFPMG9LZjRwS3h1SmUwNEI2VFJrdnN5VDNEWTZpSUM4Wmdo?=
 =?utf-8?B?dW0rTE45TkFtRDB3bXZYTVE0eU95ckdsc2pWcGYvU0VBTE93aEVkWXpRcFMw?=
 =?utf-8?B?OUxYejd1eDkzOTJaSTZydFMxT0RKTHA3V0ZlT0tWM1FCakIxUjVvL2poMTky?=
 =?utf-8?B?K29pUFo1YXN2MU5SL0FFN0RzTHk0MWRvSzB6c054aWxnV1JWSE1NWXJqRWZw?=
 =?utf-8?B?cUpxMDVic2xSTUQwM0piU1h0anQyeDhWUUxtOVpsTUZZU3RCY1JrRjI2RTZU?=
 =?utf-8?B?SytGZE8rMkV5R203c1lUSnJOWTFTTWZESXMvWENabVFMTGNqdmxGUlc2NlM1?=
 =?utf-8?B?bjMrUFM3Q1lWMlJ5cU9jYVdXdGxVTTU2alVPaEdhdFZncEZFSDhEZlJMN3g5?=
 =?utf-8?B?Ump4OUh1ODRDVEtBRThBUWpTSHdYSmZhWnhTZENEVGFmbjZXbTVkMkloaG4z?=
 =?utf-8?B?QnZsT0lKcUQvN2VwT1JrRGFBSGs5U1lwT1RuYmJENTJHbUpwNFNCajRhT1Qz?=
 =?utf-8?B?OG9US01OYTY0ZXlCZU90MGlNY3RWb01KQklwWWhyUGMyTG1yek9CRnVnZFM0?=
 =?utf-8?B?VlZGVmQ5MkZEc3l5bHdqK2J4VjlSUGRSbnVSWjdwZGQxZ2FIc2tNU0N4dUQv?=
 =?utf-8?B?SVdrMHFVREh2L2lXR2pibWV1RE9aSlN0azZyTElPUVRzWU95YVdTNGt6UHZ1?=
 =?utf-8?B?aElMK3lwUFVINzV4M3BVc2RFV29oVitsRDFldTlJWCtGN3YrVnYzbFNqZDBm?=
 =?utf-8?B?dW9YQkRDeVdSQjE2aE9aVnhqVVFmYUZTY2FBQzU3S0dlVVFjdzg2NUp6SXps?=
 =?utf-8?B?MGExeUxYcUwyOUFicDlCQjJieXJ3Qk0vaVRrdzYvL0NUVSticlNlaTIzV3By?=
 =?utf-8?B?ZEF4a0dWd3djaTROb2pTYVEvQnJQcm13bGhJN2RhTXl6Y2J5WWFrRzNOMWky?=
 =?utf-8?B?Z0xnTjdTcDhuME04Y0llYjJpTDgyMTV2NGZoQVlUNXB2bVNVOWJoOWhpNnpH?=
 =?utf-8?B?R0t6NlZQN3NiTmhkV2ZSTXdqSW5JZTZuNVZla0RXWGdBL0o1dUhIQ3dhLzVW?=
 =?utf-8?B?NUFMMkF2aVlHUGdSazlYRnM0QnZINDJRZkoyeFBzOW9JaDlXbkJwaW9ZRi9w?=
 =?utf-8?B?alZhaWdjT3R4UXp4MzhONlVUbHBRaDE0cGJOdnhDUGVkbHIrZTRKZ25rSGpQ?=
 =?utf-8?B?RGlTVkN0WjlrUlF6elZvUUtVQm1pdE9Ra3pLZG1mbHU5Qk9XZ0JWOGcwSHJj?=
 =?utf-8?B?RmFwcHFhNTgxVXFLS1pwWEpPV1JKZWVTSWNDVWpJMHJuc3NUOHNtYjcrVG0x?=
 =?utf-8?B?bTJWbUZNa3VldVl5eFpsbDBRVVVCcEhzTHNiRXNYZ2poQWlTejN0WU1TZWlF?=
 =?utf-8?B?b1J1TlRROUZjU29TZmx1T0tJZTUweVk4TERoQ3M2MVlZZ0dZL0lQQjJDd3dF?=
 =?utf-8?B?WVBHb3h4WmJYL2krQitUS1BseFNmalBXbHdWZlNTOTFHT3BlL3dNU2hJOUp5?=
 =?utf-8?B?RzQyN0ttWjdEYkpxcGcvczVhVVhLZzBmV3d4UGxJMExoNzZ2TkxwQjc1bjc0?=
 =?utf-8?B?N1o3QW10dXg1LzBWTHpJcHF1clQ2dlBCOG9VdmExT1o2RXJYV0lDV1N0ZEdB?=
 =?utf-8?B?UXJlbDlKVVVYdU4vVXhjTDVCdWtEQzRpakRDUDM2SVpDKzRBcDlmZDNKbEFU?=
 =?utf-8?B?ekJUK3FXMGMvVUhoYWQyS2Y2S1FkSkJnbzF4ZmRHSkQvcWg4cWxxUGJ1WHZs?=
 =?utf-8?B?ZDZ3YkF2QTJ1Q3JTUUV6MDJ1MFFENE9LWVdPUjdaSmw1VkVHZC9oL1NGMSta?=
 =?utf-8?B?blJVNkN4QnFTQ3RVSjg3OENseUdSZU5LcTZvRitBUXFTczVmVGd4NHpCWU9X?=
 =?utf-8?B?Tk5YOFp1Z2NrY3ViUHRnamN5bVN4b3d0Zi8xSVQyUWRtdndxUk9LYXIxOTQw?=
 =?utf-8?B?K21XMmhHc2pvczJWNFpJd2JQMTFGTnEzN1NRbW40NmJDbDlqbHNyOW1zV2tv?=
 =?utf-8?B?SG0rUi92a0Z5SWdjOWZjZmpWUFBNWWR5NnZvVnJNbzJLQXd0MXlpc2JIcks4?=
 =?utf-8?Q?xZK8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E44D3E0E66E35942B212DFB3902675D5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bbc25f-849d-4ee6-fc17-08dd39e394a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 06:19:37.0609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCknQ1ni2wKBQHr2AHJ+G0/lnUOoNgygANExr+spsfxvmXfShBkCkfJ03mLwUgLuqYjH+lB2lhhFGJWypDHNTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

T24gMjAyNS8xLzIwIDIzOjM1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDEuMjAyNSAw
NDoyNiwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4v
ZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+IEBAIC0wLDAgKzEsMTM1IEBADQo+PiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4gKy8qDQo+PiArICogQ29weXJp
Z2h0IChDKSAyMDI0IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gQWxsIFJpZ2h0cyBSZXNl
cnZlZC4NCj4gDQo+IE5pdDogVGhpcyBoYXMgbm93IGdvbmUgc3RhbGUuDQpUaGFua3MsIHdpbGwg
Y2hhbmdlIDIwMjQgdG8gMjAyNS4NCg0KPiANCj4+ICsgKiBBdXRob3I6IEppcWlhbiBDaGVuIDxK
aXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRlIDx4ZW4vc2No
ZWQuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL3ZwY2kuaD4NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBj
Zl9jaGVjayByZWJhcl9jdHJsX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlZywN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+
PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaW5kZXg7DQo+PiArICAgIHN0cnVjdCB2cGNpX2Jh
ciAqYmFyID0gZGF0YTsNCj4+ICsgICAgdWludDY0X3Qgc2l6ZSA9IFBDSV9SRUJBUl9DVFJMX1NJ
WkUodmFsKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBiYXItPmVuYWJsZWQgKQ0KPj4gKyAgICB7DQo+
PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogUmVmdXNlIHRvIHJlc2l6ZSBhIEJBUiB3aGls
ZSBtZW1vcnkgZGVjb2RpbmcgaXMgZW5hYmxlZCwgYXMNCj4+ICsgICAgICAgICAqIG90aGVyd2lz
ZSB0aGUgc2l6ZSBvZiB0aGUgbWFwcGVkIHJlZ2lvbiBpbiB0aGUgcDJtIHdvdWxkIGJlY29tZQ0K
Pj4gKyAgICAgICAgICogc3RhbGUgd2l0aCB0aGUgbmV3bHkgc2V0IEJBUiBzaXplLCBhbmQgdGhl
IHBvc2l0aW9uIG9mIHRoZSBCQVINCj4+ICsgICAgICAgICAqIHdvdWxkIGJlIHJlc2V0IHRvIHVu
ZGVmaW5lZC4gIE5vdGUgdGhlIFBDSWUgc3BlY2lmaWNhdGlvbiBhbHNvDQo+PiArICAgICAgICAg
KiBmb3JiaWRzIHJlc2l6aW5nIGEgQkFSIHdpdGggbWVtb3J5IGRlY29kaW5nIGVuYWJsZWQuDQo+
PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIGlmICggc2l6ZSAhPSBiYXItPnNpemUgKQ0KPj4g
KyAgICAgICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICIlcHA6IHJlZnVzZSB0byByZXNpemUgQkFSIHdpdGggbWVtb3J5IGRlY29kaW5nIGVuYWJsZWRc
biIsDQo+PiArICAgICAgICAgICAgICAgICAgICAmcGRldi0+c2JkZik7DQo+PiArICAgICAgICBy
ZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCAhKChzaXplID4+IFBDSV9SRUJB
Ul9DVFJMX1NJWkVfQklBUykgJiBiYXItPnJlc2l6YWJsZV9zaXplcykgKQ0KPj4gKyAgICAgICAg
Z3ByaW50ayhYRU5MT0dfV0FSTklORywNCj4+ICsgICAgICAgICAgICAgICAgIiVwcDogbmV3IHNp
emUgJSNseCBpcyBub3Qgc3VwcG9ydGVkIGJ5IGhhcmR3YXJlXG4iLA0KPj4gKyAgICAgICAgICAg
ICAgICAmcGRldi0+c2JkZiwgc2l6ZSk7DQo+PiArDQo+PiArICAgIHBjaV9jb25mX3dyaXRlMzIo
cGRldi0+c2JkZiwgcmVnLCB2YWwpOw0KPj4gKw0KPj4gKyAgICBpbmRleCA9IHBjaV9jb25mX3Jl
YWQzMihwZGV2LT5zYmRmLCByZWcpICYgUENJX1JFQkFSX0NUUkxfQkFSX0lEWDsNCj4+ICsgICAg
cGNpX3NpemVfbWVtX2JhcihwZGV2LT5zYmRmLCBQQ0lfQkFTRV9BRERSRVNTXzAgKyBpbmRleCAq
IDQsICZiYXItPmFkZHIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgJmJhci0+c2l6ZSwgKChp
bmRleCA9PSBQQ0lfSEVBREVSX05PUk1BTF9OUl9CQVJTIC0gMSkgPw0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQkFSX0xBU1QgOiAwKSk7DQo+IA0KPiBOaXQ6IElt
byBpdCdzIHVuaGVscGZ1bCB0byB0aGUgcmVhZGVyIGlmIHlvdSBwdXQgbXVsdGlwbGUgYXJndW1l
bnRzIG9uIGEgc2luZ2xlDQo+IGxpbmUsIHdoZW4gdGhlIGZpbmFsIG9uZSB0aGVuIG5lZWRzIHdy
YXBwaW5nIGFjcm9zcyBsaW5lcy4gKFB1dHRpbmcgbXVsdGlwbGUNCj4gYXJndW1lbnRzIG9uIGEg
c2luZ2xlIGxpbmUgaXMgZmluZSBvZiBjb3Vyc2Ugd2hlbiB0aGV5IGZ1bGx5IGZpdC4pDQpXaWxs
IGNoYW5nZSB0byBwdXQgZWFjaCBhcmd1bWVudCBpbiBhIHNpbmdsZSBsaW5lIGluIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2lfcmVncy5oDQo+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vcGNpX3JlZ3MuaA0KPj4gQEAgLTQ1OSw2ICs0NTksNyBAQA0KPj4g
ICNkZWZpbmUgUENJX0VYVF9DQVBfSURfQVJJCTE0DQo+PiAgI2RlZmluZSBQQ0lfRVhUX0NBUF9J
RF9BVFMJMTUNCj4+ICAjZGVmaW5lIFBDSV9FWFRfQ0FQX0lEX1NSSU9WCTE2DQo+PiArI2RlZmlu
ZSBQQ0lfRVhUX0NBUF9JRF9SRUJBUgkyMQkvKiBSZXNpemFibGUgQkFSICovDQo+PiAgDQo+PiAg
LyogQWR2YW5jZWQgRXJyb3IgUmVwb3J0aW5nICovDQo+PiAgI2RlZmluZSBQQ0lfRVJSX1VOQ09S
X1NUQVRVUwk0CS8qIFVuY29ycmVjdGFibGUgRXJyb3IgU3RhdHVzICovDQo+PiBAQCAtNTQxLDYg
KzU0MiwxOSBAQA0KPj4gICNkZWZpbmUgIFBDSV9WTkRSX0hFQURFUl9SRVYoeCkJKCgoeCkgPj4g
MTYpICYgMHhmKQ0KPj4gICNkZWZpbmUgIFBDSV9WTkRSX0hFQURFUl9MRU4oeCkJKCgoeCkgPj4g
MjApICYgMHhmZmYpDQo+PiAgDQo+PiArLyogUmVzaXphYmxlIEJBUnMgKi8NCj4+ICsjZGVmaW5l
IFBDSV9SRUJBUl9DQVAobikJKDQgKyA4ICogKG4pKQkvKiBjYXBhYmlsaXR5IHJlZ2lzdGVyICov
DQo+PiArI2RlZmluZSAgUENJX1JFQkFSX0NBUF9TSVpFU19NQVNLCTB4RkZGRkZGRjBVCS8qIHN1
cHBvcnRlZCBCQVIgc2l6ZXMgaW4gQ0FQICovDQo+PiArI2RlZmluZSBQQ0lfUkVCQVJfQ1RSTChu
KQkoOCArIDggKiAobikpCS8qIGNvbnRyb2wgcmVnaXN0ZXIgKi8NCj4+ICsjZGVmaW5lICBQQ0lf
UkVCQVJfQ1RSTF9CQVJfSURYCQkweDAwMDAwMDA3CS8qIEJBUiBpbmRleCAqLw0KPj4gKyNkZWZp
bmUgIFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSwkweDAwMDAwMEUwCS8qICMgb2YgcmVzaXphYmxl
IEJBUnMgKi8NCj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ1RSTF9CQVJfU0laRQkweDAwMDAzRjAw
CS8qIEJBUiBzaXplICovDQo+PiArI2RlZmluZSAgUENJX1JFQkFSX0NUUkxfU0laRVNfTUFTSwkw
eEZGRkYwMDAwVQkvKiBzdXBwb3J0ZWQgQkFSIHNpemVzIGluIENUUkwgKi8NCj4+ICsjZGVmaW5l
ICBQQ0lfUkVCQVJfQ1RSTF9TSVpFX0JJQVMJMjANCj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ1RS
TF9TSVpFKHYpIFwNCj4+ICsgICAgICAgICAgICAoMVVMIDw8IChNQVNLX0VYVFIodiwgUENJX1JF
QkFSX0NUUkxfQkFSX1NJWkUpIFwNCj4+ICsgICAgICAgICAgICAgICAgICAgICArIFBDSV9SRUJB
Ul9DVFJMX1NJWkVfQklBUykpDQo+IA0KPiBPbiB4ODYgKGJlaW5nIDY0LWJpdCBvbmx5KSBhbmQg
QXJtNjQgMVVMIG1heSBiZSBnb29kIGVub3VnaCBoZXJlLCBidXQNCj4gSSBleHBlY3Qgd2UnbGwg
bmVlZCAxVUxMIGZvciBhbnkgMzItYml0IGFyY2hpdGVjdHVyZS4NCj4gDQo+IFBsdXMsIGFzIGlu
ZGljYXRlZCBiZWZvcmUsIHRoZXNlIHR3byBhdXhpbGlhcnkgI2RlZmluZS1zIHdvdWxkIGltbw0K
PiBiZXR0ZXIgYmUgc2VwYXJhdGVkIGZyb20gdGhvc2UgZGlyZWN0bHkgcGVydGFpbmluZyB0byB0
aGUgY29udHJvbA0KPiByZWdpc3RlciBmaWVsZHMgKGFuZCB0aGVuIGFsc28gbm90IGJlIHBhZGRl
ZCBsaWtlIHRob3NlKS4NClRoYW5rIHlvdSENCldpbGwgdXNlIGEgc3BhY2UgbGluZSB0byBzZXBh
cmF0ZSB0aGVzZSB0d28gI2RlZmluZS1zIGZyb20gdGhlIG90aGVycyBhbmQgY2hhbmdlIDFVTCB0
byAxVUxMLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4N
Cg==

