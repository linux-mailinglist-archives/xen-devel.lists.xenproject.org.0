Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OANWBV6uDWrW1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:51:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904C58E392
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313935.1583958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgOK-0008NY-J9; Wed, 20 May 2026 12:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313935.1583958; Wed, 20 May 2026 12:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgOK-0008Kh-En; Wed, 20 May 2026 12:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1313935;
 Wed, 20 May 2026 12:51:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPgOJ-0008Kb-74
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:51:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPgOI-00GBSv-B5
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:51:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0dae3c-e002-0a2a0a5209dd-0a2a4501e622-26
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:51:14 +0200
Received: from [40.107.200.37]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0dae40-c1f2-0a2a45010019-286bc825be41-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:51:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB8115.namprd03.prod.outlook.com (2603:10b6:610:27c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:51:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 12:51:10 +0000
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
 b=XSTc8pRj4KdXfaH8qh1n+/jaLj2FjxKykMuQUZT8s4rRV/aai8sFVqMTtvZ8NuETD/5WFW+1FcnlQ6QZMQ1hKGAAsadK0NVzczEPQwR4GHpGAdhllC3RQmAAW2nTuqw3GJ9PY3kIzGcWN5P/HqdRnC6Iu0AAPtU6D0sodipbb4KWxnJcjfE/Gzg0+MXBv7Fgd9yMCAaY/phYJ1iOcENfsJM4CxWwn9cA5++f+E0LT1sNXq4KRUXEiEoQ338PzRGtKHvuNFNwaScKOrj0/1gzcCZl4Ft+Xs5T2NETTAC58BrVYqEg76YhbSNqXD6tPf/pKNlbMf9XnXwXqQMvRYV+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROiJdfBbYtCDwzlvt6d59DYPUqrM9XCpKmNjuIOAJes=;
 b=G2gzRGqfy2fIYPWbPh/9XrGOlLC/xdcesNsBNaHNSboIjjB0WaIUl7+F6pb2sprRmO1Ywyg5OZWLRFVRQEcQ/F7vpnqyZXBOF8j9vZzgdUHij9TUvJEel3h2F4/sGZZ2GaipSw0tiSToXq5B97lztGBj63WGiuQishnBZk+2Owmts3N6BVMwWF5OO0KquE213o8I3OYEECS693Kfb1srb6IPyZuCn9siomlXna2MsaDUz/Oc04WhcinOdu117SJLfFFY4gCIf9Erf6CXLzkKiNmU4jenr5EH+9UNefGy7Te3bx/AkFyX6X/2EzGvOku/z+W64taq6zkfeSIPBHKFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROiJdfBbYtCDwzlvt6d59DYPUqrM9XCpKmNjuIOAJes=;
 b=WWsuagoEYWgXeURbNd6OvkMCfXU/tBToI6IBvvLxlMEcICi5VP1U9yfeQ5qF6qq0UYl2RYp+RxxiptqWJqZDHoszZ8/7vJdv1Q33EYZ6jCBhukDdwNAPexvLZW2+Ah6ANADiqGJxb3Nd6nsn7r6unTZfXZfEulQ/zXKDp4oGOTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2d995d54-40fd-48e1-90c9-fbf6a9933415@citrix.com>
Date: Wed, 20 May 2026 13:51:07 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86: strip debug info for intermediate linking steps
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7a2fb6cc-fc9b-43c1-9f4f-d5a573d52dbc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7a2fb6cc-fc9b-43c1-9f4f-d5a573d52dbc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 264b50eb-e750-4133-a187-08deb66e7783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9KdkglwgcsuR0NALhJRxKdb8vtySiPcc2R7FOuQlMpJyTyhrE/e1mIPPhWJXoxUWnFqc+0DlAW/myGyft3E7WPtiEFrqC2tGY3I7HhuK+535D2KDp3VRp5XkC3FiHGzprnv7vNQmH1dCa182dkWSYPSLpnwKDkMZWULssXfa7QyyOiPItNof65NRA+9RbctJmihepsEO/iDqOmQZF6EIwTqBaG2YazuAOcj3/mZ3f4ejO9ptu/G6I/pIiZcmpVOMsEfTxAUWW8YFC/SXFxsSYSpN4bBtFD85C2p041gUwfYFcgqL/Owk4Zb+yekJPfc33VxQK0U/Bh1V4CBVqpmqfWwYgUApqmgrHfS8vPTGGpgolxF4h65bXXRKjsOZLVQ3SLyM9V9gnBi04WraAgV4hAt4vCkTklX19Y1f0CBcrVA6KjXw8yBQVcBkDGSGk1qT+T0aO/aocRW0Fd+gi0OAlo5dJnw/OQH68xpKA/vLyJZ1MB0ICRZrhn9iN+fvdC/Y9A2Xs9uKv/5pXTTiRm3DwmKvfncT2+icV1xpLc8gqZss4qZJ+KjN6FbM0M2ncQ/6SrRQe3cj7trd4IbGUhuL5HWb7xsHou83aM7mrriDkrk79Mvol+p7zY2FRATQ14rPKOim8wxXIAt5kX4PTSL5syENBmLuxhAx79/kNFIbY1v26jHQvkVg4Cg3CVU6zZA5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWd2eGpXZ1ZLZTVTb3JaYUZGNUUrQkNIaElhS0xpMFkrQldtTkJjSGw5QXlN?=
 =?utf-8?B?ZTZINHNOREFaaHZPck0yN09GRzV0WTRLaFVwQTNtZVdkRFVqTlM0S0pKSW9F?=
 =?utf-8?B?R1VvUTNISGdPV1NORXZXVG1pQm9keW5JRGFBREowWVJhVHZONUw0bmpLcmM1?=
 =?utf-8?B?TU9WTmpiUHFFajlxK1BHOU9yZGJqYmpEdVZ0MGcwa3hHR21NeHhwM1NQWGtB?=
 =?utf-8?B?alVVUitJNm5BZzh3OUNDaklZdWtIZzhNcHhCSE1LY2JDZnlMcWFQSjRRSG1D?=
 =?utf-8?B?UnVSTmtQcnVEdk92aEZSMFh0S2w2MjZKOXRVQ0hzZUxBdC9MR1A2YWVFcTNB?=
 =?utf-8?B?WkZOYnJ1bFNXVldFS3NJRUJaVXNDL0p6UENkZkN1OS9qMThaSkVSRHlmVlJT?=
 =?utf-8?B?SWVlQnRNa0t2V0FlRkZ1eTA0NnBETVNqTU14NXBDNUYxdjc2eTRGZ1NxNXNx?=
 =?utf-8?B?VWxhbXlhSHZIY3c1bG8vZGkzNkMxUjVKbWRXQ2kvbU1lOEVGUVorRTVzaThq?=
 =?utf-8?B?SWM2Q25WUkVGUHZsZUMwNDgrK3o3Mk1ieklHdmtqQkxpREFudDZwRzJtOHJB?=
 =?utf-8?B?OTV3bGdodkVWWkFHSm1VQ0g4WUxGMzVZZ2FxOFllNGJhZGRQQldGSy9hV2xh?=
 =?utf-8?B?aVJoN0llb3czQlcwQUhVczhyNjVROEhXSVZKRXV6MmpJR2tYRVh2aE16UWVU?=
 =?utf-8?B?dkswR2VrdHNWUmVhV1JERFNEU242Mk1CbVFpYjFzRElUNzJBNHJaaGZ4ekRv?=
 =?utf-8?B?QmZLdmVkY0F0eU5kSTNrOUxZYzlWNTR3aS83UnBhRFZ4ZXM2OEFrU2J2aEdw?=
 =?utf-8?B?SDh4ZGRVVTRBVTQ5bVZjOEhXNmtPUkV1eWYrUHF1ZUdyL0tnU3pPWXV1VnFM?=
 =?utf-8?B?Q2VEaEo1bzdIM3VycExvSlJRVncxbmdCN0FUTWdTU3NlZGo1TUh5d3pJbCtI?=
 =?utf-8?B?U2M0eE9PWFdGdmxLZ3I0TGRXWWVQaXlPdjk1S2FuOFdQblZkd2VZVmxZcDVr?=
 =?utf-8?B?ZkpENmdPbTFLV3ZkYWdVdWNRZ3V3Q2oyMHZ5ZzlndTNNaEVlaHI2Sm5oUVM5?=
 =?utf-8?B?VmVYdE9NRm1hMjI3bDVIVTVMSnNKcVFERjNVY1NZVDVac1ZkUHlaUFczZWd1?=
 =?utf-8?B?empwU1MvWGtmcHk2eVQrZ1dGSmtEblpkQnRBUWo3YTBSeVl0L1lNYVpIRkti?=
 =?utf-8?B?Z1V1TFoyTWo0YWJDckl2WUg1WEt3MFo4d0x3WFdvTlkwNldMN0Rvek1BMCtT?=
 =?utf-8?B?ZHFaTHNtd1dJWFJtb3ZRMlluR0tZTGJKTjFvRm42aXE2eitMYko5bjlWZDEw?=
 =?utf-8?B?bks3R3RoMEtaMWFqRFIwZWZCNEFjSytEOW9wRis0eWJGOGNNR1A1azhnUkpl?=
 =?utf-8?B?azh1TjhNKzVWZy96UVpDL2hkcng3SHhjZ25sdEZpWVBncHlJOG11RVczNVdC?=
 =?utf-8?B?N1NsV1BRQXE0VjV3K1lwWkNSako1aXNHcllkdHlXdnI1aWdPdjFXU2JXYkRC?=
 =?utf-8?B?OHB1eGgrdGJGRWtrdDFqZ1gxYXV1V1o3V1liM2VCdTlRMnFUWVdZc1lGSEVy?=
 =?utf-8?B?azhZTlg5UTZBc1o3Yk5WYko0NVVOcTR4RGlROVh5clBuMWR1eUM5RTlLQXp6?=
 =?utf-8?B?MzNjbkh2YTBmQWNXb0dkdVNSMWZiTktLQXJtcmhKWkhERWpxK3h3V1Y3VjMy?=
 =?utf-8?B?b3FDMkNQRkE5cUQzdDFSQUpVOGJ4bTl1a3dlVVRHZ2gzL0U2ME9LVTJUZS9q?=
 =?utf-8?B?eDZTVlJCenVaRGYyVmZzMDRsblRJRWZYb1FWMFlNSitubEVYdk1yVDlwUVZX?=
 =?utf-8?B?ZVFXdUxxR0wxU3FiS3Avb0puUnVuTVFmTHpkd0dKRXMvNzlpY2pqaHJET2l2?=
 =?utf-8?B?bktCSVNwbC9TMGtWTGtmOGY5QlRRQmM2dnAxNUJBVXFtQW9ZREF1d05qZGFk?=
 =?utf-8?B?L3Rtc3I0dXptU1RxQTNkSjV3Ty94b2NHcmIwZ0JFejZJVnhIS2pPZmVMbG4z?=
 =?utf-8?B?allhb0p1NUllajBtTmFKa01DUzZhQ1QrUzlVcU1GTzhsTGhTL1ZpZ3dNam91?=
 =?utf-8?B?VXpRWUdKcTdBd3BoSnBlR1BNSUhTK3JlSGpXaWJMVThLQWtmTDE2UmlKMmlD?=
 =?utf-8?B?WHR6L2o1TVVFWW4rT2JyZkJ1UDJHMk9naWcrcy8xSi9udkhobzRyYnUyb041?=
 =?utf-8?B?aE1KdkZzdWs3Z2N1TkpEcmlNKzZmUm5lNUR0NUwxOUhjWmFQMDZmaXBZTzFI?=
 =?utf-8?B?N1FUZG55TU1LeXhtWTFyQnViOG1OZXRKNDlDdUlHbHZYNVA1WWhVMFZmQ2ZQ?=
 =?utf-8?B?S2ozV2ttSzg4NTFwRFpwOTJOUHp4NDhuSFNSbFhwY3hKR21qYnRDNSsrOXVU?=
 =?utf-8?Q?kUEktPatyGtFFVdo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264b50eb-e750-4133-a187-08deb66e7783
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:51:10.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuOhyfgOqWXI88bgIv4lyuimtlrqf2qQCQ6tp7GFWBGZL4Ek8a6K9TmeYCTyTDm117TWBlvDoq5voTtd9NnSPKEW78kcULlpiIUVrtmfxeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8115
X-purgate-ID: tlsNG-d62444/1779281473-B5D41FF4-30898B69/0/0
X-purgate-type: clean
X-purgate-size: 1461
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9904C58E392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 1:11 pm, Jan Beulich wrote:
> Linking debug info takes time, especially for xen.efi. At the same time
> symbol table contents aren't affected by presence / absence of debug info
> in the linked binaries (the ELF and COFF symbol tables would have extra
> section symbols, but tools/symbols omits those anyway).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The main speed gain is from xen.efi linking. Therefore I'm not even sure
> if this wants mirroring to the other targets, where only xen-syms is
> produced. It would mainly be some transient space saving there. (It would
> perhaps want retaining when the linking steps are moved to common code.)
> Thoughts?
>
> On the system I measured this on, "real" time went down from 4.9s to 3.9s,
> while "user" time went from 7.8s to 6.8s (all approximate values of
> course, as there naturally is a bit of variance, and all for full
> incremental builds with no other changes, i.e. mainly the final linking
> steps getting carried out for the common/version.o change).

If it saves time, then good; this will make an improvement to my dev
cycle.  How does it fair on Ubuntu 16.04, where we've other known issues
about the debug symbols appearing to be corrupt?

It would be nice to be consistent across the board.  If we're going to
make linking common soon, then it's probably fine, but this does risk
becoming yet another mysterious difference.

~Andrew

