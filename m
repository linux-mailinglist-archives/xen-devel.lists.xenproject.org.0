Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9078BE8A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591955.924550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasKb-0006Cv-Cz; Tue, 29 Aug 2023 06:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591955.924550; Tue, 29 Aug 2023 06:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasKb-0006Am-8N; Tue, 29 Aug 2023 06:36:05 +0000
Received: by outflank-mailman (input) for mailman id 591955;
 Tue, 29 Aug 2023 06:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasKZ-0006Ag-L9
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:36:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a06b09-4636-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 08:36:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 06:36:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:36:01 +0000
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
X-Inumbo-ID: 52a06b09-4636-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX4YFRZJo23K4kkwwoKYH4j1X2f6AxuTgw9/O4SCK/SFh1UnFnjKbvm8JjR1HegOB4hZSbonXLE70ZpyD1Lj0bYTKA5+j4nA+cezqkrW438A8ksE9G+CNMLF5ADhlWXgkRqqmiV7Nqi2DxOXBa4t7DeXoWIl6mCGjWjQoSjSeLQgKd+861G84lk3g9zxBh8a8UfxO897ESD7+1ow9aDiM17jL2AZu1NfagLvGmOcWUn65wRM3z/o1gc0nGtY/3AOW/lpGv2XnzJwxZVTzmraBtPmbr3BX+a4H1SGJV4mBdubU2pmp7EVTEKziPJbLbWXgbC9rEj+mGNBTO44v9J8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwy0CeFFkK58EQXVD1mrifDsiarmvJe0e6qsjXFu358=;
 b=V7RxHJ0xYDf5N3adGM0S0mcEln0s/ovWNto2/m/8XSt5JPke8PpmCBZxa7uqNXwr1iH/lNbvkjDH+qc4l57AZcqAh5otKR4HZdkWBJUCSz0CsYRzzN7aqq0BwhskmHfm59leiD3V03oecyGK8if1NY+FMfRxjqBcQIiUqHiH7lna4HWiA/aGhf0FqAu2rFWCxfZ+OT9byC9GuDAfD7WNfOEorJLQvGX7vp4W5aJYRaF+bKyu0xPg6SHEmE6H0522xyYvle7/Wv4XdgwM9gB+uUJXgW6pnwv7LdlvcuWX6dSBILrk/x9gjp5V4K4ME2WysjCszZe6cOeWOa9E+mCXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwy0CeFFkK58EQXVD1mrifDsiarmvJe0e6qsjXFu358=;
 b=ro35msB8nXx02x+3MkeGjzWyjXgYJnYtvMqQwp/duCSNk80ZTRkFIloOVrvW2AQHVThYoeZkDhZ0EzDTLq1FobDxP73yCLb+S7ze06dVZ1tKG3vO3XsZeXdZ+wTFlKkd0heHIvF7ei0CGteJsE1+5uWQS5IJ78K2r1jfqDYXetI+MiQZj2phPNjfNs/nmUhBcsjnKgCiSMrb0WqbNt8nMC2MPok5KBwXb+5JpSQBNjguHzyGfn2elY1+vmr8tUQgIdmMNhpUkQRay1RSjTMvSk3dTlurt8o4Nt43kxLwqiMeM78IwI8lFO3wy6gz3SiPzqtOiX6ViuRLqOo71L9jpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6393217c-7583-71b5-5c90-0097091ef217@suse.com>
Date: Tue, 29 Aug 2023 08:35:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 02/13] automation/eclair: add text-based deviation for
 empty headers
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>, sstabellini@kernel.org
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <96e9ca524ed8191bfd5ee1230e8d581c50e299f5.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <96e9ca524ed8191bfd5ee1230e8d581c50e299f5.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: f689da28-a12f-4920-d57a-08dba85a35e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/XfO3VKlPxkiw8/gjccjTlh6i+tzy/KA9DxqYqEcrc8d+h9fAA/BnIRkSMjiMK8mTEpuMFqWOjDLjFJx7DmoUy7fQrnu4M9doaZU4pJsC+Z2eah119g0phgiE1Udku9Uq/2N3h+e9PtF9LQ17D86EOdNrfz+vQZTC7lboQlCXBh5kgPD9LlL7c3cT8jkIUuhy+YFyElsVcuqj/mp4tZeT1oYa0Qf1lLKLSAIpTLMSyokVU342sjadzzuSEiiArW2epNr4qtN8Ca2EjV+BO/OVWBQJkqrjAuMOPXNPANSEhUyw/CxYyRLo10W2eRjZoQk27hr7dSX6tAQtVwu4ThYD01O2x0iKA1/4GntuOlgKidSufQiFoqjHDXUgmlx9ccCV6ctHhKnqVN6em5u4KpzS+043w+aNeGy7RKzu4mfoq/RbVXqGid82NsJuy57r07NNooqs/jwDH4kJBth0euCkTGpMuoRsagQn9vQtFSx9V0lXD1HCkb874fDA4z/WYKGm1cURINymNM0Bzeq6NSHpxQqnk80enWVOMrJNL2TzyY6qhSlT7s6/mCE+/88/NLTBeXC6ySI8YOkr/9Wl6/fOhrVuWz7cKY5eE60C43GJ9xWygeTddxNgSdXV7HbFoR4DBpGhqzMa25CDHHZ8NVRtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(31686004)(6512007)(6506007)(6486002)(6666004)(36756003)(86362001)(38100700002)(31696002)(478600001)(83380400001)(2906002)(26005)(53546011)(41300700001)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(5660300002)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU1zSzhReWVqTmJXRUkrY0Vacm9zUllHcXNmK25FZW0rZ04xek5NOCsyYUZo?=
 =?utf-8?B?Sk5nYXRMT2JyYk9TWUgzZm5ZMTBVRG8xSFZBWWhjdGtEdWRtS0JXYlFJSksv?=
 =?utf-8?B?d2RNdUdtMmFEV2VKakJqWU1GNjVSSldJM2pjQ2NBVFYydGJ1Z1ZNVHp3QlVG?=
 =?utf-8?B?dzg5WEdHN05icjBwVzBIN1psSklHYmlxallPNEMrd2NxYVZuS2tNN0l4Vmc0?=
 =?utf-8?B?aVE4eG1QRG1scEx3R0xxNVZYOUVzenc0dmlxZ3pvWDhyQ1NtKzhXRHV3ZGFL?=
 =?utf-8?B?Z1ZIOFVqK0FXcWJrMlBNVHNhc1BBU1dIQjlYUURibzhLSTNzZEFqcjZuZkpi?=
 =?utf-8?B?VTNTQlRzTkx0SlFobnVJTG1rYjljUW8rWGF4WXdPOHQ1eVQ2dHd5QmgzcEVl?=
 =?utf-8?B?USs5N3h4Mzg5K09acTlvQkhONEIvbkUxczJjM1lWRWxiTzQ4Z3hpZTVVR29G?=
 =?utf-8?B?bUVFMlNvaXdKSk0wdkg4M2VYQ3pwWTFnSFJNRjRIUWFTSGxDMkJnQWxKeTZm?=
 =?utf-8?B?S0JZTGZkODM5UGhJQUpYcDJOZnY0NEFtdzFYTC9lMUFnQTdVRmJkc0N2QVJJ?=
 =?utf-8?B?bVpFeEgveXFGbytPUUhFUjEya1lwQlBjV21lUVVzQTR5NU5iZjNjZ2Q5eFlj?=
 =?utf-8?B?ZEVhRmNpM2svRUpCQU0xUjBacGFVK1RBdHRUcFI3S09kNWhLQ0M5Z0QzQlhy?=
 =?utf-8?B?MVZCbDYvblRVUzFrb0YrTXhPelJDK2d4N2xaL0t5enpDbFg2L0l4R2tkL0RQ?=
 =?utf-8?B?MEd1aDNzczEzV3kvdC9VSk9zeEdLNmI1R0R5RVFDb2FLaUV3Sk9mbFc3bk9K?=
 =?utf-8?B?REY3a1hRd1N5M1RBbWIrT1BQQ2VtSTZtV3ZzU2F1cWFaS0xLSjZORkIwc0ps?=
 =?utf-8?B?K0J0ZU9OZStFSldYN016cXpYV3VTN09RcUpUSnlrbzNDQjJaUlp2bEJKWW15?=
 =?utf-8?B?VnhHS0xLeHA0Slk2U3l2TlRFK1d0SkJsTXBaV3hBU1lGS2JMTGVUa3hMTDFZ?=
 =?utf-8?B?WlpFWFFKOXlTZS9nUlB0eVl0ZlRLTXI4c0xGdmhNWHk2UDJmNkJBM1BaK2FJ?=
 =?utf-8?B?cWpQU2xwUVM0OWFqR2xhUDdjNHFuSU4rY04xcmZTMTVCRDVPQWxqdHNPQUtk?=
 =?utf-8?B?YVlJU2w5Tk1teGR2MlROQnNBb2dOZ1JwNm4yVGxiZkdzWUcyZktHNVdsYkl5?=
 =?utf-8?B?VkpVSnNhVnJ4MVA3eEQwM3NzK2FrZnZlSWM4RG03dEFmZzViSHhRd2l6MVVW?=
 =?utf-8?B?RGc2L0hxNzRiQllQejFMZHBVVGkyOFFtcm5wckNaUEE3K1lNdXZpSUN6bGdo?=
 =?utf-8?B?Mzc0c0NrSU9tb0Q2b21zWlJ6STlFNXMrYUswaTBseFdlR0YxeExKRENOTFky?=
 =?utf-8?B?bGxFVEp5WjRUNW16UWhpblQxZWhJZGhnRXRyODdta2JlRWgvNmloTHREajI1?=
 =?utf-8?B?bzZUVXZzNENiUVYrVmVJUzN1Qk9aZlpsU3M0YnlscCsydHRXN2JPZ0daY0Jk?=
 =?utf-8?B?NFdqejE4NmFYZGJLUlJ4SmlxUC9DK0QrcUprWnc1dW1WTFRjT1JWVHBLaDFM?=
 =?utf-8?B?WHpuOThOaCtZaTZRb0Rwb280enV2cmF3aUNZRDBsNmd1TW5iQXAybkpDTmZz?=
 =?utf-8?B?WHFzQzRBelVVNStHN1Y5ZkdWU05uZ3hLWW9XUWdrZkdMNlJ0UWp5YkdTK1ND?=
 =?utf-8?B?d3EyMTA4U3VleThwVytha1kyYTJWQ2JoOXV2b205dEdSOEdwQ2pXRFNvMXA4?=
 =?utf-8?B?OXRhejJHRWlTc21wbG9RcnZvVVBnS0hIc0ErdDNWVnBqaEFMNkhXZm93aDBB?=
 =?utf-8?B?cGNJQUVWSHE0WktDc0RhOWpaSUpwUlBuRldEOE15cEpZcHNrZSswTk16dDdj?=
 =?utf-8?B?bjVaK2luTm9LMFdPeG5pTWZ1SUVldzBJNERIWVFDeEFSL3pJZmM0WDlFMlBo?=
 =?utf-8?B?dC92QVlOSzdRd3U4RitZYTJzakxVbytQQU9MK3dmNWZyTU5FeEM3cFZ2RHJ6?=
 =?utf-8?B?elh1b29xMmVYYUF2dDE1eGRkZlFqcWZYZjV1d0I3a2NHTWtzNXowRmVpMkd1?=
 =?utf-8?B?c3JsUWZLQndoVUI2Ti8rZjR0TU9qbmcxdkcrT1ZjTzc0ZDl1ZkllUSs4V3o1?=
 =?utf-8?Q?0FQ31v7eD2huSwIjr3/O13dfI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f689da28-a12f-4920-d57a-08dba85a35e6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:36:00.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6YtWsBp/ymbuUW9UYS6v6ik5RKbr32CaRGImW4tWhTQjETOVcN/idyQnYgXAXCCpvUcHzZQjYlxXkHa1Klu+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

On 28.08.2023 15:19, Simone Ballarin wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -80,6 +80,7 @@ inline functions."
>  
>  -doc_begin="This header file is autogenerated or empty, therefore it poses no
>  risk if included more than once."

While unrelated to, the change at hand, I still have a question on this:
How come it is deemed universally safe to multi-include generated headers.
I would have said that whether that's safe depends on the nature of the
generated code in the header. Only truly empty ones are uniformly safe to
include any number of times.

Jan

> +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* empty \\*/$, begin-1))"}
>  -file_tag+={empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
>  -file_tag+={autogen_headers, "^xen/include/xen/compile\\.h$||^xen/include/generated/autoconf.h$||^xen/include/xen/hypercall-defs.h$"}
>  -config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(file(empty_header||autogen_headers)))"}


