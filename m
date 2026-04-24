Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGmbDuSN62k+OQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:36:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665A460D40
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293753.1571277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIZK-0001Jd-5D; Fri, 24 Apr 2026 15:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293753.1571277; Fri, 24 Apr 2026 15:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIZK-0001He-1q; Fri, 24 Apr 2026 15:35:50 +0000
Received: by outflank-mailman (input) for mailman id 1293753;
 Fri, 24 Apr 2026 15:35:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGIZI-0001HY-A3
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:35:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGIZH-00B9oi-Mw
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 17:35:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8dd0-bab6-0a2a0a5309dd-0a2a4508c03c-2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:35:47 +0200
Received: from [52.101.61.21]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8dd2-63b5-0a2a45080019-34653d153008-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:35:47 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7331.namprd03.prod.outlook.com (2603:10b6:a03:55f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 15:35:42 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 15:35:42 +0000
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
 b=V9NiHyrVuQa+Iklz9MBubYOUY2Z9mIfhTezuwmm54ECWtE1YCT6QetlMNSnN4PqNYTAoQFYi8BlRvc60yjUe34mnW3wMgJDIQ8z/vBYUssczS+3aQBfGYyLzVBRT+c6k0TAnVACkOUooRatsN5xxVlZcHTQ5NGTAvfUVj0iyr7+VB/G8evITuQg4IxWszg6MahGcjohPI2l5PmVKZCYXO9IdayCEevndL5AgkVZZPWq6AaX86uwp/rD1NL8l35PinMiM8TngPNc8XWdbx5+XL654+w14xYi86TOIyvkN/Rt7WgUAksNJaClPXPPcuXknY8PuFVmBaBqjbf/DWVYb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtaPLHaQyxJrgjzAo+aoXGBQV02DhQjyXiU+VMw93Ow=;
 b=r1pwJJCOTjmosB2XQ6VvbafD9kYj9fGQl+cLGIBYIZWN2lqNUMjDh5Y24DLYby+8wwtGeK/fwiNG11l7hZYAI5lqSZCUvtDPpWx4ynXJ2fC35UCfzZwq+25Pl5gvfYKzpdkf42AwBqQug+7kdKTzj6RhmD1SbshabT3RKGV/DMwufWcYPGObbJVqa/XvLcOUnP0KC03EjfZ5nxORzBE2an/MGbUvSiE3fU39xC86CaVU/603XhrdK+QQf0ZdM80gLdgysenDgJJ5mSA3m+qJx6xTAv6UC0191dAtRRgl3OXuR3WW70MW5DvWA0IuSWORAfiofcCgZ08ENt/hh5auew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtaPLHaQyxJrgjzAo+aoXGBQV02DhQjyXiU+VMw93Ow=;
 b=DNT87UyMmASLnjYztA9Xq9gulxx8cqvl/MbDqOz566G7CHT+W5TWXpHgRR7JNYcnbhhgH35CoSRR0eMwdtpgyrlLBVOi7f1AAuHeyXg0KRGOiBTPYiNsg+m60GjJ+GcenHBewCh/wT5hefoEkmlBLdrnQ+28VhYCpCyLuSAJcYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 17:35:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] x86/mwait-idle: Remove unused driver version constant
Message-ID: <aeuNyRof1cApCnV4@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <d9c97191-853b-470c-9ef1-25eab98c08ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9c97191-853b-470c-9ef1-25eab98c08ba@suse.com>
X-ClientProxiedBy: MR1P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 8974cd4f-4b98-498f-1718-08dea21724b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0cn0S5CUyH9hMqOHCkHNL81QgwcG7vun83Kmkbd4BmFuLN+SWsUQ06URLEJvmRW4/zeFG8M9VP/V21MdolRrvMYy9HsoKg7iKPP9Q9yeMcYy29UFbKOjZGAs2hsQYkq+ZaDQlNlu7NHLyc9KECrB3N+ZMKt0CBAi9SqCf7iTtF8ES3xaP9lZL5GBEyUeG6D57+hHE6K3qTVo4Ap2YkEi+Q0YI7pdLLuuuHa/ucS7anFxIL3qYDGTF+M8407ZRZkMiSw2Oe4NMa/i9mrsh1bPqJrHQJUHAaF+ott0Goz26Qa8GnFEq+35r7NgC1WHEXYdp8Lu9ugghiCCkkPGKC+ULzOo6E29/bhxYBnoPaDuQiEAPTNIAmuo+dJvs9WG5veDpHm2PLAPBOg9LTsKPqwTL5QEfMIzGX6PXgBEOvkkBc86kpUD2Umhv+G8CzIRKSV3ukoluXWphfbxtWyaaBBoOM/AT/3FUsVopwe+xng12oeXlDgc6EYVodbmvQC9GOeya9xJ2S7N5lcIgos5LUrsc3aN+aNZhh9pIs3NL2M21/CUgMQwJDWdg4Ha9eARKUzZF1ffcGTzpTWXm4ub4OjsxV7YBJPyM4e+1C6Jz+oFMRSnAsknxfDeMgNlyfCZanR9RZb65TYbHXFM0gImCX5DSXm7AC/0myD4F1kPFh5puVHXotrhFPVq4qwjXCZJ0zP/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHNJRE1CYmplb1YvaUtNWTdJUUJLY3MxM253Mk40SE0vcHBDR3hDckF0YmMy?=
 =?utf-8?B?MFdEL0JxSjYrVXdVSkQzdC9WSXdYTUtCNTdIUG5kUjA3UjBpSHJtZE9pdDkz?=
 =?utf-8?B?VnNJeDFuSzNnZWxNc2lDL21zV3V5NFhTYUdjdDM1b0RkK05ZMlN5YTR0OGtB?=
 =?utf-8?B?cXRUcFFTVWxheHM3Q3BkNFpSWGc3NTdvYUorZkdWVUhEWmRyVXpqK0VnSU1s?=
 =?utf-8?B?dlRza2dGZTR3RGJocFNITHlIQzhuZUhvZHpRTmV4QUoxNTl3UDhVeExYWHpI?=
 =?utf-8?B?aTE4ekxUbEIxdUNjcytzV2NPREo1RldGZzF5NldLeTlJb3hzZGpBd0RTcnlM?=
 =?utf-8?B?aVJ0bWdZelpjeUI4aEd3UnpqaGV5dmsveVhMOVBZcHR0UEZORXJqeDZTRjBI?=
 =?utf-8?B?aGpUWjJlWlA0R0RmbnFIODBDUEFZOThLR3pXZTRqZ1BaV1FsdHcwMDltZWdz?=
 =?utf-8?B?TjZrcjIwa3VScVh6YitFSTBvTi9oSTNIaU9OOXZCOWlOaTc5Yi95dGdET3JY?=
 =?utf-8?B?WVVSS3hIS3FEY2tWbldZZ1BqUlFaWStBZUpMWkFGQS9xUEtXVVJIK0cxS0lT?=
 =?utf-8?B?Z0dSeEhJVjdQdDQxaG1TUFBQa2ZhQU5BbGVKV3hqRUFvelE5by9vMFdFZHYx?=
 =?utf-8?B?aVpXVFBoWHR1dXdrZjUza254TVdWZWlJTUhmdWZEazlsWWpEa0dTOTdWZWRB?=
 =?utf-8?B?QlBPVmJFV3ZLUTNuM3FHdFpTVHNUOGVpRXZURHFpN0VMMUNBQnJMRC9OZlZh?=
 =?utf-8?B?YTJLTmhydW5hdmRGRGppMkxNRE9HNng1VGxvN0FMZUROVWxFMllwWjV6MldN?=
 =?utf-8?B?NFhleTlZM0NvSUZlbWFSNk0zSDBXK0dlTUN5cHlVZEJ4OXJWU3A4QWFGZkhp?=
 =?utf-8?B?bmhUNGFhVzkzaEZmYmNtbTBudVZDYUIvN2NRcGJZaWN1Z05ubzkxWkNuanZ3?=
 =?utf-8?B?b3Fzd1ppczhsQTNST0VQWDF2eWtHbGFQWlpuaGFxZUZiK09GM0x3VVRvTTRn?=
 =?utf-8?B?UXlpdURnZzB6cm1qV2Qwc3VtQ0lOMnlCYUxjb0J4MWVmMmhNeUwraldHZWlB?=
 =?utf-8?B?KzNaK3JzcThFTXJFWUlEQkhva2tIM0x0QWRVdGNSRkhBeTJGdUQzK2xpK1Bk?=
 =?utf-8?B?ekVmUDJLUEJ3LzVNNjM1VlRINEw5TGtyVThNR1dQRGRFK3VZWVBTcVNHRmRB?=
 =?utf-8?B?dDJvZnpIQmpIUlRJVGR0MFRCVEQvUlVJSDVoRlp6K0ZHdy8veE4zM3FIUmla?=
 =?utf-8?B?NXByR2JnVUdCdHlLWHBPTWFrNGdsTStHK1ZSR1lLUXZFdHNSNDJlQ093c1Qx?=
 =?utf-8?B?MkRFaXZiV2hEeTFIY1ZzRmR6OEh1cEFoaG92Rmc2aE1XelNSaXlCK3Y1aGZJ?=
 =?utf-8?B?cEg0TVIyRktNNUduU3RuTGw0VHQ1ZHQ1YzR6NXNsVmJlVUFMQXhscnphWkxE?=
 =?utf-8?B?MGxiUTdpUDRPeVoyazFLYmZUM3YxeHZpeFBDNmRHYUxkeDlBNEExaUYzVEMw?=
 =?utf-8?B?cFpETSt4NThaM1ZOV2FKSlduMzBHQU1vcjJEOHA4NXFwNG52M243TXJCdmlk?=
 =?utf-8?B?ZGxrR3oyUUd5WnE5U0RkdFNhdDA2YVl3MTBkSnJRMDhWSDRnTVJYNHZ2Rzdq?=
 =?utf-8?B?NXQ2bmxUTVBiOW5sMTNmYjEyL1gvenplUEthekVRekkvUTArUUdoT2ZwY1dY?=
 =?utf-8?B?bFVVaWdxMzRyNXdTYWw4NmYxaFYzbFVkQW1EZU01NXB6SEpGVFNjbmZ5VlNP?=
 =?utf-8?B?UENHblAvLzI0RDN4M1JkSTYyWUlFbjJpSFhpZFN4bksyTlBOWndHWGNrSlU1?=
 =?utf-8?B?YUlDV0VvQ0g4bVc2TDNyeUYxZVJmWG90WmQ3Vm1sSG5rODYxVzJwZjdqN3Ay?=
 =?utf-8?B?VWFLYkx4WFFYak92TmxLUUFYby84S1FRMkRRcXI5TFFwdm5EUUgwbG1BaWRq?=
 =?utf-8?B?anpWMVA3WWE4VlQ1S0FRMlhhTUx4SnRKQ09ZS3kwSWcySGZmNEQyanlnYjNw?=
 =?utf-8?B?UkxEeVFMK1U1TWdNdzdqT21qazVJOG1Bd3Y1YXBKYmxoVXRqMTkxK2wvdGh0?=
 =?utf-8?B?S0dRcVJpOW9ib0RhQTlwMjJDbTBnRkFkSHhRaG1IZTdLcHp4T05IUGEvQmMy?=
 =?utf-8?B?OHJIZkNZb0MrNHkzOUJMMGN3SzVnVExOcVlsRzNyeEJTZmVMRVNmN2FiYjRJ?=
 =?utf-8?B?Ui8xVGhCbjhLZmNiMmIyMmtnMkpuZitJZDJHbUp0bUJ0TGI2cTJaaXBKbjhL?=
 =?utf-8?B?VDlmcFNLaGx0V1puVUNWUkI3cWdvTXc4Q016MjgxOHEwSm9HQkQ5VkhNUHFo?=
 =?utf-8?B?cFVOSWlDSktsVTdRMm90RS9HalI2b1VQeFdxZnh4L29qTy9sNXZWUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8974cd4f-4b98-498f-1718-08dea21724b6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:35:42.0230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pUZyd2j2WQIbhc2ZcxIDWHVgOZkqX8cN7UeHvUQKMhhJXfJv/OXriJJ8yNa4nk4aQ8jFcdyqwGCygHVx//eJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7331
X-purgate-ID: tlsNG-c1860d/1777044947-3996DDB1-E1F0F6EE/0/0
X-purgate-type: clean
X-purgate-size: 958
X-Rspamd-Queue-Id: 9665A460D40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,msgid.link:url,suse.com:email,intel.com:email];
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

On Thu, Mar 12, 2026 at 05:56:24PM +0100, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> The MWAIT_IDLE_VERSION constant has not been updated since 2016 and serves
> no useful purpose. The driver version is implicitly defined by the
> hypervisor version, making this constant redundant.
> 
> Remove the constant to eliminate potential confusion about version
> tracking.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Link: https://patch.msgid.link/20251215111229.132705-1-dedekind1@gmail.com
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 25ff69011ddf
> 
> Adjust description to fit our code base.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

