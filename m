Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9CC6B7A0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 20:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165318.1492111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRc9-0002Gr-QK; Tue, 18 Nov 2025 19:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165318.1492111; Tue, 18 Nov 2025 19:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRc9-0002El-LS; Tue, 18 Nov 2025 19:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1165318;
 Tue, 18 Nov 2025 19:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLRc8-0001zi-KL
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 19:43:44 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e09188d6-c4b6-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 20:43:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6381.namprd03.prod.outlook.com (2603:10b6:510:b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 19:43:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 19:43:36 +0000
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
X-Inumbo-ID: e09188d6-c4b6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA9z3eRYrfxZBzbnlkau0S8KEpumewPShPAxybHttT0RKRV7FTIDLfNXTGxlwMEh8HHZmRI1+udTRRqpFlKCxJxAvjhyPWstXWtXb8Z53ZlkSvwsHcBkZA2ykvTjSsf5O3L6U9NYLKrWorj3b7+4xD3KIEnvoAEGrJAGG3MSkydBHf+l3Fm7kXjMiiGG45LiaY9ZuU1Ku5wDcZU/GOz+dU2zk/D18gM4HFtaNRVOVMOHq5X+PV/auHHR1iuw2tEHnzLYEzKRe+aAE1axLNUa3n8B9oVIOtvtrL+wGi3qxEZNu/4fxLXxV/RR2Lt9W1E1+KAKnVRl3dt3aEdBec4c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZzasS8vJobgIL9U9NrPOU4AjGQLfTFran3lxhauwoE=;
 b=XPUdB9K3BjL0y3gyLD1dE0rKXnvlghcXe8YCnVZznuMAwpBtAPn8pXOom67aDpU7xcVlsvGF4oW71osLb91J94e3aX9cU9SnV5497m6mCTZ9jsDyCjpJZJ1ChyFdJ2Rws//tG1x3elKoMby49S8wBmpUyNCc7oHfmmXApprHOBdvSCHjlozcV/zjT4NX7+NRDO6IBYk8TbBlXajo9vBeEN6sedKhF1y409nNs3G9IqDXX9Omh+LCd/Ur/VQokf16rDZ0CXX+T4mBH0yhX8CZuARSn8KVLVJ1zxoW3SUjM4XpNL0orSw52Onqu2jLyilWtRKK7OBYF/lmuS9HIYrucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZzasS8vJobgIL9U9NrPOU4AjGQLfTFran3lxhauwoE=;
 b=mZEH58QHGEK0/lCshRY7baLu+i9KgakDNSmJLYoHUPi+AOYGCHxajeCw6pfiNhED8Mwv7C62rP0+N1Sq6vadSdtcboU06QM3WjvnTzhXmmkZr2hCHuwW9aNxxqd0G9D+w6/fA7NtaKoBfaN4UGqxcuzFG1zCE9tcMZ3rkVnPmvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <622240e1-e31d-424a-a946-f3797ad8c55a@citrix.com>
Date: Tue, 18 Nov 2025 19:43:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/cpufreq: use host CPU policy for Turbo checking
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <c187188a-bb00-4dca-9ec6-7a3862a65bfd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c187188a-bb00-4dca-9ec6-7a3862a65bfd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: ed944369-8fe4-4f57-7053-08de26dac390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YklXdzZLS0l4Y2NLL3BvRkN0azlvSFF6NnF0c0RGckVVeWRYMlcweE5XdWNO?=
 =?utf-8?B?UXltTjU1bW12ZW9tT2l5WjNhQk5xT0NDdldlVklGa2xiMC81bXN3bHorK2Jq?=
 =?utf-8?B?OUcrSnN2Uko5TVRiTUkwVW5CaEdGOTZ0eDlEVUJ3aEZIRGg5R3dMUmtrQ3ZE?=
 =?utf-8?B?V2l0d3duQnhkWThTWGZnNnUvWTRxSitFanBaeHQySWMwUFFDWG9yYjNXbnd6?=
 =?utf-8?B?eDAxc1BSOWVzb29ZaWhKWGlyQmpJLzN1WG1TdWk4dGgzTkxTTys3dDFTNmFR?=
 =?utf-8?B?d0I3bEtkUjhwV1o5dTQwZk93MTVwZ1BSZ2FTMzJtdzlYamZLK2NPQlBRaUJo?=
 =?utf-8?B?a2FSdkFjV1FBcDdkOUEwTG51MUQ5cFJXOTk3UXFCR0pDZjhaUE9FN2dXZ0hw?=
 =?utf-8?B?RnJQQ0hmbk5VZmNmd09FS0JHTGhjajQ5dloxUE1BdWh1a0hNY01sdmNxNzVy?=
 =?utf-8?B?VzhkK1Q0MEV0SmlEd3dHSjQ5bjgwMFQzVjV5bVQrTlZrck9kNFphMjQ5N3VO?=
 =?utf-8?B?ZjFpUTlWa2xPV29BRHF0NzhVcmhnMHV2NkYzUzJvRE1YS0lZRG11L1g1RHk3?=
 =?utf-8?B?Z2tRS3h0SjJCTkVzTitUeWluTjZuVlJ3RWlmSXB1a1FNZ1F3NVZ2SWQxVjFz?=
 =?utf-8?B?T24zb2ZWV3BaWHRwY21CNzgvVDVlOWxRRXdYVFlMUmZGbzlSOVFJOXhEZmRE?=
 =?utf-8?B?TDlvRHRlcTdDNjNiQlg4WGo1a2lEVHZNS2xSZlRZaU9YQ0N0bGFLYTlnaVVN?=
 =?utf-8?B?L21JdmprMERxUmtXTE5tN21RUVNKVlNadExzRlJ6YmhQblJ6SitwOVhPL1lr?=
 =?utf-8?B?eGgzSXFFYXRMdFhhQ1R6cUR5WUJudWgxYTJRcC9aRFNhRkhlcTllTTVlUEI2?=
 =?utf-8?B?UEJZTGs1NjJMbVJkcGVXM25sQ1BkM1JuVjlVQmRXUXlDWDdPWFFmVWw0KzN0?=
 =?utf-8?B?bklNd2ZteEZFclBxT1o0MUhidUFHQ1pXNVp1L2VUc0lHdUZTWVBEQ1AvQVFK?=
 =?utf-8?B?UVZaRnRYbUtPR1gxTlRYQjVCRFJNd25vREU1bVdtV3hHTm1TSS9VWXM5aDhW?=
 =?utf-8?B?TGNWR0RsWGRad21CbGllS0pyeDAzZk1PY2llenZidjA4ajlEZnpuRUhpY2ZR?=
 =?utf-8?B?SnoxaFlZRlpzY1VrNmxNdkJIM2p5SFF1TDdpaVFIb0VQdUY0bEUrT0NZaWFn?=
 =?utf-8?B?SEkvRnRzd2w4c01nU3dQYk5OOFN2bFgyVEFqVDc0OFpxM2RURHpxY3Y4NWxK?=
 =?utf-8?B?Y0dNbXhaU0FTVFc4N2hPUVhBeFljMGdKWHdZNHlRVytXVzE4SzhCNkZXRXhu?=
 =?utf-8?B?K0xMNjBmQS8zajVTelRGcnZBeHNNOXlSdXVHWDhHbE0zQjFwdjZHOXl1VDJO?=
 =?utf-8?B?N055dFNRbXppQ2hYd2ZERmliMGtHSSs0bE5YekV5VUlnd1cxSUx1ejZtZWZU?=
 =?utf-8?B?U04walJaeWkzMXN0Z3RUMFRDSkZIY1IzQkdHb25Wd0ZCa2sxQ3B3QnB0WEEx?=
 =?utf-8?B?SjFUZnJOYzRmUUxsQ1NlNVBmYXVHNmRXZUZSRlI3MlhEb0NDWFlqQVgyaXdN?=
 =?utf-8?B?Z2xLdndDQkxCZlhmNTVkU2tPRjhZbjhuK1pBem4vQUU3dXVLUEwvUTNaa0Q1?=
 =?utf-8?B?UHlzUDZQRGVhbmF5QU9pWkdFVitKczRFM1BVcFhVemNTVW5kdlA5QXdJdmxC?=
 =?utf-8?B?N1RTWGgrWDdhbUg3eHlWSnI3TVEvMStoTXBGQnhjZ1ZjT0xiVHJEd0R6RjlU?=
 =?utf-8?B?c0ptNWRya2p1dlVxR2p3RXEwYTd0Z1B2OHkyclc3Q1JqVE41aWg0Tm9wUmZG?=
 =?utf-8?B?by9kZ2w2QlExalZwQXlyZjBIUGtMeFZDZnRscklFaXlYa3VjaXRWQld4TXA1?=
 =?utf-8?B?M3ByVzE5WElzVkdhNFNDK3VEeGFIMnZBZm4vVXd5bU00M2JoNmF6OUF6cEZj?=
 =?utf-8?Q?zr3BTxWpISZhBwbAHhWobhb3IzA/eYLi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1lEQjVuOFE2b1pPUzgvUTRuV0NmZGFaUElkQnUvRFo0UGVkTjVOODJ4cUxu?=
 =?utf-8?B?cDZhdzRWQ2cvbXNYTnExYlpvTWxWUjcrM29ScnMwRE12V1dmNnlUMnAyZnRV?=
 =?utf-8?B?THVkQUN3QWY2UHczajk0dmpKdHNNSHdCNGUyS0E0UWdaYnJ4cXd0ZVZuYjJR?=
 =?utf-8?B?dHpSdXhDUWdDbmVvR3FNb3VqWHNvS3VPYXRRK2hSdE1qaHV3Vk1jUi94QWRO?=
 =?utf-8?B?eG0zWjhHL1p5ejU0ZVZLeVRrbzU3UjFpV0xUWEIrMUNHK1czVkkzZ2hJbW5o?=
 =?utf-8?B?SzB0OXZPZ2RpUUF3MEhaWlhJYTRocXkvOER4d25QWDRFM21ZQlNzOFJvYlhK?=
 =?utf-8?B?eGFMalJsR3l0V0h5ODhwcVdIUVlCbG85ZDUwNXUyTHU2ZGI0ajFlV0kzU045?=
 =?utf-8?B?OGl2cXVvc001NWZlTHk1NlNaZVVKMWkzeXFBMFY1V2lEMVdhWU55MjVSaHRR?=
 =?utf-8?B?V1dEb1ozaHNRa0xqdnl1Wm9lTTlaVmt3TndIY2d0bEdJWVFtRTk4SDhoRDAr?=
 =?utf-8?B?NEpiNFRZVnBIWWd0dGcram9WTmhXM29hZzBKbHlLZG40d0thS3BtUk9NSDF2?=
 =?utf-8?B?Uys0dUhmNk5DeHIwaDdrUmpoZ2NsQXNuTDZHRzJFeng3QkVrYmpQYnc0bEtF?=
 =?utf-8?B?WTBncDVzb0dXdTFUd3VZVVB2ZXVWVHpaUnJTUjdoZkwxRWhrWFE0SFNPbCtS?=
 =?utf-8?B?ZkNvVmRTRFNsQy9LbnVMbmVrd3gzdXFmYkk3VXY0djlWVnNWUnlzcFczc1ZY?=
 =?utf-8?B?TVVDQ0tZYSttT01GSFJmZk9Tbm9WUGwxbFhydGhaY29YMTB4NDFRakpMT0xZ?=
 =?utf-8?B?aGVCUGFtOG9lVjNzbUw5aEM1WDNuMkpIdjczOUwyV3hmb0dDRk1USm5PMFJq?=
 =?utf-8?B?amhzWTFxQkIwQ01yb2NhdzR3M0lGdDIxdnZ1akpZbEp5QUNuU1JuWFdnRFFC?=
 =?utf-8?B?d0hKRUxacFNkUUVXTVNtdVBLblRQRGM5R1MwY3FSaXpYMjk3aEg0bUtEVjF0?=
 =?utf-8?B?cmVMVWN2SXVYUG1IdUhGTkFhV1R3dHVOQjJhcjMvU1M5R2RSbS9aMGh5bTRw?=
 =?utf-8?B?c01aVGlaSGYwR3d4eHZVQy93bmpRNlAzdzVlS21NdmFpU3c3a2pWeFB4ZUFF?=
 =?utf-8?B?U0RXQWMvZ0ErTlRnaWlGbHJDakhPOUs5S2RZZXlEU04xRytWcEFWUGZTNlBI?=
 =?utf-8?B?SFArTEo2NXFLTnNISXgwMGRJNlc1M2xoajFKQmd2OVZiZTY5YTZjSGM4QW0x?=
 =?utf-8?B?Z2Z3Nm13QmI4aHIrWnQ3M0tLc21GeUdrTDRnWW9NdUpoVlhnQk9ORnFDdzJM?=
 =?utf-8?B?cjFxWnJKTDd0akFkSmgyV3NEQ3hCZ1IyaFJkbW9nZktxcElzZU9XMG9uT0t4?=
 =?utf-8?B?NS85SVpibmxtMXJJdHpSYXZSMGtCaXkxTEZsOUoyZHZsMno2VXY3K1BlUDZQ?=
 =?utf-8?B?UUl6eFFncCs5SkM5UDVyVmx6UmNWcUd6Y2txM2ZRVDcxTVBNd1pRMDJRcG1J?=
 =?utf-8?B?ajVjWDF6V0RqOExHN2xpMHZuVnd2SlBLT3VXNlBRS2wwdkluRFRZd0srL2dn?=
 =?utf-8?B?citmNjRrdzdTZDZyTGhzYVc2WTBRVXRKNGNsNXlTcCtBNDl6M2VoY201dy9T?=
 =?utf-8?B?RTFVQ0ZUaFlRM1pEbDVhYzlHLzNDOGFCNEw1S0kvSlRNUXdQc1JYVlV4Y2JV?=
 =?utf-8?B?L29lWWNySmp2T2R6aGlVbmQ2OVZtM3VpU1dKV0U3QnlIZFN5bEJOZHY4ZWRE?=
 =?utf-8?B?VVJqZXYxeGs5OS92Q0pEL1hIU2FHRk5qbG0vcE9uQXNiUTNKSVJrSHpkTWl0?=
 =?utf-8?B?WXNXd2dieXBXV1BBV2I1QzhHRUN2bVB6cVkvUXk1T0VldVM4TzZjNmQ3RVRj?=
 =?utf-8?B?OWlQRU9zWjIzWUlmYkdReFQ4ZjdGeG0yeDAvT2FnSERBZkVFclY1aVVrUnlZ?=
 =?utf-8?B?VzcvTzhFNlViTEhGRVVTSE8xL2RnbklCNHdIelE3RlVpSmFuNk4zTUhBZks5?=
 =?utf-8?B?bEtGUmlpK21vcVZINkNqZ1VJM0ZVUXM4YXRadUF0VEpyWVB0QkxhWVViMHVi?=
 =?utf-8?B?ZEVkejg5LzR3YW45QlU5L0NyNXNWZ0wyT1RLM29RcnlDLzVvSDlaV0JSRWtG?=
 =?utf-8?B?NHlja09LK1J1R1lkZ1M2MlhTZm44aWg4S3lUYXZkV1NZT0ZwVVh4TGRmbWhJ?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed944369-8fe4-4f57-7053-08de26dac390
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:43:35.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5pRfd2UB6zwtNazGDe+nZDAoJAXvHRJ9ej6+gHADrNm7Etg90RLgg801AD7IqHqdbeVsE7DwgwSpLwcQUkfc8hZCX83lEcUsv+JwOJLaks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6381

On 18/11/2025 3:08 pm, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time - we assume symmetry
> anyway. With symmetry assumed, logging per-CPU also isn't very useful.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Subject to the feedback from earlier in the series, Reviewed-by: Andrew
Cooper <andrew.cooper3@citrix.com>

