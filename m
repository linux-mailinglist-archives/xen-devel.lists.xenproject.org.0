Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI6WJuxs+2miawMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:31:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CDB4DE22B
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 18:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301939.1576055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKf9g-0006S0-KD; Wed, 06 May 2026 16:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301939.1576055; Wed, 06 May 2026 16:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKf9g-0006R2-GI; Wed, 06 May 2026 16:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1301939;
 Wed, 06 May 2026 16:31:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKf9e-0006Qe-HV
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:31:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKf9d-00ECTE-UT
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 18:31:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb6cc0-bab6-0a2a0a5309dd-0a2a4504cad6-34
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:31:21 +0200
Received: from [52.101.62.17]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb6cd8-1dec-0a2a45040019-34653e11984b-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 18:31:21 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SAWPR03MB989156.namprd03.prod.outlook.com (2603:10b6:806:4d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 16:31:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:31:19 +0000
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
 b=t4Rz3jmlXd+CfDz87nh5cGM2z4efY1k6FMQ8D1/Yv/+OelYB9cUO/WDaZmxfQLiPsgeX6Eo59IRHfeSOFBibeWXzuWSDb2hDXcOm6Js5juUaSSiFl4v/WhK8RjqAIcjFNbjKkiaxESyJvo4t7ORfSp2R+cZa+LYN5nQygu8Q+ND65gwGJlxPjE5XU1w31jJksTymny/Ihy7wn1omSFDOKk8OUEQHhKG49cmTxWbrY80N+ceWgs7SNhnLZm03dzjOYlOEEiSIe4eduNt0wAMp3S1Ic29aWeYe41iXiwttXfRycdAKyO49pKH08f+bW2gtEqe5GUNyqDubHetXye4P5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rEEFKS9AptWT2FR6SFz8tovo4ncn9GkcQjPrfqsQT0=;
 b=joUiViUaKBUHB74pBXUNt78ccDgRLP8uZHhDiy4Iy1Xu9nji8cca+MQsV8nPLrsK1V6xD4U0Ijlyp5Ohg4o/1QvQ9gpRWZ742N6dc6npTM5ZA6EVVw1kVUU02SxbsH5UKLJuI0O6h5ZpU+i4TZbDBwU11Nnh+IctjF5Fc5TZtlHuTPRjS3t4GVUrLFMhHJs0QE5UDT+8w9F9yLs79D6yQbO/LY3v6foUrYQ5muBgmiJ/zdHRKpc2PzJFDJe0UypHYun4eqhzdDqVinoW7Hwn9OjdfPILec1KM/Z2WCThU/z2BPY2Vjb2UGRtuwlcKL42BMnpwTb9uRC6KgvrCQ/qLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rEEFKS9AptWT2FR6SFz8tovo4ncn9GkcQjPrfqsQT0=;
 b=0bOUE4QIOPc4Vp7277tPE/FlY99x0DEe/q/OgCmyOPJ+a7ZMjiAfoc2Z8gGF3aPh8btw2pK9SUL2XGz+uMC54edkgvD5J0wKtlyIpOqrAkt2S619jYVdYa1c+n8yM9+DowhkM5yMzuQ8vjjvAAl7xamKKRTYY2wuh7dYRc9bEXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 18:31:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afts02DUnprjHkTh@macbook.local>
References: <20260506135514.47310-1-roger.pau@citrix.com>
 <20260506135514.47310-3-roger.pau@citrix.com>
 <5531fe94-6200-4f7c-9c22-e09189438e9c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5531fe94-6200-4f7c-9c22-e09189438e9c@citrix.com>
X-ClientProxiedBy: MA3P292CA0052.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SAWPR03MB989156:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d96647-ae0e-4eb9-27be-08deab8ce6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sqgSuBVEaEwz2DE1UuK9bfxqs+m54ZCE53/oEfqx4RsBDjXCNptTf3uERvqV6XYlxxWyuUCMbjBS2GLwSY9RP6dcooqKWts7pdBSJv9Z7xHsqlTE7YI3YvBnPrWzA5YvU8jy1Urmq2r73907xAJT0OC7Mmr/Ifnshs0nfgSdF1vhKAJeekH0a2D73Oe1EJg+ANFS92h0P/Jpg4TVf8l9Y6jNu+aufbS5SFzKLNgAe/cWNOdp01wBhOFIi9xYrD7E9luXddHnWhWqijVKu/CYufXYDFZsD5U1UfBsdmXOe+mw97VYLUY/L05ImlPu8EbZwfhKMliU+Pmhe1wkAnf2HapZDD5RBFLuYJECiK/UObF62SPc6S3z3TeFpp6P4FU4xPXsdLMawo0erRqUaUXD1WqZNo+cXnZyKpKfJFxgb1ojFA+vFX4ed95PMAEIanmwDP6EB46eXkH4w7vSVLPnT0Fgo8WlABfAv8ShkqlyUNJtZm/FeP6gxkNmi0IQ4bp/z5IFzSk4IPxk0y0preKg0NT5iWziCNpMnG75aiYzkwetuHJvWeAe1T+beJ5AWQnNZ+lAhVdQIOIjdujsInWXbf7gFdajgziqSbmO86cdSQiVXjqkK4saq/4vdqKg1dV+DHRVN6AwS3VH1q2xGA6PgCAjuKTr4DOMaJ2qqsf7a8m/VfZYmGhAFyVMbwLMOajp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S00wLzNQcXFWc21aYUw4VUJKOUh1QzJvTU96Q0VIRWFCT2laV1RQbHlyaVVG?=
 =?utf-8?B?dWFoSFVsUHZUUUZoV2ZndkFPb0RnV3ppakR6aGgvMmJOQkY2bGN0YWl4ZTZK?=
 =?utf-8?B?dUlLaFdmTSs1dmlYdHRtS05GVjhzN3FqL2Fzc0k1dmRoK0lwbTFnVEtTL0JJ?=
 =?utf-8?B?ZjI5RVcycDdZWEVocW5jazdEblREVWNEYVlxR1U0dlhUUUxBVTh1MHVkL205?=
 =?utf-8?B?NEtjTjBaR2dzcWJvUm9lMVl4WWxKQTNzaUdGeUdaUmhPMGlxT1pRNlRFZ3V0?=
 =?utf-8?B?OC9sdW1XOXBKTkRTdmNPZ0dENUFYVkhsRVNNcGZEc2tqMXoxQ25NY2N1RXJ0?=
 =?utf-8?B?eGpSejgvSHg4R3lsM3pnYTBLTGU1Wk1XMHVYbGRNU0VzMlE3NjJWY1BrVkN4?=
 =?utf-8?B?blJ4T2o0WG0xeW9ialN3ZUtXTTRrUDM3QWFwNWVjUGdjNkx1cWZ5ZU5qbncr?=
 =?utf-8?B?YUNScU80cTU5enlSYUYzc2txN2NBa1htNW1GcU10YWs3QlB4RjJ2NU9vTURZ?=
 =?utf-8?B?T2VzQThPRkFodVd4WFkyUHNyZktWSVd6bWY2VzBQWU9KWStobnJsOEVEaG9K?=
 =?utf-8?B?cTlNWGpmVjg2YzQxN0FzNkVrczYrQUVQTW9XSThkKzVROFpXUTl2SjZwT2l3?=
 =?utf-8?B?MWlIUkpoWmVocjBhZ0tkMEs0V29aUmJDQnVzSE42M2c2K2VDTEp1ckpUN1Y3?=
 =?utf-8?B?Vkw2VjJyWTFrYUpzbk5udlBEdFZSbThyNTFYTEt4YlFnTWtlakpmL0tqYnpW?=
 =?utf-8?B?TWt1cVZoWHBLdlJxVGN3UFIwR0hGWDRRbDRGR2JDbkY2Y0hHWHpkUy81QmtD?=
 =?utf-8?B?SDh5cW45WHNBbDRuQ3ZzVUp6NWR1RXp2WEhyOTBmeFNpWURjTTFaMVBJejJV?=
 =?utf-8?B?dythcUV5NG1LbENDak5ZTUR5VHo5akNGZEhGVGoxMUpobEd3MS9NNkRLcXpm?=
 =?utf-8?B?WjhvNTNnU2NPMG1mTnB1ZHV4OHpjQzZIbEcwcTVycGVsVFBZQUt3aFMxWWVV?=
 =?utf-8?B?ei9Tai90TGZYNjdLMHlFMmhOT2dpQ2hvR1ZNUDE4VTA2blJXRmNpV1RQVW4x?=
 =?utf-8?B?clpabFR5R3ArRWUwakFTS0R1Qk9RTzU3ais1ZEE1bDQ2QUY3blZkSlZHWTFt?=
 =?utf-8?B?UFRORWVrOXZ6bGxwR3dwcGZFVzJqeVV2Qmh1a1UyeGMxdFNVaWg5bUc2Q3Av?=
 =?utf-8?B?RjZIc0hyL3JuUlJPOXBNY1pRc0xaY3p3RXFiSDBIU0g3dXU3Sk9nTWEvUWhh?=
 =?utf-8?B?M1lVV09GNkFOMEljdjFBUzJYeVVadUsrUHd6MGQvYzNyWElsMUR0U1NIM25R?=
 =?utf-8?B?VWxFeWkxMjVDYWhGYUtyazROcm1xL3lyRy9YWGZWMk9KRU5OMys4TzBndlJY?=
 =?utf-8?B?c1paWHVpSjJ0MU5VdWdsSXZaVHpFVzhFYlN0NlFsR2tid2F5NWpJNldaU05v?=
 =?utf-8?B?aHR2blMybkdIamF0SnQyK1JSYzN6VVI2QUJjZHYvQWgxdDA1ZzRuTnA5NE1T?=
 =?utf-8?B?MmFqa0o5dnBQa2hOUmprUUROS3loMHF2Y1VscUs1UFBBS3VCUFNKZDl3WjRX?=
 =?utf-8?B?N1JUYjZTUzdXc2c2NkhBTFNCVU5tUncyc1BBMkNpVzhaOW9TVm93Um5IMU9o?=
 =?utf-8?B?SjhuSGxMMHpJOUFlQTMrQmYzaWNJTzVreVFXVFZZRmhaem95V29OakxyaXps?=
 =?utf-8?B?dnhSczhUKzZ0ZjNldmMxb0VUYnpvcEttYXZqOEMzcnNOQ3Irdkl2YXk2TmJZ?=
 =?utf-8?B?U0U3bzVCc3R5dHNCeGZmYlp1WnVqRi9icE5jby80TW44L1dXVGJTc1ZZLzU2?=
 =?utf-8?B?QkhSYTNFby9SdHY3YmkrVFh5U2cyald1cDN5d0JhNWd2WE9QK3pJMWhOY2R6?=
 =?utf-8?B?MHR6enlqN0hsZitINXZHVEx0ZlFsQWVDb2RCS1NobzYwZXNtT0J2V0JONFZw?=
 =?utf-8?B?MXBsY1JNTHoySGpzS3VHWnI4ZDNmZUdjbHZlOG9kczB6bnNRc0Vpbnl2YXli?=
 =?utf-8?B?dWdWaVZBbHZrc1MrZEVGZnFVV1FnYlRpZGhWU1ZPVmdGdXIybUtuUVh4dGMr?=
 =?utf-8?B?dGpLd3lnRHpZaWdoMmkrTlY0cHFrRkVmVjVHOGdleHl4Tk90Vm9mM1I0K0RL?=
 =?utf-8?B?aUtCZ3VVYzRGM1JrcnF1M1VpaXhIbWhxRndJZHZOWlhzNHYrVHpuS1RjZllX?=
 =?utf-8?B?djR0ZXdPT1pHOHluNlRVK0NMa2ROdVAxenFGN28vVnc5ejFEcGx6ZnJXL3Vp?=
 =?utf-8?B?WlA1bTkxVTJVYUdYVGlEaG56WDFDNXhCRm0ydjUyZ2JJSnAwVnpjWkd0OEhJ?=
 =?utf-8?B?bmsxa1hHcWF0SGlFcHpNSFRKK0ZVM0JrbGN2QnpNQXdFTE5yaUNyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d96647-ae0e-4eb9-27be-08deab8ce6a8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 16:31:18.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14VVTWa5AfzOBMF16roMFeecE6v4GXRUDBT3hDJok2wuKwUP0QyJOwfSq4jcAAqZzzxqFg47nZ13Xp/zXUGvQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR03MB989156
X-purgate-ID: tlsNG-ebf023/1778085081-4846A3FF-48B1A5CF/0/0
X-purgate-type: clean
X-purgate-size: 5594
X-Rspamd-Queue-Id: E4CDB4DE22B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 05:18:40PM +0100, Andrew Cooper wrote:
> On 06/05/2026 2:55 pm, Roger Pau Monne wrote:
> > Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> > say the least.  We don't know what registers might be there, nor which
> 
> Sorry, one more.  "We don't know which registers might".
> 
> > values might be safe for those registers.  On a forthcoming platform doing
> > the zeroing of the MMIO region does put the IOMMU in a broken state, which
> > is not recoverable by the IOMMU initialization procedure in Xen.
> >
> > Instead attempt to forcefully disable the IOMMU ahead of enabling it.  Fold
> > map_iommu_mmio_region() into it's only caller, as the function body is just
> > an ioremap() call after the removal of the memset().
> >
> > Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Zero the control register after calling disable_iommu().
> >  - Print a warning message if the IOMMU is handed enabled to Xen from
> >    firmware.
> >  - Fix commit log grammar issues.
> > ---
> >  xen/drivers/passthrough/amd/iommu_init.c | 31 +++++++++++++-----------
> >  1 file changed, 17 insertions(+), 14 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> > index 76ae78e5ea53..ffc041211fb5 100644
> > --- a/xen/drivers/passthrough/amd/iommu_init.c
> > +++ b/xen/drivers/passthrough/amd/iommu_init.c
> > @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
> >      return iommu->ht_flags & mask;
> >  }
> >  
> > -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
> > -{
> > -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> > -                               IOMMU_MMIO_REGION_LENGTH);
> > -    if ( !iommu->mmio_base )
> > -        return -ENOMEM;
> > -
> > -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
> > -
> > -    return 0;
> > -}
> > -
> >  static void __init unmap_iommu_mmio_region(struct amd_iommu *iommu)
> >  {
> >      if ( iommu->mmio_base )
> > @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
> >  {
> >      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
> >  
> > -    if ( !rc )
> > -        rc = map_iommu_mmio_region(iommu);
> >      if ( rc )
> >          return rc;
> >  
> > +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> > +                               IOMMU_MMIO_REGION_LENGTH);
> > +    if ( !iommu->mmio_base )
> > +        return -ENOMEM;
> > +
> >      get_iommu_features(iommu);
> >  
> >      /*
> > @@ -1381,6 +1372,18 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
> >      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
> >          return -ERANGE;
> >  
> > +    /* Read current control register and forcefully disable the IOMMU. */
> > +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> > +    if ( iommu->ctrl.iommu_en )
> > +        printk(XENLOG_WARNING
> > +               "AMD-Vi: IOMMU %pp enabled by firmware (%016lx)\n",
> > +               &iommu->sbdf, iommu->ctrl.raw);
> > +    disable_iommu(iommu, true);
> > +
> > +    /* With the IOMMU disabled zero the control register. */
> > +    iommu->ctrl.raw = 0;
> > +    writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> > +
> >      return 0;
> >  }
> >  
> 
> I don't think calling disable_iommu() is a good thing here.
> 
> It's just a cascade of clearing one/few bits in ctrl at a time, but is
> is added unconditionally so that's 5 UC stores writing 0's to the same
> register in the common case.

The approach to use disable_iommu() is because that's closer to what
Linux does in iommu_disable(), which seems to explicitly disable one
feature at a time instead of writing zero to the command register in
one go.  I've been cautious in taking the same approach on Xen.

I don't mind doing a plain write of 0, let me test to ensure this is
OK.

> I think this logic wants to be:
> 
> @@ -1381,6 +1372,18 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>          return -ERANGE;
>  
> +    /* Check if the IOMMU is active, and disable. */
> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +    if ( iommu->ctrl.iommu_en )
> +    {
> +        printk(XENLOG_WARNING
> +               "AMD-Vi: IOMMU %pp enabled by firmware (ctrl %016lx)\n",
> +               &iommu->sbdf, iommu->ctrl.raw);
> +
> +        iommu->ctrl.raw = 0;
> +        writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +    }

In your snippet above, I think we want to unconditionally set
iommu->ctrl.raw = 0, and also propagate that 0 to the register,
otherwise we will inherit set bits from whatever is currently in the
control register:

> +    /* Check if the IOMMU is active, and disable. */
> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> +    if ( iommu->ctrl.iommu_en )
> +        printk(XENLOG_WARNING
> +               "AMD-Vi: IOMMU %pp enabled by firmware (ctrl %016lx)\n",
> +               &iommu->sbdf, iommu->ctrl.raw);
> +
> +    iommu->ctrl.raw = 0;
> +    writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);

Thanks, Roger.

