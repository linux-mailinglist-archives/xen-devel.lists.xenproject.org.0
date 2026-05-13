Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ0PKEONBGoALgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:40:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E937535426
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308137.1579678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAkP-0000eM-JQ; Wed, 13 May 2026 14:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308137.1579678; Wed, 13 May 2026 14:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAkP-0000cA-Gl; Wed, 13 May 2026 14:39:41 +0000
Received: by outflank-mailman (input) for mailman id 1308137;
 Wed, 13 May 2026 14:39:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNAkN-0000c1-PY
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:39:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAkN-00DVtX-1o
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:39:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a048d1a-5cb7-0a2a0a5109dd-0a2a450cd046-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:39:38 +0200
Received: from [52.101.193.30]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a048d29-62f1-0a2a450c0019-3465c11ec56b-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:39:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5558.namprd03.prod.outlook.com (2603:10b6:5:2c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:39:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:39:35 +0000
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
 b=PYJsOVfCj3b24y/LyR8M/oUj0fbdM/+GKfjTQwaCxdByQebZaTS0pF9MhQG4ntpntAws8yu266RLgqjJbj4qcR/mnG+P00jDccbOk5ESBpAXKNW47yk6RdRViYljbt3dF3rY1/GdsqIGiP6e/CHqAIJ+ZvNYKIZzn3uEGUZ2L/7M+ZYmQVuzvDZ6yerj1wKPFzBz0qQ9IWiD31TTnSizJuvBh1N/cf7GIR+0EO13SH1NhO5RKl1AAAgKGl7rhJPV4kYz25YJ4i6zCHhD/3KvWwJGf6fY3u0UfAaPZFskItpMR+SOpMyLzl5MlxiiDzHPgXzMmkLXW9HAa48ercjLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3Ji7mgDZRx0MSPA702xj0A7KjQdb21Pw2pcElLZ7t4=;
 b=CrwR//HdqMlOJWQuXdTTk4m/5jObwJ7cIdp/NQWu46i5pYj+Zt5M+oobxm4DOzShueHrN522IcyldOI+SPihEKKAaVYIu3kCW4yrjFlVg69Eilg4geSMBh5hcE0z8GuJYYuV6Ti4pAkFcsNYChTiJgCNKtjZDvCQnL2T1lVdEBrvzA1MHvuZc+vIOpvG5qQsat6GEYMswY232fPDDClWdoaNQ2Ct6a7LsSV9CbXxWiALXmnOUiEiYvEYHGj+xxV3QZI9pzLwmb6SJAJwKeOn6+BB3x2mCQDWV2hb9RL6Efkjv8VQTqHsAht9vh6fD5yLMLMOr1xDub2yTSlv70OzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3Ji7mgDZRx0MSPA702xj0A7KjQdb21Pw2pcElLZ7t4=;
 b=zrsScTEg01Ej1sKQLTUtRl5e4ljbfJrLfkZ47nSNrmju53RWZ3GqiLG13fGewApt8IfrJEzNKG0KCRMDs/D41736DQVJqlgadE1ZqVb1fvin91ggyvZJHSWNWqvGf9HWGiK3zK0QHFlwwqe0mu9qxRurHKyPAa4+fqB1gRdpYd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 16:39:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/5] x86/vRTC: use available macros for BCD <-> BIN
 conversion
Message-ID: <agSNJLsyBC7TKcEI@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <dac2443b-3ef4-4508-aa49-1e7d68a72d02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dac2443b-3ef4-4508-aa49-1e7d68a72d02@suse.com>
X-ClientProxiedBy: IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b385e8-5da3-4acb-a012-08deb0fd73fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	7U4+s1XgXYBa1FJSRNfK4Lr3nVmUDfiNF2zpxRn29ii3sf5EzXQOPa0qH0c8xE4BOpKBZE0RGok05icz4b97z5Mn2xRJBYG5EqKxhlBD0PIAHPK+kuZD/9hvD1rKKDIBqKE+fCr9x4GisD82u7tuIVvyI08rbvvzDmDRjM1SAVIbzRYGA+/1jTwSUmzqsdnO4+KQYsbjsfFr5P5Csf74otm9mBWkZ1PkT/nSJEdc8emdJltcmpAn4wZLwal8e2i0wgnutPacimhiWbvayEDIkjygfkhAoeLi/l4FD7TKICtdGM971GpFsAx3qLUqJdaSZ8/N5kuq+0Egc42ayqOdYtKUFgoJtZiAYlJEWNnU/gnDO+peSaTq8HPrD35tv5Q0Jz6jysa8nLpkLFElGwc4mmlZlin3axplWp/v+kFoY1EO3qRU+Rf1zhpGbTAnV2nDurDrucGjin8OgcsMvoqLUBhl2T2Y2EXOrdm3cqgSof/4EWJOiksjVO3EzGnw8dn8Qxv8Y1F6bfljEt62NX8MC1dzzMRM1yjuPv0IFnMKqd1Udoi5XuVj9oOFeF4mB0GjTJzkp9qVpo2QGAckuGlfHa49+srGGTLsGIKQbS57cjGMXXQYcGpR3/uGScOM5560eBzXKztVwxXxOqCxl6QHDbnItiXD7vLjXv8jZ3TkKNyFLJZlf+/lejoSjoGQ4DOp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZRdzhKUmxSOFhFcWtqWkZEYnI2R1M2NnVHVURzbGp1VlZJcnNkbHFFcWpP?=
 =?utf-8?B?RTZrbEc1Tmh1Z2wrTXYrelJ1Z0VFTlpTS0wxWkg4Nk9LeSswM01NOG5lOVda?=
 =?utf-8?B?N1VnM0dFV3Vnc1NYSXVOZ3lHNVNBWWNnRWN4UDZOSTBoNHlxODdIc1RNN25s?=
 =?utf-8?B?S296OWt1eHY1TEEzbng1MU84Y1lTWTZVZGo2WUlqNlkvRWp3OXBxd2dQOE9K?=
 =?utf-8?B?cmZQTlZENEZYK1FuaFEzNkhDa1VEMFhhK2tPOGRGSnIrS2t3bVlMQUZpNWVo?=
 =?utf-8?B?RzZ4dkFkK0Y3bkt6R1ZRVEdhcCtxNG5neG9zUXpYMi80ZHVDL2FEWllVZ0Vs?=
 =?utf-8?B?UC9kWTY5ZXpmakc2V3hTZjk1NzZmeFdCSGU1N1l3dS9ZYzArNGxIVER0alFq?=
 =?utf-8?B?dEJpcnRqazJLRE50bzhrcjNUMUw2UE5nbG5PaVJLRUJoMXo3MGdXNXpxdG4v?=
 =?utf-8?B?OGptc1Jud0JmSTJ0Si8zM0NHbUsvNTM3b0hDNWphTjJ2NDdXOWRySStCSUV5?=
 =?utf-8?B?TWJzeGNaTFhnUENNbzhoQmxnZE5LUGNuQURsZmZkeHJ0TkVHbjNzcUVRQVE0?=
 =?utf-8?B?ME5GRGRIazRLQjg3RmYwd3Qvc2dGRFFHa0hKU0RhUWI2TFBEZXFZNVp4dDJZ?=
 =?utf-8?B?cGxUQlZyU3JidmhncUoyYklLeW80VXZoNEJTU0NHSFJlbi9zcGhSb1MzcHlo?=
 =?utf-8?B?OXVMenJDbVJpczl0ajFzSHdndlpKSktvbnZTVHI0SHBXZ3VyK1RLUzV6a1pn?=
 =?utf-8?B?bFBiL2ZDNGdOaERCR2piVHRUQzhDeVF1N3NRTkg5eEVaZVE5S3YrZkpzcGNn?=
 =?utf-8?B?SDhSMWhBcVdCdGJDMFJVNEE5eWJlanIycjh4Zm44QkxOL3IvSE15dVdyenpj?=
 =?utf-8?B?N3BXL2NiMmFneXNaQ2JCbTRvMGxMWjV5WDVyWHJYWDdvQTc2WkVvREFJMnBX?=
 =?utf-8?B?cnVCa2Z1OWZRaVVKSXVHNytYVmRid1FuWXVLSCtlRU9MbFBKVksrMzdPd0Fm?=
 =?utf-8?B?UDB4MFd0MGUrTmQwRnBxb3hMZlUrQnhjNUFGbDF5WVpoRGhjY3RiODRWOHFu?=
 =?utf-8?B?WDV3dFFzWFRvV09OUVVPMlluajBYckJMeUJzUTVkSWlvQkdoTWRMKzFsbU1n?=
 =?utf-8?B?YjBoZ0diU2RSY242NlF1Q25sV0FtUEJZRnVNd1hTTHZINVBzZlJyUGswc0ZV?=
 =?utf-8?B?WnNPai9FQnNuR1lWaHg5N2YrMkh2QjVmM3VQL1oxN2ROV3pKSWM2MzE3QnhY?=
 =?utf-8?B?OVJDRU1sejIwSWhMZ2k5T0w1YWlSYldqRzhHR1VGbmNOemxFL3NvL0Y5eHBy?=
 =?utf-8?B?OHN1cVo5WGpGdWwyQWluMmdzVVFZQjc0ek1KUFBnT2ZXQnVNdnVoVGdJTHpy?=
 =?utf-8?B?VldoM0hNSHVjNzNXL1dNY2JEODQvWDZwZGx4NUg5Z05pc2lYdE9CczdwdGhr?=
 =?utf-8?B?SVUrWnR6UkZyN3pPMG0wczFTaUR3c2UvU2ZDb2RIN1piOEl4SGVHUVpQVDk0?=
 =?utf-8?B?S1YzWTZDVFM0Y2V3RVQ3cEFmSGd3YjZqaCtsU3ZmSWZHZkNHMFRJTGV1aGw5?=
 =?utf-8?B?S25GUDhoMXh3Rjk0T1k1d0lkNWZyZkJhdWJoQzVuWWFHUGxydEt4S3dZck8w?=
 =?utf-8?B?SHFRT0V3cTdaZmpjekxYUXVVT0Zkbmx5cFRiYjBDUzYrUmdxVkkrSk5ZYUMw?=
 =?utf-8?B?UUJvY01EcEpYZkVIZ0V3UEE3cnNESzRIWWdwYlR1eWZQUkR3TDJ1Q0pxRG5z?=
 =?utf-8?B?eWg5Q1diSVVhQ0NTRDdYaTN0MkJERFNBR0lpbzdPU1l2VGU4SEhnS0ZmMVlM?=
 =?utf-8?B?T1NLTXNwVjdYQk1zeWtFdEZ5WTRTZHZkTjZrekhBOTJ1aDcweXo0ZXNib2hx?=
 =?utf-8?B?RFF0ZmdJdHk5QThFOU1MbnlFOFhnQXJIZDVDRDJvcFkyNUV1OEc1Q3Fzakpz?=
 =?utf-8?B?Q0UrbW1yaUQ2TStaQm94YmZkSjgzRHlxSlRqdXROT3p1cW5TR3dZWDd0S1JH?=
 =?utf-8?B?S3VVREtyaUZGMHZsUWhITmxVK0k0SVZtRlNvS21GRnYxa29KNG1MQ0puZ3BZ?=
 =?utf-8?B?M01pbWFTeDRtMnFWTmhtR3A0cGlGdWY3T2cvNFpub1p1NC9VTUVTRG9oTHB3?=
 =?utf-8?B?djFUWEZiUkYxOG9DTElObUlqbHFIL3dVMVJnTTE2cXNuYlB0L3hkMHY3UVhJ?=
 =?utf-8?B?V0VIQ0szZ0FPZkdFVCtDa2NmNFlkOERLaVNoaFVSdFpJNG5sVjk0Q050SDRX?=
 =?utf-8?B?VzIyczdwdVh3RitnQS9jdThGZGg4Z2pZQzBTNXEydXRpMC84bXM0RStEQkJy?=
 =?utf-8?B?a2U3QXJXbDI0Ky9zMVdCZnBaOHFjeCtoNExiZjVISitwNlVINEpCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b385e8-5da3-4acb-a012-08deb0fd73fd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:39:35.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V2BWh0egnzOC7rmqSNneewjHCN97dWozhHHZSYgV7msXudWpEwQKt7J+zCC8JFvmgx11tzaaodeyhmYC1Chfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5558
X-purgate-ID: tlsNG-d25034/1778683178-F467CCF5-BE5FA243/0/0
X-purgate-type: clean
X-purgate-size: 300
X-Rspamd-Queue-Id: 0E937535426
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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

On Tue, May 12, 2026 at 05:00:04PM +0200, Jan Beulich wrote:
> There's no need to open-code these. No functional change intended, even if
> the | changes to + in to_bcd().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

