Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAADDD0805B
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 09:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198441.1515397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve8JV-0007dA-Aj; Fri, 09 Jan 2026 08:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198441.1515397; Fri, 09 Jan 2026 08:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve8JV-0007a8-7i; Fri, 09 Jan 2026 08:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1198441;
 Fri, 09 Jan 2026 08:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ve8JS-0007Zw-TZ
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 08:57:43 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40276fd1-ed39-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 09:57:40 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5903.namprd03.prod.outlook.com (2603:10b6:a03:2d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 08:57:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 08:57:37 +0000
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
X-Inumbo-ID: 40276fd1-ed39-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcjVwGmVpJMRf2Kh9HZ9V38xIwmAbB5XBM8Uj0/3ku7ZUKiNieFmi4i1FrCTVkzGS2a3lK8BjeDfJiofbKYvHEz+V1oZltbX0+ovCMNd2clv6izHk4bimfdkZ8PUUhZkvcM3E9PrGezIeVj7lTw+tKR3tJCeCT1QP5m435kdZBXQ9JnGuLXW3fwaDa5YApxNaoz3EjWGWhk8OoZPsWujPm5DAiyGGR9Dq/YrtwTSR7NpWDZifI7eF2W+MF7E9E4e5fyTGhU+70nCkpaAjUJI7DJ39nHBPfX9qWU5ntSMQTYO93Uixvva1HxhMVPglHrOfyZCCzgcgDK1k8JV9kRg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH7VdYlRgiQ1C2oCEOfkUSwldE30O6UsxMctrO0gtYo=;
 b=Wtf7mfnC3uW9EMrmJNOSyQRR2qZ6y5oyYXjQ4XWT2+0/LWZapuHbu+ScFVC+08HzQ1+9iezyutFh8fQJpE45IID8QCTmXqNsMs87iQ3SWuQ2IZhtlrpQRW5/XJhduk3hiLgD7izzSzFmiLfc+kTuZ2U/ucjge7B/OIurWCPnJu19MY5MPAvK4WYf5o++ZCwSa4dVYhJ86yDPzkyYXYTjZqSE7L/fwi1O1ycZHwnkTYbTmGlReW5FfwNf77+ab0rgTEjudoizGQPxmL7RjhPPbtjSBYHD6atQ5tQRPThmqbjLHYV9M0HoC5eyuA8prbj2Zat7NLXnfUzUlOQ1gHi77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QH7VdYlRgiQ1C2oCEOfkUSwldE30O6UsxMctrO0gtYo=;
 b=eIspAcMfbHm0EJac+3mD6B2WEl9v+3u/THnHhXPu8FOIXehZeC8RtjdQwHeRYjbabo4jIraTAZYD6S0/i3NV8uHRILxuHlJr3bvAZlYXZqRlsEwI7vkzQpJBUnhUjD65GiLXPWUzZLpJddO/5rgOdb0KjdvbnfGnwurBicUgaRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Jan 2026 09:57:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] pvh: Introduce SIF_HVM_GHCB for SEV-ES/SNP guests
Message-ID: <aWDC_UDsHkXoKu44@Mac.lan>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
 <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech>
 <aV_s6ySoXU-G7Gno@Mac.lan>
 <f45ff7f7-aa71-4ddb-85ce-eadb1dfdb07f@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f45ff7f7-aa71-4ddb-85ce-eadb1dfdb07f@vates.tech>
X-ClientProxiedBy: PAZP264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: c7135668-4163-43ee-2d67-08de4f5d2304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWN4U1IxQTlhT2xzSlNxWGM0S0g3NjVCWG5hTTlEUjV2OVVPd2tQMEJKZ0Fa?=
 =?utf-8?B?ZE1tVkhPY0RNVXYzNjUzZG92Y3hIbExlV3FNeUIwVVdHci9yVzZQSGJPaTRF?=
 =?utf-8?B?Skg4RGNER2hYLzZyNTR6MmxJNDNhNmNheUpBVXBqZGgvejVTM0hMUU1YMTJM?=
 =?utf-8?B?dTNMbVI1YlplUWs0K1BiemZ4V2NnRDlYaTk5NWt2NlJvbi96aUlCMmpDNjh3?=
 =?utf-8?B?WlEwaXpMdDVWaTROTzIyRGt5MjdtT0YvSmltNGJob2MzZFlYdzJ3M09DaEZW?=
 =?utf-8?B?bHBkS1Bxa0hMc2J6QW1RbnhFR2hCdjdsV2xvSXJ6d3JIck40Y2FLd08wTFhk?=
 =?utf-8?B?VUd3K3dNUm9pMEV4T1JGaSswek0yWVQ0cnQzeFRpSFArYkhNVjhwZExTVHM3?=
 =?utf-8?B?QVd3VjFWeTVhSU04YTAyNFFDKzI3Yk0zSytsdmtCR1RBVSsvTUhkV3Nnb0pi?=
 =?utf-8?B?b3BrYzMvajcveGhjYVo2M2MyZmNjSG1tTnFGVllQUWRtejY1L000M3oxZy9h?=
 =?utf-8?B?L2FrQnJkNzZpcG5pN3hjZGo3a1BhT1BQS2dXZS95eEh0ek90cjBBbHFTYWRI?=
 =?utf-8?B?akE0SFpMRHQ0c1RVdmtlSG1OQVgyZnFhbzhiSlUrOTYyTjRwekpqdDRmYlNu?=
 =?utf-8?B?V0lGNEZQc2ZCUUZaRGh5cnp6aHlqOU9Ud1RTQjNPenlpZlVQemxzSytiMjVX?=
 =?utf-8?B?SnVnUndROGhyeWk0eXBBeGFablpaNi81WmdIdHZKMFNGM0NBQ3VFdWpDSHd1?=
 =?utf-8?B?aWtQQ1dTTC90SFBZMnRWWUNkd2dJNUUrajhWbGt4RHhqSE1FcFFzaXJQWDJL?=
 =?utf-8?B?S29aNWxsUll4YmY4aTFWMmJhNTZpZnFHWGFZWEo5UnVxRFBwdWFmb1laKzJk?=
 =?utf-8?B?RWRWTldUVFdISU1VQm5KSnh2VnlCRnN4a0dyNk5RZVVhdVR4dG4xK21CNlVE?=
 =?utf-8?B?Y09FaFlYNzZTcGxxOUE4YzBocWxrQkxLRUhmTXlRSzVXNStGOFMrekcvSm96?=
 =?utf-8?B?Sncxc2ZkQ3V6emJuT3g0RDJCeit0MWhkM2hQUnM0T3IrMDhtcjFTME54VThO?=
 =?utf-8?B?OHVIUVFsNm5XZTRLbzJLZ1lOQzA1Y1BOWEhhMzZPajk1ZkVxWWZ2WlFCa0lX?=
 =?utf-8?B?WVdzWG9ETWY5c0FPY3BoRnJRQmJmMUtMQ2hvanhUU2loM21YWjJJbk1ORFFk?=
 =?utf-8?B?RHNKbFd0eXRyWjFkRWFNVldma29IRVZDWTVSbWlERFZPVjIveE9QVjFkdXFv?=
 =?utf-8?B?cXRmQTVJK1NhNDRvbytqOUhROVFWeTlqOUtsN21DSnpnaklBdkljbFJnUm5I?=
 =?utf-8?B?YkFJeWtpWDJ1dE9EOEZHL1M0ZXJERHplMUZzUmZrT2NySFgvVFFoZWdXWlhO?=
 =?utf-8?B?MjM0bnNOazRUTmRnS1ppaG56VXhyRGZnSkh0dUcwMlNkemdsTDNldnZhK2Fs?=
 =?utf-8?B?M2dvR0dVUkpnSitsbXF6Mlk3OXMveHN2NUkxdUcya0tYSGp1SDJIbkltUkpW?=
 =?utf-8?B?RWFOeWtocC9sbFVVZXlMSlRQTE9ScEVjQVJNTExnVXc1aGNpcU9pODNpUitS?=
 =?utf-8?B?VjlYMDdmVHN2TkhSVmpqeGRudlkwU2tKVjB3akZSc2h0Vk9JMWVINVNGaXYx?=
 =?utf-8?B?RXhkZFhDSE5KRjVGY2Rjay9zY0dIMXpITUZVT21aT1crNlZhUExURzR4VHdw?=
 =?utf-8?B?eElEVFFnRDdhMHgrdkwwUnBIbkdiSW9kQ2cyNEtHOUhtNS9hM1gvQzVoUDFU?=
 =?utf-8?B?Z0FPajQ5Rmo5RktUWi9qVE11UU9sMUdqQUJKRXRSa3VNa2UwdHZ1K1pjL3FW?=
 =?utf-8?B?U3RHTXpFbTFUb2tHbGMvWDVzZmVsRmxhenRTWDFuakRvWTI0Tms0OTh5QXhT?=
 =?utf-8?B?dlZ1S1o5Z0V3VEs3ZDZ6aFgzSmNYR3dFRmg5RFVjTmNaQTZCeVc3aWVUeWYz?=
 =?utf-8?Q?OFrlh2dxpiZ1KhldKQLFTkOQyr5ukcV7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUFGekQwR2swTW8xbHg4dVI0Qm51L2pIdGV1R09La0t5TmRINFBXT1FNeGIx?=
 =?utf-8?B?eHpmQlFWYlcvc000c3g5dWZzeGVuTWxHTHFwYTZtOHpnbVpjUDBSVW5QMU5x?=
 =?utf-8?B?OG5TanZVdHQ3K25qbHAzelRVWU8vNVluMTBWSjdEeWUvZHBzV2k4Z3BJV2xW?=
 =?utf-8?B?T1hkcGxFak01UmM2WDJsQXNiQ0dObk5uSWxGc3dPYnk5UkJsWmkwS2VrYWN5?=
 =?utf-8?B?dGJEbVhqY1k4eDZUMjU2VHA1dEpVS2NmeG9sbEh4RkhaVkdOU0MyVG4vb2RM?=
 =?utf-8?B?OURIajdUdHREblhnc0VLb0JBRk0wQ0FFeWgvblhYOEpoOUNaZUswTGFLTFdZ?=
 =?utf-8?B?MnpKQmQ4OThWaU14cjAzSDh4SVJ3dmV3UG5iL0I0bnRhcCtieUxtVm91TkRH?=
 =?utf-8?B?Q3VlaktSd1ZCRFZEci9nVS95TytNdFpyYmV1ekdHa1V2WW5KY0hnYWd4Rk1r?=
 =?utf-8?B?MmFIajI3cVpjYkhuV2xXRk94Um1pY3JSMTQ3clBqMmNjMmF2eE1DaThvNHdG?=
 =?utf-8?B?Ry9DTDFtUzN5UGQ5and4bHVZUGJxYWdQVUVoTktpL2xKUGQrKzMyc1UxMjNY?=
 =?utf-8?B?YnFJODQ4d1BZRFlJR3lOMlVocWo5ZHpUYTlXUjJzSHhxMFVXZkI3WE02Z1ZE?=
 =?utf-8?B?TXJSLzg3K1ByZ0hGaVI1VHZzYU9yY0pOVU4wQjErcitBVm9CMDFaU0VUMTFU?=
 =?utf-8?B?QlBiOUk0YUZndlNUZ21KU3pUZG9TbnhDNGlSaWVjMHduRkNsTjB4S3VDaXRq?=
 =?utf-8?B?UUdMSytVOWR4cWVNRlN3b3R3T2s0amFpTjM3NWNKSkptYnVCMFJjYmdBRnND?=
 =?utf-8?B?RUV1VXQ1RDUxSFVtOFBOVE5tTjFiRE8rSGRyWVF4d1FtREVpY0xQSUZaR2Zt?=
 =?utf-8?B?Q08xanhIMFpRUkNPUUVzMk1BUVpPQjBudGhrWkJXZWpsUDJKUlQ2WmdvSXYz?=
 =?utf-8?B?eGVOc3dpYUt4UkZldkJQZDdzZERUNUN3dmMzcERZUlByd3Uyd0tnSGlxVlBi?=
 =?utf-8?B?U3pGRFRCWTRkT0o1M2ZaUXZrRVJTbjJvM293V0p3NWJjOUZ6MHVnWnNHNzZt?=
 =?utf-8?B?T1ZsYkZQdGpSVE03ekZVQnhCTFpSdGRXa2lNVmRaSmg0SHUvQXZaZnU0T2h1?=
 =?utf-8?B?RHZDNXcwQXJ3QjRFZC9TSVdIa0ZvMitxU2h5K0x5eTMzbjVSVVhpNG1KMUJz?=
 =?utf-8?B?ajgzeUMxcWluY0xUK1lxWXRIYlAzcTZtUkp5ckd4UDZMdTk5cCsrUHJISHFs?=
 =?utf-8?B?TjE3UXd2QnozTUdTaWhNOUFhT21VNkJ3UWtOVTVyM2l4N0pHY1ZUMkQ1bVBZ?=
 =?utf-8?B?VWlnNmtLWkE1aU1oVkl6VU1WanZ2UitxbWpxdjhMd0drd0lKbGNEc2JHTmtp?=
 =?utf-8?B?OFA1ZEFSMEpTMDJkU3hrWFZKRVErb3VjbWoyZGk4VkRDQzhVbGt2emJFUEdL?=
 =?utf-8?B?Yng2ZnNOSXNtSGpCYUpuTkc2SGYzbGpaZFhGRHNKQ3BBYitJdWFzRUtGaUNT?=
 =?utf-8?B?WkJ1VWVwSWFmN2ZkTmpvenJMNDVUZVpBRVdLaHdrVndZSTlRR3lRSU1BeXQ2?=
 =?utf-8?B?anhrOU05My9IUDhzNDVIcThMM2luWGJuMmJYL0RieXhuM0grQ2hwelVabnpS?=
 =?utf-8?B?eWRvYU15emwwOUoveERPRjV0N0krMlhCRXBnVkRwak9SQlBpQXgzRFE4VU5V?=
 =?utf-8?B?SjRTcElqbVFOaGpCWXBKQjM2cGxvOXRYUmZaenYzeUp3SzlxYWNSZk51dmhw?=
 =?utf-8?B?aXVESlE4c2l1OW1WLy92OUlXSXkzQjRMekZkOEVEbVpERkRyNjRDK2hxU2NE?=
 =?utf-8?B?Y3htVjQraTRpc0hjZ0VlMzFvT1p6R2Z0dnZLUS9hbzhiL2pOUFRsYTBydTg4?=
 =?utf-8?B?dWFYNG0zSVV3VG53RUNYZ0Z4ZmdXczNPUHRCVFpYVHd4N1RsUjhpd2RJWDFh?=
 =?utf-8?B?UlkzaEJJU3kyNjNTelhPNnVTb3pxYmdMclQ5bllHZTdvWFpoQ1pic1g3UzBh?=
 =?utf-8?B?bWtQQksxR3IxUHZJR0cycytwYjkwZFNoN00yVlFxY296K0tWY2ZUNExJQ3VB?=
 =?utf-8?B?NHdzVElqRjhSN3lacElkWDhoYlRqQzBGdnl6Zzl4a3Y1SDVnTTFtTDVyK2N3?=
 =?utf-8?B?L0lXUWRCYlpaODhoeWNpQjFNTGVTNjRWOHNIK3FsVTJpSkdkODkrT1c1YVcx?=
 =?utf-8?B?VWZSc2I0WU9WbjBLd241c05DWkIrZ3pyT3Bueit5ak5OZjljVEIyTXNoSVBP?=
 =?utf-8?B?MUE2TmdQem4zTWVEQnVIK0tETDd2QlFDRkxNUWhSODZqOW5XYmRqc1JPOEM2?=
 =?utf-8?B?enZESFIyTkh2Zm5pR0x4czNvcnVNVktBRENWRTlHYUpkaWsvZ2ljdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7135668-4163-43ee-2d67-08de4f5d2304
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:57:37.3615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BqJDRU0TBNscmdxKb+Mogqy3DFmRhxOANfe8HdN0wAr7m12g1X6vSVOChvrvAZsS6vjNhL3pSgt02mV4ctZ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5903

On Thu, Jan 08, 2026 at 07:12:48PM +0000, Teddy Astie wrote:
> Le 08/01/2026 à 18:46, Roger Pau Monné a écrit :
> > On Thu, Jan 08, 2026 at 04:50:51PM +0000, Teddy Astie wrote:
> >> Le 28/12/2025 à 13:54, Teddy Astie a écrit :
> >>> Under SEV, the pagetables needs to be post-processed to add the C-bit
> >>> (to make the mapping encrypted). The guest is expected to query the C-bit
> >>> through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
> >>> now triggers #VC instead. The guest would need to setup a IDT very early
> >>> and instead use the early-GHCB protocol to emulate CPUID, which is
> >>> complicated.
> > 
> > Possibly a stupid question, but how is this information expected to
> > be propagated to the guest when there's a guest firmware and
> > bootloader in use?
> > 
> > How is OVMF and/or grub propagating this information between
> > themselves and to Linux?
> > 
> 
> When booting Linux with SEV+UEFI, at least during the UEFI services, the 
> UEFI firmware transparently handles #VC for the rest to allow it to 
> perform CPUID operation.
> (with SEV-SNP CPUID page exposed with a specific UEFI mecanism)

Hm, that's going to be cumbersome when using hvmloader in this
scenario, as it makes extensive use of CPUID and hence would need to
setup it's own #VC handler ahead of making use of CPUID.

Or we must instead get rid of hvmloader.

> So overall, this proposal is only meaningful for PVH booting, everything 
> that comes after can be handled differently.
> 
> > Are they relying on the CPUID discovery logic mentioned above, or
> > there's some shadow infra used by KVM for example to already convey
> > it?
> > 
> 
> OVMF at its startup relies on #VC for emulating CPUID.
> It then relies on GHCB MSR for getting SEV info/C-bit (but only with 
> SEV-ES). And under SEV-SNP, it uses "CPUID page" instead of GHCB 
> (PAGE_TYPE_CPUID in SEV-SNP firmware ABI specification).
> 
> This is because SEV/GHCB specification recommends using CPUID page under 
> SEV-SNP (even though the same protocol as SEV-ES still works; but is 
> discouraged).

In a previous reply to Jan you mention that Linux already has such
handlers, but just for the decompressing code (and hence not reachable
from the PVH entry point, that's already decompressed code).  Would it
be possible to share the handlers with the PVH entry point?

> In GHCB Version 2 (SEV-SNP)
> > The hypervisor may supply the encryption bit position using the SEV Information MSR protocol,
> > but the guest should use the CPUID information supplied in the CPUID Page to determine the
> > encryption bit position.
> 
> But its location is unfortunately undefined in this specification and in 
> the OVMF case, hardcoded in firmware metadata.
> 
> > Adding Xen side-channels when there's an architectural defined way to
> > obtain the information is a duplication of interfaces, and could lead
> > to issues in the long run.  We can not possibly be adding all vendor
> > SEV options to SIF_ flags just because they are cumbersome to fetch.
> > I know this is just one right now, but we don't know whether more of
> > those CPUID options would be needed at the start of day in the future.
> > 
> 
> That exists for SEV-ES and SEV-SNP (even though complicated) but for 
> SEV-SNP, it would relies on discouraged mecanisms (GHCB CPUID Request).
> 
> AFAIU, this flag is enough for setting up long mode and GHCB which is 
> what matters. There are some additional structures (e.g secret page and 
> CPUID page) which could in the future be eventually exposed as PVH 
> modules; which would be hopefully less intrusive.

If my understating is correct, this is not needed for the initial
implementation of SEV (when hypervisor doesn't implement ES or SNP
guests can use CPUID), and hence it might be best to wait for the
basic SEV implementation to be in the hypervisor before jumping into
ES or SNP details?

AFAICT (from your Linux entry point patch) you end up needing both the
CPUID and the GHCB ways of detecting SEV support, so one doesn't
preclude the other.

> --
> 
> Some specialized boot process for SEV-SNP (e.g the one used 
> COCONUT-SVSM) relies on IGVM [1] with custom memory layouts, initial 
> pagetables, and so on.
> 
> [1] https://github.com/microsoft/igvm
> 
> >>>    ## AP startup ##
> >>>    
> >>>    AP startup can be performed using hypercalls or the local APIC if present.
> >>> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> >>> index 7f15204c38..9b84df573b 100644
> >>> --- a/xen/include/public/xen.h
> >>> +++ b/xen/include/public/xen.h
> >>> @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
> >>>    #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
> >>>    #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
> >>>                                       /* P->M making the 3 level tree obsolete? */
> >>> +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that requires */
> >>> +                                   /* use of GHCB. */
> > 
> > A concern I have with this is that we are adding vendor-specific
> > terminology to what should otherwise be a vendor-agnostic interface.
> > 
> > There's already a fair amount of arch-specific information encoded in
> > there, so maybe not that much of a big deal.

If we end up getting this bit, I think it needs to be clear it's a
vendor specific feature: SIF_AMD_SEV_GHCB or similar would be better
IMO.

Thanks, Roger.

