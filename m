Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6465082B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 08:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465853.724659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ArS-0007gu-A1; Mon, 19 Dec 2022 07:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465853.724659; Mon, 19 Dec 2022 07:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ArS-0007ek-78; Mon, 19 Dec 2022 07:46:58 +0000
Received: by outflank-mailman (input) for mailman id 465853;
 Mon, 19 Dec 2022 07:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ArR-0007ed-95
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 07:46:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2087.outbound.protection.outlook.com [40.107.6.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ed44731-7f71-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 08:46:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 07:46:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 07:46:51 +0000
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
X-Inumbo-ID: 4ed44731-7f71-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp5e0YFzIr9W7WSXMsCjxSlXLDa2icOvw0pscus+l9cr8pxDljRi1ATnUohVMle7Wu1fNOV5TeT0k3+OmsnkthwPaSGQGQYy3O6beEIMXn8M6PTQ8t56BWp2kEx4KE+lV4iy84pp/zjbHW7s291zm1LxWe4YZcMttcqGpTU62odm4SAxQ5nuThcYC6eykrs4GZp8d824IKSTVwYr5n+rhWDEpa52GDh0lxorfto8y6EyyVPKwWIgIFynkRL8cGXrTp5pmd4NkM1mloSLWbclRGzdrjlRdvLjMl9UTy+iXsFH3/7mLI09Buedayfzfe0lyrrLjNsFaQ2oTYKbozHDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z7TxHj/h86bO0ek8SqzZwC7tni++FSu6huM8H8Ul/s=;
 b=SU+j7eMHR4+MKHY67RcT7Y4jMcGiU4E4Ipridq7ImdAZmHNiXa403/G1j2JndBPXucbdNUTh022jMr9X6pF6b8baHZ9v2g1EpE0HYU/F8hO0ZHcr7dK9IQnWM0CZ1p7GaFYdpnynz/5YeAP8infOnqPti2wDDL+68hzrP2mIUJ5CILH6CDcgBkcYMyAQSi+kN/h+jcbV+LATj2l+uqCvZXQf9JhxcAruyYuVJS32Ec66wvbyKBNxK1lO/9ZH6n157JO2M9hQGDxJoc4v3ujr2GORCfjxrVyy2t1icu7YWqFEem6AJxFZSE9mBSTOY7mSfyfOiH+vUCFVcSpz6DVXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z7TxHj/h86bO0ek8SqzZwC7tni++FSu6huM8H8Ul/s=;
 b=lgMzmvWJpTSN5vEgrdOANI+fjx/WtEYoYLZjOh2XyTK1wUKs8Ijxdm0nmsA53IUK82iu/v2A4H1UAem6JX5O/b+3YxHKXX8golwGcxds4r4RqNtmKTgfcX077UwGuS9Z6BET7Bfpx2LHgG4uZisWh8zsrBka/A4x0Oa50fS/KQ82/Pz8ls1HzUYDtdD0TXSPrOxoVPN6OYLAPzxFRSWRCjJCxxlRn1DtJah6z20lRgLT587Qk9CKJvsNu9phjpEnLPvrGvP7PHtTpQKt1Oh+w3nQ87pLF7hLJRPDtVseljfCjxqYccShdCVT8BTETFTPE0zBIt08i5HJ0bDWTPTouQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc95bd61-f367-4a92-c5b2-6ed2dc867d46@suse.com>
Date: Mon, 19 Dec 2022 08:46:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Patch v1] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Neowutran <xen@neowutran.ovh>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
 <8a9fb9aa-59c9-f177-7712-21c8d64adc1e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8a9fb9aa-59c9-f177-7712-21c8d64adc1e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ae4e03-7d1b-43f2-1448-08dae1953127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w3MRhQiOkbH8OYTi0cuOY38PF6lXmVMOzi85bCD4LAJc1K1xRTVrFjvSKNq0ZMH+kSHsvtCYcYrZ5EghtIeVfhz0HTdypjdlwfFaa6ukocc001uFl3Z+ZjUX4IYKMxiuDvB4gSjg7SUj12KadHCQDdtUz125njgwQHpDcZvbXG48nt1KubAC9gESWtlIx/0GVV2C+1wSR0YMX6oIwiK7NFYJk8oDXbv+EdVf2Vf6We7Ksj4nwKO5vN+sIQi9Dv+DxDjf+6QBCB/n4FJ6NXEZfFIalA9MZsgGmSZq/8LPssHRnlUFMLCOz0wHS/wwTKRA4upRgJ/oUzzyZ9kU1qzCmGjWaXitcHIvNhE175TL5mHQ8BLjt5UJzEhs9PSs/wkGJV61i+5nH9MjkCrzNlgZ/NNDKvLMjrvRuI3lsHgKmykGf1W3JdQOqiIvZejqauySe940F5BY1mkzC4SL0sJTI7Xw3y2vh4Rpz+QtD/E5gPShyb3O4zX834CJwFhu8oPxDz7u2zsaefhwdXBM5Tub6+lh8kJSZXQlTwGszugrvrDC3yi67aObMs44XYHfMyjcwUA1XjXsoqkIiZU47uauV9J42Bhylg3mGhco1nL07r8/MSWupqO+cejVEJDpbKHQ/uj3jfCWq0Vn9y/Ds8kcceEosOljKayEvhsM2hgsvXQW7SSPbZDows7zNyLFgxGFtOlkzfupmxKKKfC1u+dovHeqOCL/b7kCxsYevswsYU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(41300700001)(4326008)(31686004)(8936002)(66476007)(8676002)(5660300002)(86362001)(54906003)(2906002)(31696002)(4744005)(66946007)(66556008)(316002)(110136005)(38100700002)(2616005)(186003)(26005)(6512007)(6506007)(36756003)(478600001)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGRTWUFuanRwdjBUWDUxQ3JKMEJLSEc5ajE2czcxYkZlZmoyYWFtL1BYMHlu?=
 =?utf-8?B?WkhKeEhObmczLzIyTmJDTW10YkJuUzhDNHZSQ0VIaHJOdVZGOEFCN2JXcHVx?=
 =?utf-8?B?KzVHU2ZMM3J5WW42KzhsdWdlV0NFWXYzbXFRRjMyNHFqell0UnlZNXQrUU9M?=
 =?utf-8?B?cytjSUIwL0hMbWlYeG5jeGk0N2ZLaENxcDdGbnVxeExjUjZOY0hjYXRHQXdB?=
 =?utf-8?B?QjhXL21SRzZiWVpiSEc2VEhlZWs1My9SMUVVditlTGY0MjZqZU83dmg2djFD?=
 =?utf-8?B?T2FreS9mYy90UndMaHR5c0NsdEx6OFRBNGl3VkZEQm9jSDdiaW13T1hmTmZ0?=
 =?utf-8?B?MlZQZ0xKNmU3ai9yQjhkK2tGdGRqdUE0RzBrWGoxTlRUUldWTGpvdVYraHJD?=
 =?utf-8?B?R2tYaG1LLy9IN3puWjJSMXVDdEpDaGthdjNPZXhxQjVZdVBEaGlSbjlZektq?=
 =?utf-8?B?WWljSlIrdGQxWUNoY1gxUTUwNU5qaytwQ0dFanV3K2Z6YmNmWlNTL2pYaEJy?=
 =?utf-8?B?YXU3NjltL1MySnpBR2ptSGZ3a0tZa09QdGxUeHh1Wk5VWmZoV3lzYWl2aFRh?=
 =?utf-8?B?WnUzY0Y1TkdLblZuMGM4MHN1RzVFVVBYOEx3dlhPK2FTWEtKZHhyTml5Y1Jh?=
 =?utf-8?B?VFQzSlZPM1dIQnNLZm9rWXd4QW8rU0VzVDFidEFkTjFKaFM0eUswOGppRlAw?=
 =?utf-8?B?SkFQcFJPOHpUSVZpdmVHdERRVlpXeU9aSXJiUW9MR3N3bmY3TGJTRjhzVlVj?=
 =?utf-8?B?TTJWaWxMbHlCdGZ5cmhlRkhUM1dyOGlBcEFodGkvaHBZR2E1akdJK2dHRXpY?=
 =?utf-8?B?dEtqZVFkZUhEbEJibHc0Tllud1lRd0txSTV1ZlZvcVc1elBsbk1nUWcyeTNR?=
 =?utf-8?B?OFhwUzVKekJCVmxqcTV4S3I2M0NpdE1LSVJqSnQ4RjdlWHg3dGRmSXluRVRn?=
 =?utf-8?B?UFZtWUxlWUMrdEVoQ25HNFpFZjhOVjVLMUpPaWZKS3I3WTR2OENNTnhNSFlV?=
 =?utf-8?B?aUVGbFRxcUwwT25nK0Y1UDlUZjMxSTE4dXpmd08xZ0t5aW5CaTNkejBRcFJt?=
 =?utf-8?B?clJUdHlXRW9VT0NWYjF0UUR5S2Y4M3F4T1hoa29Tb0IvYVVUVkYyeHNRSHEx?=
 =?utf-8?B?UlB5bHR2T0FKL2RWNTNzb0ZuUmlRa2xGN3QyMGVvSy94UmU0VGlOVWplbFh3?=
 =?utf-8?B?NUhUbkh1Q1lWd2xVSWFzQ2dHcHJkWnRxaHFSTDJBWm1WeFhabi9kdlJ0Z01L?=
 =?utf-8?B?d1dlNE00NWs1eGpMdmcyRzFPTG5MVVR0bGlYckhpeFQ3U3BoQjRISnFUY2VU?=
 =?utf-8?B?NXdUWnF0cXR5YkZieHgxVkNjSDFBS2JxcTN6MWFtbHFVQ2Z2dnZUcVp0S2Zp?=
 =?utf-8?B?VjNWQmxDWHozbGVwdjBzMng1M1RxTGRzeW1HK0k3dytDb1JFNmZDcXdxV0VN?=
 =?utf-8?B?eWRBaFJ6WG5ZdzVoS2t4KzR3WkdKMjFCM2dRWjNjckNpM0Q1SCtOdXpQL0JD?=
 =?utf-8?B?VXUwWFVsdktFZExmc0t1WHdUS2cvblBZQndTSi91aS9rNHl4UVJPcndkUnBY?=
 =?utf-8?B?UXpjNUNoS21CWndjL2V3bndpNThjMFRSK1M0azd4dVp3WDFJMUc2Wis5NFZZ?=
 =?utf-8?B?VmFUWkVEY3FEaldBUkNIMkZZdTVLa2x1Z0JjbFNGUjZHSDNVUkRIRUx2c3dw?=
 =?utf-8?B?K2VaTU5PYUprOGh4NFhYa0V5Tm9GamY1RzlSeklLWE1VTFp1NUNBY3FBajJJ?=
 =?utf-8?B?cms2ZVBSaU1wZVN0RmxXS1ZMNzR6WElUSldzWjAzSXo1alFzcENBN0t1NUl2?=
 =?utf-8?B?N1RBa0dsMDBFS2t3bFBabFZaNUhJQTBweTNwWTF0aW54THhUdldZUEZFcENT?=
 =?utf-8?B?U2dOaGtXclJyWS9tdmtrNkthS3ZqNFozZ0VGbHhVUVY4SWllWUpia2pvRWZ6?=
 =?utf-8?B?WXYvM1ZKZ1BXSFpESGgwN2EzYUNPMzFaVW9tRXNIQ0c2MVJWUUJPRWswUjhE?=
 =?utf-8?B?VXJJOXlteHZhK3RGRGc1bWdPdUw3Tm1ZMDAzdHc2cERodlRBbUVOdlRWMER2?=
 =?utf-8?B?Z2FuR2VLT29TeEZRTjc0QzlrTXNEQXVYUXBaTEN3citpQTlMVWd3ajh4eE9S?=
 =?utf-8?Q?K36SraWq5U8EMNr7ssU9hwbb3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ae4e03-7d1b-43f2-1448-08dae1953127
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 07:46:51.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDPYYV9izQE+2XFd8ZNx/nIupOvGpiEcl9fGT64xdBzinAYr+qPWKjlP/B7a33QnPZ52Q315Y1iY3JjiT56jMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9627

On 18.12.2022 01:18, Andrew Cooper wrote:
> On 17/12/2022 5:42 pm, Neowutran wrote:
>> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
>> index b01acd390d..7c77ec8902 100644
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -2585,7 +2585,7 @@ int tsc_set_info(struct domain *d,
>>      case TSC_MODE_ALWAYS_EMULATE:
>>          d->arch.vtsc_offset = get_s_time() - elapsed_nsec;
>>          d->arch.tsc_khz = gtsc_khz ?: cpu_khz;
>> -        set_time_scale(&d->arch.vtsc_to_ns, d->arch.tsc_khz * 1000);
>> +        set_time_scale(&d->arch.vtsc_to_ns, (u64)d->arch.tsc_khz * 1000);
> 
> Ah - I see you tracked down your bug in the end.  One minor thing, we
> prefer to use (uint64_t) rather than (u64).

And yet better we like cast-less code, e.g. in this case by simply using
1000UL.

Jan

