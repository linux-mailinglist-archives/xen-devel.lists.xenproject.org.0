Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K6UIMW1w2litgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:15:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F701322B81
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261859.1554612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LGF-0007En-Rf; Wed, 25 Mar 2026 10:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261859.1554612; Wed, 25 Mar 2026 10:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LGF-0007C3-Ob; Wed, 25 Mar 2026 10:14:51 +0000
Received: by outflank-mailman (input) for mailman id 1261859;
 Wed, 25 Mar 2026 10:14:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5LGE-00077S-5z
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:14:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5LGD-009Md1-Hw
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:14:49 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3b598-5cb7-0a2a0a5109dd-0a2a4506b42c-6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:14:49 +0100
Received: from [52.101.56.18]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3b596-3034-0a2a45060019-3465381247db-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:14:48 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6909.namprd03.prod.outlook.com (2603:10b6:8:44::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 10:14:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:14:45 +0000
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
 b=QaFV3PKRxOkTSwq6Cg7GvCGBAyFbn5ChnZGyhH1VFqoODWZWa8gtS+Y/1OWbRFgAKUAhqhHUVp1afYC63IzPUPI3r7m9Bcc4xACFbecvtsvUyHrZHKt4l64xjOMXLM9jZ1JOklKuesnfAT+5EWh3b3ijdPpmqWbKIbY9FIi/8G+NEvHGJYQG1JrequqzTrDQZGXPp6dy9RkMH2zlCT90yvIlglT7fkBX9M0H4VCoGqvoQ+lfOTQMnM2wiF9ARkiCqr3+bret5oWZd2mDOyzFbNchWUl1+vDyAiRelqTo8zLN18QaJXMHlt8PPO27XIhwN/GCaxUpN2rxW4qrGfsPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjvhhxyU4hEONnorl8Vk2zeEBhj4jDACdC0hApD8M4M=;
 b=j5776z7D6fJiao2nv9KUdB8xelQvLxmtVYzAyJwjKlu7pjJhUjtge0piuq9uwENo7G3U+vMtbjnCzizkMhf9BHnfWA6Xm341f+CmjftF2uLYNAynAQIjAqt67j8XVwYO49lAUiSoUT89YonXOGwiQbvbz1j+gh2YAHZ3yWNWvoExogZcE2rtx7KQOynd2ghY5eOwovzKsynEj/50htD4WTwefl/VVg2QmN9KAFH7lO3/i45CIPGcUbCQoSZJXklnB0ufMQNfk/x5P9DRzwoDQe4QF4h/sKFoh2nAgceCbeaWKu9B1AD4x36Zvxs1cbPzJiRq/1SZ7P2a49RCaQ55Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjvhhxyU4hEONnorl8Vk2zeEBhj4jDACdC0hApD8M4M=;
 b=cPaFDUHG9MjT6VJBEud7orRA6Uh7DSks66KPlfkEL4G4W572LrkAE45DKW+LkiaZeJsUJsFNCvzYPkVfwyWxot9jIh8vTu5XlnYqrA0ll2Zk4DnJiSMs4S3/9Rkwv3KTHZX1x6shVcrf2fJMBpoEalKfpaXmtfAZAbvfGU76Eo8=
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Ayden Bottos <aydenbottos12@gmail.com>
Subject: [PATCH 1/2] xen/mm: don't unconditionally clear PGC_need_scrub in alloc_heap_pages()
Date: Wed, 25 Mar 2026 11:08:02 +0100
Message-ID: <20260325100803.6640-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325100803.6640-1-roger.pau@citrix.com>
References: <20260325100803.6640-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: be4cced3-0406-43f1-7d25-08de8a5756b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iVGHhCd87QH5RkXlmNOr1hu925CKbMbUpil1Gu+Zd+lNDBRCs9eWbbyxpq2NbnWlqf6J/YTJ2qPvjCulGi9O41iyl7h35ao+iE0pAat10EYB1bavhakjxmC3VGmch0cyVaONjBgVIZ4HuQgJsK9ZvzDtX9WWRVooOah0WiSphYBjDgLObZst1m4d0qFMcI3iOYEf2kwz+1Cvn5J3xDr6iS3L4Cr+Jx/4SZhkNKFwGomaKe+E1QeatzVOuVHLwTqsvoM2FBPfjwZs/dXI5L9jFAio2F8275M7edM9eGS9FvaNtOvKFBrOzfSk7Dlt+pe1FpSvNxeADWiw9UB8mzGxldFNwcjLtBm024dR6ESRbJK7i0knbps4BzUGoRWQskvO4VYLdOFwYUxWYxkX0MBiINEoBA8wYsnODiinYxErc/ja4GUsHcBeJY19QxhdnFQ0zZj0T76aohRshTfp14E02a+h62bzuL/E4sfe72EbTW+wWUmxL/K6vvNuLAWv3mzMW3LY8TCCnIO94PtmIswQLICIaYsNmC/SJ81je3CC97O1sVtBTOql1+6JJBwbdEJq3f3yeoaeP+Ye39mrIo5rnnbP3KNS1wQEdOhsYZ8Eu1n8WnFyEse4/z6Ld4BCm9SFfd7M3uF1MQOp6LHwVIjUfxWQwrKXGYdpFC3jGGHkFwocWhSSf4ssuOx2B4HFsSu0jfUF3r/oX/3mSRxaIUihffYnf87PRGrCwxi8ToH9sfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm8zcmxxdE5sVS93M2pkSXBDRzZsWER2TW0vRmJvS3RJK0JlUE9XSmExQlcx?=
 =?utf-8?B?cm1QSEFHSDNYYUpKVzA1alBrRnEzbVpDZUEwM1AraUFvVHFPTWhsOGQydGU0?=
 =?utf-8?B?YXhsMDg5aWNucnBpMWc3UWtoL3RORmd5ZlQ1UExqbnpVM2UxRGl2UFVtZXVs?=
 =?utf-8?B?cUtoWnh6VUlXc0FzaXpJTE0vSEFLS0s4b0JLSmhySm1FaXA2dG1CaXpFWFRG?=
 =?utf-8?B?c0xKekRrOGhkUWNSRmNxT0dmZEJzR0NRYTFwT2FzOFVtUEJEVEVCQVQ1a3Fo?=
 =?utf-8?B?K2JUTXQ0dE5wai9YTXAzY3NReFkreUpXelpBdlExMDhRVERkR3hSZjhpbCtO?=
 =?utf-8?B?dkpOVE8wY3ZxcUxoMUtlZFJ1TmpHZEV6OG5NY1J5em15Qit3OXlZZm5pQzd5?=
 =?utf-8?B?eGs0c1gwa0xiaFBkU2N2dkF6ZGdVcG53NTZsOXlDSWJ5c0p2SDFlOVl4Z01x?=
 =?utf-8?B?bWthc3VOdU9vdWtTNENZS1FFaWRseUxFMUxFUHdMQVRJVWtXVmRYM3JXN09n?=
 =?utf-8?B?OG1UVVRmUkJZVGE0c3QzWTdGcmVhcEFRL3JFSWZVMFR4RS92bjBzVzMwcWha?=
 =?utf-8?B?TjZnbE5jWlRPV09pa0h4WjhDVUZSdm5EMFdNYWx0UUFBL1lPNDI1Rmx4YnZl?=
 =?utf-8?B?LzdJVzZxcDk4Sm41b3VvbDNhUWRNbzk4SkhiRllNdXdTekxuYXphTVBpS1U3?=
 =?utf-8?B?cFVVblFNQzVERjd0QVE2VHpwRGF4RUVIQWJRSHhKS25raWx4QkhpZ0h1am5M?=
 =?utf-8?B?OS9FWlBwRDM1ZUtwTzYxZ3BVcDFoejEreG12MTlBdHQ5ZUExYmd3dUcxRllm?=
 =?utf-8?B?bG1oMlFMejM1NWxDLzEzTFBxT2JxSzlIOHBxcGc1K2FmQVNwT1Q0K1dwenI0?=
 =?utf-8?B?bFJGSFBLRkdXdVRIUWdoRkZRS2VrcEt5VjcwYjUwWDNERzViMzdRMDRzZy9Y?=
 =?utf-8?B?a2ppMVdqcklDbmIvQkEvclhwajNVOXRjMnl5Y1NYNjBEQi9IOXJBWWN6eFZZ?=
 =?utf-8?B?VlNCVWhTdEJPR3k0OWJLQWFrZzFqUnc5ZVppc3JQekNyWXhBdnJibnhDUGdL?=
 =?utf-8?B?MS8zUkkvZXA5cUptbDlPM3kxNlIzdk5sRE05bnkyU0Q0aU5NLzV4c2JCSEFl?=
 =?utf-8?B?WEZrWnVCRWl3bCtzemJBRnVaYW5YamxMNWtyVXBQQmJ4WmJFNkRJdzhVRzVS?=
 =?utf-8?B?SnNpV0Q3eUgzdTJjdmV1M1l1OGhtTk1NY282TVFhSWxaV001ZklUN3dueUZ6?=
 =?utf-8?B?bG5OUjFDbFRQcnk5MnNrVkVpWDQxaUlaMWFSRHhUZjRFSXZLWit4djh3SVNF?=
 =?utf-8?B?c3FkSXNNNUFlaDlXa2w3L1pzbk11MnlsSlFDRW1iRlhQTzR5bVhxMXBIVGxN?=
 =?utf-8?B?anUydGljWW1sK2dhelJ5dkd3Nkp0VzBtaDhINEpsR2N1ZWVkMlNsQktITkVH?=
 =?utf-8?B?b0Ric2FDMG1mQzRHWDBhZzdlUjUxcmFScGJiNlhQYUJrRmExQ0tVdHRERUpI?=
 =?utf-8?B?L1RqanpTcWQ1QzRzY2orQ1FjelhYWXVhd1lDcmxZWEluWFRxWnpHTWM5ODM0?=
 =?utf-8?B?STdMWUtEUks1cVlSTzNVUVB1VUFETE0wZUVVMmFvRkJndU8xTzk0TmZsY09a?=
 =?utf-8?B?WDNWdGQ1cmlKaytleXA2Zk9MYkdoZUp5aVRPajMreHFSazdPUGlaakFzbjFC?=
 =?utf-8?B?T2JPb2xiRHp4UHRYOVlTbXREb3k1ME96bnBGVWcrbzJ2YTd2OUd3RnY5QmRs?=
 =?utf-8?B?YXFYTVdTZHhBWVU1WHp5dTJPZVRZd0lmS0NGUE9rcmJHZnlXZ2JuUytuRHZS?=
 =?utf-8?B?bnZzT2hJY1lYaWJyeHpyb0NVUXNuNzYvS0N5bHdHbENWUWhtVE1qV0tIb2NQ?=
 =?utf-8?B?bkc1WldhWFVXanhWS3BiWFlhVEQ4bGx5Si9DZ3hHY0JPU2FEaHJjNk0vRVFo?=
 =?utf-8?B?YktzejBkT25ucWU2dWcwSXNwQk00VDh1ZUxpQ3F5ZjVhUjNlaDFvN1VZaXc3?=
 =?utf-8?B?NEVQVlk4OFVFczlodkM4dW5Ib2o2YWxxSEhGMjdmb3h2Q3hvMUl3eHdrZmt5?=
 =?utf-8?B?UWlFRTJCRE1SSTBuOEZCZ0VnOWZ1OEMxeVpsZGpWNEplTUluSEoyZU5sRHdE?=
 =?utf-8?B?Yjk5Z0wxTlNrL0lGaGtEM05NRDM2ekNnYkg3Z2ZwMkkxYzJyU0ZpZGZpWnlJ?=
 =?utf-8?B?S2JZTkJ6cXJXVGVGcVVaTm5YYnlrUjM5eVBaWTdEb21iZDBMcmRtL1RXNnFS?=
 =?utf-8?B?MmJpb2c2WmcraEhvcnpIQTV0ZFlZRkplRjNUM1FRdWFPRDl1dTVZME5HZ3pa?=
 =?utf-8?B?WjRSYUc0aWxkSUtvSHI0UUc1aVVWMHdTbFFwNmdtYmxwWVNRQWdFUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4cced3-0406-43f1-7d25-08de8a5756b7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:14:45.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JphPsZor5u3LHerGmxn0AQU9oFnJRLHk3btoM5w+Oo0DOj1LQCCwDGipQcl9RmDi/9B7Uopc942TZ8nnFZcwmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6909
X-purgate-ID: tlsNG-16d1c6/1774433688-83B9E1C2-A195B7EA/0/0
X-purgate-type: clean
X-purgate-size: 4934
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:aydenbottos12@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F701322B81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

alloc_heap_pages() will unconditionally clear PGC_need_scrub, even when
MEMF_no_scrub is requested.  This is kind of expected as otherwise some
callers will assert on seeing non-expected flags set on the count_info
field.

Introduce a new MEMF bit to signal to alloc_heap_pages() that non-scrubbed
pages should keep the PGC_need_scrub bit set. This fixes returning dirty
pages from alloc_domheap_pages() without the PGC_need_scrub bit set for
populate_physmap() to consume.

With the above change alloc_domheap_pages() needs an adjustment to cope
with allocated pages possibly having the PGC_need_scrub set.

Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate allocated pages")
Reported-by: Ayden Bottos <aydenbottos12@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This issue was initially reported to the Xen Security Team, and it did turn
out to not require an XSA only because the code hasn't been part of any
release, otherwise an XSA would have been issued.

The Security Team would like to thanks Ayden for the prompt report.

In the scrubbing loop in alloc_heap_pages() i should better be unsigned
long.
---
 xen/common/memory.c     |  3 ++-
 xen/common/page_alloc.c | 31 ++++++++++++++++++++++---------
 xen/include/xen/mm.h    |  2 ++
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 918510f287a0..f0ff1311881c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -345,7 +345,8 @@ static void populate_physmap(struct memop_args *a)
                 unsigned int scrub_start = 0;
                 unsigned int memflags =
                     a->memflags | (d->creation_finished ? 0
-                                                        : MEMF_no_scrub);
+                                                        : (MEMF_no_scrub |
+                                                           MEMF_keep_scrub));
                 nodeid_t node =
                     (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
                                                     : NUMA_NO_NODE;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 588b5b99cbc7..1316dfbd15ee 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -989,6 +989,8 @@ static struct page_info *alloc_heap_pages(
     ASSERT(zone_lo <= zone_hi);
     ASSERT(zone_hi < NR_ZONES);
 
+    ASSERT(!(memflags & MEMF_keep_scrub) || (memflags & MEMF_no_scrub));
+
     if ( unlikely(order > MAX_ORDER) )
         return NULL;
 
@@ -1110,17 +1112,26 @@ static struct page_info *alloc_heap_pages(
     {
         bool cold = d && d != current->domain;
 
-        for ( i = 0; i < (1U << order); i++ )
+        if ( !(memflags & MEMF_no_scrub) )
         {
-            if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
+            for ( i = 0; i < (1U << order); i++ )
             {
-                if ( !(memflags & MEMF_no_scrub) )
+                if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
+                {
                     scrub_one_page(&pg[i], cold);
-
-                dirty_cnt++;
+                    dirty_cnt++;
+                }
+                else
+                    check_one_page(&pg[i]);
             }
-            else if ( !(memflags & MEMF_no_scrub) )
-                check_one_page(&pg[i]);
+        }
+        else
+        {
+            for ( i = 0; i < (1U << order); i++ )
+                if ( (memflags & MEMF_keep_scrub)
+                     ? test_bit(_PGC_need_scrub, &pg[i].count_info)
+                     : test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
+                    dirty_cnt++;
         }
 
         if ( dirty_cnt )
@@ -2696,8 +2707,10 @@ struct page_info *alloc_domheap_pages(
 
             for ( i = 0; i < (1UL << order); i++ )
             {
-                ASSERT(!pg[i].count_info);
-                pg[i].count_info = PGC_extra;
+                ASSERT(!(pg[i].count_info &
+                         ~((memflags & MEMF_keep_scrub) ? PGC_need_scrub
+                                                        : 0UL)));
+                pg[i].count_info |= PGC_extra;
             }
         }
         if ( assign_page(pg, order, d, memflags) )
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d80bfba6d393..0639fc0d21fb 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -208,6 +208,8 @@ struct npfec {
 #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
 #define _MEMF_populate_on_demand 1
 #define  MEMF_populate_on_demand (1U<<_MEMF_populate_on_demand)
+#define _MEMF_keep_scrub  2
+#define  MEMF_keep_scrub  (1U<<_MEMF_keep_scrub)
 #define _MEMF_no_dma      3
 #define  MEMF_no_dma      (1U<<_MEMF_no_dma)
 #define _MEMF_exact_node  4
-- 
2.51.0


