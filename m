Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C962D8DF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 12:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444976.700160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovciG-0005JX-3C; Thu, 17 Nov 2022 11:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444976.700160; Thu, 17 Nov 2022 11:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovciG-0005HD-0O; Thu, 17 Nov 2022 11:05:44 +0000
Received: by outflank-mailman (input) for mailman id 444976;
 Thu, 17 Nov 2022 11:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovciE-0005Gv-BB
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 11:05:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4639b1b-6667-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 12:05:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8964.eurprd04.prod.outlook.com (2603:10a6:20b:42f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 11:05:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 11:05:37 +0000
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
X-Inumbo-ID: c4639b1b-6667-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqseZaqo3AWopjD7rTyhHm8S60fhlx78pXk/DFuZ9WSoB7oodZPjPoTL+TSWCwK/CdQp4QzKJK/H0T8dmnVtecNKkgtHUI1jTEfqcUrSAJu1ySdFczbamsPALoT8QdfiqxIgTXeqW7jI3wXoJWAPeozX8fUCy6rBBGGm5fMvdbfw7d9RsaauP+1/0NO1zjyb/n0+dmNOa1Ymg8FtXmWN412Xqkb7d+7ErIQMlg2BLTA/i/4BLVwQY31E7UAhyq4vS7FjzKxbhR0LG8MbE1TnimIgYOZbefp9/4puGCXzbnfwYInjA2fzEj51cRmPZVfLsNXnK6bFdKXOk9de/sCa1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOPem5wlv44zkGOeFPMl74oN24xthUeEZJcqZUxn0jY=;
 b=LCRZ62GkrIdOnS0iBsNO3juu0wedKpjGNIyhLrWoSl0iIcrOvsCtUGnLtQA8Dm0rOwU3kblPbKvY2++Brk3eh/MfGajFl9E8WI+qd8gnW9Prymi2zJDVsetimmyCRRr6bArFZkWC4QtapYOdYYLe+s7PivoziHqdiEHBcyZPYFp9uysatbLtCO3t5OUnrgVeKDpJoeo2pX4epy9c756m9jlVKoJfsieer8aVdJGj/9mPKtt1FO0UkHk5pmTkv6aIxhJOTBh7mqZLOCDt1D2wzFuutpQzFR5bKXODKduCa7J55QXoTLJ4TLjg7Obnlvy8o1yA90kO7u2YCHO0f4Xpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOPem5wlv44zkGOeFPMl74oN24xthUeEZJcqZUxn0jY=;
 b=sXXSJyt9kClN8WLJGGF4DF+qkJPuLWeNNUAPGpZVdWecJVUG23eRkUig8mt1QudUlq0/ynth84EHikZBwuEetxQ8fDPPgoVSGnIi530VsLjZujkdSBgOEcUmWddOR32v8dHezBJr/VmImr2y581wkYsyUKVnyrCU03oluVXkdavovgeEEdlao8yC3+k+co55zPtUAvPogbmKVL7R1pqGSGledvxaHe9401wPnBXTvC/nbRKbSUNYdRTORpRoKRByptFr5irIXakz3SlQh+7uYIxqJQlHI3nV3ft1lCXzVe4naZfscqaw4sbEGqq3i7IdRR8DCJ+G/mEZ4ld4QHciBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a59fe37-bded-24f5-a2dd-108f84f2c434@suse.com>
Date: Thu, 17 Nov 2022 12:05:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures to
 dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221116164216.7220-1-roger.pau@citrix.com>
 <9b559146-11d8-f848-d6fa-baed7e0fa06f@suse.com>
 <Y3YLpFuYlVoifDuz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3YLpFuYlVoifDuz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 18541070-c601-4964-930f-08dac88ba83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1TE99X7OyV9iFNdpWDBXA+6Laomu1w5HkR8Hz/IwRWx4lOE2zsUFb84ufjftE91UHBHYL4cznVMoKdXo5XNawC0Uq+m2AIC7U4dZyraau9mNXEajTIZR1b3BaJGZheWvz3s4SZ6NJBYIVj8dkoI50URxIoK85V5jsBq1DRtTAvyXLdFACcsD23MQ/4MA1V9sAzBmSaMjpI6SMgUbH8Ddzpv7LTZTUDsolwVgQQR/02bUawddLwdBdIBFD0BbKWgHg5UIltCnx/R2/WV0NSH/UKMzxbm/I18DJ5yEpQyAZv1sxwYwJ2mI31kK4foVLpdMIxsq3/x7DEZkl8epekhz57dae/+meanHOt26RRSeFNuqAbfcks4486xfDJkC6gp+BnUkLUPzmb5Q5jZvallKQAbCFKXxhaghdDx7h0MBONYBE9n20QWldlMLDnUiC6N+FOAtPG+Sf1h2YMJLHgbNyYhHOC0n7qySrXuoatnHBhVYKlTZ2kHU1dl2Zw+L9Jsex+elreOlZQaym8AtcOGD3ofZF9yIlHes37is2tgp3SBLSIFet4+TzJDvBAjJIqo6YsJFH0tdaArj/8h7a5+MQatb6hFyhr45KP86lbLtMhXowxMMSgxTteFYPFM4XibrLBoeJjQrLsDbQubhZ7FD2D6D7I+G5xoj8xiC+QFcpLIkjIdgOHj1ANvxhzvn/QFI4cv1FhVzmLQfnw+wknugCCAmedXWxUFJ9Ourhpo66+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199015)(6486002)(31696002)(86362001)(83380400001)(38100700002)(53546011)(5660300002)(8936002)(66476007)(41300700001)(8676002)(66946007)(66556008)(4326008)(6506007)(6512007)(316002)(26005)(186003)(2616005)(54906003)(2906002)(478600001)(36756003)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmFCWGF5dFhCWG8zdHo5SXIwRmtodmlQdmNrVUlXNHo1azZXMmU3bmhGTjBK?=
 =?utf-8?B?K204cnkxSFAvVVZNZTUvbERuTG8rVTdqa0YxWmhEK2RMN3RNZzV0Unk4ZWR4?=
 =?utf-8?B?RTRFUW9mZzFXN1NOSEJ6WEkvblJHSHNiZW5YYjZPcjBnOXN1cmN1WUI5eWdx?=
 =?utf-8?B?QllsN2FIZkV6QldVcjVYdlBxeWZ1NzVFeGdXQkpaVzJlaWs0dm50em1kSEdq?=
 =?utf-8?B?TVVDK3p2OGN2MmZGMi95WWR6a0Zob1JVMnpVWFVPYWJ4RTlsMEhYNFg3Ulo3?=
 =?utf-8?B?dmRGR1hhSDJVT2JROUtVUXBpSDRHVWt0QW8wS2IweXVFL29oN21vbU1tR2Fy?=
 =?utf-8?B?Z2NFaXgrSmhUdEt5WkEzeGI0bXRhQXNIbFFrUVpEdHBTbWJOSUpSeGU1L0lr?=
 =?utf-8?B?RTd0MWFiRU15WWJDeXlHTFlTcnBHUmcyL1pkSjVZZ1lFMlA4Vk1hN1ZLai9l?=
 =?utf-8?B?NWd2bmZoSUppYlFzVFNFRHRGdHU4TFZ2emI3bWN1WTQrNlBSOVJjS29VblRu?=
 =?utf-8?B?RUc0UWh2eWRVT0tnemVMSCsvQlB2eU5HcE85clU1YWkvM0ZPU1RsVXBKc3Vu?=
 =?utf-8?B?ZFpPTUFyckJlU2ZzTVZNaFFKUjc3U1F5TittV09hWTIzdWIxNnFuL2xUTGdF?=
 =?utf-8?B?Mm0wbFNuS3ZqWk5jOGp2SVVmZjRWSHlUUHQ4enpSU3pUNUZ4TW1uTUd1Qk9r?=
 =?utf-8?B?aUhyZlNkeE1NcmdPenFNNHA4OFVqdlIrQXFBOXYzdGJvcGh1N2lEeWVobFgx?=
 =?utf-8?B?dGpjWldza01YTlg1Sk1ubHVsRmx6eEJON1poM0F0MmRBRjFUNk1BMWR1S1ow?=
 =?utf-8?B?R2ovczNraUN3V0lUQWtlakgwVHN5UmdUVVZjU3lsUHhQUEg4N1dJYzFTR2lB?=
 =?utf-8?B?VlR1RHJMSlpIbUZwL3BHTlFGZVArTzIwT1FUS1dxMnJJRjltWERnWmlLSzIr?=
 =?utf-8?B?UkJiK3diQjNpYmdUN3VJMXZOSGhPUEh0NkRWN1h4S1NTWXBKTk5ZSjI5YTM2?=
 =?utf-8?B?c0s0NU9pdUFMYTRBYnFDMjhQOFNiQ2lvUGgyLzNiT2M0bnU0OFkzcUlLVmxP?=
 =?utf-8?B?STlDbWNlQlQ3WnY5NzhsbGVHYXNjUXRXR2RHM0FkWHdDSkdGbHRTNmlUWVlT?=
 =?utf-8?B?aUY5OE5LL2p3K1VnWUI0anZsRWhuWDNrdzZwNkNpbUhwcUU1ZUZveXlHMlp5?=
 =?utf-8?B?aThqakFKUWg1YmtsdTNwMTJVZE9mTy9XYnI3cm9QYU5VNUsvMzhKd0ptNjhx?=
 =?utf-8?B?dk9tZ1FpL0x5TjNPUDhsS2dHZGhpNzUyVFlYMVVpaGRKR1l6V2RVdkFjaU03?=
 =?utf-8?B?cjd5UlpPL0M5a3Y3ZDRnUXNTdTl0YU5DVGNyOXFCMXZYYVM3eEh4SFcxT2lh?=
 =?utf-8?B?dzRwRlhPZ2t2c2pqNzllNGIrTjJuTU8xbWE1aGZCWjR3cnBDaU4rRG9aMnkz?=
 =?utf-8?B?bWxtY3YwdmZRd0pmeHVFWjgzN0wyZG1jdUZSYVRsR09vYTA2RGJTV3V2RWtx?=
 =?utf-8?B?YzV5Wi9TOWFqd1FVTGdlMm40SFd5bDdBMWU0N0hnVk90elJlUnJqMDVxQXA2?=
 =?utf-8?B?dERUTThKVXdzOG9FY1BnV3U4R3ZNTVVUMGQ0amtrajhucGFDRG1mdWNrWUUr?=
 =?utf-8?B?U0l2c0xpVjUyU1MxdHRLNlU2S2dpQkM5YWN3QVdhbURJQlRqUDA3OEFjeGpS?=
 =?utf-8?B?YU05cXlyZnlwUStha3NBWXhGQzRiS1I0azA2Nm5mQkx1YjhFZ0JlQ2JhSS9Q?=
 =?utf-8?B?dllXeTJ3cURocXZBdjZXVEc3M01vcGpQQk92MlRZeWFRV1gyRVdkYkZGbzdE?=
 =?utf-8?B?V2llRklKWWhWQ0s4Zm1VdlJEc2FaQUp4N1NBNm1GbWZBdmJrbVE1NS9xb252?=
 =?utf-8?B?aEo5QmF2Y2NDaDVPREY5T3o3My9WbllXZytMVDhleEhsQ1lVOWFlTGdWYWZN?=
 =?utf-8?B?RDVlSVNYamNVbGFJQklxZDZBMmY5SGVFM0pPZElEVFNNQlVndFFWdmt2N3Fx?=
 =?utf-8?B?QU5RWjFlRWhBTHc2dnE1aGF6ZTROVDExNmh6VTBVaUpnbjFNSzBMQ1Y3bldv?=
 =?utf-8?B?cEU5eVQxWFlzQml5ZjFFTlRBUlBacXlhOGNoSGtQYnFOeVVubTRsL2tYeWp6?=
 =?utf-8?Q?VHEdHzA3sCrlAfv1PB+cOtBUE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18541070-c601-4964-930f-08dac88ba83b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 11:05:37.5926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8OFJmDAW19upn6mWj0mNnyT7/+4zSMJ0izP3IQC76juh1r9sdp11M3nf5rscx9q1/OvuCPLGru+BJswHChj7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8964

On 17.11.2022 11:23, Roger Pau Monné wrote:
> On Thu, Nov 17, 2022 at 10:27:41AM +0100, Jan Beulich wrote:
>> On 16.11.2022 17:42, Roger Pau Monne wrote:
>>> Currently Xen will passthrough any Local APIC NMI Structure found in
>>> the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
>>> doesn't have access to the physical local APIC, and instead gets an
>>> emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
>>> pins wired to anything.  Furthermore the ACPI Processor UIDs used in
>>> the APIC NMI Structures are likely to not match the ones generated by
>>> Xen for the Local x2APIC Structures, creating confusion to dom0.
>>
>> Plus we should have passed through Local x2APIC NMI Structures then as
>> well.
> 
> Sadly this is not possible for PVH dom0, Linux will use the ACPI
> Processor UID as vCPU ID in hypercalls, so if the UIDs don't start at
> 0 and are sequential Linux will panic during boot because vCPU
> operations will fail.

Sure - I was merely hinting at the original attempt having been incomplete
(besides being flawed as per the description here).

Jan


