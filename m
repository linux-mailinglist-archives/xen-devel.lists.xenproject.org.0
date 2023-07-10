Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA8874D0B2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561126.877474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImi4-0001WP-G3; Mon, 10 Jul 2023 08:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561126.877474; Mon, 10 Jul 2023 08:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImi4-0001UY-DR; Mon, 10 Jul 2023 08:57:32 +0000
Received: by outflank-mailman (input) for mailman id 561126;
 Mon, 10 Jul 2023 08:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImi2-000090-Bw
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:57:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cca8e8f3-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:57:29 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 08:57:28 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:57:28 +0000
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
X-Inumbo-ID: cca8e8f3-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqhmvAiGahJ8duQQHzJmRnOJ3n1Rg6hvRNaMtJ8e2iXR1VLHaGml/ujHjFsFYkDQeHyTK8ttM6N/3QuAfZGkGfjNkTylhhXuIvzGI9PcFRivFO3y964qABLn9SuRTpKQeR7VvqI3+Rfh0vhMBJE2RjWEtoxiL7Q9zAfuFiLgNIZqMiKBl7TdY3tm6plNcUtTIObxx47j4/EcdqIuG5UfLrnrOjW+2t+qcpztXpsTbpD59ZpZiQiZzbqfJV6S+T1QkGSsEt9pbYLE9dEM47RE9MH0yq1wIPQhlQ3J6OeYHoU8dDYQnuOLSho1ous+ETXgiOv+tCj/t9ZxBA0m6s/sGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsniVDfE1jEbPDiRAa4YFhSNPmca1KwD931ycm8eIt0=;
 b=BYM3j4R0yhxRcPdJs5jjgo1tuCpsz6cv/Z+wtREnDZActYTjScJp102wu6W05lMUd9WTD8CTA773wYAkRaZ7mbU0dykYQWnXMSKqTdp86i6jKxCohR1gXxZfBiFAnDCy0hqMSt+re6WQ0QLs6Tep3AQzTaD/bx0ikF+Ab0fA6uOPXc+xaok+9hyhKu4t3cEk2z4kRh+P0VL63U+XHB8WVw6NsUpyGcnOK68IAcwDwv12bzkv48UwiLVjZ6Bu9IoxgTR5qlYQ0AIIzM8rPtWDGx6O0UnEgT7caX7794luGnS7vv/wFTDvD8wKXgnHedqqEzCUt1EEcW4ty8e5WNbTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsniVDfE1jEbPDiRAa4YFhSNPmca1KwD931ycm8eIt0=;
 b=bpEg4BDpgkgaIbGeGiYYBpwWRnrxzUb93VPtufmn9qSO7dh2Iu5rO8/9RJlcpGwKd4yj4jDStuBJS5IlPNZ6I3yzSCuq3Y5XbFAdHaaYUBFcufAuclE5yDSy8QvYqNj+OHxpEz4SOGuKBVbKTYV4XwtLZaH/1xlxzK2BmT8lUWmrh9INwLHhiqKW7D8SKr1RbweRmV3haPqE+egQg92AcFnWZSHfwVC4qufBYLjp7peaTrwd2d67gNHSXnP6EKx1jRg2V+IzNhHHe5dJhQE9e+P7KREVmS0KgPCrJA89P7zPW9Q/BZ5gJ+akvcCFvxhrElxunqbB7R6Tjhy6iQhinA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84b2fd88-d852-b1e6-0f4c-cecdcb8c7943@suse.com>
Date: Mon, 10 Jul 2023 10:57:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 8/8] tools/binfile: switch to common annotations model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d91873-9b3f-4a8a-2c2b-08db8123b014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yVhn8w4nJwd6URS7uBN1XHBU7MT9ohHrk1AVYuHvAoIuhlRg+Q1NQXmT0bs8LQ22bXtTUavYfHxSxm8qyk9sR/hoffg7mfiEEkpmrSsUE9MEtVFCUoMGbmq0eN57xnUZ53QJnKYNI7t8+sjQcu7YQ5W9ydQKI7FT628kJ/T94eYbV/HPkkDtSdfCCOBQ66c1QQ4hZRWkWfiQ6vY6WmrujGQ9HPXGWfjG3v4fKxDFE1ZA4YWJ9rvMop5OupipH8eFMHLsOz+jMSEEPvLGitE8ioNrQtWY6hFkkKTl+1xVSgsLpLXwVKx+DpDbn8W3RbspAdk17BNQb/KQNd9T10NlWasfVDL6aF4800tDjt9AYFT0FftDgN/qbb+CcLxWIxTY0SS/p2ABKeynXc1cavgzguXqJpHIbcj5RMndQ9nuOAL2yJQyOnhlRpEZkKlrGQkcHgh0krUu8hsUc3THW7tlzaoL1fenrlsECidJX7JRAAR+re/8aA6pgFuDWZ3ukNaUumNqDNLAlxYV8S9//63FHueYscrvl9z2q16j0Vq31eLzFrsnGsg5CClRmNVHOaWUSmlyEum1yRbHSPjlClz97Td0tcubaSo/+5J/KfaG3r/kU5x0rF1Bh2Fmz00yUN7mOEdCd9l6LIox6u4TemJXpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(66556008)(6506007)(66946007)(4326008)(66476007)(6916009)(38100700002)(41300700001)(478600001)(316002)(2616005)(6512007)(186003)(26005)(36756003)(6486002)(2906002)(8936002)(4744005)(5660300002)(31686004)(54906003)(86362001)(8676002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjJ5aUcyMWdvanFBYVNuWjB0NHpEWTBibVJzMmpScHdXWDVHM016cXpuMWJk?=
 =?utf-8?B?SkhMUVNtcWVLd3ZMZXV5SUdkaHM5VzZldWZ3R3NQdGY0UU1pS1J6TWVjOEgz?=
 =?utf-8?B?WnpaNmNxNndUc2NTYTFqa3RHblhiRE9NUEovbUg2Z0YrVHRma0UzVkxNemlW?=
 =?utf-8?B?Y3NFMVZqL01yV3FzejVibDF6d3VtTnc2UTJObjVtL3R6WktvZUZLV1VkY29E?=
 =?utf-8?B?MHJuODU3c0JrN0tLZTFmcGhJMHpadmMwcVY0M3UvYmhmcHFEVWk1Z3c0WHU2?=
 =?utf-8?B?ZG4xTWJJZnJmMks3V1JBbWU4Nitpem5HNFN5UlUzZ3paOENhT1JxcE5XOFJR?=
 =?utf-8?B?TWY3M2dDZkMzc0RvM0VRMlpybjRSeWdWRXczV2FUNmRVUUVmdnQ2cTlNM01w?=
 =?utf-8?B?bTMwN0tTcnQxdHJMdTRLU1A1TWVSQzQ4RUhxUitMejFrYjA2ZHpPSVVGUG1h?=
 =?utf-8?B?QWMrcFVxdXlzTjl4WEt1b3V6aUNBaHcwcUpvRW1YRC9QNnBkNzlHUnVVRjBz?=
 =?utf-8?B?MENjaWVvZEU1OTNJb1NjVVlvcC9NcXFrNWtWa2IzVFhDUUNDZUpwdkNjWnBt?=
 =?utf-8?B?U3l5TXBNNXZxUG9oY1pZVHNRdTByVUV1QWJvZ1dHQ1dtL0VWSjY2dEt4c21v?=
 =?utf-8?B?QjQ1KzdodEFlVjFmdTVha0hEbHhGaHZVbm9XVmdKKzhDYVZsdVdxeUgrMitX?=
 =?utf-8?B?bjJVbHNOakFQODB3SUZKYTc2VUJPOEkvTFRDa1VHVXYrNXhPQzlNRzVCbGlX?=
 =?utf-8?B?REdtaTR3SHZyT1o3M3VRWDJiYkVqeEEzTTlERnFGRFE3aXJXcXJCU0tMZHl4?=
 =?utf-8?B?L1FOVkkyejZFNHR5Z2NhYlM4Y1dSd3lwckhWU0tKaHR3VU4vMXg2dXo4WEIr?=
 =?utf-8?B?UHdtcXREb1lMZWE3QmxqZEZCLzkva3BydTc3VEcxS0VzWjRqazJsNTlUbS9D?=
 =?utf-8?B?MlZWNHZ6YXJaemRweitKUnJXT2dxVE4zNzRDN2lZNk04OGwwWGhaWnNNa1pK?=
 =?utf-8?B?c1EyaHJiSXI5U3RxZXlpeG1Rc2txSTB3d0tieEFnSWpMOXhyaGQ2VjJYeEQw?=
 =?utf-8?B?QWI3YWp4ZEwrbmNlRWhxckpuZUplZEpKT0oyTjd3cnk4cGpGL0k5ZGJJUFI0?=
 =?utf-8?B?bEVBZi9RQkhGSW9kQlZVUVVUUDVJc2Z0VTlST2U5amJIUVp1ZGw3QlZyNlpr?=
 =?utf-8?B?QTVsdk4vUUdxaGdCU2VtdmEzeUNITEdJTXN6MFd4bFZXblAyZml1M1NsNTIx?=
 =?utf-8?B?cGcxMk1ES21nN0htV21Yci9VNUNVUXRUQzdiaUc4bFd0bExzRXZRdDh3eUxo?=
 =?utf-8?B?bHo4VXRzRmUyODZHQWpkMm1QajNxNytLUGozVG5mTE9HaGhDbjFFbWhFR0hz?=
 =?utf-8?B?bFpiODlZUUhBRjdlTHpDdmsxdi9qbllMYm56b3dtak9sU25zMVhlWnYvNTlV?=
 =?utf-8?B?akJJU2tvdjF5Z3J4bk5PMHk0T1p6djBxdWQyWEZoTjY5MWpVL2UwNFc3ZGM0?=
 =?utf-8?B?eStGcThDMnc2QkFZc3lZdjZ6UmNibW04L1hpK0hIOE9zdkpBUCtxR2lXMUZw?=
 =?utf-8?B?NlQ3clQzdE5MbWhsNWo0YnlkSVk4QzgvbGZKNEoyYzRiK1FiVEU0OTR2WnFX?=
 =?utf-8?B?YWZ5WndRQ1VFMEROWEdjMCtEM0NCK3dVMFNSS1MzYURCT0hibHdvcUZHUGlv?=
 =?utf-8?B?ckI5TGRHOHk5YlQ0bnR3eVhVRUUzbHFkaUJoaHQvQlMrcG9OaGFTQ0N0Q1k5?=
 =?utf-8?B?M2V1K21ZVkkrNk0yYXRUVW15c09FZkhTdXBRK1JOR01sT0xXclJEcFNtSDl1?=
 =?utf-8?B?TG5PM0k5Q3Y3YUxZZEZmU3FMbEwyQnBIckZwUndMZkF0VEVpZlZPQkxZU29W?=
 =?utf-8?B?VTBxcis1ZmhWNWptSFN0MnFFQXhZS00zUWxHL1V6Y2RZeGdtZll6dVZxVS8z?=
 =?utf-8?B?VStsU1J1THZXeTBKNDlBVmU5WDR5TldPUUtHTDRCc1QyQitQWllEbXZpdFNW?=
 =?utf-8?B?aW1jU3FvNTFkOFVRYlpPUWJVdkU3WmJWRzMvbXlHRDMxdTAyUlcrN1ZyMStx?=
 =?utf-8?B?OXE5LzVtRkNTZEV5WHFGeUhuZUFLbDVQU1g0YThrNUhxR3hKTzFvVTl0WjZE?=
 =?utf-8?Q?4MOYaNzgPk8jOLZwh5iiVa08U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d91873-9b3f-4a8a-2c2b-08db8123b014
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:57:28.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5S4axufVpW961kvUMGkkfhygwRLCpBkOUwJdd2cMyPI3I3e+EyQIKiBChmm2T7aBdn8x7JqHxeDGj1k0DIfZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

Use DATA() / END() and drop the now redundant .global. No change in
generated data; of course the two symbols now properly gain "hidden"
binding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/tools/binfile
+++ b/xen/tools/binfile
@@ -29,15 +29,10 @@ cat <<EOF >$target
 
         .section $section.rodata, "a", %progbits
 
-        .p2align $align
-        .global $varname
-$varname:
+DATA($varname, 1 << $align)
         .incbin "$binsource"
 .Lend:
+END($varname)
 
-        .type $varname, %object
-        .size $varname, .Lend - $varname
-
-        .global ${varname}_size
         ASM_INT(${varname}_size, .Lend - $varname)
 EOF


