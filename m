Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FB69A61E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 08:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496891.767828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSvBB-00012e-Ps; Fri, 17 Feb 2023 07:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496891.767828; Fri, 17 Feb 2023 07:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSvBB-0000zy-N2; Fri, 17 Feb 2023 07:29:13 +0000
Received: by outflank-mailman (input) for mailman id 496891;
 Fri, 17 Feb 2023 07:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSvBA-0000zs-KF
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 07:29:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a4717d-ae94-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 08:29:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8780.eurprd04.prod.outlook.com (2603:10a6:20b:40b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 07:29:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 07:29:09 +0000
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
X-Inumbo-ID: c5a4717d-ae94-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAVIGJmDJCIyGngK+KAS+UZCyciUdSwk28TqPJfRaagE5gvVoasmxLDJoD6dG0tYZDZqSUeH7wAtSI7fdR5pGqjmmlYCqHenrTBg3hoAGYf7WuGGh/CFhepIwChPvR91U9ej0ZOwrT6DD6WDyWolrhPpuzSO3sY+xEea3dSUH5Co9fI4h6U0abBvNhZ4EdAuaalSVDvltoBmZE/hH8LnDA1396FwxW+CBzlKl1Xy7Qh69/JtJN3Wc0GndOWqbcbj67Rac+aqTgxHFZOTYbyh3kgtq1eA3XQtGxnzVyCHl7SMJ5jK3vaOVQIKMAVa0LQ2pQ0A/NZP400VPk+pduF22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBqs4R9eKENvrHqWiCYRWjtxO1AdlHPNBVD2Vuf3rUg=;
 b=S4X3s/xm/guLlsQRPY1tjaVnfQcS9ILVhx3ilx7jBA147V0GDEO29wSPFIccu/W9lsInqhCWdJfnFrUXUQvozLQG7O5NNSkJzuJhZ2HrbNL2wMpa7m45Ng3ViYE690QYm9DqLEtyc+I916rYRJYccvL5iVLYhXf0e+eWfssbPR9HYIYV5bQKyLweMB9frDLOnsVaHN1J7kFijZw+TtlzOpXQcci3dgBVtBr/LAC7Ge/NN+Uv+Nf3pteoI7DAe9tozPQ5Oa1XhUrSBlWHND3fo1zIpQDuSIAfN2Md6t2MUrFKja+KJow6vdOZ0HFlNSSvL1v9+2zWkFa/7vuOSuTK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBqs4R9eKENvrHqWiCYRWjtxO1AdlHPNBVD2Vuf3rUg=;
 b=vSKzDwVE10LNcC635YGzCzEaS/70VYbxSI9Bwfyf8KSV+pHoOkzhbFvbNr39o3Ff8DvPY6t6FFFudwY1PyMxzJezcUixbvyfx3tsF56P8ckvqNNO64zYBC6D7Y16CAkWw9L0f9LQ453K7ewW0N2LAlh4CBE+yb69pkJ8WN9A+maj4QrEBIkgPwRsOkRRVZMgGZXSl6UvJVEX7u8IPVk/wi8pKlUHNp2Zu/ErXB17rtgcR3jFcvtvekntpeQ1YCv43W2U65iRzKnKYsuSnoKGC5zdFeQeKWD4VxpZpC7Rmrs055UMxo9kP7RfqngCtwCYqkcpSyg2QCAgRDzp6tIZOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ab0e5bb-f974-50f3-63dc-7c7a83df5425@suse.com>
Date: Fri, 17 Feb 2023 08:29:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] xen: Remove the use of K&R functions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230216224438.705395-1-andrew.cooper3@citrix.com>
 <a3e55b64-8393-c236-44d1-0db050ddec4a@citrix.com>
 <65cd4fae-f6ad-1a2b-043f-665cb3903576@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65cd4fae-f6ad-1a2b-043f-665cb3903576@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb734db-724c-42ee-1c50-08db10b8a883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vx2szvvpl0FYWBABKYbOAEKzU0YahAuz9HXByf5zVAypuwsupLp1Pv5bS6beG+MtigQmVYeDz1zW9AWcO8iXuPQn/k4mb1w5L1NsAufymEPnwfsa5xLU748gUps0BoK71I9XjcetuTNfU7onh1ixoraXjVZ2vPsYp+DJ0okeBnF9kQXze6r5tEw5Jsq2ml27Lm10bIkYFYSQ2zRR/TdLNkcj2bAIdMdxCJSdvy3t3BfCEADPmC4LZNETuXmCZJoViJ3Wi8/wJvf/JVA0940uTlTekkyjr2Xsw3j9p73NDZR5qOEhBKeek6SwiQBu5l+W3ayKzntxcb5Ku2NaxmSxHPd2OlbrHqqhtcdoQhwPKAI5hV/w0sjhI0nsHt/obv1T7ER7oxZiuXiepo44Aj0q+p4suqa3oRBigODjVqvc1N8Cy1hQC7TQqF5qGUVgGTejytQFzoCuGUI1Lpu+TstfI3ncat3AyUt5+8qKLt+kYiqTderc1gaDtwLz/TAmuBOsuja63VGtgNQWk7SFM9ZLMldNEgdugZIFejpKZ01cyOF39/kjSfkqV3Rb3bWVLwLxqAy8yWJYgsP5Pyl2juMtAt+XE1z7uDEreGdY/wIW0DyQlNRqzAg9MwIZfcx0jMWnsbLLHukDXJwdoDeNn/B19WVDfDzUn6ugCOCHtbI1HNdYOWbu8W5YWjhzafojcjHOtXHKhQ3y3YWMt9P7OmXQKoAgfPAdR61lVZjKlr3GmDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199018)(5660300002)(66556008)(8936002)(54906003)(316002)(478600001)(6916009)(2906002)(4326008)(8676002)(66476007)(66946007)(41300700001)(36756003)(2616005)(38100700002)(83380400001)(31696002)(6506007)(6486002)(6512007)(186003)(26005)(53546011)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlZXRWQ0S1J6Nk5JY01IZ3Jka3h3UmorY2F6ZHArbmF1MWNJbkF3S2p1enB3?=
 =?utf-8?B?YkNVMFdaZlZaTzJvWFZaaFFFemQwQnJ6aUE3UVFqR2pabUlaNFZJWTZQNnpu?=
 =?utf-8?B?bjJUeTdDQ0NmRVB6T1VwQS80VDBzWi9TSGU1RHora0pQYVZOUnVXV3ZZUDJi?=
 =?utf-8?B?V0RHNjNxclJPQ1VJbVdOTHpPcXlEb05TNVYxRzMyUkRHV1lZS3NxajBXUUpl?=
 =?utf-8?B?SlcwOVJFdXN2Nm80RTZabFdXNmhUQ1RpYXo1L0ZoUjdBRTFVMTE0Z1FZYmRH?=
 =?utf-8?B?WnRCdEI3VWpzeEZXQlpla2FHNnhrRHRDZ0xkVG1QbmRQQUJFTVRKQm4xQVZ2?=
 =?utf-8?B?WWlWVmRackswV2psa1pBQzR0OUJ2QVI1MmhLTWpDaGRZRDY2Rk1Cc0xVTmtw?=
 =?utf-8?B?S2tyejRja2hRRkZTKzVZOE9GS1JJeEtVM1JSTkpUMXhFandMeFhoYjNFNWJk?=
 =?utf-8?B?YVU2alBEeXhyUlVzUVV6MEZMWk9ha1FLcGVZNFJsb2xLVnZEK2hjRGR3WklD?=
 =?utf-8?B?eHVQSWo3Y1lVMXl1YW1jOTdBK0JYZ2U2UUJvVTQwS0F4OFlrRk5JU3BGd1RL?=
 =?utf-8?B?ZiszZEFaUnRER3ZMYlVKOVl4ZUx2YVFONXNHVWswNG82aTBUT3FpbCtUUXhZ?=
 =?utf-8?B?YmdWSUZtWHVQc0VGMUhyaDZXdUxsaksrT1Qrb3pFUzVIUGw1TzByUGZ3ajdQ?=
 =?utf-8?B?Zk9xL2xncmZPZXI4dkUvRm1VN0pvRnRuby8rT2h6S1ZWVHBsNDR4aWNzQndQ?=
 =?utf-8?B?UHpjc0lLb09PVXpEZkJLcjJXQmVzR3JoWjdMajBSVGd1a1BubkFiOVZTNVRm?=
 =?utf-8?B?WUZLYmI0S2w0MlBSSkMyRVpLWHJvRXZnd1Jjajhaejl3em4ybVRaV3l4YVU4?=
 =?utf-8?B?aW1xQWpKckZ2cFpwNHJDMjNHa2lrRlArVzRPT2N2eUpweFRwcDhKa2c4YVFN?=
 =?utf-8?B?QjZDYnlxWG50Zmg0RFR1VUxpZHdtYjQ3cWV5TEE2WXBMZWhYa2RMdjN1QWFP?=
 =?utf-8?B?eGRoQmNqSFF2ditXOHN1MmpzQmJsZDc1VGhzWnlvb00zK1Rwdlk4YUFMbXFw?=
 =?utf-8?B?NTJPcy9uUE8vc2ZnZTBmWTRQc2ExZCtJN0oveVRJbEtIcW5VNVlMTDFYTTlT?=
 =?utf-8?B?R1Bpekc0RFNOQ1BoYTJPdXJaTnAyVHJVbENpMnBiZCsyMlRoblZrNlBDWGY2?=
 =?utf-8?B?aWFTdmJJTmZhUExWN21sWGhwbW5FbHVxNm5TekxQNjd6KzBNcnN0c0kwM09n?=
 =?utf-8?B?MFJreHZYUzBmNGIrVlk2NWZjUXY4dTc4TE9vNXFXM2NwTDBrM3NzYjUrZUZh?=
 =?utf-8?B?WGN1Z2pzNG9PbnFMc2ZITjFNVG1KQ2ZXb09yS3lLMVN6Y3oxeWhWYjg4Q2lY?=
 =?utf-8?B?UUdoeGNWUEVudktnblQraW1DR3NjU2F2VUtZdmtRbzY5VU5BWlJITHNqM0hr?=
 =?utf-8?B?R29KdTNjeE9mZUpOM1BScGRRU1ZRWmduSmhPRUFyeGdHZkhwa29JQng4ZDVK?=
 =?utf-8?B?QVB2UnJsNzlKK090eUdiU08raUZURzBkZUN3Rko1TU5QdTdxMzI2bHdzVzZh?=
 =?utf-8?B?a2xPMmpleURja2lJRUlEMGFDOTE4cHZuZER6UVRqb0hZeWlaZkdwMHkrbWlU?=
 =?utf-8?B?dkFmNkFIcTlQM3hXdFhBKytUYmMxb2tBYXFWd0tqN3crWjNwNVJodER0T0Nn?=
 =?utf-8?B?RE96NThZZW9sa2FyL0c0Sk9uZktwMUJDNzhnQnJDcTBHMkx3b2pNaTlIOVJj?=
 =?utf-8?B?MTFFUmFjYXUvWmgzU1Yva0dFczE3SlFHYjNWLzBOWjlpRUk4aXdHZVpzYjd2?=
 =?utf-8?B?bnZZNXV4YithcmRjcFhsQ3JOYldYRDA2SDF3eVIvWlVUQVdqK1p1UGMwRFRP?=
 =?utf-8?B?MmxvMk5iQ2dKNGtSWFU2RWZMa3NsNmxBTW1XNUwwSXF0WTJxeEJZeWdFaVR3?=
 =?utf-8?B?OHdGZkdKaGdyVmh6aFdKc1E0ZUdVNWovcUFmNWFYSGJObE0vdlMyNUZOU2o3?=
 =?utf-8?B?cTY4emoyZ1ZjM1JGdmdTV2phOFdpQ3VwTU11UHkvOTVVbjFGRTc3cEJMTVhF?=
 =?utf-8?B?a2ZmMys0TzhnVGNBQU1tMWEwZzZCYy8yZUlrbExaMXR4N1Q1TnJMbW9MVHJJ?=
 =?utf-8?Q?PdgR++gEAKUAzWve6AmAdcfd3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb734db-724c-42ee-1c50-08db10b8a883
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 07:29:09.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKR5/TD0C7jbJdLcPKTN51iUX1T4Tq3bdgDE2MBvfy0Y0xnkpQG9Gd7UrTOrQDgq2g01oOXzYG8Sl8nwJIUQ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8780

On 17.02.2023 00:17, Andrew Cooper wrote:
> On 16/02/2023 11:02 pm, Andrew Cooper wrote:
>> On 16/02/2023 10:44 pm, Andrew Cooper wrote:
>>> Clang-15 (as seen in the FreeBSD 14 tests) complains:
>>>
>>>   arch/x86/time.c:1364:20: error: a function declaration without a
>>>   prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>>>   s_time_t get_s_time()
>>>                      ^
>>>                       void
>>>
>>> The error message is a bit confusing but appears to new as part of
>>> -Wdeprecated-non-prototype which is part of supporting C2x which formally
>>> removes K&R syntax.
>>>
>>> Either way, fix the offending functions.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>
>>> These are all the examples found in a default build of Xen.  I'm still finding
>>> toolstack violations.
>> Apparently not.  int cf_check vmx_cpu_up() too.
> 
> Ok, finally got a clean Clang-15 build.  I've folded this hunk into the
> patch:
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 09edbd23b399..e1c268789e7e 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -781,7 +781,7 @@ static int _vmx_cpu_up(bool bsp)
>      return 0;
>  }
>  
> -int cf_check vmx_cpu_up()
> +int cf_check vmx_cpu_up(void)
>  {
>      return _vmx_cpu_up(false);
>  }
> 
> 
> but am not intending to send a v2 given how trivial it is.

Sure.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

