Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yanPOAKHMmoe1gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:37:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4AE699298
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="Nc2xc/9F";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340303.1601349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoa8-0002Qs-Le; Wed, 17 Jun 2026 11:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340303.1601349; Wed, 17 Jun 2026 11:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoa8-0002OU-Iq; Wed, 17 Jun 2026 11:37:20 +0000
Received: by outflank-mailman (input) for mailman id 1340303;
 Wed, 17 Jun 2026 11:37:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZoa6-0002OM-HT
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:37:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoa5-00Crf7-NC
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:37:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3286e3-e002-0a2a0a5209dd-0a2a4503ab28-28
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:37:17 +0200
Received: from [52.101.52.5]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3286ec-672d-0a2a45030019-346534056e65-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:37:17 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5416.namprd03.prod.outlook.com (2603:10b6:5:2c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 11:37:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 11:37:14 +0000
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
 b=DPYkimolcGkZZFqtbAc9LifU0ifz2+f0SxBEtZjsyCtgJQO1iYBEWp4NDNTW8OH6TGRYgAhgNE0X+55VjW/1lzNsg+YuGqw6ZSVuD6fuexawAr16DprGc6RhnWdyMDBjRFMr6sUWwfYFp0RicDsLea161Df/IXBGLW2qvZVgXHAZtOmc5q/YJ1RJpxJ2Z7n/nGE+v/WjEyuUUKqVBSbs5rYOs8JjYEzQgfUqNZl6F7/s7rcmEqtRkvqKdNPtfIf966Rw1F/D9cV/Fb+4APvMtPch0TdCDAaeaY2UUMHc8JUVgEo9KW0QfveKFLHymar4bunT4djY523sv7gM616fnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmwTGFjJ41DfNMZjpQlHpx84UVScg80V84aQE4Fiwzs=;
 b=hQyOy5EpsrNK0cgpN4Nngw+ZpKKWxPzLCEuh81JuLEUhO18ETAKd977k0WqFEYYJePacSnLvFhSQ3iZpWN452EsuYZ5cVSmc2fL35AsI1oPPzjsYx/b1I+p3BgqWvJdtPZ84pptcym/6Wr0HPlPKlqcsFgnFYEbvedqyCpCBm2GTq/AbmI8s1/0onFXpI9wI28yRDiD2hSWk8FrWNEXlKCnjOeWY9SWNldaSU7JhNkVtAdxzCdKaXgMu1NKlNZBNdE6B14Wn5xNqViWlbmTguiQ2/wraorMnbDXF+N0f0b72F1tBAb1pV+/x1okt4vEcr4jH28l4WCiEmIt3lCfeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmwTGFjJ41DfNMZjpQlHpx84UVScg80V84aQE4Fiwzs=;
 b=Nc2xc/9FjfRh5pwTCP1IxZaOWLbbLPr/yzl+L9ktrYM1k0LWuBmWrOnijR706oMOA5o8ziM3vgW5FcbVqgUwesMc//COuDC/PKOHotm5U+YwbpvB6YV+JuH9+VkQQ4am9QQ8nd3CynahVzmd2+2me8po1nxMbz53u6knzIOUqSE=
Date: Wed, 17 Jun 2026 13:37:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.22? 4/7] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
Message-ID: <ajKG59Vh5dAVcMRz@macbook.local>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f17b9ac9-abeb-44c1-8eab-6b08d563bc5a@suse.com>
X-ClientProxiedBy: MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 327a41b5-7f37-446c-ed24-08decc64c727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	hvwMzeLml8yCEuQslpztVIlJiVGE3O+CSdV/ldqoOCi6xME1tHqqO1XLz0NAqCboyLRWde3MKRwKi6h/93mS1AsKCdypSsSzjfkP7z+4abUPhMX6fsbcFIvyJLMJ0C5lbFV3aJE685fYIkbWFlq3zgKXH7LrKt8LOv8E6156vxwwlk0/ZfihjTwWJ3DhbJmvNGZPZ7XU39CCHixfIqmcv9d5+aj88qpYfIiK//4PZVLp7fYdXV3a2A7l+CM4HOvOIvvrEdn4xTq1+l/F9AX4jhMRyJFK0RvBXt2p8lGoDgToWrxJIz6LMp9XHztUh7ZhwwAfKJBuM+Jg8D00T97+U0arb6+f6Abq7Agn50vto4gHqana77yAZxJ/hCOoU/4k9D0Va+SCsKegFLR+ezVCk3M9i7beMsacT1MIZ8y1zvBJp0jXxDtKPmFelxpyIKU1j8dCXNqWV9t6hh8uwvJMZ0LRJGg0JfqI4AOs7Tl0aVg6JUsEYZQnOFG4iLxnZ1PFt4A+lrVFP7wcH4S6dbnVxBvr99hNqsMkat8tMfAh2YoSAMVBESRcwjBZ9cZJ+gJ97UzV/k7jnSvEWrPa8dcq/ILBnzl70Zgba7V9S6MgkBEKK4OEoeXDXMs7H7UpdVheJOZpMz23wf1A+pjsZsZBnMcXAAA/VChK4TGPdcHiL28D4exr30oESzrVpibgogij
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHRLK2JlWjlrczNGU2Q1OXM4QVA5S0hzL1kySDNDMlVJNTd0Z3Fac3NIZFB5?=
 =?utf-8?B?V3RxK04rUDBZb0VDV0hTM0MyZWFBNjR0VUI2bUR2TGE5K2Z2RitUR2ErZnhH?=
 =?utf-8?B?U2ZHVk1YdE5rVGllcCtSamR6VCt3N3RVMi9Ud2I5cEJuZmpJWUNCamhJckk1?=
 =?utf-8?B?a1hSS1dhUzVSMXVVT3psNWdwWnJNbWxlN0RsZWc0b0hwckJweUkvcEFJSjlB?=
 =?utf-8?B?OHN0cHVkT1FPaDE1YjlURnNka3oxS0hYMVdPMnluR0hYOFVXS1EyWFhWeVYv?=
 =?utf-8?B?RG05YlBMSU5hbUNLc1JVdE5ZRHpudG14Uk5ncEwrdkJTM0IzRTVSNnhPQ1R5?=
 =?utf-8?B?TE1iMUQ0KzlhR1h1NFlmMnN0WGE2NUJNMThHN1orTDViUkpUVWpEU2ZySm15?=
 =?utf-8?B?MzBsa1cycXhqYUNRNjloUm5UaUtDRVNKaVFKSXpwZGE5YzFTeWxkSzUzclZ4?=
 =?utf-8?B?QitrVStyK3JVaU1pV0pFVHdvMzVUNmZSaVU1Mk1Ld1hWMVlEdGhFbllNcTBp?=
 =?utf-8?B?WEpKVkIwM0FBbktzaE10WE04endNYzZuZ3ZQbVRtWkNZL29sSWZqY2pxSXhQ?=
 =?utf-8?B?WVJTZCtpWXNCYlJTYVJkYkJGTWk3Yk4zUjlGVU5mWkkzWFB6SXY2UlZqVmgx?=
 =?utf-8?B?SWk4Q0dWMnJScXg5UTlxeFdHTDFNYzJobURHS252Y3NaSFpFTDVVK2lSTDgx?=
 =?utf-8?B?ZjNPR0NBWGMyTDN0dE8yZ3YxVzZoaGR3U1ZhcW9xWGZCRzZhRmNOZkFPWkZx?=
 =?utf-8?B?UkJhQ21sRmZqbDdSM2RURUF6MnFqZFBBeHNaeGx4SGRPeHVpbC9pOHcvemc0?=
 =?utf-8?B?Y0RpZWFvM3hmdEpLb0l4VXNTQTdQY3FJbDFnRzdVOXBBT1ZrZTNLYUdaU3I3?=
 =?utf-8?B?ekF6RVdKKzhlTitPNXViWlNGblltOCtMWXJlS2hqdEtiWkl3UzJnS3BROFFN?=
 =?utf-8?B?MTJSRGx2ZEd3ZUxEcmVjY1RsQ3RFMndyNGxuWE9idlpDNVZCRGNFRWM2NCtC?=
 =?utf-8?B?c1gyZHNSUE1zNE0yVlVZWWZBTVc1QlM1R2diRG1BWURWZFpjSWtRa1NTamNl?=
 =?utf-8?B?MWgzZ1p2eTh2a1F1Vk1uWWQyMHNpS2dZeEx4aU1wNW0xMVMzODNnNUpPdlF6?=
 =?utf-8?B?NXNsUnF1OGRMempmMktPV0tid1ltWHdSNUpSQndsMnJ1ODdXYTk4dGE0c0JN?=
 =?utf-8?B?Zmh4bXNjamUvNjExeHZ0dU81K2JaNFJudEVPRFBuVzNqRTE4Z1A0TFhnOTZ6?=
 =?utf-8?B?c0h5S1J1WkU4ZDBiaDBjSHFFT2xqcTVOL3FVWU1KS2JKeHBMb2hmdG5wMEFH?=
 =?utf-8?B?YjQwYzQ3Z3dqZXB4UUF1bUdBU1AwZ2wxdUo5NVNFb3Y3ZStZdmY1TzU3eVZE?=
 =?utf-8?B?UHZjYVpROXJjREx5UFZKQkdlcXBkVmVJb2d1ZVNkeGREOFFsMDJ2cGJqWjBW?=
 =?utf-8?B?UHMreWJPaDF1SE5SdjV0WkY2UGFJTUVGbHlVRngyL2NjZ1lRRVduR2tPa2Js?=
 =?utf-8?B?RjVBblhMVEkyRitVbjFIQW0rU1pnY1VsUGdjQld1bDJaekZHWnppSHN4aTh0?=
 =?utf-8?B?Q1pNN0Z2c2gvWk9DZVcxWStRWGdIczR4WDNBQUZmMnJwdmhtQzRYWlhvTDNR?=
 =?utf-8?B?UmJNeHlOdXZkemNXRTFwcG8ybGhLSWh4NkdwdGN0YjBaSjNvTEsrNWs3ZXdr?=
 =?utf-8?B?RERJc0ZIK1daZFJOc1J1b2ZiOWdMMHZWYUs1VWJpSS9NeGFDZ1NTWmNRaEYx?=
 =?utf-8?B?Q1hkK0k0UVRpTGNXRDI5UE1MK2l5Q3RWMEo0UERzQ2VRUlAzRjZaSVVBc3h5?=
 =?utf-8?B?WXVSSEIyb0Q4bWlUWDNhWUdZci9pUTdZYk1MZkhiUlBGK2tUMGpWc3Z1bFY0?=
 =?utf-8?B?cGFkVFQxTWhvR2ZGWFNaYjNVbFRIZXlQcjVkM2N1ODNoUi8rdzRmR3NHNDVZ?=
 =?utf-8?B?MG1nL3ZXTUIzTWo3aFZacVhGY2ZiNE9KVm5VRmV6QXhxbVZiT2RMQ3BMRCtr?=
 =?utf-8?B?ZDdiWkhmNk85ck9mS0dVNlo4ZUpxbTRhSSsvbFpEOTZzSnllWE42bXhzWFRo?=
 =?utf-8?B?TVo0QzFGdEVwdVlIOHdMR3h2M09uZ1Zocm4yTHZnWGIvbUdLMHptamgraURL?=
 =?utf-8?B?azZtRXkzT0N5dU1WVVFJdVpVN0dXNU1PaklRVDZsajQvOGlaeWg2aUdwZWZH?=
 =?utf-8?B?dWNDT3dKWnpiaURDWlF3bmlzVnZGcHJtVDN3dXBIRlg0Y0hoVmkyZVU1RXh1?=
 =?utf-8?B?d1laMmcwbzZUOXVGR21qVkhQY0k0YnI4L2srWjBGMTIxeEh0dk5EbnQ4OHY2?=
 =?utf-8?B?ZEZGVGdWbVQwNjI2K1FDeERwOXZPdThSK1ZJRFp2T1pmRkxIcUZEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327a41b5-7f37-446c-ed24-08decc64c727
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 11:37:14.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOA0ke9eMLeEBQATB00OZFqw49L4udkegD1PQUabMNpriX+L42sbTtmAKYd3MDODRWhnDj9TYCgcG0vcoZ1qoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5416
X-purgate-ID: tlsNG-33051d/1781696237-41197938-6533AA94/0/0
X-purgate-type: clean
X-purgate-size: 656
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citirx.com:email,macbook.local:mid];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B4AE699298

On Wed, Jun 17, 2026 at 11:27:42AM +0200, Jan Beulich wrote:
> While the granting of permissions when mapping was already removed from
> this operation, check whether permissions actually were granted when
> adding a mapping; the check of the requester having permission remains
> unaltered.

I would possibly reword this as:

"Be less strict with permissions checks when removing a mapping and
only request the caller domain to have access to the region.  Keep the
same permission checks for addition operations."

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citirx.com>

Thanks, Roger.

