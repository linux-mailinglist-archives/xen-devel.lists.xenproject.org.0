Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM2eCMK1w2litgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:15:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C459322B72
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261860.1554621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LGL-0007Tf-3Y; Wed, 25 Mar 2026 10:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261860.1554621; Wed, 25 Mar 2026 10:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LGL-0007R8-0I; Wed, 25 Mar 2026 10:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1261860;
 Wed, 25 Mar 2026 10:14:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5LGJ-0007QG-Ej
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:14:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5LGI-00FaGp-QW
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:14:54 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3b594-2eae-0a2a0a5409dd-0a2a4509eaaa-24
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:14:54 +0100
Received: from [40.93.196.62]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3b59c-e484-0a2a45090019-285dc43e2eda-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:14:54 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6909.namprd03.prod.outlook.com (2603:10b6:8:44::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 10:14:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:14:49 +0000
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
 b=JOMK5BN+S4SwMYC0vyRnwkD49leYm7tBO/bzq60Q21XrB/3DQw6wpsvaOo/cSJEhZxAmrwcGqQ3yO+cBFOt3zzC0akH1ZuYFZlqnbD/bZKNiTfewxuEFJN9BIpWzdOwJYm18ImgWrKkENg+H7WblytGPuJzTwnxV1PTcb7fBojcl2ssc1HE08nILJtXRfKD0748vRV4LUyZLcJTMHWqSDQ2HqTNASjsB5LcRMFbMDvD/jgB/dA5DnBSxND1I6cbMjkL4uVTfGAxdaD/xt7RI59SF5EUoFrNyJUDUhSVKPI7IVI5nN9IvCF5zfx44I1VELZPwzbDQFlmfLkce0JUeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhvUh8UyYnBfnnVo+URC4sTvpTPH371gNKBOBzKk7mU=;
 b=gnTGUzlH5eaXLQUAq1BDpqHCz50Jfb3xd9JHxBBy7MmBeF+gSvQF15TErhLaPlt2YU3bgkIQOHCLOiI3+jUmUtXHz8hrncFlqwUzA0BKO4cmxIzFce6t58t/tPub9mlsYPCWhhgsDGAwSXH2ivpC1gBn12IycF9o4zioR88ik2wM2KokTupBUo16t++E6gHjH3hHc4z2i+XqVV4eXqHEknC/YB71xJV9KQWfdRFm1t6fJ/oYm6N/kqXxxoYJP+fA+3RsCJAKlA9QqIKcPIjHuk78faQv4gkaRKi14nksxWwZFZEcgC+XVoNZsHSRI5w3UxV75lsp7auNlROKFC08EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhvUh8UyYnBfnnVo+URC4sTvpTPH371gNKBOBzKk7mU=;
 b=VgpBqaSa/aV1VaH8uegAyMH4mAiPiXPpxQ7y2IfEvSoeEe+7yUYfV11Ni5HZ67Omk/yQl7Z76sAPTrhaYln3a4Sot/u6vyMozatNN0VWLvmb+8qKPWP+UAmcLc6zR7lkbSj31ZkuqyEn1MrwwtZOtG28/B1ITD7bz0VbIvAT31o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/mm: do not assign pages to a domain until they are scrubbed
Date: Wed, 25 Mar 2026 11:08:03 +0100
Message-ID: <20260325100803.6640-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325100803.6640-1-roger.pau@citrix.com>
References: <20260325100803.6640-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0021.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: e8080698-eb51-42f7-2c47-08de8a5758c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v6JAgpMuU+DIhAhBk9ItYa4UvjOssWqxGNGAVtwRlgxtAx4K4mOeECUFYXxwRc7MOCSKyfWHmvIkUQWyNxkmEvtolMMtG0eYqg5IcsGgR8MZ598umR4Q7hshXe81EEZh74GwzzdLiXSHuuaUPl+dYsr9bDxvoSYLyzp3HqYfMWXAkFSJkpMauWPE8uOBUJh9arKrkSUJ78wOxlUdSOXesdM9UGA2DtZaicQhWwf+CO639IE262yIH9hYcQMQf7rAdXtIi+b740iOw7Di1xUIaTQMYBiuyhtl9kZIQJS6uwV6ltVSY/dQ/WRyHP1H4tRjNVLujZ4SL2RrTScgb7ZRGT+UDV2NPDuwEe05hZHnXAW6BtaiTeuy6YjbJVleb0QTQHozTRHiHg9V6hPkqABBZYkVqoT7WhlVeR8jgJZnD6IpCjNlUGqyQW21GY76DICbYpr1AkgCHzDj0J49FNCklxRZT+HdNByt1uqdw2WrRLVaQ2vT0jYbcnorTgfCbPrawtNNGdzSx3rUBUaBaW32IazwCHQTqgjNbjumiAej83XArqMF8bqzzLtb/UPcQDX8gRyEHyT8hLP/P827N222HLm9tLiJEpf7du0I4/VyGtxAfvNWcMBzEuduneolLCHCwTvKr95MsLLQ6VitsJ58LbqqyjoEQfj4tzpeh/j06fiz4mjbZmLIxUDXbf7Dmrxuf7k1mY+vag2gaQTRlCzrdUEMXJnr2LT5ERSyjnrvKAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTdLd3VMZEM1OVVjS0xRN3JuYldIVXNvL0RLbWhGb1RMY3BTYjN3NzlnUlc5?=
 =?utf-8?B?dU9XUFphSEdIamh3aHVUOU9YbnhvbHZxSHRlVUt5TmNtVmV2ZUZ4Y3l3d1RG?=
 =?utf-8?B?SnBoWXBvNnp3VyswUWk0akRVMEhBVjdUbkVyOW5nTFNBZGZXT05EN01wNWk1?=
 =?utf-8?B?VHczTzBqMTVEVGFDWFg2a1ovU3lnMGg3Qmd2ZHVkQWN0KzNXSEdsMm9nTVRQ?=
 =?utf-8?B?VmZEbFpCNHM5YnlOMlh0NWcwTE44K1A4VDByV1RnM0Y5ODAzNDVZMk55SEhi?=
 =?utf-8?B?ekZnVVpZVjRtdEtLSVJHVzJUSnp6ak8yVzlKbEJ4NnRqaWtQdDFaY0dCMkFC?=
 =?utf-8?B?TVhqNkQyL01yU0cvVkpBN29mOWxWbWgySnExRVBrRWVJL1FVTEhSUXVVSFBr?=
 =?utf-8?B?SUo5VG1rMHIwTDdpU1ozK2JXbUhKRWdXV2lJWngvMEsyb3ZZM1NVM3Y1T1I5?=
 =?utf-8?B?YjVHbHhkQll5RndrWllOUDNXRkRhUm1oVjA4WmRORXBnREpRa0tnR1hScjM0?=
 =?utf-8?B?Tk52RXVNdUYyVUhuYjN4UEZyTnBuVkhJMis1QitDVFFFZm1RS3hQUi9RZVF1?=
 =?utf-8?B?a3I5MHEvdlE5ZHRHcktZbGMwOE82V2lDd0Zlb2pIQ05vcmw2TThPendYQVhh?=
 =?utf-8?B?WWQ0VVlaOURaQytqNHZLMmhYZlZxaTFjVmpuV21uRmRyZ1FoekZEcFE5MjAv?=
 =?utf-8?B?U3hQUDBsOG5RckI0cU8wYTNCcThjTEtxUDNEUGc2NmFEQURSQXIrZDd2ZDhC?=
 =?utf-8?B?ZEJSY2F4MUpjcEs0aVhWUjBBblBvN083akZEeW8yU0VYd2x0QWRMRjdjZUg5?=
 =?utf-8?B?UlZQMU03VVRncHAwS3ROV2I2MnQwSUZVSVV3a0RJc1llb1RyY0tYVnNPWXA5?=
 =?utf-8?B?R2QrZ2JOUVNVZnhJV3RBV1phcytxRnZMd3VYemYvWlR0Q2Z4d1M1V2pZZS9a?=
 =?utf-8?B?QzJpOGxaaGVKZHhUemloeEZQY2QrQk9ZNDdGQzJJYjVtUyt0dnVlUU0xQVRG?=
 =?utf-8?B?cjlLM1FHd09RRHdxNU9YM284bXgwcUo4SUhGRkkwcHZWY3pDeVozY0VIY29I?=
 =?utf-8?B?OEZHeERmbk5sMitMK2FwV0tCY1h5bDhHY1ZmZ25DbzVoYWdGYmd4S29TTnF2?=
 =?utf-8?B?TVppS1hNSE1JQlh3alNKZlkzVU1oRzJDbTJyNFVrYTVpN1hFZ29makJuV3ZQ?=
 =?utf-8?B?SllWdWZPc0c4NHh5cnZmNVl1eWpuR2wxWWpGMm1pMjA2QnVBaldrazYwclo1?=
 =?utf-8?B?a0dEQXN5RjBzeTU4eXJyeTRnZ0JldG9nbzJ6L3V5R2pvZWd3ZjRKeHl1ZDJY?=
 =?utf-8?B?VGRHYWlvSDZOZENvY2phSDFFSlM5SnBNRy9SWkZrVDI1SE9ya2dTaGJtUEdD?=
 =?utf-8?B?V1BhOCsvblJrQkJvSE1sbXcwcUNhb1NZNDhhQ2JlL3hIbGZkNmtPeWFqeFVS?=
 =?utf-8?B?ZFNGRDhUbFVqdDFrU2ZkdHhxWWpaMS9KMmpyM0dIZlYwaEYrWjI3Y2FxSno1?=
 =?utf-8?B?dVhEeGpVNjN2dVYrK1Z6cGhOek56WlZIelFuZzdmSHhQWEh0VFJGdk9IWktC?=
 =?utf-8?B?Q3RDQmpZMzUvbHNtVFdiTytaQUgxU2QzNlhmdkd1YkdieDJkM0MwWnN6cU1T?=
 =?utf-8?B?VU56ajBQSG83TXVONm1MVXRQdWV1K3gxVG9vaEFkbWh1dHdnZUpEM0pycHNZ?=
 =?utf-8?B?elR5cTBsRksrcGdZdEEwRnFhcVBqRHF5Y0pkby9OSEpvWFhWclBGblZYa29L?=
 =?utf-8?B?b1BUK0VTSi9HMkJlb3Z0WmJBcGFIN0lHa2FOQlhzeEl2WFRSdS9sKzBTTUJL?=
 =?utf-8?B?eGxZdG45UmJFeGpOU1NmRFFmK0d0VWZhMUl2WVR0WklvTG1SOVgvK3cxZklQ?=
 =?utf-8?B?cjJNNlhqbDFTR2taVU1OWXhRYU5yWStpSFBURHQ0TWhFWm9DSVFpaXNmbGFZ?=
 =?utf-8?B?UURrTStadHVYU0ZZRTNpWEZKeU15Znl0NnNLUTUySXFUUG1BYWxXUUllWkZ3?=
 =?utf-8?B?R1ZYZzRjM21WMXhqRlN0RVhDWFRZSXBEWmJzblhYSGtzdGVSczZVNzEzVE0w?=
 =?utf-8?B?ZEZmNzRzalNITVlRYnRKcklEVDU5WkxscVk2N3lxVVFFUHdMWDBIWnZrUUFz?=
 =?utf-8?B?eTNrR1RLZEN5SWdrd0RBNUtlL05SWXFOa29SR3N6TmJBSkhvL2VIb1ZMMFJs?=
 =?utf-8?B?ZDFQNnFtVXNMWC90OVZLZ0hvV0xNcVl0bUg1WGh3U3MzQjBYMzdQM2JtaVhH?=
 =?utf-8?B?c05Hc3BSVzJWWXdQeTZFQXNzTE5KckpRMTVhV20rdVdnTllLN3N5Zi8vVVkv?=
 =?utf-8?B?aDFyZnBoUE9weVZ3MUIrV0cxTXg3WXBMdWNYWk0rbFdXSGJxb2xhZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8080698-eb51-42f7-2c47-08de8a5758c0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:14:49.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vLR2UJ8T3MKiAtehtpzBvkwH6PKrzOYibZFIYbdCaEGhOL8LpFfFkKnGSJntXLwGXm3BJv13OeugOuvg0qFyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6909
X-purgate-ID: tlsNG-bad1c0/1774433694-638A5A73-EABFE20E/0/0
X-purgate-type: clean
X-purgate-size: 3588
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6C459322B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Assigning pages to a domain make them the possible target of hypercalls
like XENMEM_decrease_reservation ahead of such pages being scrubbed in
populate_physmap() when the guest is running in PV mode.  This might allow
pages to be freed ahead of being scrubbed for example, as a stubdomain
already running could target them by guessing their MFNs.  It's also
possible other action could set the page type ahead of scrubbing, which
would be problematic.

Prevent the pages pending scrub from being assigned to the domain, and only
do the assign once the scrubbing has finished.  This has the disadvantage
that the allocated pages will be removed from the free pool, but not yet
accounted towards the domain consumed page quota.  However there can only
be one stashed page in that state, and it's maximum size is bounded by the
memop-max-order option.  This is not too different from the current logic,
where assigning pages to a domain (and thus checking whether such domain
doesn't overflow it's quota) is also done after the memory has been
allocated and removed from the pool of free pages.

Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate allocated pages")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've attempted various different ways to solve this, but they all ended up
being impossible.

 * Prevent non-scrubbed pages from getting extra refcounts (iow: make
   get_page() fail for them).  This seemed nice, but the cleanup using
   put_page_alloc_ref() was impossible as non-scrubbed pages would return
   failure in get_page(), and so I couldn't take the extra reference ahead
   of calling put_page_alloc_ref().
 * Disallow XENMEM_decrease_reservation until the domain has finished
   creation would fix the issue of pages being freed while pending scrub,
   but it's not clear there might be other usages that would be problematic,
   as get_page() on non-scrubbed pages would still return success.
---
 xen/common/memory.c     | 6 ++++++
 xen/common/page_alloc.c | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index f0ff1311881c..1ad4b51c5b02 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
                             goto out;
                         }
                     }
+
+                    if ( assign_page(page, a->extent_order, d, memflags) )
+                    {
+                        free_domheap_pages(page, a->extent_order);
+                        goto out;
+                    }
                 }
 
                 if ( unlikely(a->memflags & MEMF_no_tlbflush) )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1316dfbd15ee..b72a74c705ba 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2699,7 +2699,13 @@ struct page_info *alloc_domheap_pages(
                                   memflags, d)) == NULL)) )
          return NULL;
 
-    if ( d && !(memflags & MEMF_no_owner) )
+    /*
+     * Don't add pages with the PGC_need_scrub bit set to the domain, the
+     * caller must clean the bit and then manually call assign_pages().
+     * Otherwise pages with the PGC_need_scrub would be reachable using
+     * get_page().
+     */
+    if ( d && !(memflags & MEMF_no_owner) && !(memflags & MEMF_keep_scrub) )
     {
         if ( memflags & MEMF_no_refcount )
         {
-- 
2.51.0


