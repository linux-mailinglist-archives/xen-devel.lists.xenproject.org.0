Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3112B176CF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066371.1431589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZK6-0000Um-L8; Thu, 31 Jul 2025 19:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066371.1431589; Thu, 31 Jul 2025 19:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZK6-0000TI-HA; Thu, 31 Jul 2025 19:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1066371;
 Thu, 31 Jul 2025 19:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhZK5-0000TA-HL
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:52:17 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d97085e2-6e47-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 21:52:12 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 19:52:10 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 19:52:09 +0000
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
X-Inumbo-ID: d97085e2-6e47-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC1RYnydb6Mje+ep6K5ZUcVLEbsAWihoNFdFwxtDu9k82vED5HaDLDD/ViMwwwVjZTYt/ej2w/6oJjxq5f2nxQEfM7eUm7Fwt9tE+jvI7YxxIDK1tyRyHLUfLAUQo1U7e6My1K3QdezHhe7KSY1heW4ddJpgLxAFNQesEpRgQxkt3bi4F28jJkItiVIzuH/ZrSO+0bkPeT/VTh1gtez8vgWeS6bTXD5sTeu+MBf7wmYnMIVXuYWW+NX1Y0w5pQWla6oPFekK7NRlroVp5r3lv5u1H+SAoVvvfelPtkWuGvGcWdZml0C1RMXVy+2fqy6NfzHbAmrGOOUTC+CwbwOLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZywfHKwMepOtgzFJOgaRP47cve9mxhDlyoE9TGfDjs=;
 b=kdDdohWvJnOeHTKGNp4cGECICHLQjB7koJnmVvl9ccDeULH1RO7RzenW4Fw7Vq54HK3gRCAuD99TbdVJrzKkwNmF/o0DilYJx6EDv0nQHav0rq+bobmaW+1qikFyiDWOQzoCdvjiO+diwjhvZhFNAY1ZoUw248FIU2JT6q1GJaLS1ebB2nyGdeGRD2HS0T0erHtyfY8zBsN3QyqivMUuko8tVrGw6JdA2yL1YP42YqdRCc9MyTMDdekCuW/xLJSUWSYxILkTt/J4opcAmh4eEmny3zrGeNiYphpa4EpOSn7NCo1Gu+IrK06oy6WBNBMIn4e8wB0QRvZda++Ja8bmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZywfHKwMepOtgzFJOgaRP47cve9mxhDlyoE9TGfDjs=;
 b=mqFfyC8HVSRD/ydPhVm2+KzK/PV/g1C69jq44MQob1LECRA50x9zMDYltR3kvACRKxzrpj04NJeNqkWnuXM0C2DJNADU/ReZDmDUumkaH/hwHBCN722Hrmuxep48NRNACM8j/aVG/fq5TGc5twhvYANTJSjG+M4g5lWR/civJ+Fv9e7BkXoCX+spAF4Do7mgCoF30GkvdQ0cyYzNxK9MkVOUU7ef8DvCmn3wk3r3CBlvi7I+qXP74QR9z2f9EDOeZqBUxt7cBLNG6zaahRkzkDL6xi5EenSVP1NhjzDGJlkZQpqSqt+iGpUazQ/kBOkFWxLBYDlZAZ11FYzAWC/D8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6f209ee9-cf3c-473f-92d5-0c1f0fbc2e49@epam.com>
Date: Thu, 31 Jul 2025 22:52:08 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before
 arch-specific initialization
To: xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-4-dmukhin@ford.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250731192130.3948419-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2732d8-f5d2-41f5-00c0-08ddd06bbc71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDRBWk1CT2o1QlZMcmJqM25UbThVNnE4U09DU0NCRDhTVU8wVWZYa3pmc2xB?=
 =?utf-8?B?QjdXMncvMFdaOC9PcVcyK3VWVkxYVjFGOERtWC9MTTQvaDVyRUJOQm45SFZD?=
 =?utf-8?B?MWJEVnlzTTQ2M1g2eHkzWnE2U2UxZlBYUDA1aW5CQzRJcWhqdDIyNXJQa1pi?=
 =?utf-8?B?Q3Z1YmQwSGhaV1oydVRxelZnS0J2ZjZJOVhOQzNocUZZRExPcVZvWXVUbHJI?=
 =?utf-8?B?bE8vOVkzOEQ5czdFOFJ1QU1NUFlUNkt3ZU9NWEVTYkVoT3hIaFVGU0d6b3p3?=
 =?utf-8?B?Qjg5eko0MUhWekNVTnl6dTQ2VnkzdG5XNlQwZzJoMVJHT3p2NEcxR1RYbWJZ?=
 =?utf-8?B?djI4RUpiV2cwWEJxWGRtOTg4WHNpOUJQWXBQbmhYUWdIOEdHZHphK3o2QXMr?=
 =?utf-8?B?aWhML3V5MFBCZnpqOU81Y3BBUzkyMlZvR3NNNFRkcXluaHlPTUREcTBxRm03?=
 =?utf-8?B?VE1ZWlhqREdaYnMrNzA5MUJKajFqNCtpY2RYYytwbEdpUEx1a2s0U3UrNmtz?=
 =?utf-8?B?eDZjU21aRmROemh6VWpJSm9xdzNLR1pZTythN3RWUllaQmJTZitiNFZjK0hO?=
 =?utf-8?B?Sy9pa20zZ0o1NGRJSjJ4dG43emlPSXNzbS9xeXNtM0d4UjBqcWl0dGtsU1ZR?=
 =?utf-8?B?SzRmYUZ2MmRjcFJGc3BvaFkxVVZSa1psMUhLejZsbnBpMVRiM2JYU2xLdTJq?=
 =?utf-8?B?NGJZT2ZCRVFFQk9UV1NDb3J4VjM5dGl6MWNGNllGalVZaTRNNzBZTHU1T0d6?=
 =?utf-8?B?SWZjSHU0WnF3QzByVTdsR3NmYUVabXVFNUJkYUVza3M4Qk04b2tMMmxIT0Qv?=
 =?utf-8?B?azZNREtTQ1JvR0tEME9pMUpyMXMzdC9jdDRza3dsNUk4RnFLUUNGYjhVUTRP?=
 =?utf-8?B?TjY4NHZOdnlwWE5pOEJqUklkZ3k5ZWY4NDJFZFNjS01JL3Y5NUdLZDArU2g1?=
 =?utf-8?B?Z1NRdWlncWhFT3NndDBNN3pIZ2tuM0ZETmtjWXI5K1BwT01Senhvb1BkbGRK?=
 =?utf-8?B?NFlZQmxaOFA3bGw1RTZFcDNFM0luVlFCZDd3dTVGNFZpTFc2Q052WUQrYWtT?=
 =?utf-8?B?MHBxNmdGenROUGtzcDBXdm5sNmU4N0FIblRQZXFSZUw2WDJEbnJPZ2phUitE?=
 =?utf-8?B?eFhsaTJhMmRBTk40N1hNc3RpMWtaNDhZSlorWWVnT0ZiaGpOTUN5emtvWlZ1?=
 =?utf-8?B?aTRuZU5RSWFNMXVJV05Bbjd2L2lQMGUxTXFlOVB4b0JTcmdtN3FjSTI5b1JX?=
 =?utf-8?B?U3VIMXpKeVB2Y2MwMTdkajBRYnZyV2M4SlJYeUx2c3BuY1FxVllUZTlTd1Nm?=
 =?utf-8?B?OUp3M0pTZFRieUExWEpZTTBJcUx6NVhFUjIySEQ0T21DK3FadXVSWTlXL0dB?=
 =?utf-8?B?QWU2ZXdRc0w1QjBaWmxZY1d5TFBoZU5oZ3JGQ1dBNGdSUXkwcCsxYmRYTFl4?=
 =?utf-8?B?WGdFMjM3QWpZaGRocm9yN2YwK2VScUc1Q2YwNEJEbjZpWEVvV1VTZE9TOEFi?=
 =?utf-8?B?bHVEbUIxWFRkbFNhV3RXNHNxRkFROXp4dGtwOEhlRUUyckFKbk96M2xLa1lv?=
 =?utf-8?B?NUtJc1YveVRWTjU1Zk1JTTc3L2VVWGtua2E5dHlIWUFOTHE0TUt1dGdlWmNU?=
 =?utf-8?B?YWxKZTYxOTNISWlJeTZqZTN3ZU9GNHlOVFMzb1lFRnhlcGJ5dFM2Q0JGa21W?=
 =?utf-8?B?TDRRY3YrT3BOWjNDRWtzQnRuQndsUFR0QTJzL1VUZ3dKVHg2dlc2K1gzWVN1?=
 =?utf-8?B?OHQwSWpOcjBsRXJ4dU5VaFJxcHh6UklrZUhla2VHdVFFSVE4WXRPNTBJSVMx?=
 =?utf-8?B?V0QwOENaNGVaWWN3WEttdFdabmxMeVloRWczaEtnbFZYSTdhYzFzaGlHT1gr?=
 =?utf-8?B?WnFnMkhiK0o1RVIyMmIwWGZ1MEhGazdJL09yamE0YVlDYXRmQU5odUo4Uy9m?=
 =?utf-8?Q?wM8REe+165I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnRBRTd0SGRVaHlPeFN3bnhLSFRJQVZsZVNvcDFES1k4VDRYSDJ4SUNhSnhr?=
 =?utf-8?B?eVZSMFNGOEV2K1pIdUZtbHlPdmtjQjd2WldlQW56RlFuTEFacUpycDVmWHZT?=
 =?utf-8?B?MjZlQS9DRXBpNURDTWNHS05vSmFhL1B6bzRSYXRDNW1IMytFRWVTWFZOUEpZ?=
 =?utf-8?B?UFYwZGJaRzJ0N2Q0SktHY21jWHgydnY2NjZGcy9hQWZ4KzJTNTZuWFAzcnA0?=
 =?utf-8?B?STJZM1lKOFQ5R05tbWpidWxjalp0L2g5aUJBdkJWRUxOR2V1MWliMnYwaWRu?=
 =?utf-8?B?R1pZOHhrR0tRa2RJeDF1czI1NTZzWjN3bUNzYU5nUm9LanV5V1NxeXhtR2Ra?=
 =?utf-8?B?dVpra1dFYlA5T01oSEFXdTJWL1h4NWNhN2l6RjVMRlBwVmpNN0tzdjJ4Skow?=
 =?utf-8?B?RDRjNUVKbXp2ekpkUHJWR1hxeVhZRCtXWFVsK3poVkZOdWVwOWc5aHZLN2wx?=
 =?utf-8?B?K3ZKY2dKWVYvN0tXZnM4VC9BRXpJMUp0RVRrZGpnWHA5UHFlTkNMVlpGUlNT?=
 =?utf-8?B?SGxtejdwZUs1cWdUWXc3dDZRKzVPUk1BVEozanNubXhlMUtHellxT250VHFM?=
 =?utf-8?B?ZTczV0JOV3MwUUdGQ2VJaHNQUmFPRVVBQm9MTmJHdFN1MUU5c0NJejdGYThM?=
 =?utf-8?B?Zy9BYTVtTFlZQ1ZwZ1pwL3IrT2lHcTVBbE1sVk9NWlhOV2I0ZjFpNmN0TkM3?=
 =?utf-8?B?UFdEZWF0bWNvYWJSelUyb3kvLzJDblBtQisvMkozZ29SdmdmYW11MWhzTitt?=
 =?utf-8?B?aDBqdVcvSXlINGhCU0FkeklqRjJlL2h6TWI2U2Z0RjVZL1F1TnNlbHEydXBL?=
 =?utf-8?B?SDFYMDFON1JaeUIwRzNNcFhKVzl3UDRSS2wwZ3dUbjByRVI0cC9NdGhVV1pC?=
 =?utf-8?B?ZWxRVXhmaW9UeGxYeDFHbFhZYXdidEsrdHhJSTU0S0wyaU5ncG1YRUlCcStR?=
 =?utf-8?B?eURtYkllY1JUNVo2MlRaZDZWc01LakkxYjF6UEpqZ0FjOWtLcVArRTV3aWg4?=
 =?utf-8?B?YXZsTXNQNC9xTXZsQTlXNmQwZG41NXkxRlk0ZFJmMlRVSXVCd01tQk40TGJy?=
 =?utf-8?B?WTFzK0JPWHVSOGN4dTNZRkVrTEZOVnlFUFpQN2xseWVGUlN0SEl1MjRvYU1j?=
 =?utf-8?B?WEZmRzA2WVdGUmtUYjhQSDNmT0Y3bnM5a2JuMGRwWW1MMUpqSkVydWx2T3NV?=
 =?utf-8?B?QnFxNTFpazZaVmxnc0xxeE5aWVdvQmpUT0V2UHNMT29BcXcyNXA1VGZqZDEx?=
 =?utf-8?B?Q21BdnpqeVhlM3JMSE9URlBYemtlRTMvLzkwTDZOdUU4RmdCQVNTS1VBdWs2?=
 =?utf-8?B?eTFuSkZ2WXVUWXYyT1VsbXhEcG9Qa3VhM2c5MkZnTEdaa0FJT0tMd0VIMSs1?=
 =?utf-8?B?cmtKR2xOb0xEM3RMYzNZem8wdW13b3I0L0xXalBQTkVSQlFaN1h6bTZFZEg4?=
 =?utf-8?B?dEtDZDdiNFVoL0lyR095Y1haTXBjRzZoWHhOaDhDV0t1QUpEUkcxRndlMmxw?=
 =?utf-8?B?dVhlNWlmeXNqc2RWNW5aUzhaY1VyaDNLOVNEQjdFL05YY1VpQm1WbjBjejNW?=
 =?utf-8?B?azl3bWZIaWNXc00wSXBGWlpOS1pQanVmWXNjYUNFSFpSM2NlVzBab0hlZy9z?=
 =?utf-8?B?ZldNblIrRjM4SUxhdzgySzVKdCtPbHQ2aHZyZzBhbkJYWEMrblJWaVJhemND?=
 =?utf-8?B?Z3BjNjFBK0NObCtpOVNOUURRa3dmcHRIakN5aWQrTzNtSnV0Y3hJRWYzK0hv?=
 =?utf-8?B?dWpWZFVSb1Z3VVUzTTREa2pER3Vub0hjWnRKSEpEUjlFSXROTGpielRjelNZ?=
 =?utf-8?B?RFBuSS9YblZSQlo5SVZsZmU3ZjNzTDNtTHZrRGpsaGhtNHFOUlhrYVBLOExW?=
 =?utf-8?B?cWx3b0hyNEdLbUNtU2JKZ2RRNU01b0RaRm9TcCs5Q1cvM2M2RHBCT2NvR2U5?=
 =?utf-8?B?SExBRmFaMENLQUFkSHptdkRvc05meVVkSy9xTTZKN0ZLU2dEcU1LMUN6V0pK?=
 =?utf-8?B?SHQ3K3RtVExiWWRnWXFrdTdrZThteDNuVGlVWWphZUd6UGhHQUdPY0R6U2hQ?=
 =?utf-8?B?SWQ0djlYcGp2UkpzR3YzekZjZis0UHVIR2FQSXFlaW1LREFnSlB2UjllSmRN?=
 =?utf-8?B?MU52YjVNR2RjNEtRQjNTaW1rU2xWai94eGJqQ0E1Nld1bW5TNzRScXo1Z0tM?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2732d8-f5d2-41f5-00c0-08ddd06bbc71
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 19:52:09.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfyevtFuCd1jDUNdMBPjZq+kt6ZH1BKEbxqch4feQdofoSkWgNqbeM5cWRCFDAJJwL/QDD05xKuukmYVjEcKXyDevyhkh3ZFbvfhHypFTjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

Hi Denis,

On 31.07.25 22:21, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> 
> That guarantees that arch-specific code could access those rangesets to
> register traps for emulation.
> 
> It is necessary for those emulators registering trap handlers and ensuring
> that emulated IRQs are not shared with the physical IRQs.
> 
> Move dom0_setup_permissions() call right after I/O rangesets are allocated.
> 
> Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the place
> where MMCFG ranges are initialized.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Chanhes since v3:
> - new patch
> ---
>   xen/arch/x86/dom0_build.c     | 26 +++++++++++++++++++++++
>   xen/arch/x86/hvm/dom0_build.c | 39 -----------------------------------
>   xen/arch/x86/hvm/hvm.c        | 16 ++++++++++++++
>   xen/common/domain.c           | 12 +++++------
>   4 files changed, 48 insertions(+), 45 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4fc..e965f506a3c8 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -471,6 +471,24 @@ static void __init process_dom0_ioports_disable(struct domain *dom0)
>       }
>   }
>   
> +static void __hwdom_init setup_mmcfg(struct domain *d)
> +{
> +    unsigned int i;
> +    int rc;
> +
> +    for ( i = 0; i < pci_mmcfg_config_num; i++ )
> +    {
> +        rc = register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].address,
> +                                         pci_mmcfg_config[i].start_bus_number,
> +                                         pci_mmcfg_config[i].end_bus_number,
> +                                         pci_mmcfg_config[i].pci_segment);
> +        if ( rc )
> +            printk("Unable to setup MMCFG handler at %#lx for segment %u\n",
> +                   pci_mmcfg_config[i].address,
> +                   pci_mmcfg_config[i].pci_segment);
> +    }
> +}
> +
>   int __init dom0_setup_permissions(struct domain *d)

It could be i'm missing smth, but ^ function is __init while ...

>   {
>       unsigned long mfn;
> @@ -480,6 +498,14 @@ int __init dom0_setup_permissions(struct domain *d)
>       if ( pv_shim )
>           return 0;
>   
> +    /*
> +     * MMCFG initialization must be performed before setting domain
> +     * permissions, as the MCFG areas must not be part of the domain IOMEM
> +     * accessible regions.
> +     */
> +    if ( is_hvm_domain(d) )
> +        setup_mmcfg(d);
> +
>       /* The hardware domain is initially permitted full I/O capabilities. */
>       rc = ioports_permit_access(d, 0, 0xFFFF);
>       rc |= iomem_permit_access(d, 0UL,
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 5551f9044836..6f47c9eeeaa6 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1310,24 +1310,6 @@ static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
>       return 0;
>   }
>   
> -static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
> -{
> -    unsigned int i;
> -    int rc;
> -
> -    for ( i = 0; i < pci_mmcfg_config_num; i++ )
> -    {
> -        rc = register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].address,
> -                                         pci_mmcfg_config[i].start_bus_number,
> -                                         pci_mmcfg_config[i].end_bus_number,
> -                                         pci_mmcfg_config[i].pci_segment);
> -        if ( rc )
> -            printk("Unable to setup MMCFG handler at %#lx for segment %u\n",
> -                   pci_mmcfg_config[i].address,
> -                   pci_mmcfg_config[i].pci_segment);
> -    }
> -}
> -
>   int __init dom0_construct_pvh(const struct boot_domain *bd)
>   {
>       paddr_t entry, start_info;
> @@ -1339,27 +1321,6 @@ int __init dom0_construct_pvh(const struct boot_domain *bd)
>       if ( bd->kernel == NULL )
>           panic("Missing kernel boot module for %pd construction\n", d);
>   
> -    if ( is_hardware_domain(d) )
> -    {
> -        /*
> -         * MMCFG initialization must be performed before setting domain
> -         * permissions, as the MCFG areas must not be part of the domain IOMEM
> -         * accessible regions.
> -         */
> -        pvh_setup_mmcfg(d);
> -
> -        /*
> -         * Setup permissions early so that calls to add MMIO regions to the
> -         * p2m as part of vPCI setup don't fail due to permission checks.
> -         */
> -        rc = dom0_setup_permissions(d);
> -        if ( rc )
> -        {
> -            printk("%pd unable to setup permissions: %d\n", d, rc);
> -            return rc;
> -        }
> -    }
> -
>       /*
>        * Craft dom0 physical memory map and set the paging allocation. This must
>        * be done before the iommu initializion, since iommu initialization code
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index cb8ecd050d41..b7edb1d6555d 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -35,6 +35,7 @@
>   #include <asm/hap.h>
>   #include <asm/current.h>
>   #include <asm/debugreg.h>
> +#include <asm/dom0_build.h>
>   #include <asm/e820.h>
>   #include <asm/regs.h>
>   #include <asm/cpufeature.h>
> @@ -651,6 +652,17 @@ int hvm_domain_initialise(struct domain *d,
>               goto fail1;
>           }
>           memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
> +
> +        /*
> +         * Setup permissions early so that calls to add MMIO regions to the
> +         * p2m as part of vPCI setup don't fail due to permission checks.
> +         */
> +        rc = dom0_setup_permissions(d);

... here hvm_domain_initialise() is not __init?

[...]
  

-- 
Best regards,
-grygorii

