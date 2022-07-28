Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A9583E02
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 13:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376763.609744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH1zx-0004wC-LP; Thu, 28 Jul 2022 11:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376763.609744; Thu, 28 Jul 2022 11:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH1zx-0004tM-Ht; Thu, 28 Jul 2022 11:48:13 +0000
Received: by outflank-mailman (input) for mailman id 376763;
 Thu, 28 Jul 2022 11:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oH1zv-0004tA-Lc
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 11:48:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26ac4f52-0e6b-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 13:48:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6454.eurprd04.prod.outlook.com (2603:10a6:20b:f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 11:48:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 11:48:07 +0000
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
X-Inumbo-ID: 26ac4f52-0e6b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAE9UWw7VxfWXvW+4mOxy5HODyiI6YOUdScrj5fiZ2ImfDPEk3YsUUKajs9nMKvqxd83t7qf3ki6fqTa10FfpYrWBeor9XtngQajHF9AwrB++Pcuk25OJfmEhSqXKRTx7tUUZ0MacRTdCsjHUAHILsch64dm+o+LmDthaarfU8bdNCKCqly703ZW7dJ+kWKz4jHy6dlkP0dWTZZ/5Cq7UkrNkdMJbIHqazFfXQC8Pgu5+adi24+7fMHHkGSX+TWfrq9xErOsJPHOO9Lw1uIJ3OAGmBGXOQ1d5m2+Gx6x00scQI0piZsyR761EC5qmR5aENAWL0ilOitpdWxDnm4kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p5OZ2TJ5c9CrAJ0KNTAbYyFf1npzTfjTLEFRILvDjY=;
 b=LPMNW8sfiHt4qPl1kB6B71csAkmGFqIiNcneUvPyXrHs0T5L5eVSsUX6w3XIZQ6oN49o31sImZZDDEUxVBMWGDZl4gYG5azPgml4kWHnPhoUTMYQ/0OgnGth2KbLvsrjGJikkA4eTaikf7SAAOTNNuOCkReOQ0CJ9Gc1sBvu57DRcSy2Ju7tIPulxJpnlKAN6i78YlgPi6dgKFLff0Cu1o9ThkHf1deAN+iNmyh2GIdjSJwuClo0/MaVjQSoPeqWb4jETN5evnKcM1d+xkTcGwS8K+cm1GPg1rOzDgeMJDd3rH5r10LzbZ8W2WT3WG8RwGqRjIM4/f4L8n7Cf78PsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p5OZ2TJ5c9CrAJ0KNTAbYyFf1npzTfjTLEFRILvDjY=;
 b=su6ScJ1ceW4sKEqqcuirTXMtTnoErsc11udzqzCFUePE8jIaybQOrkUFHOxQ4bnoUjqWpwfHXYE+GsHaLrxxPNormmX6z7rzWLwuuRM4dzuXX6bj8v4ZRlUOcv1Ssvi1MaDkSF72tvjtZlo9HjroWQ5XDXOGHWzE1rU57O9yblkd0SSfGVW//tIHSd5hS3T4P+NVnVXQ+0u0Z5grbnfz6RqElC4CMXznEULaoMsDcYtrHYJefuGweF/pKVNfm5BMhEOZfeFII75vIa3q9KF7qZD0kdFR0KRHkaZ4gZajtfD4bV2HupnMm4HlAebAtaEwUqICY6Ux1dMzGCF77UCIOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
Date: Thu, 28 Jul 2022 13:48:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] xen: add late init call in start_xen
Content-Language: en-US
To: boyoun.park@samsung.com
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Chungwoo Park <cww.park@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>,
 DongJin PARK <djpax.park@samsung.com>, Gang Li <gang30.li@samsung.com>,
 Lei Wang <lei19.wang@samsung.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p5>
 <97499212.9948800.1659000157467@mail-kr2-3>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <97499212.9948800.1659000157467@mail-kr2-3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 633e0874-e5cf-4c6e-c27d-08da708f0989
X-MS-TrafficTypeDiagnostic: AM6PR04MB6454:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eVGh/lJ6m1IoXCwltC4Dws+Ykedmjj4KxZNFRwt8N4Ur1UjVFxCNwvMfR0Z5Q9J5N2tiF9BhJLCoyqBESH+vcfzlXSafuYKH3IodUSPt2U2xDtXfjfLstzDOFpqT+s6bEXz7ufeW7R3omGCY9gDJLp/c9FJq1ljVOV+EeSuRxfcrrYVlxOpktIZlUJ5yxZn4ZtknFNb7M6VDTlFeqDjpJjQO2wRipEF3h7a1nLXiqEbMvXQm57bo2Sqf+62rXD8Dnxr6qDikzFFYob9ygJjca18+xlC11z3U9Gm3f1oDPQRNH1ZMk6MRur3OgqqrPKly9KJdRmzv+NW2WJyBeL81NT++1Spc7SPn6S6cyRvKWulIEpH9FH+iUucov0LFyk3CbkAFwlUIs+Ni3tTcNqqGXyauCVHG+HS2XszFm0v2+0nnuBphm4TUY6z5LhYY7Xd+aLQ2L6QoEVTFIxh+g/ax6DNZBxi2UGdpbOr/Vqfe7vGr0yisrn0UIH/h6PkDAx5DMnstHSoRVZ6dLoMYn1/uWaGDtcZ0dX58TOFJ2bal1sPLppplu31+GCsHwE4HcA47lna6KdT+4YgZuEYK9+9ymNMBVW9WFsp8pFypTDx+lH9zjmV9//qUfI4IrznhZtLOJY8XaHBsex0TLXUpB7bHNiC+BYQA9SWbuebnGAp0XdeDPKFoeN0p8JBX0opSTOXwOii5s/K6kHa5Poh5fgN6UYqiu1ZpNc27CgVRAjLJDd2Gtwrb5+UJlxU4VTHb69N3bQxJWZfehvk7ww7kSUCTBMiZwl8ElgddoPKy7TRd0Lk7v0/xWBBnIcH7y9QxYTzTf7f97Ud2QcESFmkc17LvcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(39860400002)(346002)(136003)(31686004)(7416002)(5660300002)(6916009)(6506007)(31696002)(316002)(478600001)(66946007)(8676002)(6486002)(66476007)(54906003)(4326008)(53546011)(8936002)(66556008)(86362001)(83380400001)(38100700002)(186003)(6512007)(26005)(6666004)(2906002)(36756003)(41300700001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzlFd1ZKNytLTTFGdFlGcDBBNDN5dUIwaGIvTGMxZzNKQS9pREtoQ2ZMSU1C?=
 =?utf-8?B?aWRzd0EvTlVtdUlXcUcxVUFCd1BQdFNVSXlnTjJRTGJMS2dZM3owcVg1TVpH?=
 =?utf-8?B?QVBCWTJoUHYwaDdpU0hyQXQwU25icWYvZkxieHA2bGRNNjlMRGJySytpeDJ6?=
 =?utf-8?B?TkRwbC82Z3JBUlZheU54VUxpU3dTT29pSm1UOXM5QjJMOS85TCs4SFVGbzNZ?=
 =?utf-8?B?TjNpNHBOQWtQaUZTOWVTbEpSR2M3MFBjY0d0Sko2cml1NjRGL1laMW9jeFhq?=
 =?utf-8?B?ditzNDZyVEZUNnJ3bFJaU2RtWWUwTEY1ZUhvOXdITGRLRFVmUUplcWxON2Fv?=
 =?utf-8?B?WWhTVkIrNDZQSGVzMXZhcVpuUWxCRFZuQm4yY1hqTDBrMXI2YWlmQnNKSEV2?=
 =?utf-8?B?eXNsaDRmMDl3eHlQSDFNVmdwOWJEcU0wZVZtTC9sMFpPa3R5aHQxeHJOYTJO?=
 =?utf-8?B?OFVZMm1HVEpORmF3K3ZZVkt2OWl2eVlsaUh2cG9WUHBIdjNGcFptUFFSUiti?=
 =?utf-8?B?VVZTT1NHTk5kM2NCZ0RzNk9IajEzRWhJY1lHUnBETVN6TDl0c0hkWHZiUHky?=
 =?utf-8?B?ZzEvZ0h5MmFXcmRwU0RDaklDbGcxdHFGcG1MZlZIOUdQTXFGMkJYN29pUGZQ?=
 =?utf-8?B?TnRqTEh1Z2x6K0pXYXMrQzNUYjEzYmttY1RCbWJZNzErY0NyZnRwQnN0dzQz?=
 =?utf-8?B?MmFEMXR2c2ZUSm9ER0VaOU41eFNoYnNuNm9QU3cyVFNSNk5aNmpuL2FYRzlj?=
 =?utf-8?B?V25naFZKUC9VODBxRzZqM1BCd3pJcHhIb2ovM21xa0UrY1VtSHNvRkd3NXBy?=
 =?utf-8?B?elo5TmJGSHN2MnZEZmtQbmpFb3grekZWc0o1ZHAxRTdianM0OXdWVFI3T3Yv?=
 =?utf-8?B?TGNXSG1iamE5MktuODRRN2s4Yzh3TXI4MlE4N3JEQldXblordXpBR2MrUks1?=
 =?utf-8?B?Nm5uSjgvZ2JLU1pWZGt0cFE3Y0dDWDhEbFAyYXFqV1B0MDNyd3Flbnk2Nkt0?=
 =?utf-8?B?UzBvbGFrVlVTTFJvMThNcjdWSEU2dFJHU0ZtZEZDQjU2YURwZVJ3WXZESGdP?=
 =?utf-8?B?NVNvNGZycC9TRnEvbVd4OWhEb0VOVzFKMzdZb0c0MkptY3ZNNno0MlZsUlRV?=
 =?utf-8?B?TURqcEo5NUtteCtjaHFSb29rWnVwWDdBaEpmRmJrMDAzV09TTG1OcFR2cXhk?=
 =?utf-8?B?UldidG9rMENodFg4eXI5OERhM2tOSDJhSHdwQ0FhTVByWWcxdkZxWUxFdnlt?=
 =?utf-8?B?bmhEUjRORjQwTERDb29IMElzM3VvcEYvWit0TUdXaGZYTDBIaVh3SjFvMi9z?=
 =?utf-8?B?cU1zcmxRbE1HbFZQM2NPamFaS1J0d0VCdW9HelMzbm9KZHJMWU9UZHJWc1g0?=
 =?utf-8?B?c3hpcWJGaGlYQS9UcXlSUG84NzQ3eEdsT0pXOVUrMDRWcUI5QTkyUW4zZzZj?=
 =?utf-8?B?bG0xUkxiNUVTS0tTd3hQWDdWNTkrMnZ2bmtLTE9GSHJmYjlyeUpYenkzL3JT?=
 =?utf-8?B?NTFvazRzVWZGemMwWjhlT09OdXkrY1hubDI3VEs3b3QvQW9YbWJZalVHTk1u?=
 =?utf-8?B?K3BSU2pnK0ZFK1g5OEg5OVpYVEJRS2Y0T1FIT2FydXlpQ05rMytLdHlVa2NW?=
 =?utf-8?B?bEJJcEQxV2pwaGJYay8yaUsyTWY2ZkI3T0RnTUpac3N0ckx3S1NCa3dHN05M?=
 =?utf-8?B?akswQXdQWXE1WWhrNXpNcFhGaDJOWlpZYnJtRkZweFIxdS9ERVVQNWM5Ykpj?=
 =?utf-8?B?NmQ0aXV6MUxIVEt1ZXRKZ3R5ZVJUVDg4cUhMZitOOEJHTjIyZ1FRU3g5eHll?=
 =?utf-8?B?dTdLWGpLdFhoa3lFeVR3c09RT2lCeHkyd2dXNmd3dDhUWEk0dnBoUFJGWjVN?=
 =?utf-8?B?VTJtNmpKSTFBejdjWHhiLzFkSE1CWFU0RzdmVkpYYi9rWnB3Z0IxYVgwcVZU?=
 =?utf-8?B?MGZQYWNmbWdLakpuREx3ZW40WmFINmdRVThPb05ZT0x4d1pPVUFDczl1QzZM?=
 =?utf-8?B?QWtFY01jYkRYb1BlbEh1OXpyeDNyUStNTnc1V0ZpU0xRaEpNQnRpcHM2aDFK?=
 =?utf-8?B?bWwyeEtQZ2UxSDh3dGJMaDZRMXZMZmx4L3o1YTlnQVdFZ1BQS0liQXhScmJX?=
 =?utf-8?Q?/k98m5G3MzxxwgKlmA1HfJYBz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633e0874-e5cf-4c6e-c27d-08da708f0989
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 11:48:06.9941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqzfJmMwdvj+bWCc0Q+vwkXv7sVetYAuhlPFgssCNVFVv1i1PUixXQivn2k/6Nlc96VLvc5XVTFoxQQdqufIQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6454

On 28.07.2022 11:22, Boyoun Park wrote:
> Hello,
> 
> This patch added late_initcall to deal with
> 
> some init functions which should be called
> 
> after other init functions in start_xen.
> 
> If this patch is added,
> 
> then the original initcall in xen will be treated
> 
> as early_initcall and the late_initcall
> 
> which is added by this patch will be
> 
> called sequentially.
> 
> I cannot send patches through git send-email
> 
> due to some security issues in my work.
> 
> So intead, I just send the patches manually.

Which is fine, but you want to configure your mail client such that it
doesn't mangle the patch. Albeit I see that to cover for that at least
you've also attached both the patch and a cover letter. For a single
patch a cover letter can normally be omitted, but if you don't then
even if you're sending without "git send-email" you will want to send
both as separate mails, with the patch being a reply to the cover
letter thread root.

> Sorry for the inconvenience.
> 
> I made this patch during using xen for a project.
> 
> And I want to share it and ask for review.
> 
> Boyoun Park.
> 
> From: Boyoun Park <boyoun.park@samsung.com>
> 
> To: xen-devel@lists.xenproject.org
> 
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> 
> Cc: Julien Grall <julien@xen.org>
> 
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Cc: George Dunlap <george.dunlap@citrix.com>
> 
> Cc: Jan Beulich <jbeulich@suse.com>
> 
> Cc: Wei Liu <wl@xen.org>
> 
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> Date: Tue, 15 Mar 2022 12:57:59 +0900
> 
> Subject: [PATCH v1] xen: add late init call in start_xen
> 
> This patch added late_initcall section in init.data.
> 
> The late initcall would be called after initcall
> 
> in the start_xen function.
> 
> Some initializing works on priority should be run
> 
> in do_initcalls and other non-prioritized works
> 
> would be run in do_late_initcalls.
> 
> To call some functions by late_initcall,
> 
> then it is possible by using
> 
> __late_initcall(/*Function Name*/);
> 
> Signed-off-by: Boyoun Park <boyoun.park@samsung.com>

So I could imagine this patch to be in a series where a subsequent
patch then adds an actual use of the new functionality. Without
that what you're proposing is to add dead code.

> @@ -1964,6 +1966,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
> 
>       bsp_info = get_cpu_info_from_stack((unsigned long)bsp_stack);
> 
>       *bsp_info = *info;
> 
> +    /* Jump to the 1:1 virtual mappings of cpu0_stack. */
> 
>       asm volatile ("mov %[stk], %%rsp; jmp %c[fn]" ::
> 
>                     [stk] "g" (&bsp_info->guest_cpu_user_regs),
> 
>                     [fn] "i" (reinit_bsp_stack) : "memory");

How does this addition of a comment relate to the purpose of the
patch?

Jan

