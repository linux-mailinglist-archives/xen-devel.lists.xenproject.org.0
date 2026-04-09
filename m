Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM5XOsZi12nvNQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:26:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8803C7BE2
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276831.1562139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkiS-0003mV-5q; Thu, 09 Apr 2026 08:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276831.1562139; Thu, 09 Apr 2026 08:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkiS-0003jU-2c; Thu, 09 Apr 2026 08:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1276831;
 Thu, 09 Apr 2026 08:26:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wAkiQ-0003jO-Rn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:26:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkiQ-007u2T-7a
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:26:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d762aa-e002-0a2a0a5209dd-0a2a4507841a-0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:26:18 +0200
Received: from [52.101.46.37]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d762a8-ba2d-0a2a45070019-34652e25d5d0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:26:17 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6389.namprd03.prod.outlook.com (2603:10b6:a03:398::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 08:26:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 08:26:12 +0000
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
 b=GTZ6U4qilIpW5CE68k3rSdtjYmrUoxvVHKTP97bd4nbdm43Nz4lI5If8HbnoDZGZytBnpbFeGMq4fuUZv1qKe+LQd2H55vOfAIPTiZcn2/WZONI3wQQtVbN7AjwbQiMetAlAE3FyFmXukjHuR/MUD4o5nvLQPu4SYEhs7J9CCJ7qSW1Y/fDNP+aUiZ7RkGuQL6hH5+XT/tFjwNMPJ1nlKRbKTNpPWYwIs2sdBm93Gv3tTLVo1q2NVwrlNdeu8HS31HWUmv8u6/q88ed+Qt4baoTMSBP+bDJJDN3djtwPzaQNT22HnG/PbniEpDmsA+Pd5e8WuMfrKPeaCx1S75bxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBtr3NN6mnvR9rZ76abwqO+P7CfM4gbcVDROhCXv5MI=;
 b=ueIHka8MvW//c9DCBt42rshAaftAv92ONXr3ze3pn5sULTHWBLBeQJ77xFRzYhh5Qi35Q7M0ZbS7lYLtxOfRofLz6TUfvVK3CGeTP21MI8DJCHZDIEvV/uvplEOssyeNwNJt0XsL5mLeKO+TYrRGHSmuoErWzNJtHE3U0ED6B/8Aoj6KsDXnh82S7kGD//8xUOYaBeDiUjzug4ucNVEaGc5X8UxmY9sIuCxJBai1SGRz855gMjBTUTQAe5oXftsHToMdtUisEtSlP3HtccgJLDv2dUIOFczj8tqIc48cuFlAovjir5zvojEz47iu1EgVYOruSyJp22+AogugVcfiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBtr3NN6mnvR9rZ76abwqO+P7CfM4gbcVDROhCXv5MI=;
 b=OqqA+BCX1vXTVITJ9Htv1nCPgU9Kw6P0c+UAe2pwneETyRSQ3yqLlpPYfG6MElbbRfqJph05gT9KOVNQ+rcuaOgRD9bmP7l0vlV+al5tSJSwVj62Rs5P/YUBAkJ0DhgBfTspLZISF82zMIM7Czn/+AvtLPJ9aVgPtf9RiACqQGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Apr 2026 10:26:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] xen/x86: Check supported features even for PVH dom0
Message-ID: <addioD3q23OvAvOO@macbook.local>
References: <20260408125521.104660-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408125521.104660-1-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: daaf1fcb-f962-48bc-c978-08de9611a8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bgfhReZHXkS29VXus5HGLEYdfyOgsdg2gRfZZcXZh0V5+CJiqCzCY5sQdtJtnY8iB1YXkwda68HDFDImDsPtlt6LgyiPXYAzxYwy9CElNVvT8XfLp0td5PT1n4vN7jY+KneQf69oJn6bzJWUb+eqx92IKwsHOhrFNbjtDQAqTz1tvTrCS1CULka97cip3O6awEmRO6QpoDXzoaeoP0qIED2nlSYYcK6eMdIGE1YMmj6oClOdQIJxH8ueTPdKJOIeMRXKF4a6AF4zmo+fvKBzcvgtrOQ9DEQBaHLRKsfO6M7V3x8C5fhYkiSgI3+QSszRz/fRHXBNdouWshhD51cwqqAuM+zL9j1bVhazyW3P2r48HTSbxRnQ9cJrwvfuimVMru4INAbwWBJzS5fZPaeJPqA2fX6TGZ88ayaoWJYWy6xAjKMRA51tif8kqlXX0zybtZWkT7QF6MkpimeW2hLtL3ddCkN6agzQMUSwxIxNXc+PYw/nNF2R/qcAfxEpUN1NImqXhhvlEfQ+OYzkU6kjU5TKWAZ8shbzvHpApakUp/ViLoYgN3W/xwag2vBl+oV3+Q3IqBgIuXwoXZZWscEUrGbd1yOw2mkADrXPT16T0T91whLn3AHBVIiBYuti18fETGyvrB+AJfIinT1kBp6qz2Z3xUWqodcTSfQX+W7Ir/BhFYmtusu0l30y1wkt8Sn+dvunaDuDR/804gtyMyvvBSB4QgDiGugdbpR4vplRSTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlQrOEtsNHh3OUUxbFpJNGVBcE9GNkZPZWNrWU5aMWVidXFUOHVaVjNoK1FT?=
 =?utf-8?B?Y3R2MnJWaHBCSnVxSWdvcEE4KzBqVzdUSWc2TDRqRURwcWRHWmlpVGt5YkhK?=
 =?utf-8?B?bVZBVFdHMzJQdVBSdG5hN2JLVEpWRkNjbFBTWHJ2Zlk0blJIa1djQytoOHFV?=
 =?utf-8?B?ckF5Y1JmRXZUeGErbGpXWjMzWUZVdFBPTUdIVXBoSnAvZitjdTRwV3N2NTdh?=
 =?utf-8?B?Z0hsRmlOVGk1WFZyMEFmWFNCS2c1czVpNFRXZkxvMFVFaWl3QjNhYnNvb2VH?=
 =?utf-8?B?cWM1RE1aODlOQmsvcXl0NmJveTk5Y3NkWTh0VFU3NVQzVzRVVEowYXE1cjF6?=
 =?utf-8?B?YnFoWEc4dHdVUkVZaWtuRVFCSWU5SFZ6Y2xlR203bExpUTloeEhrMi9YbGVW?=
 =?utf-8?B?M1lYZlQzanF4ck0vazNGN3RSOExyaFNoWm5kd3E4cExlNVJ1ZlVvQUgvQUhX?=
 =?utf-8?B?cnVVTld4Q2VNV2UwMlZDS29Qc2tRV3Y2ZmhMYTI4TEViREtIQkdESVFLYVlY?=
 =?utf-8?B?emtJY0wzbWJYd3J2WVVPWFpPQW96R2tpbTJ0aFYxbGZveFBBRkNEZjFJdTZU?=
 =?utf-8?B?NHdmWHAwVUlRRW9jY0Z0RFZOWkRFMUQ3UnZyRmpaMTUwanI2blB2T3lNUHF5?=
 =?utf-8?B?U1hSWHZYQWlZQWZCM2N3R1Y0K2NJYk9uRGxUSkhvOVpydmprL0ZkSE8xY1Zj?=
 =?utf-8?B?c255T0VJQzNhNEZiOVNiOWcrYkh3UnRJZFBWVXFaL3RtYUtldWFkVUhOYkVP?=
 =?utf-8?B?TlZVSmQ3WHNlM3lGdXR2OHFOdml1clNURXlBSUlma1cvK2tKc1Rnbk5nRUVO?=
 =?utf-8?B?RHVEV21EK3ZxZ3pNN3pJbE9NdE0vR0NWbG9jamFCZ3c1RkFnaEpNcDZodVM0?=
 =?utf-8?B?Uy9GYW1BaXNrUWwzd1crMTMxNTQ1aEFoTzJNSUhsVWdHSXFuQmpTVE5HOXpX?=
 =?utf-8?B?aDR6N1hwNUE3VmVXbENlVjQwaTNRVkhuYzQrQTBhMGhSaFNGYmJRNU02TXpM?=
 =?utf-8?B?QjF1dDNvOExwMkpFbGkxZ2lOcERNSUlmcll6QXpTV1pGK3IxbnBUeGdYa3da?=
 =?utf-8?B?SlgzUnIrZFdGM0xreWZQM3JuT0hsYnAxQnRGcTFLcUF5VWhoNUtFK0NsbGZT?=
 =?utf-8?B?Rnl1eHNwdkVwZHg3bkFtbzVWVVFsZEZqUU9uUEpHWUZYblVFa0Z4UDFpRGQw?=
 =?utf-8?B?Wm11K1ZuUHBJcytsKzZGNE40VTRFN1FGZ2tJMWE3K2RidmRUV0gyYS9EZ3Rm?=
 =?utf-8?B?bDMrVlFvSlFnTzMrcHRxN1BEZzJhdm53bFpnY051RW0vUStEWkZsYTNvck1m?=
 =?utf-8?B?SkdmTUNXNUtMVlc4Z1kwOGI2ZTJXL0lvYTBxcHJackNaOFRBK0t4UndPY1Zh?=
 =?utf-8?B?R0x4a25qaEhNUXVPbThWUXpVbVBnUTBqN0l0cTd3ODNUVjgxeFBZQ1BYWUNI?=
 =?utf-8?B?bUpSWGdNbnN1eTB1cGo1R0xCYW84UFBDSy9ZRUN3OGRFeEhoaStnKzV1aEU3?=
 =?utf-8?B?TnVaVjBGVGRxQmg1Q0w4MDFtM25yWFVaemZHWVl5Qk1TMnB1SkJuWUgxeTFX?=
 =?utf-8?B?Y3Z2MjNqSlBnWVBrV1M2Mm41ZElQSHlJZUNnS0tYaGRwVXlSaXFZbW9qNG81?=
 =?utf-8?B?OHE3U3dDWlZkQmZwaXpnTnJDNGVwT2ZHQ3RGZGIxck9VaEVnWWJ6ZkdZejRZ?=
 =?utf-8?B?QTR3VS8wTklJSVNleGhMelFCZ1JXVDhmbm5qeU9JeFQzSDE2cllVM0pYY3dr?=
 =?utf-8?B?R1JGbENRSXZ5QWpOaWRKeEk3a09zRG1OSFB3OVJwQVdQUFk5dEdOZm45YTVK?=
 =?utf-8?B?R2NsLzhjRGN6aG9uOHpERldYTUQxb3VYVnZhZXUwRDB6c2I5cWZJTUJyM0xV?=
 =?utf-8?B?aTZ4M0Njdk9veUFlMFVOcTFOSFpkV3FUZFhUYWdjQ2RGVGtQZElTZkIyMXF0?=
 =?utf-8?B?SjhvT0RvRmZyYTlKSG5KY3JJTlorY3dVeHgzSFB1K3FNZ3hZaEc5V3VOaWUw?=
 =?utf-8?B?enZQVEthT1NybllpT2lHUmdFS2NEdmlwZW9ML3FtbEp4UHl0UkxWRDVKRElF?=
 =?utf-8?B?c2w5YTVITHpiUlVVbit3OGxJZUNNRVB4dW9FcmlCcGxJSnhYTndKUURPanc4?=
 =?utf-8?B?YVpUeHVPNWIwL0pCekt3YXMyQlFhS2YyZy9RMFgrRmtvVHM0dTF5NHBnNmxn?=
 =?utf-8?B?aFZucGREWVp2REZjMWt4TmZlcEtBMTRWb3VFbHBsaXMzaDVGVG43V3ZuMnV5?=
 =?utf-8?B?Q3BYbjhuYWd5a3RwK0J2UXN6YzMvRnp2azVSbk5IMnYyc2tXeEdDNEpLSVRQ?=
 =?utf-8?B?alJadWhva2NwUWlrcEp5WEg0V3Ixb3A3bURWclFwaFBrSklsdzkrdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daaf1fcb-f962-48bc-c978-08de9611a8f4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:26:12.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRoaXbnK6O3mgdJKboz0F7/Ar7y+FpnyhtPulcIgRA9L3BprE4+LQJQr+B7axv8RJacvOoxaGD66wqb/7mcvcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6389
X-purgate-ID: tlsNG-ef75cf/1775723178-1394141E-4078E44D/0/0
X-purgate-type: clean
X-purgate-size: 390
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cloud.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5A8803C7BE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 01:55:14PM +0100, Frediano Ziglio wrote:
> The supported features ELF notes was tested only if the dom0 was
> PV. Factor out a function to check ELF notes and reuse it even
> for PVH.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I think you dropped my RB from v2:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

