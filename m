Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eQHKMJdnKmpKowMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 09:45:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A3F66F815
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 09:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=CWYnsEVu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335151.1597615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXa5T-0002Xv-IT; Thu, 11 Jun 2026 07:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335151.1597615; Thu, 11 Jun 2026 07:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXa5T-0002VF-FP; Thu, 11 Jun 2026 07:44:27 +0000
Received: by outflank-mailman (input) for mailman id 1335151;
 Thu, 11 Jun 2026 07:44:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXa5R-0002V9-W1
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 07:44:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXa5R-005Rxw-42
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 09:44:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2a6758-2eae-0a2a0a5409dd-0a2a450bdc48-2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 09:44:25 +0200
Received: from [40.107.209.36]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2a6751-212f-0a2a450b0019-286bd124bbf9-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 09:44:19 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7438.namprd03.prod.outlook.com (2603:10b6:510:2ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 07:44:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 07:44:15 +0000
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
 b=f2gJ60IrSnUxde7XvbxyvvtLF0Ly5Sbj0QYMoMghvqZ1d5Jd04pQpSyw3R0BxnCcf2glRivwKlzONAa8cFVsJ8WRTQm7tToUYU3+8aZ1mXgUjYsWFtv87l8v9dWpXkJykx36wY0na3wt5LT27YbviqEkexBvCUaMpqDxfQl/rrCqa9KzCB0rqYohamaxHU+CbzDG3eBkWydiZfdmOuvadJuNvYB0KECm3UX2rmjFkh7DjPA0vCfNd9iX8ZxDZbwJhUpPeRjfgboKWFUZBl49+fNfXVyTtabfBielRLBdZH7eZAzCPBnulT8w6PdfXr4LJgKNTty0AkQRrraKXEYJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDRDIKj0jmz4g1amR/yxmB6LsLWG3XEhVeJAV5BrM/s=;
 b=UkQyOXSlUm9mik5JCfSO8KEkqlw2j1L+bY6b2Zyv5ejTQh4fD/TLk8TWeuUtXIw0OB6RMaRA6GhNQkFg9nFw9fARc0bS3hUP26MWEFkzprCyYT+ctIO0+mmqshfN+3mI6u1YsqREQZsWKTqWdX3j51Xxx9/eEOwJp/1+5dLV5bAVJEhmYXcK/gVUt/H3159ZbmzMYs2IDN1Jbf3t485iaAvEL+WH9sngQuL4WVwIOvbyzX+aKr7WjopuNb4a6wdYyc2UN22YbqEMCIIDpXCeGrEME+00RmLoRaOzJl4SMUfETxFl1ye1h6d9t8+ubvKFpfvz9asd8Oe5+UWX3fYgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDRDIKj0jmz4g1amR/yxmB6LsLWG3XEhVeJAV5BrM/s=;
 b=CWYnsEVuUdtaFIdDIrE7KM150CZToMtgCGmJfSGGFIFYjcRTgH9N7/Ll4hSMm2FQM2y52WaEmtzlNxVsH4wCUQr+f6l/7/NSvWiBjnOddFZinRCALCG0k1j5xeb+PsNbVNykATq45Z09bh3jIWrsy/eiAWzdjqiNPXce8vPB2GM=
Date: Thu, 11 Jun 2026 09:44:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: Re: [PATCH for-next] xen/kexec: Style fixes
Message-ID: <aipnS6AwvCjBlme3@macbook.local>
References: <20260610154110.2979888-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610154110.2979888-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1b4960-d23e-42af-eec2-08dec78d3c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	+1/8hooPgKTxouzFw9TZ344NTwbXXaKpbOKf4dsvF7DXvyADDEzab7ekFc/SEqWvYzkYgjTZ/p7+3h4O0i6aY1DYwQKCpBZ9Kim9C8AEBJlEeWDvh8kML5XsrCa4Aj1caYk1A6rSK3t+cFF/ztdU3/hjSyk3Q1xLhmCNNJjU9fMSX6g8IEEsMPRXety2VhFCQJ121ALJEhA+gSjpOSQWBe0eZ8iZX38GAhs5r6mcPjJDapELdFp58WK96tGajoxiVmNSY75w9tpM4qpL9CwW4n72nNmVaqe2l9xLf7wyCBU1/CU/HQ+Pe1/kKDmiZpOmwuP7/hawAhyAQZIqPZHaxmbMYzMudKBgZ+ufjlUYIMqzoXH2xZDVXICXmAWt+G6BZ8+nkvxQ6LFJ24OFa8hnyM7ogig61Y6FdZkGNVhJ9H6HKlXFQQgGaDepLjLlwKSVyB7C/QMKBy87p8cp2omA0DWIzTURWKvv3x3y5NiK/j5qF4AT3JFXX4Id5UiKzyj1In19j7/Zpbx4s5O8KJ+pctFHg1/xKH0GgVSB+bXJXA2VHti82/vVomTpHQN7tgPcFX2bpHSxVkVAPLrbrC2ci5mqTqTAhgRJ+vD0QFIFTRHFDcl3fsHV5q4IyZvmzWD9Xm8hsyYesS0itrih9g0LOFTXhKcX8vTIhkH2MMgoeICI208hutLJwWTHcNCPRuux
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW8vdWhpR0J5bXJpL3BrcUN4LzdWZlZjWHJiOWRtb1dXT0ZUdEhaMkE4RXc4?=
 =?utf-8?B?d1k2bE5rQU53aUp6NTNNcVNnaGNRNk5XSzRvd1g0dWM0ZjBXcWo1Nnpld00v?=
 =?utf-8?B?RkEzWldOQkZhb1lhdVcrYithd1cvM2FkZ2N2UTFvWmRZb1NZUTBBeUZoWlB2?=
 =?utf-8?B?bU1EZE0wQkVBNW5sMkFYMXg3N0FNK3dJaC94SWJlbjNSaStkY0JLdjVyUGcw?=
 =?utf-8?B?WlZhR1NIY3YzRkhMdk1mOHo2RU9rWWFncFYxVTFpSEM2ZGtjV3Q2cVQ2Mi9i?=
 =?utf-8?B?TmFVR1QvdzVyNit1Y0xaZ0dIRWpxWXo5UzBpSjN0OGhtT1p5ZVdwbEw4c0kx?=
 =?utf-8?B?V25LY09LZyt3bVdZTEVwY0YwNmVxTndtUlIyaTFacm0raTRkcjhVUnJTVzVm?=
 =?utf-8?B?YkZhTjJhRFg2V3MyYWsxbkM5QXI0OWI1SS9nRENHNVVwZ0NOcFRROFF3U3dF?=
 =?utf-8?B?SVJWT2MyWWFCTGJ5OFdXL0JNalNpalZES0hob1pRT0MwRFgrM2gwYVFBMFVI?=
 =?utf-8?B?Y1gxRFYzQnZ1TVo2Tms2alE2M0tvRERaaWdkZG4rYThNT1dZUVpSanlSTDN6?=
 =?utf-8?B?c01VdVhWbkdmc3IvV1RhY29aS0xGYTl0amdRbE5DNG8xZ3RXcGlXdHAyTlZN?=
 =?utf-8?B?VGdEQXZVN01QUUNodTBJN1BtbUQwNzA1VDBhQ0pFMU5zejlxa1ZKMVhmTWhx?=
 =?utf-8?B?V0JVVzkwKzhPdzExQkVTV0hGMmY4d0dLTHFvanlaaG8wQzVoNVFUdkJUMDcw?=
 =?utf-8?B?bzgyVExCcGlFeDRaWW5DWmcwS05UK04yNE8xbko5M3piajNCSVJHbWxibHVW?=
 =?utf-8?B?NXNmOVM1aldwS1pjL2lrQ1VTWjN0SnBLSUNmQVhXcFptT3ZldFJ0dUNhTGxr?=
 =?utf-8?B?N01tOGFLRlduSTRlUCtrN2JDN0hwUE5aM1FLNXdTVzJlT2hpYVJITHY5T1ZE?=
 =?utf-8?B?S0pydStYY3plUUp5MWZ6QTkyZlc2SG1WOXlOVkQ2bUROSmR1cVc4UGU2Z3Bq?=
 =?utf-8?B?MU9IVEhpVlJ0VXNSeFUrY2x1Z3hiUExIUXB0V3NUZldYQU9vcTdraW9zVUx3?=
 =?utf-8?B?QzI1bmM1TXFqczh0MFltL2NlOUJ5cDJlZHR4YzVlYlZ1b2NLV0luWnBlYmtG?=
 =?utf-8?B?elZyZ29sOUZKVDFPYUQ1L3NWb0MrWU5XY2w3bFBqQ21Yb2NhWmVtQkJIV0RQ?=
 =?utf-8?B?SmlmRnlBNVRxUlVCYnl5YlY1a3FRZmdSSkE2ZmprdFVrU1RFQjNyWFV5Tm1i?=
 =?utf-8?B?UzFHT3YwTjlham53UkZwR1lqa3ZIQmorTkZVYlNoQlRVQThIazRLL1I4RkVC?=
 =?utf-8?B?Um95V0F2V1MzZnkwQVNLY2ttTHlBWHh5N25TQUFnOTd4MGJ4aXJCRXNTT3Fr?=
 =?utf-8?B?TlYyZXdnWWZKa2YxSUx2dXVmUnY3ZytXSXBZUUQ4NzIwRjd2SHYzRWRiVmNs?=
 =?utf-8?B?SjZBNllUR1FhU1lhZGpwaDQ3QXQ4ZXg5OW5PTFZRRjJibmxRYWxxSlJ4NWZq?=
 =?utf-8?B?VkxJdFFGNnluaUJEbGhpQVlxb0V1cnZXRkV0MDQxS3A2RjRFeFdybEJqYnhJ?=
 =?utf-8?B?bkwxakhtZCtIUUt5ME9WWS9uQ3BHOVFkb0dWWit6MHNGYUR1Y3FOUDRyU1cv?=
 =?utf-8?B?T3NJNjBhMlNXY2hSclJFUng4R0d3VTBoRVlPVDdkeW5aT2lOVU5mSkY1RVpO?=
 =?utf-8?B?RHRqcDBiNDBSWENYQ21Wb2cxdDI1MWRpMS9XZm9kWWg3RzdyV3dNZEJsa0RI?=
 =?utf-8?B?Rjh6cXptaW14MG1uOFpDQWlKMFF5T2pDeXRxMWZyTk0rMWRWVWlpUDMwaDJ2?=
 =?utf-8?B?d1BFQlltMnh2ZFNCOUhGWWxnWWVtUkZpMGQrZnRrZWw0SGhhRlF1Y1ZNQkkz?=
 =?utf-8?B?cFNTTzZBU2UvM2FkVWZQdGFHRnp1V1g2RE5hbXpuTXNvVk9uWW9pNi9kbEc0?=
 =?utf-8?B?eTEvVHhCSnJwdzBTcWtZZkVZMDZZYnJlV0Y3cFpGa2NMSUxQVVg4ZEdsNGQ0?=
 =?utf-8?B?S21ZVmowMDJKd05uTkVDUmgyanoxTTVyVWg3QlVIUjljQUdBSnl0eEpDTkdV?=
 =?utf-8?B?bHBlWTJlbHFLZDE4NnpWZmpTaU9hU0F1V1BtT1J6RHhMdGUvTWRUaTYwd0or?=
 =?utf-8?B?V1RibjZtZFFTZlJnTkdZbi9FRWtpdWVZL1Rja1ZGQjBUcGt0S0dzZWpPRnR2?=
 =?utf-8?B?dUxTVFpJbzVRamNDTTBUQmY5WDBWUUJQODZRRitmVnFad2NQYklCUnE4SnFy?=
 =?utf-8?B?YlZwcGYzTVg1SFVLcjBnYU8wNTlqQmN4TUxYNVJQbmF4Z2s1VTI4SnVNRHU0?=
 =?utf-8?B?NDlsSkt2VG5WNjJvQzVVOWU0emk5clJJUG9SMTFaeDRFYy9NZ200dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1b4960-d23e-42af-eec2-08dec78d3c52
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:44:15.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOQpzKrlnj3vJ1VbzBLxnQBUlNbe0z7HT4vHECZjkGMA3TfamESFSaH9+1nmvG7GkOhgTc9j1khkfGcR33k18w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7438
X-purgate-ID: tlsNG-42698a/1781163859-1815DF3B-95D38174/0/0
X-purgate-type: clean
X-purgate-size: 9588
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,valinux.co.jp:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04A3F66F815

On Wed, Jun 10, 2026 at 04:41:10PM +0100, Andrew Cooper wrote:
> Adjust kexec and kimage to more closely adhere to Xen style.
> 
> Sort the includes, dropping duplicates (kexec.h) and unused (ctype.h and
> kernel.h).
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I've made some further suggestions below.

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Kevin Lampis <kevin.lampis@citrix.com>
> 
> Fix these before they get copied around in the EFI changes.
> ---
>  xen/common/kexec.c  | 94 +++++++++++++++++++++++++--------------------
>  xen/common/kimage.c | 23 ++++++-----
>  2 files changed, 64 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index 65776a95fd70..9ff22e43991c 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -6,31 +6,33 @@
>   * - Magnus Damm <magnus@valinux.co.jp>
>   */
>  
> -#include <xen/init.h>
> -#include <xen/lib.h>
>  #include <xen/acpi.h>
> -#include <xen/ctype.h>
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/cpumask.h>
>  #include <xen/elfcore.h>
>  #include <xen/errno.h>
>  #include <xen/guest_access.h>
> -#include <xen/param.h>
> -#include <xen/watchdog.h>
> -#include <xen/sched.h>
> -#include <xen/types.h>
>  #include <xen/hypercall.h>
> +#include <xen/init.h>
>  #include <xen/kexec.h>
>  #include <xen/keyhandler.h>
> -#include <public/kexec.h>
> -#include <xen/cpumask.h>
> -#include <asm/atomic.h>
> +#include <xen/kimage.h>
> +#include <xen/lib.h>
> +#include <xen/param.h>
> +#include <xen/sched.h>
>  #include <xen/spinlock.h>
> +#include <xen/types.h>
>  #include <xen/version.h>
> -#include <xen/console.h>
> -#include <xen/kexec.h>
> -#include <xen/kimage.h>
> -#include <public/elfnote.h>
> +#include <xen/watchdog.h>
> +
> +#include <asm/atomic.h>
> +
>  #include <xsm/xsm.h>
> -#include <xen/cpu.h>
> +
> +#include <public/elfnote.h>
> +#include <public/kexec.h>
> +
>  #ifdef CONFIG_COMPAT
>  #include <compat/kexec.h>
>  #endif
> @@ -162,6 +164,7 @@ static int __init cf_check parse_crashkernel(const char *str)
>  
>              ++idx;
>          } while ( *str == ',' );
> +
>          if ( idx < ARRAY_SIZE(ranges) )
>              ranges[idx].size = 0;
>      }
> @@ -317,7 +320,7 @@ void kexec_crash_save_cpu(void)
>      ELF_Prstatus *prstatus;
>      crash_xen_core_t *xencore;
>  
> -    BUG_ON ( ! crash_notes );
> +    BUG_ON(!crash_notes);
>  
>      if ( cpumask_test_and_set_cpu(cpu, &crash_saved_cpus) )
>          return;
> @@ -418,6 +421,7 @@ static void cf_check do_crashdump_trigger(unsigned char key)
>  static void setup_note(Elf_Note *n, const char *name, int type, int descsz)
>  {
>      int l = strlen(name) + 1;
> +
>      strlcpy(ELFNOTE_NAME(n), name, l);
>      n->namesz = l;
>      n->descsz = descsz;
> @@ -427,7 +431,7 @@ static void setup_note(Elf_Note *n, const char *name, int type, int descsz)
>  static size_t sizeof_note(const char *name, int descsz)
>  {
>      return (sizeof(Elf_Note) +
> -            ELFNOTE_ALIGN(strlen(name)+1) +
> +            ELFNOTE_ALIGN(strlen(name) + 1) +
>              ELFNOTE_ALIGN(descsz));
>  }
>  
> @@ -439,7 +443,7 @@ static size_t sizeof_cpu_notes(const unsigned long cpu)
>          + sizeof_note("Xen", sizeof(crash_xen_core_t));
>  
>      /* CPU0 also presents the crash_xen_info note. */
> -    if ( ! cpu )
> +    if ( !cpu )
>          bytes = bytes +
>              sizeof_note("Xen", sizeof(crash_xen_info_t));
>  
> @@ -450,24 +454,27 @@ static size_t sizeof_cpu_notes(const unsigned long cpu)
>   * crash heap if the user has requested that crash notes be allocated
>   * in lower memory.  There is currently no case where the crash notes
>   * should be free()'d. */
> -static void * alloc_from_crash_heap(const size_t bytes)
> +static void *alloc_from_crash_heap(const size_t bytes)
>  {
> -    void * ret;
> +    void *ret;
> +
>      if ( crash_heap_current + bytes > crash_heap_end )
>          return NULL;
> -    ret = (void*)crash_heap_current;
> +
> +    ret = crash_heap_current;
>      crash_heap_current += bytes;
> +
>      return ret;
>  }
>  
>  /* Allocate a crash note buffer for a newly onlined cpu. */
>  static int kexec_init_cpu_notes(const unsigned long cpu)
>  {
> -    Elf_Note * note = NULL;
> +    Elf_Note *note = NULL;
>      int ret = 0;
>      int nr_bytes = 0;
>  
> -    BUG_ON( cpu >= nr_cpu_ids || ! crash_notes );
> +    BUG_ON(cpu >= nr_cpu_ids || !crash_notes);
>  
>      /* If already allocated, nothing to do. */
>      if ( crash_notes[cpu].start )
> @@ -505,7 +512,7 @@ static int kexec_init_cpu_notes(const unsigned long cpu)
>  
>          /* If the allocation failed, and another CPU did not beat us, give
>           * up with ENOMEM. */
> -        if ( ! note )
> +        if ( !note )
>              ret = -ENOMEM;
>          /* else all is good so lets set up the notes. */
>          else
> @@ -518,7 +525,7 @@ static int kexec_init_cpu_notes(const unsigned long cpu)
>              setup_note(note, "Xen", XEN_ELFNOTE_CRASH_REGS,
>                         sizeof(crash_xen_core_t));
>  
> -            if ( ! cpu )
> +            if ( !cpu )
>              {
>                  /* Set up Xen Crash Info note. */
>                  xen_crash_note = note = ELFNOTE_NEXT(note);
> @@ -548,8 +555,6 @@ static int cf_check cpu_callback(
>           * fail the CPU_UP_PREPARE */
>          kexec_init_cpu_notes(cpu);
>          break;
> -    default:
> -        break;
>      }

A newline here might be nice also.

>      return NOTIFY_DONE;
>  }
> @@ -592,7 +597,7 @@ static int __init cf_check kexec_init(void)
>              get_order_from_bytes(crash_heap_size),
>              MEMF_bits(crashinfo_maxaddr_bits) );
>  
> -        if ( ! crash_heap_current )
> +        if ( !crash_heap_current )
>              return -ENOMEM;
>  
>          memset(crash_heap_current, 0, crash_heap_size);
> @@ -604,7 +609,7 @@ static int __init cf_check kexec_init(void)
>         Only the individual CPU crash notes themselves must be allocated
>         in lower memory if requested. */
>      crash_notes = xzalloc_array(crash_note_range_t, nr_cpu_ids);
> -    if ( ! crash_notes )
> +    if ( !crash_notes )
>          return -ENOMEM;
>  
>      register_keyhandler('C', do_crashdump_trigger, "trigger a crashdump", 0);
> @@ -620,7 +625,8 @@ presmp_initcall(kexec_init);
>  
>  static int kexec_get_reserve(xen_kexec_range_t *range)
>  {
> -    if ( kexec_crash_area.size > 0 && kexec_crash_area.start > 0) {
> +    if ( kexec_crash_area.size > 0 && kexec_crash_area.start > 0 )
> +    {
>          range->start = kexec_crash_area.start;
>          range->size = kexec_crash_area.size;
>      }
> @@ -636,7 +642,7 @@ static int kexec_get_cpu(xen_kexec_range_t *range)
>      if ( nr < 0 || nr >= nr_cpu_ids )
>          return -ERANGE;
>  
> -    if ( ! crash_notes )
> +    if ( !crash_notes )
>          return -EINVAL;
>  
>      /* Try once again to allocate room for the crash notes.  It is just possible
> @@ -726,7 +732,7 @@ static int kexec_get_range_compat(XEN_GUEST_HANDLE_PARAM(void) uarg)
>      {
>          XLAT_kexec_range(&compat_range, &range);
>          if ( unlikely(__copy_to_guest(uarg, &compat_range, 1)) )
> -             ret = -EFAULT;
> +            ret = -EFAULT;
>      }
>  
>      return ret;
> @@ -760,7 +766,7 @@ void vmcoreinfo_append_str(const char *fmt, ...)
>      int r;
>      size_t note_size = sizeof(Elf_Note) + ELFNOTE_ALIGN(strlen(VMCOREINFO_NOTE_NAME) + 1);
>  
> -    if (vmcoreinfo_size + note_size + sizeof(buf) > VMCOREINFO_BYTES)
> +    if ( vmcoreinfo_size + note_size + sizeof(buf) > VMCOREINFO_BYTES )
>          return;
>  
>      va_start(args, fmt);
> @@ -776,7 +782,7 @@ static void crash_save_vmcoreinfo(void)
>  {
>      size_t data_size;
>  
> -    if (vmcoreinfo_size > 0)    /* already saved */
> +    if ( vmcoreinfo_size > 0 )    /* already saved */

I would maybe move the comment so it's in its own line ahead of the
return statement.

>          return;
>  
>      data_size = VMCOREINFO_BYTES - (sizeof(Elf_Note) + ELFNOTE_ALIGN(strlen(VMCOREINFO_NOTE_NAME) + 1));
> @@ -835,7 +841,7 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) uarg)
>      if ( !test_bit(base + pos, &kexec_flags) )
>          return -ENOENT;
>  
> -    switch (exec.type)
> +    switch ( exec.type )
>      {
>      case KEXEC_TYPE_DEFAULT:
>          image = kexec_image[base + pos];

Maybe also add a newline after the break in the switch here?

> @@ -917,8 +923,8 @@ static int kexec_segments_add_segment(unsigned int *nr_segments,
>      unsigned int n = *nr_segments;
>  
>      /* Need a new segment? */
> -    if ( n == 0
> -         || segments[n-1].dest_maddr + segments[n-1].dest_size != maddr )
> +    if ( n == 0 ||

For consistency with the rest of the code in the file, since you are
also modifying the line possibly use !n?

> +         segments[n-1].dest_maddr + segments[n-1].dest_size != maddr )

Spaces between operator and operands?

Thanks, Roger.

