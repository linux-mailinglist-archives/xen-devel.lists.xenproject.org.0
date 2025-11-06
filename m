Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C4C3B54A
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 14:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156939.1485884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0Fz-0003zI-TB; Thu, 06 Nov 2025 13:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156939.1485884; Thu, 06 Nov 2025 13:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0Fz-0003wx-Q9; Thu, 06 Nov 2025 13:42:31 +0000
Received: by outflank-mailman (input) for mailman id 1156939;
 Thu, 06 Nov 2025 13:42:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oVY=5O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vH0Fy-0003wr-Ch
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 13:42:30 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f6f1ead-bb16-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 14:42:28 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10421.eurprd03.prod.outlook.com (2603:10a6:10:523::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 13:42:25 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 13:42:25 +0000
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
X-Inumbo-ID: 6f6f1ead-bb16-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiokrS/PFAdWcRD+40VUhDGuOPEHBEuAva+by041WpfUy8US8NE8XDafeBB43AdT6l6EvuEAyiMYJ9N1RAtu/0hjWdsDpliU3t66VxcJBHmQKfEoUFkbnPmHSqNTcr99pPIZ1IOBJoL/I1riuWWgz0Y66pAPOXL+N16FpoJks55lcIp+U7UkwUgKoF8JUtpJZLUmBbh/ITJDenywEV2KLGpJCK7yrUPHI2Buwbl/M1SV5oHDvuPlClm2MlGh0eQt4jN0Q/vmaJ1YwQr0zPiS4QC3fAIJd0QkiL18454NJJ5KbCj+cfUeyMMXpbUjqQvJIGjH2geZ5vFM89PEMnPafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zcS1JRApop1QLWvVyrN8hvB1GBagH35NyYlKb5HkEQ=;
 b=YQRaUOOAaj7hlQsrkWA/OHbOtuxYpG+L9xaCDCa8N5KVKQnx/ymkH3dzPqXUlhDl1XavD6XpkZmrnu2jgvNb0cG07SI/FAh45gzN6ttrAkk92NRTz4h2F9Jch/VAC2/xPlqJu/tmJPFWbkSBNxSKlhDSh8kbfAnMW4N4X5Y4GjzgWUysQ9tul3hhorVFc91/eNpwU8THyEkVzWC43ILXnd3AybuWZPSpkfimb7RdMehXuWKV65juksep83IhUSk1skE5Qop+6JDqgocaTRyD8KA6SY2gBoX3NEK11i4pBqkEs18x4wRF8Pv/YrvgNpik6L4sMOJaO5n2ce3/iKm+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zcS1JRApop1QLWvVyrN8hvB1GBagH35NyYlKb5HkEQ=;
 b=nfEjQE1gs4PzW13+vq9afKkiaHkMU+BK6jC4iokgjYBrEUE1IfeyJqfxiPAWcZ+FjKDpHastlzEnYzU/762IPcnBUW6ofntvn8D0wKPQlFWRNkRWXaQRSVKjfyQYpvKvS5vrVPk8/t6MhZqGUqr0xrpnc/aezthkXLwWix4T1zitAC/mMjNyEJo86qKOo74atYf9qPjZ29ixM/7sYLBfqP7F71wpRyMg3VcmkJIeB60cHiKHupTZ+KbATaXyLBXy53S0qy7GcMEy8XFuq2NcVtqrIZa4sBCe9RmcEUjzHuTVpWFX1RNZ8pzuiNwnHgA2Kd1W8Ib8GxWFTMFrQPwbFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
Date: Thu, 6 Nov 2025 15:42:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
 <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU5PR03MB10421:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3c1d07-be3c-498b-a77a-08de1d3a51ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjRERTB4Nk5GVlJHUzNzd2IwRy9qeVJ1VzhUTzk3UkFweS94QytrYS9XNDg1?=
 =?utf-8?B?dS9OdUJCelo5QnpVZEJ5YW52K3MzL2NiWjFFZFAvS2tlRGpOY3VnWW9qOUtY?=
 =?utf-8?B?a0ZPSXl0aVk1bFlyTStsM1pkTDFPWmQ1enZxZG81M1VLSXpRaEprODdsQU50?=
 =?utf-8?B?V21qZWhFWVhFWnEyZW9pUE5sVW9YYVNta0FKYko3NHBXYlhYQUFpTFJ2N2ZS?=
 =?utf-8?B?Zk9adXZBdml0RXVsY01CU25Fa1hHc0l1Z2JPeUdKTU1tbDgzNHgySFN3WGxl?=
 =?utf-8?B?bUNqTjVUaWk2K0JRK0NuSHA0ZW0vQzJUdGk3VmE4UnB2ZVhKRFpwZElZWVlC?=
 =?utf-8?B?RkhzV3hva05wbnJzVExLQjNWbTkyUVB4dGFmQTd4em9HSTVmTWlrWlR0T3d5?=
 =?utf-8?B?WGNEY1BPL0xHNURiOG4rRC9MWkNEVGVacURGR0Vkdk56V3lQa1d5OTdoVWhK?=
 =?utf-8?B?VXpEWDZHZThIR2FCcFMzMkVlTFNDOEtYZzRvU21sVDg4Q2J1RHBkSjdRdWMy?=
 =?utf-8?B?UWJpcmNkUnZoUEZPb3N5dW9tUmxNaEpJS0dMQ0VMa0I4OXplQzFMeTZpbTlY?=
 =?utf-8?B?cnNINUR1OHRGb29zdzU4U3B0UG5tWnIxWVFZa3BscXpFSDh2STNEZjB5d0Jr?=
 =?utf-8?B?b3ZaZzBnZTBzMUNWcWxxZ3lQMnVDa0tEVkxIalI3aHgrdmpyZUl4UUJhVllH?=
 =?utf-8?B?TVJZOVpYYk9KS1BGbzVjTmVKY3MvMk9vRUN3NllqQ1FkVVRGQm1FbE84eG1Y?=
 =?utf-8?B?WEZFQWZPTzJ2NkxkZjRBYUxPWXBFdXFpL1QyTW9RMkZ2aVpic0JZTUxFL0tK?=
 =?utf-8?B?WVJ2RFdmaEo5TXExVFBoN3JJUmdwLzVDbGFuUWRVUkVZelVWclJEU3FrMHdG?=
 =?utf-8?B?Y1psWU1LTlQvYWxvbjRRK1pWZnlsN0tDMkdIYjVrUVBzZHd1UzNLSmZyaS80?=
 =?utf-8?B?SzVWQzVrcytQeTdyVHNFZ2F6cjRTbUVzdjlQdnNDZytaUzgxTEp4YlA0QTZH?=
 =?utf-8?B?VXJ2eWlqeG1YRG9RbVA3YWtTUjRmSDJUZXBmZjVWTktRNzlUczc4MEF0Znho?=
 =?utf-8?B?SmNUeWVhNjljdkZ4NHJmKzZZc1VrODlyczNXaGxjUnM0Q0M5SkF4WFhRTkNN?=
 =?utf-8?B?eHdHREZ1b2dmZzVOc1l6SVNSblFyeE5jVDVVNkpjMmNXOHkwem45eDZ2bzRT?=
 =?utf-8?B?Q1BITTRTY1ZYc3R0WVFYUzU3SlRGblVSeFRhaG42T2VyQlhwZGl2MEhObUU5?=
 =?utf-8?B?OHBSZDlYaGJFWFdRS25JUWRvVytTTHNBNkRaTjZnT2hLcEtUUDYrSHNBeW9p?=
 =?utf-8?B?MjNYUk9vSDZoTEoyOXRQYTByUUI2WVdZSXFEUnh3ZXdTc0JmU0l2M1FpbFVx?=
 =?utf-8?B?Y0JkVjZ2TERraDlIWEI1cXZrK2dESXJYWFRiV25XZTdUSEdZcGVob3cyRkRt?=
 =?utf-8?B?REhnZnRGYklkcUt0VDVkMXY3Z1czcGsxRGZXY0lSVE44V0xIVVorL1Rlemxq?=
 =?utf-8?B?cGxabkJZdjJKcGdZb0t2dW5jdE82YWhJd1BiSGNSZm41TFk0QlhJanhxKy92?=
 =?utf-8?B?YVM4UFNhWHJScXFsdnBUVXVuLy9JbVd2NCtJUmxoL3QxaHE4UUdzYWFrR3ZR?=
 =?utf-8?B?MjV3YTBTRUx5R3FFajlMNlUrRFVTSWMxUk5jdFg3YkJLYlZTd0VyTFZ3NTN4?=
 =?utf-8?B?ZzlHOW1SVDIybFMzdkIwbHF0REpzdnUxWlA1aHNJMHNLaVlrSzJBMkZzZjdu?=
 =?utf-8?B?MXcxV2pEa1lSR1V6ZWNGSHl1enpvTmdSbktmVXFQNFZubkd1S2x5OEg1eXh6?=
 =?utf-8?B?VEhldG5MUlI0UnRCc3lXUDFtM0JQZERBb1VpVHczamtzQ1Nod1NlY3ZUUk96?=
 =?utf-8?B?ZmcyWTRZdmlEeisrajVqSjQrbnF6dXNuQW54L2xyYURzK3Y2a0VZbVZUS2d4?=
 =?utf-8?Q?HCKv581hMTRFJelYq27W4+F03oyWjFtZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWNGN1VVK1FXVmoraHJveWxuVW14R0ZhaEtwbnBUS21WaFFrUkhPWXYvNGNi?=
 =?utf-8?B?WnpXOHFYMzh1ZW9sMVJzOTFZT3lKQ1V6SHVHeVJmcGw0eU96RVJnZGQ2SjU5?=
 =?utf-8?B?alJGcTZaSys5V3pONC9nOXZpd01mNVlTc3hrenY3c0wvZjVkUlZuRHBjc0ZB?=
 =?utf-8?B?anBBcHV3TnZGRVQ5WXNEeFpnaHc5ZExQL1BETTJRbkJ5Zi9PRmVWS1FicVFU?=
 =?utf-8?B?VkcyYkZISU9xUVhtSWU3eVZiNjk4eHB2TjlwYlY1azBXZWhyb2tkOEdTLzNv?=
 =?utf-8?B?QnhYUVZFaGpFV1IveUN0VVNiMjRmbklxM3JPdENMTzY0TmM3Lzc1Z0VDOEMw?=
 =?utf-8?B?dHZTbm0xQVFnUzZVTktBWGxQNndsVWJOWExXYXdYT3VvYjFaOVJqSXBpRkNC?=
 =?utf-8?B?RVlmbnB2RWpFN2ZrK2tnL05WVEh6dUxrTUZLNU51MW02SGJEdkpOdUdZZGtt?=
 =?utf-8?B?TXg4VTVOK3N5MlJDK0Q2d2owTStPK3ZCMHBzeGpLSGRGZ1VFKzQ0MkwzanB5?=
 =?utf-8?B?SHhUQUJzVmpsZ0hxUFlXRzIwRzBFeTQ2enZlRk5oT2VBWG9wejgyeUNzRVVX?=
 =?utf-8?B?MUdTVEN2K3FSaEtjNTluRVNTYU93S3NtTFhhbFc0YkwrVEw1bUYzT2RRV1Uy?=
 =?utf-8?B?L1JlRGFDR1FHcmc3eVNMdzN5MmNUakowUnUwOUFmTGppQWlCa2E0THQvZWcr?=
 =?utf-8?B?aWpEV2xWVzlLZlJueEhrVHoraFcxRUw5YmJBR2I4Q3hEaDRjdUxuRTN2R25h?=
 =?utf-8?B?R3dEd1ZjcTQvUndPelZaanJvK1BRVU43NllOcUpjVFNvckt3MHBEWExPUE1i?=
 =?utf-8?B?YXlrSXU5d2JJLzNOeFB3aDMzbXBUMTNoaDRxUjdPQTVIV1N3MzJEZTgxa01k?=
 =?utf-8?B?MFJpNnJXcysvMFZCNWlBSHJWbzFNYkt4Y09PR2JoUHBTUEd5RUpNZExqTG1o?=
 =?utf-8?B?dlFDeWJIbUVQR1lQZURxRTFiWW1qc3F5RHF5KzNjeElNRXFCL0FZV0NsSE5i?=
 =?utf-8?B?aUUzNGM3YlZsdWhBcEUrQkhYcUhYUlNnU0xrdFZja0prcmQ2UDU3ZXFPQ0Zx?=
 =?utf-8?B?OHdud3h5M1FyZ05Uek1HOHFiL3gwcDdtQmhrZXMwSFZsejdWQ0pLWDI4V0RS?=
 =?utf-8?B?RmF4MXpVTlZVQjhScGxLMS9jSHg1WXNUT0x0dGcxbTNSSkhvVENwdDBZTDVn?=
 =?utf-8?B?SWkyd00wUVVHbkNra3VGNGRIdjNZWkZhLzF2WC8rRmJUS09TVWcyRnlJNFR2?=
 =?utf-8?B?Ri9FVWxaMUpIeS9Jdkp3UVp3ZWxXS1VoajJudDB3M3h0ei9wSHFma2ZPR0FV?=
 =?utf-8?B?Ykt3aDhlZUNqSlQ5cXpQM0N1MS9FVGhIcHpJMWROR3BJNzFxamFXRWp2M04z?=
 =?utf-8?B?dHl1Wloxb0R0dUFrSGw2cE9BcEljaUc0bmtVb3c3UGtNSnJZdGV6UjNLL0xW?=
 =?utf-8?B?S1RGSXljUXFYbis1RUlZWEl1eTJVOWxyanFqazRpTlY2VXhOZVAyZCtnSVEv?=
 =?utf-8?B?WmNadC9WaDVLMndQamg0QkZDL1RQa2NPUHgvemd2M1FxUXZuWWxxY0hmelNs?=
 =?utf-8?B?eHRzbkRjRjBBQU5IdThPSHp5cTdFK3U0WmtqcWdpbU5HNTVrNzhKVkhlZ3dN?=
 =?utf-8?B?SWdEVHR1Qm50UTZxUVBnVGM2aGFYUis0YmI1NnZqMSs1SEE4TGdyd2ZYd3J4?=
 =?utf-8?B?TFNEdGdwRHVobUZWNWZDZEkvQ0hkKzZtaWhJbkhad0c5YldpUGhWTURkbXVv?=
 =?utf-8?B?blpYU1NiV3p6bXIrR0szWHlzSE5aM25mS2ZkcUxBUzNzSFlOSUM2alNDWXZv?=
 =?utf-8?B?ZmdHTlloZVdHUkE1dlFQcWRpQUR6cWFEcXk2K011NkduR3pNYVVVQUxEWXhu?=
 =?utf-8?B?K2hET1NGREp2RFg1U2s3d3VvTVF6OEM2OS9rczRuNVpEdlA0dmhBaEdkOURM?=
 =?utf-8?B?RlVCQUFWTk9XOGJEcjlBL1JMSWwzQkpUeXcxYUpRSEVkdytPODdTOFIyL2hl?=
 =?utf-8?B?NjlTdzFLT0E0Y3M2TXJoK2kxREZsZWJVOWxKQ0FNTGZFc1hhQzFPYUlwT1Rl?=
 =?utf-8?B?OWVUKzgwM3VjVzlLREZjajFyOWxFa3pIcEh4dHVYM29VTnYzbUs0YzRtdUMy?=
 =?utf-8?B?K1hHTk5iRTRzRjdCTnlyblVnNjRGZDI0RjZIUG4vUHhDUG5OekQ1RnZWbTJQ?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3c1d07-be3c-498b-a77a-08de1d3a51ef
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:42:25.5622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx2Bj6fXagxffTrKM0t0vpn8DUHqgTEvI8A2c02DCAf03tMB3g299UawORTDYii/XpDEny0IyI0WLHIQ1IDQNaqXOqeX9oMNZnw82q60PS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10421



On 06.11.25 13:35, Jan Beulich wrote:
> On 31.10.2025 17:17, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Makefile
>> +++ b/xen/arch/x86/hvm/Makefile
>> @@ -1,6 +1,6 @@
>>   obj-$(CONFIG_AMD_SVM) += svm/
>>   obj-$(CONFIG_INTEL_VMX) += vmx/
>> -obj-y += viridian/
>> +obj-$(CONFIG_VIRIDIAN) += viridian/
> 
> With this, what is the point of the additions to viridian_load_{domain,vcpu}_ctxt()?
> You're adding dead code there, aren't you?

Hgrr. And we end up back to v3 regarding this part.
Check in viridian_load_{domain,vcpu}_ctxt() may/may not work depending on toolstack
behavior which is not strictly defined (loading HVM_PARAM_VIRIDIAN before/after
viridian_load_{domain,vcpu}_ctxt()).

So what's the conclusion here - drop this check?

> 
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>               rc = -EINVAL;
>>           break;
>>       case HVM_PARAM_VIRIDIAN:
>> -        if ( (value & ~HVMPV_feature_mask) ||
>> -             !(value & HVMPV_base_freq) )
>> +        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
>> +            rc = -ENODEV;
>> +        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>               rc = -EINVAL;
> 
> I find the check for value to be (non-)zero a little dubious here: If any caller
> passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be more suitable
> in that case as well. Things would be different if 0 was a valid value to pass in.

The idea was to distinguish between "Feature enabled, Invalid parameter" and "Feature disabled".

-- 
Best regards,
-grygorii


