Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K1BNIj/qImqyfAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:24:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C726E649436
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 17:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=lx0CgTGW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329659.1593692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWPV-0003Va-Gj; Fri, 05 Jun 2026 15:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329659.1593692; Fri, 05 Jun 2026 15:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWPV-0003T2-DI; Fri, 05 Jun 2026 15:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1329659;
 Fri, 05 Jun 2026 15:24:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wVWPU-0003Su-EE
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:24:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWPT-00AKiE-Mu
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:24:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22ea10-2eae-0a2a0a5409dd-0a2a4507dfc6-30
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:24:35 +0200
Received: from [40.93.194.55]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a22ea31-229c-0a2a45070019-285dc2379169-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:24:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5567.namprd03.prod.outlook.com (2603:10b6:a03:28d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 15:24:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:24:31 +0000
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
 b=bHuwD6/ISEaFaddhFz2iNmgBzfXlNtA+Y05ee4i3Q8725Xh648kqsvmoZjUXKnH5IRgbVgWDE6Uij72y41dsDYHaSSqEAVfXc00bUki8NLCFPG8FXPGVdV2YcgCZCR157gU3VYxBXzPc9s0gxY3a78bk2leiuf/N05dfemPsoShtcwcmf6uOas2sQ9enZRvuOKN9N0a4mwIqZTbRVE+aoQywTDwKx8Z9ijpzOUQrBJ7dhKs7aGN3FFiYQ8BVl5aH1cbSJaKyppAPzr6ol63lCfgWHbcZBuu/Q2WC659am9Rgbx8fZum4pCrs2wMMZyziSJCwOAc75+9dZyDqFp8aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na8l7212p//wRHMekjmsrpv0pViG9B6bmFyVzEzPd9c=;
 b=PCXL5NwPBnobwZc4e7YlI2/KAhZOrIyd/rhbwqYk3wx81lFz5VmYHGq60XoqWRsYQQAX45v29JDChad6IlHFFc1eA0NhYP+41kcuc0p/9sJvMZntV4YvV9mw8lXtbSbbk96KYivoxlrkTCR3n2uhv97cpbHnDCCQA+nM6XYMJtvp8ejRQG9xbmAJG8lzWkCroC51kbQV3nLa5zmT4zdGlitrMXHB6gCZpPePhNaNtLBE77QIc6CI8IsJ/YSqyrPGwRC86ncCp8DHFi2uJTgZJip77V+9SS0apwNSK3/3U/LAexojRdQpJZnFCV2YTwQJCMFktJioAOTtnddVGiKwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na8l7212p//wRHMekjmsrpv0pViG9B6bmFyVzEzPd9c=;
 b=lx0CgTGW0yfXs1SPW/6UXnGs64JxVhjWxGOYIaFboMcBJZs26niw2CmRJrhRvUfS1aubzY+p87P6cqezo91umMQ2dnBOX8srLHsyjOmhllQ1zbEmHqOtbeACTWMVkosQzdfbYf1G/fzJ71+qgnhV4UHAOz31MscfUuI8OP/Nuhg=
Message-ID: <e102162e-6845-43a5-b615-01d91959883e@citrix.com>
Date: Fri, 5 Jun 2026 16:24:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.22 v2 2/5] tools/macros: adjust ROUNDUP() interface
 to match hypervisor
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260603191836.77955-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0262.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f85d99-9dfb-4697-cae9-08dec3168aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099006|6133799003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1kjRHfdV8uNO7eMsB3E45vG2/65RMzoQzlnU2PpN1WD4DqH0z2757pLm0v550i5XtjM0VUbbHqmfr4BQ+22lF3qMvgyMn2NWaSMS3i9cEm/RCrKJrMwnJM3XswhhINQ7qGtWioNw0t/Syjz75zuJGKiVDMunih9QLukEXGtkB4VM4KUPYJ+I/JDaP5h/rQwvYIwd0+KCBDwCxdsFOCtGnjitYcY9470mYRsAt8mvYWPgp+iiKQjVVDK0OyXtO0vh/rIlTDugRyyswu8PYZf7Y1R3Lq3FYj2S+X7CExBQSopf7c/3QbkCom8nOioHAub7PNXT6Fu5C6DzYUbGbRmc16IVyxp7ZvQqZSHVtMoEVMVguY7XktCDFbhDZeC+5bL8mpX8gki+5WsQVSFfElnOT/RAgXOTveR8iBNvdhBTl30uQXxGjc9FGEWPURJFU5S+BVD3UrX3VXWmZ6K3wxoeOPo/KVKgQO2X9Bd6lqpMxXdi8ZwN3A9gQARFsW90D7t6H9bhDRFcmOdLQ2cIDwFOuPySxj3kpo3skw7SKxoJrUN2bsBs0DfqcJ9fUrC0mBKxuf7hjd7NJ00qOgiz729AAWUq2rDeniMMLu9osFdnilWEjjR1glTTZbN34allqbcHgaokOyKbWAuJ0vYj/rpbXQMISyRH8JF3HbLaD12zZxhmaGFkbMRaJnHKqUrFA+3w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099006)(6133799003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVFROGZOcDJsOWhWSjVTcTROZEpaYUk1QU0yNVp4ZnUrNWh6NVNRT21XNmpL?=
 =?utf-8?B?aDIrYUpUSHBLdGN4VGVVem54MHAxLzZOUWlNeDA1bXdIaDRROFlFOUJYVXJ6?=
 =?utf-8?B?NGN4SE9xcTRnU1JiMjhPVXVGaHVzbXlZVzUwWkxrT1IrUXZrVmRnVHZPdGJE?=
 =?utf-8?B?M2ZWK3ZhZ1d6VlBrcmtNZHBPd2ZyVUZVdmlsUTIxT0RyUHJBVGtXRlIyTFgr?=
 =?utf-8?B?WHFOMnJJb3NoeThrOVdrSmNJWVBJM2JoVC8wdU1CUTdBMTl3WXhVRUlmZXNM?=
 =?utf-8?B?ZjBBS3VpYWt4KzAybjF6QlEreU95a2U1SVNTNkhMMEZQT1E5V3BJY1g2MGR2?=
 =?utf-8?B?azZJU0FRZEkwZEpneTlzdlZQVHFLYWRUZHdIdTF6bENZT3lkN0J1b05YQzhC?=
 =?utf-8?B?NjdsV1RCaXpHbTNSby9GM3JSVkJWYWVMMW1VSkN1dUszVDB0YzhIRVpYOEI5?=
 =?utf-8?B?eGFVSnZYMFVIQnloSTZGVHZjd1g4cG9VVWs1eGhWY1ZMYkx1bUdYcGNIYXpM?=
 =?utf-8?B?S3l5WXNZVHZSbHFpRm9sVkozK3NBNzUvR1FocFc1V1FSYnc2MGo3VHhJcER4?=
 =?utf-8?B?UmZGcXFaRlhzTWJ3K2x5WEgzcDdHUE9sS2xkN3BZN2xmRlFlWDloenNGdHdr?=
 =?utf-8?B?L0RZOHJhUW5uQVg5Wi9DYXF4Ujk3MURud1FpVHhsY1BXT3FVQzA4OWhobytX?=
 =?utf-8?B?QWVtUEViQm5XNUxwYVF5VlhsTnNRM1dBc1YzdFRlaGhzZ1JsNjF4RUdXYmVh?=
 =?utf-8?B?VFliWWw5Y092T21UWFUyS3REUW5TOGJnVzBEbWUzTXFCVVVYc29YRXpBVUU5?=
 =?utf-8?B?c0o1THNoUHZ4ZmlIcHBlNTJXdjlsZGVJYy84MXo3cjlpcHI2YUU5WlNMZUIw?=
 =?utf-8?B?amhGNWlFY1V4VG0vRTFRV3F0eUZ5NThPZlh0TFhOVXlYb0pnZk82MVRkaDFu?=
 =?utf-8?B?elpMYkdMSzM1MW9pOXorUER3NmlrSWlwbVFJc1YzVDRWbmoyOGVmZ1RFU01x?=
 =?utf-8?B?QjdxcVg4ejYrK0FBMDBJSTBxZ3FZRzhsWnI0T1JwYnQxclpQdzMvdGVmQlJU?=
 =?utf-8?B?M2tISzFHRitybGVYOXp3V29CZmQ1ZTk5YzZvL2srRWlnemZBWk5JaENvUTND?=
 =?utf-8?B?ZTNOd0FIOE9zTzFTbGxnL3dlU1FrU0ZPNjBiaDBBRmRXU29veUl0R01oMEd4?=
 =?utf-8?B?VTVzaXduUnlnWDNYWk81cUN1VjdRT1lTYjBsbnZUWkVUWDB0ZFYvcEpEWXl4?=
 =?utf-8?B?alhNeVBhMU5MRmNmK1VLWHVSQlJsb1ppUlNqa3k4anlzRytJb0FmTmdqcXdS?=
 =?utf-8?B?OUdqOUl0dlpqZUpEaGFmZTluL0ZyR1FCcUFUb0ozU2l5R3d1TmhQRDRZWnhU?=
 =?utf-8?B?Z2VXUUhxUzlPeFJOY25GRTVHR1J4WlZseEg0MndTWHRjYlU4WkowRWs4cTVk?=
 =?utf-8?B?RmQ4UkF4ZGlvMjJGdnZDSHliVWxJR1dKb01VY0xROUF1bWJQeEtZNTJYajQ1?=
 =?utf-8?B?NlJJTUwyMzZQaVlCbWo2QTJuQi9wTTZxZ3l3OTU0dG1LOUFNbmV0dHlTSXp5?=
 =?utf-8?B?YmpDUFRuWGoyV09nRFVwcEdvbWtsWGhnM05qNEpCYkQxUVJHR1hpb0grRzd5?=
 =?utf-8?B?WkdiRGUzQmtyMHNzQXpoU1VtY25wT0ZMbEJiQWxGajJiQzVFSjQzd2ViWW5z?=
 =?utf-8?B?ZS8vUTNpWTRudk1sbVgrY1RCaXhGQ2k2M3k1dFRGL0F5RzA3RlY1TXl6R2V1?=
 =?utf-8?B?RVlPeXgwSTdhVENwTmNDdzRVUXZsVTFlQ09BOGJWT0p6bE5JZkpBMElsS0pz?=
 =?utf-8?B?Yk5PTkVsOXVlYUo4a0JVNEYxNEI1dlVGNXgxRXJOaHdYOTNtTjZhOXhyeWZ1?=
 =?utf-8?B?blZ2VGRwblJ6cmg5ZGlJWncycEYwTHRhenpRWFk0dXhuaGxkME9nMnZua2dv?=
 =?utf-8?B?cEhxRDc5Zi9NbVVNQUJxbVpnMFBUMnViYzJtZnB2emdRRFY0WCtNdStEY2E5?=
 =?utf-8?B?WnFMN1JNZEYwK2NXRlZuSHZUdlpHbUFJR2RGZDRON2ZnbVFRcG0rdzVycWs4?=
 =?utf-8?B?N21LRjNWTTk3MnkxZnh4R1ZNRjBhQ01FSTIxY0Y1YnZNa1JvV0xoeWJ6NlN1?=
 =?utf-8?B?TU8vQTF5RERIOVJoTjY0WWE0b1ZaeUc1WXBjbVBuMGhsejk2VXptaFV3K2p4?=
 =?utf-8?B?Y3BjQ0UzelpyZEhBVjZZaG9iUlEwL1FEOWdKanJ0eUpjSllvb25vcXlORGpq?=
 =?utf-8?B?R3hLOEtYMW9PUHdPdzFvRi9mRUk1ZnVac2RtQktUR0JHUUhiZXdYVU1Lek0v?=
 =?utf-8?B?OGNMOUhDQTV1dCtwenhHT0cyZWZ5aThkYk5sZHJZMzl6cXlkZ2E1ZTdCdHBQ?=
 =?utf-8?Q?MpQ2Cj9FW8TdgWOY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f85d99-9dfb-4697-cae9-08dec3168aa0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:24:31.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEofyi0M8mtKHjcClDa+8jo47ncSE0qzpuYIyssBeRTrZfktIeQTsDAYbfE3lHf6VQf8iDjFA+MVWhvqPAoypJv9AxQlVHEuHIfHs7usIZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5567
X-purgate-ID: tlsNG-ef75cf/1780673075-22573C48-DB8645B6/0/0
X-purgate-type: clean
X-purgate-size: 9596
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C726E649436

On 03/06/2026 8:18 pm, Roger Pau Monne wrote:
> Adjust user-space callers to use the new interface.  No functional change
> intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Yeah, libxl's choice to use order was always bizarre...  I'm glad we're
getting rid of this.

> diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
> index 268936efe25b..9af83535944a 100644
> --- a/tools/libs/guest/xg_dom_x86.c
> +++ b/tools/libs/guest/xg_dom_x86.c
> @@ -678,7 +678,7 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
>      {
>          if ( dom->cmdline )
>          {
> -            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 3);
> +            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 1U << 3);
>              start_info_size += dom->cmdline_size;
>          }
>      }

I think this would be better as a literal 8.

> diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
> index 7ccdc3b1f6aa..54dde924a7c0 100644
> --- a/tools/libs/guest/xg_sr_common.c
> +++ b/tools/libs/guest/xg_sr_common.c
> @@ -56,11 +56,11 @@ const char *rec_type_to_str(uint32_t type)
>  int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
>                         void *buf, size_t sz)
>  {
> -    static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
> +    static const char zeroes[REC_ALIGN - 1] = { 0 };

= {} as you're editing the line.

I have no idea why this is 7 in libxg, but 8 in libxl, but dropping the
-1 here is probably wise.

> diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
> index 8a0da26f7543..4310f4311e65 100644
> --- a/tools/libs/guest/xg_sr_stream_format.h
> +++ b/tools/libs/guest/xg_sr_stream_format.h
> @@ -53,7 +53,7 @@ struct xc_sr_rhdr
>  };
>  
>  /* All records must be aligned up to an 8 octet boundary */
> -#define REC_ALIGN_ORDER               (3U)
> +#define REC_ALIGN                     (1U << 3)

This really does want to be 8 rather than a shift.

>  /* Somewhat arbitrary - 128MB */
>  #define REC_LENGTH_MAX                (128U << 20)
>  
> diff --git a/tools/libs/light/libxl_arm_acpi.c b/tools/libs/light/libxl_arm_acpi.c
> index ba874c3d3224..ac8165de15b6 100644
> --- a/tools/libs/light/libxl_arm_acpi.c
> +++ b/tools/libs/light/libxl_arm_acpi.c
> @@ -107,12 +107,12 @@ int libxl__get_acpi_size(libxl__gc *gc,
>      if (rc < 0)
>          goto out;
>  
> -    *out = ROUNDUP(size, 3) +
> -           ROUNDUP(sizeof(struct acpi_table_rsdp), 3) +
> -           ROUNDUP(sizeof(struct acpi_table_xsdt), 3) +
> -           ROUNDUP(sizeof(struct acpi_table_gtdt), 3) +
> -           ROUNDUP(sizeof(struct acpi_table_fadt), 3) +
> -           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 3);
> +    *out = ROUNDUP(size, 1U << 3) +
> +           ROUNDUP(sizeof(struct acpi_table_rsdp), 1U << 3) +
> +           ROUNDUP(sizeof(struct acpi_table_xsdt), 1U << 3) +
> +           ROUNDUP(sizeof(struct acpi_table_gtdt), 1U << 3) +
> +           ROUNDUP(sizeof(struct acpi_table_fadt), 1U << 3) +
> +           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 1U << 3);
>  
>  out:
>      return rc;
> @@ -128,7 +128,7 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
>  
>      acpitables[RSDP].addr = GUEST_ACPI_BASE;
>      acpitables[RSDP].size = sizeof(struct acpi_table_rsdp);
> -    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 3);
> +    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 1U << 3);
>  
>      acpitables[XSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
>      /*
> @@ -137,11 +137,11 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
>       */
>      acpitables[XSDT].size = sizeof(struct acpi_table_xsdt) +
>                              sizeof(uint64_t) * 2;
> -    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 3);
> +    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 1U << 3);
>  
>      acpitables[GTDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
>      acpitables[GTDT].size = sizeof(struct acpi_table_gtdt);
> -    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 3);
> +    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 1U << 3);
>  
>      acpitables[MADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
>  
> @@ -150,15 +150,15 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
>          goto out;
>  
>      acpitables[MADT].size = size;
> -    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 3);
> +    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 1U << 3);
>  
>      acpitables[FADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
>      acpitables[FADT].size = sizeof(struct acpi_table_fadt);
> -    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 3);
> +    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 1U << 3);
>  
>      acpitables[DSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
>      acpitables[DSDT].size = dsdt_anycpu_arm_len;
> -    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 3);
> +    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 1U << 3);

And all of these.

> diff --git a/tools/libs/light/libxl_sr_stream_format.h b/tools/libs/light/libxl_sr_stream_format.h
> index f8f4723c2e91..b02c954a388e 100644
> --- a/tools/libs/light/libxl_sr_stream_format.h
> +++ b/tools/libs/light/libxl_sr_stream_format.h
> @@ -29,7 +29,7 @@ typedef struct libxl__sr_rec_hdr
>  } libxl__sr_rec_hdr;
>  
>  /* All records must be aligned up to an 8 octet boundary */
> -#define REC_ALIGN_ORDER              3U
> +#define REC_ALIGN                    (1U << 3)
>  
>  #define REC_TYPE_END                    0x00000000U
>  #define REC_TYPE_LIBXC_CONTEXT          0x00000001U
> diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
> index 98d44597a732..9ea64369352f 100644
> --- a/tools/libs/light/libxl_stream_write.c
> +++ b/tools/libs/light/libxl_stream_write.c
> @@ -119,7 +119,7 @@ static void setup_generic_write(libxl__egc *egc,
>                                  void *body,
>                                  sws_record_done_cb cb)
>  {
> -    static const uint8_t zero_padding[1U << REC_ALIGN_ORDER] = { 0 };
> +    static const uint8_t zero_padding[REC_ALIGN] = { 0 };

These want the same adjustments as the libxg side.

> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index d6d462b7bc82..86c86b3e9a77 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -3067,7 +3067,7 @@ static int dump_state_node(const void *ctx, struct connection *conn,
>  	head.length += node->hdr.num_perms * sizeof(*sn.perms);
>  	head.length += pathlen;
>  	head.length += node->hdr.datalen;
> -	head.length = ROUNDUP(head.length, 3);
> +	head.length = ROUNDUP(head.length, 1U << 3);
>  
>  	if (fwrite(&head, sizeof(head), 1, fp) != 1)
>  		return dump_state_node_err(data, "Dump node head error");
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index 2db452144dd4..a880ff678ef9 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -2159,7 +2159,7 @@ const char *dump_state_connections(FILE *fp)
>  		if (ret)
>  			return ret;
>  		head.length += sc.data_in_len + sc.data_out_len;
> -		head.length = ROUNDUP(head.length, 3);
> +		head.length = ROUNDUP(head.length, 1U << 3);
>  		if (c->domain) {
>  			sc.fields |= XS_STATE_CONN_FIELDS_UNIQ_ID;
>  			head.length += sizeof(uint64_t);
> @@ -2232,7 +2232,8 @@ void read_state_connection(const void *ctx, const void *state)
>  		unsigned long off;
>  
>  		off = sizeof(*sc) + sc->data_in_len + sc->data_out_len;
> -		domain->unique_id = *(uint64_t *)(state + ROUNDUP(off, 3));
> +		domain->unique_id =
> +		    *(uint64_t *)(state + ROUNDUP(off, 1U << 3));
>  	}
>  }
>  
> @@ -2308,7 +2309,7 @@ static int dump_state_domain(const void *k, void *v, void *arg)
>  	n_quota = get_quota_size(domain->acc, &rec_len);
>  	rec_len += n_quota * sizeof(sd->quota_val[0]);
>  	rec_len += sizeof(*sd);
> -	rec_len = ROUNDUP(rec_len, 3);
> +	rec_len = ROUNDUP(rec_len, 1U << 3);
>  
>  	record = talloc_size(NULL, rec_len + sizeof(*head));
>  	if (!record)
> @@ -2372,7 +2373,7 @@ const char *dump_state_glb_quota(FILE *fp)
>  	n_quota = get_quota_size(quotas, &rec_len);
>  	rec_len += n_quota * sizeof(glb->quota_val[0]);
>  	rec_len += sizeof(*glb);
> -	rec_len = ROUNDUP(rec_len, 3);
> +	rec_len = ROUNDUP(rec_len, 1U << 3);
>  
>  	record = talloc_size(NULL, rec_len + sizeof(*head));
>  	if (!record)
> diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
> index a9a06e9e4816..309c5bb66bef 100644
> --- a/tools/xenstored/watch.c
> +++ b/tools/xenstored/watch.c
> @@ -349,7 +349,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
>  		}
>  
>  		head.length += path_len + token_len;
> -		head.length = ROUNDUP(head.length, 3);
> +		head.length = ROUNDUP(head.length, 1U << 3);
>  		if (fwrite(&head, sizeof(head), 1, fp) != 1)
>  			return "Dump watch state error";
>  

And these want to be 8 as well I think.

Definitely with the migration formation adjustments, and preferably with
the others too, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew


