Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DEB7046B9
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535011.832587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypKc-0002Ab-JH; Tue, 16 May 2023 07:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535011.832587; Tue, 16 May 2023 07:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypKc-000287-Fu; Tue, 16 May 2023 07:42:50 +0000
Received: by outflank-mailman (input) for mailman id 535011;
 Tue, 16 May 2023 07:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypKb-00027r-RH
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:42:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41039c32-f3bd-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:42:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB9810.eurprd04.prod.outlook.com (2603:10a6:800:1df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 07:42:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:42:47 +0000
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
X-Inumbo-ID: 41039c32-f3bd-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc/4rCqq9DWcdIKuGe5SoTI3rM/kqdcaQZ3qLUl0bZTDMkcHb63MJ0UCeJb2ubv58YcNNOLxnSBjlTLVO4GUxcknwHCwy3pItgfX2c2yIlC4yuJ3Sd9qLGdOQ3PuiXqREy7dCAmeI11Pe9LpMDVwSQbWaugdb1LwyEqTjwC1uGVsW1BYgDVzrL5aMO6DzN/17tFFr6/KNYLJ4/48n7eQo3iVl9C3hK2I3lxm+Si6t1YBdHrr/rb4gW3hCNKmglJefiHyUVcsIkA9M9TAnjw2zafJfmEGn0/PCU/IRX+xn3FopCkgWBJ4cngOvm7J2kyvfwnG1eZdUeZR96B3ysaYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0JVlC1dkAfZN2ajpySPkgKYU3aVrOZcOWe5A070b+Q=;
 b=A2jMq2941PMDA14/RasjE9ydKKRuX8go7nzytFKfpIgURIFqCGbugbmOzNWQWopvrdwUgB0AN32/KAnYnOMsxpmRGFbvRpXGXkL2gihcs/QgWU0e5R4l8r7odggkaT0DQc++3QsvP3aUrHjINoWSeW8tKdUTlDvBPx5k4LqXp80v+rzEu/1uMi/RiJs21vOpjbHgAM0q/dCRhv3K4QXXfETk93hD6CnA4xHe1VAkVVslESHTYDcmPVvE4J69VAo4boqzeQTp1HKjAkW/1aXQP+TprErsJ25QNfM1GeUcbrCxcwn+PkLbrZr9NR1CoybdnKM3EXzTyxIlX1De0wY5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0JVlC1dkAfZN2ajpySPkgKYU3aVrOZcOWe5A070b+Q=;
 b=t9rqnB9tWiXSLN+bMnxvUqCnUZ38i6F23EdNyImvuKrZyXn7ABjBc2MTOBMRygQBYGQ6HX0lo+KkMe1Y9Lgz1FLCwxVUS9Lo8e0gDu5LueN+zWYrDVGIqMsH3Fux3uUFtPcxGIRme2nawcQkPy2lT05ezoUerCI2bzeWX7JdaxDh9Y7snil4OtCdPC9ljN0nUWi5E0+hX/7jEyp4mtexqV52WOAoP8U8OHFX91JbRStefFyeWuZLG/aRGWMLSCJB3p128kWnbEl6wDZBu69IQqCjKbRgL+j8yCBw7ED6JFcVuEj1FSdl4UsPD1pYxlDzy8JTFhnYzplNB0BVxiCK0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca8abb5a-8a47-247d-cf56-e730dc76ab20@suse.com>
Date: Tue, 16 May 2023 09:42:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 12/12] x86/shadow: adjust monitor table prealloc amount
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9a0fa4-6eb2-4ad8-5a30-08db55e1249b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fo1hKvmhYMls1YY/C0Seo9l/8V9/+fb05kweTfzMH+w0cCbwDGdDJf73usl48fHa7zqxd7x4TPlcy/pmBRrq6ut5TdzfI3A7X48geMZNkK+sFdSJ0UlN+1kbKweZWOg2jwpFwoL2TT7PpEr4cm8ggGp72HXY3mkMRNNtTHNXNU6zrEaNyU/syzuQpxFK1UcLCDtgd9ZyL08ka1dJA1yA7A6xXadO/KvWimpg4R9IRJ2+D/KTXDioHPFSwDnUIbalmL+VK16ftmLeWaad8SgB+ZtK7DiGhAwpiFKNt7Yjlng/tAyCTy8b82N/0DG5IukkXAi9zrHIOC5sZx7LZ4mbLFrnePXHr+PhMmRkpl8Ostk/unJ2QGeF9buMrYDHVa9s7GbvbEmVc0LCkntcFTnBUeLX28EB+K4kDNwo2Mzf1jLsKslopWKVHGt9J9AVadITm3d+W06tyh4wvEF3oaCRYDAITg+NfY6xHmVJR2baISrvlTGW+zVIkW3kCWrPoURmE1d7Ixu9qpsvcC6AV1FPxWrE9VDMhbbvlC8wSWAMD7z5NM3piIj64DMfhG8o0iUgMWFx2ZwnP3lejAOiocSrTnoX5Y6xUxdNYCIA91VhvJdebXxvTU03p07QkXct/ztPSjyrjIcwaXhfCHcjiJFO6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(26005)(5660300002)(4326008)(6916009)(6512007)(316002)(66556008)(66476007)(66946007)(6506007)(6486002)(31686004)(2616005)(186003)(36756003)(31696002)(478600001)(54906003)(2906002)(38100700002)(86362001)(8676002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDcycGd4VFRtbUFVeWxCK2Jpd1lTc0tzY1E5WHp4SHRMVWdXeWxpL0syekhC?=
 =?utf-8?B?MTQ3eVYzS2NhTkhSSXlaSkpEV2VwNy9LK284MVhLWE9RYUh3ZXRNUm14ZTJh?=
 =?utf-8?B?bDN0bDdhRHBEUWRUUWZCWnJDRTRWeU5RaUNrV2g5UFJIcC9nTE1ySXVodFdw?=
 =?utf-8?B?eStib3FjTTJFMytxU0hIbVdzbUJtdW0zenZ4eXlZQ0VYYzYweFd4YmN3TnA3?=
 =?utf-8?B?ME1HTkhRQXA3eWJmWFpMT2c5VE5pVjZnaXg2ZDF5L3Q1bThzaWRCTjNRVklp?=
 =?utf-8?B?UFlZcnFzYmVTNWRSeDJmUS9DaWcwWE83VGlaUFk2dTZJZTQ2dER1ZkIrZkJL?=
 =?utf-8?B?SXRjMEFOMWUrYVJrOE5RK2dUWXFPMCtrTW1mdjhEWDlkc1ZQaUtRdkpOUlNy?=
 =?utf-8?B?Z1N1NlBWWEpGR2U1K0FWQ0QyNnZUYklnZXBPNmZaOU9YeGZtSFBqVEZpYkVX?=
 =?utf-8?B?RVZiY3JyUzNWMmlwMFJmbW16SnBuWUZaU0RoZ01IdGNCRElxaVFaWVRWalRP?=
 =?utf-8?B?bytnYUhOckY0dWlWYm9QdjhTUnhPdWVtSUc3TEpxS2lIOXpBZEU4OC9oaWFx?=
 =?utf-8?B?aGxseTZnaGRYMVRwamVneG85aUl2RHYzK1dpTWw0NzJpbk1lZWVIRDB0cjha?=
 =?utf-8?B?L3FLNk9LeVdXNHZZbDNnc0Rpdk9QcFgrYmtrQ3hrWklJeDJtNjEwaGpVanRV?=
 =?utf-8?B?ckNTS1docy9BbnBYUGEvcCs1QSsvaExoSWxNYnBQanBYaDlYbG1UUnVwMm1K?=
 =?utf-8?B?UXRwYlE4RS9ocEJEK2dsWkg2SHA1a1QzUEE1QWhNZFRnZHRaNVVuamp0ZnRI?=
 =?utf-8?B?Y2lRSTM5MDZSb045NC8xTVBFTWg0YkF1SkpWUnBJVHlMcE9OWDFIamJuNEJ5?=
 =?utf-8?B?dU5tQk5LR3FGb1dQRlF5YW9HQ0xTZkU3WXFieDd4ZmRydTBERWxUVFhDRUF5?=
 =?utf-8?B?bHRDUU9TaXBKWnU0SmdsRUtMbjdpUjh1aUF6UFI1RjNWc3ltSlFNY255d2Vp?=
 =?utf-8?B?UTFIVFYrakNhMHFxV08yV1p2RDY4aStQU2NCQUFIaDcrbnMvZkx2QXFyS1l1?=
 =?utf-8?B?bkNQMmlzdFBEVko2YTR3QkV6QklvbVpmMU5wTlVWOFN6azE4SituUjJSSGRh?=
 =?utf-8?B?VmJtZkQvdGMxaGlJU1VRZG5HYlJ6dDBDQWIyOTh2S2RMa0s3MmgyeXlTOUlQ?=
 =?utf-8?B?SkczRi9YZ05rUW1mUUZoT2FHUk40cFE3cmxHYyt6SFRqSXh3SEFyVVIzd3l6?=
 =?utf-8?B?dU92MFRqUGRReXZJZUZ0SStYSkFMK3N0T20zU3VuMlc1bGY1OWdRa0Zidlpi?=
 =?utf-8?B?Zjh3b1ZneHg4eGsza2UyMk9vTWlvR2psMU0vMGJHTHAzTmE1UDRwZjJKOUdM?=
 =?utf-8?B?aExtU0NOQ3JBb3RkeG1wS3JpbTF6QjYwSTNTelJtZ1habHNHMmw4R1pZWlB0?=
 =?utf-8?B?TDlOTUFpN1J1eGtnbUJEcDlFbFhOQThlK1NScW95YTJWRDVRcVoyeE5EZTJp?=
 =?utf-8?B?ZmlMd3ZoSEZNTm1nOEhHQzJ4TmplaXBTdWNaSjZmLzBDMU1ueCtZWUtRbkZs?=
 =?utf-8?B?TmpObUF3RHpFWGFKcXBJbHY5Z2xkanVtTjZ0Zmg2eVc2QXFqL2tDYmZ1UFc0?=
 =?utf-8?B?d3VpMjU3OVgxdEp6NHlNVTlPMUpsN3hIYUc5RjhQS2hxZzFTZjV1U2o5UmlT?=
 =?utf-8?B?NkpSTUVyckhMMFpDUERySnpqSTJJUCtGdUFwdC96Z2h1Y2lHc3k5eFJNWHJi?=
 =?utf-8?B?WDNnVDFRTEtjVmpmbGpxN241YnhJWHA0TTZMaGcrMzhibk5LdjRzZ3RXRnph?=
 =?utf-8?B?bFpBUy9wQWVsSWdsbWRwbjFiZ3l3SGQrRHZXZEJ0aW1YNjdFR3JRUVByY0s0?=
 =?utf-8?B?cU5QR2hzYkt2cDJPQXJNbnhURUMwbmhndUc1WGc4VDlmd05JVm9KdDNRS1Ay?=
 =?utf-8?B?akFtWWZMTE5wM1EzcU4zOVh4NTh4ZGEwNU9KSkhncHNYQmpaZzI4VW9hakI0?=
 =?utf-8?B?amdXazc5WVVscnd2WllaRGVZSVhOYXFKRGRPbjNDUzVGVFNJQlYxVTI1TitY?=
 =?utf-8?B?VUNtSzliNXlnQWZDRlhLZEVjNjYxU205SHlZaDZzdlRpWTFBclZMeDRKNzRq?=
 =?utf-8?Q?SYl1xKupnqAnLqQGLNS0mbc0/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9a0fa4-6eb2-4ad8-5a30-08db55e1249b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:42:47.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a44xl5ZM919plSzU7Vwao4AlA5h7Cdi+q6BzgyKKwKRitvrDDoHIT4aoE/6Xdl4WUtbZKNyG8TBC8Ps+LxcyTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9810

While 670d6b908ff2 ('x86 shadow: Move the shadow linear mapping for
n-on-3-on-4 shadows so') bumped the amount by one too little for the
32-on-64 case (which luckily was dead code, and hence a bump wasn't
necessary in the first place), 0b841314dace ('x86/shadow:
sh_{make,destroy}_monitor_table() are "even more" HVM-only'), dropping
the dead code, then didn't adjust the amount back. Yet even the original
amount was too high in certain cases. Switch to pre-allocating just as
much as is going to be needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -726,7 +726,7 @@ mfn_t sh_make_monitor_table(const struct
     ASSERT(!pagetable_get_pfn(v->arch.hvm.monitor_table));
 
     /* Guarantee we can get the memory we need */
-    if ( !shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS) )
+    if ( !shadow_prealloc(d, SH_type_monitor_table, shadow_levels < 4 ? 3 : 1) )
         return INVALID_MFN;
 
     m4mfn = shadow_alloc(d, SH_type_monitor_table, 0);


