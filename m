Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AC6D033C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516662.801155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqWB-0005Mb-KC; Thu, 30 Mar 2023 11:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516662.801155; Thu, 30 Mar 2023 11:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqWB-0005KK-Gg; Thu, 30 Mar 2023 11:32:35 +0000
Received: by outflank-mailman (input) for mailman id 516662;
 Thu, 30 Mar 2023 11:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqWA-0002FN-1n
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:32:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fdf046c-ceee-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:32:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:32:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:32:32 +0000
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
X-Inumbo-ID: 8fdf046c-ceee-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh/ofto/1gHJ02qlDvJj6RD30SdIKBaldip+atea+Z4sxd41vbYa3PR8L79arSc1uphxUiW6C/t7bEmAlRoKQvvtUbG6YgazjSj0dntfl6w5z0gxCjbaqTpi6DGJBHhN4cPSBRAsthZqC40Io8s0J2L0KJ40LSO2dKHKcOUM1NQQbpasjK6CdxMt4WhiIDdPMU+EQODqySVTVlZJ8WvlBv7zsAzHym2mSdcd8GUb4YBsnOgutSCDG83ip5QhW7B6coN9uBIMVRv1Ew7R+QEek9Zh7HHohmnJ0pblLSh+qfvY6WxJTRU22ks2qP/6V9AOMMig07o+mv7Gde2dwCu6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1l2fkRqRJiGKZyq0x1zbIscrbjHpZaIQjMcBMuPrbQ=;
 b=SDgh5ofhCzXCC3CvMd+3OGGiwuLTQtQrzDEfE81XBWe7BNvQ22uKi97miKVHm+/VShFr4KkakwHDS8ClmCJoFlLYLG38A3HrkMI67XkKDML7tQoJ+rvsGog4SlGHmHRpKALHBgRl7ViseXGjnrFj53O7pC1T3ufoFBfBmZvlzy7mmZMXVCYDVJLfPBqHEHZeyLPlsWRSmZi8JknDefRQFXbonZYQu7P0rvV49TAjT4KffGmWILWvQoGXPHoq95kd08pwkh+RyhmA2T4uAbQ+3A5xKpziYCuuxzIxWOTnbG1kK0b02HO63v9QWtgW8awkQk3IDSbc/++wN5echwWAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1l2fkRqRJiGKZyq0x1zbIscrbjHpZaIQjMcBMuPrbQ=;
 b=3XjdHwsOJQGis5sxBnLb53b5XroEG1UtxOHMa4aBXdf+kl5En/0ffCGWbZGgb2Ws8VqU4841LJ6ia2+1RwutyjrY3lWQOV8h17G7//nYLscEF9/fJ1RZ2OlHMz5Kwn6Xkks75PJufk25dPRUIE/hZaky33FObxvkJ9gNE1NOSQIttmiy1tfuz9ZhQ/ywSZWyrHY53KlfyjiZBrEm8F4xVuWtnY5+9nranWbR4zXhs0OWfc97jJ/zRxoDC82fNTJMzDBT/RzNamsi0d5+WHNd2Qoer7t45ANvoibU7ggyE3Nrnvl2sUS7uh+mRmTU+Hh8t6kmu1UFuKlJGqSZN6ZA9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d53c403-da7e-8a56-516e-b5f8151d2707@suse.com>
Date: Thu, 30 Mar 2023 13:32:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 13/13] x86/shadow: adjust monitor table prealloc amount
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf2c7b0-1bbb-4eb3-b60a-08db3112736c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PXKUekEv+9+Ds7SnzPL4yL+yIQdKbslb0Vr73af1hYc1CCViBpnQCTysYeyKubmaY7+u76r+W4t3u7uCg5QnKAV/tU1RK0+kLS8Ecoq7TbP+eC6GO52x1bxtTNXR22/cPXf8LCXHPj4Q5haD6NoW35j5H3XTm1Jq+zF81zArvWSPEhq/4lssNd/3y7K4xQxUbEwohy01cp+GwgdYtXg0a8FyqVqlEL3OL0CHhJY7zZMEc8vbR7yaKj25P0/u8PIE135uJS6G3bOtcssAjwgcVfrRf5oQGSegsY+XFpPPcwzQjISFMllpmT9frD0ylR7x94JmPbneE2hbzA663g/Ydi3lLOy8DMAYc73jOSoHIW9uVBYOWTxK3g7bXjs1U7JiyMFF+HKh4E8w59/r/jK/l0n9aoPW1janS4ddw8UKA1BrvpZecfNzsdZ5S9fT4g609+qITY+nskE13RejjbBuopYik1K2LidqRqh0tcv7JDkfF0mLrTcOVg+EnqvfJuhFeoLdk86lLxniWlRVpSdaS94dBCCJI/BcqHtt6rioCFxFddCwDuQMsYLnSz5mPz8Q6zjrPApLFjkNlIcwDg+iG4auT4HsxHI1p3pq4j+KNk7dQFxn0rStgXq+2gPTwhxezo3Q73e964JNXg5egzkwFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(5660300002)(31686004)(8936002)(2906002)(8676002)(4326008)(66946007)(6512007)(66556008)(66476007)(54906003)(316002)(6916009)(36756003)(6486002)(2616005)(478600001)(26005)(6506007)(186003)(41300700001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFR5ZnJSWUw4VHJHa1RyNHRINHlCVUFnRENHTEJtckF2N21hUWdMSDVDT05x?=
 =?utf-8?B?cThuUklSVTUreU9ubnRsSzBIcy9DdDBGMlMzaks3d05wLzRQQjFsY0hmSXF6?=
 =?utf-8?B?aVYrRnpMUkVWQmtMRmpBZ2o2eVhLRGVzVldZVHc0bEJ6WVlvV3EvNzc1QWtS?=
 =?utf-8?B?K2dTMTVyeDQxclFnWkdJV0toQVhLSEF3K0VPMTJ3L3krdDJsdHhoRnVkdFNt?=
 =?utf-8?B?aVppd3FmUEF6SkF0cUxMZEJWUWNrSFNSZkJzWTErYklOTWJMRTFHcUdPR0lQ?=
 =?utf-8?B?N09SbHhIbmJyMWxhdnJ2b0lPSllaZFNqNjY1MEdaQmM3TTIwcGdmOTlYN1FI?=
 =?utf-8?B?dmpWVVNaZjVQR3F6bFUvZ0VCc2FMY3Y5bG1udEQ0bVViYWFISE5EbFczRnZJ?=
 =?utf-8?B?MSs1cHFSTXFJRTBwOEQ4N2ZUMnZabHowU0NhU1d3akVWWTZCU0MzZnJOYWJJ?=
 =?utf-8?B?ZzdVRVlKMkpyelptQzhzVHNPTEdqZ1IzZExrNENxRnREL1YyR3o1UmpqYjk4?=
 =?utf-8?B?ZVFEOUxaMEc0dVhHOVRHL3RpVFpMemkxVnVVUmxyTUxZdWJLMXlVTDltVlZl?=
 =?utf-8?B?SGczSlVvak9ySlpQdzFkUTU5d09IMXMzRUMyWU5EemErM21sUW9kTGpXSGFa?=
 =?utf-8?B?SW9tZ0VqNlFSU2gyZ1RxSkJpZXVyQ0o0cWJOejdacFM0ZGU5OE02YStVN1dC?=
 =?utf-8?B?Z21JSjMvMEpCSEVab2lSYXVibFpRcFlMdDR3SXUxR29PbHVuM1J4R2c3R3Zs?=
 =?utf-8?B?UzRzYjNWbC9OeVNJN1hvbTF1dXNVQ1ZhelpQbzZjdFZkTEhocEF1ZTVwRFFi?=
 =?utf-8?B?NmszYVVCVlZGbFlUZ3BrQzF4WTZzMDZjUjQxbVVOK2M5VGVQbUhqQ2xyZk94?=
 =?utf-8?B?MDBieFJ5MUhmbDVYSXNCcEVtTDNIYkdQQ2RyM24zVWMxZldqbUE0ZFZCWjhj?=
 =?utf-8?B?M3kzckgwdW5aSEl2dmhuaDFkbUYvaitNb3lxZUpvY0Z4MjBlQ25yTWdqOHcw?=
 =?utf-8?B?cmFmamova2xJcVNVQVg0MFRaekwxQ3NmM1BxeUJSZFRteHJqa3k4SzkyVll1?=
 =?utf-8?B?UmpRTnQ0OG9iS3BKODV5eUlEbXlBRWNIQXd0L3drNjAzcDRFWkF6U3pEZEVU?=
 =?utf-8?B?dTJZcTd0Q2RZN1Z0c0RmdWtYY0lXVndKdXVMeUo0OU9mOEo4aVFiSUFwYkhI?=
 =?utf-8?B?eEhPenZOWnBoWXFmR3ZEL1FobWNsV1d1bHdSRXI0TFBBYWthZ3lBRUlmbXhj?=
 =?utf-8?B?YUJLOXhyeXQ3djNUTFdLNjd2aVNiSjdQblF0RDFCazVsa3Y0OFovZmNBWUIr?=
 =?utf-8?B?VGlMdkJ6cW1Hai9QOEFsRFNnYUtJQm14MUFiOFJoQkhzcmh6bTZNKzBtTUJE?=
 =?utf-8?B?dmFJcG5kOFp4WlJuUTQya2phWXcyUGN3MjJZZ2VOZnJYRjU1MmtlV1dYTWZl?=
 =?utf-8?B?MFkzMHlKdHE1NHkzOVUxSVFOU1FmU1k0dkJjbHZ2bEZvL0dMUWM1SDFuekY3?=
 =?utf-8?B?eldTNFA3ZXNpdW5aWW5lTFBvZTVKemFLaEFtelVFYURPTDRmQTdFN2U1R0ZK?=
 =?utf-8?B?b1BwS2dkZFY2eGRtL21IYkVnblJtSzRCNTBkYWV5KzMrY1NyMzBjTDN5Vm4z?=
 =?utf-8?B?SzlIL1g5enB0eGR0QVhvdEZvVHMrM01CdFlSUC9KcXdtcVdDOGpTSjVucGUx?=
 =?utf-8?B?ZmVmcFVJVytsL05PdFo0TkZMYng5VGQ5SUlQUmZpMVJZWTNna1ZPSDRVbnBp?=
 =?utf-8?B?MC9HWERvQS9DZXJoWXM3ZVdzREpDSzBqWWRhbTJEcktwcTF1NXdYUWVJNGZW?=
 =?utf-8?B?NmJFWDY2SlN6aytZbXhyUEVoaGN6VjdzbnRiTU93ZjFzQ2Zxb0gvd01iQUQv?=
 =?utf-8?B?V0pXSFRLaTNyWGhWcEdydnJUUEo5QUpZKzVuMFhldVhuZ2lodDBNdzhhR3k0?=
 =?utf-8?B?Z1ErQm4zY25WR0RtWm1yUmd5NjNqSkhMM1NkdTc2Q2NBN0o2SnZBWG11aXdQ?=
 =?utf-8?B?anEwY2tlVFhIMG9GWWMvRnFjbVRUQkJxcTNlNDEvOUhhNUJTSy96VU5RZCta?=
 =?utf-8?B?ajMrTndwQ3h2UDJvRy9hNzZxVUdQMkNka1dLa1dwczYwVU8xSUUyS1NCZFNS?=
 =?utf-8?Q?NgrsQ9PL2M5kZFVcTKeZcHehy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf2c7b0-1bbb-4eb3-b60a-08db3112736c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:32:31.9872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nra8okp7oP/4xp1ofcR+glPqXrCweXrXZ4az4PviL4/+BEtvgNikhqFrvDON2gBoJssbW9tDICxGiuJsQFkLeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

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
@@ -738,7 +738,7 @@ mfn_t sh_make_monitor_table(const struct
     ASSERT(!pagetable_get_pfn(v->arch.hvm.monitor_table));
 
     /* Guarantee we can get the memory we need */
-    if ( !shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS) )
+    if ( !shadow_prealloc(d, SH_type_monitor_table, shadow_levels < 4 ? 3 : 1) )
         return INVALID_MFN;
 
     m4mfn = shadow_alloc(d, SH_type_monitor_table, 0);


