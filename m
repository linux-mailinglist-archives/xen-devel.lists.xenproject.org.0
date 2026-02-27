Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VY+IJtNIoWnWrwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 08:33:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1001B3F29
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 08:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242481.1542911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvsLb-0003Rh-Fs; Fri, 27 Feb 2026 07:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242481.1542911; Fri, 27 Feb 2026 07:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvsLb-0003PE-Cc; Fri, 27 Feb 2026 07:33:15 +0000
Received: by outflank-mailman (input) for mailman id 1242481;
 Fri, 27 Feb 2026 07:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vvsLa-0003P8-Ju
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 07:33:14 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920f3522-13ae-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 08:33:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5703.namprd03.prod.outlook.com (2603:10b6:510:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 07:33:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:33:07 +0000
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
X-Inumbo-ID: 920f3522-13ae-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCW2qHANxVFkrPeG3ntDaeMAiiirn7cTNGrNY0sYFJgUUlSoMWGCIt1vQUHkimSvhiO2D/ajnpUEQFv2waAuG9oVixZA9rOVxaab+tSqomHFIqfOSC/NUHfOyUY+Ounw4Rq2mLdZS9a+d4pAnFF9c642OxpOeiQF9yoGy6CajEArShd9VRNUBZpqSaHWk+zg7w2thBxFdJ9wu28ukzTD63AxMHrkW3wIdohIey9SD6ESwF4DeqM2vUXWPZy8izMQHI2MvZnaTEIvLcT4nLxj1CcMQjxLDjr8m1euwkdT8WQxDwnfhfcRACIme80/C+thZ54K4AhtW4IVyI8oHavNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gPyrLbIRMlWHvq+gk6p2P9DB+bSNrYAm0t1G42IeG0=;
 b=fx9W9gkZBojwf0VMaAJOrsEcdH/K7CU4jLVg9iHPtCOGkvqV56NZTjURD6JFZRnZPLgCburoBPLWee9Jh3tTJVOwQtfPKH/I+AIL5VPuYQciIQTDQW8uRRaBJmjop+IS02YVuQV9CUo2hthujmp7+zPJZxP9whLaczs5wbmhvPwh1dG0NsBMC89l9GspWbXoPK/a+o2HGzQCOR5xhVkx+5QxTnhhuUxoW+Y4bqfR9voWvEdCVh2JpJkpsFufCD0uqHYAYEx0krRlTGmSXCPcXUGqtcHJ5wiN2nEN6ye3CYeW49eM5CGD6s3gqPYHXZg6GUmTx93pNua747dlikVbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gPyrLbIRMlWHvq+gk6p2P9DB+bSNrYAm0t1G42IeG0=;
 b=fEsrM4EirgUJWrGkWuTPAEe30NY+n87xqvGponJWcwKBi4ioLQoYRz3lbj4eljEwU7hN4WdtLD40LaXPaETtZiU5BfDYVNTpjEZDsdH37RTGwd0wsweA+b4UOPR11zN9fWbrVdbTkfbm5vLhccds2srsh0h5aqDc7b8GE27BerE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] xen/cpufreq: a couple of fixes for the sampling window
Date: Fri, 27 Feb 2026 08:32:57 +0100
Message-ID: <20260227073259.1200-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0019.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: ad703313-b5fa-482f-5900-08de75d27350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	VsXrkv9NaMNKdM54igH+cEh0XcCaGKsIjxsiv5mF4kyN3Ny6pBwVSXvrFpm3yPkzLwfoodOlGmSoxpRJI0df9vKUxWSssMuRF/VxBF8tALfrOUO96QY4FrKYpcNj+9GOfhmOC32ldq3Iuz5yLEzIgeTNc1xWmJMf4PQ1oP34iu0qvffrYOnFnXdhYQQZN0jYcKznzFz1bBfyvp1yIfcOPuaVn81JQHwSwOQii9CYhspPvPm+hel0eCjIBbbjag6a4HdygaR6oNvRQ9/MFt/HRGtGNl9kAK7ZwFozH4zKfBpMaFBJDe+N3g0aPYQc55X6I2SvycQfKfzAOVJbty+1foPF1ucH3H/eqk7u93RF4ZvTh+CQcPupDchl+dfu79BjAHCatV6FNWm0TWk+XpTHTSdC5tJnIXakATaQevUCUEjHP9Oc3UaAE1rB2aGLMDtDslSwRyQm8W4j3IJjrZmeJR3XSxVeiwzV4r0i1wPnqwBksirYisMDeixtfW/4fVaVHVWZsw+qx69BY6szCeSc05y1Xob/BmjSJQ9BY+VFc7XYAfLRHsCzxGNqLo3kOSr+9b4t2oVcpP5PBe+FqsvHpdSm7ffmzQuR+Mi6Fe8jv+MxXqpHiRus5gPT2XT2ih6tLmgjkNdcKmpoKrOkJdel/5g0HYultaEMbGMQrb+lkLNt283WH5DNfgblYZ4uCyKAz5Tkn1/QbLsRUjMWFZbJFOlBz/jAjxAEWxwg14M8A2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmxWM3FMc2pjTDB6R01CZ1RXSmtwNEpaY1pyNVlQUDZSOXNTRlc0YWQ2aUlS?=
 =?utf-8?B?VVZLTGtFSjkvUnhhVGxEMzg2OFAwaEpnbko2Mk9VSTlXajlrUWR1SE4zbkxG?=
 =?utf-8?B?Mk9EMkNIRG5uN0JqU2I4UStkaXg0ZXhpWkZITjVMWnZHS252enZzU3pqUklV?=
 =?utf-8?B?U0o2YzRodkFFMEw1MnphM2hYRTZnSnhURUVDM3l3ZCt1OVZiemVQWSszSEh1?=
 =?utf-8?B?YWpqNXltSTVLNzloKysyYi9yZVJ0Y05PZkV5aXBuVkVhTXcvT051QTZjZTRY?=
 =?utf-8?B?RUdWSnNwSVVDZWV4OHc5OFVUci9abjhCSnk1RDdjak1CRHBqeTBzSUl2SHVr?=
 =?utf-8?B?ZVBTckk2Vmd4dGo1YXRHVlh2OVJ0WlYrS2ZhMkZwYTBtUjh1bGEvS1VHRzEv?=
 =?utf-8?B?MWZ5c0xqQmlqUUFEb1VtU2dOZWJuMmM5aXEzR1NYWXhFYmliSWprYXpidE9m?=
 =?utf-8?B?bDhFY1dGbWMxQzJlRTE3QXB5ZzNIR2NIemNCY3dTRUZBbmsyYldSaU81enBC?=
 =?utf-8?B?UHJWckhYeVVlZGN0RFRmRFBzNk1FNW9GNUU1ZWVTMzZweXhKZG1IVkM2Mldk?=
 =?utf-8?B?NkJKTlRNeWFkMkFGRWRuMTR4U05nWGJDUWt1QnRrNjJjSlY2N3lVSWRtQ1Za?=
 =?utf-8?B?UG5JNEVvOXdkbWp3SXVTZ215MmhEYVlaTWw3c2d3MlF3ZTNhMW5HcUNJdmg2?=
 =?utf-8?B?THNqT3Z0UWF4L1BFcjY3b2liL2k1VXFUY3lkMDdzS0c5blFTUDFkUElYZXBh?=
 =?utf-8?B?bFA3Sk1yWk5INjRFRm0vRlhHMG9qcVJnOEd5T0h6S1E0SXQ5VXNDS3oyMFZr?=
 =?utf-8?B?RmVXUlBEcld5bDVMak9GWTB2SVZGYVRwcWxmdFlLK0xFQkhrWGFDK1hWMzQy?=
 =?utf-8?B?SWxoUVJOR0I0eWFKQ0JTYXJsUEhxbmVBc0hrZnJMZGVzSGFRb1phdTE2dWdC?=
 =?utf-8?B?YWxFNXlUOTNETmlBaGNPTTVUTEtleUhVVUxUakJOWTN1eWUrSkdRdzFJT1Bz?=
 =?utf-8?B?M3Z4VlhneW1SSmdQMFlJZU5rUWtPQWVzMmRXRUtOQVZsTmZMcVRYU1IrOXJW?=
 =?utf-8?B?R0wyQmdYVWpYVWZUSHphZmNjTExuYTZKNG12Z3hxeWtnMzBwUzFjcWFlT0g3?=
 =?utf-8?B?SXRKWFdIdlRzSExDejRZZzRzRTZzRWsrSHVMQ3lTRXNIc2Z6eWVCUGNVMzc0?=
 =?utf-8?B?YnpsQWszMXhjcVRTbnVJU0ltT05iTnh6VWc0WnM1dlpmbWRyUjVUcjRLMkl2?=
 =?utf-8?B?T0Mya1p4UVk3akhpQnFkV1ZTQnY4M3dZT2ZpQkh4SWhMVkduYmZVUFhpNVM3?=
 =?utf-8?B?dWNYQWRrZWNkb3dyZEdSMnhTVGtzNE1GZ0VHZXNnWk8rUEx5SyttUm1Hclg5?=
 =?utf-8?B?dHJ3UzNqbWNveFBYVHRodWlNR0JBcUhWSCs0eTFEQVhucE5UV3ByZitQZWlr?=
 =?utf-8?B?TG5neHZtd05LVEN2Q28rMzhwb3dYcVlialJlZ1pOR0o1VDIwVEVhd3l4bDlp?=
 =?utf-8?B?N2h6OG1iRjZmQXgxc2prMzRIQXhUWHc0Q3RHcU5DOTR6OXZ4VkdYV2xoTm0w?=
 =?utf-8?B?SFNiYmVRMC9NMXJxNzZ2TUJrRFZmeHZlS1R4NEliQm9KazZVL2VsU3R0Q2dN?=
 =?utf-8?B?MWh6Q1NlMjdQaTNmSW03RGo3eFkwTkJRNFRyMkJqenBiVEhZLzRwMThmcit2?=
 =?utf-8?B?Kzh2NG5VNFdMTWVCN3JJbDRMVjR4WHNTNTh4TXByL3QzZ1FMTC9scy8zbmR0?=
 =?utf-8?B?THpZNTlDWjRtQjNlRENFR08vR1oySkNyRzh5emhLWm52d3BDMmpvdVIxZ2o5?=
 =?utf-8?B?OWdlRWlPdWlUTDlBUUtSU09TQUdxM2VNLzJqZ1Z5QjRuN1Z5bm40QkNLRjRE?=
 =?utf-8?B?R3pJNGg4bEE1dFhVa2h2d3BHY01rYzVsTlROWlNWSkk1bE1oa2ZXNDV1SE11?=
 =?utf-8?B?Y1ZzTmV6VDdXSDd2amJqcDN0RjNsa3ErK3h4MmtndWxqNmY4QUNSMDh1VmNL?=
 =?utf-8?B?UGVwam9nbTlWcXEzQm1ZT0V4MXd5OUFSNWk0ZUJmMlJiVk53eWZpV2RhdXFT?=
 =?utf-8?B?TWNIa0E0MDV0YWFaUHg4OXdqS1ZwbVdqWXUxRjFiNUxFOVRvU1BHR2dpN09i?=
 =?utf-8?B?MFp6SVltM0VVVE9wZTFPQS9EbTBDNHcwUHRhTytWUHdEWXRMMXhXaTUyQ2dH?=
 =?utf-8?B?VkUwZDUxVmJiT1lHSHQyVnlOMDl3M3IyTGd6UHdxcWNZSE1kQmFNWmtBa0xt?=
 =?utf-8?B?RkRVWU14aGNnWmd4U01TMDV0VkptNVFLWHhJVnNEdDRuaFN1bkhxTjI2RDVk?=
 =?utf-8?B?UFVSUThEaUQ4b0tvZ2NobG9TOGNrRGN6KzZlQURtS216R3hwMTRhUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad703313-b5fa-482f-5900-08de75d27350
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:33:07.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdoBohT5xqhWzcJL9w6X/vECh762QGJyCmXw3xW2Ly6VQDJ/ct4k1sQeXAzp9mdn4B7BDSTjZz++4jqe2nTWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5703
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EB1001B3F29
X-Rspamd-Action: no action

Hello,

Since a month or so I've noticed that my only text box that supports
P-states would seem to eventually get all its CPUs stuck in the lower
frequency P-state, and no amount of load would result in a P-state
change.

The issue has always been intermittent, and not easy to reproduce.
Looking at the on-demand governor I've found the two issues fixed on
this series.  With those fixed I haven't been able to reproduce the
issue, but as said I don't have a deterministic way to trigger it.

Anyway, the fixes look legit, so regardless of whether there's something
else causing my issue, we should take those.  I'm a bit surprised no-one
has noticed wonky performance with the on-demand governor before; the
changes that introduce those issue have been there since the governor
was introduced.  Neither I know why I've only noticed the low frequency
stickiness issue ~last month, if it was indeed caused by the issues
here.

Thanks, Roger.

Roger Pau Monne (2):
  xen/cpufreq: fix adjusting of sampling window on early exit
  xen/cpufreq: fix usages of align_timer() in the on-demand governor

 xen/drivers/cpufreq/cpufreq_ondemand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.51.0


