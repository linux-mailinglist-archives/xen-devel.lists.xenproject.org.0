Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM6lCFFJymkQ7QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 11:58:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE3358B74
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 11:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267367.1556881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w79NP-0004o9-No; Mon, 30 Mar 2026 09:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267367.1556881; Mon, 30 Mar 2026 09:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w79NP-0004lj-Kg; Mon, 30 Mar 2026 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1267367;
 Mon, 30 Mar 2026 09:57:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w79NO-0004ld-EN
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:57:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w79NM-007YUL-GL
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:57:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca4907-2eae-0a2a0a5409dd-0a2a450a8194-48
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 11:57:40 +0200
Received: from [40.107.200.46]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca4912-1772-0a2a450a0019-286bc82efab2-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 11:57:40 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:57:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:57:36 +0000
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
 b=yvEtOwVBUlZu7A119Soj8xvd7Mf5lEy85A/vYife9dN96oZcmMk2R+pygR1B4HbQRi8NEdVd6GYlDZQGCKffKDbGFWhg1A4zP/cWMAz2AXz5xCbfJzjIjtBOVtiXOWFMXmC80ErA+4vrhWGh9doz+RcFhv88PfkVEYhLNtt5oviMIInnvd54cX2G5/0e2gDyfKzJWPY5sOJZHNKZX0AMPw+9ogjrlhtCJONBmkr42BGw/hnzKQh7XBBj5+FquhiijYdldP6+rUwVVFZAeJuLgJbgg2fgOoHW0WN/ZMoOnnaqUOdeuGfMB4/1deRr6qcxYv7mJxVo3yCcNqGXu1PNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/spZ7bUzzZXh1IwnaF8NBSOaFQlR5NAV/f+qjpJJuU=;
 b=J8hqWXHerI1qVUHMqO1h07TVlIInPxA7lXXcNCgrrboQFrgi9fyyRMfr7e5N5X3+4rOk7mNPbgFP/MavVr7om4cfhxkbko9zKIjIemQqT1leDrdWIaIsda6XXnrWdjgR62BzB1nEQQUil2cB0lH0cQNzLXy0qp4PB4uMv4EF6LirsVVxPv0qolO+MF+z+YO8m5oFZCWCTm7fkA5pd4aeBHPnNaHLp3YkL1/Hehg81nGRlMf8tchPYSDfH0n9Hk/F5H5o5aftcaUN3w7JyOm6gGKT/LEifjVvDkq9nYHtufeGjkBTdfsMxhGpRr0HxoMhRC4r55h1E1dvXpuNG24SFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/spZ7bUzzZXh1IwnaF8NBSOaFQlR5NAV/f+qjpJJuU=;
 b=Sil3mGmQA+QrVIGKIJ4gQPrCniQeKd99QFGGFYqZX4G8MTjWtnREMW1TjPKTYWQvyuZGGe7WnfN+W8o+fugvru2ABDoEOYUAoLRJmywMZuSRIEwwYl/Pi299l46ofuhz5edekYQo0V2neOuoyd/DSfjpyJr5/1p6BQ3aNNUdpsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 30 Mar 2026 11:57:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] xen/uart: be more careful with changes to the PCI
 command register
Message-ID: <acpJDODr4hXTqDxz@macbook.local>
References: <20260327135420.7246-1-roger.pau@citrix.com>
 <20260327135420.7246-3-roger.pau@citrix.com>
 <93a09dbb-0a8c-4eeb-b544-c9409b9f85ce@suse.com>
 <aco8-8hc5xJCZeal@macbook.local>
 <ad18bddf-9cc5-469c-8b8e-d5cf39840660@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad18bddf-9cc5-469c-8b8e-d5cf39840660@suse.com>
X-ClientProxiedBy: MR1P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::26) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ad50f9-c2fa-4190-5543-08de8e42c52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZM6HKsDoF+FuvBEGajT5oB+bB86ri6+KtjAHTg7bOj8tugVSl8g22Kp05CSxJ9ko8wxXm5EbkAUlfqwMFOa8+WYQiwR03vQUYvOkpeJIAdAvse7WD5XS4nqfDB76ZqKGYLrojcDPsadCdzyUN+rmiAlktIQ7jUESFMCnPBYgyNyKv0sVV1Srwznf2ZcRpd2/w94IIf8SPspT9QO9fGWFlNas2HMO80aYpEY2apa0oipBZ25R0QBCW9g9kmZsuQPMYHNzJLNueurrY24bJ9Ra7bi79HYzhtDZApzbHc6JKWmo9vECbh9ZdjS11r1Nzd0OpGJtve6uL9RJ8VD5N+1Aujtz352cDXjwBavIW5roEVsBBQnUDfkxrAVbEW0DX3Kha+RwD9+ZgKV+Bj524G3ApbL5i4iKfIT8eBWXoJb2tzlcc09cuUXRT+8tjao05DB3uJ2/gRcDUh9g/A39ayoR57n56SLvZricoalzXkoK+7sEKQOWw8l3EHq93dvgd+ukUWjGscyczMpGrTLwRISBkmjTL5oXx8Qnua7ykvkV5aWk8Q3CDu0CBAkpYI4178jazDN2j+Bv81ZT8gj8obLpHlN2yp8H6bnh5R8F1/jNoIUHyYPAEiTNq2nEqR+QD7R/2Ezu1EKCC1rIJEK/K3tN8Vg41Nwlsm+4rlQys3ltWu0K532MiTHwfD1XGjcxehcBDWDFy6m9wdGq7vjYAO1tzE7q27Uy+uHivG1EnaXjwZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEtoV25FVWNXbFFBZXNrUGZBWEEzeVhpd29HSnlLS1FBSlhqcG40ZDhqdGVm?=
 =?utf-8?B?aXBybE5KR0RaYXg4YWQvaEFGTWJWN2hHSDAzbjlHV1VMWm9KQzc0Qk5tY3pM?=
 =?utf-8?B?L0c1cEFSNDVtcFBWMzlsRm1UeURCZ1RDSWVVdVZKYURPUVZmRnFwblRKbnlK?=
 =?utf-8?B?VlY1VnFNWXNzWjJ5TnAvL1ZIdnZZNEpZNWJMcDBDSTRrU1E2VElwUDVGSFRr?=
 =?utf-8?B?ZmEyQzQzQ24rMFBiMUFQOXZHS1VFR282QUtQZzhjRlRoLzdPN0ZTZjRpYzZn?=
 =?utf-8?B?aXRpRVR3eDYyeFl2ZCtlSFZqRVFCN2h6ZHh2czRNRnVEOTdUTlRjd0FwdVdK?=
 =?utf-8?B?ajc4NlJqT0ZmMitqZ1BtRkZGY3FCTldqcmhzV3B5aUl1bEFIc29udTFBNVhr?=
 =?utf-8?B?QXFEZm5NcG5GRG1YbkRISG1WdGRGOU9ld3BQWERwcjVTRnF4Sk5sdDJKVWo4?=
 =?utf-8?B?d3YydWFkY1dVdG9Lb1NZOXE4aE84RjRtYlB4MS9ncW55aWlyV3M3blcvTGF2?=
 =?utf-8?B?WEV2VE0vdEEwejZTbHRDMk9pRzVVZFhLQUJvU3FOa0N6ZmJHNlZMQzV4eEVY?=
 =?utf-8?B?UFhpR2R0YldQV0pUN08wVUlvQW9DOWU2TWFkMmgrZ2JNYWxnYkdnNE1RNHdX?=
 =?utf-8?B?QW02VjlMeXF3a3JBcFVmZjY3VkhjK2l3bUtjUVh0aUY4a0RzcExXWUNUb1ZQ?=
 =?utf-8?B?YW8wZnJJaEhBNDYrNzdRbmovbExYeGlnSVJNVitlQTlqbzRCYmFXVTFUa0pJ?=
 =?utf-8?B?d3g3UjlQTWtzNlF3UEhpZmpDMTg3QVlkV0k5aEtycHFCL1Awb3dYdC9IU1Fs?=
 =?utf-8?B?WUI0MjJIMGNDdThxSUI0NTFJS2NweFQwVktkMzJPRkM3amhEZFdnZFRWNUox?=
 =?utf-8?B?eGxXdVZTYW1DWmtVVVBJWk1pZm4vejVGRFNvWXNlYjhEZUlWMjZ5NFJGa3l3?=
 =?utf-8?B?eXZqZmVlR2J4em5JS1lJZHNHS0lTalZTRUNDbXhEREJ1aS9DdkEzeE1YMndz?=
 =?utf-8?B?NUJ6TEx6QkRaWVRlV0ZhRHh3S016eFZjeWNlM2tIQkV2TEJHU1B1K29mSUd6?=
 =?utf-8?B?d09hUVBvN2JBbzU1V1dOZklPSWgzOEk0eGRVWis2Qk1RakhpMWVZM1lmMUxj?=
 =?utf-8?B?M3ZkZ1RaRDBVR3JYbHFzNmpHOVJEQWJVTXM5V1NzY3ZUVFpZK1QzR3lmMkZG?=
 =?utf-8?B?dHdqTHBhUkQ2QUJjaWdGM0JxTVJBUUw3NnlUOHhFZmhISXlhdm1kSGg0THZv?=
 =?utf-8?B?T2F2L2hqZTgrT1lGSWcwYkdlTyt6N05YMm1YaGdHSVdmL3FOUlVFd0RHRkhr?=
 =?utf-8?B?c0RBWUo0a0NoVWFHUmthZFFraDZuUjFYbGNSK0wvWlBBRW8yUDJGQ1c4Tmwz?=
 =?utf-8?B?UEdsZXpsN0h1YkxPc0pEWUpjZzA2UGdoYnNkRENoR1BUOXZDenJ2WUJpVzdy?=
 =?utf-8?B?Kzljb0Y5RmRXT212OGE0SGhOVHg1UG1WN0h1MXJTT2xORmtoUGtRdUVsU2FT?=
 =?utf-8?B?YURYS3R0enJyWUVqWlhKb2lON2dpVUJycldkY2JNcTk4dUhMZXRjQTFrVUg3?=
 =?utf-8?B?dGZXNzQ1Z29NU2s1Q29MaGhNMW0wOVhrY1k1b2xydUJXWXg3bStMY2ZVOHlE?=
 =?utf-8?B?Q1VUU081Y0tjM2R1YjkrQzl1SlNpYnM1TmlXUTdXOG1iRlBRZmVaTFA0Q2M3?=
 =?utf-8?B?MGZhTWw2eFY0WVpJZ3cybTk4cUk0MmM3YkhFVzNDK3BJNzBmMlRUa0JYRGtC?=
 =?utf-8?B?dUp4SGVyYVAwKzJFMncyQXZpTVRFaUp4U091VjZJZE5NSmVmeWVqUDBmWTZw?=
 =?utf-8?B?ZnRSKzYwQVhlajBQVFVXUWtnUURYVUc0SkpOMENLdUtZUTMyaWNnWE9KUnYz?=
 =?utf-8?B?YitBcm1PR0NUSmRGMUpOUGV3VWdNdUZKUFcxeWJmWlF3UEUzeVc0bnFrMDEw?=
 =?utf-8?B?R3E2V29rdmg5ejlsK25SeGl4Wk9QSHE3b1dXWW9PS2d6SWJ1TWZxaEc5cUFS?=
 =?utf-8?B?bVNCN1Bxd3lTTS9SZjFyT1pOMGhnR0RyRHlMUjVxWlBxclh6d2U3TVkrblhM?=
 =?utf-8?B?QWZQakZpWXFBVlFKcVZEY0V6NmVQTVQvSWUzaTUvdER6cGlRVTQ3NnhQaUFa?=
 =?utf-8?B?Q2V5R0lwWkpoaEdWdTVHVTdPR3Q3YW0xK0hjeXhDb1cyTFBTQnRJbnczQksx?=
 =?utf-8?B?Q0xoRDEzdmNIT0FRcU5PdUN5RFc4S284cndtdDRpcy8zSXhVb043WEVMSXpW?=
 =?utf-8?B?dmhGSzVTV0dOWTJzeHFFNW51TkJjZ0tnOGpWbWliYVI5a25sQmpFR3RHVkw5?=
 =?utf-8?B?SDlKRk8wdVV2Y1FzMkhSMEFkNThHR0lRRmtzQitqb0Vkcm9pRHhiUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ad50f9-c2fa-4190-5543-08de8e42c52b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:57:36.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDsOHn8XwYY915HP3G5rMOShITxgo8EcwvxRhB5I8DMYKZc2W26KUQqjptAZkde+SbOoxI3C49LZu/0L811aoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760
X-purgate-ID: tlsNG-4011c0/1774864660-BFC9C900-41A61AA8/0/0
X-purgate-type: clean
X-purgate-size: 2142
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 73AE3358B74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:09:10AM +0200, Jan Beulich wrote:
> On 30.03.2026 11:06, Roger Pau Monné wrote:
> > On Mon, Mar 30, 2026 at 10:00:05AM +0200, Jan Beulich wrote:
> >> On 27.03.2026 14:54, Roger Pau Monne wrote:
> >>> Read the existing PCI command register and only add the required bits to
> >>> it, as to avoid clearing bits that might be possibly set by the firmware
> >>> already, which might put the device into a non-working state.
> >>>
> >>> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> I would have preferred if the description mentioned the particular case,
> >> turning this more into a workaround than an apparent bugfix. 
> > 
> > It turns out that the console does seem to work fine, even with memory
> > decoding disabled on the device (as expected).  I've updated the
> > firmware in the meantime, so I'm unsure whether that update has
> > changed the behavior of the device, or it simply was some other
> > instability that was causing the issue in the past.  This SOL AMT
> > device is not reliable at all I'm afraid.
> > 
> >> As mentioned,
> >> us driving the device generally means we're free to do whatever we want to
> >> the command register, as long as resulting device state is consistent
> >> overall (or else we may indeed have a non-working device). Having to keep
> >> memory decoding enabled in order for I/O ports to function is pretty
> >> clearly a bug in the device, and hence us "violating" that requirement
> >> isn't really o bug of ours.
> > 
> > I think given the fragility of some of those SOL devices it's best to
> > limit the number of bits Xen changes, as to having a bigger chances of
> > getting output working.
> 
> That's okay(ish); I merely would wish the patch description was less
> suggesting that Xen was actually buggy.

What about if I change the title to:

xen/uart: avoid clearing PCI command register bits set by the firmware

I think that's clearer and less blameful?

Thanks, Roger.

