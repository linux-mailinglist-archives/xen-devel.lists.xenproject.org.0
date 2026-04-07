Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEWZIewJ1WnMzgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:43:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E232D3AF5DB
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275010.1560983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6hZ-0005oU-Jh; Tue, 07 Apr 2026 13:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275010.1560983; Tue, 07 Apr 2026 13:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6hZ-0005mM-Gg; Tue, 07 Apr 2026 13:42:45 +0000
Received: by outflank-mailman (input) for mailman id 1275010;
 Tue, 07 Apr 2026 13:42:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA6hX-0005mG-WF
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:42:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA6hV-002G4x-QL
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:42:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d509c9-2eae-0a2a0a5409dd-0a2a4504b56e-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:42:43 +0200
Received: from [40.107.208.34]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d509d1-bb33-0a2a45040019-286bd0224056-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:42:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7216.namprd03.prod.outlook.com (2603:10b6:a03:533::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 13:42:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 13:42:37 +0000
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
 b=PMr8jNX0SmxjpMnhTyT/khrDwUUm4iB+xCJByrJZj9YurKerIPO6rdzI++cups352BTWq/7srPALymEbIh/6xxjRw8kkZznTFWdysXTuP7lPH0nbjEUfPo26VjPpgClTXY7JUVjLW9UxY6F4uKlLPZbuCNPNvJYtdHDuVWnRLN6HVOa44uDcQMJ0gtExHY+stwyNde97tA4Uj/OC+DcWulkiOMJuRGo9FGyn5KSn3aiG03kduSmbkJThXTFUW4U9D2dmhgOAlkWAzObbhtQa8pzrLlE4y2D6PnzzdqML9T4qGUPnfKvJCsaQS4TnhTR2dJeNgDqVAaVu9ZiVdPeRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrTWJOnsojOdwRykwQ2fcL41ksKTceX51Hx+RzWGZ3Q=;
 b=o45dR2o4OGFsFM9F9YPHd6mHfSJJhwQ1ENFRGDJ5Jyc2CPWzCaVC0hkY/tHmIu/bXVVsIROLzMDcztrKMwLNE8k4W79iV1aknUH8dY8OjOnr/y2vUOpU0uRQZPHfcYJ9z3kx2Xf/y7azhb6IT01ZxksDfzHcE6oGsLHg8RiKTLNxMMr1vmU1vVTf5vH+SdrIy55/+B3QIZNpcRO19A5APLCRCeGisCjuDKc72sXPQ3qDg89eze3/RjqP7MEtE9yIy5LhZizI+5UXXKxk8CgsIGHUhVFQmWVkxXNGytx3/2wZlOtY4FWSdJoXosU2iPmf8VImdLt7AUnOSPMGNGHBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrTWJOnsojOdwRykwQ2fcL41ksKTceX51Hx+RzWGZ3Q=;
 b=bYCnx0ael5QX/XgV2qqPiZjxMoZdNLkXJLR6BXNmQHGjD/8/KPDaswIxGVot57dWUMoivXEx/em9X+Y1n+7NV2VMDYF8iNjAxpaDP6hqggIN7H4E1lxVDlN6iWh8TMClrS8BD97qqG/kJAKjezy0OedHSTcRJkpsk7NTK/slzGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <59a470c4-9577-4834-8740-20d1e88c6cb7@citrix.com>
Date: Tue, 7 Apr 2026 14:42:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as x86 reviewer
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260407124840.80174-2-teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260407124840.80174-2-teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc44497-654a-4f4a-bd61-08de94ab879f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0kP2yVCAPDZFVkYN8mQxD33qMUklCKQ7kNiwDTnuDyuY82uedteKtB19X1BWRz9uoefykhLWSvblZbt64KlAoqTpqMU2ymDWMS95ggZOx74VX01viAstwhEwJLgLswhLH9KAch7IOlL/WxHRIBiG1eRBkPz5XZi0y8xyHeq+nHEpmQK3/7dyzTsZb1QovO3Vmgk6S0x8PgUJ3kWNIyZbohTbHqmMVzdCjiRRp3dB0Ybomf1DrWZ9VdNnd/QB+ubvIlb2PttrUGEEBjN14O4sbhzCjX+R07O1RQsNEKk4P+vk3Ewm40yw87mzTN65JlkRWqjxB/M6MobTDaOnBEFEJYzhESTbzuj5As9MkioudQPfTqDncZSQIa5uVAs5scuw2AdvRQj+vjbvyyqyp6GOb2DxDnV4+4jAkVWx4nmwaB/EP6Oi5uXZb9WDGgDpSQSPfZ75WKr0YJOAGYSIfV9gwn11miPN950paMHXW3m3wJJUTWSzVwK1CwmEmTvgKn7+Q1Ulp8oqiP+RI9Ag3mrZ/wNqukFSngrnFeydaIEn8AL2WO7xM51jNbJ71JP08IGLLlMMkJclOYEWLo0koPWq68+3njtWabJTSstQb+FETnmLUO5KRvdDdiyxhLzUrCA8iL3tOYph/IrxJ7FR5E0FqWMTDHEr/3tq6GplCSIcHnWmfJg7y2mVeexL3bPKRR/g9SSdmJScmBdfZp1u9ka/8+raPhQIVSQLnXORCIvS/S4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjhlNFdVMTlyTEczY0hZS3pOK2dQUlppUFEydFo0V0phdzlYbzJuSkt4bUUx?=
 =?utf-8?B?dDJYc1RzbTFwK2ZHbVlZMFlCYUIyRDVMQjVYZmlQa0Vha3BlN3ExNmdFYzl6?=
 =?utf-8?B?Z0d4R3M3UUxObE1WMVlaWGVER0U3L0ZQbnM5NHpOcVg0VURjVHJiU1BDL2Ns?=
 =?utf-8?B?MXNSUXVSb0szR0lsUEhqZDQvaUpOREFRVjZRWWF1a2JEYlF6aUhZeFRWK2da?=
 =?utf-8?B?N1RJNHNod2lzcVZlZWNLSG1WNitTTDNkZkpUaUJUYmtCWm42RjFZRW55MUNB?=
 =?utf-8?B?OWw2bWE2eitTNU9halY3bU1lSjRsbFJ0UGUvaFpZV1Qxb1AyRmQwN0xxK3Fr?=
 =?utf-8?B?aW52dFR5T1VtcjZqQ2NwTUNBcHVmZmtoZERENEcvNmlGYitOaThOQnB2aVc5?=
 =?utf-8?B?S0ZyZjlXMGxhK05jRTM5c0Q2WnVqS1BWNDBSM3M2QXN1YXltdHp1K0llQWw1?=
 =?utf-8?B?d3VCbmpHdEVKdGJaWEx0NFBVcXpZb2p3NzdRemFUckduUWhBRkExUEFhYWpt?=
 =?utf-8?B?UTNOMHBFay9lblliREJGZitXTGZJSllERDQ2SGdtdkNCRTNkblJhdU9YVzRW?=
 =?utf-8?B?Q0ZYUkNwTGFTbjdIN3FSdkZqSW5MZHdwV3lqWG9pZ2dZYm1FSmRsVEkyVEdy?=
 =?utf-8?B?dmJPL3Rocmc3VFhVRkw5bU1id01RR1FKWE1YWDMzNmdVKzd3QkthVm9IZFpV?=
 =?utf-8?B?Z253TisrYmU1aFRHVlJwTzFkcmJVdjUvVk9TcjNrWGg5V0ZqSVRwd3hwL1Q4?=
 =?utf-8?B?ZUN3cmF3dEw2cjBOcDZDM1ZTVXQ2TXlHUU02UThDU05rdE9MUmlDL0RZbEVQ?=
 =?utf-8?B?b2UvbERnWERPVVk1eUdNL3cyRmN1MGw3aFZaMVN2aVZWSUNGQ2dham54VW84?=
 =?utf-8?B?WlhsTW80clNvNERZSXBqaGNPclZxSzhUTm1acFBsa3M4aWRwNzNkQ0dFaFRJ?=
 =?utf-8?B?V0paTngwMWx3NEZZK3FmcmxxR3hLOTkzejlKa1hhcmJwaHhvOGdHd0Y5T2hy?=
 =?utf-8?B?UE9GdXg0K2ZLM05sbU5vRlZiRHRmTW01amg0d2NlZzVCZ2l5UzJBeGxYSnp5?=
 =?utf-8?B?WElxVVMwZklpV2ZmSG0zZVRDc2phYVlnRm90NUN1NUt0dTZIcFludjgzWjRy?=
 =?utf-8?B?LzRWUENqTDlsMVVHbVNSWXBvN2hrV2JXMi9uNVJyYUpnK0NXazRKVzhteHIw?=
 =?utf-8?B?N2hCbGxUM1FVeGNTbnl5TkFHb0J1R3FOTytld2JNZHEwY2hQK2ZkaThQa2VV?=
 =?utf-8?B?TnBsT2Znb2NFNjJrWGF6MjBHRnAyeUk3eFJraE1kVDFveFcrQ0FSbjRqcEVF?=
 =?utf-8?B?NWFnUWlmbnkzajBpSGhlZzRVN0hhTk5zdUNCTHUxNTc2UGptS0pNZlVqLzVz?=
 =?utf-8?B?TFBPMmw1eVVWOGlKbnlSMld4dVArUGw3ODI3eHhuajZmbzFuNUVrRWtsaVdn?=
 =?utf-8?B?SWVRMS91ZDZuS0tYY1o1T1Fwa2EvUWpJSS9QOU0vbTR3L3FXcUd6RmN0c0Q3?=
 =?utf-8?B?TVBHYzhHazVGMjFHZWNoemtjL0JQYmRzQ29zbllZb3Z3a1BUZUM5UHJja0xV?=
 =?utf-8?B?UjZBOUp6dG1Fc29BV1JVZnYza3BHYmdVSWNxeVlza0hlbFdiYkxBVmhtSDdp?=
 =?utf-8?B?bU14cUNyOHlHQXJVem05ZVZiV0dMcE55MUtFVi8vdkpvaENJbGtaNlYrd2pH?=
 =?utf-8?B?dVFIOWg1ZVJNSHBkQzFraWRiVEFjT055c0kvWU5EK0FmU0huVWxyUks0Smhw?=
 =?utf-8?B?ZXBxV1JjbFNDdytRaGZyTWx0akc3Y0FMaHpXTzRGeWxxbVBrTDVLdEpNNkg1?=
 =?utf-8?B?NXNsTnhzUjdENU1ZSXRPWm1qS29IeGw1WmxkbUtwdEF5UFVkbUVBZTNNbkI3?=
 =?utf-8?B?eWRGUzRDNU9JNDUyNnA0K0MrRUgyVzBzSVBUWS8vWThMNFBrSFNGUEhEOGpW?=
 =?utf-8?B?Zm8vMFlmeHRvYSt5UmcxMjRYMnZDVzJpYnMxZWxoK3RNZnBlaitEZEQ3cFE0?=
 =?utf-8?B?TkU3a2htVFlONVFjM0dPTDBNclg3RTNNVFVWeVp5SnNON08wSGVxeXBILzNn?=
 =?utf-8?B?RjBYZ0l6d0Q0dXNvaTI4MlRudGFJc3EzSVdXenBBRk1hWG5xR2hNa2Z5NmYy?=
 =?utf-8?B?N0hGNndzYUY2RXVydXFjdjNJLy9McFZJUDF5SjVSY2k3c3lrWFc5VVQ2ZG1k?=
 =?utf-8?B?N0YrWGFEZXNvWnh2MGdXZDEyTWc0RmxhS0JodWhnTkgvUHlSVTlEL3prazlR?=
 =?utf-8?B?QjBTRkhtYy8zRXFFaThkMU9pOWxmWEJGZjJVMGJCcWNlcnJJeUEvWnpyQnFW?=
 =?utf-8?B?MXNpMG1STExDM1V5ejhhanRCN05YV01mZ2NMUVAwbWtUSjhwTGIvZFF5eWlE?=
 =?utf-8?Q?ErqF0MQn7Ej+Z7Uc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc44497-654a-4f4a-bd61-08de94ab879f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 13:42:37.0694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS9z7FowM0+InyTfGJaOip/6RG4GRgJoXJ4uZVFnnKxgc/puxjTivC3uwVed+XaB/GcdeQEwQoJhYj72KYHy/8QWdFNZP7j9ju7BObXGIXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7216
X-purgate-ID: tlsNG-ebf023/1775569362-3273A51B-56F57A20/0/0
X-purgate-type: clean
X-purgate-size: 246
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E232D3AF5DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 1:49 pm, Teddy Astie wrote:
> I already started reviewing patches, but would like to
> be more active in that area.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

