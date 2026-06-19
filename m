Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fAQdLWwUNWrtmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:05:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117636A51C9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:05:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=bX1zttPM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342020.1602317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waW5u-0005Kt-RB; Fri, 19 Jun 2026 10:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342020.1602317; Fri, 19 Jun 2026 10:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waW5u-0005IV-Nc; Fri, 19 Jun 2026 10:05:02 +0000
Received: by outflank-mailman (input) for mailman id 1342020;
 Fri, 19 Jun 2026 10:05:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waW5t-0005IP-Ru
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:05:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waW5s-000WcR-Nm
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 12:05:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a351443-2eae-0a2a0a5409dd-0a2a4502c098-28
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:05:00 +0200
Received: from [52.101.57.39]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a35144b-fdf1-0a2a45020019-34653927fd1e-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:05:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8046.namprd03.prod.outlook.com (2603:10b6:208:593::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:04:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 10:04:58 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nINZEsfoLKnAFGAXTF65PiLyhSBx6pQcHwnCpS4m6aunMQqUWAD+eh5bq2fLfcttUlbn4H0qqvOqY3Sdux/s3Y3aQeHbZh8mWLDYNCvsO/tBJtSXzwSxXODANYXUOSQBxAVsmmLpc5ckV+qjSdgRIynolp5L6XWoCsnRqOalyVsWFqYzpP/ikIKzYAFd1Hf9KoYzuCsym2iXoff/vQaN30qRE9yXCEtFLdT8ZSHBJeqi38x4yv9iBi1W3kOr+KH9hqNVrDf2ZPH4PlnkV1hBo+8T0f9Nm+tMPJNrVSkQLV0VsLytVcIZeedGLOQ/LpCH6AeG2LczwX/YRjofGoMjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfknyemjiKoYzpH/UizoZQOGEdwZIowA+AwX3AZJuSg=;
 b=P5fT2HwIXr5skHBvMYssiP4uZzdCboCv9S6cp7Kec2q2yCO2ga6OD0C9q1OIoRY49z3dY9RUV909KKcu0XIOiNu/NqaUy0PBq96TQnjX3x4cri1aFOFLyE5cpBoGNYb9qmehWVSfdpdSgNOPeM5bR37sncXVrWCVLa7GPR3QsYw5hAc5ZVZNpl+ZSPr+W20qPRJD1YzuYCAk+DnobA1ISA10V6+glryyFMVXV4toC2hMedYKtuMao3gPplQvImGFpdYTkL8okr12CBcPpkunZ8q4WaercAF5cE0EUQ1ow8tb2rQ5fA//O8m34PObKxm85zaCkSIU6quO5/l/jp1UFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfknyemjiKoYzpH/UizoZQOGEdwZIowA+AwX3AZJuSg=;
 b=bX1zttPMjuLHbKuUhruU0wb04nH4VTG3RSKNQnZ682gmHHVfAn/s9iV4sQXfV3KCbZqrXaoht4LuxAFhay/nr9iACsJU2/+Z9fSMYjjoPA/sSrSNZ99RXuRTmOr5krTZ7G5Kmni5viHyPlcSzCGeiUJjK9Lz6kOIqx2ifuh1Vrc=
Message-ID: <befc4604-7d8c-484c-8783-aef13b92dfed@citrix.com>
Date: Fri, 19 Jun 2026 11:04:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 10/15] pci: Use pci_sbdf_t in pci_add_device()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4fc3000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794557.8631fc262581453bbf619ec5b2062170.19edb3b4fc3000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: fd01e233-5c7a-453e-efeb-08decdea3809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	2X1ZnAkWAKoB5v0xeB2MAWn6wI1MksEV2SrnFf35Xyj/mc4xRyYfUBcNNH5S1eVo4Bh/DvTd1tBZRCybKz5X6B8k4cAWBUiY4Fzt4hExsVHi6Zp5zq5GollUkRxxTVJl08B72MIJk2u9FApagm54GAaqXbymqICXuAybDq+rZEVoCq234B5B8grDGwTEc8nucmgUPMcrgIIECPGVgVgb9UNpccx5Vct00eOUBsIbsTZd2L2+pvDXdHb4tZkRL27lfj7+ZZGl5ZAnfFQqL7CHKSu+ywOADX7F7Xbksg1DaDJ9Yjc7xDzWdvfOpdoc6Cfa6nEvaFhg1wPwQFA5QoMkHdr/ZscU7SL5ppigDFYrPeq60AHaySv2tP3os1HOcSTyDwUuuoGdOS6CTU5nkmiR84ACK+EKEK1PQBhEALwJHTCtGkH/Kumf14UeU0h52lRaZ7g4HPaUFjbOs8S8wW/OTfRWYRmPsSX9rWwN0oX//6mKSL2mGq6uXImyvcXExTVpM2ISqfIh02faz1kLw1AKHEg/K8+sURCDH2+5ZIbajG/iEguK5VYSqsjcccwgD8s/GGlWAHKez3znhjWnYpwHRvhn8vtUm0fdnMP8b7vMcpbUflhPfTmgqr3SvbvGvFplvney4h4GufztTPoNfAPKuZCaYzdgh50+ghudEoDHvZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejZzTFcrdEtHWS9qQ2wvcVBpVnBVMW5iRGl2ZWxvNVplVVVieUZRcUJDQmNT?=
 =?utf-8?B?Y2Yyc3l6RjM4Rkp3MHBDRGlLblM2RmVzUk9BamtGZFlTZUl2Y0wxOE12QkY2?=
 =?utf-8?B?NWl6TzdnNDFySXVrbHFSM0xWa1MwTUdZRjlpbTVtbWo3VU5JUnZmWVl2QURD?=
 =?utf-8?B?T2NWaVlTT0k2THYrbHkyOVJ0ckZMUEVITmZOQXdoN1hST1JFM3pLY3BXSFJm?=
 =?utf-8?B?UFU0VTNQU08vWVVZMEhaN3duaUs4dC8zTE04NE1aUkU0cW9BZDN1ckRVRnJk?=
 =?utf-8?B?K3lkQml3azllSE0xVWwvK24rd2FDeFNid2crejg2MTM2UFNkZkpiUlhNSkZY?=
 =?utf-8?B?UHBieURJMjE0dUdVZVpTSVBmQkhmZU9MRlp1bEtLMVFBRnJ2SjNnTE9ZeERv?=
 =?utf-8?B?NzVhMTBJaHE3WTZvY2haZE1jV2xEQUZUWGRsOXQ2WXp4ZktZYlRCTWxLcVRD?=
 =?utf-8?B?ZUJiOGY5L0htN0R3eTVJbm1IajBDV2xnNmtDNWROQlk3S1VnUzY1dVlQOG1E?=
 =?utf-8?B?d21kd0wzZ24ybHNhTTdqaHJtSytJc3ZZUzdVK1RLTzI4K2RkcWhWL0dVMHNy?=
 =?utf-8?B?NnRpdHI1VytYY2NPbDVON21WOGZ5MVgvRXVNVFFLOTArT21BUU9TeHlTZFJr?=
 =?utf-8?B?cmFiUUkrMkRDOG4xOHB4bm9IRWRBQWprd3d4cmd1UlNDNnE4MnZ5NlJNQVZF?=
 =?utf-8?B?QjJ5S2JQQnFqeVdXWFZ4OTFEUEVWc0VUL24zWVp6eEFSb2VjdE51a3V0SThs?=
 =?utf-8?B?WlNCUHplUzJzbTQ4VVlOSzJkQm0xNVVzTVdWWVhiSkkvYzBrWHRJUko0RU9l?=
 =?utf-8?B?WFRnWWJJS25vSGZvaVEvRnpUVVlaYWdiNDJPeGlyUlJmeEdvZU55THNBYnZC?=
 =?utf-8?B?L0E5aVA1bGltZ3JuQWlEZExTbXhsTjZpRFJMZnZydkZXUGtQZ0JwR1BrbFJu?=
 =?utf-8?B?UHllRzVHTUZDeDlmS3RUUG84Rm80eU5VNUNHMFZDKzczVHl1YVF6ZzkxY3Bm?=
 =?utf-8?B?U2JRL1RDSlVDdXF0cDdGYjhyMG4xZ2RZL1Q5NGYwMjU3TVpuNjBtd3JBSGd6?=
 =?utf-8?B?SzQyODdab0Nzd3FUQmpPYWFwQWoxUm13cC9ROUdNYTNDRHM3SG9hdEtxQjNl?=
 =?utf-8?B?NUJkR0dRa3grSXdXazNlNy9KWVFjWWViZ0Q0Zmp1eUtnaUFUd1VnQm9wNXAy?=
 =?utf-8?B?bXJDNWlqTzR6K0Zya3dnVkdQU2pOdUZIUU9tRXRpbjNZV3NGQ2VLZUVHUkd0?=
 =?utf-8?B?YW5uQ0IyS2lVZHRJOE41Sm9vQW9xZVg1OURkdGlrN0trdEprY0hta3BxL0Zn?=
 =?utf-8?B?RUoxOUs4eUdNZFR4Vld0aVNzRzJob2h4b3EzUFJtZm5BS3ZHcnRFeXZVSnJL?=
 =?utf-8?B?TG03cWMwTnlKK2l3OWd1dXRKbjZMaUdVcVFLaHF3NVViRm9OS1YrZXlSWGxs?=
 =?utf-8?B?NFpCU0JRZy9sYitxTTYxUktoVjU3Ynd6UjdWRkZQbHlzZEQ2MERKbEphRklJ?=
 =?utf-8?B?ODBuRDNGa0ZFV3BPUitLTzhFclNjWDkvV0xGUWtZLzcvZkNQd3k5c3lBcmVw?=
 =?utf-8?B?RXhRdGtBaUV6dm52NHQza3ZJZ1NKMi9weHRZbEZCK3YvbTB4Yzkra1ptcmtU?=
 =?utf-8?B?VVdGbmJKaXZsdFFKekNDTWl3VStUeENGWHVyZUx0NzdhakpZZDZDc3Mxendo?=
 =?utf-8?B?ejltLytjR3pXQjdLL005UFRKL09FL3FTTHNKeVI5TkRiTnM1WFBVbGwzYVlj?=
 =?utf-8?B?cmRwREZybnovZ2xnSHE5N1hWSFZRRGc2c1NkQlVIdWpvY3AxTG1nTHA1R21V?=
 =?utf-8?B?ODMxcXhYRjdteEJCWFFlblFKTE1BeVllUFNnQWV6bWhqa25udVBaY0ZEdXRE?=
 =?utf-8?B?TGR6b3FnK2FWYXVpdXBDZnhKQmhSb0EwSytSOWZucUUyVDJqUEF4b2h2MHRx?=
 =?utf-8?B?L0Mxa0NzdlF0YmdYb1BjUEI2a2RXOWlBV0UvNGZNYlhzWm5nNGNZWFJZNFNY?=
 =?utf-8?B?M1NFRE90cmRsTXZxdjY4emhQZkREbU44RHI1N1FKU2F2R0wxVVhhRVRSaXVo?=
 =?utf-8?B?d1Q3SVR5QXAySTQ0RDhZL2VpQmNOeTFnb2NvWmYwd0lBUS9YLzVtcVNCTXYy?=
 =?utf-8?B?RmUwek93S3NqRytBaFo4dlN4ZUpSV0VRUkNKdklaZW9YVHVLVS8wSEJPSUpW?=
 =?utf-8?B?Z2Y1NXoyR2dFbGMveUZYcTI4eWVITjBMNUYwUTFUb0pmK3RSU1Yzb1JHaUpU?=
 =?utf-8?B?YzNZR2phZ2NiQTBNd1JNbjBvSzVMbk5sS0diVGZ6dmpLMXNOdTFkSWJrLzlZ?=
 =?utf-8?B?S2tnRkx4R3FkOUxWa2kwV1plVUdMRDVaVWZMWm95cng1TDhYRGNlV2kyZExP?=
 =?utf-8?Q?v8RmJ/DCAvsHnqA8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd01e233-5c7a-453e-efeb-08decdea3809
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:04:58.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDHxjuN8FtNlgk3569aERyVA3zGIlqkqAGxdSHcBK4h2TU/cM9gT8WEIUWmxtnFmzHHQeICkHA9e9l1T9cwzpvCsr/hcuZafIfIYzBbtdAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8046
X-purgate-ID: tlsNG-720697/1781863500-4F67B3F3-C0DF9557/0/0
X-purgate-type: clean
X-purgate-size: 1828
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 117636A51C9

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3be0772107..17a4931229 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -661,12 +661,11 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>      return is64bits ? 2 : 1;
>  }
>  
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> -                   const struct pci_dev_info *info, nodeid_t node)
> +int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, nodeid_t node)
>  {
>      struct pci_seg *pseg;
>      struct pci_dev *pdev;
> -    unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
> +    unsigned int slot = sbdf.devfn, func = sbdf.devfn;

.dev and .func, surely?

But, the only uses of them are now ...

> @@ -817,14 +814,14 @@ out:
>      pcidevs_unlock();
>      if ( !ret )
>      {
> -        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &pdev->sbdf);
> +        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &sbdf);
>          while ( pdev->phantom_stride )
>          {
>              func += pdev->phantom_stride;
>              if ( PCI_SLOT(func) )
>                  break;
>              printk(XENLOG_DEBUG "PCI phantom %pp\n",
> -                   &PCI_SBDF(seg, bus, slot, func));
> +                   &PCI_SBDF(sbdf.seg, sbdf.bus, slot, func));
>          }
>      }

... here, which is for diagnostics only.

At a minimum you can reduce their scope so they don't get reused
elsewhere, but it would be nicer to remove them entirely.

Incidentally (and not something you can address in this patch), we
really should see about swapping PCI_SLOT() for PCI_DEV().  It's one
wonky thing in an otherwise fairly consistent naming scheme.

~Andrew

