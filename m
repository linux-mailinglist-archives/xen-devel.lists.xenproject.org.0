Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB97CAF3E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617874.960947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQU9-000440-26; Mon, 16 Oct 2023 16:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617874.960947; Mon, 16 Oct 2023 16:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQU8-00041H-Vj; Mon, 16 Oct 2023 16:30:28 +0000
Received: by outflank-mailman (input) for mailman id 617874;
 Mon, 16 Oct 2023 16:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsQU8-00041B-78
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:30:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ffd316a-6c41-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 18:30:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7363.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 16:30:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:30:24 +0000
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
X-Inumbo-ID: 4ffd316a-6c41-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOYxYYGs4jQnCdrP0RbglGI44FBo9V68yymQBc7WGrr/lIuX47RG/j56gEgoZuYjn6sR7plW4U1r6CzU90zmfr1U2HmUFdTAqialnMaJDMiINIHs/9slXT74T1Mpy0ZhXxnFgBK4R08mmiaQeYsAKQea3tF66IH/hmbgjanD/bsu/Y8rR3Ob7hVSdeIg6JBYbtm4dY3IZ/V4kBLlyJoR5XJ/EjqDkVocKYyOZdEeXgAQXBokeiQJWH/EgUL2640cR8gMMN+2xDuGtevTAEhQxATd0KFAXWAAWPP5sslrzqaWg5XJG4XLY+oiiW4brm84Hi9RlUjXDinYmlrGvotVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2DvKHWFgJ3dnr3loMFhHQayiithKGZo61d1xtOTSMs=;
 b=ATfHZShmrkKlcnDmLn9858OrGBK+hGBXmbpEMuySorQeyg3DWn2lXwwg3obXam1lad4i3QX7yPl4FcJXPPBTzTHK1CW5AnM23MMEufdjfqbwg9wlfVd52IL7IywnuPjbi1Ed7InqV4YGzd0TKT2msN2r7xs//byurb6kvItSn77StwnJVQou2G838KBd1bCf5WXqNP8c9S9mAcT4GHShbOlxnBSYPXHBZ61GBPq5CCxKNoT0iUDtRHeLXRqpwsrj/e+aWhnzCKYDAG/4UtN0WQXTyP+/rbe4i/Jbk+ISjzFL8O6rvsqt7ttyWnWUK5Q7oNIpe3fpSPddfK12xavjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2DvKHWFgJ3dnr3loMFhHQayiithKGZo61d1xtOTSMs=;
 b=BKa9LuBM0HzIENbDll/yWS6hWV1l6J4TrPWqHOy/QNYUr+4d2ALlmLs/OKtf5ber/Pht+c5NeIqmTO/Ca7kN6Y7OmCF6sQlBjYmQ7gQfDvBo8IMw0/mF3rxgIZ3w+vM/B9iiMzVvOwe4RlOrffPhRpjt1LON1sIib015O2NC/okgOwhCf3+RZUc6bKRlN2BQphrFVdX0Gm5NajqBy20muekQu7/BEZvhop5teqWSTw5EePczuRrZW40npazPuWmkpQq/4Wai2JMxEftJ4j9/zL+oCFsMtSvZK3FT4Jt44BsMi4dbstWnM3+CXKRSmQbx/dGkUmFVN4kP0UvWiOJTUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08286993-6a83-b928-6398-e129397927a0@suse.com>
Date: Mon, 16 Oct 2023 18:30:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd20a04-c19a-4b99-215f-08dbce653298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MUXL7Jqr6v98ZtLV1f5BuGf+rftTm70TPvHHN5khCf/OFMygF+p2hKioQ3zvEN9FzxPWv5Xneqw1F1sWu9lfCnw1WTOOgpWROaGBh83WqKWupON+h70WswENMQA0Bu8BBGLhx8tMZ/25n9LL6n++jU5gvzn6WC2bfWTllqSiZxuW1spA98tE2vGVph1VrKBMc6FDEBJdEwfeckCTaLR4Y+UdRODtP40uuoLtTjdO96clWehM5gMqwI5pvLEjzRNJc5Yw136Gy/W/AdDWPq97etl6OJ4cr1UwmvcR5Xozu6OJkJv5G+hMSjp6PUDlm7QCxEMvm0UrSEu71OSfCM0WPWaC1xZZ32I848QZegFByO5qYwimtXLdv722dBvfgvLvoxX6Gzm6q74NR5vKBr75lifktW9W7hHPxglrt61Xn1dSS/7rvRJd1zTxh6+Xnims4474WmoxGmVZZOSJvX/7aiCh+c3wR5luOcUBvlbBgMBf368ShKwjRSMFaZw0TChlQilIH15GD+wxgBudt2aYDogkO3CjrK20v6s/9NZUEhss+SkJ1ovXFhTBtgA3jwHD9Z23cPM4pKH86/ZznXvCeU04VOiH6yHQ5K40mN1jLgPSCcVXqKytrqhpgQOrcp2VF6d5x7WfpG1VrgKOXOtsRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(6512007)(7416002)(66946007)(66556008)(66476007)(8676002)(4326008)(54906003)(8936002)(316002)(6916009)(6666004)(41300700001)(6506007)(53546011)(5660300002)(478600001)(2906002)(6486002)(38100700002)(31696002)(86362001)(36756003)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3NyREUrOTB6THRuUlJYazZMbk9mS0QxU3pVbzhGUUM4aGxrR05JWndCMXdN?=
 =?utf-8?B?dUVYL2tCQkhWdW9uNXQ5ODNlMFRCUmkvWnZ6WXdxZ25tZW5pbU1YNkdodXVa?=
 =?utf-8?B?VFBWNGJpRGtwQThsR0JYRjRUM0MyQnk1RHJjQkhyS3ZwTnBPYitoUWNnMTBk?=
 =?utf-8?B?RDhoS2k0ampOa3cwbGtEOWRjNlVJR3VmY1BKVnpPaTVGamJpYTREcE9FRHc2?=
 =?utf-8?B?QW8zYkdacVdJdExzMWpCcVJjNURKZmtTV240cEpYNTczY2N5RCtRVGMyVldS?=
 =?utf-8?B?aHlRNU4wWUR2UWVMRUk3VEF3cGV6WVlWczljR2pIanhLUGNhYUVSNTQ3RjA4?=
 =?utf-8?B?SkhiNDV0NUkyeU1oQTdNYW1EV0JtcjlWckFIb3dVTHhaTG9SaTNjemdTdUtI?=
 =?utf-8?B?VEpMRm5PVmNYeTVHR09CNDBrVEJ1aHE2QkwvWlcxRmZFT2kyZnpvbjdUQ1ZH?=
 =?utf-8?B?QzJrMVJBdTdNZDJUZkhzblI1cU9SVDZpVkVWTGs4bVR5YnJKUkFobmZJSy9T?=
 =?utf-8?B?VGt0SkgwWnVlL0VGeWpyMWRCRG5VQzZTbWFSck1SN0tOTFowbGlhcFc3WVR1?=
 =?utf-8?B?WG82QnN5aVVhazNOQkNjYU1xamsrbGJrUUp5RHBSTlNqUllVYkZuQ01rajhE?=
 =?utf-8?B?MzQybmEyU1gzMWFlS09kOFY1Qk5wTWoycFQrdUhlS3pnREtjWlpRT2RuRUhx?=
 =?utf-8?B?QmhFOHdNS0U5MFIxdVo0QTdKNXptLzZLRW5FcXQxZVFJNlRhYzJ4clo1dWpY?=
 =?utf-8?B?U29tbXMyTXhDSjIvbytkTVRrZWd3NldiQnJzUWsxeENudndoREtBMVdPejE5?=
 =?utf-8?B?ZmNPTFdneFpnL2JYVEl5NnBnUVcyRzJ4SHRId24yenZ2czcwQm1Pa2ljMS95?=
 =?utf-8?B?MjFKM3A2SU1HRTlabzI5Ti93UENIRzFXTEMxQmdaWFVVZlJiYk9ETWhuTTZL?=
 =?utf-8?B?QklkVU16YldFYVhLWDJuQUpYOHArYjNlMDhtVmNWaFpSZjV2TnhBLzJuQWVu?=
 =?utf-8?B?R1hwa0FCMDRwV1pXbWM4eFZKb25BQVFRSEZmdldQdGViZ0V2bnVVbkNYQ2V1?=
 =?utf-8?B?MXBsNUJBZ21XQytMaktndDB5cnR2cE1EdWxLNWJPZTM3Zkd6STdUWEVXU2Nu?=
 =?utf-8?B?WldkTFlzaTNLTEJOWk91NkhYUmZqWkQ2bi94b1BVSk55SklZMEtEcHZVRklM?=
 =?utf-8?B?QWhRY2d3M21oMndtWW9Yak5CcWRMZ2ZHZzZDYmw3R2ZhUCtJbitwM1VwOEp4?=
 =?utf-8?B?N3ZnMjdQN0wyVjRTM2pkTEFpSU9TTDNSNDhHdmtXMUhZMFdycXB5TGtCbDFQ?=
 =?utf-8?B?d1NzQU9oTHZrTWFnOExENGdsZ2JhaVd4VmRXSDg0bldpN09qbVljaHdqTm1i?=
 =?utf-8?B?REcxQkVZUHhTYTFJSzVYaG1BYnByQVVwck9hNXlPRVFmSklISGg3dWJDbXA0?=
 =?utf-8?B?c0ViaEM2VmEvY3Z5dEo2dHU4Y2dwOHZVb2grTmF0ZkVISndCYjFPNHdDT0s5?=
 =?utf-8?B?bmNuZ2NrS2NaTGVQTUpuT2svTkVEN1ZORit3WmMwc0pDVG5HRHBaSnZqK3Ry?=
 =?utf-8?B?UFF4Z3h3ZjVOZnh0QUFkaDZJR2VxQ3ZLbmxxK0pWUFE2WEs3Q2NScTYzMnF1?=
 =?utf-8?B?eklqVDNwMmNBU1JWQ1dTWkxRMkx0WElTNGp3WjRRd1lyQmlpanc3bi9KSUxw?=
 =?utf-8?B?ZS9pL2dvREp2emF0Tzd5czRNajFZTjJBVFZ1ekV1ZEZjVXozK2xQNC9hUXpT?=
 =?utf-8?B?WEtjcDI3YnpOSll4MXRHNjRxL284aG1uUHE4TXdCUlpUeEQ1aU5QY3NXUTcx?=
 =?utf-8?B?Q3MvdTRnWjVnWEdKb1V1dmhrR3dBT3U1azEzS0RlWmxkZG9rMFhnQ3Ixaktm?=
 =?utf-8?B?Zm1tZXBKK0E2YmlYLzZqRTFXOGlLVWJrR0ZmWEI2dGQxcFpTUXQ0VUsvNWJv?=
 =?utf-8?B?NnlYSTM3NHMvb3pIWVBJc3QrUnQrV1ZiMmhlYXFLTko2UFFSY2hKbG4wWnZz?=
 =?utf-8?B?aDBDUWZNbGhmbWRtdjQxa3hiSHJkZmlTeEZmOWtNN2oyRHRlbVJCTWRkdTVn?=
 =?utf-8?B?aGx4a3lhSmxGUUtoMDA4cUVIcllNa2VLTm9sR0xMRDd0VjhET3lpMGU2Vy9Q?=
 =?utf-8?Q?tgaUTiKBssTm0tbFZSVqiTKKD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd20a04-c19a-4b99-215f-08dbce653298
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:30:24.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70giWG/U5xw8g43gSH22ab9uOwoWaRb026uxbM5Llv7lVSpnjofkogDZuEwCv1ZB6/N4vlz2RrmQV8fhfaTq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7363

On 16.10.2023 18:17, Nicola Vetrini wrote:
> On 16/10/2023 17:33, Jan Beulich wrote:
>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -274,6 +274,12 @@ still non-negative."
>>>  -config=MC3R1.R10.1,etypes+={safe, 
>>> "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", 
>>> "dst_type(ebool||boolean)"}
>>>  -doc_end
>>>
>>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to 
>>> obtain the value
>>> +2^ffs(x) for unsigned integers on two's complement architectures
>>> +(all the architectures supported by Xen satisfy this requirement)."
>>> +-config=MC3R1.R10.1,reports+={safe, 
>>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>>> +-doc_end
>>
>> Why is this added here rather than by ...
>>
>>> --- a/xen/include/xen/macros.h
>>> +++ b/xen/include/xen/macros.h
>>> @@ -8,8 +8,10 @@
>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>
>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>
>> a SAF-<n>-safe comment here?
>>
> 
> One reason is that now that violations only belonging to tool 
> configurations
> and similar are documented in docs/misra/deviations.rst (committed in 
> Stefano's
> branch for-4.19 [1]).

But tool configuration means every analysis tool needs configuring
separately. That's why the comment tagging scheme was decided to be
preferred, iirc.

> Also, there were disagreements on the SAF naming 
> scheme, and
> patches like those would not be accepted at the moment.

Well, that needs resolving. The naming there shouldn't lead to patches
being accepted that later may need redoing.

Jan

