Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ1xD9/wBWq3dgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:57:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B49C5445FC
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309035.1580227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNYQU-00072y-J1; Thu, 14 May 2026 15:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309035.1580227; Thu, 14 May 2026 15:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNYQU-000702-FZ; Thu, 14 May 2026 15:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1309035;
 Thu, 14 May 2026 15:56:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNYQT-0006zw-8S
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 15:56:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNYQS-0083uT-Lc
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 17:56:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05f06d-2eae-0a2a0a5409dd-0a2a450a85ae-48
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:56:40 +0200
Received: from [52.101.53.15]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05f0b7-56b3-0a2a450a0019-3465350f5985-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:56:40 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6325.namprd03.prod.outlook.com (2603:10b6:a03:38c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 15:56:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 15:56:36 +0000
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
 b=j2ifC68kIlpxdmCOjixjGugEN/VcoDdF3L3PHTrlbV+O62c1E7ELHstiA83BCMGoba9hRYz/wqQ6l6gs2Fm063ISyfcgVcJMRnFJWwK/FGKxETH9hlC0IF+87ASZ1iYob3lLxpnJPDKHNlVbQCza1eBnh+p0VeHiPypoLRlQTyuMKzsdQebrDXeUfpH6D97GNpMyocoRCH834UsNPzwIqqPFIIHEYsWGFnos2BoUB11qr90ak8WI03Epk9RPhRpziuXyN4/wEeTe1rpzTcveICsartOPp3LWXro6Jjmgocux/Cq50MktMBTI2rhLn3KTk9w0hz0dltJg18qyiQPx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjgC0sw3jY/7r/L1rrH529TNDztxddUld7To3nHp4vE=;
 b=IP3tOPZoo2buay/JSfYfBmqHW7F0RLh8jafWvGB1khCwIqymAjCD6MYZAZLoX+hciZp3LsKpn/YLoOQGKDzWwjZ2wN71iPVQ9VogXRNUAs/5jGy0+0UGhjrUQ1O6jFmcqMisITOkkWuSkJJJRTwtA+bX9hUmWHhMTmn1YhvQ17QZ5qBt1vitReMBtEUZGe6FJk4OhNWml+cUyPfRZgGc43VWTmt+DVtTdR1Pg/O00IL0lHyuAoJww36TXlDSyOAcijlyCIS1Se33SBNdEGO8UuNUMUKeaKNtiUi9f5FaZX8DxmRIT3dFljTVWNF+rr4GyaBtDU3xxaQ4by1xBKo+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjgC0sw3jY/7r/L1rrH529TNDztxddUld7To3nHp4vE=;
 b=w6/k/DRjdjr+PCJGCLjLofo+AM5QeRet7eV81oVpjlkV8zyfxTyOrkup9PlJhvKCeL9Edojpx8axocnxvuTCEJL5QTHNZvdzIp2+NrkSBoNLi/JAsnGxeffbY/2w627EvIWebbh+DMMWG0cKjfSwPpKo7QcFAAtIt1xWdz9NcXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 May 2026 17:56:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
Message-ID: <agXwsshLlV50dcnV@macbook.local>
References: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
X-ClientProxiedBy: BN9PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:408:f8::33) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bef4a3-b4aa-42bb-22e1-08deb1d160d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	d+uZ/aKcvI45mh7UYxl0H9ncv15eai1OkSmXhdeYFxmfSywgATWl2bOPvbCPjOVFWmJRePQMdpVWPT4OkBa3rYMkFdTDVxdP8diBurZabxHDyWsFq3pw3IDs7mTh58Up1dFHuwATXSu4XUbvt2U96X8kNcdWLchwnjn7w2StcPYC6WO0Ir0CzTF/e+0mlCXwrgZyuCt6yK8KAwMVcbSOYbfLr8M6MEN0AHDEBgUIMm24yFXNOBD6SJjuaNQu7kNRc+ZnL7iTzvbAqHjKclDaMrsoWwLe5N+jMkL4rjQs7xh1M7Ie4IDOOhnYucr6WuNdQSM/Qw9Be6peqZTM9kFLDu1ulZOtYzfGy128RtcH3aKaSlO9+h/9wH8NgSGJmJVf7SL36jn0ysJ9nZRS5IXwqooAWx7TGSHqX0cbl/MnO7dYqrCbCg2smFY+lco6McIGQWFH0dZ9k7y4IO9A4fXt/6c+hRbKl9cFv3hEM7WDYAjGWY6zlyzO5dLYLFL7ilJVXQEXwXTotPIeUA5euFSgYHfZ5EEftfQ1erX7OylHuzQO01nctyE14/dQKiN9UE3ldu3rBqIbIE9oDwbqcvGqans16c4+C3HAilzAx+DhqrI2wRkGehoSFacKuhURERGdbiN13Ercjh6ncEYeFRGQMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3dJSC9BanJQT0tZWTVlbGhWWGNPcTFzWjF2ZHZJdCszUzE2ZEMxNkwxVkNm?=
 =?utf-8?B?QXBXN1NMWkhCZUwyUWRIQ2RLSW5qZnVPbUV2S2wyT3VVVGxkckRtSUdlQ0pp?=
 =?utf-8?B?dXV2cjR5eUNGUEV2anhvNXVudVVCY3hnanpQSFgrSUJuQTcxTWY1Njh0VDB0?=
 =?utf-8?B?UFcxc29FaWhySExmTVFjWnFCUkdkSm52VjRKNGVDRXFpMFlramRNVFFTUU1N?=
 =?utf-8?B?Z2NiVEoveFBoWVdEcW5EQlp1NnlSYStmcTNocXQzZ1pqaGhTYjVkTHYyRkVB?=
 =?utf-8?B?cVZ0NEZFMUZNVWpXY1J5N0tSU2tKKzdqQktodnFLRit2VE5GYWlQUURxSldQ?=
 =?utf-8?B?ZjlyU0pUUS9OOTZaZTdJN1dPd3NXRk00U0JFQjI0c3BsMmRHNVNSTE4xVmZq?=
 =?utf-8?B?ZnB6NUpiWEN2RmdZelVGRnlYN3Bia25UOXRiVWRwRFpEcHh1WFFCc29iYnFC?=
 =?utf-8?B?NmlGZEpaRW5qWjRYQm5jSVhRTTFwbzFQQUR1K210dU90NGlBWUlEUUg5Mnlv?=
 =?utf-8?B?QkN2eENEY2sydzQxMXFIMzFrVkVvQWtKMldFUGtmYXdtT2xmQ2VUcnl5R1pB?=
 =?utf-8?B?VnJwRVJTSzJDYzdtTnFmNjJ2K0o4ck0xVW1EMklPLytTMzdZZnhKckxYbWFW?=
 =?utf-8?B?Qm95ZllUTzZ0amVMeDhoTXQzOHdQVy9OenZ6Uy9aTXovdDlsaVI0cTdtZ2hO?=
 =?utf-8?B?NU5LT1R0MXRldExuRUl3QlNVQXpvTDlGMURERHExZklvNEd1SEFTQWhQL3lq?=
 =?utf-8?B?Q1orVUpQMWVpK1FYdkUxdFREQ3BvSFM2Q2hld283NzFZZndlTlg0eWpFQk1y?=
 =?utf-8?B?NkhSSkVMTnRxRVEzMlNvREhGZkJMYW56RDBhcU40LzhCeVR6NnJleVROVU1i?=
 =?utf-8?B?cWN5Q2VqaC9sRm5vZWZ6UjkvaWN0Q0tJR0ZjSWZpOUtpS3FsQW1YQkhYWkZa?=
 =?utf-8?B?ejhubEw1b2lkSjVLYjBrYXBmaEx5aTNTV29ZUDRzaFZBempqUlQxRzE2SXRD?=
 =?utf-8?B?YmRaWXZxbUxKZTdsWkprei9EVm83SEN4QkQrbnB5UnhJQU54SDFYS0E0TFk5?=
 =?utf-8?B?Y2RaQnFxZ012ZUdJTHQ2NUVqcmFWUktEV2ovcVI5b0lFMHZ5WHJ2YnExR1NJ?=
 =?utf-8?B?T29pdkZCMzVxWFBtbHhvd2YzZjRCZzM0c2tIWm14MEVBd2NycmtvWVJmc05Q?=
 =?utf-8?B?T01hcWVSSjNuSTk0N1E4dUg3Nm45b3hGVGZGS1JMemRVMkhYNWw1d1VpOEhG?=
 =?utf-8?B?a0hqTGhNWW15VExmWUZJMXdSaFJkd1lCWjVrS2xZRzlWTlhiTTVTcllzSUpL?=
 =?utf-8?B?ZXpybGZQZUtZTWFtMTIzaW9yQjF3VHBVTTd0ZFIxUVRVSGhuRjVRSlQ0dno1?=
 =?utf-8?B?RlZDQk14L3NhRTBuQmI4S3M0c3FCU3lPb3NPaDFNZFFJS1RGdXE3YWxvckFX?=
 =?utf-8?B?djVXYi9UUTZnK2tUS1lHQVlSV0tTZTZSaWl5QU1BVHpBMlJINXp3ajZPdXBZ?=
 =?utf-8?B?L1JlVXNZaXlkelFqVXdNdll2N01YWXlrMWlNZStMMXFLZy8zOFQ5ekR5eUhl?=
 =?utf-8?B?SnlYZ3JEK1dTTmp6Y2tIcHEwSXdMZjJqYnpsbEgxYlZVcWhuaWNXMUwrWksw?=
 =?utf-8?B?VHJ3Q21MQkxQeWNzVEZQM1dVUWVWUTMrcHd4THpkRnBZR3JJR0JnazRuRFpU?=
 =?utf-8?B?dlpxM3FLTmYxNEpJWWR5bjk4UHlmZUZNRFVuUWhlYnJ6U0JDU2VVaHc0cUlY?=
 =?utf-8?B?SmJGRW1TSm1iOWUwOU1MYVp2MzdCKzhqakpLMmRxOXFCV3p6Z1Y5bW9ZR0dB?=
 =?utf-8?B?cW00VzB4Qms2MkRSTTFhYVFYUVR1d2xPcjVHM2JhN0FhZXhLa0hlWm9iSjBk?=
 =?utf-8?B?OG5rSGVPRXhkVkQ2WGhLSCtZODE5Z2MvM1UweXdjK0YwY0RPUmYzZ0VDa2NK?=
 =?utf-8?B?VS8rUEYyYXNtY1dDOTc0THU3ZGI3bEVuYnBmU3gwTlpNQW9qT05WcnJhQ3lK?=
 =?utf-8?B?MW85d0xod3h1OXE3YkRhbWVnTGgxL0xNc2QxTjNMbUZMNWw2SHM2VEJmclZW?=
 =?utf-8?B?TFZucHVlQVJ6azlLTThPb3oyWk1HblVvellSaGpnYUJVcmpqdkVKeXZVeTl6?=
 =?utf-8?B?M0JLSWRyTlYvNXQzN1huR29EMXIrNGo5QzBQV3dLcHpHUXJKZ0g5d3lKUnRK?=
 =?utf-8?B?TUR5clRNYlRvYXdWbUhEUGJxbkF4c0FkSGtWTmtsUldLa09rZTkxOFBrRFY0?=
 =?utf-8?B?aVI4MzNTQ2dJVFRMTmhGMkYrank4NDUwdW5vT2U0SFRxWU5TbW5jU2kxRXFN?=
 =?utf-8?B?VkEyUnBQMHBjT01ib0RHNWhpdkxab2hVNlh5S01haC9sVXpXU08wdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bef4a3-b4aa-42bb-22e1-08deb1d160d2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:56:36.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHxMwxFO/5t4h8TeRv1L2DC+RMwBPMm6plDxumwliJGxQHzD/JqjHbi3c6fy2b48ux7ClqpJYvMmCvc9hPAwgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6325
X-purgate-ID: tlsNG-4011c0/1778774200-725748B7-68310611/0/0
X-purgate-type: clean
X-purgate-size: 6115
X-Rspamd-Queue-Id: 7B49C5445FC
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,suse.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 08:44:46AM +0200, Jan Beulich wrote:
> Waiting loops like the one in flush_command_buffer() will degenerate to
> infinite ones when used early enough for NOW() to still return constant
> zero. Make sure the returned value at least monotonically increases. When
> available, use nominal frequency values as initial approximation.
> 
> Do this only in get_s_time(), as producing a sane value in
> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
> Put an assertion there.
> 
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
>      checks for NOW() returning 0 (falling back to TSM_RAW in this case).
>      For now I have no idea how to avoid this; perhaps that's tolerable at
>      least in the case where we put in place an early estimate? Should we
>      maybe weaken the fallback condition to take effect for any value
>      below 1μs?

Maybe it's fine to print cycles unconditionally until we reach
SYS_STATE_smp_boot when we know the per-cpu scale is correctly set?

> 
> RFC: While generally the mentioned waiting loops will take longer to time
>      out, on a very fast CPU tight loops may time out too early.
> 
> RFC: For the AMD/Hygon case, if the "nominal" value isn't available, we
>      could use the "high" one. That would cause NOW() to run too slowly
>      (until the scale is properly set), but maybe that's still better than
>      it returning 0? (As it stands, I can't really test the new code
>      there, as my Rome system only supplies the lo/hi pair of values.)

Using the "high" frequency would seem fine to me.

> 
> RFC: On the 2nd pass through early_cpu_init() it may be okay to skip the
>      new additions.
> 
> With "x86/time: set AP's TSC scale estimate earlier" the counter update
> may not need to be atomic anymore, as then only the BSP can reasonably hit
> that path.
> 
> I don't think Fixes: tags should be put here. If we did, we'd have to
> enumerate all introductions of early uses of NOW() (or get_s_time()), with
> the exception of those dealing with getting back 0 (which I expect is only
> printk_start_of_line()). Will want backporting nevertheless (unless deemed
> too risky).
> ---
> v2: Add assertion to get_s_time_fixed(). Use nominal frequencies for very
>     early setting, if available.
> 
> --- unstable.orig/xen/arch/x86/cpu/common.c	2026-05-13 08:35:28.640503356 +0200
> +++ unstable/xen/arch/x86/cpu/common.c	2026-05-12 12:30:35.475284195 +0200
> @@ -19,6 +19,7 @@
>  #include <asm/random.h>
>  #include <asm/setup.h>
>  #include <asm/shstk.h>
> +#include <asm/time.h>
>  #include <asm/xstate.h>
>  
>  #include <public/sysctl.h>
> @@ -403,6 +404,25 @@ void __init early_cpu_init(bool verbose)
>  				    &c->x86_capability[FEATURESET_7d1]);
>  	}
>  
> +	if (c->cpuid_level >= 0x15) {
> +		cpuid(0x15, &eax, &ebx, &ecx, &edx);
> +
> +		if (ecx && ebx && eax)
> +			preset_tsc_scale(DIV_ROUND_UP(ecx * 1UL * ebx, eax));
> +		else if (c->cpuid_level >= 0x16) {
> +			/* Assume CPU base freq ≈ TSC freq. */
> +			cpuid(0x16, &eax, &ebx, &ecx, &edx);
> +			if (eax)
> +				preset_tsc_scale(eax * 1000000UL);
> +		}
> +	} else if (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) {
> +		unsigned int nom_mhz = 0;
> +
> +		amd_process_freq(c, NULL, &nom_mhz, NULL);
> +		if (nom_mhz)
> +			preset_tsc_scale(nom_mhz * 1000000UL);
> +	}
> +
>  	eax = cpuid_eax(0x80000000);
>  	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
>  		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
> --- unstable.orig/xen/arch/x86/include/asm/time.h	2026-05-13 08:35:28.640503356 +0200
> +++ unstable/xen/arch/x86/include/asm/time.h	2026-05-12 12:25:14.435489339 +0200
> @@ -23,6 +23,7 @@ mktime (unsigned int year, unsigned int
>  int time_suspend(void);
>  int time_resume(void);
>  
> +void preset_tsc_scale(unsigned long freq);
>  void init_percpu_time(void);
>  void time_latch_stamps(void);
>  
> --- unstable.orig/xen/arch/x86/time.c	2026-05-13 08:35:28.640503356 +0200
> +++ unstable/xen/arch/x86/time.c	2026-05-13 08:33:54.000000000 +0200
> @@ -1655,6 +1655,9 @@ s_time_t get_s_time_fixed(u64 at_tsc)
>      const struct cpu_time *t = &this_cpu(cpu_time);
>      u64 tsc, delta;
>  
> +    /* scale_delta() degenerates when the scale wasn't set yet. */
> +    ASSERT(t->tsc_scale.mul_frac);
> +
>      if ( at_tsc )
>          tsc = at_tsc;
>      else
> @@ -1670,6 +1673,20 @@ s_time_t get_s_time_fixed(u64 at_tsc)
>  
>  s_time_t get_s_time(void)
>  {
> +    /*
> +     * Before the TSC scale is set, avoid returning constant 0 (or whatever
> +     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
> +     * value is in no way representing time, it at least increases
> +     * monotonically, thus avoiding e.g. waiting loops to degenerate to
> +     * entirely infinite ones.
> +     */
> +    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
> +    {
> +        static s_time_t counter;
> +
> +        return arch_fetch_and_add(&counter, 1);
> +    }
> +
>      return get_s_time_fixed(0);
>  }
>  
> @@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
>      return 0;
>  }
>  
> +/* BSP-only function to pre-set an approximate TSC scale. */
> +void __init preset_tsc_scale(unsigned long freq)
> +{
> +    struct cpu_time *t = &this_cpu(cpu_time);
> +
> +    /*
> +     * The incoming frequency is only approximate (nominal).  Increase it by
> +     * 1% to make NOW() output rather a little too slow than too fast, thus
> +     * avoiding a possible backwards jump once the final scale is set.
> +     */
> +    freq += DIV_ROUND_UP(freq, 100);

To avoid such possible jump backwards, won't it safer to also update
the ->local_stime and ->local_tsc fields at the time the new scale is
set?  Updatign those ahead of setting the new scale should avoid any
backward jumps.

Thanks, Roger.

