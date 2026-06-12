Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AF20BTjCK2oDEgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 10:24:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A731677C89
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 10:24:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=FcTIFQbo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336403.1598173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXxAg-0000ck-Qr; Fri, 12 Jun 2026 08:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336403.1598173; Fri, 12 Jun 2026 08:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXxAg-0000aG-Nz; Fri, 12 Jun 2026 08:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1336403;
 Fri, 12 Jun 2026 08:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXxAf-0000a9-VD
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 08:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXxAd-004nzE-OO
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:23:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bc1f1-e002-0a2a0a5209dd-0a2a450cbe8a-14
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 10:23:19 +0200
Received: from [52.101.48.39]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bc1f5-62f1-0a2a450c0019-34653027b660-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 10:23:19 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB7126.namprd03.prod.outlook.com (2603:10b6:a03:4e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 08:23:16 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 08:23:16 +0000
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
 b=NEbbYP9to4zTw3wftHZ7mYHHMVXVh0V99Bs+SZoqrgJamCYkVUzR44Dqlkhknx+sUUm4SAos2yBo6ydRNX4Mv2vYR9QA9ZEbTk+8P/IlKXSI5VamPFdKN0uyw95z2qBee9c+Nxd44cKlXxDPss74P0Z71fxroS77v9bPSKclAYdI+hFv4Lzq0E86SDDHIx8zE8wKdyTWS3tLp5DGsThUW4BcWAD8w9ATDT7JKaUo6pxbniWcCrf1MhRSZ8igPZOFp1Qlncb9g20E3dYxQwtwBWJfNLAYhre750Z7oLnVjVZTZ1FTBNaYYUGhaxeGXZ6OQCDAwZrwOX08oNAmSfuTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgoc7mQGRwQ9DHVuyUCgB8OO7E0dQMwM63Ze4e6CDNw=;
 b=I9O7a3S+mkOjRkS933LIRH39KTvuMfHmgetIbBL73b7JtMf/JQ2eF88Y66mQS8cLgh5PLVLPWLxkMV70EWxiuvMIY0Et8yuVLzh9Ow7v1E5/eYpei9q2qNESjGjunOEMzTlO1P+baIUMZ9DvSK7ZdupBDh5P4ycQXo8J+lZ7vLf6D/m+ppDnwDI6eDGJ5PRnD/TgrVOlSb1mPwae/FSWZ3KE6R70zhQR7yZffIC1ovamHFhKxmYJdvCk4fE7YiWRlXu2Txkb4F4wyY9TV9NNt9amuvv42gWINGGwKjA22mOyjLZzr4/9sle2XelsLlWketJZ19iLE4rAHB1itYA3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgoc7mQGRwQ9DHVuyUCgB8OO7E0dQMwM63Ze4e6CDNw=;
 b=FcTIFQbozZgXc8Yk2l+9nv5cYD7tZJOnji7Mw1+VdIaQv8zFSLRfFqzzjO1fLJk2LduxI9FWZ3TJFYbryzB0YzzcEK8HBlS9fgWOWiu3W1MT0LD2Rvd+JoB5tKDpBEEJ/KgDuRtlZUHX0SOb4F/fm0N2oUBPsO5q5uatpelLcBE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleskii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v3] xen/x86: Change stub page allocation/free
Date: Fri, 12 Jun 2026 10:22:13 +0200
Message-ID: <20260612082213.82235-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df52623-f89a-4633-24b2-08dec85bd9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ro4xnxPQ6EJ/7J6Wy8WKHdsAfLs6KckZU5JQBr43YX2JDBeiD2o5ypoQDpTe5AZ3tgNTbG1iXjuUTzIcRY+0I0PGWezR6Sf/+hhyIk2jCJpEJRwxpGCWuq6jE78yt0+0ZEbgGzhWo1yyESDiUSOiWzxcL+iJA+FjL5b/gumgvs6aFtN54n0JchcorKHpVn5tI4jn4dyZCZ7/e7OxwSufQgtLflO1xiogyBH/uzsBEdwLvr/E4YHA2oP7jiBb/3zCpNOej2C0+qLEWpgL/zRE7QcDonMfnDsXsl6aBd8EIZmoNolqO/E8oXHSi7sPK/gtrBsf0eteve9UQaDTnlOZO4EhAvRoTBHx/c0IgoDopOk8AjlcXMz8klkW6Xnp/e2ugwxbASYLnJb0Sw+y37PTv46EZyeD6gQJAlLKnJz18A8jeuMRWyPSZ5oXXa55lk77shBQmS/O6aYglTkCLo47U3LIBF4LTT+0vs/FZTt8JNPSEeZKbUQ9p/enEQNhay9yuCr+6jb3ldBRNjwgNsJT/EGdvU1xzOmmeU+1UMrffXnzZapFChq+UyBr5SrIBH4n7TBT3mMP6Kd/A5Qx2cQNekCzQlyuItXPqYsQsqdoVtUDAnr9FotCuNH1eCA4MwK3WhaV47L/8pINrMLeIOqaKFRfqYCbC8BcNjnw89J9QByClbJdkCyK/HdD11d1t/TJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUtVaTQzL1NZZm1HSjVhUzRLdVU5N2NyQ3E5emxhckVUWkxoSGIrcHBQOFNq?=
 =?utf-8?B?NVA3SjlRODVrLzA0UVVGNGdlNzlEQzAveENCb1FmQjFXZy80UTVNN0wxeUdK?=
 =?utf-8?B?Z3JJM2hsN2tCaTVuV2htTmY4WndTTEFZTmhzY0t1QkNMT1Bybk56ZUZxTHZU?=
 =?utf-8?B?bUgxeU5sZEY2MTU0RmNQbjk1QXk5Yy9jemwweG9jZ3BKdFV4dkMrblV2YkNY?=
 =?utf-8?B?dEJSL3FBTWNHNGMxL1k2eVFYUUhMREZ4cmx5RmdUV21RaCt0U3MzQWVQQUhQ?=
 =?utf-8?B?dU43T1F5aEwxNG8zR0ZER1hmN2srM3VjYUM4Q29haWg5cXNtVmprYXhhZzRy?=
 =?utf-8?B?UmdHT1UrQ09uMHhZVnRWR1REaE5FMUxOelVveGlzMU1sWUw1NVF3ZEpoYjk3?=
 =?utf-8?B?cHhlMDJrZ0VnNDk2eTFlWitDcGNTZVh5RFNkQ1dXbjkwRjE0eVZ5dld4M1Jh?=
 =?utf-8?B?clZmZzl3aCtBZ3FZbUhUTlluQ1AzbkJxRWxQWjQvUFNyTkx4NjltWGpwbnFl?=
 =?utf-8?B?UGpsVHlqTk95NVVKTmlaUks5dG4xVTg2dmNNQXc3c2xnUHRlOUZ2UVZqbkhW?=
 =?utf-8?B?eXhTdENGdnRpZitLV1lRRXluNHF5dXMvNmE5ODgvaEd4cWE4YWJKM1c0V3I2?=
 =?utf-8?B?bHVGN1FKeVM3aGh3clhYd3RhSnUraWVzOTR6V1RpeUFINmJVaFNUUXBQZUxH?=
 =?utf-8?B?ZkQwbHVBVFJGN3lma0ZndHY3WWZXYkZ1OG9BRjdkcTNzUWZQelBpVEFRdG0w?=
 =?utf-8?B?WGo3Ym5zNWtCZVJoUVlVNkwxckdQOXZjNUE1cmJ3WnlTbzZaUnBJNmtvZytT?=
 =?utf-8?B?K1RUQnc3YlpvL0E5SXpQT3BJcW5DZnAvaGJNd2k0RXhISGtId1JPM3Z3ZHNi?=
 =?utf-8?B?aWxsT0Uxc3dKdmdiTExVZnhNRG5kWllHeUFWdVZJb0dRQmdOd0RwV2c1aFY4?=
 =?utf-8?B?cW9RSkovanFoYXdpUTk1dFl6RjBybi93MkR4bWE4aTR1dng2dDl1UUNKV2JL?=
 =?utf-8?B?NXgzTkR6dUVtUUZISTIxeHFwdXNBTUJPa1QxbFNUSEhVZUxTRUdPb0hucVBN?=
 =?utf-8?B?cG1ORzFRMEk4QWNjZmpBaWdLMEpHb1BDMyt0SE5yMk51MGpXR3VGS3RjZ21Q?=
 =?utf-8?B?dnhDYkNxWlBXQ05paXNidVpTY005MDV2aWJsRGljbGZTUlhub0syaGVpakUx?=
 =?utf-8?B?VElDcGJnODNUaTdYeENhTUNsRnA2YUMxQVNleFNqMVMvR0xGcHhUbGcxdWhy?=
 =?utf-8?B?VEJlUCtPSUhLU21pOGhkbVdCUGppa2t2NVlETXAySHMwNWwrZ0prZVdaczdP?=
 =?utf-8?B?S0F6dkFiaDdGT0xlL3hCSllzN05rNmMydnpkZlY2Y0NxRWViT2RPWXNMK1FY?=
 =?utf-8?B?MWNETjJ1aW9kY2xWSWs3MC8wajdrVERpZW5UYklzQjBMZHpraWxkVFZoN2pu?=
 =?utf-8?B?U0YyMFNXRWJtVGIxdDdSeTEzTnc5bHdlMkJ1TGJGQVpsMFRMKzhBdWNTQ0RG?=
 =?utf-8?B?M0xzS3h3OFlyeG44ZDNYV3J4dGRkb0l4RURzNndlR2htQ01DS0FwdW5JYkM2?=
 =?utf-8?B?aXRrT2FzZGdDMHFydzJEL1FOWnFYSzE4VkFHY3c4OGgrNDZ6R1I0Q0xFeHpZ?=
 =?utf-8?B?ZHZYZGcwSThaL0ZraTdudWhGZzlJV0prRzhWbkhwQW1EOUd4K1BMcm1mRy91?=
 =?utf-8?B?eTBEMnN5Q29KdHBjQlN6LzNNOUZ2eWtqZjI1ajJzYkxMSVZ5dXFWVHFYem8x?=
 =?utf-8?B?U2poWnhkZ0VLRHl0VjNhTGhYWmV1eW9oTnJwdWlCQXhLelNWY1NDZm5lUHk0?=
 =?utf-8?B?QXZPdGNiOTZHTjBZSEd1aEhtN29YZXRKMzlKWDVEb1ZPQUhpL1o2Qjh0cjVK?=
 =?utf-8?B?TDMvRk4wYmh3Z0hONXZZSVN0R3pUYmt5QVVIVTZINk5Cb0xtZWl2U3lzVEU4?=
 =?utf-8?B?UVlDaVNDZ3JHWmZva1lkYisrNGZsM3l1QlZkSEtjZEMxb2k5cldXNGRycitF?=
 =?utf-8?B?L1pHMjA4T1FqWjcyY2o3Um4yQUppbkxpNmNMUEF2Wnlvcjd2VnB3V1VTNTcw?=
 =?utf-8?B?MDlYZHlLeUZ1OGhDYmlUZFA2akpzT2prbEY3dUJ0MFhEakI3dDNURWZGNVRz?=
 =?utf-8?B?Z3NRc1FIWVV6bzJIV1pIZEloQVFpUUFOakUrSG5HdzlDcmJoc3pKOWFtaVBu?=
 =?utf-8?B?UkF0UFZYSmduNlY2VEdQMHUxRSttcXZ5Q0R4WUJ5UzhmTGNtUnlPQVl2QUN3?=
 =?utf-8?B?WXh6aG1MLzNUMDdtaVJ2a0ZOZWI1RFkweXdBOEk4QW9lejVFSkZHOVdxd1JL?=
 =?utf-8?B?Wld3bDhUbWJrbjJ0akxVaHpsRkZyT2E3QnduVVJCLzRNaVZjK3lXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df52623-f89a-4633-24b2-08dec85bd9f5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:23:15.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dwh5cz3uh1wPtufJHEsRN+gYDXap4lI2GlAXauFZSfVx0hTuIx5D06su0sXJQ0sPm9/UALuXflxjOBmbcZAYSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7126
X-purgate-ID: tlsNG-d25034/1781252599-DBB7CCF5-DC37D84B/0/0
X-purgate-type: clean
X-purgate-size: 8160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,suse.com,citrix.com,vates.tech];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleskii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,m:oleskiikurochko@gmail.com,s:lists@lfdr.de];
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
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A731677C89

From: Jason Andryuk <jason.andryuk@amd.com>

Today the inline tracking of the stub page is problematic.  0xcc is used to
indicate unused, but it is also a "clear value."  A !CONFIG_PV build or
when running with FRED support will not populate the LSTAR/CSTAR stubs at
CPU bringup.  If a CPU is then offlined, the stubs page will be freed as
its content will be all 0xcc, regardless of the stubs page still begin
referenced by other CPUs.

The new approach uses a global, CPU-indexed dynamically allocated array of
stub addresses.  However, to handle NUMA aware allocations, we cannot
allocate all the memory in advance because of the NUMA dependency.  Take
advantage of the fact that Xen will attempt to contiguously pack CPUs on
the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
same stubs page the previous CPU did if suitable.  Note the code would
still function properly even if CPUs from NUMA nodes are not contiguously
packed, it just consumes more memory.

stub pages are no longer freed.  They remain referenced in the global
CPU-indexed array and are re-used if the CPU is re-onlined.

The stubs array doesn't have an explicit lock.  During boot it's accessed
single threaded.  During runtime, &cpu_add_remove_lock serializes access.

Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Release-Acked-by: Oleksii Kurochko <oleskii.kurochko@gmail.com>
---
Changes since v2:
 - Adjust commit message.
 - Handle the case where stubs[cpu - 1] == PADDR_INVALID.
---
 xen/arch/x86/include/asm/stubs.h |  2 +-
 xen/arch/x86/setup.c             |  4 +-
 xen/arch/x86/smpboot.c           | 94 +++++++++++++++++---------------
 3 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
index a520928e9a50..467551136a2a 100644
--- a/xen/arch/x86/include/asm/stubs.h
+++ b/xen/arch/x86/include/asm/stubs.h
@@ -32,6 +32,6 @@ struct stubs {
 };
 
 DECLARE_PER_CPU(struct stubs, stubs);
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
+void init_stub(void);
 
 #endif /* X86_ASM_STUBS_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4192edf635b6..0253d22c349d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     init_idle_domain();
 
-    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
-                                           &this_cpu(stubs).mfn);
-    BUG_ON(!this_cpu(stubs.addr));
+    init_stub();
 
     bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index d8fd71ffab37..76e7ee6af6ed 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -20,6 +20,7 @@
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
@@ -641,41 +642,64 @@ static int do_boot_cpu(int apicid, int cpu)
     return rc;
 }
 
-#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
+/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
+static paddr_t *__ro_after_init stubs;
 
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
+static bool assign_stub_page(unsigned int cpu)
 {
     unsigned long stub_va;
-    struct page_info *pg;
+    paddr_t addr = stubs[cpu];
 
-    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
-
-    if ( *mfn )
-        pg = mfn_to_page(_mfn(*mfn));
-    else
+    if ( addr == INVALID_PADDR )
     {
-        nodeid_t node = cpu_to_node(cpu);
-        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
+        nodeid_t nid = cpu_to_node(cpu);
+
+        /*
+         * Attempt to use the same page as the previous CPU if possible,
+         * otherwise allocate a new one.
+         */
+        if ( cpu && nid == cpu_to_node(cpu - 1) &&
+             stubs[cpu - 1] != INVALID_PADDR &&
+             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
+            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
 
-        pg = alloc_domheap_page(NULL, memflags);
-        if ( !pg )
-            return 0;
+            if ( !pg )
+                return false;
 
-        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+            unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+            addr = page_to_maddr(pg);
+        }
+        stubs[cpu] = addr;
     }
 
     stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
-    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
+    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
                           PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
-    {
-        if ( !*mfn )
-            free_domheap_page(pg);
-        stub_va = 0;
-    }
-    else if ( !*mfn )
-        *mfn = mfn_x(page_to_mfn(pg));
+        return false;
+
+    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
+    per_cpu(stubs.addr, cpu) = stub_va + PAGE_OFFSET(addr);
+    return true;
+}
+
+void __init init_stub(void)
+{
+    const unsigned int num_cpus = num_present_cpus();
+    unsigned int i;
+
+    ASSERT(!stubs);
+    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
+    if ( !stubs )
+        panic("Unable to allocate stub array\n");
 
-    return stub_va;
+    for ( i = 0; i < num_cpus; i++ )
+        stubs[i] = INVALID_PADDR;
+
+    if ( !assign_stub_page(0) )
+        panic("Unable to initialize BSP stub region\n");
 }
 
 void cpu_exit_clear(unsigned int cpu)
@@ -990,19 +1014,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
-        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
+        memset(stub_page + PAGE_OFFSET(stubs[cpu]), 0xcc, STUB_BUF_SIZE);
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -1041,10 +1058,9 @@ void *cpu_alloc_stack(unsigned int cpu)
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
-    unsigned int i, memflags = 0;
+    unsigned int memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
-    unsigned long stub_page;
     int rc = -ENOMEM;
 
     if ( node != NUMA_NO_NODE )
@@ -1092,18 +1108,8 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
     disable_each_ist(per_cpu(idt, cpu));
 
-    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
-          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
-        if ( cpu_online(i) && cpu_to_node(i) == node )
-        {
-            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);
-            break;
-        }
-    BUG_ON(i == cpu);
-    stub_page = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
-    if ( !stub_page )
+    if ( !assign_stub_page(cpu) )
         goto out;
-    per_cpu(stubs.addr, cpu) = stub_page + STUB_BUF_CPU_OFFS(cpu);
 
     rc = setup_cpu_root_pgt(cpu);
     if ( rc )
-- 
2.53.0


