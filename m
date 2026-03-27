Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKTKH4s8xmm7HgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 09:15:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0D340D0A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 09:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265183.1556230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w62Ko-0007UA-GQ; Fri, 27 Mar 2026 08:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265183.1556230; Fri, 27 Mar 2026 08:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w62Ko-0007Rj-Co; Fri, 27 Mar 2026 08:14:26 +0000
Received: by outflank-mailman (input) for mailman id 1265183;
 Fri, 27 Mar 2026 08:14:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w62Km-0007RW-J8
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:14:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w62Kl-001ars-R5
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 09:14:23 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c63c56-5cb7-0a2a0a5109dd-0a2a45039b1a-36
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:14:23 +0100
Received: from [52.101.201.4]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c63c5e-1947-0a2a45030019-3465c904bcba-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:14:23 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7118.namprd03.prod.outlook.com (2603:10b6:806:322::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 08:14:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 08:14:18 +0000
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
 b=oa28S9416hr+vkBHwh1d0+0A5g+ZSafZa+wWGmI4mGW/uzQQxad/ahQIrDJnau8nhLNlE3mZ/mvo3tCMgJ+10kgYJ0PgOqb698rGFAV6i0lyI196YyP1EnYrI7VuUI205+2b5Vd9ZZMhrPaNCrLleRpDASXkaKfNWwTMk70Fs1AlPnDMn8rEFlvdBxqKlSCLHv1WdckHTrIG+S6bIMSHzxDsGlFhGFOuuJ8nKGS0r9siy5/9NYXzoAHXtdkOd0XxzK2r2QzZsHMyRGWuzhfIlLGkO0myuqdgOPIScbT8GPNXJRhtdsIvAEUHVHFRipD0jCY9mS4URWa240TkHCNYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjdDxTpWumEmfH0pI7JNY96NwPFteWjL7Ie4XZQQ3ww=;
 b=Tx3rjqu4Lde2E8e88IsAlORaukQ+nuSMj/5/78YO5NrZLSqioa9fV8/XPRKDfcZYjexUoipNF5qDu4wZmLrg5+vgc5twlrJ9rzUyjFEEXjNwE09EhDnpmXifTkFL2FHc5+Lbq8bxDih6WaBWUV5YXuiJ6Rf1W+32OJmFQuHx8CmMA9EwdkDFVN9mexocRmYRwYIfb9P5hpc3ycsXgTYa8zLO37u5SKqQH3nmCXzwGS12em+krJWnTGkrq8H/92YajnnA/zgiINsHstvB13HCvLJAsWTCyC5DKfkSsK+9nTloGO/4aNny8xa5nUpCvPd1lio0fGxlx/1qBJi1HzTGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjdDxTpWumEmfH0pI7JNY96NwPFteWjL7Ie4XZQQ3ww=;
 b=mWHD4jJdXe+53yl0ZHtH3OfwbZSq2zBvnrnMhR+xWNz/7/mFGt+rAvA79S/OM2+sRLKy7mEvpFbnZ6s2ZB4r1Rvidl8AwhIQ5ZKMEp4C+cWAeCzrhCklHcTvF9CJR8+W8xfqig+/GZkGyNerAqf/wMYU9wygVkpKnfU2E5Xulf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 27 Mar 2026 09:14:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] xen/uart: be more careful with changes to the PCI
 command register
Message-ID: <acY8VygqtQL7ZRQy@macbook.local>
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-2-roger.pau@citrix.com>
 <2a00a1d2-7017-4c76-8344-018eb3f30f50@suse.com>
 <acVNMQ_HqRpgkP7i@macbook.local>
 <b4b67bc1-c7e4-4872-a018-789d7e87dcb2@suse.com>
 <acVmj-agJOAX9hGV@macbook.local>
 <f671aca0-2782-40cc-9ee5-03916c1a31eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f671aca0-2782-40cc-9ee5-03916c1a31eb@suse.com>
X-ClientProxiedBy: MN2PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:c0::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: f979722a-6b3c-4d3c-1e6f-08de8bd8d7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Kh9pCNPl8t52ivaUF1y+6gSuniT1ChsaMs+9n6BsXxOz6ZNdhi6mr64F++JvOgktivYFpgeZfu7XQLkCe6KrpId4s2G0ltgJRrjjwL72ThgWK/iQzArRT3aPOfCTfu+jfhNOvbLmaPAXe9exw/OXFBqWpsVhMQABra1L224LBNf12gOq1J7e3dvd8U3OeGI7m9+BJWMgBzQmjUSddSWi7Naw5jdHiy6Axp0N4FBvvfpQarpvack+H03h95n2l+Gh6LgFhaVp61xOzzb9btg8sbJeJBOwRUZuyeaNgwyvFyycHHxQ2Y1tsghUOHDt/3HZtCgFyxIWzo6IU+AOWipQ+Uithh1CCEIm1/IQezp0OnV6JGR/6RPwh5gRS6VBDdN28005hnz8u6hcCfTYMhRbNhtX1ReSYn7nKMjhMAebivIwiC/9zPdlLjSBhZLcdE/7IPmdZFeWb4FeMriHh+c3egAvkgINWZVyImIsG4vuaJZtXGaBDKm4Hfpv53KdHxhZ7Q8TNBuBaowbtPOOS8lZm4Lf0/WP19Rrg6iPoot+QMUCgzOHtcQQNRp18buRLbWwvRKebXa74FpyZQpB3ehWoZWq8wX/DGQLmPXHI6UDkWeSUefLxMxFt7sfa1oBComBNWWbNa21ajo+zX2YyMf42IDZV/bxB6HsP7V6VXQlcPbzPR9ufNFcjpsD5fJIvonMD3SVEsLprn4V8p6q7UIE4pwmUluTjoUPMMnSzQYpQnk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3pnQTBVOGxOTCthekduZGk2RERRVDJ1VitJZmhXVHkxUGh1ekxjcDl1Ymwy?=
 =?utf-8?B?M0piSWpjcHpDaTZ3U3IwRmtDMGttR1Zvc291bnZsTWw2d0pDdUQ0bStuVFlL?=
 =?utf-8?B?UXRmbXFTUmlpRGd3aGZPWDNNd0xVWmJrL1BXWmdoZzFyUS8yM2F2dHhkYzE1?=
 =?utf-8?B?ZkllcGMwb2VqSk9INzU0MFViZlVwRlNzVlhnWFl3ZkZGNzBmc1pKMVJJOGVi?=
 =?utf-8?B?c01hUXplbWZIb0hyV1Y2NXRXUE84SFFQN25nN2Z0MlZuZDBwY0FQMkxrSzUr?=
 =?utf-8?B?MGVPRnJSUi92WVJjMmlsT1RBY1VJNGc5aC9MbEZNKzBZQ29VVjI0VTBjLzl2?=
 =?utf-8?B?T0VoUU9UMVl4YWpybDczdEN4TDRNRG52YWdsMW1YbE1mVnU2K1hRa3ZyOG92?=
 =?utf-8?B?WUFIMS9zL0lXODNYVDdzRk1Fc3IxdmZVVlNISytldnJVeEROcGNIcTVvUUhw?=
 =?utf-8?B?Q2FXc1g0ZExWdEJmcFFMVGpuRmJHeXpKQ01HQ3dheXVWdWppZzJ3b3lRY1NW?=
 =?utf-8?B?bGRTTStCZ1EvRENRVUpPY0xaeHNJb1VBMjlQdWdmelcvQklSNkx0Umo0czN6?=
 =?utf-8?B?R2psaDNud1BrT1J1anpqSUpMMEhFWWlkT3R2d2xMZWtHcko4NjFTTENzUDRk?=
 =?utf-8?B?emlFYVlKUktlb0svUStRcjJrZ05GbHdjVndocnVadlhKR3ZMZXRuNlc3Ulpy?=
 =?utf-8?B?Z3owU2JncGVVNGZpTnlUalZyOENhc3VZSWJlUkJDWDU5UmVjdytCc3RSZUtp?=
 =?utf-8?B?UzdubjNMZEtTdnJ4RWRIWDI4RVptTXlqNGZua096cDNqbjFPdzFIakRYWWxp?=
 =?utf-8?B?b01yZmcwRFhpbjhHR082ZVZJR2xpWE1nUzJHT2JkM0hwbC9zZkxHdzlVM0c3?=
 =?utf-8?B?TGd5M0k4ZHpyN2tyOC9iRXRPVUF0VnNGaEtwb0ZjNlROUzBJSVZKc21VQ2lT?=
 =?utf-8?B?UXFKN3BaSVpWM3RRZ2cxOWVzYmEvOER1am84WVBLOGFzbTRBcW1KeEs2YjFw?=
 =?utf-8?B?NVArelgvL0RDeWJuTGVXOVhxQUlZNy9vYVlHSFlHcStKdmg3VitkN1Y2UFp1?=
 =?utf-8?B?L0Y1QnRGbXRTTDl4T3BNMmV3STBuSVpTeExKejl3Q0hJMFpCQ2xLQWhMYmI2?=
 =?utf-8?B?Z0NqOVg0ZEl1STcrSWhLR2xWSU92RHJ4L1pSTFhZZGNhZjhyNUdKazFzNHB6?=
 =?utf-8?B?d2E0M24zYkUyd0VJaW5ZOHE2VWNyY3lSUzRIQ0RJZjE2RUo3UkxWNms4anNU?=
 =?utf-8?B?dnJBQkhLK2lEZkczTjA4T1BaOEE2Vzl1K2lWUy9qN2NXQVIrUEx2c0Mxbk9s?=
 =?utf-8?B?ZnNjU3N5M3dPcU4wOW9Mb3pKSUFUZFRNTUFGN000RmZNc0d4VGdrd29jZHBm?=
 =?utf-8?B?czR5eHRRSHZJbmdsY2paMWVYSFRkL1R0S0ZkSFVJdWxEM3Rqd1dHTnJrSnNx?=
 =?utf-8?B?U0g4TkZJTVlOYUo4azRkMGNYUVhWTHNFRFA0ZlJ6OTNxM2FLNCtERldSVzB3?=
 =?utf-8?B?eDdoOWlSYVpnRDMySVNvQjVCK1pjQ1RuK0tXN3Exa0RnUEJaNzVSK3d0OVVl?=
 =?utf-8?B?aVJEMHM0aE93VFpDUjhzN0g4ek40czFxZWxXR2pZRFlEZ2w5YmRqTEpmb05U?=
 =?utf-8?B?WGlRRnZ5dlhMWDVUSVplYmZxYTJ4cmt4ZDdXcjdxQnF2cnQ3L0xoNVhDZmxl?=
 =?utf-8?B?UFFpT3ZHaFNpdUU1TXFFL3hZVTJaYTMvZmkzZ3Fqcy9OWjA4Z0tjbDFLVGxi?=
 =?utf-8?B?MDN6SitzLytnQW94Y2MrZUlYcGNpSnNXVFB6NDFFVlMvUEtDeEN0WlhFY0Na?=
 =?utf-8?B?K05PRjFGNi80Q2R5d1N1YnhZZ1REaVRGZ2syWmtYRWhJQTg0Z2pTMm1pSFQ3?=
 =?utf-8?B?WmpjeUpLZ1N5K2RYK0h3bWdhc3pmeGFzY1N4U2Jxd0pra3dWeVlNam5xQitv?=
 =?utf-8?B?N3BQek1LVncxWUR5b3BQM0tYc3lBRDJqam9Md2NZZ2lvMERzZjJzamVnMXZw?=
 =?utf-8?B?Yk1lUkRzbFp6RmFuSlFNQkNGU3dkY2xidURDZXpzZ3BOTlpSbUpEbHB6Mjkx?=
 =?utf-8?B?QVVTTEFKZUVFYWdNMzZCSXVtQkNoWGdCbkdEVWNHR3lBOXlqRTJ5USs5c3k2?=
 =?utf-8?B?Mk9YTkk0M0dyd3dzWFFrdnMrS0Z2dytUT2szM21JV1B2T2w1dXJIOVAxV1E4?=
 =?utf-8?B?UFl6WnFBeGtHd0RVbW56Q1ZJUStDUmR6WEcrVXQvVi9HZDNEdVBpOXJkZUs5?=
 =?utf-8?B?U29ZWTJoOEF3S3NtejhZOHpqK1p5bUQ4bm1JcVlaSkxLcDdYU0NUblhXcDFx?=
 =?utf-8?B?QkZvSURZSDN6Q043QVZmOFB5RnFiWHRDYTFDcVNFZkNLbGpETVhzdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f979722a-6b3c-4d3c-1e6f-08de8bd8d7be
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 08:14:18.4275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: In7d2Gl7p82xIsFz/LaXG7n7HNwIIlNEUxVvHXkpHvOqBa8fX6VjfR1mIWnKcUQNu3WOdWpT1ZUo7LZAf9aZug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7118
X-purgate-ID: tlsNG-33051d/1774599263-49C5A72C-FD4368C1/0/0
X-purgate-type: clean
X-purgate-size: 4647
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,macbook.local:mid];
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
X-Rspamd-Queue-Id: D6D0D340D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 08:59:29AM +0100, Jan Beulich wrote:
> On 26.03.2026 18:02, Roger Pau Monné wrote:
> > On Thu, Mar 26, 2026 at 05:00:15PM +0100, Jan Beulich wrote:
> >> On 26.03.2026 16:13, Roger Pau Monné wrote:
> >>> On Thu, Mar 26, 2026 at 01:02:22PM +0100, Jan Beulich wrote:
> >>>> On 25.03.2026 15:58, Roger Pau Monne wrote:
> >>>>> Read the existing PCI command register and only add the required bits to
> >>>>> it, as to avoid clearing bits that might be possibly set by the firmware
> >>>>> already.
> >>>>>
> >>>>> This fixes serial output when booting with `com1=device=amt` on a system
> >>>>> using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
> >>>>> Device ID 0x51e3).  That device has both IO and memory decoding enabled by
> >>>>> the firmware, and disabling memory decoding causes the serial to stop
> >>>>> working (even when the serial register BAR is in the IO space).
> >>>>>
> >>>>> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> I'm not convinced Fixes: is appropriate here. There's nothing wrong with that
> >>>> commit, aiui. What's bogus is the device behavior.
> >>>
> >>> Hm, I would argue that disabling command register bits for devices
> >>> that have those enabled is in general dangerous.  What about device
> >>> RMRR or similar residing in BARs, and Xen disabling memory decoding
> >>> unintentionally while attempting to enable IO decoding?
> >>
> >> RMRRs in BARs seems unlikely (as BARs can be moved), but you have a
> >> point in general. Otoh devices are fully under our (later under Dom0's)
> >> control, so we may clear (or set) bits as we see fit to get a device
> >> to function. FTAOD, I'm not outright objecting to the tag, I'm merely
> >> questioning it some.
> >>
> >>>>> --- a/xen/drivers/char/ns16550.c
> >>>>> +++ b/xen/drivers/char/ns16550.c
> >>>>> @@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
> >>>>>  static void pci_serial_early_init(struct ns16550 *uart)
> >>>>>  {
> >>>>>  #ifdef NS16550_PCI
> >>>>> +    uint16_t cmd = 0;
> >>>>> +
> >>>>> +    if ( uart->ps_bdf_enable )
> >>>>> +        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >>>>> +                                       uart->ps_bdf[2]), PCI_COMMAND);
> >>>>
> >>>> Why is this conditional? While fine for the use at the bottom, ...
> >>>
> >>> The comment next to the field states:
> >>>
> >>>     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
> >>>
> >>> So it didn't seem like further checking was needed and that was the
> >>> sole filed to decide whether ps_bdf is populated or not.
> >>>
> >>> However, I also found that when using device=amt|pci ps_bdf_enable
> >>> doesn't get set, and hence I'm not sure if that's intended or not.
> >>> Shouldn't ps_bdf_enable get set unconditionally when the serial device
> >>> is a PCI one?
> >>
> >> I think this was deliberate, hence why ...
> >>
> >>>>>      if ( uart->bar && uart->io_base >= 0x10000 )
> >>>>>      {
> >>>>>          pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >>>>>                                    uart->ps_bdf[2]),
> >>>>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> >>>>> +                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> >>>>>          return;
> >>>>>      }
> >>>>
> >>>> ... it looks wrong(ish) for this path. Actually, in ns16550_init_postirq()
> >>>> we use
> >>>>     if ( uart->bar || uart->ps_bdf_enable )
> >>
> >> ... this conditional is now in use.
> > 
> > Right, but then the logic in pci_serial_early_init() doesn't apply to
> > those devices (device=amt|pci) when the BARs are in IO space?
> > 
> > As uart->ps_bdf_enable == false, and uart->io_base < 0x10000, it will
> > return early from the function without attempting to enable the IO
> > BAR.  Is this really expected?  It looks like Xen should always make
> > sure the respective BARs are enabled if the device is to be used for
> > serial output?
> 
> I agree. Many of the changes were hacked in just to make someone's
> device work, without having general aspects in mind. I expect most if
> not all checks of ->ps_bdf_enable want amending by adding ->bar ones.

Wouldn't it be easier to unconditionally set ->ps_bdf_enable when a
PCI device is being used?  I find it confusing that there are two
different fields (->ps_bdf_enable and ->bar) that signal whether a PCI
device is in-use.

Thanks, Roger.

