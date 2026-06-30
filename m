Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5bUZGWujQ2pBeAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 13:07:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4476E358F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 13:07:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=HatmfD1C;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348686.1606415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weWIz-0007Q0-HZ; Tue, 30 Jun 2026 11:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348686.1606415; Tue, 30 Jun 2026 11:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weWIz-0007NH-EJ; Tue, 30 Jun 2026 11:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1348686;
 Tue, 30 Jun 2026 11:07:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1weWIy-0007NB-Ek
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:07:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weWIx-005TN4-BR
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:07:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43a34b-5cb7-0a2a0a5109dd-0a2a4503a5e8-44
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:07:03 +0200
Received: from [52.101.62.18]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43a355-ec1a-0a2a45030019-34653e12ef98-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:07:02 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN2PR03MB5168.namprd03.prod.outlook.com (2603:10b6:208:1ec::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 11:07:00 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:07:00 +0000
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
 b=J40zhUQQmxQSxTmKTa2KxpzppyhE/C7XkWf5UWVwk5xXGUkF+CJuZTaXVer53/cTgaaFcU+oM8oO4Ish2RI0kzokpURdNiiRQifiL+vgAzCB/Wc3MiRi3Z0sMNNwOvcN+2dXgnVEwswOCdlCKbeHfnHvIylXI7RbgeT87E6QI8b1EC2ZSG82maSduAfNiOXDWwrTM7QBjlCyYCY2kAFF+TKUT/kZwr8udemqy5epbQbazvgHGsUtEe3zoiRosZRhyhmDExqJBbfLYBggS42I+DpH6o6To32mJxLf6ttXymdMAwBij9U2wYhqEpgDpYz0T8A/ShHg5floka+4zeBmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvf9RsPqmfYIpG+M0Bg5ZXSwrXuZ6/AtcERG78C6pb8=;
 b=Lp5GphUEDFnrBTcKJCpEuakF0ZgF+OUb085IyWFjHMEkYbu3CAE921R0WKw4dAF38vz2Hkq3uiP3FfDXC2gs69nOiUazlrCtdMY8FHxPI4ZrHNDv7ADvd9iv5+TmyKjbzPZ5xcjvs+HiFTKnW0FRxp28vdLk5+TvC8LrYGrdDAv6yyzX7f4bM/YIHhCLg+wC+LcIIuz22eNkHTjcX+Q+LOpvj1fXF69FfZw42lZZwOG/MbViJYgsMF6NB2C5XNASsF3vlf1TtQ25LnJaAvqNCcJvyzIP/eq4YS3AzChZJYZgfIUBHDGg1tnv7S5m2mQSQZw5hEm3R8jSo0DMGGpFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvf9RsPqmfYIpG+M0Bg5ZXSwrXuZ6/AtcERG78C6pb8=;
 b=HatmfD1C/ZZn1d5SQBjwi+AJHSe4vzlF9vggFz+FJsq1uxleP61ok8tUOEGSIUNtkXtqikRqwYKP5oRWuXWZ78yieAvRhsbqAsbXy/fJmT7/QKz5oQxofEvwVgWtErfz9KP6YAlDfDO0epqx8ilYBZiifCK2sKQiqzmpcCtTo2w=
Message-ID: <337c18ae-1018-415a-a1da-ea65dd59fa73@citrix.com>
Date: Tue, 30 Jun 2026 12:06:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 5/5] x86/boot: Exclude not used string
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
 <20260626123645.229375-6-frediano.ziglio@citrix.com>
 <103263ef-3f09-498e-a901-2d5379f8ca5b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <103263ef-3f09-498e-a901-2d5379f8ca5b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0281.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::16) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN2PR03MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: be325356-05f5-4e95-e3d7-08ded697b508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f6q1ODZ35dTOjvd6tth0XN/2NWmlo+TU9o79ANQwSsUlSG6ChZ8VG9+6zKTK2UV6oI8tXzr+cZFLNHkTwT9h6pduPrdWb4YRo5qQOU8v7lV8fqKtLP5gIrbDtDn8RnT2VgmvR8shfdCbaOXDMeyUzyxZL0j4u87RnzZnwv9Pmf3KfpEngNp0LzUTlpiN1eU5E1ngRDH1b1Rs4Ij447u4awPOK8hXmUIH+qinvenA5cAyDizNk7qQospTaINZyFMJKq1Da317uKuGoQvY57DA5vqBQIHF/KPMnMFB02AvmSDyaNwJSQ8GZaXco31SJqjRehF3XqoYe+EVGbwAxNbm6dMEuBADSkyQ3AT7e2L8y2Ogh2g0ptP8VVNJ51aDfpwCIU+npXVcLk2/7LCOH6i+b2XqyVVJfU4KBETCOEeUt8Hua3Z8Of7V0SPJNwMMG7S9arrXxxX1SfjLKg38xh/BV0mU9AjPip/AmjrQVRD14nkCn0VmFC/TkwFK8o+Yi497qQ3ZBHZXcIh5jfAkrZIw8qDHHbWEjeb6tom0F51Ppu3D8pa6/Li5oNWlKZ3aF7r0NzKilTBOZtcnvVNEGH26cMX8i/sqhPKAb1t0Q1M8k6VLHGusk8nn94Dqo6FIV5e2m/DHUuwI4pfOANRyzyYGHyoysDm8d8vGUqeVkKsQ1Uk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUs2WVJCWk1SRU12M3hOdUJMS1k0V2syQ2NycDlqNm1nTkNyMURiWGY5ZjV4?=
 =?utf-8?B?WmVYNE8xQ011ckpoWjhLaE0zeCt2aWRqRnBOcEllTE1jemJOVHM4SmlsYWRi?=
 =?utf-8?B?NGl5eVBzZnN0SzV3aDErMVY1WXk0UC83cGFHdStTV3pvUjNaOVA4aFFObmtr?=
 =?utf-8?B?dVFPMkZPRzZVNjJBZlNFWWRLZDlsNnhqeHFyMGxTcEMrMXRTYlJXS0pLREZy?=
 =?utf-8?B?R3grZWJucEQ2SGg3QVNUUXdlNUFWdjdsTXhYRjJFRFJ0Y2ZJOGN1c2Y5aXg1?=
 =?utf-8?B?NzRzN0tMVDBCR2M1UE1kYmFNQnE5bnhmWkZmWms0K2xraTdsVWdaeFFNYVAr?=
 =?utf-8?B?Y0lVWisxWFFjUkcwTkZoT3lPL1lIenNqRE53UFdRTEJzQTdDb21lY0NNbkhs?=
 =?utf-8?B?OVRBTFc5dWw2U0JGSG5NT3RlYVhoVEVZOTUxVGNMYjJseGIyazRhWkRxZjBG?=
 =?utf-8?B?bnc4SHlUSEFVLzNTMnliNlk4RzVjdk53dzByQzY0SDg4UW9uQ1dmdGF6U1FB?=
 =?utf-8?B?OGVWcURiVXlDbk51TEJzcGNHYnVOS1N3UmNkdzdkZmpIODBSSHZBdXJZMmRZ?=
 =?utf-8?B?cjhOdmdHaWY1WlF4U0krZnpQdXJWeVFEdDZwRVJhYk5nZERvY291OHVUWGZj?=
 =?utf-8?B?V25uY3BPdEVETDE1SGE2R1oycWxEWU9vTUdqSldrZVJYdWh5SU9zRG1yZnEz?=
 =?utf-8?B?VkhPVEd4REpwK0llUkEzVHpEUG1BZGM5RjlEZ2ZnRnBBQzlDTXVvWnQzQ0No?=
 =?utf-8?B?UEN4Y0EzN1lOYUJQT3hUM0I2L09keC9MaUJyckp1VHlsMXNxa1pZcFBYVm9N?=
 =?utf-8?B?R1MzOThwS1cwTHpjMm9md3ZoeFpVek5FUHZ5dlB1QTc2WlFNdDlYMWlRUDJ3?=
 =?utf-8?B?NkVqU2NKVEZHeVdtemV1R3paZ3dWTnNOSmpMRm5VV2dCSnJRMEZUZmo1WTZn?=
 =?utf-8?B?cHM3WEFkSnU3aWNUVlI0TTRQVlorMHNHSHpBd2ZIUFRHWkdmYlpFMXpGVThu?=
 =?utf-8?B?SW1zTENKc003dTlZd0dRMzhUaWowQkE3bkp3NUdGWGlZNDNYMkNRMjBCUEpm?=
 =?utf-8?B?Wjg0WXhSeTVRRTNjdGJwS0p2TUhUODM4MDF2eUpFemtQeTNvMmJqcE5jaVZx?=
 =?utf-8?B?RHdSckRXczRPTFNyNGN4M0xNeHFJM1VRZnI5U2E4SmZtVmdXL2N5RjNlRzE1?=
 =?utf-8?B?YXdQSGh2VEJTcDR4SVFOTklaTTZiUzZRNkdzL3pPT1Z5RkRaYUxkcUExblJP?=
 =?utf-8?B?SnlQRXp6b24xdDMxdXVGbkJBTmhYalVTSHU0QVBxVDZYcWhOZGhNWTBnRXFa?=
 =?utf-8?B?YlZtZDBHeVFNOHBQRmdPMzA1SnpSS3pJSWlYSXcxK2Vid3F6YmxidmxpNUcy?=
 =?utf-8?B?U2Z2djhwa25DL1ZQMFEvUHBmOVh0SEJDMnk0YmtjTC83akdXeEZvdllMU0w4?=
 =?utf-8?B?NG5DWUloTXR0d0JXakhMSkxSMVNJWkdSdG1TcVFPaWJkM2pGUlkxYkZuTEhX?=
 =?utf-8?B?TnVnUzdDTkNBeENCRnhIWW8rS2dmbDZGcUN2bDRiV3cvV2dHMVJVSnVxV3Bu?=
 =?utf-8?B?WlZtZStaYXc4bUNTZDFqQ01JRVQyeE9DY1YyOHl2aE03eEhMYUlES09wWkt5?=
 =?utf-8?B?WkhwWDZIeGhQdXhwbU9QNUJTTVRZSDFneEdPQm04cldhSndNT2VtTzdUTFl1?=
 =?utf-8?B?QXh0N2NCaFpxN1lCWHYrOFlxbm9XR0N6c00zSHA5Z0tnd0lGbE53QjVRcnE5?=
 =?utf-8?B?enVqTytRWWFoNUdjK3FVNTkzd0pQbU5SSnNSMWZzYzJ1WVVvTGl0ZFRLUVJP?=
 =?utf-8?B?a0ZEdGloM3dBdWluTVhINVFLVUlJQS9KcExlNjAyREVUeW1Mb2JlNEh1NHJR?=
 =?utf-8?B?ZCt0M0NaRklaQ1ROaFlpc1lhZkVQY2JPcDdVN1U3VUVYWEdOTHhFWG1LRExY?=
 =?utf-8?B?WndlcFpGeHQ5aGNHM21pTzdoZUw4QTA4b2V3WjVsTC9BbWcyYis1TS9hWVZy?=
 =?utf-8?B?bzhzeTRnRFQwS0RnYXZMRHJiazE4SHhnKytMTGNJc3JHM0RONkw5eVFFWmxz?=
 =?utf-8?B?OWVoZlArK002TzJ5UDZtT29ZRVRJQUVwV3ZHTnlQd3JVYkE3NS9wb1hmc0Np?=
 =?utf-8?B?YkdnZ0NQV3o4cXlpeDNWWm9qM2picVh5aVJCR3NkSndjQlpDT2p2NW9hL3lJ?=
 =?utf-8?B?aGdTM29oa29TM2d4ZmN1R283SzVZeUxsVkxxQVNLdzJ2SldZam8ydzZwTkxy?=
 =?utf-8?B?YlphYXg4aDduR21LaWtvVno1Ti9sZUxoS3dhL1RQaWthNC9XNTErT0tTQzJo?=
 =?utf-8?B?VDR6YWZtUjRXMm9wR2JDeWJXUjNFUzJGOTZmY3ZNZG5kSkc2eitxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be325356-05f5-4e95-e3d7-08ded697b508
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:07:00.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwA1GrOSlZCJzwJGRchZq1sHKMPBM6fQFPQCaFCRIPoXYlqGhhLWudqxsLDK+zTJBpjDUATNvL7Z1Wt9pX+a1V6E14c2ZXYD6zsiif8qkbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5168
X-purgate-ID: tlsNG-33051d/1782817623-05F325D1-5F13EECB/0/0
X-purgate-type: clean
X-purgate-size: 500
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB4476E358F

On 29/06/2026 2:59 pm, Jan Beulich wrote:
> On 26.06.2026 14:36, Frediano Ziglio wrote:
>> If CONFIG_REQUIRE_NX is not enabled the string is not used.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

I know you're both trying to be helpful, but this patch really isn't.

You are both aware that I have a full series about NX handling in
progress, which deletes more than just this, and also needs backporting.

~Andrew

