Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099AA755F4D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 11:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564329.881787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKaj-00047Z-KU; Mon, 17 Jul 2023 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564329.881787; Mon, 17 Jul 2023 09:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKaj-00044w-Gy; Mon, 17 Jul 2023 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 564329;
 Mon, 17 Jul 2023 09:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLKah-00044q-JW
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 09:32:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d77f03e5-2484-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 11:32:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7517.eurprd04.prod.outlook.com (2603:10a6:102:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 09:31:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 09:31:57 +0000
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
X-Inumbo-ID: d77f03e5-2484-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdqqDGozAQXjE5WFW4jvUXNeI9tBCZJ5pg/Ru0OtX80fZJqD6nuNPBcAanBsFlZKqcqCrxHZxnZvAQGu7JdvwbLe4i+cF3JYkITT+CPC91bqZ8wOk0p3ip2nQw+0WYJZV1J1raKCd4KuTrjRz6os6wnApRI4TEC6hMuJ4j0076NaDk2mWfwo7cLQn7x6Fct7Nfi5RZ8qF/UJnYwkD5BJ7NvhXGpAVlvMcCfwaiEJPMwqAfhMeTRv8fm0T7k++G4+rOx0Bp6mBa7R0I+5V+sAMm1pBjA6tcmL2JUen7+lca2NoCkkWZ4PpDf97QnPcOHAaKimIrqawego+roumNjWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESRPs0bkbLM+33DkTgz3eY0sL1zyhmQSU3RxBzzc72Q=;
 b=lBH7//3w/7xNZ8pK74RhLVg8XZeEHnYkGbC1lIUEla/vXB8lOBtCmGdZc1OT0MuXxA4r/YIYf1bCs3NDWKfPc81VPjPjPP+UN4/ZAtTn9xfeltMZ7us8q/JmzamyYdsturFcSSXM+ODUCPJrA8JxSpIZUaW2xV3sv7w0C2rs9ctB+i2dMhSY5rmKroi+G6M4MTHjOUcSdeuyiItOS255U2/dHZJhKUVSjsea5LCgl9ENvBmDsSvjxWrdq4yriTF5tVZ6qJDPB22U6nfR2DIPh6shPhO/5sod9loasJRIFSz6gB/w5+fleeaWY7Z5624ES3OqblGIpKr67N4iD7KNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESRPs0bkbLM+33DkTgz3eY0sL1zyhmQSU3RxBzzc72Q=;
 b=JVTUZ1bp+ntUiXjtKLppkP5swUjcs62Kn6XupmVXp939on864+LGe21WxkFbTsOqx+A5kU59CraVDFFVpnaFKQ74C8II8woybF2MgZ7MM7k/8y202PNqzMbxxOo7kFxoMp5SJZnfJEyGYCYUDXcOojvKn2O+a7OvmNw1s6YFTkKJtzTn8pkKW5SEIh5QHvDgW9NUr6DZ9pQxCvCXX/veHop/l+Juw+OwjK/Gf8HEyHqL8T/jz8vw+Gorth6/3Mh/4QVN7NAE2jxVZFG/FYXGxh1hd4VI7p5mDhYXsw5q0y+mnta2aobnBtNQGrVlDPLHK9BV2BVp0sV+UEgQeXpNpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cfda162-07a3-8a02-4511-b0578b12dbc2@suse.com>
Date: Mon, 17 Jul 2023 11:31:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: adjust pIRQ calculation in hvm_inject_msi()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 6071e04a-891c-4795-3a56-08db86a8aa3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zP0/2k87tpdrjSYuuxKyA0ejfY4vsBMqT6X1L0/4ud4RfNsRcNVzTw1tCJIiQibpZYZdGQFfRhB5XJIY6bTf5lk2aulNeWSgKopW23YFktEuv7U2XFcXUuTcL9OgVAFbdPzIt+HN9QfolI5l3UQEmB0vCoXp63xKpEGio30PDwpPRIyMOzsBTufgN4u7BKpfbGiN92g/JSPAp28UoF9LYABa9TDHfDTirkmZpYD0jI8XnFN/S4CokVTMgvxtgtpOuJoKobZfFP4xAQtLePRSdc4Hm9NGsU0XzqKe5pKdFRI7hWZDMoT0+tr2xC5KjmTIU7/PBuvU4x3XmP2DFACKOhj40WLoMR2sbHWOj9AgK7QUFRAWBzzguPYh3u7R32LGYa8y8ICYc4ZES9DNmK/PDzLaxGt2ZPixEodo+2dQWwa2DoKCEeru2q/R0zBCfEDt0aJjoiWN5fyyuP9mIg2yliRvONhyrCUrZK21Bip1Yu0i1afrWHFJMmF0MXaJe09eaBvnxxBkMTnkECPbf7R3M5iXa1EsSYNjf6Y5wrbuiY+YnbdT08pDHvu2XblFgtF65p/wmhluF3TfRVDJzc8rGUulJR5KDWwdYzZcb/9RIT7cRPZFpX6zpSh0mx6zElSFoXJI/dEO5s7XufR03Yxthw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(2616005)(31686004)(478600001)(186003)(83380400001)(26005)(6506007)(6512007)(4326008)(41300700001)(8676002)(8936002)(6916009)(2906002)(4744005)(86362001)(316002)(6486002)(31696002)(66476007)(36756003)(38100700002)(54906003)(66556008)(5660300002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JxdGsrbTVmSGZkcW5SK0Fpd2JjQUt4UG1jOVBWRnNVNlMyYk5LalQ3Rzgv?=
 =?utf-8?B?TVM5YkpGYXFkalBSK3FwenE2Wit0akdjT3RBQ2lXeWJYREI0U0Vwc1hieXNq?=
 =?utf-8?B?Yk84aUpGaUEwaEJNYy9Zd3prVkVpajZjdDlNWFU5dEtSK1ZzM1VoeENYNHFO?=
 =?utf-8?B?dlhENHl4RitVMnNwaHBhQWR5Mmp2RTVUZForL0xJdGZNamhFUGxyeHkxTXNq?=
 =?utf-8?B?U01SdDZ6dWI0V3d6MHo5VkE1d3BtRXlob2JtUHE3VWtGNzZCM0NuODRtbExu?=
 =?utf-8?B?YzZyRUZ3NzVXWm5jNDZuaHlaVml5M0kxUnpXa25SR3FxY2lwbFpSL3lZVkQ4?=
 =?utf-8?B?Zk5kOC96MTdKSmplZHFmSTRTalZzVmdaa3lJZnZxMFZZTEM2d0Q3L0RTUmdj?=
 =?utf-8?B?bXRYcnZmZWFub3BHWHpRcWw4MmlSSFo1Um1QYzZhMXhIaGx0UE9ub28xdG81?=
 =?utf-8?B?eEhpT1ZraFo0TTF0dlMzS2dDK2pVSERLektWWkh5RWpLbUtyMEVzdDhDZGl0?=
 =?utf-8?B?T1dpODhkdTIreUh3bWhWVmdFckhxSWhsSURzdW9tYzRZUGx4UnBQdGw5V0M1?=
 =?utf-8?B?OGE2M1Z4YWp0dXdlZWEvTHFWQW1SNG11RTJ0bDFScXlnNU5SdVBhTWVkbERl?=
 =?utf-8?B?Qi96b2pyNGw0SlhOVnZUZisvZXB0am5USnJ4TGRmN3NERTZ3UnJ2ZTd2cy85?=
 =?utf-8?B?ZmtSeXloYXhwWUdpR204ZkdUeE82VjhCeDRSWFRqUVg0T2R4S2Z0Uy80YXQ2?=
 =?utf-8?B?WFlMYTFENEUwS3JRS3pVQ3BoNjZiZVhuclk1NkJmdFFjZnJYcXFmcGdzSnAv?=
 =?utf-8?B?WHNETW82WEhhMVJoL1dyYjhuSXkvMXRSQmNsM0Z0eis5YjVXQ243bG45MzFQ?=
 =?utf-8?B?dGJqWE5yY2RIUDNEZzJocHllcTJYL1FqSEhZd3hqbXhvYVZaUVVySk13Qlg5?=
 =?utf-8?B?anYvcnFXbFdRb2h6by9sMzVHNXZPczlmYUtzMzlZeHBBMm0rcEhnRnJmdTVH?=
 =?utf-8?B?by9hN1k4cjlqdStWOU51VGhaNk1sMmJSMHV0djFWZnhzVjBteWFUMGRxUnQy?=
 =?utf-8?B?QzMweS9HUGVXd05BN2VmOGhZbUhYWWhDMk9zUkdiUlVkUDZrbVErZDBzQjJJ?=
 =?utf-8?B?VFpQa280Zmw5QXBMV1JXdVRDZlVZQU5HL3B3ZDRXU1dhS2FreThFSFo2dkpZ?=
 =?utf-8?B?c1JIbHZzY3MvNnlSR2l2TDVBVjhTTUVnRFlLRVpoSURLV1IwaDJLTTRGYXli?=
 =?utf-8?B?Q2F4em82TFJPb3BPSlRhOW00YXUvMWdLRkpCWkZEZUtnSXk2WTQ4NHdreXdn?=
 =?utf-8?B?NVRINlVlTitvQUwyTE0yelNnUGtvVkFmd3VPVkV4SnZaZEhhZTE3ZUNFOVZD?=
 =?utf-8?B?dlAveSsvQjJhbVZsWVpXVmZyMVJydEtTcS8wcGQ2UEw1WkQwb2JORjNuOThJ?=
 =?utf-8?B?WmxwSzFLYVhUYngySXc3eGlhVGJWSlhvamtET3JBclZUcnJTbUdsNGtucldN?=
 =?utf-8?B?OTZvYzRGL0JjZTJBRDJNS3llWnFYbDhIZ2lxQXdZQlhlNHlEMzNVbzd3SlFQ?=
 =?utf-8?B?cU5rbEgzZjloaExVSGUvUCtObEI2SzdTdmp5N052ZUo2UncvRmw5bVNid3BK?=
 =?utf-8?B?eS9wRHRXN0VOSGhMOHZ2bDhlZDh2SUN5Q0JxakdUZXVVY2gvblJTaGVYTkNk?=
 =?utf-8?B?WThTOTNsY0gzeWp6aGcrTnR1NU4rbVNyUHZjTVJSQlpreFRzV3hXM0YwOTdY?=
 =?utf-8?B?YktuakFTSkxwTkdkamJBaUsxRHdMZnlKTDJXcWxSU3N0TThzM0xmQXBtQTV0?=
 =?utf-8?B?bFpDMEppajE2SUlWL0M4OTZwTHI0R2VRa0ZsTGsybjBkSVZ0NFg2WHd3Z3lY?=
 =?utf-8?B?TnNMRnBDVzVveHMrcDJUL05kZG9PSzBGNHRzSzJmTVRCTm1YVjNnRWJoeVBy?=
 =?utf-8?B?QWwvS0NINjNLTThRNi80WVFVMEpnTllVOERoZ2Fxcmg5UzFVTWFyYkhiY2po?=
 =?utf-8?B?OHlWUjhKZ1pFdXJ1b0xiSlZNOEc5K2ppbDFabnFNdDM2TkJYUjkwMVBUcml3?=
 =?utf-8?B?V0JjK01vYUlVclNHNXdJWlIvMVNpLzFWMXhjdU94cjFUK3NsYnlQQm93MVF2?=
 =?utf-8?Q?dvHhxew3YvPxxs4B6bvwPqQ8N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6071e04a-891c-4795-3a56-08db86a8aa3b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 09:31:57.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylR0RY9BKMKLqPV95UR9UQaRjQJgo55uBLMqD5KI/5ugVQGTUeULb/XfGehOJJUBr9XKjtoZF58YoFL6cHvMmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517

While the referenced commit came without any update to the public header
(which doesn't clarify how the upper address bits are used), the
intention looks to have been that bits 12..19 and 40..63 form the pIRQ.
Negative values simply make no sense, and pirq_info() also generally
wants invoking with an unsigned (and not just positive) value.

Since the line was pointed out by Eclair, address Misra rule 7.2 at the
same time, by adding the missing U suffix.

Fixes: 88fccdd11ca0 ("xen: event channel remapping for emulated MSIs")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uin
 
     if ( !vector )
     {
-        int pirq = ((addr >> 32) & 0xffffff00) | dest;
+        unsigned int pirq = ((addr >> 32) & 0xffffff00U) | dest;
 
         if ( pirq > 0 )
         {

