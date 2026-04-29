Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE6aAqbP8WlrkgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 11:30:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1E491EC2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 11:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297125.1573257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1Eh-0004bS-AJ; Wed, 29 Apr 2026 09:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297125.1573257; Wed, 29 Apr 2026 09:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1Eh-0004Z0-6f; Wed, 29 Apr 2026 09:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1297125;
 Wed, 29 Apr 2026 09:29:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wI1Eg-0004WF-DW
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 09:29:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI1Ef-003E22-PI
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 11:29:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1cf7b-2eae-0a2a0a5409dd-0a2a4501dafe-18
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 11:29:37 +0200
Received: from [52.101.193.4]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1cf80-c1f2-0a2a45010019-3465c1048871-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 11:29:37 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW5PR03MB6929.namprd03.prod.outlook.com (2603:10b6:303:1c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:29:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 09:29:32 +0000
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
 b=Pp/Fq87Ej7pZmj9EhF9TwVsyz7IG/fUl9SoRMy/MF8QFekkIpoNAhiyIIhlT5xhxcsysbINip2AhYvMpDYRoGpUg3u530ZsDwKNssRsFSEiiXS8tVPTwvZ8xDXwbmtMhx9ktw+S1PXWQZTFslVh9x269XOEN3yaFG57tUa522JppMh58HTrkVkBaytEL8T/y5N7yH/aTuFFluH9J5tyZdl2+XmFr8DWmAK4TyW7T/f7xqGzXKH1W/QqyJAP3ZVw8EMPuBC7nVPg7wIARd5AX14i2jKmOyu5AwJyWgBHX1qR+LlnMuWlW1MmJiF36SeiTS4jv5BdV3v+O3WLxYAFovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbB1E5VlT1DEVQMNTA5bsGnSuAnodCL0j0hXVGI5LAY=;
 b=g7px2A5qhcw400x57Z7BBdgYX6kOKF0gNyGJYpbFrIVZ+nvsQ+h5z8D9xYRp2dLAD46MPM84yEvkrNlYnTo49axIJuqd3kxJaZ9RKwFVSTkDTEc8t3yfnWJcNCUwEnzBSJ5elFRZMe0cXH8EEC700liXF+517Pm8rzVTReu6bfVaPKuAH9mSfVJIQA0CiGEg5nwNzXKsmxZS7R8TyLOCqAT5TnLoOUPwNGuEkoCs/gmMTjf41LmT6vLYxEb8+LJuM7L08OG024OHcTjtCrPrOjCC9Z0Hbwvtl/jSxG8+97761n8zulom+Fr5KihMeXnNkigRmZWtA6jVPB651NP7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbB1E5VlT1DEVQMNTA5bsGnSuAnodCL0j0hXVGI5LAY=;
 b=KJ24xJqqWkLGDvnYhxK2UTr5W+B5J7Uz/U+4R7hJTcBvvajPxFS0z/EeCZCeX+c+YgvvehDdZVdrPyhSccK1M3v4Umg5K2AyV6qvvDwtph//zJCpBRzpLhjLmBeqHk4zL+1kC4IArFD8A/uM7jBSICnuDyRYSkTIZE8fGFZ4Y40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Apr 2026 11:29:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 11/17] hvmloader: allocate MMCONFIG area in the MMIO hole
Message-ID: <afHPdxc72FDGnQoq@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-12-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-12-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW5PR03MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d3410e-ced2-4087-79cf-08dea5d1d19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WyiMrbKV2b7kmriJgHinSaUfGyjEjvahq0T6wi6+9eSKfviHxycyzyrgsXW7kFjsiemGZSEH5kyabWwbh1YB+GYRqhvC6DhvcNxCJyO+WXFBxdG9aXgLATifWuV+/GGtGPdf7MuDCQzpR0s0HqHks9JgmqPjL0mDjTqI+jwoKIjxAhaVxbqkeiW2qZzNKFH0MYUHfX3m3GZF3IG0zk1+UudjwjrrFpNRs3xapllbbG6H+tjapGYhoETdVHmaFk11askkt1069Xuh+l/beXjttw9dYcoecIEP1OJmZrBAvgLu5Vx6x2pEXE2GDpVRA7ju9OAqIhFdr8UF7LEqRJtX8hP87nM9PPU8v3fUMVv24LKjbHcmCRZgsPAQX0Daqu9TjthdAc5g6Gb4cRK8xK6o65N3rFBT9CkqmjFOsH4KPlLa5nKqJwPIXqq/Xh2wdLTDHiWK39veiVqeUHb8An0hYq/cPaCSBMakbX5N62OyiCG/+rHCBJ2Rw9mjnAdM+Vacpv/a7IqNMCXraXBCZjwOlbN/43LmVGdtaX6igCdo1hCoUwr5A8yI4HwyN/A4b3MzhALXQ4UjHs06yGcU8jMrf7XA44E5vH11OfGt+FhwImbyygy0dH2pRlW4HaWk5SJxkpffZ9xd4dEBmpNP/2UdKFb2rAIwCu8+ZtvEmo5Cso4pPbFG2UPkPfmcUccSOkYhkWnIM/ruZnqg1krWzJlWrUbuQRB8zPLxJRYp/x4k+/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm02c1FabFBickVWN1NwMVM4SmNDVEYrdk45Y0tuUnBORFNGb3VMRUhYZXhz?=
 =?utf-8?B?OTFINTFUejVBOVE3Z0E5d2VsMERMTjE1VXphQTgxUVB0VWlCVWpnb2FtSVR2?=
 =?utf-8?B?bjlmZHpUVjh0ZGFua0ZQMlVBUXV6cWRhRlRkdmZ5ekFtemNsRGNIalNJWUx1?=
 =?utf-8?B?ZnQ3bi9vcS9ITTk3YitVS3ErTG8xeGRoN0hHTlhscjBxQnB4bkNvVDFsRmxF?=
 =?utf-8?B?Q3VXMzA3ZEdPUE50UXcrK2lKWlhITFM1ZmFSNG01bTNWVEVwWW11eU95K3hl?=
 =?utf-8?B?VWZpWEdMYlNWTWNESE5NRzM2M1BHZ3Uzb1UraU1pS3oydzRhZVlLd1ZzSnZw?=
 =?utf-8?B?dlVNMThCakkwYmFzNGdDNTM3RncxNTIyWndlWVFaN09wUDIzQWRRanlCT2pS?=
 =?utf-8?B?Z3lZaitxTW9Bcm5aTGh4YVo2Q3R6RnFaT1RSWUF1ZUNveHQzZkdUblY4bWZx?=
 =?utf-8?B?bG5OcGcwdVN6Ky9JOGJMb2ZUQzc3aW0yZ1VqWG5UQ0NnWjNHRTdhQ0hBeUxm?=
 =?utf-8?B?S3pxYUp6aHhvblM5SGRKa1RFeEcxdWY0dzBMRjBVSU1uVyttRjRCRzRDamdH?=
 =?utf-8?B?RXdLWkNHMzJRM3JxNWhJRDhHbjNISVZkTXB2NnhTM0JWWlRuNVZTT1BpS1dQ?=
 =?utf-8?B?bWZDTUxMM2xxMStHOHlkelVxdGRQTENBQ3IxY3F6c09NR2UvcHZ4Z012cE1l?=
 =?utf-8?B?N1VUV09XTjFENEhMT2RQUFJZdUF1WmRwZVE3N0plOXJ4NytFczVRVnpRWDlT?=
 =?utf-8?B?dm9RaXlmWWdhSUw5VTQzNXBtZHJlRW5FR2RQb2RBbHVqTjRSd1pZaCtRc2Vt?=
 =?utf-8?B?TWExSC9wdWtqMUtPcWdkdVg0dUZxR3NaNjh2UWtuTk9CbDg5bWo3RFdBKzFp?=
 =?utf-8?B?c29RZ01XQTcrK0ZhejRxQW5UWkxyOG8vMUJLVDJ0Qy9ZR3V1dStUVE45VEd5?=
 =?utf-8?B?dlBYQVNKU1pvbUFBT3hjSGtNZ0UvSWVtTXluU3NOWDYyQVVYV2szVFRjL3Fz?=
 =?utf-8?B?QXVwRE9qdW42NjFYem1JVWt1NCtId2twU295QkcvZnNJYTVJenlDTDE0dE8y?=
 =?utf-8?B?UGNQaUNWOHNjUWtWN1I5K2d4Ym8ySllycVhHYWdlSWp2azU1WHlFaE9RZ2Rz?=
 =?utf-8?B?elF6aFQ2Q1BnTDgwLzUzK0pXemhzZWNGdGtFckhWU0VQaGFFY2ZYZERINllY?=
 =?utf-8?B?QnZFL2VPWWM3NFZzYVpUY0wrS1kyK3dJemhPZitpRFVYSEU4QjIzaWo1VW5V?=
 =?utf-8?B?TUVaSXNGNlE0WDZ3MnB5WE5KeG4xdkdGWUQ4UEowcWNmRTdPWnZCU0hCOHdz?=
 =?utf-8?B?dWxQcS9PbkJ1VnFnSEY0eEhIbFpDckFINTVVcS9OelJYbFozZTJuRCs3WHhm?=
 =?utf-8?B?blQ2QjIvb2NhbU41ZkROaTVJaTBpQ0lTY3dFTFJlaTh0ZCtkYjNWazVQQ1lh?=
 =?utf-8?B?bHp4L3NCYm90Qzcyc1IrNW1LSTY5amxZU1dMOHhWdDU5VlNvUEVQWkgzZlgx?=
 =?utf-8?B?MHhwVVM5RC85RmJiY21KWlZVczN5ZUp5aWRlYjV5NEtabUpoT2FwRXF2NWlC?=
 =?utf-8?B?b3V6MUhod0RORWtlYlRPb0U5d05IOFZXQ0tzY2VDU2ZWUTBMUy9wZkdhL1Vt?=
 =?utf-8?B?bXRKL3RlUVk3NU9od0xWMGg1QzBCUGxqbWkrbWZ6Q0Vkdmx5Q3dXZ0ovNis2?=
 =?utf-8?B?U01jU3djWCtKRXk4b2VmQnVMU1ZMUlBwY3N6VUxkdlNwZkpPQWp6U3hqK09i?=
 =?utf-8?B?UW1ad1NXRkl5cGJzY1Brd3Fxak9PWkJiSTVkbWRJR0xoamkxL1F5VVJBRGdt?=
 =?utf-8?B?blJ1Z0ZxdHIrWU90WEFnWUlNZUdjWVZiaXZjVU5ZLzVvcXZSemg2a3IwbVRs?=
 =?utf-8?B?Unk3c3lyZGRXc0tPZ2p0amt5WlVjUm5XeCtYdHhtaWduUDF2SzRTWEdMTmda?=
 =?utf-8?B?OEg1bnJmUkxiOW5OMFNkbWM1Z0ErY3J3em1ZN2IrbUMzd2d4OWxWT0FOYXFz?=
 =?utf-8?B?eDhndGRtLzc4QXMrakJ2SDlnNUtCWjV1MXBHZUJpZzJlZEw1Sm1QQjRqeHgv?=
 =?utf-8?B?ZHpsaWk1anEzcWJZU1N4ZWNmYjI2WFQ0V013Z2pmL0o4OVRydEN2ODBwa2Zq?=
 =?utf-8?B?dkNwTXRsdWpOMmU1Y1R0K0IxTGdRMDBBVW5ycHhpdXFRSFJLQTlrRkFTVTgy?=
 =?utf-8?B?M09GV2tUd2tWTG5MZDd4UTQzTXdSZnFJaWVZbFgvWms0MlI0S3dEUVJyRm5n?=
 =?utf-8?B?WVkyd0NRc2E1dTF6NlhUL1R4M1VOUE9kQ05aSTRqcUlseXVtd21kWXVNekNk?=
 =?utf-8?B?N1pScEt2SExpVWpoUTlQbHNLNFYxOUdrcDhHS2c5VW5vcWNCL1FBQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d3410e-ced2-4087-79cf-08dea5d1d19c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:29:31.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJPowdq/2DaQJBOr/oZ7yTLrUloEo3BriGMjcbQDZXRjlohfsD+nQPP+oG97hDgOTSflAyk10AcxcE/pzQAbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6929
X-purgate-ID: tlsNG-d62444/1777454977-B6E63FF4-4337F7E2/0/0
X-purgate-type: clean
X-purgate-size: 5794
X-Rspamd-Queue-Id: 23F1E491EC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> The actual MMCONFIG size depends on the number of PCI buses available
> which should be covered by ECAM. Possible options are 64MB, 128MB and
> 256MB.

Are such values inherited from the real q35 impleemntation?

AFAICT the ACPI MCFG spec notes:

"The size of the memory mapped configuration region is indicated by
the start and end bus number fields in the Memory mapped Enhanced
configuration space base address allocation structure as shown in
Table 4-3. 0-255 is the range of allowed bus numbers supported for a
given PCI Segment Group."

So it's in principle possible to specify a MCFG that covers a single
bus, and then it would have a size of 256 * 4K = 1M.  Which avoids
wasting 63M of MMIO space in the low MMIO hole that's already fairly
tight on space.

Is this limitation possibly inherited from the way the ECAM region
position and size must be notified to the chipset?

And further seeing the code below - I found the answer myself, it's
because the chipset only supports negotiation those ECAM sizes.  We
could possibly expose a smaller region in MCFG, but doesn't seem like
a good move.

> As Xen is limited to the bus 0 currently, the lowest possible
> setting is used (64MB), defined via PCI_MAX_MCFG_BUSES in
> hvmloader/config.h. When multiple PCI buses support for Xen will be
> implemented, PCI_MAX_MCFG_BUSES may be replaced by a calculation of the
> number of buses according to PCI devices enumeration.
> 
> The MMCONFIG entry is inserted into bars array in the same manner like
> for any other BARs. In this case, the devfn field will point to MCH PCI
> device and bar_reg will contain PCIEXBAR register offset. It will be
> assigned a slot in the MMIO hole later in a very same way like for plain
> PCI BARs, with respect to its size and alignment. At this point, the
> actual base address and size of the ECAM space are passed to Xen using
> the HVMOP_set_ecam_space hypercall.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/config.h   |  4 +++
>  tools/firmware/hvmloader/pci.c      | 55 +++++++++++++++++++++++++++++
>  tools/firmware/hvmloader/pci_regs.h |  7 ++++
>  3 files changed, 66 insertions(+)
> 
> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
> index baaed91c7f..aa3158bca5 100644
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -55,6 +55,10 @@ extern uint32_t *cpu_to_apicid;
>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
>  #define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
> +#define PCI_MCH_DEVFN       0       /* bus 0, dev 0, func 0 */
> +
> +/* possible values are: 64, 128, 256 */
> +#define PCI_MAX_MCFG_BUSES  64
>  
>  #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
>  
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index 6e6720adae..54c23ffdd8 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -413,6 +413,58 @@ void pci_setup(void)
>          pci_devfn_decode_type[devfn] |= PCI_COMMAND_MASTER;
>      }
>  
> +    /*
> +     *  Calculate MMCONFIG area size and squeeze it into the bars array
> +     *  for assigning a slot in the MMIO hole
> +     */
> +    if ( is_running_on_q35 )
> +    {
> +        /* disable PCIEXBAR decoding for now */
> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
> +
> +        switch ( PCI_MAX_MCFG_BUSES )
> +        {
> +        case 64:
> +            bar_data = PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
> +            bar_sz = MB(64);
> +            break;
> +
> +        case 128:
> +            bar_data = PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
> +            bar_sz = MB(128);
> +            break;
> +
> +        case 256:
> +            bar_data = PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
> +            bar_sz = MB(256);
> +            break;
> +
> +        default:
> +            /* unsupported number of buses specified */
> +            BUG();
> +        }
> +
> +        addr_mask = ~(bar_sz - 1);
> +
> +        for ( i = 0; i < nr_bars; i++ )
> +            if ( bars[i].bar_sz < bar_sz )
> +                break;
> +
> +        if ( i != nr_bars )
> +            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
> +
> +        bars[i].is_mem    = 1;
> +        bars[i].devfn     = PCI_MCH_DEVFN;
> +        bars[i].bar_reg   = PCI_MCH_PCIEXBAR;
> +        bars[i].bar_sz    = bar_sz;
> +        bars[i].addr_mask = addr_mask;
> +        bars[i].bar_data  = bar_data;
> +
> +        mmio_total += bar_sz;
> +        nr_bars++;
> +    }

I think it might be best if the ECAM fake BAR is the first element in
the bars array, so we ensure it's the first item to consume memory
from the low MMIO hole.  Not sure how that will work with the current
sorting of the resources based on their size, but it's imperative for
hvmloader to attempt to position ECAM ahead of the other device
resources IMO.

> +
>      if ( mmio_hole_size )
>      {
>          uint64_t max_ram_below_4g = GB(4) - mmio_hole_size;
> @@ -592,6 +644,9 @@ void pci_setup(void)
>              }
>          }
>  
> +        if ( bar_reg == PCI_MCH_PCIEXBAR )
> +            hvm_set_ecam_space(base, bar_sz);

As noted in a previous patch, it would be better if it's QEMU (as part
of handling the PCI_MCH_PCIEXBAR writes) that notifies Xen of the ECAM
window placement.

Thanks, Roger.

