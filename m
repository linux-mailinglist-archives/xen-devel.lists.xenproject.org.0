Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJIwKTpJr2krTgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 23:27:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E824924235A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 23:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249770.1547177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzj3C-0006dQ-WC; Mon, 09 Mar 2026 22:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249770.1547177; Mon, 09 Mar 2026 22:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzj3C-0006bb-St; Mon, 09 Mar 2026 22:26:10 +0000
Received: by outflank-mailman (input) for mailman id 1249770;
 Mon, 09 Mar 2026 22:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xTj=BJ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vzj3A-0006bF-L3
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 22:26:08 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f48d48d4-1c06-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 23:26:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5258.namprd03.prod.outlook.com (2603:10b6:5:241::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 22:25:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 22:25:59 +0000
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
X-Inumbo-ID: f48d48d4-1c06-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HripiaxAwLMthSRqJbYXa0IGTEMawW2n4IxtfA7Zn8ZwPbQZBycTp1l53abEdmSsY1OnBiYMrW53UpJvZdXGLyEHzl4Ht3z/1Lv8T+OL66flnqacBfBVANZbg4LCjs8UtnQXeN86sdjv3eI5NjJwp523Evjkc0vqZDFm4RncdZsfZW2hVs/+NiItAyx/VzQQ8FIPmRXf1wzJDRH4LbMXaIUw4TB7MFHEfVoIoiDmViqL2iW75N8QmFdWPJSfFad3syyPA2JI2zZXLjiYKTPxvQ6qxH/5Jt+nna/ZEBZHIgBMl7r9a6a13J7i3Q4NNT6Rm4foCk8XPEKLj8zm3zS/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDFVJUJF3kmz2I1pqipMVwW1Sn8k47w6+4QxW3w4UAY=;
 b=FJ9w92Dg8KAYz4dzFBs2g0m81VZKj+SAVbyOih96gaBsmB2JvFyruS2CzOQMoooe4+YVpkKxC3YbxSfBeohUIMCGwX1FxQoBrNQO5/+86IyAH1QoK/uxgzu58w8YCEFqXN21jiojUf3L+civ2WJ7ZdD+2BKJ+MSD9+7kE3C20Vh1gC/TFhR2so5PliRq8kYsY9B7FuJ28BxcHNrJh50YL/WlPdzucj1m2IvQJHsDx6bS9plGSiWoV35lLrcCSpWvw9cbLMiLC7ujFrUjRjEqEvpqrlnAT42J5uZGxO6lt3mEhQ79u3pwtiXDEs4N8YrF/7//Hgx9qPTTfj0sP/tqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDFVJUJF3kmz2I1pqipMVwW1Sn8k47w6+4QxW3w4UAY=;
 b=ma9bnogCWaP1YXuqoXul4tY1U4sRXTO6lsEer4AvJRkW1nL+7f8s0CW+72yDk/lRA/sgp3Vao7ZTVV+wi6Fo10HGFhHJt4txt0NHqEYtaH8vQQfTtlfhCruRe3s+13OVgJ8bCl7HTYVCj1/eXWegI9hwNfiSRn5T5JoewfzmMNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1fc7bde0-dbaa-4daf-b23f-a46b84219278@citrix.com>
Date: Mon, 9 Mar 2026 22:25:55 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 12/14] x86/pv: System call handling in FRED mode
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-13-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260227231636.3955109-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: e9127bd3-b7d4-4c26-9bf5-08de7e2ad6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	2ZtbtkEVCLQy11XllNguwevcCkKaqtdu9+4SH6vYKrJqOZDS30tvSiXcCmGNqVoiSZ4G6t/q6ZKgHfiE2kzdCi/RtWA8U+oj3mizMKlnOJvbNB0ILSL0AJbXuy5uTWPAgU68bB5/Vevy0WJ062DdZzsID6N3Y/psPLluek+3FislRqtLxBilbVg1Y84pS7hUyjVePd5friReVqV37WmUUi62izbeDk2SKNQYOUzJ91hC3ElehHRzFDQu4fRWnXzudhNK+wyjPig1+PFS2Rf7l/M51qJ2rjoEmIAzbe3sXoNOmSQNmcLqhcxft5bSGa2MeB31MgIfeE/T6nIHd/rMD2c0UtqLXfvENswUFpt2Wzs1H2EVMjssUtsZWpLceH/eL+wI5jx7EPNdVvk5DcaZCFh7SFefD6jE5DizyG4O6on61qpHVNpPS6USKoZsZUsdEbIypE7URJdZ94cCWLL6ISybc9dAhv5SZAeI6sRZnUidR28X/qwARe+sUxzPcSaefO5zYB7TL0ayvjeV0o+9oMrZgFI0CfcQpcDdyfvWAQ6pJJgLSuaEutCdnX+WxZJPOKZCbmT3tozNYhCoXvtCbJ+7KSjmkh8uW5eiGDnGbBH0lPKxfJiP/RAsnqjAEHnjDcGp7dOra6doR5j7qLDAQLsnZAIDDD+bgLrEo1dPf1DkvjZXlbu5Fg6nKjQV6Bzv5qK1aYWZ6nkD4yyQyonXw44gyhAKjQg+DO+O7PlJyp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm0wUjlVU3EydytnZGJOcWFTc1NYZHhqQXpOUmRpRlFIS3QwczhoWjBlSnNq?=
 =?utf-8?B?ZzRMdDZTNGdEQ0IrTmdXcVFLUDRGUHhUM3NpZXRxUkQ5aGVlSEl5eHNDWUwv?=
 =?utf-8?B?L0hCK1IrcFVrYzlBOWpEZmI5VWVteExTQ3BXbmptaS9INFFOZHMwRDY1LzdO?=
 =?utf-8?B?amNRSS9BbmFGbjFYTUpWQVdUdzFuSjV0ZTNYbkx4TTQwT3d1TlVGaTVna3I2?=
 =?utf-8?B?QXFrZXRHdTQydnBhSWkyMUN5eEtUN2NHR21WZzdaeWd5blBUemE5MWsyaGg4?=
 =?utf-8?B?N2oyVFNZQlU0OU1HOUI1OFI5a2VRUzVUK3QrUTFjcysrVXloMkxlVW9uMVpW?=
 =?utf-8?B?bzJzOVZmRFMyWHVmZ2VVRlBiV0VLV0drR0VSZzR5V2VQTkNncDF2TllGR3JT?=
 =?utf-8?B?UzdDMUVXT1RRMnBxTFIzNXpBWXphUzE4MVQ0Nm45MnJGemlkV3hVeXFkQ1ky?=
 =?utf-8?B?dVNEb1grSnBjSGlHMzNlWU9DZm5lSjB0dEM1ZlAyMjh3ak9ZeDJnQVlBVFk0?=
 =?utf-8?B?eUNwTXkwNm5TOHF6bWI3T1A3aGFWSFBrTWU2Wm5ZTHFPQ1lZZHJtVnV4SnMw?=
 =?utf-8?B?cGFrZXZ6SW9TSzI4cVk3dDBxUXIzUWN3RGg1L0d4V2VjZmtXUllDcGNaSTNX?=
 =?utf-8?B?NFl1aURFaTBWZzVlZE9HbWtjdjU2aUVGVmo5Y1psdkpKLzZOb2JrKzZSU2dy?=
 =?utf-8?B?VVlkVi9UMUdYQVNVUEdoRll1Wk9LNkNLK2RGU3lLV2l4RG0xUjNhOENVY0k4?=
 =?utf-8?B?VzRXQ09RNGc1Z0ZIZE96Wm5HbHVWRGxqeHFINm1iSGdUeTVsa3hrbE85Rkpx?=
 =?utf-8?B?bDM3Q2tDd2hVVlIrelJLeVRjaVZSSGZ6RGpDQkpiK3FSR1k0NVlTeVFtVzdp?=
 =?utf-8?B?MzhmenVJZEJCZllQY3dTaTVJQmYyNlI4R3RPeVNRenJ2NkNPdkpWZkk2TDBs?=
 =?utf-8?B?TVJuMGY1YytKTVoyc0pyaklabEV1NEUySlREN0haOURyT2JrRWR2eHgva1N3?=
 =?utf-8?B?em5wUVlFKytteTNxUzB6dm9SK3pXNG00YWNrVzRQOFpSL3ozRDNwTGJzakdx?=
 =?utf-8?B?YXk4NTVnOGlhSDcrKzhVa0JscGlkZk1rTThHR2NEZnh2TGw0SEorZGNJaGVm?=
 =?utf-8?B?ZVBkSmFHcnozcFU2MnliRzZLZGVhelAwSGJUaFRVMnFCNXJBK1FNWW4vaU1x?=
 =?utf-8?B?ckJCcXE3cUNXSjNUU05wOVMyZ040TFp3bnVRZ1l3eWk1UVRiUFFiZmxyWGVn?=
 =?utf-8?B?d05DclBxRFlLRHVXQ0FVSG9YSTZxL1MvYlJIeFJCSGh4Y1NtUDRhUnYvYy9q?=
 =?utf-8?B?a2xjb0J2WGx0ZDFRUG1GU2dHb1l3WEZlUUNUaVRhdUtaVTMwSFdkT2IyaUFm?=
 =?utf-8?B?UHYvbUNzZld2MFhLT2h0a2U0eHNzSjFwZWU4SndYYS9QbHYrTU5WZ3pTek51?=
 =?utf-8?B?dDk0QkpvYTlHUWNSZDUvTWZFUExBYlVGTTlFQjBoQ20yOWZRL0c0Y2ZzS3cr?=
 =?utf-8?B?UXd6L0ZLY2k0MlB4L1FEUXVTeWZpZGM4RzJsVDB1RkEvenA3bjNzT2g1YldO?=
 =?utf-8?B?SmtDcXA5VDRTbEZWWTVCVFFXZGd2dENtNFA0YXgyb3N4OW5BRFFRcTNuZSti?=
 =?utf-8?B?M3NOK2M2UU5CZzJ6QmtkOFdrNVd0SllGV2dUOEE3eVJPNzNUWm42U0tWNDRT?=
 =?utf-8?B?SjYzMnpXNnJmSjNBMDl4cjE4aG1MSm91c2RaSTl6QjZDblZ5MnRtSU5CSVJN?=
 =?utf-8?B?MzdTZU9FRG1KUG1wTTg3R3E0QkFyR2ZmcXFWMVM0MUZIcXJOM0FEQ0NqUkxk?=
 =?utf-8?B?ckM5N1pMN3Nud3JBWmVkMEJQZHlrNEtPSHdTWmtIMk5XSFh3L1RvTWhPenpu?=
 =?utf-8?B?eGF4QnJobHp3NnM1VGZlUFBEM3U2OUVlWUlqMVU1TjdIOU1rU0VRUG40RE5x?=
 =?utf-8?B?NnVxcHR2M0lMNTU3eW41MlFYaUh1VzRWQzh6QWdZVm9BZEs3WVhtSVh0UzUw?=
 =?utf-8?B?R1l5eWtObE54VHNqdGx3bHcvTit5WFBQWVdwOVN3NFpKdjhaY3JaeDFwQjB4?=
 =?utf-8?B?QUw5b3o3WmJVR1M4RzM4V2dhTUtFZ2Zmc3JMMmpkYzdyeVZHL2UwR0Z1cTRh?=
 =?utf-8?B?Z3JjUENyc2pOaW9RM0grK1JleFZva1FwdVlRTTdmMjZaQ2IzN1hxYUlDN2E1?=
 =?utf-8?B?YlN3dVg5WXUrWnpwWVFSRE1adTJOWFlyNkxpcnpjZWFpZ1Y2U2JBamdBcU5w?=
 =?utf-8?B?TEV4WGtZZnFKdyt6ZGVzNmtYUDQ2Ky9iQTRsUTdjcWRhNDloSTA2STc5TDVR?=
 =?utf-8?B?d05QZHdSaXRGTzFiZENocm1EM2hUcnZGQkc5eEpTbStGTk9Ua0J2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9127bd3-b7d4-4c26-9bf5-08de7e2ad6c7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:25:59.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkWrz+GGiWo6b2+GlP6uVhRNytB9I3pM64wIMAD3wviMXMc60wewFItIMnEYpZ5SGKRV2jT5WBps1g4nmc27YkFD+iLJRYQ7K3SLdf/kSW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5258
X-Rspamd-Queue-Id: E824924235A
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
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27/02/2026 11:16 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 2f40f628cbff..e2c35a046e6b 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> ...
> +        case 2: /* SYSENTER */
> +        {
> +            /*
> +             * FRED delivery preserves the interrupted state, but previously
> +             * SYSENTER discarded almost everything.
> +             *
> +             * The guest isn't aware of FRED, so recreate the legacy
> +             * behaviour.
> +             *
> +             * When setting the selectors, clear all upper metadata.  In
> +             * particular fred_ss.swint becomes pend_DB on ERETx.
> +             *
> +             * When converting to a fault, hardware finally gives us enough
> +             * information to account for prefixes, so provide the more
> +             * correct behaviour rather than assuming the instruction was two
> +             * bytes long.
> +             */
> +            unsigned int len = regs->fred_ss.insnlen;
> +
> +            regs->ssx = FLAT_USER_SS;
> +            regs->rsp = 0;
> +            regs->eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF);
> +            regs->csx = 3;
> +            regs->rip = 0;
> +
> +            if ( !curr->arch.pv.sysenter_callback_eip )
> +            {
> +                regs->rip -= len;
> +                pv_inject_hw_exception(X86_EXC_GP, 0);
> +            }
> +            else
> +                pv_inject_callback(CALLBACKTYPE_sysenter);
> +            break;

This isn't actually a correct transformation of the IDT code.  When the
SYENTER entrypoint isn't registered, this delivers a #GP at
0003:fffffffffffffffe

The simple fix to get back to IDT behaviour is to simply drop the
subtraction of len.

In FRED mode, we can finally point the #GP at the SYSENTER instruction,
rather than delivering at 0.  We could even provide the success case
pointing sensibly too.

The question is should we?  Until now, the differences between FRED and
IDT mode are minimal.  This would be major difference, and it's for
SYSENTER which all but unused.  I'm erring on the side of "match IDT".

~Andrew

