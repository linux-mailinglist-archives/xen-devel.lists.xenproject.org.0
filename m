Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KiuiBismTmqJEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 12:27:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230527244ED
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 12:27:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="e/KO2IKs";
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356826.1611365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whPVJ-0000fp-FI; Wed, 08 Jul 2026 10:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356826.1611365; Wed, 08 Jul 2026 10:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whPVJ-0000dA-CR; Wed, 08 Jul 2026 10:27:45 +0000
Received: by outflank-mailman (input) for mailman id 1356826;
 Wed, 08 Jul 2026 10:27:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whPVH-0000d4-Fr
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 10:27:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whPVG-00GApN-Sa
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 12:27:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4e261a-e002-0a2a0a5209dd-0a2a450ac174-12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:27:42 +0200
Received: from [40.93.195.13]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4e261d-e40e-0a2a450a0019-285dc30d72f3-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:27:42 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DSVPR03MB989291.namprd03.prod.outlook.com (2603:10b6:8:3a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 10:27:39 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 10:27:38 +0000
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
 b=R/WDlZo+KVecXrFFHELnOosGTlPZ4fOVl/nmfL8dADBXLa5mToLlKc1kAVcZseFVJUdR6PiOBdzesBwdejriZifKNgNH1qmonglQssyyoPWnvoAgL+7ViIcOt+Pf4N6Qq09wSJR+uBk4x//tOJ75LpMU9+iDc5gtQq5FNnw5t48/j2yjluznY2T5ditqycmez5CBOgafOyyN/tc/f5PJaXnuawxxM3cznHUgt3FX43euQTrz77ilBR4UAYr15wX6uci3jeBjVBrfcQj5AhsNwV1y4GYNdHlL3LJteysawno7tFmJPoiXG+rfSqP/NqLqhRj8NHn0eg3xk/7pT6L6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHE/U+SvvlJ7eJBrLic9JRJMC4fO19qIO+8Gc1srDE0=;
 b=L+K0Vc8mw+biEewHEjUj6uAS0W6ACT0/6M7FX1MLbGOjr/qlzYi7qPZb3K4OL9S6AubkrhD1Wk0tpmDHoAWIREjNmBE2lgWMedco8kc9mbtEIwdd+AijbkOVOEDSelVt4HBHv6Ih5gq9+OPrNYWDTqcsV44bWQgRPi6V57wd3zlXp5gd4W1rvDpLweLikOanmzcdn1sfKydOdlUnNzHcw8QHx5K8e4fEEX54wRopDenj8vZQuBwbxDRWzQkguCB66JxcrqfvNOJvB6L9w3Ml/ggCNygm8McfxYxa63X4V5UnNrbl3o7d92dZpBhNgKMarqEnmCkmufwWBtaLfNQZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHE/U+SvvlJ7eJBrLic9JRJMC4fO19qIO+8Gc1srDE0=;
 b=e/KO2IKsi/AgShsox0xx5fPKVMojpF1L/iZOisEu5DeB7IDe2Lgs/Am80NoH7VAllCcyQd77yvCnHh4vHfeDtAkoxi2Ajimwfnl3XmZcurpLJCU/5D8q7Zs3CWiAqN77Y6MHhtXseWjqeNmdkQWlqhrD/VBH4bG+7PYjMve6SXk=
Message-ID: <27e6f881-19a1-4456-a387-ceb7e3f5eb7a@citrix.com>
Date: Wed, 8 Jul 2026 11:27:35 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
 <4d38fc9c-0d80-4632-98e8-7fb4682bc0b0@suse.com>
 <1783504766.8631fc262581453bbf619ec5b2062170.19f412b045b00080a8@vates.tech>
 <41d091b0-a7e7-461f-80da-69443a8ec752@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <41d091b0-a7e7-461f-80da-69443a8ec752@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::9) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DSVPR03MB989291:EE_
X-MS-Office365-Filtering-Correlation-Id: 1704e787-372a-48ad-3f26-08dedcdb8907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	X+XhC6hy/+dSfRC/iW4BW8alxbST5KURHiAIySviOZGAddDMjDyd+X8vYzWeGIhzjb1G78UDFhXKKF5EFEU8GWAOVL29QnTWgpwPYnu8p9wy4ZBc3cPLk6bc8gGmjqbHsYHwff0L2Nr7Ns0onNgUyfN/diIySXzYVU1V1L33qi857fP8MRe/IO8ROLMotUyQpbqXAtxGgLKIfhj6+KQEpLr3ZyRmhvE+aLaUMg2Wbwj3WXJCqbyj2dsUxjPtwvIEC15B0+ip067X7rtPMKYBvNUDE6oYFOZtpd6H7S5Rk+saO/XaFQb6QCmRr5BKR+7gIixOTGoKjNOJjpdKKCVnvzLGit6f+U5Pje7PlfMBOK6mAl4qtVuRh+YantEq7NMVmoX56UL2RejnIejw4n0ZPJiPQrYkfWvniIin6QwkSFC1C4aKzf3JzE8Wyu2D/wFjT6dkncRsar6OkSI31L5/bKDgnR/Vmve3fYMSNDOnGvsc3l6D5Jd59rhVOusfnWMYAJuFCkd3KqcesVhC6VYJAHZTUoxI17t8LVsgp9xPwuQa7sVFtlltztr+mGBLRc+H9D/fq2v32/YPVn4oE4x2lcJUPrQiiC8JabvL5WmfNxWJ37cMLWIIDaZeGfp0d3euXXeptLr57S518FplS/BL8xKZAoaT2U+vYc4qdEsuJwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elVXL1lyRlAyVnlVaDMrcUxwQzB4T0ZyK3h4REVONEFVYTUyUkdOYks5TUxK?=
 =?utf-8?B?Z2pTTEc3NzV1REFCTTBKY2djWGtQYlNxWkxHUGtndTR1NmNBR1NJUGZiTzdv?=
 =?utf-8?B?RGUzWTZHODJBZ1phdHZLRlNFS3hCdkphNk9OdGtMVmptN3I5dFdkZlFxK3U5?=
 =?utf-8?B?UGVLdElUNUd2ekh2TUdZb3BOSjVLNWluaHpYRXhFaEFOM0RmTkFWd0p3a0Q4?=
 =?utf-8?B?MktlSVRPclhwejBEVGtDbTdUT2diUWUzcm83Q0NXcjdTUVd3VlhLL0Z4bGsz?=
 =?utf-8?B?ZHNXMHNORGVuYVo1U1FZbjBqbFdTSTBqZ0FueHozdnJSdEhUbndwak1sbWVZ?=
 =?utf-8?B?RlYwS2hCWEx4MFU3UUJSd1VYQmp1aUpXNUZoMllodktLVHJCRml6T1NTWXBL?=
 =?utf-8?B?VUp2L01icGtNS2xtSmhadk5QQjd2dE1tRjN1YWUxQWVmRjNybHhmK0ZldHpK?=
 =?utf-8?B?cVVKYlB4VUJycXA0d01GQ2h0ck4wYjJrK0ZkZG9BdDdtN2JwNGd2OFJTUTBS?=
 =?utf-8?B?OU11Y3daNlA0aUJuS1lxaHlqV3ZlTWNUdGRwekU2ekdXNzAxTTJDWTlvbjRq?=
 =?utf-8?B?QzBDR3dNNWJVcGVmZlNVcGoyQzJ4a1l3T1UxeHRHTW1oenFUWWxaWk01Tkl2?=
 =?utf-8?B?NzR3d2hyd3ZqMHNyT0pVNUQ5K3NJY094d3VBMW9rTW5jWTJKMVl3KzNBQzdT?=
 =?utf-8?B?cEYraml4QzdTRWF5dnA5aTNCaHI4NjJJUSs2cWJ5b3Bramc4N3h6cHVWSVZJ?=
 =?utf-8?B?bkFabHRJYU9vZWNkdFMwQys2MEQzbVdvY1FCVmZ6eXlLUFBPRjR0WmppTUVQ?=
 =?utf-8?B?dkNkN1NKQXBRZnVkZFNPTXVTbkRUdmhObHRxdE5jdkJhSVg2YkprTUV1bnpS?=
 =?utf-8?B?citMbGppK2R3M2JUaXRkQmJCL2kzSnpVOEtyRWhtQ2ZEc0FRbmp1d0QxVUkz?=
 =?utf-8?B?N0R2b0RNQVluUjd4WUVMRTV2d09MajNaVVk5M3h1TkV3NGZLY1NpSXNRNmI0?=
 =?utf-8?B?Q09XQitlajU2OTlLQmtSR3FMZ0ZsTEFiSm5LSzc0cTlpdmF5M3ZWOWNJdDI4?=
 =?utf-8?B?WGkrV2dSdDE1L2V2cUg5ejZ3YjdMMXZCaDdyTkRER2Y2QnhFbVlYZHNybzBo?=
 =?utf-8?B?L3RBYm93MzRUZ0FDSXd3b1lGaGtQWFhsZ2VOMnJKdEd0T2M0cDloejQ3ZmVC?=
 =?utf-8?B?MVU1dWdPWE5UYzFYbW9YWjRyTXdReFdxTGp6MTRGQmRxWEllVjFEUy9hc0Fl?=
 =?utf-8?B?VEp0OVZyTTFKNXJQd1F4VXRERVR6QjFkNDJzTW8rRGl1dzNGWUk2NG10aWE5?=
 =?utf-8?B?enN3YWpmUFp5TE1RcmZyaHpwbEFiUnJqTXQxZmlmbllVZGpYOHFtZ0pKbi96?=
 =?utf-8?B?d0NOYTYvbFlVdXdaTEkvcnJrcXRBWDZsZDU5SFVCYVRWZlQ3MmFCK1hEOEYv?=
 =?utf-8?B?VVdIMWMzWXVxUHVoSUFsUTJyUFR0TmNXaDZ6aFQ2L0QwUXpkUy9OSi9SSUc4?=
 =?utf-8?B?R3VFSHRRSnJMbFJLVkhScVM1N1ZEK3dtS09JSnpVb2NsTStsbTZiNUQ3Y3Qy?=
 =?utf-8?B?NnlHL2RjbFViTW50SlBDbXdDT2V4MXcycXg1RWVQazAxNTdQRUJEcUlGeU1P?=
 =?utf-8?B?WTR3UUg4Y3lMNC9LTkVkeGhFa20vWDVFdWV4YWdybEpka2l6SmJ3VHVkQlJD?=
 =?utf-8?B?MmtzNzRWUjRsR1M2dWlsNDhIY0htSTBZais2L3dXVTVBVXVCS3kzVmdBNEVB?=
 =?utf-8?B?T2RuUHZvMlgzS0F2R2tDNFdBcVM2bHVKWDFzMFdHRlJ3Zm95WXZ0Mk5BUUFm?=
 =?utf-8?B?T0d4U1c3eHJvOWE3U3lsY2ZvVjI1clZ6L0VoTEVoKzU0QzAxRG1Sb2pPcTRW?=
 =?utf-8?B?Q1B1QmppQi9NRkZHd1pwL3I0Z25tN0tma2xQWW1Tc1V5eFhaQi8yaG1vc1c2?=
 =?utf-8?B?MDl4cUMvakNka3FTUG5iUkd0MmhpQm9ySGhzZGlwUmNQRTJCZ3NFblNXQlJJ?=
 =?utf-8?B?Z085K3dhNGRhR2k4SlR4eFhLdXpQbjlXVUsyOWhXVE03czU4SVNkRlhNcG9P?=
 =?utf-8?B?Zk5sb0FueWQxeEVTcUxUZktPQWxjb1lSbUhWeWFPampZTTA5UXhlM1EyU1N5?=
 =?utf-8?B?M2l2R1dYT2Mrbks5NnZuZDJlL0lrT1pBT1R0Zk5kZ2J0Q0oyRm1UV1p4TnJm?=
 =?utf-8?B?YkxtVDQxSzVqQnpQaGxqVksvWXlnQmUydjRoY2tyNUhkZm1aN3JML3VTdVht?=
 =?utf-8?B?THNKRm51VmYrK2NUOWRKdy9tb1dDcmhSaTZLZXJGZEUzR0NBaFZBOUhGMnla?=
 =?utf-8?B?UTgrcmZDeGVac3FzdUxCQmwzdFFEa3RRaHVhSmh2RW9JK3cxTTdBQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1704e787-372a-48ad-3f26-08dedcdb8907
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:27:38.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbOJlS1LhZhe+2uC7fvFwF118wrwEdmeL9vmWByfUUNsZ05fKbUHjKhgRdbOEBfRzf8G3ONOPHNR7Wj/VZc+31nbgZnHiRkVUjBx1PuwYt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989291
X-purgate-ID: tlsNG-4011c0/1783506462-CF139DDE-FC472EDF/0/0
X-purgate-type: clean
X-purgate-size: 2339
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:from_mime,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 230527244ED

On 08/07/2026 11:24 am, Jan Beulich wrote:
> On 08.07.2026 11:59, Teddy Astie wrote:
>> Le 08/07/2026 à 11:37, Jan Beulich a écrit :
>>> On 08.07.2026 11:29, Teddy Astie wrote:
>>>> Le 07/07/2026 à 21:49, Andrew Cooper a écrit :
>>>>> --- a/xen/arch/x86/x86_emulate/decode.c
>>>>> +++ b/xen/arch/x86/x86_emulate/decode.c
>>>>> @@ -780,12 +780,12 @@ decode_twobyte(struct x86_emulate_state *s,
>>>>>            break;
>>>>>    
>>>>>        case 0x20: case 0x22: /* mov to/from cr */
>>>>> -        if ( s->lock_prefix && vcpu_has_cr8_legacy() )
>>>>> +        if ( s->lock_prefix && vcpu_has_cr8_legacy() && s->modrm_reg == 0 )
>>>>>            {
>>>>> -            s->modrm_reg += 8;
>>>>> +            s->modrm_reg = 8;
>>>>>                s->lock_prefix = false;
>>>>>            }
>>>>> -        /* fall through */
>>>>> +        fallthrough;
>>>>>        case 0x21: case 0x23: /* mov to/from dr */
>>>>>            ASSERT(s->ea.type == OP_REG); /* Early operand adjustment ensures this. */
>>>>>            generate_exception_if(s->lock_prefix, X86_EXC_UD);
>>>> I'm fine with it; though we probably want to make sure we always
>>>> advertise the AltMovCr8 feature bit as APM suggest users to always check
>>>> for this before relying on this behavior.
>>> Why would we set the flag when hardware doesn't have it? Note the
>>> vcpu_has_cr8_legacy() check there - we only engage this behavior if
>>> the guest sees the feature as available.
>> Hmm, ok, though this bit is named as "AltMovCr8" in July 2025 APM; but 
>> we name it "cr8_legacy". Has the name of the feature bit changed in APM 
>> over time ?
> I don't know. What I do know is that imo AltMovCr8 isn't the greatest of
> all possible names. (Neither is cr8_legacy, first and foremost as it
> alludes to this being a compat-mode-only thing when it isn't.)

We inherited the name CR8_LEGACY from Linux.

commit c458f45d2eddcafed054651363ffb5c830e5df5b
Author: Keir Fraser <keir@xen.org>
Date:   Sat Jan 8 10:48:09 2011
    libxc: Update AMD CPU feature flags 0x80000001:ECX for Xen tools
    
    This patch syncs-up AMD CPU feature flags 0x80000001:ECX in libxc with
    the latest Linux kernel.
    
    Signed-off-by: Wei Huang <wei.huang2@amd.com>


renamed from ALTMOVCR to CR8_LEGACY

~Andrew

