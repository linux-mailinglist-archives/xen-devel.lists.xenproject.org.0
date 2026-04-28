Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA6ROpa98Gl0YAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:00:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A333648675A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296275.1572700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiys-0006fe-2B; Tue, 28 Apr 2026 14:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296275.1572700; Tue, 28 Apr 2026 14:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiyr-0006cw-VE; Tue, 28 Apr 2026 14:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1296275;
 Tue, 28 Apr 2026 14:00:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHiyr-0006UO-3F
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:00:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHiyq-002Ens-BI
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:00:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0bd63-5cb7-0a2a0a5109dd-0a2a4504b86a-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:00:04 +0200
Received: from [40.107.208.30]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0bd62-1dec-0a2a45040019-286bd01e296c-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:00:03 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5180.namprd03.prod.outlook.com (2603:10b6:5:1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.16; Tue, 28 Apr 2026 14:00:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 14:00:00 +0000
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
 b=Ip3vmUL41EVVNaGVd+4pDOFpjV/Y7UnIPClLwJgMwjlT1/DU+Xh1mEPbJL/DWhOtSPXAgw4o2V/bgI2NjmowU8ZsSKtRYVjB7rbE+ElswyxC1lV+GzuK/gROEe7xgykM/5pkOCs7LJhK83D3H4nCxCAy/U3934lkw8AJnUbK6lD3ffPzrVcZgZnW2pvrNY/Z1+PpulXC2UKERyXDFN76YyqFVtvLTAvyfM4l3F7NwummgXg+VrUpEiVemFiOeuAgJE1u5SXX0tWBEDHcesTb9lkyh2yQj5Z9lqZt9aNANYjEXh5AWsZd2/QKAaaZFo3XmUmzyuBTtkexw5WTEfkA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy23ZR/MjJDF6E8+0IWgqjyXXvxMd4ce0oxSHXlLcsU=;
 b=I5jCrKV5wBSyvnv5ki3Qn1nV+0tNZXN3I8xhxeBKUDr4/iHIYQzw8M4a8y8MmPzgIQx75kubJVYbYeVE38ssucUklKcUOBvfcs/G48AHn8keB4TY/xOFr9WyY8O0mx5OL15qcWr1rWn3SN8FuwAiIRj0Cht0fPBCrpJiF11EQ0d6ysrAYucT0qfDeZutq+rB/7e/Hx6fyry8ek1ayoD5Fx+7OL2jkRN4SHorDKUg1+KLWrSnIZEwBekq/oB34BspuTr+Z26UaLg2MOpdA9KtKZkwxrPE8B8zcSfJSmyHfClksooEWTeqe9T+77bJfDvZ8LHDAkBclkEQ+DDyGUb/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy23ZR/MjJDF6E8+0IWgqjyXXvxMd4ce0oxSHXlLcsU=;
 b=W6fY7KPSvq9foEaC5JsE0+Kb3cAZDJmNXThl6O+K+5xm2CEvlDzr54Jd7yRITtegvzW3c5la8nBjBw8kzXiGSmkIKoV21xHeg5eKmj3FwWUPijUE1BfVek+SdCDJRsFWkpz0BgCobqvzIk0g+vzZUEPDEyrje2P1tKzITbrEjOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 15:59:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/17] xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
Message-ID: <afC9XAtGOkug0qFB@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-10-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-10-thierry.escande@vates.tech>
X-ClientProxiedBy: MA3P292CA0018.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 740c588c-b6ed-4ddd-b1f8-08dea52e7002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	blnrrtcf+qovnNwgiN6KPPUKVl5ydFpUtksCyVjGrF/aCm9rkhjZgviwgTuV7uW1egXlPTEoTMxYnWtbFLB5r/CXmfydcYUpQJWtPKttkAbZfZWCZ4AU+2yVJkq1aNOEV/CDnZMwWqyL4HjcYNAVKMmWaHP0FHyoS/XJY2R/1Tm6iak2xJvAossErOPiPJSJJJsHWDJQQG12myarHM5eCK3MGRyhOVMpvWIAQRe0hq3uls/VpeQA+cyJOtDNzRWKVau5htgx6LCXH/YFV7EczsaBrCw5sK94ZCSiyxHlOefRzkLgaNea3NyDSdwndKmQna2CZxm6ek41o8NivUMfO9oURWOpw7WIN9kGiDAuZYSPxwTSHmfzgCVm4STMFJ9alfgMDeg2FYwZSTh5bE2tRwr5LexLURG8Hq9Ij8lQDGy+rUVp1ghiT+Xt0IQ87LLfjBgRHLDkDXEryitHGGiDpfQi+fmI6MOajmfOxf/DMxAHnW28jzqqmI7dWCGGhMXF2mG+xkyZLwN857jMKeDG7vOdsPpLhXo+LjzutzGGipihK9G0nWrW1aPZiNshf7fiYq4IUyJSjGfDruAsuSb/33uDKJAvDmOChG/wjmIRHtTCVAPqpL0UuH5geu7sArQ92q8o9yNB8HnnOH6BCM8BbiKy9hhbzSfTA433xWfTFqBmnB/P6pBokEhiiafS2gTLxolCcYYhkBPBc0xKxeYoWBK9fWjTNme0o5OjKrMvjts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2g4bjA2TS9ldWxTSnI1TlNjdllieEFwYlFsODB6ZFhnNGNJL3dJUkYvaXVl?=
 =?utf-8?B?NlE3ME9iTWdGZ3FVUTRMczNkUkRHenZadTZ3V0hCd0d6b0owSkxNbkkyYTZH?=
 =?utf-8?B?QmFxdGlSMWtTa2NFWEtoNm9DM3RCVFEzMTFqNFVyL2Y4Vk8rMjQ0YzNVNXBK?=
 =?utf-8?B?SnVFbWthRFR1ZzlSNVRPSTRPMEpNaHk1QlBIWW83N2tENWs3RXlTdUNhQ2lL?=
 =?utf-8?B?Y2xZQnBMQWU1TmREWW9Sb2hWZTJWRmNMY0oycGRqY2VoWnVIU050OGtSQlBi?=
 =?utf-8?B?bXRkT1lTczA4dUJPTHZCeFA2V1E4VDh5bC85RVZvMVpiY04rTEJXNFU2Qkxa?=
 =?utf-8?B?Vng0TVo1eFJNWWVaMXo2bW5pQUNUTjN2VkNBbzA1RFIvQWJxdEpxL3ErQll6?=
 =?utf-8?B?dE4yV3owaGZCaldqSGdBRWZpSmZhV2FUR2RJRFlCNFRSQmRGWlp5KzMxMnVt?=
 =?utf-8?B?aHU4bEpmRXM2WFN0ZDR2ZVBINGQvSzZ5bE1OeG9kWW03Wm84UFk0R3FQRGFF?=
 =?utf-8?B?T1F4OWZ2OTRJN0pFVC81VWhFZ3hkcDBxOEtJQ0VoWnFuM0EvcjRBN2FzRUhw?=
 =?utf-8?B?ZEhlbXJ3OXQ3Q203ZGxmT1RxZ2VsK2xMcnRCajZveTZOenpuRVAyc1F1R1ZN?=
 =?utf-8?B?anpWdXFPTE1ZeDhha1crbGVZM1V6eWUzMVVhTTVHQ25nUTZ4dEFwaFZXNjJM?=
 =?utf-8?B?THA3L0FtalhZNlRIRmZtVzZuSTRHQThaZTFZTmpuWm9LY3BVTElvOWtsSG9U?=
 =?utf-8?B?RTFVQ0pWQzBibEFXZW5rS1pvWGJ0NWx2UzFHRjVRYjNoTUhZMG5vSm1aRFRq?=
 =?utf-8?B?OFJjNXFNbHhzNlduV0YyaTJCTXd4Uyt5U3M3SnlpeUIyYVVsdG5XeDVOZUJr?=
 =?utf-8?B?NW1xMlc3TFpaYjEvU3BGS2o4cWFnWlhxb05UcUgvN25xejNodmJLZ1Z2a2ov?=
 =?utf-8?B?eE1JeWVweXNVdEtWZWRjZmN3ckhMa1ZpWDJ4aHNDMmc4aWFlNmhMUTNSRUxK?=
 =?utf-8?B?K0hqOTBJQ0lUQXdFRzZoMlNROUlJZmVHaCsyWXNjSTkyMzkzOTdsNm51RkRn?=
 =?utf-8?B?UWVDK0dFSk1aNEJNNE83SDFuR3hXK1p2N0pnRTVKL3NzcnlHcFJCcEE5UUFm?=
 =?utf-8?B?aEFCNTNHazJsaVZZMThTR2hlOHYwc1BwNE1zajZhaUdNbHRsRE5lVyt2SDhY?=
 =?utf-8?B?YXdTS2UwRUdJN3hYSUJIakNORk9ZeDhiZFFDZC9OU1Fubmd5REhPcmNHNWFp?=
 =?utf-8?B?OEtzTkFuZ3RMMDNlZlUxRytlL1Bvci9IVkkrV21pSFFiemlIMnpPNXBMYTRD?=
 =?utf-8?B?Qy9OTW4rZlVvakRCTEtoS29MbFA3dTU4NzVsY1NLQ3dSQTZmbk9DUWJaeVJq?=
 =?utf-8?B?MWNmR1NjMTVOUDRQOXFYMFFPTGQwV0pUM3ZwanFlZkczWWZWc21XcjVXNHZh?=
 =?utf-8?B?cytBMjhhcUgrQzBpSzJHdWpQY2VYTVFBcURoYldhUXJDYWI4MEI1aHdxRGxN?=
 =?utf-8?B?YTA5VmZlVFFjeVNHTTJPUWxBcVJWSStxbnAxRzhIMGY3RndZR2cycjB1V3lx?=
 =?utf-8?B?aGVrbnltYlZkbHJqUWx1a1hIUENWVzBLZmd2enByZDB0K3lELzVTZGp6cHhT?=
 =?utf-8?B?VE1aWHNMVzhDd1ZUK21vK2lUdEdveWFwTnpzN0gzRDFOdHhjOW90TCs4ZGFO?=
 =?utf-8?B?L2pmNzR0dGZ0UzZiZEc1YkpTbTQwN1o1QzNidW5UR0xVRWtSSk1CQ3lLbFVE?=
 =?utf-8?B?TEo3Z2xEWUU2SDZ6K2VlWS9iMUtWZnpXREJleit0ZTVhRXdwRkRQQi84cmsx?=
 =?utf-8?B?WjAyMVlSNm9NRnkxdjJpWGlHS3hubml5MzJvcmhCdnVFYUY4L1MwWEJxc3lF?=
 =?utf-8?B?eHpRbEt6Qlg0N2MwTEdScGRWSUhETDVrdkYrcW05NGltU0NkY3B6MEZHT1ll?=
 =?utf-8?B?YXY0NERzT0liS0NNOFhYY3h2Nzh3SGVOZ2E3WGhvYmlxYkdTMm5MUmhyclJG?=
 =?utf-8?B?RDhRUGkwaUR3Ujl1aEEvY2FVMVFJcUNtYU5acTIxa21tLzEzTmsrQWp1bktT?=
 =?utf-8?B?RGt1SHBtZE1WZTFTcHZnQXNxN0liL1lQU21mRXJ3bGVRWHU4UjBYR1J6YzlW?=
 =?utf-8?B?OHFPTC9JbHNYdk1ieE0xVzc0UVhsZDRoOWpnNldnUzQwa0ROeUJTY2FGdStn?=
 =?utf-8?B?RHMxRERkaEthaFhLditNb2huQk1GTXBXYmlVNU9Fdm84VUJFdENjTDBnVDF4?=
 =?utf-8?B?YWxpMzA1dG8xS1owc3o0WkoxQ3ZJQTI5VG1CaERWNjRuN2czRlF1UHAvdVRE?=
 =?utf-8?B?VEpycVVXbGJ4eEkzeEhxZHI0ejk1TUpUVzVvbGtzVDJyRDdjSmdJUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740c588c-b6ed-4ddd-b1f8-08dea52e7002
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:00:00.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhXgSLzldpQNniTQU5vMHWObnjC/mqri65MD+UHh/+rwXD041vAPL1JY7yTTqAhsB6fFftNaDU7Oc5K0RCp+Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5180
X-purgate-ID: tlsNG-ebf023/1777384804-300413FF-6D9BC56D/0/0
X-purgate-type: clean
X-purgate-size: 5314
X-Rspamd-Queue-Id: A333648675A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim]

On Fri, Mar 13, 2026 at 04:35:03PM +0000, Thierry Escande wrote:
> This patch adds 2 HVMOP hypercalls, HVMOP_get|set_ecam_space, used to
> set and get the base address and size of the PCIe ECAM space as
> configured by hvmloader.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  xen/arch/x86/hvm/hvm.c            | 52 +++++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/domain.h |  4 +++
>  xen/include/public/hvm/hvm_op.h   | 11 +++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4d37a93c57..a46dfa955d 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5195,6 +5195,58 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
>          break;
>  
> +    case HVMOP_set_ecam_space: {
> +        xen_hvm_ecam_space_t ecam;
> +        struct domain *d;
> +
> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ecam_space_t), 1 ) )
                                ^ extra space, here and at the
                                  closing parenthesis.

Line length is also past the 80 character limit, same below in
HVMOP_get_ecam_space.

> +            return -EFAULT;

This operation (and the matching get variant) needs an XSM check.

> +
> +        d = rcu_lock_domain_by_any_id(ecam.domid);
> +        if ( d == NULL )
> +            return -ESRCH;
> +
> +        if ( d->arch.ecam_addr ) {

Coding style, opening braces should be on a new line.

> +            rcu_unlock_domain(d);
> +            return -EFAULT;

This would better return -EBUSY

> +        }

You also need to check the padding fields are 0.

> +
> +        if ( (ecam.size >> 28) || (!ecam.addr) ) {
                                     ^ the parenthesis here are
                                     unneeded.

> +            rcu_unlock_domain(d);
> +            return -EINVAL;
> +        }
> +
> +        d->arch.ecam_addr = ecam.addr;
> +        d->arch.ecam_size = ecam.size;

I'm a bit worried about a domain being able to set it's own ECAM hole,
assessing all the side-effects of this might be complex.

Won't the code here better check the region passed in the hypercall is
indeed not mapped in the p2m, so that trapping of ECAM accesses works
as expected?

Also, how does the ECAM hole get setup on native?  I assume there are
some magic registers in the PCI config space of a platform device that
the firmware uses to position the ECAM space?

Are those trapped by QEMU, in which case won't it be better to do it
the native way (iow: with the config space registers), and let QEMU
forward it to Xen?  It would then be QEMU the one to call
HVMOP_set_ecam_space (or whatever hypercall we end up using).

> +
> +        rcu_unlock_domain(d);
> +        break;
> +    }
> +
> +    case HVMOP_get_ecam_space: {
> +        xen_hvm_ecam_space_t ecam;
> +        struct domain *d;
> +
> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ecam_space_t), 1 ) )
> +            return -EFAULT;
> +
> +        d = rcu_lock_domain_by_any_id(ecam.domid);
> +        if ( d == NULL )
> +            return -ESRCH;
> +
> +        if ( ! d->arch.ecam_addr || ! d->arch.ecam_size ) {
> +            rcu_unlock_domain(d);
> +            return -EINVAL;
> +        }
> +
> +        ecam.addr = d->arch.ecam_addr;
> +        ecam.size = d->arch.ecam_size;
> +        rc = __copy_to_guest(arg, &ecam, 1) ? -EFAULT : 0;
> +
> +        rcu_unlock_domain(d);
> +        break;
> +    }
> +
>      default:
>          rc = -ENOSYS;
>          break;
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index ad7f6adb2c..24ec33fc4d 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -476,6 +476,10 @@ struct arch_domain
>  
>      /* Emulated devices enabled bitmap. */
>      uint32_t emulation_flags;
> +
> +    /* PCI ECAM space emulation */
> +    uint64_t ecam_addr;
> +    uint32_t ecam_size;

This fields would better be in hvm_domain struct, and there you
already have the mmcfg_regions list, which we should aim to use for
the q35 introduced ECAM region.

>  } __cacheline_aligned;
>  
>  #ifdef CONFIG_HVM
> diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
> index e22adf0319..c84febc37c 100644
> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -166,6 +166,17 @@ struct xen_hvm_get_mem_type {
>  typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
>  
> +#define HVMOP_set_ecam_space    16
> +#define HVMOP_get_ecam_space    17
> +struct xen_hvm_ecam_space {
> +    domid_t  domid;
> +    uint16_t pad[3]; /* align next field on 8-byte boundary */
> +    uint64_t addr;
> +    uint32_t size;

There's also a trailing uint32_t padding here on 64bit builds I think?

FWIW, you could do:

    domid_t  domid;
    uint16_t pad;
    uint32_t size
    uint64_t addr;

As that would reduce the padding in the struct?

Thanks, Roger.

