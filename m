Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DCBC7595C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 18:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167665.1493921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM8Et-0007AE-Ib; Thu, 20 Nov 2025 17:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167665.1493921; Thu, 20 Nov 2025 17:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM8Et-000776-En; Thu, 20 Nov 2025 17:14:35 +0000
Received: by outflank-mailman (input) for mailman id 1167665;
 Thu, 20 Nov 2025 17:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM8Er-000770-Sw
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 17:14:33 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e16d17e-c634-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 18:14:28 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7346.namprd03.prod.outlook.com (2603:10b6:806:382::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 17:14:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 17:14:24 +0000
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
X-Inumbo-ID: 5e16d17e-c634-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQDIaA4vG3FqAsrbJVDMdrw5xTAJP9msB2AyaVkpvihpKzrfgAOrqRN7EtPQUbCtBui8BjpyLNjTadpDZ5nIIMJMvlmtGPhv2bSYutDXlVOuDuVcX9DqwjPX8RIm11/pUf5U7sagSEg04vxUTgWC4aod+oH4BME0x85waMcinugifqK6Rmze0DK9tQN1hIWUzE9wtkulsQkucxO98JebWBBaXzUbfiGUWV7qz4/EbKf/yKqzyBJHS8w52/BpkdWHe9yWlohGLzH9FzuqcDQd2wDtU1tFLw6F9NlKTNUumkOtS6nuxWCTvbY4xjcCI+AjxqPOEShIzP8qNvm0+DOBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvVSjr6bAg68fsUxaGLcOH0QHxFdL3rVhud/K9v8h7M=;
 b=BiFw/qLDBnXz3en81q8VQ7iqZX7azS8xEgB6yl24EtzkbPP/JkAR4K3a8eYc6t4WLW9cbQPOrQP5/Dkky/lXsYhJu84J9JRgCsYF0G3uEGLfRg5/yVSBRYBr3ILEYgFj5dMaUbj1foDB4IlybvaD6L4kFedUASW2qNPbg5mAbzb3TmHx6wm7rqCyKx1ZGkfcDG6gz4n1Ck/I5sYp8cKbPoAFTJ9v6G3cUZBF68ZSYCuvYiDuZhvFyLdohczTp+ntgG38/j/loUgHxNnHqqNr962/T1rKJJY1yI8Gqvq4KtKmX/0HV8k6I28S3DZiBmBuLR6ujWI9Rt4zQdf1iwr5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvVSjr6bAg68fsUxaGLcOH0QHxFdL3rVhud/K9v8h7M=;
 b=fo7X0oXjBc/UDctkoXlqjs9s9zBlVzfYVE2AhZWXZPkkytqjAtm4Ro4Wxmei7Om7JWZV8PQ7TX4VB93nkR0WfBc9b7WpLuMu1T8mJ/gbfTWO0NzTnyp6Vi/miaLhP/ISfW52W23ajFq+MYQXQNwroLh1tM1j6sUynS4V3xoVxug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9f23a3fe-c139-4219-ad50-69bf68e68e16@citrix.com>
Date: Thu, 20 Nov 2025 17:14:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/guest: move allocation of Xen upcall vector to
 init code
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <5ccf9000-9847-40de-838e-cb181633b098@suse.com>
 <943e462f-d948-4f72-8d4c-626febca5b32@citrix.com>
 <4a266547-b058-49c0-8c45-7a80f8ada3b7@citrix.com>
 <a61f67ce-8568-416b-9e89-aa22d794e886@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a61f67ce-8568-416b-9e89-aa22d794e886@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: d8064ec0-b083-4448-4212-08de28584099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnFwT0JWbmdrWERVUjRpR3dWbFpHYmd2ZWx3MXZoRlNEYndpTkNIcGpjMWN2?=
 =?utf-8?B?R3lhWXNVeHptemFYUW52REdrc016NU5wdXVYSjh4NThoZmdBN0FxTnZXQVVK?=
 =?utf-8?B?YU1nMENDK3E0QmxGZ2tGY1lpVmFaT2I2cUt6ZXlVM01zRHd4UHNobkNHRXVN?=
 =?utf-8?B?WVZaenBsNFBmY0NLZlcyVmFxOGJJUTBydHFMREZZNE1LYWo0QitkdW5xbkp5?=
 =?utf-8?B?bVJZVElucmZYRkQvOUJUekU2MERsK1ZYY1daNkhObUgwbUtiMVYyai9JbCtJ?=
 =?utf-8?B?ODZqV3pkMnNEejZxVjJZSFljQ2U0QStoRFplbHFDamR6WlR3dmhPNUpsRnA3?=
 =?utf-8?B?YUppMS9HTVpJOHR0UktXQ0g1NTNDaVNYaWJ2aTlDbCtOamQxODRDZGZxQVNS?=
 =?utf-8?B?ejlkckxJaUl0bTNBOUNuS3BTWXRyd2xOMmhGa1ZBTU0xMHk3OU9LR3FwT3ZQ?=
 =?utf-8?B?a0txa282YWtucjJCS28rRE83Y1pPU1NNeVB5Slk5ell0aGYxL2QzZGsxeE8y?=
 =?utf-8?B?bG5RUnF2NXpMMktaYWVBeU5TcHhBdk4zK1FpVEFadEFoaFVxSVF4d0ZQU1dm?=
 =?utf-8?B?UEdkZGova1IwK3hPZXRPWUxWQUY4dXhFdFpuNUpvWnp4RElac3cvalIrRFd4?=
 =?utf-8?B?SlY3OTZ3SHB0dXFIeWcweGxRMUpCeTlQSlBNaGtUa2xIMWd5Q2w1dm5nMnE1?=
 =?utf-8?B?a1FlRHJ6QjBEUFdISDFCS3pNclVpeEF3SnpjaHZFRGlHN2sveFFXK3pGSFpn?=
 =?utf-8?B?aS9WcGxHK0p2OW01SEpSOGhRUDU3TllEdjF3aXZQTXlBQm5XKzIrcHpjMmI0?=
 =?utf-8?B?WHZzUGltZU5LN1JFMFIxYVhwYy95OXVxeVo2Z2ZGY2tkalVtcUxZbDNEbmVz?=
 =?utf-8?B?NHptU3pvaEVZSlFvc1BtM1g0MllnMjllTXVMYXlMcTFqRGhiOVRJWDFjc1p1?=
 =?utf-8?B?Ti9oZ09MbWJWYzRYY2d0TEZlcVFaMzdyODQ3UE8ranliUnQ2YWxvSSt3WVFy?=
 =?utf-8?B?ZmhLb25BMEp2dGpodXF4WGZiNlRuQWVVeExCeStISEt6L2c2RGZwa01LYVps?=
 =?utf-8?B?Znd6aW4yTzdhUVpWaGhJUUxwbWZUanlmZFdrVXVwaVI4V0k2NkNYblJuRnpL?=
 =?utf-8?B?Q0ZoLzZDRFNwNW5YdGEvZDZrc3RHcFM5YU4zSXJzZDZoMGZUdXJsR3R4aVVI?=
 =?utf-8?B?eC91QUo2Vll4RnFoS25FQW56TlI0VXFXRFVOa3JPSGNwMFhvb3pndnVlclFh?=
 =?utf-8?B?N0ZrTXJ0NE8vd3pSWmVRbmY0ZHdOQjc5bzZYcjQ0aUNSY0kyR1lHeGpSU2Nh?=
 =?utf-8?B?a09VQnZuRldxWUp0RFphbnNwTDhZQzk2ZWpXdXVlR2NlMWtkSVZMb0tXeENB?=
 =?utf-8?B?azAxZjZGSy96U0IxY3orYmZtNy82cUFaaVlSYk11bWp5T0ZpSkk1YjRFa0JU?=
 =?utf-8?B?YXU1QXlmblBjMjZ6VFU1dGlPekUya2t6ZHIzZTI3ODlPKytuaUZsYnRWM3lZ?=
 =?utf-8?B?eG5YbS9JaWIzb0Q4ZStXQ2VLcmJMRm4ybjUzUVg4NmZKdjVGY2hkdXlNbzlh?=
 =?utf-8?B?RUlveDZsSm9WRGJsMnRLUlc2Y2hGd3RCUDRkZlJMV1l4ZnV1S2lhcWJIMnFr?=
 =?utf-8?B?Y3IvVnpXNkpKVkgxUWxiR0J0VDJYRGhJeDNiLzNkeExWa25VY2FpSFc3d2xn?=
 =?utf-8?B?TzgyNW4vNlNFTUJhRDJIN0ErdzlmaXQvc1JISnYyaDZ1eTNaQ2JUd0FINlJK?=
 =?utf-8?B?YmQ3aEQwa2t4VlYrMkxuOHRjZTErSUxxRzExUU4zL0l6RmpBOEVIY1B5YzFK?=
 =?utf-8?B?SndyVGZLTHRwcC9WQm16U0k3UWdIa0wwWEc1d1lnc1J5VWh4VElhUlhvazF1?=
 =?utf-8?B?SURKNXNwdm05aTB4SlZvdTBQTVBiZzdERlVQUXZONjZuTzNzOHJ3NkM0bVVw?=
 =?utf-8?Q?JSZQPQ9QVkUWUFQijK4UVWlQG/yt1PJe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTFuMjlXQUxrRGRFZ3g1b1BZTVNGQkVSbjIwKytHVzdMRXM5NmhIQnJhdG9Y?=
 =?utf-8?B?NzdpeFdPbWNmQVVnUytjY1hTMDAwRmxJNVBtNExrQU9hdk1VOWhWZDVJWS8z?=
 =?utf-8?B?bDV4ckdZbU9LM21TS3UyQWdsbGlWcTNvYWhoYnk3UjVNdlFMMU1xRjRzdDM1?=
 =?utf-8?B?b0Y5YnRFdnRsb2VHVHF1eWlnQXBuVUVwWjFqajUxL1lySmtTQ0UvVDJ1SzVJ?=
 =?utf-8?B?ek9UcGs4VnpxN3JrSXM3cVhJQkliUjVUVFJUektEa1JLWXVQNGFKbmxWZ2t2?=
 =?utf-8?B?MjFIVWg3MEw4TTZZRXVSL2JaSUI3VWFqSlV5VWNzbnpHZmQ1UVQ0WHNCbGRt?=
 =?utf-8?B?eU9kdnJ5VEpSVDUwZlU5VjBEWmJtVEQwcWNmSi9QT2FMeUpucGpEaG4zM1Mr?=
 =?utf-8?B?aVAwWkNjcEo5UjVITFdsZU1CenYyL2xYNDZtbXN3Q0pSVVBFeVZzNVRHTmZ1?=
 =?utf-8?B?NzcyUUhzelkvYlJBL0VMbXJYaks0bUdWN1FjVEhaWjM1WE05Tk1xYWM2Umc0?=
 =?utf-8?B?Y0xjRkxSanp1S3lHQWtaeGVXeGhDZnJYaXMvWjh5KzQ1YUlYN2FlRVFDM0dE?=
 =?utf-8?B?T1NUMWRWUjAvZGJwUTRSR0hlYTRFVTJYRkZDS2lBcDRiakYydHorVGNDZGpM?=
 =?utf-8?B?SG9wWjJtSG9KaEpMYUhhaHJGcCtDR3YzSmtnU2tGZ0Z5K2VEeXhMdnRPUVNm?=
 =?utf-8?B?UGFkMFR0dW9XbnhERjNzQXhWT0o3WmdqV2drQkZ5TnZoTEQrTW1CaU54VkJK?=
 =?utf-8?B?a0poWWxVUjNMb2lpTm16cXVVM3hOV2Z2eXljWU9uQlh1WGlSdithRDEzZnd3?=
 =?utf-8?B?VTNCYTdZcFFXRUxhT1hBdWRLVW5WNWhTLytoVXBKbHI2SDVuQkV2N3I5cEs4?=
 =?utf-8?B?MUJlaldtZFpRdDM1bkx5OURQRDE2OW9zTHpDMlp0NWpMV0hpakVaV1hsOHNI?=
 =?utf-8?B?UjB6VXI4dGs0MUhKRSsxWGFLSm53UWtFZGRtbFJYVTZVeFdGUDNIZCtSeGZk?=
 =?utf-8?B?bWprSStvU20rV3FrdzdZeCtTYnhEVUpLTjJ5KzRtT0p5VzBGNkRxeXkwWUIy?=
 =?utf-8?B?YnkzYnRpVFFEcERNOWp5NnZaQnl4UTV0aGJ4dGRZMnh0SXJvVW84VVNHdi9H?=
 =?utf-8?B?S25lSDFMbGlNb3FtdkdIY3dFNVFtcnFQV3liNUYrWGdHT0FUbnFtMzlyTVBK?=
 =?utf-8?B?T2lOTzZmTS9wclk0SFRBaUxGWXdrdXRwcmJrbU1EMi9mM0RaV3gvU0FDclpU?=
 =?utf-8?B?V09QRHR6QUJGT2k2cktZT1JaUzgvL3RrdzZ5ek5kK0daMi8vaC9adUw5VHk4?=
 =?utf-8?B?S3BmUG4wbE5qaFhaOEQwTzZjYThKNG83eW9mSHZGanV5dlBUL0p2amxIYkhs?=
 =?utf-8?B?azNBTVJIUFZzUER6bHZ6UWpJQStjNlRUb3J5cmIrVWNmZmgwZEpoTzNiYVpY?=
 =?utf-8?B?TVpNZkZuZjVuSzcyNzYzKy82dXRtTTloNnVoTWJ4L3hmbTdkd0llRDVEbllV?=
 =?utf-8?B?cVg0eHhUOGk4b3EwSk5lQVhoSkdYMkQ4ZnZBUDRWVGV2eWt4Q29zekxqMSt6?=
 =?utf-8?B?ZlM1UHJ0TElDa2t2K1VaZ1pZNGpMZEhJRUZsL0pJd1lRYkJtTEJqTEJpRUhX?=
 =?utf-8?B?YWNuQnRLWmg2ZnRIWlRwZ29zUk9QQUY4NXlIRkt0eDNlVllUMnFrdTlkTGVk?=
 =?utf-8?B?bVpGMTZmdlZWeCtiVVovVWVsN0pCMTg3MzUxb3h2b0JFY2hnM01WK0EzWFJi?=
 =?utf-8?B?Ymh2RTBzRGtmeVFLTndLWW5nSGVTdlh3a3ZzWUhSZWZiQkVEWUxZanRTM3Zo?=
 =?utf-8?B?RnhtcnQ4anJWV3BueXl4bkJtaGlaZ204NVBSclYzTElhcTduRVFVNTBtNEw4?=
 =?utf-8?B?bFVNc2JYOE4wQ2VMK3d2SHFEeGM3V3pveG11eVN4ek5aUTNMOHFnQWFlTTNL?=
 =?utf-8?B?MFJXOW96TGc1WC9hNkwxSllialY3WERDSi9MSTQyWlU2Y2RNQVZPaWJ5b1ZJ?=
 =?utf-8?B?LzlMeEM4UDhrbUlLRG55S2Y0bUVqQ0MrUkF3OWgwcFZEb0swdUcxaVpodENl?=
 =?utf-8?B?TURXUmRmNlBLU0UxdzVQcEhERDVOYngyemNmbmhaQUZ0d1Q3aXQwYmhIVVM0?=
 =?utf-8?B?K1dER3ZWTmNCbTdTNk5kWjZWYVZqYkY1UVVpRm9xMmVwQkZtVDN3RXE0eTNw?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8064ec0-b083-4448-4212-08de28584099
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:14:24.0790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAGJurjUN98LSgBTz+xWScd0NECQAAByN54CFeUg7VcI09l5g4zo5b37Vx6HnfbqsOlY2hgNTm0PYGC4OyvFT3JJzmZWmqQIQ+gwJ1iuGN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7346

On 20/11/2025 12:08 pm, Jan Beulich wrote:
> On 20.11.2025 12:07, Andrew Cooper wrote:
>> On 20/11/2025 11:01 am, Andrew Cooper wrote:
>>> On 19/11/2025 10:50 am, Jan Beulich wrote:
>>>> There's no need to do this every time init_evtchn() is called. Just do it
>>>> once when setting up CPU0. Drop the assertion as well, as
>>>> alloc_hipriority_vector() (called by alloc_direct_apic_vector()) uses more
>>>> restrictive BUG_ON() anyway. Then evtchn_upcall_vector can also validly
>>>> become ro-after-init, just that it needs to move out of init_evtchn().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/guest/xen/xen.c
>>>> +++ b/xen/arch/x86/guest/xen/xen.c
>>>> @@ -233,16 +233,12 @@ static void cf_check xen_evtchn_upcall(v
>>>>      ack_APIC_irq();
>>>>  }
>>>>  
>>>> +static uint8_t __ro_after_init evtchn_upcall_vector;
>>>> +
>>>>  static int init_evtchn(void)
>>>>  {
>>>> -    static uint8_t evtchn_upcall_vector;
>>>>      int rc;
>>>>  
>>>> -    if ( !evtchn_upcall_vector )
>>>> -        alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
>>>> -
>>>> -    ASSERT(evtchn_upcall_vector);
>>>> -
>>>>      rc = xen_hypercall_set_evtchn_upcall_vector(this_cpu(vcpu_id),
>>>>                                                  evtchn_upcall_vector);
>>>>      if ( rc )
>>>> @@ -293,6 +289,8 @@ static void __init cf_check setup(void)
>>>>                 XEN_LEGACY_MAX_VCPUS);
>>>>      }
>>>>  
>>>> +    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
>>>> +
>>>>      BUG_ON(init_evtchn());
>>>>  }
>>>>  
>>>>
>>> This patch is fine, but it would be nicer to split init_evtchn() into
>>> bsp_init_evtchn() and percpu_init_evtchn().
>>>
>>> Just out of context in init_evtchn(), there's a check for CPU0 that also
>>> ought to move into bsp_init_evtchn() (and therefore into __init), at
>>> which point the percpu simplifies to a single hypercall, and we keep
>>> subsystem specifics out of setup().
>> No, scratch that.  HVM_PARAM_CALLBACK_IRQ is not in the list of HVM
>> Params that migration moves on migrate (see write_hvm_params() in
>> xg_sr_save_x86_hvm.c).
>>
>> Everything is awful.
>>
>> Could you include a comment such as /* HVM_PARAM_CALLBACK_IRQ is not
>> moved on migrate, so has to be set up again on resume. */ to make it
>> clear why that piece of logic needs to stay in a non-init function?
> It's pretty much unrelated to the change here, but yes, sure, I can add
> such a comment while touching the function.

Yes please.  It's relevant to judging which code should move out of
init_evtchn().

With that done, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

