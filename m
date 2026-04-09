Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJmoDJqJ12mwPQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:12:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1EC3C98C2
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277036.1562318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnId-0002Sv-Aa; Thu, 09 Apr 2026 11:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277036.1562318; Thu, 09 Apr 2026 11:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnId-0002Qh-7H; Thu, 09 Apr 2026 11:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1277036;
 Thu, 09 Apr 2026 11:11:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAnIc-0002Qb-3z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:11:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnIa-00DMKd-Sq
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:11:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d78955-2eae-0a2a0a5409dd-0a2a45099550-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:11:48 +0200
Received: from [52.101.61.30]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d78971-bf79-0a2a45090019-34653d1e414b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:11:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:11:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:11:42 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA1xXkjatspSI/IC8D8JiskPVw1cfoVMuRY568NHywgtH4QCyxY1aMAhoZIAnEHuWvwCftH/vqvqlvsnQwkzlGiEPzILgfnaKgB1cqtC8SVuuqX+m+4OKbnRf61kZKdF/W2zom40X6etu4MYSnv0mPhhHtvvlzmi5VWoC3DJXAyQV8zfdo2tynH1V8IRoc5aJXLCrPbf2VtHgWE23zQ0sywSBCsTvjlEZshpEDrN1xcNDS5KI1LTMdcqmcsdxywz1fbD2dHnuzfUxOJVVrMndqAgFy71cO+Lqvl39/hPozLvTYZdNco2mJuY/Amyju3lkGBUhUE0UU1rXp7O/gj7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiipYdtRRIov76lc0RcSjdBxjLPWFDfXDd8Q6YFP5Ro=;
 b=NcMCLtWTo2NwpebOHFOnvWZcD2tI0eSqv9MlVvkbfsvqD2ecO2WPqCGqm5kQrauOE3mi4fMPO5jduCti/nNHoFJShpId/c5fL5vMjA6negZhZTpukEqyO3faBm3ddWCG7kHXcUZaE3tJ+/zoF/OYnuLIyyRZ1dj8QLKBIDIGT00Rjukqc/R5Yc9+HRC/K2zvaD5NwPFn6M8cGN9M0uEmCfb5cb3y9HytMF8O/4It11LJMtnGzFTwAWrE0EsTX9VKhGDtD1l3IyZqNHO8ws2CnxOGcvDDXOl/BOZmpWaItJ4K2r1+8kJbx89osBMHyZS1zQSvVlItGSFna7Ocs6WoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiipYdtRRIov76lc0RcSjdBxjLPWFDfXDd8Q6YFP5Ro=;
 b=oMVI04Ax4FDY5z4yjGgJ3dtfzxQTDDQQLbRQ0XHndUoYtmRTtnrApe/vsQkgC2Er18oFwt9lnHa3rAOoBvucP1MJ/EHO+uePUwdnsFR3pD6O8o6mWsFGMGUcOvLTTXRvB5O0/HrPIEibPv+naqy/9Z1lEbuLlvReK2NUzRGzoAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <04b9c465-4940-4a16-8abc-9c3440ab7337@citrix.com>
Date: Thu, 9 Apr 2026 12:11:39 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/efi: Reduce ifdefary in efi_exit_boot()
To: Jan Beulich <jbeulich@suse.com>
References: <20260409103805.176240-1-andrew.cooper3@citrix.com>
 <65b04675-abbf-413e-abe7-6cd463913fdd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <65b04675-abbf-413e-abe7-6cd463913fdd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: e323b975-093a-4377-dd8e-08de9628c7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NA/GUQ9STTYii+bAe2w1ZMyTH3xeR66aC+H0groIZrJuGrCwHSRjuJvDvVT1FANdySLSxA7Uff5OS7r+C3hy3hwpAfiA5qSzIBprV4QbTZiMg7I7OIi+JiK/e3S+sDCLTVJzQ8PqINp3Wor1VSAq2vnkCP0nQB9luZmyxoKzD5YO4vaT52bx1TGrPewDm4JB9+gZeDdjKdK41Fys3/xNnJUzHPEjkDTvRo+F6fu/zaGc2wj5GKcCaT3RlBYSynqGvp2lsDqbLdkCeiSD/Kk1R2Aj8iuOmLhlXyZty1j+49NmhKkvihPvi0K3zanZMlKl4tTrTS5CbeeJg00taCesnAlOoJb4UKHCA5QUmqm4MlXUa4M74xgF2HLnCSfyApsEaw6/Evc3aEPqotRSGThY2AQ8gXh+RrY7oFsN7C2z9GjSbZp2Znt9VFZfepErYIabypz5SbZtvDtoSm2MhY+cRVQ9+Du+4h8+T0fvCucHyd1YMvS62iiLDdgNohqAbtjlzTmviT24nJEUzg+/pByhNAS4874oenff9s7JlxJeoPLHNfySKKwpRnJOQjJK4hlueyImZMr2wel9aJxa1HEwi+wCEg+uLKOeie6PKFXLDm8KwlgAZnRATdISfPnmM8E8swuTRlqd8WBXpvFFM++IBFmpJBBBSgwv9w/vlEnaNtQaJqDpIDDY8aKZ85ozdJCzJn6/iYtseswGaGnbgkt9G7HNtl967Kgy5sgTzgUZe1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWI3MnlhVVZpQkRvQ3ZGQkNaekFsR1VrSWttTy9Ra3MxV2ZHSkpVS3JXSWxQ?=
 =?utf-8?B?RFVrb01RS0xabmpDNXhPSmtUUjJzY0x4ZVJzd0svZUJKalBOTVBhOG9BWGVo?=
 =?utf-8?B?MXQzYTl6Z3d1L2RLTkJ6YUNSWTNKRjkxNnR3Tit4RWh2bE50cEhuY2JsU2xT?=
 =?utf-8?B?b1dGRUJnazlGb3BwbTcvS1UvR0NNY3kxclAwaGQ3aitTQXJDcVVWakQxUmw5?=
 =?utf-8?B?VzFxRDk4QXl5dFZSVmNWNVRZUml0MDNzVStGWllxZTZMU2FNbE1GYUIzNk9K?=
 =?utf-8?B?TkZBV05PN2J3RXB1MXdaQWMyTlRueEw0NVhubTZKRE1JK1lNSGJLWUZZbyt4?=
 =?utf-8?B?SHZWc1cvRlNQZEZyblBORGZqdS9FSXVMR1JjajRRYjNLdnZoOU4wTTFXd0Zx?=
 =?utf-8?B?b2gycmlteExwUFlzT0pUelpxdTV2bUd5enZRRGNaQXdnaFlyNEs5T2tMNlZC?=
 =?utf-8?B?V1I2Z01OTVNScTNGb1NvaWI2SE1ENFRYR0RCZG54cHpGcXJmYlRlV1JEUVQ5?=
 =?utf-8?B?NEIxNUpRd2ZXcGVaaWh1M1libjVvbEcvTUp6ZVpDeGVjYi9JNDhkWUJmRlNY?=
 =?utf-8?B?UWUwQ0NkT0ViN3hqMkl2Si84SnVQL2VLcHJYSFo0Zk5BTk1IeGF0RUhVc0Rj?=
 =?utf-8?B?N2FiZ0pidUZxWnYxYVdwWGR1dTRpUHBSK1FDNTN3S3FxVEU4Y3NRWFFWOWFs?=
 =?utf-8?B?ZUtQK2xUenZYaG5YVTdpSXNlaVlIUWtCK0ZUOFpDc1NsMzBoRWxyRWY0a05B?=
 =?utf-8?B?YTdpV3R4dytoSDgvcDlla3BpY3VrckNqd0dKcW9CUG9obHF6MUhuR0JIbS81?=
 =?utf-8?B?clF2dE9tZnErMjI4Tm5PYllkV3JKbkcrNzZINUdBWjFOUmc3L0hIUVdQQWMv?=
 =?utf-8?B?UDJLYjM2Tk5kK1YycmNkdUs5K1NUZjU1ODljeldFdk5TMjRvbzA1MUxKRUM0?=
 =?utf-8?B?OFNSTGRLcVZVZVl3UjhYV1lPekJNOGlpWWtQU2tqREdVakR1a0U4UnQ5TmJ4?=
 =?utf-8?B?aC9UdWhTUkVrWitmOTBYVkZNSEtORXhhdS85OE9wNFpTM3psajNtcXhjd1dV?=
 =?utf-8?B?OGIrV2RWNXJJYUJTVDFUQTlYaTVYOG1HQk9nZ2JueUdYaGdkeTFDZVJMZGlz?=
 =?utf-8?B?eDBnSnQ2enZneEVVMWZRcU9aL0tKOU1aaDFhMkk5Wk9yOTZIMElPUXpoMHFE?=
 =?utf-8?B?UWtVZFlpbTJpRmNNNWxlcE5XZ3JudC9sTVl2UG8zd2wvRFNCZ1NVQ240OUg3?=
 =?utf-8?B?S3VlQWVHNnUwMWdYMUVWSjROblRHM25PaW9HS0NneEFNOEJlb2hadmxvSmox?=
 =?utf-8?B?K0ZneHpSWXNCeGFta29XM0plN2N3clY1OXZMM2hmTkNleERDbll5VmRkMnBa?=
 =?utf-8?B?ZkFCTHpTTllrOFVGaExTRE8rWGYyNlNpQy9yQnVncXJoalUza0JZQ1lCYitL?=
 =?utf-8?B?bG9pOVgrZDJHc0g1Tk5Fa2hIYmpLdllnc0t2N0hLaDNNNGJ4WFMyVGhXdERF?=
 =?utf-8?B?eTNZZ1NqUnBSQTdNdmRmb0FyRzBIcHlzWjRTbVB5dTM3dzhWSzdnZFdKL0lS?=
 =?utf-8?B?eHZPQTNYSEk2cEEzREluNTFrRWJyRGpHOVI0RTNMclZSUlNkZ0FRMC8rVSt1?=
 =?utf-8?B?ZFkvdFcwcVJubmJRaTlIdEVnbU5QRjgyZWdWdTZPRWRUL0xQeXlEaXcrUFpB?=
 =?utf-8?B?NDNGWHBRQlU0SUoyMjJMc1VBN0szSGlNNnpqalRzdE9iLzU5bEZxbG1yQnZH?=
 =?utf-8?B?Q3E0RjdPeHVBYStRYko5NVpRS1ZuTHAxOVpES3F0TVkvQ21WanRxeFBlNnRo?=
 =?utf-8?B?Zm5ITUpEYzZjY1o2ZGxKMERGbVVvNWhqMFdSb2tIdEZ0OHdHdTVPejJ5THYv?=
 =?utf-8?B?RzV5Y3ZyOUY0dFAwNVpqVnJqQVdta0pPVGRneHYyd3k5NUpCQ3VvazZmYXhG?=
 =?utf-8?B?d0FVZUFKMzdVM3FCM25zMytnZ2lxSFNFTWxEdGFCamVZZnRkcWhvQnErcmxo?=
 =?utf-8?B?dTFmdU1GODYrSk5FYklEaWZWZlE3VXUxTTdodnMyTmN4bjBvV2dNTUtMMGYr?=
 =?utf-8?B?UEowbUF6YXNxaVFKZjFQU2VMMzFFQnNpVHFrOVQzdUE0VU9uRWl3K3FGd3Ju?=
 =?utf-8?B?YXFJM3RxT3V0M0I4M2FFK2FKLzZqN0Rxdjhjc2s4YUtxY3RnTmF3SFNLQ0x3?=
 =?utf-8?B?QnBTNWI0ays5TXhKUXRBakdqVlZCUUkyT3oxK0JxRllzcXlzWi9lQ0xiMm0x?=
 =?utf-8?B?L09jTDc3VDZ6UXdHcHFFY1R4amg1Y3pPWFlwc1RRUkxNSFVzSEphMnNFWDFj?=
 =?utf-8?B?MU05dDJ4VjhQYmhyMjg2L1pUN1M1V1VsYnZiZmwxUWZlTFA0T0dUQmpSWk0x?=
 =?utf-8?Q?o/03BUh9tvoy4Xsw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e323b975-093a-4377-dd8e-08de9628c7be
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:11:42.7991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHpQvgo5oj98A1fIpA40tEAslSlLY4ZhcqosfoWUN/HiYjsusz29G6QF/6qEByrTtWholFT0vTED0TZdWc6H+TfptFTnkVTM0J5a3jPeP6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7707
X-purgate-ID: tlsNG-bad1c0/1775733106-54B58152-A60347B5/0/0
X-purgate-type: clean
X-purgate-size: 3711
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A1EC3C98C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 12:01 pm, Jan Beulich wrote:
> On 09.04.2026 12:38, Andrew Cooper wrote:
>> Use IS_ENABLED() rather than #ifdef to give the compiler visibility into the
>> block, which in turn removes the #ifdef from the varaible block.
> Just to mention, if it was just / mainly ...
>
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1335,9 +1335,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>      EFI_STATUS status;
>>      UINTN info_size = 0, map_key;
>>      bool retry;
>> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>>      unsigned int i;
>> -#endif
> ... this to be got rid of, we could as well use ...
>
>> @@ -1371,31 +1369,32 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>      if ( EFI_ERROR(status) )
>>          PrintErrMesg(L"Cannot exit boot services", status);
>>  
>> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>> -    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>     for ( unsigned int i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>
> now. But yes, the typo aspect you mention can be avoided altogether by what
> you change things to.

I originally had this change in the patch, but it interferes with diff
showing (just) an indentation change.

I'm not fussed either way.

>
>> +    if ( IS_ENABLED(CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP) )
>>      {
>> -        EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>> +        {
>> +            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>>  
>> -        /*
>> -         * Runtime services regions are always mapped here.
>> -         * Attributes may be adjusted in efi_init_memory().
>> -         */
>> -        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
>> -             desc->Type == EfiRuntimeServicesCode ||
>> -             desc->Type == EfiRuntimeServicesData )
>> -            desc->VirtualStart = desc->PhysicalStart;
>> -        else
>> -            desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
>> -    }
>> -    status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
>> -                                          mdesc_ver, efi_memmap);
>> -    if ( status != EFI_SUCCESS )
>> -    {
>> -        printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
>> -               status);
>> -        __clear_bit(EFI_RS, &efi_flags);
>> +            /*
>> +             * Runtime services regions are always mapped here.
>> +             * Attributes may be adjusted in efi_init_memory().
>> +             */
>> +            if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
>> +                 desc->Type == EfiRuntimeServicesCode ||
>> +                 desc->Type == EfiRuntimeServicesData )
>> +                desc->VirtualStart = desc->PhysicalStart;
>> +            else
>> +                desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
>> +        }
>> +        status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
>> +                                              mdesc_ver, efi_memmap);
>> +        if ( status != EFI_SUCCESS )
>> +        {
>> +            printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
>> +                   status);
> Could I talk you into switching to
>
>             printk(XENLOG_ERR
>                    "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
>                    status);
>
> to make the line at least a little less long?

Ok, but I'm not going to resend just for that.

~Andrew

