Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RAYRBD9+IGot4QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613E63ACC1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:19:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=UT0EIdRj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327046.1592272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7T-00024J-24; Wed, 03 Jun 2026 19:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327046.1592272; Wed, 03 Jun 2026 19:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUr7S-00021h-T0; Wed, 03 Jun 2026 19:19:14 +0000
Received: by outflank-mailman (input) for mailman id 1327046;
 Wed, 03 Jun 2026 19:19:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUr7Q-0001wN-Pb
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:19:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUr7P-007kOj-Vh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:19:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e29-bab6-0a2a0a5309dd-0a2a450ad478-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:11 +0200
Received: from [52.101.53.18]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207e2e-56b3-0a2a450a0019-346535124934-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:19:11 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7094.namprd03.prod.outlook.com (2603:10b6:a03:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:19:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:19:08 +0000
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
 b=OgPNrW3fh37fRVfqPM9bw1v0ZazMTT8MzgKTJDkdTyxLRLTGOguWovPR0EKbq+AQBor2wFoR39FdS5jYqtGwWCfWPDLJY5SI1sPThRNbNiQsfeMhNs7uhoxgO2+TvhcojmI5lY+TLn1GxdMTwIpskmUViE17pVc0eznBVvxbT3Ii81Xi00dVAmzaxQtN9l8BHqPJb00tFU50NnviXAYoOfBQxEbV2gvEBh5STrv4iRlnutDAhGNK0BpS74LQpdlHrwFIXkkf5dd/BOvjrK/463cqRrxxkX8uwm1MzDemqGsOeDxKkhLkG9G4CayQhyUjxkGFFC8N/wR+D5dSBrrdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuMPM2yNgxJicMCMIIbVUagdOfGTRG/5BFsSd0BCNKg=;
 b=Gkkxr94AHjoDFdlzalVpxss+3kHqonPQ+ZiXMVHchXWxt7/opcqB7XlO46WwZDbHYGq69G6Nk7OMsgRqc6EVlrLaZqCdBrnJXnxSnYXjMV84i/qDGicQng9NksSos9ohSesGr2/KqU0ydTPYf+Nz10Cpu9G9GpfS60y9OHFY7TRyXvMlP6I2ynpP9u2ft0CoP4p1KISEFe/m8Pd+hR5/SmaDK8HrEdzN3kfVOVwEDPGVO9spo8bOI82H5k5kVoDjpCk/4ldw/8VYX2oLP1B31Bj86MV3zTiGroYPqWXQ+6mBTV7bI0i9EjCHbGyGTPItbcg7nMJGx9x8eeLewyyAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuMPM2yNgxJicMCMIIbVUagdOfGTRG/5BFsSd0BCNKg=;
 b=UT0EIdRjOtbuSdGt2KTkkzWc3XFKPq8MFc65EG/oc8BCkFHfCFLiOw5d5nENeP+RYKXdiXNOwEZ6auN9+ED9BzUQIwpp5LKkADAqVq9/ADDrzt8ye7SvXnZkqNnFR0bry/LC8/IZSnUpy7UnLPvjbXOQjaPa5TUnW2nOX4wFFy0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH for-4.22 v2 4/5] tests/numa: add unit tests for NUMA setup logic
Date: Wed,  3 Jun 2026 21:18:35 +0200
Message-ID: <20260603191836.77955-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603191836.77955-1-roger.pau@citrix.com>
References: <20260603191836.77955-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:408:fb::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac1ba9f-26b6-4088-bea2-08dec1a4fc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|18002099003|22082099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	3LQJLQD+lvT7LAfm/F82uXPbRSvmYghscyp12gH7OuijuvH621ApJeRkOtq4ulzAHuJ4Bc3CNa+t6jzZQFvkmYYiln5pYPQD0JwDpUJtouv866xNJpF5XO6PTafI3T8M6JWJZtIij8/ur+Qf1Sq/W8MJLJxqDyXJzfON/HkDYfjposXC2xZOvaYKZmKqGd2anoX1eBDZ9O4NWBX/ZNNHwNpxRFyFb5uAzk1e5idqI+lpGyu2FOYoQDlH8VXRzO6ulPj6EzJypcxeaARLmSd/MazjDh9V4gOYqdBGInROZUN7oII+w52BBP+rf7WrGIxpcD41lYZlPJW+TsIFPsiUhxD01RRUyfJ8nJupp23J6KqsLJSic8BsSspEMfOqTjbj+f7X6aMAntbeUbQV0Ve49pv66upiIqxel/V97tB0OUZ4S+1Qn2WWntTNHbqkoqVJ1OvV21CQxntv61PUz1gCKRUjIMD7FED8Q9Ayisj7XFJzmkEywTojiuUgl8NqmrzrWA7tFiuPcVBSijWqQFm6bIC3xXbSEG9HJCsDfHqC2nbEcRuCVL4cWHDBZai9Ip9sYfClAi6nqOVi6Fprzo12b5/4zrLa+24dk/aENKA3SSPu82HPvANddWe4XnqX3uQ3VodKSEtdPv+/slIPuLDkEECvi3r4fS4+ZTJnC/GrQUIzY68MqrYwkvlEawX81reI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEQvdCtBM3NxWnMzRmNwbTlUR21vVndWOVhoT3VjQ1ZVR2FBK0pONHhUZkhX?=
 =?utf-8?B?WTUyTE1BRU5mUzBUL1BpaDFPNTFSV0RyNkVZeVJwa004TDNTemM0anpHR0Vq?=
 =?utf-8?B?ZjJRVjhpV0RRQXlpR3N4ODhPSTFZMkR1cWFGdTAvMkN2NHMvTWRjdElmZGtS?=
 =?utf-8?B?UUJTU0krWWZCK3FKOEpQUllheFdGQjhQeWt5SUdpRXVpSlZJSFhrc3BYV3p5?=
 =?utf-8?B?cWovdUJKOUtlQ2g4eUwrSVdkQUo0eFUzbjZPRFB5eHp3S2JPM1ljUWJXSndL?=
 =?utf-8?B?N1FzU0I0a3FnamNDZWZKQ0tBa1ZPeUhIenllK1I0RGF2VmczSk1MWmdKb0hT?=
 =?utf-8?B?bVVPV1lCdHFqMlEyclA3WTIxdkdOUk9JaUI5MmJhalMwWnZxN0wzMDFVV21M?=
 =?utf-8?B?UCtWWnNnQ1BQNnZIbUJpaTVSREpNNUQwbjZBRS92RGs4STNkZE5YSXBOVUxm?=
 =?utf-8?B?SU5paE4rVUE2Qm9RQVg5Mi9TTlJDdnNVUVdoMHhXb3lsa2dDUXE5czduQ3Y4?=
 =?utf-8?B?elEyTFNHS0hzNFJpUngxSmQyRXd4bmJoRXhnUkF3dStPc3ZoUi9ER1Q1djlv?=
 =?utf-8?B?MUFEQ3VsdVRVQXVJV29qSUZPY3lFbDc3UlRsSWY2KzRUeWZpaHJNaTcyMnQy?=
 =?utf-8?B?cjcyb2h1eE03THMySjg1VGJJZTZaVGFFT3NxbkJmWE1VL2drSnZIa2V3MENv?=
 =?utf-8?B?WVNPU1ArbkdDcTA2MjNCVmhJbnJMbFU3aURoZjRSZzZyb2pobnN6K3ZuSEl5?=
 =?utf-8?B?UGVZSU9vaThNRGs5alZVWUpIc2NZcU5FaW9iRFQ3SVhTSm9ETGxjSThtUjlY?=
 =?utf-8?B?MEJOK3JZTlM3a3cxWFdpRmxNOG9ieXpvVEYzVEl6Y3lFVisxTHpjd0NJQmFi?=
 =?utf-8?B?M0kvWm9aZ2dsUTI1ZysrelZuK3ZJV0JjQzg3cDZJYmpFa0lpY3FWRkZRZ3lK?=
 =?utf-8?B?dUpaTm1vZXBFZHZrUnFic3FXc3VpR2pOYVhHaDI5TDlGbHEzOEkwWGJ6dVhN?=
 =?utf-8?B?VFhuUEJwT2dJY241Sm95ZVp4V1NucTEyU2xRWCs2MHpCSXNnL1RKVWpZUzdR?=
 =?utf-8?B?U29lT1J4TjQ0MFlBMUNCbVBHeWZkUmcya3hzWWx4Sll4TVc0OVk1U2ZKa3No?=
 =?utf-8?B?NmlwR1U1cFlmRXlrOGhXanNTQUZ3MDYrR3dVQ1BiVHE3RDdPczhNN3hpR0c1?=
 =?utf-8?B?eitGczl6NTJCUW5QeUxFazNDYlNVL2JmQ1NydGtldCtuNmpBSXdhZ1E0Ykp6?=
 =?utf-8?B?NzBmZ2ZIWk1sbzZPdHNlMjIzUkU2WE8yb2IxYjFUM0VKd3B0MHBHKzFKZzBk?=
 =?utf-8?B?NUIwK3FvZGcrTTZBaVR0OFJXSTB3THZIL2NtZGxYYkREaWdKbHRWU3ZURDVj?=
 =?utf-8?B?dXlOSlhhVjhhMEFDUStZdUJSL3cvNTd6ZWljWVNLWm5QMXpXQUh5ckRXd1hn?=
 =?utf-8?B?YmsyR1J2cTY2TTRtbkIvbGV4L0hIaGE5SmhlTmpyMlFzS2pqYmdpN0JNNWwr?=
 =?utf-8?B?KzVPZGNIVFB3QjBhQlByWWtsMnI5YmJLMXJNQWJmUjlzS2ZhQWswdDdZMVlM?=
 =?utf-8?B?NDR0ODZ3V1J5WHdPbVJlNFB4T01aajRiNTZhZjljZE5nSDNnUi9IejBVdTBR?=
 =?utf-8?B?cFM3bmFtcXVMWGFZT2dEeHc5QjNtWjVMV3BJdUdGZWdSbjg1WHNycGgrcTlu?=
 =?utf-8?B?NTM1S0NTdWtoTjdkU3VGWE5OOGxnQ2poTk81ckRvRGdhT000US9EWlV5T0l4?=
 =?utf-8?B?ZDFlSU4wVWpNRjN3YnQwUE50eGgvcTdhb2RKRm42Wm1udGcyYkVFOGcvRWNO?=
 =?utf-8?B?K2VPVHlnYVk3SlRIMHdGaDRmTkVmdGtvbXJOVTd1VHpNYW9XazNPNEJtL0g3?=
 =?utf-8?B?TkQwbTZhUU9OY252eTIvcXV0aWxkaWRUaW55M2h6YWNKc2pyanlVTmMrOS9R?=
 =?utf-8?B?M1V2bUJ3MURsRXFiSnZDQVJlNGlEKzJkVFJ1OTF3cTYvZHVOcU9LY3lGREFP?=
 =?utf-8?B?UzYxVnN6blduTXpVSVF6QXRWTWwvSTJ1WkVFOHpuRTdRTWM1RzVtWWhDcWtE?=
 =?utf-8?B?c2toZ3ZYSVNidG9MVjBsQnJiRW9CejFIb1RHWk00ai9oS2xYNEN6SFNOMjFS?=
 =?utf-8?B?c2t5Mm1hTXNyM2NTRGxOd1dtcFVjdldHL3NKbVpBUzdscXo1UVNVdnNLbU5l?=
 =?utf-8?B?V3VVZzlJM1ByTURselRCYnhrWmQ2RlZzMk9zaFBQTllHVFVzMFVKcktRMVAv?=
 =?utf-8?B?MmVmbDFVY2lVdkpEalh4VzJaSXFMbmIwWU4rc3JxTGhGZkxEbmJhZ1VXdHBp?=
 =?utf-8?B?QkYwcXkvS3JGWk54WlVLdUpBU1lNZ3dpajh2eDNkZ0tMSnl2MGd3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac1ba9f-26b6-4088-bea2-08dec1a4fc16
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:19:08.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0rVSEKBYoBdHELM5d47b/JRg/1qcsAbdSFBOl9+b38VZUlmk7O9N6MjqLtER/dxwqXPgp8Yiow3K22EeY+7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7094
X-purgate-ID: tlsNG-4011c0/1780514351-70F618B7-807E16BB/0/0
X-purgate-type: clean
X-purgate-size: 15063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9613E63ACC1

NUMA setup, like PDX, requires certain amount of logic to configure the
internal structures and parameters for NUMA operation.  Introduce some very
basic testing that allows building and testing NUMA setup logic in as a
user-space unit test.  This allows feeding synthetic memory affinity and
map to the logic, allowing to reproduce bugs that would otherwise need
access to real systems with such a configuration.

For the time being introduce a single test case, based on a known working
NUMA setup for an AMD Turin system.  Also the testing after setup is
currently limited to ensuring the start and end RAM region addresses fall
into a correctly setup memory block.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Remove unneeded !!.
 - Remove redundant parentheses around macro parameters.
---
 tools/tests/Makefile         |   1 +
 tools/tests/numa/.gitignore  |   2 +
 tools/tests/numa/Makefile    |  47 ++++++++
 tools/tests/numa/harness.h   | 184 +++++++++++++++++++++++++++++
 tools/tests/numa/test-numa.c | 222 +++++++++++++++++++++++++++++++++++
 5 files changed, 456 insertions(+)
 create mode 100644 tools/tests/numa/.gitignore
 create mode 100644 tools/tests/numa/Makefile
 create mode 100644 tools/tests/numa/harness.h
 create mode 100644 tools/tests/numa/test-numa.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 6477a4386dda..fc0ed8091510 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS-y :=
 SUBDIRS-y += domid
 SUBDIRS-y += mem-claim
+SUBDIRS-y += numa
 SUBDIRS-y += paging-mempool
 SUBDIRS-y += pdx
 SUBDIRS-y += rangeset
diff --git a/tools/tests/numa/.gitignore b/tools/tests/numa/.gitignore
new file mode 100644
index 000000000000..0710a767f400
--- /dev/null
+++ b/tools/tests/numa/.gitignore
@@ -0,0 +1,2 @@
+/numa.h
+/test-numa
diff --git a/tools/tests/numa/Makefile b/tools/tests/numa/Makefile
new file mode 100644
index 000000000000..5235f9d6297f
--- /dev/null
+++ b/tools/tests/numa/Makefile
@@ -0,0 +1,47 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGETS := test-numa
+
+.PHONY: all
+all: $(TARGETS)
+
+.PHONY: run
+run: $(TARGETS)
+ifeq ($(CC),$(HOSTCC))
+	set -e;             \
+	for test in $? ; do \
+		./$$test ;  \
+	done
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM) numa.h
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
+
+numa.h: $(XEN_ROOT)/xen/include/xen/numa.h
+	sed -e '/^#[[:space:]]*include/d' <$< >$@
+
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += $(CFLAGS_xeninclude)
+
+test-numa: test-numa.c numa.h
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/numa/harness.h b/tools/tests/numa/harness.h
new file mode 100644
index 000000000000..9eec77f31402
--- /dev/null
+++ b/tools/tests/numa/harness.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for NUMA setup.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef _TEST_HARNESS_
+#define _TEST_HARNESS_
+
+#include <assert.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xen-tools/bitops.h>
+#include <xen-tools/common-macros.h>
+
+#define CONFIG_DEBUG
+#define CONFIG_NUMA
+#define CONFIG_NR_NUMA_NODES 64
+#define NR_CPUS 256
+#define MAX_RANGES 128
+#define PADDR_BITS 52
+
+#define __init
+#define __initdata
+#define __ro_after_init
+#define __read_mostly
+
+#define printk printf
+#define XENLOG_INFO ""
+#define XENLOG_DEBUG ""
+#define XENLOG_WARNING ""
+#define KERN_INFO ""
+#define KERN_ERR ""
+#define KERN_WARNING ""
+#define KERN_DEBUG ""
+
+#define PAGE_SHIFT    12
+/* Some libcs define PAGE_SIZE in limits.h. */
+#undef  PAGE_SIZE
+#define PAGE_SIZE     (1L << PAGE_SHIFT)
+#define MAX_ORDER     18 /* 2 * PAGETABLE_ORDER (9) */
+
+#define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
+#define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
+
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+#define mfn_to_pdx(mfn)   (mfn)
+#define paddr_to_pdx(pa)  ((pa) >> PAGE_SHIFT)
+#define mfn_to_maddr(mfn) ((mfn) << PAGE_SHIFT)
+
+#define ASSERT assert
+#define ASSERT_UNREACHABLE() assert(0)
+
+/* For the purposes of the testing assume arch NID == Xen NID. */
+#define numa_node_to_arch_nid(n) (n)
+
+typedef uint64_t paddr_t;
+#define PRIpaddr "016" PRIx64
+
+typedef unsigned long mfn_t;
+typedef uint8_t nodeid_t;
+
+#define __set_bit set_bit
+#define __clear_bit clear_bit
+
+static inline unsigned int find_next_bit(
+    const unsigned long *addr, unsigned int size, unsigned int off)
+{
+    unsigned int i;
+
+    ASSERT(size <= BITS_PER_LONG);
+
+    for ( i = off; i < size; i++ )
+        if ( *addr & (1UL << i) )
+            return i;
+
+    return size;
+}
+
+#define find_first_bit(b, s) find_next_bit(b, s, 0)
+
+/* Minimal cpumask support. */
+typedef struct cpumask{ DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
+
+#define cpumask_clear_cpu(c, m) clear_bit(c, (m)->bits)
+
+/* Define the nodemask helpers used. */
+typedef struct nodemask{ DECLARE_BITMAP(bits, CONFIG_NR_NUMA_NODES); } nodemask_t;
+
+#define node_set(node, dst) set_bit(node, (dst).bits)
+
+#define first_node(n) __first_node(&(n), CONFIG_NR_NUMA_NODES)
+static inline int __first_node(const nodemask_t *srcp, unsigned int s)
+{
+    return min(s, find_next_bit(srcp->bits, s, 0));
+}
+
+#define next_node(n, m) __next_node(n, &(m), CONFIG_NR_NUMA_NODES)
+static inline int __next_node(unsigned int n, const nodemask_t *srcp,
+                              unsigned int s)
+{
+    return min(s, find_next_bit(srcp->bits, s, n + 1));
+}
+
+#define nodes_or(dst, src1, src2) \
+    bitmap_or((dst).bits, (src1).bits, (src2).bits, CONFIG_NR_NUMA_NODES)
+
+static inline bool nodemask_test(unsigned int node, const nodemask_t *dst)
+{
+    return test_bit(node, dst->bits);
+}
+
+#define node_set_online(node)	   set_bit(node, node_online_map.bits)
+
+#define cycle_node(n, src) __cycle_node(n, &(src), MAX_NUMNODES)
+static inline int __cycle_node(int n, const nodemask_t *maskp,
+                               unsigned int nbits)
+{
+    unsigned int nxt = __next_node(n, maskp, nbits);
+
+    if ( nxt == nbits )
+        nxt = __first_node(maskp, nbits);
+
+    return nxt;
+}
+
+#define for_each_node_mask(node, mask)                  \
+    for ( (node) = first_node(mask);                    \
+          (node) < MAX_NUMNODES;                        \
+          (node) = next_node(node, mask) )
+
+/*
+ * Dummy helper to satisfy allocate_cachealigned_memnodemap(), the memory
+ * allocation is instead done in vmap_contig().
+ */
+static inline mfn_t alloc_boot_pages(unsigned long nr, unsigned long align)
+{
+    return 0;
+}
+
+static inline void *vmap_contig(mfn_t mfn, unsigned int nr)
+{
+    assert(!mfn);
+    return calloc(PAGE_SIZE, nr);
+}
+
+static inline void panic(const char *msg)
+{
+    printf("%s\n", msg);
+    abort();
+}
+
+/* Dummy implementations to satisfy the build. */
+static inline bool arch_numa_disabled(void)
+{
+    return false;
+}
+
+static inline void numa_fw_bad(void) { }
+
+static inline bool arch_numa_unavailable(void)
+{
+    return false;
+}
+
+#include "numa.h"
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/numa/test-numa.c b/tools/tests/numa/test-numa.c
new file mode 100644
index 000000000000..bced68d4d7f1
--- /dev/null
+++ b/tools/tests/numa/test-numa.c
@@ -0,0 +1,222 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for NUMA setup.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#include "harness.h"
+
+static paddr_t mem_hotplug;
+unsigned int __read_mostly nr_cpu_ids = NR_CPUS;
+
+#include "../../xen/common/numa.c"
+
+static void numa_reset_state(void)
+{
+    bitmap_clear(processor_nodes_parsed.bits, CONFIG_NR_NUMA_NODES);
+    bitmap_clear(memory_nodes_parsed.bits, CONFIG_NR_NUMA_NODES);
+    bitmap_clear(memblk_hotplug, NR_NODE_MEMBLKS);
+    memset(numa_nodes, 0, sizeof(numa_nodes));
+    memset(node_memblk_range, 0, sizeof(node_memblk_range));
+    memset(memblk_nodeid, 0, sizeof(memblk_nodeid));
+    memset(node_data, 0, sizeof(node_data));
+    memset(node_to_cpumask, 0, sizeof(node_to_cpumask));
+    memset(cpu_to_node, NUMA_NO_NODE, sizeof(cpu_to_node));
+    num_node_memblks = 0;
+    memnode_shift = 0;
+    memnodemapsize = 0;
+    if ( memnodemap != _memnodemap )
+        free(memnodemap);
+    memnodemap = NULL;
+    bitmap_clear(node_online_map.bits, CONFIG_NR_NUMA_NODES);
+    node_set(1, node_online_map);
+}
+
+struct mem_affinity {
+    /* Ranges are defined as [start, end]. */
+    paddr_t start, end;
+    unsigned int nid;
+};
+
+struct mem_range {
+    /* Ranges are defined as [start, end]. */
+    paddr_t start, end;
+};
+
+const static struct mem_range *ram;
+
+int arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= MAX_RANGES || !ram[idx].end )
+        return -ENOENT;
+
+    *start = ram[idx].start;
+    *end = ram[idx].end + 1;
+
+    return 0;
+}
+
+static void print_ranges(const struct mem_affinity *r)
+{
+    unsigned int i;
+
+    printf("Affinity ranges:\n");
+    for ( i = 0; i < MAX_RANGES; i++ )
+    {
+        if ( !r[i].end )
+            break;
+
+        printf(" NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
+               r[i].nid, r[i].start, r[i].end);
+    }
+
+    printf("RAM ranges:\n");
+    for ( i = 0; i < MAX_RANGES; i++ )
+    {
+        if ( !ram[i].end )
+            break;
+
+        printf(" [%" PRIpaddr ", %" PRIpaddr "]\n",
+               ram[i].start, ram[i].end);
+    }
+}
+
+static bool test_paddr(paddr_t addr)
+{
+    mfn_t mfn = PFN_DOWN(addr);
+    unsigned int idx = mfn >> memnode_shift;
+    unsigned int nid;
+
+    if ( idx >= memnodemapsize )
+    {
+        printf("Fail: MFN %lx -> IDX %u outside of memnodemap range\n",
+               mfn, idx);
+        return false;
+    }
+
+    nid = memnodemap[idx];
+    if ( nid >= MAX_NUMNODES )
+    {
+        printf("Fail: MFN %lx -> NID %u >= MAX_NUMNODES (%u)\n",
+               mfn, nid, MAX_NUMNODES);
+        return false;
+    }
+
+    if ( !node_data[nid].node_spanned_pages )
+    {
+        printf("Fail: MFN %lx -> NID %u without spanned pages\n",
+               mfn, nid);
+        return false;
+
+    }
+
+    if ( !node_data[nid].node_spanned_pages )
+    {
+        printf("Fail: MFN %lx -> NID %u without spanned pages\n",
+               mfn, nid);
+        return false;
+
+    }
+
+    if ( !node_data[nid].node_spanned_pages )
+    {
+        printf("Fail: MFN %lx outside NID range [%013lx, %013lx]\n",
+               mfn, node_data[nid].node_start_pfn,
+               node_data[nid].node_start_pfn +
+               node_data[nid].node_spanned_pages - 1);
+        return false;
+    }
+
+    return true;
+}
+
+int main(int argc, char **argv)
+{
+    static const struct {
+        struct mem_affinity affinity[MAX_RANGES];
+        struct mem_range ram[MAX_RANGES];
+    } tests[] = {
+        /* AMD Turin system. */
+        {
+            .affinity = {
+                { .nid = 0, .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
+                { .nid = 0, .start = 0x000000c0000ULL, .end = 0x000afffffffULL },
+                { .nid = 0, .start = 0x00100000000ULL, .end = 0x0c04fffffffULL },
+                { .nid = 1, .start = 0x0c050000000ULL, .end = 0x0fc4fffffffULL },
+                { .nid = 1, .start = 0x10000000000ULL, .end = 0x183ffffffffULL },
+            },
+            .ram = {
+                { .start = 0x00000000000ULL, .end = 0x0000009ffffULL },
+                { .start = 0x00000100000ULL, .end = 0x0007590ffffULL },
+                { .start = 0x000759d1000ULL, .end = 0x00075a0ffffULL },
+                { .start = 0x00076000000ULL, .end = 0x00094c73fffULL },
+                { .start = 0x0009b5ff000ULL, .end = 0x0009fff9fffULL },
+                { .start = 0x0009ffff000ULL, .end = 0x0009fffffffULL },
+                { .start = 0x00100010000ULL, .end = 0x0fc4fffffffULL },
+                { .start = 0x10000000000ULL, .end = 0x183f7ffffffULL },
+                { .start = 0x183f8800000ULL, .end = 0x183faabffffULL },
+            },
+        },
+    };
+    int ret_code = EXIT_SUCCESS;
+
+    /* Dummy firmware interface provider name, use TST for TEST. */
+    numa_fw_nid_name = "TST";
+
+    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
+    {
+        paddr_t min = ~(paddr_t)0, max = 0;
+        unsigned int j;
+
+        numa_reset_state();
+
+        ram = tests[i].ram;
+
+        for ( j = 0;
+              j < ARRAY_SIZE(tests[i].affinity) && tests[i].affinity[j].end;
+              j++ )
+        {
+            const struct mem_affinity *affinity = &tests[i].affinity[j];
+            paddr_t length = affinity->end - affinity->start + 1;
+
+            if ( !numa_update_node_memblks(affinity->nid, affinity->nid,
+                                           affinity->start, length, false) )
+            {
+                printf("Fail to add NID %u [%" PRIpaddr ", %" PRIpaddr "]\n",
+                        affinity->nid, affinity->start, affinity->end);
+                ret_code = EXIT_FAILURE;
+                continue;
+            }
+
+            min = min(min, affinity->start);
+            max = max(max, affinity->end);
+        }
+
+        if ( !numa_process_nodes(min, max + 1) )
+        {
+                printf("Unable to process nodes\n");
+                print_ranges(tests[i].affinity);
+                ret_code = EXIT_FAILURE;
+                continue;
+        }
+
+        for ( j = 0;
+              j < ARRAY_SIZE(tests[i].ram) && tests[i].ram[j].end;
+              j++ )
+            if ( !test_paddr(tests[i].ram[j].start) ||
+                 !test_paddr(tests[i].ram[j].end) )
+                ret_code = EXIT_FAILURE;
+    }
+
+    return ret_code;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.53.0


