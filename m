Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OJvbAiB1T2pwhAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:17:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F072F7A1
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:17:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="wRBo/JWw";
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357886.1612214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whloK-0007M2-88; Thu, 09 Jul 2026 10:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357886.1612214; Thu, 09 Jul 2026 10:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whloK-0007Ji-4k; Thu, 09 Jul 2026 10:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1357886;
 Thu, 09 Jul 2026 10:16:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whloI-0007Jb-Or
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:16:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whloI-00BFCL-21
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:16:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f750b-5cb7-0a2a0a5109dd-0a2a450a84e6-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:16:49 +0200
Received: from [40.107.208.64]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f7510-e40e-0a2a450a0019-286bd04061ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:16:49 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH5PR03MB7983.namprd03.prod.outlook.com (2603:10b6:610:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:16:46 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 10:16:46 +0000
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
 b=gEs5Kl4xc3DoaFhSGRO1KBAEZMXNNC/HWU2VDwllGk3gsOqHZws61WwHS3Nc9AskAXJBpkxWNcHwatzD1ybe7b5y2hoWX+ipCd6TAOlwcdUjofLBY/A8+G2DE6xCVAHDY3BYg3Nhcjsfg4HJLqXW+fcq4G/9rXEoTwRF811CICuuOxQ6XYNa7vAWC2aGxuZFhtDsf0kZCD7ISUIRr8pfnT2a0/rOIVeOH/GTy7MRvF8Df1+trq6VG6QN5/K94wJ6Ib7tL6G+uEPsbjbV6pVakTvRi5LrcNPNggEHwweW0ANlLpd706+TGshPW1LYAFD0uMJZjxzfhzcCkn0k3DvXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEE34EjMBPm1wmWoo8i9gtOyuR9rrhjaEbNr2V1RFjY=;
 b=dVzNKXAFx6913E52ahaLgPZ9FGil1RGcT9q1e3JHYURo1rV5e04g5r+YVQfqsP6HlPHNBczPVS4v1ia5AsnRC8lzxMAXtcWp2G5UlDB+aEJkqPVOU11fTUkdN/iPtXwXnFwBkTmyPWK5aVOWHaUCXheNW3OYgabYh00dQQKbllfocydiErs8JpcAQpK/iH2Yga47hULYMxhAdWqrU0GFy2pNohgutYdMxL7cgEhBUMbQ11A9ET8x1vnRmR/VO6etUP4lkW44O422pQtszo/+qO9wHthryeMHnDOTVXRK8fV+7WgJptzynhCVuv6c++8PtqrBaW6IEg0oEAgtcDKitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEE34EjMBPm1wmWoo8i9gtOyuR9rrhjaEbNr2V1RFjY=;
 b=wRBo/JWwx3DKvtOVQQS971awhuksV6QEw8p8VMFhXzXnIGPw3w8Craa48wbzcKErnH0EjlS5M0pYDuEeOjh8r/pT7qpesOWX6d3Uhq8kOwPgz2j79d4xBipq1Q67gYzkC9yzK9AanFWz/OfMSr1cBxqGaliR1XSpKH41AXhKvE8=
Message-ID: <c7af5609-81b6-451e-b737-0daffe92652a@citrix.com>
Date: Thu, 9 Jul 2026 11:16:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 2/6] libs/ctrl: Allow writev_exact() to change the iov
 array
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260709074358.256084-1-frediano.ziglio@citrix.com>
 <20260709074358.256084-3-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260709074358.256084-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::6) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH5PR03MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 842764ab-95df-4647-5f9b-08dedda32e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	u8D/6CPbg/FQdM+FIESWPVqUGCVr3mosW4ZtYhVyJsmJhnUHGvipPBsOhRL7nQSyNIPYte8tTy2Tuw9VpYJun963Vf+6uuI0+l8N9+zww0PkFmbqm/FozTVj0Y+J9fRzAfQYQb7D9HejZbUdv7iXLpVKSzmWYhTw6DFRd5G2vWbiXELZ9dbhVRznLFTOQk1LfuVre+HzfQnVgU0d+mPVCG6PyG1xJ+YhBO1I9VZ0uVb9d+W+E8x74LsKfko4PSokdV3ehP0eagjh2++EZSAO3EI/REXI5Vy1LEqk5ddwD8+o7ss5PPU9yxGeZUnq+PwspULtr92YfZsfC1AgFDCfV5Yz4rn9UIsxNWRXkTA8fTS0Q541dub5STByWtW+/+yXWSTC2AWVfDmlhnkR3o+xaKIyPXPREe6o2ikumLc8RHttGsqAk6hbATkLGYgQFYzcARtAVtWai2iEnT3Ez4MlSx3i8dU0ggbqDEJtKQ7E1zqRpGgB41t+zaYE6AOdLH1EQayfaHBvqzfdbbnWRkH75KD/Ye3tZwsXUMy2pfAn/q/jcTN7y1OmmwhjWioiNgUF6STXjwA0E9F3As6MpDdFE68XcBhjQUYJ7ER5rms9viAyHIRoWHf7ffgM86zStVJhEcf7mxMpu0iUY64az6FFVIUxqTDGvPReYl7Vq9x60c8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG94M2R5L3pCSlIvNFlYNU8rcUFoSkoxelVPZ2dWUElqOUx3T3RRaVVnVk5E?=
 =?utf-8?B?VXVmc0RMZEFHeXFYSmtrLzFRVlV5b2l3MDExbXBVTkIwRTNzejVVNHZ6djJw?=
 =?utf-8?B?SGlBZ0E4OHhxcWxIWDVjNmZhVDNCTWppbUdUczNackp0L1kzNDlxejZHUDQ2?=
 =?utf-8?B?R00welVvZ2Y0QW8yRCtxLzB0REFtVDhvbVRQRE1QbVlFWTY5dDJsd1grUlBB?=
 =?utf-8?B?dXlrUWd2bzkxOHpvZFN3UlFHMjlBWk1XVU84OHJtV0pTS05WTEM2NXk1OXVj?=
 =?utf-8?B?L1JoRGFKVFFqSGJQUmlLQmFkMEd5VC9Pc1NkN2plS1N3UzUxejIzT0swMlNU?=
 =?utf-8?B?TXRJNWI0bDJMK1ZXZVYrNGtxNTV4a0pCbURGVm9XNjBuMkdUdUlFRHFkcHM1?=
 =?utf-8?B?TGVBTC9kMWhaWkxVT2Y1VGtVVW43N0VYNjVqSk1iL0xWYjh2VEpybXdHVWZo?=
 =?utf-8?B?MXA4a2QxcEJIaUtwLzB6elhHT2x4eVFaeDlCZmZrNjgxVTJtV2thRlprVU1P?=
 =?utf-8?B?WEYrOTczTWZtZm95QmptT0tuSEsyaUFWaU1ZeFViZkM5cjdJWml1V1l1UXdC?=
 =?utf-8?B?WVlzYjRwZzdOc3R6bVZqUGpUelVFekN5Ni9FVElDaCthU3VVbWo0cDV1ZWgw?=
 =?utf-8?B?b1JidFVORmNLVDZOSnRTNEFLa0srS3NTc2RMejRFeFQ1ekRLN1h0VTdyYzJR?=
 =?utf-8?B?dGtlelV4Y2ZETGx0WFpMWDFrQjZPempHaDNkSitDQnRyZmxkazh1ZUQyc1Fh?=
 =?utf-8?B?anl3Y2Z6TzlZSnUvU1dqczlMdlhTbC9SOWxLYm1rWGEzSmNnc0RmWVZrUko1?=
 =?utf-8?B?dmUwTmtCaXc0UnowZnlYRHlwQkFPclcxalJSNDI2R1dpd0xsYTVDNzcyUTgz?=
 =?utf-8?B?cWIyV0s3Z1IzdS9mWDdJY0JPY3JpZDhqekxMY3N3WU8zS25kWElpbjVqMHcy?=
 =?utf-8?B?K2oyZEQwMEJSVDRYRzV5dWJBTWFZbGlqTFkrOStIWXJ5ZHNkaDlMVGVQS25l?=
 =?utf-8?B?N3VBRTFWRDZndWhCQURzTkhUUXQ4QU9IUm5PMkM2NDJ1Rlo1bDV1ZDVSaXpa?=
 =?utf-8?B?ZGNiT2pJWWF4SE5EeXIyZlFudktmM2t5Zmc5VjV2cnlHY2EyL0lyQUZtTVhi?=
 =?utf-8?B?U3BzTWpXUVdzbkVVWW5XcnQ1Q0VVOS8vMzUvOGJQcjhBSXBXSXBxdjBPTFBi?=
 =?utf-8?B?Q1lBNHFKN21YVXVvekRpYnpXMW9xSjZkUFZVZElWcXBpQmZqRFdiMVhHUm8w?=
 =?utf-8?B?ZW0wN0RkL0JMeDZoeStuNDRkcWlwUkpMbHZOWFh5RllLUXJKNXVPOU5lUUNL?=
 =?utf-8?B?a0pCOExVak9ITlJUVDBHTFRxZE9xZFVvQmdVRWoyR2JzcGxUVXFWZHhQLy9t?=
 =?utf-8?B?clY1eXQzb09nUzF4MWZ4TE13N0U4WVlYRENiVktqUytnVU12ZWtkSmhKSy95?=
 =?utf-8?B?M1l2RTlEWXVzblFRN05FVW42Z0tubHoyQ2d6SUpzcURielY2MzdUbng2dXNH?=
 =?utf-8?B?R1VqQy94TGhFNFR1d016MFgvOS9oWHdxRXphbWFadEsyZ0w4aTlzRDVxZEFM?=
 =?utf-8?B?a3pJLzRCZXpEOExFcnFBRkIzN3RncVUxNVZCNWlvaXJwbHZOTnVraXRFMU8r?=
 =?utf-8?B?alU4TWNpZUNsNGhjZDUvMTJvY0RpOWsyd3AxM1QybDhiV1N0MWxIZk9CdlZ6?=
 =?utf-8?B?TVg3RjE1VGwwQ01mNFdSMFNDVWl2eTZrZzJWYU4zN2xTOURWY1lGSmsrWDJ6?=
 =?utf-8?B?aUJ0djJJR1NJRVpDNm1vOHp5SmVoMGFXcnM5K1VkcUpPc09kaTd4akYvR2hn?=
 =?utf-8?B?ODhHU2lvdGltYWFEWWlmZWxQSHpwbkVUcUNOREgyWTltVGpMVSthcGJEN1dQ?=
 =?utf-8?B?c2pRY1g0UlgrdXpjQ0VtaVpUbzhvSVFSMlhjL0Jvc0NQSFozZEdOYjJYMjFJ?=
 =?utf-8?B?cmZSa0toZVVYdXFJZmRRNG5Oa2tqcXJ0eE1UVUJoT1Y3K2F4aDRPU3M4eEZz?=
 =?utf-8?B?ZmxKbm5Tb3lyUFZxVk9DeTNDR2w4RWFBbERLNzBLOE5RdmEwNHhKc3M3cFlB?=
 =?utf-8?B?MGwvMmg5MWUrYWN4TGp1MmhaVmdnSGFyeHpZa29ETWtkVUozRVNmMmFZOEgz?=
 =?utf-8?B?VG5LSzlSVnNqdU9SUFJzVGVsMDk1TXNKNEdkSWtuRzh5dXFoQnVDV0xRQ01U?=
 =?utf-8?B?NWtqcStIbERpWWtzWlBMV0dVNUVQOE5KY2NodEh6K1AvQkQ0U0JuNHFrM2hm?=
 =?utf-8?B?K083RW9IRmErTlVsZHd5dW5uSjg3Ymt4akNUWVR3K05sMGNuSENkcWJiVTJ4?=
 =?utf-8?B?M0prcElCTGl2eUtOM1dzcUE1MENqUXFBOHErZEduK1lSbGhQaWN5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842764ab-95df-4647-5f9b-08dedda32e41
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:16:45.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIM5wcm1JXp0hTCnQr+KAoNNSHNQJ3RhWS9JWBpRMhwzMye3qc3g5PAnBCj7j7Rycij3gGy+x7fyUrofiDAu4WCoB6XBJ9Xwqmgkn1mcl7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7983
X-purgate-ID: tlsNG-4011c0/1783592209-CF537DDE-625237CC/0/0
X-purgate-type: clean
X-purgate-size: 3044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[citrix.com:server fail,lists.xenproject.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 406F072F7A1

On 09/07/2026 8:43 am, Frediano Ziglio wrote:
> @@ -649,70 +649,35 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
>      return 0;
>  }
>  #else
> -int writev_exact(int fd, const struct iovec *iov, int iovcnt)
> +int writev_exact(int fd, struct iovec *iov, int iovcnt)
>  {
> -    struct iovec *local_iov = NULL;
> -    int rc = 0, iov_idx = 0, saved_errno = 0;
> -    ssize_t len;
> +    int rc = 0, iov_idx = 0;
> +    ssize_t len = 0;
>  
>      while ( iov_idx < iovcnt )
>      {
> -        /*
> -         * Skip over iov[] entries with 0 length.
> -         *
> -         * This is needed to cover the case where we took a partial write and
> -         * all remaining vectors are of 0 length.  In such a case, the results
> -         * from writev() are indistinguishable from EOF.
> -         */
> -        while ( iov[iov_idx].iov_len == 0 )
> -            if ( ++iov_idx == iovcnt )
> -                goto out;
> +        /* Check iov[] to see whether we had a partial or complete write. */
> +        if ( len >= iov[iov_idx].iov_len )
> +        {
> +            len -= iov[iov_idx++].iov_len;
> +            continue;
> +        }
> +
> +        /* Partial write of iov[iov_idx]. */
> +        iov[iov_idx].iov_base += len;
> +        iov[iov_idx].iov_len  -= len;
>  
>          len = writev(fd, &iov[iov_idx], min(iovcnt - iov_idx, IOV_MAX));
> -        saved_errno = errno;
>  
>          if ( (len == -1) && (errno == EINTR) )
>              continue;
>          if ( len <= 0 )

You can return -1 here, and ...


>          {
>              rc = -1;
> -            goto out;
> -        }
> -
> -        /* Check iov[] to see whether we had a partial or complete write. */
> -        while ( (len > 0) && (iov_idx < iovcnt) )
> -        {
> -            if ( len >= iov[iov_idx].iov_len )
> -                len -= iov[iov_idx++].iov_len;
> -            else
> -            {
> -                /* Partial write of iov[iov_idx]. Copy iov so we can adjust
> -                 * element iov_idx and resubmit the rest. */
> -                if ( !local_iov )
> -                {
> -                    local_iov = malloc(iovcnt * sizeof(*iov));
> -                    if ( !local_iov )
> -                    {
> -                        saved_errno = ENOMEM;
> -                        rc = -1;
> -                        goto out;
> -                    }
> -
> -                    iov = memcpy(local_iov, iov, iovcnt * sizeof(*iov));
> -                }
> -
> -                local_iov[iov_idx].iov_base += len;
> -                local_iov[iov_idx].iov_len  -= len;
> -                break;
> -            }
> +            break;
>          }
>      }
>  
> -    saved_errno = 0;
> -
> - out:
> -    free(local_iov);
> -    errno = saved_errno;
>      return rc;

... return 0 here in order to drop the rc variable.

I can adjust on commit.  Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

~Andrew

