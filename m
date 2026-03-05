Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA3/F4MLqmn0KAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 00:02:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F721925D
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 00:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247219.1546015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyHhD-0000vk-8l; Thu, 05 Mar 2026 23:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247219.1546015; Thu, 05 Mar 2026 23:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyHhD-0000tG-5u; Thu, 05 Mar 2026 23:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1247219;
 Thu, 05 Mar 2026 23:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4Bm=BF=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vyHhB-0000t9-Ne
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 23:01:29 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d60c875-18e7-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 00:01:28 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7993.namprd03.prod.outlook.com (2603:10b6:a03:5b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 23:01:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 23:01:23 +0000
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
X-Inumbo-ID: 3d60c875-18e7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Htp9lVvbe6xRNsKER0lw1KeL5eaVXlxsSolh+Cac9O/1DntTYwPjlMZ2uVFxS+l6IDFgK6wrR/DFODiSYKOOnLuHRqLHrcbpi9EG69qMCeSGzCfBN3oGJFSc/WnwZW5q6U0QZQRKYw3yLbXuB8Dqb2bPMhTi+BXCBOqMobyExvrcilFzbwCVQd9fBzaqS8zHjo5jDlJ0ks2h3f7XoL7fZKAvs1S+MIAE3H+fJCjDubgmpRpXHavODe0T+fOVEXHwhLdW/N0yKemK8L/wWI7f5zNpj5ANBp5KXV5agTFxqsr+/TDG2XzKeckckmChUOjVp3ZeC5XOKvBtaOz7S29vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdB1xUBS8xTu12mJFI7HIru34MteWtqhpTTfhnCbXiE=;
 b=hbpQJliuMFeKqG0tho+mLbtFpPa6gcXMPlozG12XEnBP4yhfr3fDIDELVmV2puMxL0sfOWsy7fa835IKxyzupStZUag1RhBtxmzJ1hHimVnRFzQAz9Dusa6xB3LLoyi3O+mFYXQy2GZxlFUxbUm0oCQcfjQwfkEfVWjtLMsvZ+9zBy6bXEpyP/tNJcOH528TqSLdR9NWikVrowup/AxXM5Ak+QTjd02kQ8uUCFt5hRAaJHKIyQwxamfdJuy5L5GH+jBIv5qHQpJ2WxKBq6ejMuVEKL2CMCFLMWEUA0gi5aquQMHKO3CaH/EImG7B1Q3C6wK+obaHeUKA2y58EMXG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdB1xUBS8xTu12mJFI7HIru34MteWtqhpTTfhnCbXiE=;
 b=IRdQTwzVNW+B1tX/xcZALeHdP/HMZt8bGbj4joQNw+9B6QRniWPPQkdrSfigP13uvgnyZGObFMmtCsitYbC1f5TEYLL+ait/22VlAFaW1qP8ZyJAqoR6MQ9Ddjb+JU0g6/kmFmrV6s1pCMLyFcSRkLONq2l4g5zQDl2eLjPCwyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
Date: Thu, 5 Mar 2026 23:01:20 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0503.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce1defe-1ca3-4e3f-ba95-08de7b0b1f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	JK2bv818fgjsnkDwYNOELaC3TxvoMgzD7QnEhKgvbJ1Yj8DHbLP21kdtJ0hgpibwwiSaXB0HWa8D3kGQdNpelIfi7UuCeZS4KQ1aRMSVJz27mXn9KXHmKKbt+5GpWAbjh4vQ5fqgWWTKn8O81yTqGbYlipc0ApsshFAmKa2xYGAGKl/dOyfODPJSQSqAjycZQDXv9M34s7L4ETwOVOb1aRkzPtRHeebgXjc5G0K7Eu0Zu2PTGVNM5fOBBDwVoOcF4q27aDtoZ3mhYdx8G3J2S0GYrIVERkY35MWkOM3+Z8Y/3XwR2asVEqGmiV+JGUSMJzQYYNNPTE0B+9Ni8df+1OvB7uD1WG4hhNC4muZZ9v322G/1hHG5M/WvF5xc3/q0Kjr2KWkPsruggJawB/Mvv2h6/Tvkhtk7wseFstug9IOgGRcReeTYFg0UjWHKWb1hqN1F7Lx9WlM67XCzVcDqRjlHCiDNiCxzZXxIzY41eVtJ1bjKTMSztm+xJsJ+PvKzQr20jDArpj6urutfjqjNfpkm8iRA+qRXXMf0HYcdOhLJPQI3YUA+5zKCYzWnQk/YkGn9XUPZHFHm89PRcVHtAl/5di6zhmYZEeIqj27w6inya5QrlfxZpO9D8TkfYhh2+ttxR5N6PeUQU02d1CkwSShec6dB4LnvK+LmAlWSMx2qsTg/gx+fcmxUCnwaxE9oaKqb/GM1mFGel3/M1Tgtb5p0RSB30Q0y+mN+kl8lqw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NQSjhNeWg1S296Q3VEZ2FTVitkZFQ4cTdiK0NPVVZGSHp3N293c0xuSjI1?=
 =?utf-8?B?NldMVW5OVi8ya0hLMVo5eWNNSlhYb2o3Q2srY25pMVBCSXZ2UlZWeVp6MlEr?=
 =?utf-8?B?d1o0TGt6TlJ0ZnE2Y2RFSlZRVjBEZDJDTjJ2dXAvbUZPeHJMOC9MaDZlSzFS?=
 =?utf-8?B?R1NUcXRiYklOZVBOUG5VM0dqNjhXWnVSa01rTjRMaEJMYlhheHcxTHQ2UWY3?=
 =?utf-8?B?UlBCSzVhU291LzJVNFlsVkdwendkRCtCeHJwa0VyR0NlZlZGcHVGY29wZUVN?=
 =?utf-8?B?SDhMMG5FQ3Y0d2JxOFhJRHB4SXpZbXErK0JTRTBqZHovYmF1T081UjRsWnRl?=
 =?utf-8?B?ZEI3VnpXd3JqcHc2Zjh3V2NmMFVYVkovSXBYejFsVzVSYW5iRWU3eUhhcG93?=
 =?utf-8?B?TWFvbFBGVmtMcEVmYUZmSkVKQ2hHOGFIU0gzOHpVV1J2VDh5SXE2WXZCajdF?=
 =?utf-8?B?Z3RBY1poTGdzTTR1WmdLbGo4VEdBN2pJbmgzamJxYjJaSDcxRTVLZy9OZWF5?=
 =?utf-8?B?cXBlWDRXdHR2VStOaGhEM2tMTnRGMnl0bGN0SDh5dm5TdXNRakc4djJacjdu?=
 =?utf-8?B?dUpIN3JBajBBUDBEdmluWG1IUEUyNm4ySGFjMFcwNENHUm1TV0pOZFBNVWo3?=
 =?utf-8?B?eXlSUSsxOGpsLzdOUWZiejg5Z1pZVFRVMFpIa0JDVXdUUTlTY1h5NmluMU9S?=
 =?utf-8?B?NXNBem54USt1RmpkS3M5SFcwU1l4S3M1aytaRGZEU3lFUlZneEtFYTRYaFlS?=
 =?utf-8?B?SWhzd003a0ZDNTFMOW9aakpBQlBxOTRGVUFhOXJVWkRMK3F3NnJ6UXJPYWhm?=
 =?utf-8?B?ZkR4V0x0ZFdZVktwdXlvd1p6SU9vaXcrMjd2RE0wSTM0TlF5TWRVMFdLZmlO?=
 =?utf-8?B?V0NCNi9tOWt6cG5oL3dVUk9WOTBMQVR0OHRhbTNUTFVlK0czYmdEZ3FGSWdY?=
 =?utf-8?B?NDZhcEd4N1hyWlhhUnJQV1NMalV2d3U3ZE8zc294SlMzM0FRRG5NL0NkNkdo?=
 =?utf-8?B?WFZNQjdId0VpQVBmUDFLN0VpWDhXSkQ5c0tTYkRJRno5cyswdDRiUnVZWGxE?=
 =?utf-8?B?ajViQkhYYTFmVjVEazFHZ3RUL3BidWhMSjdmZStjQ1M3RlBQQ2JwS2tzaEdD?=
 =?utf-8?B?clQ1MzFWRmZpaUxzVzk0VDlmeDRsRWpMY3RRajNnNDZiMTFsRUZTeitmVUlm?=
 =?utf-8?B?WGxDdXkrUFNwRkJZS3N4amFiOFJ4ckNzU1N6b1hISS9NK2w3VEsrSkZwZ3Uv?=
 =?utf-8?B?QVlLMjhmYXpFUmJZNGNoTHQ2bUJmM3pwMzVEWG5UTDB0VnQ5aXQ1WVNGTzA0?=
 =?utf-8?B?YU1qQ1IzK1F5RUNsaVhXcEtJM2UzRVlqZlFTOWxYSTRzMmFlYldaZ2JmbFNR?=
 =?utf-8?B?RnRjY3c2dGxsZUl6b3Y4K2FDU3lxOFEwWFl5SG5oc0N2VklSVFRua2lDaURL?=
 =?utf-8?B?VlVac012QjdIOWkrelFWQmZwUGtlQWpCajFZT1padnd2ajhYalNxMkVjRWxh?=
 =?utf-8?B?VlBCSmhEUkpodTU4WUFEOHRORnZ0RkJGT29zS04rQU4rZ1BiMzRRV0YwMDhY?=
 =?utf-8?B?Mk9oeW4va3AwMXRkRVkwS2pPMzFST2FKZlpEWjYwRkVmSnJ4akVpa0tZWDVp?=
 =?utf-8?B?S0xObGkvdlpDVGlYWC9kVGNYSFl6TThqRGh0SHM0MGxIUlY0aE81QUttUmV5?=
 =?utf-8?B?aVU5R2Y2RkJGQys4eFQwSUoxajlnMkg0WmV4TUtpSGtiTW1ITUZtRUxEU21J?=
 =?utf-8?B?WGNZWXp2TEZaMzUxd1JvT2JWUGdWRzk1ckNnWmJ4Q3NLNEE3ek9NTThwdTF2?=
 =?utf-8?B?c1FnK3VHNVBMbWdiL2NIbkpwdklrUXpYcSsyYTV6bUYzSFJoQXhWTytGQ2Jq?=
 =?utf-8?B?T3g5S1BwekIydldVbGhFNkRlVk41MnU2TnpEWWxhNjU3YjRFUWhnZlI0TzB1?=
 =?utf-8?B?MThFU0YwampOakpCVFlDQzU4NDNWTUFHMjRIUk5LTzRSUmtVOG40aXIrR3Bj?=
 =?utf-8?B?b0FITU1SUitUUmtRNUgwUXVqZTRMaUtpRmR2RDZCTjVEUUVhTHlJa3VObE5r?=
 =?utf-8?B?bnU3N1NQZHVSVUVES1MxQTBlVDBZMCt1cEkvV1J1S1dNSHYvZjlsUmFtcHJa?=
 =?utf-8?B?UndtTVA1b0Q3TDNVUzQ1SExBbjlXZGFxUGw3U0dBRlNEaHh0bXBabVRHUW1Y?=
 =?utf-8?B?aStuODJqdTlxR2RYRGRkRjlaNXk1R0dFSkgrbkRhTlBqUTFIcDhqaGsxWE9H?=
 =?utf-8?B?TVZlaFdIZnh2ZzNtbmdlZEVyTnF1bXJZTVdHaWVhMkpBeng5NVJaTnM2QkIr?=
 =?utf-8?B?T0ZtN3kzV3lHZTliemIvN0tJeEN3RGs1T3pmOFQxcGVuS0lxenRwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce1defe-1ca3-4e3f-ba95-08de7b0b1f95
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:01:23.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+gayrsQIH+ZBD+ojrZh+9SUV9f3xDYMHHrS9g2q5t8DYk9T1toAiErm8oARg5mLzY6DNVZ4o8FObnUNjevRIrWRw3DiaMq4m10fmwsbF4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7993
X-Rspamd-Queue-Id: B37F721925D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05/03/2026 7:57 pm, Ayan Kumar Halder wrote:
> The lr_mask bitmap tracks which List Registers (LRs) are in use for
> virtual interrupt injection. Previously, lr_mask always used uint64_t
> (8 bytes) to support the maximum number of LRs across both GIC versions.
>
> However, GICv2 and GICv3 have different hardware limits:
> - GICv3: ICH_VTR_EL2[3:0] encodes LR count -> max 16 LRs (4 bits)
> - GICv2: GICH_VTR[5:0] encodes LR count -> max 64 LRs (6 bits)
>
> This patch introduces conditional compilation to optimize lr_mask size:
> - CONFIG_GICV3=y: Use uint16_t (2 bytes) - sufficient for 16 LRs
> - CONFIG_GICV3=n: Use uint64_t (8 bytes) - required for 64 LRs
>
> With this, parameter 'lr' in gicv3_ich_read_lr(), gicv3_ich_write_lr()
> cannot have a value > 15. Thus, it should not possible to hit the
> BUG() in the default case.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

What does this actually get you?

Because it doesn't actually eliminate the BUG()s you reference.

If you really want to go ahead with this patch, then make a  lr_mask_t
or the right type and don't double-code everything.

~Andrew

