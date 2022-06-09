Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED65450E7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 17:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345573.571239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzK9t-0004ZN-OL; Thu, 09 Jun 2022 15:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345573.571239; Thu, 09 Jun 2022 15:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzK9t-0004XC-KI; Thu, 09 Jun 2022 15:33:17 +0000
Received: by outflank-mailman (input) for mailman id 345573;
 Thu, 09 Jun 2022 15:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzK9r-0004WI-FZ
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 15:33:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe07::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79833a59-e809-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 17:33:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB3964.eurprd04.prod.outlook.com (2603:10a6:5:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:33:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 15:33:11 +0000
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
X-Inumbo-ID: 79833a59-e809-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWnU1I06i8cJcK2QU4H7TaL2Dc7Mx+fcNkF+G2zIdLA0b7mg18rZ38hghRPBmOI2/SzNvzj/UCKOKW7jWTV+F65Byg/DDNq+nVSRg4Bb/jMcFr6qpWhiLFRDQInumS5wlyHQug7QwoIAyjFBP/HVHTbrylko52Pjqrep7rsZ6Di394nwDHPALVj4VuypF829mqjDIkIfbTh5L2be8kBlXaIvDf3fWvX+VDc2hNc6niLDgYwuGe4mPAEn7bKzxij433QaXTA5dWZtzGU71/TtmfD22m5jISW3DwdZ7DeHFfsi2MY1JAZGEepKmMyvOP6c+re6J4J9zFiA4Iv0FS2v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWJJO6antbaHMy0EvuQ/2kfKU/qfWA/ALEs00ZVoJvc=;
 b=HpBMGVVwGr0d7TTUTwbG/x3bQTDi8pYdKE1SRSKcqZpnlQU100rI5dpjz/nMcYFiisr35vM0wrXclZZhV4ocjU+nRALhNZqjrffmtNoSDRlr4CexGtRHDGO02WEW3nJrXryrqvrZM0lHnLUkYH0kEbMBR/f1tRwK8ilJ6fr0VwEUTJLodXBKS3rwiDLdMpWxZGMjhAR79XhJHE9eQVVJkd//I0mEbsHKfeio/cKVVmJt68nwhnpgwk3hH/5P/3evxPVFCYbOl165oYaCkUjPH4KyDWrR5bfButDhgQzU3LY/TGCGtTwJeyOatj30DL129qGtS450+zoPNGoW9dvEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWJJO6antbaHMy0EvuQ/2kfKU/qfWA/ALEs00ZVoJvc=;
 b=OG63E1YLqwKKjOFXwH1O7jS250HWUJJWlO8lq66KnGJSxt1NklFeOXIj0jLkdIsTMdmwXufp0q8JhDxYoRyJJnsQlsu4rnf6NSBeeT5wJtQAqwDlYYodfN4gJWBE1QlpOdl9mhmWfCR4uoQ4W4HK/EppYP+HRaV+xAAZ0ziTbIdtZl963wihan7ELux4ywOkzitBFTgzyaUBo3TOCFzmg7j3+GUK+uYYMSdtF9z62jA+vOMxRAUDrOiBKkHNVUedvBZjTUFp+a6d2uEX4CAuqS902BtHvwQAnpEEtfJoiZxav4L07YYlxRSjeP8+FZiRyAP7QsbO6pYqRVhNrB/r0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <baa7d303-1fcc-cd59-0872-a930ea43734d@suse.com>
Date: Thu, 9 Jun 2022 17:33:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: drop XSM maintainer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aaac52b-b51e-4655-5d01-08da4a2d5ca7
X-MS-TrafficTypeDiagnostic: DB7PR04MB3964:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB39642FBC0A8CBF81A23CFE6EB3A79@DB7PR04MB3964.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FCW73r4cXKdlkfSZDRGygjvkDjMdtTRpnXAHNlk5I3jQTgJrHOGFN+SVQ0KWXOn2nNjZhQEWH7cYx+Usza4slc9ExO4vj3X/pZrEclaAXO5yTjYtruF/05clCRymvI3voGV0wXmNBxETqPtTSaU6FgJLKtlEx4YTgBdLd22J2IUYeoA9HJsVywXhgm8nslYRoiyHupvz1tNEaqG9HIb319RiCkobdDw0TaQ3p5eh4uvhM61vTYx0nPu4r0Pi0ktOr4pd897N/8BSVzcM8g3bjPfalJZcgNh8iE5jS7rkLaQJHhsaLHRY+3Ve54VxPnD08tYFweHiq/CIJiwTzKw92hNHvxwm5NjmWfrBw6wjfiBJw76o2YPrPHVOCnMSfNWeMMrOYCkpBGjhlUepgqq5vNjyodAxRBtVozbee+lnWehAMWZa2aCSjJDVvXs/QTagMGPjIq1OhHAwiKQq52soSPNo7uAhF3wz8N5puUtkK6AAmld0QZCmatggBIIKsiAF5LYfQ4pgYJt4qPE4zy/82SHvxQTBEZg9Z5GpJcj0gVycEIuyoZYM1zm01s7zuvZ78GefF/8gUaIYVzm/csEndc1YT198ekQjYw3B0+iOO2nrPo0WfeJpxZrdMskrKhbX4+/UW0DZ/UPOjecX6kUjkjGw8+43PPjMtHMRy3Wda3we81vEpU9u/l6r3qzdQjTHxF8Dg78TiXDmGtSLskmd8L61IuNCmEkViTTBlaqPK9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6506007)(6486002)(2616005)(6666004)(6916009)(54906003)(186003)(316002)(8936002)(38100700002)(31696002)(36756003)(83380400001)(4744005)(86362001)(508600001)(5660300002)(4326008)(8676002)(6512007)(66476007)(66556008)(26005)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGIzQ055dE5NeFdsRGxCQ3RZR3JsQ3pQd3pQOVJmTm1nZkE1TlhLcFUwYWVF?=
 =?utf-8?B?dUJFY1NTbUFNNDY5QVlpNVVBbXo4emZoVjgyZkNYSXNjZE83Nyt0eWNBaTIr?=
 =?utf-8?B?SzBHdWFKRjJFZ2pIVEVyL2ZQL0g0N1BVV2llQnovK2xPNWFQc1NvVXpTQjF6?=
 =?utf-8?B?QlhKY2I0eVgwVDM1TFB5eGw1Vml5ZE51OEw2MHNOVWJDOHVvdmNCNzR0NVJU?=
 =?utf-8?B?eGNZMG9lbW1ycWRnUWtMWkVhdm0yUmVuNVRKeDltbzBhc0ZhYithemRMS0Ry?=
 =?utf-8?B?RHFVekJ1VE54UWljeTdzeldNWHlHK0Z2a0lpQ2t6RFNmNTVheFRCenRpb0ta?=
 =?utf-8?B?aHlSNHp0ZGRjejJLOFFJOGZoVCtTOWVmS3NtaDNiOWVrRUlpSHhZZDdtQ0hQ?=
 =?utf-8?B?bGM4UlNlUXU2U1UzR1MwdStMcWFRZ2p0WXhyYkxwVGk3WkNxdzNBODMxNDV1?=
 =?utf-8?B?MzcvNHh1SVhEbGNCa0wvZmNBUUF2RG5mb2c0cjhldUI0R25GREM1alJHdDRE?=
 =?utf-8?B?TkptM2FxQ3FCR05uODRrYUFqTkR1cW5SWkRIM01VS0Z6SndsTmhlSWFrcmxO?=
 =?utf-8?B?MnlDYnBUY3p3NnpsMzNNZDJJbHUyK2JabWxtUFkrOENXTnltYjRRODNrUi9G?=
 =?utf-8?B?Tzk4ZHhuaUYvdUtJRVlZbnE5UGxReExER3c5citJRDk4dlRLNFcrRXlzY1Bx?=
 =?utf-8?B?a3lhUjJPOFMwRk1lQzlGNG8yb1lpSjNlclZES25nNmp6N0kvMXp2M1cvbmJT?=
 =?utf-8?B?OHlvVnJURjVMM3F4MHFhM1F6MWF3NmlYdFBIUXgwckpWN2NZMzFjT3paeFND?=
 =?utf-8?B?dUhaTk9Zcmt3c1Vpb1BzS2RPNkk4QlZlZHBTcC9Jc283Q1VaMGxwYnptRGFV?=
 =?utf-8?B?aW4wMHFyM3J4eG1FY3d3K0czdzNZcXczdzA2c01hYjBQdll4TE5ycEdYMmpv?=
 =?utf-8?B?ZUNVSzcrcTdCMldLb2Y5REEvZUtlNld6Ty9xc3RXM1RJZWhXaFVjSktZRms3?=
 =?utf-8?B?UTJHV0dxM1VRNisrdFJXL1VYeWR6MW9ZSTFSYk1RaVdtK0xNaGNVSTFSbjJU?=
 =?utf-8?B?TUpNYVE5MEtWdHQ5Tlc0dXQvNWo3aitFOUJjZlBPRjgyelFwcmdQY1JXelVT?=
 =?utf-8?B?VTI3eEVIKzZHWE9QRGNqenBrV0N5elhBZDUrWTExdTZBM3RESTR4YjAwR1hr?=
 =?utf-8?B?UlpNdk51UStTU0dra3IrcjdxTzJVTXdOcHA1eGpFSHQwaG5jenFRWVpQSTZX?=
 =?utf-8?B?Njl6MnJUVzBXWUdRTSttY3dialVqYndtK1ZMMDlrWVN5eExTKzNrc1VtT2Fz?=
 =?utf-8?B?L08zbkVCMDRZUENwOER6SlF5UDNlRklibC9nWDJjdWowSmVmeEM2VDBibFpy?=
 =?utf-8?B?R1NlR2xxdk42MHl6Y0Qxa1cvSC9veHlXUHBMN3hYWTRlQlJxdkcyOXp5ZmJY?=
 =?utf-8?B?elVuaWNHZXFzQ3gyREpZTFFwT1BRZlpJY1NuaVY4VVliVk91ZkZOUkNnWUt3?=
 =?utf-8?B?alZMTVRpOFkxZnZ3SjM1eEY5QVBKV0NyZDRmeW16RUxZUWkxUFQ3ZG1Tbmt0?=
 =?utf-8?B?Y2tYalJhaTNjZUlQS2c3KzJXNUtlbUlFNXlQd2hzVmg2SjgrMmQwQXhNN3Ir?=
 =?utf-8?B?UlcxendyZnJCc2phR2FjcDkweURabS9yU3NvOGtlQ2V5eTZSV2tUYVlCV3g3?=
 =?utf-8?B?REpOOEU5d1N4bHZvM2JjMnpjM0ZUNGh5Z05HV1VKOGU1OURoRUtKaTdmYmFE?=
 =?utf-8?B?TG5sQktWVFNlQll4SlZyUGJxQnRRQkFJQnBrbEorUmh0SkdVZlR1ZWFuTStK?=
 =?utf-8?B?aStNS2dPOXVSZWkyUXdTRFBvVEY2RTIwbW9FdDd6NnZ3WE54NVc1VnZOZEtz?=
 =?utf-8?B?OWxZMERMR0QyV2lTaXZsSU5SVjNZa3BZT0Q1RlBabzIvTHpLcW0xbUdrRDZu?=
 =?utf-8?B?S25lYlFiZDVzMDJvTHdTOS9rTFJqTEZ3TlA4Yks1UHJ5dkxQeWY0V3Y2eG5T?=
 =?utf-8?B?T3kxVXJQNElLQ1VydzBISllsK0ZCdUM1aE1mTW10K3lTOTR1SVBjc0cwYmRo?=
 =?utf-8?B?WGxDRFhVNkhBamM3WWozNHlkazFLWGRlTHZib0ZTVk9iaFNXREJwV1RLdkE2?=
 =?utf-8?B?R2tpL0ovTXpoZkI1dkZkZVpoRFhOMEFIWXJCbFpRUFpodUxqWWJqc2Q0T0I3?=
 =?utf-8?B?aU1DYWsrKzFzV1RpcS9XbjZWSTlybjRmV29BWTZyS1F1czVzVHpOZWEyYXdP?=
 =?utf-8?B?bkRVT2ExWjJsQk5xK0JDb2NrRkQ3N3ZneXlYeC85b0JtbjU0UGx1bVRaUVlU?=
 =?utf-8?B?anptNE1YZW04ZWxyMlZUVk9oTXkzaGhNTittbUhMQ3Z2NmdSL0tGUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aaac52b-b51e-4655-5d01-08da4a2d5ca7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 15:33:11.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKnY42bzjlRCg7xwio/cDFwd8e08KE7x4S3HoaVYoWhEnZ2dj9Q8OLWc6A+aNR81kPFFq4k0jfb6+bwXAH8KFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3964

While mail hasn't been bouncing, Daniel has not been responding to patch
submissions or otherwise interacting with the community for several
years. Move maintainership to THE REST in kind of an unusual way, with
the goal to avoid
- orphaning the component,
- repeating all THE REST members here,
- removing the entry altogether.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We hope this to be transient, with a new maintainer to be established
rather sooner than later.

I realize the way I'm expressing this may upset scripts/*_maintainer*.pl,
so I'd welcome any better alternative suggestion.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -648,7 +648,7 @@ F:	xen/common/trace.c
 F:	xen/include/xen/trace.h
 
 XSM/FLASK
-M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
+M:	THE REST (see below)
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Supported
 F:	tools/flask/

