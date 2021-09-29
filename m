Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5D41C5B2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199128.352996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZhA-0007r4-Jq; Wed, 29 Sep 2021 13:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199128.352996; Wed, 29 Sep 2021 13:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZhA-0007p7-Fk; Wed, 29 Sep 2021 13:32:24 +0000
Received: by outflank-mailman (input) for mailman id 199128;
 Wed, 29 Sep 2021 13:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZh9-0007p1-1Z
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:32:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d132a86-2299-45bb-b07c-f0a890d0bd82;
 Wed, 29 Sep 2021 13:32:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-41nuvAm4MKqCPRVcxVXYeA-1; Wed, 29 Sep 2021 15:32:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:32:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:32:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0199.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:32:16 +0000
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
X-Inumbo-ID: 0d132a86-2299-45bb-b07c-f0a890d0bd82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632922340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHMBgiVs+96mMllAD1yAUgzCmsNXT083ycPIKU3HohE=;
	b=Ck0Y+VBO00ejInwQEbqF136YHsb1Of8izY00YJtnP+ImNM5CG+QmRZlaorr+Yv9YiEJuDR
	ONP5L3FaV9dDsD9uDOOY0dSDXuxS/uth4lLs60VbN8NE8/i+wYiAWoevSQsrLbtudIq+Ct
	+LjMaKEX/8gYgEircrlYjOewEuvFcY0=
X-MC-Unique: 41nuvAm4MKqCPRVcxVXYeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPLkKJXAwuoLq1mmNASECZnzC1P+gKIG4zOs/a+5ofMQxjkfqrQvAsPcseG9Eef9h/FInEqW7V+XdU9gUz87iCLNKp3zOS1lW4tP95Um/wEvj7QjFqeWiQjxYPu6XGYeVx690uDj+3DuTwFh4S1U2/YXrsONdCnCA7P31LrZ3sK4S1xomGjjT+fqSHBTvE7z9yDN4aiR3CP0A5xN9r1f5qcifY4IkjAkY81eE4MU0Q7ZPwtc9PtM8xJG7yVHyTtPGM2NY3Au2PiGATEsEPslGEzk6144TbZgvWYm9dxp4w3GYegLr9dBAhXyTEMyzVM1gCjBRiJXXpOJKRbxh8lTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oHMBgiVs+96mMllAD1yAUgzCmsNXT083ycPIKU3HohE=;
 b=hq7jAioj2W/mwZVIUXq3qVvW4MMBz/rtAjVPVkKcroiXoYI4ZCVMvBQ8go9VgiOqGinWlvybTpCviVq+opu7A78d+fXmYIB9jVGzO/ezTgiMCU7br7+Ry+FsEnOiJmZ6+j0jpol24JB9wFf79GfC1Q0yQ7dJR1ka9tvz54jXzXCgCwVS4NX01NsSMnqtcpu/0drwov05p4K5FkD5oR9CUTUUFzlSmmt51mr0C/tt40XsIr/FduT5ZGy5sS9Hkq8qxDKMr5dcFg7wyrRNAq9E/g/nV7msVu23P2RYEyAqrdGW7r8jslMTRFLK+sKPJVSeWRwARacj7dyk4Wh/m3vikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
 <YVD59QVbmdVwzYQI@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <033cc499-34de-d27a-7b1b-2a0a7ce38672@suse.com>
Date: Wed, 29 Sep 2021 15:32:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVD59QVbmdVwzYQI@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0199.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d0101ff-0565-4a77-4f47-08d9834d8e2d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27016E671221CAEE36D39747B3A99@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F4JRCpxUgVpsI5owphRY2ylPW4md65DFAvE7THloGCKdxyGeHT8s1mN2/W2li3bbmmv5Xk1iNeWjiK1kHF0rklte2SBuCoXg2kh9yDoZS+EwlMtuN/1k/76OAYb9FIzAjMM4HryBaSf/742Kgv0jsxOFbUY04zyxQbWuU14Aa1KwtitOr0i+i0L/C425RIb7FUl1eNcGWdeP+PmdK/4T1b0bUFjqni5SWJhMxw2kJzSy1C0u1eJOUgMGqGQSBiBAJEcIakL4Qcn7cv4kfOPkNG9Z4MggvGZLTmRVW0RmflLyH95ghSndySzqypqCksXgkqJzk+EqS3Tfba5k8oe1JBA6G/4HdRmmlHRzTwRaYk9cXwuXWRgpIwzWFhAt6Wd2QxxyOGR+E/Y0cSvQOQtMn6v/nmDct2KNDa6/SxulVf790FpqfVfS8FS0cXw69vefK6jR84Xv10Fm66sL7MqiEKEKuPvueLb2curVfAFRpSLEkCyUhD2/ewpPRi+Sr/L3Y02lFDRy+agruKjcT2cZIngNLBIKLEZvKKL2wBhPa4jdpbin8x87yA4Qi5U3hxSrBbLMwMgha9zRRlZ+0UE83j6tlGJWgEjo8N6j30odEsC1v76M9qOSq8ggTgos34FJmHKFHTVxn8W+JND6RP3dGI8mwarPlHbXnJSnxcFPZHVG84QSgiF0qyveTD9SlZOcSI3ouZokYJu0kJAfZquAxUS704yfvKWonRyAEj07BjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(16576012)(26005)(38100700002)(53546011)(31686004)(66556008)(8676002)(2616005)(316002)(6486002)(186003)(2906002)(3480700007)(66946007)(4326008)(86362001)(8936002)(956004)(66476007)(31696002)(5660300002)(508600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yy9DY2hzSFE5QlgwOTl2WlIxQkRsWC9EVlRmRkVYSFZxdGlqNEVnNWQ3M3RY?=
 =?utf-8?B?eFZpYjhMRUxsR0RGaE9LYUlyNEtuUEt3RUxWRHdZVUd4YmZRWnoxTmpqcWxj?=
 =?utf-8?B?R2hYZGlsNExqa0dpYWtvYWErQ3MyaEFvb2hadTQ2UGVlTk14VzhrckI1OEJ2?=
 =?utf-8?B?UXpXVDZXSm4zeUFDdEYrR1FUdGVEOHdsb1o2M2VQeVdkM2dHOVZQLzNBNnhX?=
 =?utf-8?B?Y0F1R3MxUVlYaEdZN1JRUHJUd3FVV2VWZmlrT2FTVjJHMUpzQ2ZwdHU1dkFU?=
 =?utf-8?B?RFFZK0d3Q29LODNNeFRxTDl6dEkrSEpGRTBoa1NRTnR3M09PSmdNK1BVYXR1?=
 =?utf-8?B?bmFwZXNZQ3hMNnQxVTBHWmppRkxQTkE1WUJ1amhVVlNDMzd3N1YxNDRPRnds?=
 =?utf-8?B?L1JFalptSDVxYjNaNzlQUmt5Rll0bVlYNEE5MzZTSVFYKzF0LzAyemxKM1pp?=
 =?utf-8?B?UmFreSthVlNiUEFhb1RMd0IvVGxaQ3JxN0c4dGxwdENlbDdUMGpmc1RLTXlz?=
 =?utf-8?B?VE9mVDcyZXlrNjVvcVdFbDlsUGg5d2d2eklhNEJnUmZnalRhOHJIdHZBWkxp?=
 =?utf-8?B?a0cra2tTeTRSVHozVUlpTjNhZ3RaWHpvVy9paEhnRUpHekEzS2NWTXgxSE53?=
 =?utf-8?B?ODdRSnZWT1g1SHVpK21BT05LOEc4a3dHdVlvYXBHL040RkxVcjBWTW1Ia0pT?=
 =?utf-8?B?bm11N1Fac1dRYmlvKzdZbkdWU2ZmWkZXUE93TDFLTGhnSXptM0wxb0l1eVVE?=
 =?utf-8?B?eUJCSDRFa1I0WGd2dmpyZklVamN6SUhrcFI2eERhRUJuT1d5Z0FmaHRzNUxZ?=
 =?utf-8?B?a3MyVVRSRWw4ZDRXUmtZSEwrd2dMQ0pNYVRHVktjWkZab1lORDc1OFhJVVFK?=
 =?utf-8?B?amZBNHBLdTVLYzBwYmdiUHAyV2ltVURyK1FVQnNPczJOckpQdmsxZDlaaGRz?=
 =?utf-8?B?QmhiWERLYmpJeDhVdkgvbnV4TXVQWG1yTVQxdnZvY0FadXZCMGFUZ1JobnIy?=
 =?utf-8?B?NVpodHlWcXIrRTVMc0tZTDFEelBNR3BPeGNkTEY4ZHlQb3EvdEF6M2tnUXo4?=
 =?utf-8?B?eFJIVjIxSzNmR0I1c090RHFwbjNBR1pUNVAySUFVek13dktNOW1KaWsxekhD?=
 =?utf-8?B?OTBTWDFiNzVVQjVJYWM1UDdjbGZLSE43SGxBSDhjWndrZHAxT0tRRm50MUJq?=
 =?utf-8?B?WWlmcWRSeTNWNWkyOG5FL1dXN3lYdmpqdHJTbk8rZEdQbFFWK0hlRWJkT2VK?=
 =?utf-8?B?T1BlNFN0SHMyV21jYWJ5L3dodWFxdUhoYzBPQWVVNDAzWFg2N3JKc3J1bFJY?=
 =?utf-8?B?SlhjR2tsTGJOYlg1N3hzUkpXRzVBOXJPRmJmTDVNdWt5RzBnNHZxZmd2N25C?=
 =?utf-8?B?TVNVeTR1djZNYSthbTJCbXdYZGpxYm1hMkRhWi91ZTVodW9TMDB2QjZtWVBv?=
 =?utf-8?B?NzJScmlZcWIxM3F0dEVrN0ZKQ2pLWDdMeWRLVm5JVktVcTFEQ3dyaUpXRytZ?=
 =?utf-8?B?RFhmQjNFOEJ4dTdCZXVxNGZ2OFRxbU1wYTlieU5FVjZMR2NUdEZHSTFBMEtI?=
 =?utf-8?B?TjRjZkJ2MzAzNzU0c1hRQ0krS2c4SVBGUHY2Yy9Xd2R0ZDBJRWY3Sk1lRFJa?=
 =?utf-8?B?VXpjWmM0TFdhUThDemtLTzhTLzEreStPM0FSMi90Q1JlY3JYaFlMTkE2V1JS?=
 =?utf-8?B?Mk9FZm4vaGpkZnFBRGIwTnY4K3BzWDhXaEh2SGdKd0NmdnI0bUJYM0J1V0lq?=
 =?utf-8?Q?4oq+RXP7Ca3JFrRJ9uCB7nnYD228wTFmU/cqvxy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0101ff-0565-4a77-4f47-08d9834d8e2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:32:17.3788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZwONhIVppji53T5njpa7ubqLv/gmJlWk70JtpC9pDRIh/dsaaTCkG8YgmiiHCLZQO4WmFtjmZH99DXl+Gafqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

On 27.09.2021 00:53, Elliott Mitchell wrote:
> Getting everything right to recreate is rather inexact.  Having an
> equivalent of `sysctl` to turn on the serial console while running might
> be handy...
> 
> Luckily get things together and...

Thanks; finally got around to look at this in at least slightly more
detail.

> (XEN) mm locking order violation: 48 > 16
> (XEN) Xen BUG at mm-locks.h:82
> (XEN) ----[ Xen-4.14.3  x86_64  debug=n   Not tainted ]----
> (XEN) CPU:    2
> (XEN) RIP:    e008:[<ffff82d0402e8be0>] arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260
> (XEN) RFLAGS: 0000000000010292   CONTEXT: hypervisor (d1v0)
> (XEN) rax: ffff83080b2f106c   rbx: ffff83081da0f2d0   rcx: 0000000000000000
> (XEN) rdx: ffff83080b27ffff   rsi: 000000000000000a   rdi: ffff82d040469738
> (XEN) rbp: ffff82d040580688   rsp: ffff83080b27f8b0   r8:  0000000000000002
> (XEN) r9:  0000000000008000   r10: ffff82d04058f381   r11: ffff82d040375100
> (XEN) r12: ffff82d040580688   r13: ffff83080b27ffff   r14: ffff83081ddf6000
> (XEN) r15: 00000000004f8c00   cr0: 000000008005003b   cr4: 00000000000406e0
> (XEN) cr3: 000000081dee6000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0010   gs: 0010   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d0402e8be0> (arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260):
> (XEN)  e3 0c 00 e8 30 7f f6 ff <0f> 0b 66 0f 1f 44 00 00 42 8b 34 20 48 8d 3d 8d
> (XEN) Xen stack trace from rsp=ffff83080b27f8b0:
> [...]
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0402e8be0>] R arch/x86/mm/p2m.c#p2m_flush_table+0x240/0x260
> (XEN)    [<ffff82d0402ec51c>] S p2m_flush_nestedp2m+0x1c/0x30
> (XEN)    [<ffff82d0402e0528>] S arch/x86/mm/hap/hap.c#hap_write_p2m_entry+0x378/0x490

hap_write_p2m_entry() calling p2m_flush_nestedp2m() suggests that
nestedhvm_enabled() was true for the domain. While we will want to
fix this, nested virt is experimental (even in current staging),
and hence there at least is no security concern.

Can you confirm that by leaving nested off you don't run into this
(or a similar) issue?

Of course you not having done this with a debug build (and frame
pointers in particular) leaves a level of uncertainty, i.e. the
real call chain may have been different from what this call trace
suggests.

Jan

> (XEN)    [<ffff82d0402f009a>] S arch/x86/mm/p2m-pt.c#p2m_next_level.constprop.10+0x24a/0x2e0
> (XEN)    [<ffff82d0402f1097>] S arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0x3c7/0x7b0
> (XEN)    [<ffff82d0402ea0a6>] S p2m_set_entry+0xa6/0x130
> (XEN)    [<ffff82d0402f4ecd>] S arch/x86/mm/p2m-pod.c#p2m_pod_zero_check+0x1cd/0x440
> (XEN)    [<ffff82d0402f023f>] S arch/x86/mm/p2m-pt.c#do_recalc+0x10f/0x470
> (XEN)    [<ffff82d0402f02ed>] S arch/x86/mm/p2m-pt.c#do_recalc+0x1bd/0x470
> (XEN)    [<ffff82d0402f00ed>] S arch/x86/mm/p2m-pt.c#p2m_next_level.constprop.10+0x29d/0x2e0
> (XEN)    [<ffff82d0402e03da>] S arch/x86/mm/hap/hap.c#hap_write_p2m_entry+0x22a/0x490
> (XEN)    [<ffff82d0402f0fe2>] S arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0x312/0x7b0
> (XEN)    [<ffff82d0402f0c4e>] S arch/x86/mm/p2m-pt.c#p2m_pt_get_entry+0x3fe/0x480
> (XEN)    [<ffff82d0402f59aa>] S arch/x86/mm/p2m-pod.c#p2m_pod_zero_check_superpage+0x17a/0x600
> (XEN)    [<ffff82d0402f5ba0>] S arch/x86/mm/p2m-pod.c#p2m_pod_zero_check_superpage+0x370/0x600
> (XEN)    [<ffff82d0402f7c78>] S p2m_pod_demand_populate+0x6b8/0xa90
> (XEN)    [<ffff82d0402f0aa6>] S arch/x86/mm/p2m-pt.c#p2m_pt_get_entry+0x256/0x480
> (XEN)    [<ffff82d0402e9a1f>] S __get_gfn_type_access+0x6f/0x130
> (XEN)    [<ffff82d0402ab12b>] S hvm_hap_nested_page_fault+0xeb/0x760
> (XEN)    [<ffff82d04028c87e>] S svm_asm_do_resume+0x12e/0x164
> (XEN)    [<ffff82d04028c87e>] S svm_asm_do_resume+0x12e/0x164
> 
> The stack trace goes further, but I suspect the rest would be overkill.
> That seems to readily qualify as "Xen bug".
> 
> 


