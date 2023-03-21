Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C26C3440
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512731.792901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ped0M-0000jJ-JW; Tue, 21 Mar 2023 14:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512731.792901; Tue, 21 Mar 2023 14:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ped0M-0000gJ-F7; Tue, 21 Mar 2023 14:30:26 +0000
Received: by outflank-mailman (input) for mailman id 512731;
 Tue, 21 Mar 2023 14:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ped0K-0000gD-Fk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:30:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea268075-c7f4-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:30:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8160.eurprd04.prod.outlook.com (2603:10a6:102:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:30:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:30:22 +0000
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
X-Inumbo-ID: ea268075-c7f4-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHi7IykZhIOEGTexY9rvAMwV66Os9kTo3DpqiwV5E2zA4qAyma6K51v4bdsu/uJRmwCSQ2gJyFxzfhC3UKxMitKLySQFXvx4hlEvY02UI6EdorNlWSPMNzILDYexJDg135DHDOhZbRJ60e8U9pnR0AEX0AuESqC8NkxPOFHbUg9naUEoWSTC2soQWlx5Sxr5w76s904tQ1Z+ZjrGaBhZhPeG7VnIR+TRx2x5P1gik225qO+oT/3adjJv/Y5P/HPKroGxijBM5k92qnjP0I7FTiY1XB4nIx0OgkHVOh6QsNztpRRW5Ufb1V2mcfAH7ELL74GvPo/0d3FbF6x60zPShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZypPJmiYu7nEBsosuf5VNByzCo847OfKNrgINYlgBY=;
 b=jzu+cwl1nyjuYJ0fLtNI3os/uPwjGqfcxeRCG+WPM93NgVMxj6Ha3nNOzrjvafw9q7drrasSrLRQDZPd7ZgG6qBWkNrenRirrO0ZGd2R2qY7ddXxrFQIjR5j52GuhGdjiplYkhURMuyUKxsfrqSb9ZRo89lYbKy0GdvbATnEJuC8Qpo08BZsmsU28abExrJzJ1vTLQhBDL60uNHdqr4TV7aq0QHdatcLgKG6XoNPhHot8sqp4X8Yrct11r1Dq08As92ZbqIEPHoSoBQ2W/tVeGz4pnsIoKOMA7Eml8br8HwhZ89T0O4nl9H/NIpI89YzTvk3LBOE0WhM6UfZjAQMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZypPJmiYu7nEBsosuf5VNByzCo847OfKNrgINYlgBY=;
 b=V49TQ9YIbeQsxusFvZEDr/Tc3P53PgEDz+TWJYHLc/b2IvxqGTogPe45klMrc+SPjwetczFJjnN3PrU/bkpEH0pRbwcQ3gU1u3aI3vh3x9P7FybVdGkutYJKL0PN3NPtQUvLXOLM+bqdIW7A4eJAPwoCUiFeLF1WN8hBUy6rBgTw2Zt8Mw1GeO02DIAynfN/hWuucmBQFYwrIDx7Sz5uPjO5L5WpXkryjvH9L44rlvLzpdr0e6RJb9IwWW5M+bJCYP+ZG7yNep52ZLczV2KalrwzXqBlPxFjaoYwDuO/5qefCmf8BbBQQKrAkTubSIThR2Tv/eM7K/PnW9UAFdzJSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7bc583e8-6ca4-2197-2d3f-c4325c024407@suse.com>
Date: Tue, 21 Mar 2023 15:30:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.16.4 and 4.17.1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: b9936d9e-acfc-48fe-9e9a-08db2a18cd74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	43rC1QBA7PJ99Nj17P72Ypwj0HTsubHKdJfdND4ozQ3nuP3u/zHzMVuK1oRsH1vpSPuBT3suho3jZmY2QxYe/JUZzDpf7HagDuxHh0fRYQbwmF26mOviPlyfqTOp3DVdQRt2hAF2N4481FdlZS2f2RUIFjUG5vZ0jjuXQCdopBo7D3xU4w8vZ6eFvf2YRpNCk0SLJdgMqoAxC0vHzgg5KLskB6OC+aMaSVy/CrAtt/iaIO/W/DKRmFGeIHOMgpJNehTtrRT+iqIAlZotiiuaE77SZLoM6KjXblYp8FoX/EcTdG4t3dcRLCR/An3OW1UmMXT4WlnuYMMwKzSiMbpRqyYingR2+q34kr1Z/N3ObRikaWbMTCeQG7qwfdHF71v4YcH6UNJIDuFt/2vn+BZJXqu8TwPh2DBlLB3F3b4td34xjtQDh2vCvlVEeVrgFGSgKw7q14AVXQIGorv7l0z6bygydaNg6A7ktMJ0M7EdDHS7uXQzyS74SWbnzL7JNNFyEdkjW8oKUAmfdeNF2d1LVsiuEpRe0/V/AkVXmmMUwfr4dXw0yBP+AFtr/v/MgVTXBMURtTkbaia5a2aIkCKMO2ZH2NNiDo7EZ5x/YEzHhuu3XG2j7MSSleJq8LqI/CkWE/3T2MrFqeugLTtBZ7GdlL63xVt46f7Li0a6G0M+0DG7psEndb/OpfAnzhqXWeQ0M21qbNbYSpIxf2hgX6FECAQtrFEXu7I60z3OjAzAsl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(54906003)(31696002)(86362001)(38100700002)(2616005)(6486002)(478600001)(26005)(186003)(316002)(6506007)(6512007)(36756003)(2906002)(4744005)(31686004)(8936002)(41300700001)(66556008)(6916009)(5660300002)(8676002)(66946007)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzhCdWFFbUdyL3Q1WXp5WEp4NjdYQmtBQjI2RS91anoveVlUNXJhczREVHRH?=
 =?utf-8?B?MHBIMEFSZFZTbVdvQngxUlEwYlZHYkNRaWtsU05IOXF3ZzNYNzJkMkErdkU1?=
 =?utf-8?B?YWNPenk1RmFPTGQ0Qll0MzF2NnpMQndvV1JoMnAxaWhPcko1MjhaWXEydmlB?=
 =?utf-8?B?enQyVUFBUDNyUGxKaGhyTEkrT29FZ2pEMURINVBQUVd1MzBESGg3Z3JvZjY1?=
 =?utf-8?B?MzF0UjIzKzNEMHhyNjFiSmVod0VUVXNFNVpTUlRJMFVJY1c2aU1TSnp2RVNx?=
 =?utf-8?B?aCtpNitic2xUYjhVS0liS0NlQWZiT3h3bm5EWjh6NXJrWFRodzM5OFg1WmEw?=
 =?utf-8?B?eVBnaEI0MStkSGRrNnNVaGhhbTdoeDNOT0xjN2JSN2sxd3AyMjdZZW1rUWhZ?=
 =?utf-8?B?aVBkekhCVW9ubWRkQjhpMmkzM2FFTi9uUjJXQXpsUkthSGlWdHYxL0Y1VW5T?=
 =?utf-8?B?WThSRWsxWHBRQkVBVTRzOXdnQnBhdnQxQk15Yi9TZHI2VjBleXRCYnVHeVcr?=
 =?utf-8?B?U0tITnQ2dURweTJhdGZzMzhIdklPSGUwbWtBWXcwOHoyR1EwRmpIcDh1Vitj?=
 =?utf-8?B?Z3V2aVRHbkh3OE9NZVNyd2lCd3hLSExYanJsOXVLZEVvUXBURXlRQkhGVFlQ?=
 =?utf-8?B?Ukx2OGJJRHlDbVd5WHl5MzMwYUR3MEZUUkNReW5XQ1ZZNy9yZnZreDl5d3JQ?=
 =?utf-8?B?cU93RzAvU3hOOEZTMG9KQ0M4aHByRmFaU0hCMk1aZ04xczVsdGptZTVmbmZs?=
 =?utf-8?B?VGwyN2Nsd3BKREtwRDVjWkhGcHZHRWFWQW1YR2k2YTB3czdSdlRpcEtNRVdt?=
 =?utf-8?B?N2JKOCtEemZ4VWJnQlRPYXp2bHMxRVRuU0dGQVBidGM1S0kxZ0QrV1Boem05?=
 =?utf-8?B?dUZSTHdVM1ptSTJML0hJYU1ucUxBZk9BdWhpeGJ2QmNhUVdGY2hadEIxSTJ5?=
 =?utf-8?B?VHp3dStPdjRRbkI3bXpkYmlrdEdPT2tVOHVnNDB3a0VEMFBqdHBMTk9rL3Zm?=
 =?utf-8?B?QzNxV3AvMEpvdzQ1V3ZQRlJWZkNaeDhHc3ptdER1MlBxMHJBaWRDSzRMYVl5?=
 =?utf-8?B?V1VtMnIxSW55Z0ZaTEtxVmpHUCtESDU5cG1OMDA3V2lMdGpYMTlycGdSMW5V?=
 =?utf-8?B?c1drZ2h6bHYvcDArQ3psNnR2bzBVRGYwYlhNZzNDQTlMcGtXUjdrUnozM3Z4?=
 =?utf-8?B?bEdXV2dpSjZncUlUbWxpYkpTcEh4VWNZY1F5ZlZnS1RpNjZ4WmR4N1haTENm?=
 =?utf-8?B?ckFPN3FjR2thdGgrWFhzR0NUdHo1TjE1b1JNRC9SMUJGNTlqSWZoYjBkaFdm?=
 =?utf-8?B?Mk53a0ZWZWNreUtzdmEyUk1vSTRDTmhXRzdHK21DTFZKSVRVd1o4dWlVd3Mv?=
 =?utf-8?B?aGIvdC96M3ZmWHFQQzQ4QjJUOHpjclNPZ25NTUZ3UTIzYzl2U2pyMWpVcXpI?=
 =?utf-8?B?RlhZWTFmLzdaL0c3M0dWeUlDWFJQdkRqeHBQeHArNE05alpNemtiWHNlSGpm?=
 =?utf-8?B?UWlQZU5WSHJ3bXNDU3NqY1FvRVBoa0wyZXBaZnZJSlFubTBOZGRia3YvbUJm?=
 =?utf-8?B?UDlpaUcxRysvdmtyU0hKZHFhSXlWOHJmVnYya3h0cE1QWms2MjlCcEhxb3py?=
 =?utf-8?B?SmZiOGtxVm9uSkxFQXpsNXNDVFArSjdvTDY0bUFPTHpOVFJFbVJmcjJaMHlm?=
 =?utf-8?B?VmFCVzBKSU1vaEttbC9QTkxMQzZMVVNOUUxCdjRldzZVdVdXTDFoWjlZSzBz?=
 =?utf-8?B?KzdFSEVaQmRyK2IyUlNnSnpnR3lnL2o3QllWdzQ2aFZua21WMFZUZVJsK3kx?=
 =?utf-8?B?ek9UN1VMNE0vN1lseWVCRjkzaCtiVnlVSm50ckhIZUl2ZkJmdjdkY21GVEhT?=
 =?utf-8?B?WStCYVpFKzlEbXNlc2lHYi91SC9STkgvZ1UwbWRYOU1yRU81QTJ4eXIwVWRl?=
 =?utf-8?B?bk51MzdWK0NQaUNya0RKc2xpeSs0UnhORnB5TTBDL1lxK2VubUU5OUdrYjUy?=
 =?utf-8?B?ZStVaGx5QVh1anpmRk9GTE8yZmo2bEg2MTcvdWhPL0tpZW1JeWV3TWM4aUdq?=
 =?utf-8?B?b05QVTI4V0EwdFJya2F6SUpUdmFVK1J0RzZTNTVpRGpwQmNDQUs2VW0xcjV3?=
 =?utf-8?Q?vptk1Fx8ZIuSoQcCg7W8oqVWI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9936d9e-acfc-48fe-9e9a-08db2a18cd74
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:30:21.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIqThrVUHhnbi11BDrsGkQM8ZIyn0f5a5bNksQ1jCODN0iA3cikSYa5UUrv7ML7A3vI/78HAP3k1O/1bfWhJJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8160

All,

the former release is due in a couple of weeks time, the latter a week
or two later. Note that with us following the 4 month cadence pretty
strictly this time, 4.16.4 isn't expected to be the last ordinary stable
release from the 4.16 branch, yet (unless, of course, we end up slipping
significantly).

Please point out backports you find missing from the respective staging
branch, but which you consider relevant. I have one change queued on top
of what I've pushed to the branches earlier today, simply because it
hasn't passed the push gate on master yet:

0d2686f6b66b AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode

Jan

