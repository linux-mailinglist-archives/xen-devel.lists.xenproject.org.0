Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEOmLWtbuWnYAgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 14:47:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9C2AB317
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 14:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256127.1550827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2Ul8-0000iv-PM; Tue, 17 Mar 2026 13:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256127.1550827; Tue, 17 Mar 2026 13:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2Ul8-0000ga-MV; Tue, 17 Mar 2026 13:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1256127;
 Tue, 17 Mar 2026 13:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lT9B=BR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w2Ul7-0000gU-LJ
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 13:46:57 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2de5e06-2207-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 14:46:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS6PR03MB989093.namprd03.prod.outlook.com (2603:10b6:8:368::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 13:46:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 13:46:53 +0000
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
X-Inumbo-ID: c2de5e06-2207-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBe24odqEaTA707Bbu6Tqdm7lIv/rmLewo1AcAi+BY5vfpJQ48DE4uL0lgvA84vpZCfk/M2hpJRWtYbuRbu3tH3n7tI6lqpdw6EBMzrRQ1tKCAdlPYa4rvAA80ZeoZ7qjKeXXxd94Pml6mtqTxWAmoxs1tDjmXaMSZztCVCbyWYaSi+6b5fjKz5yueJCYCVOM4TiYfNuJCe3GE80qwTnImLW8KIjEme7CBr/RGAYALUaxaAuRfkkIVjvASJuDk2QvUaukdX+fbIcVWugbuEHtJTO1mHfepKqDKg1H6QmkebjqKSrzEZ3PrpT7D2x8YJHYKXYYk9RisvaOTnmrVvsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuNjVif0kI6xoqMZ8+Ck7gPk3cNBabG+q045428FfXE=;
 b=lEdDnvnmxBheqf4Aa1no8DNWZ7MrDnO2oR7u2l+6/Qn3XOvzkdXc/a7Tj/It3cwR5KpU7bVdZNNgKT5ncQR9PH/PFVkzI2sWbIO3jhEPlvb14zyIjOqWaYg43XN6o0QBTaJwRegEBSvNmGv0BoWOFxXsU6lXSXnR1o06prLgVQNLCgdNFyJARv6O750wLn3NbKzVAvgyECNuESMMgjZOT2UnAKaMhgCF+bNTPWz0LXGkDy/jvDsdp1Yo9AQZy1YV6C9Yk1YdQvie85TXpurwSE5bPiJLDzEll9ZM7XZdLo9rh9cbBooL6zaXgmeTQEV8vHnw5qdqYNOIk6W0tsB+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuNjVif0kI6xoqMZ8+Ck7gPk3cNBabG+q045428FfXE=;
 b=Ns72vTUgpDHAuFk7e56+EErCBWKLpwvrJJ2q26fgg23d0XKfdUOwM6B/BCqlcivA9gH4x7xzpf2e2j1JQHEWSNT0n3zKPq1+Cab6fWRthoNX0MzCLbOKe7BmrS8ZbMXzF4lMPVzR6dXAY/qvIGNeoSPC7qilzyAIf91jdcPKjWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dd928382-48a4-4bda-83ec-928bb98d7b7e@citrix.com>
Date: Tue, 17 Mar 2026 13:46:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v3 2/3] x86/acpi: Integrate BGRT preservation with
 status reporting
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
 xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com
References: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
 <20260312111414.17808-3-soumyajyotisarkar23@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312111414.17808-3-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0431.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS6PR03MB989093:EE_
X-MS-Office365-Filtering-Correlation-Id: 1913b41c-6005-4358-6978-08de842ba593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fY6/GdZT9M+rGNS+m44rqG+SfQHUzPhrDPGAS12H+E4YMNklePv3vm2FlhxjOV7uY86IT5ySziyQusEZfej6EZaR/iCcduvaTt2dp1c2nsAwsFqg8l4gYUS0q8HyQKEfeHY/LEzWY05wIcBqH4BWYeCrT4/4GkOC+weNKQl7v+oerLbJML2pAINwKkbijdzSpHf0C60nGMNzAZlLQz+HZfhmANmarHdva/RiDt59xTgi7kg/+WMppEowduWHkoz84fB3G1cjJecJdEAopfhL0CQACieoOOBJtR7ve/r09Pp4PueqNH1UTC/UgULX2XhsWNMwlDt48fN49gRRrydd2QOYbvjxf658yoAUwdKnMjYY0RozAFybnTaWEQh/5+Qj2/z+OaD953GqJeSB7EqUdo2EoHvevSMH7IClJ98+a9jarySlSCAibA4XU/PNZKinrvjJLivIUQKzI60dABudD+A6rysaw+uQcmzXr4JzYeKbm4IUgbf8HG64OWJoGfZ+PgmBF1EBdAfgJ2QskWV/1AG0zjb1W31G4yXsjm9AUAVzdTWu4iuyB8Lba5m41zsXeB4LBZFKAR7wRxD30X+wIKy10GHTz7gZwQtL2ABTcD4ozzLvSw37pBN0WW9XUDixnTeGy2E8180QNmlBAI84wq2s3hNeYh4+8uCOl3GEenxFcW5/TBXd1Cm/faVd7ErQT26DctH4RKC3EqeoLy3ywiVtMAytv9u1Gf9VWQIDiuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGphdnBYYm9PZHRzd1FtK2g2QmM4N2h3bjdRalhvWmxCYzhvR0N1eGlGV3N0?=
 =?utf-8?B?akV4ZDZGc1M2VWpWNE50UktzaWl1LzVnb2dlWktYa0RTVUQ5K2dIZzBSZlps?=
 =?utf-8?B?QlV6Q29tNm93bDJ1TjlESlFZT1RyRDZ5azRqdmhDTXROc3JxNC9PT2VxOENR?=
 =?utf-8?B?ak1yYlJpQXBJYmZMSWZ1ZlhZVVdacVZBczlPZTZSbStNeStvYkZjeVc0ditj?=
 =?utf-8?B?aE9iVW9qLy9mRmZrdnREbmFWV1hCcWZ1alp0VmQ2L2Q0d1h3NUlUTWM5SGJE?=
 =?utf-8?B?TVduT2JXMWxoR3NaZTg4VHRQTnc1RlB2Uk56ZXMyY0wwSDFSUmFjY1QyQ3Q4?=
 =?utf-8?B?MGJZdkpraUpkd05sSWswSlpwVGx5N3V4UTZxYitpb3V6NERoSUxEUjRhay9w?=
 =?utf-8?B?N0JvYnlkU0VoNHRGaDZpNFdSNm5KL0RRRE5XRFI3MGUwb3d1NXBLay9RbmZZ?=
 =?utf-8?B?ZXBGdk1yZWpwTzNzNU0vNUwyQmpLY2h6bEwwZlVzN214MWdZOHF6YzdTY255?=
 =?utf-8?B?WmQzdStuay9ha1JsNy90UExxZys4Q1JPUThzZFVPVEhJNFR3UEdLOGFuYmU3?=
 =?utf-8?B?VDk5RkdSY0VrOGpMamYxb3J6V042LzgyUXMyS1ZJUGFhZUlXTWRkQkM2Uk8z?=
 =?utf-8?B?Mndmb29uRUExU3hsRFkxWGhvdmRtWm9RNUdCYkpMVXpBODErdlZOZE53ZnpZ?=
 =?utf-8?B?bVhkSzk5K2Q2Kzl4ZU9kN0J3d1M0QzNubWVhNmc0RzNZNFhPRWsrUTU5YzdC?=
 =?utf-8?B?eUNDUkVhd1BoU01ZeUxmbnRtMGxBaWsvN1JubGZRMmN0T0ptZ2RDQkZ0QWJV?=
 =?utf-8?B?cDkxeExZMWxmc01kK0VCNDUwZjJPL25jaEc2ZDBydDJIaGlDVmlXNnBIUDRW?=
 =?utf-8?B?ZUtMcjgvUFNWN05UVWlTNDcxck8ySVhCVSt0STQyNWg5TW45S2UyOElKdVNP?=
 =?utf-8?B?dmpENHYvU2V1MjZFaERTQTU1ZUU5Syt3bUUrZHFtbmFBbDRVbU53bENNelFv?=
 =?utf-8?B?b1ZHZUZkRzYramhEMnB3SmJ3M0VFYzcrUE5rTDErVFdjNlRyaWl4NmJMZktR?=
 =?utf-8?B?eklhR2RiQ1dQS2l4SVVMbUZMZlhqdlhIZG9MUXRxSmhwdzZSSGxsSmo5SDBW?=
 =?utf-8?B?djNOTW5RZWg2czNtdDBwbTB3ZVFBekZ4bVJCUUFLVlU2V0FqV0hXOUJUQnVL?=
 =?utf-8?B?bGFJZ0Fnc0lZYXd4QUV5dGtjZ0M0N2RPNUt6aFZ2clc5ME9BbHBEMy9sUWh6?=
 =?utf-8?B?bVJwMFN5SnM5YWRHcEFYRGNZSUw0VWJ3SkVMQnpnTGtER0ROMjNSeCt0M29l?=
 =?utf-8?B?VEdWbk95b2w5Z3JjRzJBTzJDZFo2OHlJancvNnBMWDNkREtVcDQzWXNzSlFJ?=
 =?utf-8?B?Y2M3WExIT2JHbFNaQ0FsVEZuL1YweGw3S21hbmQ5d2dqKzdTa3hicXZ2cyta?=
 =?utf-8?B?eHBtYmtYdm9lZUNJRFRheXFKMlVnQVErZ1BMODJBSVVSMStVTEw4R05Wa1Jn?=
 =?utf-8?B?VlBPQk9FZzh1OUE1RHVpdEc5MGdBUC9jbnU1M0pRSDVOK2N4b3N0RjN5Ujg5?=
 =?utf-8?B?akxyVVowSURyL0VQcWdTNm9wVVBBVXRZeFNXMVg1bUpPenZwYzBpKy9zcHdF?=
 =?utf-8?B?RDUrVVhKRytyQ2NISlVqUEYwS3hFQ2ZFN3VFRWlGQUpHNEJSRHJKSzZpNkl5?=
 =?utf-8?B?QUdlOHFQa0c1czVCRXRCS2pEQ1A4K0dheFRTa0s1c0JZZVdwYWZCYXhXeU02?=
 =?utf-8?B?K2ZnTUdVdTJLV0hyNWx3aGVqRVlzczJnUFI2WSsvVUM1bjgxRnE0aEhkanJG?=
 =?utf-8?B?QjFpaWZLbHdBaHhiQk91SFllSlBNcGhVa1VpTVNiNXJncG5CSy8xTjlsNjdp?=
 =?utf-8?B?L2lhVXBhWHIrL1hkQVB2MnhKQUdadGlwRFhJU1UwQXdTVFpzdFNTMTE5OVdY?=
 =?utf-8?B?UWdiMlk5d3ZJMGtJQjNtYnlxUUpiaWxZaUdMR29JbHR5Zk10emxqVWZ2cXd4?=
 =?utf-8?B?TmIrZmY3ejF1UmZ4amlqTEFRdGpYR1o4WTh1Wm9YaHgrY05yVkJpS29TSFFT?=
 =?utf-8?B?cmJMSDU2anZSTkZ3V1hNZ0RzL1d1Sm0vdy9EK2t2RkxIVC9QZTVQd01GbVVx?=
 =?utf-8?B?NjZwMmRDRkd0cGJibWhFL29ubWpUNEo5dE44SEl3QzNoSWJ2ekR6VFAvaDYw?=
 =?utf-8?B?S1hIUUFhbXkrR0tmN3QyZnJJa0E3RXVoNmhHMWMzdVV2MWdvdHptY0poOHhY?=
 =?utf-8?B?WlpiSUJsOGtOM1pTSHJDd1NGeWJ0VVJDcFYwMFdQUHlyN1c4TzNORnpUSzhx?=
 =?utf-8?B?WlF5RUl3S0VFYjFuMzcrZ3hBN245MmpFNEtDRlFmRSs5ZWk2ck9GZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1913b41c-6005-4358-6978-08de842ba593
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:46:53.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHLUdYeVs9JQ3FYMa2+AnM8mGwi5g3ru/gLPexbcYITR34pGhZA+z8BMvaaUFp4YAjGC2BIxFwHWTjem+7JXgqNVCx9x9jicbKSuyaEjRDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989093
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2EB9C2AB317
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 11:14 am, Soumyajyotii Ssarkar wrote:
> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
> index 1ca2360e00..20afe79db9 100644
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
>  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
>  {
>  	struct acpi_table_bgrt *bgrt_tbl =
> @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
>
>  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
>
> +	efi_bgrt_status_info();

To help with your build failure, given this call from outside EFI code,
you need...

> +
>  	return 0;
>  }
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e6451130ce..68e06d707c 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
>      return true;
>  }
>
> +void __init efi_bgrt_status_info(void)
> +{
> +    if ( !efi_enabled(EFI_BOOT) )
> +        return;
> +
> +    if ( bgrt_info.preserved )
> +    {
> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
> +               bgrt_info.size / 1024);
> +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
> +               bgrt_info.old_addr, bgrt_info.new_addr);
> +    }
> +    else if ( bgrt_info.failure_reason[0] )
> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
> +               bgrt_info.failure_reason);
> +}

... a matching stub function in xen/common/efi/common-stub.c

xen.efi is constructed by taking non-efi Xen and linking in a few more
object files.  It is not a full rebuild with different toolchain settings.

~Andrew

