Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B3401C11
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179831.326241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEFY-0007H9-P3; Mon, 06 Sep 2021 13:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179831.326241; Mon, 06 Sep 2021 13:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEFY-0007F0-Ko; Mon, 06 Sep 2021 13:01:24 +0000
Received: by outflank-mailman (input) for mailman id 179831;
 Mon, 06 Sep 2021 13:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEFW-00070n-L8
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:01:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85213f56-0f12-11ec-b0a4-12813bfff9fa;
 Mon, 06 Sep 2021 13:01:16 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-4zTxguOhNJyKD5lOYhCkVA-1; Mon, 06 Sep 2021 15:01:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:01:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:01:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0181.eurprd02.prod.outlook.com (2603:10a6:20b:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 13:01:13 +0000
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
X-Inumbo-ID: 85213f56-0f12-11ec-b0a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630933275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXqC7kdE6vgcxzHsZu6LKPSCCwekAZOdkt0dRfJilCw=;
	b=Ktcpexp4X1FT3W4pAC7pUsPQzrkGO2TVGTntuRgBWNeIFnI16yoYesiVD+RAxa7GN53VrY
	shfEaP0flxV2POE8B/TgQsqvVC3o0bYlbIzqzKUOYKSUhWrZYuRenu4Jlo5xtrnun3hVLM
	YQHEn2bR6i4iXVDjQxSoQXxcJfUxda0=
X-MC-Unique: 4zTxguOhNJyKD5lOYhCkVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ1hhvpzshOWV7M8HGtnj/xEGUliPqE+LcKtpQ9eTUvHV5LNbZzIAHP7dZsySbv1uMF328nXodfDda0OqBvFrE10edK+XIcNXYzvcsBAlNcPkw7Su5JhKA6/J6CQN8eQdpczJC5t2FWtKD9UM33HkaY8aQQem7Yu2nz9zFE8cbBv9ld+4zndlbw/Ag2SSg8PWixxSYFXpK/FI5VrTLGKGAk7BOqcJt6LP/VRRK5v+qpYC1DjfKf+zc1ZcgiEXmQtG0RMdqmY4BgwEPX59Dsvw+khjgvylPJbVeFZ8E3ETDbblvW8+Xka5Qq3P+9fJmwV21rZ5BI+eNuBNtL2REUeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gXqC7kdE6vgcxzHsZu6LKPSCCwekAZOdkt0dRfJilCw=;
 b=Hc02hEB4Ogp1mEAvFDowtjsJA98bTzyr1E/ahMO1JN3d0GewcSEFwl9NeHAvXQboEPS2A6tX1ArvVagrydPWp57slRMa9qYg7NNfCjN7tDCNpSNMRhGZp7F6bCV1sjOvxWUK4CoThYJpFPN7czwXTBZysHYNNweOTmS8vhi40jcmhvDgho9U15zGAR64xcDw9dc74Rhny8deo84Wc+qieTrA+oeHgD29998eZbgVNHth657OcAiC4nt68jvYqupWLZEiqIrF44HDL6EAXxPNU2/oLV6E1iTzvX8FMbvZjRgPs8FnMdUAfuZGf1wFx0+iVHerZMqCSJT5sZl4155ACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/5] x86/mwait-idle: update ICX C6 data
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Message-ID: <fbe74c84-c9f9-dc00-a614-151634747f33@suse.com>
Date: Mon, 6 Sep 2021 15:01:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0181.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5dc565c-0990-49af-0609-08d9713667e4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608868B81A5D4EAB470088AB3D29@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Foml9KDVDTIII9oDRVhzQetiXWAASLxxWUp+CozyqOhQXp3CKUw21a/FoF0QBZ4cW/7cN94Kk27e2OeYJpxFY4oQpBNIlcxjYBytawQ2gZMGxUOppibIuhwHjCqTkvmTs4oNcd4qbbXh8SS77Fdboek8FoTA+ViiB7zytSRsidBGkf3fbtdQczBWZaf0JN/6WRNfi2t9yaLBGXMiW8vL5WPt7e5wPOfvtTZzBGPirM8JCWvckrShRe77ZsUXFuZfm9aqfU/kmflRTD46YLrBq4PA9a3AoQSZtJ47o9dOAF2NL+IvB8IisdX1vAsAU9axU1QJPFhBVqpECboPf2YiTezuUJWRtO2TcMy30w4HY8FKpkU4lpaODbQVUk0U5Hns72JpUBLQkNUGDq0WmmWTZWX2XnHTxjnd1cdHtccJ43cVIEts3fPkGjl12F5zI34nQHlgwofk7m7npf9GOt1axwEVcvogytnH0Mi2zcYPOaO7scaTk4m4bSg1DgnEaCogPItvXFFLGH79Pt+EffDNV4cbz/ZjZFsDzFZJjPhLREA3MX2Rm7Y3fYzl33b+KVxr0ekZR3XcjMQ0JpQSY8xg6iONG2LihnNiFIObnSM/ICu6XiFu8hYFtp2gvQVu38nmDy4bAtJGqF3dJx2BIPcS2VknG5u9rgCFyy4ke/08Av/69IB52+fggWpNzI6hgYkgcd0kVPykHGaRL99my2w2VwMDEqeHY+VJ/QWH8lV9V5Cb36vvHWAT7eZb87kv4hWN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(136003)(39860400002)(66476007)(66946007)(54906003)(478600001)(5660300002)(2616005)(6486002)(16576012)(8936002)(2906002)(31686004)(8676002)(316002)(956004)(4326008)(26005)(6916009)(86362001)(186003)(31696002)(38100700002)(36756003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjFqVWpTdktXT3hJV1RDVmlvMFgrR1JxNWtNd0c3WExQNHpZUE9VZXhObHNL?=
 =?utf-8?B?UThQaWxrTEdqTG81MzZrTDRKRzNMSk1zM3FVUHNOOGdIcGlBS1VmM2lNTmEy?=
 =?utf-8?B?TnNoSjdzbWVhbVhWTEFxNU95L3RDWkNrK2UzQnZjVzN6a0xuQnNtMUhkbTRH?=
 =?utf-8?B?dW1xUlN6VlRTYzJTVy9KdWhVVkpjY2lBSEQ5cGw4SDJjL3gyNnpMbm5OdHdq?=
 =?utf-8?B?eGJjTnVNT3RWRDlLNTlpMlFhbSttQ3RvMy9OK1dpOHlaVVUzMHBoL1ZBeUc1?=
 =?utf-8?B?M0ZMRVhtTEdkQUxmQVA4QTlzNTFJOFJxWFFtYXJad09uT0dubGRLTE5nY1Zk?=
 =?utf-8?B?TXl0OXhYamE0SkpwQkRzVFJxbVJHZUlXRDNKSk1aZDkyTnhwL1YrMWlFdUxY?=
 =?utf-8?B?d2pEbUNTRy8vQzQyUTRKOVcxdGR0MVhFNVJTNVlMZFhZRy9RSzJ2YWdGSWVj?=
 =?utf-8?B?c213VG5ycHhpcU1oSlk5ZzQyT3RRYXFWOC9ZN2Jmd2JUM1M0dkl3R0VRS3o3?=
 =?utf-8?B?MUxHTFNWbko0bit1NlAxczRHVzhsQW5tTktPdWRBME1pQWFzYXNNSHNwamhJ?=
 =?utf-8?B?SmROOWJhSDU4S2FFRnMzdktjY01nZDg4bWNNRmo4YVZMQjBUejJhZ1BILzBU?=
 =?utf-8?B?SWtHT29jU0hKMEQycnFVY1MyTDFqUklURmVrcXlqMnRmMmVIVERVR2tuR0Qx?=
 =?utf-8?B?TlpGN0l2WHIrS1I4Z0lwM0svMGlHa2FpaXRrUFdPaGExQW5lcW1zZml2aGh0?=
 =?utf-8?B?eHRJbmFnQ0N3Q3NNdjR3U0U3V2ZmMHdBN1dzSlhqc3hKd0g5a2lBWEpHdElP?=
 =?utf-8?B?SnVqeHg0R0hlUXNuMjExa1ZZa2I0TWVJVXdWNlNIajcyT2s5WG5PRzdmSUky?=
 =?utf-8?B?Z0ZNNkduMUZpQ01KY0JLZ1YxaTRGUm9aRXlaRDd5blNiSDBqRms4YVRoeTFU?=
 =?utf-8?B?aU1RbzFiSlpRM2c2Y3hqQVlvY1N3RE1rOVV2NzZEQkU0THI4WnB4aDVCTitm?=
 =?utf-8?B?cEJLeVpscGs1VHpKWEpxa2FBVWJxRmo0czllYUFPeEM0QU9iVmJoWVpEQUxr?=
 =?utf-8?B?UE5rOE1sTmhLTk84eExiZ3J4UDhTTktESkMvalA2cm9oQU16b0dnUjdwUTZn?=
 =?utf-8?B?a0pZbkJMQUNQWkljcTVRcnlLUHc3Q0UwMklQVlJNWXBkcG5TSkVIOGxFNzlr?=
 =?utf-8?B?bE05MDVHcmxCYS9kU3NCZm9NSWFtWHRrdnM0TFZ5bVJLaWJqc2NpU0hNN2hM?=
 =?utf-8?B?aktIWmpXVnFnMGM2SjBiNUJFNHdvNUEreXdHaEZPSFJINzE3L2R6aEhDbU0z?=
 =?utf-8?B?cGlhWHR5TktBVnRNVi9rUmZ2MlJYYnAzYzQ5VFRCNlM0ZE5xSDd3Q1p3OWlE?=
 =?utf-8?B?SjZjS1NqM3MvbXcrcytNY2xqaWU5d0tZZlBHUjZuZkZiOXlJVVdjamc1UDhI?=
 =?utf-8?B?TlJmMXdRU0NFLysvSXFGV1hia0t4TVdvN0Y0SUh4ZGM2aDcyeU9iMitHZ3FC?=
 =?utf-8?B?MHI0UndwTFRUdW9hbTF3VE5sa0JpRE8xVDVQWXpVZm8xKytibHlTTnQ5akdR?=
 =?utf-8?B?MnZlS3c2TmplN2dBVDYweVFPcEJ4MzBFbnYyMmIrdmFyWWNqK0pYaG83NUtF?=
 =?utf-8?B?ZXcrQitOamFBUWJsS05BSFpGQ05jaFVQWjd0QVIyZkIxT1hia084UTBRTXE4?=
 =?utf-8?B?QnpNNWlWUHZGbGRMYm5TRFNpTnJpVExobFlBYmdXMzFOdzRyOU1VYVhaSjB2?=
 =?utf-8?Q?Rov4S/z/iy3boIpeBy/AWAYbIFGvkp9GjsKV3rQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dc565c-0990-49af-0609-08d9713667e4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:01:13.5545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e86jtHR11cuJbPnyo8CNIznS+QrImzwD0T8IPf+jtAG84+eAbtziWKRHjawtb5uL0JY7IywiZSgCX6HHKrIe5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Change IceLake Xeon C6 latency from 128 us to 170 us. The latency
was measured with the "wult" tool and corresponds to the 99.99th
percentile when measuring with the "nic" method. Note, the 128 us
figure correspond to the median latency, but in intel_idle we use
the "worst case" latency figure instead.

C6 target residency was increased from 384 us to 600 us, which may
result in less C6 residency in some workloads. This value was tested
and compared to values 384, and 1000. Value 600 is a reasonable
tradeoff between power and performance.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Acked-by: Zhang Rui <rui.zhang@intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit: d484b8bfc6fa71a088e4ac85d9ce11aa0385867e]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -574,8 +574,8 @@ static const struct cpuidle_state icx_cs
        {
                .name = "C6-ICX",
                .flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
-               .exit_latency = 128,
-               .target_residency = 384,
+               .exit_latency = 170,
+               .target_residency = 600,
        },
        {}
 };


