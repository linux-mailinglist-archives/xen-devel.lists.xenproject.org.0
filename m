Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860116A3E70
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 10:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502284.774020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZsI-0003HN-Ly; Mon, 27 Feb 2023 09:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502284.774020; Mon, 27 Feb 2023 09:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZsI-0003E4-J8; Mon, 27 Feb 2023 09:32:50 +0000
Received: by outflank-mailman (input) for mailman id 502284;
 Mon, 27 Feb 2023 09:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWZsH-0003Dx-3N
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 09:32:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b207a4bd-b681-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 10:32:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7074.eurprd04.prod.outlook.com (2603:10a6:208:196::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 09:32:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 09:32:45 +0000
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
X-Inumbo-ID: b207a4bd-b681-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8HSRNBd+Qr0a5sGxEjh/qwCWIxXJMCSbhLofr/ManDWgrQU6TWFRYlRf+h+H+l1Kd7FWpUwylnY5pGUzdNLZd5MUJWUE0YtSGH4sqyRGGZ2SrEvayEqRXx/vF+Rz2GSfj307dQXIbLxiEN6cTu+aIFVHZ+QbupLCFMDJUo8G2NoQpEdoIdQWn9Bsf/iTcJJKW1hWWExLZRBuHLRg612545sVMs/vMLfbSaGA2eyWpxdQGp4BQLXNfV6rFMMyGrpIdPz+0qzHHuAGdzb3Ilk7GglyJabmwze6F/8GGDOwJ6bBGUZr49hs7DONUND9fkhlH7rahvCgPUHnATm55S+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5ffp6F9IPk1FbEmZH7GKlo8A+ZG0iRmDad5ylZU8Eg=;
 b=grxfojkaQCnwKfDHyNtg0qTbAYksTEOg5on6YvcvB+sjGxHgRln8HnyuwR6N4zzJT1JS+226xhc26alZvS1d8/3pLAeVInjqM5f3ci16lClSA9kdeDK8f2iEnkhH4cMGXkQSlzt+mDy4cZZYi5s4dYN1RZgxOW1bFKhZHIONEud2XyywCVaE5GTW2nK2PV6ToiU8v4eJV43cNM0hd+FcFesd1FElYFs0udBO6hR4b0Yz1yQ8gS54SpcPYbQ4S4vhZ6I0U0FpbZlDJNoN9GZPQgRmfGuxOIqLMtAGpe6OWMRU50gBKZyzIIEKDjq31X6eXeMBHvhSf4GOpav/1+Cm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5ffp6F9IPk1FbEmZH7GKlo8A+ZG0iRmDad5ylZU8Eg=;
 b=Q2GVqgh5rUUVxoE3FnhKudwLr7vJhV9joHYfYww1cipHswoDgP+qK16TOetHuuO3Z+m5/CdWEhll2p2fsJy+izEyTWb71+vxU564VmNPp2k/qYlEVqIPB6uxrV1FcuKPmCVz/qkTsPjn6AAEpz6h0jQe55miRE2IijYVY7oRXkCJbV8UGJQjHMZoUtTIiEN7d5Ltmkl8cQRZVQilIP6g2oi74fxdQPd9GNFwnHwxMdF1TaacvJW/HCEFz9qfMNaicwvW6mrzaZ8hpf7r97lagKYxnSTO7iNBoVcF8ydSJmh9mYMqbz4Vj6UPF6K+erujGFuom33La7Y73l73n5VGEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f365e970-006d-4bcb-aa39-6d6bc99395a9@suse.com>
Date: Mon, 27 Feb 2023 10:32:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/setup: drop stale declarations of __bss_{start,end}[]
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 3421349a-3273-43c6-63e5-08db18a594eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TbwA37je5xBIJEP39DV5riuOv80SuQqn6J67SkHkn4cZ5Mr6xGoL9BpiKKNUV7rs0Jd3YGPaNliSjmkZn4bkBoXrK03UYJpmwF8hcHS9D/QhKADWq0JjK/LIYdYKzuy5Bxr61qfrVrHu0rS2BuEOj0pvtr1DNuvZBLJIhgXezXac21c23n61dh3BShO5y8b4i7y3IF0XVkx5jagFDAhE+ms11Oa06TghJh+iVaUnUl9xtmNc9NcINv3iYlLevxKwLCPXzVvimfmwB0S+clqZpG13PAJ3HRrTCykf621YPGur7qdiQ7+GbUeEQOtGhF02cBdBrLdQkJ1+yXyd+bnUpNPFPwJjH2VEc+UDlhZ7CfdceOegQsv9zzfGlmTnLkGdjCU9+K7BjubP76DyQS6im4j4GViqrug6IbAXJewQhbNDsjjkAx3wORToQbg/auLbG/yI6lvKiULNbnHGeuBcaa8+U+9v8a1x8L8oSrWoprNmjlI46kiuBmCXEFX2FcWzZ59HuG+X6M9e8vutMJxenIY/6yWWgssllsMRSLgLpzHw11kpfgKTLmqIqMKs6+CreCjx/wvUqeBZ9kfDYfDIS/SAJu7kGwSt/Lu8RaYTsgHQoRR9TZI8czr4q+8WwId+5+mE3GMGM7RZTLjNnYg+WBMkRuZiav9PN+fSJwuAOSApT4jH2nRXejFu05UNOJZOEXObBKajzTimZyJwJiUDU1wuIPKLgM0xfqZwSvh1vMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199018)(66899018)(31696002)(86362001)(36756003)(38100700002)(8936002)(2906002)(5660300002)(4744005)(66946007)(4326008)(66556008)(66476007)(8676002)(41300700001)(6916009)(54906003)(31686004)(186003)(26005)(6512007)(316002)(2616005)(6486002)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnFleGNHbzBObEQrYnVhV3ZaVEllZUxEMW93VXB1M0Zwdis5UXAwdUM4Rm95?=
 =?utf-8?B?UE9odEJJOTloOWJ2a1hqWTBSMU50bGx4WUlmY0RxRk15ZU1UYmdXbHo2OHNH?=
 =?utf-8?B?Y1MvRmhDWlZNUlVMeXM2cDlkVTdDNEdtbUxvaHVWdDh3ZkF0QUl1YkEydGZY?=
 =?utf-8?B?d2g4TGlDZGlGeVBtdlR5cWZiZTBFN1E0M283VzV2WDNlSDZHODBrcVJFYlVa?=
 =?utf-8?B?WnQwSCtSdUczcUtaVFhGaDc5RkNQWmpKVHBHOEdFWFhDbkJuRlhyQWk1MURx?=
 =?utf-8?B?aHlaazRtYnY4MDhqYU9jd3FHREhKWlNNZVk1QnJITDBOYyt6citoY0RRUUhq?=
 =?utf-8?B?NkFwVDkvTVcyQm9hOENFVTdoL0pzWWJvVk44TDRZQnRXQWd1QjBsamNIZlFG?=
 =?utf-8?B?cnVPRkk5VFJveHY4UkZIaFBIUjVqTU1MOTQzTE9uZ0x0d1lSRFIwaExOZ1Z5?=
 =?utf-8?B?ZmVWYW93Zm9STHpRd0YvUXRzM1hmZzVaVVpYSzBrOFZDc2lNZ0lwL3ZhZEtz?=
 =?utf-8?B?UnBEM2xSVjk2VTl3TTFoQzErdHlyOTRnQnQzQ0hrMWFMenpXNlhiR29vQ0pZ?=
 =?utf-8?B?cUxxVUVHcWlSaXBWZDBaVDFyOG5OVVJHNkM0UGUwMUhtdlczdXJPRHVLbFov?=
 =?utf-8?B?QU0zSFhrcU5ISDhzVHgyWmNmOFRpY0N5L3krdUFqU2RHcDhBMXdadS9Va3ps?=
 =?utf-8?B?ZFBkOStkcXZxaktuM1l0QzI4eHRWSkN1VDNoWUl6NThkeVdKTkYvWUxQR09q?=
 =?utf-8?B?UHNQMWkweExlWkRWUE9yb201VGIxclVPUFQrL216aWlzVzZwZG84Z2lLRDFs?=
 =?utf-8?B?Uno5bWY2OXJETXlqTGpSSkJrNy84MGYrNktKNEZlTkJuOTFFZUtGWU5ySTJQ?=
 =?utf-8?B?ektMeW1kSUVsNXpGck40R2doa1VJVm1TREI1d3IwRmZjUXJXVW8wcitYYjJv?=
 =?utf-8?B?OEpnQjlDd1VLRmxvZnpDVllqSC9aN09oeUFQY2JzMExFTkpDM3RTL1QycHkx?=
 =?utf-8?B?QnFYa0Uvc1ptSnRnNzVaaUNFK0RZWnI3RitSeDE5OVRmWUNaRGNTcXhLa0c2?=
 =?utf-8?B?SlJ3Wnk1RjhsRDRzcUhPTlQ4SUVCYUVXbWF6c2hzazUzRzAvc1h6SWJMQ09z?=
 =?utf-8?B?L05yeUx1NXVrL0lUcWtQSUEwdStDclRDY0FycXhXYnlxd1VkU1pWckJteXRZ?=
 =?utf-8?B?K0w2QVdHekI5Vko2WFRZWE9ReWZhSERFSW5tcjhjZUo3V1puOWl4Q0RYZEJq?=
 =?utf-8?B?TnYyK01tUHMydzlsQmlsRDlsRDZ5bGRrMjlSVmJrckZTb0lVd1RvTEEvTU5l?=
 =?utf-8?B?Lytha3ZkdXRWdmwyNVcyTWV6VDAvNUtUam9CMm5XZm1SdUk1dW1oeHZMTk4z?=
 =?utf-8?B?ZVR6eCtxNnlybGJ1TUJNNDZrVndLTVlxdmYvZ002ZWk0T1JoQk14eTNEaWlQ?=
 =?utf-8?B?bUJ5K2E2dmFEeDhNQTA2bnBubFNWYk8yYmM3bitOTEo2WG9QcDVQd3VmeW5X?=
 =?utf-8?B?NzN4NCs0Tk1sL2RlYzBPZ1BEN3RRdUE4TXhTZm1Ra05LM1Y4SSswcU1qVVJu?=
 =?utf-8?B?ZFE5b2t6YlVJTWhCTXlnaGJtTFBaV0dFWnpyT3dpZ3ZNQVVjdHNGWlJma2NC?=
 =?utf-8?B?dmdkQ3N3cWFNM2JrZFNIWFpCNnN5ZThJNmNTQk5FTlFGeWhxN1hibFZCdldG?=
 =?utf-8?B?NzBwQkRheXVuazk0V01nU0t2Z2YwM0lMMnh1bE5xbU5nWlUxVzBscUpNc0w5?=
 =?utf-8?B?ZHdCWDZzZ1pMQlBhUzNia0EvSlpzc3ZLazBWV1B3L2JQMUNCUG11YmlEUTNi?=
 =?utf-8?B?SDVRbVRxRGdWRGtzaVZkbWZNS3k3Q2hHOGRlR05nZEtDTUVPbXRkeDBFNDZV?=
 =?utf-8?B?UjdXS0VlTEFYdmNHMHdiN1M0SEYwMU1odXRRM3Z3UU4wUzVFeDNQQTJEY1NK?=
 =?utf-8?B?TUVsQVd2UzRCS2RYZTNlbEx3UnhIV282ZXp6YTIxVlY4MkR2L1ptYUl5aUNF?=
 =?utf-8?B?RS9VREJNR3dYRlpwRlpQM0ZxSWtuTnczMSswdkVwZ3QyU0RtdklNVTdhR1VC?=
 =?utf-8?B?aUxkMVVQYnQxUXRnMjZVMWUwYXQvMFRFcCswVzlxN05SMHdoYWRPWjdHamxq?=
 =?utf-8?Q?kCmD790qc6mk9gxK399xrwF5Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3421349a-3273-43c6-63e5-08db18a594eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 09:32:45.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcV4yYzt1sz7Erp5TgXLHMiOGJuCPPfZrI4w57fb1Z3k5Qe7+i1rDjtApx7C/onCA5PCQwcmqc2I+B9VK5mljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7074

There are no references anymore as of c9a4a1c419ce ("x86/layout: Correct
Xen's idea of its own memory layout"). For what's left, switch to
"unsigned char" as here we're not dealing with strings of any kind.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -305,7 +305,7 @@ void __init discard_initial_images(void)
     initial_images = NULL;
 }
 
-extern char __init_begin[], __init_end[], __bss_start[], __bss_end[];
+extern unsigned char __init_begin[], __init_end[];
 
 static void __init init_idle_domain(void)
 {

