Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPM1IuoscmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:58:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EF1679DD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211065.1522601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivBz-0007HT-Nu; Thu, 22 Jan 2026 13:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211065.1522601; Thu, 22 Jan 2026 13:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivBz-0007ET-L1; Thu, 22 Jan 2026 13:57:47 +0000
Received: by outflank-mailman (input) for mailman id 1211065;
 Thu, 22 Jan 2026 13:57:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxn8=73=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vivBy-0007EN-Su
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:57:47 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5315cee0-f79a-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 14:57:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB5961.namprd03.prod.outlook.com (2603:10b6:408:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 13:57:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 13:57:41 +0000
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
X-Inumbo-ID: 5315cee0-f79a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1o1cAPkIj+Ci03DwE6Cnkk56yEqTSP55dJHG4c3yZar4F4oDRthejUZMcUGP1qq58yOrdGx37627OCYwFEAAggHBwBmIiivrm/o87AplK2pigxg4Z3KnhwrnXzZIIV7eZJFg+ymAhZnBEoKt4lxFASnfLEF2WXcaynWu8GNmB3feDYC9k9VwTaepAH4p0i2NRAQh4zq5wIEfhNGq33kpItACLFim8+NiNpdO5rsqPvgkUXqC+ybksbVHbeR0EM6ktQxztrLXBcXOWVXEl4tO1OjLv4qWUyqoKXFExrQP6JISu2Mg0efU6c0ylaBf2PX1eEcoiTP3rZU5yBIqLQmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1FFRucpM+bdPc7KImaXQWQqKD8h7VBjbhr+XSgUbQY=;
 b=XkUFLpckiUkilZjHn3eZNIOQn7UsjQfcfezWcvnbAzq+8WrWpFautwLbGMsWKG2bHlRO5Q546YoAThKOVrWKPpnyPHKb3T/Lj5wBAPQW3jkW6ItbNlQPdtfl+Cqzx4ZEMUJXXMct+Ho1xb9BTV1EI4+VwMDylP4L73mS+UVUcbeUnFm2SB9SKcPXnRjoC8GsjiEDfey0/NWEYQ2un+3j+kMLvMF1m4UTuyTiPdhKZpcR2b19sbYHJ4CfpAK0bzkshn+13j+EK1zdI4NUm9bWaN9NhOWpd+gyGuc4MiA3SwHQA9fy4HgAII206SgRfs+ickucReDREwbFXj1UoWkUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1FFRucpM+bdPc7KImaXQWQqKD8h7VBjbhr+XSgUbQY=;
 b=n4JimyYLUb6t53tBzNdqVUCDo09jHwcS9PqqkljU/au5YDdd8+R8ebbYlpZaY1YuYOVd4NCVQ3Y3ZmYJj4pLUpWb+yhNXuG6tAGoL+tDeiBq+WOoNW/34gd1PCl+vb+/y11e8Bguzj6eMSVZps9fdyB72HqNTapsEZg4PvW4TWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <92c02d2f-ccc5-42ce-ba0c-076fdc75e1fe@citrix.com>
Date: Thu, 22 Jan 2026 13:57:37 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
 <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
 <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech>
 <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com>
 <4a38c2ae-dc60-4fed-b30e-81a02b657e92@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4a38c2ae-dc60-4fed-b30e-81a02b657e92@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: e53c4833-cfba-4974-1485-08de59be3593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTNZc25DZTlFZDJuYXBmWnE3T3o2NGc3OWZQZGdoSWZoKzJpUEhVL204NE1p?=
 =?utf-8?B?N3ltL1hNUklYOFF6a1NLOW92dnhrTWlWU1FxN05ndE9BWWd2SSt3b01kckhE?=
 =?utf-8?B?ZGFHbzJ5WWU1Y3p3eFJ4blBYUjArZjVvRWVnZDljRmFBTjJSTjJHbTYyeTBn?=
 =?utf-8?B?V0FybGY5cHdvRDlqTHU1b2YzUlJsNVc5aml5MDczSnQrVWwzcTVLYTVhMkRp?=
 =?utf-8?B?ek9rMy91QllTMUhZUi9hME1WTTRWODlPUkdYbXlvRTVsOVZOb1ZBUFFvbG5J?=
 =?utf-8?B?Uk0wcHdxMjkwQ1Q2Q25PTHlscXZMMjJScWp5ZlhpbG43TWJxK1VLOHA0V0dt?=
 =?utf-8?B?bDh4NDdiTkxJWG1VUHB6eVZiSlFadTlsazlwWlNiR0E2R1k0bVlIbHg0UWZ1?=
 =?utf-8?B?ZEczaDlXaDU3RXk2d0ZYaE1pMTRDWGJodjN0NGlmMmdXeUI1M25KZGVZeVh3?=
 =?utf-8?B?UXNLNGtkbEhWOVgwbFBNY0ZOWFNPVHQ1ZmtrU1lSVGp5OE10WnZCVEJTYlBH?=
 =?utf-8?B?N0lDMmxoZDBON0xQS2ExQnVVc3hWb29yb0hKQjAvSFF0NzIyQnZ5Z0JFZzB4?=
 =?utf-8?B?Slc3bnd3cEJRaStEUXdiaDMvSm9GeExvM3JFQlJLUGJ2RXovR2VIWHdIWjV6?=
 =?utf-8?B?YTBQbktzdzlWbi9DY1FYY3V6Nkh3YzJqWU1hMzdTNXYvd2Q1eEN5OEdLTVBL?=
 =?utf-8?B?NGpLb2gwZjNuYVNVSlVUNXZNVHJQcExzTTRsLzlpTTZobWR4Yk5veENiQytk?=
 =?utf-8?B?SnBvVGplSEswWGNOVXpoS2lhK1I2Zzh1MDg3N1RxOXhHS1NXZndDelRYYjhu?=
 =?utf-8?B?Slk4UVN3Q01Jd0w3T1pOa1QrSXBma05qWldWNlFFYmVmZ1hJS1l0TzI2ZWRy?=
 =?utf-8?B?amhhOEVLMld1WXZINUZ2QUVTVWpYcDZWNVVKSTFEVWJPanA3bjVQTW1yclk4?=
 =?utf-8?B?UzFXTmxVd0xGd0V2amRwbTlvYnhvOEpROVVIZTlianAxR2VLMG5iQnNMUG9i?=
 =?utf-8?B?N0dmNzlFeng2eTk5MG43RjR6OHFtREQ4bUtGTWVKZzI1N2UrV0YvL2FTTGQ5?=
 =?utf-8?B?bnlQc29HNDdJTEl3b0tEOFhNSHRHRGFzRkpSWEl3RzRabldoejdiOFlKcDZQ?=
 =?utf-8?B?QXBtMmx5aU9FaUlRRTg5UEVqM1V1MHJRQi9wWTE4N1YzWm5kOVdHTmNCQzBB?=
 =?utf-8?B?TThuM2k2d0FXSnlhMWluWnUwQlZKeVh4OHZxVkt6by9yd0xTQytySnM3c253?=
 =?utf-8?B?bU53RU9TcUErb2F1NHNCRU5YZlM5T3ZyWEFuSjdPVERTL0lCOWFITksyQ1FK?=
 =?utf-8?B?cTFqSk9aSUJscGVxTW9XNlpwUUJQMnl6djJ2SkFEU1ZZUmE5akFLMkpMTU5O?=
 =?utf-8?B?VzZCdzdQWmxycUpjQ3NGSlBRYnl6TEdOc1VRay9EWVpOUzhqeXI4RFV0YTV1?=
 =?utf-8?B?WU9wTlZFRjdiUTFvUUFOMmxMRXVsQ1hBN2VCN0pEMmM4ZTVzZ05Zd0lCblkw?=
 =?utf-8?B?V3A5V2lFQ1VtWGdTaHlJOTJaeVpSZlhlY2d0UXNOaGVPT3NIMXBzQjk0SE93?=
 =?utf-8?B?MWQvSkRoUjBWdHRibG8wNGN6L0ZoQkNmaGszUVFsdG5qRWNXMEFZeGlPQUY0?=
 =?utf-8?B?b3hmZ2tFMEdBY3ExdGFKUnVObytGNnlqeXREbTFzTXcwcFpLYld4VnUvSzR3?=
 =?utf-8?B?NEhpMWw5bEh3M0trRTFwMFpPbEovazFuUmdGUzJaR2ljNzdnUmVkaVpQZEo1?=
 =?utf-8?B?WGhVVUFCWXZLMExaTjlMTk9iVzc4MEY5V1R3SjVSZENNb2VWWitaTEorcDE5?=
 =?utf-8?B?L2hHTVZmZTJBRXIrK2lXblNVSXZ4U0Fndmp5VUJBQytoNnB6R3RsOFlPUnRY?=
 =?utf-8?B?VFVMNysxSG04ck9zYVZwZm9FdFB3ZHp4TiszQlhTUUFDRm1iOWgxOHJGM1J1?=
 =?utf-8?B?UERXbVZNTzQ1eW13VXcvZ1YycjRySFlEV0p1UG9XQjN6SFRDaW1scTRSZU5J?=
 =?utf-8?B?aFA2SWgzTlA4L2N5eUJOaTNDZUhqTnJaUWNBazlTYTVUYnEzRkw3VHNkMUha?=
 =?utf-8?B?OUJQcnJxdHZHM3dLYlMyOTRheGVqajBiemUwVUszMnVyT2tQbm1BbEVEa292?=
 =?utf-8?Q?LAaM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2F3U0ttM1FWeGJuWmhtMVBTd1RHZFgzOHlSUHhEaG5LMU8rNlFkTGU5SjNB?=
 =?utf-8?B?SlY0cnU0azJJak5pSWs3YnVXcmlWTWoxbEZqM0VmcW5VZmRJSEFqaFh1dGpN?=
 =?utf-8?B?eUJhQ3BRVjVyYWRjaVdZU2puSFpoOEVINGxzWm9YMTY4NFgxMFJTRGhwT2NE?=
 =?utf-8?B?cG83N3g5cm5WUFc1NlJtN2ZOV2RIb3BCMHNZTlY4K2ZXbFpnZEpsK3RNRWdu?=
 =?utf-8?B?UldvS25wM0lRa25yMFJGakx4TnBmdWQrckhUandiUTV1cUVJL3hjbFBPWTFM?=
 =?utf-8?B?dFpLM1hDQlJnMVFyL25HL0tqY2I1WHBJVEJGQ2tPWmlDcUVKdE85Nk92cWJS?=
 =?utf-8?B?Z0FJcGo1aUc4c1djd2drVVVYSy9pazNzQXljUTBhU2VQZGJVTGZxU0tIaVoz?=
 =?utf-8?B?d3ByYU9ZOGJzQUFwaVJndDk0YlQ3MU5nbStSaE5QeHpCOHArZThYWHZnVkJ2?=
 =?utf-8?B?SEpHTG9jVFVEbVh2bUJxS0xDQUFLaXBNZU51K0ZFRDFhVWpnQ1BNYmtmT1Mr?=
 =?utf-8?B?dnIyb0NNdHN3aWIvQnhXL2lsMk53NnpRNDdBcHFzL2ZpcFpZR0czWTYyTURk?=
 =?utf-8?B?UVIxNS9tS1FKYXRZRXY3QXFEQkFYazZQWHV2bGRxOE8wclM0WERiOVdidFdQ?=
 =?utf-8?B?c0VUUkVKZWhvUHR6cUhrcE9NaWdTbXhINkRUN1FGblpZRWE5OVU1NzlOdUNi?=
 =?utf-8?B?dnBibmd3WmNwVHZXQTYvRXB5UVlOWHVXc0o4SDNaYmQ2TkN5T01sYjdSMkNp?=
 =?utf-8?B?UCtMSmdCUnlpVkpQdm9vV1hXSC9JVDhnNVltUStnb2VoZk43K3o5VXQyWUo2?=
 =?utf-8?B?NUNwZ2pOWjYvNnR3SGxsNzM4WXhUWjllS2pBWDNJdVU5WEFlSHRkN0F2MXEz?=
 =?utf-8?B?TXRjQmVkVklJR2hmTG8vWE90Q2h5aitHOXl2YllJQ096My9rdjVjN0ZtaW5Q?=
 =?utf-8?B?ZXdFcDBiRjdidG91NWRxU1FqZ1JIZlN1eHBQUE5RYjZwVno0RnQ0R0pHRzM2?=
 =?utf-8?B?RkxOeXlDcXkrV3FNdHl5VVlUOTRtM1g4QzhOUG5VckN1bjkwcXJOSzU0TU8v?=
 =?utf-8?B?YVl4OFdhTHBkZlFSSDRmaHlpSTNJZkFDbExKZmtqbWhieDFqVkpNZklRNFhi?=
 =?utf-8?B?aWRORmUzZFdJZFBZUFYxY21EYWFPc2pwNHlqSFZwc25TVE1qVTF5d1NySEZw?=
 =?utf-8?B?aXJYZW5iaEJ0MUEyK1JCbTY5bjUvaVZhdCttK1FIc3Zxck5pOFV0SjhNdUJR?=
 =?utf-8?B?Ym03elM4aFBDQ1grSWZvK0lJTFRPcS9EaVo4eVY0R1lHUFJpMjN3Qmg2MTdE?=
 =?utf-8?B?eFVaT0hOYXVxdVF2bzFraU52R1hjNnQwNjdYWlBZV3dJMHpvWERBWUxyVVNx?=
 =?utf-8?B?NGVweHlQWGZYOXdNQ3BVQURsK0pEUGljV3Q3d0g5RkZzQW5MeTZqVkMxb3ll?=
 =?utf-8?B?QndyTEFPYkUzYVlPYitZVFM3MmlmMTBCRXBPaWhWVmxEVzhlTEcwSWhnNnU3?=
 =?utf-8?B?SVJHNHRTd1c2RDdVMXJ6NWxQbXFZb2lDUXc4endhTXNwWnhzWHNFSnE5bHJq?=
 =?utf-8?B?R1dTMnh1SHFVbkJodkpOQXB0Vm9EZjNvWGZrSDYwanJTeWEvSGJLbCt4eUk1?=
 =?utf-8?B?RDh4azZZVjQ0TU8rT0FIT202cjBWOVV6Wll2bUF1SmtBajdZY2lXTFhMQVp4?=
 =?utf-8?B?L1NPTXFCMzY0R3hUWk9xUHd1RStWN0Vnbkdta3MvTGdXa1M1bUVuWUJPU3pD?=
 =?utf-8?B?Sm1EVk1VMmNmSXRTSzc2eGZlNDFWejNkTHc2bEZHT1VNN1d6UkV6c3V5cjBv?=
 =?utf-8?B?YlpXNW9FZjNpWHFCNWZkR0dtS05sM3MrYkx2d29sczRzM01zVUNsTEdXZitX?=
 =?utf-8?B?NDM4VnpYS2pveEg2aDZkdWFJQXRySlIycGNWUUJRblRLeFdRTVE2SnNUVVV6?=
 =?utf-8?B?R0RqSWQvZ2xRSjZXWEVlWGVsWUYyYUxOZlhkQ3o0eTN0alhFaStzMHlveS9E?=
 =?utf-8?B?TUhLU1RkYVJRQjd3WWQ1Q2x5ZUZEM0ZwcVp4YW82c0dJb1hSOS9nam9QYzFu?=
 =?utf-8?B?dStSenRRYVdZRDZrazVoNWRhcFZtU1c2RU9MN04xNGZRTmZxc2NTVjl6UFdj?=
 =?utf-8?B?RjZBN3VOejJaTVlGVTI3YmtFa2crdTRWNEdKdEEwamZZMG1reThWdjg0U3Bh?=
 =?utf-8?B?aU5sVjVWUVVKV1hMd0NJS3d6OWkrTys4YWpLaU1MT2hrZWNzZUxYc2ZBUGdk?=
 =?utf-8?B?ZFMxaGx2S2dRckJCdS8xanNvZ1YvTFdOU2swS2txZjI3MHkvKzF5YVNxd0lq?=
 =?utf-8?B?YU9MSUkwU2tMT2dMT0djVUgzSDBuRkhNeS94RmxHS2NNbk1vNHJRQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53c4833-cfba-4974-1485-08de59be3593
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:57:41.1473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gpLcgzoHFHKipvmeTgb0yOnj+TosuGXWb7iPIIXisjPKWJYLQIiDTDMTCg6xgtQSu6bXSAh1SVIKR/PvgwJYdgdFm2LsOc2H9uboshJ8Ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D6EF1679DD
X-Rspamd-Action: no action

On 22/01/2026 1:48 pm, Julian Vetter wrote:
> On 1/19/26 20:01, Andrew Cooper wrote:
>> On 19/01/2026 10:34 am, Julian Vetter wrote:
>>> On 1/15/26 4:50 PM, Andrew Cooper wrote:
>>>> On 15/01/2026 3:17 pm, Julian Vetter wrote:
>>>>> +{
>>>>> +    uint64_t misc_enable;
>>>>> +    uint32_t eax, ebx, ecx, edx;
>>>>> +
>>>>> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
>>>>> +    {
>>>>> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
>>>>> +        cpuid(0, &eax, &ebx, &ecx, &edx);
>>>>> +        if ( ebx == X86_VENDOR_INTEL_EBX &&
>>>>> +             ecx == X86_VENDOR_INTEL_ECX &&
>>>>> +             edx == X86_VENDOR_INTEL_EDX )
>>>>> +        {
>>>>> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>>>> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
>>>>> +            {
>>>>> +                misc_enable &= ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>>>> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>>>> +
>>>>> +                /* Re-read CPUID after having cleared XD_DISABLE */
>>>>> +                boot_cpu_data.x86_capability[FEATURESET_e1d] = cpuid_edx(0x80000001U);
>>>>> +
>>>>> +                /* Adjust misc_enable_off for secondary startup and wakeup code */
>>>>> +                bootsym(trampoline_misc_enable_off) |= MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>>>> +                printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
>>>>> +            }
>>>>> +        }
>>>>> +        /* AMD: nothing we can do - NX must be enabled in BIOS */
>>>> The BIOS is only hiding the CPUID bit.  It's not blocking the use of NX.
>>> Yes, you're right.
>>>> You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
>>>> succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
>>>> regular CPUID.  This is a little more tricky to arrange because it needs
>>>> doing on each CPU, not just the BSP.
>>> Ok, yes, I have modified the AMD side to use MSR_K8_EXT_FEATURE_MASK to
>>> "unhide" it.
>> Great.  And contrary to the other thread, this really must modify the
>> mask MSRs rather than use setup_force_cpu_cap(), because we still need
>> it to be visible to PV guest kernels which can't see Xen's choice of
>> setup_force_cpu_cap().
>>
>>>>> +    }
>>>>> +
>>>>> +    /* Enable EFER.NXE only if NX is available */
>>>>> +    if ( boot_cpu_has(X86_FEATURE_NX) )
>>>>> +    {
>>>>> +        if ( !(read_efer() & EFER_NXE) )
>>>>> +            write_efer(read_efer() | EFER_NXE);
>>>>> +
>>>>> +        /* Adjust trampoline_efer for secondary startup and wakeup code */
>>>>> +        bootsym(trampoline_efer) |= EFER_NXE;
>>>>> +    }
>>>>> +
>>>>> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX) )
>>>>> +        panic("This build of Xen requires NX support\n");
>>>>> +}
>>>>> +
>>>>>    /* How much of the directmap is prebuilt at compile time. */
>>>>>    #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>>>>>    
>>>>> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>>>        rdmsrl(MSR_EFER, this_cpu(efer));
>>>>>        asm volatile ( "mov %%cr4,%0" : "=r" (info->cr4) );
>>>>>    
>>>>> +    nx_init();
>>>>> +
>>>>>        /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
>>>>>        enable_nmis();
>>>>>    
>>>> This is too early, as can be seen by the need to make a cpuid() call
>>>> rather than using boot_cpu_data.
>>>>
>>>> The cleanup I wanted to do was to create/rework early_cpu_init() to get
>>>> things in a better order, so the panic() could go at the end here.  The
>>>> current split we've got of early/regular CPU init was inherited from
>>>> Linux and can be collapsed substantially.
>>> I have tried to add the logic into the early_init_{intel,amd}()
>>> functions. But it seems this is already too late in the boot chain. This
>>> is why I put into an extra function which is called earlier. Because it
>>> seems there are already pages with PAGE_NX being used on the way to
>>> early_init_{intel,amd}(). Because when I put my code into
>>> early_init_intel I get a fault and a reboot. What do you suggest?
>> Have you got the backtrace available?
> Yes. Here it is. Although I saw before when enabling 
> 'CONFIG_MICROCODE_LOADING' it faults even earlier, somewhere in 
> 'find_cpio_data()', but with the same EC = 0x0009 (Protection violation, 
> Reserved bit violation).

That's to be expected.  bootstrap_map_bm() uses PAGE_HYPERVISOR which
has NX set in it.

>
> Xen 4.22-unstable
> (XEN) Xen version 4.22-unstable (julian@work) (gcc (Debian 15.2.0-12) 
> 15.2.0) debug=y Thu Jan 22 14:28:58 CET 2026
> (XEN) Latest ChangeSet: Tue Jan 13 16:50:12 2026 +0100 git:ce886ef641
> (XEN) build-id: 2e72a4b08fca3ae0f0ed9af0dd3a5de947a966d0
> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 55 (0x37), Stepping 8 
> (raw 00030678)
> (XEN) BSP microcode revision: 0x00000836
> (XEN) Bootloader: GRUB 2.12
> (XEN) Command line: dom0_mem=1232M,max:1232M watchdog ucode=scan 
> dom0_max_vcpus=1-1 com1=115200,8n1 console=com1
> (XEN) Xen image load base address: 0xb5800000
> (XEN) Video information:
> (XEN)  VGA is graphics mode 800x600, 32 bpp
> (XEN) Disc information:
> (XEN)  Found 0 MBR signatures
> (XEN)  Found 1 EDD information structures
> (XEN) EFI RAM map:
> (XEN)  [0000000000000000, 000000000003efff] (usable)
> (XEN)  [000000000003f000, 000000000003ffff] (ACPI NVS)
> (XEN)  [0000000000040000, 000000000009ffff] (usable)
> (XEN)  [0000000000100000, 000000001effffff] (usable)
> (XEN)  [000000001f000000, 000000001f0fffff] (reserved)
> (XEN)  [000000001f100000, 000000001fffffff] (usable)
> (XEN)  [0000000020000000, 00000000200fffff] (reserved)
> (XEN)  [0000000020100000, 00000000b9377fff] (usable)
> (XEN)  [00000000b9378000, 00000000b93a7fff] (reserved)
> (XEN)  [00000000b93a8000, 00000000b94bdfff] (usable)
> (XEN)  [00000000b94be000, 00000000b98d6fff] (ACPI NVS)
> (XEN)  [00000000b98d7000, 00000000b9bb0fff] (reserved)
> (XEN)  [00000000b9bb1000, 00000000b9bb1fff] (usable)
> (XEN)  [00000000b9bb2000, 00000000b9bf3fff] (reserved)
> (XEN)  [00000000b9bf4000, 00000000b9d6dfff] (usable)
> (XEN)  [00000000b9d6e000, 00000000b9ff9fff] (reserved)
> (XEN)  [00000000b9ffa000, 00000000b9ffffff] (usable)
> (XEN)  [00000000e00f8000, 00000000e00f8fff] (reserved)
> (XEN)  [00000000fed01000, 00000000fed01fff] (reserved)
> (XEN)  [00000000fed08000, 00000000fed08fff] (reserved)
> (XEN)  [00000000ffb00000, 00000000ffffffff] (reserved)
> (XEN)  [0000000100000000, 000000013fffffff] (usable)
> (XEN) Early fatal page fault at e008:ffff82d0403b38e0 
> (cr2=0000000001100202, ec=0009)
> (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d0403b38e0>] memcmp+0x20/0x46
> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
> (XEN) rax: 0000000000000000   rbx: 0000000001100000   rcx: 0000000000000000
> (XEN) rdx: 0000000000000004   rsi: ffff82d0404a0d23   rdi: 0000000001100202
> (XEN) rbp: ffff82d040497d88   rsp: ffff82d040497d78   r8:  0000000000000016
> (XEN) r9:  ffff82d04061a180   r10: ffff82d04061a188   r11: 0000000000000010
> (XEN) r12: 0000000001100000   r13: 0000000000000001   r14: ffff82d0404d2b80
> (XEN) r15: ffff82d040462750   cr0: 0000000080050033   cr4: 00000000000000a0
> (XEN) cr3: 00000000b5d0e000   cr2: 0000000001100202
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d0403b38e0> (memcmp+0x20/0x46):
> (XEN)  0f 1f 84 00 00 00 00 00 <0f> b6 04 0f 44 0f b6 04 0e 44 29 c0 75 
> 13 48 83
> (XEN) Xen stack trace from rsp=ffff82d040497d78:
> (XEN)    ffff82d040483f79 0000000000696630 ffff82d040497db0 ffff82d040483fd2
> (XEN)    0000000000696630 ffff82d040200000 0000000000000001 ffff82d040497ef8
> (XEN)    ffff82d04047c4ac 0000000000000000 0000000000000000 0000000000000000
> (XEN)    ffff82d04062c6d8 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000140000 0000000000000000 0000000000000001
> (XEN)    0000000000000000 0000000000000000 ffff82d040497f08 ffff82d0404d2b80
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000800000000 000000010000006e 0000000000000003
> (XEN)    00000000000002f8 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000099f30ba0 0000000099feeda7 0000000000000000 ffff82d040497fff
> (XEN)    00000000b9cf3920 ffff82d0402043e8 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000e01000000000 0000000000000000 0000000000000000
> (XEN)    00000000000000a0 0000000000000000 0000000000000000 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0403b38e0>] R memcmp+0x20/0x46
> (XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0x73
> (XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
> (XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
> (XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
> (XEN)
> (XEN) Pagetable walk from 0000000001100202:
> (XEN)  L4[0x000] = 00000000b5c9d063 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL TRAP: vec 14, #PF[0009] IN INTERRUPT CONTEXT
> (XEN) ****************************************

Huh, that means we have a bug in the pagewalk rendering.  It shouldn't
give up like that.

>> It's probably easiest if I prototype the split I'd like to see, and you
>> integrate with that.

I've had a go at this.  It's a 6 patch series and growing.  The early
logic is horribly tangled, but there's a lot to delete in it.

~Andrew

