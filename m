Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NtgHXTA62ngQwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 21:11:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FA462B37
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 21:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293935.1571304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGLvK-0003xF-C7; Fri, 24 Apr 2026 19:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293935.1571304; Fri, 24 Apr 2026 19:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGLvK-0003uD-9Q; Fri, 24 Apr 2026 19:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1293935;
 Fri, 24 Apr 2026 19:10:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGLvI-0003u7-J4
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 19:10:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGLvH-008TAe-Tx
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 21:10:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ebbfea-bab6-0a2a0a5309dd-0a2a450aa670-48
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 21:10:43 +0200
Received: from [40.107.209.26]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ebc032-56b3-0a2a450a0019-286bd11a48d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 21:10:43 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6398.namprd03.prod.outlook.com (2603:10b6:510:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 19:10:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 19:10:39 +0000
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
 b=Ci35T+UdhwI9TL/2W+iEKAbBPKSZYmrbuytTnyOVP0tqjeNYc6ADy6UMe00N5xsESm4sTPRKBjrsqnHFu2A6TPHaBUbPw7hEo3CXJy7FskrK9KmFOIeLUXiTwsDK37ccrzedD8kAefWxt4JCp9vJJMYupFMZeDv22SvwKnmj66RIrn1+MSJS/bWeB24CnodzEtkRy9TKzB4Hd6MkjABFZaMQf2hL9UrzkdFGL5Nnju4ZhFTYmzST0NN652NPDoY4JBc7Zeb+xoNur9atOgCn7DX+TO3IKPJE2KLK6hDPJ+REUHOyVnJMop7xW1cjE7BtJ0kUTnz6AIz7uetzBrmsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf/2186CT9cFTU175djuOybmZ7gyNCUYkuHbNec9JrE=;
 b=b2pKhRoVfQetl8qOl42UIM0dtQHreFWQ9lzOR8qbycsvyIw1gUkxijbkGn4JR4TbAdMXyNaY7ND9PY/MikzTAqXaq4Tk/3uqO2h95NyeQvwNqyJYeWfTN3vvIqTuhF6w8NJ9x5idkAm8wISftTdX/eNsyETuW4mb7hDZGqcTg4toVx/1NfrmGrOi5CSvWKiYE6K+DlOSJQebkfGmvS76FUNtTBujkcEar2uzQT3Ps2e/pL7W1njCo/Nu9Gbi2CD4A1O12ean2dWQxJnhB2kLmoQ4y9UM70/PTmb7ktyeQyF81oLkhxldo/lzVzGBabDj/zg8u1sAIg0/hWRCLy3Hsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf/2186CT9cFTU175djuOybmZ7gyNCUYkuHbNec9JrE=;
 b=zp71OEuLg1eCO08ODqHlk/QnKbRzrE8XibmsC/ag7XYLS/l1+aptqiq/1BhEyWNdAsKls9/353/9ZBypn1FU363WEIrB7J0xaZSbT3p5m9zQrvwD6Tu4oMJRt9MNilS75j4m5Zx3PmPqe39qWwdaRvmufwCdRimZpDx8nuP8g40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 21:10:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/9] x86/mwait-idle: Add cmdline option to adjust
 C-states table
Message-ID: <aevALCPvNRlRf91N@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <addfdc9f-7f03-4b84-b998-1fdbef2edc78@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <addfdc9f-7f03-4b84-b998-1fdbef2edc78@suse.com>
X-ClientProxiedBy: MA3P292CA0033.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c7752b-9770-4872-724b-08dea2352c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sAujNAkNJ8k5GDbEp8kglGDXTEzjPTf48+8OEz/74BCIkoZwYmGeoWJZpLGtVK4W3hes46w+B6NZwmkKvxDaaIkjRgnAQ6AgAReIt0IwfuMYMxxvB4mpEwLZEPB2hXZjhRfX9zs0xzyuDPi8zP1L404bcAH2Boag6Q1bETq8ZGfTR9L9VtAK/oh7+rgP0bzGD0sNYVxB7kY9zswhWMm2R6rE1yabf3YblCVlRfr/k5Gx0uuy4uOghHyA3tSjEmeW85YSe3LGcqfm4EGBazx2AlDZbGSkp4HF/ZPPhpD0rXgoFz2oqHul/hWtf1QiilPfNQ1AdOc+IL5lAkJrhmKPWHelg/O2bqEoGXlRC4F+enaJJH75jz/ORm9dyY9HX1hWHU+Ch/ZXqbr78SrR9w6oBJrPiHjrixSmRH4XDPZyz0pcLC0kQya9uRAZK6FVZuVAJhGrvzuoRqWljVfR7Vuvf+m6L7Uzwz/v1wVRU+qkMn2JxZtfeumvGj1E5n1EbK7wv7oWL2FoouZWr+2kaj0eA20kGxHjH2Km0vsr/6Z8DRIHLa/IBFro1YhZwFW2uCLRhN50PS8czSaYLeUZAucIAe0X2iqvo/WfGLamg/bBjbCDC8VfDW2YsjXBDa7YINLnzCE9Wux0hYB98EElSCa8ELjFpewLZPrUcKZjJDZqHY9LON39oj4ETtI5dQSODKp3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmFPV0ZTaGNlemJ4NzZHeUdmQUUxSGorbXEzN2JEb09TNXJDa2lYcThjbHFM?=
 =?utf-8?B?c05QcUN0M2xBUmE4VTFRTURkMkZwUjYreVA0WFBzaHRHekdJREcxd1hjM0NS?=
 =?utf-8?B?N01QVmFBZDVDSGtQUDY3Wmx0NTN1YUR2emJZWVlDQm1kaXVHKzVGUDZsZHEr?=
 =?utf-8?B?MXRhVjZPR0I2QnBUclhjdzhzcGh3c3prd3VrUlY1OUUzNkp1MUlrL0NPOWlS?=
 =?utf-8?B?TWV0OXMyb2NwUmg2Y1dUSGVTRGlhMUtUN2JjT2JkemZKUXlJYmVxVlJXemsx?=
 =?utf-8?B?UE14UkxDVkk1SVIvdndCU0E0dzF0R3hTK0dBdzQyeWZDKzVqaUFxUmtuUTA1?=
 =?utf-8?B?NlI3VzhGelBWaEVwaDk3SndtTmd5UTBGZVFibjVuTWN0KzVxdUJUU2FueUwy?=
 =?utf-8?B?eGE3Slg5WFV4eWZ1WHBsOUc5VUVHaDBRWVVOaFN3QVZWUkpKRHNrQmh3MjZu?=
 =?utf-8?B?UWhlakxDY1V4SkdiTFJ2SVRmcUFjckhWZis1Q1RZamRkWU5mNGZqdEhrTEln?=
 =?utf-8?B?L3gzTWlHSVg0Zjd5L0RHY0xjdTV4aUFiOXpOdnRvakZRUjVvVm1BL29tUXc3?=
 =?utf-8?B?TkVoN0cyU2oxais0Q1RKQm4rZyt0L0Rtd3MzVXhQWHB6cG03ZWd6bnZ4ZlNQ?=
 =?utf-8?B?ZGZFZ0Erdmg5Uk9EQnNBdHJMYmtYT3IzRk9Dd3NxbzJkWFB5MFVKT0grUzNK?=
 =?utf-8?B?UEtqZGJqa3FmMk41dHpsYnJCOTdDQnR0VytGdFpxRXkwQ0lWVTNpZWg4Nys0?=
 =?utf-8?B?ZXpmU282Q1VTVFlPMjdKLzd3Q1RpVDVTWlhNRkZ2NUtqY2s0bVo4N0lwNnNJ?=
 =?utf-8?B?RHdySnA4WHcwYmgxTStMeElTSS8yaVJya3FGR29udmZhcURjQ0pPa1dhV3o2?=
 =?utf-8?B?d200bEw2KzhEQWo0cDFFZWtTTTJZTC9QdzlkbDR5QVFleVNxbmE2ekFWb0VE?=
 =?utf-8?B?SEZTSmh1c3NLTTk4cEVOanhQWWc5WmY3SGpJL3E1L1hSMVZRMUdwVE5lYlhF?=
 =?utf-8?B?TU1wNDZSdHY3bXFkcjk1VkJ1VjlRcHcxMDhhbk1DL25YbmZOYXFBTWdyZk9E?=
 =?utf-8?B?SnZkM1ViRDFkV00wZStCbkRWSzhYN1hqZXZreWtPd2hwcmpWN2xhR24weTFq?=
 =?utf-8?B?bHBMRGRtaVltSGRJVGFaWTB0VDdvU3VFQ21tZEdQYTJ0dFNPSlBOWE5XVGdM?=
 =?utf-8?B?R1IyczVMUzV3c1lhU2ZjRFBNQVE2UlZFR3pZNmEvdFR5L3padTNrZmUxSkYy?=
 =?utf-8?B?U2tISXYrell6MTJQYm9BSHhkYmdUdVZaSUhtNlc3UmpHN2VtM2FoMStnRGdH?=
 =?utf-8?B?Q0E0RWt6dkpNN21NS0dodGhyV0phOHlQZklHaURNK1JlcnY1QXVUTFNKbEsx?=
 =?utf-8?B?N3NxVzU5ZkkzRXFWMU9jeFJwSSt4bE1ZMWNHeXhuaVZTZ1hpckFBTy9pNmt1?=
 =?utf-8?B?VnRkQS9YYmtjR2Y4RS80bEJHSnVUaTBwdWc5YjFCc3c1YjFuZDNvYlc2S3hN?=
 =?utf-8?B?ZHVqWW1GNTBPRGRZa29kMkRjbkhxUTlPOFpSSnJTRklaRnNTYzZVZ2wyLzF0?=
 =?utf-8?B?c2puL3BCaFhJc3NYck5rcjNKZFFqV2FnWjlQSU5MeitxRkdMdnI5ZEQ1RXlW?=
 =?utf-8?B?QjZ5eHFIck9STkZtNjV2eWsvUlFQNDBxOXJUZThOclNFTXdGbnpuVUNuLzlT?=
 =?utf-8?B?TnprMk5QSjRwWXBVamJLMExhQWlTNXVhZmFrOEtHL2ZUN01acUpWclZqVWdo?=
 =?utf-8?B?YlF3bnh1eVcvR2hiRVdWcFpPZnNXaGZQdk9uOEVoakw3SjhCSDY1OGNlSmht?=
 =?utf-8?B?VUoyeVIwa0hkbjRFZmlGRCtwbDFBcG1yR0pEbkRCUThkc3RGZCtGRGNqemdl?=
 =?utf-8?B?QVhnMWFMR0VBTnpCY0VodE5ySVNyN0dOVUpBdC9KeGRaNFlZZk1VbUJISnRy?=
 =?utf-8?B?RzJvTWpjZGc3NDd0VFRlcUFMM3pXNHNoV2hsMWQzeS9Hdzc0dFA3YmRlL05i?=
 =?utf-8?B?MzhyQjNTV1ZMdUEyTDBBSFBpdG1oWEF0NlIvUTI3emF3cEtVQUxWY1k2aHJ6?=
 =?utf-8?B?RUtrTHFPN1NVMkMwTjJUZDA4ZUVyK3NsMk1qd3hQM0s5Nmh1YVI5L2lMaHI5?=
 =?utf-8?B?SVVienNMVnlLYkNYQ2o0eWpMK1BObEJvU1ptVVNxNHQ5KzZwMWhkaUlaMUJE?=
 =?utf-8?B?T3VNczNsNHhTZUUzQXl6eHhWemFhS1ZYN3I4OXZhZFBkSExBZkhPdUFmZm5w?=
 =?utf-8?B?T3Z3YWQ2TnBVeGdqM2hodjlHKzh2L1loRmNBQS9xYXdXMlBzRnFzbDhUaFg0?=
 =?utf-8?B?d1dZTjZGelJNalI2RGFXU0hZZ0FWb0hYNk1TNGVLQnRsalB2MVBBdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c7752b-9770-4872-724b-08dea2352c78
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 19:10:39.8389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LgJBipN5LBcZEQhcF2zCpT9AbfcKBI2tz04J6HLHUes3NdfJpcNRlE0gzpMlAxb4K4va9QlkNxNj3O6PGIDQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6398
X-purgate-ID: tlsNG-4011c0/1777057843-465748B7-2E38CB78/0/0
X-purgate-type: clean
X-purgate-size: 9261
X-Rspamd-Queue-Id: B78FA462B37
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:57:53PM +0100, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add a new module parameter that allows adjusting the C-states table used by
> the driver.
> 
> Currently, the C-states table is hardcoded in the driver based on the CPU
> model. The goal is to have good enough defaults for most users.
> 
> However, C-state characteristics, such as exit latency and residency, can
> vary between different variants of the same CPU model and BIOS settings.
> Moreover, different platform usage models and user preferences may benefit
> from different C-state target_residency values.
> 
> Provide a way for users to adjust the C-states table via a module parameter
> "table". The general format is:
> "state1:latency1:target_residency1,state2:latency2:target_residency2,..."
> 
> In other words, represent each C-state by its name, exit latency (in
> microseconds), and target residency (in microseconds), separated by colons.
> Separate multiple C-states by commas.
> 
> For example, suppose a CPU has 3 C-states with the following
> characteristics:
>   C1:  exit_latency=1, target_residency=2
>   C1E: exit_latency=10, target_residency=10
>   C6:  exit_latency=100, target_residency=500
> 
> Users can specify a custom C-states table as follows:
> 
> 1. intel_idle.table="C1:2:2,C1E:5:20,C6:150:600"
>    Result: C1:  exit_latency=2, target_residency=2
>            C1E: exit_latency=5, target_residency=20
>            C6:  exit_latency=150, target_residency=600
> 2. intel_idle.table="C6::400"
>    Result: C1:  exit_latency=1, target_residency=2 (unchanged)
>            C1E: exit_latency=10, target_residency=10 (unchanged)
>            C6:  exit_latency=100, target_residency=400
>                 (only target_residency changed)
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Link: https://patch.msgid.link/20251216080402.156988-3-dedekind1@gmail.com
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 111f77a23348
> 
> Add __init to get_cmdline_field(). Put cmdline_table_str[] in .init.data.
> Other adjustments to fit our env.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> For the initial attempt, I've left the new option as a standalone one. It
> may be worth integrating with "mwait-idle", but I think much of the
> parsing would then want doing differently. It'll then likely be much
> harder to apply future Linux changes there.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1928,6 +1928,23 @@ Print boot time MTRR state.
>  Use the MWAIT idle driver (with model specific C-state knowledge) instead
>  of the ACPI based one.
>  
> +### mwait-idle.table (x86)

The .table suffix is kind of weird, as we don't use it elsewhere.  It
might feel more natural given the naming of the existing command line
options to use mwait-idle-table?

> +> `= <string>`
> +
> + Define the C-states table from a user input string. Expected format is
> + 'name:latency:residency', where:
> + - name: The C-state name.
> + - latency: The C-state exit latency in us.
> + - residency: The C-state target residency in us.
> +
> + Multiple C-states can be defined by separating them with commas:
> + 'name1:latency1:residency1,name2:latency2:residency2'
> +
> + Example: intel_idle.table=C1:1:1,C1E:5:10,C6:100:600

s/intel_idle/mwait-idle/ in the line above.

> +
> + To leave latency or residency unchanged, use an empty field, for example:
> + 'C1:1:1,C1E::10' - leaves C1E latency unchanged.
> +
>  ### nmi (x86)
>  > `= ignore | dom0 | fatal`
>  
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -70,6 +70,11 @@
>  static __initdata bool opt_mwait_idle = true;
>  boolean_param("mwait-idle", opt_mwait_idle);
>  
> +/* The maximum allowed length for the 'table' module parameter  */
> +#define MAX_CMDLINE_TABLE_LEN 256
> +static char cmdline_table_str[MAX_CMDLINE_TABLE_LEN] __initdata;
> +string_param("mwait-idle.table", cmdline_table_str);
> +
>  static unsigned int mwait_substates;
>  
>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
> @@ -122,6 +127,9 @@ struct cpuidle_state {
>   */
>  #define CPUIDLE_FLAG_IBRS		0x20000
>  
> +/* C-states data from the 'mwait-idle.table' cmdline parameter */
> +static struct cpuidle_state cmdline_states[ACPI_PROCESSOR_MAX_POWER] __initdata;
> +
>  /*
>   * MWAIT takes an 8-bit "hint" in EAX "suggesting"
>   * the C-state (top nibble) and sub-state (bottom nibble)
> @@ -1546,6 +1554,161 @@ static void __init mwait_idle_state_tabl
>  	}
>  }
>  
> + /**
> +  * get_cmdline_field - Get the current field from a cmdline string.
> +  * @args: The cmdline string to get the current field from.
> +  * @field: Pointer to the current field upon return.
> +  * @sep: The fields separator character.
> +  *
> +  * Examples:
> +  *   Input: args="C1:1:1,C1E:2:10", sep=':'
> +  *   Output: field="C1", return "1:1,C1E:2:10"
> +  *   Input: args="C1:1:1,C1E:2:10", sep=','
> +  *   Output: field="C1:1:1", return "C1E:2:10"
> +  *   Ipnut: args="::", sep=':'
> +  *   Output: field="", return ":"
> +  *
> +  * Return: The continuation of the cmdline string after the field or NULL.
> +  */
> +static char *__init get_cmdline_field(char *args, char **field, char sep)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; args[i] && !isspace(args[i]); i++) {
> +		if (args[i] == sep)
> +			break;
> +	}
> +
> +	*field = args;
> +
> +	if (args[i] != sep)
> +		return NULL;
> +
> +	args[i] = '\0';
> +	return args + i + 1;
> +}
> +
> +/**
> + * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
> + *
> + * Adjust the C-states table with data from the 'mwait-idle.table' parameter
> + * (if specified).
> + */
> +static void __init cmdline_table_adjust(void)
> +{
> +	char *args = cmdline_table_str;
> +	struct cpuidle_state *state;
> +	unsigned int i, state_count;
> +
> +	if (args[0] == '\0')
> +		/* The 'mwait-idle.table' module parameter was not specified */
> +		return;
> +
> +	/* Create a copy of the C-states table */
> +	for (i = 0;
> +	     i < ARRAY_SIZE(cmdline_states) && icpu.state_table[i].name[0];
> +	     i++)
> +		cmdline_states[i] = icpu.state_table[i];
> +
> +	state_count = i;
> +
> +	/*
> +	 * Adjust the C-states table copy with data from the 'mwait-idle.table'
> +	 * module parameter.
> +	 */
> +	while (args) {
> +		char *fields, *name, *val;
> +
> +		/*
> +		 * Get the next C-state definition, which is expected to be
> +		 * '<name>:<latency_us>:<target_residency_us>'. Treat "empty"
> +		 * fields as unchanged. For example,
> +		 * '<name>::<target_residency_us>' leaves the latency unchanged.
> +		 */
> +		args = get_cmdline_field(args, &fields, ',');
> +
> +		/* name */
> +		fields = get_cmdline_field(fields, &name, ':');
> +		if (!fields)
> +			goto error;
> +
> +		/* Find the C-state by its name */
> +		state = NULL;
> +		for (i = 0; i < state_count; i++) {
> +			if (!strcmp(name, cmdline_states[i].name)) {
> +				state = &cmdline_states[i];
> +				break;
> +			}
> +		}
> +
> +		if (!state) {
> +			printk(XENLOG_ERR PREFIX "C-state '%s' was not found\n",
> +			       name);
> +			continue;
> +		}
> +
> +		/* Latency */
> +		fields = get_cmdline_field(fields, &val, ':');
> +		if (!fields)
> +			goto error;
> +
> +		if (*val) {
> +			const char *end;
> +			unsigned long n = simple_strtoul(val, &end, 0);
> +
> +			state->exit_latency = n;
> +			if (*end || state->exit_latency != n)
> +				goto error;
> +		}
> +
> +		/* Target residency */
> +		fields = get_cmdline_field(fields, &val, ':');
> +
> +		if (*val) {
> +			const char *end;
> +			unsigned long n = simple_strtoul(val, &end, 0);
> +
> +			state->target_residency = n;
> +			if (*end || state->target_residency != n)
> +				goto error;
> +		}
> +
> +		/*
> +		 * Allow for 3 more fields, but ignore them. Helps to make
> +		 * possible future extensions of the cmdline format backward
> +		 * compatible.
> +		 */
> +		for (i = 0; fields && i < 3; i++) {
> +			fields = get_cmdline_field(fields, &val, ':');
> +			if (!fields)
> +				break;
> +		}

This seems a bit arbitrary for my taste.  I would rather ignore the
extra fields (and print a message about it), and proceed with the next
state.

> +
> +		if (fields) {
> +			printk(XENLOG_ERR PREFIX
> +			       "Too many fields for C-state '%s'\n",
> +			       state->name);
> +			goto error;
> +		}
> +
> +		printk(XENLOG_INFO PREFIX
> +		       "C-state from cmdline: name=%s, latency=%u, residency=%u\n",
> +		       state->name, state->exit_latency, state->target_residency);
> +	}
> +
> +	/* Copy the adjusted C-states table back */
> +	for (i = 0; i < state_count; i++)
> +		icpu.state_table[i] = cmdline_states[i];
> +
> +	printk(XENLOG_INFO PREFIX
> +	       "Adjusted C-states with data from 'mwait-idle.table'\n");
> +	return;
> +
> + error:
> +	printk(PREFIX

XENLOG_ERR maybe?

Thanks, Roger.

