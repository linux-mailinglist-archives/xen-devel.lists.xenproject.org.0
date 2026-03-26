Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LQLJMbzxGnv5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0C331A56
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263522.1555450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRl-0003wW-Jo; Thu, 26 Mar 2026 08:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263522.1555450; Thu, 26 Mar 2026 08:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRl-0003uo-GJ; Thu, 26 Mar 2026 08:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1263522;
 Thu, 26 Mar 2026 08:52:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5gRj-0003t7-Lo
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:52:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gRj-00HEad-1f
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:52:07 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3b0-e002-0a2a0a5209dd-0a2a4509a5ea-24
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:07 +0100
Received: from [40.107.208.54]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3b5-e484-0a2a45090019-286bd03694a7-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:06 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6130.namprd03.prod.outlook.com (2603:10b6:610:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 08:52:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 08:52:02 +0000
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
 b=Ypyo5p1GneAEZA85Iprm2bHy7hSS2X072Tjh9AxAe6WTc56oZ73GQFkKNk4IqqM/stpgDH5LgdmTWrjZ2bMk2CHWyobl9+/WAHrCUOI9Fp2BXN2so5QBtfL8iRV57U46ZdgMuz/MUmTmq80jJEhC7fWN6aDJuTDl6W25GezvUqF7FTQ6TmxeMdf6vIiWyvuyfnoED4/d14UrPKVgsZmD13Cx4rQjZ1sELSD+dTyAQsY7LqfkBl42BYlRvg2fDdvIvh1Yw4tdK9KvkjBjGWn5Xk9OUYxrIA8nbg/hRfnxiJ9Q70TcnzNf+F5qQuVzOAXIt5Z/I4mXtwewlg5sfJg1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlSCfR/RG1m/YuILyUlHdFZCze5KGIHSmla47GQ4Db0=;
 b=dXWNYkjW4lk/u1FME7PpmB3q2Z52+W4YUOTz+mic1b8oNG93kq+FHSzQq2uPj5l2rjd8v8nyqljEbHjio96/Ppwmp1gAGUbNH1RCf6Opih8MDfksbU/NQ9dHnEAh6FY3sGQ2pdJsDNipU76rzMcCZJ71wmLBubcOASyiD6r63rxY4wBBWBM6S5q2J2GyA6Vl8d6tefFEHGdZggAg61EzyDektUmpr0as+fpYJ//hCSMnzqDvi8bD6av7cDQhOlp+Ax0ryPtV+cyMN2zMSeDqCkMOxUUm4zgiSKpGFQs5HOGko+Td3GZzD12FZWAs7RBCu0A5Qbtyu1KEC79DfafCMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlSCfR/RG1m/YuILyUlHdFZCze5KGIHSmla47GQ4Db0=;
 b=cCWrBBg6ll8zBbg6N17LqB+kJJxU9QEofK/9uPFMFNs5I8SfOXBc3LmDRxR+cXpeBYiowo32QOn8GC7sILwvrs+FQ0qpoqUZCCg3jcd9pjkdADQVaZFByXBBt2gJZYAzHacvCM/ZYzW2wM0sITo+QPn4eetf+sLO5xAUb7e8khk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] xen/mm: do not assign pages to a domain until they are scrubbed
Date: Thu, 26 Mar 2026 09:51:44 +0100
Message-ID: <20260326085145.61380-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326085145.61380-1-roger.pau@citrix.com>
References: <20260326085145.61380-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 9615aa61-7a6e-4f46-1807-08de8b14f29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cl4vQFqyQr76WQPmHdlwPfeLTC3aZ1pYsqdqtnzIRkpkUF+f2SIV7xWoafNjjg/ec0jYsAb4YIOtX/1EHV60nt6iERSORSpdU4jcX6gpLZ33U9bXq1DGf45tXNpvcslpsNvwz+b3XBiwf7FsY3xfyo+gclpmZvbjAhTUWT9DDZC711peDvgJuo5UtXyCwG5oT8buWg8gQQaaDJr0Dj6F7cfsjQLBu3fRJ5fpszuNR1MuBg6xt0MVyeOYxftDzKvUCcftb5h77vXTBP8SeUQQnMHgKdHbu/mvhDmQv0ji81DbZAhys/t8nsDms2hpbMOHhii6+aJyqocJMD4IRpbJbwksjf5VgEufkL9JrDA4MWYxv8H7ebCp1XIwE6gPIzhGqm3O3rgobSB0GhBpfOGTAa/qU01Gv5V8LnNm2JoEQDFA6q9rdYMyJrtfO4aUOgjmIeFKI4z09Fh5vNCdu1BeYahFh80/6VOWCbHkVXhCoTPr1dyA/KvqDCz3W9XB/gLzlR3afZ9rZtTI2tEhwAe/X5oVOx2X6wFym10C9T71ROyRBEY/ESGwjzIGM43kPRQ4G91cZQ04+WGyINbJWuGt8qO9Yc0LIxwY3hstTjWCRT6YmEwLPvD9+lxFc3eHgswxLREMJuVx8rF+5RifgMAj2HggaMu+FkQK503yb43D2ft/pGbly9u9tjt8aABFkn04Qr9wSJnKVy6CK+Sj+uzi3Pki6n9uRe7PFv8WEycFFLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S01XZ3c2WFZNckl5d21BcWF6WkNZVHJkZEd0c1pHWHNsMTNsaTRFS1M4ODdE?=
 =?utf-8?B?VklqMFZnQ3pVWFMxOG1kdEtrKzE3dG9CWVFMdkJIdC9KK3FxZ2NCV3p3Y3VI?=
 =?utf-8?B?OWFUMkVGRUVtcVk4UnRObU1VdmdjRGxvZjVGUTU5QkFpcUk5dHZjdUlTZ21F?=
 =?utf-8?B?TEFVVkVCRlZiYzBud1RGbFNKQmRDb3duSDJZcUIvL3ZweG80YlBtRTg3VE1C?=
 =?utf-8?B?Ym5DSHBRNDlnem92S2tXVTd2UFJFK1ZFbWNSVTEyZjdjZXdmOFNOVFRSNWlU?=
 =?utf-8?B?clo2YXZmdHNyVkRLMGRwWUxCS20yaUhQc0VkTm9wSCtpS3BOdWNwdnpyeGNW?=
 =?utf-8?B?SmMxUDY3U2ovRFBscDRWRUlRWTQzbjVPampwTXZ3eTVKaUhUb3hxWWdjdHda?=
 =?utf-8?B?eEEwNXVBMDhJY01QZ3NMUmdFOE1Wd2ZaeHgxVTNUeHJwWG95N1JMeGR4TFN5?=
 =?utf-8?B?VFVCcWx4QVZpVVhad2ZTbnl5YXo0RDc0cTE2VmlNR2RHMngyM0J5WnVLK1Zi?=
 =?utf-8?B?eG5oM1FEQ0RTZWZrenBpRkNxeUFobkZrNVlCNWdzeGRMU0lmNDVnUWtocWRO?=
 =?utf-8?B?S2VrMU9wQnlhVEtrMHJTOU9ZNWYwRk1KUzhlK3JjUitnb2pvM1BFM094UVJs?=
 =?utf-8?B?S0pYa3Q3VmtwbmkvSkpuVFFuTHZnOElHdmpIcUx6VGxodlkxWkpsZDBHQW9K?=
 =?utf-8?B?dUM1elhRd2lSdWdxakw1VEZ3RW04QnpRM3ZUbWtESFMvUXpGV3p5QklFNkpv?=
 =?utf-8?B?WDJYY3MvanFHQ3lxZC80d2hjZmI2SmF1ZTZCQlFaM2FDaHNheGNFRlJSNVN5?=
 =?utf-8?B?eElvV3pjYVM5emVHU2pYcVhZRW5aYTM0aXlLdXRQbmcxMXRQKzRucDVlRUlX?=
 =?utf-8?B?S1JHbTBET0hEcTNHeHBDR0RaM0xSSHBLUkt4Qy9pOEZQVTA4N05BRUMwcnlj?=
 =?utf-8?B?eEN3SVpuVUNtcnNydnczcS9UKzFGeEZZaHZyS0xBK3RjVUlheUtCK0ZmcVhZ?=
 =?utf-8?B?Mm81WFU4NTB1TlBJSStKMzVnd3JkUGN1R3lGK2ovRlZmalZuejR1WjNiM0Vz?=
 =?utf-8?B?Z3IwOVRnWlhiZ0ZDVEU4L1RNWXFxMTh2UTJEb0FqTGlibEJSQkViTmVtRndJ?=
 =?utf-8?B?UmNTMUozc29pcTYzREdZWHFxcS9RMkR2MFFPWHkwQlJhQXBJOVZ2KzNGYjY5?=
 =?utf-8?B?ZnIyUEhZVU1DYit3WUVJQ1R2SWNXdytBM3I3ditPRGNXZHBzQ1JNMzl2Y3ht?=
 =?utf-8?B?Q3lsV1VTanVtQVRTczRHd3E0VFhFSEtPZHdIREx6T3pCK2RTSXZFbDRVZHJp?=
 =?utf-8?B?Si85c3hYSE5kaFRUakIvc1F2azhBdVRnVnhOZWp5MVZLZjE1RnRhTHE0bnBQ?=
 =?utf-8?B?REFIWXI4eldhUDJ4eno2aWJXL1JEbWRJeklXZ3UzbVdOTEVOODZ2YTVxWHVh?=
 =?utf-8?B?Q0x1L2RTWEFzYW1xaU1ud3doakkyVnVNS3BCK0ptalluMEVUMG9UVkN5c0hv?=
 =?utf-8?B?cFlEWU9lWXVQTVp0K0FvWXlIS2pZNE5KQzNDTmhPcFZrWkJ0OUIvdmR3UkpT?=
 =?utf-8?B?U0VhRnNWNUkveUV2b25KcERuanRyWittVzl1aUhlTGl1Ukt5d2lXeHVyK1ZM?=
 =?utf-8?B?RnRPS1JBTmk2TDl4VWt3TzdxU1VHaTlTelB3T2NLd0JyMW9YdHhkWHhFR1JF?=
 =?utf-8?B?VjhrY3U0emNuMi9vUmRqTzJKWW5zcEFMUXZQa1BWQXlrcHRkYnhUcE8xVitP?=
 =?utf-8?B?ckNna0tteGovRjdXN2ozNjlPcVNiT1dmVXN5aVAyVkxNNVFPOVlJWWxCMXJW?=
 =?utf-8?B?dWJNRDlXYk5sUnh5NEEzbEtzRmRwL0lUd0pvb3BVV2orL1hFbDlMWXBpU0E2?=
 =?utf-8?B?Qy9HaHg5ckV5THluRjl1aVU5bXlWUUU2RldlVDhXUTJGYlJkN0o1WndHL3M2?=
 =?utf-8?B?a2VFWHFzYkZUeTZwMERpNCs5VkxmaEYyR3kwODNWWGF2dFgvRlM0a2lpaXZ2?=
 =?utf-8?B?b2hweWVJd1ppaDh5TjBzNk4zdWZSWUE5WkI4b0dYVE1CYnB3VG5LYnlFZUtM?=
 =?utf-8?B?RVFyTmRnZGtEQk0zbEFZZWFUK2xZWmpxWWNaVTArZklTWXRJaisrOGJGMzVG?=
 =?utf-8?B?Y1ZuZzg0SW55REl4Z1BRUmVyOXhxZUJzaXEvMWpIcDU3UHdQZzJ3bkYwRUJY?=
 =?utf-8?B?QnEwbkNjcVN2dEVjZ3NjV0M4SEF2dGNCUGhtTlJWZ0FQNkRrWUhKZHM0a2Zl?=
 =?utf-8?B?VENVQjcvOUlvM3VUTitQank2VkNiVW1GNWI3cmRzRUdMZ1ZINjVnZFk0RTJY?=
 =?utf-8?B?Z1ArcXQ1RWpVTTAvSEVCYUxQZXZoZ0FIemZnV1Jub3RCVkVGZ0k1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9615aa61-7a6e-4f46-1807-08de8b14f29a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:52:02.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hc7UuGB1w+HlWGIzLPILOsocM/k5wcPGTF/yoXgj9fgrSyBp1m008D3yaQKwVc6ZAJF+zVlxgk7pMmH1nGekag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6130
X-purgate-ID: tlsNG-bad1c0/1774515126-61AB4A73-5CF8E391/0/0
X-purgate-type: clean
X-purgate-size: 3789
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 04E0C331A56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Assigning pages to a domain make them the possible target of hypercalls
like XENMEM_decrease_reservation ahead of such pages being scrubbed in
populate_physmap() when the guest is running in PV mode.  This might allow
pages to be freed ahead of being scrubbed for example, as a stubdomain
already running could target them by guessing their MFNs.  It's also
possible other action could set the page type ahead of scrubbing, which
would be problematic.

Prevent the pages pending scrub from being assigned to the domain, and only
do the assign once the scrubbing has finished.  This has the disadvantage
that the allocated pages will be removed from the free pool, but not yet
accounted towards the domain consumed page quota.  However there can only
be one stashed page in that state, and it's maximum size is bounded by the
memop-max-order option.  This is not too different from the current logic,
where assigning pages to a domain (and thus checking whether such domain
doesn't overflow it's quota) is also done after the memory has been
allocated and removed from the pool of free pages.

Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate allocated pages")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/memory.c     | 6 ++++++
 xen/common/page_alloc.c | 9 ++++++++-
 xen/include/xen/mm.h    | 7 ++++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index f0ff1311881c..1ad4b51c5b02 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
                             goto out;
                         }
                     }
+
+                    if ( assign_page(page, a->extent_order, d, memflags) )
+                    {
+                        free_domheap_pages(page, a->extent_order);
+                        goto out;
+                    }
                 }
 
                 if ( unlikely(a->memflags & MEMF_no_tlbflush) )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1316dfbd15ee..b1edef87124f 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2713,7 +2713,14 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info |= PGC_extra;
             }
         }
-        if ( assign_page(pg, order, d, memflags) )
+        /*
+         * Don't add pages with the PGC_need_scrub bit set to the domain, the
+         * caller must clean the bit and then manually call assign_pages().
+         * Otherwise pages still subject to scrubbing would be reachable using
+         * get_page().
+         */
+        if ( !(memflags & MEMF_keep_scrub) &&
+             assign_page(pg, order, d, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5e786c874a73..b80bec00c124 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -208,7 +208,12 @@ struct npfec {
 #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
 #define _MEMF_populate_on_demand 1
 #define  MEMF_populate_on_demand (1U<<_MEMF_populate_on_demand)
-/* MEMF_keep_scrub is only valid when specified together with MEMF_no_scrub. */
+/*
+ * MEMF_keep_scrub is only valid when specified together with MEMF_no_scrub.
+ * Allocations with this flag never assign the pages to the domain, the caller
+ * must call assign_page() after the PGC_need_scrub bit is cleared if
+ * required.
+ */
 #define _MEMF_keep_scrub  2
 #define  MEMF_keep_scrub  (1U << _MEMF_keep_scrub)
 #define _MEMF_no_dma      3
-- 
2.51.0


