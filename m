Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8B75ED2F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568467.887796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqiI-0007BV-Nh; Mon, 24 Jul 2023 08:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568467.887796; Mon, 24 Jul 2023 08:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqiI-00078d-Ka; Mon, 24 Jul 2023 08:14:42 +0000
Received: by outflank-mailman (input) for mailman id 568467;
 Mon, 24 Jul 2023 08:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNqiH-00078W-6b
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:14:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216bfa2d-29fa-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:14:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:14:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 08:14:34 +0000
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
X-Inumbo-ID: 216bfa2d-29fa-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeVriaNBd6dBHlxhWtNPyzUrQSnx+IhRQNMbItS3Y+S2cu1OAocnXdTgW8lNJ3yPs/IluI2T8kFbmW81snQSQkfbm6SgkgVA3LuIT3MYbcqpOkLLtChWqks1a5agd9miEu2LDTq52UMFJL8pMS4/drezaO0K5sNBw+ue6XXkRgeJckHoa+nab+iVk020oYhD4rDpyiSjImVVaAGiYGgGCIZVmnJ8rW80l7TrvCmKt3sSfNcV+NLx0M1sxbFSReKUh/FzZ2ICxDLCUb5q3SEvyOPxa8MxOKh4bCttXoi125yyKpCUxbIXReIAdAdjkoN8R+M3dVRiGtvONSEafTURyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuQbyCz36jECV6NW3wW27Dl7yC8SZKX91NwYgwxCHlc=;
 b=ahJnjWSghrwOcovt65x4aNCechLA4ZqSSeuAcwv2xIL1l1OHE8rjo+OkjMPakxCkK5AXpO1YSgESx6vMF4xMFRcWwFODM9p86NUUwnjFgYOwiyNPxP0oN2afQ0pIiQYjBxC2mwNI4tsbgiBdZgqKwr7ZWa5FaH6nAeCaOCW5Vbp1+SEx1PbhHDGj/1TR4/LaTNnWwz6xq/H0FPfq8dDHfUbZn3abVJJNNXTJv8xftzp347jCBkMH2f/im1or4GckmEIucqlzMDiD04uTH+o0LWUb0uWiRUQ9a7kxT2O8tYUTsFD0tYMcDehJBF+b7UqNUKfIY2Pg49790/OL0Zai+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuQbyCz36jECV6NW3wW27Dl7yC8SZKX91NwYgwxCHlc=;
 b=wPOxZeC4dGq44rT0dW63flyQB+dnxM8SDt552B0I7nYncSNOmOaIrsJNLppn5+LcX8jjUG3HqztPMObesNnMbH+1P2PEa/veE4R1RdN+t5vgBHHTO93qfv6YVP6AhRA6Q5cw5RcCgjeWnL2bFhVAC+MR/mvPA08HfDFOfgT+V8b0LE8jolo21AqW9/w4ewAwim9jwCNsqR/x7crHUUM7mAv8Ud3xuQZ20RoafH+1fVpwsKp90kztVa2jQBnptMBCTIwBACLkADvjLfNnfHQYYry8DplPAWX2hr5r4EmT+3LMf3IiCZem02i5CzrRQnscsug6wKukgu8CReRel/xW6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f3b6c7c-f8a3-b904-1b23-baa9eb2455a1@suse.com>
Date: Mon, 24 Jul 2023 10:14:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <78255b6c5caaaa02dad638c7d4102ea793a09b88.1689953306.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <78255b6c5caaaa02dad638c7d4102ea793a09b88.1689953306.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e058c3-c79e-4dd9-9397-08db8c1e0405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VeVzyKGLwiq6Xgkg1nzB1WjMFSrnhMuPQ+efi6QDobFLD/vdFhySxh4SWJ3FgN9z8HQxs66n/hxBJ8ulwtAi3xkcBjk3jsJ/+qxBglqkcWuowzB68Wm0fD4CeCVxypxafdeWdZaxZuVBqcfv6rmIVGqu4r/3fbIMZUApopt47qaYPVJwNg3b4crhjLjOqrQN3a3xJsfA2pUU/7/fi2thztVKRKctWx91GL6ERQO6N2ZpCrkE6npQZ4A22ZllulHN0npI/Cq2rmPFf248Tmp+oRu5Vm4vPUpbbHvgtG/yOOW/BDzMpR0UT9qQQ6+FizMmjkSdbwqH8LWZuib97IwMA6UQxHmx0Bl8k3vqDE6o6RFh22IKZDQiL+ZLfwEGJscRqRDwPQeygIEvcbQsONXcb7NOhQwJA/kCqbSoufdxe8hd9ti7IOU0YvMLFWass+/o8wXEz6XhndBfnajsA40LoRJTZJ0TKskdB9BPgFoMZh5cPZx6hzeHcSL2LakETlWYeA7ht5qmsCUuI/qOiG4I1Uv8tBVQECJ+qxLwJOVXVM1Lwctcxh+gOqiMwvtI+MgSUVm//DCgyjV5rsKo0WPgT2BbV3P1CgdbxyqpUAXSDvP9vI/p8VGKqnxH/j9sOlmnAgc0Q0bBzVkz8gs3bRDjDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(26005)(186003)(41300700001)(478600001)(6506007)(53546011)(86362001)(31696002)(66556008)(66476007)(66946007)(36756003)(4326008)(316002)(110136005)(6512007)(54906003)(38100700002)(6486002)(5660300002)(4744005)(2906002)(7416002)(8676002)(8936002)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2F5ZUY3YklGZzBWSyttRnhTNVFTTTRwSU5DUlFubWtDS3FtaHFLeThGbXRR?=
 =?utf-8?B?KzNCWTVRdEJYWHdYNnhDdm5RNTRaRlk2ZUFTc3R5Y0hST3QwZld3VjVqYS9U?=
 =?utf-8?B?Nmd2UVozVHFURDlRd05qamVJUnBQOXMxdkdneFZTMVRZTWg5TjF2ak1pRzlD?=
 =?utf-8?B?TllNWE05RWtHa2V3QXFDbUFpWjd1ZDVYWFhudytGRDJCOWp1ek5vektXaFdR?=
 =?utf-8?B?TmlUOEs0QWlLREwyZytGK3BBaTNmRE84ck9CdXB3MWFoaGJuL3IxeDVmdThO?=
 =?utf-8?B?UUxRU2xGYmVPUHJoZHNMSzc4SW9YUkRFWHFENW0ySzMyWUJWV2RIMlU2VXBH?=
 =?utf-8?B?c2xZUVhETmx4R0pUam9KbEZXWTlVbkxQSHNudXl2bmtKOWVkUHdoWnZXVWcy?=
 =?utf-8?B?VXBJcmkwK0k3RTg1elp1RnB5S3ZxeG5qNVZjK0hCYVFRT2ZQRWh2SGpjZjlX?=
 =?utf-8?B?M3o5VFp3eEY3V2ZLYzAvbGRZVk0xajJjaGJrTzhOaSsrWDd4a3pxZHZpSjJa?=
 =?utf-8?B?LzMwM0ZBNFZ0eFJFbnp6UXV4VVdvZXp6Tmg1aG12K3VlS0dkeVE4UzMrU0xN?=
 =?utf-8?B?OS9kUEhoblNjM0lyU0ExSHc3VGcrU01SRjQraFIva2svd3JFSElsMXE0ZFlB?=
 =?utf-8?B?bG1OdXduMXJmUm1jcjJyNDZKRjlJcXFZMzNvMlM3bE9mTFhCeWJBWHFrbUVp?=
 =?utf-8?B?NU8xMlM2Nng0SFFYWWgrUExBcHJUSjZ3MXY2czJOZkg1cU1PbzloU29wSGZR?=
 =?utf-8?B?RnlYaDlLSnZaQlRoQ1RLcEpQWDBHQmd0YTFIQXVzb0JGZzV2NXRSazkzYUg2?=
 =?utf-8?B?bHVHNkVNZ2o3VWtjNkh1SXhTVWU2UGtySlFqa3A2SWphTG1wUmNTVUdPaHVw?=
 =?utf-8?B?OFA3MEw1TTN5OVcyTnpsUTI3bTF1Y2VCUExBREJNUFUvelYvTGR3SEpDQUtr?=
 =?utf-8?B?ZzBKcUYzNkE2TVZGTGFKaFRDa2YzVUxXSDlZTVlMUWRyQVlBTzhsNHYvQzNl?=
 =?utf-8?B?YUFranYvckttY1lFb0laUTNRcndVR29YdmEwKzU0R3BoZmU5MFF5TXlTNDR1?=
 =?utf-8?B?Mmt6cGxMaFNSY1JzbVEwVmxBdUZZQnJsZXJxakh3MWx0MjRLN3hiS1BVYzF0?=
 =?utf-8?B?TTh2QmxDSFZtUE15MGt4WWJnWjdrUkNMbXJYeWdEL1VFc1BvUGk3SUQ2MWJE?=
 =?utf-8?B?dHIzUGM3RWYzVWt6aXVmK2sxV3ZORWdMV3ZNSnRYVHpFdm9xLzBCbjhsTytC?=
 =?utf-8?B?MzNpSW9QaWZOWlYxdVNMNDdNRUF5WWJjTGtpRC9HcFI1Y2VMbG1TWXpib3Vj?=
 =?utf-8?B?WjRsb1NFMmNsYzlOYytlNzg4NzZSL01JUzJnYWtxQVJSKzJFTmxMeUFNcjJC?=
 =?utf-8?B?cTZVdTBDT0xEdnVUeUF5WDlwL1JsVVE1TDJVcUxidmJKekdjc0RLZndFUHFv?=
 =?utf-8?B?ZUxoRHNXV056QmlQVVBTeXN2N3Bma0UwMmNQdjF5OGpOWXZxNDJvaEdXb0hi?=
 =?utf-8?B?ajRPVzVISUF5K29RNVdTajJLRmRRN2dMN0NmNys0VjFLSm1PaE5Wbm1DT2Nn?=
 =?utf-8?B?Sk9USkhLVTRHOGRCY2xSelhueStpaXVIYmhHZjlWWVRTL2kzZ3BaRGtNOHZU?=
 =?utf-8?B?WDNUdlhEYVF1cWU3MUY0QnkrRkhqTzYwNEY5K2lVMFhVSmJQbGdjanpKZ1Bo?=
 =?utf-8?B?VXUwZ0lHVGtpWG1oNlg3Q3R0MFhlTUhlVHY0Smt6SjdzVGx6REwzOW9zSWNy?=
 =?utf-8?B?RHF6MmdKS0dzdEhFTnpKdjI1aGdXMTdlNEZnUTV3WjAza0NrUHE2THN5bVRC?=
 =?utf-8?B?cGVmYzQrQXhHdlJYZHpTM2tZRDZEMFVLa2RlWGxkWmJYTG1qVXdFM1ZMcHJY?=
 =?utf-8?B?NFg2LzQ1M0wraUgxSnF0Z3d2ZUQrbUx1Q3U3MVk0ZTJFZmhxbHVkZEFPc2xy?=
 =?utf-8?B?eWJGeUwyRUhXcFk1WEMwWC9zSHM0WU5UZjE3cFBWdHg4b2Q5VGFHMTBtRlJD?=
 =?utf-8?B?amdmYS85ZnVvVFlTdHRVaXhDcUdlcDYrRVFZTXU2Y0FMYVZxZ0QrczhURjZW?=
 =?utf-8?B?aGFtYWl1OHZxemoweVpZMVhURC9wU0k1b0cxL3d1VFF3V3ZuTm9vallIbEtr?=
 =?utf-8?Q?0TSTHuDa5151smZAhYeqGckrT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e058c3-c79e-4dd9-9397-08db8c1e0405
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:14:34.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWY9+4mJ421T18CCGurZPtrJ0FFQmwkSbg88TLmHMUgZ9Il4cmDnGuj0TwNAu6hH0oGdXnFzvWlfuX6HOdVTZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

On 21.07.2023 17:29, Nicola Vetrini wrote:
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -78,7 +78,7 @@ static int __init cf_check lockdebug_init(void)
>  }
>  presmp_initcall(lockdebug_init);
>  
> -void check_lock(union lock_debug *debug, bool try)
> +void check_lock(union lock_debug *dbg, bool try)

I consider it reasonably likely that something named "dbg" might also
appear, when we already have something with as generic a named as
"debug". How about naming these parameters "ld", "ldbg", "lkdbg", or
yet something along these lines, but (at least slightly) less generic?

Another alternative would be to rename debug() to entry_DB(), along
the lines of entry_CP(). Andrew, didn't you once propose renaming all
the exception entry points like this?

Jan

