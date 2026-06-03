Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m9PWKS/yH2o5tAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:21:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E436361BB
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:21:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Y42s7gzz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325941.1591308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhn9-00023S-NZ; Wed, 03 Jun 2026 09:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325941.1591308; Wed, 03 Jun 2026 09:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhn9-00021j-Kt; Wed, 03 Jun 2026 09:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1325941;
 Wed, 03 Jun 2026 09:21:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUhn8-00021d-8N
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhn7-00EpZS-9H
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:21:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ff20e-e002-0a2a0a5209dd-0a2a4503d092-42
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:21:37 +0200
Received: from [52.101.85.35]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ff21e-672d-0a2a45030019-346555234e9a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:21:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV1PR03MB989681.namprd03.prod.outlook.com (2603:10b6:408:3bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:21:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:21:32 +0000
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
 b=foQpDLQgEuqOW6CmwC3FTK5212ZHeHlIbbiji1FZBB1cEzv/+4lvVDpk52Ep2jqK40Wr0VRin1rvoVaKzXQs7Du78MluSTH3vgDGaQyR98M7k5b1t16O+Wnj2zSY6xQFAIcyiJD/2vLWQ6IJ3g3PZpKEj74yLqxCkVNvpRWoyIX+R21b/eZ0qP+IZ3oeYmMIJbSDR9iJLZnfo/+FTTvmDD4/R2Gpgm1ReEZ1nKrqQ6G2LOiKGs+4n9zQK40D5wEOrLt5KmG+XVDzR7RSKT+Farlw1PSiHDrdnsgjIRV5cKocjTBteIXQGQMqL1tjC0N1MtqErjLtBaJ2g9P3U8niXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stYXFMbQ6OzNHOJ/4Q+gxZcbpi3ZxBWa1zGWYSMV52U=;
 b=NabSRDVM50DUBqoUQkP4PTM0nX9QvE5+YD6w8UmQyb5oZtzZoNiXSJk/wwmZXGXHi2ES7ZBoEQjLZMCWgWgwDb2QlfX3aiOs0IsfUICgZ7YgvRADAdvvpVlZj7JFQouKlAhgD0Wwj/DuHpZrz3g3rKJWqw5P6DWGuYAnBDU/Jb4xVgiphy5TG3Ubti8Sn20a3TMtudzCnGmh8xXOPHwyWdy8HUso/SLHx8OLsQ46IuY6drUoDhxpS1Wm3qVBs/yPxHZ6TGo24Af72zn4R9RLxZSC1ni7Qa4mIKFKUhW4Z+YR1mYkXYt34Eup7qe57sNJQXa7IkZiCRqE1rSpnOkPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stYXFMbQ6OzNHOJ/4Q+gxZcbpi3ZxBWa1zGWYSMV52U=;
 b=Y42s7gzzgvPSpRD+Kt5sM/P8YeMDY/su39DVbQv9lLd9BOrymOwBcj1dO+sfV+xmwRFbYMI1gNXdLZWNXjJGp6Sn/vtj2tXtdGnhUxkAgTDFRguLjniEl0XBMicNjFh+SXeKnHvliRIidhiHinRV3B96DHSfJ69X0Nqc0+Vk+kM=
Message-ID: <3641d161-70fd-4807-a1f8-689f0295c579@citrix.com>
Date: Wed, 3 Jun 2026 10:21:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
To: Jan Beulich <jbeulich@suse.com>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0199.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV1PR03MB989681:EE_
X-MS-Office365-Filtering-Correlation-Id: 442b6abd-c647-45cb-822b-08dec15180a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fyaQt0OkIn2BW8miBejFpusO1oKfFWZxDuoxDgBbp6rGd4yvP6BfaYklTZCu2yBLRCc3RpySkB8B/EeeAcHqLgWx6GqXnqdnAPpaenIN3aGVxAFEpuCXVfMm3i5qcQrZ6zYvu8D0/2ifPifLn7SudRCnBVhXY0LicXmGH7zHFtfApkljFkzOuQAbFxV0/MLmfG51JUYlaC1mQ2CDIoNgRiTBMaZB0Jgpzl1MhEPdaVgjnykOgbClFP5wcIeODog7vBtnAAnoazVH0tTwMCXaV/BN6Dr3Tp/TKqyfeqZMY3hvr11jYKHsPxMi3nrYeMqpcbvfefL7DdxT6IAG7GZI3Rg45laj3j4Guk8Z7ODCN5ifVnkV37milCf2Gg0MBy5Z1kdBZdQUkXyPaojpnYT/+vYAhE0WICoCU7ZlSdCGWD5HdHgbE6T8w+j4DSiY3fel9yceTANIWqMWvDZktgIV5I7pQDi5pgVrfLsWxaOtiwhOtdgN61qvzopVsHwDNwQulgFzuBLmAZVaM8hezrJR6Vd/L8Ux6JKRUe6NIDs3Xx/0OIK/j5UplMaJpyzuIr2MsZKKhLaTmBviKO/2w7RKLS610pf6Pg+WpfM+C01zTZwEF5SzWbRqWxQPpp422k95Ka45dox/kjRheEsW72B4wwzEcCi/ustQV2kMFUmNFbn1dGiA+unGfi6Eqlzq1ipw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy8rYVV4elVWSFlxQStnQXBleUEyQldWdmZLTzVOTytBaUF5bXJMcG9TbkVr?=
 =?utf-8?B?b25BWHpxQ2tCeXkyak5SRUcwd3UxbVRKbFlNNytFQ05FRXhQYmNMN3pINjVt?=
 =?utf-8?B?b1kxTE4xSTZqblBiN0JIUERvcmpMSzBISE83YW5zRHp1RmR5VlpHSC83RFpE?=
 =?utf-8?B?QkFuZ2hsS3Zxc0RVVGdRQWpyc2NxRnNuOXlnN2c1cVIwV2J0TkNrUFhsaUpy?=
 =?utf-8?B?dmN6QkVNOXBYN0oxeXg1NmhnNkthU1I4VWEvUjFPRUpVdEVWeTBBMGQ3V2Rk?=
 =?utf-8?B?VWJ3LzdJUnczMzUzaGpvZDMxUzZsd3hWZ0hJYkt1SiszWjZzeWhkUWw5ajJM?=
 =?utf-8?B?aUNsbWI1Vy9wVTlFUVNDN2NYckF2enc4MFJvYkZxVHlUTFZUeGExOUE2MGYr?=
 =?utf-8?B?U0tCMjQ5UkI2S1FLbkhGc1Jmd0NNdEJrYXdLVVhYRzFiVDlhcy9BbXRNQk1p?=
 =?utf-8?B?cXp3OXQrWU5pYUlzdFp5Qk5qM1FHTFYwMGdKZlUxQjRvbG1ybENyTHM2M0Ew?=
 =?utf-8?B?RU41aWtZMW55Wk1nR3hCOVVzNWJzTjVUcjVSZ0xLb09SKzQ2ZUx3YWJmV21S?=
 =?utf-8?B?WHFlODJLbWE2cU1PaVY3dU41MDVjUzU2c0I1V2lUQ1hGaFVJN3dJTFo3T3Ny?=
 =?utf-8?B?Uy9xOTBVVzlTQnhhRURVWkdlcjE2THUxRlRRNFJqdWdObFZOZHlKVXdTVkx1?=
 =?utf-8?B?VlFHOUo3cGFVK2k2RzJvdHlBS2N4WnNGdlVIVGppWjNMODZaZWs4Y0Fua2d5?=
 =?utf-8?B?US9vWnM2Sk1rOGgzWTBxR3VIRitiZW0rdGxEZTFKdmxYOVRDVVVLcFR1NEg2?=
 =?utf-8?B?VVFnbDJBd3dKaS9YbTNBUmZSTjMyYzRrUVE2TjRWTVNhNmExdUV6RXNlenBz?=
 =?utf-8?B?YlNkSUYweU9sdi9XNWxrTHowVVFwMjl5dXR3NGU0d24wbUR2UE1NWkNZdWZB?=
 =?utf-8?B?anIwelpvcXdCalUreGszSVFJekFGUFF6V1BLYTBXVGFkL3paQTlYbVFGOVlM?=
 =?utf-8?B?dGNZb3d1Nm9hSEhsbTNPUFZ4NEh3QW51eEtMZkpXbDc5RTNvV29iVm14Mkcr?=
 =?utf-8?B?R2hUS0had3lVTk11ZmZzMDhsUkZodWlLRXRsVVVIOU9tK1RwdUc1QlBCdncw?=
 =?utf-8?B?SGRHVXJlSXI1cnNUWHg3UWNyVG1BbnBCZUh1VXhHZnVxaC9yMGhGMXYvYzZp?=
 =?utf-8?B?eUxhaE1EaXVHcklPRDFVVzlsMEx0RUs5UkYzamtBK3hYbnVSOTBtWlRRSUJK?=
 =?utf-8?B?RVkwSWtpM2xWRUh1S1ZaYkhzVWdxbE5Cck82OUVUSjVaSFVzNnJ4OHQ4eno3?=
 =?utf-8?B?Vk92Nis3S2YyYS9ZTlQ4bGlsOHJhaXduOVpXL25iQlo2cVQzZW1kbTJRWHdU?=
 =?utf-8?B?bmNGSlh4cE14T1RmQmlCU0pZVk9lMERKQjBpeGJhNjNORlZQenJWeDNvOGla?=
 =?utf-8?B?bzI4NkZPNWYrWjFRS3dtbk8rbTJpcHJxTzdrVlNmZXo3NVcrakRLQ0dQVk1z?=
 =?utf-8?B?TkpTK1F6T3h0bGtmN0lBdDRlRE4rRFVwTGtXOWhYajlWRlU5RVJrTUFwcHpQ?=
 =?utf-8?B?VWl0OGdXdTRkSTJkUlA4R3lGZFovalJ0NGxhL0pRbVM1V2hJdnoyWmJmQkV0?=
 =?utf-8?B?SWlMV3krSmpqbFY2WkEvaVVYeFAwT0RiVWVCVjZBZUppS0hiNnBSZmRzeFBL?=
 =?utf-8?B?R0lxMkFpdDk5U3NaVk14MHhlRS9uMkpWdjk2Z25XUHN0dFFOWnZlS05WS2Fl?=
 =?utf-8?B?VVJ5dWlJcXJBeGVKWEw4emdaMVFmdGRzeHJiVFNIQ0g1Vkkwd3I3ZFExM045?=
 =?utf-8?B?cmM0YjZjT1UrSy9RU3QzY0o2NDZrWFRORzVXQUhpWjUyejhmSkJZYWtDcWxI?=
 =?utf-8?B?eWh6eWZzL1V4Mm54elpkZnpRb3Jsb2JQQ2pnWStGTWxGV2tNcnlZRHZCNDdh?=
 =?utf-8?B?cWc4VHZ1S1h4M2puTGNJcFZrNWJLSEhNNkt5d0NwSEpwTDZWNXl0eTlobVZv?=
 =?utf-8?B?V3BWY0tZYmxuS0RhSFN3RHB0SDFzU290emd3RzZqSUZZdFN4QUhsUHJNMDdU?=
 =?utf-8?B?S21CalFQV1IvaEc0Um9pVXNoZDJIOWVIMjcxVUx2SmNFNGtYellxMitMcTFs?=
 =?utf-8?B?TmZ1S3NZS2NLWU9LSXNwUGh5UnNHdWZCR1JQRnRxc3NxaXBhNERZMW14Q1dM?=
 =?utf-8?B?UEVhQVovU2NOWjNzNHgxT0pFOFVmNEtvSk8xYThYS2NBZlRDQ1h5MFNMS2Nw?=
 =?utf-8?B?QUUrY1ZBV0VhS0VqNHEycjI4dmM5NThoaTZOQ1luanRWWW9vWkJ2R1ZkMjRY?=
 =?utf-8?B?Q0xGZlErdUo3TzBLUWVZMXhHbkEvZy8zWUY2SUdNeHBWRHVOUXhwR0VqNHdx?=
 =?utf-8?Q?ycln3wE+9u5gQ87M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442b6abd-c647-45cb-822b-08dec15180a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:21:32.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5tLpmXFCTQ2WRmRrO5wJkuuVFZsP2Bi9pxs3kJ1Cxjkzjle742+VvCwhavZGfpEQal9jqpgyKOztUaoIF42/TaWO+/HmQm1kqcUV+AP0+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989681
X-purgate-ID: tlsNG-33051d/1780478497-3A567938-624C486B/0/0
X-purgate-type: clean
X-purgate-size: 972
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,gmail.com,lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11E436361BB

On 03/06/2026 10:16 am, Jan Beulich wrote:
> On 03.06.2026 10:53, Andrew Cooper wrote:
>> Switch to using the system liblz4.
>>
>> This brings libxenguest's lz4 decompression in line all the others, rather
>> than using the unsafe decompressor from Xen (itself a port of Linux's unsafe
>> decompressor).
> As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"), there was
> no shared library available at the time (and on the SLES versions I worked
> with). Later a shared library appeared, but the -devel package still wasn't
> there. On my main dev system (intentionally a relatively old SLES version) I
> therefore wouldn't be able to build/test LZ4 anymore if we went this route.
> (FTAOD this isn't an outright objection, as the goal of the series is
> certainly good. It is mainly a data point to consider.)

That was 13 years ago.  Are you saying that there's still an in-support
version of SLES which doesn't have liblz4 ?

~Andrew

