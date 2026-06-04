Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u1RoIZpXIWpVEQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:46:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E050E63F29F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 12:46:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=nnUrBSuN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327648.1592461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5af-0000TT-Af; Thu, 04 Jun 2026 10:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327648.1592461; Thu, 04 Jun 2026 10:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5af-0000Rl-7o; Thu, 04 Jun 2026 10:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1327648;
 Thu, 04 Jun 2026 10:46:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wV5ae-0000Rf-2U
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 10:46:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5ac-001AgL-GE
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 12:46:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a215770-2eae-0a2a0a5409dd-0a2a450cea44-24
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:46:17 +0200
Received: from [52.101.62.18]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a215777-62f1-0a2a450c0019-34653e125667-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 12:46:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7339.namprd03.prod.outlook.com (2603:10b6:510:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:46:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 10:46:13 +0000
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
 b=gLRfSjauXqF7nc/puZZ0PEeKQAKJRPdc2zAE9zTGVc41g0/TEoh1z6i3dlmrf2UzwYAqOf69z/gaYdAvkzGwBnWltZ2VKl+CWRdZ4ads4a7t0GaQm0x3yhXdhiRHGZIllx/ftcHx01guzpFoS5r7EtqDHuLxd92nJDI2b3iIKLuBJ5ndmkB0+BOBd6yPh18MGcQDjJZlEM13qG7l4N8EndvY96JXIgNEbe4PB2aOphuC1/stKlAFLo/prJxE6m30jgvttm1Pq/3jtTgxWnUZ8r815V0NcqRlUWMM6vsCkzqXZ0IkIRbd/5e1M+bn7F86PL6r07lxOjc8AWP5hEd0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lnr8BhEcduK34qnIb88n8ZCcFie+Vpe697sgTaBNwgI=;
 b=pwN3XkQiJmC422zHmz8l5DAsMBACujPqSk+qTnlpWEWV9gAeppjEuE+V38WkYE3KJjYdQBcR6PoBpT0MhuC00ic5dITlKdsGZVUqESj6aCxhV4g75jTYy8L5mo8pFTL/91RXOc97h3P3ot7ul1O/A141fHAuxlOYzS3UxmSuzBU5EcQIdvlPAIt66ySBBwhIV29wCeD6Xd0px812JV7M9+MN9lroywTRnR/xCGQ0Ysw47F/W2x+iD3KUcORZiMicHITPmK3sgX7SGSyjZw+dWzi0Jy9BN+F19E9LqsIlODY53MAN7xUJUul98OCFaQz+pjk5hwgB2cjMM1gkvChX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lnr8BhEcduK34qnIb88n8ZCcFie+Vpe697sgTaBNwgI=;
 b=nnUrBSuN3f7tYAb2i7FQ5Hq4NxkRIyw6ta2NMibCe3PXoOkMmaTwaZqZflFb9yIkQbrgxDZuo2ZHaB+HF6V51Fx4FdmCiu1CSx6AIgoNgEDbhWXLt9LcMtXBAhXmVGuhUPCr43isd8kopeW83oEqvwgx3z7EFmJ+Z7ArctG3fuI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 0/2] x86/mcfg: relax checking of MCFG position
Date: Thu,  4 Jun 2026 12:46:02 +0200
Message-ID: <20260604104605.92516-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7aac89-65bf-420b-a413-08dec2267ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Hj2Pwvfo7tgm/r1Oe+iLOH+DSpAVAA0OfoQXMlAL/kzkO3TvwW3EElndq0JnHthXIV2/OUZD/2D+UJI5Mfbrl7Bk5naddV7mkk5GOgoHx5ZB4EAsMXUECcmYkUUcmlEVWBmfv0Bb9WTzyt9rzYcpF8q/VXTedAx+GREEDSxzZ4rBO3c7x1NHlYzyJIjqU/4/u5kK87Dq4e82dzNY9wlzLC8G4vBa1E+jfFTAxeiYtBuydsNP3ktaQZ5QP7/yeDhelKz5jRs+xhzJ26aF/VfnUrIToQbkjSiFC6ZdfAPZLga3w/BKPSDWMQKI0mMNgBogZHKctH2vM14LriW4DtAe3v0H3S8JQLuOXgBORbIUo2kY4FUdYlWVp+/VPS+XASPcEWy9FLH2ODG4LLVAfKEVmnHsZY0LM/iFIRkxcGOzlGn/K05iiuv4R77yKi9/cXE4sK7QVshE2+meCflyaaVhWOkpghtWlTg80zjvLegYNt6rnVWgT0k2HRhh9RAvqY4og9VXvI9eAGQWMXSDCXTBzJ7Prv3+k52I1yP1l3WAOBoIFjtwLToQPFV2N971okxEbuPkDwGwGTlRcMvvMlB+iPMzwwZsxMaoOmCBaFXHY4cXTaBJH7pAPjfZzJmoHUStDaHrPhm08IbERt9hOHONEDOZmOAhi50/TKG6+T1Zgc+3vfZsdejiDfwzOoHV9OqD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDY5M3NsdVNZL1NiUExtMUppNXhGbnRPY0k2eW5vb3VLYkY0Z2hSdjlNeGd1?=
 =?utf-8?B?Um9KWThRS0hkZnpxL3lLdEZ6U1Irb25ZcW9nVmNYYjFRaGpTa0dCYWg2bmU0?=
 =?utf-8?B?aGlhUHdKVnR4dU1NWHpmc0Z3SlZxYUJRTFRqMjNVVmcwUGJtSjIvYjQvaFRs?=
 =?utf-8?B?alJsdkk4b0JselFWL1NqSHQvcGFJVGl3dW1Ydy92K3ZWZTk3L2NHSTVkYkFv?=
 =?utf-8?B?d2hnWlRLMXJTWHlvcXd4R2RkdnFCUVFnY1NsNGRFQUo5N2c5MzVtNHgzRmJ2?=
 =?utf-8?B?R3hHOC9iTGZjdUIvcm1OcHFSOEs1a1hVb0pqMzBlQjFFaUpCQjhSeVlVK0Mw?=
 =?utf-8?B?b3QxU0J4N2lMdDFOSVdkdzV6OEh2MVN0TWU0RFRCRk9qWmZjeGs4MC84Q0di?=
 =?utf-8?B?Z0Y3OFlGdXIxV1A5SUMyQjl0ZlJKQUowY0pQVUpNKzNqUVh4RklYYWtTOGw0?=
 =?utf-8?B?RlgvVTRsMnlMemRUbitSd2g3U1lJQi94bE5yR1ZDSCtHMHNkd2RaMTFmUjVk?=
 =?utf-8?B?RjVWRWlmeXgrWmxSTzhETlA3YmRDUlc3M1NzOWhpdHIxMkx1T1luZGlMSnZV?=
 =?utf-8?B?Mi83VlcvRjR6Y3ExdGFzM0s4alJqeUlOSjB4YzNGQ08wZ3JXSjMyM0FwS3Yx?=
 =?utf-8?B?Q2pSWTZZdWtWUWxxUHhNMmRlZU9mTU1pdU9STThnWVA3WUpNemFuOGdpSm1B?=
 =?utf-8?B?ZXp3RnE4dEJhYVg3YVdqbEhRdi93WitmR3hTZ2htcndZaGxvL3ZjMlV3UzJy?=
 =?utf-8?B?cFNubnlkS3BkelhscVVWTzVEN1lEVWp6a2VTNVRIVDRhbWZCd1pKN3ZaZkJN?=
 =?utf-8?B?QVlOTzhvVG5lNVFsbStqRVBmbnhiamlrdHNUMHkwRFcyT2t0NjR5dkhTQyt2?=
 =?utf-8?B?dWlteTRmWDc5RGF1NXdyczcwVWNkYjU4WmpEWTJ3VjRFZkFRSnU2VExKUUxQ?=
 =?utf-8?B?MGJzWEhoMExtS2xmaUpZSmtIeWY3OUVJQUg4V1l3TmpuajhYaVBvQWpsb1ln?=
 =?utf-8?B?NWd5NFRwcXFmbWRhUk9RNWcydlpybzlVZzhhVkR3ZFlrNWd4ZThMdHhzNytj?=
 =?utf-8?B?b0hvWm9BeGFrbEM4Mm1LRllZZldhc2wyRXh3c2phaUtkdTNzdW1tOWppbFJC?=
 =?utf-8?B?dDMwTCs3OUt5RHRPcGlIOTF0ZFdqTlV0MEFNYW5wdXJkUzl0NWlRMVhsYzk4?=
 =?utf-8?B?SEE0bU1wb0wvQlZNSTNBZThlb1Iva2FpNDFOcmkwUUFET3RxSHpJZkJuK3Vp?=
 =?utf-8?B?YzhSZWdGa0RHc2cwMDlQQWNXWnJ3VmpnRUNhaXhhRTZvQTltU0tQQXUyeTRj?=
 =?utf-8?B?ZWl6ZlRJWllNNVdSZTF6M3Z6SzZ6ek5aOXVkTEZFVWY1NnZPWFErblZjWTBG?=
 =?utf-8?B?ZmV4d3I4YzJ1ZXMrL0w0TnNVdXJKT0Z3c2cxLzVxbWYrbmlUeG94VnE2MmZ3?=
 =?utf-8?B?SmtQNnpMVHpsMzNsSmVaZGR6ZUJoVXladUNMT3Y3QmVqUWNoU0N2MzB1OEJN?=
 =?utf-8?B?cWRjMXY3Y3QrMk92dFZTbVc5MmpuUDAybUNaUDMxdzd3eWtWUmx3dEJJUVBE?=
 =?utf-8?B?Q0NRdFJOS3BpV1ZaNjVnZm95V2hZQTZzS1lmdSs2ZEllNSttNVRocFlUd3pH?=
 =?utf-8?B?YVFxcHlyU3lQL2RnQmZlbGhHV1FCQkt3RlZoWlBMTE9LV2JIbkJnS1VENWdn?=
 =?utf-8?B?N3BNV2FWYUZaUmw0TmNEUXVGYVZBUDI2dUszbFMyazRmOTFiU25vSmlaYkVB?=
 =?utf-8?B?MGc0dkpYNy9xa05md1A1Ym5oOHp6aWROdzBLNjRjT1JlOGVRRldnWm14UFNK?=
 =?utf-8?B?dThRVlRiNVRHUzR4Ty9pNFg2allrWXZSSzhOZ0l5cHRab2NzbGdCSGorTjBW?=
 =?utf-8?B?M0VETUlpeEZndXRDMVpJWStIR2xYRlRVU2lnMzZtdXdvVnlkSktNN2JVK2xj?=
 =?utf-8?B?OERwOWRjK1MzZ3pmakhLd1ZYd1haK2NBTkE3UVVlOVNPN0I0WndxVTVKcmFP?=
 =?utf-8?B?MTE4SytscGhEbVZGczFjWWJJZzVPTzJ2VTk3dTNnRkQ3VG9zMWR5d1cyMXVQ?=
 =?utf-8?B?RHRFRzlmMDFlWFRIdXg5Q3pCcHNISHBiUmQ0K1p2M0NLTUNkNmVMaStDb2FG?=
 =?utf-8?B?aUQ2RGdtbEFPSWNDWitTaU9NNCtrNjJsNStqOHFzMTQ5TFlsai9rTldRUmtL?=
 =?utf-8?B?TjB3MmV3Y3l5alZmS1VYNVJDbDNINkJDdkdoS056MFZrYm9pU0ZYZ0NlSXp6?=
 =?utf-8?B?QnQ5OU5iQzRnaUpFQUhOSWR4bzJHTkFEZ2U2ZUppSFNZOVkwNzZSN1pIQzNv?=
 =?utf-8?B?Q05JUzVubWpKNzd6MkJ5RXppbjhWaXpSMU9rWlNBYmhuUUpQUEJodz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7aac89-65bf-420b-a413-08dec2267ee1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:46:12.9305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQx2aSSHVXzxQ1kZgWlwfN3w2udqzluO83DqONIkIczHgYYne9QVvA3dZ/UdQWPhpmZPXfRVACPE2i0okPzl6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7339
X-purgate-ID: tlsNG-d25034/1780569977-E0766CF5-C2D3DE5F/0/0
X-purgate-type: clean
X-purgate-size: 398
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,suse.com,vates.tech];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E050E63F29F

Hello,

First patch is a trivial cleanup of header sorting, second patch is the
real fix.  Possibly something to consider for inclusion in 4.22.

Roger Pau Monne (2):
  x86/mcfg: sort header includes
  x86/mcfg: relax memory map checks on newer firmware

 xen/arch/x86/x86_64/mmconfig-shared.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.53.0


