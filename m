Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D/GOoaVBGqrLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:15:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D1535E07
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308208.1579741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBIa-0001AD-NF; Wed, 13 May 2026 15:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308208.1579741; Wed, 13 May 2026 15:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBIa-00017V-K3; Wed, 13 May 2026 15:15:00 +0000
Received: by outflank-mailman (input) for mailman id 1308208;
 Wed, 13 May 2026 15:14:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNBIZ-00017P-1I
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:14:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBIY-007uTI-9X
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:14:58 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a04955a-bab6-0a2a0a5309dd-0a2a45068a94-36
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:14:58 +0200
Received: from [40.93.194.0]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a049570-7371-0a2a45060019-285dc200dba1-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:14:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8081.namprd03.prod.outlook.com (2603:10b6:806:45c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 15:14:54 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 15:14:54 +0000
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
 b=ZPF/NNeKZQ7NcuLroFraTqdt+nziH1u7brCJ94qGTtf2GeaOraeb6OOOr7AAqQjF7hVkjYikgTAJpqbUFiVYSmo3SI8cmXkyW8vEN8weB+1LiBapAgGAGYsmnjMMhmh/USUSnzlaYtBvPWTInlZkSDaC+rv7/jWrEsmnSoJ0NkByREwdaUESw85A7no1zmABB/6c8OBuLWLET3zY3FkG3KIOXli3ZR9jR6UN3kJUDptqSJRsWNq5x1EJNlVLLVv8G9SHcp5hFIzxeLM3ac1mgTviu30qRjUl5XN+FJczCEgxokDzT5ydCunt+aAjEklJRyjyLWLxEHBkWWTokqtp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS6+p+Wyd2ELQaZoR3bXxMQfYe/VVjWierr1tPs2DB0=;
 b=ZyhC9iIHp3FnTa+3k65pfw2o/ZvFKueE1H+OZLNHFPPFgxNRFgHhjqk9+tPIaC0Q1csL597m2AxsUeULbXQWEgjrlRJ6NuVsKMyfcTZ8Tl7yVFYizSgyUB2x31nSFTU69L9FLM6pthwwl1wrxIqdSDy03xoJCWUCrV+ruQazvL0WguSM8O7OTo3E/8jNcE3NdUsgkpjbs9zmk/ATe4HPOBWE13qdp67nJJbMBrCcVLpX2+9VMBNW/7BGajv6LiQzH6Sr2EigrVLmjpDUAf0Mmej3FU6WoM2kX6bf9novDfR3LMDASjgEYMEqfsjq25Y6j1lwCGkt1cZUGNRnm+Kkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS6+p+Wyd2ELQaZoR3bXxMQfYe/VVjWierr1tPs2DB0=;
 b=Wv1BuoR/FMUOgENKuu1lzrLg127ZxGOokr36JUeyuWP2RKeOD7ZJD5mQym4i9SBZhD0BtlRYYlzVaT8eBMbJmsEBlgbpS01u0NGf2sf5fAfZm13abziNK45y5Vms9h6VH/qiCJur+NchaFKNtBGhoNLK21GRgv2OBwUO17wkjhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 17:14:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 3/5] x86/vRTC: support century field
Message-ID: <agSVa3uPHSZrszjz@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
 <agSJlh8KQ9orL6wC@macbook.local>
 <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
X-ClientProxiedBy: MR1P264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b272c1-1252-4b60-eb70-08deb10262fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mLFCpFFRDHQqZHSw7xsviZxd318OPS5sXUvZlieqav+Xp5uv12ILqiNOI3Jc1UKDHlz3oz8x7q6Fu0Ro34SMUosVL2odqZrogEWzEGh0LlRjWmeXdGwoO6kO2LgmURAvs68sJJHxPBkWE/JR8lTI9pDPEntpIXRO3JD5EDJIuGIo3xVrP/uZZP3o8sLeCUMH8Pdplv4Zv+et3HpY3Va3W+5fBwO8lj0XryDfgar7OLe8HyfSOLJdgfu9xJS3QCXu2AVxwOV2FupPoYChZK2OhU0Tz94/7LANU8FSISr0ZJOmWr28dDf7In9qwfj55+9MSBGYtKwVe5TL/xGWM6U7j0AXGwoR9qr2weRv6Inr8+aXILtWGOKoJsBTpSJ1e+a7cw2PlyAKqaxzkSl7+4Zy22NoXIRo92JJOD92BD9Jwb97IZnYB625YHkhLpeUMZb0aBTHJm1NGZ/DOUDl9wZqMSjR82f2jdbJAcs0pXyKlS4rMWZ3Ex13iTTp7JHZ0+COeLdB5UnEbFT52PGRRWxL7Tims0AWxIk3gz7c2/8/dqe7mHonFQp84goLoT/JBn/Sxa45JfLcL1cAutOCFQiOBnlsBzzq8lgbSlHoH8SndyRgjszzwYWAWM8YAj5Zk1Ak+ieTZMsniXXpNUnVLAd4yFdeqgS/TmCp25KKB6PISLbezTUW/rhfr3owh+jrKNhY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3pvQUt0R09MNm9lSlNKQkk5bTlUaGxnT2tVWVZIQ2s1ZkpOWm9HUkdoYVRN?=
 =?utf-8?B?NHJBVVpYYUR6bFcwUVl5K25rUVRLMFY2ZG5nb0lYMDJoRGd1QVM1NDdwdDVa?=
 =?utf-8?B?Q0srSXNwbytpekJOMWpQeDRVSXdPL3ZRNEhhLzhkLy81UG4zaW1hTS9rVUNz?=
 =?utf-8?B?VmI5Vm9PQnpiVUN3WkNkSnhISkhaZHJFVVVuc2NuamNwdlJwNm1MdG9YeEJC?=
 =?utf-8?B?MGUxb0UrZWdPOUN4S2dkU0ZzTmdpSy8yZFRUTUhZbFF1ZFR0ZWYxNzZ3cWQy?=
 =?utf-8?B?bmJsSFIzbEluZ2VHSkc0cFUxeDhkVWR6MTNpQTdPMWxKY21kWFI0N2VSMzRq?=
 =?utf-8?B?cGRwZTFtWkVCemVmZThHSjNaR0xFWndOcXJFZXd0eGYzNzRCQityNEVsNGdz?=
 =?utf-8?B?YWV5cWwrczhRdEpNVHR1K2sybjEzVlBzR25rNXZ2WFVac2gyeXZicGFkRlgz?=
 =?utf-8?B?Tnk4NWttaHpNUEF0RmtWT09uM05vanpYSHJmbi85V0JiRnNoeGNBZ0FZVjVF?=
 =?utf-8?B?YU1sVHg1TUJVSWFnSkJGakYwRk9zc3BQZXJyMXd2K0dOY3NXOEtOclVoTG5C?=
 =?utf-8?B?V2w5Mks2WG8vS1YrM2FjRzhFQ3lxekxFQ1g4VG9pWEhWU2x4TFY4MmxoTEJo?=
 =?utf-8?B?SC9NRVV4eGdEVEhnOHpCd1JoeFhMS3RXeTNRRDdoc1IrNGxiSC9PV3AydEQx?=
 =?utf-8?B?MHRMK3RPN0hmTzhtazRJdmZQZEFsaS9mRnJaMzZtVHVMUlZnbWFSbVNia2RW?=
 =?utf-8?B?Q2JyYVJ2UDR3T2xoTXl4N0Y3aFlqK0cxZ0FYeTBvdWhtRzJOMjJxcWZVTitt?=
 =?utf-8?B?cXJTVlpQU3FNQ09iWGZrcnJ2T3RMblhqcStnU0g0Tk5TKzNUMG9HdTJzajll?=
 =?utf-8?B?ZDkzbm0yYnJnNk1kZnUxV1BMKzhpYW1SNnFvV0xvYmRiY0JSSUQrcm1sb3FU?=
 =?utf-8?B?UFQ0STlKU1pWTGRCOW9KRGFzTkZJcndaR0x2QzZHUmphaDc2NzRHQTRCRU8z?=
 =?utf-8?B?WG9JK3RnR1d1dHlpenh0MVgvSnBUOThCZndLZEIzS2tKaHhOci82OXhVYVRO?=
 =?utf-8?B?UnZUcWxaWnovZm5tSWsveEJnYkU5eGViZGJKZUNmbHRSQ3g1a3RpSFhlbWRx?=
 =?utf-8?B?anRDUkFqcWk1RjBTQ3BXSXZnY054eDZ2bDdvK2NQZG5RZFE4ZTF0YXIzeFMx?=
 =?utf-8?B?TUg3ME5mNzF4UlZZOGlLT2pyNldkMFQzc2pnQmNvb0Z6SWduYWlGMWMzRWVF?=
 =?utf-8?B?bGdQSmtjOUtib3h6QmhZcWdRL2hVV2F2ZzVCdUZ6N3BHY01hTklwU1lWQ281?=
 =?utf-8?B?K1pFTlJXdXVPWU80WGRtYlhWSlZzV2RNdk5haXpPTno1MS9HYTZuTDBnYTd0?=
 =?utf-8?B?VFpuTTZONTRJenEyUTUrYmNTak0wTGUwWkJSKzRDOCtSTkNrMnorbm1sdW9m?=
 =?utf-8?B?SHhZUUdXUVdKNFZUc3pJN2h3UTlDcHRSR3U0K1NOVEh4REJ2RUduSTJmZzVq?=
 =?utf-8?B?TGNIUCtBL3F3OVVSc0VsdjhVaEdkcGpuVkVueTdTTFNyQWZYQ0l4MTVKZDVD?=
 =?utf-8?B?RHkrSWJIMDc0ZjRHU2dXRlhGaDYvL2pzdk1vN3VWeGZJU2pscnNCUzVkcEhk?=
 =?utf-8?B?MVlUd0JLOGtFVlBDZ3Y5OTJLVHhiR3MvWTJKd1E0WHlPVUxNRWNKVm80QlB4?=
 =?utf-8?B?cHNpc0Q2YktTUkZtUkNEcWswRERUU3ZUcnhDNjd1Mm1YS1ZQQkNYS2xlVVdN?=
 =?utf-8?B?OGZkOVNJUVl2WHh3dDRPWGpyVWd1d0FjaE1LTTVPek1VM1phUHVQT3d1K3FS?=
 =?utf-8?B?VVdJNmh3bFYxZmdPZ1VxL2h3a0FqdjIxTXhuUFZHWFVOOVRzMzZyWFh1NkJO?=
 =?utf-8?B?QjdFMTV3K2xXSjJaNWN5SnJmdk1ROHhHc3NaN3BpQ3hXa1dKeDY0ekgyNElq?=
 =?utf-8?B?c2ZvMXk3aWNCdGVXeHkrZStzQnlPS2hqVWx5VXIzTVUvMUVVZzBVY2kwQ21x?=
 =?utf-8?B?bGVHUThKd2JteFJtTnBMb2owTHBTWm5OeFZvbHRkcndmZ1NxaGFyM2dOdG9r?=
 =?utf-8?B?QkhtdEJOYnoybXdyb3g0NTh5Rnp2dndVNE5TZndQcXg1Q3FSOHpETHNET2Fw?=
 =?utf-8?B?UmR5eG5ITjZnclRTYjlqdUZScWxhNHZHTCtoaVE2TE5wSHltV243di9zT3Ro?=
 =?utf-8?B?K1NocWR1aVlZWk1yeDNrR3NqR3ZNdVBXc1NLZ0MxUmYzMG16K25iRTZ0UjF3?=
 =?utf-8?B?Vm9KWkFmUG16VEh3aE1RRHhBbEo1Z2J0UHYya1BFYVFkbXhkdHVDeWl3bFZn?=
 =?utf-8?B?QTk1UjNUQ3VGUzIzQmgveVVrTkJkSTZpaFJaaldWQUgvampwMytGUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b272c1-1252-4b60-eb70-08deb10262fc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 15:14:54.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+7YSh+gt8h2WDgHOopqcKG8ChJyfdCiOjMb9jNo9RGv97xAzNawHqN5EOsptevQFrWRvvxgLNl2MQzPegm8IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8081
X-purgate-ID: tlsNG-16d1c6/1778685298-8556ED75-6DF878C1/0/0
X-purgate-type: clean
X-purgate-size: 6341
X-Rspamd-Queue-Id: 367D1535E07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,macbook.local:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:58:57PM +0200, Jan Beulich wrote:
> On 13.05.2026 16:24, Roger Pau Monné wrote:
> > On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
> >> Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
> >> assume availability of this field (at its conventional index 0x32); OVMF
> >> at least has code to inspect FADT. Hence we ought to have supported it
> >> virtually forever.
> >>
> >> As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
> >> struct hvm_hw_rtc to hold its value. Update the field only when involved
> >> values are valid BCD century specifiers. Otherwise (for VMs migrated in
> >> from an older hypervisor) leave handling to the DM.
> >>
> >> This makes the Linux rtc-cmos driver report y3k compatibility.
> >>
> >> While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.
> >>
> >> Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Am I overly paranoid with the checking of the field, considering that
> >> Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
> >> have ever run with should have been aware of the field? Or am I, quite the
> >> opposite, still not strict enough?
> >>
> >> I can't help the impression that this introduces a latency issue for
> >> the 2nd of gmtime()'s while() loops: We now allow years up into the 99th
> >> century, i.e. over 8000 years away from 1970. 8000 years are very roughly
> >> 2^^38 seconds, making for (again very roughly) 5 million iterations there.
> >> Did I get my math wrong, or do we need a prereq change to (vastly) reduce
> >> the number of iterations of that loop (e.g. along the lines of the other
> >> one, first going in 400 year steps)?
> > 
> > Hm, maybe we need to add some XTF testing for the RTC?  I'm slightly
> > worried how much time this could take, and since those calls are
> > serialized on the s->lock I wonder whether enough parallel accesses
> > from the guest could manage to trigger the watchdog?
> 
> I'm not really up to making an XTF test, I guess. However, as you look to
> share my concern, I'll add a prereq patch adjusting gmtime().
> 
> >> --- a/tools/libacpi/static_tables.c
> >> +++ b/tools/libacpi/static_tables.c
> >> @@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
> >>  #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
> >>  #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
> >>  
> >> +#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */
> > 
> > IMO this define (together with the RTC_CENTURY one below) need to be
> > in a public header so it can be consumed by both the hypervisor and
> > the toolstack.  Having two separate defines, one for the hypervisor,
> > and another for the toolstack will just create confusion.
> 
> I first thought I'd do it like this, but (a) this isn't a value Xen
> defines (hence the comments in both places) and (b) I'm not entirely
> happy with such a(n) (ab)use of the public headers (yes, we have other
> such examples there, which I also don't really like).

Yeah, it's not great, but it's better than having the same value
defined in two different files, and having to keep them in-sync for
the CMOS century field to work correctly?

> >> --- a/xen/arch/x86/hvm/rtc.c
> >> +++ b/xen/arch/x86/hvm/rtc.c
> >> @@ -47,6 +47,12 @@
> >>  #define epoch_year     1900
> >>  #define get_year(x)    ((x) + epoch_year)
> >>  
> >> +static inline bool is_century(unsigned int x)
> >> +{
> >> +    /* Constant below should match epoch_year above, just as BCD value. */
> >> +    return x >= 0x19 && (x & 0xf) < 10 && (x >> 4) < 10;
> >> +}
> >> +
> >>  enum rtc_mode {
> >>     rtc_mode_no_ack,
> >>     rtc_mode_strict
> >> @@ -482,16 +488,32 @@ static int rtc_ioport_write(void *opaque
> >>          data &= 0x7f;
> >>          s->hw.cmos_index = data;
> >>          spin_unlock(&s->lock);
> >> +        /* RTC_CENTURY always forwarded to DM. */
> >>          return (data < RTC_CMOS_SIZE);
> >>      }
> >>  
> >> -    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
> >> +    switch ( s->hw.cmos_index )
> >>      {
> >> +    case 0 ... RTC_CMOS_SIZE - 1:
> >> +        orig = s->hw.cmos_data[s->hw.cmos_index];
> >> +        break;
> >> +
> >> +    case RTC_CENTURY:
> >> +        orig = s->hw.century;
> >> +        if ( !is_century(orig) || !is_century(data) )
> > 
> > Is a real RTC strict in such a way, ie: will it refuse to set the
> > century value to < 19 (0x19)?  For example QEMU seems to be way more
> > relaxed, and allow any century value.
> 
> I can switch to rejecting merely 0. Unlike centuries in the future, it
> didn't look very useful to me to permit anything below 19. Please clarify
> which way you prefer it.

QEMU seems to tolerate everything, so I lean towards tolerating
everything that's not 0.  That's solely based on what QEMU does, which
I think it's likely to be (quite) widely tested.

> >> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
> >>              /* Fetch the current time and update just this field. */
> >>              s->current_tm = gmtime(get_localtime(d));
> >>              rtc_copy_date(s);
> >> -            s->hw.cmos_data[s->hw.cmos_index] = data;
> >> +            if ( s->hw.cmos_index != RTC_CENTURY )
> >> +                s->hw.cmos_data[s->hw.cmos_index] = data;
> >> +            else
> >> +                s->hw.century = data;
> >>              rtc_set_time(s);
> >>          }
> >>          alarm_timer_update(s);
> > 
> > Don't you need to adjust the tail return of rtc_ioport_write() (below
> > the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
> > the set value is also propagated to the DM, and not only the index?
> 
> I don't think so. The case of us not handling RTC_CENTURY is dealt with
> earlier in the function. Whereas when we handle the field, we don't want
> to forward (like for all the other RTC fields).

Right, so then you also want to adjust the top part of
rtc_ioport_write() to not propagate the write to the 0x70 IO port when
data is RTC_CENTURY?  Otherwise you propagate the write to port 0x70,
but not the read/write to port 0x71?

Thanks, Roger.

