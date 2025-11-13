Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC0C57A3A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161534.1489464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXKp-0002rT-Bz; Thu, 13 Nov 2025 13:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161534.1489464; Thu, 13 Nov 2025 13:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXKp-0002q7-8Q; Thu, 13 Nov 2025 13:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1161534;
 Thu, 13 Nov 2025 13:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJXKo-0002q1-8S
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:25:58 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 471803b6-c094-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:25:53 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM7PR03MB6245.eurprd03.prod.outlook.com (2603:10a6:20b:13f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 13:25:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:25:50 +0000
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
X-Inumbo-ID: 471803b6-c094-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgoPIw22xj6XUAYkvp5NSkZ/mzqToPeUIOFVfLkNgOflfSfJoxQPCeVUddT+qnvcn3mLF8beIYhQoymju/Higip/isgx7ehgzMGI88Sr+XRUNQVFcFh47s1si4fjzDjMnVm9HIiGSMKu2P0fZyBiagZnuOu/moif0Y05dOlx20+S+ivf6yDd934Zu667JeoM23ztlJ/w+Fv2G18y7DSzQi2FdrW/0nZcJQcOp7Jj4jX4A5+8u87Gd9VEi9LVxMphgwvcNfBWeK6urOn++15Mptm++dw6zM1mSjZkaUPrYsAtIw7VtjJuwDcnEeNyI41VvmjcfqNmBP+sc26x3jB3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u34W0itE/so5UXnaNLLHFdfb+egyXWA9pu9/vH2ID2s=;
 b=OjWOwvOXZNxK4QCTGFds5oCtjF8qDUjNq+go8mUNzOCRLmhrUgF2435RYW7l6zruvpam2D1fPZPDq+mkUN2xhkhb3lrmPk3g1HDjyB3cUkEqjDxqWiOnL+TDBy3H6RCyi5L23seT2936l6pIE+LxzTiLf9X6LbAG+YXUTXKkvVWzOCAm2uoVzUIIXsUESErdt8ba/fVFC1YXXlF3wRe5e++SYJ/fXM+iuQimWYKmCrOBEaSDeGdiI07s0gqzNfamWZe/sfB0AwnQvCVSpTjfCdRGQuN1NfPFHBM9qZXUm1g4G7+aWtdc7ihs26DIWktM6+7V0IPKwJUzASNHRiiTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u34W0itE/so5UXnaNLLHFdfb+egyXWA9pu9/vH2ID2s=;
 b=JVxEgQlEqpSmacSfvbkww5OF6zKPSaVpAoxK91xFPk3SBFbYFbRRnKYtI1W1fo82Mm8u+6eqwq9XtklxZW3QjUbcinMMXrWREZ4BzFs03kA09Mh3IzYfJqOjsWQgP8Mtx0Z7WsbC1MnF6RcSkBxU5k3DVCXDmWgMoDk+A6LzyCBKWqgsPUqzNKIpedVWaW5hMEWjA+VhAIhHU/8PauNvtVLRYh/aonwB9pT2PYIc8OxYITyvpMwi/j6R+0ZG3BS25ajIBVk3Aw3TaDRwsYeO50nVl5qs579UdobrP7E07lcjuCquWITBQztEv8AqdwSOoTYW0FSKyR8SpFRNOT3RIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <ab2a849c-cf1e-4a2d-92e3-f13a39513dca@epam.com>
Date: Thu, 13 Nov 2025 15:25:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
 <20251111200958.3576341-2-grygorii_strashko@epam.com>
 <25ec2731-e629-4cc7-b374-5e48fba4c814@suse.com>
 <f8dd8d55-8b5f-403a-9009-49d13112a774@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f8dd8d55-8b5f-403a-9009-49d13112a774@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM7PR03MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: c043bf60-7571-4a2b-6999-08de22b82a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHhURkxIL1BleTFyZy9xZDRMRFBLUFQxNU5rVHlIWjBGQjlqbmszL3RNTStk?=
 =?utf-8?B?WWhaU3YvTzNwakxCNHR1N2JTSHZjWXJIL1ZXa2NLRm1yUXpSWVlFL0p5Zlgx?=
 =?utf-8?B?Q29RZFhlcm1vbWZLZ1VOSGxONERhVHI1b2lMdEdlMC8wMEpjNkpHeVJlVWVs?=
 =?utf-8?B?TlpubklaWUVTWnhFelhpTy9EVEFwN2hzVTFWZ1R0d05MTnZQei9OYVAvdENK?=
 =?utf-8?B?dzVCS0dTaFRIeHQ0TXVycHA2M3hTN0NQRnplOVBMK1lGTXIrMWpsdTRvVlVE?=
 =?utf-8?B?M2ttRzNMTU9TOTdiTE4xVHlGQzJDT3h0b1VRaWk3WmQ4bnVxcEZHWDZWMWJP?=
 =?utf-8?B?OFdiMnZhN3hjY05xNWVwVWdMWjJTd2VmTW5KRHM1VVg1R3JxVEs3QXZvblp4?=
 =?utf-8?B?QWhqcno3eUZSdlVSSUs4UldWcUtwdGsvL2V5WHdkbS9YSUwwQkFLZkxaOEtp?=
 =?utf-8?B?R3RRbEh3cG4rVEJKMFh1Vyt4L1djTFFnWS9ZQXROOWg2ZWRlc3Ftd3F5Y1lX?=
 =?utf-8?B?amVabWFIZVdGRkVrTzlQUWtLdmhPbGFZelBwMm4yRjZjcFkxVDJFdmNuTDBk?=
 =?utf-8?B?UVhYWUNoeHh4Tms3SUlyNWhPV0IxRkJMYnQ3dTVXQUxWYWhYYkdUb0pGZlBh?=
 =?utf-8?B?T1loLzNNdzgxQzd0UnpNQkdDaDhvS2hXa3lqcXNhbHlNS2RnTnVIY2Zvd0R6?=
 =?utf-8?B?U09KV0RRcVBzbng0MVVrRG9iYm5nZHFMT0oxQjFkaFlrOVVvVGhLemdmdmRx?=
 =?utf-8?B?aDVqcU9XWCtKNGJLSHBRK28ycWVwY05qLzYzZnZGN0diSlg4ZjR4OHlMNko5?=
 =?utf-8?B?eHRMTmhLWUVQeC85UXZXWUNWVVdVQzFNTDBISGFFd2dvODE5ZXk2M21RLzFL?=
 =?utf-8?B?TWRQVjVIOU5acGxZYWpxdVFjQ2lkNlA1SXc4SzBvM09mdFpUclhQK2dpU1JX?=
 =?utf-8?B?N2NFVDBxYUR0Uis0SXM0b0c1UlVVR2oyWVFoRU9OdDNkQVAvMy9POEtnVU5s?=
 =?utf-8?B?KzE5ZjYxaXBQazVMOTFldW15VjFHa1Y0cXFRUzA3TWM4bFN1ZWFoVUFzQXNT?=
 =?utf-8?B?VjJ1ZGFIVmk1WjNZRHVueXpPM3JZc1dCUUc1VEZuYktYckpTNkV4WWMvWVpD?=
 =?utf-8?B?WUVMVlNtazYyRXVjMjBHVGZIOW56UUR5TjBtREZOaUhCQkJqV1BINzBsU2Zu?=
 =?utf-8?B?VUNCZHcvVTY2TXhHSzdic0EvNXdXVWFQNVVvQkZmeFAyTTFUQlhEeS9UTVB2?=
 =?utf-8?B?WXFidU5GbGRDKzc0VXFoMTJlNUxFRWczU0xMSFFpbzJCMTNhTUhpYzh1R3B1?=
 =?utf-8?B?RXN5M0JjbGI3SEwxeWdoc3hCRnFiZm9Ea3B0V3VuSEpBVXZEYml3TEExMXV0?=
 =?utf-8?B?WEovS0VIaWhNS1h3NW9rZFNwaEVaNlhuOHJCRnBhWTljNnU3cTN6WUI1d2JN?=
 =?utf-8?B?U1VMd2IyRWNPMERQWGNTZ3QwNklJUzNpQ1hOekRMSnoxZGt3K29LelBWZi9M?=
 =?utf-8?B?c3NhUHBsYUF1a2VWcW9OSW1YNXViRlhweTUrYkpnaURNdEpTMVR6dGxyZ2c1?=
 =?utf-8?B?NFlseDRHTDRIUlhabE81VW9DWWlFRkF2VUdyQ25MUG5Kd050VElZUEo3YU84?=
 =?utf-8?B?ZWtqUVVCNXE1NnV1UUdZckNqenF5aktSQ0NRajdmb1NwQXRZeEt4M05KcDc3?=
 =?utf-8?B?cVNmMFdnQ1h1VVBWdGg1NDhQaDVoQ3RNTUlLck5jODA4NUc5V0l5aXV0THNz?=
 =?utf-8?B?K0JhaytBcUlWclQvZ2tCVzdERGxuc0lONGxCZlJwdU5vai93MnJ1UE11bm9i?=
 =?utf-8?B?ZzMrVUNwSWpkRXovbXpqTTBXZnpXOUJYVmZwR1RDMU11NzF3ZTExM003U1px?=
 =?utf-8?B?N2VIWWRKRnY1RUNzK0pkZ0hQb3FBZ0ExOHFib0h1YWMzNTBISnlZbTdTZnVR?=
 =?utf-8?Q?0c9VFm5hNx/20InsQpM1KiN2I/cc8Eyv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aS9JWlg5cHFqQ2tVb0IzdHp0aXlQT3AwWWI0bUdPbDVmNFJrdDRGNkwzT216?=
 =?utf-8?B?QWJkRi9wcW1RU3E4bnVDRWphUGU3S2s3RnREVXdWcVk4UXFFdCt6UHVBN1cv?=
 =?utf-8?B?bDg5M1J5VWJCNmhwZThXeDlETEVuenJlQXg0Sk84MkFFc2xqRXlaV0pJalE5?=
 =?utf-8?B?NHVkaGZFOEVXa01qNEp2MHZmWk1RZysxTVFDWU9MSjdrYVcxajhiV2NCMmpi?=
 =?utf-8?B?azdwdEE4Y2Zra0RWeGlZa0hVclExcXE4UnNrcmE2VkY0N3pjZDFXU1RaaDVW?=
 =?utf-8?B?SUdtRFkrcFMvNFlSa3pSaExsbTNWYTMzYlRicFlUM05BbzZ5ZlFPS3hmNGN2?=
 =?utf-8?B?N3lxaFQ2OW1iNkdKR240N3JZTXM0V1M4aEFsVjJWbE9WTlphNElYeGxBVnZE?=
 =?utf-8?B?dEZPSlAxQ0RCOGhRSG5JZkU3ekxzdW1HTmE5MWtJY0R0cnJwQ2NyV2JDTnJT?=
 =?utf-8?B?UGQ2b25hVnZTbzdkVXR0NXhLQ1NFV2NZK3lPTjhUUlhiTXFsT0laU2FWZDlV?=
 =?utf-8?B?ejB6UTVxV3Z3MGpWODIwVXpTZ05rMFUyb04rblNtbElrUFlFZldBQVY0M0px?=
 =?utf-8?B?enh5RkJtV1NtVC9qWi9SaThtOXVtZnZKdVpQbm0zbjhkMkxnamgrMmpoV3o2?=
 =?utf-8?B?a0pqTkE1cHl1Uyt1eHEra1gyRy8zWGZOUXJneTVpWlVDb0Y2a3NrT0NOYkh2?=
 =?utf-8?B?QWZYOTA5TUNIYXB1RHhWb0dPelgram81L3RwMnFKV21SN1U3VGNqR3U0UmpY?=
 =?utf-8?B?NDUvN2dGSDFzRG9xT3RXVnlmcENxdTkzenJ6OUFId3loMW83RkxjSkVsVUs5?=
 =?utf-8?B?cllUVkc0Z241YXR4RS96cGljUkUwMURiT0txS1hUTUxCRVNieTcyZmRaRysz?=
 =?utf-8?B?SUZqQXNMQy9uQ3NjcUp0WkdaSnBKeVBFZWRneTFxME8rbVlDU2NGK0gyNU5U?=
 =?utf-8?B?RVFwTUx5aWNJbVVnVk9UQ09XQ3JiaXk5TjQxaGErMzNtRmFHMjloeW5TSmlS?=
 =?utf-8?B?aVVUeWlkY0tkTEF4WXVwRVE4KzZpUkFMb1pWZnRSWjF5VTNnNkNsb1dWZ3ow?=
 =?utf-8?B?Q3EzWnc2R1VnTkNIcTBRMXhWeU1OU0dadlFtQk1ueTg5ekpxRlBTT0tpNG94?=
 =?utf-8?B?V3ozM1RIeXlnU0FFdlNzMFJTS2Vhb2Mwcm0xb2UwNG9qQXAzUEVnb2M2MDl3?=
 =?utf-8?B?Zk9ENWorbnpVMDAzQ1hOWlpUMEJnRFhsY3RVY05KdFBJYng4TGRta3ZtcHA4?=
 =?utf-8?B?TVZvZFVlY2NYM2JqdFVac3VQdFBXUDBnSFI2aTlyUzR0bThSVGZyZmJMeEJD?=
 =?utf-8?B?c3ZwMFhrYXJRdkZFVTdGaGI3SkpiTUVpak0xdkJ5Y0IrWXF1UXg2Yms3RDhY?=
 =?utf-8?B?ZTFwSmxCbEk3amhGbFVqNkUwd2RDc0xLZnUxYmxZbENUb1ZpWi9rbklEVEZ1?=
 =?utf-8?B?QnRlc2NrY3lUVFpaWVVaNkozVm5rVnE1ZVo3Yi9FT1E1VENUMEMxOXByWUNr?=
 =?utf-8?B?WXp5NEZlUE9JTWVCVmIwTmVnR1ZlTzZKUFdFTnVOaTloV1pzc21udHVUUkE4?=
 =?utf-8?B?U2hnWlFvZS9pZURCN0hFN1luZ05DTjF2cW9kQTUydFU3Nnh1c1ZqVjhIaFM5?=
 =?utf-8?B?ZkJyNStUS1BIeGdRaFI2NmkxOWIrRDE4U0ZDaFltZFkreXREaXZxUGFMNmRy?=
 =?utf-8?B?NTJHVkVmZithb3gwU1cwUmYwUEphVTc3ZWp1NlRCcS9FQmVqblh5T25LWjhp?=
 =?utf-8?B?Q2NhVHlCVDRrc0hPVXVnaCtvbml4c3R6RGZSdmlnMVZaeVJldUcxR0pJb1k4?=
 =?utf-8?B?RFVUaGVadG5POFJ0V0pLNHdpZkZyS3FGajkzeUYwVkVFV2x1d2NBa2MzQkdK?=
 =?utf-8?B?YXlZNGp4NnFpL0F5bE5yckpWeFZNL2doK2Y1cmtiWXZBRG1lWWR4ZTdnSGVF?=
 =?utf-8?B?aVlSdEFUV1ZHU01CU0lxdUNma0RGbUFGSWNnaVVuZFJsVldxckZwQnFmRjEy?=
 =?utf-8?B?NEVYbFp3T0g2MEJ5SVlzMDUzbWEvOVdLd3R2ZDgxeTV3OVVSK2dJU3BaczRZ?=
 =?utf-8?B?R2thWkFKbWlSRG9nUGU0cmtFOEp6YmdxQjROTElYRjhqbENBS005MzJ5czJv?=
 =?utf-8?B?Mk1pV2lKZWJyVWpQTjZ0QS95ZnhsbkhVMFVsS1h1a2tBOUNjV2VKTGRJR0lh?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c043bf60-7571-4a2b-6999-08de22b82a03
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:25:50.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBR7jZHdzvEzbPFzcD1QnbdPLy61XZEg0fSZIFx9bk7szMYEHYCJ/6uPuad/QNyLTW8UoZOFJh0Euf5i3yNfwwLAthgb6CqeAexSsqIzsKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6245

Hi Jan,

On 13.11.25 13:19, Jan Beulich wrote:
> On 13.11.2025 11:44, Jan Beulich wrote:
>> On 11.11.2025 21:10, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Functions:
>>>   hvm_shadow_handle_cd()
>>>   hvm_set_uc_mode()
>>>   domain_exit_uc_mode()
>>> are used only by Intel VMX code, so move them to VMX code.
>>>
>>> While here:
>>> - minor format change in domain_exit_uc_mode()
>>> - s/(0/1)/(false/true) for bool types
>>> - use "struct domain *" as parameter in hvm_set_uc_mode()
>>> - use "struct domain *d" as local var in hvm_shadow_handle_cd()
>>
>> One more please:
>>
>>> @@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
>>>       return 1;
>>>   }
>>>   
>>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>>> +static bool domain_exit_uc_mode(struct vcpu *v)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    struct vcpu *vs;
>>
>> const on all three pointer target types. Then, together with the function
>> prefix adjustment discussed on the other sub-thread,
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Seeing that the other two patches are ready to go in (again, once the tree is
> fully open again), I might as well do these edits while committing. So long as
> you agree, of course.

Of course I agree and will be infinitely grateful.

Thank you.

-- 
Best regards,
-grygorii


