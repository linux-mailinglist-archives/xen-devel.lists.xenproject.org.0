Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN04FAKfFWr9WgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 15:24:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D825D6605
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 15:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319914.1587358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrl5-0007HI-Gv; Tue, 26 May 2026 13:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319914.1587358; Tue, 26 May 2026 13:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrl5-0007F4-EK; Tue, 26 May 2026 13:23:47 +0000
Received: by outflank-mailman (input) for mailman id 1319914;
 Tue, 26 May 2026 13:23:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRrl3-0007Ey-AX
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 13:23:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRrl2-001SId-9C
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:23:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a159ed2-bab6-0a2a0a5309dd-0a2a450c875a-38
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 15:23:44 +0200
Received: from [52.101.52.28]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a159ede-62f1-0a2a450c0019-3465341cb46b-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 15:23:43 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BLAPR03MB5524.namprd03.prod.outlook.com (2603:10b6:208:284::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 13:23:40 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 13:23:40 +0000
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
 b=A3cNEu31c51lvq4n7llfJsMotiEig3h0OdD+iEdJluiCVeOIBfWCNnaI8kg/AC72DGDxYB1z7AsE1WQze0leV4mI0nARd6yVE/FyqpeBLs/XQmEUmdte02vilFPE+kSleSuyYsNVhGqCJDJsDpTXGBvqIllT/Y3xKXiv+Xi4o9DMyH/Vxukq9ShPfZVrnHkLgwZ1Fpl0ETBDJ4D1R1LzyeZxedUiL/I0F2oDoiXH/PllbQN7f/d8hOSI+ugsO46gIpqRUy3FpyPDn/TvOJRyHvg28ta8XImcCrTa/RyYU5OPFeeGPS3zwhhQHMNSPeTG15jgR2zxS+ERU/9kS+vXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD6lhTUAjdgXqG5782mJEZt1e6GgZGY5iYzec1ILZas=;
 b=m/LCdzQVKPx1DgENjAofE/bpfOpC3fmI5sSwZwtNNQxzOKdSf6WhazTxNBQfYyOzJoYXI0qEcxmHZRcgnRlX4VJdJFurWq8PDtf32v0HoaUUHOC5e388ozBB6N2IhDTzfkhsKYiejBNZpW4A/nEGLAGiWhE/QKCG4cFInZGZkL228tVWFgOAGJGkn+RyGPrc2OtGXrROp0OHXNkS89Oep1vEznJ51oKYk/w+k7fvaoQA1c6lO7JlLDfd0mFSAJ4mkYPQf4zCgEOVJXxMlZdbdgQWutPx3cps5XXTyLyH+xCAL1Z5GHfJWbUp0sc7Beg+xKj/fYobMkQNbEBB//xf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD6lhTUAjdgXqG5782mJEZt1e6GgZGY5iYzec1ILZas=;
 b=PdqnB7tuRVXPy1ZEQ9fbiT1QBisJJVmhfek+JrBB9gP4g3fagX7lZPdspI6U9yktGZHPnD4GX+50CAJAvSUCtBfvSAn+rPSnQCxxls7D0Y/Z06IXTYWhBc3voB5yPlEK9JaA4jzoUp0k755NLGudm+mLjOOkSkDOt9pC1dAnUJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6e81d92d-cef7-43e4-8dfc-08c5edbb504d@citrix.com>
Date: Tue, 26 May 2026 14:23:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-2-ross.lagerwall@citrix.com>
 <b9ddc37c-216b-4c18-8d77-03ce641d2614@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <b9ddc37c-216b-4c18-8d77-03ce641d2614@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BLAPR03MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: 4126c23a-cc34-4ffe-3ca9-08debb2a0035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y0ASxCo1cgCCxLzMdNnnYKwZ/sumKnpLYkUfOFgkFpq6T+OK4xaIMitJqaav9SoajpiSGDjjCVrh9PfKR5FPLRCV7gxZV3kfJJFNq0mJuC/15QvDVEgnSKWn7MBP/m8y0M+AaVk3MCdyBg9UXxw7Tj7EM8fS21Gh1QkZ3/jPIURnGl2tNps8bCdsXmmPDtEzt/EgV7i986U4E4cqTHHdMTaNgQby28/zlJeA4v7AgjBt+IXGjJXlXalHgJ8M7DyfCljPtV4zf6d2Oy910LeGo7H2akB9AFY9cSJ6t3cuI/JvFAK0KnRWqWGRICijB9aRs5re9svOs5HqTcEuLrThs5Fuwn5bQYHH9PwEI2kNIrHMp0PVzp9Or1yLd16y0VpSEEqetoIxj5u2KOCDrkykMkVSYMtncl2RsNsyUXQbujNT0MoSwUOezTux7FNS9bhHTz0Y5bRE9dexe5gMvIGbhLqDWGMjTfrjLS1DPU+ynBr0jV4NoUYQG9vzWE+KYKIlnNEqZ0nNHCyQ/rvSOLsX7q2B5ZzF3lAh8AqzEzwxeMgmxTk4IUIfSc+ceNMO8rQLuFA6o3QzHmUy3O2WYwXdtEsHXTyIb9f04oIS7T5+FZZ2WPKhuuKq+o+fzj15m+V653Z86h42OKM3w/wHCpsHP6ES0PmHIDKSVM1DfvXtKa5eUlcgi56YqsplnH1ydLr8kydPkRAueMAFvYrsWmvpnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThpMjZWZ2Y4bXg5dzJiVm9TeFd2RXR5eUVZVU1QKzRhUlU3VDAvUVlDZm05?=
 =?utf-8?B?SWZJMWNXREI0d2tsNVh2T05Sek5UVHFyeW1BWHRJUG9NRU1uWDl6THVlOEJj?=
 =?utf-8?B?ejUyVHVjOUhQZ3JOWTJCTzNXQmMwNjNaS0ZwQmVmOW05cFBOemwvTS9EZzdt?=
 =?utf-8?B?YTRHS0s5WXErWnNXN3FVdklaVzg5UkllUXZXc1ZITGRZWG9MblZ6Vk93OW1W?=
 =?utf-8?B?QzRQYmdhcXlxRXBaWkYxNVZvMlREMWlaeDJlV0NWZzFidCttR1kvcTNMVG92?=
 =?utf-8?B?WVVtamNiV3VQcDIwTzhVR2FPNXErbSs5OC9YTDF4b25JSktJMDZSNXlGZ01Q?=
 =?utf-8?B?Kzc2MWV4SC8xRGJmNVFNajNYTXhQeEQyUGNycndCQi92akRsV1pzQXdZSUpC?=
 =?utf-8?B?Y0JFRSs2ZTlZWC9FWkdDRUY0elgvUWpPN2JnNVEwMzFLRVI4cEhIczRVeEdS?=
 =?utf-8?B?MWRFbXQwa3kzL2ZCMDBOTHVvRDNla09JL015MU1jMDVkSnV1TnFiSVpjbWlB?=
 =?utf-8?B?WGxxSm9jMitlMkFzTEh5MFRWaWY0VExQWEh3MXMyMFgrbTJKRlJqK2JMUmZT?=
 =?utf-8?B?RkJwYzRETC9pT0pCNkVuYUhzakVIbUFCMnNOQlpINEJlSVNoWEZvb25zTHJr?=
 =?utf-8?B?bHdJakFxbzlrYzFmRGkwU1NqUmljMURraWUzSzlhR1FXd1pic20xZHRoZ0Fa?=
 =?utf-8?B?S0pEd1N5a3A0WWgzbUdnYjBWZGJvMUp2eUp3bjZldGYrL1FSS3ZkRTczUGI2?=
 =?utf-8?B?Zkxzcnd6eSs3QWFqRTFGeE1NQ3E5TE1CWGZGbFBuVWYvZ3M3ZmhtU25UTFc4?=
 =?utf-8?B?UzlUbjRHamRtdEtVMTM0Z3lCalM5VmRiQVlaVEhpdVFCbVAvTHpUV2JoWUJV?=
 =?utf-8?B?KzNCSENiN1NMMnZKMFc0QkxHQ3Fsbi9OVzJHcklPVlJ2N0JEd3R3TjZjY2xJ?=
 =?utf-8?B?TlNrWkdiNjkyclMxbDNkZk1adkRtZTZ1cnRxeFVydVA5SnNJQlVFUXUrTzdq?=
 =?utf-8?B?bmM2UE5WY1N6SWZaK09oS1BhOUpQWU5tREtSdkxDeTYxbjBLUXZtVVZyaXlL?=
 =?utf-8?B?eXpUNlZwa3hsMmtnaXVnMkhwV3pRenVYVStUdklTeDNDTXZ4NWZnZU5oQmpj?=
 =?utf-8?B?ZXVTbERmSWpRN1A5OTFVNnY1TzdxU2w5RVE1a2k3eFVKbEdQMGZpdFFpMzBS?=
 =?utf-8?B?Mi9YVytxQzRYNERYKzBMQVQ3eFA1SHdBM2VkdEVldlVDWVpTWUdNRE9MV2Iy?=
 =?utf-8?B?MXBtWFdsdFZtb0wwa1cxVFRNdHJkT1IrNmtEdWZ1b0E3R00xTHFENzhYNVRF?=
 =?utf-8?B?M2s3dGo2M3NGZ0RrN2doeXljMW1ad0lWdzFtcC9UQU13QzdSZDdYT21CZG9R?=
 =?utf-8?B?REdWSkEyc1dublFXQlVqZjRHMVNOQjdTTml6V2srN2FBdXJFZDYxUEFHN1p3?=
 =?utf-8?B?MS94QkxZYVl2aWt5TXZmMTBvdUI5YzV0UVdTZXNJWjF5THZjdFZTSmNidmF5?=
 =?utf-8?B?UElZb2tERFdLWWovV3htc0hLQTYvM2F5WnZpNlU1Yld6MjY3eWF5R1N4aEhS?=
 =?utf-8?B?MlEvOTNUclFYUmViSWNaMG9mWmJUQzRobFQyeUpTMnJGbjFORmExbTJSQTc2?=
 =?utf-8?B?c3N1VHRXUW0zejBlT1A5UmxFYUw1WEZ1ekdtdTRrTkp0WExvbmVEb3UwSWQ2?=
 =?utf-8?B?TWU0aDJWWitDVFNPRUNVK3FFSzRoMWhmdGdpY0tBTlJEcXNZYmJRTlRKVGNH?=
 =?utf-8?B?RGRoYWk5bG4wT3U3R09aT1c3dkpGOEpyOEJSVnNJaElkSXE0QkJtSktIODFs?=
 =?utf-8?B?aXVFYWhudnE2Y2FkMGtMaXNoajVnWlp5cWFDeU14bnJHeVBkM3hMN0NRK0N6?=
 =?utf-8?B?SHoyQUx5MllCWXhJVVFoajBVK1ZiREZtOTR5OG1ZUFYxei9INEozYkoyMHpk?=
 =?utf-8?B?Z1FTOGYzNy9HWUhFRC9hNlR1Q05UdmhwTEVWdDdWR3ZyTG10NE9OYWtvMTVi?=
 =?utf-8?B?SVlYKzBrMkdVbGVuaUVQYkhxUDRmMzZnRlpWTFpncFhWMndDdGZualJLN0ht?=
 =?utf-8?B?RkZpZEozeC90UC9rbmtCeGxhRW5KK0ExNFM2VDZJdjFOdldWQ24xNyszZG9a?=
 =?utf-8?B?RUFTb2ZjdUxUWTdaQUhGaGVqVlFQcllYbU5PekV6VnJ3TmFHVDVZRFlNa2M4?=
 =?utf-8?B?eEw5dUYvTzZNa3JjZFpLZXRraGxuVU9sNmFLdUpTZk1adklweUFTVGpLb2d5?=
 =?utf-8?B?ZFdxRjdrYmcxUU5iNkFkMnd6YXNNTXQwcllUU3M3M3BHL3ovTkVjL21nRFNX?=
 =?utf-8?B?azRsS2dubmloQTNoa3cxZDVrMG5IeVVDbC9sZkNBUFd0T0svNUVDb2VBSTJW?=
 =?utf-8?Q?oja7CnA8uNw0RivU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4126c23a-cc34-4ffe-3ca9-08debb2a0035
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 13:23:40.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89XWCH7RNmPOR2TDhqowzrqUTAup0Sy/0mNMlKoEzp4Ha+AwxnmBbJSIXTz8erPyE3FXF0FZyeswqbyVCuh62M6qJsDeM8nJyT/kcTKgKhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5524
X-purgate-ID: tlsNG-d25034/1779801824-E397DCF5-6590DBCA/0/0
X-purgate-type: clean
X-purgate-size: 2345
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 65D825D6605
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 2:01 PM, Andrew Cooper wrote:
> On 26/05/2026 1:40 pm, Ross Lagerwall wrote:
>> The existing code checks for any reserved bit set while the APM only
>> considers it invalid if an MBZ bit is set. Relax the check to match the
>> APM and hardware.
>>
>> Some of the reserved bits were observed to be set running Rocky Linux
>> 10.1 on Xen on Xen.
>>
>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/vmcb.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
>> index 975a1eaef806..9ada491e57db 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -347,10 +347,8 @@ bool svm_vmcb_isvalid(
>>           PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
>>   
>>       if ( (cr0 & X86_CR0_PG) &&
>> -         ((cr3 & 7) ||
>> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
>> -          ((efer & EFER_LMA) &&
>> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
>> +         ((efer & EFER_LMA) &&
>> +           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
>>           PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
>>   
>>       valid = hvm_cr4_guest_valid_bits(v->domain);
> 
> The APM does say MBZ for VMRUN, but the end result of a VMEntry (virtual
> or otherwise) must be a legal CR3 value.
> 
> For 5.2.1 CR3 Register (Legacy) and 5.3.2 CR3 (Long), the APM states:
> 
> Reserved Bits. Reserved fields should be cleared to 0 by software when
> writing CR3.
> 
> What's the real behaviour for trying to set a reserved, non-MBZ bit in
> CR3?  On Intel it's strictly a #GP, and I really hope it's the same on AMD.
> 
> i.e. I really hope this is a documentation error on AMD's behalf, and
> not a misfeature we need to support.
> 

An hvm32pae XTF test that does this...

     write_cr3(read_cr3() | 1);
     printk("cr3 is %lx\n", read_cr3());

... succeeds and prints:

     cr3 is 105001

This was similarly observed by the KVM folks in this thread:
https://patchwork.kernel.org/project/kvm/patch/20200713043908.39605-1-namit@vmware.com/#23578493

Ross

