Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D919662749
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473626.734326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsLp-0005QH-TM; Mon, 09 Jan 2023 13:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473626.734326; Mon, 09 Jan 2023 13:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsLp-0005NS-QH; Mon, 09 Jan 2023 13:38:09 +0000
Received: by outflank-mailman (input) for mailman id 473626;
 Mon, 09 Jan 2023 13:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsLo-0005N6-7R
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:38:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a57d8d-9022-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 14:38:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 9 Jan
 2023 13:38:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:38:03 +0000
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
X-Inumbo-ID: d8a57d8d-9022-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azxAq4dpjPYPh1WxjdhC7LKnUkyoq4ctCCAc+zjR7bW40oWrXYmf5E1HwhTO3ccX1Z3rsBlULiqxf3qwt7ESus8XeZ98Qk6Z+bLeU7eEypi1OcULV+HLY2bvCDFnnaKyVB3yrUWGUmoYIgIPbOlXlB2chMYK0sm/GnElQYLVoIPLllyHg4c1N+bjbio3qY4iZOsdvTIfaq2yPz7hfEXHShd+6h4+/iyHB/id7cy5oHbIIrbBUUz4b/7O3+owYLFfKNMTi6WieY0bdz2CwWroMr/h9PMphrDWKglSm68+c3dX426AY/z8jYxW6Wub88y2Hz7PRLT3QhTyfJfb7/gTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9o4UrkbsEgoHelMxnH7a7O4Qq+EJzc3EuuaLl0O0G8=;
 b=hbI3qgqYIgFE5oDcly9xKHvsCs6hqFql/pR+KeFg3VFAzbEGC9hOLXb8QTjcrnoIzsS7raa8XWH52iNps51dtzz4ThdYjUjU1iryYKvsKBnVeug4FWvmOfWUXEpkKpKpXq6lxoMNcJFdXvtMoR1BoRAl8yRcW9ltWFXXSEFiyOiZgVB7LKHzrn7GW8M6wppTan/JV7AvBqhjgEwD3ynmrpmbSfUJu0P1OULhfRPhS4PyOP5AX9lW8l818FWLEmhTGysZZWWvkORayr/3o7lrahLQkTwg2Uk4k1HiX70V56GmWQQoNwXqojnih97Uru/nAoQWZzGyxvzpet5UEyLOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9o4UrkbsEgoHelMxnH7a7O4Qq+EJzc3EuuaLl0O0G8=;
 b=VuHszqQ3az6uUEek1rWCetPlt5PxfgGPvqgHDPXimnD/GJqigyBgdaQldBhP8mXv8E6pLcMjPsn/kYBNLUkKAHBO9nCk/6Q1Jr9VLvcV338BqFCu4wk4wktfGUCFvXHTASL5yg3XpsymvJLSTn4qxSoH2TFBsFrtKjcPOyOgagXjW9uSPj/YlWIDz30IT+LaZx0llbxymV7H44u6e+cGs5jfkiBwKIKmB9TfWlEhCWCrDFGFr0e3U/AV7jsvMZ3xT6e3VN/NSqG2AU+4JOsSPCkNOVLeYqdRsBo91CM8sizXz5ONb+7Aj248tvhcAIvA+Yq4QJTOCEijIUjDHQoW4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
Date: Mon, 9 Jan 2023 14:38:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] x86/mm: address aspects noticed during XSA-410 work
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ddda3e-760b-4912-83ed-08daf246bb90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/shlvZKMYuhF+/bbG2r5tfckaNFP/46uupUT0U0bcTY0zf22j+5L7+PXFKmy+kHZgrCMxbpepl+YeR+h8RPvL6YnY9LFgWR/KZ0Uc6dsz0VsG4iF7ny0NUkUziIFnPifCRyu3ZQo4o+6sEhYgLi/JUOFrbYZ143BiYuZ9G6svmZv14I4Itf1QlShNZpohUQmbt9AMoU+vTyqSeg0NBv1lFOnTC+UD419rL87/c4g4BMv/bayCShcL85ZPEyz3giu1lC0lAxmp4e+r5qHTJduTYswbOePS7WI6qWrRxgU91GBEw5OahSuxQyDZZMrxNnxYzaOT4f1U4Ng9Ae5jD6+IRsyXl3IC2zKZFPeu5Pd82/h3A1T143XRIYUD9vDpnxAS9Fi75GwS72pheDBZ7X0XjONg2stDS9+ewPifShkZns5Nc5iHZbaShTH1HNxwYlJXEb9gWsW0AI+9LXwT1n1bMAASgUkkghxGP94cUsKkbPLP6uL+z4oGheDhHchUf3R0yRSr0eqQxZrldzQhE0vjJTlkyUDwgdGcZt8VmWDpaskrADjsp4I1Invuf9DOp6jki3hg9y8SFe2Jpynknu5zWLPOxF1zP2GvUovHF8eAeqnXFMW43jEgHub1Lxi9gwW3UfSpBoz4Z5orTNGRib0BYrrEgElvdOb/Gllfi5GgUErSpehW3T1Qe4BBnqKrn0CnF4eL96ttCEQvXWNQZHLGJp3FMn9CjM150iZTFuwOHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(396003)(136003)(366004)(346002)(376002)(451199015)(83380400001)(86362001)(31696002)(38100700002)(5660300002)(41300700001)(4744005)(15650500001)(2616005)(8676002)(478600001)(6512007)(6506007)(316002)(4326008)(66476007)(186003)(26005)(66946007)(6486002)(6916009)(2906002)(66556008)(54906003)(31686004)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTAvMEJvdTlGTEVIdW9WSkk0MTZScmQySk9XTFVxWXNOekJUNytYL3A3OWZk?=
 =?utf-8?B?L3B5NmZaeWJnV2p6aHRNZTlpZ0ZCT3ZyWHFXNHZURHFRMEV2bnB2L0RZVm0y?=
 =?utf-8?B?Vnh2WXNoOGE3RlRpSjloejdBeUNJTWg5Ly9YWXpybW90QmJ6QmgwaXEzUG41?=
 =?utf-8?B?dU42K3JvNEZxdGE0bWJIc1NPZXNaQWpGaldEaGtIZXMyVzRXQXhUdUxIOFhQ?=
 =?utf-8?B?TWM1dGw1SWJlTm9lVzBraDgxU2pBYmVGWE5EcXNxU0NYdzdRcFgrK0FkVFpD?=
 =?utf-8?B?YjBrOWMrWjJ4am5NUWhLY1BQYmVVT09ISlIwK01CKzkyazQvNVlhcElFek9j?=
 =?utf-8?B?MzN0amhIVjFtVC8weit0R2dVT3BpN2N3THZrOVUyb1JDYUQ4TVRwWStNL3dt?=
 =?utf-8?B?WlZCMHc2MUJVcTV3UDVmZ3U1dUpCSy9ZQkZrQVducGJmMy9hTGpYdFZGUGVh?=
 =?utf-8?B?VmFkTHlUYUR5UDhpN3JLUy9NaWZ5bUdvYmxFK1RzOExvR3ZKQXZTcm9haVdp?=
 =?utf-8?B?VUQ2VkJ2eWRYZGxoV255Ti9sMTZsOVpFb2IrbE5ITVZvVDBibUpRblhWN0Nq?=
 =?utf-8?B?LzB3aHhjMUp3TEQ4MzdiR21IL3ExcEEzcExYT09wYm5BQ2REbis1eGk4YUln?=
 =?utf-8?B?aXJlVTRERXYyS1lpcWVndlpvQzhUa241SXREYnRzQzRuRzI4QTRlRldRVWd1?=
 =?utf-8?B?TGRJWEJZeWlPbUhVdE9VaW1xVDhNL3RSNGt1ZVQvaSs4K09vWmtiK1krVk1k?=
 =?utf-8?B?WDk3Vldqam5zNXZuSFpOekJub21SMVJqZFR4MFVzRXhBVWdzVmp1aU9mMWMr?=
 =?utf-8?B?VFpYM3JISnZJRkxUeFcxem02WWt6V1FjZFEydi96UHZLRm5vcktPSHlUNEw5?=
 =?utf-8?B?WHI4QkwwNW4zdFRpOU1FY3dsS1h6OW1sTWtJWTZaTS84VEpzejdCY2pjeGNE?=
 =?utf-8?B?cTJ0bjdROVRrWk9RR1JNV0dVMlAzbmErOFNBL2hxbFZxT0NQOGxVV2c1QTFB?=
 =?utf-8?B?ZnFqODAxY0NXc3l4NngxTzJRaFRRcjQ4azArRGNoYlZlYzQrbzRPc3pwcFV4?=
 =?utf-8?B?Z0tRVnYvdm0xOEs1d245RXlxL2o1N0JFa1hxZVBjeVNpOHd6Zll2YTY3M2xE?=
 =?utf-8?B?bmdsRXcySlZTenBvRnFURU83Z3FUUnlVL3EzSVRGN29hdEczWjUweGIyMWRZ?=
 =?utf-8?B?cHZ1ZTAvTVdYOWh5L0RxUG05b2hOSFhpNzFtUEM5N0VOUmNjaC9aWko1Y2V6?=
 =?utf-8?B?bkdSUFhweWVqeDExRkg4OTdHQkI2UW9adWljYisxclFxNktGczF4cCtvd2tp?=
 =?utf-8?B?LzVBWmQzNWNycnJaZ2FiNFZ1WTltYW9LRkc5Y0kxQlJVZ1NvZkJEVzV2VDMr?=
 =?utf-8?B?emF5UjR5R1R1NkNyOFZORVNqNkF0WStZa2RNUHZYNFBaayszclV4Qk9yaHRh?=
 =?utf-8?B?Rm9TM2lPVjNxTmNWVjZ4aEV4Y0dDNVlTN1Y0Q3kwNlE3MHlVT2hhM2ErNXIv?=
 =?utf-8?B?azBXL0Z0aDRQVzYwNFdpV1FicUo0NzBCWDBMVU9qbEt4YzhKeDNNZlRoR1pS?=
 =?utf-8?B?anJNcjNMZmtvUkd5MXFwdWJaZnIyME9DK0NnbXY4ajk4RTVHWFEyZ0M3ZXAy?=
 =?utf-8?B?YlBlWlFuUktLT0p6REZBc0Z2dXBzcnpPZ1BsREFOZUJIZ0kzWFZ1clFrS3li?=
 =?utf-8?B?WldvQUtFNUVrZ0cvZmZlcFJGUnpKK1NUUXh5RzVZV2N6UVBUQThKY0FqczZm?=
 =?utf-8?B?bElUaElKdTBzazhIWlRWUVJ5aUpJaDBOZENTM3lFYjdTQzYvQzIySTliTXdw?=
 =?utf-8?B?a25wWjNmRUpkOVdVU1NWR2RoS08yU2tHcUxuMzY1K3R4c05KeFFNc0U0Ri8z?=
 =?utf-8?B?YnJsL05pVnNwUGhmQzFWaDlwSDJiWEU0Y0JzbnpYUW1FMkYzdWU0bDl6YndG?=
 =?utf-8?B?eGxiSWRYOWpmbm9RRUNlWjhiOVRQb3dST2gzR1ZHK1dYcFM1OTVxb09pNS94?=
 =?utf-8?B?QlRDS2VIRDlhMUp3dlhaaityTXRWaCtSU09LdmpMOEZjaWo1SVdoMW5YbTlZ?=
 =?utf-8?B?enpZOVU5RGVKMm1aK2VxbUM5b1M3cjFFSkZhVE5RYUxTdFk0YnNUVzZxbTFq?=
 =?utf-8?Q?9tz4zZK7+pANlFCfOZ52u5Bvj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ddda3e-760b-4912-83ed-08daf246bb90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:38:03.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1ContN+gIzUX6HF0u/AJh0mz1t1CLlwQY8HNvZhlQ8GMqm4H2mL7ZEXSWCX0iTOcxXxF53/kNAXGu6MOlEZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936

Various tidying changes accumulated during that effort. They're all
functionally independent afaict, but there may be contextual
interactions between some of them.

v2 addresses review comments, which however goes as far as introducing
a new patch (2).

1: paging: fold most HAP and shadow final teardown
2: paging: drop set-allocation from final-teardown
3: paging: move update_paging_modes() hook
4: paging: move and conditionalize flush_tlb() hook
5: shadow: drop zero initialization from shadow_domain_init()

Jan

