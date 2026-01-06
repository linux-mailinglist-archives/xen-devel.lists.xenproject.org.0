Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8696CFB096
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 22:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196487.1514294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdEGz-0006pL-HV; Tue, 06 Jan 2026 21:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196487.1514294; Tue, 06 Jan 2026 21:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdEGz-0006n0-Dy; Tue, 06 Jan 2026 21:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1196487;
 Tue, 06 Jan 2026 21:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdEGy-0006mu-IE
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 21:07:24 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b003ff48-eb43-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 22:07:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB6943.namprd03.prod.outlook.com (2603:10b6:510:15b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 21:07:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 21:07:16 +0000
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
X-Inumbo-ID: b003ff48-eb43-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvFg4d4U1GvEwQxK69ROUerfpQZLMpx+6f/6FdGm/VoKtsODds37qwyBh5PZma/oJMnbIt0MTrXW4RwfoObTb+E7DSxo3xt9DzEk0xVPTaCoupWTGPvoGG0PllPFxD5sUjuaCiyzwVfjyCy30h3q3OYwrzOLzGI2juHLGlmiroIRq11lW+YUNmo3mKF1PAXIdg52S67nF8hxuQfXs4FJMp2hVzkZ9tUVaRe3J9KfArrfVyj5v37qT/MNRZXiT+2RWulxo7b1LxWbxTecx5LeCKPlhwkuTZGqmqkYSFt63ZSrknDyHN7lahTTMYrOfJVustRE1hB5tvKkUUSjRica1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+Qkxo2/murvC9IJKVYbJXH1tg93Vz2Ht9AUoo6S1LY=;
 b=FX0VzJFY3vJEfz1fyYBXic1Epbe2BzY6gzVQf1303QEN1KddMicuoM6RAuasj3h5vQOB5qy59zwsRG66DWz+C0b2XpUe56a38Wo3UopEioLFOOzSDc6tHKxW3itkKnRQd2kbOXXfisGB7/WE/T8jWHmZP+ZOYxvhurBbuzX/uiR5jGR1u+kR5MgIwKNqd/NmU2tb5drtn9tKaQRVxyo5CGoEzLWUiGd5oeu1djR/TEeP0IB1cPItSwNg+p7Nmt+A+PEXuRdZkHYUBuOlmjZ0Ym79QOs4AM6VfzgYYg/MZdJO6+vTfJCbKJ6SKpG7Ud6qBKSKpzR13cq2i4TyDzlUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+Qkxo2/murvC9IJKVYbJXH1tg93Vz2Ht9AUoo6S1LY=;
 b=waJO8TeEAEMxGA+G290aZzFewMNLEHWpiu6eyRlphBnmTSVbMIrXaqav8XdfS8bhOJwxg/renhi0z5+CKyWYU/G4yFZIrFQ9Y9jiIMbJDrQXxe3ynaxgA8wxwFVdEpLEgpYvrY8Azlyi8+Sn1bAAgguUYd/1IiLEMPqBgfbs5Jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <98855b1c-2cda-467e-8b88-ff24e7862b61@citrix.com>
Date: Tue, 6 Jan 2026 21:07:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrew Cooper <andrew.cooper@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 v2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <693449f18cc4480ea2cb2161a9361354@DM4PR03MB7015.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <693449f18cc4480ea2cb2161a9361354@DM4PR03MB7015.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eecf3ae-82e1-431c-94c4-08de4d67924f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTE1SVVBN2U4aVYyODdrN2NLcFZBY0o5UUZGTUM4M1RwRE9ObVBBL2d4eGNK?=
 =?utf-8?B?QWhKVWRtaWtiWGxGVVVPcEdWOHQwWmhxYWdzdUVMQytZQnIxT2NQRjFITmF3?=
 =?utf-8?B?cmg2K0prcjJKR2xUdDMzdVIxaVc3SFFQOTcxQXpRWEdBUFNFTnZobThKYmMv?=
 =?utf-8?B?VFE0Y1RPamx0ZDFpeTNoWEpDVXlvZm8wVHhGVzRscE5jMG8yRkY3TnJlRll4?=
 =?utf-8?B?MWZvUUpZYWpYcnFJcXlPOVM2TUxRWmxYUFRrYXVNOVJhVmJFajkxSGJ5a3c1?=
 =?utf-8?B?eUUybXB2SGd3QjV6Z1FYWW5HdHpQeFdCaTRGNzlIaUF2TUVBWCtoUWx2MHBo?=
 =?utf-8?B?d0RSODJlM3VNOXZ0dDQxcUJSMXo2YzNqRDdCSTBqTGNLYXZ1b3RHeFYranpw?=
 =?utf-8?B?eXgrb3ZsNEdrNjVYcWc1b0pPbDYwOHV6T3FJYTlmcUdvVjhtMzhTL2lMbzVa?=
 =?utf-8?B?SFlaK2hRMXRHNUpQakpmZ09xOGcvQi9aUlMxMGwwaG5mYVhWUTZwQVVHNStw?=
 =?utf-8?B?UjQyNFpSNm5yd2ViQWxETTMrNEJnMlRENWFGMXkxbGhvbzVXRHZDeTc4K0E2?=
 =?utf-8?B?bkprSHgxdkE3dDZDUUhYNXVsRU5Od1gvbXBDUUozS0piQ3FaUDNqbXhRL203?=
 =?utf-8?B?aEpwNkpES240RE1xS3AraElFM1loTk5ZR05UQVFlRDdYSEk3SStIYlVWOVpj?=
 =?utf-8?B?cHZ4UDQvdFIzU01TeFE4aDZhTnR1OS95MVlpYWhkdkNQMjNQSlg0bm43VlpY?=
 =?utf-8?B?bXJtNVR3RmhkQ25ESjIycVd1b3JpU0dXSi9XeGNGTlUvYU9rcERyWFhyR0Zp?=
 =?utf-8?B?OFpLZWVPZSsvNGJ5SFpldmMvRVBOUlc4c2s2aUpDU2NYUUtvMVpsSmZQNHhp?=
 =?utf-8?B?Zk1ieFg1ZFNrSEYrZGpKdHh6SmF0Zk5kMWZKZW1nMGFZbUY2cWoxWkdKdndQ?=
 =?utf-8?B?YnA4Sy82NXdiTzVuNWN1dmtZdDhxb01sVjViODJCRDF3RktSamF0MUpFeFN5?=
 =?utf-8?B?dzMwYnUyQ2drTjFZZjNuQnNqQ1NmZXJZTE84WGZSOWdWMzVqQlNYNWhkeDlJ?=
 =?utf-8?B?MEtlUWFaVGJTVy81QTg3MTRleGNiZk0wUFo5UWZRaVNBeHk0ZmtJYzlsdGVG?=
 =?utf-8?B?MkEvWi9rWEVtRmlQNGpTaUlkeDUydzhQZW5CSVZxME42cnF2aG5rNGNFMjMr?=
 =?utf-8?B?RnlKVGgyNm1wN3lvVmZpdktrY3NyOEt6YlJKUlB3Wk5oSTV3OEhab2QxaU1W?=
 =?utf-8?B?MGUraVV4dEJPV3FZeDE5ekxOOGkwWXlRNzhKbXZvd0dUNitCM3hXOG5WZ1hP?=
 =?utf-8?B?UTFEemVRNTV4MSsrZGt0V2tEMjY4UmNCNERLRWZwMWFxODlvS3lWdDliOVRq?=
 =?utf-8?B?R3cwSlQycURQUjlTM005K0Q0aUx4NnJYbExVNXhaWlFmdTFBWFVvcndkY0RB?=
 =?utf-8?B?Mk80MEY5bVo0UXBhNGhDOVVOSzZmNFduSDBYc1FsSGNUWW1FbmRlVUZVVUR2?=
 =?utf-8?B?dk1WbU9pUVQ5bTR5NXZSVUVGRFJXcERwR3Y5TXBMOEFvWUlXSnpUS09aZ0ZP?=
 =?utf-8?B?bHRVc0RqVUFtZTFUYWc3UW42cWVHcVUxRnhUVVJzQkZoZWxWckxqSnlNNUl2?=
 =?utf-8?B?NHdJeXJmRS95a0tiY0MycG1lZVEveWhZWmVOb05xM2lCZTVINXdhVzZ1eFI2?=
 =?utf-8?B?TVkycUZpOU5tYjQxYjBnOEVlYjNtMm9qZHo0ejNKckRxRTBMVnQ1Q2EvUXFR?=
 =?utf-8?B?ZzYxK3BCNlcvM0d3dkFMZ1Vvek5Zb0ZRbGYrK2FybUNxQkJYSk1IS0lDTHho?=
 =?utf-8?B?WEpDY25meVprUHJvNDZ0YnJOYkpqQ3dWMmhVNXpvdWFqWGZSU01jKzBqc216?=
 =?utf-8?B?bkY5aFJ1SG5iRzlYbFhrYzZtZmZZaGVrWHhXa05LZllmc2hjRGUrdDhOU1Zr?=
 =?utf-8?Q?s9ImJETJNIsUeK4pV2NGCMJcw0GY6Xsh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWYzV1FTc3h5Z2ZPWDEyVVlQbHJubEZ3TjludW9tcFRzRU5BQzViZi8rdGNp?=
 =?utf-8?B?WjdTdWJFK0QxbUJQcUVURHpDeWFvSUltaEZYS0ZmNlJMeTVQTGhrSW0vQWxy?=
 =?utf-8?B?UWF6NHhqZUI4V3VMVDY3WlExdCt6TlA0Um5LM3hxRVozQjRSS0xQODMwVlRO?=
 =?utf-8?B?VGxhdU5mdHdyWkdIM3J2MzNVOFJFTzJScDVyREhIdFk2NC9KcTBEaUxtZzVX?=
 =?utf-8?B?RFZyL1JCVDByTlA2aGZwV0h0MU8yakx6U2w1SFBhWXpmTHoxT0ZqYk91cHpn?=
 =?utf-8?B?S1MxQkd5ZmNvaVFaY3JXbXd6WjBMOGxYcG1UREpMYlBVc0FyUFZ2aVVLeFpu?=
 =?utf-8?B?ai9zV0xXZWtxd01sMlhrMHc1R3NqRWVCb0szSDRRMkFmQ1UwdTJBUkJLaUd2?=
 =?utf-8?B?cWYvUHFsMktOaU1sWjBWOEJHMGFkUVRYSDE3MU91azZmZkJWSXVveHd3aVcz?=
 =?utf-8?B?WWt0MG5aYUdqNXBrdFVKUVZRZ3RkeGlNUzY3M2VWMnFtMTBrdEluaGx4QUhw?=
 =?utf-8?B?VURFWkwvVUdXQ0Y1R1YxQmY3akNDRmsxRjRkbDhiN1U3eUZLbTJ0RFV4OTJN?=
 =?utf-8?B?SHlWQ2hWN2thVk8xRGQvM1VHcHorVmo3azg5Qmh5TVJtZ1JpV1hlM0dJMTBL?=
 =?utf-8?B?QkxlTVhocjEwaGhidEJOdU1sZ1ZlV3F4WWtQUkJzOXZnNGhhVTZwM3lWZnVp?=
 =?utf-8?B?UnNyNjRCQVVXeUM5d1VLVER4YkJscmxZdmJURTFGMWlEN3RmNWFxYmIyTnNJ?=
 =?utf-8?B?Tm5EaHZsMWZEWGVrRWZDZVc3VW5Td0toNEpzTDZzV0JWektxcmpRT0lXM0d3?=
 =?utf-8?B?bENYNnpjMzM5TTlSS3lIam1Lc2hWLzNtQWRyOFM3ZzVOcEVzWnFsbUxUWDE1?=
 =?utf-8?B?SlFXUU1DYU9KREpWOUNFUGQ3WFUwMitVczJNSUVNdkR0OHRtN0JPLzhsd3pK?=
 =?utf-8?B?ckI1WDRDTFN3d2xmZEZIMVNSbk42WEpGdzlsVDdVODljNzAvQVozTzllZnc1?=
 =?utf-8?B?dEdTSm9ETDg5dlRWaFU5NWF1S3NtRVRVZm5SaUZjNXZjU2xBYnQ5VjA2RDc3?=
 =?utf-8?B?K1hCMXhPdHJqU2EvcklXNXZuSS9NRyswU3loTUl2N0FyeXpGaTZLSTdFTDVQ?=
 =?utf-8?B?ODlpSkpFSWF4YUJ6TVVMWjJhNXlhNnlKakZyVXJ0YjdGaTRNQTZUeE5tbzlh?=
 =?utf-8?B?L1JRU2VhV2N4S1RaZnpZRE9ob0t4Nmptc3QzZXU0K21GRStkTEF6cXVtS1dv?=
 =?utf-8?B?bVIwbG1BWi9SY3lwa2l4N1phbGhsbUZxcHNJTUE1aEdwVVpRUzRITTl4Qmg1?=
 =?utf-8?B?NHVPbjZ2bC9RNU9zZExpekI0RmczVG52dW9iM2FEa3MycUxnV2EyTWNpWHp3?=
 =?utf-8?B?d2NxTmIzRmdIOENVMzB6OTY1cGJSbEZoSTcwR2UwdGE4cnk1L0VyN0p1a09q?=
 =?utf-8?B?c1JPTUpzaENETEN1ZmtBSlpDTEh3d3hpMjJzTm82MkVFNDMwUHhta3FGMm9D?=
 =?utf-8?B?OU1XWmppOG1nWVF1OUl1Rk5IWHpUd1Q1cVdJL050M3cyTjc3MEx5Q05Ubm5v?=
 =?utf-8?B?MUNNYW9BNHVJM2tJUzNPcGFhL2IzdEZxd2wyN2VhdW04ak92UGsvaUZvMUxL?=
 =?utf-8?B?K3B6MCt4aHBZR090T0lmejVMYks4L2tJK0kvMTJMcWVVaFFpMVk1aHhMQVE0?=
 =?utf-8?B?Um1NTEVqNjFmWEdkUXZiSWZNTDI1VmpsWWZ6RWJ1cTB4SlkycHd5aGs1UHBM?=
 =?utf-8?B?R3NCZkV2M2owNHBZbDZrUk9xUzUwc2dlcDZjckZFYnlvdFZHZStBZkdHWXpW?=
 =?utf-8?B?NGVjalBlVDZkUEtVR2wyaFp1UnNlVUh0TlpoOVAvRUlCMFNFb1I3d0xydkZK?=
 =?utf-8?B?RFgwSzlhaEs4cHdlczZLUDVrczNGVytQdjUrd0Q1RDFCRmltM2d6NGJaQWxQ?=
 =?utf-8?B?UWR6aUx4SEdzSzFwSGh2U25uQTVRcHg3U1pydGpZTVU0bUxZZzJEVWlxNnFT?=
 =?utf-8?B?MVViUnpKMjVWLy8xb2xHZk81dXVpOGJDTXZndmZuTkVUdTVNbGNCNGs3Mzhh?=
 =?utf-8?B?QUVDdjZKdXZQRDJxRklwRklSSHJKRXVhY09qcUZBQkY2NEM3QStsa1g4bTJD?=
 =?utf-8?B?WkJ1dWxHK3NFKzhYRlNZR1NqYzlUcXh5NWQ4RG55T0VrZ3ZtZFkwekNoREVz?=
 =?utf-8?B?RlBQQTdHWmUvODB0b055YjZyT3NIU3lOdGFuNzR2eVFnUk9udVFwd2E5RGEv?=
 =?utf-8?B?TGNnd1Jka3RET3dqeXlTWGI3dWJ3dU5GekFyR3p4cWVmUnBwaFA4czViUTBP?=
 =?utf-8?B?M2NMNzc3OFg2L01OMFJnY296RlUzektiMzlNeUg3YmJRRS9Wdm9oT29jVUJk?=
 =?utf-8?Q?fh3k0A4ZkWrsQ/tE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eecf3ae-82e1-431c-94c4-08de4d67924f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 21:07:16.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XB3RY8rPaHwNp2uM74Pn3KS1atqZgJWAigUNwMeaRzUktusaVm705VMiKS/+3bWxcVhxJlftUe4hBorx+TakAAJlkVesfdjE+wKDcrri6IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6943

On 13/10/2025 2:06 pm, Jan Beulich wrote:
> Along with Zen2 (which doesn't expose ERMS), both families reportedly
> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
> can actually be carried out the accelerated way. Therefore we want to
> avoid its use in the common case of memcpy(); copy_page_hot() is fine, as
> its two pointers are always going to be having the same low 5 bits.

I think this could be a bit clearer.  How about this:

---8<---
Zen2 (which doesn't expose ERMS) through Zen4 have sub-optimal aliasing
detection for REP MOVS, and fall back to a unit-at-a-time loop when the
two pointers have differing bottom 5 bits.  While both forms are
affected, this makes REP MOVSB 8 times slower than REP MOVSQ.

memcpy() has a high likelihood of encountering this slowpath, so avoid
using REP MOVSB.  This undoes the ERMS optimisation added in commit
d6397bd0e11c which turns out to be an anti-optimisation on these
microarchitectures.

However, retain the use of ERMS-based REP MOVSB in other cases such as
copy_page_hot() where there parameter alignment is known to avoid the
slowpath.
---8<---

?

This at least gets us back to the 4.20 behaviour.

~Andrew

