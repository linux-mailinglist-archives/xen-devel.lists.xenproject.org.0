Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C2541D9AB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199838.354134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv3V-0007iF-0C; Thu, 30 Sep 2021 12:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199838.354134; Thu, 30 Sep 2021 12:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVv3U-0007fm-TG; Thu, 30 Sep 2021 12:20:52 +0000
Received: by outflank-mailman (input) for mailman id 199838;
 Thu, 30 Sep 2021 12:20:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVv3T-0007fc-C2
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:20:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ad345f7-f49a-4cbc-aafa-a682679f9172;
 Thu, 30 Sep 2021 12:20:50 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-5AYQGfvzPqC3WQV53YyTvA-1; Thu, 30 Sep 2021 14:20:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 30 Sep
 2021 12:20:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:20:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0138.eurprd06.prod.outlook.com (2603:10a6:20b:467::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 12:20:44 +0000
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
X-Inumbo-ID: 5ad345f7-f49a-4cbc-aafa-a682679f9172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633004449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcnbfPfvjwvbRBDjXE1pl6H+OGafQ+4UuiRZ3VCNkN4=;
	b=Cp/nz0BNVd+JnG7JJncC3xJH5rnono2A6oRiIoYN6DQC5ba/22optT0SoXayOIPuIrUHQk
	gI7Xg6cfNe0PKqtDMaXVXkeD4JIfcCFs1a4vo0t4KUJ2HgmHRTuokHnuhgFCmFCTYhRmVW
	a59OhmkHi/VgvRmaPWmVwoZd3xrdWZE=
X-MC-Unique: 5AYQGfvzPqC3WQV53YyTvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrBJTr4FxA+8BvHSEZ3m+6PzZSDClJT8lUEHWNuyPzJRqWvdWndhdt3MKur0ZHdnEJDZMauyvi0X/p6HXQUmwyr6ESEesEPyhW34AzeLTjY8hnKOLNSX5jIHYCA7FxVp4rXtMHMvreBwkduk58OHk2flEPTNAwxgOPfw/hHB+Agz0Tn3j0RU5b+JJwJS+rxlCs/hXsmgnnikW1aTHs7SquU8e6CG+ahSTmL9M5t0jqrt4nxZoc9KR3u7fcd4Z7xACB6xDKeKeDbCqN+hdrHtQJEXF1hqOROKTHA2UWVjbrcpuf1dBLLPiip0p426whTH6Sl+719R84ZTzO3C30bVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rcnbfPfvjwvbRBDjXE1pl6H+OGafQ+4UuiRZ3VCNkN4=;
 b=gTMbXi5NorRXIPD1/M6hvcSJ8QYJtdKB65jGRcsnJ9l+zRtZ2ViXG7Prs5ZDkncIkKXj9QMcHW6GH3aDxqIZZOoY2Dcj4OqNfHNRn7p04fzwUo8p4Wvxii/Ds6hO4UFKPspF2uCHX/OV0Pwq7GIJ6egCv/N/y9RPbOpTuYT/hr+L1X8vzgEWFKmfIc+KqJBI0lO36SV85AwcFxr+kUHHSDt6PehUafpGOEvaYsKX+YHzcGUitAvrHk7npAdeUcamcwa8XKZNzbeEAhk9cdfXEXX7JQUh+rOBm0vV7+EeefOOwGYoYX49bQPGdUwHmFJkCvJFECGwqIV8nCpzruZudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 8/9] x86/PVH: adjust function/data placement
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Message-ID: <3b0bb22e-43f4-e459-c5cb-169f996b5669@suse.com>
Date: Thu, 30 Sep 2021 14:20:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0138.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2182c689-5b0b-4c06-da13-08d9840cba4a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038917799A871473AB602A3B3AA9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7URPomHxvGjus8IZCVo+VjyB1HBy2tjx1Gu+BOnX/3gASZa74UFTy4bJrgH6bD/kzfJ8LWwJm3x9vGa5siHDDAPchRtASpUdop5gBUuMaI64aJKQuZfA0psKGycr5lBIpAGmqWVaBAPaxhgNIOsT+fEvyY9BAKFAkwv8resUFWJu6wVWUTT7dZLhS9YwsryV7EG+LFnIDqutKOj8NNY+1OB12laQt9r6RlWngkalJBkZoWmW8vGThOO2c1OMd12MT4Ww/LJmDbb1/z3TVAhXZX4eBV2Oicrfg8IFfO0fFIZ4ZqGJtCleytDXjzVmYwRPk25Wq3pfzI16IO7ROC0GcJxdU0liC0xAHMh0SKaaaIkj9kAiAmxCmurczYcziaSFmMLYme6TBqDkZQeq0boLnIxE+cvsBDkuqe0UzDDd7N3EOC7jQG0MqKPspJtBh6GUMw56OgsvRp4xM9gWOeJZb1WD4zKDZg14vyfFm8cEWQlzqFW4SZdaStW/Tmvq5PxIf7kvENcJk9+SwDdPyUkImWdJh3jhmLa84lcd5yJ9HeL4wexCbD6bIeKvGnpcELpK98Y+A9Ohbky+LLZl0s76cpKnB61YK5kWVojDxSpuMP9v4aIuWx30CBUnSyl1Luv2TZTMA+rpUZaiMbhu83fgr/lR+ZSpNsEDisQw1O4YTSM/bHllwaI7nGPfTFmhWT5v8ahp1fRmydK9dJeDiLnY7tw4leGOEmLeHm7G2oTNnUnLhwBvlvS9J+c/IIhhPhRK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(956004)(8936002)(31686004)(110136005)(2616005)(316002)(186003)(38100700002)(26005)(5660300002)(6486002)(54906003)(4326008)(8676002)(31696002)(16576012)(66946007)(86362001)(508600001)(36756003)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blB5NVg1blZyM3oyaVJpWXJ4WTdndklUUUFPSEIrUVVsc1FyV3lsdG4wREZ3?=
 =?utf-8?B?UDQxZENhVTI5RUJadmJLWU1tWlEvZlFEbmdDaFRJZlhDQnUxNE5ZaWgvRTVU?=
 =?utf-8?B?OGF3UFlQamIwM2E3eXNBMFlnUjRzNjFNb3ZoZEhpRnIybjMzR1VUdTZZdVB6?=
 =?utf-8?B?aEtGQUdkbUxNYjcyK1BIOCtReGFjOU9wVEdLaFdJdVRtVWFSTDZjeEZGQUhl?=
 =?utf-8?B?NUJEaGRxUDhLbjlEZXprU21BQzlZb3JMWWZ0VVBWNHE5WDdadDZReWhwTkJG?=
 =?utf-8?B?L2ZWcmtTWnVwZDk5Q0xlVU84eGp6N0YrVXlnRU52MElTR0JHUW15UzU1N0JI?=
 =?utf-8?B?cllHZ3lwNHhNRkk3b05jbGs0bVBqbVpJeVJOeXVjZXNuR3NmSThYaEVwaXNv?=
 =?utf-8?B?L2FRakpJbzhtMVNlbytFaFNidk45eldMdGVCRCtTQlMra3hjRnV1U3NOZFNJ?=
 =?utf-8?B?RW5xZFAvNWZqR2R4VjBLR0FSdVljU0JiNmROUkU5UGhnelo2WGR4eWZKQUVt?=
 =?utf-8?B?OFNFT1BzdWlvVVlEeHhDK1h3NjVXeW9GeWIwa1h0VngrN0tLSlFBYmNZeUFs?=
 =?utf-8?B?VTVKN05TY09UK2FsNjMyamhLVmtRTGtNTnJuOG5BU2NMNFFTWVl3YUpUbHRm?=
 =?utf-8?B?NFZmSHZaY3NVblF5RzZGQXh2WU1DaEhsVlJqNlcxQk9pS083SXppNFZiTFJP?=
 =?utf-8?B?cis4aXkrL0dNaC9ZNmVFd1oyK0Z1bmlYeHFkL1lKY1pWYVZjTkxrcWJweERv?=
 =?utf-8?B?QVpJdGFsdWFsd2xWSm9NSm5QazZTeXZ4Ylg4NUZkaS92NmV4MlAzQ203QUE1?=
 =?utf-8?B?SjliYjVzdlZsVGRoRDRVU0tTclZ2OUdlMENZOUJLZnJ4bUp6SDZuMU1vd09s?=
 =?utf-8?B?RzFHK3luZE41YVJYNTBKRG9Ga2xRSmlvdjQzSEh1YUNjdGNSQ3ZRYmo0SFgv?=
 =?utf-8?B?eHBzZisvZkxZeFk0OU41ZXR6ZlpLODd2M0pyM0tLeWl4c3ZsWStQbHhUd1o1?=
 =?utf-8?B?UGEzWm5ZVS9PYzVvckFjNGROeE5oaldVUWF1NVFZbjdDWnZ1VkY2eEFxbHYx?=
 =?utf-8?B?dzY1amNKaVBpQXg1NDJaS2hKb05Pa2tJZm93NnpPMWdHeHkwR3haOFJscWdx?=
 =?utf-8?B?a3o2Wkg3c1RNQm1TTHdDYUpXdUN2NVhvUnVlWkFOUWVPa3puUmZHKzRMdFlZ?=
 =?utf-8?B?N25BbWxaS1kvODdIemhFWjhSbEdleFJVbjRoQmJlcG5PTVNUZy9sc2NOWW5h?=
 =?utf-8?B?SThmTVlvdUNwcDhyK3loSHdOSVhIb2ZIalVrcEU2ZFhHVmpBTElscFgrUGh5?=
 =?utf-8?B?RlhRV3E5VHlhcVpGbE1DM1dwakR5WVh2UVJUeUdVMTZPQmR1SFRzTWJmRVpk?=
 =?utf-8?B?ODY2RGtDUWU2S2VURXRQcFNEZHVJeHExZmlVZzhVWDNQenBkdENFQzlHejJR?=
 =?utf-8?B?Rjl3cHdZWnVMNzVJcUY4eGN0MDlEdEljZVU4RHc1aGNiQjBEOGxYVm55STly?=
 =?utf-8?B?NzB1c0xjQVh6aUUyRWVtcCtjUDdYQ3JEVlF2NENXVkp3UktRbnNJTXlYS0Mx?=
 =?utf-8?B?RE1JVUZDMHlBTjlUMHFtN0JlQ2YrT2NpT0pPYmNSMjZuUzhMNzZlSGFLRmp4?=
 =?utf-8?B?VDBHdXVQSFdZRXIvc0RtcmhnQ003OEpLN1RSdXk3Wm5ERVV0MWp1Wm5zeHJh?=
 =?utf-8?B?ZFQ3M2ZKUDkvejdSWkw3QWtPa1I3aGRXcXRjcjZWMTRlaUwrVzhKWVlOcDV3?=
 =?utf-8?Q?uAwk3aZIqgE9qRXdNMwAnnsfLOyewp0qIGGwNBe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2182c689-5b0b-4c06-da13-08d9840cba4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:20:45.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppjs6jifD+dQgrIqxFi9CzgyTJJcyBLRME/y1Xr5CHLUX6DNCQ4KPok4NA/IvKleABQxGHy7f4lZLrZJ2We+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

Two of the variables can live in .init.data, allowing the open-coded
placing in .data to go away. Another "variable" is used to communicate a
size value only to very early assembly code, which hence can be both
const and live in .init.*. Additionally two functions were lacking
__init annotations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -16,15 +16,15 @@
 /*
  * PVH variables.
  *
- * pvh_bootparams and pvh_start_info need to live in the data segment since
+ * pvh_bootparams and pvh_start_info need to live in a data segment since
  * they are used after startup_{32|64}, which clear .bss, are invoked.
  */
-struct boot_params pvh_bootparams __section(".data");
-struct hvm_start_info pvh_start_info __section(".data");
+struct boot_params __initdata pvh_bootparams;
+struct hvm_start_info __initdata pvh_start_info;
 
-unsigned int pvh_start_info_sz = sizeof(pvh_start_info);
+const unsigned int __initconst pvh_start_info_sz = sizeof(pvh_start_info);
 
-static u64 pvh_get_root_pointer(void)
+static u64 __init pvh_get_root_pointer(void)
 {
 	return pvh_start_info.rsdp_paddr;
 }
@@ -107,7 +107,7 @@ void __init __weak xen_pvh_init(struct b
 	BUG();
 }
 
-static void hypervisor_specific_init(bool xen_guest)
+static void __init hypervisor_specific_init(bool xen_guest)
 {
 	if (xen_guest)
 		xen_pvh_init(&pvh_bootparams);


