Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F14A3EF1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 09:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262816.455200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESWw-0005IT-LY; Mon, 31 Jan 2022 08:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262816.455200; Mon, 31 Jan 2022 08:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESWw-0005GN-IN; Mon, 31 Jan 2022 08:59:22 +0000
Received: by outflank-mailman (input) for mailman id 262816;
 Mon, 31 Jan 2022 08:59:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nESWv-0005GD-7L
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 08:59:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13a70d5b-8274-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 09:59:20 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-A-QG8Z-pP7mPhxIW9FxQPQ-1; Mon, 31 Jan 2022 09:59:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2989.eurprd04.prod.outlook.com (2603:10a6:802:8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 08:59:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:59:15 +0000
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
X-Inumbo-ID: 13a70d5b-8274-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643619559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atce0Ic8DtnEZ3KWKNESaW+r3Gb5jw4Ih2pVNyYDNAY=;
	b=fCMkR4sqW4GpWWmac9gs0woQt/dK99Wr7seHo4ZqjSP2oCzlBqnLEgj/77KFBMv9KFqyLj
	FD3BDKeY95WO8O2EihIjb383aMN9JfGgcC/TzSx5j2TDUhaozSyN50LFO5p69iZTOOszFg
	eHuU/JCQ1DDNI2K6wC3FfoFbtBzSHhQ=
X-MC-Unique: A-QG8Z-pP7mPhxIW9FxQPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGOf7peK7bN/xT4yWNkCxm4b3h3zv4QR6QeWh4hlQbBCQUfYm+sZVtmi6HiMYRT4QEZfcbHWMFBd6QARVa5yMyRkUG0ze/2SfLBJwUp4lwLeVgXAS81UDktU+f8TfHOVbL+w6kVlzalwADON3sfCO5IjbdCygHerv+o8VxK0BLaCkt1zCVd9K1jlTu5E9RocDh0kgzmJ2C+BBt45lnc/JyVnguL5oVuP23Y6zeXjk4CUrsK2kot64R8KiOJrwN/LOL3NtbKN++0ssTAOeIc6z+JFRp5p25crlFiuTM4OEmmR1qRsoQ95LpB5eCEtyuw/KgErpjf3YBPm5LPHwy0krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atce0Ic8DtnEZ3KWKNESaW+r3Gb5jw4Ih2pVNyYDNAY=;
 b=RB/tjMv83KCzseFrlXkm4gdiSMQDkgWPuIuBPf9AcMh3+xvyxsh+PITmv/iSrELwfSMCGCYSGJBKnUFjKuObAFhRyKjFinCvJDAyX8LiEcHJjRpzX6wuXbrtpKJi59tdPbV1uTcr51AEu3RPStOhCsyKBbK8gi4TmyJzmqIQOc76LMRbBVAXCStbzl3VQWgecCfzcJyS7BmA+8oBTcCVfpY3rtwZYvea4VLNa7uSuVBiPCBAMk876e0Bv7DyHtUZ4vtvlRqipcRsFL780EjcBLtaaZkHlu4Xguf3FQht3qxLjF+xkZE2HufGiAN20d4MESg24i4r6kepI2+Y8LbqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2340292f-54d3-62f8-1d5b-b54e1c3728e9@suse.com>
Date: Mon, 31 Jan 2022 09:59:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 08/30] build: fix enforce unique symbols for recent
 clang version
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-9-anthony.perard@citrix.com>
 <708a1723-7b01-e82b-f2c2-d031a33ae55e@suse.com> <YfPbndiBeViN0heB@perard>
 <b9b4262e-5ca2-b051-7aba-b2ad1a6bdc01@suse.com> <YfQRQSwuJW+XOWYa@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfQRQSwuJW+XOWYa@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0030.eurprd06.prod.outlook.com
 (2603:10a6:203:68::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2c5f90f-b485-4dfa-1ec0-08d9e497f530
X-MS-TrafficTypeDiagnostic: VI1PR04MB2989:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2989D2AAFA7E4B99F467623EB3259@VI1PR04MB2989.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mcL+Rn6B4+WA3Fr+pRgdRSOx8/iAlIzrmsxykocAKpvErjN3vPCt6hm7obiw/ndY8wJZ4yMHWg6GgLufJh6uvDGwef/TV3p50gpD1pLuXemVjsLErQ3NrrNK16wwY2bD8qsTdpCumjshp+ggG0F2sC4ciA6eAALNg9YDUPmnRdIy+7/Xw8HFb+8JOWvCvJcf15HG9gFc3Jbl53uuOPMboyrvo9OUPv6DCgA1ku309k2uoaZsyNcSHi+6p0LQK9kw2VomcbhvTJUK8Z0PUBB2m+wvS5HdQ5s3Gcz6JeNF8L3bn6Tw5TUovygMr3XOvBN32nRVsaPdyKiKsgzNhRq+MPEJrms/3QF1acRFTMb0LGId1a7hsbnwajSRzqx4DS2RkiIPayr+7U6IUQ2hn80P3YBfZSeT1rrQo/MHu7ceZl/QNjgnPKb1UJNNyi+Ao8R5cmDLqrRgtMecv/s/R75/sJT5FyYKU66MfoKqC7YpIWmDtzPhIcoeAcDlQ1ReYLu48OOJuFb8jmZei7plf60eftdCWMM724TKuU6iSqXmz5R2eB8lBK8K2/HwsLMzk63dxJCprJLYdXIy7y5v68c9FWsaSnZvdSqZJ4+NZTKl3UJ9D8Dj7TurEl+hINHNU3maVb4D22DIB/7hBc4qnB7zUGKIHTWy0ZcOqEuMLoG+BrF6K72q2uNzIUvnkitIzTAEvlQhxkvIoBn/hYzH4tXKbTjjeyuqS0AwYjICr8U7KDfEFboMZzu+vgd9FL63YoxSQSEQZ7cu+U0ZA3kzUs3PpDJaJ05ATEih81tFNdoXmkmarUK/wCCtCCwJjyumhl2AyaW/BqtVTmwGrDk89oxc9fyES08BBVLclmXA3kAU4iK7O9fzImg3nB+V1OYETWtU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2906002)(83380400001)(186003)(26005)(508600001)(2616005)(54906003)(6916009)(316002)(31686004)(45080400002)(966005)(6486002)(66476007)(66556008)(66946007)(6512007)(5660300002)(53546011)(31696002)(86362001)(38100700002)(6506007)(4326008)(8676002)(8936002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXp5MG9SSldsd2gwdlArUzJicWNDMVpLQWtJL3l3clNlcnJRbGUzVWZEbFBD?=
 =?utf-8?B?UnBGWE5BTUlQWFBYdmNkVnFrNFBEbWNOTjdOZldhV2NLOGhySWE3L3Vod1BS?=
 =?utf-8?B?Y05jYzgwYm1jNGNxMVh1c2d4U1lvd2pYVk15dkVpeHowSTg4aVMrYnFZRlI5?=
 =?utf-8?B?UG9NOGRYMWZ1QXJWL2lheWV6ZXZHY3U2ZVJSVCtnWXZkOVkyRUo2LzRQY2Fu?=
 =?utf-8?B?Vm5VazFHaVo1QitHTFhnSUVaRG9YODJQaU5uK3BIeE50c251SytaQzk5b1VO?=
 =?utf-8?B?S3JXb1I3Wm5xOTVwQmxDVUhmOWRwUHlCSmlkcnpEYkpubDNrRGhyYWxEUGNM?=
 =?utf-8?B?bUNmeHk4T0J1MHdrYlh6OVNjbGhGM1dFMWZBVG03V29tVU5mNDh5ZFp6M0RL?=
 =?utf-8?B?bWwyck12dW8vR21MWVYzZjI2UW5XTytjNVhMa2VLWGFvc3FMMVRQSDZIM25J?=
 =?utf-8?B?RkFPSXltdVJJVzVSeFhaV1VGZDEweDlpSmtCNVVBMFFJZXRUdEhEQUxNekhl?=
 =?utf-8?B?b0JkOEY5QnAyNVlvN1RsUnVyOEdRWnA3cXdYbnlLMjhWbmdZbERmYkRGbTB5?=
 =?utf-8?B?YTl2TmorTzM3VmdQYmlacUN4akY4bEtKeCtZUUs0UE1PMzczNS9aOTFkYS9O?=
 =?utf-8?B?ZHJMeDVvZjdwQkFwNHpOd1pnR0Z6MXBhUE1HSVdwSzN0cHllMzlBeFBWSjRQ?=
 =?utf-8?B?L1hTYlNvMmpWT1BoY09lSGRtTlNUcHoxSVM2Wm96b0c4TlZRa0N2SGk1c3hk?=
 =?utf-8?B?T2xGNXVodWlueXExQnNZUTVXeUhhM0NyUVhGOWN0U3RHSEljZXlLUjZ1Umts?=
 =?utf-8?B?YW9LVjkvZXlldHdhOGdOWWhhR2ZNSTFjYjJPSEdtd2ZKRFRHemdnOUk3MU1L?=
 =?utf-8?B?ZmtnYU9WTXF4KytKSGo0V3A4bWlma0Z3OC9IZUVCVDVFbkd3bHlaMmlXSFVJ?=
 =?utf-8?B?WVpxTE9nZ2hEZGNjKzdNWndHOTVsMjVQRDdheHFzVE9iMUlSTHVZR0RPajhk?=
 =?utf-8?B?VHZwT1AyUmJBZ2orOEZLOUZyNmFvdXJyeTJXT0phU0Y5RExmTWd3bE41QTQx?=
 =?utf-8?B?bEluYWNiNEt2U01wazRjYjduN1REakVURHJaUzBxa2h1cVRCd2cyVWVzQjRm?=
 =?utf-8?B?ZStEQnhVcWNpUHBtMUwwSnBlVmo2N0pEVDhSSFJqTXhkRXVWWUl2TDJUaHN1?=
 =?utf-8?B?ZEt6cTlieW93TTI3dG5OR2h3aGkyNDBveEo2S3dxY0RydzYvSlhCSDVGdXBB?=
 =?utf-8?B?dUtBTWE5L3hacXVyU3FvY0hQREZUeDBkZVBaZ0ZRR1laU2tFclcreGNnNUd6?=
 =?utf-8?B?bzhWUDhtODZ5dUpOVEZuVVk3M25kQkJWbmlIV1UraENUWG9rSDFoYWJXemJS?=
 =?utf-8?B?WDE4ak04NlN5SmdCdjFGMUtub2JlTnBwMnJsMkQyMm01ZG9kbG4ybWQ2U2Yy?=
 =?utf-8?B?Tm4zdEtYeHM2ZnY4bHJKMDA2eUFRc2lMNEp6SUIzM211b2ovZ29PUThrUCty?=
 =?utf-8?B?NDJBYUtHcDZmeG93OEZRK3I5NXVUdFVNQm5TdW9NbkF0K09UYXJYVE5Dekhr?=
 =?utf-8?B?NFVac3RrcTZUdi9LMHVsV3hlRjRLODdqVVNvekpzNURQRlZhbTlBT2dmWXR0?=
 =?utf-8?B?Q25MQlo1SDY3T3ZUekVhQ3p3TUhkVGtWK1I0Q3ljSDAydmhrZzc4WlFHUkdW?=
 =?utf-8?B?YUh6a2dudWpzOHZUU1BwcHg2QitZQm1PVlVSYkZzWWtjdENUU2NGMTk3K0xN?=
 =?utf-8?B?QXIyZllkM0NpeEZneXUyWFhMZXFKMFo3NGZOMkF2MHVBUmZCTW9QRmVaYkps?=
 =?utf-8?B?QlRzdGhkbURwZ2NNVVlhNmI2b05qTENTM3VUL0hqNlZ6ZFM4cHpUYUVzam42?=
 =?utf-8?B?OUk4L3VndkRDOHNpNjY3dlFIZEM3VHFMdCs0Z0lSZmVNTEFDZGVOZmJhTyt5?=
 =?utf-8?B?Qk5zMW5xTU9kR0NtVFdjOUdva1FBbElmRllxV0lFSGpWSDl0aDJvOEFPSkpt?=
 =?utf-8?B?WE9BWjIvRjh4S1dYUkF5K1NZb0wxWGVtR0tBbU5SckZxK0hYNHNib0R5eGJN?=
 =?utf-8?B?OEc1VFh1OFdZbWZjTEFHazhzUU50MmdtaWFqVDlkS0lQSmFOQ2lFZytucnIv?=
 =?utf-8?B?ZDZGbUx0dk5lY3NpcmUyaVFvVHptRDF2eTUxTjY2VjZ1SDJ5Q0EzVTgxenl1?=
 =?utf-8?Q?ShB96/jQRqBHDilwqvU86Yk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c5f90f-b485-4dfa-1ec0-08d9e497f530
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 08:59:15.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iG6aR6c2WFmGFfd7XX2c95Cnn/2P4CHdkQqD8GMod5W0+Wo1x/QHpu52DBfydKEw0VWDB9skWUN2pM0hIt0+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2989

On 28.01.2022 16:52, Anthony PERARD wrote:
> On Fri, Jan 28, 2022 at 01:43:38PM +0100, Jan Beulich wrote:
>> On 28.01.2022 13:03, Anthony PERARD wrote:
>>> On Thu, Jan 27, 2022 at 04:57:20PM +0100, Jan Beulich wrote:
>>>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>>>> clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
>>>>> only the filename rather than the full path to the source file.
>>>>>
>>>>> clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
>>>>> (in our debian:jessie container) do store the full path to the source
>>>>> file in the FILE symbol.
>>>>>
>>>>> Also, based on commit 81ecb38b83 ("build: provide option to
>>>>> disambiguate symbol names"), which were using clang 5, the change of
>>>>> behavior likely happened in clang 6.0.
>>>>>
>>>>> This means that we also need to check clang version to figure out
>>>>> which command we need to use to redefine symbol.
>>>>>
>>>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>>>
>>>> The "likely" in the description still worries me some. Roger, would
>>>> you happen to know, or know of a way to find out for sure ("sure"
>>>> not meaning to exclude the usual risk associated with version
>>>> number checks)?
>>>
>>> I found f5040b9685a7 ("Make .file directive to have basename only") as
>>> part of LLVM's "release/6.x" branch (and "llvmorg-6.0.0" tag), but not
>>> in "release/5.x".
>>>
>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fcommit%2Ff5040b9685a760e584c576e9185295e54635d51e&amp;data=04%7C01%7Canthony.perard%40citrix.com%7C1ce7898a15bb4024260008d9e25be6f9%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637789706644173026%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V73NmkJWAHpqlzY9sAysf6%2Fw7q8ik6twT6lMLgglR3s%3D&amp;reserved=0
>>>
>>> This patch would seems to be the one changing the behavior. This still
>>> suggest clang 6.0.
>>
>> Oh, thanks for digging this out. May I suggest to replace (or delete)
>> "likely" then in the description?
> 
> Maybe something like that? Or just delete the word might be enough.
> 
>     Also we have commit 81ecb38b83 ("build: provide option to
>     disambiguate symbol names") which were using clang 5, and LLVM's
>     commit f5040b9685a7 [1] ("Make .file directive to have basename
>     only") which is part of "llvmorg-6.0.0" tag but not "release/5.x"
>     branch. Both suggest that clang change of behavior happened with
>     clang 6.0.
> 
>     [1] https://github.com/llvm/llvm-project/commit/f5040b9685a760e584c576e9185295e54635d51e

This sounds better to me than just dropping the one word.

Jan


