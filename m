Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y6tENByrKWrebgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 20:21:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7D66C36A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 20:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=z9GWyU1V;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334672.1597564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXNXC-0005tT-6l; Wed, 10 Jun 2026 18:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334672.1597564; Wed, 10 Jun 2026 18:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXNXC-0005rq-3w; Wed, 10 Jun 2026 18:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1334672;
 Wed, 10 Jun 2026 18:20:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXNX9-0005rk-SB
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 18:20:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXNX9-009dhS-6r
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 20:20:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a29aac7-bab6-0a2a0a5309dd-0a2a4505a5fc-22
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 20:20:11 +0200
Received: from [52.101.53.70]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a29aad9-aaa8-0a2a45050019-3465354665ca-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 20:20:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 18:20:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 18:20:06 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbLr4AnaqRi692JDcIz+3YWLbJGQrXQ9WifI90DEIBN3V0QA/97/7gPdKqa/Xihv5NVf80EpoypoKUur4YJG22QOU2k4y3GjG5fEfhk4kbWaMkAXvp0CXQ1Z3zpYIO52s1hfASFXZC6tNqcMbjLnjTCFinHUYGVTM4VlWUWy7FME4u+tfqvBpwAVmoML7inTyBM41EnP4v43LADpX9x2N4CqyzGGn/iaU9p6rgH0+P+m60ZMTdsdJRAwfZ3G9hPpnEh8adW6+CqTTO9ll1+99sSjVN13UqEjwrFiELc9z66tyIR2M0pQMzrakwxn5hXIc4TEZRDmMcR/nMC1xwwAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zGDy93rB1DYgqXEzkIxkMsUHXhpUViBeCTDJx1Nj2M=;
 b=vD3+IkNimOFKKPeO4TwC+XwZm7AubKxgtFEYfQ1HNLzG0x7ULcYGIKK7TmnrQTpUhCJr1YaToDT+gZt6IL4VT2dhXzr8vr9Cw9FfiZhxEC8fsApg4sGlMTkAsV0MnNf3F2oRoKffUtFdB36/flErsruVmXT/L6izQ0IuOy1sFya55KvWRgT64fJJvAatjPk75ZsaRggVlhyoN2ieVClFC9yQ/0juk6JWKF9x8pe5zZPr/2Qamzr50oTwubbtKbjyaYuxKOyEWXVK4Lpw7DmJ72stufZCIBPsfkTdlbrWqHtCfDr9R4TRuiZe58uwK6/IBgA+AdEGk7bJU1JA3jQ0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zGDy93rB1DYgqXEzkIxkMsUHXhpUViBeCTDJx1Nj2M=;
 b=z9GWyU1VYqdLZxltL8edHb9bgT4z9sY2g7nTNF1W2dvnCq8XEtVjQiUoxiB4sAoLqEmXAHEoexWxy7SAws5cZTZzCi1hnTWapr3CWc+5xNQyAR/w/DLOMa8Iij0HZOjr9kDVNjCYxcX6BaB1NzZ2iy0YK1ZYcWD4nW7DQXZWNLY=
Date: Wed, 10 Jun 2026 20:20:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 2/2] xen/x86: Change stub page allocation/free
Message-ID: <aimq0g_XqJQ-7Gqe@macbook.local>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
 <20260609000638.121027-3-jason.andryuk@amd.com>
 <ail8YNrQLZ9bumiH@macbook.local>
 <085ebfb8-d76c-4a13-8b5b-130959b25b51@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <085ebfb8-d76c-4a13-8b5b-130959b25b51@amd.com>
X-ClientProxiedBy: PA7P264CA0269.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 652191c8-84b2-40b9-6018-08dec71ce604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	06rzRzOUECiGInN4/QnQhev/ZDh265s9BVHSgdCqYKwmUOOfJi8Z1vw+1FEJzwuYjRqQnMZm3VGgITvSBrfLLc0WbcgpEr9eP/RWu8buEow2u0VgGsFCWii+uzSKU+AVtdG3BYzz4Kn3OCv1Nnua/FW2K6fBedFphJ89cA3kDCRLuOnqOOog8BKpUhpgTSm9LHrbhZmJKSNd/A59XuJTHfY/tbil5sgBToDrxpu+jVQIEmjgUlRoJiH835Hfc9Exy+4pLa+odtwSJ8X6cTg40Y8rM5S3QkGZOThVCL7JkfXDvZhCLjqvoVSOrTRaghK/+q8diklcmNQR7NBSYGt1XFSo6e/LovkwV2EWLejvN0hcSvOQOTwPc3vLXKci7znm28p2x1EOMtj5A5/U/C6gvwFte23Cak3WqVq4c/Chfo8BIrIeOUqBRXp0lp2E3g8vlCQc6jbA7wRQRREVvB552DDJ5QlVJ9dUjgDjUlZNQhSz8oPm1Asu28UkHgLH37wc3Q9nTd1eyusQonMk9djdVAQAOFw1yU4qCWzxsow5xmUvbTBGWSrOWWypZX3fAtdkwQvpArHfEzX6UpHk7kZXQWnzsxoDLexNaVhb6FGfcazQ0KEXTyAuaLRibSrCKFL071PSyNTO6oOK47jrAueGP1EtQl4Y0yYwkp8mfS0xvhQWwXsCRHU1LPkSBkBG7Nhu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTQ2OHY3MFV2UHlBbi9BQjc5UnFkc0hjajBhNzVuM1JPT25jL0dKT2pKd1pk?=
 =?utf-8?B?d0FKWWhLRUZVVEJyemhPT3N2ajJJdElhUXN0N1gyOXBoTCtNbDdxaGpnRG1l?=
 =?utf-8?B?Y0FCbkJ2SHBLSHNZRWpKQjhPUGNxamNnTDdoQWppbzEvZEt5a2hNZ01tcVNk?=
 =?utf-8?B?eS9wL3pON3pIZndaZVNiM1VvaDdWQ0h0VE5ySjBXUlJvVzlrUnMrVHJtQXd4?=
 =?utf-8?B?cUQwZDVVT0d5bEl2ZEt4VTBPZUpUanNQazRlQ2JBL21kcDZ6eGUyTXNuS0d6?=
 =?utf-8?B?VStWemhQdERVM1N1SXZHSE1EZWRkWGdjbHA5alFwanFVTUd3WDh3RUxQSVFU?=
 =?utf-8?B?eDFHR21LN3lUZ29ma0t1VnJqTkk2bFYrSE5LTHhIZmFRcjk0c1UvK0dNdjFB?=
 =?utf-8?B?VVlPYXRUbEJpTVduaGFXeW52bzR5OVV2dGpKcmxqelcrYldjVnhhcitmSXRT?=
 =?utf-8?B?WTVyZjhSam5HS3lFMnd1NHBBajk0UFZ4eXBVQ1daTjRXZW5WWldkSGhJN2ZF?=
 =?utf-8?B?Yngrd25qRDZCMzJRdjRoN0JwMFkzZ3hab2dMUm9UbExoajFJMWlnckJsOXhk?=
 =?utf-8?B?Y2RCcDdBTkx4WUdFNzdDNDBuMC83REg1eS9Ib0ZKZDBpYU1UN1E0TzFTeUxx?=
 =?utf-8?B?ZnhzckdmdG9FRUZZSU9wWUdqOVNRNms0amY2SXllaGxEYUh3ajlwMVhwSndL?=
 =?utf-8?B?WkNJb0xLazh1Uk9GTFFGbnZpeVdBNlp1RTlJZHNlQkFSYU5LdUhpanY1WkVl?=
 =?utf-8?B?NWRGQ1MvbmdJY0JER1FGV1lMcU9WZThqK3hIbWdKdXZSUWh5YnoxcklYOVRT?=
 =?utf-8?B?dW1Nb1Q3ZndJaXZNSDlTMEh4M1BaeUp0SWhKS204MHl2OGJBaUtNM0JwbVFK?=
 =?utf-8?B?eFk4eERXYVhjdTVxV1RaOEd5eUIxYVFxMUJtTEZUeVNZMUN2V2xzZEtCaENz?=
 =?utf-8?B?OTg2ZW8zeWZJeDc5QVVGb0UrZk55Vkxoa2Z5RFNtSFlGcldDMTc5QkgwTkMv?=
 =?utf-8?B?QnZIRlY4anFqYU9xcVRPck53R1lHd1ZaOG9HeG1FUUMzVG1IbzRDQmRwcVpM?=
 =?utf-8?B?VDZRRUQzVGJaM3pCUzJ1NXp6VUV1d2JyMlNheWsyYklUYncyTFV5MmdZZGF5?=
 =?utf-8?B?UXI1ZmtGWFB1WUpDa2pBM2dveGhSbUdyb0R3ekEvZTA3d3pQWS9vNlY3ZWtJ?=
 =?utf-8?B?OVAxd08wSUk4MkhzSVlRU1dYbkw4b3A2VnhnekZGMnZ2V3BrUU85SS91MVlG?=
 =?utf-8?B?RXY1SmxFSVZvYnVhanZzUmNnYnIxSitZYzNaYk5oR1g0RzNmZ28vUW5uNjBS?=
 =?utf-8?B?cHA0QXpDbndKVXhkSjZRZHc5TGloOGRreTJoWjIrT3cveENOTENQNmI4VmZD?=
 =?utf-8?B?UHRncFM4c2FtSUV4NldDNnFScVgzSThaeVl6VVRQeGxsd0tKb1JaUzYxZXNt?=
 =?utf-8?B?UjFIVW5yQ0FRYnlqblVHQ1gzU0gybG02R2ZIRVBrejZlczZJSktrWlo4SGY3?=
 =?utf-8?B?TWJ0eGhrWUU4M1dvU3R5MStPTzNWMW8xc2d6OFVzK2tYZXdVd25HTk82ekFS?=
 =?utf-8?B?d1lYc1h1QThpZ0U5aDdFdnJxMVhuTWJNV3RWbm8zeXI3TTV5T3dWb3dPS3pq?=
 =?utf-8?B?R2REdi94VzEraTB6UEw1eFlvOER2WjNiRFJtZ0hYYkhyUlB0WFl1UUdya3hl?=
 =?utf-8?B?bXJidVcyOHpSWUpTSFE0ZGNrVTdkQUc0alc0dVQ0NmZ6dmFqa0Z0NlZZUTl0?=
 =?utf-8?B?a0lqTnJpNThJTkdnOTZCSUlGSFlWeEhXVnQ1K3YxR3NuRUtKb3ZZT1hGRy8v?=
 =?utf-8?B?Q1ZxZ2k4bWsyeEhrRmlPWDBHU1l6YXQ4OWYrSFdKWWwybCtETUt0cU1mMC9Y?=
 =?utf-8?B?S1d6TzQzZlhFaG9rQnVVR21ETW5HRlJqZUtJbHU5ZWpkUnkxeitWNFJTV0Vm?=
 =?utf-8?B?UTNJV0gzRFdOSHdncy9iQ2IzT0hieTZrK0tQeGNhSEFCRjhBS3ZtVUFqd0V2?=
 =?utf-8?B?NUw3UStFSnVGa1dvVlRqUzVMTlk0R2xUcVJaVktuQmRlem45TkNlTG1qVmlp?=
 =?utf-8?B?OGtobUZCOU1oa0JGZGY2VTF0QWo3UkVsd09RYUNIRlNoUHY2RUh2RHk4bkZu?=
 =?utf-8?B?NXVmSUlwK0xHY0I2ZXk1Q2g2My9BWEZnZkh2aTM5aEFBYktSQVRuVXRNWDdu?=
 =?utf-8?B?ejBwaE5WalplZkcyWGZhampGWGgxVDJ5OVBzLzkxYlpxczAvVnpsRmI4Mzdm?=
 =?utf-8?B?UkJ3d3Z5azc0bEdqVG1UQ25TNXFVTzV2bDBnclA4NHYveUFUZnd0dDAreXkr?=
 =?utf-8?B?VExJOXlsS21tK1lYYzFXalhXVUYyd2xvdlVsWG5ISWwvd0JLZnhCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652191c8-84b2-40b9-6018-08dec71ce604
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:20:06.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bShDqStLSze2HSGCBgopEQxT4OQCUP8w1+pRWZYehsHWY9B0L/nbhqgNE/I+/+H8888a4YpdPN7+S0USRZBKog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053
X-purgate-ID: tlsNG-c201ff/1781115611-E0867443-6F95CB6C/0/0
X-purgate-type: clean
X-purgate-size: 8148
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,macbook.local:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10A7D66C36A

On Wed, Jun 10, 2026 at 11:23:46AM -0400, Jason Andryuk wrote:
> On 2026-06-10 11:01, Roger Pau Monné wrote:
> > On Mon, Jun 08, 2026 at 08:06:38PM -0400, Jason Andryuk wrote:
> > > Today the inline tracking of the stub page is problematic.  0xcc is used
> > > to indicate unused, but it is also a "clear value."  A !CONFIG_PV build
> > > with smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free
> > > the in-use stub page.  Subsequent CPU onlining can write to the re-used
> > > page.
> > > 
> > > The new approach uses a global, CPU-indexed array of stub pages.
> > > However, to handle NUMA aware allocations, we cannot allocate all the
> > > pages in advance because the NUMA information is not available.  Keep
> > > track of 1 current page for each NUMA node, allocated on demand, and
> > > allocate the stub buffers out of those pages.
> > > 
> > > The current NUMA allocation approach is opportunistic sharing among the
> > > groups of 32 processors.  The new approach will allocate buffers densely
> > > in a NUMA node.
> > > 
> > > stub pages are no longer freed.  They remain referenced in the global
> > > CPU-indexed array and are re-used if the CPU is re-onlined.
> > > 
> > > stubs and node_stubs don't have an explicit lock.  During boot they are
> > > accessed single threaded.  During runtime, &cpu_add_remove_lock
> > > serializes access.
> > > 
> > > Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > ---
> > > I'm not sure how to test the NUMA part - I don't have an NUMA system.
> > > Also, if NUMA is active, is a cpu node of NUMA_NO_NODE still possible?
> > > I used the MAX_NUMNODES + 1 array sizing to handle that, but it's not
> > > obvious to me if that is necessary.
> > > 
> > > Roger mentioned removing the per-cpu stubs.mfn.  We'd need to replace
> > > that with exposing the stubs array for traps and the emulator.  I have
> > > no idea if that will be an improvement and am looking for agreement on
> > > this patch before attempting.
> > > ---
> > >   xen/arch/x86/include/asm/stubs.h |   2 +-
> > >   xen/arch/x86/setup.c             |   3 +-
> > >   xen/arch/x86/smpboot.c           | 110 +++++++++++++++++++++----------
> > >   3 files changed, 77 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
> > > index a520928e9a..9d776f81dd 100644
> > > --- a/xen/arch/x86/include/asm/stubs.h
> > > +++ b/xen/arch/x86/include/asm/stubs.h
> > > @@ -32,6 +32,6 @@ struct stubs {
> > >   };
> > >   DECLARE_PER_CPU(struct stubs, stubs);
> > > -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
> > > +unsigned long assign_stub_page(unsigned int cpu);
> > >   #endif /* X86_ASM_STUBS_H */
> > > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > > index 19ee857abf..0cac94cbdb 100644
> > > --- a/xen/arch/x86/setup.c
> > > +++ b/xen/arch/x86/setup.c
> > > @@ -2089,8 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
> > >       init_idle_domain();
> > > -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
> > > -                                           &this_cpu(stubs).mfn);
> > > +    this_cpu(stubs.addr) = assign_stub_page(0);
> > 
> > Given stub pages is first used quite late in the boot process, the above
> > arrays would better be dynamically allocated using xvmalloc_array().
> 
> Ok.  At some point I intended to dynamically allocate.  But x86 doesn't have
> num_possible_cpus(), and I thought num_present_cpus() wouldn't have the
> correct value.  nr_cpu_ids seemed close to the value, but then I convinced
> myself NR_CPUS would be okay.

I will double check, but I think num_present_cpus() accounts for the
maximum number of online CPUs possible at any point.

> > diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
> > index a520928e9a50..d575f1eb0631 100644
> > --- a/xen/arch/x86/include/asm/stubs.h
> > +++ b/xen/arch/x86/include/asm/stubs.h
> > @@ -32,6 +32,7 @@ struct stubs {
> >   };
> >   DECLARE_PER_CPU(struct stubs, stubs);
> > -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
> > +unsigned long assign_stub_page(unsigned int cpu);
> > +void init_bsp_stub(void);
> 
> With init_bsp_stub(), assign_stub_page can be static and not exported.

Oh, nice one.

> 
> >   #endif /* X86_ASM_STUBS_H */
> 
> > diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> > index b3045eac5b5e..dd0972a3025e 100644
> > --- a/xen/arch/x86/smpboot.c
> > +++ b/xen/arch/x86/smpboot.c
> > @@ -20,6 +20,7 @@
> >   #include <xen/serial.h>
> >   #include <xen/softirq.h>
> >   #include <xen/tasklet.h>
> > +#include <xen/xvmalloc.h>
> >   #include <asm/apic.h>
> >   #include <asm/cpuidle.h>
> > @@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
> >       return rc;
> >   }
> > -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
> > +/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
> > +static paddr_t *__ro_after_init stubs;
> > -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
> > +unsigned long assign_stub_page(unsigned int cpu)
> >   {
> >       unsigned long stub_va;
> > -    struct page_info *pg;
> > +    paddr_t addr = stubs[cpu];
> > -    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
> > -
> > -    if ( *mfn )
> > -        pg = mfn_to_page(_mfn(*mfn));
> > -    else
> > +    if ( addr == INVALID_PADDR )
> >       {
> > -        nodeid_t node = cpu_to_node(cpu);
> > -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
> > +        nodeid_t nid = cpu_to_node(cpu);
> > -        pg = alloc_domheap_page(NULL, memflags);
> > -        if ( !pg )
> > -            return 0;
> > +        /*
> > +         * Attempt to use the same page as the previous CPU if possible,
> > +         * otherwise allocate a new one.
> > +         */
> > +        if ( cpu && nid == cpu_to_node(cpu - 1) &&
> > +             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
>     PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE)
> is to ensure we it remains inside the allocated stub page?

Yup, if there's no offset it means we have consumed the full page, and
we need to allocate a new one (at least that was my intention).

> 
> > +            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
> > +        else
> > +        {
> > +            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
> 
> > @@ -1092,15 +1106,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
> >       memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
> >       disable_each_ist(per_cpu(idt, cpu));
> > -    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
> > -          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
> > -        if ( cpu_online(i) && cpu_to_node(i) == node )
> > -        {
> > -            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);
> 
> This loop tries hard to re-use the same page for a NUMA node.  My posted
> approach will densely allocate the stubs.  Your approach would re-use less,
> unless the CPUs are contiguous in a node.

From what I saw on a couple of systems, CPUs are contiguous inside a
node, for example:

(XEN) [ 2384.850395] CPU0...39 -> NODE0
(XEN) [ 2384.850397] CPU40...79 -> NODE1

> This is just an observation.  I have no idea how NUMA nodes are allocated.
> The "round robin" code in numa_init_array() made me worry that CPUs are more
> likely to be non-contiguous.

Well, the approach here would still work for non-contiguously assigned
CPUs, it would just be sub-optimal.  We can adjust if we ever find
such a system, but I think it's unlikely.

> If you have NUMA systems in XenRT, I think it would be worthwhile to test.
> Some printks to see how many pages are allocated would be useful.

Sure, I will give it a try across what we have on the lab.



> 
> Thanks,
> Jason

