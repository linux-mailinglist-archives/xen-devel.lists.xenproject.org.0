Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNQbCqHSBmqKoAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:00:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E306154AF3E
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309691.1580750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNnSW-0005zl-FB; Fri, 15 May 2026 07:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309691.1580750; Fri, 15 May 2026 07:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNnSW-0005x3-Bj; Fri, 15 May 2026 07:59:48 +0000
Received: by outflank-mailman (input) for mailman id 1309691;
 Fri, 15 May 2026 07:59:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNnSU-0005wY-OM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:59:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNnSU-005Zgp-4I
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:59:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a06d26f-bab6-0a2a0a5309dd-0a2a4507881e-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:59:45 +0200
Received: from [52.101.43.21]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a06d26f-229c-0a2a45070019-34652b157b1a-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:59:45 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6627.namprd03.prod.outlook.com (2603:10b6:806:1ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 07:59:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 07:59:41 +0000
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
 b=HlnmopiTd6yu57KLxjwDvZmdopvoKHVLDHHZE6Zp3X5zPaYFc3Ji22RmseYft758EulGt5W/6yIQpPgxfaDqwuJFN75MCSX2YlN+zv54ab6Asn6XckYRWXACGtMrWoeWVUdsFuw3aU7/TuUL+zncIQQYZtfmGMCRkTpbuSdPJ9Z77G9SizWERQ5vVaxtjNK+5tYkOW5O8EyVJMcjjhw94kVKuSu+tR24v0tqAHkTXxEniFjF4qx3REt7BOZdRXvjgMbRPlgvkMroFL2+IYO2ExVWBcr2PnQoPM8oZ4D004RCiYte3gWUMy1j8G3TWkQgjSpUTu5QHzOJhworxOqAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2iTgaOOYh6nVVU+jEHVD5X5YZ+joExyDXAhlMHi/jo=;
 b=IcF4U3OHLggzpRVj+ZU0dF3zrmRlINilzCVVDso9GJh92y1Rq79l+w/z7g3G28zx4+EvCOtxv0SZV0a+MKdJscsYQg4t/iy3NbQLH8BGjaGZ7Wecch5Hqbvjt9jfW1EXICgmb4i9yjT79/F3vqX3PKOxCXnYNis+f6qFlAwHLQOO87qh3R3r7s+w2Izzvzwk4yYvBKtIOdatoq1XwxcsljBCMcHnb+tRhn1TM483Hjcz+ucdoojCIDFTs2JTC3LELsJcar37AA2WqrUOKjm5gilJ5vTbiwoulKH+fdVEqkE0JN9G9jeXLGsmmsWe+bntHQnrQJcrfJ6Lx4PZ4nz97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2iTgaOOYh6nVVU+jEHVD5X5YZ+joExyDXAhlMHi/jo=;
 b=f8s2m5zW7GOjqxmj5amGEJUQAEIIglH5EWCKmV52RAUmW/IX8u7NaBgt4hrAMy4KzyNNCAnbwt+cyjPAHfxUYFALNbF5xe8RI8QrnDThVkCULIvezLp2Ufy97X/nLck5aXfyPGLAWm7E9jxOmJxETsPmMRdsnm5veW3SuDPhWUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 15 May 2026 09:59:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.22 v2 7/8] x86/mwait-idle: Add cmdline option to
 adjust C-states table
Message-ID: <agbSanNokXLVu1o1@macbook.local>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <8c46fedd-f1f3-4cad-91fb-1b3b8d58db50@suse.com>
 <agXns5dpu-X5rspi@macbook.local>
 <5fdd68ea-a413-4f8e-a50a-b0d7d821e904@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fdd68ea-a413-4f8e-a50a-b0d7d821e904@suse.com>
X-ClientProxiedBy: BN1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:408:e2::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a911582-24b6-4dac-0ef4-08deb257eb2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	vxtgVb7PyFG1/A0EWYWts39ngAq+y3i+m9qdGgSWV1DCoxjxJqUX+DX6iAAWmnfzI/bX5R8nNNRCD7B9hS63TFiwPZI7iElFEMc780B/YhuhS3kMv+pMzqoaKCPA8rMEJOhTwyS3/wgxUYhdZ50cQi43saTmkY19UKAs8JHtsz0cHJv0OgkO6QcLAtcA29f5YoGYIAaIwjmbuIAbFSB/wf9SBm2VctSIrlR3m66LKXDiCxdvL57U8tqQpHiuIqds6K5inNIweQQkzjmNRDlZ1TG/kgSZ5ToaJOwp03VcaaKth49R9PR4UL2x2q6Gg8GERj0aYRak6ZCxhcFR7/V1zakcvO+VObiy5yO5QYKxxh33Qpb7SZN+07lr3JpBgIpzQYbqDypJoD0mHnB6/nTtW/637UQnwnQy6o/hyJ2cQ6oZR+ukS4UcjVarCYlb5kiHVBomOtE4BBukc+3qQKEhc3WSx3Lto1bUuCNeQsx70TNF5hG+E9si7Q4m3j2UQhIHKM50RgV/hzYVwZ/Vz2ArAVz6hz5JMzIYgWAaR7GtgqJfydCZdCZFrJ6mQovB01+laVNbWtnvhELkvF+WDHIYjc3kdad+waM01ekzaGbF7OZQUivcB0Lp6Ghdx+0ywCzvs8OqkVVYQ7YYU43tnXE8lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXJVZ05xc0I3SG4zOWdrdGFHbW0vSk42SkZSL3ROTHJxa0xYQ2Y0RjVDcW9u?=
 =?utf-8?B?MVNwT2VLTnZzV21jYWdtaGI3cFZKSTMwWldEYlpzVUtQcFBzZnB1bWtWWUxL?=
 =?utf-8?B?WWFSTnd3NGo5Z3lpZVhsaUtyK2huZTA2NmVxK1pUUUJaZkVMSUZoZ3pWbndq?=
 =?utf-8?B?bHd5ZjdhNHB0T3R0MzNzeDZ5aEZjdFZRMWgybnFnRUVsZGhLNEg5MHo0eDZu?=
 =?utf-8?B?ZlE3ckg4d1VMemEzNDFoSjd3QnFzdW5WQlBMUCtUdE1GaDlCYTBQeDlrODY5?=
 =?utf-8?B?WG1zOE9qcDFOK09GNUlwNmsrWXBlOVFLaTM2eUlRbHFlTHVNdHRrMzFKQWpD?=
 =?utf-8?B?OE1ZeS9vUytwaitHNjNQcDk3aDFHUGQ4U3MrZGU3UUtMTjEyYlUwTkkzbDk1?=
 =?utf-8?B?RXl4S29MK3hKamxZUnlIRGZKdHArYXIrK1B0ckJKUDZta0xNd1dSVWtWbVV2?=
 =?utf-8?B?NVkzaFkzd0lrbjk2T1JucWR0dy91T29Pd0F4Wkp5TjF3OTJwd2IydlAxV2JX?=
 =?utf-8?B?MGNBN2F6LzFjTHpPeWhENFNYZXEyL09FTFllMmozeEdLc3dERk9uditFc0Ni?=
 =?utf-8?B?TUlNcCs1cVZPQW5wOGZhUTJmOXc2UUUvd0Q1dVN4WjR1cUJDZE9OdjIxSmcy?=
 =?utf-8?B?VUNXMmh2ZFJzdWlJL3NIMksyQTkvSnoyazFMdmNkbElzdFVlSDZ1TzFWOUE4?=
 =?utf-8?B?WURwaHNhVzg3SjVlRlVROVFML3NCT1pIR3Mrdk5lTStHV1dOblhIYXNQeFhW?=
 =?utf-8?B?UTJsRllhRm9TNjBlV0hTeEpqOXFMdjh6LzhOSy9PNFphN2RtakZobGZOcjVS?=
 =?utf-8?B?WURYS1FLa0FFanI0OW80Yk1BWng5cjU2eWdsUVNHNkQ2N0ZhcnlGR29VanFa?=
 =?utf-8?B?RkNoVTdNWGJ2ZWVBUGtOVmYyZXZycGdSbE5ZSFpsYTBNM0hXcFd2L3FuZWtn?=
 =?utf-8?B?WVA4YmQ5ajk0dGlCMTJtUU1lWU42TC9VVlF5dmhnVEcvV1JUakRLNE9TbW45?=
 =?utf-8?B?Qm00WXJWMnFtMXFHUGt6QXZPbjJXTzdCVGpJc2ExTHBubzROYVBpSEgxeWNL?=
 =?utf-8?B?TCtEZFJ4UGt0cnhTbjROSWExUFNvaVI0U04xWFdjSHVGaXAxRVF3cGc2MExD?=
 =?utf-8?B?MXF2NHFXSjVaeFZKUEFOVzdBVGFndlh5UkRURlB3eVBXa1Vhb1dpU2RLMkxX?=
 =?utf-8?B?YmxaOXVFUEprS3V2R3lvZXpIUUlJYzBxeXk0ZlhoaGNPM2xWa2VydmljbXBH?=
 =?utf-8?B?eTlkQXdlZnY4eGZrN3NuY25Rb2JleDhGa1VJUzVEL0cyLytJUlJQd1BtUDk3?=
 =?utf-8?B?Tm4zOGJwMUdvNjN4dkVpa216SFV1SXJnc3d6alBVb2tjdXVuMkx0L1VLWU5t?=
 =?utf-8?B?R28wbmJvMkFzMGNEUnZ4YWVFamI1bmpDcEMzSXl1TkRXNHpDNHlNdEZWRGlL?=
 =?utf-8?B?TTE1N3ZGdEN3dkFKYmxlK1ZsMjBlNWtRYzh6MEJuU1l5czlkRHB6TjBhRUdH?=
 =?utf-8?B?c0g4elEzQllTcjZwb1JqUEszaTl2R3BCeS9UOGRiSGpCTmgxN2V1WFUwcFZS?=
 =?utf-8?B?MnJxeXo3SFkxaVFUK0FoSU1hUzJmSmNFUmNIZUR1WGF2bnVQZVhrY0l5QUYx?=
 =?utf-8?B?WnZYNXJ5M1h4MjQwSTdObFlrV1hudzJubGd5aXl0WXRYTTg3ODBMMlZIbUd5?=
 =?utf-8?B?clFSVXlmaG9LdW9hNzBQMlp3TTRKWUo0cGdoenU4ZXRLK0xGbGlVaUw5R2tr?=
 =?utf-8?B?cEQ4TDZiNkNVN3k2UkVEbFdHRS9MQVZQNjBHVUpEeCsvVGZzK2JQQnZZS2Rw?=
 =?utf-8?B?QnM4YWVma24vYjAxUDUrV0ZMOENjVG1OK3NnUVNLa0Q3dEtrL05idWlQb3I5?=
 =?utf-8?B?eVRiSVJ4amE3b2RlbTExemx3SlIvRStYeVFIcHFEc1UrZ0plRUxJMjJVcFlo?=
 =?utf-8?B?dTZLNDdjeFBnUlBVWnFGMnNwTTYzelFoeGx6TzRqeWU2V2tadmNmb0kxcHVY?=
 =?utf-8?B?eW55NW9oZDBlYnJJVVV4dVFFR0dzZ1RnanZwRy8xQkQzWENSR1R3TndOc3pw?=
 =?utf-8?B?SnRsTXpranU2YzJJdXhlcU9ON2hHZENnMjJPQ24rTTUwLy9SbVFZcFlrcVpE?=
 =?utf-8?B?RVlheFJpTFE5b1FSWm9mUHptUEEzWGZqYmdhdHhaM0NEVXBwSUwzQnhybDdQ?=
 =?utf-8?B?QnJCczhFeExNQUdPZ0JwejU0cXo5ZjlXNVdienFrK3p1RXFNNDVOSjhnQmRy?=
 =?utf-8?B?bHhyemFqRmlncDZTQitITW1GQkpyR080Q3FzaHBzQzBkcG1DZ1lOVFl5Tk1j?=
 =?utf-8?B?b3hoQUFVeC9ZRXdZMEFTZlo0bmViSFlxUzRZZUpVaGJOOGsvR3VCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a911582-24b6-4dac-0ef4-08deb257eb2c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 07:59:41.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX/lXYmAUfUPvl+YxPqCOjbNWOaSYdozEqR9GHdVCx+tgd23+fFsndiP7S+hjTKYpfDfhIegfi70OKacVPd/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6627
X-purgate-ID: tlsNG-ef75cf/1778831985-0B77AC48-680304CB/0/0
X-purgate-type: clean
X-purgate-size: 6734
X-Rspamd-Queue-Id: E306154AF3E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,msgid.link:url,intel.com:email];
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
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:57:45AM +0200, Jan Beulich wrote:
> On 14.05.2026 17:18, Roger Pau Monné wrote:
> > On Tue, May 12, 2026 at 05:38:08PM +0200, Jan Beulich wrote:
> >> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >>
> >> Add a new module parameter that allows adjusting the C-states table used by
> >> the driver.
> >>
> >> Currently, the C-states table is hardcoded in the driver based on the CPU
> >> model. The goal is to have good enough defaults for most users.
> >>
> >> However, C-state characteristics, such as exit latency and residency, can
> >> vary between different variants of the same CPU model and BIOS settings.
> >> Moreover, different platform usage models and user preferences may benefit
> >> from different C-state target_residency values.
> >>
> >> Provide a way for users to adjust the C-states table via a module parameter
> >> "table". The general format is:
> >> "state1:latency1:target_residency1,state2:latency2:target_residency2,..."
> >>
> >> In other words, represent each C-state by its name, exit latency (in
> >> microseconds), and target residency (in microseconds), separated by colons.
> >> Separate multiple C-states by commas.
> >>
> >> For example, suppose a CPU has 3 C-states with the following
> >> characteristics:
> >>   C1:  exit_latency=1, target_residency=2
> >>   C1E: exit_latency=10, target_residency=10
> >>   C6:  exit_latency=100, target_residency=500
> >>
> >> Users can specify a custom C-states table as follows:
> >>
> >> 1. intel_idle.table="C1:2:2,C1E:5:20,C6:150:600"
> >>    Result: C1:  exit_latency=2, target_residency=2
> >>            C1E: exit_latency=5, target_residency=20
> >>            C6:  exit_latency=150, target_residency=600
> >> 2. intel_idle.table="C6::400"
> >>    Result: C1:  exit_latency=1, target_residency=2 (unchanged)
> >>            C1E: exit_latency=10, target_residency=10 (unchanged)
> >>            C6:  exit_latency=100, target_residency=400
> >>                 (only target_residency changed)
> >>
> >> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >> Link: https://patch.msgid.link/20251216080402.156988-3-dedekind1@gmail.com
> >> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 111f77a23348
> >>
> >> Add __init to get_cmdline_field(). Put cmdline_table_str[] in .init.data.
> >> Other adjustments to fit our env.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> +/**
> >> + * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
> >> + *
> >> + * Adjust the C-states table with data from the 'mwait-idle.table' parameter
> >> + * (if specified).
> >> + */
> >> +static void __init cmdline_table_adjust(void)
> >> +{
> >> +	char *args = cmdline_table_str;
> >> +	struct cpuidle_state *state;
> >> +	unsigned int i, state_count;
> >> +
> >> +	if (args[0] == '\0')
> >> +		/* The 'mwait-idle.table' module parameter was not specified */
> >> +		return;
> >> +
> >> +	/* Create a copy of the C-states table */
> >> +	for (i = 0;
> >> +	     i < ARRAY_SIZE(cmdline_states) && icpu.state_table[i].name[0];
> >> +	     i++)
> >> +		cmdline_states[i] = icpu.state_table[i];
> >> +
> >> +	state_count = i;
> >> +
> >> +	/*
> >> +	 * Adjust the C-states table copy with data from the 'mwait-idle.table'
> >> +	 * module parameter.
> >> +	 */
> >> +	while (args) {
> >> +		char *fields, *name, *val;
> >> +
> >> +		/*
> >> +		 * Get the next C-state definition, which is expected to be
> >> +		 * '<name>:<latency_us>:<target_residency_us>'. Treat "empty"
> >> +		 * fields as unchanged. For example,
> >> +		 * '<name>::<target_residency_us>' leaves the latency unchanged.
> >> +		 */
> >> +		args = get_cmdline_field(args, &fields, ',');
> >> +
> >> +		/* name */
> >> +		fields = get_cmdline_field(fields, &name, ':');
> >> +		if (!fields)
> >> +			goto error;
> >> +
> >> +		/* Find the C-state by its name */
> >> +		state = NULL;
> >> +		for (i = 0; i < state_count; i++) {
> >> +			if (!strcmp(name, cmdline_states[i].name)) {
> >> +				state = &cmdline_states[i];
> >> +				break;
> >> +			}
> >> +		}
> >> +
> >> +		if (!state) {
> >> +			printk(XENLOG_ERR PREFIX "C-state '%s' was not found\n",
> >> +			       name);
> >> +			continue;
> >> +		}
> >> +
> >> +		/* Latency */
> >> +		fields = get_cmdline_field(fields, &val, ':');
> >> +		if (!fields)
> >> +			goto error;
> >> +
> >> +		if (*val) {
> >> +			const char *end;
> >> +			unsigned long n = simple_strtoul(val, &end, 0);
> >> +
> >> +			state->exit_latency = n;
> >> +			if (*end || state->exit_latency != n)
> >> +				goto error;
> >> +		}
> >> +
> >> +		/* Target residency */
> >> +		fields = get_cmdline_field(fields, &val, ':');
> >> +
> >> +		if (*val) {
> >> +			const char *end;
> >> +			unsigned long n = simple_strtoul(val, &end, 0);
> >> +
> >> +			state->target_residency = n;
> >> +			if (*end || state->target_residency != n)
> >> +				goto error;
> >> +		}
> >> +
> >> +		/*
> >> +		 * Allow for 3 more fields, but ignore them. Helps to make
> >> +		 * possible future extensions of the cmdline format backward
> >> +		 * compatible.
> >> +		 */
> >> +		for (i = 0; fields && i < 3; i++) {
> >> +			fields = get_cmdline_field(fields, &val, ':');
> >> +			if (!fields)
> >> +				break;
> >> +		}
> >> +
> >> +		if (fields) {
> >> +			printk(XENLOG_ERR PREFIX
> >> +			       "Too many fields for C-state '%s'\n",
> >> +			       state->name);
> >> +			goto error;
> >> +		}
> >> +
> >> +		printk(XENLOG_INFO PREFIX
> >> +		       "C-state from cmdline: name=%s, latency=%u, residency=%u\n",
> >> +		       state->name, state->exit_latency, state->target_residency);
> >> +	}
> >> +
> >> +	/* Copy the adjusted C-states table back */
> >> +	for (i = 0; i < state_count; i++)
> >> +		icpu.state_table[i] = cmdline_states[i];
> >> +
> >> +	printk(XENLOG_INFO PREFIX
> >> +	       "Adjusted C-states with data from 'mwait-idle.table'\n");
> >> +	return;
> >> +
> >> + error:
> >> +	printk(PREFIX
> > 
> > XENLOG_ERR ahead of the prefix maybe?
> 
> I did already raise the level from info to warning, compared to the Linux
> original. I didn't want to go yet farther with this, hence why I'd prefer
> to leave out XENLOG_* altogether here.

It seems like the outlier to me.  All other printk() instances in the
function use an explicit prefix, so I would think it might be best to
also add an explicit prefix here.

Thanks, Roger.

