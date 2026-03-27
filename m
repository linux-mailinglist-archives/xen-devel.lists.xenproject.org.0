Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJHfHV7jxmmjPwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 21:06:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5B34A952
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 21:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1266212.1556707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6DR7-0006zh-Lc; Fri, 27 Mar 2026 20:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1266212.1556707; Fri, 27 Mar 2026 20:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6DR7-0006xC-Iu; Fri, 27 Mar 2026 20:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1266212;
 Fri, 27 Mar 2026 20:05:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w6DR5-0006x6-QM
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 20:05:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6DR5-005SjX-68
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 21:05:39 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c6e2cc-5cb7-0a2a0a5109dd-0a2a4507ab3a-38
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 21:05:39 +0100
Received: from [52.101.56.4]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c6e311-fd74-0a2a45070019-34653804cc92-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 21:05:38 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB4919.namprd03.prod.outlook.com (2603:10b6:a03:1ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 27 Mar
 2026 20:05:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 20:05:34 +0000
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
 b=BoF0AtWX35yTwWEyQ03ZCAjQYvlz7QSVD8SW0REv58P0RcOks0LyZ4JsBbQVFKHbiDSCRm59qIFMtuNHeNUGL0c9L113JtVBXMm/jI47rNmUrrhDt+BmMizZPHJkjbP5VPUtrPoZG9VZGRE11C2V7ModgAySv+sC1RAC4+2KVoauiFbPYGDRCvGXZcuhjX6/js3pV9+4chu93ktFw/3vy9PGc8DEMBhHdmKu8IsFZVXXjKyjzTy5Oo+PnVVXhppF5wLv34FP30VYi68o14yfp/EmUOZr8aYG5K4e+WkSyk3kb8R8SaGoekw7Wgln2xKS3D0AiYPGSJ+oFDILm/i8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLqNwHq9MYNAGDx+8vF5IRUVzTyHXsl5Qtc8I/H4QX8=;
 b=Y9CoJkorjtz/nq/Nk9Ue3geR+lQ6KJlQETWZOMVMadC+16xup8CmqkH/R6H626HzJoDKWEjrAQJrgE/k7FVuRJFCNIUQus2VsTkwZofNx58QZIzsswIFXkmGchEZ4yZGRydRLT6dScJuTfnAz+0aLgdX9J7xTucwKFvKKuYEIZ1PKcZgoYXwAiKzQdIxq8eKmomjjIlKahWFh0ute18zVRrGFH71SW6epFYrQ5/qkjMgr+H4eosv6GqHIObC36hnCRkf5t3dJ0rvSXQn3efZTIRdhV/fyLdq23JSpi95DBFNeTxOurM25or8J0j7s9r3hFGUgP8/ckmAr7p10mktMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLqNwHq9MYNAGDx+8vF5IRUVzTyHXsl5Qtc8I/H4QX8=;
 b=Nk33XM45BBNnox8nNb7vkWkE8rk12tT72X5Aas8NzeyfV/z7JH4s68g0W7f6PLS9QZyBMDKs47bGQDwrYI2BK+Es7yqJWfhCKJr+8kVDrraMpggC59x6NRsq00FwM6Yi92c4lKuMXURlaNq+vAoRWis3w+jhP3UDtTyqQ9PU+1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 27 Mar 2026 21:05:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/time: adjust handling of negative delta in
 stime2tsc()
Message-ID: <acbjC0uq98Tcwj0H@macbook.local>
References: <df31ece3-2c42-43b6-b97c-0867255e58b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df31ece3-2c42-43b6-b97c-0867255e58b1@suse.com>
X-ClientProxiedBy: BN1PR12CA0004.namprd12.prod.outlook.com
 (2603:10b6:408:e1::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b10557-6d97-44ef-e6e3-08de8c3c3468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rC+TJuRn9ojedVV8P7jI9Df3ldbHxW2sSG+/lrGk95NGjm3byp+6AYnQTP/LCmhzK+2/5vJECoOunio531Pzafhb782IvAEG5IPy3kK8ZX5FqG2mHLoFIfQQhRx5wnpMZRSAyYheAIC/WGDuch/K5M0HYZ6Ic6+WU8jPaDPOqQ+3Q7aAGS04KgOlxg/6P3XtmJny1aIVGMh/6y03iA0awvwJ35AwB2Ge1H5q1oFlxONU6Kh/A2JevmypOj9jvXh4j/WJoDDMmaR5z071R4JKEWMi2mxM0C5UHw5UwGBvg22DJfZMfG3snf80GFqN/fjtgobs5sUPl8jZWWzRdketC6QtDCwRLrgBK9btr47O55zbaNC9totuWRr8oPW/3jpn0NPNyUYX9dGnt3WbJZGGd+CYFDiHPKm0wrsYrFY3rjzkrO1F6YRJrKqkFBd45rZmi2snnHT9Yx2Mndz6pd+/D0b+B04sUNn7xUcw0W7kSLuSQdDm/zTTgXrudtTIjzyKi3DYkbPY+QvMUCVbShwoVPXI6Vmd/8SY13ZQq05xxyLqpCYLReWxRe0x885Ma5oxT58ah+U+0yq6TiYborzstOhIPo1RI/HZWcYj/+ucX9xWlbDPXaKb3goL4pcsqnz7czEyPKmEGg6OqkgLvYJzbQd3nI1vlrM6wNoF1EkSZoTdId/XaCFzhPhYuprqgaVgBKjWTVGU2/lj3+nOUtX/K4F6Zk9SJyIPCKin5SjKHQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1IrT3JWMEVhL2NvTlhTanBETjhHeExDR09FeUFlWXI1RU9qVmk0aUZoKzZX?=
 =?utf-8?B?RDVPNm52WWlkd1hyVzRXcFZNM0s2YXV4bVgxd3RXbEZ4MFhrVGwreTFoNFdu?=
 =?utf-8?B?TXlCTE43QWozTzVCR2FsSVBFMHBMNU4rcEVVRGw5TjBtdFJnMXdsNnkyYmFX?=
 =?utf-8?B?WDFod0c1cXhCUWRPRnF2WGlzSnA3Rk1ISTFHRUF5RUtlM2JYUzQ5Zi9FZlhF?=
 =?utf-8?B?MXZMaWVXUytabVBLeEllOVNEL0ZHVGNPYktSNkkreDJta1FvZlluQVZQZGc1?=
 =?utf-8?B?YXJHdE8zVnl1NmV6RHZzK1h6VzhWUUZZbGN5ZTNkczhXNnkxcXBwbEZacGpX?=
 =?utf-8?B?TllLY2p3Qm1iVXNHMWxZY0E5VzR2TWlrNnkzSWM3Y1hlRFdPRW5GMkwralpz?=
 =?utf-8?B?OWtRVDB0cHUwajF4SFlIbUEwS1JTMmh0cVJzdG9UbmwwMDFKRmRxV3UrT21T?=
 =?utf-8?B?Z2RNSDVRR0k5RS93SUVHQzNRQTFSeEIzWnNTQTdERWNGa012WDBjVnVyU0VV?=
 =?utf-8?B?SGI3TGxzeWFkQ2psL20wMUJsdk1KOHpCYnBjbDkvTW5yNGEwVjlPc201bWQ5?=
 =?utf-8?B?ejcxTmhUc3l6OHQwcEFocUNXQjlnVkJybWdjQjh4SWYyK0E2cmRYaUsxVTdD?=
 =?utf-8?B?N2owZXhkSjB4cTlPMll5R09UcDlvZHNTdGNFajdsWFQyZmdwYllGWkFTMmNG?=
 =?utf-8?B?R0M1Rkd6dEVmVCtXdWlRbWJ6N3FHN1pPMEpXQmZVTCtZZzc0SGFLRHdpWVc3?=
 =?utf-8?B?czZxUU1TQlFyWCtYc1R0TjZMWHhEa21LTzUxR20rK2dkTVF5VHR5VFY5dHZ4?=
 =?utf-8?B?SWNSYTZuWUdQTlJxUmJCam53NGMzSEpDQnYwUWhDeU9yVWVkQllxUWZZTEhO?=
 =?utf-8?B?Y1BnWFJLTFc2dFB0THprZzMrL0h6cmNnbXJnaFZCU3pDQmtza2tzbjJKZ3ZW?=
 =?utf-8?B?Wkk4aWNxcGtmemJTOW9ZaHdGOW1iZXhOZ0VoVk1aY3ArMyt1QlN6Nk1jOXhD?=
 =?utf-8?B?YlVIejV4SmNxTnpZYk5weHF5Q3pRUE5DdWlQb3FiUnV0UXl3Y09wWkUwWmJk?=
 =?utf-8?B?U1pKVjdxQkNNTUF1M08zaEMrdkZsV1Z0Z1dnK004VGJRTEtGUUZtbjVUODFG?=
 =?utf-8?B?SjlUcmhUaDVaTWpmOGsyVG5PaTZkc2g4dnVGTXpjSlZLMCtrRXJRcEZGb0kr?=
 =?utf-8?B?YnN1VFd1UnVvVVpTZC9abEp5cTNjcGxKSVJLeXZjcWhPS1NMalpCZVVvZmFz?=
 =?utf-8?B?TEJsUUlKK3VLMHFSdWJKaG1IdWlBdzY0SWd2QVhqVnhIekh2SlJHS0dkVU9u?=
 =?utf-8?B?OTY3ajArK0NrK0JON0E1UTNtQjByYmxpOFpzdDVvZFpxbE5mOUtsRmxzS01r?=
 =?utf-8?B?TG1sT095R2JGT1QrdTB5ME8ySzlRRVFVbDBPOGNnRjVlb2pzaU9nb0xERTV3?=
 =?utf-8?B?Y0JGem5OdVovbkIxRXl3TWMzYlcyWEtXTm1qZE1mbzQvRXQ4N2FLVTJzdTFP?=
 =?utf-8?B?RWk1SkI3V3VJWFBuMzRVTnAxWnA5OXJ6ek8rSktJYWNRVkZ2MmxIbE41elZZ?=
 =?utf-8?B?TzVwY2pMZ0IraG10YUxJRWxZMm91TGZBeVFwTmxmc2lkRHBCUjhENDd3MjZC?=
 =?utf-8?B?RGc0SytaTUNJbUhMdHpSNWl1WFR3SzNLM2NybWpYZjNIZWQxSytGM2pyZGtP?=
 =?utf-8?B?dmkzR2szM3NTNzFaSUxQcDhMa0FLV0tUQWNBMVVRZ3NpN2tubUZjZEJOeWR2?=
 =?utf-8?B?Tmt4UnBwZnU5RjZ6NEtwaFVMQkpxQVlvSndySUlmanRQSnlIaWU5b1ZiUWVs?=
 =?utf-8?B?UFpVc2pxMVVyOE1sRGdSZ0pEU1JzWUxTWXVaenIxbTlvK01TS1hoZHBWZnBR?=
 =?utf-8?B?MmR6Q0wrUnJhV1haTGw0NjcvZldNYWp1Y3dTZDcxQ1RmTk5vVzhITWV6OHlo?=
 =?utf-8?B?dW1FclgrVzY4Mm82aG9EcDR6cGZiZFliV0RrTVQwM0xYdEtlWFZOMGlWVnFQ?=
 =?utf-8?B?bjByN0lNZWhYdjdTRWdvTUJSb0YxeGdoYnBFUGZ0UjdtcDJCS3BhaDFvQnQ0?=
 =?utf-8?B?TUorU3hIOWVwQzFYUkJhUnFoSFRaTU5tOFBrN2hYQkQ2MlVyODc2S0x4dGZl?=
 =?utf-8?B?UHdGMHpTVWFJV2NWSDNqMEt3U3NLU0pYWWFGcVNValBlbStpOVpleWdyNTRt?=
 =?utf-8?B?NmxIUEhGeEtBNE5Ndm54VHlSTzJvS0hCYXA0dmRORm1LbGg0dXkxWkM0VUt5?=
 =?utf-8?B?clZNODlCSFZPa0tOM0dTYVNxc3paQzFnUUNGVXhiS1ZubHFMaVdiS3g1MDI2?=
 =?utf-8?B?V29CMUxNV0FQd20rZDU5QkZrWjhuNEZCa0J5WnZxYXVqQmNjRzRCUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b10557-6d97-44ef-e6e3-08de8c3c3468
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 20:05:34.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8B7sl/l/mD1B2GS5oUgSrRMBToTabFJTaRrDkR5ROcqA3MWQ31FT/D0LK/D2qy5cfPpWwuHPfci5/ikTH6SDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4919
X-purgate-ID: tlsNG-ef75cf/1774641939-4E8AC303-ACEAB31A/0/0
X-purgate-type: clean
X-purgate-size: 567
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
X-Rspamd-Queue-Id: D3A5B34A952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:39:42PM +0100, Jan Beulich wrote:
> When we cap negative values to 0 (see code comment as to why), going
> through scale_delta() is pointless - it'll return 0 anyway. Therefore make
> the call conditional (and then also the one to scale_reciprocal()), adding
> a comment as to why there is this capping.
> 
> Modernize types used while there, and switch to usiong initializers for
> the local variables.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

