Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id odMEHrZMKWocUQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:38:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1383668DBC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:38:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=x7QvNUPY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334162.1597264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHGD-0003Mg-2B; Wed, 10 Jun 2026 11:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334162.1597264; Wed, 10 Jun 2026 11:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHGC-0003KS-VN; Wed, 10 Jun 2026 11:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1334162;
 Wed, 10 Jun 2026 11:38:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wXHGB-0003KM-7u
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:38:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHGA-00Gv6K-Ej
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:38:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a294ca3-2eae-0a2a0a5409dd-0a2a4503ea46-12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:38:14 +0200
Received: from [52.101.52.0]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a294ca4-672d-0a2a45030019-34653400736c-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:38:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB6907.namprd03.prod.outlook.com (2603:10b6:303:1c2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 11:38:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 11:38:09 +0000
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
 b=vPMJFP0+unA1PuFexlsva4o5ybmqQce7Mul4ZRMQ/mgTBt9zz8P9FIy+/l+GreO2IoHnLNUHQ4G2gDYNx+J8lLFpS8fVpPhakH2D3n/xY5KYqFzys1DNb02A1y0zTw8yKgrdVbCyjalfwHC5nrM3sxj6a5gPgF8otopjXa7Ysi+HeWaSwH351NUDEjigr/khENbNddm5mc8wuP30HM2lNTcckvq0n6MdepeECWfR0PhwsqL0XUL2Qr/wOMtako2n79gBP3R1IG5FpwUcFW/mO2ZLlSrjh8Ss+TxHuMQ4gkzAqc/VEVynENpa9QRp94lDOT8dBVZuUHOnKQWf9IUiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10qREtX1h6L6v6b8s3zX21plySwoamdzPbTjTUFeuRg=;
 b=mf1pxeHULiPax9tu5HYxCqLbNDJqPHHn64zdWIS5NcKgj54aLBP/dIJjgQH8bQu5rEofKN/OinMp6roj2TteIiCS+2ONo7A++v226OLCt8gQpBHKTacOFi2D8fJKG3sKEobfLDcQxI91J6HUBXGt55HqZLqCWOpADE5yhWnnfRohhPeQYFUr9yBnxiBoPbQ904ftQn/potNrN7ytBaMKceJJByF7FqEkqYhwOqvf16GnY+GVTT5uOc6IApjO2TtLNI95XSxpw4Ys75YYObDZTu592Lsz8t+8FEN3b6od2DcuAC0t170fNOKBfmbKcn99mjJBkLuA+QA+umiG6G1fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10qREtX1h6L6v6b8s3zX21plySwoamdzPbTjTUFeuRg=;
 b=x7QvNUPYkLw4GaRnGSUJ8UXdMha5t+Oe7v1TlGjhhUPmlRMgFN/l/aCrhnsVPGDTZ1/hjWxNVBiuW06A1H6AkULJNucSAsaml48yLlzQDqIuQBMArSGMTG51s7d9FnMvOyXMSdLW6Pau9UJCYqr8sZAmlbwQ4HejMHoGQ5BCntE=
Message-ID: <45a5e1d6-0262-448f-a415-d7b1b3135d87@citrix.com>
Date: Wed, 10 Jun 2026 12:38:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/4] CI: Rework the archlinux container
To: Anthony PERARD <anthony.perard@vates.tech>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-5-andrew.cooper3@citrix.com>
 <1781091028.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781091028.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c0b5f3-076d-4b11-eed5-08dec6e4bf36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|5023799004|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8VVBxUfwTYzL++4oTa4GJV4Cx0BB7HpQHqi6f18j7jbdsmffq1lVMRxaQAIsarPrBwqXo9e2flD1s0bx0oA6XBOf2DImp2t88G4YwR8FZWHCUOQJR2K0nOyD6BygTDUSO0BBEqehJ7mOpBJ+eRW6uFk0FfNL9inQ0taiMHXs3q4lRVTExpK1CNh5JjFLnHMBNX7kKDXja8h8kQkis0OaFFAt3LLii89pssgNkN95aRzPwER7tYKHrS9POfNpTHkv2GXMOYVqDNIki/BnsZDjOCgmK4VHqOQ6K3+ri0H5kWo1lnevvUD6P6Nv1Ifylo5MetV9ERVgdFHpDXWW4voeOo9qp7QBG0ghnb9FyrUri3gwy4L5VQO+Zt9ujUVA5bOKKp6mKEgPstPez4OcwG5q2MfGC5li7oa+STVECsZQWCOhIOD2ID41GRaF+5KimVfeeeF4KT5igmrH0TWNKvYr/fHiayka9Eq+OlbBsBxW04/2bgmVKhsec3ccvB6wRDzIt8WJ61rdvSlNjuZ2/P4Qr2ZDNv6eWwDpCjOm9bMRvhzF6VyhNp4safmzOpILuV/PbHKIdxFD+mRdujlS/eYosjEzPIll/AOXcL+dsuqf5URyaF/FKh6I+BC4cyaMuj3P9u6FDV86Xk0FULfOiYZXOh/8xEBoKkqjWhYBlzVunO119Ev5XNcApb4QTLsKA4oAU9/fjmZrYRY1LMff3Oii/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(5023799004)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXMxTS9wVG95QURuNGpUOHpvWmxVU1NHWWNTOHNSOFU0eWFMa2E1ZFovSVRJ?=
 =?utf-8?B?aTNmUldmcEdiNFhXMHkvM1p5ZyszOGNtRzJMTnFHd0hUN2ZvK1gxOVlWMGNU?=
 =?utf-8?B?QUwwbkY4bFJkMFVUejVCWnAybTArYzVyY3dYYU9zTG8vU0p3VUdDNWNlZVNL?=
 =?utf-8?B?UGxSd1IrUnZWUDJVR3pYSXhMZ2ZjK1htQVdxMm5GWmIxZWlseWJ6WTZlZ1dk?=
 =?utf-8?B?NGE2VGJsd21iQkNaUjFRMjRJaEVnbkduL0JDbzJ0MUwrREVPeDJrdGhqSXYw?=
 =?utf-8?B?dFNBUzczTEo4dm9KTHU3dUpZYktKa204WmdVWG91UkJQeVVHaEljcEFHWGYy?=
 =?utf-8?B?em9VVWJPNmNiL3BQajJGVUtiU2d0bFpBdjllME1QNWhob1ZyZlN1S0tyK2dh?=
 =?utf-8?B?eWxUUmNTZTNHRnllcW1Mb0h6YXdaa2xldUNlaHEwdnZTM0FISUZ3MElDWjFQ?=
 =?utf-8?B?ZWdBN1JEYTdSUlRKZFJaS1Q5VUNEaWhFaDc4RlpuZzUwRTk4Mkh0a2kyNUZL?=
 =?utf-8?B?U3pJRW1RY3o5ZlNNRmJINlNlVDVOem1uTVhQUWJWODE5WU1PcGRNNDQrR1o3?=
 =?utf-8?B?VlBETkczSWsxQ3FXWHg0TzM5NEtYU1BTbVhUdmthYjVtNU0wc2V1VkgxcHR6?=
 =?utf-8?B?SEpwVU5QVjN2ekZqRmtxSnBJNU9TQmdnM1JabkxnTEU2VTlRTlFhT2lDT0JB?=
 =?utf-8?B?WVNjYm5aTG5EOFBqNC9BU2xPd2VtWG5ERWpERnBEZW4rU2h2b3dwdXpOSEFM?=
 =?utf-8?B?N1A1a090dWRrZmF5dlgxOXpkQU5OUllCdy9BcWxSYlRkc0VrYmo5VDlTMm1m?=
 =?utf-8?B?cC9LdHoxYi96UmJPazRxS2xLMDNLZ3dqMTJnVnlYaDNJMWR1bjIxNDNRS01M?=
 =?utf-8?B?bHNOeFFja09DNkFFaEh2bzc1eFNmNWw0T29MTUpjMjk5SnBEY0ltaWRwMm44?=
 =?utf-8?B?RVFMb1dCYjh6UXNOTlBDazRhbDJkRGpEUDJ3MkcyeGpTNzExWjdKaFJ1N3Ba?=
 =?utf-8?B?Z3ZVZ2dqVTNEOVBFWFlTRVV6YTJ2bTRMUlZ4OUc1RWVzSkZLNzQyVlB1VFg4?=
 =?utf-8?B?UCtFZ21NUlJ3RWRsVC9GK3hiNHAzc3ozaVkxN1pQQUtGTjRqMDcwN1RFV1Zp?=
 =?utf-8?B?VU04UUZ6VGliZWVtZEZnemRqaXhaSkw3dFlJd0ZZYTk0T0ZWSVFNRXN2UmFE?=
 =?utf-8?B?Z2pDVjQ4VWZ0d3phM1MzMG1UcWxjT1EvcXUxZ3J0Y2NrTDNDUllKZ1NJakJL?=
 =?utf-8?B?b2syWHUxT3IxK25jRWlpZEJPanl5SFp1TjdWTjcrQzdrVVViL1JSOVQvdURU?=
 =?utf-8?B?TFV5MGtoenNKWHIxYlNhNnFWOVBrdHBsaE9MY0txRHBMVG52c1BCMHA1VmRj?=
 =?utf-8?B?d2FiTWo5blQ4bE5SamRkeXUyN0x5Ly9TS3VKYlZVS1NLTGFiQTJaWVZ2ZEEw?=
 =?utf-8?B?TkoydXBWZ2ViR3ZGUG5JOHd2Q3hLbENDamRkNiswTTZIVHpOU3pUYktiSE56?=
 =?utf-8?B?QURWRkh2MHYvT2daRlZtTGVYVTRuVXdMbjhGNVpXN1d6bU5ubWZNK2dXMXZN?=
 =?utf-8?B?RzdxSnBmNXJ3NTIyYkpINWRjcm1BM2pMQWZhdjl0THRjY0E0V3pWVUJrNUpI?=
 =?utf-8?B?YlhBVUJsZU1OanhWcmtWbkZkdjJNeEgrWlJyVlh1MmZROXRWTmJ6OEpnSzZS?=
 =?utf-8?B?QWk0Sm9zbWZ3SFlvN3RrNHFCRUlNenc4MHdtT3ZobnprR0dhQ3orZVFRb2tV?=
 =?utf-8?B?T1krVVpvd3FmdDNxNXBwYmRYbU1jaTRPQ0RJZ1NjUDFGaEloSDNVZXVBam1U?=
 =?utf-8?B?QytUZnFqNWNYeStHVXRtNXdZRkRzTlN1c3czNVdsMVpibzR5azh6Z0Q4dFZG?=
 =?utf-8?B?aks2d00xS2FwMytCdVRrZTJXcUxQeXBDRUNFaFZMZlNQclVpbkdZN2RGeTI1?=
 =?utf-8?B?UWFzVndVdmlpN3BYVXJjWUxSSGRDczYybFV4RlE4M0JCVlR4Q2hpam9IelRO?=
 =?utf-8?B?bDZReSsyVTExTko0NG9VVUkxcUFjRGo4NUxya2sraE85UGEwdWkwUUdUNU1M?=
 =?utf-8?B?K0JaZHYxbnRJNjNMbGoxcjJtRjQwVitIZzBMaDVpamlpaUdzeVA1SHNKWmgv?=
 =?utf-8?B?NEFCNno5K252STcyRkYvWTJkeHhOTGFYTm1CYytKTzIrTG8vT0NXeThiVWQw?=
 =?utf-8?B?UVlSNWg0V1ZQMG45UWFZZzliL2FQL0UvcERoa1dvaUhDQmFEWkh2RHBZOGRl?=
 =?utf-8?B?ZHpJdi9WRTVhMU1PYzdXRU1pOEtaQTBNTExHRmduZ3dJMkVyMzNQT0FoVWlI?=
 =?utf-8?B?RVM2SmhMOURBV0pXMlhNd3hNRHpJU2dXUmF2TEs5dzJJemptSEFBdWV1Ty9O?=
 =?utf-8?Q?MF1NGVnBVuXhnpfw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c0b5f3-076d-4b11-eed5-08dec6e4bf36
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:38:09.6899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCevJhmEbmzhXyfqJ+9YJo0LkQNrVMKC4XB6PE0viTRLSvD9vW0/II+F4s9D1RAzxASyVm35AcqQC4Zl3+d7nlOOpoW+AQLIcMDS0eHKbCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6907
X-purgate-ID: tlsNG-33051d/1781091494-39D7B938-68FA4B5F/0/0
X-purgate-type: clean
X-purgate-size: 1482
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
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1383668DBC

On 10/06/2026 12:30 pm, Anthony PERARD wrote:
> On Tue, Jun 09, 2026 at 06:31:02PM +0100, Andrew Cooper wrote:
>> --- a/automation/build/archlinux/current.dockerfile
>> -    && yes | pacman -S --clean --clean
>> +++ b/automation/build/archlinux/current-x86_64.dockerfile
>> +    pacman -S --clean --clean
> The "yes |" is needed, otherwise the files aren't removed from the
> caches.
>
> I've only got, without:
>     :: Do you want to remove ALL files from cache? [y/N] :: Do you want to remove unused repositories? [Y/n]
> and no messages about the files been cleaned.
>
> I tried --noconfirm, but seems to just get the default response, so
> nothing is removed.

Lovely :(

>
> With "yes|", I drop from 1.32 GB to 1.26 GB on my machine.
>
>> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
>> index 70494645e09f..f3c2b48b113f 100755
>> --- a/automation/scripts/containerize
>> +++ b/automation/scripts/containerize
>> @@ -26,7 +26,7 @@ BASE="registry.gitlab.com/xen-project/xen"
>>  case "_${CONTAINER}" in
>>      _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
>>      _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
>> -    _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
>> +    _archlinux|_arch) CONTAINER="${BASE}/archlinux-x86_64:current" ;;
> The "-x86_64" should be added to "current".
>
> With both fix:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

~Andrew

