Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4F6B0550
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 12:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508000.782242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrZN-0008NI-BT; Wed, 08 Mar 2023 11:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508000.782242; Wed, 08 Mar 2023 11:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrZN-0008La-8L; Wed, 08 Mar 2023 11:02:53 +0000
Received: by outflank-mailman (input) for mailman id 508000;
 Wed, 08 Mar 2023 11:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZrZL-0008LA-94
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 11:02:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3d18045-bda0-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 12:02:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 11:02:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 11:02:47 +0000
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
X-Inumbo-ID: c3d18045-bda0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkUpMfbaaH4UC/Fe/xL6c9ZK7e94koZ2ui5QhYAETX2WaIoaw2AXGgOj0D6nq4G6UpZqbUfndWTRF7mPjwC1GpftEr9Sm/uhRdLnD6CYY9jRB7Al2B3d943moGda5miu9XH8gXz0wTKPJdhU9nfXJ4pdN4D2IlP/nHQquW5lIbo+8so3iIluN7P96QOz1Ta9rwL9li/qLYimU3jewPgHZ42y45N7Tm1JZBpOfAmqVYySte+JyGj9nnUp35IFqzbtgYlJAHEQQ9PWWLw5ETwae0WiL1SRB5qxyKEjiGhLOLo3/06ipK/XKuZ1MbW+mtAPjLxnXj/pAhCauXwZog9Y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82gSJGC8Qmr2D39y8z0eCkXsZwn26/w8AM53seY8BE4=;
 b=TgfXkluN5QrC1K+sfE1vwum4pzYvtduSvd0vYKegsfxZF8lbUZo+VqgffFI/omHQhVc1HR13xhUZYA2GDJ0pFjWd9q2NzlXz0fQUdg655hdPd0CMBe3jWOtU3FVXH4hRp2IbltoReUtfU0nxx1/8VFo/L4WJKgoHZm8CVZMXZq/m3rJ7nt9FLXys0PTPI8gWZF3lfuwZ1WFBVlOQsk2e7XW7aAKhp9hT96wEo6xb+Mx6eaIIPBtDW3mYaFNoRKjQ8OS6Vt034m4glkWdK6aGkstk53SI2w6f/L8zzcl7bIFfK+BJgHEvxOMJQJInQnPyLaB5Ezuw1V6DHu1jCXriIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82gSJGC8Qmr2D39y8z0eCkXsZwn26/w8AM53seY8BE4=;
 b=wNNTv+vZMKX9jujpTp0syZAMaWScPu6wqN2ZaM0ClulE4DS+45spIx72NjnTqUR9aTlHMCg63ScVaCT3h3/u27A9RErkCGqPZ+uPJ3VJaVZ9KTYYGsF3cfrl/2ZZPDN0DSCoEH1uoLFjD7JsLzrKnUzo32R9wq7m4bYTkvAyB0vQpjNmyuOQyh3X2aCGjcMtTAr6hbzUv159xfvIoH+c/n4+hla/hxuWMFi8xcqJ4jp4k/ctbuNGoT2YsZMjyRpwcrBsCbjEM3kOUK7Foc6PhcP3FF+V6Jtm94Wf9AQtJpv0GGQdZXVnBp2e/FaCn/RYxuGw7WramWmSSPRoRX+77g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c1bb97b-279b-ecbc-e308-cd3ee954a4a2@suse.com>
Date: Wed, 8 Mar 2023 12:02:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC] bunzip: work around gcc13 warning
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <072cf7c6-9f43-6507-bf8c-a79ceedf3000@suse.com>
 <CA+zSX=YEsdgH6kzpqh+UvH1PMPPotzVUDSG_p-bHefUPX93ntw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=YEsdgH6kzpqh+UvH1PMPPotzVUDSG_p-bHefUPX93ntw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4d16ff-16dd-4a31-f547-08db1fc4a6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	34e0SwPgY2YEVhUtafrGFkqX57AaNg5dBgOegW54U/XtjAYthccu8IFYObfY8kLO7dqj1KDFERjQ53tgt/6tW3AFFT+WcHgHOrQqyVWa3YT+JuKxR4jBDfRMyJZEVNHIlkwgDi6PqDCjUJ/nxCyveCyvoh8qUsYssuDFI1Wr5swIlrzy5m2ASmRO+NnEXzhEfKiqhsAcHzV9a8JGWE9wM+eaiRQ6jMjFFvm8PRK4kl/TLRvZPdsiVz/f4AfvvBAyV4lHDsLVXKNSBhUYpcWF1VRYJAebpR65eOBKEJRxzSGbMyVeAUD15j+53YxOMR9l7JKzoJE3n/F+oJpbeMP3YbpGwoyhA7PAfAPw9m+mKHtnwXbYD48qm5bvHxopZsa/Kk0ZTi96egJoxbsJzPwWHR2/RMDtY00DJ13le1QFMur3vCB7kgYJqNEee+A8UvQr1ZRcZ+4PhH3tQwCvUG5VpPDBb2NCNW2s1J65UFWpW3o8u6mHmBUk4qslyjuAf2HngsqQ8Bfl1dFwSH8UvaFx8Gl0U6LSUrwn8p0Lg9mqQIX1wWCwc7cmqRdH4JDfl4phbjVm4+3xiECf9kTjOeFN7yYgRG9awbyT1yPkHiRa3KwWh3IYpJrovsOFmVpfavYrLpo0dQdCh4/TfNX122vPjcYlG2aD2XJtIDFRotdpMuzi2smQnvlItqhSDKF3+wyDRp7rDO/0vqoOFnnsI5x/m0Po/TeubRVyc83nv9tEz1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(5660300002)(8936002)(6916009)(4326008)(66946007)(8676002)(66556008)(66476007)(86362001)(83380400001)(36756003)(54906003)(478600001)(316002)(66574015)(41300700001)(6486002)(966005)(31696002)(2906002)(186003)(38100700002)(53546011)(31686004)(6512007)(26005)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEYyODR5YmpZZFNzdW90ZmNkMFZab3h4cFFTeWU1bHhTRHQ5S1NlcXAyeDRi?=
 =?utf-8?B?S2ppSkVjSDFNLytidzV0cHE4amRkckNvVGdqMmczYXFUTnJEaFE0blM4c1pB?=
 =?utf-8?B?Qi9lMnBXOGZoaDk4cStHeklIdFRoMy9wclBJcEt5TDNzMXF4OENhNTVmTUIx?=
 =?utf-8?B?Tmlpd1lBTi84dWp0dVU3UHJLZHVpamUrNm5JaHY5WVI5M0JhampEUU96bC9n?=
 =?utf-8?B?WDRIQUtudHN2dEtHZzk3MGNFdENhK0VodndsdWpsSG9lSEVRUkthdFVjSFIx?=
 =?utf-8?B?NVA0Q0lkbTBnakJCZlVSTW1rdUpYRThlOXoxUUFmOTU4M2ZzUTlyMEo5eXhr?=
 =?utf-8?B?ejdrejJ5dVJtRlRwWGJRTy8xYkg5Ni9LT1Z1U0NRQXU5N09Za1ZsVzJ0Y25S?=
 =?utf-8?B?ellZMzhRSCs0VUxua29lNk9wc3FVTnVyUytZeEVKYzM1WEt5cC82VkNKcXFs?=
 =?utf-8?B?cmNqNGxNN0Y0THRKQzVmT0szVW9sekNjSlJCRWNubzBZeWdEVTlSWXYxdHRX?=
 =?utf-8?B?aktlZnFiaHdxN0F6d1dIZ3FobW1WTHBCeTk5Nmt6NzJySGIvZjJ4TzRaS01x?=
 =?utf-8?B?SlRMUnNxeGpwdFhIUmxDV1F5ZkxaUEh3dVR5cWpnZTVWNnNrbVdNRWliaGRC?=
 =?utf-8?B?YUNjb0JmNExJdFdKWmdFNVJORkUxbFFYUU5peERWVUxrTE1LMVhldDlLUkxQ?=
 =?utf-8?B?eFBNa1hGY1BjejM3cWkyYmJHdFFGbzUvSnBhdDFzc0NNaWdaZUVaeTQyaVRT?=
 =?utf-8?B?N0hQN1ozTjVacndlTjRXdUdDcGtWaGtETHduMWtmYUM1eEc5cU9NWjV6QnVT?=
 =?utf-8?B?clUwd2NMVGxlNGhyM1hGNFRaUUxLcWdNQlphSzhMaEZHWTR6eWtzWTcvOGww?=
 =?utf-8?B?K0Y4WUh6WGZTKzlHSlY4U0dRUHpOa1h3aDFmTGhGdjBYZ0VPOEUvWXUrbVE2?=
 =?utf-8?B?RlN6cUtRTi9IemNRU3piSEJwTWNKa1ExQXVFTFJSN0dHaXh4NFNBNFZIVmlv?=
 =?utf-8?B?YWpMSkk3b0RnVS9NM3RYN0dXY2djUGhmQVRBMG5UMXhUZSs3eXd3LzBYSklR?=
 =?utf-8?B?MzMyQmRQL1VPbFVHWTQ3OHNzTWUraXowd204SU5NZ1FiT1RTdmdsOWNmZ1Bv?=
 =?utf-8?B?V1J5bDZuclhGUVp3VmMyMWtRaHA5YnUxaDJZTjVucnZIWEtZM29BdmYzd0V2?=
 =?utf-8?B?SEEwQjhoMk55eUR6S1dxWS93QlY3ZXFmN0YwZitXZUZ5ZTlVQWZQUUNiamkr?=
 =?utf-8?B?VTMzb0J5R20rVGVEODJ3S0dGdG1ZbHZadVJRWDhtUjFLeHRUWU0yRkVNcURt?=
 =?utf-8?B?SDJNUjlOaHNFUm1kLzM4R0FMRFZZVWV2K0w0S0dPWVlrV1FpeTlKWDZIUzVC?=
 =?utf-8?B?cDRFOTZwWkdFbTVoT3RHRVo2ejNiMmhiVXhuNERMTndjUndiQ0o4THFSV1d2?=
 =?utf-8?B?aGdNS0hqeHp6ZVdoSU44UTZmQzZtenFNbExxaFZ3Ynp3Qnh0Y2lmNkErVEcx?=
 =?utf-8?B?ZmtVZkxDakxpSk0wMGVWQlZpRnpFbHpHSmFuL3ZwRHVaWnJKd1plQjVLSjIz?=
 =?utf-8?B?N2V0aytKM01tc2g3anp2b0xMdW8xOXNqL3dXMnRMQ1FrZVI2ZzlJNWN0bDcz?=
 =?utf-8?B?VEF6cENwQnFOckREa0V0Wm5WNitVWjJuTWM5T0tDdkd6NFRxSWxXdjg4VXM5?=
 =?utf-8?B?VXFMbGoxZWl1SFF1RUpQdjc1eWVPOHpucnBRVHRqSytmZFY1QzJGVzlXOFUy?=
 =?utf-8?B?WWlRaGdQMVQ1S2xrc243d2lLYjZ5U2IvTWYrSElaZk8yMjRSQ2tpc0prUG8w?=
 =?utf-8?B?U09mU1BJcnRaM0RRK2VqN3Z4N3FsdlAwbExZTHkya0w0N2dZaEszY2psNXV0?=
 =?utf-8?B?SyttZUhCbUQ1aXpuc2xjUXRPakJjNFZFV01TM0c5aG1WQjBpcHMxTnFMb3pM?=
 =?utf-8?B?dXgvdkVDTmRuSEE0NjlxekQzeVdoSkNadm84c1RPUEZHK2dwWjBSZmVyQmIr?=
 =?utf-8?B?eko1QlpuN0ZlOHFrMlUvVXg4cUV6djhJRVpzK2EvUElYclJYU1hnYzRMd0ht?=
 =?utf-8?B?ZEY3Q005M210QkRlVGh6NjlHU3RJV1F5cnlJK0VJTDY2aER5N1JVT1pSSmtG?=
 =?utf-8?Q?XqAutSLbxXUHuH/u6c8JZF3Py?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4d16ff-16dd-4a31-f547-08db1fc4a6be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 11:02:47.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUW/pNrzBu3bfDlC+kXEZI3DlddAJD2jV2eGbpKbkiEbgXGMehg1iV464hH5X4pnZ5OMvib60P4AlS+y7NM5tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 08.03.2023 11:37, George Dunlap wrote:
> On Fri, Mar 3, 2023 at 7:29 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> While provable that length[0] is always initialized (because symCount
>> cannot be zero), upcoming gcc13 fails to recognize this and warns about
>> the unconditional use of the value immediately following the loop.
>>
>> See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106511.
>>
>> Reported-by: Martin Liška <martin.liska@suse.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: We've cloned this code from Linux and the code is unchanged there.
>>      Therefore the same issue should exist there, and we may better get
>>      whatever workaround is going to be applied there. But I'm unaware
>>      of the issue, so far, having been observed in and reported against
>>      Linux. This may be because they disable the maybe-uninitialized
>>      warning by default, and they re-enable it only when building with
>>      W=2.
>>
>> --- a/xen/common/bunzip2.c
>> +++ b/xen/common/bunzip2.c
>> @@ -233,7 +233,7 @@ static int __init get_next_block(struct
>>                    becomes negative, so an unsigned inequality catches
>>                    it.) */
>>                 t = get_bits(bd, 5)-1;
>> -               for (i = 0; i < symCount; i++) {
>> +               for (length[0] = i = 0; i < symCount; i++) {
>>
> 
> My main comment here is that nobody looking at this code will immediately
> think, "Oh, I bet this is to work around a gcc bug that can't tell that
> length[0] will always be initialized".  I'd put it in a separate line, with
> a comment explaining the situation.

I can certainly do so. The main question though needs answering first:
Are we okay to diverge from Linux here?

Jan

