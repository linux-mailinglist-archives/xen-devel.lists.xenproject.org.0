Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hUtWKHDSK2rwFgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:33:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B72678546
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:33:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=G+60S3NV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336444.1598209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyGD-0003Sy-CT; Fri, 12 Jun 2026 09:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336444.1598209; Fri, 12 Jun 2026 09:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyGD-0003QC-9T; Fri, 12 Jun 2026 09:33:09 +0000
Received: by outflank-mailman (input) for mailman id 1336444;
 Fri, 12 Jun 2026 09:33:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXyGB-0003Q6-T7
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:33:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyGB-00FWqG-2c
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:33:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bd24d-e002-0a2a0a5209dd-0a2a45039b1c-8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:33:07 +0200
Received: from [52.101.61.61]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2bd251-672d-0a2a45030019-34653d3d63ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:33:06 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5833.namprd03.prod.outlook.com (2603:10b6:806:114::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 09:33:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 09:33:03 +0000
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
 b=bZuiqfSa0jRIVKicNiq50v0vjbgJcZ6fEUWESMqjMKoz8diLLD66xkaf06Ek67J7UPuE8Bx4BXQhJaL7AzvlUtDp+c3+NGFn/PfhAjdEbewbyTbgzzMEPSh0r1RzN2McFYRuO3OBahMrzb9j14PHM6GiF5oh4Il4COvo4vNDig9omiA7HylKMwTHQM4SRIa4c9yVKm7pGQZcsow4TiGbvQGwRRZ/rvjNV3SDFRqEcTJZQpXuqx0P5m6yQPXNIDHWtfsLze3NlDUFJHPdgs0qUeswsscdR8jzul6lW5a+MVO9cJPFV/G/Vj8NmGvow55/rzEh1/QAqe/fslEUmpUBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhzS6K78HQdOTEozMfsjrDcsVXUUuNnzKqAv47OEqVU=;
 b=ErRQWuBnthMi5Mk42uTFfyPrOfLMqNiOrGosFtuMjBirKPmahKl+TufysWRhND9njmfQHolarrELyIJOiwEynRS66TtyWJRyf867BPtmzfrMMXpTYf8LIWDdVrxuPLS7NXeam///ZtjGgAyRWs3pOao/arpgwP/O2JrhXLsPfx7eIZsjhepuCloT7pkse7tPtnJOi9ocj+xhQvrTaEgs+CRQgjHf1JU9BYMKcGPQ7ScU8p4Xn3ek+t8alXqX10WeZ5oaua3ELNCyZn5IZ7Zgk6kaltOmaxFqt/WDPAVV4fiHMvSd+0CR9AQIRF22NISxlZsNT5u2Ltt7vIJjyfAugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhzS6K78HQdOTEozMfsjrDcsVXUUuNnzKqAv47OEqVU=;
 b=G+60S3NVSsXTZK35WInvUL2ZOJq/zsQcrPe/8x8FAHX9N1Dt78mcJKOpllPNv8N8aOb5+Wx4ib64mJkQqyqITJncaVFre7LvxWc7jOJI/2BdsIP7uW6YhUh7n7A3WPqT/Ph62B873WLfUtap9M3XegXDNbO9l6QFjVSQsTBWvzQ=
Date: Fri, 12 Jun 2026 11:32:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleskii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 v3] xen/x86: Change stub page allocation/free
Message-ID: <aivSS-yUhIFWr7Ya@macbook.local>
References: <20260612082213.82235-1-roger.pau@citrix.com>
 <93904b00-6e26-49c4-be8f-e7d8aed8e590@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93904b00-6e26-49c4-be8f-e7d8aed8e590@suse.com>
X-ClientProxiedBy: MR1P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 38467f76-4669-4caf-c4f4-08dec8659978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ak+TrsxHq1Ic8S9Ru0liQUTYl9y1PxbJxhohRTCaf/W91gCWyZSSDlWon15i9ffKvV/YRRABKTqATlf2UBhPJMbpbUMdK+dcVzOfaizQDRskXC96FRPOI4jxI+0drhhquYxAg7rHr1U0bJQssr5OLyN+Qr6elg0nageQhvoWjJ5vnYysKlBOMd2QKEUglsBTJv4XxNGctXCUtUc8bJvA9OUlInVE02eskp7FaQaMduv9CC7vi4Tk0sL0kVZbLE2VzhpiSRjnBs7ZDPTKnslI4qYRPuXL7yiNJGclR0ZN783AO0Qjq1Mk8eEXrK2KLFvpMs7rLrii+8Y5ShgV4513AzqlFGbH1L0f20pD/50zjnoQh2dTlVeZ1zgGiCpa7BYEzfkXkj05cDIbutp/PPvq/Iemx7GqLa754sGpQnv4OA3l/eFTKkshANjZuTfL6YBA/XE/ZBFwAUaNOwrc1mz+JNbwKR/BrokpVXAtddy/trovmd1yeMfSNrUrDtoDwIlihqLxC9JtgLBHY7K4JNFIIa2zAWiTubrmHdX8fve6nYqIkT0wtFE2Lf7LDsoQHnmAzSqz2yVzn06DkdMzl/HsId790TiN5SPA8X0FJNKRNHbjbUouv64zw/Gbe7YtliSHpYpQVEL2cTjBEsR5skA1snfLQ70JPdmKJbf4pHAg8Ua8DclDA2mc4C0rewcDJJ5x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHNKNFF6eWdpSFZHNWN1N1AwbWRiZGFobWV0NEpodkZUNzVIVjRhV0VtY2JX?=
 =?utf-8?B?WW13ZGhyZ3lIRWRjM1o0WjJxWUlUK1JDbTZiU2RraXV4OFgrMXhNK3RsMW1M?=
 =?utf-8?B?TldPQWdoYVNIaGlGS0RyMFpCVlBDakZhTjliYTd2djE2ajl6VEh5ME5oZHBi?=
 =?utf-8?B?UmpaM0MzQ3NZQ3BMS2RKM3N6UjBjNXlObmFBaHNSSnNYSld1RWdWK1hHNU91?=
 =?utf-8?B?Mngza2VSdVJ3cWY1WDdVT0FSQnBEeFlKNWZ3MHhNOVZkdldkWDQwdzNRUnky?=
 =?utf-8?B?QlQ3cGpKTGRDQ01QVEUwR1RJa2VDckI1d2FJeHh5clZ2amxZR2pRYlNaNXFW?=
 =?utf-8?B?bUFwa2dPNFN3cTlJY2JLUko1cC9UVW16KytGYzdQMndhOCtxTEpjRDFLTitY?=
 =?utf-8?B?OVJyZFNidldFTXZsWHBxVEluKzU2eXlFcU1KUW1IN1FFNk15MHRCenJJTW5s?=
 =?utf-8?B?Qm52NjYxalJ6amZrY241RitNTjgxOEhGckhnRzJrUFFJdkcxQXI1R3FYdG9K?=
 =?utf-8?B?OExXb3FaaXAzdGRkNEtreC9ia1J3OGk0cXd1alphVExRUnpabkhESW40c0tE?=
 =?utf-8?B?Ui9jNmM1bElFQm1OYUR4cU9TY0d1MFZhTkdZL3dFTWVMeVYxdnI1Q1dydnRz?=
 =?utf-8?B?NjJxMXIzRUtUanZwalBESXFMU2l1K0p5N0NKTWhjbGRSQWpVZ0xmYnEyUVc4?=
 =?utf-8?B?bVB3L2ttR2toQ05CbHVpUzVkN25PZ3htSXRGRkRXNVRaL3VXbUxtL3JmdEVl?=
 =?utf-8?B?N0NrN05uZ1BuN1NjbEF5REFMWGlvR1QwTGpFa3lIenZ2amM5RFYydlpOMWlD?=
 =?utf-8?B?bG1lOEZhdStoRzQ2cm9oZ0hWZ0JPZ2kzNUVETmJiR00yMTlVVHBOYzB1QlZm?=
 =?utf-8?B?VUQyaEdxcTBCMWM2VWIreHNIMWl1M0xHQ1l0cXV5UUdwcG1yQjNSL2JLTWNV?=
 =?utf-8?B?RDFjS2toVkp3Tmk5d3pGN2VLaWFBZGxMV2dBb1JLeGhVSktlam54NWt3ZGtG?=
 =?utf-8?B?eE9tWUZLY0pWZTBNVWNtRmdUeUpEWUVZUVVkaUFxUi95SG55c1EzcDVGYUsx?=
 =?utf-8?B?SjAraVBYUW8vZTVXTURjczhCSURHd0dWK3NXaWk2WWtta0pCREY4TW5OemZX?=
 =?utf-8?B?YmtyaTNGTjJTOHNLbjZXMC9UbEFROG1FSWZncjVFeW13eDdxb3JQTjVzcXIy?=
 =?utf-8?B?dERhSVZTYVRWaFRycjFSNzk0OWhKWUw5UXVQSWhmSVZrTXlodE1YY2Y2VE8y?=
 =?utf-8?B?MjdKdEZYVjNRQ2dvOXgzZCtZK2dHVG0rUVZSUkNjY29Dd21WMmt2SDA5Q2tD?=
 =?utf-8?B?bWpwc3c2NnpOTHdVMDRZbzFCb2pZUG5EN2I2UWU0TWRvcm84Y29ZTGpmTWNy?=
 =?utf-8?B?bURGQWpXT1VNQWk3MVJiZlhrTVZIOGZRSTIyVERCQ0MveGlRUnhWYnFFQVlH?=
 =?utf-8?B?OWVDVFRScVQ3aE1GaVFreXZqUXJOaVNlWlY2aWFac3JHRjl3NGltaVJ1MW5J?=
 =?utf-8?B?TCt3WkI3dXYzTTFwUk8wTGpIOVdUWmh3cXBsRVhzamFrTXJaVm1BMVNJWjg5?=
 =?utf-8?B?T3U5dzRSOWhWUkJTWk0xaW43U1loYi9tTk1LZDRoMTJ5Smo4STlMYjRTWmtS?=
 =?utf-8?B?aU5rRGtyUnRIK2xueHgvRWtpVVBwSGI1ZkdIZ3JOdnk5bWVaVTE2Si9CMjE4?=
 =?utf-8?B?UFhqVHlVZzB3V3F2VUJsdndxRmREL0VaQXozR2taN043N2FMNHp0WWdGZkVJ?=
 =?utf-8?B?Q3B1N3RacFF5MFJWMmE4TkcwWExuRHpBL3RVVWV3RVVxamltSG5YWHNNelVn?=
 =?utf-8?B?bUtOeWpjYUJycjRVZUZHakE5azZKL3Y4cnlBbytyTjVyR0d4czVIYWdHMVlx?=
 =?utf-8?B?VFEzd1hPU2pFSXVwV0lNZnVCbjhlVVYrWmh1dHFEM1hDR01WYXNEWFBoaHFP?=
 =?utf-8?B?M2IrSzR1RWM3aU1TbEhJd2JjdngveEhVQThJVU9NOUR6bURNL0ZjOVhncEFI?=
 =?utf-8?B?WUZrOW5uZHF5UkRoYlZib3NHT2dGOHl5aFYxc0RyVnhxNDZJNS9WK2tyTnNz?=
 =?utf-8?B?aXd4bVQveEFFNXBFblk5Mk1lRmRPQjBCbi9vZkk4K3REdWsyclBVZUxMZ09y?=
 =?utf-8?B?WVBlVERrYzc1OGZWTnpnbGVkWjZ6R1IyOS85UCtwU1NoM0R1c3RSeTFXcjFj?=
 =?utf-8?B?NzROam9DcG5sdDZpQjNQb1lsVWNBVUJCcFZJNFlCMTRQU1RBcHZCWTdvTVpr?=
 =?utf-8?B?K2J6dGNkUDhwcU5yOE1UVWkxL1Ewb2czOWFyMmhscHFFRC9XUHlETEwzeDdK?=
 =?utf-8?B?WUlQMk9tQ3VvY2JZQkkxbWxTMFlPZVNaT3d6c2djT3BWY3dmdk5yZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38467f76-4669-4caf-c4f4-08dec8659978
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 09:33:02.9832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0brXkMxqC5pjtRPdMXoW+8OBsRYGeTJM9XHsI4ZHxB/ymEmGV/Iwyz2Ga9o8Suc99KaXvM/Mid1eqpnfknolGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5833
X-purgate-ID: tlsNG-33051d/1781256786-41B92938-4B58D24E/0/0
X-purgate-type: clean
X-purgate-size: 2078
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
	FREEMAIL_CC(0.00)[gmail.com,amd.com,citrix.com,vates.tech,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,macbook.local:mid,citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleskii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,m:oleskiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07B72678546

On Fri, Jun 12, 2026 at 11:27:38AM +0200, Jan Beulich wrote:
> On 12.06.2026 10:22, Roger Pau Monne wrote:
> > From: Jason Andryuk <jason.andryuk@amd.com>
> > 
> > Today the inline tracking of the stub page is problematic.  0xcc is used to
> > indicate unused, but it is also a "clear value."  A !CONFIG_PV build or
> > when running with FRED support will not populate the LSTAR/CSTAR stubs at
> > CPU bringup.  If a CPU is then offlined, the stubs page will be freed as
> > its content will be all 0xcc, regardless of the stubs page still begin
> > referenced by other CPUs.
> > 
> > The new approach uses a global, CPU-indexed dynamically allocated array of
> > stub addresses.  However, to handle NUMA aware allocations, we cannot
> > allocate all the memory in advance because of the NUMA dependency.  Take
> > advantage of the fact that Xen will attempt to contiguously pack CPUs on
> > the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
> > same stubs page the previous CPU did if suitable.  Note the code would
> > still function properly even if CPUs from NUMA nodes are not contiguously
> > packed, it just consumes more memory.
> > 
> > stub pages are no longer freed.  They remain referenced in the global
> 
> Nit: Didn't you mean to s/stub/Stub/ as per Andrew's comment?

Hm, yes, I've fixed the instance below, but not the one here.

> > CPU-indexed array and are re-used if the CPU is re-onlined.
> > 
> > The stubs array doesn't have an explicit lock.  During boot it's accessed
> > single threaded.  During runtime, &cpu_add_remove_lock serializes access.
> > 
> > Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Tested-by: Jason Andryuk <jason.andryuk@amd.com>
> > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

I will run a CI pre-commit loop and push it today if it's all fine.

Roger.

