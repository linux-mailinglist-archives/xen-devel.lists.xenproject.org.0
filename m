Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uYEgD6zxQ2rUlwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:41:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876216E68D3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:41:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BgsWuSNy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349234.1607110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webWC-0000aW-ST; Tue, 30 Jun 2026 16:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349234.1607110; Tue, 30 Jun 2026 16:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1webWC-0000Xl-PJ; Tue, 30 Jun 2026 16:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1349234;
 Tue, 30 Jun 2026 16:41:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1webWB-0000Xf-JP
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:41:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1webWA-000gRn-Ec
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:41:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f18c-2eae-0a2a0a5409dd-0a2a4505e1f6-20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:41:02 +0200
Received: from [40.93.201.46]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a43f19c-3cb2-0a2a45050019-285dc92e0698-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:41:01 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BN8PR03MB5092.namprd03.prod.outlook.com (2603:10b6:408:da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 16:40:59 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 16:40:59 +0000
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
 b=WPrN3rorW6dAbWxw/kix4bb3mNuq2OmzGIIslGjZOHefapT7mTsp4HSRR/Oi+nYXKuP7JtVdMPnbl9wWZddTGNxcYbOnDVSco+62GY5Ma5Y28IuYelrMvVzfcrutAnJD0pS2w6lbIQxmyYDJBeLH9H9j1UCr6UAas6KUZVWzZgRATSV3c5KbTx/tLRjVd/eoROh0ChtypvJFDdBl7k6zU/R8a28fLNTELyMialpD1TENmBUdQ5ykvpTh55Ge2iwNNbInsaCvZqDJPWROvlIGrszoMUuTkOdnFgWPHzGTqUgyIO/nPqwhlqyQ+C+d3l11GJdTrjRnpANcfKValDo5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLe7SoXUfGXNFFOz4lrEMUH8f8se6stj4zkdtoZivM8=;
 b=c4xWax1qUgHI6W7Du3qJKKkJWoxheL37pj+qVjgN7B1q5VXshPRgg4nSV0rTFMv97ANrYvQfGQOxSbwcsNp2fWQgfjiAffRKt6PLQM12BJJwa8NYjt+M/49PSO5ZOA9w76OqoYS37k3Ji5i6XqW/zJUt3r68NZVfcLUF32L7wKf///gWBIhJjl69DE/r7RXx9D45RLvYSdzEznu5o1L193vEGLfPd74wihWy0OIIX2NsHGslXBB9K5lEozJMIkOkRtDwNMDfUYa7mLvNsUir6MIiLaV6kl8oqyOEG+pknSO6Aev51U09KJTSJzsauABSt/ac7uOUSVxV3aaEpc5VNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLe7SoXUfGXNFFOz4lrEMUH8f8se6stj4zkdtoZivM8=;
 b=BgsWuSNyRPCKk9Zu9ERmNS/pH8JNeVSRzCcLIBBsl8yXyj3HAsYIWtJf4T/yaG1RTIRIacHXAqCxr3PO67l7ne4NCdcNPNqVDLRjA9xAV1uuxx8rWZVHQ1bxQlIl0E7z81B0YaymqhDxPAm3djzb8CVFEEXZUV30CPejOUs/fGg=
Message-ID: <66e293a9-0384-4028-913d-90f2f3d1874c@citrix.com>
Date: Tue, 30 Jun 2026 17:40:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 02/16] libs/guest: Reduce number of I/O vectors in
 write_batch
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-3-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260619130501.272832-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BN8PR03MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: b81cc471-6d08-4f8b-7e3c-08ded6c65d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	O9lXFBUCDp4L3EMqIjh3QDVlJ/dYy5NO51KQgZXaOrlRdY0ccUpTE2NKe22LM21/tDaBm/XvSxd5OZ4SQwS1V0ZqSGZ7PayViWzVO4SUiBYM5Yx0u9p2lFu+kUEsgxFSxajeIvNQ5mml/oJoX4HYPbjemFNUqRZjtYVgi01NqTpHUSB77axn6leQnRuMv9mAgDumpitPoE/1PcWQSN6vhIRwQu14sWy0SP+E31/92Ll/d9jLHXaXkg54qDZrW+wIpDCBLs1CihHenBr1XvsN9b5nxvaVMh4oIt44I/javSoMlEs2rjNpb9qzO0gCE/aBEZYSpC1MsRp+xY7VDee/MViClfo/p+HK7/s9y+TDEW7Q4q6MsSQ09Akl/Snzg9ZWIhaB4qVM41W5RhtaNPCReIasx5DTgs9RZPaKM1slxyuGlNXg/xhZPa7nmIlNjMZHCRTsbVW/jmN0cHyKq120kEG9aG0wnc+B5PLY98++WzuTJzi0DMnUsJfzf5TaPOHf2Yuj1eNR364uwMZoGxj7JNpccYCgIHomdZqTmgecc+jMnJmPNLOVx5wXx+LQUMb4UKCs0DA/gV1MIKsZHfio+CzpILUU29DweRUsnM7MfhgezaxUY88XLsMtDgiIYqqno5JOmvQVCrTDo3boOS/CjACn/AZpKQOF1rmD7mSa9wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmY5dG5VRDFhRXNiUUNlL2lsWUp5N0M3K0VNRDV6UWNKTkZwNGFzZTlha05a?=
 =?utf-8?B?cXFQQzljZ21mNVFLdlFWOVJuVEZmS3BUS29NaXZTYlVlK1I0SEFRcU1Eamsx?=
 =?utf-8?B?azVVZnBQdjM1OVBxRVdNVnJ3eTMyWEwzUnJMSkNxRU9EZWM4L1dKdnh0TXd5?=
 =?utf-8?B?UzNhYzJONmRBblBxeWZDN2FIL2YvWTE2NjE4MTZ5dnhiSzhDNkU5WXB5RTZC?=
 =?utf-8?B?bEdyR3VnbjhlYkZxbWdkRnRKSHRDU0ZtRXZPbHFIUDBoVE5BZGpVa2N5SW1p?=
 =?utf-8?B?UGZESlNxdjduWnlTYWYzeHRPZkhGQWVoMElEY1drb1pSRkFXQmVOckpQaXNs?=
 =?utf-8?B?ZUQzcVF5NU1HOENnZHo3a2gvV0N3cldaeFFQMVJQZkZJVVR3YVlZdXpHSVpS?=
 =?utf-8?B?b0JIak94SGhSTlQ5MmMvRWVDTnl1WjQ0WklITFk0Y0YwUE1TNlhZekNmRVI2?=
 =?utf-8?B?WVVLaW5OMEJlOW5QK1k2VkRJcW9talRIeHpybnZFSEhNU1BjOHpVNTJDYXZZ?=
 =?utf-8?B?amlEeE1NR01TbzdkdUdyTjFLZ1VhM2FmOEsyaldJSk5wVlQyOCt0V2c1bVBn?=
 =?utf-8?B?bW04RjVJSGxkSkxyWWR4UjRhbDAwdlZ0RnBSb3J2M24xZHpMcFd1YWpmMU5w?=
 =?utf-8?B?VkdUcXQxbGN1V1NIOGs4Skc0cGxkc3NhQStSeEdNNDhQekZPRmlNTjZWWkxW?=
 =?utf-8?B?N1B3MUVoblJDOU84RG95TFFZbTJuMW5zdGUwRUpnRmE3TE5EalN3NUlURDRQ?=
 =?utf-8?B?NmJ0ZlJtRnlmT0JUczZwY2QrUzc4cDkybXJ3WFFXWjAwVDh5MDJXZmtNT3Br?=
 =?utf-8?B?Rmp0UXo5aFFEbmN4dGdTQWxZekVTQWVwT1k4TDJlelZzWjhSb0txQUxLUzY1?=
 =?utf-8?B?bUQrQ05CS0ZMNmNFSEpqRWpEK3NGWTBHYlh4L281aTVGeTVWUFhRQmxjSTVN?=
 =?utf-8?B?a0ZQTDUwWXJBOUlpR0NRVnJ1c2kyMi9Vb2lNV0d2YlRRVmlRSys5dkdXeExJ?=
 =?utf-8?B?TFEyVTZ2WmlTZVpLMDV4ejVOb2VuUk1KKzVoODF1MG53akpPalU4OGY4amdL?=
 =?utf-8?B?UmtRU0NNWk16ZUZxaVoxWHdIaWZ0UlVWZGJhN2tNbnFOVGNGL2tEcDZoUWNG?=
 =?utf-8?B?Q2ZxdVB6YkhiMEpGOHdFbHZ5TEJ4M0t4TE5NSDFuRHFIU2ZPNTV3QTREck9U?=
 =?utf-8?B?elhmNHdkL1RYL0lZOU5nNUFwWHYxMnBwM3Y4L1d1b2lNSmVjL3RBa2pXQXY2?=
 =?utf-8?B?c3BzUWxXc2diZDUrUUFNRnBCa0t4WnBZa3M4ZGJIWjB2OWRFZXdqSHFFQ2My?=
 =?utf-8?B?YVQvOFRubWpOaUY0cjBlcTZReHpLNjJmR1IwR0doN0V1bmtlTjhIVkdacG5H?=
 =?utf-8?B?bDBHNXFubEw0Z2JNWFZ1Y3UzektkOGtwbk04V0toZGcyTnMwbnNRNXJobTJ0?=
 =?utf-8?B?elJJK2VGWEpobnVmRjAxc0xmOVowUGlWNXJxbXBYcUhXYnBGejRQbDZDUjhJ?=
 =?utf-8?B?ZW9ESTd2eG5KN2hrNjdNYVMzTE5zZCtrTlpQdndDNDZoQmovSXFVVm9ZSlA1?=
 =?utf-8?B?L3ExR0xCZVpMOWNRZ29XdFppN3dYTGJiL2laT2wwWWY5VTdFaUdYaXFjVzlR?=
 =?utf-8?B?ODUxWU52a29iblY2azRqSnUwOU5BdFFPMXdFODlGR1JnSG9TUXVxVUppd3p5?=
 =?utf-8?B?bEZNQjlxWUo2MmVFczZRc3N5K3dya09Fd0VYSCtKU2RyZUVoOHVsOUljR3hu?=
 =?utf-8?B?VXNNMHhMUkw4eEdES2dWUlpBUjFsTW5EVzlvTEhUTXRncG02MUZ1ZTNhYXJX?=
 =?utf-8?B?RXZFdGYveXVVSDFtTC85K2xyVUpueXQzYzdmOTJmR1BzZm96T1dkZ2Q2c1Zi?=
 =?utf-8?B?a2lvQ1RzK0ptbHZVN2NsMWFubzJKMVdlTTVXTkNsdkRRMkpSRGUrbGJQa0c3?=
 =?utf-8?B?RHp2TVlhRjhYSHNpVmVVN1pIQ1dlTCswblJUbUtmcWlVUXFEM0VaZGx1MW4w?=
 =?utf-8?B?MklnVHhsZ1pSY0xXYnpHUjRobFd2YWwwbG8rNDlZTlRzMkRxYmVIR2x2bVpB?=
 =?utf-8?B?YlFjdnRrSGNYWWZzOEc5WVBDSFV6ZHY3enUvRys2RGpLdHlxZzc5N0pPdGVG?=
 =?utf-8?B?ZGJ4NVFQcjRoOENQTzEwMm9Jam4wNm5vMFdONnVVNWpkLzBqYWVMWTFuQ1ky?=
 =?utf-8?B?MHlxbFBsbnRCb2MxL0pYM0VndTdwYjRiNXljTEdSMEVnRXU0dDRuOGVCbDM3?=
 =?utf-8?B?S3ZDY3pwSm53Y3VoU04weWxLYm5EdjNPRkNQMWduZmNvNG9IWWRNS2h6ZFFX?=
 =?utf-8?B?eWQ5NVB4akVEY1p5Q2wxZGhMVURxT0J0aXJqMitKUFBmY241bi9mUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81cc471-6d08-4f8b-7e3c-08ded6c65d34
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:40:58.9415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfYJO8uS84EQzkquIIvcsGvczJcO+bimxhclQda6GqY9tdY8xfXMLhEDnb6hSZkTQ3kVYws5pVfEsEL9NzUjPIxYjC+pQ9u/uhG9y7E3k4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5092
X-purgate-ID: tlsNG-c201ff/1782837662-16F172B8-49783659/0/0
X-purgate-type: clean
X-purgate-size: 816
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 876216E68D3

On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index fdbceab52e..68ce1aeb98 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -97,9 +97,11 @@ static int write_batch(struct xc_sr_context *ctx)
>      void *page, *orig_page;
>      uint64_t *rec_pfns = NULL;
>      struct iovec *iov = NULL; int iovcnt = 0;
> -    struct xc_sr_rec_page_data_header hdr = { 0 };
> -    struct xc_sr_record rec = {
> -        .type = REC_TYPE_PAGE_DATA,
> +    struct {
> +        struct xc_sr_rhdr rec;
> +        struct xc_sr_rec_page_data_header page_data;
> +    } hdrs = {
> +        { .type = REC_TYPE_PAGE_DATA },

.rec = { .type = ... },

Otherwise this is fragile to reordering.

~Andrew

