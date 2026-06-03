Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pkg/JSYwIGplyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:46:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10F563836C
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:46:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=AGIrhtCf;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326400.1591841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlux-0006FG-UX; Wed, 03 Jun 2026 13:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326400.1591841; Wed, 03 Jun 2026 13:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlux-0006Co-R0; Wed, 03 Jun 2026 13:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1326400;
 Wed, 03 Jun 2026 13:45:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUluw-0006Ci-VZ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:45:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUluw-00CAdA-94
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:45:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a203004-5cb7-0a2a0a5109dd-0a2a450ab2f6-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:45:58 +0200
Received: from [52.101.43.45]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a203014-56b3-0a2a450a0019-34652b2dc292-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:45:57 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6099.namprd03.prod.outlook.com (2603:10b6:610:ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 13:45:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:45:53 +0000
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
 b=pbTfgfGtPYgWGzxZ2AkLoWDir0D5ReE4N60CL3+LeOgK73fBs/Tlv6aSWzHSe0UBNb9nbAx9Ln58X/RrzML8MVDn1VIZfGh5Fdyy3dWL5QbkbH1zPJM0+Cx09MOUJn7gAHQ+6aLot1Q6h2NYhnEmEJP06WTUaV5uR+EWquFSBeV5pYJC/g1YWOhKZGNSjjq5RqSxc/GWsYwvkST+krKg92oQwbOplIA83TxTJ0XvyyVRZF461W0z8B8DANhKyBjrqxtlINE7Z5vvBv5is243QZDa7C2PhJZcaQI94OvgDseb91CKp6zLEIMYWfswWClG4tMPTQptg4epQJ8EQmvFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7yhNv497TOx+GLykH9rC2Yigxk/02FKic+gK7C3HjE=;
 b=AUifN/9emtYdoTHIEc2iBDE4lPd0YwZ8sjVXhS82L6bF4Ghuk72FHpnT31KsejvPVJgbSXC7dV41fE2EX3KtlaNwFmb4+XuXqTPXo9zMhAbNWLB1HfFK8uY4zRpZ8s3RcrtyHOM9tAkvbWA8HIqoMT00Wb9Z5pBpBRwMPxB1S8TwzWQJLY/JpKiB1s8GOjtGja/tiaoYrnKC5Ma1A6raEXZ57NAl987TO4inL1UwDSNu1WVcWE0igiUowWZCdFW57hGerFdKpZPS/kQQ1fIWJ77JAVn/hH4ykcB3JtHYRTqZRJRNneydsRZ+f1IBez7ysevzDt4G/jp0E17kMAc4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7yhNv497TOx+GLykH9rC2Yigxk/02FKic+gK7C3HjE=;
 b=AGIrhtCf8E+IK9VjQTQXr1FmBC/jqNhwRC6CeQfGDV92RurEJLy35/I3cziAfdO9lYRPoqVMpvEYUh7JIYSZ+0TqcPBxAjTxSvWI/0CXNYYHZGlCo9EOxOaEksmDSnzGsEv1ILTRIrhLju+2MkeLKtiuvlJR7VWK8JoYbdAY1fs=
Date: Wed, 3 Jun 2026 15:45:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 4/5] tests/numa: add unit tests for NUMA setup
 logic
Message-ID: <aiAwDo3EWi1oghm2@macbook.local>
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-5-roger.pau@citrix.com>
 <2b1df2c6-ccbb-402c-b65a-7f3beefdeb0d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b1df2c6-ccbb-402c-b65a-7f3beefdeb0d@suse.com>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: f86053d1-7181-4d74-18e8-08dec1766e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|6133799003|22082099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	J3oqjspi7r2WCbb8H5V2LkVOZIfJTrJzFMaZkHbcfw2tJzLclh30HhQGVtk41bfnZTbV0fOA3bDEtyr+MhI6Q7QjfUDb/oNsSOfDMhUC2VOerNaL+/m0zzlwTy2PjwuFFnJRDdZgH2hN793fQ2WS8om9SNXWgjZ46XOUX+1qXvK93x1bzUkElaMINKAa2NKPg1xFvuXjGZ841lRq9T2r9FXGdQTt2aPNlrfW6NHV253jcrISGWuBMVS7m+AgABnGDP0B90JfPAJj/yne4OO+NdNxp9SbgkhuRmrd6LnBdIfewvKRJHKZAex3PCPaOPg1u9PITkgPYFPDpvRoBtLYOYtcY1MO6mmo9/SRlzjt1/1j++nvILMG3W71IyCLQdufIU37kR8XPz1LOAZBkVP8206u+nB0Jv0VRgEGdm14S2X8iznkYrGfC/nSjvJpaVs0h2kh2O/gUUfPvjvWmssqa1QwW5nqjYbBmc9OMCgAMvo2JnZC2l1CeXG1C05ULNrRK0uwQrW5oIJRluQyDtn4+muqp3IGZvV2/7S/zp5zqhHGpIk1rfu5MCxAh4+YAi/Psdektebgj7Q4zAy08fGF7DP1DJwuzv/eJzYz5F4ZOvNpl6tKJdjj2stoJBVFZxrpf4NLc7SQQFFlL80KTgW+7O2IP8zyTOm4AtO120hyP6YDcpuGJAAHHnS2UO70lgPU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(6133799003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YklvUU9RMjF2UFVWZVFqeVNUWGZENVhQcEVzT052TUIvL25aVlp6bmJiekNx?=
 =?utf-8?B?YnlkcGh3UTc4WHdYMWZpZUtacTd4QTBUNGFvLzVGMndZRnZCdVU4anA3Kzl4?=
 =?utf-8?B?SHd4S1VwZHhmdlZ3bGk5Wnl5K3A0Rm9aMjlLRUJ2MCtoQmptejFIRnhjQkky?=
 =?utf-8?B?WW5aeWhhcEZRUzVpMENHNU05eGZuVmthWnVUYU1jemE2cnFlSkMxUWxnZ2xQ?=
 =?utf-8?B?WjN1R05paGd6azFrTGlTbGtLTWYrQTlpVGJ3Z2FWYkUvbml5anVtSkpmU1Bo?=
 =?utf-8?B?UHdLWVRKQ1FDOHVWeVAxdlpzSDZ2Z3h1dVkwSjNpeFdPdk5wOFNBaDVCbGtN?=
 =?utf-8?B?QkdxM01ESlJldmlEQXBoaE9nV1Z5RElmQUZoT0swVXlEV1NKeHhzQ25NcDIw?=
 =?utf-8?B?QmlPdjlSdGNrSk1aZ3NIUnhLT2RsZHpGMTNySnNpTlI1aEVySEVMSGFNVzBY?=
 =?utf-8?B?dlZndVcrU3pnQ0NnWWUycUx6Rm9rMFNTZjRqUFQ0a2wwYnBMRWJwaVlWeEIv?=
 =?utf-8?B?azR5a1o0WDYzdVdsSHcrNDV5TlhBbTVSczZLNjFTeVN0aHRyWjU3MkdCMkRr?=
 =?utf-8?B?eDJlazRiWG9YdXo4bVhIbzRoOU1tTzVXYmNHbXJ2c25peURxMVp4S2phUEVn?=
 =?utf-8?B?V2RTQmJXK1czdE5BOUJZUWtvR2RaL0NUZ1JFc1ZYZnhONFlxQWwwWkJFZjYw?=
 =?utf-8?B?OEN2QkJKeG00SW1qdGQrbmo1c0FqWmpoSlZFa3FvWmZUbSsyYUJOcE9IN2ls?=
 =?utf-8?B?RlBEelpmS3ZDY0VubFVHTDlvSFl5M3BLWkZPQlN0UWNIdDRvM3k5NnVYV21h?=
 =?utf-8?B?SmRkZm9iT3psZ3k0VWg4UnRCbmtsZVZqak5ULzd0S3ArRkpsYkR1bHNBSXZs?=
 =?utf-8?B?RWVhMmxrYzkycHVkY0ZMMFZEZXA2NUl4L3IvR21NUHpPVjNDdmd3YTFHN2FW?=
 =?utf-8?B?ZHpwS0pWUzc5am1zT0JQODdtL1IvNnpJaFVTUE8vUnc5L0NJeUUzZzNVdUlF?=
 =?utf-8?B?S2xPYkNBL3FsZTVZUHd2NTZaK3l4Um5JNUphZHEySjhYdzgxbW5zU2hZTFgr?=
 =?utf-8?B?L2I5YWQxWGI2RHVuU0crdmZiMTlNZEJYVTgydkwrNVA1ck1aZzBrR1I4ZDFl?=
 =?utf-8?B?QjJCN0tEMUhudzZJTmdpelA0TzFFckxjSzA1L2hpbThIam5JeE5Zem91NkI0?=
 =?utf-8?B?ZWFkOGFWMkI4RFlYSmhheTVyQTVBb29pSmZ2ZGRGak9sOGdCWFdQeGF4ZmFy?=
 =?utf-8?B?SUJlOE1UZ0RjeVFmNkhRMEZsd2pPSFB1NUJPMGVZd0pNNmdUcUdqTE02bVNl?=
 =?utf-8?B?STZ0UkhSUVl1SUo1dDVIazNxT0NKRFBhRFdNSlhKYVFOdkNReFR1UHI2SmFC?=
 =?utf-8?B?ZTh0SjdrakhXaVNGaUw3LzhLbzI0SndVVUNGM1dNVXdKOVNFdGJ4QXh0ajFa?=
 =?utf-8?B?akZlK3ZYUGxETE9zMGozUHVlR1NRQXlrN1JjQ2Eza3J4cllockFGZVRmd0Nq?=
 =?utf-8?B?d1FqNlQxZEN5QVMwVlUvNjIrRjgrcTNsbENjLzJYK0JLSW5uZWNlclg3NzZ0?=
 =?utf-8?B?WUxVS0QyU2w5bGJONkFNTGJVMHppTkcxemR6RUNWQkdzdWZERHZaWktpUTc4?=
 =?utf-8?B?M0NzVzA4REU3T1RtckV4U09UKyt6azk3NzlQNDFyOUZyY2Z3U29YMHNzWk8z?=
 =?utf-8?B?N3BNd2toOHhnYkgvUGxtN1FhWGMyM0VqY2RMQlU4L21LTDZyLzdRRWp1bGZv?=
 =?utf-8?B?Q0ZvSUFqZ1p6MDhETzltM1NoVVdVOGh0WHQvZXU2RkhaUlZSVmtyWDZJSmdo?=
 =?utf-8?B?M1R5MTZidllybmtPSmJkYTU5M205ZmxPSGZyVytBR1JOUzNWNjYraTkzNkpU?=
 =?utf-8?B?WU9tQXVBZkRRSVFlUEwwVEV1cTJuRTBwV1BTMGpReHo4cURDVG0zUm5WR2pn?=
 =?utf-8?B?ajZkY1BzT2ZPb3VJN1kwbmNzRzVoaEhDcU1XVFp5bHZYb0kvbkhVeUhTWVNF?=
 =?utf-8?B?M1JLWlh3REdkWnRBN0FNMlIrVnZweWFlSUxrUWJGREtDNlhCMURLQndMMkNw?=
 =?utf-8?B?MmhXQWl6d2VpTVh1WHlkTkt3U0NxRHphWnZlY3hRaWhwRnJLcTdZYXZPL3Zt?=
 =?utf-8?B?WEcrS1FGKzBqSlhNc1FtTmxZR0E0eURxK0xwSmkrR1FYSFp4aHFSK3I4RnVp?=
 =?utf-8?B?bFZaVTBCeExCT29IUVhaSm14UkN1MTU0YzhyajdUeEd4blpnbi95VkU0WENH?=
 =?utf-8?B?R1hqSk1NSWwwREtsbWVjOGRLNUNqcmc2ZVNhVkFwU0lRM0RRSzBHZEZVTTM2?=
 =?utf-8?B?M2g0SGdDbmR6MHhwZHZXa0xPVFpiUnJTWG9XSkdORXlpWXVVbkl5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86053d1-7181-4d74-18e8-08dec1766e27
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:45:53.3749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NELI+HAWJggeqpKSmoz/mdqebTV//bIAoRbMa8T36rksbQSaT/RLJvLeQcwciD8jwrXcH6GV90kb7xju6dAT7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6099
X-purgate-ID: tlsNG-4011c0/1780494358-7FB918B7-C6E8B78B/0/0
X-purgate-type: clean
X-purgate-size: 4844
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:from_mime,citrix.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F10F563836C

On Wed, Jun 03, 2026 at 10:38:52AM +0200, Jan Beulich wrote:
> On 01.06.2026 17:43, Roger Pau Monne wrote:
> > --- /dev/null
> > +++ b/tools/tests/numa/.gitignore
> > @@ -0,0 +1,2 @@
> > +/numa.h
> > +/test-numa
> 
> Why the leading slashes?

This is the format of the .gitignore that we use in the pdx, numa and
rengeset testing.  The slashes denote that the pattern is relative to
the particular .gitignore itself, but won't match any level below the
.gitignore.

> > --- /dev/null
> > +++ b/tools/tests/numa/Makefile
> > @@ -0,0 +1,47 @@
> > +XEN_ROOT=$(CURDIR)/../../..
> > +include $(XEN_ROOT)/tools/Rules.mk
> > +
> > +TARGETS := test-numa
> > +
> > +.PHONY: all
> > +all: $(TARGETS)
> > +
> > +.PHONY: run
> > +run: $(TARGETS)
> > +ifeq ($(CC),$(HOSTCC))
> > +	set -e;             \
> > +	for test in $? ; do \
> > +		./$$test ;  \
> > +	done
> > +else
> > +	$(warning HOSTCC != CC, will not run test)
> > +endif
> > +
> > +.PHONY: clean
> > +clean:
> > +	$(RM) -- *.o $(TARGETS) $(DEPS_RM) numa.h
> > +
> > +.PHONY: distclean
> > +distclean: clean
> > +	$(RM) -- *~
> 
> I see we remove *~ elsewhere, but not everywhere. I don't, however, know
> why we have that, and hence I wonder whether it really wants replicating.

Seems like *~ is a backup file created by some editors (Emacs or Vim
for example.  Again this is a verbatim copy of the Makefile that we
use for other unit testing (I think I copied this from the PDX
testing).

> > --- /dev/null
> > +++ b/tools/tests/numa/harness.h
> > @@ -0,0 +1,184 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Unit tests for NUMA setup.
> > + *
> > + * Copyright (C) 2026 Cloud Software Group
> > + */
> > +
> > +#ifndef _TEST_HARNESS_
> > +#define _TEST_HARNESS_
> > +
> > +#include <assert.h>
> > +#include <errno.h>
> > +#include <inttypes.h>
> > +#include <stdbool.h>
> > +#include <stdint.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +
> > +#include <xen-tools/bitops.h>
> > +#include <xen-tools/common-macros.h>
> > +
> > +#define CONFIG_DEBUG
> > +#define CONFIG_NUMA
> > +#define CONFIG_NR_NUMA_NODES 64
> > +#define NR_CPUS 256
> > +#define MAX_RANGES 128
> > +#define PADDR_BITS 52
> > +
> > +#define __init
> > +#define __initdata
> > +#define __ro_after_init
> > +#define __read_mostly
> > +
> > +#define printk printf
> > +#define XENLOG_INFO ""
> > +#define XENLOG_DEBUG ""
> > +#define XENLOG_WARNING ""
> > +#define KERN_INFO ""
> > +#define KERN_ERR ""
> > +#define KERN_WARNING ""
> > +#define KERN_DEBUG ""
> > +
> > +#define PAGE_SHIFT    12
> > +/* Some libcs define PAGE_SIZE in limits.h. */
> > +#undef  PAGE_SIZE
> > +#define PAGE_SIZE     (1L << PAGE_SHIFT)
> > +#define MAX_ORDER     18 /* 2 * PAGETABLE_ORDER (9) */
> > +
> > +#define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
> > +#define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
> > +
> > +#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> > +#define mfn_to_pdx(mfn)   (mfn)
> > +#define paddr_to_pdx(pa)  ((pa) >> PAGE_SHIFT)
> > +#define mfn_to_maddr(mfn) ((mfn) << PAGE_SHIFT)
> > +
> > +#define ASSERT assert
> > +#define ASSERT_UNREACHABLE() assert(0)
> > +
> > +/* For the purposes of the testing assume arch NID == Xen NID. */
> > +#define numa_node_to_arch_nid(n) (n)
> > +
> > +typedef uint64_t paddr_t;
> > +#define PRIpaddr "016" PRIx64
> > +
> > +typedef unsigned long mfn_t;
> > +typedef uint8_t nodeid_t;
> > +
> > +#define __set_bit set_bit
> > +#define __clear_bit clear_bit
> > +
> > +static inline unsigned int find_next_bit(
> > +    const unsigned long *addr, unsigned int size, unsigned int off)
> > +{
> > +    unsigned int i;
> > +
> > +    ASSERT(size <= BITS_PER_LONG);
> > +
> > +    for ( i = off; i < size; i++ )
> > +        if ( !!(*addr & (1UL << i)) )
> 
> Why the !! ?

I copied this from the PDX header and simplified the function because
now it only cares about set values, and forgot to drop it.  I can
indeed drop the !!.

> 
> > +            return i;
> > +
> > +    return size;
> > +}
> > +
> > +#define find_first_bit(b, s) find_next_bit(b, s, 0)
> > +
> > +/* Minimal cpumask support. */
> > +typedef struct cpumask{ DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
> > +
> > +#define cpumask_clear_cpu(c, m) clear_bit((c), (m)->bits)
> > +
> > +/* Define the nodemask helpers used. */
> > +typedef struct nodemask{ DECLARE_BITMAP(bits, CONFIG_NR_NUMA_NODES); } nodemask_t;
> > +
> > +#define node_set(node, dst) set_bit((node), (dst).bits)
> 
> To aid readability, omit the parentheses around "node"? (More similar cases
> further down.)

Sure, this is all copied from the nodemask.h header.  I should have
adjusted.

Thanks, Roger.

