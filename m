Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NaqKWjTeGmNtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:02:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B01C9639B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214912.1525163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkZc-0001PP-Qo; Tue, 27 Jan 2026 15:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214912.1525163; Tue, 27 Jan 2026 15:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkZc-0001Nl-O4; Tue, 27 Jan 2026 15:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1214912;
 Tue, 27 Jan 2026 15:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vkkZb-0001Na-Ia
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:01:43 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c2bb29-fb91-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 16:01:41 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8268.namprd03.prod.outlook.com (2603:10b6:8:258::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 15:01:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:01:38 +0000
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
X-Inumbo-ID: 15c2bb29-fb91-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqtO8tGU6epxoepP9KAVslnP48er0wagQxdjRE2nR/lpuTkB+TKHwsrkCxELZQp9K93fkVkV89qIdgG5xHIS/uj+JfH09cuUHZ8bOw3MMHsOgxX+CJh+qOXy2Sv+cMrnSI9gLwOhZGNg+Zmn0BwLxH3PRhUDw/YMXVH4r0O3o2pNui8xAZ3JddincBPB1yYU3CrWzu+RzcEUXISrHRR9Hn9lbHfZXCHaRju2s1sT3exWnVHM1AWjHPS1SllByYM+HQRo+yAo2TeBxcrOiVdWWdUiYb8QItHJhWq9lp3dHmlpvjZk+vKCDITN4ZfqYxjFzPw7HnS5dxRHR2aMJKLApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd5XUNt+nBSU4TcB4/a4gwqgut4Yv7FK3qWhbMGtSSk=;
 b=cPTjQizChlpzcuvSByXZ516JgSvBgRMMK0jhq3Vy3c6UX7KZPV7xGW3bsHuHJr/mTXYrbOHZar47rjLlJTv/k1JSVqK+IzUCd4PeT1XrRIsG++ZvMdtf4BbIJZHQV0GKAgBka2V6hgxp4zvCLmN0YujfL07MDDD9P5nqFzHWm3rAfziUjqkhzyw5rSVSJRfAc+YH3PrZzcE5RTLOIomc08S0srNdvaCbyC0SW7+mA6TI49HAcO6GKmvGVYOBZA7cYIREV3zpNaY2tZLpo8l4EDW9dUD1Ndmy4/m1BxpDc4aF9EJxezMSJcZx1TEt10mIwVwhrTg5v9ZE6X/MiU6Frw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd5XUNt+nBSU4TcB4/a4gwqgut4Yv7FK3qWhbMGtSSk=;
 b=bbbvjyI+3jUZ6XK3JBdDhKv8359G29ZsB0zw3rVPEvp7xYMsWq0V6MITK3ZJ+5JE17X4uevDPDP6T0GgRzKhR+e/MoOA5cGgE0RMwimxI8gW6aYljKHlwkKkEovBCj2UjQTniltwJBpG216GSWpIsOGC1+chbStdSrIT7d4ywGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Jan 2026 16:01:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXjTTRvkCiE77uIt@Mac.lan>
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-3-roger.pau@citrix.com>
 <69a64a89-af3f-47fe-8998-a3ff76e9484e@suse.com>
 <aXiVeAQFUMQkIK1_@Mac.lan>
 <f369f85d-6699-44f7-bf3e-589569767e65@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f369f85d-6699-44f7-bf3e-589569767e65@suse.com>
X-ClientProxiedBy: MR1P264CA0193.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: decdd4a1-6527-4e37-1e8e-08de5db4f8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3NrQUttb1NIdmlqdGhTNGVpNG1PU2NJMmtocWZhd3AxenFlZnVYTlRWY3hF?=
 =?utf-8?B?bnUybDlmYXJ3Q0RDUTVpMnJmNHRSYXJ5WmpkVVgvUWhaMituaVdLS3JVaVdE?=
 =?utf-8?B?a3BWaVdkODVDa2tuU0dpMUFnbE5MYnJxVnlmZTVpZVVKOVp5dWFhY0NodmRK?=
 =?utf-8?B?MGtaQVVyZkFlUmZqVUg1eU5qM20rSDduVGJReitZZ25NNmE4cXc0TERGRXM5?=
 =?utf-8?B?d2hSd08yK3lnUmpDQTd4N3FTWkV5STBvQlRlUTJlNWw0WXdHNVhlSDVqdXBa?=
 =?utf-8?B?bUREd2xhRTNScDZiMzQvNDVocDA3THNxYmdWRjFQdFU3R3pVZE5CcGVBUTRO?=
 =?utf-8?B?Z2h2c3lNa0cyUUFzOWFaeGdsbmRJcDV5Q01YMVdzYmF1V3pNSjNrd3BxYUxJ?=
 =?utf-8?B?cnh2SGNzMjFERTZMUzcxQ2Y2T1I1MWUyOHl0dm9UampPTk9Ca1ZKUlY5YzFu?=
 =?utf-8?B?YU4xWmZLV2ROMGViN1BxWThhSVBXVkx0cmx5cmVlTmJqS081djVJZHBLWnoy?=
 =?utf-8?B?aTBKL2c1SEZzV0hsV3IwWWxyLzlMTENXNG5UUlFKVnBnMERLdUJnNEZhZlds?=
 =?utf-8?B?ZFNLRjAvTDFJMFM2bTJta3lIOFQ5UGlhdVFURnhHaWJEVEdoZkZySExmaXZX?=
 =?utf-8?B?RHUraENzNDdyNVVOTGxBcHVHbXlWQnAwWHIwQWtGV3ZNS1EyOUtkVlZYdVcr?=
 =?utf-8?B?dWFvL0tzY09yaHhMVzBHTjFNMndzMitTb3krcnQ0bWs0Z1E3d0VGQTN5Z1BX?=
 =?utf-8?B?bnAwQmMvY2VRWFcxMHphYVVLTGhValhsRGZJMjVTZ0dCWkx6RFJ5N2w2OE1M?=
 =?utf-8?B?bnR5cFl3WExmczRybUovLzZzVlYvcDd3STNsT1didGhhMFptKzBzSGFFbXh2?=
 =?utf-8?B?RU5sQzZiandhS0RvdndOaS9XeDF4VFhiQ1c3NHphRkhTd1BFMmx4cTlUVHF3?=
 =?utf-8?B?UUxCKy9CYS9JSE9WVjNGNnZYOTI3eE53RFZ1UEpqVGFPdDRFc1JRQkc1cXc1?=
 =?utf-8?B?b3hzU21hWjQvL0R4V0E3UUlyOHVBS2dtd1MxUDdTbEtTUGtvMW91bnhIc3NC?=
 =?utf-8?B?RG1wVTdGRy9rakV3N3lCM1VSSUVYOWhjR0g1ZDVZS2YwMFNOQmhsY3N0SFNX?=
 =?utf-8?B?WXhuUU1HYlAwd2UvRWRpNExRemhOZmtpM1ZKTDROSzBaQ215VVJqcDgyUjN1?=
 =?utf-8?B?S1A0NDJPc25RY3hxbjJENXhUemg0cjAzK29EMG9WTzNHcDZFNnNuSm1iTEFD?=
 =?utf-8?B?ay92cFR1eHRhU0RmUFJudGI5Y1hrZkFUdEtaa2dLR2RCRHVmeDk5T0xCcTZR?=
 =?utf-8?B?ZHEyRDVqeDlrQ3lzQzdYeFdkOHpsTUxqYTZFZGhHUXlzWEZQUkJDMXRQQzlq?=
 =?utf-8?B?c0F1WUJBTWpWMTh1MFhkWTI2YTJtVzFUNERmR0RPZHNuTU8rTDdVSzRrVlFX?=
 =?utf-8?B?Rkt6NXEwN3poQWxrSm4zVVNtZWU1ZGlNRDZJL3RNUktSRlJFM0o2TGF1elBh?=
 =?utf-8?B?UWU1UlovV1dyTnVtb0tlNDZhRXpoMk1iQ2VETnJ5ZUdJaWtPQWo3U1NCdFNi?=
 =?utf-8?B?TEZFd3hkbjRpYXZPckRnelg4WURSUnYvdE4wSi9uVmdIOVcxSkZKbnA0UTNJ?=
 =?utf-8?B?QUlGdklhdEVXRExJanUwdnBYRzRnZXFCNmF3d0d4YWhjRmx6MHpyNHdRdzJm?=
 =?utf-8?B?NnFnNWV4bC91L28xTUVFbnZXdlp3bnNIRStXQ2pRYmhCYzVzY0hFTDZQSUs2?=
 =?utf-8?B?TitYZU1NSkVXSitCYkNmam5hclc4MVdyeWM4NEZCdEZJTnpBejZobXdTTWhV?=
 =?utf-8?B?TTM0VERsYXVlM0d6K2ZrVUtQTmdZVUppSEdmR29pM3E2NUE0MENRRVJLbVAx?=
 =?utf-8?B?K1BGVEI1TytGUkRCdmg5OUZRNy8zeUx0eDJrRHFTR1A3NDhPVkI0VFZpTThN?=
 =?utf-8?B?Yjl6TVgrbUszMkl2emhVY0JMemtHRTE3dWRkNVl2UVA2VUJkT1o3ZXE5bWJD?=
 =?utf-8?B?U2ZPdXJCZHlBWFhWTGJUWlMrblZiMzliYThZZnNUVTlNNnFqell2WTBzcURT?=
 =?utf-8?B?QkIvNXpoQ2J2ZWRXL0FOVGpQQVhqK3h6SS9LcHp0bzF2NFFBb0NoTzlocVVj?=
 =?utf-8?Q?gHC8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0NtNVl6U05TK215QmxpaDY3QnhVdkJSeWVnYU1PZTFNU29mUVZKZnZNVVI5?=
 =?utf-8?B?RmtPcHZvb3lCcm1kNUVOZVlCOXdsWjJBL1dWNjYvREJZYURmUkozUmZTbDZp?=
 =?utf-8?B?ZU5LZ1JjUEpkUHR4R0x0QXZMblVHbEFGT1oyV0dsZkEwMW9ETHljVFhobkRT?=
 =?utf-8?B?WDB5a1l0dHAvV2hzL2J3RUpWSkl4Wm9vWkFyQ25hQkpJdjlQQUttcitKaXA5?=
 =?utf-8?B?Rnh5V0hWMlF0S1pXZ1hRWGwvV05iRGVRYnFHclY5TCtubk44eTNjdWVmd05m?=
 =?utf-8?B?aXVLQTE1MW1tRWZ3OVgvUXpLSTFCMU1pa0lJNkVlUCtLWEJhNnBBQ0g1enND?=
 =?utf-8?B?TWgvQ1NOL0E1YjB4QmJkNktMbnBxNTNqemZtbDI0ejg2ekJkTHZubGJTOWR5?=
 =?utf-8?B?Zkw0YkRiT25WL1pKbWhjcktjL0JaQnV5R0lUSUtsck0yNWp6L1A3Y3M1QXFx?=
 =?utf-8?B?SG5kR3MrdnpqNmFlSmUvNUdzZHR4OW1iUDBYSElrbldrenI4VUhoUUN6MS9z?=
 =?utf-8?B?YXVEaDVwbmIrQ1FuZjFJbGpsMHZLaWRnUnExTWorL05vM2hPUXpDY3FDd2tv?=
 =?utf-8?B?QWl6VUo3bGw1L0Y3OTcwdnpqdmMvQmJTN0ZYOTluQWtEUS9hUkk2ZFB3Q3hS?=
 =?utf-8?B?TXU1TElvVjFmNzFScnFBZ3hnVHpIM3k3THA4cVFCcEZHRlZyTElaM3RwK0Mr?=
 =?utf-8?B?cHUvTVQ0YVRkeFVDSzdNQTlBbkNLUGx0dEhXTEl2QStRNytGZUs0T3p3Vnph?=
 =?utf-8?B?bHRPNE9hVFpNVm5KZVNBTjlSdUoyV3ZrTWQrczVIUzlhbytxdHovMjBWK2s0?=
 =?utf-8?B?STBsREJzdDllbnc5cFZ5SWtXdDRjQ21XMEd6dm9YY0JsM2dRa2dxNlNLSVZX?=
 =?utf-8?B?dmp3L0FGOHVONFRwWkRpN3BXTjBwOEJyejhSNEIrY2VEVmtYQnY1aUxTemlI?=
 =?utf-8?B?NXhRU1hKL0RJVVdBa0FmZEt6SDNuNk9YZ0tyMUNPY2JMUTdnV0gyTGVXQlov?=
 =?utf-8?B?YmdFb0k0ZDhRZ1pxNndzTFFoWTllSzh3V2l2YTU4MDV0QWxUZGhVY1dSRFlN?=
 =?utf-8?B?dS9UVS9Ld1g4TmZWN0gyQXpua3Rqa1BGWDZjbmEvYnpiOTgvNkZSaVFXbHRm?=
 =?utf-8?B?UnVJS0xrMUZIMjdIUTNyelRaSDBDcVhVM3k1ci9Lb0IwV1RReG4rQi9iNmlG?=
 =?utf-8?B?SnpnT0xDVURqK0JKclhGckJWbkd0NGs2d0JGSFF4Vy83bUttVjBuUHhkaE8v?=
 =?utf-8?B?WUw1ZW44YjVKOXdJYXlTLy9vVk1XSHlSL1ZoanQzekNIVlJaeThIbzFnbk84?=
 =?utf-8?B?TUIrN3VJNExUTS82T2NXWkNDQWozczVoaUp1WTRsN1FMMXg3cVpNS0NjRWhx?=
 =?utf-8?B?amQxZ0l6RlR5Vks0R096Z0wwdWZkbTVneUlaYVl6Nk90aXN3TUptVW1RbXRw?=
 =?utf-8?B?VVh6S3ZCdkQyVXBNZ0kxUlc0RlN5TW9scHl6RVlwMDdhYnBqTkozSFovUTJw?=
 =?utf-8?B?KzI4TEJyV1VEbUFXb3g3c1dkSkJwS051aktlalZtSERrNUVZS05aVWJhK1VS?=
 =?utf-8?B?a0czN1REeFQvL0htamZaNTlib0lFaWRTRXJ4bWZGS0FudVMrM09qRjR1VVly?=
 =?utf-8?B?VDMwb1ZCcWthMnNaT0w5WEtWcytzNXpnQUpWc3FzQW1wYzZtSDJKcnhsbllO?=
 =?utf-8?B?NDlWY1FvQTZmc2l0WEFTNWU2dlNJeTgzZ1RPd3R2SFMrRC9XT0FWbkVseU5y?=
 =?utf-8?B?ditxYWNSalc2OERBdHdUZWw2Qi9Ia25nck5YT3hWUmxRZzc2MVBSenlYRHFD?=
 =?utf-8?B?Nm01ekdKdWVMMXc0UnJrNTlXSHZzdmFMcEhQVEVIZlhlZjBtRWhYTnZDYXdZ?=
 =?utf-8?B?YnJmSDM4aURMeUpXMnZEb2hNSkh5UXIzOEtZQnFRRkRiNTlEQnFxRjFjblRm?=
 =?utf-8?B?QUh4ZFpuZzVWM0F6WnllRGo4L0l5SUNGTXR4THJidDFsSERwR2ZxeVBsWFZn?=
 =?utf-8?B?SUFTV0dwcXVoZVRzV1QvNitVUXRKOVZoUXlWTUVncmJjdFZWVTgwejl5RlNm?=
 =?utf-8?B?eXZqWEordEczMU1oNURPUlRFSGJvZ3lIbjNHb01yYlhkaWVQaE1McFQ5MzVn?=
 =?utf-8?B?RlFXaW40ZFNZbEszanhaKzZkMTdRMUlkdjQzaHg0ZUliZ0RaRHRwMktXTysz?=
 =?utf-8?B?UXdVb0lWaU1qbG1Ob0VGVXgxUWt2ZGFlZ25KbldKZThsYi9nUDRuZXFKb3dR?=
 =?utf-8?B?a3VZVnp6MU1oVFpvK0tKZXh0MVptUTJ3dXZHdGdaL1U5REUrVm9KRW9RZXk2?=
 =?utf-8?B?MGd1TXhtbmtmb01GWVVZbXFPWDN0VXNxdnVJZ3BTK1FCd0tjV1ZOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decdd4a1-6527-4e37-1e8e-08de5db4f8a6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:01:38.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iP04KGLvX4Wxg8MWgCM/C2wDGPG2YJZ7XJb0fP3J+IeNu1RIuVOmcICmKON9wWqkqWym+Ll2VihgZPl9DsFDPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8268
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1B01C9639B
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:06:32PM +0100, Jan Beulich wrote:
> On 27.01.2026 11:40, Roger Pau Monné wrote:
> > On Mon, Jan 26, 2026 at 12:14:35PM +0100, Jan Beulich wrote:
> >> On 22.01.2026 18:38, Roger Pau Monne wrote:
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -159,6 +159,66 @@ static void increase_reservation(struct memop_args *a)
> >>>      a->nr_done = i;
> >>>  }
> >>>  
> >>> +/*
> >>> + * Temporary storage for a domain assigned page that's not been fully scrubbed.
> >>> + * Stored pages must be domheap ones.
> >>> + *
> >>> + * The stashed page can be freed at any time by Xen, the caller must pass the
> >>> + * order and NUMA node requirement to the fetch function to ensure the
> >>> + * currently stashed page matches it's requirements.
> >>> + */
> >>> +static void stash_allocation(struct domain *d, struct page_info *page,
> >>> +                             unsigned int order, unsigned int scrub_index)
> >>> +{
> >>> +    rspin_lock(&d->page_alloc_lock);
> >>> +
> >>> +    /*
> >>> +     * Drop any stashed allocation to accommodated the current one.  This
> >>> +     * interface is designed to be used for single-threaded domain creation.
> >>> +     */
> >>> +    if ( d->pending_scrub )
> >>> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> >>
> >> Didn't you indicate you'd move the freeing ...
> >>
> >>> +    d->pending_scrub_index = scrub_index;
> >>> +    d->pending_scrub_order = order;
> >>> +    d->pending_scrub = page;
> >>> +
> >>> +    rspin_unlock(&d->page_alloc_lock);
> >>> +}
> >>> +
> >>> +static struct page_info *get_stashed_allocation(struct domain *d,
> >>> +                                                unsigned int order,
> >>> +                                                nodeid_t node,
> >>> +                                                unsigned int *scrub_index)
> >>> +{
> >>
> >> ... into this function?
> > 
> > I could add freeing to get_stashed_allocation(), but it seems
> > pointless, because the freeing in stash_allocation() will have to stay
> > to deal with concurrent callers.  Even if a context frees the stashed
> > page in get_stashed_allocation() there's no guarantee the field will
> > still be free when stash_allocation() is called, as another concurrent
> > thread might have stashed a page in the meantime.
> 
> Hmm, yes, yet still ...
> 
> > I think it's best to consistently do it only in stash_allocation(), as
> > that's clearer.
> 
> ... no, as (to me) "clearer" is only a secondary criteria here. What I'm
> worried of is potentially holding back a 1Gb page when the new request is,
> say, a 2Mb one, and then not having enough memory available just because
> of that detained huge page.

If that's really the case then either the caller is using a broken
toolstack that's making bogus populate physmap calls, or the caller is
attempting to populate the physmap in parallel and hasn't properly
checked whether there's enough free memory in the system.  In the
later case the physmap population would end up failing anyway.

> In fact, if stash_allocation() finds the field re-populated despite
> get_stashed_allocation() having cleared it, it's not quite clear which
> of the two allocations should actually be undone. The other vCPU may be
> quicker in retrying, and to avoid ping-pong freeing the new (local)
> allocation rather than stashing it might possibly be better. Thoughts?

TBH I didn't give it much thought, as in any case progression when
attempting to populate the physmap in parallel will be far from
optimal.  If you prefer I can switch to the approach where the freeing
of the stashed page is done in get_stashed_allocation() and
stash_allocation() instead frees the current one if it find the field
is already in use.

Thanks, Roger.

