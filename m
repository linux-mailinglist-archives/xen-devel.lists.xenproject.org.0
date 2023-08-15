Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE1677CCC7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 14:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583959.914320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVtHK-00057f-By; Tue, 15 Aug 2023 12:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583959.914320; Tue, 15 Aug 2023 12:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVtHK-00054i-9B; Tue, 15 Aug 2023 12:36:06 +0000
Received: by outflank-mailman (input) for mailman id 583959;
 Tue, 15 Aug 2023 12:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVak=EA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVtHJ-00054c-8N
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 12:36:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a8cc588-3b68-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 14:36:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9916.eurprd04.prod.outlook.com (2603:10a6:10:4ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 12:35:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 12:35:57 +0000
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
X-Inumbo-ID: 4a8cc588-3b68-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yc3sf5TxckrURwNOt392nqn9QKzWw+TwVbD5C7mjJgZG0tV3tXN6BtiooX/dp9ATYbLWdolFMspUWc5Rlf94xCW9BYdJO6vucujoaG03/UUnrO8kd7vdCZB+7FDnZUat0K9YTtOyYBO2mUv1Fx6xtrbor+8BymrSd5ZXRMg9eAQvM/CM9rYQ9klTiaPyYUXOFvAFjARqCm0TxTgS99DbqFZ0b9Jnmcn1KLaPGBBbI2/1lkKvZTMeBgS/+Zz3izTLZ11VjXEVvrmotE0Xhgij2nnlrWsbzjJy7p1PfuOZdu4AmjRcJixklHvIrfeegAYs5EiHL7ZQrrsxmzhrLoJjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaWln2defixNwk0FmjkU/RDv/F03c2eCwBL94Q2gTkY=;
 b=RaTlEiApAweekQbpASDymSpCfihRgJhkXSHBejnbemAu4fPOMu19aSYUWGPzPw9wVNz8xSxZBiSSZTuLUHz1XvyUV8PHMaMhcZI8/g13omD/PU83YDFVogugDn5bLAqk9TX0MOstRO2xZ3UaLbE2Pf0K4lg4ZpyNAY0e05yBkeNKYuAtjaRSNYn5wOvbxzT9WhHefyGO6yteCC0kJNEEYVeoCrkAIZ5lttmdCG2c2QYMBdLgNQHlAyUsLtS5h2n4cG9Vc4NDoMrAciLYuymQx9VYQvVxD4D/m17xtVrpNluXEXQesaxnMNAtjxTy/h1iT0tRt0IzR3V9iM0aejoq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaWln2defixNwk0FmjkU/RDv/F03c2eCwBL94Q2gTkY=;
 b=ujBy0sx/EwU9nDUJjj7jjlA66w+42rMBzS7fbSMDCKZteGb/VCS/79z1/897cDBbtZ0PLgbIkDp766aEePKK+MG3VzS1TJMX5XTMpTY1NdYEljXpVsaw6/WtAmQSjLuwIz9ogEIk2ouXIS6RUklnlVWzQJAdySDRfU9IWO/lr5ev9Vy5fH0COZB/OpqERkxjkKRHRtCZEMg0uOlILh+VDJ/n/DypBtTsAvniI1XG7Lb1n6meOP01ZZx3n0Q2uKg4NE1zvAtAT7K4Cf/y1QyGEDnnfAwCLQ2J5UwJUQyO6Y3Xt1wv0jJcROlcAHraxiTWWtSl62MCjY29MgnbKYayLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3fee3c8-c808-e2ae-b885-d24e785989f6@suse.com>
Date: Tue, 15 Aug 2023 14:35:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl: slightly correct JSON generation of CPU policy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: d880586e-b7cf-492a-506d-08db9d8c2cda
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ybzsty9qZb5xmQRJ0vbibJMD30g0S5ejJPZ7yf80DdhZRzrKJOE/Tc5Tgrf5taGYg2H3u6vKDQRVsmokVq81WCwWcdVfhHKTY4z88zzvEScpUv25Mccm0ARU0SzRgB4Mc7UUkGw7COQlJ9k+sawYLC7uhH4NQbYNTKZpJnMiV5TH3RX23PxJpszX0eqWITMDDpa0OEyW0DMUlAdj58kikuY09KMmhUb3oFEVkViod4ZaFcKbVcrQxwL4x/F89x9A82DfaID4GOcQ4G0f4/3o08OQ84kWlHPjCuPB5XRSiNVX9ompQvwF+AWzDpeeKH29E+G49mrgWDxSazx78/OfxZaydday6wE70N4/fHLGzHVgSo6F3vi3Dqz4a9UY4s1EGEJ8m5hcGxeYzyrOHKu3XTZAZbybARyJ/AU5wd/kqpDWb5BbyCyq7/TM2r7kQLU8q0eUFZTUkXMG6zdwgKrDGqqSvzshUKlpy96/NbLqRQcI2GP+CaVFNQbu4A20beMrh+ZCtduFQdZBiQ6jTidO+XpexmmHajZczGRBggYWMDGK3lg29u5lktfDHWE5KUTqWoX/ol2rL6d0Bu5zd4c5WCVS4vEOji+BY2H0vXseZHwHjze2UDiGWvjUkqM0ljmstdv4K/UGLj7hJmlpoPK0Kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39850400004)(451199024)(1800799009)(186009)(36756003)(31686004)(6506007)(4744005)(26005)(4326008)(316002)(8676002)(8936002)(66946007)(41300700001)(2616005)(2906002)(6486002)(6512007)(478600001)(54906003)(5660300002)(66476007)(66556008)(31696002)(86362001)(6916009)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFFDdjgxSTZhWUlQWVdJUjA2ZXJlYUZGYnJjUE9SRVUrekpWSW1Fby93RTlY?=
 =?utf-8?B?ODJGSHlhbUVMRjJXSTRyVE9qYUxPWmI2ZCsxMERvWFNpa0RxdTZCVXBYN3RR?=
 =?utf-8?B?WXRnSGcrV1NiQU9FMmU0cHZ6Ym80OWdVNHk5NEFEMVZqTjMyRUFvWWZxTzdr?=
 =?utf-8?B?elBHOW4yS2Z2aER2QVZtU0dtZ1FzdXFSTHBhNXBHemxUb0xpZXZDdFNmR0NQ?=
 =?utf-8?B?S2NzcElybVBZWHh1czVKK0UvUkZqTnU1UlY2NUVnMUtiQnhpZHVPOXpkTngz?=
 =?utf-8?B?QXMrZnk0TlNNNzZQTys2SDhiNTAvazNPbnFEbVlrdTBEN3RnQmVEUU1PWThw?=
 =?utf-8?B?VDZ1ZmJhMWd1MGd6VUMvZ3cwWFlyRkhHTUhqbjBIQ2dOSlZRazRINGd4Y3Bs?=
 =?utf-8?B?TUJ6U2s5Zi9zbEsrYS9FeUdxYmR0UGtSRlNSSXVnYWxGZ2FEdHczL0VBOUc0?=
 =?utf-8?B?Q0ZWSklUU0ljU01jalowVFpQaDNQZFdRRGg0OUF1NVpxK1JhVEgwOVpOVWtD?=
 =?utf-8?B?K0owaW4wVWl4dlUvWHhVSXRVNTNwTCtNeTl4Y0xITW1RcnZEbm9BVHVvMVNG?=
 =?utf-8?B?VDhvRDZtZVVlNHhJUXpFUE0vQTB1UE1DSmE2RS9wdmxlNWxySlMzMDFOeFBM?=
 =?utf-8?B?SUJ3cUdObGxOeUk3dndFdjlsU1NaK043R2xnb3RrMWkxN3hwblVLbHB4a1RL?=
 =?utf-8?B?djBJZGFpNFZyek5EdDZOV0JUdEZtN1hTVklDQm4zNU1hZk00OTN2eGY4ZUVP?=
 =?utf-8?B?dTJpS2FBU3NCcVJkdmN3UmtpV0I2YTc1S0FmSFk1OWw5QVVwSExKOXQ4NEhs?=
 =?utf-8?B?RlR4Y2xNbTkyY0tVWUVDSjNHc3NGSm9vZ0Vna2tpcnIweEkvbHhzWE1yRjhM?=
 =?utf-8?B?UFpZOGZESHVZWXpQVFpRZDV6RG16aGN4M003bEVyV1pqWU9GVG5sc0ZpQjFT?=
 =?utf-8?B?Z2xzanowc2xkaXNwbE5McWdiNUdqY21BZ2hhMThseDYrN1pDbXh0Q2lnak1Y?=
 =?utf-8?B?ZytkaHFxYnY5U09jY0ZyRUJoalpTRFAzR291aXRyVjN3L0YxWlFRcm40bVRz?=
 =?utf-8?B?RjVOYU1uaDBWbmJCaGpqbXBEVFZoRmozTXNlQytqZ2FQMnFoN3B1d3R4ZXgv?=
 =?utf-8?B?VnYrNFFqd0hnT0RFUHNLOVc2U1hYZzdsTGRIU1dkZUlQVWY5ckMxZGl4MjVh?=
 =?utf-8?B?MEVnTW9idVhzUWUrV2hPTGo5eUdzMGtZbEhTdlNTRFRtTGJDcEcvTlFlVktE?=
 =?utf-8?B?RXpZbWZ3czQxUXp3WmRKaXFqTUF4YWFvMm5JVUcyZnd2b2srYnBNc2FMb1JS?=
 =?utf-8?B?RlRNWjU4aXR0dld0SEhKOTJNYWRONXAwTDI5Y2plZmxFMDJ1T1JwbW5pT0Ew?=
 =?utf-8?B?Z05yYis3N2NXbHdLQVhRNFBwOE9RYWlZTU10R2hCQjZvdDdodW54VHVlT0E5?=
 =?utf-8?B?MzE2ajFXTGFnZDRoNTRuQW14MzdSK2NHcHN6WVQxaXBOend6Snl0WDNkQkV6?=
 =?utf-8?B?VkwyL1Fia21aMzFqTTdVMGhBcnVjNWZLMSswUjlhZlh1RWQ4WEpmZzh5VmFW?=
 =?utf-8?B?d084d3lPdkhWS0xOTXBWQVdFbzNxbUlhV2JxSW5PMmJ4ZGhudWttdnN6S1Rr?=
 =?utf-8?B?aVNmLzFRcUd1USsrb1c0MDRUd2RTcjUwQkgwaUErM2RaMzRNOU15a2FHVloy?=
 =?utf-8?B?QThsU21TSktYb1V1VW9EamszNEVFa284Mm00bEhNdWJ0TmhKQWhaNWk4NUZ1?=
 =?utf-8?B?MEhsUklHMmhHS1JqdU9JcTdiM0NSbkVvZVBmT2NaK1VScU5MZ0NxckhHRlN3?=
 =?utf-8?B?WUYwWUVvMlh5Y2hDL09IQlh6UXorQjlkL2tpdnRzU0FpZytqc2RqRUlKaVRY?=
 =?utf-8?B?SVIrM2ZhRCs3TldnRUVYbnFOd2V4MHlxdnNiL2VVNjlCb29MRGprQ2dtNE16?=
 =?utf-8?B?c3dnVWpDMEk4a0RHSitiK1g5cVhIZVRxZkFDN3d6cm92SEE5Vy9kV3JqcE0z?=
 =?utf-8?B?Z0NhMTdFZW45Q2J0M3o2T0R3L1JTTlVrMFNyUFNYMlRoRXI1QWF3bkQ1c3k1?=
 =?utf-8?B?NS9IdS9CbHhVY2pGQThhcEtQMlNHdnhMTlNpdmRMRC9hV1N5OVQvYUhzd1FS?=
 =?utf-8?Q?p+wKujwXnT08Lb3vyoAxJAV1a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d880586e-b7cf-492a-506d-08db9d8c2cda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 12:35:57.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56uDGwIsekVHuhLN7V5N6iajl8ulEMSmglLDYT/cAjVnMtysk0A9ZKFYD6MnXR7aXDMzdSCNL9KbsSllMHJDJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9916

The "cpuid_empty" label is also (in principle; maybe only for rubbish
input) reachable in the "cpuid_only" case. Hence the label needs to live
ahead of the check of the variable.

Fixes: 5b80cecb747b ("libxl: introduce MSR data in libxl_cpuid_policy")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -710,10 +710,11 @@ parse_cpuid:
                     libxl__strdup(NOGC, libxl__json_object_get_string(r));
         }
     }
+
+cpuid_empty:
     if (cpuid_only)
         return 0;
 
-cpuid_empty:
     co = libxl__json_map_get("msr", o, JSON_ARRAY);
     if (!libxl__json_object_is_array(co))
         return ERROR_FAIL;

