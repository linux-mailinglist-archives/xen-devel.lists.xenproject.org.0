Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OeIFlrX8Wm3kgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 12:03:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965C492893
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 12:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297150.1573274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1kY-0002Lv-20; Wed, 29 Apr 2026 10:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297150.1573274; Wed, 29 Apr 2026 10:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1kX-0002Kx-V3; Wed, 29 Apr 2026 10:02:33 +0000
Received: by outflank-mailman (input) for mailman id 1297150;
 Wed, 29 Apr 2026 10:02:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wI1k6-0002Iw-Bg
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:02:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI1k3-0087cs-Mt
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:02:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1d715-5cb7-0a2a0a5109dd-0a2a45018eca-34
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:02:03 +0200
Received: from [52.101.85.0]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1d719-c1f2-0a2a45010019-346555003c1f-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:02:02 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB7320.namprd03.prod.outlook.com (2603:10b6:806:37f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 10:01:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 10:01:58 +0000
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
 b=PUDdkKlLieAm5KJpWFYYwGss3tD2EmAUDRSuRUpcPoEnB05nhfBMPwjL28EttfiPHDHEiehsFGCDYPNOgcnmaXoye52jR2BMShXY1MYluPBxg/KIsB/b/gkok9meqcfKvSI6qkiPofKjnzdCY2cRAoHNbj0vj3/9+3PYJ3u8nHTbhVQBLiYZhp6NcmGsCsPIYIMXMpUCYu2pp7Am8fBW4yf3LjOFTO7sfexjODVH5lxvHCmRB28qsIB9ndqUqpSPWR0ho9a7wbsGVnl2pOtHWB69yyUZqJGxpoHqYvptXVdyHRTJi2kR7dr9L9KZwAFdEI/45RgBFGApFnE3POLj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNDlKA8uK6DK0hTBLiZbkRe1rnCR4y5/fnlXmF2cGdo=;
 b=GdlHwFwfjalZ9R/lBDmXQYwj/7OBEYrpcRsZXyzgjxrKNYvBlM4abIThcc9/C2vrJIb6RRK8BIlgfsGXKzErRygOzTWwlZAaP+FUfaQTHATib85yznfg6AOSesvpZ4lrTAqQ/3QO8jjNML0NcPx3EwxZN8b1cJUxUb3z/fqWdf2IeZKe+q1RZFSlLwtdBl8djMv37c0LRaVL+NoFhbsjRlhFu+c4v6pc9FLZopj/Qv8l/5zAr+Pvx9f4iJLfwNwtssbvQAunQXIR/25uSj14nirMKuPsfBZIZ+gQ/Pcib2v3QDJJu57HToV1QM2fmhTpjB4fhNJFFFxBAPJFb6jNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNDlKA8uK6DK0hTBLiZbkRe1rnCR4y5/fnlXmF2cGdo=;
 b=FKjKuFj6lf2QKHArsOxEQDJ7LPx14mw973CzE+0tcwgnzuDf6yD/ivRdR77eDSFDnV96XRkHXeUuU6rUXprj0xXzhCxPqpSuBgTmvvmjuP5Lv3J5/sEb8NYKRkSKg50zcToiBlCVGMYJqNjw0J9jpW9OQ70tkWwJCXq/VGSLFG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Apr 2026 12:01:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 12/17] libxl: Q35 support (new option
 device_model_machine)
Message-ID: <afHXEvXrGQhrU0c_@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-13-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-13-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b37e8b-6c5f-40a3-7864-08dea5d659d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	G08bJibGpfK5KIwa12+VVtleyXiWWlrfOc8u6iwxjQZVdaK3t0JbwQEZVw6N6DiiTFKrHdRGjQU0uHGLWOGzciz6oKx6JrKNdVMx8K3WgIXOdQ6YX6A96Z2DjoiipxguvxFg4R2WdMrY+unijFJjeuq3wO895w87lpil5yS8TrLa6QQ2Fsf1n4B7MCUubTmkPvyxCgQv2/9v/8Eu7K/pmrOD2N9y6ChyXDJxY4uH9ebFB5ALxp/CoDlVc/YllABwGH+TDzcE/r6125Gm6HQImhKShY0N9/t7SZiwXDYnJrG8CQ48cMAQY63RFS6x80nim9dGMG9T7sDB+Mv77Q2GSn0JoK5bDePG0ZZ8ypoiQoHGLeMUHKYY+GYKLON5iOZylYaIb3AX2OydCilmv4mD8qDImdBPyryjCb9e64Azr6X0Y4+8rcdp5oLohtqfeMtPZifbEGmTek5hvo0bfnru4W9lRbS+ACk7SnBgLCDbkg0UobDVdFPgRsovAfbbvoIcBkx640GNzNtal5jL/jl+LUx6Sa74SIOHw9yus55MeaxsHsuq8yIScH0BtIy49C3PG0Q1Wohf1ZypvKFvuv/KbKjMojR0Bu4c3ZXqPb0PoOqoj2drSfCT5Qvuz5t8f8fzdJUEal5x/2GGIYvarqP+GGiTX7X7Gsup7P4tQneTBmgXZNtu1vUbG6D6rvKR2W5wMCRsnpcgiubQlCCgHaxQIas8RM07pUblmOOkK9S6TlI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlMwMitqZ3dDMUlxUWJkTHZJZDVyYlMxVHd5YlpjcCtzN3VQRFhRbWNML0li?=
 =?utf-8?B?YklCeFdFQXp2UENoOHJBRTdISFVqcCswUnVTMGlPcElXaU56LzJ1QzRSY2Zm?=
 =?utf-8?B?YWdlSzNoZUpmbklicFgxNnRxWCs0NjREeWlIaEdBY2pSRHBiRDlVWG9QazNw?=
 =?utf-8?B?SzFWVlV0TktJdWEvL215UkRrN0JTeVNXYjREMVJWTFhrTjlPb3lXMzYwdHhE?=
 =?utf-8?B?bEI4ZmRrUkw0dWdHbndFdjRoNWNhZ2RoTlpIaXFMbzFHY1AvZEw0MkRyR1Vv?=
 =?utf-8?B?eGxiMXRjZUNmd21WRzFvVHcvN0JiMVg3OXhqUzlQK1lmOXN1eEhMZ3BoYU9o?=
 =?utf-8?B?VVU2b3BpNldrMmUvRit1djk3bUFxcldHQVIrWlFib1BwVjJjZG1CRitZUE9n?=
 =?utf-8?B?MkVKMDNSVlBaQnRiWDZNTkhncmYrVTFZbDV4dXQvS3pmMmhuTUl3WVozYTlr?=
 =?utf-8?B?MEs5aC9FcVlWUmEvOUVFL0lCbVN4MGZSYWt0RjdoT1VoV0MxTDZFbkp4dGtH?=
 =?utf-8?B?L1RNSnIyWWFHOVJZQWhZcjM1WWZPUkV4WWNJcy85aUJCbnQ1dTRWVk9jWVQv?=
 =?utf-8?B?WDU3SFdmY1JYNlNCWm9hNWFxYUVvS2ZaYjdrVjJtS0hHMnlJSnpmUjBXNjVB?=
 =?utf-8?B?eDVvNXIvNzRNTjdCMzhoNXIwK1NKS0ljQ2hMbjR1NWV4eG5MS2xseG9lOEIy?=
 =?utf-8?B?dm5UZzRybWJoS1pYNnI0Q3gvOS8yK3pHUUpiRTZ3V3g5NnpqN2RpQVFGUkRV?=
 =?utf-8?B?a2hZY2NVVXVVSjhEdEF3Rm42cFkyRG8zL0RTa1daTlhFRVlialFZMncxNXBu?=
 =?utf-8?B?NTRpUUEvcnlIMCtUNnRITFhQN29meU5nK0xxNHFjSk1qOWhKOUk1b2c2dDJr?=
 =?utf-8?B?R21aS3RCeFhicDF3dVBWOHV4MENaejc4aWZkcmtBT1VuVDBDMmZDaUUwTllx?=
 =?utf-8?B?VE9ZUWVBak5WM3gwZXJYSHVTQ0hQNmVLZiszM1Fid3p5b3lBNHhFSmJzejlk?=
 =?utf-8?B?NDZzd2c5cVdwNHV5WVVUM0RmQ24rMTFQcGpQajZZendOajczUzU3NHNWYmFt?=
 =?utf-8?B?aWhLR0pSWHp6dlZ6MnJzdjB0TlQvdGlkYjh1anJNaFVQYUoxbjZJOHIyeDZH?=
 =?utf-8?B?bVlhZjhqYUlSaE0vN2F0OE1mRnhpNSsrUFFGaStxT1BYdk01Rzc4TFlMU2M5?=
 =?utf-8?B?bXk1SG1Fck0wSTV0dmVVWEpLZk45MUNNMHFWL25GVng3YUNhQXRhVUoxemdM?=
 =?utf-8?B?RDlTZWM4dVFUeWNvL05GNjJlbzdHUStNUUh6MkRHUEF3d05QcVlESy9yZWYx?=
 =?utf-8?B?NTRYWFhsdzNiRGU5TDRHYm8zZTBKYXh6N2V0Q1NhRmNaaXRydi9hcS9KbC9p?=
 =?utf-8?B?UlY2ekhQTmQrSkRQci9VUFpMU1cyTG9rMVJRSDdSMFQ5QmZXdzRZMitmUGhS?=
 =?utf-8?B?UWpPcVRpeDZKMHNON1E2Y3BtWTFQcno5Sis5UUM0WXJ5RHpjeTNQZUY1WERU?=
 =?utf-8?B?aFAyWmNzUTQzSFliKzBZV0JUNGtPbFdpZElaaFVtbEdQVjRtN0YvMHhHQy92?=
 =?utf-8?B?ZXRCTmpTMlo4UGI0ZnVwOGJOU2J4SWVqK2k5ZUpndFZKTHl2Z3ZtSlUzQlR0?=
 =?utf-8?B?ekRZMUJVTXZZd3FVbWorWjN2OWlmYjNSUmdkalByWmd3TTlCTndyWVFmWVNV?=
 =?utf-8?B?UVc1dkRla0NzY2lkTEh6b0ZEdEdvTDNBMG1HL0JXdmNHK3FxcUhUTUE5N2My?=
 =?utf-8?B?ZkxwNStFeEN3d0o5MngyMmFFRm1JVkx5eVMyMVRTb0pyWk9ETnBTRG85ZGNC?=
 =?utf-8?B?V0dRU094Tm9sc0d4blNWZUVYUTlyemJRRVM3djhIN2pVRzJQelQvR011NS9k?=
 =?utf-8?B?N0hRaWU2ekRNZnJPM3hkeXhoREhQM0l1dHNuNC81MEEwbWJjUG1KU2hwNVhO?=
 =?utf-8?B?T3YzVG9VVCswVTFNSmdkNW94bStVWUpEbERRVFJlZmN1RG1xM1grNWorSkho?=
 =?utf-8?B?bExoSXVjSlNScFpacnJMQWY2RXBCZ0ROYkd2R1d6NHJEV1dlbUZRN3Bwb0Vu?=
 =?utf-8?B?ZEMyL2VXWS82dmNNYkFpNDhlbDNmNXcxNUdRSlF4QzdwMiswLzR3OUVGNW5y?=
 =?utf-8?B?WmxUYXREOUg4blNCcHlCYllSeDE3dzBNSjFkeEllUG9WMWdNTmZjUUpSZVFw?=
 =?utf-8?B?YnE3TTd3THhTcVUwWmY0SU1PWjE3Kzc5dVVNYjhKaFExSmt6cUpDUytKS0di?=
 =?utf-8?B?aDBNL1pkeDlWemoxM2QrcUpOYTZSK1JsYU9kcjl4VHIvN3RlZUE1YzFiak5W?=
 =?utf-8?B?R0hYZmlqWWtmTDB6RHJPa096SVkzV0pScVJ6QndFSzVtL1YyMjJHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b37e8b-6c5f-40a3-7864-08dea5d659d8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:01:58.4240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Iyxtu5AWrw/Iuldu9x7WYAYXkkkLmxciySZe0TyQEHbULHKv7PQ2GBapUdWkb0bMCmyl8+gDl7RFme/sjpNkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7320
X-purgate-ID: tlsNG-d62444/1777456923-B7E7BFF4-B4AC425E/0/0
X-purgate-type: clean
X-purgate-size: 4437
X-Rspamd-Queue-Id: 9965C492893
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> Provide a new domain config option to select the emulated machine type,
> device_model_machine. It has following possible values:
> - "i440" - i440 emulation (default)
> - "q35" - emulate a Q35 machine. By default, the storage interface is
> AHCI.
> 
> Note that omitting device_model_machine parameter means i440 system
> by default, so the default behavior doesn't change for existing domain
> config files.
> 
> Setting device_model_machine to "q35" sends '-machine q35,accel=xen'
> argument to QEMU. Unlike i440, there is no separated machine type to
> enable/disable Xen platform device, it is controlled via a machine
> property only. See 'libxl: Add xen-platform device for Q35 machine'
> patch for a detailed description.

Not an explicit objection to this patch, but I wonder what will we do
for PVH when we start exposing PCI devices.  We cannot provide a fully
complete emulated Q35, but we do need to expose an MCFG for extended
config space.  The current naming "device_model_machine" won't work
for PVH, as there's no device model there.  But at the same time I
wonder whether what we end up exposing to PVH would resemble any
physical chipsets, or it's more likely going to be the minimum needed
to make PVH guests happy to access the PCI config space (and hence we
might end up emulating too little to match any chipset).

Thanks, Roger.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/libs/light/libxl_dm.c      | 16 ++++++++++------
>  tools/libs/light/libxl_types.idl |  7 +++++++
>  tools/xl/xl_parse.c              | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 511ec76a65..36f2813cde 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -1562,13 +1562,17 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
>              flexarray_append(dm_args, b_info->extra_pv[i]);
>          break;
>      case LIBXL_DOMAIN_TYPE_HVM:
> -        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
> -            /* Switching here to the machine "pc" which does not add
> -             * the xen-platform device instead of the default "xenfv" machine.
> -             */
> -            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
> +        if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35) {
> +            machinearg = libxl__sprintf(gc, "q35,accel=xen");
>          } else {
> -            machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
> +            if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
> +                /* Switching here to the machine "pc" which does not add
> +                 * the xen-platform device instead of the default "xenfv" machine.
> +                 */
> +                machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
> +            } else {
> +                machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
> +            }
>          }
>          if (b_info->u.hvm.mmio_hole_memkb) {
>              uint64_t max_ram_below_4g = (1ULL << 32) -
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d64a573ff3..f9cd881b66 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -109,6 +109,12 @@ libxl_device_model_version = Enumeration("device_model_version", [
>      (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
>      ])
>  
> +libxl_device_model_machine = Enumeration("device_model_machine", [
> +    (0, "UNKNOWN"),
> +    (1, "I440"),
> +    (2, "Q35"),
> +    ])
> +
>  libxl_console_type = Enumeration("console_type", [
>      (0, "UNKNOWN"),
>      (1, "SERIAL"),
> @@ -613,6 +619,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("device_model_ssidref", uint32),
>      ("device_model_ssid_label", string),
>      ("device_model_user", string),
> +    ("device_model_machine", libxl_device_model_machine),

This possibly wants to be inside the u.hvm sub-structure.  I don't
think we want to use it for PVH, not with this current naming at
least.

Thanks, Roger.

