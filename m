Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F+vNk43vGl3uwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 18:50:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0B2D04B3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 18:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257477.1551866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3HUx-0007SW-Ty; Thu, 19 Mar 2026 17:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257477.1551866; Thu, 19 Mar 2026 17:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3HUx-0007Pi-Qg; Thu, 19 Mar 2026 17:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1257477;
 Thu, 19 Mar 2026 17:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkR1=BT=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1w3HUv-0007Pc-Jo
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 17:49:30 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f97dd9-23bb-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 18:49:27 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:49:24 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 17:49:24 +0000
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
X-Inumbo-ID: f8f97dd9-23bb-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDtXr+16Z/XhtdCCgCgVJzb4+xbqT/aTm5rxujZIuSaopVI9v1Dj0zqX+kCvOqUR9zObNE1KfMnvV7breV+15kuraJxOW2SFV1p+0GradGojqVI5zBjuSfUGrpE9Hhd7Ly/1EYfQ1awyGV2yWQA5q5hOYshl0AUiCcyW1fbqmOTVOg5ufhoJxnzW08TzJUIV6YXSaZdMWNhNNTR0f4FvIiMsij0IJeDY41MZC/UiPpMqatjrhUbJMRPHVi9see+7tZ+f6rN3UOrpJudv9B7jYgZaZVp0ao0YYD26X7JBBz7phZSAlBCVX8Az3UR1NBO1s17EvQXq95RKW7wbKMY51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiV4OJ9RkuDFcSi2lKHDcz1LCfVpgQ9ioLTRJwYNCTs=;
 b=uJA8yzOpB//TgOQ4UWR2An+6PZygbCTgW8v5wgdYTOrdkkh6tu8kMU0iRqUJLg5tDuzllEcIw9ENPTJa/nZ5Ywoo4XXlB/tcPp5AUEYViGEwwBtP0fDI+NDt/D7eygYJyPcD3c8v/u0LbvkoNlf9dVOC69UoCXPoM5pRaeGwquIUZH/QjwrxcisXNtsPUYrFxAku234HUuNzkhntAsHxHGov7ea3R6MQUxkjTVK5RgShcRclbchMUom0CF/tm5nWpaTgo4fCzckOQ39leUoauL1pMXy2qUGGhNxvsblvVrcocA/lb0dnVRlFSTzK0f2C8SHL6lmRx6ysf23j6KHW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiV4OJ9RkuDFcSi2lKHDcz1LCfVpgQ9ioLTRJwYNCTs=;
 b=TAt4NaLFLjb+UIN7UZ1JW5wpQhHios/8RO7mNN2M3xTURzaS38k3q70qU8x9vL20GdDRR9KI7Pit5lFgJoNPS99cpSdEHGqwD3SMiiutzu21TPcmuduBBItLwYiKuU25Z0k48042Ctm4W/uvG97GRTnWC08G0xkOs0Q5X8NPb3KH3MkMjIaQJMwcrPaMgRhiXWnUnVp3W8hCim6eFkJMPJ38g/+ZnefVsFOBfb/kR1Ia/vcp0ZmWV0/kx6HEtT8t26PcJ52Kk+4ZZabCfAU8kcqHxUoWGGOlPFflgxIr3VfnLId+OjRRmDtxzxV5kn/9Vhq69uAVvi6CkzaO+bJ5sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Content-Type: multipart/alternative;
 boundary="------------ZnOiZ0itnUU4M7pRjwde1saL"
Message-ID: <1c0f5bc3-5e04-4043-b950-bf9af10bf720@epam.com>
Date: Thu, 19 Mar 2026 19:49:22 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com, mengxu@cis.upenn.edu, gwd@xenproject.org,
 andrew.cooper3@citrix.com, julien@xen.org, jbeulich@suse.com,
 tiche@cis.upenn.edu, tiche@seas.upenn.edu,
 Stefano Stabellini <sstabellini@kernel.org>, dario.faggioli@citrix.com,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Subject: [RFC] RTDS scheduler: potential issues found during safety analysis
X-ClientProxiedBy: FR4P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::16) To PAVPR03MB8946.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8946:EE_|AM9PR03MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 74982772-32e2-4540-af1a-08de85dfdbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|8096899003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Bb3GsSKhiZC2KJlc1ks9HCU+KIAnX9tdrHnHyaKDlk+/zKdYcvQNEFUr/8wafzS1tlT3rxlB7FJiq0oIULtOYF+G24eozvkUwcE51gNmTkPmlXpgEjdt4LeHVQkb/13UmNm+wyejZYUW1iqd4OMeNPBPj5UBzcG6GPib+HxeutM4NhIwkJNMJ4dL8Ei9pgziW8lArDNpKsN7vOjycfTE2dj6zIpNCLK/TnFbgXp5OhYPVwBDc1l5ptm8EuWdgm43BxBQgzoXJHSc0NLTRBxcIGEup43sj0JU/gjlCVR0N4FoNCMGPW6Q9xc6oilZqG/v+gQIGaN3WTiMqn+tLDYPweG4CMSv5UChqHoO8sKy8gkr7Zu2JoE3vAg4jI0yKR+5fuqjVndo4QWT+CnVhQMRZhPWXRztqB2uqmvQxEck08IY1GecSXTuSBlH1ARlinFcy8nzjGBTZIrBTCbXby+vsn6BEm4uhw1m4ZjGSIupFqdmNnYqwghJceON5pnpyKyqzf5hshJyQ3XzSDW5+8oPbRvwoRRoQ0qeQiwdXRQQHBKNGjpNhOhGvfUgRQT9QabqEkUy2ad+pDvdpw9Yv8pOYNmzi22VIEsreYBCNdwHBzVgXsgs0x1Z5j411t52B47SFNhO3CFs2j4dmX38WIJ51FzmGlq7GjXHQPJo9Trb7yD6jLM6KNmpyhLTCHQpyT5DogFKYTEX2KYfqeiTS6/SfHY8XrKP/+gYcdtURINYDkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(8096899003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnJhUlFaQzNQNFZlelBlMm0rYWl2MFl3cmhMaENkYmZzOE9RUGZJTk9BbzBw?=
 =?utf-8?B?ekRIUThaaEMzNkdRQVdkb1F2cURlcEpqMEhSeitTVmdBUG5qUXE0SDlaOEsw?=
 =?utf-8?B?Y1JJK1pDMFpkeEpwOE55bFg5R2U1N1RiMkQwQi9Cc3NiZmlsb3VNN2IxRjU0?=
 =?utf-8?B?RW9NSi85VFJMMEIzWGs5VXF2a2tWUVFwSEtCYzBlR2hjTkpScDNnckdUK2Qx?=
 =?utf-8?B?RHBncmw3VmI3S1RSRjYwUVlFNTMvQ0NtaFR0Vk1WQ3pnWmJmNjFEVS95NERS?=
 =?utf-8?B?WXh1bHVXbERPYzFYYTdIRjVyZ3ZBcUFlNEZpTjV6SUR4UkNLOURxRDRGYVFr?=
 =?utf-8?B?a3dYak5Xbk16dEFsUWd4Zy9JZ0N2enV0TDNyOXZxTVJmRng5eEFMcTFZdVp2?=
 =?utf-8?B?YnhLYWlmZmdwWVFJUUR4SGxxSkhIUDJKSU1qVTMrbUxiSmwvRHZiSCtRZXZ6?=
 =?utf-8?B?b2c0ODF0Q2J1T2xXRXArTXR0aStmOFNreDAvaDNkRlAxTm41dkVQTmV0eWE3?=
 =?utf-8?B?bFdFemM2S0VKMXZnWFZiRUNDZTc5WkluTzk5WHU3U3JQYUlqc1lkVjFlZEVw?=
 =?utf-8?B?K2dQTTQ0THc0QjNRMHM2V0tnRDh1b3dOTXFReWt5MlJCRTBUV2pzVXA0bVE2?=
 =?utf-8?B?VXNyakxzTkV4VkdOZ2U2MEZRTEY2amtYWmVTUFBvbXNyN055c2hLZy9ldkNr?=
 =?utf-8?B?aGtxNGMvRmlqOUJ1M09sWU1VanhLNjREL3RjL3BocUdiN21Sd1BBblhybmJm?=
 =?utf-8?B?MFBkMG91UFJ6Y3VmdStLUWlkdVU0enpWY1VxNzFybENDOVIyMVBiUy8weEs4?=
 =?utf-8?B?aENtaXVzZVBXejJ5eUJ2Z1I5bGhoTlN5dU1vZzMzWis3MjNvQkVlVnFaclVH?=
 =?utf-8?B?QVhLeUozY1Y4ZzZGd2xYNGtqM01rMG9reDZUQ0dUOU9IL0JZeENyVmFlbm5p?=
 =?utf-8?B?YktrbktLSFVKRHVtaWo4S2VUYzV6K05vYXVGSEx4M24zckswSE0zK0h0SWRn?=
 =?utf-8?B?NTlYY055czY4NmFWL1YyTDRvcmk0RWc4SVVCQmZuRW5CdW15eWRhVElEOXBn?=
 =?utf-8?B?ejNYRzBuaURJTXY0cGxqb3ZIVitGT2NWd2I1b0twR0c4a2pVZ3g0YkNkU1B0?=
 =?utf-8?B?TlhTTGMrQkVyKzhabVRHMHgzN1ljNklrZGNQNVZZQk1wMTV0dkNHN3lUcWUw?=
 =?utf-8?B?alR0ektza0FGQVlkOW1KYkxxM3FjL254U1ZMc2hlejZ1N1NvbXplaURXL1NZ?=
 =?utf-8?B?aGMvWE4zK0E2THJNR3l5ZFBlN3VTbE1RK2lFc0VQOFY4M3dYVzk0R082UlFs?=
 =?utf-8?B?bVNVR2lTSytjUmhYY0FZeklOUEVuTlhha1VtcmVGQ3V6MEdEcjRwcFlXajRN?=
 =?utf-8?B?ZXdBeXF6dTdEdlREUkpaU0txK0I5RnhHa29hb2QvekFxQUdnRDJCNTdTNS95?=
 =?utf-8?B?Ym9XWlY1MFl5QXp6TmFONDVOYjluRitudnI2d2N2Vmhia2V1c25oeDdMUGwv?=
 =?utf-8?B?TlcyYk1BRyt6WXV6cjZrSUcwK1NpTkRzQzlsM00rT3NnM2ozL0hJN2Q0a2JZ?=
 =?utf-8?B?bFlQdFFsRFNtVzdGZDNHY0JlektETytLSE4wNmozNVU1dGVLYUFvenhZemE5?=
 =?utf-8?B?cU9LSTJZR3R1czRFa1R0UG9MaVhPYjlXM2VxbjFlVXNZM2JGWVhvMlBaVTRk?=
 =?utf-8?B?UXJRa1VISVQzbzJ0TFRQQ3JEYllvWVlTeFhFdXlaTzBYbUlmZnlMaVpqNFRK?=
 =?utf-8?B?a0dvV0x6NmVma0tMNUx5NEtKek8zYjhDbE5WcE5TRlliZkJIa3lPWWtmRXV0?=
 =?utf-8?B?U1FacEdQWnZmUjRiWkZmZDNwZTU0c0NVQVVUVG9SSzg0M0czaGZvbmFMY25v?=
 =?utf-8?B?a2kwSlF4MUxrY01jaWNzOFA2RWJTRnp6bElpYVhFVC9DY1hKMmlkUlA3Qzgr?=
 =?utf-8?B?dWNpSzhKNSsxVGtZcC90TjZERlJIa2tDaCt3RDZCVGNJSnFseTJCZWtFR0lU?=
 =?utf-8?B?OWJyYzJpNjk3MHIzZ0Q1UUxMQXFySHBTK3Evbytxb1RoM3hhVXd5a3FqYytW?=
 =?utf-8?B?ODA2MHR5eHBjV3p1NkRNbklMMTlHUWdaTDFNTHFvY2x1eXhacitSNW5BWklO?=
 =?utf-8?B?aGpjampwL00vOGpvNDRvRU9jMlNRRmhhUDVmZEhtRGNQM3NRMHpNZ09TSlZR?=
 =?utf-8?B?TWRLeDd3RnIyTlNxRDdieEplRVg0bjNTTmVCYS9TVm9XYWdiNXNoYzZjd2FY?=
 =?utf-8?B?aHpNc0pIak5CY084c0ZGaENnVjJWYlpLVFcrMmp1NFRqSy8wdVU5VkpacS9Z?=
 =?utf-8?B?KzNMRDRDcVAveWx1UmJ6MlppcVhjVTZNNkJveDBoWkN4alY4anlUdHMrN2ov?=
 =?utf-8?Q?Jd9owrhUoaGjlr+w=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74982772-32e2-4540-af1a-08de85dfdbb4
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:49:24.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StIX3svKupBA4OYWHiPK/s9JumZRCmr5XLMkMlNsQ+V/hPe4FjkP4TXYlOTC1ydKJIt0nH64fbSFuZZxCpklG5NLjASCW8pC4ng0QxvlTtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:mengxu@cis.upenn.edu,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:jbeulich@suse.com,m:tiche@cis.upenn.edu,m:tiche@seas.upenn.edu,m:sstabellini@kernel.org,m:dario.faggioli@citrix.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 22C0B2D04B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--------------ZnOiZ0itnUU4M7pRjwde1saL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
We have been performing analysis of the RTDS
scheduler code (xen/common/sched/rt.c) and identified several potential
issues that we would like to bring to the community's attention. We would
appreciate your feedback on whether these issues are considered worth
addressing, and if so, what the preferred approach would be.
Below is a summary of the findings. All references are to the current
upstream code.
1. Inconsistent validation in domain-wide vs per-vCPU parameter update
----------------------------------------------------------------------
In rt_dom_cntl(), the XEN_DOMCTL_SCHEDOP_putinfo path (domain-wide
parameter update) only validates:
if ( op->u.rtds.period == 0 || op->u.rtds.budget == 0 )
In contrast, the XEN_DOMCTL_SCHEDOP_putvcpuinfo path (per-vCPU update)
enforces stricter checks:
if ( period > RTDS_MAX_PERIOD || budget < RTDS_MIN_BUDGET ||
budget > period || period < RTDS_MIN_PERIOD )
This means the domain-wide path accepts configurations where budget
exceeds period, or where period/budget fall below the 10 us minimum that
the per-vCPU path enforces. Such parameters can lead to scheduling
overhead issues (very short periods) or over-allocation (budget > period).
Suggested fix: apply identical validation constraints on both paths, i.e.
add the same bounds checks (budget <= period, period >= RTDS_MIN_PERIOD,
budget >= RTDS_MIN_BUDGET, period <= RTDS_MAX_PERIOD) to the putinfo path.
Additionally, the putinfo path does not handle the extratime flag at all,
unlike the putvcpuinfo path.
2. Priority level overflow for extratime vCPUs
----------------------------------------------
In burn_budget(), when an extratime vCPU exhausts its budget:
svc->priority_level++;
svc->cur_budget = svc->budget;
The priority_level field is declared as `unsigned` (32-bit) and there is no
upper bound check before the increment. While rt_update_deadline() resets
priority_level to 0 at each period rollover, for a long-running extratime
vCPU that continuously exhausts its budget within a single period, the
counter could theoretically wrap from UINT_MAX to 0. Since priority_level 0
represents the highest scheduling priority, a wraparound would cause the
extratime vCPU to suddenly preempt vCPUs with active real-time reservations.
While this scenario requires an extreme number of budget exhaustion cycles
within a single period, it is a concern for long-running embedded or safety
systems that operate without reboot for extended durations.
Suggested fix: saturate priority_level at a safe maximum value (e.g.,
UINT_MAX - 1) instead of allowing unbounded increment.
3. Replenishment timer loss during CPU pool reconfiguration
-----------------------------------------------------------
When the last pCPU is removed from an RTDS CPU pool, move_repl_timer()
kills the replenishment timer via kill_timer(). When a pCPU is later
re-added, rt_switch_sched() re-initializes the timer object (if status
is TIMER_STATUS_killed) but does not re-arm it from the existing
replenishment queue. If the replq already contains pending entries, those
replenishments will not fire until some other event explicitly calls
set_timer(), potentially stalling all non-extratime vCPUs.
We believe this is actually a broader issue that goes beyond the RTDS
scheduler: the common cpupool infrastructure probably should not allow
a cpupool that has assigned vCPUs to lose all of its pCPUs. Preventing
such a state at the cpupool management level would address the root cause
for all schedulers, not just RTDS.
Suggested fix (RTDS-specific): when timer ownership is re-established
in rt_switch_sched(), re-arm the replenishment timer to the earliest
deadline in the replq if the queue is non-empty.
Suggested fix (common): the cpupool code should refuse to remove the
last pCPU from a cpupool that still has domains/vCPUs assigned to it,
returning an error instead. This would prevent the problematic state
from arising in the first place.
4. Missing scheduling notification on vCPU insertion
----------------------------------------------------
rt_unit_insert() inserts runnable units into the replenishment and run
queues but does not call runq_tickle(). In contrast, rt_unit_wake() and
rt_context_saved() both call runq_tickle() after runq_insert(). This
means a newly inserted vCPU with a higher priority (earlier deadline)
than currently running vCPUs will not be considered for execution until
the next natural scheduling event (timer, sleep, budget expiry), which
can delay scheduling by up to one full period.
Suggested fix: add a runq_tickle() call after the runq_insert() in
rt_unit_insert(), following the same pattern used in rt_unit_wake().
5. Stale scheduling flags on vCPU removal during context switch
---------------------------------------------------------------
rt_unit_remove() removes queue membership via q_remove()/replq_remove()
but does not clear the RTDS_delayed_runq_add or RTDS_scheduled flags.
If a vCPU is removed while it is being context-switched off a pCPU (i.e.,
RTDS_scheduled is set and RTDS_delayed_runq_add may be set),
rt_context_saved() will later clear RTDS_scheduled and, finding
RTDS_delayed_runq_add set, will re-insert the removed vCPU into the run
queue via runq_insert() + runq_tickle(). This results in a stale vCPU
reference on the scheduler's run queue, belonging to a domain that may be
in the process of destruction or migration.
Suggested fix: in rt_unit_remove(), explicitly clear RTDS_delayed_runq_add
and RTDS_scheduled flags after removing queue membership, so that
rt_context_saved() cannot re-insert a removed vCPU.
We would appreciate any feedback on these findings. We are happy to
prepare patches for any of the issues the community considers worth
fixing.
Best regards,
Oleksii Moisieiev


--------------ZnOiZ0itnUU4M7pRjwde1saL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div style="color: #cccccc;background-color: #1f1f1f;font-family: 'Droid Sans Mono', monospace;font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><div>Hi all,</div>
<div>We have been performing analysis of the RTDS</div><div>scheduler code (xen/common/sched/rt.c) and identified several potential</div><div>issues that we would like to bring to the community's attention. We would</div><div>appreciate your feedback on whether these issues are considered worth</div><div>addressing, and if so, what the preferred approach would be.</div>
<div>Below is a summary of the findings. All references are to the current</div><div>upstream code.</div>

<div>1. Inconsistent validation in domain-wide vs per-vCPU parameter update</div><div>----------------------------------------------------------------------</div>
<div>In rt_dom_cntl(), the XEN_DOMCTL_SCHEDOP_putinfo path (domain-wide</div><div>parameter update) only validates:</div>
<div>    if ( op-&gt;u.rtds.period == 0 || op-&gt;u.rtds.budget == 0 )</div>
<div>In contrast, the XEN_DOMCTL_SCHEDOP_putvcpuinfo path (per-vCPU update)</div><div>enforces stricter checks:</div>
<div>    if ( period &gt; RTDS_MAX_PERIOD || budget &lt; RTDS_MIN_BUDGET ||</div><div>         budget &gt; period || period &lt; RTDS_MIN_PERIOD )</div>
<div>This means the domain-wide path accepts configurations where budget</div><div>exceeds period, or where period/budget fall below the 10 us minimum that</div><div>the per-vCPU path enforces. Such parameters can lead to scheduling</div><div>overhead issues (very short periods) or over-allocation (budget &gt; period).</div>
<div>Suggested fix: apply identical validation constraints on both paths, i.e.</div><div>add the same bounds checks (budget &lt;= period, period &gt;= RTDS_MIN_PERIOD,</div><div>budget &gt;= RTDS_MIN_BUDGET, period &lt;= RTDS_MAX_PERIOD) to the putinfo path.</div><div>Additionally, the putinfo path does not handle the extratime flag at all,</div><div>unlike the putvcpuinfo path.</div>

<div>2. Priority level overflow for extratime vCPUs</div><div>----------------------------------------------</div>
<div>In burn_budget(), when an extratime vCPU exhausts its budget:</div>
<div>    svc-&gt;priority_level++;</div><div>    svc-&gt;cur_budget = svc-&gt;budget;</div>
<div>The priority_level field is declared as `unsigned` (32-bit) and there is no</div><div>upper bound check before the increment. While rt_update_deadline() resets</div><div>priority_level to 0 at each period rollover, for a long-running extratime</div><div>vCPU that continuously exhausts its budget within a single period, the</div><div>counter could theoretically wrap from UINT_MAX to 0. Since priority_level 0</div><div>represents the highest scheduling priority, a wraparound would cause the</div><div>extratime vCPU to suddenly preempt vCPUs with active real-time reservations.</div>
<div>While this scenario requires an extreme number of budget exhaustion cycles</div><div>within a single period, it is a concern for long-running embedded or safety</div><div>systems that operate without reboot for extended durations.</div>
<div>Suggested fix: saturate priority_level at a safe maximum value (e.g.,</div><div>UINT_MAX - 1) instead of allowing unbounded increment.</div>
<div>3. Replenishment timer loss during CPU pool reconfiguration</div><div>-----------------------------------------------------------</div>
<div>When the last pCPU is removed from an RTDS CPU pool, move_repl_timer()</div><div>kills the replenishment timer via kill_timer(). When a pCPU is later</div><div>re-added, rt_switch_sched() re-initializes the timer object (if status</div><div>is TIMER_STATUS_killed) but does not re-arm it from the existing</div><div>replenishment queue. If the replq already contains pending entries, those</div><div>replenishments will not fire until some other event explicitly calls</div><div>set_timer(), potentially stalling all non-extratime vCPUs.</div>
<div>We believe this is actually a broader issue that goes beyond the RTDS</div><div>scheduler: the common cpupool infrastructure probably should not allow</div><div>a cpupool that has assigned vCPUs to lose all of its pCPUs. Preventing</div><div>such a state at the cpupool management level would address the root cause</div><div>for all schedulers, not just RTDS.</div>
<div>Suggested fix (RTDS-specific): when timer ownership is re-established</div><div>in rt_switch_sched(), re-arm the replenishment timer to the earliest</div><div>deadline in the replq if the queue is non-empty.</div>
<div>Suggested fix (common): the cpupool code should refuse to remove the</div><div>last pCPU from a cpupool that still has domains/vCPUs assigned to it,</div><div>returning an error instead. This would prevent the problematic state</div><div>from arising in the first place.</div>

<div>4. Missing scheduling notification on vCPU insertion</div><div>----------------------------------------------------</div>
<div>rt_unit_insert() inserts runnable units into the replenishment and run</div><div>queues but does not call runq_tickle(). In contrast, rt_unit_wake() and</div><div>rt_context_saved() both call runq_tickle() after runq_insert(). This</div><div>means a newly inserted vCPU with a higher priority (earlier deadline)</div><div>than currently running vCPUs will not be considered for execution until</div><div>the next natural scheduling event (timer, sleep, budget expiry), which</div><div>can delay scheduling by up to one full period.</div>
<div>Suggested fix: add a runq_tickle() call after the runq_insert() in</div><div>rt_unit_insert(), following the same pattern used in rt_unit_wake().</div>

<div>5. Stale scheduling flags on vCPU removal during context switch</div><div>---------------------------------------------------------------</div>
<div>rt_unit_remove() removes queue membership via q_remove()/replq_remove()</div><div>but does not clear the RTDS_delayed_runq_add or RTDS_scheduled flags.</div><div>If a vCPU is removed while it is being context-switched off a pCPU (i.e.,</div><div>RTDS_scheduled is set and RTDS_delayed_runq_add may be set),</div><div>rt_context_saved() will later clear RTDS_scheduled and, finding</div><div>RTDS_delayed_runq_add set, will re-insert the removed vCPU into the run</div><div>queue via runq_insert() + runq_tickle(). This results in a stale vCPU</div><div>reference on the scheduler's run queue, belonging to a domain that may be</div><div>in the process of destruction or migration.</div>
<div>Suggested fix: in rt_unit_remove(), explicitly clear RTDS_delayed_runq_add</div><div>and RTDS_scheduled flags after removing queue membership, so that</div><div>rt_context_saved() cannot re-insert a removed vCPU.</div>

<div>We would appreciate any feedback on these findings. We are happy to</div><div>prepare patches for any of the issues the community considers worth</div><div>fixing.</div>
<div>Best regards,</div><div>Oleksii Moisieiev</div>

</div>
    <p><br>
    </p>
  </body>
</html>

--------------ZnOiZ0itnUU4M7pRjwde1saL--

